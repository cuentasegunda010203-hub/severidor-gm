stock AbrirDialogAceptar(playerid)
{
	new string[300];
	if(ofertador[playerid] != INVALID_PLAYER_ID) format(string, sizeof(string),"Arma\nMuerte\nTotems\nReparacion\nConsumible\nPiezas\n"SERVER_COIN"\nProteccion\nUltimo ofertador: {fd6f34}%s",PLAYER_INFO[ofertador[playerid]][Nickname]);
    else format(string, sizeof(string),"Arma\nMuerte\nTotems\nReparacion\nConsumible\nPiezas\n"SERVER_COIN"\nProteccion");
	ShowPlayerDialog(playerid, D_ACEPTAR_VENTA, DIALOG_STYLE_LIST, "Ofertas", string, "Siguiente", "Cerrar");
    return 1;
}
stock AceptarVenta(playerid, slot)
{
    new Float:X,Float:Y,Float:Z,day,month,year;
	getdate(year,month,day);
	printf("AceptarVenta ID: %d - Slot: %d",playerid,slot);
    switch(slot)
    {
        case 0:
        {
            if(S_NIVEL >= PLAYER_INFO[playerid][@Nivel]) return SendClientMessage(playerid, -1, "Debes subir +1 nivel para poder aceptar esto.");
			if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No puedes recibir un arma si estas en un vehiculo.");
			if(armaofertada[playerid] == 16 && PLAYER_INFO[playerid][@Nivel] < 7) return SendClientMessage(playerid, -1, "Necesitas {EB0000}nivel 7{FFFFFF} para equipar esta arma."); // Granada
		 	if(armaofertada[playerid] == 27 && PLAYER_INFO[playerid][@Nivel] < 7) return SendClientMessage(playerid, -1, "Necesitas {EB0000}nivel 7{FFFFFF} para equipar esta arma."); // Escopeta de combate
   			if(armaofertada[playerid] == 30 && PLAYER_INFO[playerid][@Nivel] < 5) return SendClientMessage(playerid, -1, "Necesitas {EB0000}nivel 5{FFFFFF} para equipar esta arma."); // AK-47
   			if(armaofertada[playerid] == 31 && PLAYER_INFO[playerid][@Nivel] < 5) return SendClientMessage(playerid, -1, "Necesitas {EB0000}nivel 5{FFFFFF} para equipar esta arma."); // M4
   			if(armaofertada[playerid] == 29 && PLAYER_INFO[playerid][@Nivel] < 4) return SendClientMessage(playerid, -1, "Necesitas {EB0000}nivel 4{FFFFFF} para equipar esta arma."); // MP5
   			if(armaofertada[playerid] == 24 && PLAYER_INFO[playerid][@Nivel] < 4) return SendClientMessage(playerid, -1, "Necesitas {EB0000}nivel 4{FFFFFF} para equipar esta arma."); // Desert Eagle
   			if(armaofertada[playerid] == 25 && PLAYER_INFO[playerid][@Nivel] < 3) return SendClientMessage(playerid, -1, "Necesitas {EB0000}nivel 3{FFFFFF} para equipar esta arma."); // Escopeta de madera
            if(armaofertada[playerid] == 33 && PLAYER_INFO[playerid][@Nivel] < 3) return SendClientMessage(playerid, -1, "Necesitas {EB0000}nivel 3{FFFFFF} para equipar esta arma."); // Rifle de caza
            if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ofrecio un arma.");
            if(IsPlayerInAnyVehicle(ofertador[playerid])) return SendClientMessage(playerid, COLOR_GAMEMODE,"La persona que te ha ofrecido el arma se encuentra en un vehiculo");
            if(PLAYER_INFO[playerid][jDinero] >= dineropedido[playerid])
            {
            	GetPlayerPos(ofertador[playerid], X,Y,Z);
            	if(!IsPlayerInRangeOfPoint(playerid, 5.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
            	{
            		if(!CheckArma(ofertador[playerid],armaofertada[playerid])) return SendClientMessage(playerid, COLOR_GAMEMODE,"El jugador ya no tiene el arma que te ha ofrecido");
            		new string[256],Query[200];
            		mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, arma, precio, comprador,fecha) VALUES ('%e','Arma', '%d','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],armaofertada[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
            		mysql_tquery(handle_db, Query);
            		QuitarDinero(playerid, dineropedido[playerid]);
            		DarArma(playerid,armaofertada[playerid]);
            		QuitarArma(ofertador[playerid],armaofertada[playerid]);
            		DarDinero(ofertador[playerid],dineropedido[playerid]);
            		format(string, 256, " %s recibe el arma de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[ofertador[playerid]][Nickname]);
            		ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
            		if(idTimerOfertaPerdida[playerid] != -1)
            		{
            			KillTimer(idTimerOfertaPerdida[playerid]);
            			idTimerOfertaPerdida[playerid] = -1;
            		}
            		if(idTimerTiempoVenta[ofertador[playerid]] != -1)
            		{
            			KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
            			idTimerTiempoVenta[ofertador[playerid]] = -1;
            		}
            		armaofertada[playerid] = 0;
            		dineropedido[playerid] = 0;
            		ofertador[playerid] = INVALID_PLAYER_ID;
            	}
            }
            else SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        }
        case 1:
        {
        	if(PLAYER_INFO[playerid][Agonizando] == 1 && Muriendo[playerid] == 1)
        	{
        		PLAYER_TEMP[playerid][@pHospital] = 1;
        		ApareceHospital(playerid),		Muriendo[playerid] = 0;
        		MarcadoMedicos[playerid] = 0,	LlamadaMedicos[playerid] = 0;
        		TimerMalherido[playerid] = 0,	suicidio[playerid] = 0;
        	}
            else SendClientMessage(playerid, COLOR_GAMEMODE, "No puedes hacer esto ahora mismo.");
        }
        case 2:
        {
            if(S_NIVEL >= PLAYER_INFO[playerid][@Nivel]) return SendClientMessage(playerid, -1, "Debes subir +1 nivel para poder aceptar esto.");
       		GetPlayerPos(ofertador[playerid], X,Y,Z);
			if(ofertador[playerid] == INVALID_PLAYER_ID) return 1;
        	if(LeOfreci[ofertador[playerid]] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_WHITE, "Esta oferta ya ha caducado.");
        	if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ha ofrecido Totems");
        	if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        	if(!IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        	if(PLAYER_INFO[ofertador[playerid]][Totems] < EVOfrecidos[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"El vendedor ya no tiene la cantidad de Totems que te ha ofrecido");
        	if(EVOfrecidos[playerid] > 0)
        	{
        		new pName[32],pName2[32],string[256],Query[200];
        		GetPlayerName(ofertador[playerid], pName, 32);
        		GetPlayerName(playerid, pName2, 32);
        		mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%s','totems', '%d','%d','%s','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],EVOfrecidos[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        		mysql_tquery(handle_db, Query);
        		QuitarDinero(playerid,dineropedido[playerid]);
        		DarDinero(ofertador[playerid],dineropedido[playerid]);
        		PLAYER_INFO[playerid][Totems] += EVOfrecidos[playerid];
        		PLAYER_INFO[ofertador[playerid]][Totems] -= EVOfrecidos[playerid];
        		format(string, 256, " %s recibio algo de %s",pName2,pName);
        		ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        		if(idTimerOfertaPerdida[playerid] != -1)
        		{
        			KillTimer(idTimerOfertaPerdida[playerid]);
        			idTimerOfertaPerdida[playerid] = -1;
        		}
        		if(idTimerTiempoVenta[ofertador[playerid]] != -1)
        		{
        			KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
        			idTimerTiempoVenta[ofertador[playerid]] = -1;
        		}
        		ofertador[playerid] = INVALID_PLAYER_ID;
        		EVOfrecidos[playerid] = 0;
        	}
        }
        case 3:
        {
            if(MConductor[playerid] > 2000 && PLAYER_INFO[playerid][@Nivel] == 1) return SendClientMessage(playerid, COLOR_GAMEMODE,"Al ser nivel 1 solo puedes gastar $2000 en reparaciones.");
        	if(AceptoRepara[playerid] == 1) return 1;
        	if(Mecanico[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ofrecio una reparacion.");
        	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_GAMEMODE,"Necesitas estar manejando el vehiculo que deseas que te reparen.");
        	if(PLAYER_INFO[playerid][jDinero] < MConductor[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero.");
        	GetPlayerPos(Mecanico[playerid], X,Y,Z);
        	if(IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z))
        	{
        		new string[200],Float:angle,autoid = GetPlayerVehicleID(playerid);
        		GetPlayerFacingAngle(Mecanico[playerid],angle);
        		SetPlayerFacingAngle(Mecanico[playerid],angle+180);
        		LoopingAnim(Mecanico[playerid],"CAR","Fixn_Car_Loop",4.1,0,0,0,1,15000);
        		switch(PLAYER_INFO[Mecanico[playerid]][pNivelMecanico])
        		{
        			case 1:  SetTimerEx("Reparando",15000,false,"dddd",Mecanico[playerid],playerid,autoid,1);
        			case 2:  SetTimerEx("Reparando",13000,false,"dddd",Mecanico[playerid],playerid,autoid,1);
        			case 3:  SetTimerEx("Reparando",9000,false,"dddd",Mecanico[playerid],playerid,autoid,1);
        			case 4:  SetTimerEx("Reparando",6000,false,"dddd",Mecanico[playerid],playerid,autoid,1);
        			default: SetTimerEx("Reparando",4000,false,"dddd",Mecanico[playerid],playerid,autoid,1);
        		}
        		TimerReparar[Mecanico[playerid]] = 5;
        		new msjadm[135];
        		format(msjadm, sizeof(msjadm), "%s (ID:%d) recibe $%s por reparar el vehiculo de %s (ID: %d - Nivel: %d - %dhs).", PLAYER_INFO[Mecanico[playerid]][Nickname], Mecanico[playerid], Numeros(MConductor[playerid]), PLAYER_INFO[playerid][Nickname], playerid, PLAYER_INFO[playerid][@Nivel], PLAYER_INFO[playerid][horasjugadas]);
        		MensajeAdmin(COLOR_YELLOW, msjadm, 3);
        		format(string, sizeof(string), "%s comienzo a reparar el vehiculo.", PLAYER_INFO[Mecanico[playerid]][Nickname]);
        		ProxDetector(30.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        		LlamadaMeca[playerid] = 0;
        		SetPlayerColor(playerid, COLORCARGO0);
        		QuitarDinero(playerid, MConductor[playerid]);
        		DarDinero(Mecanico[playerid], MConductor[playerid]);
        		PLAYER_INFO[Mecanico[playerid]][Repuestos] -= MRepuestos[Mecanico[playerid]];
        		Mecanico[playerid] = INVALID_PLAYER_ID;
        		AceptoRepara[playerid] = 1;
        	}
        	else return SendClientMessage(playerid, COLOR_GAMEMODE,"Debes estar cerca del mecanico para aceptar la reparacion.");
        }
        case 4:
        {
            if(TipoOferta[playerid] == 1)
        	{
        		GetPlayerPos(ofertador[playerid], X,Y,Z);
        		if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ofrecio un consumible.");
        		if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        		if(!IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        		if(PLAYER_INFO[ofertador[playerid]][pCrack] < CrackOfrecidos[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"El vendedor ya no tiene la cantidad de crack que te ha ofrecido");
        		if(CrackOfrecidos[playerid] > 0)
        		{
        			new string[256],Query[200];
        			mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%e','crack', '%d','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],CrackOfrecidos[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        			mysql_tquery(handle_db, Query);
        			QuitarDinero(playerid,dineropedido[playerid]);
        			DarDinero(ofertador[playerid],dineropedido[playerid]);
        			PLAYER_INFO[playerid][pCrack] += CrackOfrecidos[playerid];
        			TipoOferta[playerid] = 0;
        			PLAYER_INFO[ofertador[playerid]][pCrack] -= CrackOfrecidos[playerid];
        			format(string, 256, " %s recibio algo de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[ofertador[playerid]][Nickname]);
        			ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        			if(idTimerOfertaPerdida[playerid] != -1)
        			{
        				KillTimer(idTimerOfertaPerdida[playerid]);
        				idTimerOfertaPerdida[playerid] = -1;
        			}
        			if(idTimerTiempoVenta[ofertador[playerid]] != -1)
        			{
        				KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
        				idTimerTiempoVenta[ofertador[playerid]] = -1;
        			}
        			ofertador[playerid] = INVALID_PLAYER_ID;
        			CrackOfrecidos[playerid] = 0;
        		}
        	}
        	else if(TipoOferta[playerid] == 2)
        	{
        		if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ofrecio un consumible.");
        		GetPlayerPos(ofertador[playerid], X,Y,Z);
        		if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        		if(!IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        		if(PLAYER_INFO[ofertador[playerid]][pRemedios] < MedicamentosOfrecidos[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"El vendedor ya no tiene la cantidad de medicamentos que te ha ofrecido");
        		if(MedicamentosOfrecidos[playerid] > 0)
        		{
        			new string[256],Query[200];
        			mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%e','Medicamentos', '%d','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],MedicamentosOfrecidos[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        			mysql_tquery(handle_db, Query);
        			QuitarDinero(playerid,dineropedido[playerid]);
        			DarDinero(ofertador[playerid],dineropedido[playerid]);
        			TipoOferta[playerid] = 0;
        			PLAYER_INFO[playerid][pRemedios] += MedicamentosOfrecidos[playerid];
        			PLAYER_INFO[ofertador[playerid]][pRemedios] -= MedicamentosOfrecidos[playerid];
        			format(string, 256, " %s recibio algo de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[ofertador[playerid]][Nickname]);
        			ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        			if(idTimerOfertaPerdida[playerid] != -1)
        			{
        				KillTimer(idTimerOfertaPerdida[playerid]);
        				idTimerOfertaPerdida[playerid] = -1;
        			}
        			if(idTimerTiempoVenta[ofertador[playerid]] != -1)
        			{
        				KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
        				idTimerTiempoVenta[ofertador[playerid]] = -1;
        			}
        			ofertador[playerid] = INVALID_PLAYER_ID;
        			MedicamentosOfrecidos[playerid] = 0;
        		}
        	}
        	else if(TipoOferta[playerid] == 3)
        	{
        		if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ofrecio un consumible.");
        		GetPlayerPos(ofertador[playerid], X,Y,Z);
        		if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        		if(!IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        		if(PLAYER_INFO[ofertador[playerid]][pMarihuana] < MarihuanaOfrecida[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"El vendedor ya no tiene la cantidad de marihuana que te ha ofrecido");
        		if(MarihuanaOfrecida[playerid] > 0)
        		{
        			new string[256],Query[200];
        			mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%e','Marihuana', '%d','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],MarihuanaOfrecida[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        			mysql_tquery(handle_db, Query);
        			QuitarDinero(playerid,dineropedido[playerid]);
        			TipoOferta[playerid] = 0;
        			DarDinero(ofertador[playerid],dineropedido[playerid]);
        			PLAYER_INFO[playerid][pMarihuana] += MarihuanaOfrecida[playerid];
        			PLAYER_INFO[ofertador[playerid]][pMarihuana] -= MarihuanaOfrecida[playerid];
        			format(string, 256, " %s recibio algo de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[ofertador[playerid]][Nickname]);
        			ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        			if(idTimerOfertaPerdida[playerid] != -1)
        			{
        				KillTimer(idTimerOfertaPerdida[playerid]);
        				idTimerOfertaPerdida[playerid] = -1;
        			}
        			if(idTimerTiempoVenta[ofertador[playerid]] != -1)
        			{
        				KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
        				idTimerTiempoVenta[ofertador[playerid]] = -1;
        			}
        			ofertador[playerid] = INVALID_PLAYER_ID;
        			MarihuanaOfrecida[playerid] = 0;
        		}
        	}
        	else if(TipoOferta[playerid] == 4)
        	{
        		if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ofrecio un consumible.");
        		GetPlayerPos(ofertador[playerid], X,Y,Z);
        		if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        		if(!IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        		if(PLAYER_INFO[ofertador[playerid]][pLSD] < MarihuanaOfrecida[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"El vendedor ya no tiene la cantidad de marihuana que te ha ofrecido");
        		if(LSDOfrecidos[playerid] > 0)
        		{
        			new string[256],Query[200];
        			mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%e','Marihuana', '%d','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],MarihuanaOfrecida[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        			mysql_tquery(handle_db, Query);
        			QuitarDinero(playerid,dineropedido[playerid]);
        			TipoOferta[playerid] = 0;
        			DarDinero(ofertador[playerid],dineropedido[playerid]);
        			PLAYER_INFO[playerid][pLSD] += LSDOfrecidos[playerid];
        			PLAYER_INFO[ofertador[playerid]][pLSD] -= LSDOfrecidos[playerid];
        			format(string, 256, " %s recibio algo de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[ofertador[playerid]][Nickname]);
        			ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        			if(idTimerOfertaPerdida[playerid] != -1)
        			{
        				KillTimer(idTimerOfertaPerdida[playerid]);
        				idTimerOfertaPerdida[playerid] = -1;
        			}
        			if(idTimerTiempoVenta[ofertador[playerid]] != -1)
        			{
        				KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
        				idTimerTiempoVenta[ofertador[playerid]] = -1;
        			}
        			ofertador[playerid] = INVALID_PLAYER_ID;
        			LSDOfrecidos[playerid] = 0;
        		}
        	}
        	else if(TipoOferta[playerid] == 5)
        	{
        		if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ofrecio un consumible.");
        		GetPlayerPos(ofertador[playerid], X,Y,Z);
        		if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        		if(!IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        		if(PLAYER_INFO[ofertador[playerid]][pKrippy] < MarihuanaOfrecida[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"El vendedor ya no tiene la cantidad de marihuana que te ha ofrecido");
        		if(KrippyOfrecidos[playerid] > 0)
        		{
        			new string[256],Query[200];
        			mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%e','Marihuana', '%d','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],MarihuanaOfrecida[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        			mysql_tquery(handle_db, Query);
        			QuitarDinero(playerid,dineropedido[playerid]);
        			TipoOferta[playerid] = 0;
        			DarDinero(ofertador[playerid],dineropedido[playerid]);
        			PLAYER_INFO[playerid][pKrippy] += KrippyOfrecidos[playerid];
        			PLAYER_INFO[ofertador[playerid]][pKrippy] -= KrippyOfrecidos[playerid];
        			format(string, 256, " %s recibio algo de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[ofertador[playerid]][Nickname]);
        			ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        			if(idTimerOfertaPerdida[playerid] != -1)
        			{
        				KillTimer(idTimerOfertaPerdida[playerid]);
        				idTimerOfertaPerdida[playerid] = -1;
        			}
        			if(idTimerTiempoVenta[ofertador[playerid]] != -1)
        			{
        				KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
        				idTimerTiempoVenta[ofertador[playerid]] = -1;
        			}
        			ofertador[playerid] = INVALID_PLAYER_ID;
        			KrippyOfrecidos[playerid] = 0;
        		}
        	}
        	else
        	{
        		if(TipoOferta[playerid] == 4 && TieneSprunk[Ofertante[playerid]] == 0) return SendClientMessage(playerid, COLOR_GAMEMODE,"El jugador ya no tiene Sprunk.");
        		if(TipoOferta[playerid] == 5 && TieneVino[Ofertante[playerid]] == 0) return SendClientMessage(playerid, COLOR_GAMEMODE,"El jugador ya no tiene una copa de vino.");
        		if(TipoOferta[playerid] == 6 && TieneCerveza[Ofertante[playerid]] == 0) return SendClientMessage(playerid, COLOR_GAMEMODE,"El jugador ya no tiene cerveza.");
        		if(TipoOferta[playerid] == 4)   {	TieneSprunk[playerid] = SprunkOfrecido[playerid];   }
        		if(TipoOferta[playerid] == 5)   {	TieneVino[playerid] = SprunkOfrecido[playerid];   }
        		if(TipoOferta[playerid] == 6)   {	TieneCerveza[playerid] = SprunkOfrecido[playerid];   }
        		new string[128];
        		ClearAnimations(Ofertante[playerid]);
        		new str[128];
        		switch(TipoOferta[playerid])
        		{
        			case 4: str = "sprunk",	DarSprunk(playerid, SprunkOfrecido[playerid]);
        			case 5: str = "copa de vino", DarVino(playerid, SprunkOfrecido[playerid]);
        			case 6: str = "cerveza",	DarCerveza(playerid, SprunkOfrecido[playerid]);
        			default: return 1;
        		}
        		SprunkOfrecido[playerid] = 0,	TipoOferta[playerid] = 0;
        		SetPlayerSpecialAction(Ofertante[playerid], SPECIAL_ACTION_NONE);
        		format(string, sizeof(string), "%s recibio un vaso de %s de %s", PLAYER_INFO[playerid][Nickname],str, PLAYER_INFO[Ofertante[playerid]][Nickname]);
        		ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        		Ofertante[playerid] = -1;
        	}
        }
        case 5:
        {
            GetPlayerPos(ofertador[playerid], X,Y,Z);
        	if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ofrecio piezas de armas");
        	if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        	if(!IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        	if(PLAYER_INFO[ofertador[playerid]][pMateriales] < PiezasOfrecidas[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"El vendedor ya no tiene la cantidad de piezas de armas que te ha ofrecido");
        	if(PiezasOfrecidas[playerid] > 0)
        	{
        		new string[256],Query[200];
        		mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%e','piezas', '%d','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],PiezasOfrecidas[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        		mysql_tquery(handle_db, Query);
        		QuitarDinero(playerid,dineropedido[playerid]);
        		DarDinero(ofertador[playerid],dineropedido[playerid]);
        		PLAYER_INFO[playerid][pMateriales] += PiezasOfrecidas[playerid];
        		PLAYER_INFO[ofertador[playerid]][pMateriales] -= PiezasOfrecidas[playerid];
        		format(string, 256, " %s recibio algo de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[playerid][Nickname]);
        		ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        		if(idTimerOfertaPerdida[playerid] != -1)
        		{
        			KillTimer(idTimerOfertaPerdida[playerid]);
        			idTimerOfertaPerdida[playerid] = -1;
        		}
        		if(idTimerTiempoVenta[ofertador[playerid]] != -1)
        		{
        			KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
        			idTimerTiempoVenta[ofertador[playerid]] = -1;
        		}
        		ofertador[playerid] = INVALID_PLAYER_ID;
        		PiezasOfrecidas[playerid] = 0;
        	}
        }
        case 6:
        {
            GetPlayerPos(ofertador[playerid], X,Y,Z);
        	if(ofertador[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"Nadie te ha ofrecido "SERVER_COIN2"");
        	if(LeOfreci[ofertador[playerid]] ==INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_WHITE, "Esta oferta ya ha caducado.");
        	if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        	if(!IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z)) return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        	if(PLAYER_INFO[ofertador[playerid]][Moneda] < EVOfrecidos[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"El vendedor ya no tiene la cantidad de "SERVER_COIN" que te ha ofrecido");
        	if(EVOfrecidos[playerid] > 0)
        	{
        		new string[256],Query[200];
        		mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%e','"SERVER_COIN"', '%d','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[ofertador[playerid]][Nickname],EVOfrecidos[playerid],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        		mysql_tquery(handle_db, Query);
        		QuitarDinero(playerid,dineropedido[playerid]);
        		DarDinero(ofertador[playerid],dineropedido[playerid]);
        		PLAYER_INFO[playerid][Moneda] += EVOfrecidos[playerid];
        		PLAYER_INFO[ofertador[playerid]][Moneda] -= EVOfrecidos[playerid];
        		format(string, 256, "%s recibio algo de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[ofertador[playerid]][Nickname]);
        		ProxDetector(15.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        		if(idTimerOfertaPerdida[playerid] != -1)
        		{
        			KillTimer(idTimerOfertaPerdida[playerid]);
        			idTimerOfertaPerdida[playerid] = -1;
        		}
        		if(idTimerTiempoVenta[ofertador[playerid]] != -1)
        		{
        			KillTimer(idTimerTiempoVenta[ofertador[playerid]]);
        			idTimerTiempoVenta[ofertador[playerid]] = -1;
        		}
        		ofertador[playerid] = INVALID_PLAYER_ID;
        		EVOfrecidos[playerid] = 0;
        	}
        }
        case 7:
        {
            if(GuardaEspalda[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GAMEMODE,"No te han ofrecido ninguna proteccion");
        	GetPlayerPos(GuardaEspalda[playerid], X,Y,Z);
        	if(PLAYER_INFO[playerid][jDinero] < dineropedido[playerid]) return SendClientMessage(playerid, COLOR_GAMEMODE,"No tienes suficiente dinero");
        	if(IsPlayerInRangeOfPoint(playerid, 4.0, X,Y,Z))
        	{
        		new string[256],Query[200];
        		mysql_format(handle_db, Query, sizeof(Query), "INSERT INTO `log_ventas` (Vendedor, item, cantidad, precio, comprador,fecha) VALUES ('%e','Proteccion', '50','%d','%e','%02d/%02d/%02d')",PLAYER_INFO[GuardaEspalda[playerid]][Nickname],dineropedido[playerid],PLAYER_INFO[playerid][Nickname],day,month,year);
        		mysql_tquery(handle_db, Query);
        		QuitarDinero(playerid,dineropedido[playerid]);
        		DarDinero(GuardaEspalda[playerid],dineropedido[playerid]);

        		if(strcmp(PLAYER_INFO[GuardaEspalda[playerid]][Totem], PLAYER_INFO[playerid][Nickname], true) == 0 || strcmp(PLAYER_INFO[playerid][Totem], PLAYER_INFO[GuardaEspalda[playerid]][Nickname], true) == 0)
        		{
        			EstablecerChaleco(playerid, 70);
        		}
        		else EstablecerChaleco(playerid, 50);

        		format(string, sizeof(string), "%s recibe la proteccion de %s",PLAYER_INFO[playerid][Nickname],PLAYER_INFO[GuardaEspalda[playerid]][Nickname]);
        		ProxDetector(20.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);
        		GuardaEspalda[playerid] = INVALID_PLAYER_ID;
        		return 1;
        	}
        	else return SendClientMessage(playerid, COLOR_GAMEMODE,"No estas cerca del vendedor");
        }
        default: AbrirDialogAceptar(playerid);
    }
    if(ofertador[playerid] != INVALID_PLAYER_ID) ofertador[playerid] = INVALID_PLAYER_ID;
    return 1;
}
stock LimpiarOfertas(playerid)
{
	printf("[DEBUG] LimpiarOfertas %s[%d]",PLAYER_INFO[playerid][Nickname][playerid]);
    foreach(new i : Player)
    {
        if(IsPlayerConnected(i) && JugadorLogeado[i] == 1 && !IsPlayerNPC(playerid))
        {
           if(ofertador[i] == playerid)  
           {
               ofertador[i] = INVALID_PLAYER_ID;
           }
        }
    }
}