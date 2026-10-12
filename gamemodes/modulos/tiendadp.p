stock CerrarMenuTienda(playerid)
{
    EX_Close(playerid);
    ClearAnimations(playerid);
    HidePlayerMenu(playerid);
    PLAYER_TEMP[playerid][ViendoMenu] = 0;
    CancelSelectTextDraw(playerid);
    return 1;
}
stock AsignarVIP(playerid, vipLevel)
{
    if(vipLevel == 1)
    {
        if(PLAYER_INFO[playerid][Totems] < 30) return SendClientMessage(playerid, -1, "Necesitas 30 coins para comprar el vip");
        PLAYER_INFO[playerid][Totems] -= 30;
    }
    if(vipLevel == 2)
    {
        if(PLAYER_INFO[playerid][Totems] < 60) return SendClientMessage(playerid, -1, "Necesitas 60 coins para comprar el vip");
        PLAYER_INFO[playerid][Totems] -= 60;
    }
    if(vipLevel == 3)
    {
        if(PLAYER_INFO[playerid][Totems] < 250) return SendClientMessage(playerid, -1, "Necesitas 250 coins para comprar el vip");
        PLAYER_INFO[playerid][Totems] -= 250;
    }
    PLAYER_INFO[playerid][pVip] = vipLevel;
    new Query[256];
    new dia,mes,ano;
    getdate(ano,mes,dia);
    if(mes != 12)
    {
        mysql_format(handle_db, Query, sizeof(Query), "UPDATE `usuarios` SET `FinDia`='%d',`FinMes`='%d',`FinAno`='%d' WHERE `Username`='%e'",dia,mes+1,ano,PLAYER_INFO[playerid][Nickname]);
        mysql_tquery(handle_db, Query);
        PLAYER_INFO[playerid][findia] = dia;
        PLAYER_INFO[playerid][finmes] = mes+1;
        PLAYER_INFO[playerid][finano] = ano;
    }
    if(mes == 12)
    {
        mysql_format(handle_db, Query, sizeof(Query), "UPDATE `usuarios` SET `FinDia`='%d',`FinMes`='%d',`FinAno`='%d' WHERE `Username`='%e'",dia,mes-11,ano+1,PLAYER_INFO[playerid][Nickname]);
        mysql_tquery(handle_db, Query);
        PLAYER_INFO[playerid][findia] = dia;
        PLAYER_INFO[playerid][finmes] = mes-11;
        PLAYER_INFO[playerid][finano] = ano+1;
    }
    GuardarCuenta(playerid);
    SendClientMessageEx(playerid, 0xFFFFFFFF, "Ahora tu cuenta tiene una membresía {DBED16}VIP%d{FFFFFF} activa.",vipLevel);
    SendClientMessage(playerid, 0xFFFFFFFF, "Para más información, puedes ver la documentación en el foro o usar el cmd {DBED16}/ayuda vip{FFFFFF}.");
    return 1;
}
Menu:TIENDA_DP_TD_VIP(playerid, response, listitem)
{
    if(!response) return CerrarMenuTienda(playerid);
    if(listitem == 3)
    {
		ClearAnimations(playerid);
		HidePlayerMenu(playerid);
		PLAYER_TEMP[playerid][ViendoMenu] = 0;
		CancelSelectTextDraw(playerid);
		return 1;        
    }
    AsignarVIP(playerid, listitem+1);
    HidePlayerMenu(playerid);
	PLAYER_TEMP[playerid][ViendoMenu] = 0;
	CancelSelectTextDraw(playerid);
    return 1;
}
funcion MostrarRopaM(playerid, sexo)
{
    if(!IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1) return 1;
    switch(sexo)
    {
        case 1:	ShowModelSelectionMenu(playerid, RopaHombreBZ, "Ropa "SERVER_COIN"");
        case 2:	ShowModelSelectionMenu(playerid, RopaMujerBZ, "Ropa "SERVER_COIN"");
    }
    return 1;
}
Menu:TIENDA_DP_TD_ROPA(playerid, response, listitem)
{
    if(!response) return CerrarMenuTienda(playerid);
    if(listitem == 1)
    {
		ClearAnimations(playerid);
		HidePlayerMenu(playerid);
        PLAYER_TEMP[playerid][ViendoMenu] = 0;
		CancelSelectTextDraw(playerid);
		return 1;                
    }
    switch(listitem)
    {
        case 0:
        {
            if(PLAYER_INFO[playerid][Moneda] < 5)
            {
                callcmd::29520965(playerid);
                SendClientMessage(playerid,-1,"No tienes suficiente "SERVER_COIN" para comprar ropa {00CC00}5"SERVER_COIN"");
                return 1;
            }
            SetTimerEx("MostrarRopaM", 1000, false, "dd", playerid, PLAYER_INFO[playerid][jSexo]);       
        }
    }
    HidePlayerMenu(playerid);
	PLAYER_TEMP[playerid][ViendoMenu] = 0;
	CancelSelectTextDraw(playerid);
    return 1;
}
Menu:Tienda_Colores_V(playerid, response, listitem)
{
    if(!response) return CerrarMenuTienda(playerid);
    if(listitem == 3)
    {
		ClearAnimations(playerid);
		HidePlayerMenu(playerid);
		PLAYER_TEMP[playerid][ViendoMenu] = 0;
		CancelSelectTextDraw(playerid);
		return 1;        
    }
    switch(listitem)
    {
        case 0:
        {
            dialogs_ShowPlayerDialog(playerid, TIENDA_DP_COLOR, DIALOG_STYLE_INPUT, "Color primario", "{cecece}Coloca el número del color primario que deseas utilizar en tu vehiculo", "Pintar","Cancelar");
        }
        case 1:
        {
            dialogs_ShowPlayerDialog(playerid, TIENDA_DP_COLOR2, DIALOG_STYLE_INPUT, "Color Secundario", "{cecece}Coloca el número del color secundario que deseas utilizar en tu vehiculo", "Pintar","Cancelar");
        }
    }
    HidePlayerMenu(playerid);
	PLAYER_TEMP[playerid][ViendoMenu] = 0;
	CancelSelectTextDraw(playerid);
    return 1;
}
Menu:TIENDA_DP_TD(playerid, response, listitem)
{
    if(!response) return CerrarMenuTienda(playerid);
	if(listitem == 7)
	{
		ClearAnimations(playerid);
		HidePlayerMenu(playerid);
		PLAYER_TEMP[playerid][ViendoMenu] = 0;
		CancelSelectTextDraw(playerid);
		return 1;
	}
	switch(listitem)
	{
		case 0://9mm
		{
            SetTimerEx("ComprarItemsTienda", 1000, false, "dd", playerid, 0);
            ShowPlayerMessage(playerid, "~b~~h~~h~Cargando...", 1000);
		}//uzi
		case 1:
		{	
            SetTimerEx("ComprarItemsTienda", 1000, false, "dd", playerid, 1);
            ShowPlayerMessage(playerid, "~b~~h~~h~Cargando...", 1000);
		}//tec9
		case 2:
		{		
            SetTimerEx("ComprarItemsTienda", 1000, false, "dd", playerid, 2);
            ShowPlayerMessage(playerid, "~b~~h~~h~Cargando...", 1000);
		}//escioeta twoshot
		case 3:
		{		
            SetTimerEx("ComprarItemsTienda", 1000, false, "dd", playerid, 3);
            ShowPlayerMessage(playerid, "~b~~h~~h~Cargando...", 1000);
		}//Rifle
		case 4:
		{		
            SetTimerEx("ComprarItemsTienda", 1000, false, "dd", playerid, 4);
            ShowPlayerMessage(playerid, "~b~~h~~h~Cargando...", 1000);
		}
		case 5://Balas
		{
            SetTimerEx("ComprarItemsTienda", 1000, false, "dd", playerid, 5);
            ShowPlayerMessage(playerid, "~b~~h~~h~Cargando...", 1000);
		}
        case 6:
        {
            if(PLAYER_INFO[playerid][Totems] < 25) return SendClientMessage(playerid, COLOR_BLANCO, "Necesitas {00CC00}25 Coins{FFFFFF} para comprar una prenda");
            if(PLAYER_INFO[playerid][pVip] < 2) return SendClientMessage(playerid, COLOR_WHITE, "Para activar esta caracteristica necesitar tener una membresía VIP {00CC00}#2-3.");
            SetTimerEx("ComprarItemsTienda", 1000, false, "dd", playerid, 6);
            ShowPlayerMessage(playerid, "~b~~h~~h~Cargando...", 1000);
        }
	}
    PLAYER_TEMP[playerid][TDP_TIPO] = listitem;
	HidePlayerMenu(playerid);
	PLAYER_TEMP[playerid][ViendoMenu] = 0;
	CancelSelectTextDraw(playerid);
	return 1;
}
stock ElegirColorTienda(playerid)
{
    PLAYER_TEMP[playerid][ViendoMenu] = 1;
    ShowPlayerMenu(playerid, Tienda_Colores_V, "Eliga el color","");
    AddPlayerMenuItem(playerid, Desbug("Color primario"));
    AddPlayerMenuItem(playerid, Desbug("Color secundario"));
    AddPlayerMenuItem(playerid, "~y~~h~Cerrar");
    return 1;
}
stock ComprarEnTiendaRopa(playerid)
{
    ApplyDynamicActorAnimation(actor_tiendadp,"PED","IDLE_chat", 4.000000, 0, 0, 0, 1, 0);
    PLAYER_TEMP[playerid][ViendoMenu] = 1;
    ShowPlayerMenu(playerid, TIENDA_DP_TD_ROPA, "Tienda de Ropa","");
    switch(PLAYER_INFO[playerid][jSexo])
    {
        case 1:	AddPlayerMenuItem(playerid, Desbug("Ropa de hombre"),"$5 "SERVER_COIN"");
        case 2:	AddPlayerMenuItem(playerid, Desbug("Ropa de mujer"),"$5 "SERVER_COIN"");
    }
    AddPlayerMenuItem(playerid, "~y~~h~Cerrar");
    return 1;
}
stock ComprarEnTiendaVIP(playerid)
{
    ApplyDynamicActorAnimation(actor_tiendadp,"PED","IDLE_chat", 4.000000, 0, 0, 0, 1, 0);
    //tienda DP de 0
    if(JugadorLogeado[playerid] != 1) return 1;
    PLAYER_TEMP[playerid][ViendoMenu] = 1;
    ShowPlayerMenu(playerid, TIENDA_DP_TD_VIP, "Comprar Membresia","");
    AddPlayerMenuItem(playerid, Desbug("Comprar VIP I"),"~g~$30 Coins");
    AddPlayerMenuItem(playerid, Desbug("Comprar VIP II"),"~g~$60 Coins");
    AddPlayerMenuItem(playerid, Desbug("Comprar VIP "SERVER_COIN""),"~g~$250 Coins");
    AddPlayerMenuItem(playerid, "~y~~h~Cerrar");
    return 1;
}
stock ComprarEnTiendaCoins(playerid)
{
    ApplyDynamicActorAnimation(actor_tiendadp,"PED","IDLE_chat", 4.000000, 0, 0, 0, 1, 0);
    //tienda DP de 0
    if(JugadorLogeado[playerid] != 1) return 1;
    ShowPlayerMessage(playerid, "Próximamente");
    return 1;
}
forward ComprarItemsTienda(playerid, tipo);
public ComprarItemsTienda(playerid, tipo)
{
    if(!EX_Ready(playerid)) return 1;
    if(!EX_IsOpen(playerid)) EX_Open(playerid);
    return EX_Category(playerid,tipo);
}
stock ComprarEnTienda(playerid)
{
    return EX_Open(playerid);
}
CMD:29520965(playerid)
{
    LimpiarChat(playerid, 100, -1);
    ComprarEnTienda(playerid);
    return 1;
}	
CMD:tiendaropa(playerid)
{
    switch(PLAYER_INFO[playerid][jSexo])
    {
        case 1:	ShowModelSelectionMenu(playerid, RopaHombreBZ, "Ropa "SERVER_COIN"");
        case 2:	ShowModelSelectionMenu(playerid, RopaMujerBZ, "Ropa "SERVER_COIN"");
    }
    return 1;
}
funcion ComproVehiculoTienda(playerid, modelo)
{
    new CountVeh = 0;
    if(PLAYER_INFO[playerid][vModelo] != 0) CountVeh ++;
    if(PLAYER_INFO[playerid][vModelo2] != 0) CountVeh ++;
    if(PLAYER_INFO[playerid][vModelo3] != 0) CountVeh ++;
    if(PLAYER_INFO[playerid][vModelo4] != 0) CountVeh ++;
    if(PLAYER_INFO[playerid][vModelo5] != 0) CountVeh ++;

    if(CountVeh > 1 && PLAYER_INFO[playerid][pVip] == 0) return SendClientMessage(playerid, -1, "Las cuentas comunes solo pueden tener 2 vehículos."),RemovePlayerFromVehicle(playerid);
    if(CountVeh > 2 && PLAYER_INFO[playerid][pVip] == 1) return SendClientMessage(playerid, -1, "Las cuentas VIP1 solo pueden tener 3 vehículos."),RemovePlayerFromVehicle(playerid);
    if(CountVeh > 3 && PLAYER_INFO[playerid][pVip] == 2) return SendClientMessage(playerid, -1, "Las cuentas con membresía VIP2 solo pueden tener 4 vehículos."),RemovePlayerFromVehicle(playerid);
    if(CountVeh > 4 && PLAYER_INFO[playerid][pVip] == 3) return SendClientMessage(playerid, -1, "Las cuentas con membresía GVIP solo pueden tener 5 vehículos."),RemovePlayerFromVehicle(playerid);
    new str[500];
    format(str, sizeof str, ""API_URL"/api/tienda-dp.php?modelo=%d&color1=%d&color2=%d&dueno=%s",modelo,PLAYER_TEMP[playerid][TDP_COLOR1],PLAYER_TEMP[playerid][TDP_COLOR2],PLAYER_INFO[playerid][Nickname]);
    strreplace(str, " ", "%20", true, 0, -1, sizeof(str));
    HTTP(playerid, HTTP_POST, str, "", "RP_ShopHTTP");
	return 1;
}

stock RP_CanBuyShopVehicle(playerid) {
    new count;
    if(PLAYER_INFO[playerid][vModelo]) count++;
    if(PLAYER_INFO[playerid][vModelo2]) count++;
    if(PLAYER_INFO[playerid][vModelo3]) count++;
    if(PLAYER_INFO[playerid][vModelo4]) count++;
    if(PLAYER_INFO[playerid][vModelo5]) count++;
    new limit = 2 + PLAYER_INFO[playerid][pVip];
    if(limit > 5) limit = 5;
    return count < limit;
}
stock RP_CompleteShopVehicle(playerid) {
    new model = PLAYER_TEMP[playerid][TDP_MODEL], price = PLAYER_TEMP[playerid][TDP_PRECIO];
    if(!JugadorLogeado[playerid] || model < 400 || model > 611 || price <= 0 || PLAYER_TEMP[playerid][TDP_VMONEDA] != 1) return 0;
    if(!RP_CanBuyShopVehicle(playerid)) return SendClientMessage(playerid, -1, "No tienes espacio para otro vehiculo.");
    if(PLAYER_INFO[playerid][Moneda] < price) return SendClientMessage(playerid, -1, "No tienes suficientes monedas para esta compra.");
    WebAuto[playerid] = true;
    if(!CreatePlayerVehicle(playerid, model, PLAYER_TEMP[playerid][TDP_X], PLAYER_TEMP[playerid][TDP_Y], PLAYER_TEMP[playerid][TDP_Z], PLAYER_TEMP[playerid][TDP_A], PLAYER_TEMP[playerid][TDP_COLOR1], PLAYER_TEMP[playerid][TDP_COLOR2], price, 1, -1)) {
        WebAuto[playerid] = false;
        return SendClientMessage(playerid, -1, "No se pudo guardar el vehiculo; la compra no se cobro.");
    }
    PLAYER_INFO[playerid][Moneda] -= price;
    new query[160];
    mysql_format(handle_db, query, sizeof query, "UPDATE usuarios SET Moneda=%d WHERE ID=%d", PLAYER_INFO[playerid][Moneda], PLAYER_INFO[playerid][pID]);
    mysql_tquery(handle_db, query);
    PLAYER_TEMP[playerid][TDP_MODEL] = 0;
    SendClientMessageEx(playerid, -1, "Compraste un %s por %d "SERVER_COIN" en la tienda exclusiva.", NombreAuto[model - 400], price);
    return 1;
}
forward RP_ShopHTTP(playerid, response_code, data[]);
public RP_ShopHTTP(playerid, response_code, data[]) {
    if(!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) return 0;
    if(response_code != 200) SendClientMessage(playerid, -1, "La tienda no esta disponible. Comprueba que la web local este iniciada.");
    return 1;
}
Action:ComprarVeh_TDP(playerid, response) {
    if(response == ACTION_RESPONSE_YES) RP_CompleteShopVehicle(playerid);
    else ComprarEnTienda(playerid);
}
funcion CreatePlayerVehicle2(playerid, model, Float:cordx, Float:cordy, Float:cordz, Float:corda, color1, color2, precio, vmonedaa)
{
    if(precio<=0 || vmonedaa!=1 || !EX_CanReceive(playerid,model)) return 0;
    PLAYER_TEMP[playerid][TDP_MODEL] = model;
    PLAYER_TEMP[playerid][TDP_X] = cordx;
    PLAYER_TEMP[playerid][TDP_Y] = cordy;
    PLAYER_TEMP[playerid][TDP_Z] = cordz;
    PLAYER_TEMP[playerid][TDP_A] = corda;
    PLAYER_TEMP[playerid][TDP_COLOR1] = color1;
    PLAYER_TEMP[playerid][TDP_COLOR2] = color2;
    PLAYER_TEMP[playerid][TDP_PRECIO] = precio;
    PLAYER_TEMP[playerid][TDP_VMONEDA] = vmonedaa;
    return EX_Receive(playerid,model);
}
