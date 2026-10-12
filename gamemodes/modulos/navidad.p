#include <YSI_Coding\y_hooks>
new
	// global
	QuestObject[MAX_PLAYERS][50],
	QuestStats[MAX_PLAYERS][50],
    server_timer,
	EventoCargado[MAX_PLAYERS],
	VarTutorialNavidad[MAX_PLAYERS],
	TimerTutorialNavidad[MAX_PLAYERS];

new Float: QuestPos[50][3] = {
	{1932.3981,1586.6929,10.7768},
	{2229.8391,1286.0757,27.1641},
	{2333.0186,1384.5880,42.8203},
	{2635.2771,2413.1465,11.7029},
	{912.6390,2755.3967,35.0740},
	{975.1698,2085.0928,10.8771},
	{1099.6868,1615.9249,5.9357},
	{1039.6133,1018.5179,11.0436},
	{1345.9055,938.3571,10.8826},
	{1764.0332,589.2512,10.8198},
	{2597.8811,751.7441,18.1527},
	{2663.2783,835.8227,19.0814},
	{2656.9395,1233.0153,26.9738},
	{2879.2065,1589.9707,10.9412},
	{2937.2134,2118.6458,18.1338},
	{2501.4526,2809.4868,14.8894},
	{2082.9673,2399.2959,60.8782},
	{1979.4650,2214.0759,27.2486},
	{1320.2101,1252.1580,20.4209},
	{2507.7322,1152.6578,22.1547},
	{1742.0159,2295.3542,10.8982},
	{1950.1067,1940.1725,11.0334},
	{1674.7114,1460.0680,10.7687},
	{2892.6162,929.6764,10.9308},
	{547.4013,880.0643,-41.4250},
	{1071.6146,-1619.4207,20.5085},
	{2658.5515,-2049.0215,13.7046},
	{2769.1572,-1345.4258,39.7221},
	{2285.2375,-1113.1108,38.0355}, 
	{1676.4752,-901.1528,53.3388},
	{860.0895,-1063.2340,25.2041},
	{1026.6241,-1437.1735,13.5836},
	{354.1670,-2062.2380,7.8830},
	{308.4756,-1438.2340,27.9770},
	{580.9576,-1489.9506,15.2943},
	{157.0161,-1961.8600,3.8158},
	{889.7630,-1373.3197,25.2361},
	{1127.5006,-1489.5856,22.7690},
	{2796.0764,-2425.4888,13.6874},
	{2521.3848,-2678.4695,13.6862},
	{1878.2131,-2538.1582,13.6052},
	{1473.7102,-2286.6782,42.4717},
	{1714.9004,-1912.0471,13.6430},
	{1500.1937,-1665.9409,14.1081},
	{1288.7191,-1249.7883,13.6058},
	{2362.6426,-1899.3621,13.5297},
	{2417.0237,-1398.6427,24.3632},
	{1969.2866,-1177.3411,20.0663},
	{1627.2927,-989.4706,24.1303},
	{1295.1721,-988.3701,32.7451}
};
//funciones
CheckObjects(playerid) {
	new x;
	for(new i = 0; i < 50; i++) {
		if(QuestStats[playerid][i] > 0) x ++;
	}
	return x;
}
MySQL_save(playerid) {
	new 
		szQuery[1024], 
		items[1024];

	format(items, sizeof(items), 
		"%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d", 
		QuestStats[playerid][0], QuestStats[playerid][1], QuestStats[playerid][2], QuestStats[playerid][3], QuestStats[playerid][4],
		QuestStats[playerid][5], QuestStats[playerid][6], QuestStats[playerid][7], QuestStats[playerid][8], QuestStats[playerid][9],
		QuestStats[playerid][10], QuestStats[playerid][11], QuestStats[playerid][12], QuestStats[playerid][13], QuestStats[playerid][14],
		QuestStats[playerid][15], QuestStats[playerid][16], QuestStats[playerid][17], QuestStats[playerid][18], QuestStats[playerid][19],		
		QuestStats[playerid][20], QuestStats[playerid][21], QuestStats[playerid][22], QuestStats[playerid][23], QuestStats[playerid][24],
		QuestStats[playerid][25], QuestStats[playerid][26], QuestStats[playerid][27], QuestStats[playerid][28], QuestStats[playerid][29],	
		QuestStats[playerid][30], QuestStats[playerid][31], QuestStats[playerid][32], QuestStats[playerid][33], QuestStats[playerid][34],
		QuestStats[playerid][35], QuestStats[playerid][36], QuestStats[playerid][37], QuestStats[playerid][38], QuestStats[playerid][39],	
		QuestStats[playerid][40], QuestStats[playerid][41], QuestStats[playerid][42], QuestStats[playerid][43], QuestStats[playerid][44],
		QuestStats[playerid][45], QuestStats[playerid][46], QuestStats[playerid][47], QuestStats[playerid][48], QuestStats[playerid][49]);	

	mysql_format(handle_db, szQuery, sizeof(szQuery), "UPDATE `usuarios` SET `Quest`='%e' WHERE `ID`='%d'", items, PLAYER_INFO[playerid][pID]);
	mysql_tquery(handle_db, szQuery, "", "");	
	return 1;
}

function GlobalTimer() {
	new 
		szTD[256],
		string[256];

	foreach(new i : Player) {
		if(IsPlayerConnected(i) && JugadorLogeado[i] == 1 && !IsPlayerNPC(i) && EventoCargado[i] == 1 && PLAYER_INFO[i][@Nivel] > 4 && PLAYER_TEMP[i][pNavidad] > 0) {
			szTD = "";
			string = "";			
			if(CheckObjects(i) < 50) 
			{
				for(new q = 0; q < 50; q++) 
				{
					if(QuestStats[i][q] == 0) 
					{			
						if(IsPlayerInRangeOfPoint(i, 45.0, QuestPos[q][0], QuestPos[q][1], QuestPos[q][2])) {
							new Float: oPos[3];
							GetPlayerObjectRot(i, QuestObject[i][q], oPos[0], oPos[1], oPos[2]);
							SetPlayerObjectRot(i, QuestObject[i][q], oPos[0], oPos[1], oPos[2]+35);
							format(string, sizeof(string), "~w~~h~Regalo %d cercano ~g~(%0.2fm)~n~", q+1, GetPlayerDistanceFromPoint(i, QuestPos[q][0], QuestPos[q][1], QuestPos[q][2])), strcat(szTD, string);						
						}	
						else if(IsPlayerInRangeOfPoint(i, 75.0, QuestPos[q][0], QuestPos[q][1], QuestPos[q][2])) format(string, sizeof(string), "~w~~h~Regalo %d cercano ~y~(%0.2fm)~n~", q+1, GetPlayerDistanceFromPoint(i, QuestPos[q][0], QuestPos[q][1], QuestPos[q][2])), strcat(szTD, string);
						else if(IsPlayerInRangeOfPoint(i, 150.0, QuestPos[q][0], QuestPos[q][1], QuestPos[q][2])) format(string, sizeof(string), "~w~~h~Regalo %d cercano ~r~(%0.2fm)~n~", q+1, GetPlayerDistanceFromPoint(i, QuestPos[q][0], QuestPos[q][1], QuestPos[q][2])), strcat(szTD, string);
						ShowPlayerMessage(i, szTD);				
					}
				}
			}
		}	
	}		
	return 1;
}

LoadDataNavidad(playerid)
{
    new 
    query[126],
    Cache: result;

	mysql_format(handle_db, query, sizeof(query), "SELECT * FROM `usuarios` WHERE `ID`='%d'", PLAYER_INFO[playerid][pID]); 
    result = mysql_query(handle_db, query);

    new
    value[256],
    questsvar[256],
    gift_object = random(5);

    if(gift_object == 0) gift_object = 19054;
    else if(gift_object == 1) gift_object = 19055;
    else if(gift_object == 2) gift_object = 19056;
    else if(gift_object == 3) gift_object = 19057;
    else gift_object = 19058;

    cache_get_value_name(0, "Quest", value); format(questsvar, sizeof(questsvar), value);
    sscanf(questsvar, "p<|>iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii", 
    QuestStats[playerid][0], QuestStats[playerid][1], QuestStats[playerid][2], QuestStats[playerid][3], QuestStats[playerid][4],		
    QuestStats[playerid][5], QuestStats[playerid][6], QuestStats[playerid][7], QuestStats[playerid][8], QuestStats[playerid][9],
    QuestStats[playerid][10], QuestStats[playerid][11], QuestStats[playerid][12], QuestStats[playerid][13], QuestStats[playerid][14],
    QuestStats[playerid][15], QuestStats[playerid][16], QuestStats[playerid][17], QuestStats[playerid][18], QuestStats[playerid][19],		
    QuestStats[playerid][20], QuestStats[playerid][21], QuestStats[playerid][22], QuestStats[playerid][23], QuestStats[playerid][24],
    QuestStats[playerid][25], QuestStats[playerid][26], QuestStats[playerid][27], QuestStats[playerid][28], QuestStats[playerid][29],	
    QuestStats[playerid][30], QuestStats[playerid][31], QuestStats[playerid][32], QuestStats[playerid][33], QuestStats[playerid][34],
    QuestStats[playerid][35], QuestStats[playerid][36], QuestStats[playerid][37], QuestStats[playerid][38], QuestStats[playerid][39],	
    QuestStats[playerid][40], QuestStats[playerid][41], QuestStats[playerid][42], QuestStats[playerid][43], QuestStats[playerid][44],
    QuestStats[playerid][45], QuestStats[playerid][46], QuestStats[playerid][47], QuestStats[playerid][48], QuestStats[playerid][49]);	

    for(new i = 0; i < 50; i++) {
    if(QuestStats[playerid][i] == 0) 				
        QuestObject[playerid][i] = CreatePlayerObject(playerid, gift_object, QuestPos[i][0], QuestPos[i][1], QuestPos[i][2], 0, 0, 0, 300.0);
    }

    
    cache_delete(result);

    SendClientMessageEx(playerid, COLOR_GAMEMODE,"{DE0000}<Rastros de Santa>{FFFFFF} Progreso de la Mision: %d/50", CheckObjects(playerid));
	if(CheckObjects(playerid) == 0 && PLAYER_TEMP[playerid][RecienRegistradoTmp] == 0) ComenzarTutorialNavidad(playerid);	
	if(PLAYER_TEMP[playerid][pNavidad] == 0) SendClientMessage(playerid, COLOR_GAMEMODE, "Para activar el radar de regalos usa /radar.");

	if(CheckObjects(playerid) < 50) SetPlayerAttachedObject( playerid, 8, 3026, 1, -0.172813, -0.112569, -0.022387, 0.000000, 0.000000, 3.390071, 1.000000, 1.000000, 1.130721);
    return 1;
}
KeyNavidad(playerid)
{
    if(CheckObjects(playerid) < 50) 
    {
        new string[128];
        for(new q = 0; q < 50; q++) 
        {
            if(QuestStats[playerid][q] == 0) 
            {								
                if(IsPlayerInRangeOfPoint(playerid, 2.0, QuestPos[q][0], QuestPos[q][1], QuestPos[q][2])) 
                {
                    if(GetPlayerVirtualWorld(playerid) != 0) return 1;
                    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Error: ¡No puedes recoger este artículo porque estás en un vehículo!");
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 0);
                    DestroyPlayerObject(playerid, QuestObject[playerid][q]);							
                    QuestStats[playerid][q] = 1;
					MySQL_save(playerid);

                    if(CheckObjects(playerid) == 50) 
                    {
                        format(string, sizeof(string), "{DE0000}<Rastros de Santa>{FFFFFF} %s terminó de recolectar todos los objetos ocultos y ganó el premio especial!", PLAYER_INFO[playerid][Nickname]);
                        SendClientMessageToAll(-1, string);

                        new money = 100000 + random(500000);
                        DarDinero(playerid, money);
                        PLAYER_INFO[playerid][@Nivel] += 1;
                        Actualizar(playerid);
						

                        format(string, sizeof(string), "~r~Mision completada~w~~h~~n~Por completar la Mision, recibiste:~n~~g~$%d y 1 aumento de nivel", money);
                        ShowPlayerMessage(playerid, string);
	

                        RemovePlayerAttachedObject(playerid, 8);
								
                    }		
                    else 
                    {
                        SendClientMessageEx(playerid, COLOR_GAMEMODE, "{DE0000}<Rastros de Santa>{FFFFFF} Progreso de la Mision: %d/50", CheckObjects(playerid));
						Notificador2(playerid, "~g~~h~~h~Recibiste +1 Totems y $1.000. ¡Encuentra más regalos!");
						PLAYER_INFO[playerid][Totems] += 1;
						DarDinero(playerid, 1000);
                    }
                        
                }
            }
        }
    }
    return 1;
}
ComenzarTutorialNavidad(playerid)
{
	if(VarTutorialNavidad[playerid] < 4) TimerTutorialNavidad[playerid] = SetTimerEx("TutorialNavidad", 5000, false, "d", playerid);
	return 1;
}
function TutorialNavidad(playerid)
{
	switch(VarTutorialNavidad[playerid])
	{
		case 0: ShowPlayerMessage(playerid, "~r~(Rastros de Santa):~w~ Te invitamos a participar en este evento especial de navidad.");
		case 1: ShowPlayerMessage(playerid, "~r~(Rastros de Santa):~w~ Este evento consiste en conseguir cada regalo que santa dejo por todo el mapa.");
		case 2: ShowPlayerMessage(playerid, "~r~(Rastros de Santa):~w~ Vamos a indicarte cuando estes cerca de algun regalo para ayudarte.");
		case 3: ShowPlayerMessage(playerid, "~r~(Rastros de Santa):~w~ Al conseguir 50 regalos obtendras una recompensa mayor.");
	}
	KillTimer(TimerTutorialNavidad[playerid]);
	VarTutorialNavidad[playerid]++;
	ComenzarTutorialNavidad(playerid);
	return 1;
}
// funciones y_hook
hook cargartodo()
{
    server_timer = SetTimer("GlobalTimer", 800, true);
}
hook OnGameModeExit()
{
    KillTimer(server_timer);
}
hook LimpiarCuenta(playerid)
{
	PLAYER_TEMP[playerid][pNavidad] = 0;
	EventoCargado[playerid] = 0;
	VarTutorialNavidad[playerid] = 0;
}
hook datosCargados(playerid)
{
    LoadDataNavidad(playerid);

	EventoCargado[playerid] = 1; 

}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_SECONDARY_ATTACK) 
    {
        KeyNavidad(playerid);
	}
    if(newkeys & KEY_YES)
    {
        KeyNavidad(playerid);
    }
    return 1;   	
}
hook OnPlayerClickPlayer(playerid, clickedplayerid, source) {
    if (source == CLICK_SOURCE_SCOREBOARD) {
        SendClientMessageEx(playerid, COLOR_GAMEMODE, "Este jugador ha encontrado %d/50 regalos de navidad.", CheckObjects(clickedplayerid));
    }
    return 1;
}
CMD:radar(playerid)
{
	if(JugadorLogeado[playerid] != 0)
	{
		switch(PLAYER_TEMP[playerid][pNavidad])
		{
			case 0: 
			{
				PLAYER_TEMP[playerid][pNavidad] = 1;
				ShowPlayerMessage(playerid, "~r~Se activó el radar de regalos.");
			}
			case 1:
			{
				PLAYER_TEMP[playerid][pNavidad] = 0;
				ShowPlayerMessage(playerid, "~r~Se desactivó el radar de regalos.");
			}
		}
	}
	return 1;
}