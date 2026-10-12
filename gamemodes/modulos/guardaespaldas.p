function OnDialogResponseGP()
{
        case C_GUARDA:
        {
			if(response)
			{
				ShowPlayerDialog(playerid, DIALOG_GE_CREAR, DIALOG_STYLE_INPUT, "Ingresa el apodo de tu guardaespaldas", "Ingresa el nombre que quieres para tu Guardaespaldas:", "Aceptar", "Cancelar");
			}
		}
		case C_GUARDA2:
        {
			if(response)
			{
				ShowPlayerDialog(playerid, DIALOG_GE_CREAR2, DIALOG_STYLE_INPUT, "Ingresa el apodo de tu guardaespaldas", "Ingresa el nombre que quieres para tu Guardaespaldas:", "Aceptar", "Cancelar");
			}
		}
		case DIALOG_GE_CREAR:
		{
  			if(!response) return 1;
            if(response)
            {
				if(strlen(inputtext) < 2 || strlen(inputtext) > 15)
				{
					return SendClientMessage(playerid, -1, "Solo (Nombre) ejemplo Estiven es permitido para el nombre de los NPC.");
				}
				if(PLAYER_INFO[playerid][T_Guarda] == 0)
				{
			    	CreateNPCP(playerid, 0, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda2] == 0)
				{
			    	CreateNPCP(playerid, 1, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda3] == 0)
				{
			    	CreateNPCP(playerid, 2, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda4] == 0)
				{
			    	CreateNPCP(playerid, 3, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda5] == 0)
				{
			    	CreateNPCP(playerid, 4, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda6] == 0)
				{
			    	CreateNPCP(playerid, 5, inputtext);
				}
				ShowPlayerMessage(playerid, "~g~~h~Creando...");			
			}
		}
		case DIALOG_GE_CREAR2:
		{
  			if(!response) return 1;
            if(response)
            {
				if(PLAYER_INFO[playerid][T_Guarda] == 0)
				{
			    	CreateNPCP2(playerid, 0, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda2] == 0)
				{
			    	CreateNPCP2(playerid, 1, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda3] == 0)
				{
			    	CreateNPCP2(playerid, 2, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda4] == 0)
				{
			    	CreateNPCP2(playerid, 3, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda5] == 0)
				{
			    	CreateNPCP2(playerid, 4, inputtext);
				}
				else if(PLAYER_INFO[playerid][T_Guarda6] == 0)
				{
			    	CreateNPCP2(playerid, 5, inputtext);
				}
				ShowPlayerMessage(playerid, "~g~~h~Creando...");			
			}
		}
		case G_Disparar:
		{
  			if(!response) return 1;
            if(response)
            {
				if(!IsPlayerConnected(strval(inputtext))) return SCM(playerid, -1, "Jugador no conectado.");
				if(!EstaEnP(playerid,strval(inputtext),400)) return Notificador2(playerid,"~r~Debes estar a 400 metros de la persona para ordenar esto.");
				if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
				{
					C_GE_DISPARAR(playerid, strval(inputtext), PLAYER_INFO[playerid][T_Guarda]);
				}
				if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
				{
					C_GE_DISPARAR(playerid, strval(inputtext), PLAYER_INFO[playerid][T_Guarda2]);
				}
				if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
				{
					C_GE_DISPARAR(playerid, strval(inputtext), PLAYER_INFO[playerid][T_Guarda3]);
				}
				if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
				{
					C_GE_DISPARAR(playerid, strval(inputtext), PLAYER_INFO[playerid][T_Guarda4]);
				}
				if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
				{
					C_GE_DISPARAR(playerid, strval(inputtext), PLAYER_INFO[playerid][T_Guarda5]);
				}
				if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
				{
					C_GE_DISPARAR(playerid, strval(inputtext), PLAYER_INFO[playerid][T_Guarda6]);
				}
			}
		}
		case G_Apunta:
		{
            if(!response) return 1;
            if(response)
            {
                if(!IsNumeric(inputtext)) return 1;
                G_Apuntar(playerid, strval(inputtext));
                SendClientMessageEx(playerid, -1, "Tu guardaespaldas ahora apunta a %s", NombreJugador(strval(inputtext)));
            }
		}
		case GUARDA:
		{
		    if(response)
		    {
		        switch(listitem)
		        {
					case 0:
					{
						if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
						{
							C_GE_SEGUIR(playerid);
						}
						else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
						{
							C_GE_SEGUIR2(playerid);
						}
						else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
						{
							C_GE_SEGUIR3(playerid);
						}
						else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
						{
							C_GE_SEGUIR4(playerid);
						}
						else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
						{
							C_GE_SEGUIR5(playerid);
						}
						else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
						{
							C_GE_SEGUIR6(playerid);
						}
					}
					case 1:
					{
				    	ShowPlayerDialog(playerid, G_Apunta, DIALOG_STYLE_INPUT, "Apuntar a...", "Coloca la ID del jugador que deseas apuntar:", "Apuntar", "Cancelar");
					}
					case 2:
					{
						if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
						{
							if(G_Atacando[playerid] == 0) {
								ShowPlayerDialog(playerid, G_Disparar, DIALOG_STYLE_INPUT, "Disparar a...", "Coloca la ID del jugador que deseas disparar:", "Disparar", "Cancelar");
							} else { G_ApuntarNo(playerid); G_Atacando[playerid] = 0; }
						}
						if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
						{
							if(G_Atacando2[playerid] == 0) {
								ShowPlayerDialog(playerid, G_Disparar, DIALOG_STYLE_INPUT, "Disparar a...", "Coloca la ID del jugador que deseas disparar:", "Disparar", "Cancelar");
							} else { G_ApuntarNo(playerid); G_Atacando2[playerid] = 0; }
						}
						if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
						{
							if(G_Atacando3[playerid] == 0) {
								ShowPlayerDialog(playerid, G_Disparar, DIALOG_STYLE_INPUT, "Disparar a...", "Coloca la ID del jugador que deseas disparar:", "Disparar", "Cancelar");
							} else { G_ApuntarNo(playerid); G_Atacando3[playerid] = 0; }
						}
						if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
						{
							if(G_Atacando3[playerid] == 0) {
								ShowPlayerDialog(playerid, G_Disparar, DIALOG_STYLE_INPUT, "Disparar a...", "Coloca la ID del jugador que deseas disparar:", "Disparar", "Cancelar");
							} else { G_ApuntarNo(playerid); G_Atacando3[playerid] = 0; }
						}
						if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
						{
							if(G_Atacando5[playerid] == 0) {
								ShowPlayerDialog(playerid, G_Disparar, DIALOG_STYLE_INPUT, "Disparar a...", "Coloca la ID del jugador que deseas disparar:", "Disparar", "Cancelar");
							} else { G_ApuntarNo(playerid); G_Atacando5[playerid] = 0; }
						}
						if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
						{
							if(G_Atacando6[playerid] == 0) {
								ShowPlayerDialog(playerid, G_Disparar, DIALOG_STYLE_INPUT, "Disparar a...", "Coloca la ID del jugador que deseas disparar:", "Disparar", "Cancelar");
							} else { G_ApuntarNo(playerid); G_Atacando6[playerid] = 0; }
						}
					}
					case 3:
					{
					    SendClientMessage(playerid, -1, "Tu guardaespaldas ya no apunta a nadie.");
					    G_ApuntarNo(playerid);
					}
					case 4: //Manejar auto (After)
					{
						if(PLAYER_INFO[playerid][vModelo] > 0 || PLAYER_INFO[playerid][vModelo2] > 0 || PLAYER_INFO[playerid][vModelo3] > 0 || PLAYER_INFO[playerid][vModelo4] > 0 || PLAYER_INFO[playerid][vModelo5] > 0)
						{
							new vehiculo1[360],vehiculo2[360],vehiculo3[360],vehiculo4[360],vehiculo5[360],mensaje[600], count;
							new Float:x,Float:y,Float:z,Float:x2,Float:y2,Float:z2,Float:x3,Float:y3,Float:z3,Float:x4,Float:y4,Float:z4,Float:x5,Float:y5,Float:z5;
							GetVehiclePos(autos[playerid],x,y,z);
							GetVehiclePos(autos2[playerid],x2,y2,z2);
							GetVehiclePos(autos3[playerid],x3,y3,z3);
							GetVehiclePos(autos4[playerid],x4,y4,z4);
							GetVehiclePos(autos5[playerid],x5,y5,z5);
							new Float:L1 = GetPlayerDistanceFromPoint(playerid,x ,y, z);
							new Float:L2 = GetPlayerDistanceFromPoint(playerid,x2,y2,z2);
							new Float:L3 = GetPlayerDistanceFromPoint(playerid,x3,y3,z3);
							new Float:L4 = GetPlayerDistanceFromPoint(playerid,x4,y4,z4);
							new Float:L5 = GetPlayerDistanceFromPoint(playerid,x5,y5,z5);
							if(PLAYER_INFO[playerid][vModelo] > 0)
							{
								LocalizarID[playerid][count] = autos[playerid];
								format(vehiculo1, sizeof(vehiculo1), "Nombre: {FF5454}%s{FFFFFF} | Patente: {FF9C19}%s {FFFFFF}| Distancia: {999999}%.2f m", NombreAuto[GetVehicleModel(autos[playerid])-400], PLAYER_INFO[playerid][vpatente],L1);
								count++;
							}
							if(PLAYER_INFO[playerid][vModelo2] > 0)
							{
								LocalizarID[playerid][count] = autos2[playerid];
								format(vehiculo2, sizeof(vehiculo2), "\nNombre: {FF5454}%s{FFFFFF} | Patente: {FF9C19}%s {FFFFFF}| Distancia: {999999}%.2f m", NombreAuto[GetVehicleModel(autos2[playerid])-400], PLAYER_INFO[playerid][v2patente],L2);
								count++;
							}
							if(PLAYER_INFO[playerid][vModelo3] > 0)
							{
								LocalizarID[playerid][count] = autos3[playerid];
								format(vehiculo3, sizeof(vehiculo3), "\nNombre: {FF5454}%s{FFFFFF} | Patente: {FF9C19}%s {FFFFFF}| Distancia: {999999}%.2f m", NombreAuto[GetVehicleModel(autos3[playerid])-400], PLAYER_INFO[playerid][v3patente],L3);
								count++;
							}
							if(PLAYER_INFO[playerid][vModelo4] > 0)
							{
								LocalizarID[playerid][count] = autos4[playerid];
								format(vehiculo4, sizeof(vehiculo4), "\nNombre: {FF5454}%s{FFFFFF} | Patente: {FF9C19}%s {FFFFFF}| Distancia: {999999}%.2f m", NombreAuto[GetVehicleModel(autos4[playerid])-400], PLAYER_INFO[playerid][v4patente],L4);
								count++;
							}
							if(PLAYER_INFO[playerid][vModelo5] > 0)
							{
								LocalizarID[playerid][count] = autos5[playerid];
								format(vehiculo5, sizeof(vehiculo5), "\nNombre: {FF5454}%s{FFFFFF} | Patente: {FF9C19}%s {FFFFFF}| Distancia: {999999}%.2f m", NombreAuto[GetVehicleModel(autos5[playerid])-400], PLAYER_INFO[playerid][v5patente],L5);
								count++;
							}
							format(mensaje, sizeof(mensaje), "%s%s%s%s%s",vehiculo1,vehiculo2,vehiculo3,vehiculo4,vehiculo5);
							ShowPlayerDialog(playerid, G_AUTO, DIALOG_STYLE_LIST, "Selecciona un vehiculo", mensaje, ">>","Cancelar");
						}
					}
					case 5: // subir a mi auto 
					{
						S_AUTO_GE(playerid);
					}
					case 6: //bajar de un auto
					{
						B_AUTO_GE(playerid);
					}
					case 7: //si nos atacan a uno de los 2
					{
						C_SI_ATACAN(playerid);
					}
					case 8: //Dar medicamentos
					{
						C_DAR_MEDICAMENTOS(playerid);
					}
					case 9:
					{
						C_GE_DESPEDIR(playerid);
					}
					case 10:
					{
						if(PLAYER_INFO[playerid][pID] != 7968) return SendClientMessage(playerid, -1, "Tu no tienes acceso a esto.");	
						ShowPlayerDialog(playerid, ARMAS_GE, DIALOG_STYLE_INPUT, "Guardaespaldas", "Introduzca el numero de arma que quiere para el guardaespalda.\nRifle M4: 31\nDesert Eagle: 24\nEscopeta de combate: 27\nMinigun: 38", "Aceptar", "Cancelar");
					}
					case 11:
					{
						if(PLAYER_INFO[playerid][pID] != 7968) return SendClientMessage(playerid, -1, "Tu no tienes acceso a esto.");
						ShowPlayerDialog(playerid, SKIN_GE, DIALOG_STYLE_INPUT, "Guardaespaldas", "Introduzca el numero de skin que quiere para el guardaespalda.", "Aceptar", "Cancelar");
					}
				}
			}
		}
		case ARMAS_GE:
		{
			if(response)
			{
				if(!IsNumeric(inputtext)) return SendClientMessage(playerid, -1, "Arma invalida.");
				DarArmas_GE(playerid, PLAYER_TEMP[playerid][GE_Seleccionado], strval(inputtext));
			}
		}
		case SKIN_GE:
		{
			if(response)
			{
				if(!IsNumeric(inputtext)) return SendClientMessage(playerid, -1, "Arma invalida.");
				DarSkin_GE(playerid, PLAYER_TEMP[playerid][GE_Seleccionado], strval(inputtext));
			}
		}
		case G_AUTO:
        {
            if(response)
            {
				new npcid;
				if(listitem < 0 || listitem > 9) return 1;
				if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
				{
					npcid = PLAYER_INFO[playerid][T_Guarda];
				}
				else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
				{
					npcid = PLAYER_INFO[playerid][T_Guarda2];
				}
				else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
				{
					npcid = PLAYER_INFO[playerid][T_Guarda3];
				}
				else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
				{
					npcid = PLAYER_INFO[playerid][T_Guarda4];
				}
				else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
				{
					npcid = PLAYER_INFO[playerid][T_Guarda5];
				}
				else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
				{
					npcid = PLAYER_INFO[playerid][T_Guarda6];
				}
				new Float:x,Float:y,Float:z, Float:x2, Float:y2, Float:z2;
				if(!IsSeatTaken(LocalizarID[playerid][listitem], 0))
				{
					GetVehiclePos(LocalizarID[playerid][listitem], x,y,z);
					GetPlayerPos(playerid, x2, y2, z2);
					if(!EstaEn(playerid, 15.0, x, y, z)) return SCM(playerid, -1, "El vehículo esta muy lejos del guardaespaldas.");
					FCNPC_EnterVehicle(npcid, LocalizarID[playerid][listitem], 0, FCNPC_MOVE_TYPE_WALK);
					guardaespaldabot[npcid][manejando] = 1;    
				} else {
					ShowPlayerMessage(playerid, "Ese vehículo ya tiene conductor.");
				}
            }
        }
}

public FCNPC_OnGiveDamage(npcid, damagedid, Float:amount, weaponid, bodypart)
{
	new theplayer = INVALID_PLAYER_ID;
	foreach(new i : Player) {
		if(PLAYER_INFO[i][T_Guarda] == npcid) {
			theplayer = i;
		}
	}
	if(theplayer == INVALID_PLAYER_ID) return true;
	
	if(SiNosAtacan[theplayer] == true) {
		new Float:Health;
		GetPlayerHealth(damagedid, Health);
		if(Health <= 0) {
			FCNPC_StopAttack(npcid);
			G_Atacando[theplayer] = 0;
		}
	}
	return true;
}
public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
	if (!IsPlayerConnected(issuerid) || !G_Valido(npcid))
	{
		return 1;
	}
	new theplayer = INVALID_PLAYER_ID;
	foreach(new i : Player) {
		if(PLAYER_INFO[i][T_Guarda] == npcid) {
			theplayer = i;
		}
		if(PLAYER_INFO[i][T_Guarda2] == npcid) {
			theplayer = i;
		}
		if(PLAYER_INFO[i][T_Guarda3] == npcid) {
			theplayer = i;
		}
		if(PLAYER_INFO[i][T_Guarda4] == npcid) {
			theplayer = i;
		}
		if(PLAYER_INFO[i][T_Guarda5] == npcid) {
			theplayer = i;
		}
		if(PLAYER_INFO[i][T_Guarda6] == npcid) {
			theplayer = i;
		}
	}
	if(theplayer == INVALID_PLAYER_ID) return true;
	new playerid = theplayer;
   	if(SiNosAtacan[playerid] == true) {
		G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda]);
		G_Atacando[playerid] = 1;
	}
   	if(SiNosAtacan2[playerid] == true) {
		G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda2]);
		G_Atacando2[playerid] = 1;
	}
   	if(SiNosAtacan3[playerid] == true) {
		G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda3]);
		G_Atacando3[playerid] = 1;
	}
   	if(SiNosAtacan4[playerid] == true) {
		G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda4]);
		G_Atacando4[playerid] = 1;
	}
   	if(SiNosAtacan5[playerid] == true) {
		G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda5]);
		G_Atacando5[playerid] = 1;
	}
   	if(SiNosAtacan6[playerid] == true) {
		G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda6]);
		G_Atacando6[playerid] = 1;
	}
	new string[160];
	format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),guardaespaldabot[npcid][guarNombre],NombreJugador(theplayer));
	UpdateDynamic3DTextLabelText(guardaespaldabot[npcid][TextGuarda], 0xFFFFFFAA, string);
	return 1;
}
stock TakeDamageBOTS(playerid, issuerid)
{
	if(IsPlayerConnected(playerid) && FCNPC_IsValid(issuerid))
	{
		if(SiNosAtacan[playerid] == true) {
			G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda]);
			G_Atacando[playerid] = 1;
		}
		if(SiNosAtacan2[playerid] == true) {
			G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda2]);
			G_Atacando2[playerid] = 1;
		}
		if(SiNosAtacan3[playerid] == true) {
			G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda3]);
			G_Atacando3[playerid] = 1;
		}
		if(SiNosAtacan4[playerid] == true) {
			G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda4]);
			G_Atacando4[playerid] = 1;
		}
		if(SiNosAtacan5[playerid] == true) {
			G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda5]);
			G_Atacando5[playerid] = 1;
		}
		if(SiNosAtacan6[playerid] == true) {
			G_Atacar(playerid, issuerid,PLAYER_INFO[playerid][T_Guarda6]);
			G_Atacando6[playerid] = 1;
		}
	}
	return 1;
}

public FCNPC_OnDeath(npcid, killerid, reason)
{
	foreach(new i : Player)
	{
		DESTROY_GE(i, killerid, npcid);
		DESTROY_GE2(i, killerid, npcid);
		DESTROY_GE3(i, killerid, npcid);
		DESTROY_GE4(i, killerid, npcid);
		DESTROY_GE5(i, killerid, npcid);
		DESTROY_GE6(i, killerid, npcid);
	}
	return 1;
}
	CMD:contratar(playerid, params[])
	{
		new count = 0;
		if(strcmp(params, "guardaespaldas", true) == 0)
		{
			if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1412.1326, -1663.7592, 13.5469)) return 1;
			if(PLAYER_INFO[playerid][T_Guarda] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda]))
			{
				count++;
			}
			if(PLAYER_INFO[playerid][T_Guarda2] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda2]))
			{
				count++;
			}
			if(PLAYER_INFO[playerid][T_Guarda3] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda3]))
			{
				count++;
			}
			if(PLAYER_INFO[playerid][T_Guarda4] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda4]))
			{
				count++;
			}
			if(PLAYER_INFO[playerid][T_Guarda5] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda5]))
			{
				count++;
			}
			if(PLAYER_INFO[playerid][T_Guarda6] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda6]))
			{
				count++;
			}
			if(count > 5) return SCM(playerid, -1, "Ya tienes demasiados guardaespaldas.");
			if(PLAYER_INFO[playerid][Moneda] < 25 && PLAYER_TIMES[playerid][TiempoGuarda] < gettime()) return SCM(playerid, -1, "Necesitas 25 LZ para contratar un guardaespaldas.");
			ShowPlayerDialog(playerid, C_GUARDA, DIALOG_STYLE_MSGBOX, "Guardaespaldas - Contratar:","{FFFFFF}No tienes ningun contrato de guardaespaldas vigente\n\nAl contratar un guardaespaldas, tendras un contrato de 12\nhoras, en el cual podras despedir y contratar guardaespaldas\nsin costo adicional. Una vez expirado este contrato, tendras\nque volver a pagar. Puedes consultar el estado de tu contrato\nsin costo alguno aquí.\n\nPara mas informacion sobre los guardaespaldas, usa\n{DBED15}/ayuda guardaespaldas{FFFFFF}.\n\nADVERTENCIA: El mal uso de un guardaespaldas (bugear, etc).\nes sancionable. Si eres sancionado con el guardaespaldas, se\ncancelara tu contrato.\n\nDeseas contratar un guardaespaldas por 12 horas?\n(costo: 25 LZ).", "Contratar", "Cancelar");
		}
		return 1;
	}
	CMD:guardias(playerid)
	{
		new count;
		if(PLAYER_INFO[playerid][pID] != 7968) return SendClientMessage(playerid, -1, "Tu no tienes acceso a esto.");
		if(!IsPlayerInRangeOfPoint(playerid, 5.0,1126.3505,-2041.9137,69.8812)) return 1;
		if(PLAYER_INFO[playerid][T_Guarda] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda]))
		{
			count++;
		}
		if(PLAYER_INFO[playerid][T_Guarda2] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda2]))
		{
			count++;
		}
		if(PLAYER_INFO[playerid][T_Guarda3] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda3]))
		{
			count++;
		}
		if(PLAYER_INFO[playerid][T_Guarda4] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda4]))
		{
			count++;
		}
		if(PLAYER_INFO[playerid][T_Guarda5] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda5]))
		{
			count++;
		}
		if(PLAYER_INFO[playerid][T_Guarda6] != 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda6]))
		{
			count++;
		}
		if(count > 5) return MenuGuardaEspaldas(playerid);
		ShowPlayerDialog(playerid, C_GUARDA2, DIALOG_STYLE_MSGBOX, "Guardias Casa Blanca","{FFFFFF}No tienes ningun contrato de guardaespaldas vigente\n\nAl contratar un guardaespaldas, tendras un contrato de 12\nhoras, en el cual podras despedir y contratar guardaespaldas\nsin costo adicional. Una vez expirado este contrato, tendras\nque volver a pagar. Puedes consultar el estado de tu contrato\nsin costo alguno aquí.\n\nPara mas informacion sobre los guardaespaldas, usa\n{DBED15}/ayuda guardaespaldas{FFFFFF}.\n\nADVERTENCIA: El mal uso de un guardaespaldas (bugear, etc).\nes sancionable. Si eres sancionado con el guardaespaldas, se\ncancelara tu contrato.\n\nDeseas contratar un guardaespaldas por 12 horas?", "Contratar", "Cancelar");
		return 1;
	}
	function CreateNPCP(playerid, id, name[])
	{
		if(strlen(name) < 2 || strlen(name) > 15)	return SendClientMessage(playerid, -1,"Solo (Nombre) ejemplo Estiven es permitido para el nombre de los NPC.");
		if(strfind(name,"=",true) != -1 || strfind(name,"´",true) != -1 || strfind(name,"'",true) != -1 || strfind(name,"`",true) != -1 || strfind(name,",",true) != -1 || strfind(name,"¨",true) != -1 || strfind(name,"%",true) != -1) return SendClientMessage(playerid, -1, "Ingresa un apodo valido.");
		if(id == 0)
		{
			format(Name_GE[playerid],144,"%s",name);
			new string[256], name_f[MAX_PLAYER_NAME + 1];
			format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
			new npcid = FCNPC_Create(name_f);
			FCNPC_Spawn(npcid, 164, gSpawn[0][0], gSpawn[0][1], gSpawn[0][2]);
			FCNPC_SetAngle(npcid, 0.0000);
			FCNPC_SetWeapon(npcid, 22);
			FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
			FCNPC_UseInfiniteAmmo(npcid, true);
			ColorJugadorDefault(npcid);
			guardaespaldabot[npcid][gVida] = 250.0;
			PLAYER_INFO[playerid][Moneda] -= 25;
			format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
			FCNPC_SetHealth(npcid, 250.0);
			guardaespaldabot[npcid][gExiste] = 1;
			PLAYER_INFO[playerid][T_Guarda] = npcid;
			PLAYER_TIMES[playerid][TiempoGuarda] = gettime()+43200;
			format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name, NombreJugador(playerid));
			guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
			SendClientMessageEx(playerid, -1, "Has contratado a %s por 25 LZ, para darle ordenes usa {DBED15}/guardaespaldas{FFFFFF}.",name);			ContarNPC++;
		} 
		if(id == 1)
		{
			format(Name_GE2[playerid],144,"%s",name);
			new string[256], name_f[MAX_PLAYER_NAME + 1];
			format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
			new npcid = FCNPC_Create(name_f);
			FCNPC_Spawn(npcid, 164, gSpawn[0][0], gSpawn[0][1], gSpawn[0][2]);
			FCNPC_SetAngle(npcid, 0.0000);
			FCNPC_SetWeapon(npcid, 22);
			FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
			FCNPC_UseInfiniteAmmo(npcid, true);
			ColorJugadorDefault(npcid);
			PLAYER_INFO[playerid][Moneda] -= 25;
			guardaespaldabot[npcid][gVida] = 250.0;
			format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
			FCNPC_SetHealth(npcid, 250.0);
			guardaespaldabot[npcid][gExiste] = 1;
			PLAYER_INFO[playerid][T_Guarda2] = npcid;
			PLAYER_TIMES[playerid][TiempoGuarda2] = gettime()+43200;
			format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
			guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
			SendClientMessageEx(playerid, -1, "Has contratado a %s por 25 LZ, para darle ordenes usa {DBED15}/guardaespaldas{FFFFFF}.",name);			ContarNPC++;
		}
		if(id == 2)
		{
			format(Name_GE3[playerid],144,"%s",name);
			new string[256], name_f[MAX_PLAYER_NAME + 1];
			format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
			new npcid = FCNPC_Create(name_f);
			FCNPC_Spawn(npcid, 164, gSpawn[0][0], gSpawn[0][1], gSpawn[0][2]);
			FCNPC_SetAngle(npcid, 0.0000);
			FCNPC_SetWeapon(npcid, 22);
			FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
			FCNPC_UseInfiniteAmmo(npcid, true);
			ColorJugadorDefault(npcid);
			PLAYER_INFO[playerid][Moneda] -= 25;
			guardaespaldabot[npcid][gVida] = 250.0;
			format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
			FCNPC_SetHealth(npcid, 250.0);
			guardaespaldabot[npcid][gExiste] = 1;
			PLAYER_INFO[playerid][T_Guarda3] = npcid;
			PLAYER_TIMES[playerid][TiempoGuarda3] = gettime()+43200;
			format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
			guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
			SendClientMessageEx(playerid, -1, "Has contratado a %s por 25 LZ, para darle ordenes usa {DBED15}/guardaespaldas{FFFFFF}.",name);
			ContarNPC++;
		}
		if(id == 3)
		{
			format(Name_GE4[playerid],144,"%s",name);
			new string[256], name_f[MAX_PLAYER_NAME + 1];
			format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
			new npcid = FCNPC_Create(name_f);
			FCNPC_Spawn(npcid, 164, gSpawn[0][0], gSpawn[0][1], gSpawn[0][2]);
			FCNPC_SetAngle(npcid, 0.0000);
			FCNPC_SetWeapon(npcid, 22);
			FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
			FCNPC_UseInfiniteAmmo(npcid, true);
			ColorJugadorDefault(npcid);
			guardaespaldabot[npcid][gVida] = 250.0;
			format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
			FCNPC_SetHealth(npcid, 250.0);
			PLAYER_INFO[playerid][Moneda] -= 25;
			guardaespaldabot[npcid][gExiste] = 1;
			PLAYER_INFO[playerid][T_Guarda4] = npcid;
			PLAYER_TIMES[playerid][TiempoGuarda4] = gettime()+43200;
			format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
			guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
			SendClientMessageEx(playerid, -1, "Has contratado a %s por 25 LZ, para darle ordenes usa {DBED15}/guardaespaldas{FFFFFF}.",name);			ContarNPC++;
		}
		if(id == 4)
		{
			format(Name_GE5[playerid],144,"%s",name);
			new string[256], name_f[MAX_PLAYER_NAME + 1];
			format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
			new npcid = FCNPC_Create(name_f);
			FCNPC_Spawn(npcid, 164, gSpawn[0][0], gSpawn[0][1], gSpawn[0][2]);
			FCNPC_SetAngle(npcid, 0.0000);
			FCNPC_SetWeapon(npcid, 22);
			FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
			FCNPC_UseInfiniteAmmo(npcid, true);
			ColorJugadorDefault(npcid);
			PLAYER_INFO[playerid][Moneda] -= 25;
			guardaespaldabot[npcid][gVida] = 250.0;
			format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
			FCNPC_SetHealth(npcid, 250.0);
			guardaespaldabot[npcid][gExiste] = 1;
			PLAYER_INFO[playerid][T_Guarda5] = npcid;
			PLAYER_TIMES[playerid][TiempoGuarda5] = gettime()+43200;
			format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
			guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
			SendClientMessageEx(playerid, -1, "Has contratado a %s por 25 LZ, para darle ordenes usa {DBED15}/guardaespaldas{FFFFFF}.",name);			ContarNPC++;
		}
		if(id == 5)
		{
			format(Name_GE6[playerid],144,"%s",name);
			new string[256], name_f[MAX_PLAYER_NAME + 1];
			format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
			new npcid = FCNPC_Create(name_f);
			FCNPC_Spawn(npcid, 164, gSpawn[0][0], gSpawn[0][1], gSpawn[0][2]);
			FCNPC_SetAngle(npcid, 0.0000);
			FCNPC_SetWeapon(npcid, 22);
			FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
			FCNPC_UseInfiniteAmmo(npcid, true);
			ColorJugadorDefault(npcid);
			guardaespaldabot[npcid][gVida] = 250.0;
			format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
			FCNPC_SetHealth(npcid, 250.0);
			guardaespaldabot[npcid][gExiste] = 1;
			PLAYER_INFO[playerid][T_Guarda6] = npcid;
			PLAYER_INFO[playerid][Moneda] -= 25;
			PLAYER_TIMES[playerid][TiempoGuarda6] = gettime()+43200;
			format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
			guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
			SendClientMessageEx(playerid, -1, "Has contratado a %s por 25 LZ, para darle ordenes usa {DBED15}/guardaespaldas{FFFFFF}.",name);			ContarNPC++;
		}
		return 1;
	}
	funcion MenuGuardaEspaldas(playerid)
	{
		if(PLAYER_INFO[playerid][T_Guarda] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda]) || PLAYER_INFO[playerid][T_Guarda2] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda2]) || PLAYER_INFO[playerid][T_Guarda3] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda3]) || PLAYER_INFO[playerid][T_Guarda4] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda4]) || PLAYER_INFO[playerid][T_Guarda5] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda5]) || PLAYER_INFO[playerid][T_Guarda6] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda6])) 
		{
			MostrarGuardaespaldasLista2(playerid);
		}
		else return SCM(playerid, -1, "No tienes ningun guardaespaldas contratado.");
		return 1;
	}
	CMD:guardaespaldas(playerid)
	{
		if(PLAYER_INFO[playerid][T_Guarda] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda]) || PLAYER_INFO[playerid][T_Guarda2] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda2]) || PLAYER_INFO[playerid][T_Guarda3] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda3]) || PLAYER_INFO[playerid][T_Guarda4] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda4]) || PLAYER_INFO[playerid][T_Guarda5] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda5]) || PLAYER_INFO[playerid][T_Guarda6] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda6])) 
		{
			MostrarGuardaespaldasLista2(playerid);
		}
		else return SCM(playerid, -1, "No tienes ningun guardaespaldas contratado.");
		return 1;
	}
    C_DAR_MEDICAMENTOS(playerid)
{
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
    {
        if(PLAYER_INFO[playerid][pRemedios] <= 0) return SendClientMessage(playerid,-1,"No tienes medicamentos para darle a tu guarda.");
        new Float:vidaguarda = FCNPC_GetHealth(PLAYER_INFO[playerid][T_Guarda]);
        printf("Vida actual: %f",vidaguarda);
        if(vidaguarda >= 250) return SendClientMessage(playerid,-1,"Tu guarda tiene la vida llena.");
        new Float:nuevavida = vidaguarda+10;
        if(nuevavida > 250.0) nuevavida = 250.0;
        FCNPC_SetHealth(PLAYER_INFO[playerid][T_Guarda], nuevavida);
        PLAYER_INFO[playerid][pRemedios]--;
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
    {
        if(PLAYER_INFO[playerid][pRemedios] <= 0) return SendClientMessage(playerid,-1,"No tienes medicamentos para darle a tu guarda.");
        new Float:vidaguarda = FCNPC_GetHealth(PLAYER_INFO[playerid][T_Guarda2]);
        printf("Vida actual: %f",vidaguarda);
        if(vidaguarda >= 250) return SendClientMessage(playerid,-1,"Tu guarda tiene la vida llena.");
        new Float:nuevavida = vidaguarda+10;
        if(nuevavida > 250.0) nuevavida = 250.0;
        FCNPC_SetHealth(PLAYER_INFO[playerid][T_Guarda2], nuevavida);
        PLAYER_INFO[playerid][pRemedios]--;
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
    {
        if(PLAYER_INFO[playerid][pRemedios] <= 0) return SendClientMessage(playerid,-1,"No tienes medicamentos para darle a tu guarda.");
        new Float:vidaguarda = FCNPC_GetHealth(PLAYER_INFO[playerid][T_Guarda3]);
        printf("Vida actual: %f",vidaguarda);
        if(vidaguarda >= 250) return SendClientMessage(playerid,-1,"Tu guarda tiene la vida llena.");
        new Float:nuevavida = vidaguarda+10;
        if(nuevavida > 250.0) nuevavida = 250.0;
        FCNPC_SetHealth(PLAYER_INFO[playerid][T_Guarda3], nuevavida);
        PLAYER_INFO[playerid][pRemedios]--;
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
    {
        if(PLAYER_INFO[playerid][pRemedios] <= 0) return SendClientMessage(playerid,-1,"No tienes medicamentos para darle a tu guarda.");
        new Float:vidaguarda = FCNPC_GetHealth(PLAYER_INFO[playerid][T_Guarda4]);
        printf("Vida actual: %f",vidaguarda);
        if(vidaguarda >= 250) return SendClientMessage(playerid,-1,"Tu guarda tiene la vida llena.");
        new Float:nuevavida = vidaguarda+10;
        if(nuevavida > 250.0) nuevavida = 250.0;
        FCNPC_SetHealth(PLAYER_INFO[playerid][T_Guarda4], nuevavida);
        PLAYER_INFO[playerid][pRemedios]--;
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
    {
        if(PLAYER_INFO[playerid][pRemedios] <= 0) return SendClientMessage(playerid,-1,"No tienes medicamentos para darle a tu guarda.");
        new Float:vidaguarda = FCNPC_GetHealth(PLAYER_INFO[playerid][T_Guarda5]);
        printf("Vida actual: %f",vidaguarda);
        if(vidaguarda >= 250) return SendClientMessage(playerid,-1,"Tu guarda tiene la vida llena.");
        new Float:nuevavida = vidaguarda+10;
        if(nuevavida > 250.0) nuevavida = 250.0;
        FCNPC_SetHealth(PLAYER_INFO[playerid][T_Guarda5], nuevavida);
        PLAYER_INFO[playerid][pRemedios]--;
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
    {
        if(PLAYER_INFO[playerid][pRemedios] <= 0) return SendClientMessage(playerid,-1,"No tienes medicamentos para darle a tu guarda.");
        new Float:vidaguarda = FCNPC_GetHealth(PLAYER_INFO[playerid][T_Guarda6]);
        printf("Vida actual: %f",vidaguarda);
        if(vidaguarda >= 250) return SendClientMessage(playerid,-1,"Tu guarda tiene la vida llena.");
        new Float:nuevavida = vidaguarda+10;
        if(nuevavida > 250.0) nuevavida = 250.0;
        FCNPC_SetHealth(PLAYER_INFO[playerid][T_Guarda6], nuevavida);
        PLAYER_INFO[playerid][pRemedios]--;
    }
    return 1;
}

DESTROY_GE(i, killerid, npcid)
{
    if(IsPlayerConnected(npcid) && FCNPC_IsValid(npcid) && FCNPC_IsDead(npcid))
    {
        if(PLAYER_INFO[i][T_Guarda] == npcid)
        { 
            PLAYER_INFO[i][T_Guarda] = -1;
            Name_GE[i] = "Vacío";
            SendClientMessage(i, -1, "Tu guardaespaldas murió");
        }
        FCNPC_Destroy(npcid);
        DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
        MensajeAdminEx(4, 0x7e8643FF, "%s (ID: %d) mato al guardaespaldas ID: %d",PLAYER_INFO[killerid][Nickname],killerid,npcid);
    }
    return 1;
}
DESTROY_GE2(i, killerid, npcid)
{
    if(IsPlayerConnected(npcid) && FCNPC_IsValid(npcid) && FCNPC_IsDead(npcid))
    {
        if(PLAYER_INFO[i][T_Guarda2] == npcid)
        { 
            PLAYER_INFO[i][T_Guarda2] = -1;
            Name_GE2[i] = "Vacío";
            SendClientMessage(i, -1, "Tu guardaespaldas murió");
        }
        FCNPC_Destroy(npcid);
        DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
        MensajeAdminEx(4, 0x7e8643FF, "%s (ID: %d) mato al guardaespaldas ID: %d",PLAYER_INFO[killerid][Nickname],killerid,npcid);
    }
    return 1;
}
DESTROY_GE3(i, killerid, npcid)
{
    if(IsPlayerConnected(npcid) && FCNPC_IsValid(npcid) && FCNPC_IsDead(npcid))
    {
        if(PLAYER_INFO[i][T_Guarda3] == npcid)
        { 
            PLAYER_INFO[i][T_Guarda3] = -1;
            Name_GE3[i] = "Vacío";
            SendClientMessage(i, -1, "Tu guardaespaldas murió");
        }
        FCNPC_Destroy(npcid);
        DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
        MensajeAdminEx(4, 0x7e8643FF, "%s (ID: %d) mato al guardaespaldas ID: %d",PLAYER_INFO[killerid][Nickname],killerid,npcid);
    }
    return 1;
}
DESTROY_GE4(i, killerid, npcid)
{  
    if(IsPlayerConnected(npcid) && FCNPC_IsValid(npcid) && FCNPC_IsDead(npcid))
    {
        if(PLAYER_INFO[i][T_Guarda4] == npcid)
        { 
            PLAYER_INFO[i][T_Guarda4] = -1;
            Name_GE4[i] = "Vacío";
            SendClientMessage(i, -1, "Tu guardaespaldas murió");
        }
        FCNPC_Destroy(npcid);
        DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
        MensajeAdminEx(4, 0x7e8643FF, "%s (ID: %d) mato al guardaespaldas ID: %d",PLAYER_INFO[killerid][Nickname],killerid,npcid);
    }
    return 1;
}
DESTROY_GE5(i, killerid, npcid)
{
    if(IsPlayerConnected(npcid) && FCNPC_IsValid(npcid) && FCNPC_IsDead(npcid))
    {
        if(PLAYER_INFO[i][T_Guarda5] == npcid)
        { 
            PLAYER_INFO[i][T_Guarda5] = -1;
            Name_GE5[i] = "Vacío";
            SendClientMessage(i, -1, "Tu guardaespaldas murió");
        }
        FCNPC_Destroy(npcid);
        DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
        MensajeAdminEx(4, 0x7e8643FF, "%s (ID: %d) mato al guardaespaldas ID: %d",PLAYER_INFO[killerid][Nickname],killerid,npcid);
    }
    return 1;
}
DESTROY_GE6(i, killerid, npcid)
{
    if(IsPlayerConnected(npcid) && FCNPC_IsValid(npcid) && FCNPC_IsDead(npcid))
    {
        if(PLAYER_INFO[i][T_Guarda6] == npcid)
        { 
            PLAYER_INFO[i][T_Guarda6] = -1;
            Name_GE6[i] = "Vacío";
            SendClientMessage(i, -1, "Tu guardaespaldas murió");
        }
        FCNPC_Destroy(npcid);
        DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
        MensajeAdminEx(4, 0x7e8643FF, "%s (ID: %d) mato al guardaespaldas ID: %d",PLAYER_INFO[killerid][Nickname],killerid,npcid);
    }
    return 1;
}

C_GE_DISPARAR(playerid, id, npcid)
{
    if(G_Atacando[playerid] == 0)
    {
        G_Atacando[playerid] = 1;
        G_Atacar(playerid, id, npcid);
    }
    else { FCNPC_StopAim(npcid); G_Atacando[playerid] = 0; }
    return 1;
}
DESCONECTAR_GE(playerid)
{
    if(PLAYER_INFO[playerid][T_Guarda] != 0)
    {
        new npcid = PLAYER_INFO[playerid][T_Guarda];
        if(guardaespaldabot[npcid][propietario] == playerid) return 1;
        if(FCNPC_IsValid(npcid))
        {
            FCNPC_Destroy(npcid);
            guardaespaldabot[npcid][gExiste] = 0, PLAYER_INFO[playerid][T_Guarda] = -1;
            ContarNPC--;
            DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
            Name_GE[playerid] = "Vacío";
        }
    }
    if(PLAYER_INFO[playerid][T_Guarda2] != 0)
    {
        new npcid = PLAYER_INFO[playerid][T_Guarda2];
        if(guardaespaldabot[npcid][propietario] == playerid) return 1;
        if(FCNPC_IsValid(npcid))
        {
            FCNPC_Destroy(npcid);
            guardaespaldabot[npcid][gExiste] = 0, PLAYER_INFO[playerid][T_Guarda2] = -1;
            ContarNPC--;
            DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
            Name_GE2[playerid] = "Vacío";
        }
    }
    if(PLAYER_INFO[playerid][T_Guarda3] != 0)
    {
        new npcid = PLAYER_INFO[playerid][T_Guarda3];
        if(guardaespaldabot[npcid][propietario] == playerid) return 1;
        if(FCNPC_IsValid(npcid))
        {
            FCNPC_Destroy(npcid);
            guardaespaldabot[npcid][gExiste] = 0, PLAYER_INFO[playerid][T_Guarda3] = -1;
            ContarNPC--;
            DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
            Name_GE3[playerid] = "Vacío";
        }
    }
    if(PLAYER_INFO[playerid][T_Guarda4] != 0)
    {
        new npcid = PLAYER_INFO[playerid][T_Guarda4];
        if(guardaespaldabot[npcid][propietario] == playerid) return 1;
        if(FCNPC_IsValid(npcid))
        {
            FCNPC_Destroy(npcid);
            guardaespaldabot[npcid][gExiste] = 0, PLAYER_INFO[playerid][T_Guarda4] = -1;
            ContarNPC--;
            DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
            Name_GE4[playerid] = "Vacío";
        }
    }
    if(PLAYER_INFO[playerid][T_Guarda5] != 0)
    {
        new npcid = PLAYER_INFO[playerid][T_Guarda5];
        if(guardaespaldabot[npcid][propietario] == playerid) return 1;
        if(FCNPC_IsValid(npcid))
        {
            FCNPC_Destroy(npcid);
            guardaespaldabot[npcid][gExiste] = 0, PLAYER_INFO[playerid][T_Guarda5] = -1;
            ContarNPC--;
            DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
            Name_GE5[playerid] = "Vacío";
        }
    }
    if(PLAYER_INFO[playerid][T_Guarda6] != 0)
    {
        new npcid = PLAYER_INFO[playerid][T_Guarda6];
        if(guardaespaldabot[npcid][propietario] == playerid) return 1;
        if(FCNPC_IsValid(npcid))
        {
            FCNPC_Destroy(npcid);
            guardaespaldabot[npcid][gExiste] = 0, PLAYER_INFO[playerid][T_Guarda6] = -1;
            ContarNPC--;
            DestroyDynamic3DTextLabel(guardaespaldabot[npcid][TextGuarda]);
            Name_GE6[playerid] = "Vacío";
        }
    }
    return 1;
}
C_GE_DESPEDIR2(playerid)
{
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
    {
       PLAYER_INFO[playerid][T_Guarda] = -1;
       Name_GE[playerid] = "Vacío";
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
    {
       PLAYER_INFO[playerid][T_Guarda2] = -1;
       Name_GE2[playerid] = "Vacío";
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
    {
       PLAYER_INFO[playerid][T_Guarda3] = -1;
       Name_GE3[playerid] = "Vacío";
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
    {
       PLAYER_INFO[playerid][T_Guarda4] = -1;
       Name_GE4[playerid] = "Vacío";
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
    {
       PLAYER_INFO[playerid][T_Guarda5] = -1;
       Name_GE5[playerid] = "Vacío";
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
    {
       PLAYER_INFO[playerid][T_Guarda6] = -1;
       Name_GE6[playerid] = "Vacío";
    }
    return 1;
}
C_GE_DESPEDIR(playerid)
{
    new npcid;
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda];
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda2];
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda3];
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda4];
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda5];
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda6];
    }
    SendClientMessage(playerid, -1, "Has despedido a tu guardaespaldas.");
    FCNPC_Destroy(npcid);
    guardaespaldabot[npcid][gExiste] = 0;
    ContarNPC--;
    C_GE_DESPEDIR2(playerid);
    return 1;
}
C_SI_ATACAN(playerid)
{
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
    {
        if(SiNosAtacan[playerid] == true) 
        {
            SiNosAtacan[playerid] = false;
        }
        else {
            SiNosAtacan[playerid] = true;
        }
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
    {
        if(SiNosAtacan2[playerid] == true) 
        {
            SiNosAtacan2[playerid] = false;
        }
        else {
            SiNosAtacan2[playerid] = true;
        }
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
    {
        if(SiNosAtacan3[playerid] == true) 
        {
            SiNosAtacan3[playerid] = false;
        }
        else {
            SiNosAtacan3[playerid] = true;
        }
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
    {
        if(SiNosAtacan4[playerid] == true) 
        {
            SiNosAtacan4[playerid] = false;
        }
        else {
            SiNosAtacan4[playerid] = true;
        }
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
    {
        if(SiNosAtacan5[playerid] == true) 
        {
            SiNosAtacan5[playerid] = false;
        }
        else {
            SiNosAtacan5[playerid] = true;
        }
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
    {
        if(SiNosAtacan6[playerid] == true) 
        {
            SiNosAtacan6[playerid] = false;
        }
        else {
            SiNosAtacan6[playerid] = true;
        }
    }
    return 1;
}
B_AUTO_GE(playerid)
{
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
    {
        FCNPC_ExitVehicle(PLAYER_INFO[playerid][T_Guarda]);
        guardaespaldabot[PLAYER_INFO[playerid][T_Guarda]][manejando] = 0; 
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
    {
        FCNPC_ExitVehicle(PLAYER_INFO[playerid][T_Guarda2]);
        guardaespaldabot[PLAYER_INFO[playerid][T_Guarda2]][manejando] = 0; 
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
    {
        FCNPC_ExitVehicle(PLAYER_INFO[playerid][T_Guarda3]);
        guardaespaldabot[PLAYER_INFO[playerid][T_Guarda3]][manejando] = 0;
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
    {
        FCNPC_ExitVehicle(PLAYER_INFO[playerid][T_Guarda4]);
        guardaespaldabot[PLAYER_INFO[playerid][T_Guarda4]][manejando] = 0;
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
    {
        FCNPC_ExitVehicle(PLAYER_INFO[playerid][T_Guarda5]);
        guardaespaldabot[PLAYER_INFO[playerid][T_Guarda5]][manejando] = 0;
    }
    else if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
    {
        FCNPC_ExitVehicle(PLAYER_INFO[playerid][T_Guarda6]);
        guardaespaldabot[PLAYER_INFO[playerid][T_Guarda6]][manejando] = 0;
    }
    return 1;
}
S_AUTO_GE(playerid)
{
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
    {
        if(!FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda])) return true;
        if(!IsPlayerInAnyVehicle(playerid)) return true;
        new seat = GetFreeSeat(GetPlayerVehicleID(playerid));
        if(seat == -1) return SendClientMessage(playerid,-1,"No hay espacio en el vehículo para el guarda.");
        new Float:x,Float:y,Float:z;
        FCNPC_GetPosition(PLAYER_INFO[playerid][T_Guarda],x,y,z);
        if(IsPlayerInRangeOfPoint(playerid,50.0,x,y,z)) {
            FCNPC_EnterVehicle(PLAYER_INFO[playerid][T_Guarda],GetPlayerVehicleID(playerid), seat);
        } else { //Lejos, subir sin más
            SendClientMessage(playerid,-1,"El guarda se encuentra demasiado lejos");
        }
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
    {
        if(!FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda2])) return true;
        if(!IsPlayerInAnyVehicle(playerid)) return true;
        new seat = GetFreeSeat(GetPlayerVehicleID(playerid));
        if(seat == -1) return SendClientMessage(playerid,-1,"No hay espacio en el vehículo para el guarda.");
        new Float:x,Float:y,Float:z;
        FCNPC_GetPosition(PLAYER_INFO[playerid][T_Guarda2],x,y,z);
        if(IsPlayerInRangeOfPoint(playerid,50.0,x,y,z)) {
            FCNPC_EnterVehicle(PLAYER_INFO[playerid][T_Guarda2],GetPlayerVehicleID(playerid), seat);
        } else { //Lejos, subir sin más
            SendClientMessage(playerid,-1,"El guarda se encuentra demasiado lejos");
        }
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
    {
        if(!FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda3])) return true;
        if(!IsPlayerInAnyVehicle(playerid)) return true;
        new seat = GetFreeSeat(GetPlayerVehicleID(playerid));
        if(seat == -1) return SendClientMessage(playerid,-1,"No hay espacio en el vehículo para el guarda.");
        new Float:x,Float:y,Float:z;
        FCNPC_GetPosition(PLAYER_INFO[playerid][T_Guarda3],x,y,z);
        if(IsPlayerInRangeOfPoint(playerid,50.0,x,y,z)) {
            FCNPC_EnterVehicle(PLAYER_INFO[playerid][T_Guarda3],GetPlayerVehicleID(playerid), seat);
        } else { //Lejos, subir sin más
            SendClientMessage(playerid,-1,"El guarda se encuentra demasiado lejos");
        }
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
    {
        if(!FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda4])) return true;
        if(!IsPlayerInAnyVehicle(playerid)) return true;
        new seat = GetFreeSeat(GetPlayerVehicleID(playerid));
        if(seat == -1) return SendClientMessage(playerid,-1,"No hay espacio en el vehículo para el guarda.");
        new Float:x,Float:y,Float:z;
        FCNPC_GetPosition(PLAYER_INFO[playerid][T_Guarda4],x,y,z);
        if(IsPlayerInRangeOfPoint(playerid,50.0,x,y,z)) {
            FCNPC_EnterVehicle(PLAYER_INFO[playerid][T_Guarda4],GetPlayerVehicleID(playerid), seat);
        } else { //Lejos, subir sin más
            SendClientMessage(playerid,-1,"El guarda se encuentra demasiado lejos");
        }
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
    {
        if(!FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda5])) return true;
        if(!IsPlayerInAnyVehicle(playerid)) return true;
        new seat = GetFreeSeat(GetPlayerVehicleID(playerid));
        if(seat == -1) return SendClientMessage(playerid,-1,"No hay espacio en el vehículo para el guarda.");
        new Float:x,Float:y,Float:z;
        FCNPC_GetPosition(PLAYER_INFO[playerid][T_Guarda5],x,y,z);
        if(IsPlayerInRangeOfPoint(playerid,50.0,x,y,z)) {
            FCNPC_EnterVehicle(PLAYER_INFO[playerid][T_Guarda5],GetPlayerVehicleID(playerid), seat);
        } else { //Lejos, subir sin más
            SendClientMessage(playerid,-1,"El guarda se encuentra demasiado lejos");
        }
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
    {
        if(!FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda6])) return true;
        if(!IsPlayerInAnyVehicle(playerid)) return true;
        new seat = GetFreeSeat(GetPlayerVehicleID(playerid));
        if(seat == -1) return SendClientMessage(playerid,-1,"No hay espacio en el vehículo para el guarda.");
        new Float:x,Float:y,Float:z;
        FCNPC_GetPosition(PLAYER_INFO[playerid][T_Guarda6],x,y,z);
        if(IsPlayerInRangeOfPoint(playerid,50.0,x,y,z)) {
            FCNPC_EnterVehicle(PLAYER_INFO[playerid][T_Guarda6],GetPlayerVehicleID(playerid), seat);
        } else { //Lejos, subir sin más
            SendClientMessage(playerid,-1,"El guarda se encuentra demasiado lejos");
        }
    }
    return 1;
}
funcion DarArmas_GE(playerid, g_selec, armaid)
{
    new npcid, name[128];
    if(g_selec == 0) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda];
        format(name,144,"%s",Name_GE[playerid]);
    }
    else if(g_selec == 1) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda2];
        format(name,144,"%s",Name_GE2[playerid]);
    }
    else if(g_selec == 2) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda3];
        format(name,144,"%s",Name_GE3[playerid]);
    }
    else if(g_selec == 3) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda4];
        format(name,144,"%s",Name_GE4[playerid]);
    }
    else if(g_selec == 4) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda5];
        format(name,144,"%s",Name_GE5[playerid]);
    }
    else  if(g_selec == 5) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda6];
        format(name,144,"%s",Name_GE6[playerid]);
    }
    SendClientMessageEx(playerid, -1, "Le diste a %s un(a) %s",name,GetWeaponNameEx(armaid));
    FCNPC_SetWeapon(npcid, armaid);
    return 1;
}
funcion DarSkin_GE(playerid, g_selec, skinid)
{
    new npcid, name[128];
    if(g_selec == 0) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda];
        format(name,144,"%s",Name_GE[playerid]);
    }
    else if(g_selec == 1) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda2];
        format(name,144,"%s",Name_GE2[playerid]);
    }
    else if(g_selec == 2) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda3];
        format(name,144,"%s",Name_GE3[playerid]);
    }
    else if(g_selec == 3) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda4];
        format(name,144,"%s",Name_GE4[playerid]);
    }
    else if(g_selec == 4) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda5];
        format(name,144,"%s",Name_GE5[playerid]);
    }
    else  if(g_selec == 5) 
    {
        npcid = PLAYER_INFO[playerid][T_Guarda6];
        format(name,144,"%s",Name_GE6[playerid]);
    }
    SendClientMessageEx(playerid, -1, "Le diste a %s la ropa ID: %s",name,skinid);
    FCNPC_SetSkin(npcid, skinid);
    return 1;
}
C_GE_SEGUIR(playerid)
{
    if(G_Siguiendo[playerid] == 0) { G_Siguiendo[playerid] = 1; }
	else G_Siguiendo[playerid] = 0;
    return 1;
}
C_GE_SEGUIR2(playerid)
{
    if(G_Siguiendo2[playerid] == 0) { G_Siguiendo2[playerid] = 1; }
    else G_Siguiendo2[playerid] = 0;
    return 1;
}
C_GE_SEGUIR3(playerid)
{
    if(G_Siguiendo3[playerid] == 0) { G_Siguiendo3[playerid] = 1; }
    else G_Siguiendo3[playerid] = 0;
    return 1;
}
C_GE_SEGUIR4(playerid)
{
    if(G_Siguiendo4[playerid] == 0) { G_Siguiendo4[playerid] = 1; }
    else G_Siguiendo4[playerid] = 0;
    return 1;
}
C_GE_SEGUIR5(playerid)
{
    if(G_Siguiendo5[playerid] == 0) { G_Siguiendo5[playerid] = 1; }
    else G_Siguiendo5[playerid] = 0;
    return 1;
}
C_GE_SEGUIR6(playerid)
{
    if(G_Siguiendo6[playerid] == 0) { G_Siguiendo6[playerid] = 1; }
    else G_Siguiendo6[playerid] = 0;
    return 1;
}

MostrarGuardaespaldasLista2(playerid)
{
    PLAYER_TEMP[playerid][GE_Seleccionado] = -1;
    new guarda1[360],guarda2[360],guarda3[360],guarda4[360],guarda5[360],guarda6[360], mensaje[1200];
    if(PLAYER_INFO[playerid][T_Guarda] > 0 || PLAYER_INFO[playerid][T_Guarda2] > 0 || PLAYER_INFO[playerid][T_Guarda3] > 0 || PLAYER_INFO[playerid][T_Guarda4] > 0 || PLAYER_INFO[playerid][T_Guarda5] > 0 || PLAYER_INFO[playerid][T_Guarda6] > 0)
    {
            format(guarda1, sizeof(guarda1), "Nombre: {FF5454}%s{FFFFFF} | Slot: 0", Name_GE[playerid]);
            
            format(guarda2, sizeof(guarda2), "\nNombre: {FF5454}%s{FFFFFF} | Slot: 1", Name_GE2[playerid]);

            format(guarda3, sizeof(guarda3), "\nNombre: {FF5454}%s{FFFFFF} | Slot: 2", Name_GE3[playerid]);

            format(guarda4, sizeof(guarda4), "\nNombre: {FF5454}%s{FFFFFF} | Slot: 3", Name_GE4[playerid]);

            format(guarda5, sizeof(guarda5), "\nNombre: {FF5454}%s{FFFFFF} | Slot: 4", Name_GE5[playerid]);

            format(guarda6, sizeof(guarda6), "\nNombre: {FF5454}%s{FFFFFF} | Slot: 5", Name_GE6[playerid]);

            format(mensaje, sizeof(mensaje), "%s%s%s%s%s%s",guarda1,guarda2,guarda3,guarda4,guarda5,guarda6);
            ShowPlayerDialog(playerid, DIALOG_GE_LIST, DIALOG_STYLE_LIST, "Selecciona el guardaespaldas a usar", mensaje, "Seleccionar","Cancelar");
    }
    return 1;
}
funcion Stock_Guardaespaldas(playerid, id)
{
	new string[256], textoconfig1[20], textoconfig2[20], newname[128];
    if(id == 0)
    {
        if(G_Siguiendo[playerid] == 1) textoconfig1 = "Dejar de seguir";
        else textoconfig1 = "Seguir";
        
        if(G_Atacando[playerid] == 1) textoconfig2 = "Dejar de disparar";
        else textoconfig2 = "Disparar a...";
        format(string, sizeof(string),"%s\nApuntar a...\n%s\nBaja tu arma\nManejar un auto\nSubir a mi auto\nBajar de un auto\nSi nos atacan a uno de los dos...\nDar medicamento\nDespedir\nDar Arma\nColocar Ropa", textoconfig1, textoconfig2);
        format(newname, sizeof(newname),"%s - Ordenes:",Name_GE[playerid]);
        ShowPlayerDialog(playerid, GUARDA, DIALOG_STYLE_LIST, newname, string, "Ordenar", "Cancelar");
    }
    if(id == 1)
    {
        if(G_Siguiendo2[playerid] == 1) textoconfig1 = "Dejar de seguir";
        else textoconfig1 = "Seguir";
        
        if(G_Atacando2[playerid] == 1) textoconfig2 = "Dejar de disparar";
        else textoconfig2 = "Disparar a...";
        format(string, sizeof(string),"%s\nApuntar a...\n%s\nBaja tu arma\nManejar un auto\nSubir a mi auto\nBajar de un auto\nSi nos atacan a uno de los dos...\nDar medicamento\nDespedir\nDar Arma\nColocar Ropa", textoconfig1, textoconfig2);
        format(newname, sizeof(newname),"%s - Ordenes:",Name_GE2[playerid]);
        ShowPlayerDialog(playerid, GUARDA, DIALOG_STYLE_LIST, newname, string, "Ordenar", "Cancelar");
    }
    if(id == 2)
    {
        if(G_Siguiendo3[playerid] == 1) textoconfig1 = "Dejar de seguir";
        else textoconfig1 = "Seguir";
        
        if(G_Atacando3[playerid] == 1) textoconfig2 = "Dejar de disparar";
        else textoconfig2 = "Disparar a...";
        format(string, sizeof(string),"%s\nApuntar a...\n%s\nBaja tu arma\nManejar un auto\nSubir a mi auto\nBajar de un auto\nSi nos atacan a uno de los dos...\nDar medicamento\nDespedir\nDar Arma\nColocar Ropa", textoconfig1, textoconfig2);
        format(newname, sizeof(newname),"%s - Ordenes:",Name_GE3[playerid]);
        ShowPlayerDialog(playerid, GUARDA, DIALOG_STYLE_LIST, newname, string, "Ordenar", "Cancelar");
    }
    if(id == 3)
    {
        if(G_Siguiendo4[playerid] == 1) textoconfig1 = "Dejar de seguir";
        else textoconfig1 = "Seguir";
        
        if(G_Atacando4[playerid] == 1) textoconfig2 = "Dejar de disparar";
        else textoconfig2 = "Disparar a...";
        format(string, sizeof(string),"%s\nApuntar a...\n%s\nBaja tu arma\nManejar un auto\nSubir a mi auto\nBajar de un auto\nSi nos atacan a uno de los dos...\nDar medicamento\nDespedir\nDar Arma\nColocar Ropa", textoconfig1, textoconfig2);
        format(newname, sizeof(newname),"%s - Ordenes:",Name_GE4[playerid]);
        ShowPlayerDialog(playerid, GUARDA, DIALOG_STYLE_LIST, newname, string, "Ordenar", "Cancelar");
    }
    if(id == 4)
    {
        if(G_Siguiendo5[playerid] == 1) textoconfig1 = "Dejar de seguir";
        else textoconfig1 = "Seguir";
        
        if(G_Atacando5[playerid] == 1) textoconfig2 = "Dejar de disparar";
        else textoconfig2 = "Disparar a...";
        format(string, sizeof(string),"%s\nApuntar a...\n%s\nBaja tu arma\nManejar un auto\nSubir a mi auto\nBajar de un auto\nSi nos atacan a uno de los dos...\nDar medicamento\nDespedir\nDar Arma\nColocar Ropa", textoconfig1, textoconfig2);
        format(newname, sizeof(newname),"%s - Ordenes:",Name_GE5[playerid]);
        ShowPlayerDialog(playerid, GUARDA, DIALOG_STYLE_LIST, newname, string, "Ordenar", "Cancelar");
    }
    if(id == 5)
    {
        if(G_Siguiendo6[playerid] == 1) textoconfig1 = "Dejar de seguir";
        else textoconfig1 = "Seguir";
        
        if(G_Atacando6[playerid] == 1) textoconfig2 = "Dejar de disparar";
        else textoconfig2 = "Disparar a...";
        format(string, sizeof(string),"%s\nApuntar a...\n%s\nBaja tu arma\nManejar un auto\nSubir a mi auto\nBajar de un auto\nSi nos atacan a uno de los dos...\nDar medicamento\nDespedir\nDar Arma\nColocar Ropa", textoconfig1, textoconfig2);
        format(newname, sizeof(newname),"%s - Ordenes:",Name_GE6[playerid]);
        ShowPlayerDialog(playerid, GUARDA, DIALOG_STYLE_LIST, newname, string, "Ordenar", "Cancelar");
    }
	return 1;
}
funcion Call_Stock_GE(playerid)
{
    Stock_Guardaespaldas(playerid, PLAYER_TEMP[playerid][GE_Seleccionado]);
    return 1;
}
stock G_Atacar(playerid, id, npcid)
{
	FCNPC_AimAtPlayer(npcid, id, true, -1, true, 0.0, 0.0, 0.0, 0.0,0.0,0.0, FCNPC_ENTITY_MODE_AUTO, FCNPC_ENTITY_CHECK_ALL);
    ShowPlayerMessage(playerid, "Uno de tus guardaespaldas está agrediendo a alguien");
    return true;
}
stock G_Apuntar(playerid, id)
{
    new npcid;
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda2];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda3];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda4];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda5];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda6];
    }
	FCNPC_AimAtPlayer(npcid, id);
}

stock G_ApuntarNo(playerid)
{
    new npcid;
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 0)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 1)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda2];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 2)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda3];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 3)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda4];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 4)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda5];
    }
    if(PLAYER_TEMP[playerid][GE_Seleccionado] == 5)
    {
       npcid = PLAYER_INFO[playerid][T_Guarda6];
    }
	FCNPC_StopAim(npcid);
}

stock G_Valido(npcid)
{
	return FCNPC_IsValid(npcid) && guardaespaldabot[npcid][gExiste] != 0;
}
stock SeguirGuardaEspaldas(playerid)
{
    if(JugadorLogeado[playerid] == 1 && IsPlayerConnected(playerid))
    {
        if(G_Siguiendo[playerid] == 1 && PLAYER_INFO[playerid][T_Guarda] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda])) // Con ésto no debería seguir moviendose si está al lado tuyo
        {
            new npc = PLAYER_INFO[playerid][T_Guarda];
            new Float:pos[4];
            GetPlayerPos(playerid, pos[0],pos[1],pos[2]);
            if(EstaEn(npc,6.0,pos[0],pos[1],pos[2])) return 1;
            if(guardaespaldabot[npc][manejando] == 1)
            {
                if(IsPlayerInAnyVehicle(playerid)) 
                {
                    FCNPC_GoTo(npc, pos[0]-0.3, pos[1]-2, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT+2, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                } 
                else 
                {
                    FCNPC_GoTo(npc, pos[0]-1, pos[1]-3, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_AUTO, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                }
            } 
            else 
            {
                FCNPC_GoToPlayer(npc, playerid, FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 1.5, 250);
            }
        }
        if(G_Siguiendo2[playerid] == 1 && PLAYER_INFO[playerid][T_Guarda2] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda2])) // Con ésto no debería seguir moviendose si está al lado tuyo
        {
            new npc = PLAYER_INFO[playerid][T_Guarda2];
            new Float:pos[4];
            GetPlayerPos(playerid, pos[0],pos[1],pos[2]);
            if(EstaEn(npc,6.0,pos[0],pos[1],pos[2])) return 1;
            if(guardaespaldabot[npc][manejando] == 1)
            {
                if(IsPlayerInAnyVehicle(playerid)) 
                {
                    FCNPC_GoTo(npc, pos[0]-0.5, pos[1]-2, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT+2, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                } 
                else 
                {
                    FCNPC_GoTo(npc, pos[0]-1, pos[1]-3, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_AUTO, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                }
            } 
            else 
            {
                FCNPC_GoToPlayer(npc, playerid, FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 1.5, 250);
            }
        }
        if(G_Siguiendo3[playerid] == 1 && PLAYER_INFO[playerid][T_Guarda3] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda3])) // Con ésto no debería seguir moviendose si está al lado tuyo
        {
            new npc = PLAYER_INFO[playerid][T_Guarda3];
            new Float:pos[4];
            GetPlayerPos(playerid, pos[0],pos[1],pos[2]);
            if(EstaEn(npc,6.0,pos[0],pos[1],pos[2])) return 1;
            if(guardaespaldabot[npc][manejando] == 1)
            {
                if(IsPlayerInAnyVehicle(playerid)) 
                {
                    FCNPC_GoTo(npc, pos[0]-1, pos[1]-2, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT+2, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                } 
                else 
                {
                    FCNPC_GoTo(npc, pos[0]-1, pos[1]-3, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_AUTO, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                }
            } 
            else 
            {
                FCNPC_GoToPlayer(npc, playerid, FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 1.5, 250);
            }
        }
        if(G_Siguiendo4[playerid] == 1 && PLAYER_INFO[playerid][T_Guarda4] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda4])) // Con ésto no debería seguir moviendose si está al lado tuyo
        {
            new npc = PLAYER_INFO[playerid][T_Guarda4];
            new Float:pos[4];
            GetPlayerPos(playerid, pos[0],pos[1],pos[2]);
            if(EstaEn(npc,6.0,pos[0],pos[1],pos[2])) return 1;
            if(guardaespaldabot[npc][manejando] == 1)
            {
                if(IsPlayerInAnyVehicle(playerid)) 
                {
                    FCNPC_GoTo(npc, pos[0]-2, pos[1]-2, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT+2, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                } 
                else 
                {
                    FCNPC_GoTo(npc, pos[0]-1, pos[1]-3, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_AUTO, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                }
            } 
            else 
            {
                FCNPC_GoToPlayer(npc, playerid, FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 1.5, 250);
            }
        }
        if(G_Siguiendo5[playerid] == 1 && PLAYER_INFO[playerid][T_Guarda5] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda5])) // Con ésto no debería seguir moviendose si está al lado tuyo
        {
            new npc = PLAYER_INFO[playerid][T_Guarda5];
            new Float:pos[4];
            GetPlayerPos(playerid, pos[0],pos[1],pos[2]);
            if(EstaEn(npc,6.0,pos[0],pos[1],pos[2])) return 1;
            if(guardaespaldabot[npc][manejando] == 1)
            {
                if(IsPlayerInAnyVehicle(playerid)) 
                {
                    FCNPC_GoTo(npc, pos[0]-3, pos[1]-2, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT+2, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                } 
                else 
                {
                    FCNPC_GoTo(npc, pos[0]-1, pos[1]-3, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_AUTO, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                }
            } 
            else 
            {
                FCNPC_GoToPlayer(npc, playerid, FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 1.5, 250);
            }
        }
        if(G_Siguiendo6[playerid] == 1 && PLAYER_INFO[playerid][T_Guarda6] > 0 && FCNPC_IsValid(PLAYER_INFO[playerid][T_Guarda6])) // Con ésto no debería seguir moviendose si está al lado tuyo
        {
            new npc = PLAYER_INFO[playerid][T_Guarda6];
            new Float:pos[4];
            GetPlayerPos(playerid, pos[0],pos[1],pos[2]);
            if(EstaEn(npc,6.0,pos[0],pos[1],pos[2])) return 1;
            if(guardaespaldabot[npc][manejando] == 1)
            {
                if(IsPlayerInAnyVehicle(playerid)) 
                {
                    FCNPC_GoTo(npc, pos[0]-1, pos[1]-2, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT+2, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                } 
                else 
                {
                    FCNPC_GoTo(npc, pos[0]-1, pos[1]-3, pos[2], FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_AUTO, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
                }
            } 
            else 
            {
                FCNPC_GoToPlayer(npc, playerid, FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_SPRINT, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 1.5, 250);
            }
        }
    }
    return 1;
}

		case D_G_FABRICA:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						for(new ID = 1; ID < MAX_FABRICAS; ID++)
						{
							if(!FABRICAS_INFO[ID][f_VALID]) continue;
							if(PLAYER_INFO[playerid][pFaccion] != FABRICAS_INFO[ID][f_FACCION_ID]) continue;
							CrearGuardias(ID);
						}						
					}
					default:
					{
						SendClientMessage(playerid, -1, "Funcion en construccion.");
					}
				}
			}
		}