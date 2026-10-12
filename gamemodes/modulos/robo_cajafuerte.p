// Independent timers: never share canceltimer with other robberies.
#define RP_SAFE_FORCE_SECONDS (40)
#define RP_SAFE_ESCAPE_SECONDS (300)
new RP_SafePhase[MAX_PLAYERS], RP_SafeTimer[MAX_PLAYERS], RP_SafeToken[MAX_PLAYERS];
new RP_SafeAccount[MAX_PLAYERS], RP_SafeDeadline[MAX_PLAYERS], RP_SafeBag[MAX_PLAYERS];
new RP_SafeInterior[MAX_PLAYERS], RP_SafeWorld[MAX_PLAYERS];
new RP_SafeClaimAccount[4], RP_SafeResetTimer;
new RP_SafeOpenInterior, RP_SafeOpenWorld;
forward RP_SafeTick(playerid, token, accountid);

stock RP_SafeValid(playerid) {
    return playerid >= 0 && playerid < MAX_PLAYERS && IsPlayerConnected(playerid) &&
        !IsPlayerNPC(playerid) && JugadorLogeado[playerid] == 1 && PLAYER_INFO[playerid][pID] > 0;
}

stock RP_SafeCancel(playerid, bool:notify = false) {
    if (playerid < 0 || playerid >= MAX_PLAYERS) return 0;
    new phase = RP_SafePhase[playerid];
    if (RP_SafeTimer[playerid]) KillTimer(RP_SafeTimer[playerid]);
    RP_SafeTimer[playerid] = 0;
    RP_SafePhase[playerid] = 0;
    RP_SafeToken[playerid]++;
    yarobocaja[playerid] = 0;
    DeletePVar(playerid, "robandobanco");
    if (phase == 1 && CajaAbierta == 0) RobadaTM = 0;
    if (!phase || !IsPlayerConnected(playerid)) return 1;
    if (IsPlayerAttachedObjectSlotUsed(playerid, 4)) RemovePlayerAttachedObject(playerid, 4);
    if (phase == 1) {
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
        SetPVarInt(playerid, "IsFrozen", 1);
        StopAudioStreamForPlayer(playerid);
        GameTextForPlayerEx(playerid, "~r~Forzado cancelado", 2000, 4);
    }
    if (notify) SendClientMessage(playerid, -1, "Robo cancelado: perdiste el botin o no puedes continuar. No recibiras el premio.");
    return 1;
}

stock RP_SafeStart(playerid) {
    if (!RP_SafeValid(playerid)) return 1;
    if (IsAPolice(playerid)) return SendClientMessage(playerid, -1, "Los policias no pueden robar la caja fuerte.");
    if (RP_SafePhase[playerid]) return SendClientMessage(playerid, -1, "Ya tienes un robo en curso.");
    if (Jail[playerid] || PLAYER_INFO[playerid][Agonizando] || GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
        return SendClientMessage(playerid, -1, "Debes estar a pie y en condiciones de realizar el robo.");
    if (!IsPlayerInRangeOfPoint(playerid, 2.0, 820.41010, 8.37117, 1003.60370))
        return SendClientMessage(playerid, -1, "No estas cerca de la caja fuerte.");
    if (CajaAbierta) return RobarCaja(playerid);
    if (RobadaTM) return SendClientMessage(playerid, -1, "La caja esta siendo forzada o aun no se ha recuperado del robo.");
    if (!PLAYER_INFO[playerid][pMascara] || !PLAYER_INFO[playerid][pMascaraPuesta])
        return SendClientMessage(playerid, -1, "Necesitas tener una mascara y colocartela para forzar la caja.");
    if (PLAYER_INFO[playerid][pCargos] > 2) return SendClientMessage(playerid, -1, "La policia te busca: escapa antes de iniciar otro robo.");
    if (IsPlayerAttachedObjectSlotUsed(playerid, 4)) return SendClientMessage(playerid, -1, "Libera el objeto que llevas antes de forzar la caja.");
    RP_SafePhase[playerid] = 1;
    RP_SafeAccount[playerid] = PLAYER_INFO[playerid][pID];
    RP_SafeDeadline[playerid] = gettime() + RP_SAFE_FORCE_SECONDS;
    RP_SafeInterior[playerid] = GetPlayerInterior(playerid);
    RP_SafeWorld[playerid] = GetPlayerVirtualWorld(playerid);
    RP_SafeToken[playerid]++;
    RP_SafeTimer[playerid] = SetTimerEx("RP_SafeTick", 1000, true, "ddd", playerid, RP_SafeToken[playerid], RP_SafeAccount[playerid]);
    if (!RP_SafeTimer[playerid]) { RP_SafeCancel(playerid); return SendClientMessage(playerid, -1, "No se pudo iniciar el robo. Intenta otra vez."); }
    RobadaTM = 1;
    SetPVarInt(playerid, "robandobanco", 1);
    TogglePlayerControllable(playerid, 0);
    SetPVarInt(playerid, "IsFrozen", 0);
    SetPlayerAttachedObject(playerid, 4, 18634, 14, 0.333391, 0.0, 0.042249, 358.219909, 268.014739, 170.032974, 2.003867, 1.764811, 1.579773);
    ApplyAnimation(playerid, "BASEBALL", "Bat_4", 4.1, 1, 0, 0, 1, RP_SAFE_FORCE_SECONDS * 1000, 1);
    GameTextForPlayerEx(playerid, "~r~FORZANDO~n~~w~40 segundos", RP_SAFE_FORCE_SECONDS * 1000, 4);
    SendClientMessage(playerid, -1, "Forzando la cerradura: 40 segundos. Al abrirse usa /robar cajafuerte para recoger la mochila.");
    Avisovecino(playerid);
    return 1;
}

stock RP_SafeTake(playerid) {
    if (!RP_SafeValid(playerid)) return 1;
    if (IsAPolice(playerid)) return SendClientMessage(playerid, -1, "Los policias no pueden robar la caja fuerte.");
    if (!CajaAbierta) return SendClientMessage(playerid, -1, "Primero debes forzar la cerradura con Y o /atracar cajafuerte.");
    if (RP_SafePhase[playerid]) return SendClientMessage(playerid, -1, "Ya tienes un robo en curso. Espera el pago de tu botin.");
    if (Jail[playerid] || PLAYER_INFO[playerid][Agonizando] || GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
    if (!IsPlayerInRangeOfPoint(playerid, 2.0, 820.41010, 8.37117, 1003.60370) ||
        GetPlayerInterior(playerid) != RP_SafeOpenInterior || GetPlayerVirtualWorld(playerid) != RP_SafeOpenWorld)
        return SendClientMessage(playerid, -1, "Acercate a la caja fuerte abierta para recoger el botin.");
    if (!PLAYER_INFO[playerid][pMascara] || !PLAYER_INFO[playerid][pMascaraPuesta])
        return SendClientMessage(playerid, -1, "Colocate la mascara para recoger el botin.");
    new bag = -1;
    for (new i; i < 4; i++) {
        if (RP_SafeClaimAccount[i] == PLAYER_INFO[playerid][pID]) return SendClientMessage(playerid, -1, "Ya recogiste una mochila de este robo.");
        if (bag == -1 && Robado[i] == 0) bag = i;
    }
    if (bag == -1) return SendClientMessage(playerid, -1, "No quedan mochilas de dinero en esta caja fuerte.");
    if (IsPlayerAttachedObjectSlotUsed(playerid, 4)) return SendClientMessage(playerid, -1, "Libera el objeto que llevas antes de recoger la mochila.");
    // Reserved temporary loot object; does not replace inventory accessories (slots 0..3).
    if (!SetPlayerAttachedObject(playerid, 4, 3026, 1, 0.0, -0.20, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0))
        return SendClientMessage(playerid, -1, "No se pudo colocar la mochila. Intenta recogerla de nuevo.");
    RP_SafePhase[playerid] = 2;
    RP_SafeAccount[playerid] = PLAYER_INFO[playerid][pID];
    RP_SafeBag[playerid] = bag;
    RP_SafeDeadline[playerid] = gettime() + RP_SAFE_ESCAPE_SECONDS;
    RP_SafeToken[playerid]++;
    RP_SafeTimer[playerid] = SetTimerEx("RP_SafeTick", 1000, true, "ddd", playerid, RP_SafeToken[playerid], RP_SafeAccount[playerid]);
    if (!RP_SafeTimer[playerid]) { RP_SafeCancel(playerid); return SendClientMessage(playerid, -1, "No se pudo iniciar el pago. Recoge el botin nuevamente."); }
    Robado[bag] = 1;
    RP_SafeClaimAccount[bag] = RP_SafeAccount[playerid];
    yarobocaja[playerid] = 1;
    TipoCargo[playerid] = 1;
    if (PLAYER_INFO[playerid][pCargos] < 4) PLAYER_INFO[playerid][pCargos] = 4;
    SetPlayerWantedLevelEx(playerid, PLAYER_INFO[playerid][pCargos]);
    PlayerPlaySound(playerid, 1097, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, -1, "Mochila de dinero colocada en tu espalda. Escapa: recibiras el botin en 5 minutos.");
    SendClientMessage(playerid, -1, "Si mueres, te encarcelan, pierdes la mochila o te desconectas, pierdes este botin.");
    return 1;
}

stock RP_SafeFinish(playerid) {
    if (!RP_SafeValid(playerid) || RP_SafePhase[playerid] != 2 ||
        PLAYER_INFO[playerid][pID] != RP_SafeAccount[playerid] || gettime() < RP_SafeDeadline[playerid]) return 0;
    if (Jail[playerid] || PLAYER_INFO[playerid][Agonizando] || GetPlayerState(playerid) == PLAYER_STATE_WASTED ||
        !IsPlayerAttachedObjectSlotUsed(playerid, 4)) return RP_SafeCancel(playerid, true);
    new bag = RP_SafeBag[playerid];
    if (bag < 0 || bag >= 4 || Robado[bag] != 1 || RP_SafeClaimAccount[bag] != RP_SafeAccount[playerid]) return RP_SafeCancel(playerid, true);
    // Consume the pending payment before invoking reward logic, preventing repeated payments.
    KillTimer(RP_SafeTimer[playerid]);
    RP_SafeTimer[playerid] = 0;
    RP_SafePhase[playerid] = 0;
    RP_SafeToken[playerid]++;
    RandomRobar(playerid, bag);
    GuardarCuenta(playerid);
    return 1;
}

public RP_SafeTick(playerid, token, accountid) {
    if (playerid < 0 || playerid >= MAX_PLAYERS || token != RP_SafeToken[playerid] ||
        accountid != RP_SafeAccount[playerid] || !RP_SafePhase[playerid]) return 0;
    if (!RP_SafeValid(playerid) || PLAYER_INFO[playerid][pID] != accountid) return RP_SafeCancel(playerid);
    if (Jail[playerid] || PLAYER_INFO[playerid][Agonizando] || GetPlayerState(playerid) == PLAYER_STATE_WASTED)
        return RP_SafeCancel(playerid, true);
    if (RP_SafePhase[playerid] == 1) {
        if (!IsPlayerInRangeOfPoint(playerid, 3.0, 820.41010, 8.37117, 1003.60370) ||
            GetPlayerInterior(playerid) != RP_SafeInterior[playerid] || GetPlayerVirtualWorld(playerid) != RP_SafeWorld[playerid]) return RP_SafeCancel(playerid, true);
        if (gettime() >= RP_SafeDeadline[playerid]) return AbrirCaja(playerid);
    } else {
        if (!IsPlayerAttachedObjectSlotUsed(playerid, 4)) return RP_SafeCancel(playerid, true);
        if (gettime() >= RP_SafeDeadline[playerid]) return RP_SafeFinish(playerid);
        new remaining = RP_SafeDeadline[playerid] - gettime();
        if (remaining % 60 == 0) {
            new message[96];
            format(message, sizeof(message), "Botin pendiente: faltan %d minuto(s). Conserva la mochila y evita la carcel.", remaining / 60);
            SendClientMessage(playerid, -1, message);
        }
    }
    return 1;
}
