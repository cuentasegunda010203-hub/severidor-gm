// Port de RB.pwn / necessary/robbery.pwn. Datos y mapa originales en *_datos.p.
// Integracion GZRP: dinero, Moneda, armas, mascara, cargos y C4 compartido.
#define RB_MARKET_DIALOG (31220)
#define RB_COCAINE_DIALOG (31221)
#define RB_HELP_DIALOG (31222)
new RB_Vehicle = INVALID_VEHICLE_ID, RB_NPC = INVALID_PLAYER_ID;
new RB_Route, RB_Phase, RB_Deadline, RB_Started, RB_LastSchedule = -1;
new RB_WalkStep;
new RB_HelpPage[MAX_PLAYERS];
new PlayerText:RB_C4HUD[MAX_PLAYERS][3], bool:RB_C4HUDCreated[MAX_PLAYERS];
new RB_C4HUDMode[MAX_PLAYERS], RB_C4HUDBomb[MAX_PLAYERS], RB_C4HUDUntil[MAX_PLAYERS];
// Puerta del banco, salida a la acera y aproximacion al conductor (SF, LV, LS).
new const Float:RB_BankWalk[3][3][3] = {
    {{-1581.3199,867.0190,7.7953},{-1581.3199,861.0000,7.7953},{-1585.5000,859.5000,7.6145}},
    {{2449.4690,2290.2200,10.8203},{2440.0000,2290.2200,10.8203},{2433.0000,2286.5000,10.8203}},
    {{1457.1293,-1009.9208,26.8438},{1457.1293,-1020.0000,23.9000},{1451.5000,-1027.5000,23.7806}}
};
new RB_Planted, RB_Exploded, RB_Reserved, RB_ExplodeAt, RB_Bags, RB_Alert, RB_Threat;
new RB_Planter[2] = {INVALID_PLAYER_ID, ...}, RB_Band[2], RB_PlantAccount[2], bool:RB_SlotDone[2];
new RB_Bomb[2], RB_TruckBag[10], Text3D:RB_Label, Text3D:RB_NPCLabel;
new RB_State[MAX_PLAYERS], RB_Car[MAX_PLAYERS], RB_MoneyBag[MAX_PLAYERS];
new RB_Progress[MAX_PLAYERS], RB_NextProgress[MAX_PLAYERS], RB_Until[MAX_PLAYERS];
new RB_BagSlot[MAX_PLAYERS] = {-1, ...}, RB_PreFreeze[MAX_PLAYERS];
new RB_CargoRaised[MAX_PLAYERS], RB_PreviousCargo[MAX_PLAYERS], RB_Session[MAX_PLAYERS];
new bool:RB_OwnCP[MAX_PLAYERS];
new RB_CarBags[MAX_VEHICLES], RB_CarMoney[MAX_VEHICLES], RB_CarPoint[MAX_VEHICLES], RB_CarUntil[MAX_VEHICLES];
new RB_CarObjects[MAX_VEHICLES][10];
new RB_Cocaine[MAX_PLAYERS], RB_CocaineAccount[MAX_PLAYERS], RB_CocaineUntil[MAX_PLAYERS];
new bool:RB_Ready, bool:RB_ItemsReady;
#include "modulos/blindado_rb_datos.p"
forward RB_Tick();
stock RB_HudClear(p,bool:destroy=false) {
    RB_C4HUDMode[p]=0; RB_C4HUDBomb[p]=0; RB_C4HUDUntil[p]=0;
    if(RB_C4HUDCreated[p]) for(new i;i<3;i++) {
        PlayerTextDrawHide(p,RB_C4HUD[p][i]);
        if(destroy) PlayerTextDrawDestroy(p,RB_C4HUD[p][i]);
    }
    if(destroy) RB_C4HUDCreated[p]=false;
    return 1;
}
stock RB_HudCreate(p) {
    if(RB_C4HUDCreated[p]) return 1;
    RB_C4HUD[p][0]=CreatePlayerTextDraw(p,320.0,290.0,"COLOCANDO C4");
    RB_C4HUD[p][1]=CreatePlayerTextDraw(p,320.0,311.0,"0 / 10");
    RB_C4HUD[p][2]=CreatePlayerTextDraw(p,320.0,344.0,"PULSA Y PARA AVANZAR");
    for(new i;i<3;i++) if(RB_C4HUD[p][i]==PlayerText:INVALID_TEXT_DRAW) {
        for(new j;j<3;j++) if(RB_C4HUD[p][j]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(p,RB_C4HUD[p][j]);
        return 0;
    }
    for(new i;i<3;i++) {
        PlayerTextDrawAlignment(p,RB_C4HUD[p][i],2);
        PlayerTextDrawFont(p,RB_C4HUD[p][i],1);
        PlayerTextDrawLetterSize(p,RB_C4HUD[p][i],i==1 ? 0.58 : 0.25,i==1 ? 2.3 : 1.1);
        PlayerTextDrawColor(p,RB_C4HUD[p][i],i==1 ? 0xFFCA55FF : 0xFFFFFFFF);
        PlayerTextDrawSetOutline(p,RB_C4HUD[p][i],1);
        PlayerTextDrawSetShadow(p,RB_C4HUD[p][i],0);
        PlayerTextDrawSetProportional(p,RB_C4HUD[p][i],1);
        PlayerTextDrawBackgroundColor(p,RB_C4HUD[p][i],0x000000FF);
    }
    PlayerTextDrawUseBox(p,RB_C4HUD[p][0],1);
    PlayerTextDrawBoxColor(p,RB_C4HUD[p][0],0x101820CC);
    PlayerTextDrawTextSize(p,RB_C4HUD[p][0],0.0,330.0);
    RB_C4HUDCreated[p]=true;
    return 1;
}
stock RB_HudPlant(p) {
    if(!RB_HudCreate(p)) {
        new fallback[80]; format(fallback,sizeof fallback,"Colocacion C4: %d/10. Usa Y o /blindadorobo avanzar.",RB_Progress[p]-1);
        return RB_Message(p,fallback);
    }
    RB_C4HUDMode[p]=1;
    new text[32]; format(text,sizeof text,"%d / 10",RB_Progress[p]-1);
    PlayerTextDrawSetString(p,RB_C4HUD[p][0],"~y~COLOCANDO BOMBA C4");
    PlayerTextDrawSetString(p,RB_C4HUD[p][1],text);
    PlayerTextDrawSetString(p,RB_C4HUD[p][2],PLAYER_TEMP[p][IsAndroid] ? "~w~/blindadorobo avanzar~n~Un paso por segundo" : "~w~Pulsa ~y~Y~w~ para avanzar~n~o /blindadorobo avanzar");
    for(new i;i<3;i++) PlayerTextDrawShow(p,RB_C4HUD[p][i]);
    return 1;
}
stock RB_HudCountdown(p) {
    if(RB_C4HUDMode[p]!=2) return 0;
    if(!RB_HudCreate(p)) return RB_HudClear(p);
    if(RB_Phase!=3) return RB_HudClear(p);
    if(!RB_Bomb[RB_C4HUDBomb[p]-1]) {
        RB_C4HUDMode[p]=3; RB_C4HUDUntil[p]=gettime()+2;
        PlayerTextDrawSetString(p,RB_C4HUD[p][0],"~r~C4 DETONADO");
        PlayerTextDrawSetString(p,RB_C4HUD[p][1],"10 / 10");
        PlayerTextDrawSetString(p,RB_C4HUD[p][2],RB_Exploded==2 ? "~w~Puertas abiertas: /robar bolsas" : "~w~Falta detonar la segunda bomba");
    } else {
        new seconds=RB_ExplodeAt-gettime();
        new next=RB_Exploded;
        if(!RB_Bomb[next]) next=1-next;
        if(RB_C4HUDBomb[p]-1!=next) seconds++;
        if(seconds<0) seconds=0;
        new text[64]; format(text,sizeof text,"~r~%d segundos",seconds);
        PlayerTextDrawSetString(p,RB_C4HUD[p][0],"~y~10 / 10 - C4 COLOCADO");
        PlayerTextDrawSetString(p,RB_C4HUD[p][1],text);
        PlayerTextDrawSetString(p,RB_C4HUD[p][2],"~w~Alejate! La bomba va a explotar");
    }
    for(new i;i<3;i++) PlayerTextDrawShow(p,RB_C4HUD[p][i]);
    return 1;
}
stock RB_AttachNPCName(bool:driving=false) {
    if(RB_NPC==INVALID_PLAYER_ID || !FCNPC_IsValid(RB_NPC)) return 0;
    if(IsValidDynamic3DTextLabel(RB_NPCLabel)) DestroyDynamic3DTextLabel(RB_NPCLabel);
    if(driving) {
        new Float:x,Float:y,Float:z;
        GetVehicleModelInfo(GetVehicleModel(RB_Vehicle),VEHICLE_MODEL_INFO_FRONTSEAT,x,y,z);
        // Asiento izquierdo y altura sobre la cabeza del conductor sentado.
        // El cliente mueve y gira la etiqueta con el camion, sin redibujar por timer.
        RB_NPCLabel=CreateDynamic3DTextLabel("Armando",0xDBED16FF,-floatabs(x),y,z+0.65,25.0,INVALID_PLAYER_ID,RB_Vehicle,0,0,0);
    } else {
        RB_NPCLabel=CreateDynamic3DTextLabel("Armando",0xDBED16FF,0.0,0.0,-0.4,25.0,RB_NPC,INVALID_VEHICLE_ID,0,0,0);
    }
    return 1;
}
public OnPlayerStreamIn(playerid,forplayerid) {
    if(playerid==RB_NPC) ShowPlayerNameTagForPlayer(forplayerid,playerid,false);
    return 1;
}
stock RB_Nearby(const text[],color=0xC2A2DAFF,Float:range=25.0) {
    if(RB_NPC==INVALID_PLAYER_ID || !IsPlayerConnected(RB_NPC)) return 0;
    new Float:x,Float:y,Float:z; GetPlayerPos(RB_NPC,x,y,z);
    foreach(new p:Player) if(!IsPlayerNPC(p) && GetPlayerVirtualWorld(p)==0 && GetPlayerInterior(p)==0 && IsPlayerInRangeOfPoint(p,range,x,y,z)) SendClientMessage(p,color,text);
    return 1;
}
stock RB_Say(const speech[],bool:radio=false) {
    if(RB_NPC==INVALID_PLAYER_ID || !IsPlayerConnected(RB_NPC)) return 0;
    new text[200]; format(text,sizeof text,radio ? "[Radio de policia] Armando dice: %s" : "Armando grita: %s",speech);
    RB_Nearby(text,0xFFFFFFFF,30.0);
    SetPlayerChatBubble(RB_NPC,speech,0xFFFFFFFF,30.0,15000);
    if(radio) RB_Radio(text);
    return 1;
}

stock RB_Live(p) {
    if(p<0 || p>=MAX_PLAYERS || !IsPlayerConnected(p) || IsPlayerNPC(p)) return 0;
    new Float:hp; GetPlayerHealth(p,hp);
    return JugadorLogeado[p] && PLAYER_INFO[p][pID]>0 && hp>0.0 && !PLAYER_TEMP[p][VariableCaido]
        && !Muriendo[p] && !PLAYER_INFO[p][pTiempoCarcel] && !PLAYER_INFO[p][pTiempoJail];
}
stock RB_OnFoot(p) { return RB_Live(p) && GetPlayerState(p)==PLAYER_STATE_ONFOOT && GetPlayerInterior(p)==0 && GetPlayerVirtualWorld(p)==0; }
stock RB_NearMarket(p) { return GetPlayerInterior(p)==0 && GetPlayerVirtualWorld(p)==0 && IsPlayerInRangeOfPoint(p,2.5,2445.1499,-1900.0063,13.5469); }
stock RB_Disguise(p) {
    if(PLAYER_INFO[p][pMascaraPuesta]) return 1;
    for(new s;s<MAX_PLAYER_TOYS;s++) if(PLAYER_TOYS[p][s][pt_ID] && PLAYER_TOYS[p][s][pt_ATTACHED] && PLAYER_TOYS[p][s][pt_MODEL_ID]==19801) return 1;
    return 0;
}
stock RB_Message(p,const text[]) { SendClientMessage(p,-1,text); return 1; }
stock RB_IsVehicle(v) { return v==RB_Vehicle; }
stock RB_Rear(p,v,Float:radius=2.5) {
    if(!RB_OnFoot(p) || !IsValidVehicle(v) || GetVehicleVirtualWorld(v)!=0) return 0;
    new Float:x,Float:y,Float:z; GetPosBehindVehicle(v,x,y,z);
    return IsPlayerInRangeOfPoint(p,radius,x,y,z);
}
stock RB_GetCar(p) {
    for(new v=1;v<=GetVehiclePoolSize();v++) if(IsValidVehicle(v) && RB_Rear(p,v)) {
        switch(GetVehicleModel(v)) { case 605,543,554,482,459,440,422,413: return v; }
    }
    return INVALID_VEHICLE_ID;
}
stock RB_Wanted(p,level) {
    if(!RB_CargoRaised[p]) RB_PreviousCargo[p]=PLAYER_INFO[p][pCargos];
    if(PLAYER_INFO[p][pCargos]<level) {
        RB_CargoRaised[p]=level;
        PLAYER_INFO[p][pCargos]=level; format(PLAYER_INFO[p][QuienC],64,"Armando");
        SetPlayerWantedLevelEx(p,level); ReportCrimen(p,level);
    }
}
stock RB_ClearWanted(p) {
    // No elimina cargos ajenos agregados durante el robo.
    if(RB_CargoRaised[p] && PLAYER_INFO[p][pCargos]==RB_CargoRaised[p] && !strcmp(PLAYER_INFO[p][QuienC],"Armando")) {
        PLAYER_INFO[p][pCargos]=RB_PreviousCargo[p]; SetPlayerWantedLevelEx(p,PLAYER_INFO[p][pCargos]);
        ReportCrimen(p,PLAYER_INFO[p][pCargos]); format(PLAYER_INFO[p][QuienC],64,"Nadie");
    }
    RB_CargoRaised[p]=0; return 1;
}
stock RB_ClearCP(p) { if(RB_OwnCP[p]) { DisablePlayerCheckpoint(p); RB_OwnCP[p]=false; } return 1; }
stock RB_ClearBag(p) {
    if(RB_MoneyBag[p]) { if(RB_BagSlot[p]>=0) RemovePlayerAttachedObject(p,RB_BagSlot[p]); SetPlayerSpecialAction(p,SPECIAL_ACTION_NONE); }
    RB_BagSlot[p]=-1; RB_MoneyBag[p]=0; return 1;
}
stock RB_CancelPlant(p) {
    if(RB_Progress[p]) {
        for(new s;s<2;s++) if(RB_Planter[s]==p) { RB_Planter[s]=INVALID_PLAYER_ID; RB_Reserved--; }
        RB_Progress[p]=0; TogglePlayerControllable(p,true); ClearAnimations(p); SetPVarInt(p,"IsFrozen",RB_PreFreeze[p]);
        RB_HudClear(p);
    }
    return 1;
}
stock RB_ResetPlayer(p,bool:disconnect=false) {
    RB_HudClear(p,disconnect);
    RB_CancelPlant(p); RB_ClearBag(p); RB_ClearCP(p);
    RB_State[p]=0; RB_Car[p]=INVALID_VEHICLE_ID; RB_Until[p]=0;
    // Si se desconecta el ultimo integrante, se pierde el botin de ese vehiculo.
    for(new v=1;v<MAX_VEHICLES;v++) if(RB_CarBags[v]) {
        new members; for(new i;i<MAX_PLAYERS;i++) if(RB_State[i] && RB_Car[i]==v) members++;
        if(!members) RB_ClearCar(v);
    }
    if(disconnect) { RB_CargoRaised[p]=0; RB_CocaineAccount[p]=0; RB_Cocaine[p]=0; }
    return 1;
}
stock RB_ClearCar(v) {
    if(v<=0 || v>=MAX_VEHICLES) return 0;
    for(new s;s<10;s++) { if(IsValidDynamicObject(RB_CarObjects[v][s])) DestroyDynamicObject(RB_CarObjects[v][s]); RB_CarObjects[v][s]=0; }
    RB_CarBags[v]=0; RB_CarMoney[v]=0; RB_CarUntil[v]=0; RB_CarPoint[v]=0; return 1;
}
stock RB_LoseCar(v) {
    if(v<=0 || v>=MAX_VEHICLES || !RB_CarBags[v]) return 0;
    for(new p;p<MAX_PLAYERS;p++) if(RB_State[p] && RB_Car[p]==v) {
        RB_ClearCP(p); RB_Car[p]=INVALID_VEHICLE_ID; RB_State[p]=4; RB_Until[p]=gettime()+480;
        RB_Message(p,"La camioneta con el botin se destruyo. Escapa durante 8 minutos para perder los cargos del robo.");
    }
    return RB_ClearCar(v);
}
stock RB_SetTruckLabel(const text[]) {
    if(IsValidDynamic3DTextLabel(RB_Label)) DestroyDynamic3DTextLabel(RB_Label);
    new Float:x,Float:y,Float:z; GetPosBehindVehicle(RB_Vehicle,x,y,z);
    RB_Label=CreateDynamic3DTextLabel(text,-1,x,y,z,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,0,0); return 1;
}
stock RB_Radio(const text[]) { SendRadioMessagePatrulla(1,0x3399FFFF,text); return 1; }
stock RB_TruckParams(motor, bool:open=false) {
    new e,l,a,d,b,t,o; GetVehicleParamsEx(RB_Vehicle,e,l,a,d,b,t,o);
    SetVehicleParamsEx(RB_Vehicle,motor,1,open,1,b,open,o); MotorAuto[RB_Vehicle]=motor;
    return 1;
}
stock RB_StopTruck(bool:abort=false) {
    RB_Phase=0;
    for(new p;p<MAX_PLAYERS;p++) if(RB_C4HUDMode[p]) RB_HudClear(p);
    new npc=RB_NPC; RB_NPC=INVALID_PLAYER_ID;
    if(npc!=INVALID_PLAYER_ID && FCNPC_IsValid(npc)) FCNPC_Destroy(npc);
    else if(npc!=INVALID_PLAYER_ID && IsPlayerConnected(npc) && IsPlayerNPC(npc)) Kick(npc);
    RB_WalkStep=0;
    if(IsValidDynamic3DTextLabel(RB_NPCLabel)) DestroyDynamic3DTextLabel(RB_NPCLabel);
    if(IsValidDynamic3DTextLabel(RB_Label)) DestroyDynamic3DTextLabel(RB_Label);
    for(new s;s<2;s++) {
        if(RB_Planter[s]!=INVALID_PLAYER_ID) RB_CancelPlant(RB_Planter[s]);
        if(IsValidDynamicObject(RB_Bomb[s])) DestroyDynamicObject(RB_Bomb[s]);
        RB_Bomb[s]=0; RB_Planter[s]=INVALID_PLAYER_ID; RB_Band[s]=0; RB_PlantAccount[s]=0; RB_SlotDone[s]=false;
    }
    for(new s;s<10;s++) { if(IsValidDynamicObject(RB_TruckBag[s])) DestroyDynamicObject(RB_TruckBag[s]); RB_TruckBag[s]=0; }
    if(abort) for(new p;p<MAX_PLAYERS;p++) if(RB_State[p] || RB_CargoRaised[p]) {
        RB_ClearWanted(p); RB_ResetPlayer(p); RB_Message(p,"El evento de robo al blindado ha sido cancelado.");
    }
    RB_Bags=0; RB_Planted=0; RB_Exploded=0; RB_Reserved=0; RB_ExplodeAt=0; RB_Alert=0; RB_Threat=0;
    if(IsValidVehicle(RB_Vehicle)) {
        SetVehicleHealth(RB_Vehicle,1000.0); SetVehicleVirtualWorld(RB_Vehicle,99);
        SetVehicleParamsCarDoors(RB_Vehicle,0,0,0,0); RB_TruckParams(0);
    }
    RB_Route=(RB_Route+1)%3; return 1;
}
stock RB_StartTruck() {
    if(!RB_Ready || !IsValidVehicle(RB_Vehicle) || RB_Phase) return 0;
    // Evita superponer otra ruta mientras aun se reparte el botin anterior.
    for(new p;p<MAX_PLAYERS;p++) if(RB_State[p]) return 0;
    SetVehiclePos(RB_Vehicle,PosBlindado[RB_Route][0],PosBlindado[RB_Route][1],PosBlindado[RB_Route][2]);
    SetVehicleZAngle(RB_Vehicle,PosBlindado[RB_Route][3]); SetVehicleVirtualWorld(RB_Vehicle,0);
    SetVehicleHealth(RB_Vehicle,1000.0); RB_TruckParams(0);
    // FCNPC controla tanto la caminata como la entrada y la grabacion del conductor.
    // No usar PutPlayerInVehicle durante OnPlayerSpawn del NPC nativo.
    RB_Phase=6; RB_Started=gettime(); RB_WalkStep=1;
    RB_NPC=FCNPC_Create("Armando");
    if(RB_NPC==INVALID_PLAYER_ID || !FCNPC_IsValid(RB_NPC)) {
        printf("[Blindado RB] No se pudo crear Armando con FCNPC."); RB_StopTruck(true); return 0;
    }
    FCNPC_SetVirtualWorld(RB_NPC,0); FCNPC_SetInterior(RB_NPC,0);
    if(!FCNPC_Spawn(RB_NPC,71,RB_BankWalk[RB_Route][0][0],RB_BankWalk[RB_Route][0][1],RB_BankWalk[RB_Route][0][2])) {
        printf("[Blindado RB] No se pudo aparecer al conductor."); RB_StopTruck(true); return 0;
    }
    // Alpha 0 oculta exclusivamente el punto del conductor en el radar.
    SetPlayerColor(RB_NPC,0xFFFFFF00);
    foreach(new viewer:Player) ShowPlayerNameTagForPlayer(viewer,RB_NPC,false);
    RB_AttachNPCName();
    if(!RB_WalkToTruck()) { RB_StopTruck(true); return 0; }
    switch(RB_Route) {
        case 0: SendClientMessageToAll(0xFFC282FF,"[INFORME CNN] El camion blindado sale de SF con destino a LV.");
        case 1: SendClientMessageToAll(0xFFC282FF,"[INFORME CNN] El camion blindado sale de LV con destino a LS.");
        case 2: SendClientMessageToAll(0xFFC282FF,"[INFORME CNN] El camion blindado sale de LS con destino a SF.");
    }
    RB_Radio("[Central] El guardia Armando inicia el recorrido con el blindado lleno de dinero."); return 1;
}
stock RB_NPCSpawn(p) {
    if(!IsPlayerNPC(p)) return 0;
    new name[MAX_PLAYER_NAME]; GetPlayerName(p,name,sizeof name);
    if(strcmp(name,"Armando")) return 0;
    if(!RB_Phase || p!=RB_NPC || !FCNPC_IsValid(p)) Kick(p);
    return 1;
}
stock RB_WalkToTruck() {
    return FCNPC_GoTo(RB_NPC,RB_BankWalk[RB_Route][RB_WalkStep][0],RB_BankWalk[RB_Route][RB_WalkStep][1],RB_BankWalk[RB_Route][RB_WalkStep][2],
        FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,FCNPC_MOVE_MODE_NONE,FCNPC_MOVE_PATHFINDING_NONE,0.0,true,0.3);
}
public FCNPC_OnReachDestination(npcid) {
    if(npcid!=RB_NPC || RB_Phase!=6) return 1;
    if(RB_WalkStep<2) { RB_WalkStep++; if(!RB_WalkToTruck()) RB_StopTruck(true); }
    else {
        RB_Phase=7;
        // Desbloquea la puerta solo para la animacion de entrada del guardia.
        new e,l,a,d,b,t,o; GetVehicleParamsEx(RB_Vehicle,e,l,a,d,b,t,o);
        SetVehicleParamsEx(RB_Vehicle,0,1,a,0,b,t,o);
        if(!FCNPC_EnterVehicle(npcid,RB_Vehicle,0,FCNPC_MOVE_TYPE_WALK)) {
            printf("[Blindado RB] Fallo la entrada al camion."); RB_StopTruck(true);
        }
    }
    return 1;
}
public FCNPC_OnVehicleEntryComplete(npcid,vehicleid,seatid) {
    if(npcid!=RB_NPC || RB_Phase!=7 || vehicleid!=RB_Vehicle || seatid!=0) return 1;
    RB_AttachNPCName(true);
    new recording[16]; format(recording,sizeof recording,"Armando%d",RB_Route+1);
    FCNPC_SetPlayingPlaybackPath(npcid,"npcmodes/recordings/");
    RB_Phase=1; RB_TruckParams(1);
    if(!FCNPC_StartPlayingPlayback(npcid,recording,FCNPC_INVALID_RECORD_ID,true)) {
        printf("[Blindado RB] No se pudo reproducir %s.rec.",recording); RB_StopTruck(true);
    } else {
        printf("[Blindado RB] Conductor sentado; ruta %s iniciada.",recording);
        new destinations[3][16]={"Las Venturas","Los Santos","San Fierro"},speech[140];
        format(speech,sizeof speech,"Central, estoy saliendo con el camion lleno de dinero hacia el banco de %s.",destinations[RB_Route]); RB_Say(speech,true);
    }
    return 1;
}
public FCNPC_OnFinishPlayback(npcid) {
    if(npcid!=RB_NPC || !RB_Phase || RB_Phase==5) return 1;
    if(RB_Phase==4) { RB_Phase=5; RB_Deadline=gettime()+10; RB_TruckParams(0); RB_Say("Central, logre llegar con exito al banco.",true); }
    else { printf("[Blindado RB] La grabacion termino antes de completar el robo."); RB_StopTruck(true); }
    return 1;
}
stock RB_Breakdown() {
    RB_Phase=2; RB_Deadline=gettime()+7; SetVehicleHealth(RB_Vehicle,340.0); RB_TruckParams(0);
    RB_Nearby("* El camion iba por la carretera cuando comenzo a salir humo del capo.");
    RB_Nearby("* El motor dejo de funcionar y Armando intenta encenderlo de nuevo.");
    new places[3][20]={"Canteras","Montgomery","Flint County"},speech[144];
    format(speech,sizeof speech,"Central, se descompuso el motor del camion. Me detuve cerca de %s; solicito un mecanico.",places[RB_Route]);
    RB_Say(speech,true); return 1;
}
stock RB_OpenRobbery() {
    RB_Phase=3; RB_Deadline=gettime()+297; SetVehicleHealth(RB_Vehicle,375.0);
    RB_SetTruckLabel("Para volar las puertas usa /detonar\nRequiere dos bombas C4 y mascara puesta");
    for(new s;s<10;s++) {
        RB_TruckBag[s]=CreateDynamicObject(1550,0.0,0.0,0.0,0.0,0.0,0.0,0);
        AttachDynamicObjectToVehicle(RB_TruckBag[s],RB_Vehicle,PosBolsoBlindado[s][0],PosBolsoBlindado[s][1],0.1955,0.0,0.0,0.0);
    }
    return 1;
}
stock RB_Escape(v) {
    if(v<=0 || v>=MAX_VEHICLES || !RB_CarBags[v]) return 0;
    if(!RB_CarUntil[v]) RB_CarUntil[v]=gettime()+600;
    for(new p;p<MAX_PLAYERS;p++) if(RB_State[p] && RB_Car[p]==v && !RB_MoneyBag[p]) {
        RB_State[p]=2; RB_Until[p]=RB_CarUntil[v]; RB_Message(p,"Escapa con el dinero durante 10 minutos. Despues se marcara el punto de reparto. /blindadorobo estado");
    }
    return 1;
}
stock RB_ResumeTruck() {
    for(new p;p<MAX_PLAYERS;p++) {
        if(RB_Progress[p]) { RB_CancelPlant(p); RB_Message(p,"La colocacion se interrumpio: el blindado retoma su recorrido."); }
        if(RB_MoneyBag[p]) RB_Message(p,"Guarda tu bolsa en la camioneta con /guardar bolsa para iniciar la huida.");
        if(RB_State[p]==5) { RB_State[p]=4; RB_Until[p]=gettime()+480; RB_Message(p,"No tomaste botin. Escapa 8 minutos para perder los cargos del robo."); }
    }
    for(new v=1;v<MAX_VEHICLES;v++) if(RB_CarBags[v]) RB_Escape(v);
    RB_Phase=4; SetVehicleHealth(RB_Vehicle,1000.0); RB_TruckParams(1);
    SetVehicleParamsCarDoors(RB_Vehicle,0,0,0,0);
    if(IsValidDynamic3DTextLabel(RB_Label)) DestroyDynamic3DTextLabel(RB_Label);
    RB_Nearby("* Tras varios intentos, una chispa llega al motor de arranque y el camion vuelve a encender.");
    RB_Say("Central, logre encender mi camion. No estoy herido; continuare mi recorrido al banco.",true); return 1;
}
stock RB_Plant(p) {
    if(!RB_OnFoot(p) || IsAPolice(p)) return RB_Message(p,"Debes estar a pie y en condiciones de robar el blindado.");
    if(RB_Phase!=3 || !RB_Rear(p,RB_Vehicle)) return RB_Message(p,"Acercate a las puertas traseras del blindado averiado.");
    if(RB_Bags || RB_Exploded==2) return RB_Message(p,"Las puertas ya estan abiertas. Usa /robar bolsas.");
    if(PLAYER_INFO[p][@Nivel]<5) return RB_Message(p,"Necesitas nivel 5 para colocar C4.");
    if(!RB_Disguise(p)) return RB_Message(p,"Necesitas un pasamontanas puesto o una mascara. Comprala en /mercado y usa /mascara.");
    if(RB_Progress[p]) return RB_Message(p,"Ya estas colocando una bomba. Usa /blindadorobo avanzar.");
    if(RB_State[p]>=1 && RB_State[p]<=4) return RB_Message(p,"Ya estas llevando dinero o escapando de este robo.");
    if(RB_Reserved+RB_Planted>=2) return RB_Message(p,"Ya hay dos bombas colocadas o en preparacion.");
    if(!C4_Load(p)) return RB_Message(p,"No se pudo cargar tu C4.");
    if(!cbomba[p]) return RB_Message(p,"Necesitas una bomba C4: /comprar c4 en el mercado negro.");
    for(new s;s<2;s++) if(RB_SlotDone[s] && RB_PlantAccount[s]==PLAYER_INFO[p][pID]) return RB_Message(p,"La segunda bomba debe colocarla otro integrante.");
    new slot; while(slot<2 && (RB_Planter[slot]!=INVALID_PLAYER_ID || RB_SlotDone[slot])) slot++;
    if(slot>=2) return 1;
    if(!C4_Change(p,false)) return 1;
    RB_Planter[slot]=p; RB_Reserved++;
    RB_Progress[p]=1; RB_NextProgress[p]=GetTickCount(); RB_Session[p]=PLAYER_INFO[p][pID]; RB_State[p]=5;
    RB_Wanted(p,3); AccionesRol(p,"esta plantando una bomba C4 en el camion blindado.",15);
    RB_Radio("[Central de policia] Robo en progreso al camion blindado. Armando solicita apoyo.");
    if(!RB_Threat) { RB_Threat=1; RB_Say("Que hacen idiotas! Llamare a la policia."); }
    RB_PreFreeze[p]=GetPVarInt(p,"IsFrozen"); TogglePlayerControllable(p,false); SetPVarInt(p,"IsFrozen",0);
    LoopingAnim(p,"BOMBER","BOM_Plant",4.0,1,1,1,1,-1);
    RB_HudPlant(p);
    return RB_Message(p,"Coloca el C4: usa /blindadorobo avanzar 10 veces (1 segundo entre pasos). En PC tambien puedes pulsar Y.");
}
stock RB_Advance(p) {
    if(!RB_Progress[p]) return RB_Message(p,"No estas colocando una bomba C4. Usa /detonar junto al blindado.");
    if(!RB_OnFoot(p) || RB_Phase!=3 || !RB_Rear(p,RB_Vehicle,3.5) || RB_Session[p]!=PLAYER_INFO[p][pID]) { RB_CancelPlant(p); return 1; }
    if(GetTickCount()-RB_NextProgress[p]<1000) return 1;
    RB_NextProgress[p]=GetTickCount(); RB_Progress[p]++;
    if(RB_Progress[p]<=10) return RB_HudPlant(p);
    new slot; for(slot=0;slot<2;slot++) if(RB_Planter[slot]==p) break;
    if(slot>=2) { RB_CancelPlant(p); return 1; }
    RB_CancelPlant(p); RB_Planted++; RB_Band[slot]=PLAYER_INFO[p][pFaccion]; RB_SlotDone[slot]=true; RB_PlantAccount[slot]=PLAYER_INFO[p][pID];
    RB_Bomb[slot]=CreateDynamicObject(1252,0.0,0.0,0.0,0.0,0.0,0.0,0);
    AttachDynamicObjectToVehicle(RB_Bomb[slot],RB_Vehicle,slot==0 ? -0.3677 : 0.3710,-3.0295,0.3538,0.0,0.0,0.0);
    if(!RB_ExplodeAt) RB_ExplodeAt=gettime()+14;
    RB_C4HUDMode[p]=2; RB_C4HUDBomb[p]=slot+1; RB_HudCountdown(p);
    return RB_Message(p,"Plantaste el C4. Alejate del camion: la cuenta atras aparece en pantalla.");
}
stock RB_Explode() {
    RB_Nearby("* Escuchas una explosion en las puertas traseras del blindado.");
    if(RB_Phase!=3) { RB_ExplodeAt=0; return 0; }
    new Float:x,Float:y,Float:z; GetPosBehindVehicle(RB_Vehicle,x,y,z);
    new slot=RB_Exploded;
    // La segunda puede terminar antes que la primera: encuentra una bomba instalada.
    if(!RB_Bomb[slot]) slot=1-slot;
    if(!RB_Bomb[slot]) { RB_ExplodeAt=0; return 0; }
    CreateExplosion(x,y,z,12,6.0); DestroyDynamicObject(RB_Bomb[slot]); RB_Bomb[slot]=0;
    RB_Exploded++; SetVehicleParamsCarDoors(RB_Vehicle,0,0,1,RB_Exploded==2);
    RB_ExplodeAt=RB_Planted>RB_Exploded ? gettime()+1 : 0;
    if(RB_Exploded==2) {
        RB_Bags=10; RB_TruckParams(0,true); RB_SetTruckLabel("Para tomar una bolsa de dinero usa /robar bolsas\nGuardala en una camioneta: /guardar bolsa");
        RB_Radio("[Central] Las puertas del blindado han sido detonadas. Robo de bolsas en progreso.");
        if(RB_Band[0]>3 && RB_Band[0]<MAX_BANDAS && RB_Band[0]==RB_Band[1]) RB_RewardBand(RB_Band[0]);
    } else RB_SetTruckLabel("Falta una bomba C4 para abrir la otra puerta\n/detonar");
    return 1;
}
stock RB_TakeBag(p) {
    if(!RB_OnFoot(p) || IsAPolice(p) || !RB_Rear(p,RB_Vehicle)) return RB_Message(p,"Acercate a pie a las puertas traseras del blindado.");
    if(RB_Phase!=3 || RB_Exploded!=2) return RB_Message(p,"Primero deben detonar las dos bombas C4.");
    if(PLAYER_INFO[p][@Nivel]<4) return RB_Message(p,"Necesitas nivel 4 para robar una bolsa.");
    if(!RB_Disguise(p)) return RB_Message(p,"Necesitas tener puesta la mascara o el pasamontanas.");
    if(!RB_Bags) return RB_Message(p,"No quedan bolsas dentro del camion.");
    if(RB_MoneyBag[p] || RB_Progress[p] || (RB_State[p]>=2 && RB_State[p]<=4)) return RB_Message(p,"Guarda la bolsa que llevas o termina tu huida antes de tomar otra.");
    if(Objeto[p]) return RB_Message(p,"Libera tus manos antes de cargar la bolsa.");
    new slot=-1; for(new s;s<10;s++) if(s!=4 && !IsPlayerAttachedObjectSlotUsed(p,s)) { slot=s; break; }
    if(slot<0) return RB_Message(p,"Quita una prenda o accesorio para poder cargar la bolsa.");
    new const values[]={40000,42000,35000,30000,25000}; RB_MoneyBag[p]=values[random(sizeof values)];
    RB_State[p]=1; RB_Session[p]=PLAYER_INFO[p][pID]; RB_Bags--;
    if(IsValidDynamicObject(RB_TruckBag[RB_Bags])) DestroyDynamicObject(RB_TruckBag[RB_Bags]); RB_TruckBag[RB_Bags]=0;
    RB_BagSlot[p]=slot; SetPlayerAttachedObject(p,slot,1550,1,0.0,-0.257,-0.047,-3.5,104.2,171.6,1.0,1.0,1.0);
    SetPlayerSpecialAction(p,SPECIAL_ACTION_CARRY); RB_Wanted(p,5);
    AccionesRol(p,"toma una bolsa de dinero del camion y se la coloca en la espalda.",15);
    if(!RB_Alert) { RB_Say("Central, necesito apoyo! Me estan sacando bolsas de dinero del camion.",true); RB_Alert=1; }
    new text[160]; format(text,sizeof text,"Robaste una bolsa con $%s. Guardala con /guardar bolsa en una camioneta con baul abierto (o H).",ConvertirNumero(RB_MoneyBag[p]));
    return RB_Message(p,text);
}
stock RB_StoreBag(p) {
    if(!RB_MoneyBag[p] || !RB_OnFoot(p)) return RB_Message(p,"No llevas una bolsa del blindado o no estas a pie.");
    new v=RB_GetCar(p); if(v==INVALID_VEHICLE_ID) return RB_Message(p,"Acercate al baul de una Burrito, Yosemite, Bobcat, Sadler, Rumpo o Pony.");
    new e,l,a,d,b,t,o; GetVehicleParamsEx(v,e,l,a,d,b,t,o);
    if(t!=1) return RB_Message(p,"Abre el baul de la camioneta con /baul antes de guardar la bolsa.");
    if(RB_CarBags[v]>=10) return RB_Message(p,"Esta camioneta ya tiene diez bolsas.");
    if(RB_Car[p]!=INVALID_VEHICLE_ID && RB_Car[p]!=v) return RB_Message(p,"Debes guardar todas tus bolsas en la misma camioneta.");
    new slot=RB_CarBags[v]++; RB_CarMoney[v]+=RB_MoneyBag[p]; RB_Car[p]=v;
    if(!RB_CarPoint[v]) RB_CarPoint[v]=random(6)+1;
    RB_AttachCarBag(v,slot); RB_ClearBag(p); ClearAnimations(p);
    RB_Message(p,"Bolsa guardada. Puedes buscar otra mientras el camion siga averiado.");
    if(!RB_Bags || RB_Phase!=3) RB_Escape(v); return 1;
}
stock RB_MarkDelivery(p) {
    new v=RB_Car[p]; if(v<=0 || v>=MAX_VEHICLES || RB_CarPoint[v]<1 || RB_CarPoint[v]>6) return 0;
    new s=RB_CarPoint[v]-1; SetPlayerCheckpoint(p,PosPointRepartMoney[s][0],PosPointRepartMoney[s][1],PosPointRepartMoney[s][2],5.0);
    RB_OwnCP[p]=true; return 1;
}
stock RB_Deliver(p) {
    if(RB_State[p]!=3 || !RB_Live(p)) return 0;
    new v=RB_Car[p]; if(v<=0 || v>=MAX_VEHICLES || !RB_CarBags[v] || RB_CarPoint[v]<1 || RB_CarPoint[v]>6) return 0;
    new s=RB_CarPoint[v]-1;
    if(GetPlayerVirtualWorld(p)!=0 || GetPlayerInterior(p)!=0 || !IsPlayerInRangeOfPoint(p,5.0,PosPointRepartMoney[s][0],PosPointRepartMoney[s][1],PosPointRepartMoney[s][2])) return 0;
    if(GetPlayerState(p)!=PLAYER_STATE_DRIVER || GetPlayerVehicleID(p)!=v) return RB_Message(p,"Debes conducir la camioneta donde guardaste el dinero para repartirlo.");
    new members; for(new i;i<MAX_PLAYERS;i++) if(RB_State[i] && RB_Car[i]==v && RB_Live(i)) members++;
    if(!members) return 1;
    new amount=RB_CarMoney[v]/members, text[180];
    for(new i;i<MAX_PLAYERS;i++) if(RB_State[i] && RB_Car[i]==v && RB_Live(i)) {
        RB_ClearBag(i);
        if(GetPlayerVirtualWorld(i)==0 && GetPlayerInterior(i)==0 && IsPlayerInRangeOfPoint(i,80.0,PosPointRepartMoney[s][0],PosPointRepartMoney[s][1],PosPointRepartMoney[s][2])) {
            format(text,sizeof text,"Repartieron %d bolsas con $%s. Tu parte: $%s.",RB_CarBags[v],ConvertirNumero(RB_CarMoney[v]),ConvertirNumero(amount));
            DarDinero(i,amount); RB_Message(i,text); RB_ClearWanted(i); RB_State[i]=0; RB_Car[i]=INVALID_VEHICLE_ID; RB_ClearCP(i); GuardarCuenta(i);
        } else { RB_Message(i,"Repartieron el dinero del blindado y no estuviste presente."); RB_State[i]=4; RB_Car[i]=INVALID_VEHICLE_ID; RB_Until[i]=gettime()+60; RB_ClearCP(i); }
    }
    return RB_ClearCar(v);
}
stock RB_PoliceNearby(p) {
    new Float:x,Float:y,Float:z; GetPlayerPos(p,x,y,z);
    foreach(new i:Player) if(IsAPolice(i) && PLAYER_INFO[i][pDuty]==1 && GetPlayerVirtualWorld(i)==GetPlayerVirtualWorld(p) && GetPlayerInterior(i)==GetPlayerInterior(p) && IsPlayerInRangeOfPoint(i,80.0,x,y,z)) return 1;
    return 0;
}
public RB_Tick() {
    if(!RB_Ready) return 1;
    new h,m,s,now=gettime(h,m,s),period=now/3600;
    if(StatusBlindado && h%2==0 && m==1 && RB_LastSchedule!=period) { RB_LastSchedule=period; RB_StartTruck(); }
    if(RB_Phase && (now-RB_Started>1800 || (RB_NPC==INVALID_PLAYER_ID && now-RB_Started>30))) { printf("[Blindado RB] NPC no disponible o tiempo de ruta agotado."); RB_StopTruck(true); }
    if((RB_Phase==6 || RB_Phase==7) && now-RB_Started>60) { printf("[Blindado RB] El conductor no logro entrar al camion."); RB_StopTruck(true); }
    if(RB_Phase && RB_NPC!=INVALID_PLAYER_ID) {
        new const Float:stops[3][3]={{1062.0852,769.9995,10.8802},{1612.5514,177.5671,34.3414},{-476.0366,-844.7862,51.3549}};
        new const Float:ends[3][3]={{2466.9729,2335.5227,10.8203},{1455.8333,-1030.4407,23.7799},{-1587.2465,856.5475,7.4709}};
        if(RB_Phase==1 && IsPlayerInRangeOfPoint(RB_NPC,30.0,stops[RB_Route][0],stops[RB_Route][1],stops[RB_Route][2])) RB_Breakdown();
        else if(RB_Phase==2 && now>=RB_Deadline) RB_OpenRobbery();
        else if(RB_Phase==3 && now>=RB_Deadline) RB_ResumeTruck();
        else if(RB_Phase==4 && IsPlayerInRangeOfPoint(RB_NPC,35.0,ends[RB_Route][0],ends[RB_Route][1],ends[RB_Route][2])) { RB_Phase=5; RB_Deadline=now+10; RB_Say("Central, logre llegar con exito al banco.",true); }
        else if(RB_Phase==5 && now>=RB_Deadline) RB_StopTruck();
        if(RB_ExplodeAt && now>=RB_ExplodeAt) RB_Explode();
    }
    for(new p;p<MAX_PLAYERS;p++) {
        if(RB_C4HUDMode[p]==2) RB_HudCountdown(p);
        else if(RB_C4HUDMode[p]==3 && now>=RB_C4HUDUntil[p]) RB_HudClear(p);
        if(RB_Progress[p] && (!RB_OnFoot(p) || RB_Session[p]!=PLAYER_INFO[p][pID] || !RB_Rear(p,RB_Vehicle,3.5))) RB_CancelPlant(p);
        if(!RB_State[p]) continue;
        if(!RB_Live(p) || RB_Session[p]!=PLAYER_INFO[p][pID]) { RB_ResetPlayer(p); continue; }
        if(RB_Car[p]!=INVALID_VEHICLE_ID && !IsValidVehicle(RB_Car[p])) { RB_LoseCar(RB_Car[p]); continue; }
        if(RB_State[p]==2 && now>=RB_Until[p]) { RB_State[p]=3; RB_MarkDelivery(p); RB_Message(p,"Ve al punto marcado para repartir el dinero con tus companeros. /blindadorobo ruta"); }
        if(RB_State[p]==4 && now>=RB_Until[p]) {
            if(RB_PoliceNearby(p)) { RB_Until[p]=now+60; RB_Message(p,"Hay un policia cerca. Escapa para perder los cargos del robo."); }
            else { RB_ClearWanted(p); RB_ResetPlayer(p); RB_Message(p,"Lograste escapar de la policia."); GuardarCuenta(p); }
        }
    }
    return 1;
}
stock RB_LoadCocaine(p) {
    if(!RB_ItemsReady || !RB_Live(p)) return 0;
    new account=PLAYER_INFO[p][pID]; if(RB_CocaineAccount[p]==account) return 1;
    new query[128]; mysql_format(handle_db,query,sizeof query,"SELECT cantidad FROM rb_mercado_cocaina WHERE cuenta=%d",account);
    new Cache:c=mysql_query(handle_db,query,true),rows; if(mysql_errno(handle_db)) { cache_delete(c); return 0; }
    cache_get_row_count(rows); RB_Cocaine[p]=0; if(rows) cache_get_value_name_int(0,"cantidad",RB_Cocaine[p]); cache_delete(c);
    RB_CocaineAccount[p]=account; return 1;
}
stock RB_SaveCocaine(p) {
    new query[180]; mysql_format(handle_db,query,sizeof query,"INSERT INTO rb_mercado_cocaina (cuenta,cantidad) VALUES (%d,%d) ON DUPLICATE KEY UPDATE cantidad=VALUES(cantidad)",PLAYER_INFO[p][pID],RB_Cocaine[p]);
    // Confirmar el guardado antes de cobrar o consumir.
    mysql_query(handle_db,query,false); return !mysql_errno(handle_db);
}
stock RB_BandExperience(p) {
    if(!RB_Live(p) || PLAYER_INFO[p][pFaccion]<=3) return RB_Message(p,"Debes pertenecer a una banda para consultar esta experiencia.");
    new query[120]; mysql_format(handle_db,query,sizeof query,"SELECT experiencia FROM rb_blindado_bandas WHERE banda=%d",PLAYER_INFO[p][pFaccion]);
    new Cache:c=mysql_query(handle_db,query,true),rows,experience;
    if(mysql_errno(handle_db)) { cache_delete(c); return RB_Message(p,"No se pudo consultar la experiencia de banda."); }
    cache_get_row_count(rows); if(rows) cache_get_value_name_int(0,"experiencia",experience); cache_delete(c);
    new text[120]; format(text,sizeof text,"Tu banda acumula %d de experiencia en robos al blindado (+8 por detonacion de sus dos C4).",experience);
    return RB_Message(p,text);
}
stock RB_BuyC4(p) {
    if(!RB_OnFoot(p) || !RB_NearMarket(p) || EnCombate[p]) return RB_Message(p,"Acercate al mercado negro a pie y fuera de combate: /mercado gps.");
    if(!C4_Load(p)) return RB_Message(p,"No se pudo cargar tu C4.");
    if(cbomba[p]) return RB_Message(p,"Ya tienes una bomba C4 en el inventario.");
    if(PLAYER_INFO[p][jDinero]<10000) return RB_Message(p,"Necesitas $10.000 para comprar una bomba C4.");
    if(!C4_Change(p,true)) return 1;
    QuitarDinero(p,10000); GuardarCuenta(p);
    return RB_Message(p,"Compraste un C4 por $10.000. /detonar para el blindado o /robar cajero. El C4 queda guardado en tu cuenta.");
}
stock RB_BuySpray(p) {
    if(!RB_OnFoot(p) || !RB_NearMarket(p) || EnCombate[p]) return RB_Message(p,"Acercate al mercado negro a pie y fuera de combate: /mercado gps.");
    if(PLAYER_INFO[p][j_ARMAS][GetWeaponSlot(41)]==41) return RB_Message(p,"Ya tienes spray. Equipalo para pintar con /grafitis pintar.");
    if(!RB_CanWeapon(p,41)) return 1;
    if(PLAYER_INFO[p][jDinero]<25000) return RB_Message(p,"Necesitas $25.000 para comprar spray.");
    DarArma(p,41); QuitarDinero(p,25000); GuardarCuenta(p);
    return RB_Message(p,"Compraste spray por $25.000. Equipalo y usa /grafitis pintar junto a un grafiti activo.");
}
stock RB_Market(p) {
    if(!RB_OnFoot(p) || !RB_NearMarket(p) || EnCombate[p]) return RB_Message(p,"Acercate al mercado negro a pie y fuera de combate. /mercado gps");
    return ShowPlayerDialog(p,RB_MARKET_DIALOG,DIALOG_STYLE_TABLIST_HEADERS,"Mercado Negro",
        "Item\tPrecio\nMascara\t150 "SERVER_COIN"\nEscopeta Recortada\t80 "SERVER_COIN"\nUzi\t80 "SERVER_COIN"\nTec-9\t80 "SERVER_COIN"\nMolotov\t100 "SERVER_COIN"\nMotosierra\t80 "SERVER_COIN"\nCuchillo\t$250.000\nGranada\t$180.000\nBomba C4\t$10.000\nCocaina\t$2.000 por gramo\nSpray\t$25.000","Comprar","Cancelar");
}
stock RB_MarketResponse(p,dialog,response,row,const input[]) {
    if(dialog!=RB_MARKET_DIALOG && dialog!=RB_COCAINE_DIALOG) return 0;
    if(!response) return 1;
    if(!RB_OnFoot(p) || !RB_NearMarket(p) || EnCombate[p]) return RB_Message(p,"Debes permanecer junto al vendedor para comprar.");
    if(dialog==RB_COCAINE_DIALOG) {
        if(!RB_LoadCocaine(p)) return RB_Message(p,"No se pudo cargar el inventario. Conservas tu dinero.");
        new len=strlen(input); if(!len || len>4) return RB_Message(p,"Introduce una cantidad entera entre 1 y 1000.");
        for(new k;k<len;k++) if(input[k]<'0' || input[k]>'9') return RB_Message(p,"Solo se permiten numeros enteros positivos.");
        new qty=strval(input); if(qty<1 || qty>1000 || RB_Cocaine[p]>100000-qty) return RB_Message(p,"Cantidad o capacidad no permitida.");
        new price=qty*2000; if(PLAYER_INFO[p][jDinero]<price) return RB_Message(p,"No tienes suficiente dinero.");
        RB_Cocaine[p]+=qty; if(!RB_SaveCocaine(p)) { RB_Cocaine[p]-=qty; return RB_Message(p,"No se pudo guardar la compra. Conservas tu dinero."); }
        QuitarDinero(p,price); GuardarCuenta(p); return RB_Message(p,"Compraste cocaina. /cocaina para ver tu inventario y /cocaina consumir para usarla.");
    }
    if(row<0 || row>10) return 1;
    if(row==10) return RB_BuySpray(p);
    if(row==8) return RB_BuyC4(p);
    if(row==9) return ShowPlayerDialog(p,RB_COCAINE_DIALOG,DIALOG_STYLE_INPUT,"Comprar cocaina","Cada gramo cuesta $2.000. Cantidad (1 a 1000):","Comprar","Cancelar");
    if(row==0 && PLAYER_INFO[p][pMascara]) return RB_Message(p,"Ya tienes una mascara. Usa /mascara para ponertela.");
    new const guns[]={0,26,28,32,18,9,4,16};
    new const prices[]={150,80,80,80,100,80,250000,180000};
    if(row<=5) {
        if(PLAYER_INFO[p][Moneda]<prices[row]) return RB_Message(p,"No tienes suficientes monedas del servidor.");
        if(row>0 && !RB_CanWeapon(p,guns[row])) return 1;
        PLAYER_INFO[p][Moneda]-=prices[row];
    } else {
        if(PLAYER_INFO[p][jDinero]<prices[row]) return RB_Message(p,"No tienes suficiente dinero.");
        if(!RB_CanWeapon(p,guns[row])) return 1;
        QuitarDinero(p,prices[row]);
    }
    if(row==0) { PLAYER_INFO[p][pMascara]=1; RB_Message(p,"Compraste una mascara por 150 monedas. Usa /mascara para ponertela."); }
    else { DarArma(p,guns[row]); RB_Message(p,"Compra realizada. El arma se agrego a tu inventario."); }
    GuardarCuenta(p); return 1;
}
CMD:detonar(p,params[]) { return RB_Plant(p); }
CMD:crobob(p,params[]) {
    if(PLAYER_INFO[p][pAdmin]<ADMIN_LEVEL_ADM) return 0;
    if(!RB_StartTruck()) return RB_Message(p,"Ya hay una ruta o un reparto pendiente, o el blindado no esta disponible.");
    return RB_Message(p,"Has iniciado el robo al blindado.");
}
CMD:trobob(p,params[]) {
    if(PLAYER_INFO[p][pAdmin]<ADMIN_LEVEL_ADM) return 0;
    RB_StopTruck(true); return RB_Message(p,"Has cancelado el robo y el botin pendiente.");
}
CMD:blindadorobo(p,params[]) {
    if(!strcmp(params,"banda",true)) return RB_BandExperience(p);
    if(!strcmp(params,"avanzar",true)) return RB_Advance(p);
    if(!strcmp(params,"guardar",true)) return RB_StoreBag(p);
    if(!strcmp(params,"bolsas",true)) return RB_TakeBag(p);
    if(!strcmp(params,"ruta",true)) { if(RB_State[p]!=3) return RB_Message(p,"El punto de reparto se muestra al terminar la huida."); return RB_MarkDelivery(p); }
    if(!strcmp(params,"repartir",true)) { if(!RB_Deliver(p)) RB_Message(p,"Conduce tu camioneta al punto de reparto despues de la huida."); return 1; }
    if(!strcmp(params,"estado",true)) {
        new text[180]; format(text,sizeof text,"Blindado: ruta %d, etapa %d, bolsas %d. Tu etapa: %d. Huida restante: %d segundos.",RB_Route+1,RB_Phase,RB_Bags,RB_State[p],RB_Until[p]>gettime() ? RB_Until[p]-gettime() : 0);
        return RB_Message(p,text);
    }
    return RB_Help(p);
}
stock RB_Help(p,page=0) {
    if(page<0 || page>2) page=0;
    RB_HelpPage[p]=page;
    new text[2200],title[64];
    format(title,sizeof title,"Ayuda: Robo al blindado (%d/3)",page+1);
    switch(page) {
        case 0: {
            strcat(text,"{0080FF}Robo al camion blindado{FFFFFF}\nRobale las bolsas de dinero al camion del banco.\n\n",sizeof text);
            strcat(text,"{FF4444}Recorridos{FFFFFF}\n1. Banco de San Fierro -> Banco de Las Venturas.\n2. Banco de Las Venturas -> Banco de Los Santos.\n3. Banco de Los Santos -> Banco de San Fierro.\n\n",sizeof text);
            strcat(text,"Armando sale del banco, camina y sube como conductor.\nLas salidas son automaticas: horas pares, minuto 01.\nCNN anuncia el comienzo del recorrido.\nCuando se averia, tienes unos 5 minutos para robar.\n\n",sizeof text);
            strcat(text,"{FF4444}Requisitos{FFFFFF}\nNivel 5 para /detonar; nivel 4 para /robar bolsas.\nLleva mascara puesta (/mascara) o pasamontanas.\nDos personas deben colocar una bomba C4 cada una.\nUna sola bomba no abre las dos puertas.",sizeof text);
        }
        case 1: {
            strcat(text,"{0080FF}Preparacion y robo{FFFFFF}\n1. /mercado gps marca el Mercado Negro.\nCompra C4 por $10.000 con /comprar c4.\nCompra una mascara en /mercado y usa /mascara.\n\n",sizeof text);
            strcat(text,"2. Cada persona usa /detonar detras del blindado.\nCompleta /blindadorobo avanzar 10 veces:\nun paso por segundo. En PC tambien puedes usar Y.\nTras las dos bombas, alejate y espera las explosiones.\n\n",sizeof text);
            strcat(text,"3. Usa /robar bolsas junto a las puertas abiertas.\nHay 10 bolsas con dinero aleatorio: $25.000 a $42.000.\nGuarda cada bolsa con /guardar bolsa junto al baul abierto.\nEn PC tambien puedes usar H. Luego busca otra bolsa.\n\n",sizeof text);
            strcat(text,"{FF4444}Camionetas compatibles{FFFFFF}\nSadler (normal y danada), Yosemite, Bobcat, Pony,\nRumpo, Berkley y Burrito. /abrir maletero abre el baul.",sizeof text);
        }
        case 2: {
            strcat(text,"{0080FF}Policia, huida y reparto{FFFFFF}\nColocar C4 agrega 3 cargos; recoger bolsas agrega 5.\nLa policia recibe el aviso del robo.\n\n",sizeof text);
            strcat(text,"Cuando ya no hay bolsas o termina la averia,\nescapa con la camioneta durante 10 minutos.\n/blindadorobo estado muestra el tiempo restante.\nAl terminar se marca uno de los puntos de reparto.\n/blindadorobo ruta vuelve a marcar ese punto.\n\n",sizeof text);
            strcat(text,"Conduce la misma camioneta al checkpoint de reparto\no usa /blindadorobo repartir estando alli.\nEl dinero se divide entre los integrantes de esa camioneta;\npara recibir su parte deben estar cerca del reparto.\n\n",sizeof text);
            strcat(text,"Si la misma banda coloca los dos C4, gana +8 experiencia.\nConsulta el total con /blindadorobo banda.\nMorir o desconectarte cancela tu participacion.\nSi se destruye la camioneta, se pierde el botin.\nLos comandos y estos dialogos funcionan en Android y PC.",sizeof text);
        }
    }
    return ShowPlayerDialog(p,RB_HELP_DIALOG,DIALOG_STYLE_MSGBOX,title,text,page==2 ? "Volver" : "Siguiente",page==1 ? "Atras" : "Cerrar");
}
CMD:mercado(p,params[]) {
    if(!strcmp(params,"spray",true)) return RB_BuySpray(p);
    if(!strcmp(params,"inventario",true)) { callcmd::cocaina(p,""); return RB_Message(p,cbomba[p] ? "Tienes una bomba C4." : "No tienes una bomba C4."); }
    if(!strcmp(params,"gps",true)) { SetPlayerCheckpoint(p,2445.1499,-1900.0063,13.5469,2.5); return RB_Message(p,"Mercado negro marcado en Los Santos. Usa /mercado junto al vendedor."); }
    return RB_Market(p);
}
CMD:cocaina(p,params[]) {
    if(!RB_LoadCocaine(p)) return RB_Message(p,"El inventario de cocaina no esta disponible.");
    if(!strcmp(params,"consumir",true)) {
        if(!RB_Live(p) || EnCombate[p]) return RB_Message(p,"Debes estar en condiciones de consumir y fuera de combate.");
        if(RB_Cocaine[p]<1) return RB_Message(p,"No tienes cocaina.");
        if(RB_CocaineUntil[p]>gettime()) return RB_Message(p,"Espera 60 segundos entre consumos de cocaina.");
        RB_Cocaine[p]--; if(!RB_SaveCocaine(p)) { RB_Cocaine[p]++; return RB_Message(p,"No se pudo guardar el consumo."); }
        new Float:hp,Float:armour,Float:extra;
        GetPlayerHealth(p,hp); GetPlayerArmour(p,armour);
        hp+=30.0; if(hp>100.0) { extra=hp-100.0; hp=100.0; }
        armour+=extra; if(armour>100.0) armour=100.0;
        EstablecerVida(p,hp); EstablecerChaleco(p,armour); RB_CocaineUntil[p]=gettime()+60;
        LoopingAnim(p,"FOOD","EAT_Burger",3.0,0,0,0,0,0);
        AccionesRol(p,"consume un gramo de cocaina.",15); return RB_Message(p,"Consumiste un gramo de cocaina. Espera 60 segundos antes de volver a consumir.");
    }
    new text[100]; format(text,sizeof text,"Tienes %d gramos de cocaina. /cocaina consumir",RB_Cocaine[p]); return RB_Message(p,text);
}
stock RB_Init() {
    if(RB_Ready) return 1;
    StatusBlindado=1; // Salidas automaticas habilitadas en cada inicio de la GM.
    RB_Vehicle=LZ_AddStaticVehicleEx(428,-1587.8663,857.0839,7.6145,270.6797,1,1,-1);
    if(RB_Vehicle==INVALID_VEHICLE_ID) { printf("[Blindado RB] No se pudo crear el camion."); return 0; }
    SetVehicleVirtualWorld(RB_Vehicle,99); SetVehicleNumberPlate(RB_Vehicle,"BANK SA"); bloqueado[RB_Vehicle]=1; RB_TruckParams(0);
    for(new p;p<MAX_PLAYERS;p++) RB_Car[p]=INVALID_VEHICLE_ID;
    mysql_query(handle_db,"CREATE TABLE IF NOT EXISTS rb_mercado_cocaina (cuenta INT NOT NULL PRIMARY KEY,cantidad INT NOT NULL DEFAULT 0)",false);
    RB_ItemsReady=!mysql_errno(handle_db); RB_LoadMarketMap();
    mysql_query(handle_db,"CREATE TABLE IF NOT EXISTS rb_blindado_bandas (banda INT NOT NULL PRIMARY KEY,experiencia INT NOT NULL DEFAULT 0)",false);
    CreateDynamic3DTextLabel("{00CA00}Mercado Negro\n{FFFFFF}/mercado o Y para comprar",-1,2445.1499,-1900.0063,13.5469,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,0,0);
    CreateDynamicMapIcon(2445.1499,-1900.0063,13.5469,23,0,0,0,-1,200.0);
    RB_Ready=true; SetTimer("RB_Tick",1000,true); return 1;
}
