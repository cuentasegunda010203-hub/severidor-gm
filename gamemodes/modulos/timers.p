#include <YSI_Coding\y_hooks>
static engine, lights, alarm, doors, bonnet, boot, objective;
new guardadofabricas;
stock GuardarFabricas()
{
	guardadofabricas++;
	printf("[DEBUG - Fabricas] El guardado de fabricas se ha ejecutado %d veces.",guardadofabricas);
	for(new ID = 1; ID < MAX_FABRICAS; ID++)
	{
		if(FABRICAS_INFO[ID][f_VALID])
		{
			GuardarFabrica(ID);
		}
	}
}
stock TimerVehicleGlobal()
{
	if(AntiLagLS == 1)
	{
		for(new u = 1; u <= GetVehiclePoolSize(); u++)//Edgardo
		{
			foreach(new playerid : Player)
			{
				if(!IsPlayerNPC(playerid))
				{
					if(!AVION(u) && !BOTE(u) && !CAMION(u) && IsVehicleInArea(u, -597.9696,-536.7734, 2337.8618, 2350.0432))
					{
						if(u == autos[playerid]) Auto1(playerid, 6);
						if(u == autos2[playerid]) Auto2(playerid, 6);
						if(u == autos3[playerid]) Auto3(playerid, 6);
						if(u == autos4[playerid]) Auto4(playerid, 6);
						if(u == autos5[playerid]) Auto5(playerid, 6);
					}
					if(!AVION(u) && !BOTE(u) && !CAMION(u) && IsVehicleInArea(u, 1387,1575,-1874.5,-1574.5))
					{
						if(u == autos[playerid])  { if(!IsVehicleOccupied(u)) return Auto1(playerid, 2); }
						if(u == autos2[playerid]) { if(!IsVehicleOccupied(u)) return Auto2(playerid, 2); }
						if(u == autos3[playerid]) { if(!IsVehicleOccupied(u)) return Auto3(playerid, 2); }
						if(u == autos4[playerid]) { if(!IsVehicleOccupied(u)) return Auto4(playerid, 2); }
						if(u == autos5[playerid]) { if(!IsVehicleOccupied(u)) return Auto5(playerid, 2); }
					}
				}
			}
		}
	}
	return 1;
}
stock Clima/*[1800000]*/(playerid)
{
    if(!IsPlayerNPC(playerid) && PlayerConectado(playerid))
    {
        if(JugadorLogeado[playerid] == 1)
        {
            if(PLAYER_INFO[playerid][pClima] == 1)
            {
                new cl = random(13);
                if(cl == 0)
                {
                    SetPlayerWeather(playerid,0);
                }
                if(cl == 1)
                {
                    SetPlayerWeather(playerid,1);
                }
                if(cl == 2)
                {
                    SetPlayerWeather(playerid,3);
                }
                if(cl == 3)
                {
                    SetPlayerWeather(playerid,7);
                }
                if(cl == 4)
                {
                    SetPlayerWeather(playerid,8);
                }
                if(cl == 5)
                {
                    SetPlayerWeather(playerid,9);
                }
                if(cl == 6)
                {
                    SetPlayerWeather(playerid,11);
                }
                if(cl == 7)
                {
                    SetPlayerWeather(playerid,12);
                }
                if(cl == 8)
                {
                    SetPlayerWeather(playerid,13);
                }
                if(cl == 9)
                {
                    SetPlayerWeather(playerid,15);
                }
                if(cl == 10)
                {
                    SetPlayerWeather(playerid,16);
                }
                if(cl == 11)
                {
                    SetPlayerWeather(playerid,17);
                }
                if(cl == 12)
                {
                    SetPlayerWeather(playerid,19);
                }
            }
        }
    }
    return 1;
}
stock LimpiarAnuncio/*[1800000]*/()
{
	LimpiarAnuncios();
    LimpiarArmasSuelo();
	foreach(new i : Player)
	{
		if(!IsPlayerNPC(i) && IsPlayerConnected(i) && JugadorLogeado[i] == 1)
		{
            Clima(i);
			if(PLAYER_INFO[i][jMuteado] >= 1)
			{
				PLAYER_INFO[i][jMuteado]--;
			}
			if(PLAYER_INFO[i][pSed] > 98)
			{
				/*if(PLAYER_INFO[i][@Salud] < 6) SetPlayerHealthEx(i, 0.0);
				else SetPlayerHealthEx(i, -6.0);*/

				PUSH(i, "Te estás muriendo de sed...");
			}
			if(PLAYER_INFO[i][pHambre] > 98)
			{
				/*if(PLAYER_INFO[i][@Salud] < 6) SetPlayerHealthEx(i, 0.0);
				else SetPlayerHealthEx(i, -6.0);*/
				PUSH(i, "Te estás muriendo de hambre...");
			}
		}
	}
	return 1;
}
function TimerAnuncios()
{
    LimpiarAnuncio();
    return 1;
}
stock TimerDeMinuto/*[60*1000]*/()
{
	gettime(Hora, Minuto);
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i) && !IsPlayerNPC(i) && JugadorLogeado[i] == 1)
		{
			Hablar_Lorito(i);
			SetPlayerTime(i,Hora,Minuto);
			new Float:Vidad, Float:chalecoc;
			GetPlayerHealth(i, Vidad);
			if(Vidad > 100) EstablecerVida(i,100);
			if(chalecoc > 100) EstablecerChaleco(i,100);
			if(ViajeAvion[i] == 1)
			{
				
				new string[50], llegaavion;
				llegaavion = 301 - contadoravion;
				if(llegaavion < 60) format(string, sizeof(string), "El avión arribará en {00CC00}%ds{FFFFFF}.", llegaavion);
				else if(llegaavion >= 60) format(string, sizeof(string), "El avión arribará en {00CC00}%dm %ds{FFFFFF}.", llegaavion/60, llegaavion%(60));
				SendClientMessage(i, -1, string);
			}
		}
		if(!IsPlayerNPC(i))
		{

			if(GetPlayerScore(i) > 0)
			{

				if(PLAYER_INFO[i][@Nivel] == 1)
				{

					new Float:X,Float:Y,Float:Z;
					GetPlayerPos(i,X,Y,Z);
					if(PosPDX[i] != X || PosPDY[i] != Y || PosPDZ[i] != Z)
					{
						GetPlayerPos(i,PosPDX[i],PosPDY[i],PosPDZ[i]);
						PLAYER_INFO[i][TiempoPD] ++;
					}
				}
				else PLAYER_INFO[i][TiempoPD] ++;
			}
		}
	}
	return 1;
}
function TimerMinutos()
{
    TimerDeMinuto();
    return 1;
}
stock AntiCheat_Dialogs(playerid)
{
    if(!IsPlayerMobile(playerid) && PLAYER_TEMP[playerid][UltDialog] != -1)
    {
       if(PLAYER_TEMP[playerid][SecondsDialog] > 0)  PLAYER_TEMP[playerid][SecondsDialog]--;
       if(PLAYER_TEMP[playerid][SecondsDialog] > 30) KickPlayer(playerid, 0, "Dialog Flood (1)");
       if(PLAYER_TEMP[playerid][SecondsDialog] == 0) 
       {
            PLAYER_TEMP[playerid][UltDialog] = -1;
       }
    }
    return 1;
}
stock MiliSegundos/*[900]*/(playerid)
{
    if(!IsPlayerNPC(playerid) && IsPlayerConnected(playerid))
    {
        if(JugadorLogeado[playerid] == 1)
        {
            AntiCheat_Dialogs(playerid);
            Arrastrando(playerid);
            new keys, updown, leftright;
            GetPlayerKeys(playerid, keys, updown, leftright);
            #pragma unused keys
            if(updown == KEY_UP || updown == KEY_DOWN || leftright == KEY_LEFT  || leftright == KEY_RIGHT)
            {     
    
                if(GetPlayerAnimationIndex(playerid) == 1626 && CamionBombero[playerid] != INVALID_VEHICLE_ID)
                {                            
                    ClearAnimations(playerid);
                    new Float:x,Float:y,Float:z;
                    GetPosVehicleBootCamion(CamionBombero[playerid], x, y, z );
                    if(GetPlayerDistanceFromPoint( playerid, x, y, z) < 10.0)
                    {                                        
                        SetPlayerPos(playerid, x, y, z);
                        return 1;
                    }
                }
            }
            if(GetPlayerAnimationIndex(playerid) == 1626 && CamionBombero[playerid] != INVALID_VEHICLE_ID)//Esto para cuando el camion gire el pj tambien, si quieres dejalo en onplayerupdate o un timer de menos de 2 segundos
            {
                new Float:AnguloFinal,Float:x,Float:y,Float:z;
                GetPosVehicleBootCamion(CamionBombero[playerid], x, y, z );
                if(IsPlayerInRangeOfPoint(playerid,10.0,x, y, z))
                {
                    GetVehicleZAngle(CamionBombero[playerid], AnguloFinal);
                    AnguloFinal += 90.0;
                    if(AnguloFinal > 360.0) AnguloFinal = AnguloFinal-360.0;
                    SetPlayerFacingAngle(playerid, AnguloFinal);
                }
            }
        }
    }
    return 1;
}
function TimerMiliSeg()
{
    foreach(new i : Player) MiliSegundos(i);
    return 1;
}

stock Anticheats(playerid)
{
    if(PLAYER_TEMP[playerid][CoolDown_Incautar] > 0) PLAYER_TEMP[playerid][CoolDown_Incautar] --;
    if(TimerWeapons[playerid] > 0) TimerWeapons[playerid] --;
    if(PLAYER_TEMP[playerid][pt_LAST_VEHICLE_DESTROY] > 0) PLAYER_TEMP[playerid][pt_LAST_VEHICLE_DESTROY] --;
    if(TiempoVida[playerid] > 0) TiempoVida[playerid] --;
    if(TiempoChaleco[playerid] > 0) TiempoChaleco[playerid] --;
    if(AvisoAnticheat > 0) AvisoAnticheat --;
    if(JugadorLogeado[playerid] == 1)
    {
        new weaponid = GetPlayerWeapon(playerid);
        if(HasWeapon(playerid,weaponid) == 0 && weaponid != 46)
        {
            Avisos[playerid] ++;
            if(Avisos[playerid] > 3)
            {
                KickPlayer(playerid, 0, "Cheat de Armas");
            }
        }
    } 
    if(!IsPlayerNPC(playerid) && IsPlayerConnected(playerid))
    {
        if(PLAYER_INFO[playerid][Agonizando] == 1 && PacienteAmbu[playerid] == 0 && GetPVarInt( playerid, "Player:Follow" ) == INVALID_PLAYER_ID)
        {
            ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0, 1);
            ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0, 1);
            SetPlayerArmedWeapon(playerid, 0);
        }
        if(JugadorLogeado[playerid] == 1)
        {
            if(NotificacionConectado[playerid] > 0)
            {
                NotificacionConectado[playerid] --;
                if(NotificacionConectado[playerid] == 3)
                {
                    PlayerTextDrawBoxColor(playerid, NotiConnect[playerid][0], 70);
                    PlayerTextDrawBoxColor(playerid, NotiConnect[playerid][4], 70);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][1], 9044129);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][2], -926365496);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][3], -926365496);

                    PlayerTextDrawShow(playerid, NotiConnect[playerid][0]);
                    PlayerTextDrawShow(playerid, NotiConnect[playerid][1]);
                    PlayerTextDrawShow(playerid, NotiConnect[playerid][2]);
                    PlayerTextDrawShow(playerid, NotiConnect[playerid][3]);
                    PlayerTextDrawShow(playerid, NotiConnect[playerid][4]);
                }
                else if(NotificacionConectado[playerid] == 2)
                {
                    PlayerTextDrawBoxColor(playerid, NotiConnect[playerid][0], 50);
                    PlayerTextDrawBoxColor(playerid, NotiConnect[playerid][4], 50);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][1], 11075654);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][2], -926365496);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][3], -926365666);

                    PlayerTextDrawShow(playerid, NotiConnect[playerid][0]);
                    PlayerTextDrawShow(playerid, NotiConnect[playerid][1]);
                    PlayerTextDrawShow(playerid, NotiConnect[playerid][2]);
                    PlayerTextDrawShow(playerid, NotiConnect[playerid][3]);
                    PlayerTextDrawShow(playerid, NotiConnect[playerid][4]);
                }
                else if(NotificacionConectado[playerid] <= 1)
                {
                    PlayerTextDrawBoxColor(playerid, NotiConnect[playerid][0], 255);
                    PlayerTextDrawBoxColor(playerid, NotiConnect[playerid][4], 255);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][1], 8388863);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][2], -1);
                    PlayerTextDrawColor(playerid, NotiConnect[playerid][3], -1);
                    PlayerTextDrawHide(playerid, NotiConnect[playerid][0]);
                    PlayerTextDrawHide(playerid, NotiConnect[playerid][1]);
                    PlayerTextDrawHide(playerid, NotiConnect[playerid][2]);
                    PlayerTextDrawHide(playerid, NotiConnect[playerid][3]);
                    PlayerTextDrawHide(playerid, NotiConnect[playerid][4]);
                }
            }
            new Float:HP,Float:AP;
            GetPlayerHealth(playerid,HP);
            GetPlayerArmour(playerid,AP);

            if(IsPlayerConnected(playerid))
            {
                new AnimWeap;
                AnimWeap = GetPlayerWeapon(playerid);
                if(AnimWeap != WEAPON_PARACHUTE && GetPlayerAnimationIndex(playerid) == 959 && AdminDuty[playerid] == 0) return KickPlayer(playerid, 0, "Fly");
                if(AnimWeap != WEAPON_PARACHUTE && GetPlayerAnimationIndex(playerid) == 974 && AdminDuty[playerid] == 0) return KickPlayer(playerid, 0, "Skin Bug 1");
                if(AnimWeap != WEAPON_PARACHUTE && GetPlayerAnimationIndex(playerid) == 972 && AdminDuty[playerid] == 0) return KickPlayer(playerid, 0, "Skin Bug 2");
                if(AnimWeap != WEAPON_PARACHUTE && GetPlayerAnimationIndex(playerid) == 968 && AdminDuty[playerid] == 0) return KickPlayer(playerid, 0, "Skin Bug 3");
            }
            accionesProstitutas();
            if(!IsPlayerNPC(playerid) && JugadorLogeado[playerid] == 1)
            {
                if(PLAYER_INFO[playerid][OtrasArmas] != 0) return 1;
                if(PLAYER_INFO[playerid][j_ARMAS][8] == 16)
                {
                    if(GetPlayerWeapon(playerid) != 16 && PLAYER_INFO[playerid][j_ARMAS][8] == 16) { SetPlayerAttachedObject(playerid,9,342,8, 0.018998,-0.017999,0.138999,167.299987,-81.500083,-76.099929, 1.000000, 1.000000, 1.000000); }
                    if(GetPlayerWeapon(playerid) == 16 && PLAYER_INFO[playerid][j_ARMAS][8] == 16) { RemovePlayerAttachedObject(playerid,9); }
                }
                else
                {
                    if(GetPlayerWeapon(playerid) != 10 && PLAYER_INFO[playerid][j_ARMAS][10] == 10) { SetPlayerAttachedObject(playerid,9,321,8, -0.064001,-0.009999,0.065000,-100.199996,144.700042,156.200149, 1.000000, 1.000000, 1.000000); }
                    if(GetPlayerWeapon(playerid) == 10 && PLAYER_INFO[playerid][j_ARMAS][10] == 10) { RemovePlayerAttachedObject(playerid,9); }
                    if(GetPlayerWeapon(playerid) != 11 && PLAYER_INFO[playerid][j_ARMAS][10] == 11) { SetPlayerAttachedObject(playerid,9,322,8, -0.064001,-0.009999,0.065000,-100.199996,144.700042,156.200149, 1.000000, 1.000000, 1.000000); }
                    if(GetPlayerWeapon(playerid) == 11 && PLAYER_INFO[playerid][j_ARMAS][10] == 11) { RemovePlayerAttachedObject(playerid,9); }
                    if(GetPlayerWeapon(playerid) != 12 && PLAYER_INFO[playerid][j_ARMAS][10] == 12) { SetPlayerAttachedObject(playerid,9,323,8, -0.064001,-0.009999,0.065000,-100.199996,144.700042,156.200149, 1.000000, 1.000000, 1.000000); }
                    if(GetPlayerWeapon(playerid) == 12 && PLAYER_INFO[playerid][j_ARMAS][10] == 12) { RemovePlayerAttachedObject(playerid,9); }
                    if(GetPlayerWeapon(playerid) != 13 && PLAYER_INFO[playerid][j_ARMAS][10] == 13) { SetPlayerAttachedObject(playerid,9,324,8, -0.064001,-0.009999,0.065000,-100.199996,144.700042,156.200149, 1.000000, 1.000000, 1.000000); }
                    if(GetPlayerWeapon(playerid) == 13 && PLAYER_INFO[playerid][j_ARMAS][10] == 13) { RemovePlayerAttachedObject(playerid,9); }
                    if(GetPlayerWeapon(playerid) != 14 && PLAYER_INFO[playerid][j_ARMAS][10] == 14) { SetPlayerAttachedObject(playerid,9,325,8, -0.064001,-0.009999,0.065000,-100.199996,144.700042,156.200149, 1.000000, 1.000000, 1.000000); }
                    if(GetPlayerWeapon(playerid) == 14 && PLAYER_INFO[playerid][j_ARMAS][10] == 14) { RemovePlayerAttachedObject(playerid,9); }
                }

                if(PLAYER_INFO[playerid][j_ARMAS][7] == 36 || PLAYER_INFO[playerid][j_ARMAS][7] == 35 || PLAYER_INFO[playerid][j_ARMAS][7] == 38)
                {

                    if(GetPlayerWeapon(playerid) != 35 && PLAYER_INFO[playerid][j_ARMAS][7] == 35) {SetPlayerAttachedObject(playerid,8,359,1,  0.165996, -0.121996, -0.053998, 172.799972, 156.600006, 3.699996, 1.000000, 1.000000, 1.000000);}
                    if(GetPlayerWeapon(playerid) == 35 && PLAYER_INFO[playerid][j_ARMAS][7] == 35) { RemovePlayerAttachedObject(playerid,8); }
                    if(GetPlayerWeapon(playerid) != 36 && PLAYER_INFO[playerid][j_ARMAS][7] == 36) {SetPlayerAttachedObject(playerid,8,360,1,  0.165996, -0.121996, -0.053998, 172.799972, 156.600006, 3.699996, 1.000000, 1.000000, 1.000000);}
                    if(GetPlayerWeapon(playerid) == 36 && PLAYER_INFO[playerid][j_ARMAS][7] == 36) { RemovePlayerAttachedObject(playerid,8); }
                    if(GetPlayerWeapon(playerid) != 37 && PLAYER_INFO[playerid][j_ARMAS][7] == 37) {SetPlayerAttachedObject(playerid,8,361,1,  0.086000, -0.094000, -0.166000, 165.5999908, 145.899963, 15.999979, 1.000000, 1.000000, 1.000000);}
                    if(GetPlayerWeapon(playerid) == 37 && PLAYER_INFO[playerid][j_ARMAS][7] == 37) { RemovePlayerAttachedObject(playerid,8); }
                    if(GetPlayerWeapon(playerid) != 38 && PLAYER_INFO[playerid][j_ARMAS][7] == 38) {SetPlayerAttachedObject(playerid,8,362,1,  0.086000, -0.094000, -0.166000, 165.5999908, 145.899963, 15.999979, 1.000000, 1.000000, 1.000000);}
                    if(GetPlayerWeapon(playerid) == 38 && PLAYER_INFO[playerid][j_ARMAS][7] == 38) { RemovePlayerAttachedObject(playerid,8); }
                }
                else
                {

                    if(GetPlayerWeapon(playerid) != 30 && PLAYER_INFO[playerid][j_ARMAS][5] == 30) {SetPlayerAttachedObject(playerid,8,355,1, 0.251998,0.170998,-0.129998,-176.800094,150.299972,-5.100023,0.780000,0.850000,0.758000);}
                    if(GetPlayerWeapon(playerid) == 30 && PLAYER_INFO[playerid][j_ARMAS][5] == 30) { RemovePlayerAttachedObject(playerid,8); }
                    if(GetPlayerWeapon(playerid) != 31 && PLAYER_INFO[playerid][j_ARMAS][5] == 31) {

                        SetPlayerAttachedObject(playerid,8,356,1, 0.251998,0.170998,-0.129998,-176.800094,150.299972,-5.100023,0.780000,0.850000,0.758000);
                    }
                    if(GetPlayerWeapon(playerid) == 31 && PLAYER_INFO[playerid][j_ARMAS][5] == 31) { RemovePlayerAttachedObject(playerid,8); }
                }
            // Slot 7	-	(Escopeta - Escopetas recotardas, Escopeta de combate |	Rifle, Sniper)
                if(PLAYER_INFO[playerid][j_ARMAS][3] == 25 || PLAYER_INFO[playerid][j_ARMAS][3] == 26 || PLAYER_INFO[playerid][j_ARMAS][3] == 27)
                {
                    if(GetPlayerWeapon(playerid) != 25 && PLAYER_INFO[playerid][j_ARMAS][3] == 25) {SetPlayerAttachedObject(playerid,7,349,1, 0.251998,0.170998,-0.129998,-176.800094,150.299972,-5.100023,0.780000,0.850000,0.758000);}
                    if(GetPlayerWeapon(playerid) == 25 && PLAYER_INFO[playerid][j_ARMAS][3] == 25) { RemovePlayerAttachedObject(playerid,7); }
                    if(GetPlayerWeapon(playerid) != 42 && PLAYER_INFO[playerid][j_ARMAS][3] == 42) {SetPlayerAttachedObject(playerid,7,366,5,  0.004000, 0.061999, -0.063999, 126.599990, 33.099998, 2.200000, 1.000000, 1.000000, 1.000000);}
                    if(GetPlayerWeapon(playerid) == 42 && PLAYER_INFO[playerid][j_ARMAS][3] == 42) { RemovePlayerAttachedObject(playerid,7); }
                    if(GetPlayerWeapon(playerid) != 26 && PLAYER_INFO[playerid][j_ARMAS][3] == 26) {SetPlayerAttachedObject(playerid, 7, 350, 8, -0.073000, -0.040999, 0.111999, -82.999992, 0.000000, 0.000000, 0.899999, 0.936000, 0.909000);}
                    if(GetPlayerWeapon(playerid) == 26 && PLAYER_INFO[playerid][j_ARMAS][3] == 26) { RemovePlayerAttachedObject(playerid,7); }
                    if(GetPlayerWeapon(playerid) != 27 && PLAYER_INFO[playerid][j_ARMAS][3] == 27) {SetPlayerAttachedObject(playerid,7,351,1, 0.251998,0.170998,-0.129998,-176.800094,150.299972,-5.100023,0.780000,0.850000,0.758000);}
                    if(GetPlayerWeapon(playerid) == 27 && PLAYER_INFO[playerid][j_ARMAS][3] == 27) { RemovePlayerAttachedObject(playerid,7); }
                }
                else
                {

                    if(GetPlayerWeapon(playerid) != 33 && PLAYER_INFO[playerid][j_ARMAS][6] == 33) {SetPlayerAttachedObject(playerid,7,357,1, 0.251998,0.170998,-0.129998,-176.800094,150.299972,-5.100023,0.780000,0.850000,0.758000);}
                    if(GetPlayerWeapon(playerid) == 33 && PLAYER_INFO[playerid][j_ARMAS][6] == 33) { RemovePlayerAttachedObject(playerid,7); }
                    if(GetPlayerWeapon(playerid) != 34 && PLAYER_INFO[playerid][j_ARMAS][6] == 34) {SetPlayerAttachedObject(playerid,7,358,1, 0.251998,0.170998,-0.129998,-176.800094,150.299972,-5.100023,0.780000,0.850000,0.758000);}
                    if(GetPlayerWeapon(playerid) == 34 && PLAYER_INFO[playerid][j_ARMAS][6] == 34) { RemovePlayerAttachedObject(playerid,7); }
                }
            // Slot 6   -   (Palo de policia, Cuchillo, Palo de Golf, Bate, Pala, Palo de billar, Katana, Motosierra)
                if(GetPlayerWeapon(playerid) != 3  && PLAYER_INFO[playerid][j_ARMAS][1] == 3)  {SetPlayerAttachedObject(playerid,6,334,7,  -0.032002,0.009000,-0.096000,-69.900108,145.399993,166.899917, 1.000000, 1.000000, 1.000000);}
                if(GetPlayerWeapon(playerid) == 3  && PLAYER_INFO[playerid][j_ARMAS][1] == 3)  { RemovePlayerAttachedObject(playerid,6); }
                if(GetPlayerWeapon(playerid) != 4  && PLAYER_INFO[playerid][j_ARMAS][1] == 4)  {SetPlayerAttachedObject(playerid,6,335,7,  -0.032002,0.009000,-0.096000,-69.900108,145.399993,166.899917, 1.000000, 1.000000, 1.000000);}
                if(GetPlayerWeapon(playerid) == 4  && PLAYER_INFO[playerid][j_ARMAS][1] == 4)  { RemovePlayerAttachedObject(playerid,6); }
                if(GetPlayerWeapon(playerid) != 2  && PLAYER_INFO[playerid][j_ARMAS][1] == 2)  {SetPlayerAttachedObject(playerid,6,333,1,  0.067997,-0.188999,0.063998,-4.000112,139.299972,115.199958, 1.000000, 1.000000, 1.000000);}
                if(GetPlayerWeapon(playerid) == 2  && PLAYER_INFO[playerid][j_ARMAS][1] == 2)  { RemovePlayerAttachedObject(playerid,6); }
                if(GetPlayerWeapon(playerid) != 5  && PLAYER_INFO[playerid][j_ARMAS][1] == 5)  {SetPlayerAttachedObject(playerid,6,336,1,  0.067997,-0.188999,0.063998,-4.000112,139.299972,115.199958, 1.000000, 1.000000, 1.000000);}
                if(GetPlayerWeapon(playerid) == 5  && PLAYER_INFO[playerid][j_ARMAS][1] == 5)  { RemovePlayerAttachedObject(playerid,6); }
                if(GetPlayerWeapon(playerid) != 6  && PLAYER_INFO[playerid][j_ARMAS][1] == 6)  {SetPlayerAttachedObject(playerid,6,337,1,  0.067997,-0.188999,0.063998,-4.000112,139.299972,115.199958, 1.000000, 1.000000, 1.000000);}
                if(GetPlayerWeapon(playerid) == 6  && PLAYER_INFO[playerid][j_ARMAS][1] == 6)  { RemovePlayerAttachedObject(playerid,6); }
                if(GetPlayerWeapon(playerid) != 7  && PLAYER_INFO[playerid][j_ARMAS][1] == 7)  {SetPlayerAttachedObject(playerid,6,338,1,  0.067997,-0.188999,0.063998,-4.000112,139.299972,115.199958, 1.000000, 1.000000, 1.000000);}
                if(GetPlayerWeapon(playerid) == 7  && PLAYER_INFO[playerid][j_ARMAS][1] == 7)  { RemovePlayerAttachedObject(playerid,6); }
                if(GetPlayerWeapon(playerid) != 8  && PLAYER_INFO[playerid][j_ARMAS][1] == 8)  {SetPlayerAttachedObject(playerid,6,339,1,  0.067997,-0.188999,0.063998,-4.000112,139.299972,115.199958, 1.000000, 1.000000, 1.000000);}
                if(GetPlayerWeapon(playerid) == 8  && PLAYER_INFO[playerid][j_ARMAS][1] == 8)  { RemovePlayerAttachedObject(playerid,6); }
                if(GetPlayerWeapon(playerid) != 9  && PLAYER_INFO[playerid][j_ARMAS][1] == 9)  { SetPlayerAttachedObject(playerid, 6, 341, 1, 0.177999, -0.149999, -0.170000, -177.400070, 162.099975, 0.000000, 1.000000, 1.000000, 1.000000);}
                if(GetPlayerWeapon(playerid) == 9  && PLAYER_INFO[playerid][j_ARMAS][1] == 9)  { RemovePlayerAttachedObject(playerid,6); }
            // Slot 5   -   (MP5, Uzi, Tec-9) LASERS
                if(GetPlayerWeapon(playerid) != 29 && PLAYER_INFO[playerid][j_ARMAS][4] == 29) { SetPlayerAttachedObject(playerid,5,353,1, 0.251998,0.170998,-0.129998,-176.800094,150.299972,-5.100023,0.780000,0.850000,0.758000); }
                if(GetPlayerWeapon(playerid) == 29 && PLAYER_INFO[playerid][j_ARMAS][4] == 29) { RemovePlayerAttachedObject(playerid,5); }
                if(GetPlayerWeapon(playerid) != 28 && PLAYER_INFO[playerid][j_ARMAS][4] == 28) { SetPlayerAttachedObject(playerid,5,352,7, 0.018998,-0.060998,-0.067000,-74.499992,11.800035,9.500157, 1.000000, 1.000000, 1.000000); }
                if(GetPlayerWeapon(playerid) == 28 && PLAYER_INFO[playerid][j_ARMAS][4] == 28) { RemovePlayerAttachedObject(playerid,5); }
                if(GetPlayerWeapon(playerid) != 32 && PLAYER_INFO[playerid][j_ARMAS][4] == 32) { SetPlayerAttachedObject(playerid,5,372,7, 0.018998,-0.060998,-0.067000,-74.499992,11.800035,9.500157, 1.000000, 1.000000, 1.000000); }
                if(GetPlayerWeapon(playerid) == 32 && PLAYER_INFO[playerid][j_ARMAS][4] == 32) { RemovePlayerAttachedObject(playerid,5); }


            // Quitar objeto
                if(PLAYER_INFO[playerid][j_ARMAS][4]  != 29 && PLAYER_INFO[playerid][j_ARMAS][4]  != 28 && PLAYER_INFO[playerid][j_ARMAS][4]  != 32)	{ RemovePlayerAttachedObject(playerid,5); }
                if(PLAYER_INFO[playerid][j_ARMAS][1]  != 9 && PLAYER_INFO[playerid][j_ARMAS][1]  != 3  && PLAYER_INFO[playerid][j_ARMAS][1]  != 4  && PLAYER_INFO[playerid][j_ARMAS][1]  != 2  && PLAYER_INFO[playerid][j_ARMAS][1]  != 5  && PLAYER_INFO[playerid][j_ARMAS][1]  != 6  && PLAYER_INFO[playerid][j_ARMAS][1]  != 7  && PLAYER_INFO[playerid][j_ARMAS][1]  != 8)	{ RemovePlayerAttachedObject(playerid,6); }
                if(PLAYER_INFO[playerid][j_ARMAS][8] == 16)
                {
                    if(PLAYER_INFO[playerid][j_ARMAS][8]  != 16)	{ RemovePlayerAttachedObject(playerid,9); }
                }
                else
                {

                    if(PLAYER_INFO[playerid][j_ARMAS][10] != 10 && PLAYER_INFO[playerid][j_ARMAS][10] != 11 && PLAYER_INFO[playerid][j_ARMAS][10] != 12 && PLAYER_INFO[playerid][j_ARMAS][10] != 13 && PLAYER_INFO[playerid][j_ARMAS][10] != 14)	{ RemovePlayerAttachedObject(playerid,9); }
                }
                if(PLAYER_INFO[playerid][j_ARMAS][7] == 35 || PLAYER_INFO[playerid][j_ARMAS][7] == 36 || PLAYER_INFO[playerid][j_ARMAS][7] == 37 || PLAYER_INFO[playerid][j_ARMAS][7] == 38)
                {
                    if(PLAYER_INFO[playerid][j_ARMAS][7]  != 35 && PLAYER_INFO[playerid][j_ARMAS][7]  != 36 && PLAYER_INFO[playerid][j_ARMAS][7] != 37 && PLAYER_INFO[playerid][j_ARMAS][7] != 38)	{ RemovePlayerAttachedObject(playerid,8); }
                }
                else
                {
                    if(PLAYER_INFO[playerid][j_ARMAS][5]  != 30 && PLAYER_INFO[playerid][j_ARMAS][5]   != 31)	{ RemovePlayerAttachedObject(playerid,8); }
                }
                if(PLAYER_INFO[playerid][j_ARMAS][3]  == 25 || PLAYER_INFO[playerid][j_ARMAS][3] == 26 || PLAYER_INFO[playerid][j_ARMAS][3] == 27)
                {

                    if(PLAYER_INFO[playerid][j_ARMAS][3]  != 25 && PLAYER_INFO[playerid][j_ARMAS][3]  != 27 && PLAYER_INFO[playerid][j_ARMAS][3]  != 26)	{ RemovePlayerAttachedObject(playerid,7); }
                }
                else
                {

                    if(PLAYER_INFO[playerid][j_ARMAS][6] != 33 && PLAYER_INFO[playerid][j_ARMAS][6]  != 34)	{ RemovePlayerAttachedObject(playerid,7); }
                }
            }
        }
    }
    return 1;
}
stock GlobalPlayerid/*[1200]*/(playerid)
{
    if(JugadorLogeado[playerid] == 1 && !IsPlayerNPC(playerid) && IsPlayerConnected(playerid))
    {
        Anticheats(playerid);
        if(PLAYER_TEMP[playerid][ADVCHEAT] > 0) PLAYER_TEMP[playerid][ADVCHEAT] --;
        if(PLAYER_TEMP[playerid][restriccion_mochila] > 0) PLAYER_TEMP[playerid][restriccion_mochila] --;
        if(PLAYER_TIMES[playerid][FarmearLZ] > 0) PLAYER_TIMES[playerid][FarmearLZ] --;
        if(PLAYER_TEMP[playerid][EntrandoAuto] > 0) PLAYER_TEMP[playerid][EntrandoAuto] --;
        if(PLAYER_TIMES[playerid][CompraWeb] > 0) PLAYER_TIMES[playerid][CompraWeb] --;
        if(PLAYER_TIMES[playerid][TiempoCargo] > 0)
        {
            PLAYER_TIMES[playerid][TiempoCargo] --;
            if(PLAYER_TIMES[playerid][TiempoCargo] == 0)
            {
                if(PLAYER_INFO[playerid][pCargos] < 3 && PLAYER_INFO[playerid][pCargos] > 0)
                {
                    new value = 0;
                    if(RoboTienda[playerid] == 1)
                    {
                        foreach(new c : Player)
                        {
                            if(PLAYER_INFO[c][pFaccion] == 1 && PLAYER_INFO[c][pDuty] == 1 && EstaEnP(playerid,c,30.00))
                            {
                                PLAYER_TIMES[playerid][TiempoCargo] = 60;
                                SendClientMessage(playerid,-1,"La {3399FF}policia{FFFFFF} está muy cerca, {FF0000}tienes que escapar{FFFFFF} para perder los cargos.");
                            }
                            else value = 1;
                        }
                        if(value == 1)
                        {
                            RoboTienda[playerid] = 0;
                            SendClientMessage(playerid,-1,"La {3399FF}policia{FFFFFF} dejó de buscarte, ahora {00CC00}puedes robar{FFFFFF} otro negocio.");
                            PLAYER_INFO[playerid][pCargos] = 0;
                            ActualizarRadar();
                            SetPlayerWantedLevel(playerid,PLAYER_INFO[playerid][pCargos]);
                        }
                    }
                    else
                    {
                        PLAYER_INFO[playerid][pCargos] = 0;
                        ActualizarRadar();
                        SetPlayerWantedLevel(playerid, PLAYER_INFO[playerid][pCargos]);
                        CagoSeguro[playerid] = 0;
                    }
                }
            }
        }
        if((Esposando[playerid] == 2 || PLAYER_INFO[playerid][pCargos] > 0 && PLAYER_INFO[playerid][Agonizando] == 1) && EnPatrulla[playerid] == 0) MarcarJugador(playerid, COLORCARGO7,1);
        // Trabajo Medico
        if(LlamadaMedicos[playerid] == 1)
        {
            foreach(new i : Player)
            {
                if(Reanimado[i] == 0 && RopaMedi[i] == 1 && (PLAYER_INFO[i][pTrabajo] == T_Medico || PLAYER_INFO[i][pTrabajo2] == T_Medico))
                {
                    SetPlayerMarkerForPlayer(i, playerid, COLORABATIDO);
                }
            }
        }
        if(!parlanteStream[playerid])
        {
            foreach(new i : Player)
            {
                if(IsPlayerConnected(i))
                {
                    if(parlante[i])
                    {
                        if(IsPlayerInRangeOfPoint(playerid, 30, bpos[i][0], bpos[i][1], bpos[i][2]))
                        {
                            PlayAudioStreamForPlayer(playerid, parlanteURL[i], bpos[i][0], bpos[i][1], bpos[i][2], 30.0, 1);
                            parlantePlayer[playerid] = i;
                            parlanteStream[playerid] = 1;
                            SendClientMessage(playerid, COLOR_GREY, "{fe8f8f}[Parlante]:{FFFFFF} Usted está escuchando música que sale de un parlante cercano.");
                        }
                    }
                }
            }
        }
        else
        {
            new i = parlantePlayer[playerid];
            if(!IsPlayerInRangeOfPoint(playerid, 30, bpos[i][0], bpos[i][1], bpos[i][2]))
            {
                parlanteStream[playerid] = 0;
                parlantePlayer[playerid] = -1;
                StopAudioStreamForPlayer(playerid);
                SendClientMessage(playerid, COLOR_GREY, "{fe8f8f}[Parlante]:{FFFFFF} Has dejado de escuchar el parlante.");
            }
        }

        if(PLAYER_TEMP[playerid][VariableCaido] != 1)
        {
            if(PLAYER_INFO[playerid][pCargos] == 0)
            {
                foreach(new i : Player)
                {
                    if(PLAYER_INFO[i][pDuty] == 1) SetPlayerMarkerForPlayer(i, playerid, c0_color);
                }
            }
        }
        // Trabajo Taxi
        if(LlamadaTaxi[playerid] == 1)
        {
            foreach(new i : Player)
            {
                if((PLAYER_INFO[i][pTrabajo] == T_Taxista || PLAYER_INFO[i][pTrabajo2] == T_Taxista) && EnTaxi[i] == 1)
                {
                    SetPlayerMarkerForPlayer(i, playerid, COLOR_AMARILLO);
                }
            }
        }
        // Trabajo Mecanico
        if(LlamadaMeca[playerid] == 1)
        {
            foreach(new i : Player)
            {
                if((RopaMeca[i] == 1 || PLAYER_INFO[i][pVip] >= 2) && (PLAYER_INFO[i][pTrabajo] == T_Mecanico || PLAYER_INFO[i][pTrabajo2] == T_Mecanico))
                {
                    SetPlayerMarkerForPlayer(i, playerid, COLOR_AZUL);
                }
            }
        }
        if(PLAYER_INFO[playerid][pDuty] == 1)
        {
            // Trabajo Policia
            if(PLAYER_INFO[playerid][pFaccion] == 1)
            {
                SetPlayerColor(playerid, TEAM_BLUE_COLOR);
            }
            // Trabajo militar
            if(PLAYER_INFO[playerid][pFaccion] == 2)
            {
                SetPlayerColor(playerid, COLOR_MILITAR);
            }
            // Trabajo militar
            if(PLAYER_INFO[playerid][pFaccion] == 3)
            {
                SetPlayerColor(playerid, COLOR_BOMBERO);
            }
        }
        if(!IsPlayerNPC(playerid))
        {
            new autoid = GetPlayerVehicleID(playerid);
            if(IsPlayerInAnyVehicle(playerid))
            {
                if(autoid != EnAuto[playerid] && PLAYER_INFO[playerid][pAdmin] < ADMIN_LEVEL_GLOBAL)
                {
                    if(AvisosAuto[playerid] < 5)
                    {
                        AvisosAuto[playerid]++;
                    }
                    else if(AvisosAuto[playerid] >= 5)
                    {
                        ResetPlayerWeapons(playerid);
                        DarArmas(playerid);
                    }
                }
            }
            new vehicleid = GetPlayerVehicleID(playerid), veces;
            new modelo = GetVehicleModel(vehicleid);
            new velocidadmax = VelocidadMaxAuto(modelo);
            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
            {
                if(GetVehicleSpeedEx(vehicleid) > velocidadmax+velocidadmax)
                {
                    if(GetVehicleSpeedEx(vehicleid) >= velocidadmax+velocidadmax+velocidadmax) veces = 3;
                    else if(GetVehicleSpeedEx(vehicleid) > velocidadmax+velocidadmax && GetVehicleSpeedEx(vehicleid) < velocidadmax+velocidadmax) veces = 2;
                    if(veces < 2) return 1;
                    new string[128];
                    format(string,sizeof(string),"El jugador {FF3300}%s(ID:%d){FFFFFF} superó %d veces la velocidad (%d/%d) Vehiculo: {FF3300}%d",PLAYER_INFO[playerid][Nickname],playerid,veces,GetVehicleSpeedEx(vehicleid),velocidadmax,vehicleid);
                    MensajeAdmin(0xFFFFFFFF, string, ADMIN_LEVEL_BANEOS);
                }
            }
        }
    }
    if(!IsPlayerNPC(playerid) && IsPlayerConnected(playerid))
    {
        new pCurWeap = GetPlayerWeapon(playerid);
        if(pCurWeap != pCurrentWeapon[playerid]) {

            DAR_COLOREARAM(playerid, pCurWeap);
            pCurrentWeapon[playerid] = pCurWeap;
        }
        if(TRUCK(GetPlayerVehicleID(playerid)) && rtatrucker[playerid] > 0 && GetVehicleTrailer(GetPlayerVehicleID(playerid)) == 0 && PLAYER_TIMES[playerid][TiempoTruck] > 0)
        {
            new strrr[64];
            PLAYER_TIMES[playerid][TiempoTruck] --;
            format(strrr,sizeof strrr,"Tienes %d segundos para enganchar el trailer.",PLAYER_TIMES[playerid][TiempoTruck]);
            GameTextForPlayerEx(playerid, strrr, 400, 4);
            if(PLAYER_TIMES[playerid][TiempoTruck] <= 0)
            {
                rtatrucker[playerid] = 0;
                Chofer[GetPlayerVehicleID(playerid)] = INVALID_PLAYER_ID;
                SetVehicleToRespawn(GetPlayerVehicleID(playerid));
                SetVehicleToRespawn(TrailerTruck[playerid]);
                PLAYER_INFO[playerid][CargoTrailer] = 0;
                SendClientMessage(playerid,-1,"Perdiste la ruta por tener el trailer des-enganchado.");
            }
        }
        if(JugadorLogeado[playerid] == 1)
        {
            if(GetPlayerSurfingVehicleID(playerid) != INVALID_VEHICLE_ID)
            {
                if(TAXI(GetPlayerSurfingVehicleID(playerid)))
                {
                    if(GetVehicleSpeedEx(GetPlayerSurfingVehicleID(playerid)) >= 23)
                    {
                        new x = 0;
                        if(x == 0)
                        {
                            x = 1;
                            GetPlayerPos(playerid, CaidaTaxi[0][playerid],CaidaTaxi[1][playerid],CaidaTaxi[2][playerid]);
                            SetTimerEx("Equilibrio",1000,false,"d",playerid);
                        }
                    }
                }
            }
            if(PidioRefuerzos[playerid] == 1)
            {
                foreach(new x : Player) //Loop de playerids
                {
                    if(PLAYER_INFO[x][pFaccion] == 1) SetPlayerMarkerForPlayer(x, playerid, COLOR_POLICIAREF);
                }
            }
            if(PidioRefuerzos[playerid] == 2)
            {
            foreach(new x : Player) //Loop de playerids
            {
                if(PLAYER_INFO[x][pFaccion] == 2) SetPlayerMarkerForPlayer(x, playerid, COLOR_MILITARREF);
            }
        }
        if(PidioRefuerzos[playerid] == 3)
        {
            foreach(new x : Player) //Loop de playerids
            {
                if(PLAYER_INFO[x][pFaccion] == 3) SetPlayerMarkerForPlayer(x, playerid, COLOR_BOMBEROREF);
            }
        }
        else if(PidioRefuerzos[playerid] > 3)
        {
            foreach(new x : Player) //Loop de playerids
            {
                new CrewColorChat = getPlayerCrewColor(x);
                if(PLAYER_INFO[x][pFaccion] == PidioRefuerzos[playerid]) SetPlayerMarkerForPlayer(x, playerid, CrewColorChat);
            }
        }
        if(EmpezoCarreraP[playerid] > 0)
        {
            if(EmpezoCarrera == 1)
            {

                if(EnCarreras[playerid] > 0 && IsPlayerConnected(playerid))
                {

                    PLAYER_TIMES[playerid][TiempoCarrera] ++;
                    new stringx[50];
                    format(stringx,sizeof(stringx),"%d:%s",PLAYER_TIMES[playerid][TiempoCarrera]/60,NumerosConCero(PLAYER_TIMES[playerid][TiempoCarrera]%(60)));
                    PlayerTextDrawSetString(playerid,CarreraT[playerid][2],stringx);
                }
            }
        }
        if(PLAYER_TIMES[playerid][TiempoAD] > 0) PLAYER_TIMES[playerid][TiempoAD] --;
        if(PLAYER_INFO[playerid][suspendido] > 0) PLAYER_INFO[playerid][suspendido] --;
        if(PLAYER_TIMES[playerid][pTIME_PEDIDO] > 0) PLAYER_TIMES[playerid][pTIME_PEDIDO] --;
        if(RobadoReciente[playerid] > 0) RobadoReciente[playerid] --;
        if(Advertido[playerid] > 0) Advertido[playerid] --;
        if(PLAYER_TIMES[playerid][Consumible] > 0) PLAYER_TIMES[playerid][Consumible] --;
        if(ErrorMensaje[playerid] > 0) ErrorMensaje[playerid]--;
        if(EmailEnviado[playerid] > 0) EmailEnviado[playerid]--;
        if(Entrando[playerid] > 0) Entrando[playerid] --;
        if(GolpesAdv[playerid] > 0) GolpesAdv[playerid] --;
        if(PLAYER_TIMES[playerid][TiempoAntiA] > 0) PLAYER_TIMES[playerid][TiempoAntiA] --;
        if(PLAYER_TIMES[playerid][TiempoAntiC] > 0) PLAYER_TIMES[playerid][TiempoAntiC] --;
        if(PLAYER_TIMES[playerid][TiempoAntiHH] > 0) PLAYER_TIMES[playerid][TiempoAntiHH] --;
        if(PLAYER_TIMES[playerid][TiempoAntiAB] > 0) PLAYER_TIMES[playerid][TiempoAntiAB] --;
        if(PLAYER_TIMES[playerid][TiempoAntiAim] > 0) PLAYER_TIMES[playerid][TiempoAntiAim] --;
        if(PLAYER_TIMES[playerid][TiempoFumarPorro] > 0) PLAYER_TIMES[playerid][TiempoFumarPorro] --;
        if(PLAYER_TIMES[playerid][TiempoMensajeRobar] > 0) PLAYER_TIMES[playerid][TiempoMensajeRobar] --;
        if(PLAYER_TIMES[playerid][TiempoBebida] > 0) { PLAYER_TIMES[playerid][TiempoBebida] --;   }
        if(PLAYER_TIMES[playerid][TiempoSexoOfrecido] > 0) { PLAYER_TIMES[playerid][TiempoSexoOfrecido]--;	 }
        if(TimeChange[playerid] > 0) { TimeChange[playerid]--;	 }
        if(PLAYER_TIMES[playerid][TiempoAceptar] > 0) { PLAYER_TIMES[playerid][TiempoAceptar]--;	 }
        if(PLAYER_TIMES[playerid][TiempoBolso] > 0) { PLAYER_TIMES[playerid][TiempoBolso]--;	 }
        if(PLAYER_TIMES[playerid][TiempoMotor] > 0) { PLAYER_TIMES[playerid][TiempoMotor]--;	 }
        if(PLAYER_TIMES[playerid][TiempoRef] > 0) { PLAYER_TIMES[playerid][TiempoRef]--;	 }
        if(PLAYER_TIMES[playerid][TiempoGPS] > 0) { PLAYER_TIMES[playerid][TiempoGPS]--;	 }
        if(PLAYER_TIMES[playerid][TiempoExpulsar] > 0) { PLAYER_TIMES[playerid][TiempoExpulsar]--;	 }
        if(PLAYER_TIMES[playerid][TiempoIntentar] > 0) { PLAYER_TIMES[playerid][TiempoIntentar]--;	 }
        if(PLAYER_TIMES[playerid][TiempoComputadora] > 0) { PLAYER_TIMES[playerid][TiempoComputadora]--;	 }
        if(PLAYER_TIMES[playerid][TiempoCLUB] > 0) { PLAYER_TIMES[playerid][TiempoCLUB]--;	 }
        if(PLAYER_TIMES[playerid][TiempoDuda] > 0) { PLAYER_TIMES[playerid][TiempoDuda]--; }
        if(BloquearAnuncio[playerid] > 0) { BloquearAnuncio[playerid] --; }
        if(PLAYER_TIMES[playerid][TiempoDarDinero] > 0) { PLAYER_TIMES[playerid][TiempoDarDinero]--; }
        if(PLAYER_TIMES[playerid][TiempoCrack] > 0) { PLAYER_TIMES[playerid][TiempoCrack]--;}
        if(PLAYER_TIMES[playerid][TiempoLSD] > 0) { PLAYER_TIMES[playerid][TiempoLSD]--;}
        if(PLAYER_TIMES[playerid][TiempoKrippy] > 0) { PLAYER_TIMES[playerid][TiempoKrippy]--;}
        if(PLAYER_TIMES[playerid][TiempoCaramelos] > 0) { PLAYER_TIMES[playerid][TiempoCaramelos]--;}
        if(PLAYER_TIMES[playerid][TiempoLlenar] > 0) { PLAYER_TIMES[playerid][TiempoLlenar]--;	 }
        if(PLAYER_TIMES[playerid][TiempoReparar] > 0) { PLAYER_TIMES[playerid][TiempoReparar]--;}
        if(PLAYER_TIMES[playerid][TiempoMarihuana] > 0) { PLAYER_TIMES[playerid][TiempoMarihuana]--;}
        if(PruebaOnline[playerid] == true) { PLAYER_TIMES[playerid][TiempoAcademia]++;}
        if(PLAYER_TIMES[playerid][TiempoVenta] > 0) { PLAYER_TIMES[playerid][TiempoVenta]--; }
        if(PLAYER_TIMES[playerid][TiempoMedicamentos] > 0) { PLAYER_TIMES[playerid][TiempoMedicamentos]--; }
        if(PLAYER_TIMES[playerid][TiempoCubrir] > 0) PLAYER_TIMES[playerid][TiempoCubrir] --;
        if(ContarMensajes[playerid] > 0) ContarMensajes[playerid] = 0;
        if(PLAYER_TIMES[playerid][TiempoRef] > 0)
        {

            PLAYER_TIMES[playerid][TiempoRef] --;
            if(PLAYER_INFO[playerid][pFaccion] == 1)
            {

                if(PLAYER_TIMES[playerid][TiempoRef] == 20 || PLAYER_TIMES[playerid][TiempoRef] == 10) TextDrawHideForPlayer(playerid, AlertaRefuerzos[4]);
                if(PLAYER_TIMES[playerid][TiempoRef] == 15 || PLAYER_TIMES[playerid][TiempoRef] == 5 ) TextDrawShowForPlayer(playerid, AlertaRefuerzos[4]);
                if(PLAYER_TIMES[playerid][TiempoRef] == 0)
                {
                    for(new td; td < sizeof(AlertaRefuerzos); td++) TextDrawHideForPlayer(playerid, AlertaRefuerzos[td]);
                }
        }
    }
    if(EnSalonEvento(playerid) && Alquilado == true && Boleto[playerid] == false)
    {

        if(strcmp(Alquilador, PLAYER_INFO[playerid][Nickname],true) == 1)
        {

            NoTeleportHack(playerid);
            SendClientMessage(playerid,-1, "Los guardias del salón te expulsaron por no haber pagado la entrada.");
            SetPlayerPos(playerid, 1423.4301,-1180.1801,25.9922);
            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
        }
    }
    if(EnSalonEvento(playerid) && Escuchando[playerid] == false && Alquilado == true)
    {
        Escuchando[playerid] = true;
        PlayAudioStreamForPlayer(playerid,"http://"WEB_RADIO":8000/listen.pls?sid=10");
    }
    else if(!EnSalonEvento(playerid) && Escuchando[playerid] == true)
    {
        Escuchando[playerid] = false;
        StopAudioStreamForPlayer(playerid);
    }
    if(PickupRopa[playerid] > 0)
    {
        PickupRopa[playerid]--;
    }
    else if(!EnSalonEvento(playerid) && Escuchando[playerid] == true)
    {
        Escuchando[playerid] = false;
        StopAudioStreamForPlayer(playerid);
    }
    else if(PLAYER_INFO[playerid][pTiempoJail] >= 0 && San[playerid] == 1)
    {

        PLAYER_INFO[playerid][pTiempoJail] --;
        if(PLAYER_INFO[playerid][pTiempoJail] <= 0)
        {
            NoTeleportHack(playerid);
            Jail[playerid] = 0;
            PLAYER_INFO[playerid][pTiempoCarcel] = 0;
            PLAYER_INFO[playerid][pTiempoJail] = 0;
            San[playerid] = 0;
            new donde = random(6);
            switch(donde)
            {

                case 0: SetPosEx(playerid, 1443.8561,-1663.9950,13.5530,91.1813,0,0);
                case 1: SetPosEx(playerid, 1443.4794,-1665.1669,13.5530,91.1813,0,0);
                case 2: SetPosEx(playerid, 1443.6100,-1666.9442,13.5530,91.1813,0,0);
                case 3: SetPosEx(playerid, 1445.0105,-1666.2917,13.5530,91.1813,0,0);
                case 4: SetPosEx(playerid, 1444.9506,-1664.9329,13.5530,91.1813,0,0);
                case 5: SetPosEx(playerid, 1444.5131,-1663.3024,13.5530,91.1813,0,0);
            }
            SendClientMessage(playerid, -1, "Has cumplido tu tiempo de sancion, ten en cuenta las reglas para no volver a ser sancionado.");
        }
    }
    new Float:Pos[3];
    if(!IsPlayerNPC(playerid))
    {

        GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
        new Float:Distancia = GetPlayerDistanceFromPoint(playerid,PosJugador[playerid][0],PosJugador[playerid][1],PosJugador[playerid][2]);
        if(!IsPlayerInAnyVehicle(playerid))
        {
            if(Distancia > 200 && TimerTP[playerid] < gettime() && GetPlayerState(playerid) != PLAYER_STATE_SPECTATING && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID)
            {
                if(Entrando[playerid] == 0 && JugadorLogeado[playerid] == 1)
                {
                    if(GetPlayerScore(playerid) > 0)
                    {

                        if(GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID)
                        {
                            //SetTimerEx("CheckSobeit", segundos(5), 0, "i", playerid);
                            MensajeAdminEx(4, COLOR_CHEAT, "[POSIBLE] TELEPORT: %s (ID:%d) - D: %f - N: %d",PLAYER_INFO[playerid][Nickname],playerid,Distancia,PLAYER_INFO[playerid][@Nivel]);
                        }
                    }
                }
            }
        }
        new ac_sa = GetPlayerState(playerid), ac_gpp;
        ac_gpp = GetPlayerPing(playerid);
        if(ac_sa == 157 || ac_sa == 159 || ac_sa == 161 || ac_sa == 1058)
        {

            new string2[100];
            format(string2,sizeof(string2),"%s(ID:%d) cheat de volar a pie (Nivel:%d - %dhs)",PLAYER_INFO[playerid][Nickname],playerid,PLAYER_INFO[playerid][@Nivel],PLAYER_INFO[playerid][horasjugadas]);
            MensajeAdmin(COLOR_YELLOW, string2, 3);
        }
        if(ac_sa == 1231 || ac_sa == 1141 || ac_sa == 1196)
        {

            new stringx[250];
            format(stringx,sizeof(stringx),"[POSIBLE] Jugador: %s (ID:%d) Distancia: %f / Animacion: %d / Ping: %d",PLAYER_INFO[playerid][Nickname],playerid,Distancia,ac_sa,ac_gpp);
            MensajeAdmin(COLOR_CHEAT, stringx, 3);
        }
    }
    PosJugador[playerid][0] = Pos[0];
    PosJugador[playerid][1] = Pos[1];
    PosJugador[playerid][2] = Pos[2];

    new Float:health;
    GetPlayerHealth(playerid,health);
    if(JugadorLogeado[playerid] == 1)
    {

        if(Curando[playerid] == 1)
        {

            if(PLAYER_INFO[playerid][@Salud] >= 60)
            {

                Curando[playerid] = 0;
                EstablecerVida(playerid, 60);
                SetTimerEx("ApareceHospital2", 1000, false, "d", playerid);
            }
            else
            {
                EstablecerVida(playerid, PLAYER_INFO[playerid][@Salud]+2.0);
            }
        }
    }
    if(Entrando[playerid] == 0)
    {
        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
            new vehicleid = GetPlayerVehicleID(playerid), surf = GetPlayerSurfingVehicleID(playerid), surf_object = GetPlayerSurfingObjectID(playerid);
            if((GetVehicleSpeedEx(vehicleid) > (GetVehicleTopSpeed(vehicleid)+160)) && !AVION(vehicleid) && surf == INVALID_VEHICLE_ID && surf_object == INVALID_OBJECT_ID && MotorAuto[vehicleid] > 0)
            {
                if(PLAYER_TIMES[playerid][TiempoAntiC] > 0) return 1;
                PLAYER_TIMES[playerid][TiempoAntiC] = 2;
                new Vel = VelocidadMaxAuto(GetVehicleModel(vehicleid));
                new stringx[256];
                format(stringx, 256,"Posible cheat de choque {FF3300}%s(ID: %d){FFFFFF} - Velocidad: %d/%d",PLAYER_INFO[playerid][Nickname], playerid, GetVehicleSpeedEx(vehicleid), Vel);
                MensajeAdmin(COLOR_CHEAT, stringx, 3);
                if(PLAYER_INFO[playerid][@Nivel] == 2)
                {

                    NoTeleportHack(playerid);
                    new Float:X,Float:Y,Float:Z;
                    GetPlayerPos(playerid, X, Y, Z);
                    SendClientMessage(playerid, -1, "{FFFFFF}Saliste disparado del vehiculo a causa de un fuerte impacto.");
                    RemovePlayerFromVehicle(playerid);
                    SetPlayerPos(playerid, X, Y, Z+5);
                }
            }
        }
    }
    if(GPSActivado[playerid] == 1)
    {
        TextDrawHideForPlayer(playerid, Sangre);

        foreach(new i : Player)
        {
            if(IsPlayerConnected(i) && GetPlayerInterior(i) == 0)
            {

                new Float: xPos[3];
                GetPlayerPos(i, xPos[0], xPos[1], xPos[2]);
                floatMapa3Da2D(xPos[0], xPos[1], 360.000000, 26.000000,256.000000,256.000000, GPSPOS[i][0], GPSPOS[i][1]);
                if(RopaMedi[playerid] == 1 && (PLAYER_INFO[playerid][pTrabajo] == T_Medico || PLAYER_INFO[playerid][pTrabajo2] == T_Medico))
                {

                    switch(MarcadoMedicos[i])
                    {

                        case 0: {if(TDPGPSCreado[playerid][i] == 1){PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);TDPGPSCreado[playerid][i] = 0;}}
                        case 1: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0x00CC00FF);
                    }
                }
                if(PLAYER_INFO[playerid][pTrabajo] == T_Taxista || PLAYER_INFO[playerid][pTrabajo2] == T_Taxista)
                {

                    switch(LlamadaTaxi[i])
                    {

                        case 0: {if(TDPGPSCreado[playerid][i] == 1){PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);TDPGPSCreado[playerid][i] = 0;}}
                        case 1: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0x00AEFFFF);
                    }
                }
                if(RopaMeca[playerid] == 1 && (PLAYER_INFO[playerid][pTrabajo] == T_Mecanico || PLAYER_INFO[playerid][pTrabajo2] == T_Mecanico))
                {

                    switch(LlamadaMeca[i])
                    {

                        case 0: {if(TDPGPSCreado[playerid][i] == 1){PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);TDPGPSCreado[playerid][i] = 0;}}
                        case 1: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0x00CCFFFF);
                    }
                }
                if(PLAYER_INFO[playerid][pFaccion] == PLAYER_INFO[i][pFaccion] && PLAYER_INFO[i][pFaccion] != 1)
                {

                    switch(FlashRef2[i])
                    {

                        case 0: {if(TDPGPSCreado[playerid][i] == 1){PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);TDPGPSCreado[playerid][i] = 0;}}
                        case 1: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xFFB833FF);
                    }
                }
                if(PLAYER_INFO[playerid][pDuty] == 1)
                {
                    if(PLAYER_INFO[i][pCargos] > 0)
                    {
                        if(PLAYER_INFO[i][Agonizando] == 1 || Esposando[i] == 2)
                        {
                            if(PLAYER_INFO[i][pCargos] > 0) CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0x33AA33FF);
                        }
                        else
                        {
                            switch(PLAYER_INFO[i][pCargos])
                            {
                                case 0:
                                {
                                    if(TDPGPSCreado[playerid][i] == 1)
                                    {
                                        PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);
                                        PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);
                                        TDPGPSCreado[playerid][i] = 0;
                                    }
                                }
                                case 1: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xFFFDBAFF);
                                case 2: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xFFC600FF);
                                case 3: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xFFA200FF);
                                case 4: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xFF8400FF);
                                case 5: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xFF5A00FF);
                                default: CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xFF1E00FF);
                            }
                        }
                    }
                }
            }
        }
        if(PLAYER_TEMP[playerid][pt_Camionero])
        {
            new i = (MAX_TEXTDRAWS-1);
            floatMapa3Da2D(PuntoCX[playerid],PuntoCY[playerid], 360.000000, 26.000000,256.000000,256.000000, GPSPOS[i][0], GPSPOS[i][1]);
            CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xAA0000FF);
        }
        else if(!PLAYER_TEMP[playerid][pt_Camionero])
        {
            new i = (MAX_TEXTDRAWS-1);
            if(TDPGPSCreado[playerid][i] == 1)
            {
                PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);
                PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);
                TDPGPSCreado[playerid][i] = 0;
            }
        }
        if(Localizando[playerid] == 1)
        {
            new i = (MAX_TEXTDRAWS-1);
            floatMapa3Da2D(LocalizandoAuto[playerid][0],LocalizandoAuto[playerid][1], 360.000000, 26.000000,256.000000,256.000000, GPSPOS[i][0], GPSPOS[i][1]);
            CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xAA0000FF);
                //rintf("Creando ICONO LOCALIZAR_ %f | %f",LocalizandoAuto[u][0],LocalizandoAuto[u][1]);
        }
        else if(Localizando[playerid] == 0)
        {
            new i = (MAX_TEXTDRAWS-1);
            if(TDPGPSCreado[playerid][i] == 1)
            {
                PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);
                PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);
                TDPGPSCreado[playerid][i] = 0;
            }
        }
        if(PLAYER_TEMP[playerid][pt_Transportista])
        {
            new i = (MAX_TEXTDRAWS-1);
            floatMapa3Da2D(PuntoTraX[playerid],PuntoTraY[playerid], 360.000000, 26.000000,256.000000,256.000000, GPSPOS[i][0], GPSPOS[i][1]);
            CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xAA0000FF);
        }
        else if(!PLAYER_TEMP[playerid][pt_Transportista])
        {
            new i = (MAX_TEXTDRAWS-1);
            if(TDPGPSCreado[playerid][i] == 1)
            {
                PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);
                PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);
                TDPGPSCreado[playerid][i] = 0;
            }
        }
        if(PuntoBaX[playerid] != 0)
        {
            new i = (MAX_TEXTDRAWS-1);
            floatMapa3Da2D(PuntoBaX[playerid],PuntoBaY[playerid], 360.000000, 26.000000,256.000000,256.000000, GPSPOS[i][0], GPSPOS[i][1]);
            CrearPlayerIconoGPS(playerid, i, GPSPOS[i][0], GPSPOS[i][1], 0xAA0000FF);
        }
        else if(PuntoBaX[playerid] == 0)
        {
            new i = (MAX_TEXTDRAWS-1);
            if(TDPGPSCreado[playerid][i] == 1)
            {
                PlayerTextDrawDestroy(playerid, TextDPGPS[playerid][i]);
                PlayerTextDrawDestroy(playerid, TextDPGPS2[playerid][i]);
                TDPGPSCreado[playerid][i] = 0;
            }
        }
        PlayerTextDrawDestroy(playerid, PlayerGPS[playerid]);
        new Float:DyGPSPos[2];
        new Float:posicionPlayerGPS[3];
        GetPlayerPos(playerid, posicionPlayerGPS[0], posicionPlayerGPS[1], posicionPlayerGPS[2]);
        floatMapa3Da2D(posicionPlayerGPS[0], posicionPlayerGPS[1], 360.000000, 26.000000,256.000000,256.000000, DyGPSPos[0], DyGPSPos[1]);

        PlayerGPS[playerid] = CreatePlayerTextDraw(playerid, DyGPSPos[0], DyGPSPos[1], "hud:radar_waypoint");
        PlayerTextDrawLetterSize(playerid, PlayerGPS[playerid], 1.000000, 2.000000);
        PlayerTextDrawTextSize(playerid, PlayerGPS[playerid], 8.000000, 8.000000);
        PlayerTextDrawAlignment(playerid, PlayerGPS[playerid], 0);
        PlayerTextDrawColor(playerid, PlayerGPS[playerid], 0xE1E1E1FF);
        PlayerTextDrawUseBox(playerid, PlayerGPS[playerid], 1);
        PlayerTextDrawBoxColor(playerid, PlayerGPS[playerid], 0x000000FF);
        PlayerTextDrawSetShadow(playerid, PlayerGPS[playerid], 1);
        PlayerTextDrawSetOutline(playerid, PlayerGPS[playerid], 0);
        PlayerTextDrawBackgroundColor(playerid, PlayerGPS[playerid], 0x000000FF);
        PlayerTextDrawFont(playerid, PlayerGPS[playerid], 4);
        PlayerTextDrawSetProportional(playerid, PlayerGPS[playerid], 1);
        PlayerTextDrawSetSelectable(playerid, PlayerGPS[playerid], 0);
        PlayerTextDrawShow(playerid, PlayerGPS[playerid]);
    }
    
    if(YoLlame[playerid] == 1) MinutoLlamada[playerid] += 1;
    if(JustReported[playerid] != 0){ JustReported[playerid]--; }

    if(PLAYER_TIMES[playerid][TiempoAgresor] > 0 && Agresor[playerid] != INVALID_PLAYER_ID) PLAYER_TIMES[playerid][TiempoAgresor]--;
    else if(PLAYER_TIMES[playerid][TiempoAgresor] <= 0 && Agresor[playerid] != INVALID_PLAYER_ID)
    {
        PLAYER_TIMES[playerid][TiempoAgresor] = 0;
        Agresor[playerid] = INVALID_PLAYER_ID;
    }
}
}
return 1;
}
stock ServerMicrobeat()
{
	foreach(new i : Player)
	{
		new Float:health, carid, arrDamage[4];

		if(!IsPlayerNPC(i) && JugadorLogeado[i] == 1 && IsPlayerConnected(i))
		{
            if(FabricaToxica[i] > 0) GetPlayerHealth(i,health), EstablecerVida(i, health - 2);
			EstaEnFuego(i); //- Incendios
            RP_SAFDTick(i);
			if(GetPVarInt(i, "laser") == 1)
			{
				RemovePlayerAttachedObject(i, 1);
				if ((!IsPlayerInAnyVehicle(i)) || (!IsPlayerInWater(i)))
				{
					switch (GetPlayerWeapon(i))
					{
						case 0:
						{
							RemovePlayerAttachedObject(i, 7);
						}
						case 23:
						{
							if (IsPlayerAiming(i))
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.108249, 0.030232, 0.118051, 1.468254, 350.512573, 364.284240);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.108249, 0.030232, 0.118051, 1.468254, 349.862579, 364.784240);
								}
							}
							else
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.078248, 0.027239, 0.113051, -11.131746, 350.602722, 362.384216);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.078248, 0.027239, 0.113051, -11.131746, 350.602722, 362.384216);
								}
							}
						}
						case 24:
						{
							if (IsPlayerAiming(i))
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.108249, 0.030232, 0.118051, 1.468254, 350.512573, 364.284240);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.108249, 0.030232, 0.118051, 1.468254, 349.862579, 364.784240);
								}
							}
							else
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.078248, 0.027239, 0.113051, -11.131746, 350.602722, 362.384216);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.078248, 0.027239, 0.113051, -11.131746, 350.602722, 362.384216);
								}
							}
						}
						case 27:
						{
							if (IsPlayerAiming(i))
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.588246, -0.022766, 0.138052, -11.531745, 347.712585, 352.784271);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.588246, -0.022766, 0.138052, 1.468254, 350.712585, 352.784271);
								}
							}
							else
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.563249, -0.01976, 0.134051, -11.131746, 351.602722, 351.384216);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.563249, -0.01976, 0.134051, -11.131746, 351.602722, 351.384216);
								}
							}
						}
						case 30:
						{
							if (IsPlayerAiming(i))
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.628249, -0.027766, 0.078052, -6.621746, 352.552642, 355.084289);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.628249, -0.027766, 0.078052, -1.621746, 356.202667, 355.084289);
								}
							}
							else
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.663249, -0.02976, 0.080051, -11.131746, 358.302734, 353.384216);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.663249, -0.02976, 0.080051, -11.131746, 358.302734, 353.384216);
								}
							}
						}
						case 31:
						{
							if (IsPlayerAiming(i))
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.528249, -0.020266, 0.068052, -6.621746, 352.552642, 355.084289);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.528249, -0.020266, 0.068052, -1.621746, 356.202667, 355.084289);
								}
							}
							else
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.503249, -0.02376, 0.065051, -11.131746, 357.302734, 354.484222);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.503249, -0.02376, 0.065051, -11.131746, 357.302734, 354.484222);
								}
							}
						}
						case 34:
						{
							if (IsPlayerAiming(i))
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.528249, -0.020266, 0.068052, -6.621746, 352.552642, 355.084289);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.528249, -0.020266, 0.068052, -1.621746, 356.202667, 355.084289);
								}
							}
							else
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.658248, -0.03276, 0.133051, -11.631746, 355.302673, 353.584259);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.658248, -0.03276, 0.133051, -11.631746, 355.302673, 353.584259);
								}
							}
						}
						case 29:
						{
							if (IsPlayerAiming(i))
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.298249, -0.02776, 0.158052, -11.631746, 359.302673, 357.584259);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.298249, -0.02776, 0.158052, 8.368253, 358.302673, 352.584259);
								}
							}
							else
							{
								if (GetPlayerSpecialAction(i) != SPECIAL_ACTION_DUCK)
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.293249, -0.027759, 0.195051, -12.131746, 354.302734, 352.484222);
								}
								else
								{
									SetPlayerAttachedObject(i, 7, GetPVarInt(i, "color"), 6,
										0.293249, -0.027759, 0.195051, -12.131746, 354.302734, 352.484222);
								}
							}
						}
					}
				}
			}
			
			if(!IsPlayerInAnyVehicle(i) && PLAYER_INFO[i][varzonasegura] == 1 && PLAYER_INFO[i][pDuty] == 0) { SetPlayerArmedWeapon(i, 0); }
			
			if(GetPlayerWantedLevel(i) != PLAYER_INFO[i][pCargos]) SetPlayerWantedLevel(i,PLAYER_INFO[i][pCargos]);
			if(PLAYER_INFO[i][jRopa] != GetPlayerSkin(i) && PLAYER_INFO[i][jRopa] != 0 && RopaMedi[i] == 0 && PLAYER_INFO[i][pDuty] == 0 && RopaMeca[i] == 0 && RopaMine[i] == 0 && RopaBasu[i] == 0) SetPlayerSkin(i, PLAYER_INFO[i][jRopa]);
			new Float:vida,Float:chaleco;
			GetPlayerHealth(i,vida);
			GetPlayerArmour(i,chaleco);
			if(vida > PLAYER_INFO[i][@Salud])
			{
				PLAYER_INFO[i][@Salud] = vida;
			}
			if(chaleco > PLAYER_INFO[i][@Chaleco])
			{
				PLAYER_INFO[i][@Chaleco] = chaleco;
			}
			if(PLAYER_INFO[i][Agonizando] != 0) SetPlayerArmedWeapon(i, 0);

			if(TieneEncargo[i] > 0 && PLAYER_INFO[i][j_ARMAS][2] == 23  && Encargo[TieneEncargo[i]][Tiene9mm] == 0)
			{

				Encargo[TieneEncargo[i]][Tiene9mm] = 1;
				TextDrawSetString(MisionCriminal[TieneEncargo[i]], "~g~Reúnete~w~ con tu colega en el punto marcado.");
			}

			else if(PLAYER_INFO[i][jRopa] == 0)
			{

				switch(PLAYER_INFO[i][jSexo])
				{

					case 1: PLAYER_INFO[i][jRopa] = 250;
					case 2: PLAYER_INFO[i][jRopa] = 11;
				}
			}

		}

		new drunknew = GetPlayerDrunkLevel(i);
		if (drunknew < 100) { // go back up, keep cycling.
			SetPlayerDrunkLevel(i, 2000);
		} else {

			if (pDrunkLevelLast[i] != drunknew) {

				new wfps = pDrunkLevelLast[i] - drunknew;

				if ((wfps > 0) && (wfps < 200))
					pFPS[i] = wfps;

				pDrunkLevelLast[i] = drunknew;
			}

		}

		if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
		{

			carid = GetPlayerVehicleID(i);
			iVehicle[i] = GetPlayerVehicleID(i);
			for(new s=0;s<20;s++)
			{

				if(SpikeStrips[s][sX] != 0)
				{

					if(VehicleToPoint( 3.0, carid, SpikeStrips[s][sX], SpikeStrips[s][sY], SpikeStrips[s][sZ]))
					{

						GetVehicleDamageStatus(carid, arrDamage[0], arrDamage[1], arrDamage[2], arrDamage[3]);
						arrDamage[3] = encode_tires(1, 1, 1, 1);
						UpdateVehicleDamageStatus(carid, arrDamage[0], arrDamage[1], arrDamage[2], arrDamage[3]);
					}
				}
			}
			GetVehicleHealth(iVehicle[i], health);
			if(health < 375.0)
			{

				SetVehicleHealth(iVehicle[i], 375.0);
				vehaveriado[carid] = 1;
				GameTextForPlayerEx(i, "~r~MOTOR AVERIADO", 2500, 3);
				GetVehicleParamsEx(iVehicle[i], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(iVehicle[i], 0, lights, alarm, doors, bonnet, boot, objective);
				averiado[carid] = 1;
				MotorAuto[carid] = 0;
				SendClientMessage(i,-1,"El motor dejó de funcionar, llama a un mecánico. {fe8f8f}/servicio mecanico");
				if(EnCarreras[i] > 0 && VehiculoCarrera[EnCarreras[i]-1] == iVehicle[i])
				{

					SacarCarrera(i, 2);
					if(ParticipantesCarrera <= 0)
					{

						ResetearCarrera();
						HabilitarCarreras = 0;
						UpdateDynamic3DTextLabelText(TextoCarrera,COLOR_WHITE,"{FF3300}Boleteria cerrada\n{fe8f8f}Horarios de los eventos: {FFFFFF}5hs,11hs,17hs,23hs");
					}
					SendClientMessage(i,-1,"Has sido descalificado por destruir el vehiculo.");
				}
			}
			if(VehicleFuel[iVehicle[i]] == 0 && !BICI(iVehicle[i]) && MensajeSinGasoEnviado[i] == 0)
			{

				GameTextForPlayerEx(i, "~r~Sin combustible!", 2500, 3);
				GetVehicleParamsEx(iVehicle[i], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(iVehicle[i], 0, lights, alarm, doors, bonnet, boot, objective);
				MotorAuto[carid] = 0;
				MensajeSinGasoEnviado[i] = 1;
			}
			else if(health > 375.0 && averiado[carid] == 1) averiado[carid] = 0;
		}
	}
    return 1;
}
stock TimerGlobal/*[1000]*/()
{
new weapons4[MAX_PLAYERS],municion;
foreach(new u : Player)
{
    if(!IsPlayerNPC(u) && PlayerConectado(u) && TimerWeapons[u] < gettime() && PLAYER_INFO[u][pAdmin] < ADMIN_LVL_JUEGO1 && JugadorLogeado[u] == 1)
    {
        if(ArmaProhibida(u)) return KickPlayer(u, 0, "Armas prohibidas");
        GetPlayerWeaponData(u, 4, weapons4[u], municion);
        if(!SiTieneArma(u,weapons4[u]))
        {
            KickPlayer(u, 0, "Cheat de Armas (1)");
            continue;
        }
        if(GetPlayerWeapon(u) != 46)
        {
            if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][0])		{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][1])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][2])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][3])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][4])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][5])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][6])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][7])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][8])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][9])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][10])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][11])	{ }
            else if(GetPlayerWeapon(u) == PLAYER_INFO[u][j_ARMAS][12])	{ }
            else
            {
                if(Avisos[u] >= 3 && TimerWeapons[u] == 0)
                {
                    KickPlayer(u, 0, "Cheat de Armas (3)");
                    continue;
                }
                else Avisos[u]++;
            }
        }
    }
}
if(AC_LZ > 0) AC_LZ --;
if(TiempoAnuncioEvento > 0) TiempoAnuncioEvento --;
if(TiempoAnuncioEvento == 0 && AnunciadoEvento == true)
{
    AnunciadoEvento = false;
    for(new id; id < MAX_PLAYERS; id++)
    {	
        for(new i; i != 14; i++) TextDrawHideForPlayer(id,TeleportEvent[i]);
    }
}
if(TrenUno > 0) Barreras(TrenUno,1);
if(TrenDos > 0) Barreras(TrenDos,2);
if(TrenTres > 0) Barreras(TrenTres,3);
if(TrenCuatro > 0) Barreras(TrenCuatro,4);
MoveDynamicObject(Tiburon, 2788.8455, -2585.0376, 10.0100+0.0001, 0.00009, 93.0000, 0, 261.0000);
SetTimer("MovimientosTiburon2",1000,false);
BuscarCriminales();
TimerPlantas();
if(TiempoReinicio > 0)
{
    new string[200];
    new m = TiempoReinicio/60;
    new c = TiempoReinicio;
    TiempoReinicio --;
    if((m == 1 || m == 2 || m == 3 || m == 4 || m == 5 || m == 6 || m == 7 || m == 8 || m == 9 || m == 10) && TiempoReinicio%(60) == 0)
    {
        if(m == 1) format(string, sizeof(string), "El servidor se reiniciará automáticamente en 1 minuto.", m);
        else format(string, sizeof(string), "El servidor se reiniciará automáticamente en %d minutos.", m);
        SendClientMessageToAll(0xb5bfcbFF, string);
    }
    if(m == 0)
    {

        if(c == 1 || c == 2 || c == 3 || c == 4 || c == 5 || c == 10 ||  c == 20 || c == 30 || c == 40 || c == 50)
        {
            format(string, sizeof(string), "El servidor se reiniciará automáticamente en %d segundos.", c);
            SendClientMessageToAll(0xb5bfcbFF, string);
        }
    }
    if(TiempoReinicio == 0 && ComandoEstado == 0)
    {
        //FO_SetMode(FO_DISABLE);
        SendClientMessageToAll(0xb5bfcbFF, "El servidor se reiniciará ahora.");
        foreach(new i : Player)
        {
            if(LoggedYet[i] != false)
            {

                SaveAccount(i);
                AutosUsuarios(i);
                NoQuitar[i] = 1;
            }
            TiempoReinicio = -1;
            ExpulsarJugador(i,"Reinicio de servidor.");
        }
        SetTimer("CerrarServidor",segundos(2),false);
    }
}
if(TiempoAvion > 0)
{
    TiempoAvion --;
}
new hora,minuto,segundos,bool:habilitar = false;
gettime(hora,minuto,segundos);
if(hora == 5 && minuto == 0 && HabilitarCarreras == 0) habilitar = true;
else if(hora == 11 && minuto == 0 && HabilitarCarreras == 0) habilitar = true;
else if(hora == 17 && minuto == 0 && HabilitarCarreras == 0) habilitar = true;
else if(hora == 23 && minuto == 0 && HabilitarCarreras == 0) habilitar = true;
if(habilitar == true)
{
    CarrerasAviso = 0;
    CarrerasLV();
    ResetearCarrera();
    HabilitarCarreras = 1;
    UpdateDynamic3DTextLabelText(TextoCarrera,COLOR_WHITE,"{00CC00}Boleteria abierta\n{FFFFFF}Costo de la entrada {00CC00}$600\n{fe8f8f}/comprar entrada");
    ConteoCarrera = 610;
    SetTimer("EmpezarCarrera",60*1000,0);
    new string[250];
    format(string,sizeof(string),"En {00CC00}%d minutos{FFFFFF} comienza la carrera, ya se inscribieron {fe8f8f}%d{FFFFFF} jugadores",ConteoCarrera/60,ParticipantesCarrera);
    foreach(new i : Player) if(PlayerToPoint(i,250,-1408.8688,-304.5082,1056.4351) && GetPlayerInterior(i) == 7) SendClientMessage(i,-1,string);
}
 
    gettime(Hora, Minuto, Segundo);
    if(Minuto == 2 && PaydayDado == 0)
    {

        PayDay(15);
        PaydayDado = 1;
    }
    if(Minuto == 3 && PaydayDado == 1)
    {

        PaydayDado = 0;
    }
    foreach(new id : Player)
    {
        if(IsPlayerConnected(id))
        {
            for(new i = 0; i != MAX_T; i ++)
            {
                if(!TerritorioInfo[i][Territorio_Valido]) continue;
                if(IsPlayerInDynamicArea(id, TerritorioInfo[i][Territorio_Area]))
                {
                    new info[2];
                    Streamer_GetArrayData(STREAMER_TYPE_AREA, TerritorioInfo[i][Territorio_Area], E_STREAMER_EXTRA_ID, info);
                    switch(info[0])
                    {
                        case AREA_TYPE_GANGZONE:
                        {
                            new index = info[1];
                            if(TerritorioInfo[index][Territorio_Valido])
                            {
                                new message[145];
                                if(PLAYER_INFO[id][pt_LAST_TERRITORY] == index) continue;
                                PLAYER_INFO[id][pt_LAST_TERRITORY] = index;
                                if(gettime() < BandasInfo[PLAYER_INFO[id][pFaccion]][UltimoAtaque] + MAX_TIEMPO_NUEVO) return 1;
                                if(PLAYER_INFO[id][pFaccion] > 5)
                                {
                                    if(BandasInfo[TerritorioInfo[index][Territorio_BandaID]][Mejoras] > 0 && TerritorioInfo[index][Territorio_BandaID2] != 0) format(message, sizeof message, "Territorio de: ~g~~h~%s ~r~VIP %d", BandasInfo[TerritorioInfo[index][Territorio_BandaID]][BNombre],BandasInfo[TerritorioInfo[index][Territorio_BandaID]][Mejoras]);
                                    if(TerritorioInfo[index][Territorio_BandaID2] != 0) format(message, sizeof message, "Territorio de: ~g~~h~%s", BandasInfo[TerritorioInfo[index][Territorio_BandaID]][BNombre]);
                                    if(TerritorioInfo[index][Territorio_BandaID2] == 0) format(message, sizeof message, "Territorio libre", BandasInfo[TerritorioInfo[index][Territorio_BandaID]][BNombre]);
                                    ShowPlayerMessage(id, message);

                                    if(TerritorioInfo[index][Territorio_EnGuerra])
                                    {
                                        format(message, sizeof message, "~w~Este territorio esta siendo ~r~Conquistado~w~ por ~g~%s~w~.", BandasInfo[TerritorioInfo[index][Territorio_AtacanteID]][BNombre]);
                                        ShowPlayerMessage(id, message);
                                        new r, g, b, a;
                                        HexToRGBA(BandasInfo[PLAYER_INFO[id][pFaccion]][BColor], r, g, b, a);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return 1;
}
new TimerRestaVida = 0;
stock RestaVida(playerid)
{
    TimerRestaVida++;
	if(JugadorLogeado[playerid] == 1 && IsPlayerConnected(playerid) && !IsPlayerNPC(playerid) && TimerRestaVida >= 5)
	{
        TimerRestaVida = 0;
		if(EstaEnBus[playerid] == 0)
		{
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 227.3367,109.3470,999.0156) && CeldaJugador[playerid] == 1 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,227.3367,109.3470,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 223.0108,109.8135,999.0156) && CeldaJugador[playerid] == 2 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,223.0108,109.8135,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 219.0009,110.3388,999.0156) && CeldaJugador[playerid] == 3 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,219.0009,110.3388,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 215.2188,109.1792,999.0156) && CeldaJugador[playerid] == 4 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,215.2188,109.1792,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 227.3367,109.3470,999.0156) && CeldaJugador[playerid] == 5 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,227.3367,109.3470,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 223.0108,109.8135,999.0156) && CeldaJugador[playerid] == 6 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,223.0108,109.8135,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 219.0009,110.3388,999.0156) && CeldaJugador[playerid] == 7 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,219.0009,110.3388,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 215.2188,109.1792,999.0156) && CeldaJugador[playerid] == 8 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,215.2188,109.1792,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 227.3367,109.3470,999.0156) && CeldaJugador[playerid] == 9 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,227.3367,109.3470,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 223.0108,109.8135,999.0156) && CeldaJugador[playerid] == 10 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,223.0108,109.8135,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 219.0009,110.3388,999.0156) && CeldaJugador[playerid] == 11 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,219.0009,110.3388,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 215.2188,109.1792,999.0156) && CeldaJugador[playerid] == 12 && PLAYER_INFO[playerid][pTipoCarcel] != 10 && PLAYER_INFO[playerid][pTipoCarcel] != 4) SetPlayerPos(playerid,215.2188,109.1792,999.0156),SetPlayerInterior(playerid, 10),SetPlayerVirtualWorld(playerid, 1); //
		}
		if(TimerMalherido[playerid] > 0)
		{
			TimerMalherido[playerid]--;
			GameTextForPlayerEx(playerid,"~w~~<~ ~r~MALHERIDO ~w~~>~~n~~w~esperando servicio medico",3000,3);
		}
		if(TimerCombustible[playerid] > 0)
		{

			TimerCombustible[playerid]--;
			GameTextForPlayerEx(playerid,"~n~~n~~g~~<~ ~w~CARGANDO COMBUSTIBLE ~g~~>~",3000,3);
		}
		if(TimerCargarCamion[playerid] > 0)
		{

			TimerCargarCamion[playerid]--;
			GameTextForPlayerEx(playerid,"~w~~<~ ~g~CARGANDO CAMION ~w~~>~",3000,3);
		}
		if(TimerDescargarCamion[playerid] > 0)
		{

			TimerDescargarCamion[playerid]--;
			GameTextForPlayerEx(playerid,"~r~~<~ ~w~DESCARGANDO CAMION ~r~~>~",3000,3);
		}
		if(TimerRecoleccion[playerid] > 0)
		{

			TimerRecoleccion[playerid]--;
			GameTextForPlayerEx(playerid, "~w~RECOLECTANDO BASURA", 3000, 3);
		}
		if(TimerReparar[playerid] > 0)
		{

			TimerReparar[playerid]--;
			GameTextForPlayerEx(playerid, "~w~REPARANDO VEHICULO...", 1000, 5);
		}
		if(TimerRevisar[playerid] > 0)
		{

			TimerRevisar[playerid]--;
			GameTextForPlayerEx(playerid,"~n~~n~~w~REVISANDO MALETERO", 3000, 3);
		}
		if(TiempoForzarCerradura[playerid] > 0)
		{

			TiempoForzarCerradura[playerid]--;
			if(!IsPlayerMobile(playerid)) GameTextForPlayerEx(playerid,"~n~~r~~w~FORZANDO CERRADURA", 3000, 3);
		}
		if(San[playerid] == 1 && !IsPlayerInRangeOfPoint(playerid, 45, 346.870025,309.259033,999.155700))
		{

			SetPlayerInterior(playerid, 6);
			SetPlayerVirtualWorld(playerid, playerid);
			SetPlayerPos(playerid, 346.870025,309.259033,999.155700);
		}
		if(EsUnTren(GetPlayerVehicleID(playerid)) && Boletos[playerid] > 0)
		{
			switch(Boletos[playerid])
			{
				case 1: if(IsPlayerInRangeOfPoint(playerid, 20.0, 1433.7200,2627.9175,11.3926)) RemovePlayerFromVehicle(playerid),SetPosEx(playerid,1433.8665,2625.2673,11.3926,182.2727,0,0),Boletos[playerid] = 0;//Yellow Bell Station
				case 2: if(IsPlayerInRangeOfPoint(playerid, 20.0, 1719.6493,-1949.1260,13.5495)) RemovePlayerFromVehicle(playerid),SetPosEx(playerid,1738.3921,-1949.4956,14.1172,0.7063,0,0),Boletos[playerid] = 0; //Unity Station
				case 3: if(IsPlayerInRangeOfPoint(playerid, 20.0, 818.3243,-1361.2346,-0.5078)) RemovePlayerFromVehicle(playerid),SetPosEx(playerid,817.6003,-1360.5968,-0.5078,310.9091,0,0),Boletos[playerid] = 0; //Market Station
				case 4: if(IsPlayerInRangeOfPoint(playerid, 20.0, -1951.6471,141.1368,26.2813)) RemovePlayerFromVehicle(playerid),SetPosEx(playerid,-1952.1262,138.8080,26.2813,90.6335,0,0),Boletos[playerid] = 0; //Cranberry Station
				case 5: if(IsPlayerInRangeOfPoint(playerid, 20.0, 2858.8889,1290.8965,11.3906)) RemovePlayerFromVehicle(playerid),SetPosEx(playerid,2860.4497,1290.8992,11.3906,88.4635,0,0),Boletos[playerid] = 0; //Linden Station
			}
		}
		if(PLAYER_INFO[playerid][Agonizando] == 1)
		{
			new Float:vida[MAX_PLAYERS];
			GetPlayerHealth(playerid, vida[playerid]);
			EstablecerVida(playerid,vida[playerid] -1.00);
		}
	}
	return 1;
}
stock TimerCarcel(playerid)
{
    if(PLAYER_INFO[playerid][pTiempoCarcel] >= 0 && Jail[playerid] == 1 && JugadorLogeado[playerid] == 1 && !IsPlayerNPC(playerid) && IsPlayerConnected(playerid))
    {
        RP_DomKeep(playerid);
        if(EstaEnBus[playerid] == 0)
        {
            PLAYER_INFO[playerid][pTiempoCarcel] --;
            if(PLAYER_INFO[playerid][pTiempoCarcel] <= 0)
            {
                NoTeleportHack(playerid);
                SendClientMessage(playerid,-1,"{11FF00}Cumpliste tu condena{FFFFFF}, quedas en libertad.");
                PLAYER_INFO[playerid][pTiempoCarcel] = 0;
                PLAYER_INFO[playerid][pTiempoJail] = 0;
                Esposando[playerid] = 0;
                CeldaJugador[playerid] = 0;
                PLAYER_INFO[playerid][pEnFC] = 0;
                Jail[playerid] = 0;
                San[playerid] = 0;
                CargarMapeosEx(playerid);
                switch(PLAYER_INFO[playerid][pTipoCarcel])
                {
                    case 1:
                    {
                        new donde = random(6);
                        switch(donde)
                        {
                            case 0: SetPosEx(playerid, 216.4100,120.2400,999.0156,0.0000,10,1);
                            case 1: SetPosEx(playerid, 217.3244,120.3063,999.0156,6.6009,10,1);
                            case 2: SetPosEx(playerid, 215.5035,120.2255,999.0156,355.9474,10,1);
                            case 3: SetPosEx(playerid, 216.0696,121.0746,999.0156,355.9474,10,1);
                            case 4: SetPosEx(playerid, 217.4385,120.7687,999.0156,355.9474,10,1);
                            case 5: SetPosEx(playerid, 216.9519,118.9357,999.0156,2.6959,10,1);
                        }
                    }
                    case 2:
                    {

                        new donde = random(6);
                        switch(donde)
                        {

                            case 0: SetPosEx(playerid, 216.4100,120.2400,999.0156,0.0000,10,5);
                            case 1: SetPosEx(playerid, 217.3244,120.3063,999.0156,6.6009,10,5);
                            case 2: SetPosEx(playerid, 215.5035,120.2255,999.0156,355.9474,10,5);
                            case 3: SetPosEx(playerid, 216.0696,121.0746,999.0156,355.9474,10,5);
                            case 4: SetPosEx(playerid, 217.4385,120.7687,999.0156,355.9474,10,5);
                            case 5: SetPosEx(playerid, 216.9519,118.9357,999.0156,2.6959,10,5);
                        }
                    }
                    case 3:
                    {

                        new donde = random(6);
                        switch(donde)
                        {

                            case 0: SetPosEx(playerid, 212.4893,158.3311,1003.0300,265.8078,3,7);
                            case 1: SetPosEx(playerid, 212.3264,157.0358,1003.0300,270.1945,3,7);
                            case 2: SetPosEx(playerid, 212.6126,159.4301,1003.0300,270.5078,3,7);
                            case 3: SetPosEx(playerid, 211.6316,159.2158,1003.0234,270.5078,3,7);
                            case 4: SetPosEx(playerid, 211.3360,158.4849,1003.0300,270.5078,3,7);
                            case 5: SetPosEx(playerid, 211.4012,157.4245,1003.0300,270.5078,3,7);
                        }
                    }
                    case 4:
                    {

                        new donde = random(6);
                        switch(donde)
                        {

                            case 0: SetPosEx(playerid, 292.9334,1419.6272,10.1358,263.0111,0,0);
                            case 1: SetPosEx(playerid, 292.3492,1418.9880,10.1810,263.0111,0,0);
                            case 2: SetPosEx(playerid, 293.0168,1420.9564,10.1436,263.0111,0,0);
                            case 3: SetPosEx(playerid, 293.6794,1419.9397,10.0793,263.0111,0,0);
                            case 4: SetPosEx(playerid, 293.8986,1418.5115,10.0506,263.0111,0,0);
                            case 5: SetPosEx(playerid, 294.7386,1419.3837,9.9930,263.0111,0,0);
                        }
                    }
                }
                PLAYER_INFO[playerid][pTipoCarcel] = 0;
                EstaDomiciliaria[playerid] = 0;
                RP_DomClear(playerid);
            }
        }
    }
    return 1;
}
new ValidVeh2 = 0;
stock TimerValidVeh()
{
    ValidVeh2++;
	ApplyDynamicActorAnimation(actbomb,"PED","IDLE_chat", 4.000000, 0, 0, 0, 1, 0);
	ApplyDynamicActorAnimation(actbomb2,"PED","IDLE_chat", 4.000000, 0, 0, 0, 1, 0);
	//FO_SetValue(FakeQuery); // Fake query
	if(AntiLagLS == 1 && ValidVeh2 >= 5)
	{
        ValidVeh2 = 0;
		new bool: occupied[MAX_VEHICLES];
		for(new v = AUTOS; v<=GetVehiclePoolSize(); v++)
		{
			if(!IsValidVehicle(v)) continue;
			if(v > AUTOS)
			{
				for(new f = 1; f<MAX_FABRICAS; f++)
				{
					if(FABRICAS_INFO[f][f_VALID])
					{
						if(FABRICAS_INFO[f][f_VEHICLES][0] == v && IsValidVehicle(FABRICAS_INFO[f][f_VEHICLES][0])) { occupied[v] = true; }
						if(FABRICAS_INFO[f][f_VEHICLES][1] == v && IsValidVehicle(FABRICAS_INFO[f][f_VEHICLES][1])) { occupied[v] = true; }
					}
				}
				if (DEPORTIVOCOP(v))
				{
					occupied[v] = true;
				}
				foreach(new i : Player)
				{
					if(JugandoEventoDinamico[i] == true && LoggedYet[i] == true)
					{
						if((VehiculoEvento[i] == GetPlayerVehicleID(i))) occupied[VehiculoEvento[i]] = true;
					}
				}
				if (Bomberos(v))
				{
					occupied[v] = true;
				}
				if (SAPD(v))
				{
					occupied[v] = true;
				}
				if (MILITARVEH(v))
				{
					occupied[v] = true;
				}
				if (VehIlegal(v))
				{
					occupied[v] = true;
				}
				if (ApsaVeh(v))
				{
					occupied[v] = true;
				}
				if (TRAILERVEH(v))
				{
					occupied[v] = true;
				}
				for(new e; e < sizeof(TRENES); e++)
				{
					if(TRENES[e] == v) occupied[v] = true;
				}
				if(VehicleFacData[v][vFaccID] > 0)
				{
					occupied[v] = true;
				}
				if(RB_IsVehicle(v)) occupied[v]=true;
				for(new e; e < sizeof(VehiculoCarrera); e++)
				{
					if(VehiculoCarrera[e] == v) occupied[v] = true;
				}
				foreach(new i : Player)
				{
					if(JugadorLogeado[i] > 0)
					{
						if(v == autos[i] || v == autos2[i] || v == autos3[i] || v == autos4[i] || v == autos5[i] || v == GetPlayerVehicleID(i)) { occupied[v] = true; }
					}
				}
				if(occupied[v] == false)
				{
					MotorAuto[v] = 0;
					DestroyVehicleEx(v);
				}
			}
		}
	}
	return 1;
}
stock LimpiarArmasSuelo()
{
    new armas;
	for(new a=0;a<sizeof(ArmaObjeto);a++)
	{
        if(ArmaObjeto[a][Objeto_xyz][0] == 0.0) continue;
        armas++;
        DestroyDynamicObject(ArmaObjeto[a][Objeto_id][0]);
        if(IsValidDynamic3DTextLabel(ArmaObjeto[a][LabelObject][0])) DestroyDynamic3DTextLabel(ArmaObjeto[a][LabelObject][0]);
        ArmaObjeto[a][Objeto_id][0] = -1;
        ArmaObjeto[a][Objeto_xyz][0] = 0.0;
        ArmaObjeto[a][Objeto_xyz][1] = 0.0;
        ArmaObjeto[a][Objeto_xyz][2] = 0.0;
	}
	printf("Armas en el suelo fueron limpiadas. (%d)",armas);
	return 1;
}
function TiemposFabrica()
{
	TimerFabricaCocinero();
	TimerFabricaHornos();
	return 1;
}
function TimerGlobalPlayers()
{
    ServerMicrobeat();
    TimerValidVeh();
    TimerVehicleGlobal();
    TimerGlobal();
    foreach(new i : Player) { GlobalPlayerid(i); RestaVida(i); TimerCarcel(i); TimerAceleracion(i); }
    return 1;
}
function QueryCheck()
{
    SetTimer("QueryCheck",5000,false);
    #if TipoHost == 0
    {
        mysql_tquery(handle_db, "SELECT * FROM queue_server", "QueryResult");
    }
    #endif
}
function QueryResult()
{
    if(cache_num_rows() > 0)
    {
        for(new i = 0, cache = cache_num_rows(); i < cache; i++)
        {
            new dataLen[256],id;
            cache_get_value_name(i, "Data", dataLen);
            cache_get_value_name_int(i, "ID", id);
            mysql_format(handle_db, QUERY_BUFFER, sizeof(QUERY_BUFFER), "DELETE FROM queue_server WHERE ID = %d",id);
            mysql_tquery(handle_db, QUERY_BUFFER); //Esto para que se ejecute solo una vez
            if(strcmp(dataLen, "NULL", true)) OnQueryReceive(dataLen);
        }
    }
}
function LlamarTransportistas()
{
    CambioEmail(); //Socket compras paypal y cambio de correo.
    AnunciosAleatorios();
    GuardarFabricas();
	new safdon;
	GetBomberosOn(safdon);
	if(safdon > 0)
	{
		IncendioAleatoreo();
		IncendioAleatoreo();
	}
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i) && JugadorLogeado[i] == 1 && !IsPlayerNPC(i)) LlamadaTransportista(i);
	}
}
stock LlamadaTransportista(playerid)
{

	if(JugadorLogeado[playerid] == 1 && IsPlayerConnected(playerid) && !IsPlayerNPC(playerid))
	{
		if(PLAYER_INFO[playerid][pTrabajo] == T_Transportista || PLAYER_INFO[playerid][pTrabajo2] == T_Transportista)
		{

			if(TelefonoEstado[playerid] == 0 && Mobile2[playerid] == 0 && tviaje[playerid] == 0 && EnLlamada[playerid] == 0 && PLAYER_INFO[playerid][pNumero] != 0)
			{

				new string[250];
				format(string, sizeof(string), "El teléfono de %s está sonando.", PLAYER_INFO[playerid][Nickname]);
				ProxDetector(20.0, playerid, string, COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES,COLOR_ACCIONES);

				SendClientMessage(playerid, -1, "Te están llamando por teléfono desde el número: {fe8f8f}4825{FFFFFF}, escribe {fe8f8f}/atender{FFFFFF} o {fe8f8f}/colgar{FFFFFF}.");

				PLAYER_INFO[playerid][MobileSub] = 2540;
				Mobile2[playerid] = 2540;
				SetTimerEx("ColgarLlamada",30000,false,"d",playerid);
				llamada(playerid);
			}
		}
	}
	return 1;
}
function AutoCheats2()
{
	if(EventoActivo == true)
	{
		if(BeerActorTime[1] >= 10) BeerActorTime[1] = 0;
		if(BeerActorTime[1] == 0) ApplyActorAnimation(BeerActor[7], "SKATE","skate_idle", 4.1, 1, 0, 0, 0, 0);
		if(BeerActorTime[1] == 5) ApplyActorAnimation(BeerActor[7], "PED","IDLE_chat", 4.1, 1, 0, 0, 0, 0);
		BeerActorTime[1] ++;

		if(BeerActorTime[2] >= 10) BeerActorTime[2] = 0;
		if(BeerActorTime[2] == 0) ApplyActorAnimation(BeerActor[8], "SKATE","skate_idle", 4.1, 1, 0, 0, 0, 0);
		if(BeerActorTime[2] == 5) ApplyActorAnimation(BeerActor[8], "PED","IDLE_chat", 4.1, 1, 0, 0, 0, 0);
		BeerActorTime[2] ++;

		if(BeerActorTime[3] >= 10) BeerActorTime[3] = 0;
		if(BeerActorTime[3] == 0) ApplyActorAnimation(BeerActor[9], "SKATE","skate_idle", 4.1, 1, 0, 0, 0, 0);
		if(BeerActorTime[3] == 5) ApplyActorAnimation(BeerActor[9], "PED","IDLE_chat", 4.1, 1, 0, 0, 0, 0);
		BeerActorTime[3] ++;

		if(BeerActorTime[4] >= 10) BeerActorTime[4] = 0;
		if(BeerActorTime[4] == 0) ApplyActorAnimation(BeerActor[10], "SKATE","skate_idle", 4.1, 1, 0, 0, 0, 0);
		if(BeerActorTime[4] == 5) ApplyActorAnimation(BeerActor[10], "PED","IDLE_chat", 4.1, 1, 0, 0, 0, 0);
		BeerActorTime[4] ++;

		if(BeerActorTime[5] >= 10) BeerActorTime[5] = 0;
		if(BeerActorTime[5] == 0) ApplyActorAnimation(BeerActor[11], "SKATE","skate_idle", 4.1, 1, 0, 0, 0, 0);
		if(BeerActorTime[5] == 5) ApplyActorAnimation(BeerActor[11], "PED","IDLE_chat", 4.1, 1, 0, 0, 0, 0);
		BeerActorTime[5] ++;
	}
	contadoravion += 7;
	if(contadoravion == 301)
	{
		
		if(IsValidObject(avion[0])) DestroyObject(avion[0]);
		if(IsValidObject(avion[1])) DestroyObject(avion[1]);
		avion[0] = CreateObject(14553, 133.52789, 2329.73804, 1954.93250,   0.00000, 0.00000, 0.00000);
		avion[1] = CreateObject(14548, 133.52789, 2329.73804, 1954.93250,   0.00000, 0.00000, 0.00000);
		contadoravion = 0;
		foreach(new i : Player)
		{
			
			if(ViajeAvion[i] == 1 && IsPlayerInRangeOfPoint(i, 20.0, 414.7434, 2533.9641, 19.1484))
			{
				
				NoTeleportHack(i);
				SendClientMessage(i, -1, "Por favor evita saltar y correr dentro del avión.");
				DarArma(i, 46);
				ViajeAvion[i] = 0;
				TextDrawShowForPlayer(i, EsperarT[0]);
				TextDrawShowForPlayer(i, EsperarT[1]);
				new vR = random(sizeof(Saltos));
				SetPlayerPos(i, Saltos[vR][0], Saltos[vR][1], Saltos[vR][2]);
				SetTimerEx("QuitarCargando", 3000, false, "d", i);
			}
		}
		SetTimer("MoverAvion", 3000, false);
	}
	foreach(new u : Player)
	{
		if(PLAYER_TEMP[u][VariableCaido] == 1)
		{
			SetPlayerArmedWeapon(u, 0);
			foreach(new i : Player)
				if(PLAYER_INFO[i][pFaccion] == 1 && PLAYER_INFO[i][pDuty] == 1 || PLAYER_INFO[i][pFaccion] == 2 && PLAYER_INFO[i][pDuty] == 1) SetPlayerMarkerForPlayer(i, u, c7_color);
			Congelar(u);
			ApplyAnimation(u, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0, 1);
			ApplyAnimation(u, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0, 1);
		}
		if(AvisosAuto[u] > 0) AvisosAuto[u]--;
	}
	return 1;
}
function FuelSeconds()
{
	for(new i = 1; i <= GetVehiclePoolSize(); i++)
	{
		if(MotorAuto[i] == 1 && IsValidVehicle(i))
		{
			new modelo = GetVehicleModel(i);
			new vehiclefuel = CombustibleCoche(modelo);
			if(VehicleFuel[i] >= 1)
			{
				if(!BICI(i))
				{
                    SinGaso[i] = 0;
                    if(VehicleFuel[i] > vehiclefuel) VehicleFuel[i] = vehiclefuel;

					if(vehiclefuel < 100 || vehiclefuel > 99 && combustible60 == 2)
					{
						combustible60 = 0;
						VehicleFuel[i] --;
					}
					combustible60 ++;
				}
			}
			else if(VehicleFuel[i] < 1)
			{
				GetVehicleParamsEx(i, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(i, 0, lights, alarm, doors, bonnet, boot, objective);
				SinGaso[i] = 1;
				MotorAuto[i] = 0;
			}
		}
	}
	return 1;
}
stock TimerAceleracion(playerid)
{
	if(JugadorLogeado[playerid] == 1 && !IsPlayerNPC(playerid) && IsPlayerConnected(playerid))
	{
        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
            new Keysa,fairea,lra;
            GetPlayerKeys(playerid,Keysa,fairea,lra);
            if(Keysa == KEY_SPRINT)
            {
                new Float:health;
                new vehiculo_karen = GetPlayerVehicleID(playerid);
                GetVehicleHealth(vehiculo_karen, health);
                if(MotorAuto[vehiculo_karen] == 1 && averiado[vehiculo_karen] == 0 && health > 375.0)
                {
                    if(GLOBAL_VEHICLES[vehiculo_karen][gb_vehicle_ACELERACION] == 1 && VehicleFuel[vehiculo_karen] != 0)
                    {
                        new Float:xx,Float:xy,Float:xz;
                        if(GLOBAL_VEHICLES[vehiculo_karen][gb_vehicle_ACELERACION_ACTIVE] == 1)
                        {
                            new Float:Vehicle_Speed = GetVehicleSpeedEx(vehiculo_karen);
                            new modelid = GetVehicleModel(vehiculo_karen);

                            if(Vehicle_Speed < VelocidadMaxAuto(modelid))
                            {
                                GetVehicleVelocity(vehiculo_karen, xx, xy, xz);
                                SetVehicleVelocity(vehiculo_karen, xx+(xx / 3), xy+(xy / 3), xz+(xz / 3));
                            }
                        }//xx / 5
                    }
                }
            }
        }
	}
	return 1;
}
function CargarTiempos()
{
    SetTimer("FuelSeconds",120000,true);
    SetTimer("LlamarTransportistas",300000,true);
    SetTimer("AutoCheats2",7000,true);
    SetTimer("QueryCheck",3000,false);
    SetTimer("TiemposFabrica",150000,true);
    //SetTimer("TimerNecesidad",1800000,true);
    SetTimer("TimerGlobalPlayers",1000,true);
    SetTimer("TimerAnuncios",1800000,true);
    SetTimer("TimerMinutos",60000,true);
    SetTimer("TimerMiliSeg",700,true);
    printf("Tiempos Cargados");
    new anio, mes, dia;
    getdate(anio, mes, dia);
    if(mes == 12) EventoNavi(true);
}
function TimerTaximetro(playerid, i)
{
    new vehicleid2 = GetPlayerVehicleID(playerid);
    if(GetPlayerState(i) == PLAYER_STATE_DRIVER && TAXI(vehicleid2) && vehicleid2 == GetPlayerVehicleID(i))
    {
        if(PLAYER_INFO[playerid][jDinero] >= Ficha[i])
        {
            new cuenta,string[24];
            cuenta = Monto[i]+Ficha[i];
            QuitarDinero(playerid, Ficha[i]);
            DarDinero(i,Ficha[i]);
            Monto[i] = cuenta;
            format(string,sizeof(string),"$%s",ConvertirNumero(Monto[i]));
            PlayerTextDrawSetString(i,TAXIMET2[i],string);
            PlayerTextDrawSetString(playerid,TAXIMET2[playerid],string);
        }
        else
        {
            SendClientMessage(playerid,-1,"{"COLOR_GM"}Te has quedado sin dinero para pagar el taxi.");
            SendClientMessage(i,-1,"{"COLOR_GM"}Tu pasajero se ha quedado sin dinero.");
            RemovePlayerFromVehicle(playerid);
            KillTimer(PLAYER_TEMP[playerid][Taximetro]);
        }
    }
}
//PTASK
ptask DarNecesidad[1800000](i)
{
    printf("DarNecesidad - MAX_PLAYERS Ejecutado.");
    if(IsPlayerNPC(i)) return false;
    if(PLAYER_INFO[i][pVip] > 0) {
        PLAYER_INFO[i][pSed] += 2;
        PLAYER_INFO[i][pHambre] += 1;
    }
    else {
        PLAYER_INFO[i][pSed] += 4;
        PLAYER_INFO[i][pHambre] += 2;
    }
	if(PLAYER_INFO[i][pBarras] == 0)
	{
		ActualizarHambre(i, 1);
		ActualizarSed(i, 1);
	}
    if(PLAYER_INFO[i][@Nivel] > 0 && PLAYER_INFO[i][@Nivel] <= 6 && YaMostroAlertaSed[i] == 0)
    {
        OcultarMensajeAlerta(i);
        YaMostroAlertaSed[i] = 1;
        MandarMensajeAlerta(i,"Tu personaje necesita hidratarse, el circulo azul indica el nivel de sed.");
        SetTimerEx("OcultarMensajeAlerta",6000,false,"d",i);
        SetTimerEx("MandarMensajeAlerta",10000,false,"d",i,"Puedes comprar bebidas en los ~g~supermercados 24/7~w~ . Para mas informacion usa ~y~ayuda sed");
        ResetearYaMostro[i] = SetTimerEx("ResetAlerta",minutos(40),false,"d",i);
    }
    if(PLAYER_INFO[i][@Nivel] > 0 && PLAYER_INFO[i][pHambre] > 49 && PLAYER_INFO[i][pHambre] < 60)
    {
        OcultarMensajeAlerta(i);
        YaMostroAlertaSed[i] = 1;
        MandarMensajeAlerta(i,"Tu hambre llego al 50 porciento, tienes que comer algo.");
        SetTimerEx("OcultarMensajeAlerta",8000,false,"d",i);
        SetTimerEx("MandarMensajeAlerta",10000,false,"d",i,"Tu personaje necesita alimentarse, el circulo naranja indica el nivel de hambre.");
        SetTimerEx("OcultarMensajeAlerta",16000,false,"d",i);
        SetTimerEx("MandarMensajeAlerta",20000,false,"d",i,"Puedes comprar comidas en las ~r~franquicias de pizza.~w~ Para mas informacion usa ~y~/ayuda hambre~w~.");
        ResetearYaMostro[i] = SetTimerEx("ResetAlerta",minutos(40),false,"d",i);
    }
    if(PLAYER_INFO[i][@Nivel] > 0 && PLAYER_INFO[i][pSed] > 49 && PLAYER_INFO[i][pSed] < 60)
    {
        OcultarMensajeAlerta(i);
        YaMostroAlertaSed[i] = 1;
        MandarMensajeAlerta(i,"Tu nivel de sed llego al 50 porciento y necesitas beber algo.");
        SetTimerEx("OcultarMensajeAlerta",8000,false,"d",i);
        ResetearYaMostro[i] = SetTimerEx("ResetAlerta",minutos(25),false,"d",i);
    }
    return 1;
}

hook cargartodo()
{
	EntrarTD = TextDrawCreate(320.000000, 409.000000, "Pulsa ~b~F~w~ para entrar");
	TextDrawFont(EntrarTD, 2);
	TextDrawLetterSize(EntrarTD, 0.187499, 1.200000);
	TextDrawTextSize(EntrarTD, 16.500000, 90.000000);
	TextDrawSetOutline(EntrarTD, 1);
	TextDrawSetShadow(EntrarTD, 0);
	TextDrawAlignment(EntrarTD, 2);
	TextDrawColor(EntrarTD, -1);
	TextDrawBackgroundColor(EntrarTD, 255);
	TextDrawBoxColor(EntrarTD, 200);
	TextDrawUseBox(EntrarTD, 1);
	TextDrawSetProportional(EntrarTD, 1);
	TextDrawSetSelectable(EntrarTD, 0);
}

OcultarTextEntrar(playerid)
{
	if(PLAYER_TEMP[playerid][TextEntrar] == 1)
	{
		TextDrawHideForPlayer(playerid, EntrarTD);
		PLAYER_TEMP[playerid][TextEntrar] = 0;
	}
	return 1;
}
MostrarTextEntrar(playerid)
{
	if(PLAYER_TEMP[playerid][TextEntrar] == 0)
	{
		TextDrawShowForPlayer(playerid, EntrarTD);
		PLAYER_TEMP[playerid][TextEntrar] = 1;
	}
	return 1;
}

funcion VerMensajeEntrar(playerid)
{
	for(new p = 0; p < MAX_DOORS; p++)
	{ 
        if(DoorInfo[p][dID] > 0)
        {
            if(EstaEn(playerid,3.0,DoorInfo[p][dExitX], DoorInfo[p][dExitY], DoorInfo[p][dExitZ]))
            {	
                MostrarTextEntrar(playerid);
                return 1;
            }
            else OcultarTextEntrar(playerid);
        }
	}
	for(new ID = 1; ID < MAX_FABRICAS; ID++)
	{
        if (FABRICAS_INFO[ID][f_VALID])
        {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, FABRICAS_INFO[ID][f_POS][0], FABRICAS_INFO[ID][f_POS][1], FABRICAS_INFO[ID][f_POS][2]))
            {	
                MostrarTextEntrar(playerid);
                return 1;
            }
            else OcultarTextEntrar(playerid);
        }
	}
	for(new id = 0; id < MAX_PROPIEDADES; id++)
	{
        if(PropInfo[id][pPosX] != 0)
        {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, PropInfo[id][pPosX],PropInfo[id][pPosY],PropInfo[id][pPosZ]))
            {	
                MostrarTextEntrar(playerid);
                return 1;
            }
            else OcultarTextEntrar(playerid);
        }
	}
	for(new et = 0; et < MAX_GARAGES; et++)
	{
		if(Estacionamientos[et][eEnUso] > 0)
		{
			if(IsPlayerInRangeOfPoint(playerid,3.0,Estacionamientos[et][PosX], Estacionamientos[et][PosY], Estacionamientos[et][PosZ]))
			{
				MostrarTextEntrar(playerid);
				return 1;
			}
			else OcultarTextEntrar(playerid);
		}
	}
	return 1;
}

ptask TimerMensajeEntrar[800](playerid)
{
	if(JugadorLogeado[playerid] == 1 && IsPlayerConnected(playerid) && !IsPlayerNPC(playerid)) { VerMensajeEntrar(playerid); }
	return 1;
}