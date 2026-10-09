stock Webhook_Sancion(playerid, const razon[], tipo) //ban-discord.php
{
    new str[500];
    format(str, sizeof str, ""API_URL"/api/ban-discord.php?id=%d&razon=%s&sancion=%d&nm=%s&sk=%d",PLAYER_INFO[playerid][pID],razon,tipo,PLAYER_INFO[playerid][Nickname],PLAYER_INFO[playerid][jRopa]);
    strreplace(str, " ", "%20", true, 0, -1, sizeof(str));
    HTTP(playerid, HTTP_POST, str, "", "");
	return 1;
}
stock Webhook_Refuerzos(playerid, tipo)
{
    new str[500];
    format(str, sizeof str, ""API_URL"/api/refuerzos.php?id=%d&tipo=%d",PLAYER_INFO[playerid][pID],tipo);
    strreplace(str, " ", "%20", true, 0, -1, sizeof(str));
    HTTP(playerid, HTTP_POST, str, "", "");    
    return 1;
}
ObtenerRangoBanda(playerid)
{
    new rango[128], p = PLAYER_INFO[playerid][pFaccion];
    switch(PLAYER_INFO[playerid][pRango])
    {
        case 1: format(rango, sizeof(rango), "%s",BandasInfo[p][BRango1]);
        case 2: format(rango, sizeof(rango), "%s",BandasInfo[p][BRango2]);
        case 3: format(rango, sizeof(rango), "%s",BandasInfo[p][BRango3]);
        case 4: format(rango, sizeof(rango), "%s",BandasInfo[p][BRango4]);
        case 5: format(rango, sizeof(rango), "%s",BandasInfo[p][BRango5]);
        case 6: format(rango, sizeof(rango), "%s",BandasInfo[p][BRango6]);
        case 7: format(rango, sizeof(rango), "%s",BandasInfo[p][BRango7]);
        case 9: format(rango, sizeof(rango), "%s",BandasInfo[p][BRango8]);
    }
    return rango;
}

stock Webhook_Bandas(playerid, const sms[], canal = 0) 
{
    new str[700];
    format(str, sizeof str, ""API_URL"/api/bandas.php?id=%d&sms=%s&canal=%d&sk=%d&bid=%d&r=%s&namee=%s&wb=%s",PLAYER_INFO[playerid][pID],sms,canal,PLAYER_INFO[playerid][jRopa], PLAYER_INFO[playerid][pFaccion],ObtenerRangoBanda(playerid),PLAYER_INFO[playerid][Nickname],BandasInfo[PLAYER_INFO[playerid][pFaccion]][Webhook]);
    strreplace(str, " ", "%20", true, 0, -1, sizeof(str));
    if(PLAYER_INFO[playerid][pRango] < 6)
    {
        strreplace(str, "@everyone", "everyone", true, 0, -1, sizeof(str));
    }
    HTTP(playerid, HTTP_POST, str, "", "");
	return 1;
}
stock Webhook_Fabrica(id, const sms[]) 
{
    new str[500];
    format(str, sizeof str, ""API_URL"/api/fabrica.php?id=%d&sms=%s",sms, id);
    strreplace(str, " ", "%20", true, 0, -1, sizeof(str));
    HTTP(1, HTTP_POST, str, "", "");
	return 1;
}

stock Webhook_Canales(playerid, const mensaje[], canal, tipo_anuncio)
{
    new str[500];
    if(canal == 0)// Canal de dudas
    {
        format(str, sizeof str, ""API_URL"/api/discord-dudas.php?id=%d&mensaje=%s&playerid=%d&nm=%s&sk=%d&n=%d",PLAYER_INFO[playerid][pID],mensaje,playerid,PLAYER_INFO[playerid][Nickname],PLAYER_INFO[playerid][jRopa],PLAYER_INFO[playerid][@Nivel]);
    }
    else if(canal == 1)// Canal de anuncios
    {
        format(str, sizeof str, ""API_URL"/api/discord-anuncios.php?id=%d&mensaje=%s&tipo=%d&tlf=%d",PLAYER_INFO[playerid][pID],mensaje,tipo_anuncio,PLAYER_INFO[playerid][pNumero]);
    }
    else if(canal == 2)// Canal de admins
    {
        format(str, sizeof str, ""API_URL"/api/admin-discord.php?id=%d&mensaje=%s&playerid=%d&sk=%d&name=%s",PLAYER_INFO[playerid][pID],mensaje,playerid,PLAYER_INFO[playerid][jRopa],PLAYER_INFO[playerid][Nickname]);
    }
    else if(canal == 3)//Canal de twitter
    {
        format(str, sizeof str, ""API_URL"/api/twt-discord.php?id=%d&mensaje=%s&playerid=%d&vip=%d&nm=%s&sk=%d&n=%d",PLAYER_INFO[playerid][pID], mensaje, playerid, PLAYER_INFO[playerid][pVip],PLAYER_INFO[playerid][Nickname],PLAYER_INFO[playerid][jRopa],PLAYER_INFO[playerid][@Nivel]);
    }
    else if(canal == 4)
    {
        format(str, sizeof str, ""API_URL"/api/ao-discord.php?mensaje=%s",mensaje);
    }
    else if(canal == 5)
    {
        new color = random(3);
        if(color < 0) color = 0;
        format(str, sizeof str, ""API_URL"/api/apsa.php?mensaje=%s&color=%d",mensaje,color);
    }
    strreplace(str, " ", "%20", true, 0, -1, sizeof(str));
    HTTP(playerid, HTTP_POST, str, "", "");
    return 1;
}