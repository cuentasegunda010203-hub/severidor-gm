stock MensajeAdmin(color, const string[],level)
{
	foreach(new i : Player)
	{
		if(PLAYER_INFO[i][pAdmin] >= level && VerAdmin[i] == 1) SendClientMessage(i, color, string);
	}
	//DCC_SendChannelMessage(discord_channel_id, string);
	return 1;
}
MensajeAdminEx(level, color, const form[], {Float, _}: ...)
{
	#pragma unused form
	static tmp[250];
	new t1 = level,t2 = color;
	const n4 = -4,n16 = -16,size = sizeof tmp;
	#emit stack 28
	#emit push.c size
	#emit push.c tmp
	#emit stack n4
	#emit sysreq.c format
	#emit stack n16
	return MensajeAdmin(t2, tmp, t1);
}
stock VerificarParlante(playerid)
{
    if(parlante[playerid] == 1)
    {
        format(parlanteURL[playerid], 256, "");
        if(IsValidDynamicObject(parlanteObject[playerid])) DestroyDynamicObject(parlanteObject[playerid]);
        if(IsValidDynamic3DTextLabel(LABELPARLANTE[playerid])) DestroyDynamic3DTextLabel(LABELPARLANTE[playerid]);
        foreach(new i : Player)
        {
            if(IsPlayerConnected(i))
            {
                if(parlantePlayer[i] == playerid)
                {
                    parlanteStream[i] = 0;
                    parlantePlayer[i] = -1;
                    StopAudioStreamForPlayer(i);
                    SendClientMessage(i, COLOR_GREY, " El creador del parlante se ha desconectado del servidor.");
                }
            }
        }
    }
    return 1;
}
stock Launcher(playerid)
{
    new Plataforma[30];
    if(IsPlayerMobile(playerid))
    {
        format(Plataforma,sizeof(Plataforma), "Android");
    }
    else format(Plataforma,sizeof(Plataforma), "PC");
    return Plataforma;
}
stock MostrarPingPlayer(giveplayerid,playerid)
{
    new day,month,year, hour, minute, second;
    gettime(hour,minute,second);
    getdate(year,month,day);
    if (!IsPlayerConnected(giveplayerid)) SendClientMessage(playerid,COLOR_WHITE,"No se encontró ningún jugador.");
    else
    {
        new score = GetPlayerScore(giveplayerid);
        if(score == 0 || IsPlayerNPC(giveplayerid)) SendClientMessage(playerid, -1, "El jugador está conectado pero aún no ha ingresado al juego.");
        else
        {
            if(giveplayerid == playerid)    {
                SendClientMessageEx(playerid, -1, "El jugador {00CCFF}%s{FFFFFF} tiene el ID: {FF0000}%d{FFFFFF}. (Nivel: {e77d31}%d{FFFFFF}) (Plataforma: {e77d31}%s{FFFFFF})", PlayerName(giveplayerid), giveplayerid , PLAYER_INFO[giveplayerid][@Nivel], Launcher(giveplayerid));
                SendClientMessageEx(playerid, -1, "Detalles (Ping: %s | P: %.2f)", StringPing(playerid),NetStats_PacketLossPercent(playerid));
            }
            else if( giveplayerid != playerid)  {
                SendClientMessage(playerid,-1," ");
                SendClientMessageEx(playerid,-1,"{FFFFFF}Fecha y Hora Actual del Servidor: {fe8f8f}%02d/%02d/%02d %02d:%02d:%02d.", day,month,year,hour,minute,second);
                SendClientMessageEx(playerid, -1,"El jugador {00CCFF}%s{FFFFFF} tiene el ID: {FF0000}%d{FFFFFF}. (Nivel: {e77d31}%d{FFFFFF}) (Plataforma: {e77d31}%s{FFFFFF})", PlayerName(giveplayerid), giveplayerid , PLAYER_INFO[giveplayerid][@Nivel],Launcher(giveplayerid));
                SendClientMessageEx(playerid, -1, "Detalles (Ping: %s | P: %.2f | Cod: {AFAFAF}#%d{FFFFFF} | Ping propio: %s | FPS: %d)", StringPing(giveplayerid),NetStats_PacketLossPercent(giveplayerid),PLAYER_INFO[giveplayerid][pID],StringPing(playerid), GetPlayerFPS(giveplayerid));
            }
			new country[30],city[30];
			new plrIP[32];
			GetPlayerCountry(giveplayerid, country, sizeof(country));
			GetPlayerCity(giveplayerid, city, sizeof(city));
			GetPlayerIp(playerid, plrIP, sizeof(plrIP));
			if(strcmp("127.0.0.1", plrIP, true) == 0) format(country, sizeof(country), "Colombia");
			if(PLAYER_INFO[playerid][pAdmin] >= ADMIN_LEVEL_BANEOS) SendClientMessageEx(playerid,-1, "Pais Registrado: {46e800}%s{FFFFFF} | Conectado desde: {46e800}%s{FFFFFF}",country, city);

        }
    }
    return 1;
}
stock getPlayerIPData(playerid)
{
	new query[200];
	mysql_format(handle_db, query, sizeof query,"SELECT * FROM log_ingresos WHERE accountID = '%d' ORDER BY `ID` DESC LIMIT 1",PLAYER_INFO[playerid][pID]);
	mysql_tquery(handle_db, query, "getPlayerIPData2", "i",playerid);
}
function getPlayerIPData2(playerid)
{
    new content[64];
	if(cache_num_rows() > 0)
	{
		cache_get_value_name(0, "Pais", content);   format(PLAYER_TEMP[playerid][PaisActual],60,"%s",content);
		cache_get_value_name(0, "Ciudad", content);   format(PLAYER_TEMP[playerid][Ciudad],60,"%s",content);
		cache_get_value_name(0, "Host", content);   format(PLAYER_TEMP[playerid][ISP],60,"%s",content);
	}
	return 1;
}
stock BloqueoCuenta(playerid)
{
	new country[256],plrIP2[20];
	GetPlayerCountry(playerid, country, sizeof(country));
	GetPlayerIp(playerid, plrIP2, sizeof(plrIP2));
	if(strcmp("127.0.0.1", plrIP2, true) == 0)
	{
		format(country, sizeof(country), "Colombia");
		format(plrIP2, sizeof(plrIP2), "localhost");
	}
	if(PLAYER_INFO[playerid][pBloqueado] == 0)
	{

		if(strcmp(PLAYER_INFO[playerid][pPaisRegistro], country, true) != 0 && strcmp(country, "Unknown", true) != 0 && strcmp(PlayerIP(playerid), "127.0.0.1", true) != 0)
		{

			if(PLAYER_INFO[playerid][pAdmin] > ADMIN_LEVEL_DUDAS || PLAYER_INFO[playerid][pFaccion] == 1)
			{

				new string[126];
				if(PLAYER_INFO[playerid][pFaccion] == 1) format(string,sizeof(string),"El policia %s ingresó desde un pais diferente, su cuenta fue bloqueada.",PLAYER_INFO[playerid][Nickname]);
				else if(PLAYER_INFO[playerid][pAdmin] > 0) format(string,sizeof(string),"El %s %s ingresó al servidor desde un pais distinto, su cuenta fue bloqueada.",ADMIN_RANKS_FULLNAME[PLAYER_INFO[playerid][pAdmin]], PLAYER_INFO[playerid][Nickname]);
				MensajeAdmin(0xFFDBED15FF, string, ADMIN_LEVEL_ADM);
				format(string,sizeof(string),"Pais de registro: %s | Pais actual: %s",PLAYER_INFO[playerid][pPaisRegistro],country);
				MensajeAdmin(0xFFDBED15FF, string, ADMIN_LEVEL_ADM);
				PLAYER_INFO[playerid][pBloqueado] = 1;
				new Query[255];
				mysql_format(handle_db,Query,sizeof(Query),"UPDATE `usuarios` SET `Bloqueado`='1' WHERE `Username`='%e'",PLAYER_INFO[playerid][Nickname]);
				mysql_tquery(handle_db, Query);
				SendClientMessage(playerid,-1,"Atención: Su cuenta fue bloqueada por ingresar desde un pais distinto.");
				SendClientMessage(playerid,-1,"Contacte un administrador en https://"WEB_ROL"/foro/index.php para desbloquear su cuenta.");
				ExpulsarJugador(playerid,"Cuenta bloqueada.");
			}
		}
	}
}
stock InsertLog(playerid)
{
    new rpc[75 + 5],plrIP[48];
    GetPlayerIp(playerid, plrIP, sizeof(plrIP));
    format(rpc, sizeof rpc, "id=%d&ip=%s&name=%s&token=cacauate",PLAYER_INFO[playerid][pID],plrIP,PLAYER_INFO[playerid][Nickname]);
    HTTP(playerid, HTTP_POST, ""API_URL"/api/rpc.php", rpc, "");
}
stock GetPlayerID2(const playername[])
{
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i))
		{
			if(strcmp(PLAYER_INFO[i][Nickname],playername,true)==0) return i;
		}
	}
	return -1;
}
stock GetPlayerID(const playername[])
{
	new playerid = INVALID_PLAYER_ID;
    foreach(new i : Player)
    {
        if(!IsPlayerConnected(i)) continue;
		if(LoggedYet[i] == false) continue;
		if(strcmp(PLAYER_INFO[i][Nickname], playername, true) == 0)
		{
		    playerid = i;
		}
    }
    return playerid;
}
stock NombreInvalido(playerid)
{
    dialogs_ShowPlayerDialog(playerid, D_INMIGRACION, DIALOG_STYLE_INPUT, "Nombre inválido", "{fe8f8f}Departamento de inmigración:{FFFFFF} Tu nombre no es aceptable.\n{fe8f8f}Formato para el nombre:{FFFFFF} Nombre_Apellido\nPor favor introduzca su nuevo nombre.","Aceptar","");
    return 1;
}
stock TOPS(playerid, listitem)
{
    switch(listitem)
    {
        case 0:
        {
            mysql_tquery(handle_db, "SELECT * FROM `usuarios` WHERE `Asesinatos` > 0 ORDER BY Asesinatos DESC LIMIT 50", "LoadAsesinatos", "i",playerid);
        }
        case 1:
        {
            mysql_tquery(handle_db, "SELECT * FROM `facciones` WHERE `cuentaterris` > 10 ORDER BY cuentaterris DESC LIMIT 50", "LoadTopTerris", "i",playerid);
        }
        case 2:
        {
            mysql_tquery(handle_db, "SELECT * FROM `usuarios` WHERE `Money` > 3000000 ORDER BY Money DESC LIMIT 50", "LoadMillos", "i",playerid);
        }
        case 3:
        {
            mysql_tquery(handle_db, "SELECT * FROM `usuarios` WHERE `totems` > 500 ORDER BY totems DESC LIMIT 50", "LoadTopCoins", "i",playerid);
        }
        case 4:
        {
            mysql_tquery(handle_db, "SELECT * FROM `usuarios` WHERE `Muertes` > 10 ORDER BY Muertes DESC LIMIT 50", "LoadMuertes", "i",playerid);
        }
        case 5:
        {
            mysql_tquery(handle_db, "SELECT * FROM `usuarios` WHERE `arrestado` > 10 ORDER BY arrestado DESC LIMIT 50", "LoadArrestados", "i",playerid);           
        }
    }
    return 1;
}
function LoadArrestados(playerid)
{
	if(cache_num_rows() == 0) return ShowPlayerMessage(playerid, "~r~Sin registros.");
	new content[64],NameUser[35],Estado,dialogo[2500],UltimaC[50],Asesino;
	format(dialogo, sizeof dialogo, "{FFFFFF}Nombre\t{FFFFFF}Capturado\t{FFFFFF}Últ. conexión\n");
	for(new x; x < cache_num_rows(); x++ )
	{
	    cache_get_value_name(x, "Online", content);			Estado = strval(content);
		cache_get_value_name(x, "Conexion", content);		format(UltimaC,50,"%s",content);
		cache_get_value_name(x, "Username", content);		format(NameUser,35,"%s",content);
		cache_get_value_name(x, "arrestado", content);		Asesino = strval(content);
		if(Estado == 1) format(dialogo, sizeof dialogo,"%s%s\t%d Veces\t{98f442}Conectado{FFFFFF}\n",dialogo,NameUser,Asesino,UltimaC);
	 	else format(dialogo, sizeof dialogo,"%s%s\t%d Veces\t%s\n",dialogo,NameUser,Asesino,UltimaC);
		dialogs_ShowPlayerDialog(playerid, INVENTARIO, DIALOG_STYLE_TABLIST_HEADERS, ""SERVER_NAME" - {fd6f33}Top's", dialogo, "Opciones", "Cerrar");
	}
	return 1;
}
function LoadTopTerris(playerid)
{
	if(cache_num_rows() == 0) return ShowPlayerMessage(playerid, "~r~Sin registros.");
	new content[100],NameUser[100],dialogo[2500],UltimaC[50],Asesino;
	format(dialogo, sizeof dialogo, "{FFFFFF}Nombre\t{FFFFFF}Conquistas\t{FFFFFF}Líder\n");
	for(new x; x < cache_num_rows(); x++ )
	{
		cache_get_value_name(x, "Lider", content);		format(UltimaC,50,"%s",content);
		cache_get_value_name(x, "Nombre", content);		format(NameUser,100,"%s",content);
		cache_get_value_name(x, "cuentaterris", content);		Asesino = strval(content);
	 	format(dialogo, sizeof dialogo,"%s%s\t%d Territorios\t%s\n",dialogo,NameUser,Asesino,UltimaC);
		dialogs_ShowPlayerDialog(playerid, INVENTARIO, DIALOG_STYLE_TABLIST_HEADERS, ""SERVER_NAME" - {fd6f33}Top's", dialogo, "Opciones", "Cerrar");
	}
	return 1;
}
function LoadAsesinatos(playerid)
{
	if(cache_num_rows() == 0) return ShowPlayerMessage(playerid, "~r~Sin registros.");
	new content[64],NameUser[35],Estado,dialogo[2500],UltimaC[50],Asesino;
	format(dialogo, sizeof dialogo, "{FFFFFF}Nombre\t{FFFFFF}Kill's\t{FFFFFF}Últ. conexión\n");
	for(new x; x < cache_num_rows(); x++ )
	{
	    cache_get_value_name(x, "Online", content);			Estado = strval(content);
		cache_get_value_name(x, "Conexion", content);		format(UltimaC,50,"%s",content);
		cache_get_value_name(x, "Username", content);		format(NameUser,35,"%s",content);
		cache_get_value_name(x, "Asesinatos", content);		Asesino = strval(content);
		if(Estado == 1) format(dialogo, sizeof dialogo,"%s%s\t%d Asesinatos\t{98f442}Conectado{FFFFFF}\n",dialogo,NameUser,Asesino,UltimaC);
	 	else format(dialogo, sizeof dialogo,"%s%s\t%d Asesinatos\t%s\n",dialogo,NameUser,Asesino,UltimaC);
		dialogs_ShowPlayerDialog(playerid, INVENTARIO, DIALOG_STYLE_TABLIST_HEADERS, ""SERVER_NAME" - {fd6f33}Top's", dialogo, "Opciones", "Cerrar");
	}
	return 1;
}
function LoadTopCoins(playerid)
{
	if(cache_num_rows() == 0) return ShowPlayerMessage(playerid, "~r~Sin registros.");
	new content[64],NameUser[35],Estado,dialogo[2500],UltimaC[50],Asesino;
	format(dialogo, sizeof dialogo, "{FFFFFF}Nombre\t{FFFFFF}Totems\t{FFFFFF}Últ. conexión\n");
	for(new x; x < cache_num_rows(); x++ )
	{
	    cache_get_value_name(x, "Online", content);			Estado = strval(content);
		cache_get_value_name(x, "Conexion", content);		format(UltimaC,50,"%s",content);
		cache_get_value_name(x, "Username", content);		format(NameUser,35,"%s",content);
		cache_get_value_name(x, "totems", content);		Asesino = strval(content);
		if(Estado == 1) format(dialogo, sizeof dialogo,"%s%s\t%d\t{98f442}Conectado{FFFFFF}\n",dialogo,NameUser,Asesino,UltimaC);
	 	else format(dialogo, sizeof dialogo,"%s%s\t%d\t%s\n",dialogo,NameUser,Asesino,UltimaC);
		dialogs_ShowPlayerDialog(playerid, INVENTARIO, DIALOG_STYLE_TABLIST_HEADERS, ""SERVER_NAME" - {fd6f33}Top's", dialogo, "Opciones", "Cerrar");
	}
	return 1;
}
stock ActualizarVariablesVeh(playerid, v, slot)
{
	Veh_Data[v][vvID] = v;
	new extraid = playerid;
	switch(slot)
	{
		case 1:
		{
			Veh_Data[v][BDvID] = PLAYER_INFO[playerid][vID1];
			Veh_Data[v][PropID] = PLAYER_INFO[playerid][pID];
			Veh_Data[v][vModel] = PLAYER_INFO[playerid][vModelo];
			Veh_Data[v][vPos][0] = PLAYER_INFO[playerid][vX];
			Veh_Data[v][vPos][1] = PLAYER_INFO[playerid][vY];
			Veh_Data[v][vPos][2] = PLAYER_INFO[playerid][vZ];
			Veh_Data[v][vPos][3] = PLAYER_INFO[playerid][vA];
			Veh_Data[v][Color][0] = PLAYER_INFO[playerid][vColor1];
			Veh_Data[v][Color][1] = PLAYER_INFO[playerid][vColor2];
			Veh_Data[v][vInt] = PLAYER_INFO[playerid][vinterior];
			Veh_Data[v][vWorld] = PLAYER_INFO[playerid][vvw];
			Veh_Data[v][VidaVeh] = PLAYER_INFO[playerid][pVidaV];
			Veh_Data[v][MSlot][0] = PLAYER_INFO[extraid][vBaul];
			Veh_Data[v][MSlot][1] = PLAYER_INFO[extraid][vBaul2];
			Veh_Data[v][MSlot][2] = PLAYER_INFO[extraid][vBaul3];
			Veh_Data[v][MSlot][3] = PLAYER_INFO[extraid][vBaul4];
			Veh_Data[v][MSlot][4] = PLAYER_INFO[extraid][vBaul5];
			Veh_Data[v][MSlot][5] = PLAYER_INFO[extraid][vBaul6];
			Veh_Data[v][MSlot][6] = PLAYER_INFO[extraid][vBaul7];
			Veh_Data[v][MSlot][7] = PLAYER_INFO[extraid][vBaul8];
			Veh_Data[v][MSlot][8] = PLAYER_INFO[extraid][vBaul9];
			Veh_Data[v][MSlot][9] = PLAYER_INFO[extraid][vBaul10];
			format(Veh_Data[v][Patente],32,"%s",PLAYER_INFO[playerid][vpatente]);
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION] = PLAYER_INFO[playerid][vACELERACION];
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION_ACTIVE] = PLAYER_INFO[playerid][vACTIVE];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V] = PLAYER_INFO[playerid][vSALTO_V];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_1] = PLAYER_INFO[playerid][vSALTO_V_1];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_2] = PLAYER_INFO[playerid][vSALTO_V_2];
		}
		case 2:
		{
			Veh_Data[v][BDvID] = PLAYER_INFO[playerid][vID2];
			Veh_Data[v][PropID] = PLAYER_INFO[playerid][pID];
			Veh_Data[v][vModel] = PLAYER_INFO[playerid][vModelo2];
			Veh_Data[v][vPos][0] = PLAYER_INFO[playerid][v2X];
			Veh_Data[v][vPos][1] = PLAYER_INFO[playerid][v2Y];
			Veh_Data[v][vPos][2] = PLAYER_INFO[playerid][v2Z];
			Veh_Data[v][vPos][3] = PLAYER_INFO[playerid][v2A];
			Veh_Data[v][Color][0] = PLAYER_INFO[playerid][v2Color1];
			Veh_Data[v][Color][1] = PLAYER_INFO[playerid][v2Color2];
			Veh_Data[v][vInt] = PLAYER_INFO[playerid][v2interior];
			Veh_Data[v][vWorld] = PLAYER_INFO[playerid][v2vw];
			Veh_Data[v][VidaVeh] = PLAYER_INFO[playerid][pVidaV2];
			Veh_Data[v][MSlot][0] = PLAYER_INFO[extraid][v2Baul];
			Veh_Data[v][MSlot][1] = PLAYER_INFO[extraid][v2Baul2];
			Veh_Data[v][MSlot][2] = PLAYER_INFO[extraid][v2Baul3];
			Veh_Data[v][MSlot][3] = PLAYER_INFO[extraid][v2Baul4];
			Veh_Data[v][MSlot][4] = PLAYER_INFO[extraid][v2Baul5];
			Veh_Data[v][MSlot][5] = PLAYER_INFO[extraid][v2Baul6];
			Veh_Data[v][MSlot][6] = PLAYER_INFO[extraid][v2Baul7];
			Veh_Data[v][MSlot][7] = PLAYER_INFO[extraid][v2Baul8];
			Veh_Data[v][MSlot][8] = PLAYER_INFO[extraid][v2Baul9];
			Veh_Data[v][MSlot][9] = PLAYER_INFO[extraid][v2Baul10];
			format(Veh_Data[v][Patente],32,"%s",PLAYER_INFO[playerid][v2patente]);
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION] = PLAYER_INFO[playerid][v2ACELERACION];
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION_ACTIVE] = PLAYER_INFO[playerid][v2ACTIVE];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V] = PLAYER_INFO[playerid][v2SALTO_V];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_1] = PLAYER_INFO[playerid][v2SALTO_V_1];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_2] = PLAYER_INFO[playerid][v2SALTO_V_2];
		}
		case 3:
		{
			Veh_Data[v][BDvID] = PLAYER_INFO[playerid][vID3];
			Veh_Data[v][PropID] = PLAYER_INFO[playerid][pID];
			Veh_Data[v][vModel] = PLAYER_INFO[playerid][vModelo3];
			Veh_Data[v][vPos][0] = PLAYER_INFO[playerid][v3X];
			Veh_Data[v][vPos][1] = PLAYER_INFO[playerid][v3Y];
			Veh_Data[v][vPos][2] = PLAYER_INFO[playerid][v3Z];
			Veh_Data[v][vPos][3] = PLAYER_INFO[playerid][v3A];
			Veh_Data[v][Color][0] = PLAYER_INFO[playerid][v3Color1];
			Veh_Data[v][Color][1] = PLAYER_INFO[playerid][v3Color2];
			Veh_Data[v][vInt] = PLAYER_INFO[playerid][v3interior];
			Veh_Data[v][vWorld] = PLAYER_INFO[playerid][v3vw];
			Veh_Data[v][VidaVeh] = PLAYER_INFO[playerid][pVidaV3];
			Veh_Data[v][MSlot][0] = PLAYER_INFO[extraid][v3Baul];
			Veh_Data[v][MSlot][1] = PLAYER_INFO[extraid][v3Baul2];
			Veh_Data[v][MSlot][2] = PLAYER_INFO[extraid][v3Baul3];
			Veh_Data[v][MSlot][3] = PLAYER_INFO[extraid][v3Baul4];
			Veh_Data[v][MSlot][4] = PLAYER_INFO[extraid][v3Baul5];
			Veh_Data[v][MSlot][5] = PLAYER_INFO[extraid][v3Baul6];
			Veh_Data[v][MSlot][6] = PLAYER_INFO[extraid][v3Baul7];
			Veh_Data[v][MSlot][7] = PLAYER_INFO[extraid][v3Baul8];
			Veh_Data[v][MSlot][8] = PLAYER_INFO[extraid][v3Baul9];
			Veh_Data[v][MSlot][9] = PLAYER_INFO[extraid][v3Baul10];
			format(Veh_Data[v][Patente],32,"%s",PLAYER_INFO[playerid][v3patente]);
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION] = PLAYER_INFO[playerid][v3ACELERACION];
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION_ACTIVE] = PLAYER_INFO[playerid][v3ACTIVE];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V] = PLAYER_INFO[playerid][v3SALTO_V];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_1] = PLAYER_INFO[playerid][v3SALTO_V_1];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_2] = PLAYER_INFO[playerid][v3SALTO_V_2];			
		}
		case 4:
		{
			Veh_Data[v][BDvID] = PLAYER_INFO[playerid][vID4];
			Veh_Data[v][PropID] = PLAYER_INFO[playerid][pID];
			Veh_Data[v][vModel] = PLAYER_INFO[playerid][vModelo4];
			Veh_Data[v][vPos][0] = PLAYER_INFO[playerid][v4X];
			Veh_Data[v][vPos][1] = PLAYER_INFO[playerid][v4Y];
			Veh_Data[v][vPos][2] = PLAYER_INFO[playerid][v4Z];
			Veh_Data[v][vPos][3] = PLAYER_INFO[playerid][v4A];
			Veh_Data[v][Color][0] = PLAYER_INFO[playerid][v4Color1];
			Veh_Data[v][Color][1] = PLAYER_INFO[playerid][v4Color2];
			Veh_Data[v][vInt] = PLAYER_INFO[playerid][v4interior];
			Veh_Data[v][vWorld] = PLAYER_INFO[playerid][v4vw];
			Veh_Data[v][VidaVeh] = PLAYER_INFO[playerid][pVidaV4];
			Veh_Data[v][MSlot][0] = PLAYER_INFO[extraid][v4Baul];
			Veh_Data[v][MSlot][1] = PLAYER_INFO[extraid][v4Baul2];
			Veh_Data[v][MSlot][2] = PLAYER_INFO[extraid][v4Baul3];
			Veh_Data[v][MSlot][3] = PLAYER_INFO[extraid][v4Baul4];
			Veh_Data[v][MSlot][4] = PLAYER_INFO[extraid][v4Baul5];
			Veh_Data[v][MSlot][5] = PLAYER_INFO[extraid][v4Baul6];
			Veh_Data[v][MSlot][6] = PLAYER_INFO[extraid][v4Baul7];
			Veh_Data[v][MSlot][7] = PLAYER_INFO[extraid][v4Baul8];
			Veh_Data[v][MSlot][8] = PLAYER_INFO[extraid][v4Baul9];
			Veh_Data[v][MSlot][9] = PLAYER_INFO[extraid][v4Baul10];
			format(Veh_Data[v][Patente],32,"%s",PLAYER_INFO[playerid][v4patente]);
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION] = PLAYER_INFO[playerid][v4ACELERACION];
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION_ACTIVE] = PLAYER_INFO[playerid][v4ACTIVE];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V] = PLAYER_INFO[playerid][v4SALTO_V];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_1] = PLAYER_INFO[playerid][v4SALTO_V_1];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_2] = PLAYER_INFO[playerid][v4SALTO_V_2];				
		}
		case 5:
		{
			Veh_Data[v][BDvID] = PLAYER_INFO[playerid][vID5];
			Veh_Data[v][PropID] = PLAYER_INFO[playerid][pID];
			Veh_Data[v][vModel] = PLAYER_INFO[playerid][vModelo5];
			Veh_Data[v][vPos][0] = PLAYER_INFO[playerid][v5X];
			Veh_Data[v][vPos][1] = PLAYER_INFO[playerid][v5Y];
			Veh_Data[v][vPos][2] = PLAYER_INFO[playerid][v5Z];
			Veh_Data[v][vPos][3] = PLAYER_INFO[playerid][v5A];
			Veh_Data[v][Color][0] = PLAYER_INFO[playerid][v5Color1];
			Veh_Data[v][Color][1] = PLAYER_INFO[playerid][v5Color2];
			Veh_Data[v][vInt] = PLAYER_INFO[playerid][v5interior];
			Veh_Data[v][vWorld] = PLAYER_INFO[playerid][v5vw];
			Veh_Data[v][VidaVeh] = PLAYER_INFO[playerid][pVidaV5];
			Veh_Data[v][MSlot][0] = PLAYER_INFO[extraid][v5Baul];
			Veh_Data[v][MSlot][1] = PLAYER_INFO[extraid][v5Baul2];
			Veh_Data[v][MSlot][2] = PLAYER_INFO[extraid][v5Baul3];
			Veh_Data[v][MSlot][3] = PLAYER_INFO[extraid][v5Baul4];
			Veh_Data[v][MSlot][4] = PLAYER_INFO[extraid][v5Baul5];
			Veh_Data[v][MSlot][5] = PLAYER_INFO[extraid][v5Baul6];
			Veh_Data[v][MSlot][6] = PLAYER_INFO[extraid][v5Baul7];
			Veh_Data[v][MSlot][7] = PLAYER_INFO[extraid][v5Baul8];
			Veh_Data[v][MSlot][8] = PLAYER_INFO[extraid][v5Baul9];
			Veh_Data[v][MSlot][9] = PLAYER_INFO[extraid][v5Baul10];
			format(Veh_Data[v][Patente],32,"%s",PLAYER_INFO[playerid][v2patente]);
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION] = PLAYER_INFO[playerid][v5ACELERACION];
			GLOBAL_VEHICLES[v][gb_vehicle_ACELERACION_ACTIVE] = PLAYER_INFO[playerid][v5ACTIVE];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V] = PLAYER_INFO[playerid][v5SALTO_V];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_1] = PLAYER_INFO[playerid][v5SALTO_V_1];
			GLOBAL_VEHICLES[v][gb_vehicle_SALTO_V_2] = PLAYER_INFO[playerid][v5SALTO_V_2];				
		}
	}
	SetVehicleZAngle(v, Veh_Data[v][vPos][3]);
}
function LoadMillos(playerid)
{
	if(cache_num_rows() == 0) return ShowPlayerMessage(playerid, "~r~Sin registros.");
	new content[64],NameUser[35],Estado,dialogo[2500],UltimaC[50],Asesino;
	format(dialogo, sizeof dialogo, "{FFFFFF}Nombre\t{FFFFFF}Dinero\t{FFFFFF}Últ. conexión\n");
	for(new x; x < cache_num_rows(); x++ )
	{
	    cache_get_value_name(x, "Online", content);			Estado = strval(content);
		cache_get_value_name(x, "Conexion", content);		format(UltimaC,50,"%s",content);
		cache_get_value_name(x, "Username", content);		format(NameUser,35,"%s",content);
		cache_get_value_name(x, "Money", content);		Asesino = strval(content);
		if(Estado == 1) format(dialogo, sizeof dialogo,"%s%s\t$%d Dólares\t{98f442}Conectado{FFFFFF}\n",dialogo,NameUser,Asesino,UltimaC);
	 	else format(dialogo, sizeof dialogo,"%s%s\t$%d Dólares\t%s\n",dialogo,NameUser,Asesino,UltimaC);
		dialogs_ShowPlayerDialog(playerid, INVENTARIO, DIALOG_STYLE_TABLIST_HEADERS, ""SERVER_NAME" - {fd6f33}Top's", dialogo, "Opciones", "Cerrar");
	}
	return 1;
}
function LoadMuertes(playerid)
{
	if(cache_num_rows() == 0) return ShowPlayerMessage(playerid, "~r~Sin registros.");
	new content[64],NameUser[35],Estado,dialogo[2500],UltimaC[50],Asesino;
	format(dialogo, sizeof dialogo, "{FFFFFF}Nombre\t{FFFFFF}Abatido\t{FFFFFF}Últ. conexión\n");
	for(new x; x < cache_num_rows(); x++ )
	{
	    cache_get_value_name(x, "Online", content);			Estado = strval(content);
		cache_get_value_name(x, "Conexion", content);		format(UltimaC,50,"%s",content);
		cache_get_value_name(x, "Username", content);		format(NameUser,35,"%s",content);
		cache_get_value_name(x, "Muertes", content);		Asesino = strval(content);
		if(Estado == 1) format(dialogo, sizeof dialogo,"%s%s\t%d Veces\t{98f442}Conectado{FFFFFF}\n",dialogo,NameUser,Asesino,UltimaC);
	 	else format(dialogo, sizeof dialogo,"%s%s\t%d Veces\t%s\n",dialogo,NameUser,Asesino,UltimaC);
		dialogs_ShowPlayerDialog(playerid, INVENTARIO, DIALOG_STYLE_TABLIST_HEADERS, ""SERVER_NAME" - {fd6f33}Top's", dialogo, "Opciones", "Cerrar");
	}
	return 1;
}
stock ConexionMysql()
{
    // MySQL R41: datos del hosting en mysql.ini, sin recompilar.
    handle_db = mysql_connect_file("mysql.ini");
    if(handle_db != MYSQL_INVALID_HANDLE && mysql_errno(handle_db) == 0)
	{
        mysql_set_charset("latin1",handle_db);
		printf("---------------------------------------------------------");
		printf(" 	      "SERVER_NAME" - Versión v"SERVER_VERSION" ");
		printf("---------------------------------------------------------");
		SetTimer("AbrirLZ",25000,false);
        SetTimer("CargarBots",2000,false);
        SetTimer("cargartodo",2800, false);
        SetTimer("A_Reloj", 60000, true);
        SetTimer("TimerFC",5000,false);
	}
	else
	{

		npctoggle = 1;
		printf("|------------------------------------------|");
		printf("| Conexión fallida con la base de datos  |");
		printf("| El servidor se cerrará en 5 segundos...  |");
		printf("|------------------------------------------|");
		SetTimer("CerrarServidor",5000,false);
	}
}
stock LZ_AddStaticVehicleEx(model, Float:x, Float:y, Float:z, Float:a, color1, color2, time)
{
    if(model == 0) return false;
    new vehicle = AddStaticVehicleEx(model, x, y, z, a, color1, color2, time);
    ValidVeh[vehicle] = true;
    return vehicle;
}
stock LZ_CreateVehicle(model, Float:x, Float:y, Float:z, Float:a, color1, color2, time, siren = 0)
{
    if(model == 0) return false;
    new vehicle = CreateVehicle(model, x, y, z, a, color1, color2, time, siren);
    ValidVeh[vehicle] = true;
    return vehicle;
}
GetPosVehicleBootCamion( vehicleid, &Float:x, &Float:y, &Float:z )
{
    if(GetVehicleModel(vehicleid) < 400) return 1;
    new
    Float: angle,
    Float: distance;
    GetVehicleModelInfo( GetVehicleModel( vehicleid ), VEHICLE_MODEL_INFO_SIZE, x, distance, z );
    distance = ( distance / 2);
    GetVehiclePos( vehicleid, x, y, z );
    GetVehicleZAngle( vehicleid, angle );
    x += ( distance * floatsin( -angle + 195, degrees ) );
    y += ( distance * floatcos( -angle + 195, degrees ) );
    z += 0.05;
    return 1;
}
stock TirarArma(playerid)
{
    if(IsPlayerNPC(playerid)) return 1;
    if(JugadorLogeado[playerid] == 1)
    {
        new weaponid = GetPlayerWeapon(playerid), string[128];
        if(HasWeapon(playerid,weaponid) == 0) return SendClientMessage(playerid, -1, "No puedes tirar un arma que no tienes.");
        if(ArmaProhibida(playerid)) return KickPlayer(playerid, 0, "Armas prohibidas");
        if(Tirando_Recogiendo[playerid] == 1) return 1;
        if(IsPlayerInAnyVehicle(playerid)) return Notificador2(playerid, "No puedes usar este comando en un vehiculo.");
        if(EnCombate[playerid] == 1) return Notificador2(playerid,"No puedes tirar armas estando en combate.");
        if(weaponid != 0)
        {
            new f = MAX_ARMAS+1;
            for(new a=0;a<sizeof(ArmaObjeto);a++)
            {
                if(ArmaObjeto[a][Objeto_xyz][0] == 0.0)
                {
                    f=a;
                    break;
                }
            }
            if(f>MAX_ARMAS)return Notificador2(playerid, "No puede tirar item's en este momento, intente mas tarde!");

            new Weapname[32];
            format(string, sizeof(string), "%s tira un arma al piso *", NombreJugador(playerid));
            ProxDetector(30.0, playerid, string, COLOR_ACCIONES, COLOR_ACCIONES, COLOR_ACCIONES, COLOR_ACCIONES, COLOR_ACCIONES);
            ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0,0);
            GetWeaponName(weaponid, Weapname, sizeof(Weapname));
            format(string, sizeof(string), "((Notaras que es un(a) %s))", Weapname);
            ProxDetector(30.0, playerid, string, COLOR_VERDECLARO, COLOR_VERDECLARO, COLOR_VERDECLARO, COLOR_VERDECLARO, COLOR_VERDECLARO);

            new arma = GetPlayerWeapon(playerid);
            QuitarArma(playerid, arma);
            Tirando_Recogiendo[playerid] = 1;
            SetTimerEx("TirandoRecogiendo",3500,false,"d",playerid);
            PLAYER_TEMP[playerid][restriccion_mochila] += 10;
            ArmaObjeto[f][Objeto_Info][0] = weaponid;
            GetPlayerPos(playerid, ArmaObjeto[f][Objeto_xyz][0], ArmaObjeto[f][Objeto_xyz][1], ArmaObjeto[f][Objeto_xyz][2]);

            format(string, sizeof(string), "{9c7bba}%s\n{ffffff}Pulsa {d6abfd}'H'{ffffff} para recoger", Weapname);
            ArmaObjeto[f][LabelObject][0] = CreateDynamic3DTextLabel(string, 0xFFFFFF44, ArmaObjeto[f][Objeto_xyz][0], ArmaObjeto[f][Objeto_xyz][1], ArmaObjeto[f][Objeto_xyz][2]+0.25, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), -1, 10.0);//Arma
            ArmaObjeto[f][Objeto_id][0] = CreateDynamicObject(GunObjects[weaponid][0], ArmaObjeto[f][Objeto_xyz][0], ArmaObjeto[f][Objeto_xyz][1], ArmaObjeto[f][Objeto_xyz][2]-1, 93.7, 120.0, 120.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
            ArmaObjeto[f][oWorld][0] = GetPlayerVirtualWorld(playerid);
        }
    }
    return 1;
}
stock RecogerArma(playerid)
{
    if(IsPlayerNPC(playerid)) return 1;
    if(JugadorLogeado[playerid] == 1)
    {
        
        if(RecogeArmas[playerid] == 0)
        {
            if(EnCombate[playerid] == 1) return 1;
            new f = MAX_ARMAS+1;
            for(new a=0;a<sizeof(ArmaObjeto);a++)
            {
                if(GetPlayerVirtualWorld(playerid) == ArmaObjeto[a][oWorld][0] && IsPlayerInRangeOfPoint(playerid, 1.4, ArmaObjeto[a][Objeto_xyz][0], ArmaObjeto[a][Objeto_xyz][1], ArmaObjeto[a][Objeto_xyz][2]))
                {
                    f = a;
                    break;
                }
            }
            if(f > MAX_ARMAS) return 1;
            else
            {
                if(Tirando_Recogiendo[playerid] == 1) return 1;
                if(PLAYER_INFO[playerid][horasjugadas] < 2) return Notificador2(playerid, "Sólo puedes portar armas al tener 2 horas de juego.");
                new string[128];
				DestroyDynamicObject(ArmaObjeto[f][Objeto_id][0]);
                DestroyDynamic3DTextLabel(ArmaObjeto[f][LabelObject][0]);
				ArmaObjeto[f][Objeto_id][0] = -1;
                ArmaObjeto[f][Objeto_xyz][0] = 0.0;
                ArmaObjeto[f][Objeto_xyz][1] = 0.0;
                ArmaObjeto[f][Objeto_xyz][2] = 0.0;
                DarArma(playerid, ArmaObjeto[f][Objeto_Info][0]);
                Tirando_Recogiendo[playerid] = 1;
                SetTimerEx("TirandoRecogiendo",3500,false,"d",playerid);
                format(string, sizeof(string), "%s recoge un arma del suelo *", NombreJugador(playerid));
                ProxDetector(30.0, playerid, string, COLOR_ACCIONES, COLOR_ACCIONES, COLOR_ACCIONES, COLOR_ACCIONES, COLOR_ACCIONES);
                RecogeArmas[playerid] = 1;
                SetTimerEx("AutorizadoArmas",5000,false,"d",playerid);
                Notificador2(playerid,"Has recogido un arma, ten cuidado con la policia o militares.");
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0,0);
            }
        }
    }
    return 1;
}

funcion LevantarMano_Android(playerid,actor)
{
    KillTimer(PLAYER_TEMP[playerid][TimerRobar]);
    PLAYER_TEMP[playerid][TimerRobar] = SetTimerEx("LevantarMano_Android",1000,false,"dd",playerid,actor);
    new id;
    for(new i = 0; i < MAX_NPC_ROBOS; i++)
    {
        if(IsValidDynamicActor(actor))
        {
            if(actor == RoboTiendas[i][Actor])
            {
                id = RoboTiendas[i][rID];
            }
        }
    }
    if(RoboTiendas[id][TiendaRobada] > 0) return PLAYER_TEMP[playerid][PuedeRobar] = 0;
    if(PermiteRobar(playerid,id) == 0) return PLAYER_TEMP[playerid][PuedeRobar] = 0;
    for(new i = 0; i < MAX_NPC_ROBOS; i++)
    {
            if(IsValidDynamicActor(actor))
            {
                if(actor == RoboTiendas[i][Actor])
                {
                    RoboTiendas[id][RoboProceso] ++;
                    switch(RoboTiendas[id][RoboProceso])
                    {
                        case 1: { ApplyDynamicActorAnimation(actor,"PED", "handsup", 4.1, 0, 0, 0, 1, 0); }
                        case 3: { ApplyDynamicActorAnimation(actor,"MISC", "PLYR_SHKHEAD", 4.1, 0, 0, 0, 1, 0); }
                        case 5: { ApplyDynamicActorAnimation(actor,"CASINO", "Roulette_bet", 4.1, 1, 1, 1, 1, 1); }
                        case 12:
                        {
                            RoboTiendas[id][RoboProceso] = 0;
                            KillTimer(PLAYER_TEMP[playerid][TimerRobar]);
                            RobarTiendaTerminado(playerid,actor,id);
                        }
                    }
                }
            }
        }
    return 1;
}
stock VerificarAndroid(playerid)
{
    pFPSOld[playerid] = GetPlayerFPS(playerid);
}
stock ObtenerUbicacion(x,y,z)
{
	new location[MAX_ZONE_NAME];
	Get2DZone(location, MAX_ZONE_NAME, x,y,z);
	return location;
}
stock ObtenerUbicacionM(m)
{
	new location[MAX_ZONE_NAME];
	Get2DZone(location, MAX_ZONE_NAME, InfoMercado[m][mX],InfoMercado[m][mY],InfoMercado[m][mZ]);
	return location;	
}

funcion LMnegro(playerid) { return callcmd::mercado(playerid,"gps"); }

funcion LGasolineras(playerid)
{
    new TempConvert[900], ConteoGaso = -1;
    new dialog[115 * 15 + 1];
    dialog = "ID\tPropietario\tPrecio\tLitros\n";
    for(new i = 0; i < MAX_GASOLINERAS; i++)
	{
        if(Gasolineras[i][gaID] != 0)
		{
            if(ConteoGaso != -1)
			{
                format(TempConvert, sizeof(TempConvert), "\n%i\t%s\t%i"SERVER_COIN"\t%i.00L\n", Gasolineras[i][gaID],Gasolineras[i][gaNombre],Gasolineras[i][gPrecio],Gasolineras[i][gGasolina]);
            }
			else
			{
			    format(TempConvert, sizeof(TempConvert), "\n%i\t%s\t%i"SERVER_COIN"\t%i.00L\n", Gasolineras[i][gaID],Gasolineras[i][gaNombre],Gasolineras[i][gPrecio],Gasolineras[i][gGasolina]);
            }
            strcat(dialog, TempConvert);
            ConteoGaso++;
			PLAYER_TEMP[playerid][ListaGasolineras][ConteoGaso] = i;
        }
    }
    if(ConteoGaso != -1)
	{
        Dialog(playerid, D_Gbuscar, DIALOG_STYLE_TABLIST_HEADERS, "{D6E1EB}Gasolineras - Lista", dialog, "Buscar", "Salir");
    }
	else
	{
        Dialog(playerid, D_INVALIDO1, DIALOG_STYLE_MSGBOX, "{D6E1EB}Gasolineras - Información", "{F0F0F0}No se encontrarón Gasolineras.", "Aceptar", "");
    }
}
stock SetPlayerWantedLevelEx(playerid, level)
{
	if(IsPlayerMobile(playerid))
	{
		new str[128];
		format(str, sizeof(str), "~r~Tienes ~w~%d ~r~cargos policiales.", level);
		Notificador2(playerid, str);
	}
	else SetPlayerWantedLevel(playerid, level);
}
ShowPlayerMessage(playerid, const message[], tiempo = 5000)
{
    if(!IsPlayerConnected(playerid)) return 1;
	KillTimer(TimerMensaje[playerid]);
	new mensaje[250];
	format(mensaje, sizeof(mensaje),"%s",Desbug(message));
    OcultarAnuncios(playerid);
	PlayerTextDrawSetString(playerid, MensajeTD[playerid], mensaje);
	PlayerTextDrawShow(playerid, MensajeTD[playerid]);

	TimerMensaje[playerid] = SetTimerEx("HidePlayerMessage", tiempo, false, "i", playerid);
	//if(sound) PlayerPlaySoundEx(playerid, sound, 0.0, 0.0, 0.0);
	return 1;
}
//native STREAMER_TAG_3D_TEXT_LABEL:CreateDynamic3DTextLabel(const text[], color, Float:x, Float:y, Float:z, Float:drawdistance, attachedplayer = INVALID_PLAYER_ID, attachedvehicle = INVALID_VEHICLE_ID, testlos = 0, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_3D_TEXT_LABEL_SD, STREAMER_TAG_AREA:areaid = STREAMER_TAG_AREA:-1, priority = 0);
//native DestroyDynamic3DTextLabel(STREAMER_TAG_3D_TEXT_LABEL:id);
//native IsValidDynamic3DTextLabel(STREAMER_TAG_3D_TEXT_LABEL:id);
//native GetDynamic3DTextLabelText(STREAMER_TAG_3D_TEXT_LABEL:id, text[], maxtext = sizeof text);
//native UpdateDynamic3DTextLabelText(STREAMER_TAG_3D_TEXT_LABEL:id, color, const text[]);
/*ResetPlayerLabels()
{
	new conteo;
	for(new i = 0 ;	i < MAX_LABELS_PLAYERS; i++)
	{
		PLAYER_LABELS[i][LbValid] = false;
		PLAYER_LABELS[i][LbID] = 0;
		conteo++;
	}
	printf(">>Sistema de PlayerLabels cargado. (%d)",conteo);
}
ResetPlayerLabel(playerid)
{
	giPlayerStatus[playerid] = 0;	
}
VerifyPlayerLabel(playerid)
{
	switch(PLAYER_INFO[playerid][EstadoON])
	{
		case 1:
		{
			new stringranking[250];
			format(stringranking, sizeof(stringranking), "{F0525F}[%s] %s",Launcher(playerid), PLAYER_INFO[playerid][pEstadoX]);
			CreatePlayerLabel(playerid, stringranking, COLOR_GAMEMODE);
		}
		default:
		{
			SendClientMessageEx(playerid, COLOR_GAMEMODE, "Ahora puedes usar /estado, recuerda colocar una descripcion a tu personaje respetando las /reglas.");
		}
	}
}
CountPlayerLabels()
{
	new L_Valid = 0;
	for(new i = 0 ;i < MAX_LABELS_PLAYERS; i++)
	{
		if(PLAYER_LABELS[i][LbValid] == true && !IsValidDynamic3DTextLabel(PLAYER_LABELS[i][LbID]))
		{
			L_Valid++;
		}
	}
	return L_Valid;
}
CreatePlayerLabel(playerid, const string[], color = COLOR_GAMEMODE)
{
	if(IsPlayerConnected(playerid) && JugadorLogeado[playerid] != 0)
	{
		if(giPlayerStatus[ playerid ] == 0)
		{
			new L_Valid = -1;
			for(new i = 0 ;i < MAX_LABELS_PLAYERS; i++)
			{
				if(PLAYER_LABELS[i][LbValid] == false && PLAYER_LABELS[i][LbID] > 0)
				{
					L_Valid = i;
				}
			}
			PLAYER_LABELS[L_Valid][LbID] = CreateDynamic3DTextLabel(string, color, 1.0, 1.0, 1.0, 15.0, playerid, INVALID_VEHICLE_ID, 0, -1,-1, playerid);
			printf("Se ha creado un label ID: %d y asignado al jugador: %s[%d]",L_Valid,PLAYER_INFO[playerid][Nickname],playerid);
			giPlayerStatus[ playerid ] = L_Valid;
			PLAYER_LABELS[L_Valid][LbValid] = true;
		}
		else SendClientMessage(playerid, -1, "Ya tienes un estado creado.");
	}
}
DeletePlayerLabel(playerid)
{
	if(giPlayerStatus[playerid] > 0)
	{
		new L_Valid = giPlayerStatus[ playerid ];
		if(PLAYER_LABELS[L_Valid][LbValid] == true)
		{
			DestroyDynamic3DTextLabel(PLAYER_LABELS[L_Valid][LbID]);
			PLAYER_LABELS[L_Valid][LbValid] = false;
			PLAYER_LABELS[L_Valid][LbID] = 0;
		}
		giPlayerStatus[playerid] = 0;
	}	
}*/
function HidePlayerMessage(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        MostrarAnuncios(playerid);
        KillTimer(TimerMensaje[playerid]);
        PlayerTextDrawSetString(playerid, MensajeTD[playerid], "_");
        PlayerTextDrawHide(playerid, MensajeTD[playerid]);
    }
	return 1;
}
stock DestruirBarras(playerid)
{
	PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_TUNING_SHOP]);
    PlayerTextDrawDestroy(playerid, MensajeTD[playerid]);
    PlayerTextDrawDestroy(playerid, IndicacionesT[playerid]);
    PlayerTextDrawDestroy(playerid, CarreraPosicion[playerid]);
    PlayerTextDrawDestroy(playerid, RocasPT[playerid][0]);
    PlayerTextDrawDestroy(playerid, RocasPT[playerid][1]);
    PlayerTextDrawDestroy(playerid, RocasPT[playerid][3]);
    PlayerTextDrawDestroy(playerid, Pescar[playerid][0]);
    PlayerTextDrawDestroy(playerid, Pescar[playerid][1]);
    PlayerTextDrawDestroy(playerid, Pescar[playerid][2]);
    PlayerTextDrawDestroy(playerid, Pescar[playerid][3]);
    PlayerTextDrawDestroy(playerid, Textdraw0[playerid]);
    for(new i; i < 5; i++)
	{
		PlayerTextDrawDestroy(playerid, NotiConnect[playerid][i]);
	}
    for(new i; i < 8; i++)
	{
		PlayerTextDrawDestroy(playerid, FondoInvP[i][playerid]);
	}
    for(new i; i < 4; i++)
	{
		PlayerTextDrawDestroy(playerid, RoboCasas[playerid][i]);
	}
    for(new i; i < 3; i++)
	{
		PlayerTextDrawDestroy(playerid, CarreraT[playerid][i]);
	}
    PlayerTextDrawDestroy(playerid, TAXIMET2[playerid]);
    PlayerTextDrawDestroy(playerid, LogroTitulo[playerid]);
    PlayerTextDrawDestroy(playerid, LogroTexto1[playerid]);
    PlayerTextDrawDestroy(playerid, LogroTexto2[playerid]);
    PlayerTextDrawDestroy(playerid, LogroLinea[playerid]);
    PlayerTextDrawDestroy(playerid, LogroRueda[playerid]);
    PlayerTextDrawDestroy(playerid, LogroNumero[playerid]);
    PlayerTextDrawDestroy(playerid, MensajeBox[playerid]);
    TextDrawDestroy(PlayerBackGround[ _string ]);
    TextDrawDestroy(PlayerBackGround[ _button_close ]);
    TextDrawDestroy(PlayerBackGround[ _background ][ 0 ]);
    TextDrawDestroy(PlayerBackGround[ _background ][ 1 ]);
    PlayerTextDrawDestroy(playerid, LineasPutiNivel[playerid]);
    PlayerTextDrawDestroy(playerid, NewPlayerr[playerid]);
    PlayerTextDrawDestroy(playerid, AfinidadconX[playerid]);
    PlayerTextDrawDestroy(playerid, Radly[playerid]);
    return 1;
}
funcion SendSplitMessage(playerid, color, final[]) {
    new buffer[MAX_SPLITLENGTH + 10];
    new len = strlen(final);
    if(len > MAX_SPLITLENGTH) {
        new times = (len / MAX_SPLITLENGTH);
        for(new i = 0; i < times + 1; i++) {
            strdel(buffer, 0, MAX_SPLITLENGTH + 5);
            if(len - (i * MAX_SPLITLENGTH) > MAX_SPLITLENGTH) {
                strmid(buffer, final, MAX_SPLITLENGTH * i, MAX_SPLITLENGTH * (i + 1));
                if(!i) format(buffer, sizeof(buffer), "%s ...", buffer);
                else format(buffer, sizeof(buffer), "... %s ...", buffer);
            } else {
                strmid(buffer, final, MAX_SPLITLENGTH * i, len);
                format(buffer, sizeof(buffer), "... %s", buffer);
            }
            SendClientMessage(playerid, color, buffer);
        }
    } else {
        SendClientMessage(playerid, color, final);
    }
}
stock AvisoAPSA(const string[])
{
    foreach(new i : Player)
    {
        Notificador2(i,string);
    }
    return true;
}
GuardarGasolinera(g)
{
	orm_save(Gasolineras[g][ORM_ID]);
	return 1;
}
stock _MensajeRfac(member, color, string[])
{
	foreach(new i : Player)
	{
        if(PLAYER_INFO[i][pFaccion] == member)
        {
            SendSplitMessage(i, color, string);
        }	
	}
}
stock MostrarRutaFerry(playerid)
{
    Notificador2(playerid, "Te presentamos el puerto del Ferry, dónde podrás viajar cómodamente a un nuevo destino.");
    Notificador2(playerid, "El destino del ferry termina en Sleepy Ville, isla de minerales.");
    SetPlayerCameraPos(playerid, 2456.9370, -2252.8320, 39.5168);
    SetPlayerCameraLookAt(playerid, 2457.9407, -2252.8955, 39.2167);
    SetTimerEx("OcultarRutaFerry",10000,false,"d",playerid);
    return 1;
}
stock IsPlayerSpawned(playerid)
{
    new pState = GetPlayerState(playerid);
    return 0 <= playerid < MAX_PLAYERS && pState != PLAYER_STATE_NONE && pState != PLAYER_STATE_WASTED && pState != PLAYER_STATE_SPECTATING;
}
function TutorialPlayer(playerid, prog)
{
	new MaxProg = 10;
	if(IsPlayerConnected(playerid))
	{
		switch(prog)
		{
			case 0: ShowPlayerMessage(playerid, "~r~~h~Te explicaremos con más detalle cómo jugar en ~w~"NAME_LARGO"",7000);
			case 1: ShowPlayerMessage(playerid, "~r~~h~Puedes usar ~w~/gps ~r~~h~para encontrar lugares como la ~w~tienda exclusiva",7000);
			case 2: ShowPlayerMessage(playerid, "~r~~h~Puedes hablar por ~w~Twitter ~r~~h~obteniendo un teléfono en el 24/7. Usa /twt para mas información.",7000);
			case 3: ShowPlayerMessage(playerid, "~b~~h~Consigue totems o monedas "SERVER_COIN" en trabajos como ~w~Granjero, Basurero, Minero~b~~h~.",7000);
			case 4: ShowPlayerMessage(playerid, "~b~~h~En ~w~"NAME_LARGO" ~b~~h~podrás tunear tus vehículos y venderlos a otro usuario.",7000);
			case 5: ShowPlayerMessage(playerid, "~b~~h~Tenemos variedad de trabajos, puedes verlos en ~w~/ayuda",7000);
			case 6: ShowPlayerMessage(playerid, "~g~~h~Crear multiples cuentas para beneficio propio es motivo de expulsion.",7000);
			case 7: ShowPlayerMessage(playerid, "~g~~h~Incluso puedes comprar items, vehiculos, vip desde nuestro ~w~/discord ~g~~h~y ~w~/web~g~~h~.",7000);
			case 8: ShowPlayerMessage(playerid, "~g~~h~También te facilitamos un ingreso sin contraseña al verificar que ingresas desde tu casa.",7000);
			case 9: ShowPlayerMessage(playerid, "~y~~h~Tan sólo te hemos dado el conocimiento de una cuarta parte de lo que encontrarás en ~w~"NAME_LARGO"",7000);
			case 10: ShowPlayerMessage(playerid, "~y~~h~Los circulos muestran tu vida, chaleco, hambre y sed.",7000);
			default: ShowPlayerMessage(playerid, "~y~~h~Échale un vistazo a tu inventario con la tecla ~w~N~y~~h~. ES HORA DE LLENAR TU INVENTARIO.",7000);
		}
		if(MaxProg >= prog) SetTimerEx("TutorialPlayer",7000,false,"dd",playerid,prog+1);
		CrearNotificacion(playerid,"hud:radar_ryder","~b~~h~Mision:~w~ Compra un telefono y un radio en el 24/7",2,0xFFFFFFDD,0x000000FF,0,110,0,9);
		CrearNotificacion(playerid,"hud:radar_ryder","~b~~h~Mision:~w~ Puedes ver tu ~b~inventario~w~ Pulsando la tecla ~r~N.",2,0xFFFFFFDD,0x000000FF,0,110,0,9);
		CrearNotificacion(playerid,"hud:radar_ryder","~b~~h~Mision:~w~ Consigue un trabajo para aumentar tu nivel.",2,0xFFFFFFDD,0x000000FF,0,110,0,9);
	}
}
stock DarDineroBanco(playerid, cantidad)
{
	PLAYER_INFO[playerid][pBanco] += cantidad;
	ActualizarBanco(playerid);
}
stock RutaGasolinera(g, playerid)
{
    Descongelar(playerid);
    PUSH(playerid, "Punto de descarga marcado");
    rtatrucker[playerid] = 200;
    SetPlayerCheckpoint(playerid,Gasolineras[g][Poss2][0], Gasolineras[g][Poss2][1], Gasolineras[g][Poss2][2], 5.0);
    return 1;
}
funcion OcultarRutaFerry(playerid)
{
    SetCameraBehindPlayer(playerid);
    return 1;
}
funcion PagarGasolinera(playerid)
{
    new g = PLAYER_TEMP[playerid][CargaGasolinera];
    new total = Gasolineras[g][gMaxGasolina]-Gasolineras[g][gGasolina];
    if(PLAYER_INFO[playerid][jDinero] < total*5) return SendClientMessageEx(playerid, -1,"{"COLOR_GM"}No tienes suficiente dinero para llenar el tanque de esta gasolinera, Precio: {ffffff}${00FF00}%d",total*5),Descongelar(playerid);
    SendClientMessageEx(playerid, -1, "Llenaste el tanque con %d litros por {ff0000}-$%d.", total, total*5);
    SendClientMessageEx(playerid, -1, "El gobierno financió {00ff00}$%d y 5 Coins {ffffff}por la ruta realizada.",total*5/2);
    PLAYER_INFO[playerid][Totems] += 5;
    QuitarDinero(playerid, total*5/2);
    Gasolineras[g][gGasolina] = Gasolineras[g][gMaxGasolina];
    new gasolineraxd[256];
    format(gasolineraxd, sizeof gasolineraxd, "{FFFFFF}Pulsa {DBED15}'H'{FFFFFF} para abrir el menú de opciones.\nPrecio: {00CC00}$%d{FFFFFF} cada litro\nCantidad de combustible: %d/%d", Gasolineras[g][gPrecioL], Gasolineras[g][gGasolina], Gasolineras[g][gMaxGasolina]);
    UpdateDynamic3DTextLabelText(Gasolineras[g][gTexto],0xFFFFFFAA, gasolineraxd);
    GuardarGasolinera(g);
    new rutero[128];
    format(rutero, sizeof(rutero), "~g~~h~[APSA] ~w~El camionero ~y~~h~%s~w~ ha completado su ruta exitosamente. Al parecer los robos de trailers acabaron.", PLAYER_INFO[playerid][Nickname]);
    foreach(new i : Player) Notificador2(i, rutero);
    Descongelar(playerid);
    return 1;
}
stock LlenarGasolinera(g, playerid)
{
    new total = Gasolineras[g][gMaxGasolina]-Gasolineras[g][gGasolina];
    if(PLAYER_INFO[playerid][jDinero] < total*5) return SendClientMessageEx(playerid, -1,"{"COLOR_GM"}No tienes suficiente dinero para llenar el tanque de esta gasolinera, Precio: {ffffff}${00FF00}%d",total*5),Descongelar(playerid);
    if(Gasolineras[g][gGasolina] == Gasolineras[g][gMaxGasolina]) return SendClientMessage(playerid, -1,"El tanque de esta gasolinera está lleno.");
    SendClientMessageEx(playerid, -1, "Llenaste el tanque con %d litros por $%d.", total, total*5);
    QuitarDinero(playerid, total*5);
    Gasolineras[g][gGasolina] = Gasolineras[g][gMaxGasolina];
    new gasolineraxd[256];
    format(gasolineraxd, sizeof gasolineraxd, "{FFFFFF}Pulsa {DBED15}'H'{FFFFFF} para abrir el menú de opciones.\nPrecio: {00CC00}$%d{FFFFFF} cada litro\nCantidad de combustible: %d/%d", Gasolineras[g][gPrecioL], Gasolineras[g][gGasolina], Gasolineras[g][gMaxGasolina]);
    UpdateDynamic3DTextLabelText(Gasolineras[g][gTexto],0xFFFFFFAA, gasolineraxd);
    GuardarGasolinera(g);
    return 1;
}
stock GetFreeSeat(vehicleid)
{
	new seat = -1;
	for(new i = 0; i < 4; i++)
    {
		if(!IsSeatTaken(vehicleid, i)) {
			seat = i;
			break;
		}
    }
	return seat;
}
function GameTextForPlayerEx(playerid, const cadena[], time, type)
{
	if(PLAYER_TEMP[playerid][IsAndroid] == 0) GameTextForPlayer(playerid, cadena, time, type);
	else ShowPlayerMessage(playerid, cadena, time);
	return 1;
}
stock LlenarBaulPatrullas(v)
{
    if(IsValidVehicle(v))
    {
        BaulPatrullas[v][M4] = MAX_ARMAS_P;
        BaulPatrullas[v][EDC] = MAX_ARMAS_P;
        BaulPatrullas[v][DK] = MAX_ARMAS_P;
        BaulPatrullas[v][SNIPER] = MAX_ARMAS_P;
        BaulPatrullas[v][PaloPolicia] = MAX_ARMAS_P;
    }
    return true;
}
stock RobarTiendaAndroid(playerid)
{
    new actor;
    for(new i = 0; i < MAX_NPC_ROBOS; i++)
    {
        actor = RoboTiendas[i][Actor];
        if(IsValidDynamicActor(actor))
        {
            new Float:x,Float:y,Float:z;
            GetDynamicActorPos(actor, x,y,z);
            if(IsPlayerInRangeOfPoint(playerid,10.0,x,y,z))
            {
                new vw = GetDynamicActorVirtualWorld(actor);
                if(vw == GetPlayerVirtualWorld(playerid))
                {
                    if(RoboTiendas[i][TiendaRobada] == 0)
                    {
                        RoboActual[playerid] = actor;
                        PLAYER_TEMP[playerid][PuedeRobar] = 1;
                        LevantarMano_Android(playerid,actor);
                    }
                }
            }
            else PLAYER_TEMP[playerid][PuedeRobar] = 0;
        }
    }
}
stock BaulPolice(playerid)
{
    new string[120];
    new patrulla = GetPlayerVehicleID(playerid);
    if(PLAYER_INFO[playerid][pDuty] != 1) return ShowPlayerMessage(playerid, "~r~Necesitas tener tu placa de servicio para usar el baúl.");
    if((PLAYER_INFO[playerid][pFaccion] == 1 || PLAYER_INFO[playerid][pFaccion] == 2))
    {
        if(SAPD(patrulla) || MILITARVEH(patrulla) || DEPORTIVOCOP(patrulla))
        {
            format(string, sizeof(string),"Chaleco de policia\n");
            format(string, sizeof(string),"%sBotiquin de policia\n",string);
            format(string, sizeof(string), "%sArmas",string);
            dialogs_ShowPlayerDialog(playerid, KITSAPD, DIALOG_STYLE_LIST, "Baul Patrulla", string, "Seleccionar", "Cancelar");
        }
        else return true;
    }
    return true;
}
stock MostrarArmasPatrulla(playerid)
{
    new string[600];
    new patrulla = GetPlayerVehicleID(playerid);
    new dialog[115 * 15 + 1];
    dialog = "Modelo\tCantidad\n";   
    if((PLAYER_INFO[playerid][pFaccion] == 1 || PLAYER_INFO[playerid][pFaccion] == 2))
    {
        if(SAPD(patrulla) || MILITARVEH(patrulla) || DEPORTIVOCOP(patrulla))
        {
            format(string, sizeof(string),"Modelo\tCantidad\n");
            format(string, sizeof(string),"%sM4\t%d\n",string, BaulPatrullas[patrulla][M4]);
            format(string, sizeof(string),"%sEscopeta de combate\t%d\n",string,BaulPatrullas[patrulla][EDC]);
            format(string, sizeof(string), "%sDesert eagle\t%d\n",string,BaulPatrullas[patrulla][DK]);
            format(string, sizeof(string), "%sSniper\t%d\n",string, BaulPatrullas[patrulla][SNIPER]);
            format(string, sizeof(string), "%sPalo\t%d\n",string,BaulPatrullas[patrulla][PaloPolicia]);
            dialogs_ShowPlayerDialog(playerid, DIALOG_A_PATRULLAS, DIALOG_STYLE_TABLIST_HEADERS, "Baul Patrulla", string, "Seleccionar", "Cancelar");
        }
        else return true;
    }
    return true;
}
stock BaulIlegal(playerid)
{
    new string[120];
    new vehicleid = GetPlayerVehicleID(playerid);
    if(IsAIlegal(playerid))
    {
        if(VehIlegal(vehicleid))
        {
            format(string, sizeof(string),"Chaleco | (1)\n");
            format(string, sizeof(string),"%sInyección de adrenalina | (1)\n",string);
            format(string, sizeof(string),"%sBalas de Goma | (10)\n",string);
            dialogs_ShowPlayerDialog(playerid, KIT_ILEGAL, DIALOG_STYLE_LIST, "Baul", string, "Seleccionar", "Cancelar");
        }
        else return true;
    }
    return true;   
}
stock VerTransmisionAPSA(playerid)
{
    if(Envivo == 0) return SendClientMessage(playerid, -1, "No hay ningún transmisión ahora");
    new string[120], conteo = 0;
    format(string, sizeof(string), "%s se ha unido al Envivo", PLAYER_INFO[playerid][Nickname]);
    EnviarMensajeApsa(string);
    new id = Envivo;
	if(PLAYER_TEMP[playerid][@Specteando] == 0)
	{
		GetPlayerPos(playerid,SpecX[playerid],SpecY[playerid],SpecZ[playerid]);
		SpecInt[playerid] = GetPlayerInterior(playerid);
		SpecVW[playerid] = GetPlayerVirtualWorld(playerid);
	}
	PLAYER_TEMP[playerid][@Specteando] = 1;
	SpecJugador[playerid] = id;
	Specteado[id] = 1;
	TogglePlayerSpectating(playerid, true);
	if(!IsPlayerInAnyVehicle(id))
	{
		SetPlayerInterior(playerid,GetPlayerInterior(id));
		SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(id));
		PlayerSpectatePlayer(playerid,id);
	}
	else
	{
		SetPlayerInterior(playerid,GetPlayerInterior(id));
		SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(id));
		PlayerSpectateVehicle(playerid,GetPlayerVehicleID(id));
	}
    ShowPlayerApsa(playerid);
    PLAYER_TEMP[playerid][ViendoApsa] = 1;
    foreach(new i : Player)
    {
        if(PLAYER_TEMP[i][ViendoApsa] == 1)
        {
            conteo++;
        }
    }
    PlayAudioStreamForPlayer(playerid,"http://"EMISORA_URL"?sid=100");
    format(string, sizeof(string), "En total hay %d viendo la transmisión", conteo);
    EnviarMensajeApsa(string);
    SendClientMessage(playerid, -1, "Usa {CCCC00}/terminar{ffffff} para dejar de ver la transmisión");
    return true;
}
stock ShowPlayerApsa(playerid)
{
    TextDrawShowForPlayer(playerid, APSA[0]);
    TextDrawShowForPlayer(playerid, APSA[1]);
    return true;
}
stock HidePlayerApsa(playerid)
{
    TextDrawHideForPlayer(playerid, APSA[0]);
    TextDrawHideForPlayer(playerid, APSA[1]);
    return true;
}
stock EnviarAlertaIlegal(playerid)
{
    new string[128];
    format(string, sizeof(string), "~r~%s ~w~ha cargado su camión en ~y~Hunter Quarry", PLAYER_INFO[playerid][Nickname]);
    foreach(new i : Player)
    {
        if(IsAIlegal(i))
        {
            ShowPlayerMessage(i, string);
        }
    }
    return true;
}
stock NoverApsa(playerid)
{
    if(PLAYER_TEMP[playerid][ViendoApsa] != 1) return SendClientMessage(playerid, -1, "No estás viendo ningúna transmisión");
	TogglePlayerSpectating(playerid, false);
	EstablecerChaleco(playerid, PLAYER_INFO[playerid][@Chaleco]);
	EstablecerVida(playerid, PLAYER_INFO[playerid][@Salud]);
	SpecJugador[playerid] = INVALID_PLAYER_ID;
	DarPrendas(playerid);
    PLAYER_TEMP[playerid][ViendoApsa] = 0;
    StopAudioStreamForPlayer(playerid);   
    HidePlayerApsa(playerid);
    return true;
}

funcion TerminarEnvivo()
{
    foreach(new i : Player)
    {
        if(PLAYER_TEMP[i][ViendoApsa] == 1)
        {
            TogglePlayerSpectating(i, false);
            PLAYER_TEMP[i][ViendoApsa] = 0;
            StopAudioStreamForPlayer(i);
            ShowPlayerMessage(i, "~r~(APSA) ~y~El envivo terminó, gracias por ver nuestro contenido.");
        }
    }
    Envivo = 0;
    EnvivoAutorizado = 0;
    return true;
}
stock ANTI_OPE(playerid)
{
	printf("[DEBUG] ANTI_OPE ejecutado por %s[%d]",PLAYER_INFO[playerid][Nickname],playerid);
	TogglePlayerControllable(playerid, 0);
	SetPVarInt(playerid, "IsFrozen", 0);
	SetTimerEx("AntiCJ",2000,false,"d",playerid);
	VWTemporal[playerid] = GetPlayerVirtualWorld(playerid);
	SetPlayerVirtualWorld(playerid, 99);
	EnAuto[playerid] = 0;
	SendClientMessage(playerid, COLOR_GAMEMODE, "Debes acercarte mas al vehiculo para poder subir.");
}
stock CambioEmail() //Cambios de correo y torneo carreras
{
    HTTP(1, HTTP_POST, ""API_URL"/api/puntos-diarios.php", "", "");
    HTTP(1, HTTP_POST, ""API_URL"/api/cambiocorreo_cpanel.php", "", "");
	HTTP(1, HTTP_POST, ""API_URL"/api/compras-paypal.php", "", ""); 
}
stock EnviarCorreo(playerid, tipo)
{
    new str[200];
    format(str, sizeof str, ""API_URL"/api/correos.php?playerid=%d&tipo=%d",PLAYER_INFO[playerid][pID],tipo);
    HTTP(playerid, HTTP_POST, str, "", "");
    return 1;
}
stock EnviarMensajeApsa(const text[])
{
    foreach(new i : Player)
    {
        if(PLAYER_INFO[i][EnApsa] == 1)
        {
            SendClientMessage(i, -1, text);
        }
    }
    return true;
}
stock OpcionesAPSA(playerid)
{
    new string[120], opciones[50];
    if(PLAYER_INFO[playerid][LiderApsa] > 0)
    {
        if(EnvivoAutorizado == 0) format(opciones, sizeof(opciones),"{FF0000}Sin autorizar");
        else format(opciones, sizeof(opciones),"{00CC00}Autorizado");
        format(string, sizeof(string),"Envivo: %s\n",opciones);

        if(Envivo == 0) format(opciones, sizeof(opciones),"{FF0000}Nadie");
        else format(opciones, sizeof(opciones),"{00CC00}%s",PLAYER_INFO[Envivo][Nickname]);
        format(string, sizeof(string),"%sTransmitiendo: %s\n",string,opciones);
        dialogs_ShowPlayerDialog(playerid, Opciones_Apsa, DIALOG_STYLE_LIST, "Config de APSA", string, "Seleccionar", "Cancelar");
    }
    return true;   
}

stock MostrarBaul(playerid, vid)
{
    new cont,titulo[128],mensaje[128];
    if(BAUL6(vid)) cont = 6;
    else if(BAUL8(vid)) cont = 8;
    else cont = 4;
    format(titulo,sizeof(titulo), "Maletero | %s", NombreAuto[GetVehicleModel(vid)-400]);
    if(cont == 6) 
    {
        format(mensaje, sizeof(mensaje), "%s\n%s\n%s\n%s\n%s\n%s",SlotBaul(vid, 1),SlotBaul(vid, 2),SlotBaul(vid, 3),SlotBaul(vid, 4),SlotBaul(vid, 5),SlotBaul(vid, 6));
    }
    if(cont == 8) 
    {
        format(mensaje, sizeof(mensaje), "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",SlotBaul(vid, 1),SlotBaul(vid, 2),SlotBaul(vid, 3),SlotBaul(vid, 4),SlotBaul(vid, 5),SlotBaul(vid, 6),SlotBaul(vid, 7),SlotBaul(vid, 8));
    }    
    if(cont == 4) 
    {
        format(mensaje, sizeof(mensaje), "%s\n%s\n%s\n%s",SlotBaul(vid, 1),SlotBaul(vid, 2),SlotBaul(vid, 3),SlotBaul(vid, 4));
    }
    dialogs_ShowPlayerDialog(playerid, D_BAUL, DIALOG_STYLE_LIST, titulo, mensaje, "Seleccionar","Cancelar");   
    PLAYER_TEMP[playerid][BaulSeleccionado] = vid; 
    return true;
}
stock CambiarSlots(slots)
{
    printf("Se cargaron %d",slots);
   // SetMaxPlayers(slots);
    return 1;
}
stock PUSH(playerid, const text_[])
{
	new mensaje[250];
	format(mensaje, sizeof(mensaje),"%s",Desbug(text_));
	if(IsPlayerConnected(playerid) && !IsPlayerNPC(playerid)) Notificador2(playerid, mensaje);
	return 1;
}
stock SetTextDrawAnuncioText(numerotel, texto[], tipo = 0)
{
	for(new len = strlen(texto), pos; pos < len; pos ++)
	{
		switch(texto[pos])
		{
			case 'à': texto[pos] = 151;
			case 'á': texto[pos] = 152;
			case 'â': texto[pos] = 153;
			case 'ä': texto[pos] = 154;
			case 'À': texto[pos] = 128;
			case 'Á': texto[pos] = 129;
			case 'Â': texto[pos] = 130;
			case 'Ä': texto[pos] = 131;
			case 'è': texto[pos] = 157;
			case 'é': texto[pos] = 158;
			case 'ê': texto[pos] = 159;
			case 'ë': texto[pos] = 160;
			case 'È': texto[pos] = 134;
			case 'É': texto[pos] = 135;
			case 'Ê': texto[pos] = 136;
			case 'Ë': texto[pos] = 137;
			case 'ì': texto[pos] = 161;
			case 'í': texto[pos] = 162;
			case 'î': texto[pos] = 163;
			case 'ï': texto[pos] = 164;
			case 'Ì': texto[pos] = 138;
			case 'Í': texto[pos] = 139;
			case 'Î': texto[pos] = 140;
			case 'Ï': texto[pos] = 141;
			case 'ò': texto[pos] = 165;
			case 'ó': texto[pos] = 166;
			case 'ô': texto[pos] = 167;
			case 'ö': texto[pos] = 168;
			case 'Ò': texto[pos] = 142;
			case 'Ó': texto[pos] = 143;
			case 'Ô': texto[pos] = 144;
			case 'Ö': texto[pos] = 145;
			case 'ù': texto[pos] = 169;
			case 'ú': texto[pos] = 170;
			case 'û': texto[pos] = 171;
			case 'ü': texto[pos] = 172;
			case 'Ù': texto[pos] = 146;
			case 'Ú': texto[pos] = 147;
			case 'Û': texto[pos] = 148;
			case 'Ü': texto[pos] = 149;
			case 'ñ': texto[pos] = 174;
			case 'Ñ': texto[pos] = 173;
			case '¡': texto[pos] = 64;
			case '¿': texto[pos] = 175;
			case '`': texto[pos] = 177;
			case '&': texto[pos] = 38;
			default:  texto[pos] = texto[pos];
		}
	}
	if(tipo == 1)
	{
		SendClientMessageToAll(0x006600FF, texto);
	}
	else 
	{
		for(new len = strlen(texto), pos; pos < len; pos ++)
		{
			switch(texto[pos])
			{
				case 'à': texto[pos] = 151;
				case 'á': texto[pos] = 152;
				case 'â': texto[pos] = 153;
				case 'ä': texto[pos] = 154;
				case 'À': texto[pos] = 128;
				case 'Á': texto[pos] = 129;
				case 'Â': texto[pos] = 130;
				case 'Ä': texto[pos] = 131;
				case 'è': texto[pos] = 157;
				case 'é': texto[pos] = 158;
				case 'ê': texto[pos] = 159;
				case 'ë': texto[pos] = 160;
				case 'È': texto[pos] = 134;
				case 'É': texto[pos] = 135;
				case 'Ê': texto[pos] = 136;
				case 'Ë': texto[pos] = 137;
				case 'ì': texto[pos] = 161;
				case 'í': texto[pos] = 162;
				case 'î': texto[pos] = 163;
				case 'ï': texto[pos] = 164;
				case 'Ì': texto[pos] = 138;
				case 'Í': texto[pos] = 139;
				case 'Î': texto[pos] = 140;
				case 'Ï': texto[pos] = 141;
				case 'ò': texto[pos] = 165;
				case 'ó': texto[pos] = 166;
				case 'ô': texto[pos] = 167;
				case 'ö': texto[pos] = 168;
				case 'Ò': texto[pos] = 142;
				case 'Ó': texto[pos] = 143;
				case 'Ô': texto[pos] = 144;
				case 'Ö': texto[pos] = 145;
				case 'ù': texto[pos] = 169;
				case 'ú': texto[pos] = 170;
				case 'û': texto[pos] = 171;
				case 'ü': texto[pos] = 172;
				case 'Ù': texto[pos] = 146;
				case 'Ú': texto[pos] = 147;
				case 'Û': texto[pos] = 148;
				case 'Ü': texto[pos] = 149;
				case 'ñ': texto[pos] = 174;
				case 'Ñ': texto[pos] = 173;
				case '¡': texto[pos] = 64;
				case '¿': texto[pos] = 175;
				case '`': texto[pos] = 177;
				case '&': texto[pos] = 38;
				default:  texto[pos] = texto[pos];
			}
		}
		format(_InfoAnuncio[2][Anuncio], 128, "%s", _InfoAnuncio[1][Anuncio]);
		TextDrawSetString(_InfoAnuncio[2][TDAnuncio], _InfoAnuncio[2][Anuncio]);
		format(_InfoAnuncio[1][Anuncio], 128, "%s", _InfoAnuncio[0][Anuncio]);
		TextDrawSetString(_InfoAnuncio[1][TDAnuncio], _InfoAnuncio[1][Anuncio]);
		format(_InfoAnuncio[0][Anuncio], 128, "%s. ~g~~h~Movil ~w~%d", texto, numerotel);
		TextDrawSetString(_InfoAnuncio[0][TDAnuncio], _InfoAnuncio[0][Anuncio]);
	}
	return 1;
}
stock EstadoBaul(playerid, estadob = 0)
{
    printf("El jugador %s Cerró su maletero.",PLAYER_INFO[playerid][Nickname]);
    new engine, lights, alarm, doors, bonnet, boot, objective;
    if(estadob == 0)
    {
        PLAYER_TEMP[playerid][BaulSeleccionado] = INVALID_VEHICLE_ID;
        new Float:x,Float:y,Float:z, Float:x2,Float:y2,Float:z2, Float:x3,Float:y3,Float:z3, Float:x4,Float:y4,Float:z4, Float:x5,Float:y5,Float:z5;

        GetVehiclePos(autos[playerid],  x,y,z);
		GetVehiclePos(autos2[playerid], x2,y2,z2);
		GetVehiclePos(autos3[playerid], x3,y3,z3);
		GetVehiclePos(autos4[playerid], x4,y4,z4);
		GetVehiclePos(autos5[playerid], x5,y5,z5);
        if(IsPlayerInRangeOfPoint(playerid, 4.0, x,y,z))
        {
            if(Baul[autos[playerid]] == 0) return PUSH(playerid,"El baul ya esta cerrado");
            GetVehicleParamsEx(autos[playerid], engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(autos[playerid], engine, lights, alarm, doors, bonnet, 0, objective);
            Baul[autos[playerid]] = 0;
            AccionesRol(playerid,"cierra el maletero de su vehiculo.", 20);
            return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, x2,y2,z2))
        {
            if(Baul[autos2[playerid]] == 0) return PUSH(playerid,"El baul ya esta cerrado");
            GetVehicleParamsEx(autos2[playerid], engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(autos2[playerid], engine, lights, alarm, doors, bonnet, 0, objective);
            Baul[autos2[playerid]] = 0;
            AccionesRol(playerid,"cierra el maletero de su vehiculo.", 20);
            return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, x3,y3,z3))
        {
            if(Baul[autos3[playerid]] == 0) return PUSH(playerid,"El baul ya esta cerrado");
            GetVehicleParamsEx(autos3[playerid], engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(autos3[playerid], engine, lights, alarm, doors, bonnet, 0, objective);
            Baul[autos3[playerid]] = 0;
            AccionesRol(playerid,"cierra el maletero de su vehiculo.", 20);
            return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, x4,y4,z4))
        {
            if(Baul[autos4[playerid]] == 0) return PUSH(playerid,"El baul ya esta cerrado");
            GetVehicleParamsEx(autos4[playerid], engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(autos4[playerid], engine, lights, alarm, doors, bonnet, 0, objective);
            Baul[autos4[playerid]] = 0;
            AccionesRol(playerid,"cierra el maletero de su vehiculo.", 20);
            return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, x5,y5,z5))
        {
            if(Baul[autos5[playerid]] == 0) return PUSH(playerid,"El baul ya esta cerrado");
            GetVehicleParamsEx(autos5[playerid], engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(autos5[playerid], engine, lights, alarm, doors, bonnet, 0, objective);
            Baul[autos5[playerid]] = 0;
            AccionesRol(playerid,"cierra el maletero de su vehiculo.", 20);
            return 1;
        }
        else if(PLAYER_INFO[playerid][pAdmin] >= 4)
        {
            new id = GetPlayerVehicleID(playerid);
            if(!IsPlayerInAnyVehicle(playerid)) return 1;
            if(Baul[id] == 0) return PUSH(playerid,"El baul ya esta cerrado");
            AccionesRol(playerid,"cierra el maletero de su vehiculo.", 20);
            GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, 0, objective);
            Baul[id] = 0;
        }
    }
    if(estadob == 1)
    {
        new Float:x,Float:y,Float:z,Float:x2,Float:y2,Float:z2,Float:x3,Float:y3,Float:z3,Float:x4,Float:y4,Float:z4,Float:x5,Float:y5,Float:z5;
		GetVehiclePos(autos[playerid], x,y,z);
		GetVehiclePos(autos2[playerid], x2,y2,z2);
		GetVehiclePos(autos3[playerid], x3,y3,z3);
		GetVehiclePos(autos4[playerid], x4,y4,z4);
		GetVehiclePos(autos5[playerid], x5,y5,z5);
        new var;
        if(IsPlayerInRangeOfPoint(playerid, 4.0, x,y,z)) { var = autos[playerid]; }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, x2,y2,z2)) { var = autos2[playerid]; }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, x3,y3,z3)) { var = autos3[playerid]; }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, x4,y4,z4)) { var = autos4[playerid]; }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0, x5,y5,z5)) { var = autos5[playerid]; }
        if(Baul[var] == 1) return PUSH(playerid,"El baul ya esta abierto");
        GetVehicleParamsEx(var, engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(var, engine, lights, alarm, doors, bonnet, 1, objective);
        Baul[var] = 1;
        AccionesRol(playerid,"abre el maletero de su vehiculo.", 20);
    }
    return true;
}
function OnPlayerParlanteDownload(index, response_code, data[])
{
    if(!PLAYER_TEMP[index][pt_PLAYER_WAITING_MP3_HTTP]) return 1;

    if(response_code == 200)
    {
        if(!strcmp(data, "OK"))
        {
            new url[128];
            format(url, 128, ""DOWNLOADED_YT_PATH"%s.mp3", PLAYER_TEMP[index][pt_VIDEO_ID]);
            if(!parlante[index]) UsarParlante(index, url, PLAYER_TEMP[index][pt_VIDEO_NAME]);
            else UsarParlante(index, url, PLAYER_TEMP[index][pt_VIDEO_NAME], 2);
        }
        else SendClientMessage(index, -1, "Esta cancion no se puede reproducir.");
    }
    else SendClientMessage(index, -1, "Hubo un problema con el servidor de descarga, intentelo de nuevo mas tarde.");

    PLAYER_TEMP[index][pt_PLAYER_WAITING_MP3_HTTP] = false;
    return 1;
}
stock BanDC(ID, const ADMIN[])
{
	if(!IsPlayerNPC(ID) && PLAYER_INFO[ID][pAdmin] == 0)
	{
		new string[200];
		foreach(new i : Player)
		{
			if(JugadorLogeado[i] == 1 && IsPlayerConnected(i))
			{
				if(PLAYER_INFO[i][pMuteos] == 1)
				{
					format(string, sizeof(string), "El jugador {FF3300}%s(ID: %d){FFFFFF} fue baneado por un admin. Razon: {FF3300}%s{FFFFFF}.",PLAYER_INFO[ID][Nickname],ID, ADMIN);
					SendClientMessage(i,-1, string);
				}
			}
		}
		Webhook_Sancion(ID, ADMIN, 0); //id= &razon= &sancion= 
		new query[220], Query[200];
		mysql_format(handle_db, Query, sizeof(Query), "UPDATE "PREFIX_DB"members SET `id_group`='10' WHERE `member_name`='%e'",PLAYER_INFO[ID][Nickname]);
		mysql_tquery(handle_db, Query);
		mysql_format(handle_db, query, sizeof(query), "INSERT INTO registros_admin (Responsable, Jugador, Razon, Accion) VALUES ('DiscordBot','%e','%e','3')",PLAYER_INFO[ID][Nickname],ADMIN);
		mysql_tquery(handle_db, query);
		mysql_format(handle_db, Query, sizeof(Query), "UPDATE usuarios SET Baneado = '1',`razon` = '%e',`Banpor` = 'DiscordBot' WHERE `Username`='%e'", ADMIN,PLAYER_INFO[ID][Nickname]);
		mysql_tquery(handle_db, Query);
		MensajeAdmin(COLOR_GREY, "Administrador: DiscordBot", 3);
		for(new c = 0; c < MAX_PCASAS; c++)
		{
			if(PLAYER_INFO[ID][CasaID][c] == 0) continue;
			DesocuparCasa(c);
		}
		BanEx(ID,"Baneado por un admin.");
	}
	return 1;
}
stock UsarParlante(playerid, const params[], song_title[], cambiar = 1)
{
    if(JugadorLogeado[playerid] != 0 && IsPlayerConnected(playerid))
    {
        new string[228];
        if(cambiar == 1)
        {
            parlante[playerid] = 1;
            SendClientMessageEx(playerid, -1, "{f4fe8f}[Parlante]:{FFFFFF} Colocaste a reproducir: {f4fe8f}%s {FFFFFF}(será removido en 20 minutos).",song_title);
            ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0,0);
            GetPlayerPos(playerid, bpos[playerid][0], bpos[playerid][1], bpos[playerid][2]); bpos[playerid][2] = bpos[playerid][2] - 1;
            GetPlayerFacingAngle(playerid, bpos[playerid][3]); bpos[playerid][3] = bpos[playerid][3] +180;
            parlanteObject[playerid] = CreateDynamicObject(2231, bpos[playerid][0], bpos[playerid][1], bpos[playerid][2], 0, 0, bpos[playerid][3]);
            format(parlanteURL[playerid], 256, "%s", params);
            format(string, sizeof(string), "SONY de %s\nMúsica: {f4fe8f}%s",PlayerName(playerid), song_title);
            new interior = GetPlayerInterior(playerid);
            new world = GetPlayerVirtualWorld(playerid);
            Notificador2(playerid, "Para cambiar la canción usa de nuevo ~g~~h~/parlante~w~.");
            LABELPARLANTE[playerid] = CreateDynamic3DTextLabel(string,-1, bpos[playerid][0], bpos[playerid][1], bpos[playerid][2]+0.6,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 0, world, interior,-1, 100.0);
            timerparlante[playerid] = SetTimerEx("quitarparlante",1200000,false,"d",playerid);
            return 1;
        }
        else if(cambiar == 2)
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Has cambiado la música de su estéreo portátil. Ahora suena: {fe8f8f}%s",song_title);
            format(parlanteURL[playerid], 256, "%s", params);
            format(string, sizeof(string), "SONY de %s\nMusica: {fe8f8f}%s",PlayerName(playerid), song_title);
            DestroyDynamic3DTextLabel(LABELPARLANTE[playerid]);
            new interior = GetPlayerInterior(playerid);
            new world = GetPlayerVirtualWorld(playerid);
            LABELPARLANTE[playerid] = CreateDynamic3DTextLabel(string,-1, bpos[playerid][0], bpos[playerid][1], bpos[playerid][2]+1.0,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 0, world, interior,-1, 100.0);
            foreach(new i : Player)
            {
                if(IsPlayerConnected(i))
                {
                    if(parlantePlayer[i] == playerid)
                    {
                        PlayAudioStreamForPlayer(i, parlanteURL[playerid], bpos[playerid][0], bpos[playerid][1], bpos[playerid][2], 30.0, 1);
                        SendClientMessageEx(i, COLOR_GREY, "Ahora el parlante suena: {fe8f8f}%s",song_title);                   
                    }
                }
            }
            return 1;
        }
    }
    return 1;
}
function OnPlayerParlanteSearch(index, response_code, data[])
{
    if(response_code == 200)
    {
        if(data[0] == '|' && data[1] == '[')
        {
            new start_song_pos = -1, end_song_pos = -1, delimiter_pos_info = -1, counter, tmp[yt_result];
            for(new i = 0; i != sizeof RESULT_YOUTUBE; i ++) RESULT_YOUTUBE[i] = tmp;

                start_song_pos = strfind(data, "|[");
            while(start_song_pos != -1)
            {
                start_song_pos = strfind(data, "|[");
                if(start_song_pos == -1) break;
                delimiter_pos_info = strfind(data, "||");
                strmid(RESULT_YOUTUBE[counter][videoID], data, start_song_pos + 2, delimiter_pos_info, 11 + 1);

                end_song_pos = strfind(data, "]|");
                strmid(RESULT_YOUTUBE[counter][yt_title], data, delimiter_pos_info + 2, end_song_pos, 100 + 1);
                strdel(data, 0, end_song_pos + 2);
                counter ++;
            }

            if(counter == 0) return SendClientMessage(index, -1, "No se encontro ningun resultado para tu busqueda.");

            new dialog_title[50], dialog[120 * MAX_RESULTS], dialog_counter;

            for(new i = 0; i != counter; i ++)
            {
                if(isnull(RESULT_YOUTUBE[i][yt_title])) continue;
                format(PLAYER_DIALOG_MP3_RESULT[index][dialog_counter][videoID], 11 + 1, "%s", RESULT_YOUTUBE[i][videoID]);
                format(PLAYER_DIALOG_MP3_RESULT[index][dialog_counter][yt_title], 100 + 1, "%s", RESULT_YOUTUBE[i][yt_title]);
                format(dialog, sizeof dialog, "%s%d. %s\n", dialog, dialog_counter + 1, RESULT_YOUTUBE[i][yt_title]);
                dialog_counter ++;
            }
            format(dialog_title, sizeof dialog_title, "Se han encontado '%d' resultados", dialog_counter);
            dialogs_ShowPlayerDialog(index, D_PARLANTE2, DIALOG_STYLE_LIST, dialog_title, dialog, "Reproducir", "Cerrar");
        }
        else SendClientMessage(index, -1, "El resultado obtenido no puede ser comprendido.");
    }
    else SendClientMessage(index, -1, "La busqueda fallo, intentelo de nuevo mas tarde.");

    PLAYER_TEMP[index][pt_PLAYER_WAITING_MP3_HTTP] = false;
    return 1;
}
stock UsarBaul(playerid, vid, sid)
{
    new Float:x,Float:y,Float:z,Float:x2,Float:y2,Float:z2,Float:x3,Float:y3,Float:z3,Float:x4,Float:y4,Float:z4,Float:x5,Float:y5,Float:z5;
    if(EspacioBaul[vid][sid+1] == 0 && GetPlayerWeapon(playerid) == 0) return ShowPlayerMessage(playerid, "~r~Slot: Vacio - Necesitas tener el arma en mano para guardar."),EstadoBaul(playerid, 0);
    if(EspacioBaul[vid][sid+1] == 0 && GetPlayerWeapon(playerid) != 0) //guardar arma
    {
		if(PLAYER_INFO[playerid][Agonizando] != 0) return Notificador2(playerid, "~r~No puedes  hacer esto ahora");
		GetVehiclePos(autos[VerBaul[playerid]],x,y,z);
		GetVehiclePos(autos2[VerBaul[playerid]],x2,y2,z2);
		GetVehiclePos(autos3[VerBaul[playerid]],x3,y3,z3);
		GetVehiclePos(autos4[VerBaul[playerid]],x4,y4,z4);
		GetVehiclePos(autos5[VerBaul[playerid]],x5,y5,z5);
		new veh_c = INVALID_VEHICLE_ID,autoid_slot = INVALID_VEHICLE_ID;
		if(IsPlayerInRangeOfPoint(playerid, 4.0,x,y,z)) { veh_c = autos[VerBaul[playerid]]; autoid_slot = 1; }
		else if(IsPlayerInRangeOfPoint(playerid, 4.0,x2,y2,z2)) { veh_c = autos2[VerBaul[playerid]]; autoid_slot = 2; }
		else if(IsPlayerInRangeOfPoint(playerid, 4.0,x3,y3,z3)) { veh_c = autos3[VerBaul[playerid]]; autoid_slot = 3; }
		else if(IsPlayerInRangeOfPoint(playerid, 4.0,x4,y4,z4)) { veh_c = autos4[VerBaul[playerid]]; autoid_slot = 4; }
		else if(IsPlayerInRangeOfPoint(playerid, 4.0,x5,y5,z5)) { veh_c = autos5[VerBaul[playerid]]; autoid_slot = 5; }		
		else
		{
			SendClientMessage(playerid,-1,"Estás muy lejos del último maletero que revisaste.");
		}
        new t_o = GetPlayerWeapon(playerid);
        new counter = 4,espacio[10], Query[200];
        if(BAUL6(veh_c)) counter = 6;
        else if(BAUL8(veh_c)) counter = 8;
        if(MOTO(veh_c)) counter = 0;
        if(PLAYER_INFO[VerBaul[playerid]][pVip] == 1) counter += 1;
        if(PLAYER_INFO[VerBaul[playerid]][pVip] >= 2) counter += 2;
        for(new i = 1; i <= counter; i++)
        {
            if(EspacioBaul[veh_c][i] == 0)
            {
                switch(i)
                {
                    case 1: espacio = "vBaul";
                    case 2: espacio = "vBaul2";
                    case 3: espacio = "vBaul3";
                    case 4: espacio = "vBaul4";
                    case 5: espacio = "vBaul5";
                    case 6: espacio = "vBaul6";
                    case 7: espacio = "vBaul7";
                    case 8: espacio = "vBaul8";
                    case 9: espacio = "vBaul9";
                    case 10: espacio = "vBaul10";
                    case 11: espacio = "vBaul11";
                    case 12: espacio = "vBaul12";
                }
                new queid;
                switch(autoid_slot)
                {
                    case 1: queid = PLAYER_INFO[VerBaul[playerid]][vID1];
                    case 2: queid = PLAYER_INFO[VerBaul[playerid]][vID2];
                    case 3: queid = PLAYER_INFO[VerBaul[playerid]][vID3];
                    case 4: queid = PLAYER_INFO[VerBaul[playerid]][vID4];
                    case 5: queid = PLAYER_INFO[VerBaul[playerid]][vID5];
                }
                EspacioBaul[veh_c][i] = t_o;

                mysql_format(handle_db, Query, 200, "UPDATE `p_vehicles` SET `%s`='%d' WHERE id = '%d'",espacio,t_o,queid);
                printf("UPDATE `p_vehicles` SET `%s`='%d' WHERE id = '%d'",espacio,t_o,queid);
                mysql_tquery(handle_db, Query);

                MensajeBaulGuardar(playerid,t_o);
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                RemovePlayerAttachedObject(playerid, 4);
                break;
            }
        }
        EstadoBaul(playerid, 0);
    }
    if(EspacioBaul[vid][sid+1] != 0 && GetPlayerWeapon(playerid) == 0)
    {
        GetVehiclePos(autos[VerBaul[playerid]],x,y,z);
        GetVehiclePos(autos2[VerBaul[playerid]],x2,y2,z2);
        GetVehiclePos(autos3[VerBaul[playerid]],x3,y3,z3);
        GetVehiclePos(autos4[VerBaul[playerid]],x4,y4,z4);
        GetVehiclePos(autos5[VerBaul[playerid]],x5,y5,z5);
        new veh_c, auto_slot,Query[256];
        if(IsPlayerInRangeOfPoint(playerid, 4.0,x,y,z)) { veh_c = autos[VerBaul[playerid]]; auto_slot = 1; }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0,x2,y2,z2)) { veh_c = autos2[VerBaul[playerid]]; auto_slot = 2; }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0,x3,y3,z3)) { veh_c = autos3[VerBaul[playerid]]; auto_slot = 3; }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0,x4,y4,z4)) { veh_c = autos4[VerBaul[playerid]]; auto_slot = 4; }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0,x5,y5,z5)) { veh_c = autos5[VerBaul[playerid]]; auto_slot = 5; }
        if(auto_slot > 0)
        {
            if(Baul[veh_c] == 1)
            {
                new id = sid+1;
                new cont;
                if(BAUL6(veh_c)) cont = 6;
                else if(BAUL8(veh_c)) cont = 8;
                else cont = 4;
                if(MOTO(veh_c)) cont = 0;
                if(PLAYER_INFO[playerid][pVip] == 1) cont ++;
                if(PLAYER_INFO[playerid][pVip] >= 2) cont += 2;
                if(id > cont) return 1;
                if(EspacioBaul[veh_c][id] == 0) return SendClientMessage(playerid,-1,"Este espacio esta vacio");
                if(Objeto[playerid] > 0) return SendClientMessage(playerid,-1,"Tienes un objeto en tus manos.");
                MensajeBaulSacar(playerid,EspacioBaul[veh_c][id]);
                EspacioBaul[veh_c][id] = 0;
                new espacio[10];
                switch(id){
                    case 1:  espacio = "vBaul";                case 2:  espacio = "vBaul2";              	case 3:  espacio = "vBaul3";
                    case 4:  espacio = "vBaul4";               case 5:  espacio = "vBaul5";              	case 6:  espacio = "vBaul6";
                    case 7:  espacio = "vBaul7";               case 8:  espacio = "vBaul8";				 	case 9:  espacio = "vBaul9";
                    case 10: espacio = "vBaul10";			   case 11: espacio = "vBaul11";				case 12: espacio = "vBaul12";
                }
                new queid;
                switch(auto_slot)
                {
                    case 1: queid = PLAYER_INFO[playerid][vID1];
                    case 2: queid = PLAYER_INFO[playerid][vID2];
                    case 3: queid = PLAYER_INFO[playerid][vID3];
                    case 4: queid = PLAYER_INFO[playerid][vID4];
                    case 5: queid = PLAYER_INFO[playerid][vID5];
                }
                mysql_format(handle_db, Query, sizeof(Query), "UPDATE `p_vehicles` SET `%s`='0' WHERE id = '%d'",espacio,queid);
                mysql_tquery(handle_db, Query);
                EstadoBaul(playerid, 0);
            }
            else SendClientMessage(playerid,-1,"El maletero está cerrado.");
        }
        return 1;
    }
    return true;
}
stock SlotBaul(vid, s)
{
    new espacio[60];
    switch(s)
    {
        default: 
        {   
            if(EspacioBaul[vid][s] == 0) espacio = "{808080}Vacío";
            else
            {
                format(espacio, sizeof(espacio), "{"COLOR_GM"}%s", GetWeaponNameEx(EspacioBaul[vid][s]));
            }
        }
    }
    return espacio;
}
stock mysql_queryEx(MySQL:handle, const query[], bool:use_cache = false)
{
    if(Debug_Mysql == 1) printf("DEBUG MYSQL | %s", query);
	mysql_query(handle, query, use_cache);
    return true;
}
timer EnviarEventoDM[1500](playerid)
{
	if(IsPlayerConnected(playerid) && !IsPlayerNPC(playerid) && JugadorLogeado[playerid] == 1)
	{
		SendClientMessage(playerid,-1,"Puedes salir cuando quieras con {00A8FF}/salirpb");
		SetPosEx(playerid, -975.9757, 1060.9830, 1345.6719, 90, 10, 10);
		DarArma(playerid, 24);
		DarArma(playerid, 27);
	}
}
stock CheckAndroid(playerid)
{
	if(PLAYER_TEMP[playerid][IsAndroid] == 1)
	{
		EnableAntiCheatForPlayer(playerid, 10, 0); //Anti Speed-Hack
		EnableAntiCheatForPlayer(playerid, 2, 0); //Anti Teleport-Hack
		EnableAntiCheatForPlayer(playerid, 52, 0); // Anti NOPs
		EnableAntiCheatForPlayer(playerid, 18, 0); // Anti Special-Action
		EnableAntiCheatForPlayer(playerid, 49, 0); // Anti Special-Action
		printf("[AC-LZ] Posible jugador de /android %s[%d]", PLAYER_INFO[playerid][Nickname], playerid);
	} 
}

stock GetBodypartName(bodypart, name[], const size = sizeof(name))
{
	static const
		names[][] = {
			!"torso",
			!"en la verga",
			!"brazo izquierdo",
			!"brazo derecho",
			!"pierna izquierda",
			!"pierna derecha",
			!"cabeza"
		};

	if (bodypart < 3 || bodypart > 9) {
		return 0;
	}

	return strunpack(name, names[bodypart - 3], size);
}

stock GetMuebleStatus(status)
{
    new estadom[32];
    switch(status)
    {
        case 0: estadom = "{00CC00}[Guardado]{FFFFFF}";
        default: estadom = "{FF0000}[En uso]{FFFFFF}";
    }
    return estadom;
}
stock GetFreeObjectID()
{
    new id = -1;
    for(new i; i < MAX_COP_OBJECTS; i++)
    {
        if(!CopObjectData[i][ObjCreated])
        {
            id = i;
            break;
        }
    }

    return id;
}
stock LimpiarAutosU(playerid)
{
    if(!IsPlayerConnected(playerid)) return 1;
    ContadorLlenarGaso[autos[playerid]] = 0;
    PLAYER_INFO[playerid][vModelo] = 0;
    PLAYER_INFO[playerid][vTraba] = 0;
    PLAYER_INFO[playerid][vAlarma] = 0;
    PLAYER_INFO[playerid][vinterior] = 0;
    PLAYER_INFO[playerid][vSeguro] = 0;
    PLAYER_INFO[playerid][vAAlarma] = 0;
    PLAYER_INFO[playerid][vvw] = 0;
    PLAYER_INFO[playerid][vPrecio] = 0;
    PLAYER_INFO[playerid][vSALTO_V] = 0;
    PLAYER_INFO[playerid][vSALTO_V_1] = 0;
    PLAYER_INFO[playerid][vSALTO_V_2] = 0;
    PLAYER_INFO[playerid][vACELERACION] = 0;
    PLAYER_INFO[playerid][vACTIVE] = 0;
    PLAYER_INFO[playerid][vModelo2] = 0;
    PLAYER_INFO[playerid][v2Traba] = 0;
    PLAYER_INFO[playerid][v2Alarma] = 0;
    PLAYER_INFO[playerid][v2interior] = 0;
    PLAYER_INFO[playerid][vSeguro2] = 0;
    PLAYER_INFO[playerid][vAAlarma2] = 0;
    PLAYER_INFO[playerid][v2vw] = 0;
    PLAYER_INFO[playerid][v2Precio] = 0;
    PLAYER_INFO[playerid][v2SALTO_V] = 0;
    PLAYER_INFO[playerid][v2SALTO_V_1] = 0;
    PLAYER_INFO[playerid][v2SALTO_V_2] = 0;
    PLAYER_INFO[playerid][v2ACELERACION] = 0;
    PLAYER_INFO[playerid][v2ACTIVE] = 0;
    PLAYER_INFO[playerid][vModelo3] = 0;
    PLAYER_INFO[playerid][v3Traba] = 0;
    PLAYER_INFO[playerid][v3Alarma] = 0;
    PLAYER_INFO[playerid][v3interior] = 0;
    PLAYER_INFO[playerid][vSeguro3] = 0;
    PLAYER_INFO[playerid][vAAlarma3] = 0;
    PLAYER_INFO[playerid][v3vw] = 0;
    PLAYER_INFO[playerid][v3Precio] = 0;
    PLAYER_INFO[playerid][v3SALTO_V] = 0;
    PLAYER_INFO[playerid][v3SALTO_V_1] = 0;
    PLAYER_INFO[playerid][v3SALTO_V_2] = 0;
    PLAYER_INFO[playerid][v3ACELERACION] = 0;
    PLAYER_INFO[playerid][v3ACTIVE] = 0;
    PLAYER_INFO[playerid][vModelo4] = 0;
    PLAYER_INFO[playerid][v4Traba] = 0;
    PLAYER_INFO[playerid][v4Alarma] = 0;
    PLAYER_INFO[playerid][v4interior] = 0;
    PLAYER_INFO[playerid][vSeguro4] = 0;
    PLAYER_INFO[playerid][vAAlarma4] = 0;
    PLAYER_INFO[playerid][v4vw] = 0;
    PLAYER_INFO[playerid][v4Precio] = 0;
    PLAYER_INFO[playerid][v4SALTO_V] = 0;
    PLAYER_INFO[playerid][v4SALTO_V_1] = 0;
    PLAYER_INFO[playerid][v4SALTO_V_2] = 0;
    PLAYER_INFO[playerid][v4ACELERACION] = 0;
    PLAYER_INFO[playerid][v4ACTIVE] = 0;
    PLAYER_INFO[playerid][vModelo5] = 0;
    PLAYER_INFO[playerid][v5Traba] = 0;
    PLAYER_INFO[playerid][v5Alarma] = 0;
    PLAYER_INFO[playerid][v5interior] = 0;
    PLAYER_INFO[playerid][vSeguro5] = 0;
    PLAYER_INFO[playerid][vAAlarma5] = 0;
    PLAYER_INFO[playerid][v5vw] = 0;
    PLAYER_INFO[playerid][v5Precio] = 0;
    PLAYER_INFO[playerid][v5SALTO_V] = 0;
    PLAYER_INFO[playerid][v5SALTO_V_1] = 0;
    PLAYER_INFO[playerid][v5SALTO_V_2] = 0;
    PLAYER_INFO[playerid][v5ACELERACION] = 0;
    PLAYER_INFO[playerid][v5ACTIVE] = 0;
    return 1;
}
stock VerificarCheatV(playerid, vehicleid, model)
{
    new afectado = -1;
    new string[120];
	if(!IsPlayerMobile(playerid))
	{
		foreach(new i : Player)
		{
			if(GetPlayerVehicleID(i) == vehicleid && IsPlayerConnected(i) && IsValidVehicle(vehicleid) && i != playerid)
			{
				format(string,sizeof(string), "CarTroll %d - Player %d",vehicleid,i);
				if(!IsPlayerInAnyVehicle(playerid)) KickPlayer(playerid, 0, string);
				afectado = i;
				ShowPlayerMessage(afectado, "~r~Te han borrado el vehiculo, espera 10s que el vehiculo regrese.");
			}
		}
		SetTimerEx("DevolverVeh", 10000, false, "ddd", afectado,vehicleid,model);
	}
}
function DevolverVeh(i, vehicleid, model)
{
    if(!IsPlayerConnected(i)) return 1;
    new Float:x, Float:y, Float:z;
    if(model == GetVehicleModel(vehicleid)) 
    {
        GetPlayerPos(i, x,y,z);
        new interior = GetPlayerInterior(i);
        new worldid = GetPlayerVirtualWorld(i);
        SetPosVeh(vehicleid, x, y+5, z, 190, interior, worldid);
        MensajeAdminEx(3, COLOR_CHEAT, "El vehículo %d regresó a la posición de %s luego de haberlo borrado un cheater.",vehicleid,PLAYER_INFO[i][Nickname]);
    }
    else ShowPlayerMessage(i,"El servidor no logró regresar el vehiculo a su posición. Llama la grúa.");
    return 1;
}
function AdminDutyAutomatico(playerid)
{
	if(cache_num_rows() == 0)
	{
		dialogs_ShowPlayerDialog(playerid, VERIFICAR_ADMIN, DIALOG_STYLE_PASSWORD, "Código de verificación administrativo", " \
        {FFFFFF}Ingrese el código de {0085f8}seguridad{FFFFFF} adminisrativo \
        \n{0085f8}Solo tienes 1 intento", "Verificar", "");		
	}
	else
	{
		new string[100];
		format(string,sizeof(string),"[Administracion] %s(ID: %d) ahora esta en servicio administrativo", PLAYER_INFO[playerid][Nickname], playerid);
		MensajeAdmin(COLOR_CHEAT, string, 5);
		SendClientMessage(playerid, -1, "Ahora estas en servicio administrativo.");
		AdminDuty[playerid] = 1;
	}
}
stock MostrarVeriAdmin(playerid)
{
	new Query[200];
	mysql_format(handle_db, Query, sizeof(Query), "SELECT * FROM `usuarios` WHERE `Username` = '%e' AND `IP` = '%e' LIMIT 1", PLAYER_INFO[playerid][Nickname], PlayerIP(playerid));
	mysql_tquery(handle_db, Query, "AdminDutyAutomatico", "d", playerid);
}
stock ArmadoP(playerid)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        if(GetPlayerWeapon(playerid) == 25) { return 1; }
        else if(GetPlayerWeapon(playerid) == 27) { return 1; }
        else if(GetPlayerWeapon(playerid) == 29) { return 1; }
        else if(GetPlayerWeapon(playerid) == 30) { return 1; }
        else if(GetPlayerWeapon(playerid) == 31) { return 1; }
        else if(GetPlayerWeapon(playerid) == 33) { return 1; }
        else if(GetPlayerWeapon(playerid) == 16) { return 1; }
        else if(GetPlayerWeapon(playerid) == 38) { return 1; }
        else if(GetPlayerWeapon(playerid) == 26) { return 1; }
    }
    return 0;
}
stock SacarDeParti(playerid,posicion)
{
    switch(posicion)
    {
        case 1: SetPosEx(playerid, 2232.8591,-1999.3622,13.5469,90.0000, 0, 0,0);
        default: SetPosEx(playerid, 1957.9030,952.9955,10.8203,180.0000, 0, 0,0);
    }
}
stock ObtenerPosicionEntradaCasa(interior,&Float:x,&Float:y,&Float:z,&Float:a,&intt)
{
	switch(interior)
	{
	    case 1: { x = 235.3099;   y = 1186.6809;  z = 1080.2578; a = 0.0000; intt = 3;  }
		case 2: { x = 2317.6685;  y = -1026.7620; z = 1050.2178; a = 0.0000; intt = 9;  }
		case 3: { x = 2333.2153;  y = -1077.3358; z = 1049.0234; a = 0.0000; intt = 6;  }
		case 4: { x = 2196.85;    y = -1204.25;   z = 1049.02;   a = 0.0000; intt = 6;  }
		case 5: { x = 2308.77;    y = -1212.94;   z = 1049.02; 	 a = 0.0000; intt = 6;  }
		case 6: { x = 2365.4602;  y = -1135.5823; z = 1050.8826; a = 0.0000; intt = 8;  }
		case 7: { x = 2283.04;    y = -1140.28;   z = 1050.90;   a = 0.0000; intt = 11; }
		case 8: { x = 2496.0586;  y = -1692.0869; z = 1014.7422; a = 0.0000; intt = 3;  }
		case 9: { x = 226.7886;   y = 1239.8962;  z = 1082.1406; a = 0.0000; intt = 2;  }
		case 10: { x = 223.0915;  y = 1287.0846;  z = 1082.1406; a = 0.0000; intt = 1;  }
		case 11: { x = 225.7592;  y = 1021.4461;  z = 1084.0177; a = 0.0000; intt = 7;  }
		case 12: { x = 295.04;    y = 1472.26;    z = 1080.26;   a = 0.0000; intt = 15; }
		case 13: { x = 328.0828;  y = 1477.7327;  z = 1084.4375; a = 0.0000; intt = 15; }
		case 14: { x = 387.2211;  y = 1471.6251;  z = 1080.1949; a = 0.0000; intt = 15; }
		case 15: { x = 377.0259;  y = 1417.4404;  z = 1081.3281; a = 0.0000; intt = 15; }
		case 16: { x = 491.0412;  y = 1398.5021;  z = 1080.2578; a = 0.0000; intt = 2;  }
		case 17: { x = 446.9309;  y = 1397.0626;  z = 1084.3047; a = 0.0000; intt = 2;  }
		case 18: { x = 261.2726;  y = 1284.3112;  z = 1080.2578; a = 0.0000; intt = 4;  }
		case 19: { x = 221.8109;  y = 1140.1986;  z = 1082.6094; a = 0.0000; intt = 4;  }
		case 20: { x = 23.8471;   y = 1340.1683;  z = 1084.3750; a = 0.0000; intt = 10; }
		case 21: { x = -260.4884; y = 1456.5424;  z = 1084.3672; a = 0.0000; intt = 4;  }
		case 22: { x = 22.9034;   y = 1403.3380;  z = 1084.4370; a = 0.0000; intt = 5;  }
		case 23: { x = 140.1393;  y = 1365.9347;  z = 1083.8594; a = 0.0000; intt = 5;  }
		case 24: { x = 234.0749;  y = 1063.7300;  z = 1084.2123; a = 0.0000; intt = 6;  }
		case 25: { x = -68.9326;  y = 1351.2013;  z = 1080.2109; a = 0.0000; intt = 6;  }
		case 26: { x = -283.4381; y = 1471.1987;  z = 1084.3750; a = 0.0000; intt = 15; }
		case 27: { x = -42.59;    y = 1405.47;    z = 1084.43;   a = 0.0000; intt = 8;  }
		case 28: { x = 83.1256;   y = 1322.2806;  z = 1083.8662; a = 0.0000; intt = 9;  }
		case 29: { x = 260.85;    y = 1237.24;    z = 1084.26;   a = 0.0000; intt = 9;  }
		case 30: { x = 2468.84;   y = -1698.24;   z = 1013.51;   a = 0.0000; intt = 2;  }
		case 31: { x = 2807.8662; y = -1174.7537; z = 1025.5703; a = 0.0000; intt = 8;  }
		case 32: { x = 318.4255;  y = 1114.4877;  z = 1083.8828; a = 0.0000; intt = 5;  }
		case 33: { x = 2324.5017; y = -1149.5309; z = 1050.7101; a = 0.0000; intt = 12; }
		case 34: { x = 2259.38;   y = -1135.77;   z = 1050.64;   a = 0.0000; intt = 10; }
		case 35: { x = -2170.4675; y = 639.4775;  z = 1052.3750; a = 0.0000; intt = 1;  }
		case 36: { x = 422.5716;  y = 2536.6816;  z = 10.0000;   a = 0.0000; intt = 10; }
		case 37: { x = 1260.8397; y = -785.4880;  z = 1091.9063; a = 0.0000; intt = 5;  }
		case 38: { x = 2548.7993; y = -1294.6368; z = 1060.9844; a = 0.0000; intt = 2;  }
		case 39: { x = 1094.7491; y = -812.6580;  z = 107.4822;  a = 0.0000; intt = 1;  }
		case 40: { x = 1454.7249; y = 551.5430;   z = 1000.9959; a = 0.0000; intt = 10; }
		case 41: { x = -794.7611; y = 508.3545;   z = 1371.7490; a = 0.0000; intt = 1;  }
		case 42: { x = 2270.38;   y = -1210.35;   z = 1047.56;   a = 0.0000; intt = 10; }
		case 43: { x = 1425.9812; y = 599.6008;   z = 1000.9754; a = 0.0000; intt = 99; }
	}
	return true;
}
stock MarcarLocalizarGPS(playerid,Float:x,Float:y)
{
    LocalizandoAuto[playerid][0] = x;
    LocalizandoAuto[playerid][1] = y;
}
stock AttachedObjectItem(playerid,a)
{
    switch(a)
    {
        case 1000:  SetPlayerAttachedObject(playerid, 4, 2060,  6, 0.265999,0.002999,0.034000,107.000038,178.100204,175.399856,0.388000,0.463999,0.587999);
        case 1001:  SetPlayerAttachedObject(playerid, 4, 3800,  6, 0.262000,0.070999,0.021000,106.599998,-1.999999,171.599975,0.372999,0.239999,0.166000);
        case 1002:  SetPlayerAttachedObject(playerid, 4, 2900,  6, 0.256000,0.074999,0.019000,94.400001,0.000000,1.300018,0.376999,0.207000,0.164999);
        case 1429:  SetPlayerAttachedObject(playerid, 4, 1429,  5, -0.045800, 0.189297, 0.213481, 276.266876, 0.722662, 119.390830, 0.825105, 0.976897, 0.840149 );
        case 1518:  SetPlayerAttachedObject(playerid, 4, 1518,  5, -0.035699, 0.228443, 0.209540, 278.555969, 357.488067, 106.670646, 0.932163, 0.899836, 0.902104 );
        case 2912:  SetPlayerAttachedObject(playerid, 4, 2912,  5, -0.143977, 0.171898, -0.158107, 8.848129, 16.818716, 3.184455, 0.555940, 0.397590, 1.000000 );
        case 2190:  SetPlayerAttachedObject(playerid, 4, 2190,  5, -0.358281, -0.002825, 0.023657, 285.520538, 355.671569, 107.623764, 1.000000, 1.000000, 1.000000 );
        case 1788:  SetPlayerAttachedObject(playerid, 4, 1788,  5, 0.004669, 0.026491, 0.180251, 283.267181, 347.590423, 108.920188, 1.000000, 1.000000, 1.000000 );
        case 1790:  SetPlayerAttachedObject(playerid, 4, 1790,  5, 0.036196, 0.060064, 0.137536, 281.493682, 354.646545, 110.527542, 1.000000, 1.000000, 1.000000 );
        case 2028:  SetPlayerAttachedObject(playerid, 4, 2028,  5, -0.025814, 0.044218, 0.205650, 283.869171, 351.121704, 2.281757, 1.000000, 1.000000, 1.000000 );
        case 2226:  SetPlayerAttachedObject(playerid, 4, 2226,  5, -0.025814, 0.044218, 0.205650, 283.869171, 351.121704, 2.281757, 1.000000, 1.000000, 1.000000 );
        case 1650:  SetPlayerAttachedObject(playerid, 4, 1650,  5, 0.125999,0.011999,0.000000,-4.999999,-98.099983,16.600004,1.000000,1.000000,1.000000);
        case 10004: SetPlayerAttachedObject(playerid, 4, 19571, 6, 0.263000,0.039999,-0.141999,116.299987,-76.799858,136.799835,0.800998,1.016000,0.866998);
        case 9003:  SetPlayerAttachedObject(playerid, 4, 19468, 5, 0.126999,-0.089000,0.127998,101.199981,-164.499847,82.999900,1.032001,0.972000,1.002997);
        case 10000: SetPlayerAttachedObject(playerid, 4, 2969,  6, 0.137999,0.039999,-0.168998,66.699996,-162.999877,-95.900085,0.533998,0.622999,0.756998);
        case 10001: SetPlayerAttachedObject(playerid, 4, 2969,  6, 0.137999,0.039999,-0.168998,66.699996,-162.999877,-95.900085,0.533998,0.622999,0.756998);
        case 10002: SetPlayerAttachedObject(playerid, 4, 2969,  6, 0.137999,0.039999,-0.168998,66.699996,-162.999877,-95.900085,0.533998,0.622999,0.756998);
        case 10003: SetPlayerAttachedObject(playerid, 4, 2969,  6, 0.137999,0.039999,-0.168998,66.699996,-162.999877,-95.900085,0.533998,0.622999,0.756998);
        case 1210:  SetPlayerAttachedObject(playerid, 4, 1210,  6, 0.265999,0.002999,0.034000,107.000038,178.100204,175.399856,0.388000,0.463999,0.587999);
    }
    if(a == 1518 || a == 10000 || a == 10001 || a == 10002 || a == 10003 || a == 1429 || a == 2912 || a == 2190 || a == 1788 || a == 1790 || 2028) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
    Objeto[playerid] = a;
}
stock DestroyVehicleEx(vehicleid)
{
    if(DestroyVehicle(vehicleid))
    {
        ValidVeh[vehicleid] = false;
        new temp_VEHICLE_OBJECTS[e_VEHICLE_OBJECTS];
        for(new i = 0; i != MAX_OBJETOS; i ++)
        {
            if(VEHICLE_OBJECTS[vehicleid][i][vobject_OBJECT_ID] != INVALID_STREAMER_ID) DestroyDynamicObject(VEHICLE_OBJECTS[vehicleid][i][vobject_OBJECT_ID]);
            VEHICLE_OBJECTS[vehicleid][i] = temp_VEHICLE_OBJECTS;
        }
        return true;
    }
    return false;
}
stock ConvertirNumero(iValue, const iDelim[2] = ".", szNum[15] = "", iSize = sizeof(szNum))
{
    format(szNum, iSize, "%d", iValue < 0 ? -iValue : iValue);
    for(new i = strlen(szNum) - 3; i > 0; i -= 3) strins(szNum, iDelim, i, iSize);
    if(iValue < 0) strins(szNum, "-", 0, iSize);
    return szNum;
}
stock CuantoMercado(playerid)
{
    new count;
    for(new i = 0; i < MAX_MERCADOS; i++)
    {
        if(strcmp(InfoMercado[i][mDuenoN], NombreJugador(playerid), true) == 0) count ++;
    }
    return count;
}
stock MercadoDesocupado()
{
    for(new p = 0; p < MAX_MERCADOS; p++)
    {
        if(InfoMercado[p][mEnUso] == 0 && p != 0) return p;
    }
    return -1;
}

stock Float:GetPosInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)//by: whoever
{
	new Float:a;
	GetPlayerPos(playerid, x, y, a);
	switch(IsPlayerInAnyVehicle(playerid))
	{
	    case 0: GetPlayerFacingAngle(playerid, a);
	    case 1: GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	}
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
	return a;
}
stock GetSpam(playerid,string[])
{
    if(PLAYER_INFO[playerid][pAdmin] >= 3) return 0;
    new SPAM;
    new CUENTAP,CUENTAN,CUENTADP,ss2,CUENTAJ;
    for(SPAM = 0; SPAM < strlen(string); SPAM ++)
    {
        if(string[SPAM] == '.') CUENTAP ++;
        if(string[SPAM] == '-') CUENTAJ ++;
        if(string[SPAM] == '0' || string[SPAM] == '1' || string[SPAM] == '2' || string[SPAM] == '3' || string[SPAM] == '4' || string[SPAM] == '5' || string[SPAM] == '6' || string[SPAM] == '7' || string[SPAM] == '8' || string[SPAM] == '9') CUENTAN ++;
        if(string[SPAM] == ':') CUENTADP ++;
    }
    if(CUENTAP >= 3 && CUENTAN >= 4 && CUENTADP >= 1) ss2 = 1; // 192.168.1.250:777
    if(CUENTAJ >= 3 && CUENTAN >= 4) ss2 = 1; // 192-168-1-250:7777
    if(CUENTAN >= 5 && CUENTAP >= 3) ss2 = 1;// 192.168.1.250
    if(CUENTAP >= 2 && CUENTADP == 1 && CUENTAN >= 3) ss2 = 1;// samp.servidor.com:7777
    if(CUENTAP >= 2 && CUENTAN >= 3) ss2 = 1; //samp.servidor.com
    if(CUENTAJ >= 3 && CUENTAN >= 3) ss2 = 1;
    new a;
    while(a < sizeof(spam))
    {
        if(strfind(string,spam[a],true) != -1)
        {
            new msjadm[160];
            format(msjadm,sizeof(msjadm),"{00CC00}%s (%d) SPAM ({FF3300}%s{00CC00}): {FFFFFF}%s", NombreJugador(playerid), playerid, spam[a],string);
            MensajeAdmin(-1, msjadm, 3);
            return 2;
        }
        a ++;
    }
    a = 0;
    while(a < sizeof(spam2))
    {
        if(strfind(string,spam2[a],true) != -1)
        {
            new msjadm[160];
            format(msjadm,sizeof(msjadm),"{00CC00}%s (%d) SPAM ({FF3300}%s{00CC00}): {FFFFFF}%s", NombreJugador(playerid), playerid, spam2[a],string);
            MensajeAdmin(-1, msjadm, 3);
            return 1;
        }
        a ++;
    }
    if(ss2 == 1)
    {
        new msjadm[160];
        format(msjadm,sizeof(msjadm),"{00CC00}%s (%d) SPAM ({FF3300}Posible IP{00CC00}): {FFFFFF}%s", NombreJugador(playerid), playerid, string);
        MensajeAdmin(-1, msjadm, 3);
        return 3;
    }
    return 0;
}
stock convertir_numeros(e_number) /* By adri1 - SFR3 4.3 */
{
	new f_string[24], bool:negative;
	format(f_string, sizeof f_string, "$%d", e_number);
	if(e_number < 0)
	{
		negative = true;
		strdel(f_string, 0, 1);
	}
	new numbers = strlen(f_string);
	while(numbers > 4)
	{
		numbers -= 3;
		strins(f_string, ",", numbers);
	}
	if(negative) strins(f_string, "$-", 0);
	return f_string;
}
stock ActualizarTiempoCarcel(playerid,segundos)
{
    if(Noti_Carcel[playerid] == -1) return 1;
    new TiempoTotal[126];
    if(segundos < 60) format(TiempoTotal, sizeof TiempoTotal, "%d segundos",segundos);
    if(segundos > 60 && segundos < 120) format(TiempoTotal, sizeof TiempoTotal, "%d minuto",segundos/60);
    if(segundos > 120 && segundos < 3600) format(TiempoTotal, sizeof TiempoTotal, "%d minutos",segundos/60);
    if(segundos > 3600 && segundos < 7200) format(TiempoTotal, sizeof TiempoTotal, "%d hora",segundos/60/60);
    if(segundos > 7200) format(TiempoTotal, sizeof TiempoTotal, "%d horas",segundos/60/60);
    PlayerTextDrawHide(playerid, GoodNoteData[playerid][Noti_Carcel[playerid]][Recuperandote2]);
    PlayerTextDrawSetString(playerid, GoodNoteData[playerid][Noti_Carcel[playerid]][Recuperandote2], TiempoTotal);
    PlayerTextDrawShow(playerid, GoodNoteData[playerid][Noti_Carcel[playerid]][Recuperandote2]);
    return 1;
}
stock GetEstadoHambre(playerid)
{
	new estado3[60],hambre;
	hambre = PLAYER_INFO[playerid][pHambre];
	switch(hambre)
	{
	case 0..30: estado3 = "hambriento";
	case 31..60: estado3 = "regular";
	case 61..90: estado3 = "satisfecho";
	default: estado3 = "lleno";
	}
	return estado3;
}
function Float: GetDistanceBetweenPlayers( playerid_one, playerid_two )
{
	new
	Float: x1,
	Float: y1,
	Float: z1,
	Float: x2,
	Float: y2,
	Float: z2;
	GetPlayerPos( playerid_one, x1, y1, z1 );
	GetPlayerPos( playerid_two, x2, y2, z2 );
	return floatsqroot(
	floatpower( floatabs( floatsub( x2,x1 ) ), 2)
	+ floatpower( floatabs( floatsub( y2, y1 ) ), 2 )
	+ floatpower( floatabs( floatsub( z2,z1 ) ), 2 )
	);
}
stock ShiftCords(&Float:x, &Float:y,Float:a, Float:distance)
{
	x += (distance * floatsin(-a, degrees)) ;
	y += (distance * floatcos(-a, degrees)) ;
	return 1;
}
stock setPlayerPos( playerid, Float: x, Float: y, Float: z)
{
    NoTeleportHack(playerid);
	SetPlayerPos( playerid, x, y, z );
	return 1;
}
stock SetPlayerFaceToPoint(playerid, Float:PointX, Float:PointY)
{
	new Float:X, Float:Y, Float:Z;
	new Float:Angle;
	GetPlayerPos(playerid, X, Y, Z);
	if(X > PointX && Y > PointY) Angle = floatabs(atan2(floatsub(PointX, X), floatsub(PointY, Y)));
	if(X > PointX && Y <= PointY) Angle = floatadd(floatabs(atan2(floatsub(Y, PointY), floatsub(PointX, X))), 270.0);
	if(X <= PointX && Y > PointY) Angle = floatadd(floatabs(atan2(floatsub(PointY, Y), floatsub(X, PointX))), 90.0);
	if(X <= PointX && Y <= PointY) Angle = floatadd(floatabs(atan2(floatsub(X, PointX), floatsub(Y, PointY))), 180.0);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehicleZAngle(GetPlayerVehicleID(playerid), Angle);
	else SetPlayerFacingAngle(playerid, Angle);
	return 1;
}
stock _SendClientMessage(playerid, colorm, const mensajem[])
{
    #pragma unused colorm
    new stringP[200];
    format(stringP,sizeof(stringP),"");
    format(stringP, sizeof(stringP), "%s", mensajem,__line);
    //if(guardable == 1) InsertarNotificacion(playerid, stringP);
    //convert_encoding(stringP);
    CrearNotificacion(playerid,"none",stringP,7,0xFFFFFFDD,0x000000FF);
    return 1;
}
stock RecargarFabricas()
{
    for(new ID = 1; ID < MAX_FABRICAS; ID++)
    {
        if(FABRICAS_INFO[ID][f_VALID])
        {
            GuardarFabrica(ID);
        }
    }
    CargarFabricas();
}
stock Arrastrar(playerid,id)
{
    if(!GetPVarInt(id, "Player:Cuff" ) )
    return SendClientMessage( playerid, -1, "Este jugador debe ser esposado." );
    if( GetDistanceBetweenPlayers( playerid, id) > 3.0 || GetPlayerVirtualWorld( playerid ) != GetPlayerVirtualWorld(id) )
    return SendClientMessage( playerid, -1, "Este jugador no está cerca de ti." );
    SetPVarInt( playerid, "Player:Lead",id);
    SetPVarInt(id, "Player:Follow", playerid );
    pformat:("Forzaste a %s a moverse contigo.", PlayerName(id) );
    psend:(playerid, COLOR_WHITE );
    pformat:("%s te obligó a seguirlo.", PlayerName(playerid));
    psend:(id, COLOR_WHITE );
    //FreezePlayer(id, true);
    return 1;
}
stock Darrastrar(playerid,id)
{
    if( GetPVarInt( playerid, "Player:Lead" ) != id)
    return SendClientMessage( playerid, COLOR_WHITE, "Este jugador no te está siguiendo." );
    if( GetDistanceBetweenPlayers( playerid, id) > 3.0 || GetPlayerVirtualWorld( playerid ) != GetPlayerVirtualWorld(id) )
    return SendClient:( playerid, COLOR_WHITE, "Este jugador no está cerca de ti." );
    SetPVarInt( playerid, "Player:Lead", INVALID_PLAYER_ID );
    SetPVarInt( id, "Player:Follow", INVALID_PLAYER_ID );
    /*if( GetPVarInt( params[0], "Player:Cuff" ) )*/
    //FreezePlayer(id, true );
    pformat:( "Soltaste a %s.", PlayerName(id) );
    psend:( playerid, COLOR_WHITE );
    pformat:( "Dejas de seguir a %s.", PlayerName(playerid) );
    psend:( id, COLOR_WHITE );
    return 1;
}
stock move_animation ( playerid, Float:X, Float:Y, Float:Z )
{
	if(IsPlayerInAnyVehicle ( playerid ) ) return 0 ;
	if(IsPlayerInRangeOfPoint ( playerid, 2.0, X, Y, Z ) )
	{
		ApplyAnimation ( playerid, "PED", "IDLE_STANCE", 4.1, 0, 1, 1, 0, 0, 1 ) ;
		return 1;
	}
	else if(IsPlayerInRangeOfPoint ( playerid, 4.0, X, Y, Z ) )
	{
		
		ApplyAnimation ( playerid, "PED", "WALK_PLAYER", 4.1, 0, 1, 1, 0, 0, 1 ) ;
		return 2 ;
	}
	else if ( IsPlayerInRangeOfPoint ( playerid, 7.0, X, Y, Z ) )
	{
		
		ApplyAnimation ( playerid, "PED", "RUN_GANG1", 4.1, 0, 1, 1, 0, 0, 1 ) ;
		return 3;
	}
	ApplyAnimation ( playerid, "PED", "SPRINT_PANIC", 4.1, 0, 1, 1, 0, 0, 1 ) ;
	return 4;
}
stock Arrastrando(playerid)
{
    if(GetPVarInt(playerid, "Player:Follow" ) != INVALID_PLAYER_ID && GetPVarInt(playerid, "Player:Cuff" ) != 0 )
    {
        new pl_id = GetPVarInt(playerid, "Player:Follow" );
        new Float:pl_x, Float:pl_y, Float:pl_z, Float:pl_r ;
        GetPlayerPos ( pl_id, pl_x, pl_y, pl_z ) ;
        SetPVarFloat ( pl_id, "cuff_x", pl_x ) ;
        SetPVarFloat ( pl_id, "cuff_y", pl_z ) ;
        SetPVarFloat ( pl_id, "cuff_z", pl_z ) ;
        SetPlayerFaceToPoint ( playerid, pl_x, pl_y ) ;
        new Float:g_pos [ 3 ] ;
        new anim = move_animation ( playerid, pl_x, pl_y, pl_z ) ;
        if ( GetPlayerInterior ( pl_id ) != GetPlayerInterior ( playerid ) || GetPlayerVirtualWorld ( pl_id ) != GetPlayerVirtualWorld ( playerid ) || GetPlayerDistanceFromPoint ( playerid, pl_x, pl_y, pl_z ) > 10 )
        {						
            setPlayerPos ( playerid, pl_x, pl_y, pl_z ) ;
            SetPlayerInterior ( playerid, GetPlayerInterior ( pl_id ) ) ;
            SetPlayerVirtualWorld ( playerid, GetPlayerVirtualWorld ( pl_id ) ) ;
        }
        if ( anim != 1 )
        {						
            g_pos [ 0 ] = GetPVarFloat ( playerid,"cuff_x" ) ;
            g_pos [ 1 ] = GetPVarFloat ( playerid,"cuff_y" ) ;
            g_pos [ 2 ] = GetPVarFloat ( playerid,"cuff_z" ) ;
            if ( IsPlayerInRangeOfPoint ( playerid, 0.5, g_pos [ 0 ],g_pos [ 1 ],g_pos [ 2 ] ) )
            {
                GetPlayerPos ( playerid, pl_x, pl_y, pl_z ) ;
                GetPlayerFacingAngle ( playerid, pl_r ) ;
                ShiftCords ( pl_x, pl_y, pl_r, 1.5 ) ;
                setPlayerPos ( playerid, pl_x, pl_y, pl_z ) ;
            }
            GetPlayerPos ( playerid, pl_x, pl_y, pl_z ) ;
            SetPVarFloat ( playerid, "cuff_x", pl_x ) ;
            SetPVarFloat ( playerid, "cuff_y", pl_z ) ;
            SetPVarFloat ( playerid, "cuff_z", pl_z ) ;
        }
    }
    return true;
}
stock GetColorHambre(playerid)
{
	new color,hambre;
	hambre = PLAYER_INFO[playerid][pHambre];
	switch(hambre)
	{
	case 0..30: color = 0xDC0404FF;
	case 31..60: color = -5963521;
	case 61..90: color = 0x45D733FF;
	default: color = 0x0079FFFF;
	}
	return color;
}


stock GetEstadoSed(playerid)
{
	new estado2[60],sed;
	sed = PLAYER_INFO[playerid][pSed];
	switch(sed)
	{
	case 0..30: estado2 = "deshidratado";
	case 31..60: estado2 = "regular";
	case 61..90: estado2 = "hidratado";
	default: estado2 = "lleno";
	}
	return estado2;
}

stock GetColorSed(playerid)
{
	new color,sed;
	sed = PLAYER_INFO[playerid][pSed];
	switch(sed)
	{
	case 0..30: color = 0xDC0404FF;
	case 31..60: color = -5963521;
	case 61..90: color = 0x45D733FF;
	default: color = 0x0079FFFF;
	}
	return color;
}	
stock CrearNotificacion(playerid,const icon[], const text[], time = 0, color = -1, bg_color = 255, sound = 1, const size = sizeof(text),tipo = 0,noti = 90)
{
	if(noti < 10 && TiempoNotificaciones[playerid][noti] != 0) return 1;
	#pragma unused size
	static
	free_pos,
	lines_count,
	Float:size_bg,
	Float:pos_y
	;
	free_pos = gn_GetFreeNotePos(playerid);		
	if(free_pos == -1) return 0;
	new TextoNotificacion[200];
	format(TextoNotificacion, sizeof(TextoNotificacion), "%s",icon);
	format(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT_I], MAX_GOOD_TEXT_LENGTH, TextoNotificacion);
	format(TextoNotificacion, sizeof(TextoNotificacion), "%s",text);
	format(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT], MAX_GOOD_TEXT_LENGTH, TextoNotificacion);
	lines_count = gn_GetLineOfString(TextoNotificacion);
	if(tipo == 1) lines_count = 3;
	if(tipo == 2) lines_count = 6;
	if(tipo == 4) lines_count = 8;
	if(tipo == 5) lines_count = 2;
	if(tipo == 6) lines_count = 3;
	if(tipo == 7) lines_count = 1;
	if(tipo == 8) lines_count = 3;
	if(tipo == 9) lines_count = 2;
	if(tipo == 10) lines_count = 2;
	if(tipo == 11) lines_count = 3;
	if(tipo == 12) lines_count = 1;
	if(tipo == 14) lines_count = 1;
	if(tipo == 15) lines_count = 4;
	if(tipo == 16) lines_count = 1;
	size_bg = 1.2 + (lines_count * 1.4);
	pos_y = GoodNotePosY;
	if(PLAYER_INFO[playerid][pCargos] > 0) 	pos_y = GoodNotePosY2;
	for(new i; i < free_pos; i++)
	{
		if(GoodNoteDirection == GN_DIRECTION_DOWN) {
			pos_y += 13.0 + (GoodNoteData[playerid][i][GOOD_NOTE_LINES] * 16.0) + 6.0;
		} else {
			pos_y -= 13.0 + (GoodNoteData[playerid][i][GOOD_NOTE_LINES] * 16.0) + 6.0;
		}
	}
	if(lines_count > 1 && GoodNoteDirection == GN_DIRECTION_UP) {
		pos_y -= (lines_count - 1) * 16.0;
	}
	GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] = tipo;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_LINES] = lines_count;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_COL_BG] = bg_color;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_COL_TEXT] = color;
	new PlayerText:temp_td;
	if(strfind(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT_I], "none", true) != -1)
	{
		format(TextoNotificacion, sizeof(TextoNotificacion), "%s",Desbug(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT]));	
	}
	else
	{
		format(TextoNotificacion, sizeof(TextoNotificacion), "____%s",Desbug(TextoNotificacion));
	}
	temp_td = CreatePlayerTextDraw(playerid, GoodNotePosX, pos_y+lines_count, TextoNotificacion);
	PlayerTextDrawLetterSize(playerid, temp_td, 0.271250, 1.383465);
	PlayerTextDrawTextSize(playerid, temp_td, 607.500000, size_bg);
	PlayerTextDrawAlignment(playerid, temp_td, 1);
	PlayerTextDrawColor(playerid, temp_td, color);
	PlayerTextDrawUseBox(playerid, temp_td, true);
	PlayerTextDrawBoxColor(playerid, temp_td, 0x00080E99);
	PlayerTextDrawSetShadow(playerid, temp_td, 0);
	PlayerTextDrawSetOutline(playerid, temp_td, 0);
	PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
	PlayerTextDrawFont(playerid, temp_td, 1);
	PlayerTextDrawSetProportional(playerid, temp_td, 1);
	PlayerTextDrawShow(playerid, temp_td);
	GoodNoteLastId++;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_TD_TEXT] = temp_td;
	if(strfind(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT_I], "none", true) != -1)
	{
		//
	}
	else
	{
		format(TextoNotificacion, sizeof(TextoNotificacion), "%s",Desbug(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT_I]));
		temp_td = CreatePlayerTextDraw(playerid, GoodNotePosX, pos_y+1.3, TextoNotificacion);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, temp_td, 13.125000, 13.125000);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 4);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][GOOD_NOTE_ICO] = temp_td;
	}
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 1)//taxi
	{
		Noti_Renta[playerid] = free_pos;
		temp_td = CreatePlayerTextDraw(playerid, 499.250000, pos_y+1.0, "tiempo de alquiler____________________costo");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.144373, 1.271466);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Renta1] = temp_td;
		temp_td = CreatePlayerTextDraw(playerid, 499.250000, pos_y+13.0, "9 minutos.");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.224998, 1.973333);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, 1018966015);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Renta2] = temp_td;
		temp_td = CreatePlayerTextDraw(playerid, 605.875000, pos_y+14.5, "$0");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.224998, 1.673333);
		PlayerTextDrawAlignment(playerid, temp_td, 3);
		PlayerTextDrawColor(playerid, temp_td, 1018966015);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		GoodNoteData[playerid][free_pos][Renta3] = temp_td;
		//ActualizarTiempoRenta(playerid,TiempoRenta[playerid]);
		PlayerTextDrawShow(playerid, temp_td);
		temp_td = CreatePlayerTextDraw(playerid, 499.250000, pos_y+33.0, "manten pulsado 2 dentro del~n~vehiculo para desrentar");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.191248, 0.972799);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1650090753);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Renta4] = temp_td;
	}	
	//3CBC2F
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 2)//habilidad
	{
		Noti_Habilidad[playerid] = free_pos;
		new Float:p_y;
		p_y = 20.0;
		for(new h = 1; h < 5; h++)
		{
			if(h == 1)	GoodNoteData[playerid][free_pos][Barra_Camionero]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.500000, 0xFC5000FF, 100);
			if(h == 2) GoodNoteData[playerid][free_pos][Barra_Minero]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.500000, 0xEFC5000FF, 100);
			if(h == 3) GoodNoteData[playerid][free_pos][Barra_Basurero]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.500000, 0xFC5000FF, 100);
			if(h == 4) GoodNoteData[playerid][free_pos][Barra_Pescador]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.500000, 0xFC5000FF, 100);
			p_y += 25.0;
		}
		p_y = 1.0;
		pos_y += 5.0;
		for(new h = 1; h < 5; h++)
		{
			new exptrabajototal,exptrabajo;
			if(h == 1) temp_td = CreatePlayerTextDraw(playerid, 496.799987, pos_y+p_y, "Camionero");
			if(h == 2) temp_td = CreatePlayerTextDraw(playerid, 496.799987, pos_y+p_y, "Minero");
			if(h == 3) temp_td = CreatePlayerTextDraw(playerid, 496.799987, pos_y+p_y, "Basurero");
			if(h == 4) temp_td = CreatePlayerTextDraw(playerid, 496.799987, pos_y+p_y, "Pescador");
			PlayerTextDrawLetterSize(playerid, temp_td, 0.237994, 1.263998);
			PlayerTextDrawAlignment(playerid, temp_td, 1);
			PlayerTextDrawColor(playerid, temp_td, -1);
			PlayerTextDrawSetShadow(playerid, temp_td, 0);
			PlayerTextDrawSetOutline(playerid, temp_td, 1);
			PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
			PlayerTextDrawFont(playerid, temp_td, 1);
			PlayerTextDrawSetProportional(playerid, temp_td, 1);
			PlayerTextDrawShow(playerid, temp_td);
			if(h == 1) GoodNoteData[playerid][free_pos][Job1] = temp_td;
			if(h == 2) GoodNoteData[playerid][free_pos][Job2] = temp_td;
			if(h == 3) GoodNoteData[playerid][free_pos][Job3] = temp_td;
			if(h == 4) GoodNoteData[playerid][free_pos][Job4] = temp_td;
			if(h == 1)
			{
				exptrabajototal = 50;
				exptrabajo = PLAYER_INFO[playerid][pExpCamionero];
				format(TextoNotificacion, sizeof(TextoNotificacion), "%d/%d (%d/8)",exptrabajo,exptrabajototal,PLAYER_INFO[playerid][pNivelCamionero]);
				SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Camionero], exptrabajototal);
				SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Camionero],exptrabajo);
				UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Camionero]);
				ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Camionero]);
			}
			if(h == 2)
			{
				exptrabajototal = 50;
				exptrabajo = PLAYER_INFO[playerid][pExpMinero];
				format(TextoNotificacion, sizeof(TextoNotificacion), "%d/%d (%d/8)",exptrabajo,exptrabajototal,PLAYER_INFO[playerid][pNivelMinero]);
				SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Minero], exptrabajototal);
				SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Minero],exptrabajo);
				UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Minero]);
				ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Minero]);
			}
			if(h == 3)
			{
				exptrabajototal = 50;
				exptrabajo = PLAYER_INFO[playerid][pExpBasurero];
				format(TextoNotificacion, sizeof(TextoNotificacion), "%d/%d (%d/3)",exptrabajo,exptrabajototal,PLAYER_INFO[playerid][pNivelBasurero]);
				SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Basurero], exptrabajototal);
				SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Basurero],exptrabajo);
				UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Basurero]);
				ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Basurero]);
			}
			if(h == 4)
			{
				exptrabajototal = 50;
				exptrabajo = PLAYER_INFO[playerid][pExpPescador];
				format(TextoNotificacion, sizeof(TextoNotificacion), "%d/%d (%d/3)",exptrabajo,exptrabajototal,PLAYER_INFO[playerid][pNivelPescador]);
				SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Pescador], exptrabajototal);
				SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Pescador],exptrabajo);
				UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Pescador]);
				ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Pescador]);
			}
			temp_td = CreatePlayerTextDraw(playerid, 605.799987, pos_y+p_y, TextoNotificacion);
			PlayerTextDrawLetterSize(playerid, temp_td, 0.213998, 1.077332);
			PlayerTextDrawAlignment(playerid, temp_td, 3);
			PlayerTextDrawColor(playerid, temp_td, -1);
			PlayerTextDrawSetShadow(playerid, temp_td, 0);
			PlayerTextDrawSetOutline(playerid, temp_td, 1);
			PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
			PlayerTextDrawFont(playerid, temp_td, 1);
			PlayerTextDrawSetProportional(playerid, temp_td, 1);
			PlayerTextDrawShow(playerid, temp_td);
			if(h == 1) GoodNoteData[playerid][free_pos][Exp1] = temp_td;
			if(h == 2) GoodNoteData[playerid][free_pos][Exp2] = temp_td;
			if(h == 3) GoodNoteData[playerid][free_pos][Exp3] = temp_td;
			if(h == 4) GoodNoteData[playerid][free_pos][Exp4] = temp_td;
			p_y += 25.0;
		}
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 3)//Analgesico
	{
		Noti_Analgesico[playerid] = free_pos;
		new Float:p_y;
		p_y = 13.0;
		pos_y += 3.0;
		temp_td = CreatePlayerTextDraw(playerid, 497.799987, pos_y, "");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.237994, 1.263998);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][EfectoA] = temp_td;
		GoodNoteData[playerid][free_pos][Barra_A]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.000000, 0x16DC4590, 100);
		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_A], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_A],PLAYER_INFO[playerid][@analgesico]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_A]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_A]);
		Noti_Analgesico[playerid] = free_pos;
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 4)//EST
	{
		pos_y += 3.0;
		temp_td = CreatePlayerTextDraw(playerid, 497.300000, pos_y+3.0, "dinero_______________________en banco~n~~n~~n~nivel_______________________experiencia~n~~n~~n~tiempo jugado~n~~n~~n~trabajo actual");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.171246, 1.189331);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1061109505);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][VerEST1] = temp_td;
		new stringest[130];
		format(stringest, sizeof(stringest), "%s~w~~n~~n~%d~n~~n~%d horas y %d minutos~n~~n~%s",convertir_numeros(PLAYER_INFO[playerid][jDinero]),PLAYER_INFO[playerid][@Nivel],PLAYER_INFO[playerid][horasjugadas],PLAYER_INFO[playerid][TiempoPD],NombreTrabajo(PLAYER_INFO[playerid][pTrabajo]));
		temp_td = CreatePlayerTextDraw(playerid, 497.300000, pos_y+17.0, stringest);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.246872, 1.739329);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, 0x16DC45FF);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 255);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][VerEST2] = temp_td;
		format(stringest, sizeof(stringest), "%s~w~~n~~n~%d/%d",convertir_numeros(PLAYER_INFO[playerid][pBanco]),PLAYER_INFO[playerid][jExperiencia],(PLAYER_INFO[playerid][@Nivel]) * 6);
		temp_td = CreatePlayerTextDraw(playerid, 605.125000, pos_y+17.0, stringest);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.242496, 1.719464);
		PlayerTextDrawAlignment(playerid, temp_td, 3);
		PlayerTextDrawColor(playerid, temp_td, 0x16DC45FF);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][VerEST3] = temp_td;
		/* GoodNoteData[playerid][free_pos][Barra_A]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 130.500000, 2.000000, 0x8FE358FF, 100);
		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_A], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_A],EfectoAnalgesico[playerid]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_A]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_A]);
		Noti_Analgesico[playerid] = free_pos;*/
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 5)//Pescando..
	{
		Noti_Pesca[playerid] = free_pos;
		pos_y += 3.0;
		temp_td = CreatePlayerTextDraw(playerid, 504.125000, pos_y-2.5, "Pescando...");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.265623, 1.600000);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Pesca1] = temp_td;
		temp_td = CreatePlayerTextDraw(playerid, 499.250000, pos_y+11.0, "Espera a que muerdan el anzuelo...");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.168748, 1.189332);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Pesca2] = temp_td;
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 6)//Pescando..
	{
		Noti_Pesca[playerid] = free_pos;
		pos_y += 3.0;
		new fix_string[100];
		if(TeclaPesca[playerid] == 1) format(fix_string,sizeof fix_string, "¡Pulsa ESPACIO tan rápido~n~como puedas!");	
		if(TeclaPesca[playerid] == 2) format(fix_string,sizeof fix_string, "¡Pulsa ALT IZQ tan rápido~n~como puedas!");	
		if(TeclaPesca[playerid] == 3) format(fix_string,sizeof fix_string, "¡Pulsa MAYUS IZQ tan~n~rápido como puedas!");	
		temp_td = CreatePlayerTextDraw(playerid, 499.875000, pos_y+1.0, Desbug(fix_string));
		PlayerTextDrawLetterSize(playerid, temp_td, 0.231249, 1.264000);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Pesca1] = temp_td;
		if(ColorPesca[playerid] == 1) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0x97A594FF, 100);
		if(ColorPesca[playerid] == 2) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0xEC5151FF, 100);
		if(ColorPesca[playerid] == 3) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0x51ECA2FF, 100);
		if(ColorPesca[playerid] == 4) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0x862BF9FF, 100);
		if(ColorPesca[playerid] == 5) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0x2BF95FFF, 100);
		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Pescando], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Pescando],Pescando_Barra[playerid]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Pescando]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Pescando]);
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 7)//Camionero
	{
		Noti_Camio[playerid] = free_pos;
		temp_td = CreatePlayerTextDraw(playerid, 500.000000, pos_y+1.0, "Tiempo restante:");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.223749, 1.293866);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][CamioTD] = temp_td;
	}	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 8)//Grafiti
	{
	  Noti_Grafiti[playerid] = free_pos;
	  temp_td = CreatePlayerTextDraw(playerid, 496.375000, pos_y+1.0, "hud:radar_spray");
	  PlayerTextDrawLetterSize(playerid, temp_td, -0.001874, -0.029866);
	  PlayerTextDrawTextSize(playerid, temp_td, 14.375000, 16.426662);
      PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawFont(playerid, temp_td, 4);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_Ico] = temp_td;

	  temp_td = CreatePlayerTextDraw(playerid, 510.125000, pos_y+1.0, "_");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.186249, 1.883733);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, -1);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, -256);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_Name] = temp_td;
			
			
	  temp_td = CreatePlayerTextDraw(playerid, 496.375000, pos_y+17.0, "");//grafiti en X
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210622, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1061109505);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_Desc] = temp_td;
			
	  temp_td = CreatePlayerTextDraw(playerid, 498.500000, pos_y+20.0, "_");//Banda 1
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210621, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -65281);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_B1] = temp_td;
	
	  temp_td = CreatePlayerTextDraw(playerid, 498.500000, pos_y+30.00, "_");//Banda 1
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210621, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -65281);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_B2] = temp_td;
	
	  temp_td = CreatePlayerTextDraw(playerid, 498.500000, pos_y+40.0, "_");//Banda 1
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210621, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -65281);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_B3] = temp_td;
	
	  temp_td = CreatePlayerTextDraw(playerid, 498.500000, pos_y+50.0, "_");//Banda 1
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210621, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -65281);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_B4] = temp_td;
		
		
	}	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 9)//habilidad
	{
		Noti_Hambre[playerid] = free_pos;

		GoodNoteData[playerid][free_pos][Barra_Hambre]	= CreatePlayerProgressBar(playerid, 499.000000, pos_y+15.0, 105.000000, 2.300000, GetColorHambre(playerid), 100);
		GoodNoteData[playerid][free_pos][Barra_Sed]	= CreatePlayerProgressBar(playerid, 499.000000, pos_y+35.0, 105.000000, 1.900000, GetColorSed(playerid), 100);


		pos_y += 5.0;
		temp_td = CreatePlayerTextDraw(playerid, 499.625000, pos_y-5.0, "Hambre");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.278125, 1.525332);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Hambre_TD1] = temp_td;


		temp_td = CreatePlayerTextDraw(playerid, 499.625000, pos_y+15.0, "Sed");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.278125, 1.52533);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, -1);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Hambre_TD2] = temp_td;

		new estadobarra[120];
		format(estadobarra,sizeof(estadobarra),"%s",GetEstadoHambre(playerid));

		temp_td = CreatePlayerTextDraw(playerid, 606.875000, pos_y-5.0, estadobarra);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.249999, 1.114666);
		PlayerTextDrawAlignment(playerid, temp_td, 3);
		PlayerTextDrawColor(playerid, temp_td, GetColorHambre(playerid));
		PlayerTextDrawSetShadow(playerid, temp_td, -1);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Hambre_TD3] = temp_td;

		format(estadobarra,sizeof(estadobarra),"%s",GetEstadoSed(playerid));
		temp_td = CreatePlayerTextDraw(playerid, 606.250000, pos_y+15.0, estadobarra);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.231249, 1.151998);
		PlayerTextDrawAlignment(playerid, temp_td, 3);
		PlayerTextDrawColor(playerid, temp_td, GetColorSed(playerid));
		PlayerTextDrawSetShadow(playerid, temp_td, -1);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Job1] = temp_td;
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Hambre_TD4] = temp_td;
			

		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Hambre], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Hambre],PLAYER_INFO[playerid][pHambre]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Hambre]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Hambre]);

		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Sed], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Sed],PLAYER_INFO[playerid][pSed]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Sed]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Sed]);


	}	

	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 10)//taxi
	{
		Noti_Recuperandote[playerid] = free_pos;

		temp_td = CreatePlayerTextDraw(playerid, 498.000000,  pos_y,  Desbug("Recuperándote..."));
		PlayerTextDrawLetterSize(playerid, temp_td, 0.224998, 1.637331);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -2082641409);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Recuperandote1] = temp_td;
		
				
		temp_td = CreatePlayerTextDraw(playerid, 498.000000,  pos_y+13.0, "60 segundos restantes.");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.190623, 1.271466);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		GoodNoteData[playerid][free_pos][Recuperandote2] = temp_td;
		//ActualizarTiempoRecuperandote(playerid,TiempoRecuperandote[playerid]);
		PlayerTextDrawShow(playerid, temp_td);
	}		
	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 11)//SAPD
	{
		Noti_Informe[playerid] = free_pos;
		temp_td = CreatePlayerTextDraw(playerid, 498.250000, pos_y+3, InformePolicia1[playerid]);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.211248, 1.488000);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, 0x2396FAFF);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Informe1] = temp_td;

		temp_td = CreatePlayerTextDraw(playerid, 498.875000, pos_y+17, InformePolicia2[playerid]);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.206873, 1.181866);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Informe2] = temp_td;
	}		
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 12)//taxi
	{
		Noti_Carcel[playerid] = free_pos;
		temp_td = CreatePlayerTextDraw(playerid, 498.000000,  pos_y,  Desbug("Encarcelado..."));
		PlayerTextDrawLetterSize(playerid, temp_td, 0.224998, 1.637331);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, 0xF33232FF);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Recuperandote1] = temp_td;
					
		temp_td = CreatePlayerTextDraw(playerid, 498.000000,  pos_y+13.0, "60 segundos restantes.");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.190623, 1.271466);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		GoodNoteData[playerid][free_pos][Recuperandote2] = temp_td;
		ActualizarTiempoCarcel(playerid,PLAYER_INFO[playerid][pTiempoJail]);
		PlayerTextDrawShow(playerid, temp_td);
	}		
	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 13)//PayDay
	{
	  Noti_PD[playerid] = free_pos;
	  temp_td = CreatePlayerTextDraw(playerid, 497.000000, pos_y+2.0, "hud:radar_cash");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.000000, 0.000000);
	  PlayerTextDrawTextSize(playerid, temp_td, 14.375000, 14.933334);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawFont(playerid, temp_td, 4);
	  GoodNoteData[playerid][free_pos][PayDay1] = temp_td;

	  temp_td = CreatePlayerTextDraw(playerid, 512.000000, pos_y+1.5, "Hora de pago");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.211874, 1.764267);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 1);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  GoodNoteData[playerid][free_pos][PayDay2] = temp_td;

	  temp_td = CreatePlayerTextDraw(playerid, 498.000000, pos_y+20.0, "impu_");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.193749, 1.122133);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 1);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  GoodNoteData[playerid][free_pos][PayDay3] = temp_td;

	  temp_td = CreatePlayerTextDraw(playerid, 603.000000, pos_y+20.0, "_diner");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.193749, 1.122133);
	  PlayerTextDrawAlignment(playerid, temp_td, 3);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 1);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  GoodNoteData[playerid][free_pos][PayDay4] = temp_td;
	  //ActualizarPD(playerid);
	}		
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 14)//Experiencia mas
	{
		Noti_XP[playerid] = free_pos;
		new Float:p_y;
		new MaxVXP,VXP;
		p_y = 13.0;
		pos_y += 3.5;
		temp_td = CreatePlayerTextDraw(playerid, 497.799987, pos_y, "");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.237994, 1.263998);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][EfectoXP] = temp_td;
		GoodNoteData[playerid][free_pos][Barra_XP]	= CreatePlayerProgressBar(playerid, 497.000000, pos_y+p_y, 109.000000, 2.400000, 0xB6BDC3FF, 100);
		//-----------------------------------------------
		VXP = PLAYER_INFO[playerid][jExperiencia];
		MaxVXP = (PLAYER_INFO[playerid][@Nivel]) * 6;
  		//------------------------------------------------
 		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_XP], MaxVXP);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_XP],VXP-1);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_XP]);
  		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_XP]);
  		//SetPlayerProgressBarValueH(playerid, GoodNoteData[playerid][free_pos][Barra_XP], VXP);
	}	
	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 15)//Experiencia mas
	{
		  temp_td = CreatePlayerTextDraw(playerid, 499.875000, pos_y+3.3, "Mover~n~Mover rapido~n~Rotar~n~Subir y bajar~n~Terminar");
		  PlayerTextDrawLetterSize(playerid, temp_td, 0.161874, 1.301333);
		  PlayerTextDrawAlignment(playerid, temp_td, 1);
		  PlayerTextDrawColor(playerid, temp_td, -1);
		  PlayerTextDrawSetShadow(playerid, temp_td, 0);
		  PlayerTextDrawSetOutline(playerid, temp_td, 1);
		  PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		  PlayerTextDrawFont(playerid, temp_td, 1);
		  PlayerTextDrawSetProportional(playerid, temp_td, 1);
		  PlayerTextDrawShow(playerid, temp_td);
		  GoodNoteData[playerid][free_pos][Editor1] = temp_td;

		  temp_td = CreatePlayerTextDraw(playerid, 601.250000, pos_y+3.3, "W,A,S,D~n~Espacio + W,A,S,D~n~MAYUS + A,D~n~MAYUS + W,S~n~INTRO");
		  PlayerTextDrawLetterSize(playerid, temp_td, 0.161874, 1.301333);
		  PlayerTextDrawAlignment(playerid, temp_td, 3);
		  PlayerTextDrawColor(playerid, temp_td, 597097215);
		  PlayerTextDrawUseBox(playerid, temp_td, true);
		  PlayerTextDrawBoxColor(playerid, temp_td, 0);
		  PlayerTextDrawSetShadow(playerid, temp_td, 0);
		  PlayerTextDrawSetOutline(playerid, temp_td, 1);
		  PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		  PlayerTextDrawFont(playerid, temp_td, 1);
		  PlayerTextDrawSetProportional(playerid, temp_td, 1);
		  PlayerTextDrawShow(playerid, temp_td);
		  GoodNoteData[playerid][free_pos][Editor2] = temp_td;

	}	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 16)//Pirula
	{
		Noti_Pirula[playerid] = free_pos;
		new Float:p_y;
		p_y = 13.0;
		pos_y += 3.0;
		temp_td = CreatePlayerTextDraw(playerid, 497.799987, pos_y, "");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.237994, 1.263998);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][EfectoP] = temp_td;
		GoodNoteData[playerid][free_pos][Barra_P]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.000000, 0x006DFF98, 100);
		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_P], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_P],EfectoPirula[playerid]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_P]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_P]);
		Noti_Pirula[playerid] = free_pos;
	}	
	
	if(time == 0) {
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIME_OUT] = 0;
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIMER] = 0;
	} else {
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIME_OUT] = time + Timestamp();
		GoodNoteData[playerid][free_pos][GOOD_NOTE_NOTI] = noti;
		if(noti < 10 && noti != 90) TiempoNotificaciones[playerid][noti] = 6;
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIMER] = SetTimerEx("DestroyGoodNote", time * 1000, false, "dd", playerid, GoodNoteLastId);
	}
	if(sound) {
		PlayerPlaySound(playerid, GoodNoteSound, 0.0, 0.0, 0.0);
	}
	GoodNoteData[playerid][free_pos][GOOD_NOTE_ID] = GoodNoteLastId;
	return GoodNoteLastId;
}
stock Notificador2(playerid, const texto[], const logo[] = "hud:radar_centre",tiempo = 7)
{
    if(JugadorLogeado[playerid] != 0 && IsPlayerConnected(playerid))
    {
        new TextoCadena[600];
        format(TextoCadena,sizeof(TextoCadena), "%s", texto);
        if(Tipo_Notificaciones == 1)
        {
            CrearNotificacion(playerid,logo, TextoCadena,tiempo,0xFFFFFFDD,0x000000FF);
        }
        else SendNotification(playerid, TextoCadena, tiempo);
    }
    return 1;
}
stock SetGoodNoteSound(sound)
{
	GoodNoteSound = sound;
	return 1;
}
stock SetGoodNoteDirection(type)
{
	switch(type)
	{
		case GN_DIRECTION_UP, GN_DIRECTION_DOWN:
		{
			GoodNoteDirection = type;
			return 1;
		}
	}
	return 0;
}
stock SetGoodNotePos(Float:pos_x, Float:pos_y)
{
	GoodNotePosX = pos_x;
	GoodNotePosY = pos_y;
	return 1;
}

stock SetGoodNotePos2(Float:pos_y)
{
	GoodNotePosY2 = pos_y;
	return 1;
}
stock DestroyNotifaciones(playerid)
{
	for(new pos = 0; pos < MAX_GOOD_NOTES; pos++)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_TEXT]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp4]);	
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_ICO]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta1]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta2]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta3]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoA]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_A]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca1]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescando]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescando]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][CamioTD]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Ico]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Name]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Desc]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD4]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Hambre]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Hambre]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Sed]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Sed]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Informe1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Informe2]);

		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoXP]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_XP]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Editor1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Editor2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoP]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_P]);
	}
}
forward DestroyGoodNote(playerid, goodnoteid);
public DestroyGoodNote(playerid, goodnoteid)
{
	static pos;
	pos = gn_FindGoodNotePosById(playerid, goodnoteid);
	if(pos == -1) return 1;
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TIMER] != 0) {
		KillTimer(GoodNoteData[playerid][pos][GOOD_NOTE_TIMER]);
	}
	PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_TEXT]);
	PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_TEXT]);
	GoodNoteData[playerid][pos][GOOD_NOTE_ID] = 0;
	if(strfind(GoodNoteData[playerid][pos][GOOD_NOTE_TEXT_I], "none", true) != -1)
	{
		//
	}
	else
	{
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_ICO]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_ICO]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 1)
	{
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta1]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta2]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta3]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta4]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 2)
	{
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Job1]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Job2]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Job3]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Job4]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Exp1]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Exp2]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Exp3]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Exp4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp4]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Camionero]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescador]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Minero]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Basurero]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Camionero]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescador]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Minero]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Basurero]);
		Noti_Habilidad[playerid] = -1;
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 3)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoA]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_A]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 4)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST3]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 5)
	{		
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca2]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 6)
	{		
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca1]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescando]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescando]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 7)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][CamioTD]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 8)
	{	
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Ico]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Name]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Desc]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B4]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 9)
	{	
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD4]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Hambre]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Hambre]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Sed]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Sed]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 10)
	{	
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote1]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote2]);
	}
 	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 11)
	{	
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Informe1]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Informe2]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 12)
	{	
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote1]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote2]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 13)
	{
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay1]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay2]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay3]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay4]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 14)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoXP]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_XP]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 15)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Editor1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Editor2]);
	}

	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 16)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoP]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_P]);
	}
	
 	if(GoodNoteData[playerid][pos][GOOD_NOTE_NOTI] < 10){ TiempoNotificaciones[playerid][GoodNoteData[playerid][pos][GOOD_NOTE_NOTI]] = 0; }
	GoodNoteData[playerid][pos][GOOD_NOTE_NOTI] = 90;
	if(pos + 1 >= MAX_GOOD_NOTES) return 1;
	for(new j = pos + 1, time; j < MAX_GOOD_NOTES; j++)
	{
		if(GoodNoteData[playerid][j][GOOD_NOTE_ID] == 0) continue;
		if(GoodNoteData[playerid][j][GOOD_NOTE_TIME_OUT] == 0) {
			CrearNotificacion(
			playerid,GoodNoteData[playerid][j][GOOD_NOTE_TEXT_I], GoodNoteData[playerid][j][GOOD_NOTE_TEXT], 0,
			GoodNoteData[playerid][j][GOOD_NOTE_COL_TEXT], GoodNoteData[playerid][j][GOOD_NOTE_COL_BG], 0
			,300,GoodNoteData[playerid][j][GOOD_NOTE_TYPE],GoodNoteData[playerid][j][GOOD_NOTE_NOTI]);
		} else {
			time = GoodNoteData[playerid][j][GOOD_NOTE_TIME_OUT] - Timestamp();
			if(time > 0) {
				CrearNotificacion(
				playerid,GoodNoteData[playerid][j][GOOD_NOTE_TEXT_I], GoodNoteData[playerid][j][GOOD_NOTE_TEXT], time,
				GoodNoteData[playerid][j][GOOD_NOTE_COL_TEXT], GoodNoteData[playerid][j][GOOD_NOTE_COL_BG], 0
				,300,GoodNoteData[playerid][j][GOOD_NOTE_TYPE],GoodNoteData[playerid][j][GOOD_NOTE_NOTI]);
			}
		}
		DestroyGoodNote(playerid, GoodNoteData[playerid][j][GOOD_NOTE_ID]);
		return 1;
	}
	//NotificacionesP(playerid);
	return 1;
}
stock gn_FindGoodNotePosById(playerid, goodnoteid)
{
	for(new i = 0; i < MAX_GOOD_NOTES; i++)
	{
		if(GoodNoteData[playerid][i][GOOD_NOTE_ID] == goodnoteid) return i;
	}
	return -1;
}
stock gn_GetFreeNotePos(playerid)
{
	for(new i = 0; i < MAX_GOOD_NOTES; i++)
	{
		if(GoodNoteData[playerid][i][GOOD_NOTE_ID] == 0) {
			return i;
		}
	}
	return -1;
}
stock gn_GetLineOfString(const string[])
{
	new lines_count = 1;
	lines_count = strlen(string)/23;
	return lines_count;
}


stock Desbug(const string[])
{
	new
	szFixed[1024],
	iPos,
	iLen;
	for (iLen = strlen(string); iPos < iLen; iPos ++)
	switch (string[iPos])
	{
		case 'à':   szFixed[iPos] = 151;
		case 'á':   szFixed[iPos] = 152;
		case 'â':   szFixed[iPos] = 153;
		case 'ä':   szFixed[iPos] = 154;
		case 'À':   szFixed[iPos] = 128;
		case 'Á':   szFixed[iPos] = 129;
		case 'Â':   szFixed[iPos] = 130;
		case 'Ä':   szFixed[iPos] = 131;
		case 'è':   szFixed[iPos] = 157;
		case 'é':   szFixed[iPos] = 158;
		case 'ê':   szFixed[iPos] = 159;
		case 'ë':   szFixed[iPos] = 160;
		case 'È':   szFixed[iPos] = 134;
		case 'É':   szFixed[iPos] = 135;
		case 'Ê':   szFixed[iPos] = 136;
		case 'Ë':   szFixed[iPos] = 137;
		case 'ì':   szFixed[iPos] = 161;
		case 'í':   szFixed[iPos] = 162;
		case 'î':   szFixed[iPos] = 163;
		case 'ï':   szFixed[iPos] = 164;
		case 'Ì':   szFixed[iPos] = 138;
		case 'Í':   szFixed[iPos] = 139;
		case 'Î':   szFixed[iPos] = 140;
		case 'Ï':   szFixed[iPos] = 141;
		case 'ò':   szFixed[iPos] = 165;
		case 'ó':   szFixed[iPos] = 166;
		case 'ô':   szFixed[iPos] = 167;
		case 'ö':   szFixed[iPos] = 168;
		case 'Ò':   szFixed[iPos] = 142;
		case 'Ó':   szFixed[iPos] = 143;
		case 'Ô':   szFixed[iPos] = 144;
		case 'Ö':   szFixed[iPos] = 145;
		case 'ù':   szFixed[iPos] = 169;
		case 'ú':   szFixed[iPos] = 170;
		case 'û':   szFixed[iPos] = 171;
		case 'ü':   szFixed[iPos] = 172;
		case 'Ù':   szFixed[iPos] = 146;
		case 'Ú':   szFixed[iPos] = 147;
		case 'Û':   szFixed[iPos] = 148;
		case 'Ü':   szFixed[iPos] = 149;
		case 'ñ':   szFixed[iPos] = 174;
		case 'Ñ':   szFixed[iPos] = 173;
		case '¡':   szFixed[iPos] = 64;
		case '¿':   szFixed[iPos] = 175;
		case '`':   szFixed[iPos] = 177;
		case '&':   szFixed[iPos] = 38;
		default:    szFixed[iPos] = string[iPos];
	}
	return szFixed;
}
stock SendFormatNotification(playerid, const text[], {Float, _}:...)
{
	static
	    args,
	    str[192];

	if ((args = numargs()) <= 2)
	{
	    Notificador2(playerid, text);
	}
	else
	{
		while (--args >= 2)
		{
			#emit LCTRL 5
			#emit LOAD.alt args
			#emit SHL.C.alt 2
			#emit ADD.C 12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S text
		#emit PUSH.C 192
		#emit PUSH.C str
		#emit LOAD.S.pri 8
		#emit CONST.alt 4
		#emit ADD
		#emit PUSH.pri
		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4


        Notificador2(playerid, str);

		#emit RETN
	}
	return 1;
}
stock MarcarGPSTaxista(playerid, i, Float:X, Float:Y, Float:Z,Float:zize)
{
	if(Taxista[playerid] != INVALID_PLAYER_ID && GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
	{
		if(IsPlayerConnected(i))
		{
			SetPlayerCheckpoint(i, X, Y, Z, zize);
			ShowPlayerMessage(i, "~y~Tu pasajero marcó el punto a dónde quiere ir.");
			ShowPlayerMessage(playerid, "~y~Le indicaste al taxista a dónde quieres ir.");
		}
	}
}
stock StartPlayerPath(playerid, Float:X, Float:Y, Float:Z,Float:zize)
{
	SetPlayerCheckpoint(playerid, X, Y, Z, zize);

	MarcarGPSTaxista(playerid, Taxista[playerid], X, Y, Z, zize);
	if(!IsPlayerNPC(playerid))
	{
		SetTracingColor(playerid, GPS_COLOR);
		if(IsPlayerInAnyVehicle(playerid)) StartTracing(playerid, X, Y, Z);
	}
	return 1;
}
stock StartPlayerPath2(playerid, Float:X, Float:Y, Float:Z,Float:zize)
{

	SetPlayerCheckpoint(playerid, X, Y, Z, zize);

	return 1;
}
stock DesocuparCasa(casa)
{
	if(casa > 0 && casa != -1)
	{
		if(PropInfo[casa][pIDPropietario] > 0)
		{
			new pid = GetPlayerID2(PropInfo[casa][pPropietario]);
			if(pid != -1)
			{
				if(PLAYER_INFO[pid][CasaID][0] == casa) PLAYER_INFO[pid][CasaID][0] = 0;
				if(PLAYER_INFO[pid][CasaID][1] == casa) PLAYER_INFO[pid][CasaID][1] = 0;
				if(PLAYER_INFO[pid][CasaID][2] == casa) PLAYER_INFO[pid][CasaID][2] = 0;
				if(PLAYER_INFO[pid][CasaID][3] == casa) PLAYER_INFO[pid][CasaID][3] = 0;
				MensajeAdminEx(4, COLOR_CHEAT, "Casa eliminada jugador conectado. - ID: %d - Nombre: %s",pid,PropInfo[casa][pPropietario]);
			}
		}
		mysql_format(handle_db,QUERY_BUFFER,sizeof(QUERY_BUFFER),"UPDATE usuarios SET CasaID1 = '0' WHERE CasaID1 = '%d'",casa);
		mysql_tquery(handle_db,QUERY_BUFFER);
		mysql_format(handle_db,QUERY_BUFFER,sizeof(QUERY_BUFFER),"UPDATE usuarios SET CasaID2 = '0' WHERE CasaID2 = '%d'",casa);
		mysql_tquery(handle_db,QUERY_BUFFER);
		mysql_format(handle_db,QUERY_BUFFER,sizeof(QUERY_BUFFER),"UPDATE usuarios SET CasaID3 = '0' WHERE CasaID3 = '%d'",casa);
		mysql_tquery(handle_db,QUERY_BUFFER);
		mysql_format(handle_db,QUERY_BUFFER,sizeof(QUERY_BUFFER),"UPDATE usuarios SET CasaID4 = '0' WHERE CasaID4 = '%d'",casa);
		mysql_tquery(handle_db,QUERY_BUFFER);
		PropInfo[casa][pEnVenta] = 1;
		format(PropInfo[casa][pPropietario],40,"Nadie");
		PropInfo[casa][pAbierta] = 1;
		PropInfo[casa][pRoperoAbierto] = 0;
		PropInfo[casa][pIDPropietario] = 0;
		mysql_format(handle_db,QUERY_BUFFER,sizeof(QUERY_BUFFER),"UPDATE `propiedades` SET `Propietario`='Nadie',`IDPropietario`='0',`EnVenta`='1',`EnUso`='1' WHERE `ID`='%d'",casa);
		mysql_tquery(handle_db,QUERY_BUFFER,"","");
		BorrarLabelCasa(casa);
		GuardarPropiedad(casa);
		CargarPropiedad(casa);
		new string1[150];
		format(string1,150,"{CCCCCC}(Administracion): la casa ID %d fue desocupada automáticamente.",casa);
		MensajeAdmin(-1, string1, 4);
	}
}
stock AnunciosAleatorios()
{
    new a = random(10) + random(3);
    switch(a)
    {
        case 0: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}¿Sabias que puedes abrir el inventario pulsando la letra {"COLOR_GM"}N{ffffff}?");
        case 1: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}Administra el /baul de cualquier vehiculo usando {"COLOR_GM"}/maletero{ffffff}.");
        case 2: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}Ahora puedes ganar totems con tu banda conquistando {"COLOR_GM"}/grafitis{ffffff}?");
        case 3: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}¡Adquiere {FFFF00}GVIP {ffffff}en nuestra web: {"COLOR_GM"}https://"WEB_INDEX"{ffffff} por tan solo 120 Totems.");
        case 4: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}Recuerda agregarnos a favoritos {"COLOR_GM"}"IP_SERVER":7777");
        case 5: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}¿Sabias que podías trabajar tu propia gasolinera teniendo un Roadtrain y trailer?");
        case 6: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}¡Ahora puedes vender tu casa amueblada a otro jugador!");
        case 7: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}Tenemos {"COLOR_GM"}actualizaciones{ffffff} constantes y tu eres nuestro mayor motivo.");
        case 8: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}¿Cansado de colocar siempre tu contraseña al ingresar? Activa en la /web el {"COLOR_GM"}ingreso automatico{ffffff}.");
        case 9: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}¿Eres de /android? ¿Quieres robar tiendas? usa {"COLOR_GM"}/robar tienda");
        case 10: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}Entérate de eventos, noticias e interactua con tus amigos del servidor ingresando al {"COLOR_GM"}/discord{ffffff}.");
		case 11: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}Ahora puedes indicarle a tu taxista el lugar de destino usando {"COLOR_GM"}/gps{ffffff}.");
        default: SendClientMessageToAll(-1, "{"COLOR_GM"}[Nexus]: {ffffff}Agreganos a favoritos {"COLOR_GM"}"IP_SERVER":7777");
    }
    return 1;
}

stock TimeConvertEx2(sec, &days, &hours, &minutes, &seconds)
{
	days = floatround(sec / 86400);
	hours = floatround((sec - (days * 86400)) / 3600);
	minutes = floatround((sec - (days * 86400) - (hours * 3600)) / 60);
	seconds = sec % 60;
   	return 1;
}
stock TimeConvertExAsText(sec, bool:lastMinute = false)
{
	new string[128] = "", auxString[32];
	
	if(lastMinute && sec < 60) {
		string = "menos de 1 minuto";
		return string;
	}

	if(sec <= 0) {
		string = "nada";
		return string;
	}

	new days, hours, minutes, seconds;
	TimeConvertEx2(sec, days, hours, minutes, seconds);

	if(days) {
		format(auxString, sizeof auxString, "%d días", days);
		strcat(string, auxString);
	}

	if(hours) {
		if(strlen(string) > 0) strcat(string, " ");
		format(auxString, sizeof auxString, "%d horas", hours);
		strcat(string, auxString);
	}

	if(minutes) {
		if(strlen(string) > 0) strcat(string, " ");
		format(auxString, sizeof auxString, "%d minutos", minutes);
		strcat(string, auxString);
	}

	if(seconds) {
		if(strlen(string) > 0) strcat(string, " ");
		format(auxString, sizeof auxString, "%d segundos", seconds);
		strcat(string, auxString);
	}
   	return string;
}
