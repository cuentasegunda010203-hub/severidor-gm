// Aviso compacto para PC y Android; usa la deteccion del servidor.
stock RP_ClearDeviceNotice(playerid) {
    if (RP_DeviceTimer[playerid]) KillTimer(RP_DeviceTimer[playerid]);
    RP_DeviceTimer[playerid] = 0;
    if (RP_DeviceVisible[playerid]) {
        for (new i = 0; i < 7; i++) {
            PlayerTextDrawHide(playerid, RP_DeviceTD[playerid][i]);
            PlayerTextDrawDestroy(playerid, RP_DeviceTD[playerid][i]);
        }
    }
    RP_DeviceVisible[playerid] = false;
    return 1;
}
stock RP_DeviceRect(playerid, slot, Float:x, Float:y, Float:w, Float:h, color) {
    RP_DeviceTD[playerid][slot] = CreatePlayerTextDraw(playerid, x, y, "LD_SPAC:white");
    PlayerTextDrawFont(playerid, RP_DeviceTD[playerid][slot], 4);
    PlayerTextDrawTextSize(playerid, RP_DeviceTD[playerid][slot], w, h);
    PlayerTextDrawColor(playerid, RP_DeviceTD[playerid][slot], color);
    return 1;
}
stock RP_DeviceText(playerid, slot, Float:x, Float:y, const text[], Float:size, Float:height, color) {
    RP_DeviceTD[playerid][slot] = CreatePlayerTextDraw(playerid, x, y, text);
    PlayerTextDrawFont(playerid, RP_DeviceTD[playerid][slot], 1);
    PlayerTextDrawLetterSize(playerid, RP_DeviceTD[playerid][slot], size, height);
    PlayerTextDrawColor(playerid, RP_DeviceTD[playerid][slot], color);
    PlayerTextDrawSetShadow(playerid, RP_DeviceTD[playerid][slot], 0);
    PlayerTextDrawSetOutline(playerid, RP_DeviceTD[playerid][slot], 0);
    PlayerTextDrawBackgroundColor(playerid, RP_DeviceTD[playerid][slot], 0x00000000);
    PlayerTextDrawSetProportional(playerid, RP_DeviceTD[playerid][slot], true);
    return 1;
}
stock RP_ShowDeviceNotice(playerid) {
    if (!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) return 0;
    RP_ClearDeviceNotice(playerid);
    RP_DeviceAndroid[playerid] = IsPlayerMobile(playerid);
    RP_DeviceRect(playerid, 0, 522.0, 205.0, 108.0, 40.0, 0x080C10E6);
    RP_DeviceRect(playerid, 1, 522.0, 205.0, 1.2, 40.0, 0xE72936FF);
    RP_DeviceText(playerid, 2, 529.0, 209.0, "NEXUS ~r~CONEXION", 0.13, 0.7, 0x99A6AFFF);
    RP_DeviceText(playerid, 3, 529.0, 220.0, RP_DeviceAndroid[playerid] ? ("Conectado desde Android") : ("Conectado desde PC"), 0.17, 0.95, 0xFFFFFFFF);
    RP_DeviceText(playerid, 4, 529.0, 232.0, "Dispositivo detectado", 0.12, 0.65, 0x99A6AFFF);
    RP_DeviceRect(playerid, 5, 529.0, 241.0, 94.0, 1.0, 0x292F35FF);
    RP_DeviceRect(playerid, 6, 529.0, 241.0, 94.0, 1.0, 0xE72936FF);
    for (new i = 0; i < 7; i++) {
        if (RP_DeviceTD[playerid][i] == PlayerText:INVALID_TEXT_DRAW) {
            for (new j = 0; j < 7; j++)
                if (RP_DeviceTD[playerid][j] != PlayerText:INVALID_TEXT_DRAW)
                    PlayerTextDrawDestroy(playerid, RP_DeviceTD[playerid][j]);
            return 0;
        }
    }
    RP_DeviceVisible[playerid] = true;
    for (new i = 0; i < 7; i++) {
        PlayerTextDrawSetSelectable(playerid, RP_DeviceTD[playerid][i], false);
        PlayerTextDrawShow(playerid, RP_DeviceTD[playerid][i]);
    }
    RP_DeviceStart[playerid] = GetTickCount();
    RP_DeviceTimer[playerid] = SetTimerEx("RP_DeviceTick", 500, true, "i", playerid);
    return 1;
}
public RP_DeviceTick(playerid) {
    if (!IsPlayerConnected(playerid) || !RP_DeviceVisible[playerid]) return RP_ClearDeviceNotice(playerid);
    new elapsed = GetTickCount() - RP_DeviceStart[playerid];
    if (elapsed >= 5000) return RP_ClearDeviceNotice(playerid);
    // Actualizar si el cliente Android comunica su plataforma despues del ingreso.
    new bool:android = IsPlayerMobile(playerid);
    if (android != RP_DeviceAndroid[playerid]) {
        RP_DeviceAndroid[playerid] = android;
        PlayerTextDrawSetString(playerid, RP_DeviceTD[playerid][3], android ? ("Conectado desde Android") : ("Conectado desde PC"));
    }
    PlayerTextDrawTextSize(playerid, RP_DeviceTD[playerid][6], 94.0 * (1.0 - float(elapsed) / 5000.0), 1.0);
    PlayerTextDrawShow(playerid, RP_DeviceTD[playerid][6]);
    return 1;
}
