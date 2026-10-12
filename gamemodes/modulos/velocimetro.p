// Compact digital speedometer: selected pack design 1. Native text boxes only.
#define RP_VELO_SLOTS (14)
new PlayerText:TDE_VELO[MAX_PLAYERS][RP_VELO_SLOTS];
new RP_VeloCount[MAX_PLAYERS];
new bool:RP_VeloCreated[MAX_PLAYERS], bool:PlayerVelocimetro[MAX_PLAYERS];
new bool:RP_VeloRendered[MAX_PLAYERS], bool:RP_VeloBelt[MAX_PLAYERS];
new PlayerVelocimetroTimer[MAX_PLAYERS], RP_VeloVehicle[MAX_PLAYERS];
stock RP_VeloBox(playerid,index,Float:x,Float:y,Float:w,Float:h,color) {
 new PlayerText:td=CreatePlayerTextDraw(playerid,x+2.0,y+2.0,"_");
 TDE_VELO[playerid][index]=td;if(td==PlayerText:INVALID_TEXT_DRAW) return 0;
 PlayerTextDrawFont(playerid,td,1);PlayerTextDrawLetterSize(playerid,td,0.0,(h-4.0)/9.0);
 PlayerTextDrawTextSize(playerid,td,x+w-2.0,0.0);PlayerTextDrawUseBox(playerid,td,true);
 PlayerTextDrawBoxColor(playerid,td,color);PlayerTextDrawColor(playerid,td,0xFFFFFF00);
 PlayerTextDrawSetOutline(playerid,td,0);PlayerTextDrawSetShadow(playerid,td,0);return 1;
}
stock RP_VeloText(playerid,index,Float:x,Float:y,const text[],Float:w,Float:h,align=1) {
 new PlayerText:td=CreatePlayerTextDraw(playerid,x,y,text);TDE_VELO[playerid][index]=td;
 if(td==PlayerText:INVALID_TEXT_DRAW) return 0;
 PlayerTextDrawFont(playerid,td,1);PlayerTextDrawLetterSize(playerid,td,w,h);PlayerTextDrawAlignment(playerid,td,align);
 PlayerTextDrawColor(playerid,td,0xF1F4F6FF);PlayerTextDrawSetOutline(playerid,td,0);PlayerTextDrawSetShadow(playerid,td,0);
 PlayerTextDrawSetProportional(playerid,td,true);PlayerTextDrawSetSelectable(playerid,td,false);return 1;
}
stock CrearVelocimetro(playerid) {
 DestroyPlayerVelocimetro(playerid);if(IsPlayerNPC(playerid)) return 0;
 for(new i;i<RP_VELO_SLOTS;i++) TDE_VELO[playerid][i]=PlayerText:INVALID_TEXT_DRAW;
 RP_VeloCreated[playerid]=true;RP_VeloCount[playerid]=RP_VELO_SLOTS;
 // About 231 x 113 pixels at 1920 x 1080, beside the status HUD.
 if(!RP_VeloBox(playerid,7,282.0,378.0,77.0,47.0,0x111820EE) ||
    !RP_VeloBox(playerid,8,282.0,378.0,4.0,47.0,0x50B6E9FF) ||
    !RP_VeloBox(playerid,9,343.0,384.0,12.0,13.0,0x263546FF) ||
    !RP_VeloBox(playerid,10,290.0,411.0,28.0,4.0,0x34424EFF) ||
    !RP_VeloBox(playerid,11,290.0,411.0,28.0,4.0,0x50B6E9FF) ||
    !RP_VeloBox(playerid,12,326.0,411.0,28.0,4.0,0x34424EFF) ||
    !RP_VeloBox(playerid,13,326.0,411.0,28.0,4.0,0x72CDA1FF) ||
    !RP_VeloText(playerid,0,289.0,382.0,"000",0.50,2.35) ||
    !RP_VeloText(playerid,1,323.0,390.0,"KM/H",0.13,0.80) ||
    !RP_VeloText(playerid,2,349.0,385.0,"N",0.22,1.0,2) ||
    !RP_VeloText(playerid,3,290.0,403.0,"GAS 0%",0.14,0.75) ||
    !RP_VeloText(playerid,4,326.0,403.0,"MOTOR 0%",0.13,0.75) ||
    !RP_VeloText(playerid,5,290.0,418.0,"CINT: OFF",0.10,0.60) ||
    !RP_VeloText(playerid,6,325.0,418.0,"PUERTAS: OFF",0.10,0.60)) {
  DestroyPlayerVelocimetro(playerid);return 0;
 }
 return 1;
}
stock RP_VeloBar(playerid,index,Float:x,value,color) {
 new Float:width=28.0*float(value)/100.0;
 // Native boxes have four units of padding; avoid inverted endpoints at low percentages.
 if(width<4.0) width=4.0;
 PlayerTextDrawTextSize(playerid,TDE_VELO[playerid][index],x+width-2.0,0.0);
 PlayerTextDrawBoxColor(playerid,TDE_VELO[playerid][index],color);
 if(RP_VeloRendered[playerid]) {
  if(value>0) PlayerTextDrawShow(playerid,TDE_VELO[playerid][index]);
  else PlayerTextDrawHide(playerid,TDE_VELO[playerid][index]);
 }
 return 1;
}
stock Float:GetVehicleHealthEx2(vehicleid) {
 new Float:health;GetVehicleHealth(vehicleid,health);
 if(health>900.0) return health/10.0;
 return health/10.0-24.0;
}
stock GetVehicleSpeedEx(vehicleid) {
 new Float:x,Float:y,Float:z;GetVehicleVelocity(vehicleid,x,y,z);
 return floatround(floatsqroot(x*x+y*y+z*z)*170.0);
}
function VelocimetroStateChange(playerid,newstate,oldstate) {
 if(IsPlayerNPC(playerid)) return 1;
 if(newstate==PLAYER_STATE_DRIVER || newstate==PLAYER_STATE_PASSENGER) {
  new vehicle=GetPlayerVehicleID(playerid);
  if(RP_VeloVehicle[playerid]!=vehicle) RP_VeloBelt[playerid]=false;
  RP_VeloVehicle[playerid]=vehicle;
  if(PLAYER_INFO[playerid][pVelocimetro]!=0) ShowPlayerVelocimetro(playerid);
 } else {
  RP_VeloBelt[playerid]=false;RP_VeloVehicle[playerid]=0;HidePlayerVelocimetro(playerid);
 }
 return 1;
}
stock VerificarMotorAuto(playerid,vehicleid) {
 new speed=GetVehicleSpeedEx(vehicleid);new Float:health;GetVehicleHealth(vehicleid,health);
 if(speed>0 && MotorAuto[vehicleid]==0) {
  SetVehicleVelocity(vehicleid,0.0,0.0,0.0);ShowPlayerMessage(playerid,"~r~Enciende el motor del vehiculo.");
 }
 if(health>1000.0 || health<350.0) SetVehicleHealth(vehicleid,375.0);
}
stock RP_VeloHideDraws(playerid) {
 if(!RP_VeloRendered[playerid]) return 0;
 for(new i;i<RP_VeloCount[playerid];i++) PlayerTextDrawHide(playerid,TDE_VELO[playerid][i]);
 RP_VeloRendered[playerid]=false;return 1;
}
forward UpdatePlayerVelocimetro(playerid);
public UpdatePlayerVelocimetro(playerid) {
 if(!PlayerVelocimetro[playerid]) return 0;
 if(!IsPlayerConnected(playerid) || IsPlayerNPC(playerid) || !IsPlayerInAnyVehicle(playerid) ||
    !JugadorLogeado[playerid] || !PLAYER_INFO[playerid][pVelocimetro]) {HidePlayerVelocimetro(playerid);return 0;}
 new vehicle=GetPlayerVehicleID(playerid);
 if(!IsValidVehicle(vehicle) || BICI(vehicle)) {HidePlayerVelocimetro(playerid);return 0;}
 if(RP_VeloVehicle[playerid]!=vehicle) {RP_VeloVehicle[playerid]=vehicle;RP_VeloBelt[playerid]=false;}
 if(RP_InvVisible[playerid] || RP_LoadingVisible[playerid]) {RP_VeloHideDraws(playerid);return 1;}
 new speed=GetVehicleSpeedEx(vehicle);
 if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER && speed<100) VerificarMotorAuto(playerid,vehicle);
 new fuelmax=CombustibleCoche(GetVehicleModel(vehicle)),fuel;
 if(fuelmax>0) fuel=VehicleFuel[vehicle]*100/fuelmax;
 fuel=fuel<0?0:(fuel>100?100:fuel);
 new Float:health;GetVehicleHealth(vehicle,health);
 new condition=floatround(health/10.0);condition=condition<0?0:(condition>100?100:condition);
 new engine,lights,alarm,doors,bonnet,boot,objective;
 GetVehicleParamsEx(vehicle,engine,lights,alarm,doors,bonnet,boot,objective);
 new locked=doors==VEHICLE_PARAMS_ON,belt=RP_VeloBelt[playerid]?1:0;
 new text[20];format(text,sizeof text,"%03d",speed);PlayerTextDrawSetString(playerid,TDE_VELO[playerid][0],text);
 format(text,sizeof text,"GAS %d%%",fuel);PlayerTextDrawSetString(playerid,TDE_VELO[playerid][3],text);

 PlayerTextDrawColor(playerid,TDE_VELO[playerid][3],fuel<=15?0xE55252FF:0xF0F3F4FF);
 PlayerTextDrawColor(playerid,TDE_VELO[playerid][4],condition<=40?0xE55252FF:0xF0F3F4FF);
 format(text,sizeof text,"MOTOR %d%%",condition);PlayerTextDrawSetString(playerid,TDE_VELO[playerid][4],text);
 new Float:vx,Float:vy,Float:vz,Float:angle;GetVehicleVelocity(vehicle,vx,vy,vz);GetVehicleZAngle(vehicle,angle);
 new Float:forwardSpeed=-vx*floatsin(angle,degrees)+vy*floatcos(angle,degrees);
 PlayerTextDrawSetString(playerid,TDE_VELO[playerid][2],speed<2?("N"):(forwardSpeed<0.0?("R"):("D")));
 PlayerTextDrawSetString(playerid,TDE_VELO[playerid][5],belt?("CINT: ON"):("CINT: OFF"));
 PlayerTextDrawColor(playerid,TDE_VELO[playerid][5],belt?0x72CDA1FF:0x94A3B5FF);
 PlayerTextDrawSetString(playerid,TDE_VELO[playerid][6],locked?("PUERTAS: ON"):("PUERTAS: OFF"));
 PlayerTextDrawColor(playerid,TDE_VELO[playerid][6],locked?0x72CDA1FF:0x94A3B5FF);
 RP_VeloBar(playerid,11,290.0,fuel,fuel<=15?0xE55252FF:0x50B6E9FF);
 RP_VeloBar(playerid,13,326.0,condition,condition<=40?0xE55252FF:0x72CDA1FF);
 if(RP_VeloRendered[playerid]) {
  for(new i=3;i<=6;i++) PlayerTextDrawShow(playerid,TDE_VELO[playerid][i]);
 }
 if(!RP_VeloRendered[playerid]) {
  for(new i;i<RP_VeloCount[playerid];i++) PlayerTextDrawShow(playerid,TDE_VELO[playerid][i]);
  RP_VeloRendered[playerid]=true;
  if(!fuel) PlayerTextDrawHide(playerid,TDE_VELO[playerid][11]);
  if(!condition) PlayerTextDrawHide(playerid,TDE_VELO[playerid][13]);
 }

 return 1;
}
stock DestroyPlayerVelocimetro(playerid) {
 HidePlayerVelocimetro(playerid);
 if(RP_VeloCreated[playerid]) for(new i;i<RP_VeloCount[playerid];i++) if(TDE_VELO[playerid][i]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid,TDE_VELO[playerid][i]);
 RP_VeloCreated[playerid]=false;RP_VeloCount[playerid]=0;RP_VeloBelt[playerid]=false;RP_VeloVehicle[playerid]=0;return 1;
}
stock ShowPlayerVelocimetro(playerid) {
 if(IsPlayerNPC(playerid) || !IsPlayerInAnyVehicle(playerid) || !PLAYER_INFO[playerid][pVelocimetro] || BICI(GetPlayerVehicleID(playerid))) return HidePlayerVelocimetro(playerid);
 if(!RP_VeloCreated[playerid] && !CrearVelocimetro(playerid)) return 0;
 PlayerVelocimetro[playerid]=true;
 if(!PlayerVelocimetroTimer[playerid]) PlayerVelocimetroTimer[playerid]=SetTimerEx("UpdatePlayerVelocimetro",200,true,"i",playerid);
 UpdatePlayerVelocimetro(playerid);return 1;
}
stock HidePlayerVelocimetro(playerid) {
 RP_VeloHideDraws(playerid);PlayerVelocimetro[playerid]=false;
 if(PlayerVelocimetroTimer[playerid]) KillTimer(PlayerVelocimetroTimer[playerid]);PlayerVelocimetroTimer[playerid]=0;return 1;
}
CMD:cinturon(playerid,params[]) {
 if(IsPlayerNPC(playerid) || !JugadorLogeado[playerid] || !IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,-1,"Debes estar dentro de un vehiculo para usar el cinturon.");
 new vehicle=GetPlayerVehicleID(playerid),model=GetVehicleModel(vehicle);
 if(BICI(vehicle) || model==448 || model==461 || model==462 || model==463 || model==468 || model==521 || model==522 || model==523 || model==581 || model==586 || model==471) return SendClientMessage(playerid,-1,"Este vehiculo no tiene cinturon de seguridad.");
 RP_VeloVehicle[playerid]=vehicle;RP_VeloBelt[playerid]=!RP_VeloBelt[playerid];
 SendClientMessage(playerid,-1,RP_VeloBelt[playerid]?("Te abrochaste el cinturon de seguridad."):("Te desabrochaste el cinturon de seguridad."));
 if(PlayerVelocimetro[playerid]) UpdatePlayerVelocimetro(playerid);return 1;
}
