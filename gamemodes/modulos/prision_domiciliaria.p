#define RP_DOM_COST (3800)
new RP_DomPending[MAX_PLAYERS], RP_DomHouse[MAX_PLAYERS];

stock RP_DomPlayerValid(playerid) {
    return playerid >= 0 && playerid < MAX_PLAYERS && IsPlayerConnected(playerid) &&
        !IsPlayerNPC(playerid) && JugadorLogeado[playerid] == 1 && PLAYER_INFO[playerid][pID] > 0;
}

stock RP_DomHouseValid(playerid, house) {
    if (house <= 0 || house >= MAX_PROPIEDADES || PropInfo[house][pID] <= 0 ||
        PropInfo[house][pIDPropietario] != PLAYER_INFO[playerid][pID]) return 0;
    for (new slot; slot < MAX_PCASAS; slot++) {
        if (PLAYER_INFO[playerid][CasaID][slot] == PropInfo[house][pID] &&
            (PropInfo[house][pPosXS] != 0.0 || PropInfo[house][pPosYS] != 0.0 || PropInfo[house][pPosZS] != 0.0)) return 1;
    }
    return 0;
}

stock RP_DomFindHouse(playerid) {
    if (!RP_DomPlayerValid(playerid)) return 0;
    if (RP_DomHouseValid(playerid, RP_DomHouse[playerid])) return RP_DomHouse[playerid];
    for (new house = 1; house < MAX_PROPIEDADES; house++) {
        if (RP_DomHouseValid(playerid, house)) { RP_DomHouse[playerid] = house; return house; }
    }
    return 0;
}

stock RP_DomClear(playerid) {
    RP_DomPending[playerid] = 0;
    RP_DomHouse[playerid] = 0;
    return 1;
}

stock RP_DomEligible(playerid) {
    if (!RP_DomPlayerValid(playerid)) return 0;
    if (Jail[playerid] != 1 || PLAYER_INFO[playerid][pTiempoCarcel] <= 0) {
        SendClientMessage(playerid, -1, "Solo puedes solicitar domiciliaria mientras cumples una condena policial."); return 0;
    }
    if (San[playerid] || PLAYER_INFO[playerid][pTiempoJail] > 0) {
        SendClientMessage(playerid, -1, "Una sancion administrativa no permite prision domiciliaria."); return 0;
    }
    if (PLAYER_INFO[playerid][pTipoCarcel] == 10) {
        SendClientMessage(playerid, -1, "Ya estas cumpliendo prision domiciliaria. Consulta /tiempo."); return 0;
    }
    if (!RP_DomFindHouse(playerid)) {
        SendClientMessage(playerid, -1, "Necesitas una casa propia con interior disponible para cumplir prision domiciliaria."); return 0;
    }
    if (PLAYER_INFO[playerid][jDinero] < RP_DOM_COST) {
        SendClientMessage(playerid, -1, "Necesitas $3.800 en efectivo para solicitar domiciliaria."); return 0;
    }
    return 1;
}

stock RP_DomRequest(playerid) {
    if (!RP_DomPlayerValid(playerid)) return 1;
    RP_DomPending[playerid] = 0;
    if (!RP_DomEligible(playerid)) return 1;
    RP_DomPending[playerid] = PLAYER_INFO[playerid][pID];
    return dialogs_ShowPlayerDialog(playerid, DOMICILIARIA, DIALOG_STYLE_MSGBOX,
        "Prision domiciliaria", "Costo: $3.800 en efectivo, un solo pago.\nCumpliras el tiempo restante de tu condena dentro de tu casa.\nNo podras salir hasta terminar. Consulta /tiempo.", "Aceptar", "Rechazar");
}

stock RP_DomMove(playerid, house) {
    Esposando[playerid] = 0;
    EstaEnBus[playerid] = 0;
    PLAYER_INFO[playerid][pEnFC] = 0;
    EstaDomiciliaria[playerid] = 1;
    Jail[playerid] = 1;
    ClearAnimations(playerid);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    TogglePlayerControllable(playerid, 1);
    SetPVarInt(playerid, "IsFrozen", 1);
    SetPosEx(playerid, PropInfo[house][pPosXS], PropInfo[house][pPosYS], PropInfo[house][pPosZS],
        PropInfo[house][pPosAS], PropInfo[house][pInteriorID], PropInfo[house][pVW]);
    CargarMapeosEx(playerid);
    return 1;
}

stock RP_DomAccept(playerid) {
    if (!RP_DomPlayerValid(playerid)) return 1;
    new account = RP_DomPending[playerid];
    RP_DomPending[playerid] = 0;
    if (account != PLAYER_INFO[playerid][pID] || !RP_DomEligible(playerid)) return 1;
    new house = RP_DomFindHouse(playerid);
    if (!house) return 1;
    QuitarDinero(playerid, RP_DOM_COST);
    PLAYER_INFO[playerid][pTipoCarcel] = 10;
    RP_DomMove(playerid, house);
    GuardarCuenta(playerid);
    SendClientMessage(playerid, -1, "Pagaste $3.800 por la prision domiciliaria. Cumple la condena dentro de tu casa; usa /tiempo.");
    return 1;
}

stock RP_DomRestore(playerid) {
    if (!RP_DomPlayerValid(playerid) || PLAYER_INFO[playerid][pTipoCarcel] != 10 || PLAYER_INFO[playerid][pTiempoCarcel] <= 0) return 0;
    new house = RP_DomFindHouse(playerid);
    if (!house) {
        EstaDomiciliaria[playerid] = 0;
        PLAYER_INFO[playerid][pTipoCarcel] = 1;
        SendClientMessage(playerid, -1, "Tu domicilio ya no esta disponible. Cumpliras el resto de la condena en la carcel.");
        GuardarCuenta(playerid);
        return 0;
    }
    return RP_DomMove(playerid, house);
}

stock RP_DomKeep(playerid) {
    if (!RP_DomPlayerValid(playerid) || PLAYER_INFO[playerid][pTipoCarcel] != 10 || PLAYER_INFO[playerid][pTiempoCarcel] <= 0) return 0;
    new house = RP_DomFindHouse(playerid);
    if (!house) { RP_DomRestore(playerid); EnviarCarcel(playerid); return 1; }
    EstaDomiciliaria[playerid] = 1;
    if (GetPlayerInterior(playerid) != PropInfo[house][pInteriorID] || GetPlayerVirtualWorld(playerid) != PropInfo[house][pVW] ||
        !IsPlayerInRangeOfPoint(playerid, 100.0, PropInfo[house][pPosXS], PropInfo[house][pPosYS], PropInfo[house][pPosZS])) RP_DomMove(playerid, house);
    return 1;
}
