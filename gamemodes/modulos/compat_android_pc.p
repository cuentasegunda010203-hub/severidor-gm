// Compatibility support; gameplay remains in the original key callback.
#include <YSI_Coding\y_hooks>
new RP_PlatformNextCheck[MAX_PLAYERS];
new RP_ActionNextUse[MAX_PLAYERS];
new RP_ActorScanTick[MAX_PLAYERS];
new RP_HospitalMobileTimer[MAX_PLAYERS];

stock RP_SyncPlatform(playerid) {
    if (playerid < 0 || playerid >= MAX_PLAYERS || !IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) return 0;
    if (IsPlayerMobile(playerid) && PLAYER_TEMP[playerid][IsAndroid] != 1) {
        PLAYER_TEMP[playerid][IsAndroid] = 1;
        CheckAndroid(playerid);
    }
    return 1;
}

hook OnPlayerConnect(playerid) {
    RP_PlatformNextCheck[playerid] = 0;
    RP_ActionNextUse[playerid] = 0;
    RP_ActorScanTick[playerid] = 0;
    RP_HospitalMobileTimer[playerid] = 0;
    PLAYER_TEMP[playerid][IsAndroid] = 0;
    return 1;
}

hook OnPlayerUpdate(playerid) {
    if (IsPlayerNPC(playerid)) return 1;
    new now = gettime();
    if (now >= RP_PlatformNextCheck[playerid]) {
        RP_PlatformNextCheck[playerid] = now + 1;
        RP_SyncPlatform(playerid);
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
    if (RP_HospitalMobileTimer[playerid]) KillTimer(RP_HospitalMobileTimer[playerid]);
    RP_HospitalMobileTimer[playerid] = 0;
    RP_PlatformNextCheck[playerid] = 0;
    RP_ActionNextUse[playerid] = 0;
    RP_ActorScanTick[playerid] = 0;
    PLAYER_TEMP[playerid][IsAndroid] = 0;
    return 1;
}

CMD:accion(playerid) {
    if (!IsPlayerConnected(playerid) || IsPlayerNPC(playerid) || JugadorLogeado[playerid] != 1) return 1;
    if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendClientMessage(playerid, -1, "Usa /accion a pie, junto al punto de interaccion.");
    if (gettime() < RP_ActionNextUse[playerid]) return 1;
    RP_ActionNextUse[playerid] = gettime() + 1;
    RP_SyncPlatform(playerid);
    // All existing job, distance and uniform checks still execute.
    CallLocalFunction("OnPlayerKeyStateChange", "ddd", playerid, KEY_YES, 0);
    return 1;
}

CMD:ayudaandroid(playerid) {
    if (JugadorLogeado[playerid] != 1) return 1;
    dialogs_ShowPlayerDialog(playerid, 32700, DIALOG_STYLE_MSGBOX, "Controles Android y PC",
        "Para interactuar con puntos que indican Y, usa el boton Y de tu cliente o /accion estando a pie.\nPara acceder a edificios puedes usar /entrar.\nConsulta /ayuda trabajos para los requisitos de cada empleo.\nObrero: acepta el empleo en la oficina, usa /accion en el vestuario y en los puntos de mezcla y entrega.\nPara abandonar el empleo usa /dejar trabajo 16.\nLos botones y los editores disponibles dependen de tu cliente Android.", "Cerrar", "");
    return 1;
}

stock MostrarBoxMedicoAndroid(playerid) {
    if (playerid < 0 || playerid >= MAX_PLAYERS || !IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1) return 0;
    ShowPlayerMessage(playerid, "~r~~h~Estás siendo transladado al hospital.", 8000);
    if (!IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1) return 0;
    if (RP_HospitalMobileTimer[playerid]) KillTimer(RP_HospitalMobileTimer[playerid]);
    RP_HospitalMobileTimer[playerid] = SetTimerEx("HospitalAndroid", 8000, false, "dd", playerid, PLAYER_INFO[playerid][pID]);
    return 1;
}

function HospitalAndroid(playerid, accountid) {
    if (playerid < 0 || playerid >= MAX_PLAYERS || !IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1 || PLAYER_INFO[playerid][pID] != accountid) return 0;
    RP_HospitalMobileTimer[playerid] = 0;
    ShowPlayerMessage(playerid, "~g~~h~Reanimando...", 15000);
    if (PLAYER_INFO[playerid][Agonizando] == 1) {
        PLAYER_TEMP[playerid][@pHospital] = 1;
        ApareceHospital(playerid), Muriendo[playerid] = 0;
        MarcadoMedicos[playerid] = 0, LlamadaMedicos[playerid] = 0;
        TimerMalherido[playerid] = 0, suicidio[playerid] = 0;
    }
    return 1;
}

stock bool:RP_ShouldScanActor(playerid) {
    new now = GetTickCount();
    if (now - RP_ActorScanTick[playerid] < 200 && RP_ActorScanTick[playerid] != 0) return false;
    RP_ActorScanTick[playerid] = now;
    return true;
}
