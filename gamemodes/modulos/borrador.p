CMD:aceptar(playerid, params[])
{
	printf("[DEBUG] CMD /aceptar %s | Usuario: %s[%d]",params,PLAYER_INFO[playerid][Nickname],playerid);
	new item[128],Float:X,Float:Y,Float:Z,day,month,year;
	getdate(year,month,day);
	if(!IsPlayerConnected(playerid)) return 1;
	if(!sscanf(params, "s[128]", item))
	{
		if(strcmp(item, "arma", true) == 0)
		{
        }
        if(strcmp(item,"muerte", true) == 0)
        {
        }
        if(strcmp(item,"totems", true) == 0)
        {

        }
        if(strcmp(item,"reparacion", true) == 0)
        {
        }
        if(strcmp(item,"consumible", true) == 0)
        {
 
        }
        if(strcmp(item,"piezas", true) == 0)
        {
        	
        }
        if(strcmp(item,""SERVER_COIN"", true) == 0)
        {
        	
        }
        if(strcmp(item,"proteccion", true) == 0)
        {
        	
        }
        return 1;

    }
    return 1;
}