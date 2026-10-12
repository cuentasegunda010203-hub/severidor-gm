forward OnCheatDetected(playerid, const ip_address[], type, code);
public OnCheatDetected(playerid, const ip_address[], type, code)
{

    new string[128];
    if(PLAYER_INFO[playerid][pAdmin]  > 2) return 1;
    if(type) BlockIpAddress(ip_address, 0);
    else
    {
        switch(code)
        {

            case 0:
            {
                format(string, 128,"{FF0000}%s(ID: %d) fue expulsado por el anticheat: cheats de vuelo (0).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(0xFF0000FF,string);
            }
            case 1:
            {
                format(string, 128,"{FF0000}%s(ID: %d) fue expulsado por el anticheat: Air Break con vehículo (1).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(0xFF0000FF,string);
            }
            case 7:
            {
                format(string, 128,"{FF0000}%s(ID: %d) fue expulsado por el anticheat: volar con cheats (7).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(0xFF0000FF,string);
            }
            case 8:
            {
                format(string, 128,"{FF0000}%s(ID: %d) fue expulsado por el anticheat: Volar con vehículos (8).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(0xFF0000FF,string);
            }
            /*
            case 9:
            {
                format(string, 128,"{FF0000}%s(ID: %d) fue expulsado por el anticheat: Speedhack (9).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(0xFF0000FF,string);
            }
            case 10:
            {

                format(string, 128,"{FF0000}%s(ID: %d) fue expulsado por el anticheat: Speedhack con vehículos (10).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(0xFF0000FF,string);
            }
            */
			case 9,10:return 1;
            case 19:
            {
                format(string, 128,"{FF0000}%s(ID: %d) fue expulsado por el anticheat: Invulnerabilidad a pie (19).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(-1,string);
            }
            case 20:
            {
                format(string, 128,"El jugador {FF0000}%s(ID: %d){FFFFFF} fue expulsado por el anticheat. Razón:{FF0000} Invulnerabilidad en vehículo (20).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(-1,string);
            }
            case 23:
            {
                format(string, 128,"El jugador {FF0000}%s(ID: %d){FFFFFF} fue expulsado por el anticheat. Razón:{FF0000} Cheat de tuneo (23).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(-1,string);
            }
            case 25:
            {
                format(string, 128,"El jugador {FF0000}%s(ID: %d){FFFFFF} fue expulsado por el anticheat. Razón:{FF0000} Quick Turn (25).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(-1,string);
            }
            case 26:
            {
                format(string, 128,"El jugador {FF0000}%s(ID: %d){FFFFFF} fue expulsado por el anticheat. Razón:{FF0000} Rapid-Fire (26).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(-1,string);
            }

            case 5, 6, 11, 22: return 1;
            case 14:
            {
                ResetPlayerMoney(playerid);
                DarDinero(playerid, PLAYER_INFO[playerid][jDinero]);
                return 1;
            }

            case 31:
            {
                format(string, 128,"El jugador {FF0000}%s(ID: %d){FFFFFF} fue expulsado por el anticheat. Razón:{FF0000} Car Spam / Delete Car (31).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(-1,string);
            }
            case 32:
            {
                new Float:x, Float:y, Float:z;
                AntiCheatGetPos(playerid, x, y, z);
                SetPlayerPos(playerid, x, y, z);
                return 1;
            }
            case 34:
            {
                format(string, 128,"El jugador {FF0000}%s(ID: %d){FFFFFF} fue expulsado por el anticheat. Razón:{FF0000} Invisibilidad (34).",NombreJugador(playerid),playerid);
				SendClientMessageToAll(-1,string);
            }
            case 40: SendClientMessage(playerid, -1, MAX_CONNECTS_MSG);
            case 41: SendClientMessage(playerid, -1, UNKNOWN_CLIENT_MSG);
            case 49:
            {
                format(string, 128,"El jugador {FF0000}%s(ID: %d){FFFFFF} fue expulsado por el anticheat. Razón:{FF0000} Spamear puertas (49).",NombreJugador(playerid),playerid);
                SendClientMessageToAll(-1,string);
            }
            default:
            {
                //new strtmp[sizeof KICK_MSG];
                //format(strtmp, sizeof strtmp, KICK_MSG, code);

        		format(string, 128,"El jugador {FF0000}%s(ID: %d){FFFFFF} fue expulsado por el anticheat. Razón:{FF0000} %d.",NombreJugador(playerid),playerid, code);
				SendClientMessageToAll(-1,string);

            }


        }
        AntiCheatKickWithDesync(playerid, code);
    }
    return 1;
}
CMD:enableac(playerid, params[])
{
	if(PLAYER_INFO[playerid][pAdmin] < 7) return 0;
	if(sscanf(params, "di", params[0],params[1]))
	{
		SendClientMessage(playerid, -1, "/enableac <code> <true or false>");
	}
	else
	{
		switch(params[1])
		{
			case 0:
			{
				SendClientMessageEx(playerid, -1, "Has desactivado el anticheat #%d %s", params[0],Rzcheats(params[0]));
			}
			case 1:
			{
				SendClientMessageEx(playerid, -1, "Has activado el anticheat #%d %s", params[0],Rzcheats(params[0]));
			}
		}
		EnableAntiCheat(params[0],params[1]);
	}
	return 1;
}
CMD:anticheat(playerid, params[])
{
	if(PLAYER_INFO[playerid][pAdmin] < 4) return 0;
	if(sscanf(params, "d", params[0]))	SendClientMessage(playerid, -1, "/anticheat <code>");
	else								SendClientMessageEx(playerid, COLOR_CHEAT, "El codigo #00%d esta definido como [%s]",params[0], Rzcheats(params[0]));
	return 1;
}
/*CMD:anticheats(playerid, params[])
{
    new MAX_AC_CODE = 52;
    if(PLAYER_INFO[playerid][pAdmin] < 4) return 0;
    for(new i = 0; i < (sizeof MAX_AC_CODE); i ++)
	{
        if(i < MAX_AC_CODE)
        {
            SendClientMessageEx(playerid, COLOR_CHEAT, "%s 00%d",Rzcheats(i), i);
        }
	}
    return 1;
}*/