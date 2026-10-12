stock VerificarIP(playerid)
{
    if(!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) return 0;
    new ip[16], string[59];
    GetPlayerIp(playerid, ip, sizeof ip);
    if(!strcmp(ip, "127.0.0.1")) return 1;
    format(string, sizeof string, "blackbox.ipinfo.app/lookup/%s", ip);
    HTTP(playerid, HTTP_GET, string, "", "AntiVPN");
    return 1;
}
function AntiVPN(playerid, response_code, data[])
{
    if(!IsPlayerNPC(playerid) && !IsPlayerMobile(playerid))
    {
        new ip[24];
        GetPlayerIp(playerid, ip, sizeof ip);
        if(strcmp(ip, "127.0.0.1", true) == 0)
        {
            ShowPlayerMessage(playerid, "AntiVPN: Hemos detectado conexión de prueba.");
            return 1;
        }
        if(response_code == 200)
        {	
            if(data[0] == 'Y')
            {
                //MensajeAdminEx(3, COLOR_CHEAT, "[AC] El jugador %s[%d] entró con VPN-PROXY.",PLAYER_INFO[playerid][Nickname],playerid);
                //printf("[AC] El jugador %s[%d] entró con VPN-PROXY.",PLAYER_INFO[playerid][Nickname],playerid);	
                PLAYER_TEMP[playerid][VPN] = 1; //VPN Detectado
            }
            if(data[0] == 'N')
            {
                //MensajeAdminEx(3, COLOR_CHEAT, "[AC] El jugador %s[%d] conectó correctamente al servidor.",PLAYER_INFO[playerid][Nickname],playerid);
                //printf("[AC] El jugador %s[%d] conectó correctamente al servidor.",PLAYER_INFO[playerid][Nickname],playerid);	
                PLAYER_TEMP[playerid][VPN] = 0; //Conexión Segura
            }
            if(data[0] == 'X')
            {
                printf("FORMATO IP INCORRECTO"); //IP errónea.
            }
        }
    }
	return 1;
}

stock ConexionSegura(playerid)
{
    switch(PLAYER_TEMP[playerid][VPN])
    {
 /*       case 0: 
        {
            //SendClientMessage(playerid, -1, "{"COLOR_GM"}Tu conexión al servidor es segura.");
        }*/
        case 1:
        {
            KillTimer(LCHAT[playerid]);
            SendClientMessage(playerid, -1, "{"COLOR_GM"}Estás usando VPN, te recomendamos desactivarlo o de lo contrario");
            SendClientMessage(playerid, -1, "{"COLOR_GM"}No podrás disfrutar de ningúna función dentro del servidor.");
            SendClientMessage(playerid, -1, "{"COLOR_GM"}Si crees que esto es un error dirigete a:");
            SendClientMessage(playerid, -1, "{"COLOR_GM"}www.GTAZonerp.net - discord.gtazonerp.net");
            KickPlayer(playerid, 0, "Connection Failure");
        }
    }
}