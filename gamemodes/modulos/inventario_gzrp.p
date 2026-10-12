new RP_InvBalanceLast[MAX_PLAYERS][128];
stock RP_InvLegacyAction(playerid, action) {
	if(action == 0)
 	{	
	        if(PLAYER_INFO[playerid][pCrack] <= 0) return PUSH(playerid, "No tienes gramos de crack.");
			if(EnCombate[playerid] == 1) return PUSH(playerid,"No puedes consumir estando en combate.");
			if(PLAYER_TIMES[playerid][TiempoCrack] == 0)
			{
				new Float:resta,Float:Chaleco;
				GetPlayerArmour(playerid, Chaleco);
				resta = 100-Chaleco;
				if(resta >= 10)	EstablecerChaleco(playerid, Chaleco+10.0);
				else if(resta < 10)	EstablecerChaleco(playerid, Chaleco+resta);
				PLAYER_INFO[playerid][pCrack]--;
				PLAYER_TIMES[playerid][TiempoCrack] = 30;
				LoopingAnim(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
				AccionesRol(playerid,"consume un poco de crack.", 20);
				PLAYER_TIMES[playerid][Consumible] = 30;
				RevisarLogro(playerid,4);
			}
			else
			{
				new string[256];
				format(string,256,"Por favor espera {FF3300}%d{FFFFFF} segundos para volver a consumir crack.",PLAYER_TIMES[playerid][TiempoCrack]);
				SendClientMessage(playerid, -1, string);
			}
    }
    if(action == 1)
 	{	
	        if(PLAYER_INFO[playerid][pRemedios] < 1) return PUSH(playerid, "Ya no te quedan medicamentos.");
			if(EnCombate[playerid] == 1) return PUSH(playerid,"No puedes consumir estando en combate.");
			if(PLAYER_TIMES[playerid][TiempoMedicamentos] == 0)
			{
				new Float:resta2,Float:Vida;
				GetPlayerHealth(playerid, Vida);
				resta2 = 100-Vida;
				if(resta2 >= 10) EstablecerVida(playerid, Vida+10.0);
				else if(resta2 < 10) EstablecerVida(playerid, Vida+resta2);
				PLAYER_INFO[playerid][pRemedios]--;
    			PLAYER_TIMES[playerid][TiempoMedicamentos] =  30;
				LoopingAnim(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
				AccionesRol(playerid,"consume un medicamento.", 20);
				PLAYER_TIMES[playerid][Consumible] = 30;
				RevisarLogro(playerid,3);
			}
			else
			{
				new string[256];
				format(string,256,"Por favor espera {FF3300}%d{FFFFFF} segundos para volver a consumir medicamentos.",PLAYER_TIMES[playerid][TiempoMedicamentos]);
				SendClientMessage(playerid, -1, string);
			}
    }
    if(action == 2)
 	{	
				if(PLAYER_TIMES[playerid][TiempoMarihuana] == 0)
				{
					if(EnCombate[playerid] == 1) return SendClientMessage(playerid,-1,"No puedes armar un porro estando en combate");
					if(PLAYER_INFO[playerid][pMarihuana] <= 0) return SendClientMessage(playerid, -1, "Necesitas almenos 1g de marihuana para arma un porro");
					if(TienePorro[playerid] > 0) return SendClientMessage(playerid, COLOR_WHITE, "Ya tienes un porro en la mano.");
					SetPlayerAttachedObject(playerid, 4 , 3044, 6, 0.020000, 0.114999, 0.065999, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					TienePorro[playerid] = 5;
					PLAYER_TIMES[playerid][TiempoMarihuana] = 30;
					PLAYER_INFO[playerid][pMarihuana] -= 1;
					AccionesRol(playerid,"arma un porro.", 20);
					SendClientMessage(playerid, -1, "Pulsa {DBED16}'Y'{FFFFFF} para fumar el porro.");
					RevisarLogro(playerid,6);
				}
				else
				{
					new string[128];
					format(string,128,"Por favor espera {FF3300}%d{FFFFFF} segundos para volver a armar un porro.",PLAYER_TIMES[playerid][TiempoMarihuana]);
					SendClientMessage(playerid, -1, string);
				}
    }
    if(action == 3)
 	{	
		if(Muriendo[playerid] != 0) return Notificador2(playerid, "~r~~h~~h~No puedes usar la mochila ahora mismo");
		if(PLAYER_INFO[playerid][pFaccion] > 3) if(EnCombate[playerid] == 1) return SendClientMessage(playerid,-1,"No puedes usar la mochila mientras andas en {FF3300}combate.");
		if(!BackPack[playerid][bDBID]) return SendClientMessage(playerid, -1, "Tu mochila está rota, compra una nueva.");
		if(PLAYER_INFO[playerid][Agonizando] != 0 && Esposando[playerid] != 0) return Notificador2(playerid, "~r~No puedes  hacer esto ahora");
		if(PLAYER_TEMP[playerid][VariableCaido] != 0) return Notificador2(playerid, "~r~No puedes  hacer esto ahora");
		if(JugandoEventoDinamico[playerid] == true) return Notificador2(playerid, "No puedes usar la mochila en estos momentos");
		if(PLAYER_INFO[playerid][pFaccion] == 0 || PLAYER_INFO[playerid][pFaccion] > 3) if(PLAYER_INFO[playerid][varzonasegura] == 1) return Notificador2(playerid, "No puedes usar la mochila en zona segura.");
		if(PLAYER_TEMP[playerid][pt_PLAYER_EVENTODM] == 1)return  SendClientMessage(playerid,-1,"No puedes usar en este momento tu mochila.");
		if(PLAYER_INFO[playerid][pTiempoCarcel] > 0 || PLAYER_INFO[playerid][pTiempoJail] > 0) return SendClientMessage(playerid,-1,"No puedes usar la mochila en estos momento.");
		if(PLAYER_TEMP[playerid][restriccion_mochila] > 0) return SendClientMessageEx(playerid, -1, "Espera {00ff00}%d{ffffff} segundos para usar la mochila.", PLAYER_TEMP[playerid][restriccion_mochila]);
		if(PLAYER_INFO[playerid][pFaccion] == 0)
		{
			foreach(new c : Player)
			{
				if(PLAYER_INFO[c][pFaccion] == 1 && PLAYER_INFO[c][pDuty] == 1 && EstaEnP(playerid,c,20.00)) return	SendClientMessage(playerid,-1,"No puedes hacer esto si hay un policia cerca.");
				if(PLAYER_INFO[c][pFaccion] == 2 && PLAYER_INFO[c][pDuty] == 1 && EstaEnP(playerid,c,20.00)) return	SendClientMessage(playerid,-1,"No puedes hacer esto si hay un policia cerca.");
			}
		}
		if(PLAYER_INFO[playerid][pFaccion] > 3)
		{
			foreach(new c : Player)
			{
				if(PLAYER_INFO[c][pFaccion] == 1 && PLAYER_INFO[c][pDuty] == 1 && EstaEnP(playerid,c,20.00)) return	SendClientMessage(playerid,-1,"No puedes hacer esto si hay un policia cerca.");
				if(PLAYER_INFO[c][pFaccion] == 2 && PLAYER_INFO[c][pDuty] == 1 && EstaEnP(playerid,c,20.00)) return	SendClientMessage(playerid,-1,"No puedes hacer esto si hay un policia cerca.");
			}
		}
		for(new i = 0; i < MAX_PLAYER_TOYS; i ++)
		{
			if(PLAYER_TOYS[playerid][i][pt_ATTACHED])
			{
				if(PLAYER_TOYS[playerid][i][pt_MODEL_ID] == 3026 || PLAYER_TOYS[playerid][i][pt_MODEL_ID] == 19559)
				{
					return PlayerBackPackShow(playerid);
				}
			}
		}
		SendClientMessage(playerid, -1, "Necesitas tener una mochila puesta para usarla.");
    }
    if(action == 4)
 	{	
 		PUSH(playerid, "SISTEMA BOTIQUIN ~r~NO DISPONIBLE~w~ PROXIMA ACTUALIZACION.");
    }

    return 1;
}

stock RP_InvDestroy(playerid) {
    RP_InvVisible[playerid] = false;
    for (new i = 0; i < RP_InvCount[playerid]; i++)
        PlayerTextDrawDestroy(playerid, RP_InvTD[playerid][i]);
    RP_InvCount[playerid] = 0;
    RP_InvRestoreHud(playerid);
    return 1;
}
stock RP_InvRect(playerid, Float:x, Float:y, Float:w, Float:h, color, bool:click = false) {
    new i = RP_InvCount[playerid]++;
    RP_InvTD[playerid][i] = CreatePlayerTextDraw(playerid, x, y, "LD_SPAC:white");
    PlayerTextDrawFont(playerid, RP_InvTD[playerid][i], 4);
    PlayerTextDrawTextSize(playerid, RP_InvTD[playerid][i], w, h);
    PlayerTextDrawColor(playerid, RP_InvTD[playerid][i], color);
    PlayerTextDrawSetSelectable(playerid, RP_InvTD[playerid][i], click);
    return i;
}
stock RP_InvText(playerid, Float:x, Float:y, const str[], Float:w, Float:h, Float:size = 0.14, bool:click = false, color = 0xFFFFFFFF, box = 0) {
    new i = RP_InvCount[playerid]++;
    RP_InvTD[playerid][i] = CreatePlayerTextDraw(playerid, x, y, str);
    PlayerTextDrawFont(playerid, RP_InvTD[playerid][i], 1);
    PlayerTextDrawLetterSize(playerid, RP_InvTD[playerid][i], size, 0.8);
    PlayerTextDrawTextSize(playerid, RP_InvTD[playerid][i], x + w, h);
    PlayerTextDrawColor(playerid, RP_InvTD[playerid][i], color);
    PlayerTextDrawSetShadow(playerid, RP_InvTD[playerid][i], 0);
    PlayerTextDrawSetOutline(playerid, RP_InvTD[playerid][i], 0);
    PlayerTextDrawSetProportional(playerid, RP_InvTD[playerid][i], true);
    PlayerTextDrawBackgroundColor(playerid, RP_InvTD[playerid][i], 0x00000000);
    PlayerTextDrawSetSelectable(playerid, RP_InvTD[playerid][i], click);
    if (box) {
        PlayerTextDrawUseBox(playerid, RP_InvTD[playerid][i], true);
        PlayerTextDrawBoxColor(playerid, RP_InvTD[playerid][i], box);
    }
    return i;
}
stock RP_InvPreview(playerid, Float:x, Float:y, Float:w, Float:h, model, bool:click = false) {
    new i = RP_InvCount[playerid]++;
    RP_InvTD[playerid][i] = CreatePlayerTextDraw(playerid, x, y, "_");
    PlayerTextDrawFont(playerid, RP_InvTD[playerid][i], 5);
    PlayerTextDrawTextSize(playerid, RP_InvTD[playerid][i], w, h);
    PlayerTextDrawColor(playerid, RP_InvTD[playerid][i], 0xFFFFFFFF);
    PlayerTextDrawBackgroundColor(playerid, RP_InvTD[playerid][i], 0x00000000);
    PlayerTextDrawSetPreviewModel(playerid, RP_InvTD[playerid][i], model > 0 ? model : 19382);
    PlayerTextDrawSetPreviewRot(playerid, RP_InvTD[playerid][i], 0.0, 0.0, 0.0, 1.0);
    PlayerTextDrawSetSelectable(playerid, RP_InvTD[playerid][i], click);
    return i;
}
stock RP_InvVehicle(playerid, slot) {
    switch (slot) {
        case 0: if (PLAYER_INFO[playerid][vModelo] > 0 && IsValidVehicle(autos[playerid])) return autos[playerid];
        case 1: if (PLAYER_INFO[playerid][vModelo2] > 0 && IsValidVehicle(autos2[playerid])) return autos2[playerid];
        case 2: if (PLAYER_INFO[playerid][vModelo3] > 0 && IsValidVehicle(autos3[playerid])) return autos3[playerid];
        case 3: if (PLAYER_INFO[playerid][vModelo4] > 0 && IsValidVehicle(autos4[playerid])) return autos4[playerid];
        case 4: if (PLAYER_INFO[playerid][vModelo5] > 0 && IsValidVehicle(autos5[playerid])) return autos5[playerid];
    }
    return INVALID_VEHICLE_ID;
}
stock RP_InvFillSlot(playerid, slot, name[], len) {
    RP_InvModel[playerid][slot] = 0;
    RP_InvQty[playerid][slot] = 0;
    name[0] = EOS;
    if (RP_InvPage[playerid] == 1) {
        if (slot < 5) {
            new vehicle = RP_InvVehicle(playerid, slot);
            if (vehicle != INVALID_VEHICLE_ID) {
                RP_InvModel[playerid][slot] = GetVehicleModel(vehicle);
                RP_InvQty[playerid][slot] = 1;
                format(name, len, "Vehiculo %d", slot + 1);
            }
        }
        return 1;
    }
    if (RP_InvPage[playerid] == 2) {
        if (slot < 3 && PLAYER_INFO[playerid][CasaID][slot] > 0) {
            RP_InvModel[playerid][slot] = 1273;
            RP_InvQty[playerid][slot] = PLAYER_INFO[playerid][CasaID][slot];
            format(name, len, "Casa %d", slot + 1);
        }
        return 1;
    }
    if (slot < 6) {
        new weapon, ammo;
        GetPlayerWeaponData(playerid, slot + 1, weapon, ammo);
        if (weapon > 0 && HasWeapon(playerid, weapon)) {
            RP_InvModel[playerid][slot] = RP_InvWeaponModel(weapon);
            RP_InvQty[playerid][slot] = ammo;
            format(name, len, "%s", GetWeaponNameEx(weapon));
        }
    } else {
        switch (slot) {
            case 6: if (PLAYER_INFO[playerid][pRemedios] > 0) { format(name, len, "Medicamentos"); RP_InvModel[playerid][slot] = 1580; RP_InvQty[playerid][slot] = PLAYER_INFO[playerid][pRemedios]; }
            case 7: if (PLAYER_INFO[playerid][pCrack] > 0) { format(name, len, "Crack"); RP_InvModel[playerid][slot] = 1575; RP_InvQty[playerid][slot] = PLAYER_INFO[playerid][pCrack]; }
            case 8: if (PLAYER_INFO[playerid][pMarihuana] > 0) { format(name, len, "Marihuana"); RP_InvModel[playerid][slot] = 1578; RP_InvQty[playerid][slot] = PLAYER_INFO[playerid][pMarihuana]; }
            case 9: if (BackPack[playerid][bDBID]) { format(name, len, "Mochila"); RP_InvModel[playerid][slot] = 3026; RP_InvQty[playerid][slot] = 1; }
            case 10: if (PLAYER_INFO[playerid][pNumero] > 0) { format(name, len, "Telefono"); RP_InvModel[playerid][slot] = 330; RP_InvQty[playerid][slot] = 1; }
            case 11: if (PLAYER_INFO[playerid][pRadio] > 0) { format(name, len, "Radio"); RP_InvModel[playerid][slot] = 19942; RP_InvQty[playerid][slot] = 1; }
            case 12: if (PLAYER_INFO[playerid][pGPS] > 0) { format(name, len, "GPS"); RP_InvModel[playerid][slot] = 18875; RP_InvQty[playerid][slot] = 1; }
        }
    }
    return 1;
}
stock RP_InvOpen(playerid, page) {
    if (RP_LoadingVisible[playerid]) return 0;
    if (!IsPlayerConnected(playerid) || IsPlayerNPC(playerid) || JugadorLogeado[playerid] != 1) return 0;
    if (RP_InvVisible[playerid]) RP_InvDestroy(playerid);
    else if (SelecTextDraw[playerid] != TD_NONE) return SendClientMessage(playerid, -1, "Cierra el panel actual antes de abrir el inventario.");
    RP_InvPage[playerid] = page;
    RP_ClearWelcome(playerid);
    RP_ClearDeviceNotice(playerid);
    RP_InvRect(playerid, 146.0, 118.0, 348.0, 207.0, 0x080C10F0);
    RP_InvRect(playerid, 146.0, 118.0, 348.0, 1.0, 0xE72936FF);
    RP_InvText(playerid, 194.0, 122.0, "INVENTARIO", 145.0, 12.0, 0.24);
    RP_InvText(playerid, 438.0, 124.0, PLAYER_INFO[playerid][Nickname], 53.0, 9.0, 0.12);
    RP_InvText(playerid, 350.0, 124.0, "AYUDA", 34.0, 10.0, 0.13, true);
    RP_InvText(playerid, 388.0, 124.0, "REPORTAR", 44.0, 10.0, 0.13, true);
    // Primero los objetos ocupados; el mapa conserva sus acciones originales.
    new names[20][32], next;
    for (new source = 0; source < 20; source++) {
        RP_InvFillSlot(playerid, source, names[source], 32);
        if (RP_InvModel[playerid][source] > 0) RP_InvSlotMap[playerid][next++] = source;
    }
    for (new source = 0; source < 20; source++)
        if (RP_InvModel[playerid][source] == 0) RP_InvSlotMap[playerid][next++] = source;
    for (new slot = 0; slot < 20; slot++) {
        new source = RP_InvSlotMap[playerid][slot];
        new Float:x = 150.0 + float(slot % 5) * 38.4, Float:y = 141.0 + float(slot / 5) * 41.0;
        new caption[70];
        new bool:occupied = RP_InvModel[playerid][source] > 0;
        RP_InvRect(playerid, x, y, 37.0, 39.5, 0x1C252FFF, occupied);
        RP_InvPreview(playerid, x + 3.0, y + 8.0, 31.0, 24.0, RP_InvModel[playerid][source], occupied);
        if (occupied) {
            if (page == 0 && source < 6) format(caption, sizeof(caption), "%s~n~~n~~n~%d balas", names[source], RP_InvQty[playerid][source]);
            else if (page == 2) format(caption, sizeof(caption), "%s~n~~n~~n~ID %d", names[source], RP_InvQty[playerid][source]);
            else format(caption, sizeof(caption), "%s~n~~n~~n~x%d", names[source], RP_InvQty[playerid][source]);
        } else caption[0] = EOS;
        RP_InvText(playerid, x + 1.0, y + 1.0, caption, 34.0, 38.0, 0.12, occupied, 0xC8D3DBFF);
    }
    RP_InvPreview(playerid, 347.0, 141.0, 77.0, 95.0, GetPlayerSkin(playerid));
    for (new i = 0; i < 4; i++) {
        new td = RP_InvPreview(playerid, 426.0 + float(i % 2) * 32.0, 143.0 + float(i / 2) * 39.0, 30.0, 36.0, PLAYER_TOYS[playerid][i][pt_MODEL_ID], true);
        if (PLAYER_TOYS[playerid][i][pt_MODEL_ID] == 0) {
            PlayerTextDrawFont(playerid, RP_InvTD[playerid][td], 4);
            PlayerTextDrawSetString(playerid, RP_InvTD[playerid][td], "LD_SPAC:white");
            PlayerTextDrawColor(playerid, RP_InvTD[playerid][td], 0x34414DFF);
            PlayerTextDrawSetSelectable(playerid, RP_InvTD[playerid][td], false);
        } else PlayerTextDrawBackgroundColor(playerid, RP_InvTD[playerid][td], 0x34414DFF);
    }
    RP_InvText(playerid, 430.0, 224.0, "PRENDAS", 56.0, 10.0, 0.11);
    new const labels[10][16] = {"PERFIL", "VEHICULOS", "PROPIEDADES", "HABILIDADES", "RANKING", "ENCARGOS", "ESTADISTICAS", "MAPA / GPS", "PRENDAS", "AJUSTES"};
    for (new i = 0; i < 10; i++) {
        RP_InvText(playerid, 350.0 + float(i % 2) * 71.0, 240.0 + float(i / 2) * 15.0, labels[i], 66.0, 11.0, 0.16, true, 0xFFFFFFFF, 0x991022FF);
    }
    RP_InvText(playerid, 151.0, 311.0, "SALIR", 35.0, 11.0, 0.16, true);
    RP_InvText(playerid, 191.0, 311.0, "", 43.0, 11.0, 0.12);
    RP_InvText(playerid, 244.0, 311.0, "", 43.0, 11.0, 0.12);
    RP_InvText(playerid, 293.0, 311.0, "", 43.0, 11.0, 0.12);
    new coins[128]; RP_InvBalanceText(playerid, coins, sizeof coins);
    format(RP_InvBalanceLast[playerid], 128, "%s", coins);
    RP_InvText(playerid, 194.0, 314.0, coins, 294.0, 9.0, 0.11, false, 0xBBC9D3FF);
    RP_InvRect(playerid, 343.5, 119.0, 0.5, 206.0, 0x55202AFF);
    for (new i = 0; i < RP_InvCount[playerid]; i++) {
        if (RP_InvTD[playerid][i] == PlayerText:INVALID_TEXT_DRAW) {
            // Liberar solo identificadores validos al agotar el limite del cliente.
            for (new j = 0; j < RP_InvCount[playerid]; j++)
                if (RP_InvTD[playerid][j] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid, RP_InvTD[playerid][j]);
            RP_InvCount[playerid] = 0;
            return SendClientMessage(playerid, -1, "No se pudo abrir el inventario. Cierra otros paneles e intenta de nuevo.");
        }
    }
    RP_InvHideHud(playerid);
    RP_InvVisible[playerid] = true;
    for (new i = 0; i < RP_InvCount[playerid]; i++) {
        // Las casillas vacias solo muestran el fondo, sin icono ni etiqueta.
        if (i >= 6 && i < 66 && (i - 6) % 3 == 2 && RP_InvModel[playerid][RP_InvSlotMap[playerid][(i - 6) / 3]] == 0) continue;
        if (i >= 6 && i < 66 && (i - 6) % 3 == 1 && RP_InvModel[playerid][RP_InvSlotMap[playerid][(i - 6) / 3]] == 0) continue;
        if (i >= 83 && i <= 85) continue;
        PlayerTextDrawShow(playerid, RP_InvTD[playerid][i]);
    }
    SelectTextDrawEx(playerid, 0xFF5365FF, TD_INVENTARIO);
    return 1;
}
stock RP_InvClick(playerid, PlayerText:clicked) {
    if (!RP_InvVisible[playerid] || JugadorLogeado[playerid] != 1) return 0;
    new index = -1;
    for (new i = 0; i < RP_InvCount[playerid]; i++) if (clicked == RP_InvTD[playerid][i]) { index = i; break; }
    if (index < 0) return 0;
    if (index == 82) { Menu_CerrarInventario(playerid); return 1; }
    if (index >= 83 && index <= 85) return 1;
    if (index >= 6 && index < 66) {
        new slot = RP_InvSlotMap[playerid][(index - 6) / 3], page = RP_InvPage[playerid];
        if (RP_InvModel[playerid][slot] == 0) return 1;
        // Switch to phone without emitting a cancellation that closes the new UI.
        if (page == 0 && slot == 10) {
            RP_InvDestroy(playerid);
            SelecTextDraw[playerid] = TD_NONE;
            return callcmd::telefono(playerid, "");
        }
        if (page == 0 && slot >= 6 && slot <= 8) {
            RP_InvDestroy(playerid);SelecTextDraw[playerid] = TD_NONE;
            return RP_IAOpen(playerid, slot - 6);
        }
        Menu_CerrarInventario(playerid);
        if (page == 1) {
            AutoSeleccionado[playerid] = slot + 1;
            return dialogs_ShowPlayerDialog(playerid, DIALOG_INV_AUTOS, DIALOG_STYLE_LIST, "Funciones de tu vehiculo", "Buscar Auto\nMas opciones", ">>", "Cancelar");
        }
        if (page == 2) {
            CasaSeleccionada_INV[playerid] = slot + 1;
            return dialogs_ShowPlayerDialog(playerid, DIALOG_INV_CASAS, DIALOG_STYLE_LIST, "Inmobiliaria", "Localizar propiedad\nMas opciones", ">>", "Cancelar");
        }
        if (slot < 6) return RP_InventarioArmaDialog(playerid, slot + 1);
        switch (slot) {
            case 6: return RP_IAOpen(playerid, 0);
            case 7: return RP_IAOpen(playerid, 1);
            case 8: return RP_IAOpen(playerid, 2);
            case 9: return RP_InvLegacyAction(playerid, 3);
            case 10: return callcmd::telefono(playerid, "");
            case 11: return callcmd::radio(playerid, "");
            case 12: return callcmd::gps(playerid);
        }
        return 1;
    }
    if (index >= 67 && index <= 70) {
        new slot = index - 67;
        if (!PLAYER_TOYS[playerid][slot][pt_MODEL_ID]) return 1;
        Menu_CerrarInventario(playerid);
        PLAYER_TEMP[playerid][p_SELECTED_TOY_SLOT] = slot;
        ShowDialog(playerid, DIALOG_TOYS_MENU);
        return 1;
    }
    // Keep selection active when switching between inventory and character stats.
    if (index == 72 || index == 78) return RP_StatsShow(playerid);
    if (index == 73) return RP_InvOpen(playerid, 1);
    if (index == 74) return RP_InvOpen(playerid, 2);
    if (index == 4 || index == 5 || (index >= 72 && index <= 81)) {
        Menu_CerrarInventario(playerid);
        switch (index) {
            case 4: return callcmd::ayuda(playerid, "");
            case 5: return callcmd::reportar(playerid, "");
            case 75: { Habilidad(playerid, playerid); return 1; }
            case 76: return callcmd::top(playerid);
            case 77: return callcmd::encargo(playerid);
            case 79: return callcmd::gps(playerid);
            case 80: return callcmd::prendas(playerid);
            case 81: { ShowConfig(playerid); return 1; }
        }
    }
    return 1;
}

stock RP_InvWeaponModel(weapon) {
    new const models[] = {0,331,333,334,335,336,337,338,339,341,321,322,323,324,325,326,342,343,344,0,0,0,346,347,348,349,350,351,352,353,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,0,371};
    if (weapon < 0 || weapon >= sizeof(models)) return 0;
    return models[weapon];
}

stock RP_InvHideHud(playerid) {
    if (RP_InvHudSaved[playerid]) return 1;
    RP_InvHudActive[playerid] = RP_HUDActive[playerid];
    RP_InvHudMask[playerid] = 0;
    for (new stat = 0; stat < 4; stat++) {
        if (RP_HUDVisible[playerid][stat]) RP_InvHudMask[playerid] |= (1 << stat);
        RP_HUDHideStat(playerid, stat);
    }
    RP_HUDActive[playerid] = false;
    RP_InvHudSaved[playerid] = true;
    return 1;
}
stock RP_InvRestoreHud(playerid) {
    if (!RP_InvHudSaved[playerid]) return 0;
    RP_InvHudSaved[playerid] = false;
    if (!IsPlayerConnected(playerid) || IsPlayerNPC(playerid) || !RP_HUDCreated[playerid]) return 0;
    RP_HUDActive[playerid] = RP_InvHudActive[playerid];
    for (new stat = 0; stat < 4; stat++)
        if (RP_InvHudMask[playerid] & (1 << stat)) RP_HUDShowStat(playerid, stat);
    return 1;
}

stock RP_InvBalanceText(p, text[], len) {
    new money[24]; format(money, sizeof money, "%s", Numeros(GetPlayerMoney(p)));
    format(text, len, "Dinero $%s / Coins %d / GZ %d / Totems %d", money, PLAYER_INFO[p][Totems], PLAYER_INFO[p][Moneda], RP_NexusTotems[p]);
    return 1;
}
stock RP_InvBalanceTick(p) {
    if (!RP_InvVisible[p] || RP_InvCount[p] <= 86 || JugadorLogeado[p] != 1) return 0;
    new text[128]; RP_InvBalanceText(p, text, sizeof text);
    if (strcmp(text, RP_InvBalanceLast[p])) {
        format(RP_InvBalanceLast[p], 128, "%s", text);
        PlayerTextDrawSetString(p, RP_InvTD[p][86], text);
    }
    return 1;
}
