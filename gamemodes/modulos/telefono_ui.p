// Telefono estilo smartphone moderno (esquina inferior derecha). Solo textdraws, sin TXD externos.
// Se abre con /telefono. Pantallas: inicio, marcador y contactos. La barra inferior vuelve al inicio o cierra.
#define RP_PH_APPS (10)
#define RP_PH_MAXTD (170)
#define RP_PH_MAXBTN (32)
#define RP_PH_X (520.0)
#define RP_PH_Y (236.0)
// Escala del telefono (1.0 = tamano original). Se ancla a la esquina inferior derecha.
#define RP_PH_S (0.8)
#define RP_PH_AX (624.0)
#define RP_PH_AY (436.0)
#define RP_PHSX(%0) (RP_PH_AX - (RP_PH_AX - (%0)) * RP_PH_S)
// Subir toda la interfaz, incluidos botones y avisos, para dejar libre la franja inferior.
#define RP_PH_UP (12.0)
#define RP_PHSY(%0) (RP_PH_AY - (RP_PH_AY - (%0)) * RP_PH_S - RP_PH_UP)
#define RP_PH_MAXDIAL (10)
#define RP_PH_MAXROWS (8)

#define RP_PHS_HOME (0)
#define RP_PHS_DIAL (1)
#define RP_PHS_CONTACTS (2)
#define RP_PHS_SMS (3)
#define RP_PHS_CALL (4)
#define RP_PHS_GPS (5)
#define RP_PHS_HELP (6)
#define RP_PHS_MP3 (7)
#define RP_PHS_SET (8)
#define RP_PHA_MP3 (600)
#define RP_PHA_SET (700)
#define RP_PHA_HELP (500)
#define RP_PH_HELPROWS (6)
#define RP_PHA_GPS (400)
#define RP_PH_GPSPLACES (6)

#define RP_PHA_HOME (90)
#define RP_PHA_BACK (91)
#define RP_PHA_DEL (92)
#define RP_PHA_CALL (93)
#define RP_PHA_NEWSMS (94)
#define RP_PHA_ANSWER (95)
#define RP_PHA_HANG (96)
#define RP_PHA_KEY (200)
#define RP_PHA_CONTACT (300)
#define RP_PHA_APP (1000)

forward ShowDialog(playerid, dialogid);
forward RP_PhoneTick(playerid);
forward RP_PhoneRingTick(playerid);
forward RP_PhoneLaunch(playerid, code);
forward PosicionGPS(playerid, Float:x, Float:y, Float:z, range);

static const RP_PHGpsNames[RP_PH_GPSPLACES][] = {"Banco central","24/7","Concesionaria","Ayuntamiento","Policia","Hospital"};
static const Float:RP_PHGpsPos[RP_PH_GPSPLACES][3] = {
    {1462.1840, -1019.6361, 24.6326},
    {1827.7954, -1842.4980, 13.5781},
    {1653.3037, -1893.1719, 13.5521},
    {1793.8019, -1278.0016, 13.4688},
    {1535.3855, -1675.2513, 13.3828},
    {1189.0481, -1361.8744, 13.5550}
};
forward RP_PhoneRingHide(playerid);

static const RP_PHHelpNames[RP_PH_HELPROWS][] = {"Policia","Medico","Mecanico","Taxi","Grua","Anuncios"};
static const RP_PHHelpNumbers[RP_PH_HELPROWS] = {911, 71, 80, 82, 815, 715};
static const RP_PHHelpColors[RP_PH_HELPROWS] = {0x2F6BFFFF, 0xE8433CFF, 0xFF9500FF, 0xFFB800FF, 0x8E8E93FF, 0xAF52DEFF};

new RP_PHTimer[MAX_PLAYERS], RP_PHLastState[MAX_PLAYERS];
new PlayerText:RP_PHRing[MAX_PLAYERS][4];
new RP_PHRingTimer[MAX_PLAYERS];
new bool:RP_PHRingShown[MAX_PLAYERS];

new PlayerText:RP_PHTD[MAX_PLAYERS][RP_PH_MAXTD];
new RP_PHCount[MAX_PLAYERS];
new PlayerText:RP_PHBtnTD[MAX_PLAYERS][RP_PH_MAXBTN];
new RP_PHBtnAct[MAX_PLAYERS][RP_PH_MAXBTN];
new RP_PHBtnCount[MAX_PLAYERS];
new RP_PHScreen[MAX_PLAYERS];
new RP_PHDial[MAX_PLAYERS][RP_PH_MAXDIAL + 1];
new RP_PHContactSlot[MAX_PLAYERS][RP_PH_MAXROWS];
new bool:RP_PHOpen[MAX_PLAYERS];
// Si SA-MP se queda sin textdraws para el jugador, se redibuja en modo ligero (menos piezas)
// Nivel de detalle: 0 = maximo (curvas finas) ... 3 = ligero (sin letras en los iconos). Baja solo si faltan textdraws.
new bool:RP_PHFail[MAX_PLAYERS], RP_PHLevel[MAX_PLAYERS];
// Las piezas se muestran en tandas: mostrar ~75 de golpe hace que el cliente pierda las ultimas
new RP_PHShown[MAX_PLAYERS], RP_PHShowGen[MAX_PLAYERS];
forward RP_PhoneShowStep(playerid, gen);

static const RP_PHNames[RP_PH_APPS][] = {"Llamar","Agenda","SMS","GPS","Casas","Ayuda","Ajustes","MP3","APSA","Apagar"};
static const RP_PHGlyphs[RP_PH_APPS][] = {"T","C","M","G","P","?","A","M3","TV","O"};
static const RP_PHColors[RP_PH_APPS] = {0x34C759FF,0xFF9500FF,0x0A84FFFF,0xFF3B30FF,0xAF52DEFF,0x5AC8FAFF,0x8E8E93FF,0xFF2D55FF,0xFFB800FF,0x48484AFF};

// El HUD de vida/chaleco/hambre/sed se oculta mientras el telefono esta abierto
new bool:RP_PHHudHid[MAX_PLAYERS];
new bool:RP_PHHudWas[MAX_PLAYERS][4];

// Ocultar/mostrar cada barra manda unos 100 textdraws; se hace una barra cada 90 ms (no todas de golpe)
// porque el cliente pierde piezas cuando recibe cientos de cambios junto con los del telefono.
new RP_PHHudGen[MAX_PLAYERS];
forward RP_PhoneHudStep(playerid, stat, mode, gen);

stock RP_PhoneHudHide(playerid) {
    if (RP_PHHudHid[playerid] || !RP_HUDCreated[playerid] || !RP_HUDActive[playerid]) return 0;
    new gen = ++RP_PHHudGen[playerid];
    for (new stat; stat < 4; stat++) {
        RP_PHHudWas[playerid][stat] = RP_HUDVisible[playerid][stat];
        SetTimerEx("RP_PhoneHudStep", 30 + stat * 90, false, "iiii", playerid, stat, 0, gen);
    }
    RP_HUDActive[playerid] = false; // evita que otros sistemas lo vuelvan a mostrar
    RP_PHHudHid[playerid] = true;
    return 1;
}

stock RP_PhoneHudRestore(playerid) {
    if (!RP_PHHudHid[playerid]) return 0;
    RP_PHHudHid[playerid] = false;
    if (!RP_HUDCreated[playerid]) return 0;
    new gen = ++RP_PHHudGen[playerid];
    RP_HUDActive[playerid] = true;
    for (new stat; stat < 4; stat++) SetTimerEx("RP_PhoneHudStep", 120 + stat * 90, false, "iiii", playerid, stat, 1, gen);
    return 1;
}

public RP_PhoneHudStep(playerid, stat, mode, gen) {
    if (!IsPlayerConnected(playerid) || gen != RP_PHHudGen[playerid] || !RP_HUDCreated[playerid]) return 1;
    if (mode == 0) RP_HUDHideStat(playerid, stat);
    else if (RP_PHHudWas[playerid][stat]) {
        RP_HUDVisible[playerid][stat] = false; // fuerza reenviar todas las piezas
        RP_HUDShowStat(playerid, stat);
    }
    return 1;
}

stock RP_PHPush(playerid, PlayerText:td) {
    if (td == PlayerText:INVALID_TEXT_DRAW) return 0;
    if (RP_PHCount[playerid] >= RP_PH_MAXTD) {
        PlayerTextDrawDestroy(playerid, td);
        return 0;
    }
    RP_PHTD[playerid][RP_PHCount[playerid]++] = td;
    return 1;
}

stock PlayerText:RP_PHRect(playerid, Float:x, Float:y, Float:w, Float:h, color, action = 0, const sprite[] = "LD_SPAC:white") {
    new PlayerText:td = CreatePlayerTextDraw(playerid, RP_PHSX(x), RP_PHSY(y), sprite);
    if (td == PlayerText:INVALID_TEXT_DRAW) {
        RP_PHFail[playerid] = true;
        return td;
    }
    PlayerTextDrawFont(playerid, td, 4);
    PlayerTextDrawTextSize(playerid, td, w * RP_PH_S, h * RP_PH_S);
    PlayerTextDrawColor(playerid, td, color);
    PlayerTextDrawSetOutline(playerid, td, 0);
    PlayerTextDrawSetShadow(playerid, td, 0);
    PlayerTextDrawSetSelectable(playerid, td, action != 0);
    RP_PHPush(playerid, td);
    if (action != 0 && RP_PHBtnCount[playerid] < RP_PH_MAXBTN) {
        RP_PHBtnTD[playerid][RP_PHBtnCount[playerid]] = td;
        RP_PHBtnAct[playerid][RP_PHBtnCount[playerid]] = action;
        RP_PHBtnCount[playerid]++;
    }
    return td;
}

// Esquinas redondeadas: franjas horizontales que siguen la curva de un circulo. Cada franja
// cubre el mismo avance horizontal, asi las curvas salen suaves con pocas piezas.
// top/bottom eligen que esquinas se redondean; la pieza central recibe el clic.
stock PlayerText:RP_PHRound(playerid, Float:x, Float:y, Float:w, Float:h, color, Float:r, bool:top, bool:bottom, n, action = 0) {
    new Float:a, Float:b, Float:y0, Float:y1, Float:inset;
    for (new k; k < n; k++) {
        a = float(k) / float(n);
        b = float(k + 1) / float(n);
        y0 = r * (1.0 - floatsqroot(1.0 - a * a));
        y1 = r * (1.0 - floatsqroot(1.0 - b * b));
        inset = r * (1.0 - (float(k) + 0.5) / float(n));
        if (top) RP_PHRect(playerid, x + inset, y + y0, w - inset * 2.0, y1 - y0 + 0.15, color);
        if (bottom) RP_PHRect(playerid, x + inset, y + h - y1 - 0.15, w - inset * 2.0, y1 - y0 + 0.15, color);
    }
    new Float:my = top ? r : 0.0;
    new Float:mh = h - my - (bottom ? r : 0.0);
    return RP_PHRect(playerid, x, y + my, w, mh, color, action);
}

// Caja con esquinas redondeadas simuladas con rectangulos escalonados (usar colores opacos).
// La pieza ancha central es la que recibe el clic cuando action != 0.
stock PlayerText:RP_PHBox(playerid, Float:x, Float:y, Float:w, Float:h, color, action = 0, Float:r = 0.0) {
    // Solo el marco del telefono es redondeado; los elementos internos (iconos, teclas, botones) son cuadrados.
    if (r < 10.0) return RP_PHRect(playerid, x, y, w, h, color, action);
    if (r >= 4.0) {
        return RP_PHRound(playerid, x, y, w, h, color, r, true, true, (RP_PHLevel[playerid] == 0) ? 12 : ((RP_PHLevel[playerid] == 1) ? 9 : ((RP_PHLevel[playerid] == 2) ? 7 : 5)), action);
    }
    RP_PHRect(playerid, x + r * 0.6, y, w - r * 1.2, h, color);
    return RP_PHRect(playerid, x, y + r * 0.55, w, h - r * 1.1, color, action);
}

stock PlayerText:RP_PHText(playerid, Float:x, Float:y, const text[], Float:lx, Float:ly, align, color, font = 2) {
    new PlayerText:td = CreatePlayerTextDraw(playerid, RP_PHSX(x), RP_PHSY(y), text);
    // el texto no baja de un tamano legible
    new Float:tf = RP_PH_S;
    if (lx * tf < 0.085) tf = 0.085 / lx;
    if (td == PlayerText:INVALID_TEXT_DRAW) RP_PHFail[playerid] = true;
    if (td == PlayerText:INVALID_TEXT_DRAW) return td;
    PlayerTextDrawFont(playerid, td, font);
    PlayerTextDrawLetterSize(playerid, td, lx * tf, ly * tf);
    PlayerTextDrawAlignment(playerid, td, align);
    PlayerTextDrawColor(playerid, td, color);
    PlayerTextDrawSetOutline(playerid, td, 0);
    PlayerTextDrawSetShadow(playerid, td, 0);
    PlayerTextDrawSetProportional(playerid, td, 1);
    PlayerTextDrawSetSelectable(playerid, td, false);
    RP_PHPush(playerid, td);
    return td;
}

// Muestra las piezas creadas en tandas de 20 cada 40 ms (el orden de dibujo lo marca el ID, no el momento)
public RP_PhoneShowStep(playerid, gen) {
    if (!IsPlayerConnected(playerid) || gen != RP_PHShowGen[playerid]) return 1;
    new last = RP_PHShown[playerid] + 20;
    if (last > RP_PHCount[playerid]) last = RP_PHCount[playerid];
    for (new i = RP_PHShown[playerid]; i < last; i++) PlayerTextDrawShow(playerid, RP_PHTD[playerid][i]);
    RP_PHShown[playerid] = last;
    if (last < RP_PHCount[playerid]) SetTimerEx("RP_PhoneShowStep", 40, false, "ii", playerid, gen);
    return 1;
}

stock RP_PhoneDestroy(playerid) {
    RP_PHShowGen[playerid]++;
    for (new i; i < RP_PHCount[playerid]; i++) PlayerTextDrawDestroy(playerid, RP_PHTD[playerid][i]);
    RP_PHCount[playerid] = 0;
    RP_PHBtnCount[playerid] = 0;
}

stock RP_PhoneClose(playerid) {
    if (!RP_PHOpen[playerid]) return 0;
    RP_PHOpen[playerid] = false;
    KillTimer(RP_PHTimer[playerid]);
    RP_PhoneDestroy(playerid);
    RP_PhoneHudRestore(playerid);
    CancelSelectTextDraw(playerid);
    // Guarda el celular, salvo que siga en una llamada
    new peer;
    if (RP_PhoneCallState(playerid, peer) == 0 && GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USECELLPHONE) {
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
        if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) ApplyAnimation(playerid, "PED", "phone_out", 4.1, 0, 0, 0, 0, 0, 1);
    }
    return 1;
}

// Cuerpo, pantalla, isla dinamica, hora y barra inferior (comun a todas las pantallas)
stock RP_PhoneFrame(playerid, bool:home) {
    new hour, minute, second, str[24];
    gettime(hour, minute, second);
    new bool:off = (TelefonoEstado[playerid] == 1);
    // marco blanco por fuera, borde negro en medio y la pantalla adentro
    // Solo el marco (blanco y borde negro) es redondeado, con suficientes franjas para que la
    // curva sea lisa; la pantalla de adentro es cuadrada y queda dentro del borde negro.
    RP_PHBox(playerid, RP_PH_X, RP_PH_Y, 104.0, 200.0, 0xFFFFFFFF, 0, 12.0);
    RP_PHBox(playerid, RP_PH_X + 1.2, RP_PH_Y + 1.2, 101.6, 197.6, 0x000000FF, 0, 10.8);
    RP_PHBox(playerid, RP_PH_X + 5.4, RP_PH_Y + 5.4, 93.2, 189.2, off ? 0x000000FF : 0x101B3AFF);
    if (home) {
        RP_PHBox(playerid, RP_PH_X + 5.4, RP_PH_Y + 120.0, 93.2, 74.6, off ? 0x000000FF : 0x6A3A8CFF);
        RP_PHBox(playerid, RP_PH_X + 5.4, RP_PH_Y + 88.0, 93.2, 62.0, off ? 0x000000FF : 0x2E2A66FF);
    }
    RP_PHBox(playerid, RP_PH_X + 37.0, RP_PH_Y + 5.0, 30.0, 7.0, 0x000000FF, 0, 3.5);
    format(str, sizeof str, "%02d:%02d", hour, minute);
    RP_PHText(playerid, RP_PH_X + 8.0, RP_PH_Y + 4.0, str, 0.14, 0.8, 1, 0xFFFFFFFF);
    RP_PHText(playerid, RP_PH_X + 96.0, RP_PH_Y + 4.0, off ? "Sin red" : "5G", 0.14, 0.8, 3, 0xFFFFFFFF);
    RP_PHBox(playerid, RP_PH_X + 34.0, RP_PH_Y + 190.0, 36.0, 3.0, 0xFFFFFFFF, RP_PHA_HOME, 1.5);
}

stock RP_PhoneBuildHome(playerid) {
    new hour, minute, second, str[48];
    gettime(hour, minute, second);
    new bool:off = (TelefonoEstado[playerid] == 1);
    RP_PhoneFrame(playerid, true);
    format(str, sizeof str, "%02d:%02d", hour, minute);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 20.0, off ? "Apagado" : str, 0.42, 1.9, 2, 0xFFFFFFFF);
    format(str, sizeof str, "Mi numero: %d", PLAYER_INFO[playerid][pNumero]);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 47.0, str, 0.13, 0.8, 2, 0xD0D0E0FF);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 62.0, 88.0, 22.0, 0x343E5CFF, 0, 3.5);
    RP_PHClean(PLAYER_INFO[playerid][Nickname], str, sizeof str, 20);
    for (new i; str[i]; i++) if (str[i] == '_') str[i] = ' ';
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 68.0, str, 0.13, 0.85, 2, 0xFFFFFFFF);
    for (new a; a < RP_PH_APPS; a++) {
        new Float:ix = RP_PH_X + 8.0 + float(a % 4) * 23.0;
        new Float:iy = RP_PH_Y + 92.0 + float(a / 4) * 32.0;
        RP_PHBox(playerid, ix, iy, 18.0, 18.0, off ? 0x2A2A2AFF : RP_PHColors[a], RP_PHA_APP + a, 3.5);
        if (RP_PHLevel[playerid] < 3) RP_PHText(playerid, ix + 9.0, iy + 4.0, RP_PHGlyphs[a], 0.2, 1.0, 2, 0xFFFFFFFF, 1);
        RP_PHText(playerid, ix + 9.0, iy + 19.0, (off && a == 9) ? "Encender" : RP_PHNames[a], 0.1, 0.7, 2, 0xFFFFFFFF);
    }
}

stock RP_PhoneBuildDial(playerid) {
    RP_PhoneFrame(playerid, false);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 18.0, 28.0, 10.0, 0x2F3954FF, RP_PHA_BACK, 3.0);
    RP_PHText(playerid, RP_PH_X + 22.0, RP_PH_Y + 19.0, "Atras", 0.11, 0.7, 2, 0xFFFFFFFF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 33.0, "Marcador", 0.12, 0.8, 2, 0xB0B0C8FF);
    new shown[RP_PH_MAXDIAL + 1];
    if (RP_PHDial[playerid][0]) format(shown, sizeof shown, "%s", RP_PHDial[playerid]);
    else shown = "...";
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 43.0, shown, 0.28, 1.4, 2, 0xFFFFFFFF);
    new key[2];
    for (new k; k < 12; k++) {
        new Float:kx = RP_PH_X + 8.0 + float(k % 3) * 31.0;
        new Float:ky = RP_PH_Y + 70.0 + float(k / 3) * 24.0;
        new action, color = 0x3A3A55FF;
        if (k < 9) {
            action = RP_PHA_KEY + k + 1;
            key[0] = '1' + k;
        } else if (k == 10) {
            action = RP_PHA_KEY;
            key[0] = '0';
        } else if (k == 9) {
            action = RP_PHA_DEL;
            key[0] = '<';
            color = 0x6A2A2AFF;
        } else {
            action = RP_PHA_CALL;
            key[0] = 'T';
            color = 0x34C759FF;
        }
        key[1] = 0;
        RP_PHBox(playerid, kx, ky, 26.0, 18.0, color, action, 3.5);
        RP_PHText(playerid, kx + 13.0, ky + 3.0, k == 11 ? "Llamar" : key, k == 11 ? 0.1 : 0.2, k == 11 ? 0.8 : 1.0, 2, 0xFFFFFFFF, k == 11 ? 2 : 1);
    }
}

// Los textdraws no dibujan bien las vocales acentuadas: se muestran sin acento (admite UTF-8 y ANSI).
stock RP_PHClean(const src[], dest[], size, maxlen) {
    new j, c, n;
    for (new i; src[i] && j < size - 1 && j < maxlen; i++) {
        c = src[i] & 0xFF;
        if (c == 0xC3 && src[i + 1]) {
            n = src[++i] & 0xFF;
            switch (n) {
                case 0xA1, 0x80, 0x81: c = (n == 0xA1) ? 'a' : 'A';
                case 0xA9, 0x89: c = (n == 0xA9) ? 'e' : 'E';
                case 0xAD, 0x8D: c = (n == 0xAD) ? 'i' : 'I';
                case 0xB3, 0x93: c = (n == 0xB3) ? 'o' : 'O';
                case 0xBA, 0x9A: c = (n == 0xBA) ? 'u' : 'U';
                case 0xB1: c = 'n';
                case 0x91: c = 'N';
                default: c = '?';
            }
        } else switch (c) {
            case 0xE1: c = 'a';
            case 0xC1: c = 'A';
            case 0xE9: c = 'e';
            case 0xC9: c = 'E';
            case 0xED: c = 'i';
            case 0xCD: c = 'I';
            case 0xF3: c = 'o';
            case 0xD3: c = 'O';
            case 0xFA, 0xFC: c = 'u';
            case 0xDA, 0xDC: c = 'U';
            case 0xF1: c = 'n';
            case 0xD1: c = 'N';
            default: if (c > 127) c = '?';
        }
        dest[j++] = c;
    }
    dest[j] = 0;
    return j;
}

stock RP_PhoneBuildContacts(playerid, bool:sms = false) {
    RP_PhoneFrame(playerid, false);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 18.0, 28.0, 10.0, 0x2F3954FF, RP_PHA_BACK, 3.0);
    RP_PHText(playerid, RP_PH_X + 22.0, RP_PH_Y + 19.0, "Atras", 0.11, 0.7, 2, 0xFFFFFFFF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 33.0, sms ? "Mensajes" : "Contactos", 0.12, 0.8, 2, 0xB0B0C8FF);
    new rows, str[32], first;
    if (sms) {
        RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 44.0, 88.0, 16.0, 0x0A84FFFF, RP_PHA_NEWSMS, 3.0);
        RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 46.0, "+ Nuevo mensaje", 0.12, 0.85, 2, 0xFFFFFFFF);
        first = 1;
    }
    for (new i; i < MAX_PHONE_CONTACTS && rows + first < RP_PH_MAXROWS; i++) {
        if (!PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_VALID]) continue;
        new Float:ry = RP_PH_Y + 44.0 + float(rows + first) * 18.0;
        RP_PHContactSlot[playerid][rows] = i;
        RP_PHBox(playerid, RP_PH_X + 8.0, ry, 88.0, 16.0, 0x2C3652FF, RP_PHA_CONTACT + rows, 3.0);
        RP_PHClean(PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_NAME], str, sizeof str, 17);
        RP_PHText(playerid, RP_PH_X + 11.0, ry + 2.0, str, 0.1, 0.85, 1, 0xFFFFFFFF);
        format(str, sizeof str, "%d", PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_PHONE_NUMBER]);
        RP_PHText(playerid, RP_PH_X + 93.0, ry + 3.0, str, 0.1, 0.7, 3, 0xB0B0C8FF);
        rows++;
    }
    if (!rows && !sms) RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 80.0, "Sin contactos", 0.13, 0.9, 2, 0xB0B0C8FF);
}

// 0 = sin llamada, 1 = entrante, 2 = saliendo (sonando), 3 = en curso, 4 = servicio (911, grua, etc.)
stock RP_PhoneCallState(playerid, &peer) {
    peer = INVALID_PLAYER_ID;
    new sub = PLAYER_INFO[playerid][MobileSub];
    if (sub != INVALID_PLAYER_ID) {
        if (sub >= 0 && sub < MAX_PLAYERS && IsPlayerConnected(sub)) {
            peer = sub;
            return YoLlame[playerid] == 1 ? 2 : 1;
        }
        return 4;
    }
    if (EnLlamada[playerid] == 1) {
        new mobile = PLAYER_INFO[playerid][Mobile];
        if (mobile >= 0 && mobile < MAX_PLAYERS && IsPlayerConnected(mobile)) {
            peer = mobile;
            return 3;
        }
    }
    return 0;
}

stock RP_PhoneBuildCall(playerid) {
    new peer, cstate = RP_PhoneCallState(playerid, peer);
    RP_PHLastState[playerid] = cstate;
    RP_PhoneFrame(playerid, false);
    new name[40], status[24], initial[2];
    if (peer != INVALID_PLAYER_ID) format(name, sizeof name, "%s", convertPhoneNumber(playerid, PLAYER_INFO[peer][pNumero]));
    else if (cstate == 4) format(name, sizeof name, "Servicio %d", PLAYER_INFO[playerid][MobileSub]);
    else name = "Sin llamada";
    switch (cstate) {
        case 1: status = "Llamada entrante";
        case 2: status = "Llamando...";
        case 3: status = "En llamada";
        case 4: status = "Conectando...";
        default: status = "-";
    }
    new clean[40];
    RP_PHClean(name, clean, sizeof clean, 18);
    name = clean;
    initial[0] = name[0];
    RP_PHBox(playerid, RP_PH_X + 34.0, RP_PH_Y + 30.0, 36.0, 36.0, 0x5A5A78FF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 36.0, initial, 0.3, 1.6, 2, 0xFFFFFFFF, 1);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 76.0, name, 0.16, 1.0, 2, 0xFFFFFFFF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 90.0, status, 0.12, 0.8, 2, cstate == 3 ? 0x34C759FF : 0xB0B0C8FF);
    if (cstate == 1) {
        RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 150.0, 42.0, 20.0, 0x34C759FF, RP_PHA_ANSWER, 3.5);
        RP_PHText(playerid, RP_PH_X + 29.0, RP_PH_Y + 154.0, "Contestar", 0.11, 0.8, 2, 0xFFFFFFFF);
        RP_PHBox(playerid, RP_PH_X + 54.0, RP_PH_Y + 150.0, 42.0, 20.0, 0xFF3B30FF, RP_PHA_HANG, 3.5);
        RP_PHText(playerid, RP_PH_X + 75.0, RP_PH_Y + 154.0, "Rechazar", 0.11, 0.8, 2, 0xFFFFFFFF);
    } else if (cstate != 0) {
        RP_PHBox(playerid, RP_PH_X + 22.0, RP_PH_Y + 150.0, 60.0, 20.0, 0xFF3B30FF, RP_PHA_HANG, 3.5);
        RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 154.0, "Colgar", 0.12, 0.8, 2, 0xFFFFFFFF);
    }
}

stock RP_PhoneBuildGps(playerid) {
    RP_PhoneFrame(playerid, false);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 18.0, 28.0, 10.0, 0x2F3954FF, RP_PHA_BACK, 3.0);
    RP_PHText(playerid, RP_PH_X + 22.0, RP_PH_Y + 19.0, "Atras", 0.11, 0.7, 2, 0xFFFFFFFF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 33.0, "GPS", 0.12, 0.8, 2, 0xB0B0C8FF);
    for (new i; i < RP_PH_GPSPLACES + 2; i++) {
        new Float:ry = RP_PH_Y + 44.0 + float(i) * 18.0;
        new action = RP_PHA_GPS + i, color = 0x2C3652FF, label[24];
        if (i < RP_PH_GPSPLACES) format(label, sizeof label, "%s", RP_PHGpsNames[i]);
        else if (i == RP_PH_GPSPLACES) {
            label = "Mis propiedades";
            color = 0xAF52DEFF;
        } else {
            label = "Mas lugares";
            color = 0xFF3B30FF;
        }
        RP_PHBox(playerid, RP_PH_X + 8.0, ry, 88.0, 16.0, color, action, 3.0);
        RP_PHText(playerid, RP_PH_X + 52.0, ry + 2.0, label, 0.12, 0.85, 2, 0xFFFFFFFF);
    }
}

stock RP_PhoneBuildHelp(playerid) {
    RP_PhoneFrame(playerid, false);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 18.0, 28.0, 10.0, 0x2F3954FF, RP_PHA_BACK, 3.0);
    RP_PHText(playerid, RP_PH_X + 22.0, RP_PH_Y + 19.0, "Atras", 0.11, 0.7, 2, 0xFFFFFFFF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 33.0, "Ayuda y servicios", 0.12, 0.8, 2, 0xB0B0C8FF);
    new str[24];
    for (new i; i < RP_PH_HELPROWS + 1; i++) {
        new Float:ry = RP_PH_Y + 44.0 + float(i) * 18.0;
        if (i < RP_PH_HELPROWS) {
            RP_PHBox(playerid, RP_PH_X + 8.0, ry, 88.0, 16.0, 0x2C3652FF, RP_PHA_HELP + i, 3.0);
            RP_PHBox(playerid, RP_PH_X + 11.0, ry + 3.0, 10.0, 10.0, RP_PHHelpColors[i], 0, 2.5);
            RP_PHText(playerid, RP_PH_X + 25.0, ry + 2.0, RP_PHHelpNames[i], 0.11, 0.85, 1, 0xFFFFFFFF);
            format(str, sizeof str, "%d", RP_PHHelpNumbers[i]);
            RP_PHText(playerid, RP_PH_X + 93.0, ry + 3.0, str, 0.1, 0.7, 3, 0xB0B0C8FF);
        } else {
            RP_PHBox(playerid, RP_PH_X + 8.0, ry, 88.0, 16.0, 0x0A84FFFF, RP_PHA_HELP + i, 3.0);
            RP_PHText(playerid, RP_PH_X + 52.0, ry + 2.0, "Guia del servidor", 0.11, 0.85, 2, 0xFFFFFFFF);
        }
    }
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 175.0, "Toca un servicio para llamar", 0.09, 0.65, 2, 0x8A92B0FF);
}

stock RP_PhoneBuildMp3(playerid) {
    RP_PhoneFrame(playerid, false);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 18.0, 28.0, 10.0, 0x2F3954FF, RP_PHA_BACK);
    RP_PHText(playerid, RP_PH_X + 22.0, RP_PH_Y + 19.0, "Atras", 0.11, 0.7, 2, 0xFFFFFFFF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 33.0, "MP3", 0.12, 0.8, 2, 0xB0B0C8FF);
    static const names[3][] = {"En vehiculo", "Con audifonos", "En altavoz"};
    static const colors[3] = {0xFF2D55FF, 0xAF52DEFF, 0x0A84FFFF};
    for (new i; i < 3; i++) {
        new Float:ry = RP_PH_Y + 48.0 + float(i) * 26.0;
        RP_PHBox(playerid, RP_PH_X + 8.0, ry, 88.0, 22.0, 0x2C3652FF, RP_PHA_MP3 + i);
        RP_PHBox(playerid, RP_PH_X + 12.0, ry + 5.0, 12.0, 12.0, colors[i]);
        RP_PHText(playerid, RP_PH_X + 29.0, ry + 6.0, names[i], 0.11, 0.85, 1, 0xFFFFFFFF);
    }
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 135.0, "Elige donde escuchar", 0.09, 0.65, 2, 0x8A92B0FF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 146.0, "y luego busca tu cancion", 0.09, 0.65, 2, 0x8A92B0FF);
}

stock RP_PhoneBuildSettings(playerid) {
    new str[40];
    RP_PhoneFrame(playerid, false);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 18.0, 28.0, 10.0, 0x2F3954FF, RP_PHA_BACK);
    RP_PHText(playerid, RP_PH_X + 22.0, RP_PH_Y + 19.0, "Atras", 0.11, 0.7, 2, 0xFFFFFFFF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 33.0, "Ajustes", 0.12, 0.8, 2, 0xB0B0C8FF);
    format(str, sizeof str, "Mi numero: %d", PLAYER_INFO[playerid][pNumero]);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 46.0, 88.0, 22.0, 0x2C3652FF);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 53.0, str, 0.11, 0.85, 2, 0xFFFFFFFF);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 74.0, 88.0, 22.0, 0x0A84FFFF, RP_PHA_SET);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 81.0, "Configuracion de cuenta", 0.1, 0.85, 2, 0xFFFFFFFF);
    RP_PHBox(playerid, RP_PH_X + 8.0, RP_PH_Y + 102.0, 88.0, 22.0, 0xFF3B30FF, RP_PHA_SET + 1);
    RP_PHText(playerid, RP_PH_X + 52.0, RP_PH_Y + 109.0, "Apagar telefono", 0.11, 0.85, 2, 0xFFFFFFFF);
}

stock RP_PhoneScreen(playerid, screen) {
    RP_PhoneDestroy(playerid);
    RP_PHScreen[playerid] = screen;
    RP_PHFail[playerid] = false;
    switch (screen) {
        case RP_PHS_GPS: RP_PhoneBuildGps(playerid);
        case RP_PHS_HELP: RP_PhoneBuildHelp(playerid);
        case RP_PHS_MP3: RP_PhoneBuildMp3(playerid);
        case RP_PHS_SET: RP_PhoneBuildSettings(playerid);
        case RP_PHS_CALL: RP_PhoneBuildCall(playerid);
        case RP_PHS_DIAL: RP_PhoneBuildDial(playerid);
        case RP_PHS_CONTACTS: RP_PhoneBuildContacts(playerid);
        case RP_PHS_SMS: RP_PhoneBuildContacts(playerid, true);
        default: RP_PhoneBuildHome(playerid);
    }
    if (RP_PHFail[playerid] && RP_PHLevel[playerid] < 3) {
        // se acabaron los textdraws del jugador: redibuja con un nivel de detalle menor
        printf("[Telefono] %d: sin textdraws libres (%d creados) en nivel %d, bajando el detalle.", playerid, RP_PHCount[playerid], RP_PHLevel[playerid]);
        RP_PHLevel[playerid]++;
        return RP_PhoneScreen(playerid, screen);
    }
    RP_PHShown[playerid] = 0;
    RP_PhoneShowStep(playerid, RP_PHShowGen[playerid]);
    return 1;
}

stock RP_PhoneOpen(playerid) {
    if (RP_PHOpen[playerid]) return RP_PhoneClose(playerid);
    RP_PHDial[playerid][0] = 0;
    RP_PHLevel[playerid] = 0;
    RP_PhoneRingHide(playerid);
    RP_PhoneHudHide(playerid);
    new peer;
    RP_PhoneScreen(playerid, RP_PhoneCallState(playerid, peer) != 0 ? RP_PHS_CALL : RP_PHS_HOME);
    RP_PHOpen[playerid] = true;
    KillTimer(RP_PHTimer[playerid]);
    RP_PHTimer[playerid] = SetTimerEx("RP_PhoneTick", 1000, true, "i", playerid);
    // Saca el celular en la mano (solo a pie y si no esta herido)
    if (PLAYER_INFO[playerid][Agonizando] != 1 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
    SelectTextDraw(playerid, 0xFFFFFF55);
    return 1;
}

// Refresca la pantalla de llamada cuando cambia el estado (contestan, cuelgan, etc.)
public RP_PhoneTick(playerid) {
    if (!IsPlayerConnected(playerid) || !RP_PHOpen[playerid]) {
        KillTimer(RP_PHTimer[playerid]);
        return 1;
    }
    // Mantiene el brazo arriba con el celular mientras el telefono este abierto
    if (PLAYER_INFO[playerid][Agonizando] != 1 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_USECELLPHONE) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
    if (RP_PHScreen[playerid] == RP_PHS_CALL) {
        new peer, cstate = RP_PhoneCallState(playerid, peer);
        if (cstate != RP_PHLastState[playerid]) RP_PhoneScreen(playerid, cstate == 0 ? RP_PHS_HOME : RP_PHS_CALL);
    }
    return 1;
}

// Aviso discreto de llamada entrante cuando el telefono esta cerrado
stock RP_PhoneRingHide(playerid) {
    KillTimer(RP_PHRingTimer[playerid]);
    if (!RP_PHRingShown[playerid]) return 0;
    RP_PHRingShown[playerid] = false;
    for (new i; i < 4; i++) {
        if (RP_PHRing[playerid][i] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid, RP_PHRing[playerid][i]);
        RP_PHRing[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
    }
    return 1;
}

stock RP_PhoneRing(playerid, caller) {
    if (RP_PHOpen[playerid]) {
        if (RP_PHScreen[playerid] != RP_PHS_CALL) RP_PhoneScreen(playerid, RP_PHS_CALL);
        return 1;
    }
    RP_PhoneRingHide(playerid);
    new name[40], PlayerText:td;
    format(name, sizeof name, "%s", convertPhoneNumber(playerid, PLAYER_INFO[caller][pNumero]));
    new clean[40];
    RP_PHClean(name, clean, sizeof clean, 14);
    name = clean;
    td = CreatePlayerTextDraw(playerid, RP_PHSX(RP_PH_X), RP_PHSY(RP_PH_Y + 168.0), "LD_SPAC:white");
    PlayerTextDrawFont(playerid, td, 4);
    PlayerTextDrawTextSize(playerid, td, 104.0 * RP_PH_S, 30.0 * RP_PH_S);
    PlayerTextDrawColor(playerid, td, 0x1C1C1EF0);
    PlayerTextDrawShow(playerid, td);
    RP_PHRing[playerid][0] = td;
    td = CreatePlayerTextDraw(playerid, RP_PHSX(RP_PH_X + 6.0), RP_PHSY(RP_PH_Y + 174.0), "LD_SPAC:white");
    PlayerTextDrawFont(playerid, td, 4);
    PlayerTextDrawTextSize(playerid, td, 5.0 * RP_PH_S, 5.0 * RP_PH_S);
    PlayerTextDrawColor(playerid, td, 0x34C759FF);
    PlayerTextDrawShow(playerid, td);
    RP_PHRing[playerid][1] = td;
    new str[48];
    format(str, sizeof str, "Llamada de %s", name);
    td = CreatePlayerTextDraw(playerid, RP_PHSX(RP_PH_X + 14.0), RP_PHSY(RP_PH_Y + 172.0), str);
    PlayerTextDrawFont(playerid, td, 2);
    PlayerTextDrawLetterSize(playerid, td, 0.1, 0.7);
    PlayerTextDrawColor(playerid, td, 0xFFFFFFFF);
    PlayerTextDrawSetShadow(playerid, td, 0);
    PlayerTextDrawSetProportional(playerid, td, 1);
    PlayerTextDrawShow(playerid, td);
    RP_PHRing[playerid][2] = td;
    td = CreatePlayerTextDraw(playerid, RP_PHSX(RP_PH_X + 6.0), RP_PHSY(RP_PH_Y + 184.0), "/atender  /colgar  /telefono");
    PlayerTextDrawFont(playerid, td, 2);
    PlayerTextDrawLetterSize(playerid, td, 0.085, 0.6);
    PlayerTextDrawColor(playerid, td, 0xB0B0C8FF);
    PlayerTextDrawSetShadow(playerid, td, 0);
    PlayerTextDrawSetProportional(playerid, td, 1);
    PlayerTextDrawShow(playerid, td);
    RP_PHRing[playerid][3] = td;
    RP_PHRingShown[playerid] = true;
    RP_PHRingTimer[playerid] = SetTimerEx("RP_PhoneRingTick", 1000, true, "i", playerid);
    return 1;
}

public RP_PhoneRingTick(playerid) {
    if (!IsPlayerConnected(playerid)) return 1;
    new peer;
    if (RP_PHOpen[playerid] || RP_PhoneCallState(playerid, peer) != 1) RP_PhoneRingHide(playerid);
    return 1;
}

stock RP_PhoneProps(playerid) {
    new count, best = -1, Float:bestDist = 99999.0, Float:dist;
    for (new p; p < MAX_PROPIEDADES; p++) {
        if (PropInfo[p][pEnUso] != 1 || PropInfo[p][pIDPropietario] != PLAYER_INFO[playerid][pID]) continue;
        count++;
        dist = GetPlayerDistanceFromPoint(playerid, PropInfo[p][pPosX], PropInfo[p][pPosY], PropInfo[p][pPosZ]);
        if (dist < bestDist) {
            bestDist = dist;
            best = p;
        }
    }
    if (best == -1) return SendClientMessage(playerid, -1, "No tienes propiedades registradas.");
    SetPlayerCheckpoint(playerid, PropInfo[best][pPosX], PropInfo[best][pPosY], PropInfo[best][pPosZ], 4.0);
    new msg[96];
    format(msg, sizeof msg, "{FFFFFF}[Telefono] Tienes %d propiedad(es). Marcada la mas cercana (%.0f m).", count, bestDist);
    return SendClientMessage(playerid, -1, msg);
}

stock RP_PhoneCall(playerid, const number[]) {
    if (TelefonoEstado[playerid] == 1) return SendClientMessage(playerid, -1, "Tu telefono esta apagado, enciendelo para usarlo.");
    if (!number[0]) return 0;
    CallLocalFunction("pc_cmd_llamar", "is", playerid, number);
    new peer;
    if (RP_PHOpen[playerid] && RP_PhoneCallState(playerid, peer) != 0) RP_PhoneScreen(playerid, RP_PHS_CALL);
    return 1;
}

// Cierra el telefono y ejecuta la accion un instante despues: abrir un dialogo en el mismo
// momento en que se cancela el cursor de textdraws hace que el cliente lo pierda y se trabe.
stock RP_PhoneLater(playerid, code) {
    RP_PhoneClose(playerid);
    SetTimerEx("RP_PhoneLaunch", 300, false, "ii", playerid, code);
    return 1;
}

public RP_PhoneLaunch(playerid, code) {
    if (!IsPlayerConnected(playerid) || RP_PHOpen[playerid]) return 1;
    switch (code) {
        case 4: RP_PhoneProps(playerid);
        case 5: CallLocalFunction("pc_cmd_ayuda", "is", playerid, " ");
        case 6: CallLocalFunction("pc_cmd_configuracion", "is", playerid, " ");
        case 7: dialogs_ShowPlayerDialog(playerid, PARLANTE_V2, DIALOG_STYLE_LIST, "MP3", "Reproducir en vehiculo\nReproducir con audifonos\nReproducir en altavoz.", "Siguiente", "Cerrar");
        case 8: VerTransmisionAPSA(playerid);
        case 9: ShowDialog(playerid, DIALOG_PHONE); // menu clasico: encender/apagar
        case 20: ShowDialog(playerid, DIALOG_PHONE_SMS_NUMBER);
        case 21: ShowDialog(playerid, DIALOG_PHONE_SMS_MESSAGE);
        case 22: CallLocalFunction("pc_cmd_gps", "is", playerid, " ");
        case 30: CallLocalFunction("pc_cmd_vmp3", "i", playerid);
        case 31: CallLocalFunction("pc_cmd_mp2", "i", playerid);
        case 32: {
            // no se puede usar el altavoz si hay otro parlante cerca
            foreach(new i : Player) {
                if (parlante[i] && IsPlayerInRangeOfPoint(playerid, 30.0, bpos[i][0], bpos[i][1], bpos[i][2]) && !parlante[playerid]) {
                    SendClientMessage(playerid, -1, "[Parlante]: Hay otro parlante cerca, coloque el suyo en otro lugar.");
                    return 1;
                }
            }
            CallLocalFunction("pc_cmd_amp3", "i", playerid);
        }
    }
    return 1;
}

// Enciende o apaga el telefono (misma logica que el menu clasico, cortando llamadas activas al apagar)
stock RP_PhonePower(playerid) {
    if (TelefonoEstado[playerid] == 1) {
        TelefonoEstado[playerid] = 0;
        AccionesRol(playerid, "encendio su telefono movil.", 20);
    } else {
        if (PLAYER_INFO[playerid][MobileSub] == 2540 || PLAYER_INFO[playerid][MobileSub] == 911) ColgarLaLlamada(playerid);
        new caller = PLAYER_INFO[playerid][MobileSub];
        if (IsPlayerConnected(caller) && caller != -1) {
            SendClientMessage(caller, -1, "Colgaron la llamada.");
            SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
            RemovePlayerAttachedObject(caller, 7);
            PLAYER_INFO[caller][MobileSub] = -1;
            EnLlamada[caller] = 0;
            finllamada(caller);
            ColgarLaLlamada(playerid);
        }
        TelefonoEstado[playerid] = 1;
        AccionesRol(playerid, "apago su telefono movil.", 20);
    }
    return RP_PhoneScreen(playerid, RP_PHS_HOME);
}

stock RP_PhoneApp(playerid, app) {
    if (TelefonoEstado[playerid] == 1 && app != 9) return SendClientMessage(playerid, -1, "Tu telefono esta apagado, enciendelo para usarlo.");
    switch (app) {
        case 0: return RP_PhoneScreen(playerid, RP_PHS_DIAL);
        case 1: return RP_PhoneScreen(playerid, RP_PHS_CONTACTS);
        case 2: return RP_PhoneScreen(playerid, RP_PHS_SMS);
        case 5: return RP_PhoneScreen(playerid, RP_PHS_HELP);
        case 6: return RP_PhoneScreen(playerid, RP_PHS_SET);
        case 7: return RP_PhoneScreen(playerid, RP_PHS_MP3);
        case 9: return RP_PhonePower(playerid);
        case 3: {
            if (PLAYER_INFO[playerid][pGPS] != 1) return SendClientMessage(playerid, -1, "No tienes un GPS. Puedes comprar uno en cualquier 24/7.");
            return RP_PhoneScreen(playerid, RP_PHS_GPS);
        }
    }
    RP_PhoneLater(playerid, app);
    return 1;
}

stock RP_PhoneAction(playerid, action) {
    if (action == RP_PHA_HOME) {
        if (RP_PHScreen[playerid] == RP_PHS_HOME) RP_PhoneClose(playerid);
        else RP_PhoneScreen(playerid, RP_PHS_HOME);
    } else if (action == RP_PHA_BACK) {
        RP_PHDial[playerid][0] = 0;
        RP_PhoneScreen(playerid, RP_PHS_HOME);
    } else if (action == RP_PHA_DEL) {
        new len = strlen(RP_PHDial[playerid]);
        if (len > 0) RP_PHDial[playerid][len - 1] = 0;
        RP_PhoneScreen(playerid, RP_PHS_DIAL);
    } else if (action == RP_PHA_CALL) {
        RP_PhoneCall(playerid, RP_PHDial[playerid]);
    } else if (action >= RP_PHA_KEY && action <= RP_PHA_KEY + 9) {
        new len = strlen(RP_PHDial[playerid]);
        if (len < RP_PH_MAXDIAL) {
            RP_PHDial[playerid][len] = '0' + (action - RP_PHA_KEY);
            RP_PHDial[playerid][len + 1] = 0;
        }
        RP_PhoneScreen(playerid, RP_PHS_DIAL);
    } else if (action >= RP_PHA_GPS && action <= RP_PHA_GPS + RP_PH_GPSPLACES + 1) {
        new place = action - RP_PHA_GPS;
        if (place < RP_PH_GPSPLACES) {
            RP_PhoneClose(playerid);
            PosicionGPS(playerid, RP_PHGpsPos[place][0], RP_PHGpsPos[place][1], RP_PHGpsPos[place][2], 5);
        } else if (place == RP_PH_GPSPLACES) RP_PhoneLater(playerid, 4);
        else RP_PhoneLater(playerid, 22);
    } else if (action >= RP_PHA_HELP && action <= RP_PHA_HELP + RP_PH_HELPROWS) {
        new row = action - RP_PHA_HELP;
        if (row < RP_PH_HELPROWS) {
            new num[8];
            format(num, sizeof num, "%d", RP_PHHelpNumbers[row]);
            RP_PhoneCall(playerid, num);
        } else RP_PhoneLater(playerid, 5);
    } else if (action >= RP_PHA_MP3 && action < RP_PHA_MP3 + 3) {
        RP_PhoneLater(playerid, 30 + (action - RP_PHA_MP3));
    } else if (action == RP_PHA_SET) {
        RP_PhoneLater(playerid, 6);
    } else if (action == RP_PHA_SET + 1) {
        RP_PhonePower(playerid);
    } else if (action == RP_PHA_ANSWER) {
        CallLocalFunction("pc_cmd_atender", "is", playerid, " ");
        RP_PhoneScreen(playerid, RP_PHS_CALL);
    } else if (action == RP_PHA_HANG) {
        CallLocalFunction("pc_cmd_colgar", "i", playerid);
        RP_PhoneScreen(playerid, RP_PHS_HOME);
    } else if (action == RP_PHA_NEWSMS) {
        RP_PhoneLater(playerid, 20);
    } else if (action >= RP_PHA_CONTACT && action < RP_PHA_CONTACT + RP_PH_MAXROWS) {
        new number = PLAYER_PHONE_BOOK[playerid][RP_PHContactSlot[playerid][action - RP_PHA_CONTACT]][phone_book_contact_PHONE_NUMBER];
        if (RP_PHScreen[playerid] == RP_PHS_SMS) {
            if (TelefonoEstado[playerid] == 1) return SendClientMessage(playerid, -1, "Tu telefono esta apagado, enciendelo para usarlo.");
            PLAYER_TEMP[playerid][pt_PLAYER_PHONE_NUMBER_SELECTED] = number;
            RP_PhoneLater(playerid, 21);
        } else {
            new str[16];
            format(str, sizeof str, "%d", number);
            RP_PhoneCall(playerid, str);
        }
    } else if (action >= RP_PHA_APP && action < RP_PHA_APP + RP_PH_APPS) {
        RP_PhoneApp(playerid, action - RP_PHA_APP);
    }
    return 1;
}

stock RP_PhoneClick(playerid, PlayerText:textid) {
    if (!RP_PHOpen[playerid]) return 0;
    for (new b; b < RP_PHBtnCount[playerid]; b++) {
        if (textid == RP_PHBtnTD[playerid][b]) {
            RP_PhoneAction(playerid, RP_PHBtnAct[playerid][b]);
            break;
        }
    }
    return 1;
}

stock RP_PhoneReset(playerid) {
    KillTimer(RP_PHTimer[playerid]);
    KillTimer(RP_PHRingTimer[playerid]);
    RP_PHRingShown[playerid] = false;
    RP_PHHudHid[playerid] = false;
    for (new i; i < 4; i++) RP_PHRing[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
    RP_PHOpen[playerid] = false;
    RP_PHCount[playerid] = 0;
    RP_PHBtnCount[playerid] = 0;
    RP_PHScreen[playerid] = 0;
    RP_PHDial[playerid][0] = 0;
}
