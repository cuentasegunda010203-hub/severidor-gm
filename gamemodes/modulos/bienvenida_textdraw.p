// Bienvenida individual: 8 segundos, limpieza al desconectar.
stock RP_ClearWelcome(playerid) {
    if (RP_WelcomeTimer[playerid]) KillTimer(RP_WelcomeTimer[playerid]);
    RP_WelcomeTimer[playerid] = 0;
    if (RP_WelcomeVisible[playerid]) {
        for (new i = 0; i < 16; i++) {
            PlayerTextDrawHide(playerid, RP_WelcomeTD[playerid][i]);
            PlayerTextDrawDestroy(playerid, RP_WelcomeTD[playerid][i]);
        }
    }
    RP_WelcomeVisible[playerid] = false;
    return 1;
}
stock RP_WelcomeRect(playerid, slot, Float:x, Float:y, Float:w, Float:h, color) {
    x = 630.0 - (630.0 - x) * 0.75;
    y = 115.0 + (y - 115.0) * 0.75;
    w *= 0.75;
    h *= 0.75;
    RP_WelcomeTD[playerid][slot] = CreatePlayerTextDraw(playerid, x, y, "LD_SPAC:white");
    PlayerTextDrawFont(playerid, RP_WelcomeTD[playerid][slot], 4);
    PlayerTextDrawTextSize(playerid, RP_WelcomeTD[playerid][slot], w, h);
    PlayerTextDrawColor(playerid, RP_WelcomeTD[playerid][slot], color);
    return 1;
}
stock RP_WelcomeText(playerid, slot, Float:x, Float:y, const text[], Float:size, Float:height, color, align = 1) {
    x = 630.0 - (630.0 - x) * 0.75;
    y = 115.0 + (y - 115.0) * 0.75;
    size *= 0.75;
    height *= 0.75;
    RP_WelcomeTD[playerid][slot] = CreatePlayerTextDraw(playerid, x, y, text);
    PlayerTextDrawFont(playerid, RP_WelcomeTD[playerid][slot], 1);
    PlayerTextDrawLetterSize(playerid, RP_WelcomeTD[playerid][slot], size, height);
    PlayerTextDrawColor(playerid, RP_WelcomeTD[playerid][slot], color);
    PlayerTextDrawAlignment(playerid, RP_WelcomeTD[playerid][slot], align);
    PlayerTextDrawSetShadow(playerid, RP_WelcomeTD[playerid][slot], 0);
    PlayerTextDrawSetOutline(playerid, RP_WelcomeTD[playerid][slot], 0);
    PlayerTextDrawBackgroundColor(playerid, RP_WelcomeTD[playerid][slot], 0x00000000);
    PlayerTextDrawSetProportional(playerid, RP_WelcomeTD[playerid][slot], true);
    return 1;
}
stock RP_ShowWelcome(playerid) {
    if (!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) return 0;
    RP_ClearWelcome(playerid);
    new name[25], date[11], time[9];
    format(name, sizeof(name), "%s", PLAYER_INFO[playerid][Nickname]);
    for (new i = 0; name[i]; i++) if (name[i] == '_') name[i] = ' ';
    strmid(date, PLAYER_INFO[playerid][jConexion], 0, 10, sizeof(date));
    strmid(time, PLAYER_INFO[playerid][jConexion], 11, 16, sizeof(time));
    RP_WelcomeRect(playerid, 0, 487.0, 115.0, 143.0, 111.0, 0x080C10E6);
    RP_WelcomeRect(playerid, 1, 487.0, 115.0, 1.5, 111.0, 0xE72936FF);
    RP_WelcomeRect(playerid, 2, 488.5, 115.0, 141.5, 19.0, 0x141A20FF);
    RP_WelcomeRect(playerid, 3, 497.0, 122.0, 2.0, 2.0, 0xED3543FF);
    RP_WelcomeText(playerid, 4, 503.0, 119.0, "NEXUS", 0.22, 1.15, 0xFFFFFFFF);
    RP_WelcomeText(playerid, 5, 538.0, 121.0, "ROLEPLAY", 0.14, 0.8, 0x99A6AFFF);
    RP_WelcomeText(playerid, 6, 621.0, 121.0, "EN LINEA", 0.12, 0.8, 0xE74550FF, 3);
    RP_WelcomeText(playerid, 7, 497.0, 140.0, "BIENVENIDO DE NUEVO", 0.16, 0.9, 0xC8D0D6FF);
    RP_WelcomeText(playerid, 8, 497.0, 153.0, name, 0.24, 1.35, 0xFFFFFFFF);
    RP_WelcomeText(playerid, 9, 497.0, 171.0, "Tu historia continua en Los Santos.", 0.14, 0.85, 0xAAB4BCFF);
    RP_WelcomeRect(playerid, 10, 497.0, 185.0, 124.0, 0.6, 0x293038FF);
    RP_WelcomeText(playerid, 11, 497.0, 190.0, "ULTIMA CONEXION", 0.14, 0.8, 0x89949FFF);
    RP_WelcomeText(playerid, 12, 497.0, 202.0, date, 0.20, 1.1, 0xFFFFFFFF);
    RP_WelcomeRect(playerid, 13, 497.0, 219.0, 124.0, 1.4, 0x292F35FF);
    RP_WelcomeRect(playerid, 14, 497.0, 219.0, 124.0, 1.4, 0xE72936FF);
    RP_WelcomeText(playerid, 15, 621.0, 202.0, time, 0.20, 1.1, 0xE74550FF, 3);
    for (new i = 0; i < 16; i++) {
        if (RP_WelcomeTD[playerid][i] == PlayerText:INVALID_TEXT_DRAW) {
            for (new j = 0; j < 16; j++)
                if (RP_WelcomeTD[playerid][j] != PlayerText:INVALID_TEXT_DRAW)
                    PlayerTextDrawDestroy(playerid, RP_WelcomeTD[playerid][j]);
            return 0;
        }
    }
    RP_WelcomeVisible[playerid] = true;
    for (new i = 0; i < 16; i++) {
        PlayerTextDrawSetSelectable(playerid, RP_WelcomeTD[playerid][i], false);
        PlayerTextDrawShow(playerid, RP_WelcomeTD[playerid][i]);
    }
    RP_WelcomeStart[playerid] = GetTickCount();
    RP_WelcomeTimer[playerid] = SetTimerEx("RP_WelcomeTick", 100, true, "i", playerid);
    return 1;
}
public RP_WelcomeTick(playerid) {
    if (!IsPlayerConnected(playerid) || !RP_WelcomeVisible[playerid]) return RP_ClearWelcome(playerid);
    new elapsed = GetTickCount() - RP_WelcomeStart[playerid];
    if (elapsed >= 8000) return RP_ClearWelcome(playerid);
    new Float:width = 93.0 * (1.0 - float(elapsed) / 8000.0);
    PlayerTextDrawTextSize(playerid, RP_WelcomeTD[playerid][14], width, 1.05);
    PlayerTextDrawShow(playerid, RP_WelcomeTD[playerid][14]);
    return 1;
}
