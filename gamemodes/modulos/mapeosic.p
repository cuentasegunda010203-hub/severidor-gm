#include <YSI_Coding\y_hooks>
#define 	MAX_POBJETOS        1000
#define 	PORTON_MODEL		971
enum pObjects
{
	pOID,
	pObjeto,
	Float:pPosX,
	Float:pPosY,
	Float:pPosZ,
	Float:pPosRX,
	Float:pPosRY,
	Float:pPosRZ,
	pVw,
	pInt,
	Text3D:Label,
	bool:Moved,
	pBanda,
};
new cObjeto[MAX_POBJETOS][pObjects];

function splits(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
		if(strsrc[i]==delimiter || i==strlen(strsrc)){
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}

CargarMapeosIC()
{
	new arrCoords[10][32];
	new strFromFile2[256];
	new CONTAR_OBJETOS;
	new File: file = fopen("mapeossv.txt", io_read);
	if (file)
	{
		new ID_OBJETO,string[128];
		while (ID_OBJETO < sizeof(cObjeto))
		{
			fread(file, strFromFile2);
			splits(strFromFile2, arrCoords, '|');
			cObjeto[ID_OBJETO][pPosX] = floatstr(arrCoords[3]);
			cObjeto[ID_OBJETO][pPosY] = floatstr(arrCoords[4]);
			cObjeto[ID_OBJETO][pPosZ] = floatstr(arrCoords[5]);
			cObjeto[ID_OBJETO][pPosRX] = floatstr(arrCoords[6]);
			cObjeto[ID_OBJETO][pPosRY] = floatstr(arrCoords[7]);
			cObjeto[ID_OBJETO][pPosRZ] = floatstr(arrCoords[8]);
			cObjeto[ID_OBJETO][pBanda] = strval(arrCoords[9]);
			cObjeto[ID_OBJETO][pVw] = strval(arrCoords[1]);
			cObjeto[ID_OBJETO][pInt] = strval(arrCoords[2]);
			cObjeto[ID_OBJETO][pOID] = strval(arrCoords[0]);
			cObjeto[ID_OBJETO][Moved] = false;
			if (cObjeto[ID_OBJETO][pOID] > 0)
			{
				CONTAR_OBJETOS++;
				if(cObjeto[ID_OBJETO][pOID] == PORTON_MODEL && cObjeto[ID_OBJETO][pBanda] > 0)
				{
					format(string,sizeof(string), "{ffffff}Pulsa {"COLOR_GM"}'H' {ffffff}para abrir\n{ffffff}Porton de {"COLOR_GM"}%s",BandasInfo[cObjeto[ID_OBJETO][pBanda]][BNombre]);
					cObjeto[ID_OBJETO][Label] = CreateDynamic3DTextLabel(string,-1, cObjeto[ID_OBJETO][pPosX], cObjeto[ID_OBJETO][pPosY], cObjeto[ID_OBJETO][pPosZ]-1.0,15.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 0, cObjeto[ID_OBJETO][pVw], cObjeto[ID_OBJETO][pInt],-1, 100.0);
					cObjeto[ID_OBJETO][pObjeto]  = CreateDynamicObject(cObjeto[ID_OBJETO][pOID], cObjeto[ID_OBJETO][pPosX], cObjeto[ID_OBJETO][pPosY], cObjeto[ID_OBJETO][pPosZ], cObjeto[ID_OBJETO][pPosRX], cObjeto[ID_OBJETO][pPosRY], cObjeto[ID_OBJETO][pPosRZ], cObjeto[ID_OBJETO][pVw], cObjeto[ID_OBJETO][pInt], -1, 300);
				}
				else
				{
					cObjeto[ID_OBJETO][pObjeto]  = CreateDynamicObject(cObjeto[ID_OBJETO][pOID], cObjeto[ID_OBJETO][pPosX], cObjeto[ID_OBJETO][pPosY], cObjeto[ID_OBJETO][pPosZ], cObjeto[ID_OBJETO][pPosRX], cObjeto[ID_OBJETO][pPosRY], cObjeto[ID_OBJETO][pPosRZ], cObjeto[ID_OBJETO][pVw], cObjeto[ID_OBJETO][pInt], -1, 300);
				}
			}
			ID_OBJETO++;
		}
		fclose(file);
	}
    printf("» Sistema de objetos dinamicos cargado (%i).", CONTAR_OBJETOS);
}
stock IntentarAbrirPorton(playerid)
{
	new PortonObtenido = -1;
	for(new a = 0; a < MAX_POBJETOS; a++)
	{
		if(cObjeto[a][pOID] == PORTON_MODEL)
		{
			if(cObjeto[a][pBanda] == PLAYER_INFO[playerid][pFaccion] || PLAYER_INFO[playerid][pFaccion] == 1 || PLAYER_INFO[playerid][pFaccion] == 2 || IsPlayerNPC(playerid))
			{
				if(IsPlayerInRangeOfPoint(playerid, 7.0, cObjeto[a][pPosX], cObjeto[a][pPosY], cObjeto[a][pPosZ]))
				{
					PortonObtenido = a;
				}
			}
		}
	}
	if(PortonObtenido != -1 && PortonObtenido != 0) AbrirPortonBanda(playerid,PortonObtenido);
}
stock AbrirPortonBanda(playerid, objeto)
{
	if(!cObjeto[objeto][Moved])
	{
		printf("AbrirPortonBanda ID %d",objeto);
		cObjeto[objeto][Moved] = true;
		if(!IsPlayerNPC(playerid))ShowPlayerMessage(playerid, "~g~Abriendo..");
		MoveDynamicObject(cObjeto[objeto][pObjeto], cObjeto[objeto][pPosX], cObjeto[objeto][pPosY], cObjeto[objeto][pPosZ]-20.0, 4.0);
		SetTimerEx("CerrarPortonBanda",7000,false,"d",objeto);
	}
	return 1;
}
function CerrarPortonBanda(objeto)
{
	if(cObjeto[objeto][Moved])
	{
		printf("CerrarPortonBanda ID %d",objeto);
		cObjeto[objeto][Moved] = false;
		MoveDynamicObject(cObjeto[objeto][pObjeto],cObjeto[objeto][pPosX], cObjeto[objeto][pPosY], cObjeto[objeto][pPosZ], 2.0);
	}
	return 1;
}
GuardarMapeosIC()
{
    new szFileStr[1024],
    File: fHandle = fopen("mapeossv.txt", io_write);
    for (new objeto; objeto < MAX_POBJETOS; objeto++)
	{
        format(szFileStr, sizeof(szFileStr), "%d|%d|%d|%f|%f|%f|%f|%f|%f|%d|\r\n",
        cObjeto[objeto][pOID],
        cObjeto[objeto][pVw],
        cObjeto[objeto][pInt],
        cObjeto[objeto][pPosX],
        cObjeto[objeto][pPosY],
        cObjeto[objeto][pPosZ],
        cObjeto[objeto][pPosRX],
        cObjeto[objeto][pPosRY],
        cObjeto[objeto][pPosRZ],
		cObjeto[objeto][pBanda]);
        fwrite(fHandle, szFileStr);
    }
    return fclose(fHandle);
}

CMD:crearmapeo(playerid, params[])
{
	if(PLAYER_INFO[playerid][pAdmin] < 7) return 0;
	new modelid,banda;
    if (sscanf(params, "id", modelid,banda)) return SendClientMessageEx(playerid, COLOR_WHITE, "/crearmapeo [modelid] [pBanda]");
    new objeto = -1;
	for(new a = 0; a < MAX_POBJETOS;a++)
    {
		if(cObjeto[a][pOID] == 0)
		{
			objeto = a;
			break;
	    }
	}
	if(objeto == -1) return SendClientMessageEx(playerid, COLOR_WHITE, "Se alcanzó el límite de objetos admin.");
	GetPlayerPos(playerid, cObjeto[objeto][pPosX], cObjeto[objeto][pPosY], cObjeto[objeto][pPosZ]);
	cObjeto[objeto][pOID] = modelid;
	cObjeto[objeto][pObjeto]  = CreateDynamicObject(modelid, cObjeto[objeto][pPosX]-2.0, cObjeto[objeto][pPosY]-1.0, cObjeto[objeto][pPosZ], 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), -1, 300);
	cObjeto[objeto][pInt] = GetPlayerInterior(playerid);
	cObjeto[objeto][pVw] = GetPlayerVirtualWorld(playerid);
	cObjeto[objeto][pBanda] = banda;
	cObjeto[objeto][Moved] = false;
	EditDynamicObject(playerid, cObjeto[objeto][pObjeto]);
	SetPVarInt(playerid, "OBJ_ADM", 1);
	return 1;
}

CMD:mapeoscreados(playerid)
{
	if(PLAYER_INFO[playerid][pAdmin] < 7) return 0;
	new pro[1024], pro2[1024], tobjects;
	for(new a = 0; a < MAX_POBJETOS; a++)
	{
	    if(cObjeto[a][pOID] > 0)
	    {
	        tobjects++;
			format(pro, sizeof(pro), "ID: %d | OBJETO: %d |\n", a, cObjeto[a][pOID]);
			strcat(pro2, pro);
	    }
	}
 	if(tobjects > 0) dialogs_ShowPlayerDialog(playerid, -1, DIALOG_STYLE_LIST, "{00FF00}Objetos admin", pro2, "Aceptar", "");
 	else dialogs_ShowPlayerDialog(playerid, -1, DIALOG_STYLE_LIST, "{00FF00}Objetos admin", "Ninguno", "Aceptar", "");
	return 1;
}

CMD:irobjetoadmin(playerid, params[])
{
	if(PLAYER_INFO[playerid][pAdmin] < 7) return 0;
	if (sscanf(params, "i", params[0])) return SendClientMessageEx(playerid, COLOR_WHITE, "/irobjetoadmin [id del objeto]");
	if (params[0] < 0 || params[0] >= MAX_POBJETOS) return SendClientMessageEx(playerid, COLOR_WHITE, "El id del objeto es invalido.");
	SetPlayerPos(playerid, cObjeto[params[0]][pPosX], cObjeto[params[0]][pPosY], cObjeto[params[0]][pPosZ]);
	SendClientMessageEx(playerid, COLOR_WHITE, "Teleportado.");
	return 1;
}

CMD:editarmapeo(playerid, params[])
{
	if(PLAYER_INFO[playerid][pAdmin] < 7) return 0;
	if (sscanf(params, "i", params[0])) return SendClientMessageEx(playerid, COLOR_WHITE, "/editarmapeo [id del objeto]");
	if (params[0] < 0 || params[0] >= MAX_POBJETOS) return SendClientMessageEx(playerid, COLOR_WHITE, "El id del objeto es invalido.");
	new ID_OBJETO = params[0];
	if(cObjeto[ID_OBJETO][pOID] == PORTON_MODEL && cObjeto[ID_OBJETO][pBanda] > 0)
	{
 		DestroyDynamic3DTextLabel(cObjeto[ID_OBJETO][Label]);
	}
	EditDynamicObject(playerid, cObjeto[ID_OBJETO][pObjeto]);
	cObjeto[ID_OBJETO][Moved] = false;
	SetPVarInt(playerid, "OBJ_ADM", 1);
	return 1;
}

CMD:borrarmapeo(playerid)
{
	if(PLAYER_INFO[playerid][pAdmin] < 7) return 0;
	for(new a = 0; a < MAX_POBJETOS; a++)
	{
		if(cObjeto[a][pOID] > 0)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.0, cObjeto[a][pPosX], cObjeto[a][pPosY], cObjeto[a][pPosZ]))
			{
				new ID_OBJETO = a;
				if(cObjeto[ID_OBJETO][pOID] == PORTON_MODEL && cObjeto[ID_OBJETO][pBanda] > 0)
				{
					DestroyDynamic3DTextLabel(cObjeto[ID_OBJETO][Label]);
				}
			    DestroyDynamicObject(cObjeto[a][pObjeto]);
			    cObjeto[a][pPosX] = 0.0;
			    cObjeto[a][pPosY] = 0.0;
			    cObjeto[a][pPosZ] = 0.0;
			    cObjeto[a][pPosRX] = 0.0;
			    cObjeto[a][pPosRY] = 0.0;
			    cObjeto[a][pPosRZ] = 0.0;
			    cObjeto[a][pVw] = 0;
			    cObjeto[a][pInt] = 0;
			    cObjeto[a][pOID] = 0;
				cObjeto[a][pBanda] = 0;
				cObjeto[a][Moved] = false;
			    GuardarMapeosIC();
			    SendClientMessageEx(playerid, 0x00FF00FF, "¡Has eliminado el objeto correctamente!");
			    return 1;
			}
		}
	}
	return 1;
}
hook AbrirLZ()
{
    CargarMapeosIC();
    printf("Mapeos IC cargados correctamente.");
}