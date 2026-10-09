#include <a_samp>

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	Players.Anticheat[playerid][CHEAT_TP][@Imunidad] = gettime() + 3;
	Players.Anticheat[playerid][CHEAT_STATE_SPAMMER][@Imunidad] = gettime() + 3;

	/*if(Anticheat.Info[CHEAT_VEHICLE_ENTER_SPAMMER][@Habilitado])
	{
		if(gettime() > Players.Anticheat[playerid][CHEAT_VEHICLE_ENTER_SPAMMER][@Imunidad])
		{
			new interval = GetTickDiff(GetTickCount(), PLAYER_TEMP[playerid][@AntiFloodEnterVeh]);

			if(interval < 50)
			{
				if(DetectarCheat(playerid, CHEAT_VEHICLE_ENTER_SPAMMER))
				{
					AnticheatKick(playerid, false, Anticheat.Info[CHEAT_VEHICLE_ENTER_SPAMMER][@Nombre]);
				}
			}
			PLAYER_TEMP[playerid][@AntiFloodEnterVeh] = GetTickCount();
		}
	}*/
	#if defined ac_OnPlayerEnterVehicle
		return ac_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger);
	#else
		return 1;
	#endif
}

#define OnPlayerEnterVehicle ac_OnPlayerEnterVehicle

#if defined ac_OnPlayerEnterVehicle
	forward ac_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger);
#endif

//---------------------FASOLITA--------------------------

public OnPlayerExitVehicle(playerid, vehicleid)
{
	Players.Anticheat[playerid][CHEAT_TP][@Imunidad] = gettime() + 3;
	Players.Anticheat[playerid][CHEAT_STATE_SPAMMER][@Imunidad] = gettime() + 3;
	
	Saliendo[playerid] = gettime() + (1/2);//Anti super gun
	
	#if defined ac_OnPlayerExitVehicle
		return ac_OnPlayerExitVehicle(playerid, vehicleid);
	#else
		return 1;
	#endif
}

#define OnPlayerExitVehicle ac_OnPlayerExitVehicle
#if defined ac_OnPlayerExitVehicle
	forward ac_OnPlayerExitVehicle(playerid, vehicleid);
#endif

//------------------FASOLITA--------------------------
public OnPlayerStateChange(playerid, newstate, oldstate)
{
	/*if(newstate != PLAYER_STATE_SPAWNED && oldstate != PLAYER_STATE_SPAWNED)
	{
		if(Anticheat.Info[CHEAT_STATE_SPAMMER][@Habilitado])
		{
			if(gettime() > Players.Anticheat[playerid][CHEAT_STATE_SPAMMER][@Imunidad])
			{
				new interval = GetTickDiff(GetTickCount(), PLAYER_TEMP[playerid][@AntiFloodState]);

				if(interval < 50)
				{
					if(DetectarCheat(playerid, CHEAT_STATE_SPAMMER))
					{
						AnticheatKick(playerid, false, "%s (%d:%d)", Anticheat.Info[CHEAT_VEHICLE_ENTER_SPAMMER][@Nombre], newstate, oldstate);
					}
				}
				PLAYER_TEMP[playerid][@AntiFloodState] = GetTickCount();
			}
		}
	}*/

	if(newstate == PLAYER_STATE_DRIVER)
	{
        new vehicleid = GetPlayerVehicleID(playerid);
		if(Vehicle.Global[vehicleid][@ParamsTraba]) //cerrado
		{
			if(gettime() - Vehicle.Global[vehicleid][@UltVezCerrado] > 7) // Si el tiempo que paso desde que cerro es mayor a 5
			{
				if(Anticheat.Info[CHEAT_PLAYER_VEHICLE_DOORS][@Habilitado])
				{
					if(gettime() > Players.Anticheat[playerid][CHEAT_PLAYER_VEHICLE_DOORS][@Imunidad])
					{
						if(DetectarCheat(playerid, CHEAT_PLAYER_VEHICLE_DOORS))
						{
							AnticheatKick(playerid, false, Anticheat.Info[CHEAT_PLAYER_VEHICLE_DOORS][@Nombre]);
							return 1;
						}
					}
				}
			}
		}
		Players.Anticheat[playerid][CHEAT_VEHICLE_HEALTH][@Imunidad] = gettime() + 3;
		Players.Anticheat[playerid][CHEAT_TP][@Imunidad] = gettime() + 3;
		PLAYER_TEMP[playerid][@UltimoVehiculo] = vehicleid;
		
		Vehicle.Global[vehicleid][@Conductor] = playerid;
		Vehicle.Global[vehicleid][@UltConductor] = playerid;
		Vehicle.Global[vehicleid][@Ocupado] = true;
	}
	else if(newstate == PLAYER_STATE_PASSENGER)
	{
		if(GetPlayerWeapon(playerid) == WEAPON_DEAGLE || GetPlayerWeapon(playerid) == WEAPON_SHOTGSPA)
			SetPlayerArmedWeapon(playerid, 0);

		Players.Anticheat[playerid][CHEAT_TP][@Imunidad] = gettime() + 3;

		new vehicleid = GetPlayerVehicleID(playerid);
		PLAYER_TEMP[playerid][@UltimoVehiculo] = vehicleid;
	}
	else if(newstate == PLAYER_STATE_SPECTATING)
	{
		if(!PLAYER_TEMP[playerid][@Specteando])
		{
			if(Anticheat.Info[CHEAT_SPEC][@Habilitado])
			{
				if(gettime() > Players.Anticheat[playerid][CHEAT_SPEC][@Imunidad])
				{
					if(DetectarCheat(playerid, CHEAT_SPEC))
					{
						AnticheatKick(playerid, false, "%s (%d:%d)", Anticheat.Info[CHEAT_SPEC][@Nombre], newstate, oldstate);
						return 1;
					}
				}
			}
		}
	}
	if(oldstate == PLAYER_STATE_DRIVER)
	{
		Players.Anticheat[playerid][CHEAT_TP][@Imunidad] = gettime() + 3;
		if(PLAYER_TEMP[playerid][@UltimoVehiculo] != INVALID_VEHICLE_ID)
		{
			Vehicle.Global[ PLAYER_TEMP[playerid][@UltimoVehiculo] ][@ImunidadTP] = gettime() + 5;
			Vehicle.Global[ PLAYER_TEMP[playerid][@UltimoVehiculo] ][@Conductor] = INVALID_PLAYER_ID;
			Vehicle.Global[ PLAYER_TEMP[playerid][@UltimoVehiculo] ][@UltConductor] = playerid;
			Vehicle.Global[ PLAYER_TEMP[playerid][@UltimoVehiculo] ][@Ocupado] = false;
		}
	}
	#if defined ac_OnPlayerStateChange
		return ac_OnPlayerStateChange(playerid, newstate, oldstate);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange ac_OnPlayerStateChange
#if defined ac_OnPlayerStateChange
	forward ac_OnPlayerStateChange(playerid, newstate, oldstate);
#endif

//---------------------FASOLITA------------------------
CheckWeapon(playerid, weaponid)
{
	if(Weapon.Info[weaponid][@Anticheat] && Anticheat.Info[CHEAT_ARMAS][@Habilitado])
	{
		if(gettime() > Players.Anticheat[playerid][CHEAT_ARMAS][@Imunidad])
		{
			new weapon_id, weapon_ammo;
			GetPlayerWeaponData(playerid, Weapon.Info[weaponid][@Slot], weapon_id, weapon_ammo);

			if(weapon_id != PLAYER_INFO[playerid][j_ARMAS][ Weapon.Info[weapon_id][@Slot] ])
			{
				if(DetectarCheat(playerid, CHEAT_ARMAS))
				{
					AnticheatKick(playerid, true, "%s (%d)", Anticheat.Info[CHEAT_ARMAS][@Nombre], weapon_id);
					return 1;
				}
			}
		}
	}
	return 0;
}

DetectarCheat(playerid, cheat)
{
	new bool:detectado = false;
	if(!Anticheat.Info[cheat][@Intervalo]) detectado = true;
	else
	{
		if(gettime() - Players.Anticheat[playerid][cheat][@UltDet] > Anticheat.Info[cheat][@Intervalo]) Players.Anticheat[playerid][cheat][@Detecciones] = 0;
		else Players.Anticheat[playerid][cheat][@Detecciones] ++;

		Players.Anticheat[playerid][cheat][@UltDet] = gettime();
		if(Players.Anticheat[playerid][cheat][@Detecciones] >= Anticheat.Info[cheat][@Detecciones]) detectado = true;
	}
	return detectado;
}

AnticheatKick(playerid, bool:publico, string[], {Float,_}:...)
{
	if(IsPlayerNPC(playerid)) return 0;
	new razon[50];
	format(razon, sizeof razon, string, ___3);

	if(publico)
		AnuncioAdminEx(0xFFFFFFAA, "{FFFFFF}El jugador {ff3300}%s(ID: %d){FFFFFF} fue baneado por el anticheat. Razón: %s.", PLAYER_INFO[playerid][Nickname], playerid, razon);
	else
		MensajeAdminEx(ADMIN_LEVEL_BANEOS, 0xFFFFFFAA, "{FFFFFF}El jugador {ff3300}%s(ID: %d){FFFFFF} fue baneado por el anticheat. Razón: %s.", PLAYER_INFO[playerid][Nickname], playerid, razon);
	Kick(playerid);
	return 1;
}

stock Float:GetVehicleSpeed(vehicleid)
{
    new Float:vxxx, Float:vyyy, Float:vzzz;
    GetVehicleVelocity(vehicleid, vxxx, vyyy, vzzz);
	new Float:vel = floatmul(floatsqroot(floatadd(floatadd(floatpower(vxxx, 2), floatpower(vyyy, 2)),  floatpower(vzzz, 2))), 181.5);
	return vel;
}

//------------FASOLITA---------------------
public OnPlayerUpdate(playerid)
{
	if(!LoggedYet[playerid]) return 0;
	new bool:ret = true;

	new player_state = GetPlayerState(playerid);
	if(player_state == PLAYER_STATE_SPAWNED || player_state == PLAYER_STATE_SPECTATING) return 1;

	new Float:player_health, Float:player_armour, player_action = GetPlayerSpecialAction(playerid), player_weapon = GetPlayerWeapon(playerid);
	GetPlayerHealth(playerid, player_health);
	GetPlayerArmour(playerid, player_armour);

	if(CheckWeapon(playerid, player_weapon)) return 0;

	new current_gettime = gettime();

	if(Anticheat.Info[CHEAT_JETPACK][@Habilitado])
	{
		if(player_action == SPECIAL_ACTION_USEJETPACK)
		{
			if(current_gettime > Players.Anticheat[playerid][CHEAT_JETPACK][@Imunidad])
			{
				if(DetectarCheat(playerid, CHEAT_JETPACK))
				{
					AnticheatKick(playerid, true, Anticheat.Info[CHEAT_JETPACK][@Nombre]);
					return 0;
				}
			}
		}
	}

	new Float:dis, Float:vehicle_health, vehicleid = GetPlayerVehicleID(playerid);
	if(!vehicleid) dis = GetPlayerDistanceFromPoint(playerid, PLAYER_INFO[playerid][@X], PLAYER_INFO[playerid][@Y], PLAYER_INFO[playerid][@Z]);
	else
	{
		dis = GetVehicleDistanceFromPoint(vehicleid, Vehicle.Global[vehicleid][@X], Vehicle.Global[vehicleid][@Y], Vehicle.Global[vehicleid][@Z]);
		GetVehicleHealth(vehicleid, vehicle_health);
	}

	if(Anticheat.Info[CHEAT_UNOCCUPIED_VEHICLE_TP][@Habilitado] && vehicleid && player_state == PLAYER_STATE_PASSENGER)
	{
		if(floatabs(dis) > 20.0)
		{
			if(Vehicle.Global[vehicleid][@Conductor] == INVALID_PLAYER_ID)
			{
				Vehicle.Global[vehicleid][@ImunidadTP] = current_gettime + 5;
			}
		}
	}
	if(Anticheat.Info[CHEAT_LARGO_TP][@Habilitado])
	{
		if(current_gettime > Players.Anticheat[playerid][CHEAT_TP][@Imunidad])
		{
			if(floatabs(dis) > 80.0 && PLAYER_INFO[playerid][@Z] > -97.0)
			{
				if(player_state != PLAYER_STATE_PASSENGER)
				{
					if(IsPlayerPaused(playerid)) return 1;
					if(IsPlayerInPaint(playerid) || IsPlayerInTransfender(playerid)) return 1;
					if(PLAYER_INFO[playerid][pAdmin] >= ADMIN_LEVEL_PROGRAMMER) return 1;
					if(DetectarCheat(playerid, CHEAT_LARGO_TP))
					{
						MensajeAdminEx(ADMIN_LEVEL_BANEOS, 0xAFAFAFAA, "[PRUEBA] Teleport %s(ID:%d - Nivel %d)", PLAYER_INFO[playerid][Nickname], playerid, PLAYER_INFO[playerid][@Nivel]);
						Kick(playerid);
						return 0;
					}
				}
			}
		}
	}
	switch(player_state)
	{
		case PLAYER_STATE_ONFOOT:
		{
	    	if(Anticheat.Info[CHEAT_PLAYER_MOP][@Habilitado])
			{
				if(current_gettime > Players.Anticheat[playerid][CHEAT_PLAYER_MOP][@Imunidad])
				{
			    	new Float: Pos[3], animlib[64], animname[64];
					GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,sizeof(animlib),animname,sizeof(animname));
					GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
					new GPAI = GetPlayerAnimationIndex(playerid);
					if(Pos[2] > 1.5 && !IsPlayerInWater(playerid) && (GPAI == 1543 || GPAI == 1538 || GPAI == 1539 || GPAI == 1541))
					{
						AnticheatKick(playerid, true, Anticheat.Info[CHEAT_PLAYER_MOP][@Nombre]);
						return 0;
					}
				}
			}
			if(Anticheat.Info[CHEAT_PLAYER_SPEED][@Habilitado])
			{
				if(current_gettime > Players.Anticheat[playerid][CHEAT_PLAYER_SPEED][@Imunidad])
				{
					new speed = GetPlayerSpeed(playerid);
					if(speed > 1000)
					{
						if(DetectarCheat(playerid, CHEAT_PLAYER_SPEED))
						{
							AnticheatKick(playerid, true, Anticheat.Info[CHEAT_PLAYER_SPEED][@Nombre]);
							return 0;
						}
					}
				}
			}
            if(Anticheat.Info[CHEAT_TP][@Habilitado])
			{
				if(current_gettime > Players.Anticheat[playerid][CHEAT_TP][@Imunidad])
				{
					if(GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && GetPlayerSurfingObjectID(playerid) == INVALID_OBJECT_ID && player_action != SPECIAL_ACTION_ENTER_VEHICLE && player_action != SPECIAL_ACTION_EXIT_VEHICLE)
					{
						if(floatabs(dis) > 6.0 && PLAYER_INFO[playerid][@Z] > -97.0)
						{
							if(DetectarCheat(playerid, CHEAT_TP))
							{
								MensajeAdminEx(ADMIN_LEVEL_BANEOS, 0xAFAFAFAA, "[PRUEBA] Jugador: %s (ID:%d) Distancia: %f / Animacion: %d / Ping: %d", PLAYER_INFO[playerid][Nickname], playerid, dis, GetPlayerAnimationIndex(playerid), GetPlayerPing(playerid));
							}
						}
					}
				}
			}
		}
		case PLAYER_STATE_DRIVER:
		{
			new Float:Vehicle_Speed = floatround(GetVehicleSpeed(vehicleid));

			if(Anticheat.Info[CHEAT_VEHICLE_SPEED_HACK][@Habilitado])
			{
				if(current_gettime > Players.Anticheat[playerid][CHEAT_VEHICLE_SPEED_HACK][@Imunidad])
				{
					if(Vehicle_Speed > 1000.0)
					{
						if(DetectarCheat(playerid, CHEAT_VEHICLE_SPEED_HACK))
						{
							AnticheatKick(playerid, false, "%s (%f)", Anticheat.Info[CHEAT_VEHICLE_SPEED_HACK][@Nombre], Vehicle_Speed);
							return 0;
						}
					}
				}
			}

			if(Anticheat.Info[CHEAT_VEHICLE_HEALTH][@Habilitado])
			{
				if(vehicle_health > (Vehicle.Global[vehicleid][@Vida] + 5.0))
				{
					if(current_gettime > Players.Anticheat[playerid][CHEAT_VEHICLE_HEALTH][@Imunidad])
					{
					    if(!IsPlayerInPaint(playerid) && !IsPlayerInTransfender(playerid) && !PLAYER_INFO[playerid][TUNEANDO])
					    {
							if(DetectarCheat(playerid, CHEAT_VEHICLE_HEALTH))
							{
								MensajeAdminEx(ADMIN_LEVEL_BANEOS, 0xAFAFAFAA, "Posible cheat de Repair Car %s(ID: %d) - Vehiculo %d: Salud %f -> %f", PLAYER_INFO[playerid][Nickname], playerid, vehicleid, vehicle_health, Vehicle.Global[vehicleid][@Vida]);
                                SetVehicleHealth(vehicleid, Vehicle.Global[vehicleid][@Vida]);
								return 0;
							}
						}
					}
				}
			}

			if(Anticheat.Info[CHEAT_TP][@Habilitado])
			{
				if(current_gettime > Players.Anticheat[playerid][CHEAT_TP][@Imunidad])
				{
					if(Vehicle_Speed < 20.0 && floatabs(dis) >= 10.0 && Vehicle.Global[vehicleid][@Z] > -97.0)
					{
						if(DetectarCheat(playerid, CHEAT_TP))
						{
							MensajeAdminEx(ADMIN_LEVEL_BANEOS, 0xAFAFAFAA, "[PRUEBA] Jugador: %s (ID:%d) Distancia: %f / Vehiculo: %d / Ping: %d", PLAYER_INFO[playerid][Nickname], playerid, dis, vehicleid, GetPlayerPing(playerid));
						}
					}
				}
			}
		}
	}

	PLAYER_INFO[playerid][@Salud] = player_health;
	PLAYER_INFO[playerid][@Chaleco] = player_armour;
	GetPlayerPos(playerid, PLAYER_INFO[playerid][@X], PLAYER_INFO[playerid][@Y], PLAYER_INFO[playerid][@Z]);

	if(vehicleid)
	{
		GetVehiclePos(vehicleid, Vehicle.Global[vehicleid][@X], Vehicle.Global[vehicleid][@Y], Vehicle.Global[vehicleid][@Z]);
		Vehicle.Global[vehicleid][@Vida] = vehicle_health;
	}
	#if defined ac_OnPlayerUpdate
		return ret;
	#else
		return 1;
	#endif
}

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate ac_OnPlayerUpdate
#if defined ac_OnPlayerUpdate
	forward ac_OnPlayerUpdate(playerid);
#endif

//-----------------------------FASOLITA------------------------------//
/*GetTickDiff(newtick, oldtick)
{
	if (oldtick < 0 && newtick >= 0) {
		return newtick - oldtick;
	} else if (oldtick >= 0 && newtick < 0 || oldtick > newtick) {
		return (cellmax - oldtick + 1) - (cellmin - newtick);
	}
	return newtick - oldtick;
}*/
