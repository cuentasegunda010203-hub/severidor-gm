// Access to existing military services, with native dialogs on Android and PC.
#include <YSI_Coding\y_hooks>
#define RP_MIL_MENU (31150)
#define RP_MIL_UNIFORM (31151)
#define RP_MIL_HELP (31152)
stock RP_MilCanUniform(p) {
    return IsPlayerConnected(p) && JugadorLogeado[p] && PLAYER_INFO[p][pFaccion]==2 && !PLAYER_INFO[p][suspendido] && GetPlayerState(p)==PLAYER_STATE_ONFOOT && !PLAYER_TEMP[p][VariableCaido] && !EnCombate[p] && GetPlayerInterior(p)==1 && GetPlayerVirtualWorld(p)==1 && IsPlayerInRangeOfPoint(p,3.0,682.6887,2537.6265,-89.4532);
}
stock RP_MilUniform(p) {
    if(!RP_MilCanUniform(p)) return SendClientMessage(p,-1,"Ve al vestuario militar dentro de la base, a pie y sin suspension.");
    if(PLAYER_INFO[p][pDuty]) return callcmd::uniforme(p,"militar");
    return dialogs_ShowPlayerDialog(p,RP_MIL_UNIFORM,DIALOG_STYLE_LIST,"Ejercito | Uniforme",PLAYER_INFO[p][jSexo]==2?"Uniforme femenino":"Uniforme militar","Vestir","Cerrar");
}
CMD:militar(playerid,params[]) {
    if(!JugadorLogeado[playerid] || IsPlayerNPC(playerid)) return 1;
    if(PLAYER_INFO[playerid][pFaccion]!=2) return SendClientMessage(playerid,-1,"No perteneces al Ejercito de San Andreas (faccion 2).");
    if(!params[0]) return dialogs_ShowPlayerDialog(playerid,RP_MIL_MENU,DIALOG_STYLE_LIST,"Ejercito | Servicios","Marcar base en el mapa\nUniforme / salir de servicio\nArmeria\nChaleco\nEntrar a la oficina\nSalir de la oficina\nAyuda","Elegir","Cerrar");
    if(!strcmp(params,"base",true)) {
        if(GetPlayerInterior(playerid)!=0 || GetPlayerVirtualWorld(playerid)!=0) return SendClientMessage(playerid,-1,"Sal al exterior para marcar la base militar.");
        StartPlayerPath(playerid,-234.4394,2778.2483,62.2608,5.0);MarcarLocalizarGPS(playerid,-234.4394,2778.2483);
        return SendClientMessage(playerid,-1,"Base militar marcada en Las Venturas, zona Las Payasadas. Usa /entrar en la puerta.");
    }
    if(!strcmp(params,"uniforme",true)) return RP_MilUniform(playerid);
    if(!strcmp(params,"armas",true) || !strcmp(params,"chaleco",true)) {
        if(!PLAYER_INFO[playerid][pDuty] || PLAYER_INFO[playerid][suspendido] || GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT || PLAYER_TEMP[playerid][VariableCaido] || GetPlayerInterior(playerid)!=1 || GetPlayerVirtualWorld(playerid)!=1 || !IsPlayerInRangeOfPoint(playerid,5.0,677.5463,2545.2993,-89.4512)) return SendClientMessage(playerid,-1,"Ve a la armeria militar con el uniforme puesto.");
        if(!strcmp(params,"armas",true)) return callcmd::armas(playerid,"");
        return callcmd::chaleco(playerid,"");
    }
    if(!strcmp(params,"entrar",true)) return callcmd::entrar(playerid,"");
    if(!strcmp(params,"salir",true)) return callcmd::salir(playerid,"");
    return dialogs_ShowPlayerDialog(playerid,RP_MIL_HELP,DIALOG_STYLE_MSGBOX,"Ejercito | Ayuda","/militar base: localizar base\n/militar uniforme: vestuario\n/militar armas y /militar chaleco: armeria\n/entrar y /salir: oficina\nLa base tiene 18 vehiculos. Necesitas uniforme para conducirlos.\nRadio y refuerzos: /r, /ref y /mg.","Cerrar","");
}
hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
    if(dialogid==RP_MIL_UNIFORM) {
        if(!response || listitem!=0 || !RP_MilCanUniform(playerid) || PLAYER_INFO[playerid][pDuty]) return 1;
        new skin=PLAYER_INFO[playerid][jSexo]==2?191:287;
        CallLocalFunction("OnPlayerModelSelection","dddd",playerid,1,PLAYER_INFO[playerid][jSexo]==2?militarmujer:militarhombre,skin);return 1;
    }
    if(dialogid==RP_MIL_MENU) {
        if(!response) return 1;
        switch(listitem) {
            case 0:callcmd::militar(playerid,"base");
            case 1:RP_MilUniform(playerid);
            case 2:callcmd::militar(playerid,"armas");
            case 3:callcmd::militar(playerid,"chaleco");
            case 4:callcmd::militar(playerid,"entrar");
            case 5:callcmd::militar(playerid,"salir");
            case 6:callcmd::militar(playerid,"ayuda");
        }return 1;
    }return 1;
}
hook OnGameModeInit() {
    CreateDynamic3DTextLabel("{83995B}EJERCITO - OFICINA\n{FFFFFF}Pulsar [ F ] Para Entrar.\n/entrar | /militar",-1,-234.4394,2778.2483,62.8608,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,0);
    CreateDynamic3DTextLabel("{83995B}SALIDA DE LA BASE\n{FFFFFF}/salir",-1,651.6872,2538.2026,-88.8551,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,1,1);
    CreateDynamic3DTextLabel("{83995B}ARMERIA MILITAR\n{FFFFFF}/militar armas\n/militar chaleco",-1,677.5463,2545.2993,-88.8512,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,1,1);
    return 1;
}
