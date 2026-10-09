funcion CrearGuardias(ID)
{
    MandarMensajeFabrica(ID, "{ffffff}Los guardias de la fábrica se han creado correctamente.");
    new name_f[MAX_PLAYER_NAME + 1];
    format(name_f, sizeof(name_f), "Guardia_%d", ContarNPC);
    new npcid = FCNPC_Create(name_f);
    new skin = random(5)+1;
    FCNPC_Spawn(npcid, skin, FABRICAS_INFO[ID][f_POS][0],FABRICAS_INFO[ID][f_POS][1],FABRICAS_INFO[ID][f_POS][2]);
    FCNPC_SetAngle(npcid, 0.0000);
    FCNPC_SetWeapon(npcid, 24);
    FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
    FCNPC_UseInfiniteAmmo(npcid, true);
    ColorJugadorDefault(npcid);
    FCNPC_SetHealth(npcid, 250.0);
    if(FABRICAS_INFO[ID][GE_FABRICA][0] == 0) FABRICAS_INFO[ID][GE_FABRICA][0] = npcid;
    else if(FABRICAS_INFO[ID][GE_FABRICA][1] == 0) FABRICAS_INFO[ID][GE_FABRICA][1] = npcid;
    else if(FABRICAS_INFO[ID][GE_FABRICA][2] == 0) FABRICAS_INFO[ID][GE_FABRICA][2] = npcid;
    else if(FABRICAS_INFO[ID][GE_FABRICA][3] == 0) FABRICAS_INFO[ID][GE_FABRICA][3] = npcid;
    else if(FABRICAS_INFO[ID][GE_FABRICA][4] == 0) FABRICAS_INFO[ID][GE_FABRICA][4] = npcid;
    else
    {
         return MandarMensajeFabrica(ID, "{ffffff}La fábrica alcanzó el límite de guardias.");
    }
    ContarNPC++;
    return 1;
}
function CreateNPCP2(playerid, id, name[])
{
    if(strlen(name) < 2 || strlen(name) > 15)   return SendClientMessage(playerid, -1, "Sólo (Nombre) ejemplo Estiven es permitido para el nombre de los NPC.");
    if(strfind(name,"=",true) != -1 || strfind(name,"´",true) != -1 || strfind(name,"'",true) != -1 || strfind(name,"`",true) != -1 || strfind(name,",",true) != -1 || strfind(name,"¨",true) != -1 || strfind(name,"%",true) != -1) return SendClientMessage(playerid, -1, "Ingresa un apodo válido.");
    if(PLAYER_INFO[playerid][pID] != 7968) return SendClientMessage(playerid, -1, "Tú no tienes acceso a esto.");
    if(id == 0)
    {
        format(Name_GE[playerid],144,"%s",name);
        new string[256], name_f[MAX_PLAYER_NAME + 1];
        format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
        new npcid = FCNPC_Create(name_f);
        FCNPC_Spawn(npcid, 164, gSpawn2[0][0], gSpawn2[0][1], gSpawn2[0][2]);
        FCNPC_SetAngle(npcid, 0.0000);
        FCNPC_SetWeapon(npcid, 22);
        FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
        FCNPC_UseInfiniteAmmo(npcid, true);
        ColorJugadorDefault(npcid);
        guardaespaldabot[npcid][gVida] = 250.0;
        guardaespaldabot[npcid][propietario] = playerid;
        format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
        FCNPC_SetHealth(npcid, 250.0);
        guardaespaldabot[npcid][gExiste] = 1;
        PLAYER_INFO[playerid][T_Guarda] = npcid;
        PLAYER_TIMES[playerid][TiempoGuarda] = gettime()+43200;
        format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name, NombreJugador(playerid));
        guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
        ContarNPC++;
    } 
    if(id == 1)
    {
        format(Name_GE2[playerid],144,"%s",name);
        new string[256], name_f[MAX_PLAYER_NAME + 1];
        format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
        new npcid = FCNPC_Create(name_f);
        FCNPC_Spawn(npcid, 164, gSpawn2[0][0], gSpawn2[0][1], gSpawn2[0][2]);
        FCNPC_SetAngle(npcid, 0.0000);
        FCNPC_SetWeapon(npcid, 22);
        FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
        FCNPC_UseInfiniteAmmo(npcid, true);
        ColorJugadorDefault(npcid);
        guardaespaldabot[npcid][gVida] = 250.0;
        guardaespaldabot[npcid][propietario] = playerid;
        format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
        FCNPC_SetHealth(npcid, 250.0);
        guardaespaldabot[npcid][gExiste] = 1;
        PLAYER_INFO[playerid][T_Guarda2] = npcid;
        PLAYER_TIMES[playerid][TiempoGuarda2] = gettime()+43200;
        format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
        guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
        ContarNPC++;
    }
    if(id == 2)
    {
        format(Name_GE3[playerid],144,"%s",name);
        new string[256], name_f[MAX_PLAYER_NAME + 1];
        format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
        new npcid = FCNPC_Create(name_f);
        FCNPC_Spawn(npcid, 164, gSpawn2[0][0], gSpawn2[0][1], gSpawn2[0][2]);
        FCNPC_SetAngle(npcid, 0.0000);
        FCNPC_SetWeapon(npcid, 22);
        FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
        FCNPC_UseInfiniteAmmo(npcid, true);
        ColorJugadorDefault(npcid);
        guardaespaldabot[npcid][gVida] = 250.0;
        guardaespaldabot[npcid][propietario] = playerid;
        format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
        FCNPC_SetHealth(npcid, 250.0);
        guardaespaldabot[npcid][gExiste] = 1;
        PLAYER_INFO[playerid][T_Guarda3] = npcid;
        PLAYER_TIMES[playerid][TiempoGuarda3] = gettime()+43200;
        format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
        guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
        ContarNPC++;
    }
    if(id == 3)
    {
        format(Name_GE4[playerid],144,"%s",name);
        new string[256], name_f[MAX_PLAYER_NAME + 1];
        format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
        new npcid = FCNPC_Create(name_f);
        FCNPC_Spawn(npcid, 164, gSpawn2[0][0], gSpawn2[0][1], gSpawn2[0][2]);
        FCNPC_SetAngle(npcid, 0.0000);
        FCNPC_SetWeapon(npcid, 22);
        FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
        FCNPC_UseInfiniteAmmo(npcid, true);
        ColorJugadorDefault(npcid);
        guardaespaldabot[npcid][gVida] = 250.0;
        guardaespaldabot[npcid][propietario] = playerid;
        format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
        FCNPC_SetHealth(npcid, 250.0);
        guardaespaldabot[npcid][gExiste] = 1;
        PLAYER_INFO[playerid][T_Guarda4] = npcid;
        PLAYER_TIMES[playerid][TiempoGuarda4] = gettime()+43200;
        format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
        guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
		ContarNPC++;
    }
    if(id == 4)
    {
        format(Name_GE5[playerid],144,"%s",name);
        new string[256], name_f[MAX_PLAYER_NAME + 1];
        format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
        new npcid = FCNPC_Create(name_f);
        FCNPC_Spawn(npcid, 164, gSpawn2[0][0], gSpawn2[0][1], gSpawn2[0][2]);
        FCNPC_SetAngle(npcid, 0.0000);
        FCNPC_SetWeapon(npcid, 22);
        FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
        FCNPC_UseInfiniteAmmo(npcid, true);
        ColorJugadorDefault(npcid);
        guardaespaldabot[npcid][gVida] = 250.0;
        guardaespaldabot[npcid][propietario] = playerid;
        format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
        FCNPC_SetHealth(npcid, 250.0);
        guardaespaldabot[npcid][gExiste] = 1;
        PLAYER_INFO[playerid][T_Guarda5] = npcid;
        PLAYER_TIMES[playerid][TiempoGuarda5] = gettime()+43200;
        format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
        guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
		ContarNPC++;
    }
    if(id == 5)
    {
        format(Name_GE6[playerid],144,"%s",name);
        new string[256], name_f[MAX_PLAYER_NAME + 1];
        format(name_f, sizeof(name_f), "%s_%d",name, ContarNPC);
        new npcid = FCNPC_Create(name_f);
        FCNPC_Spawn(npcid, 164, gSpawn2[0][0], gSpawn2[0][1], gSpawn2[0][2]);
        FCNPC_SetAngle(npcid, 0.0000);
        FCNPC_SetWeapon(npcid, 22);
        FCNPC_SetWeaponSkillLevel(npcid, WEAPONSKILL_PISTOL, 999); 
        FCNPC_UseInfiniteAmmo(npcid, true);
        ColorJugadorDefault(npcid);
        guardaespaldabot[npcid][gVida] = 250.0;
        guardaespaldabot[npcid][propietario] = playerid;
        format(guardaespaldabot[npcid][guarNombre],144,"%s",name);
        FCNPC_SetHealth(npcid, 250.0);
        guardaespaldabot[npcid][gExiste] = 1;
        PLAYER_INFO[playerid][T_Guarda6] = npcid;

        PLAYER_TIMES[playerid][TiempoGuarda6] = gettime()+43200;
        format(string, sizeof(string), "[#%d] - Salud: %00f\n %s, guardaespaldas de %s", ContarNPC, FCNPC_GetHealth(npcid),name,NombreJugador(playerid));
        guardaespaldabot[npcid][TextGuarda] = CreateDynamic3DTextLabel(string,0xFFFFFFAA,0.0, 0.0,0.0,10.0,npcid);
		ContarNPC++;
    }
    return 1;
}

