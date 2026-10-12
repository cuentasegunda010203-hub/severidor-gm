// Recuperacion por comando/F de casas sin propiedad despues de un reinicio.
stock RP_HouseExit(playerid) {
    if(!LogeoCorrecto[playerid] || GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT ||
        PLAYER_INFO[playerid][pTiempoCarcel]>0 || PLAYER_INFO[playerid][pTiempoJail]>0 ||
        PLAYER_INFO[playerid][arrestado] || PLAYER_TEMP[playerid][VariableCaido]) return 0;
    new world=GetPlayerVirtualWorld(playerid), interior=GetPlayerInterior(playerid);
    if(world<=0 || interior<=0) return 0;
    for(new h;h<MAX_PROPIEDADES;h++) {
        if(!PropInfo[h][pEnUso] || PropInfo[h][pVW]!=world || PropInfo[h][pInteriorID]!=interior) continue;
        new Float:x,Float:y,Float:z,Float:a,canonical=-1;
        ObtenerPosicionEntradaCasa(PropInfo[h][pInterior],x,y,z,a,canonical);
        if(!IsPlayerInRangeOfPoint(playerid,3.0,PropInfo[h][pPosXS],PropInfo[h][pPosYS],PropInfo[h][pPosZS]) &&
            !(canonical==interior && IsPlayerInRangeOfPoint(playerid,3.0,x,y,z))) return 0;
        CargarMapeosEx(playerid);NoTeleportHack(playerid);
        SetPosEx(playerid,PropInfo[h][pPosX],PropInfo[h][pPosY],PropInfo[h][pPosZ],PropInfo[h][pPosA]+180.0,0,0);
        PLAYER_INFO[playerid][EnCasa]=0;PLAYER_INFO[playerid][EnRopero]=0;
        PararEmisora(playerid);return 1;
    }
    // Solo interiores residenciales conocidos; no estaciones, negocios o carceles.
    for(new template=1;template<=38;template++) {
        if(template==36) continue;
        new Float:x,Float:y,Float:z,Float:a,canonical=-1;
        ObtenerPosicionEntradaCasa(template,x,y,z,a,canonical);
        if(canonical!=interior || !IsPlayerInRangeOfPoint(playerid,60.0,x,y,z)) continue;
        CargarMapeosEx(playerid);NoTeleportHack(playerid);
        SetPosEx(playerid,1481.06,-1771.18,18.80,0.0,0,0);
        PLAYER_INFO[playerid][EnCasa]=0;PLAYER_INFO[playerid][EnRopero]=0;PLAYER_INFO[playerid][EnGarage]=0;
        PLAYER_INFO[playerid][pInterior]=0;PLAYER_INFO[playerid][pMundoVirtual]=0;
        PararEmisora(playerid);
        SendClientMessage(playerid,-1,"La propiedad de este interior ya no existe. Te dejamos en un punto seguro de Los Santos.");
        return 1;
    }
    return 0;
}
