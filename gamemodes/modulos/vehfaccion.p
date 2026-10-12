#include <YSI_Coding\y_hooks>

CargarVehiculosFaccion() {
    new Cache:factionVehiclesCache = mysql_query(handle_db, "SELECT * FROM `f_vehicles` WHERE faccion > 0", true);

    for(new i = 0; i < cache_num_rows(); i++) {
        new Float:POS[4], COLOR[2], MODELO, vehicleid, ID_DB = 0;
        cache_get_value_name_int(i, "id", ID_DB);
        if (ID_DB == 0) continue;

        cache_get_value_name_int(i, "modelo", MODELO);
        cache_get_value_name_float(i, "x", POS[0]);
        cache_get_value_name_float(i, "y", POS[1]);
        cache_get_value_name_float(i, "z", POS[2]);
        cache_get_value_name_float(i, "a", POS[3]);
        cache_get_value_name_int(i, "color1", COLOR[0]);
        cache_get_value_name_int(i, "color2", COLOR[1]);

        if (MODELO < 400 || MODELO > 611) {
            printf("[Vehiculos faccion] Modelo %d invalido en DB ID %d.", MODELO, ID_DB);
            continue;
        }
        vehicleid = LZ_CreateVehicle(MODELO, POS[0], POS[1], POS[2], POS[3], COLOR[0], COLOR[1], 300);
        if (vehicleid <= 0 || vehicleid >= MAX_VEHICLES || !IsValidVehicle(vehicleid)) {
            printf("[Vehiculos faccion] No se pudo crear DB ID %d.", ID_DB);
            continue;
        }
        Veh_Data[vehicleid][vModel] = MODELO;
        Veh_Data[vehicleid][vPos][0] = POS[0];
        Veh_Data[vehicleid][vPos][1] = POS[1];
        Veh_Data[vehicleid][vPos][2] = POS[2];
        Veh_Data[vehicleid][vPos][3] = POS[3];
        Veh_Data[vehicleid][Color][0] = COLOR[0];
        Veh_Data[vehicleid][Color][1] = COLOR[1];
        Veh_Data[vehicleid][vvID] = vehicleid;

        Veh_Data[vehicleid][BDvID] = ID_DB;
        cache_get_value_name_int(i, "precio", Veh_Data[vehicleid][vPrecio]);
        cache_get_value_name_int(i, "moneda", Veh_Data[vehicleid][vMoneda]);
        cache_get_value_name_int(i, "rango", Veh_Data[vehicleid][vRango]);
        cache_get_value_name_int(i, "faccion", Veh_Data[vehicleid][vFaccion]);
        cache_get_value_name_int(i, "Interior", Veh_Data[vehicleid][vInt]);
        cache_get_value_name_int(i, "VirtualWorld", Veh_Data[vehicleid][vWorld]);
        cache_get_value_name_int(i, "Seguro", Veh_Data[vehicleid][vTraba]);
        cache_get_value_name_float(i, "Vida", Veh_Data[vehicleid][VidaVeh]);
        cache_get_value_name_int(i, "Combustible", Veh_Data[vehicleid][vFuel]);

        VehicleFuel[vehicleid] = Veh_Data[vehicleid][vFuel];
        if (Veh_Data[vehicleid][vTraba] != 0) {
            new engine, lights, alarm, doors, bonnet, boot, objective;
            GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, 1, bonnet, boot, objective);
            bloqueado[vehicleid] = 1;
        }

        if (Veh_Data[vehicleid][VidaVeh] != 0) SetVehicleHealth(vehicleid, Veh_Data[vehicleid][VidaVeh]);
        if (Veh_Data[vehicleid][vInt] != 0) LinkVehicleToInterior(vehicleid, Veh_Data[vehicleid][vInt]);
        if (Veh_Data[vehicleid][vWorld] != 0) SetVehicleVirtualWorld(vehicleid, Veh_Data[vehicleid][vWorld]);

        AUTOS++;
        mysql_format(handle_db, QUERY_BUFFER, sizeof(QUERY_BUFFER), "SELECT * FROM `tuning_objects` WHERE `ID_VEHICLE` = '%d' AND `FACC` = '1' LIMIT %d;", Veh_Data[vehicleid][BDvID], MAX_OBJETOS);
        mysql_tquery(handle_db, QUERY_BUFFER, "L_Objetos", "i", vehicleid);
    }
    cache_delete(factionVehiclesCache);
    return 1;
}

function RecargarVehFaccion(faccion, delete)
{
    for(new k, h = GetVehiclePoolSize(); k <= h; k++) 
    {
        if (Veh_Data[k][vFaccion] == faccion && IsValidVehicle(k)) 
        {
            GuardarVehFaccion(k);
        }
    }
    if(delete == 1) SetTimerEx("DestroyVehFaccion", 2000, false, "d", faccion);
}

function DestroyVehFaccion(faccion)
{
    for(new k, h = GetVehiclePoolSize(); k <= h; k++) 
    {

        if (Veh_Data[k][vFaccion] == faccion && IsValidVehicle(k)) 
        {
            DestroyVehicleEx(k);
        }
    }
    SetTimerEx("LoadVehFaccion", 2000, false, "d", faccion);
}

function LoadVehFaccion(faccion)
{
    mysql_format(handle_db, QUERY_BUFFER, sizeof(QUERY_BUFFER), "SELECT * FROM `f_vehicles` WHERE `faccion`='%d'", faccion);
    mysql_tquery(handle_db, QUERY_BUFFER, "LoadedVehFaccion", "i", faccion);
}

function LoadedVehFaccion(faccion)
{
    if (faccion <= 0 || faccion >= MAX_BANDAS) return 0;
    new cantidad;
   for(new i = 0; i < cache_num_rows(); i++) 
   {
        new Float:POS[4], COLOR[2], MODELO, vehicleid, ID_DB = 0;
        cache_get_value_name_int(i, "id", ID_DB);
        if (ID_DB == 0) continue;

        cache_get_value_name_int(i, "modelo", MODELO);
        cache_get_value_name_float(i, "x", POS[0]);
        cache_get_value_name_float(i, "y", POS[1]);
        cache_get_value_name_float(i, "z", POS[2]);
        cache_get_value_name_float(i, "a", POS[3]);
        cache_get_value_name_int(i, "color1", COLOR[0]);
        cache_get_value_name_int(i, "color2", COLOR[1]);

        if (MODELO < 400 || MODELO > 611) {
            printf("[Vehiculos faccion] Modelo %d invalido en DB ID %d.", MODELO, ID_DB);
            continue;
        }
        vehicleid = LZ_CreateVehicle(MODELO, POS[0], POS[1], POS[2], POS[3], COLOR[0], COLOR[1], 300);
        if (vehicleid <= 0 || vehicleid >= MAX_VEHICLES || !IsValidVehicle(vehicleid)) {
            printf("[Vehiculos faccion] No se pudo crear DB ID %d.", ID_DB);
            continue;
        }
        Veh_Data[vehicleid][vModel] = MODELO;
        Veh_Data[vehicleid][vPos][0] = POS[0];
        Veh_Data[vehicleid][vPos][1] = POS[1];
        Veh_Data[vehicleid][vPos][2] = POS[2];
        Veh_Data[vehicleid][vPos][3] = POS[3];
        Veh_Data[vehicleid][Color][0] = COLOR[0];
        Veh_Data[vehicleid][Color][1] = COLOR[1];
        SetVehicleZAngle(vehicleid, Veh_Data[vehicleid][vPos][3]);
        Veh_Data[vehicleid][vvID] = vehicleid;
        Veh_Data[vehicleid][BDvID] = ID_DB;
        cache_get_value_name_int(i, "precio", Veh_Data[vehicleid][vPrecio]);
        cache_get_value_name_int(i, "moneda", Veh_Data[vehicleid][vMoneda]);
        cache_get_value_name_int(i, "rango", Veh_Data[vehicleid][vRango]);
        cache_get_value_name_int(i, "faccion", Veh_Data[vehicleid][vFaccion]);
        cache_get_value_name_int(i, "Interior", Veh_Data[vehicleid][vInt]);
        cache_get_value_name_int(i, "VirtualWorld", Veh_Data[vehicleid][vWorld]);
        cache_get_value_name_int(i, "Seguro", Veh_Data[vehicleid][vTraba]);
        cache_get_value_name_float(i, "Vida", Veh_Data[vehicleid][VidaVeh]);
        cache_get_value_name_int(i, "Combustible", Veh_Data[vehicleid][vFuel]);

        VehicleFuel[vehicleid] = Veh_Data[vehicleid][vFuel];
        if (Veh_Data[vehicleid][vTraba] != 0) {
            new engine, lights, alarm, doors, bonnet, boot, objective;
            GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, 1, bonnet, boot, objective);
            bloqueado[vehicleid] = 1;
        }

        if (Veh_Data[vehicleid][VidaVeh] != 0) SetVehicleHealth(vehicleid, Veh_Data[vehicleid][VidaVeh]);
        if (Veh_Data[vehicleid][vInt] != 0) LinkVehicleToInterior(vehicleid, Veh_Data[vehicleid][vInt]);
        if (Veh_Data[vehicleid][vWorld] != 0) SetVehicleVirtualWorld(vehicleid, Veh_Data[vehicleid][vWorld]);

        cantidad++;
        mysql_format(handle_db, QUERY_BUFFER, sizeof(QUERY_BUFFER), "SELECT * FROM `tuning_objects` WHERE `ID_VEHICLE` = '%d' AND `FACC` = '1' LIMIT %d;", Veh_Data[vehicleid][BDvID], MAX_OBJETOS);
        mysql_tquery(handle_db, QUERY_BUFFER, "L_Objetos", "i", vehicleid);
    }
    foreach(new i : Player)
    {
        if(IsPlayerConnected(i) && JugadorLogeado[i] && PLAYER_INFO[i][pFaccion] == faccion && PLAYER_INFO[i][pRango] >= 7)
        {
            SendFormatNotification(i, "~g~%s: ~w~ Se cargaron %d unidades.",BandasInfo[faccion][BNombre], cantidad);  
        }
    }   
    return 1;
}
hook cargartodo()
{
    CargarVehiculosFaccion();
    printf("["SERVER_COIN"] Cargando vehiculos de faccion.");
}
stock ObtenerVehRango(bid, rango)
{
    new rank[32];
    switch(rango)
    {
        case 1: format(rank, sizeof(rank), "%s", BandasInfo[bid][BRango1]);
        case 2: format(rank, sizeof(rank), "%s", BandasInfo[bid][BRango2]);
        case 3: format(rank, sizeof(rank), "%s", BandasInfo[bid][BRango3]);
        case 4: format(rank, sizeof(rank), "%s", BandasInfo[bid][BRango4]);
        case 5: format(rank, sizeof(rank), "%s", BandasInfo[bid][BRango5]);
        case 6: format(rank, sizeof(rank), "%s", BandasInfo[bid][BRango6]);
        case 7: format(rank, sizeof(rank), "%s", BandasInfo[bid][BRango7]);
        case 8: format(rank, sizeof(rank), "%s", BandasInfo[bid][BRango8]);
        default: format(rank, sizeof(rank), "Ninguno");
    }
    return rank;
}
hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    if(RP_SAFDFreeVehicle(vehicleid)) return 1;
    new banda = Veh_Data[vehicleid][vFaccion];
    if(PLAYER_INFO[playerid][pFaccion] != banda && banda > 0 && ispassenger == 0)
    {
        SacarVehiculo(playerid);
        TogglePlayerControllable(playerid, 0);
        SetPVarInt(playerid, "IsFrozen", 0);
        SetTimerEx("AntiCJ", 2000, false, "d", playerid);
        VWTemporal[playerid] = GetPlayerVirtualWorld(playerid);
        SetPlayerVirtualWorld(playerid, 99);
        EnAuto[playerid] = 0;
        SendFormatNotification(playerid, "~r~Vehiculo cerrado. ~w~Solo miembros de ~g~%s~w~ pueden usarlo.",BandasInfo[banda][BNombre]);
    }
    if(PLAYER_INFO[playerid][pRango] < Veh_Data[vehicleid][vRango] && banda > 0 && PLAYER_INFO[playerid][pFaccion] == banda && ispassenger == 0)
    {
        SacarVehiculo(playerid);
        TogglePlayerControllable(playerid, 0);
        SetPVarInt(playerid, "IsFrozen", 0);
        SetTimerEx("AntiCJ", 2000, false, "d", playerid);
        VWTemporal[playerid] = GetPlayerVirtualWorld(playerid);
        SetPlayerVirtualWorld(playerid, 99);
        EnAuto[playerid] = 0;
        if(PLAYER_INFO[playerid][pFaccion] == banda) SendFormatNotification(playerid, "~r~Vehiculo cerrado. ~w~Solo miembros ~g~%s~w~ o mayor pueden usarlo.",ObtenerVehRango(banda, Veh_Data[vehicleid][vRango]));
    }
    return 1;
}
function GuardarVehFaccion(vehicleid)
{
    if (vehicleid <= 0 || vehicleid >= MAX_VEHICLES || !IsValidVehicle(vehicleid) || Veh_Data[vehicleid][BDvID] <= 0) return 0;
    new Float:z_rot;
    GetVehicleZAngle(vehicleid, z_rot);
    Veh_Data[vehicleid][vWorld] = GetVehicleVirtualWorld(vehicleid);
    Veh_Data[vehicleid][vInt] = GetVehicleInterior(vehicleid);
    mysql_format(handle_db, QUERY_BUFFER, sizeof(QUERY_BUFFER), "UPDATE `f_vehicles` SET `x`='%f', `y`='%f', `z`='%f', `a`='%.0f', `Vida`='%f', `Seguro`='%d', `Interior`='%d', `VirtualWorld`='%d', `Rango`='%d', `Combustible`='%d' WHERE id = '%d'", Veh_Data[vehicleid][vPos][0], Veh_Data[vehicleid][vPos][1], Veh_Data[vehicleid][vPos][2], z_rot, Veh_Data[vehicleid][VidaVeh], Veh_Data[vehicleid][vTraba], GetVehicleInterior(vehicleid), GetVehicleVirtualWorld(vehicleid), Veh_Data[vehicleid][vRango], VehicleFuel[vehicleid], Veh_Data[vehicleid][BDvID]);
    mysql_tquery(handle_db, QUERY_BUFFER);
    return 1;
}
function SeguroVehFaccion(playerid)
{
    new bid = PLAYER_INFO[playerid][pFaccion];
    new engine, lights, alarm, doors, bonnet, boot, objective;
    new Float:VPos[3];
    for(new k, h = GetVehiclePoolSize(); k <= h; k++) 
    {
        if (Veh_Data[k][vFaccion] == bid && IsValidVehicle(k)) 
        {
            GetVehiclePos(k, VPos[0], VPos[1], VPos[2]);
            if (IsPlayerInRangeOfPoint(playerid, 1.8, VPos[0], VPos[1], VPos[2]))
            {
                switch(Veh_Data[k][vTraba])
                {
                    case 0:
                    {
                        Veh_Data[k][vTraba] = 1;
                        bloqueado[k] = 1;
                        GetVehicleParamsEx(k, engine, lights, alarm, doors, bonnet, boot, objective);
                        SetVehicleParamsEx(k, engine, lights, alarm, 1, bonnet, boot, objective);
                        ShowPlayerMessage(playerid, "~r~Vehiculo trabado.");
                    }
                    case 1:
                    {
                        bloqueado[k] = 0;
                        GetVehicleParamsEx(k, engine, lights, alarm, doors, bonnet, boot, objective);
                        SetVehicleParamsEx(k, engine, lights, alarm, 0, bonnet, boot, objective);
                        Veh_Data[k][vTraba] = 0;
                        ShowPlayerMessage(playerid, "~g~Vehiculo destrabado.");                       
                    }
                }
                PlayerPlaySound(playerid, 1145, VPos[0], VPos[1], VPos[2]);
            }
        }
    }   
}

stock ComprarVehFaccion(playerid, modelid, color1, color2, &Float:X, &Float:Y, &Float:Z, &Float:A)
{
    mysql_format(handle_db, QUERY_BUFFER, sizeof(QUERY_BUFFER), "INSERT INTO `f_vehicles` (modelo,faccion,color1,color2,x,y,z,a) VALUES ('%d','%d','%d','%d','%f','%f','%f','%f')", modelid, PLAYER_INFO[playerid][pFaccion],color1,color2,X,Y,Z,A);
    mysql_tquery(handle_db, QUERY_BUFFER, "RecargarVehFaccion", "dd", PLAYER_INFO[playerid][pFaccion], 1);
    SendFormatNotification(playerid, "¡Felicidades! Compraste un ~g~%s para ~y~%s",NombreAuto[modelid - 400], BandasInfo[PLAYER_INFO[playerid][pFaccion]][BNombre]);
    return 1;
}
stock NameBanda(bid)
{
    new cadenita[50];
    format(cadenita,sizeof(cadenita), "%s", BandasInfo[bid][BNombre]);
    return cadenita;
}
stock GetPasajeros(carid)
{
    new conteo;
    foreach(new i : Player) 
    {
        if (GetPlayerVehicleID(i) == carid && JugadorLogeado[i] == 1) conteo++;
    }
    return conteo;
}
stock ConfigurarVehData(playerid, vid)
{
    if(IsVehicleFaccion(vid, PLAYER_INFO[playerid][pFaccion]))
    { 
        if(PLAYER_INFO[playerid][pRango] >= 8)
        {
            new str[128], nameveh[128];
            format(nameveh, sizeof(nameveh), "Configurar %s", NombreAuto[Veh_Data[vid][vModel]-400]);
            format(str, sizeof(str), "Rango del vehiculo\t%s\nObjetos tuning.", ObtenerVehRango(PLAYER_INFO[playerid][pFaccion], Veh_Data[vid][vRango]));
            dialogs_ShowPlayerDialog(playerid, D_CONFIG_VEHDATA, DIALOG_STYLE_TABLIST, nameveh, str, "Aceptar", "Cancelar");
        }
        else ShowPlayerMessage(playerid, "~r~Sólo los líderes pueden configurar este vehículo.");
    }
    else ShowPlayerMessage(playerid, "~r~Este vehículo no pertenece a tu banda."); 
}
funcion LVehFaccion(playerid, bid)
{
    new TempConvert[900], carid = -1;
    new dialog[115 * 15 + 1];
    dialog = "ID\tModelo\tCombustible\tPasajeros\n";
    for(new k, h = GetVehiclePoolSize(); k <= h; k++) 
	{
        if (Veh_Data[k][vFaccion] == bid && IsValidVehicle(k))
		{
            carid++;
            format(TempConvert, sizeof(TempConvert), "\n%i\t%s\t%i.00L\t%i Personas\n", Veh_Data[k][vvID],NombreAuto[GetVehicleModel(k) -400],VehicleFuel[k],GetPasajeros(k));
            strcat(dialog, TempConvert);
			PLAYER_TEMP[playerid][LVehFacc][carid] = k;
        }
    }
    Dialog(playerid, D_VEHFACC, DIALOG_STYLE_TABLIST_HEADERS, NameBanda(bid), dialog, "Aceptar", "Salir");
}
CMD:cvfacc(playerid, params[])
{
    new modelid, color1, color2;
    if (sscanf(params, "ddd", modelid, color1, color2)) return SendClientMessage(playerid, -1, "USA: /cvfacc [modelid] [color 1] [color 2]");
    if (color1 < 0 || color1 > 255) { SendClientMessage(playerid, -1, "Numero de color no debe ser menor de 0 o mayor que 255 !"); return 1; }
    if (color2 < 0 || color2 > 255) { SendClientMessage(playerid, -1, "Numero de color 2 no debe ser menor de 0 o mayor que 255 !"); return 1; }
    if (modelid < 400 || modelid > 611) { SendClientMessage(playerid, -1, "ID del vehiculo debe ser del 400 al 611 !"); return 1; }
    new Float:X, Float:Y, Float:Z, Float:Angle;
    GetPlayerPos(playerid, X, Y, Z);
    GetPlayerFacingAngle(playerid, Angle);
    ComprarVehFaccion(playerid, modelid, color1, color2, X, Y, Z, Angle);
    return 1;
}
CMD:vfaccion(playerid)
{
    if(PLAYER_INFO[playerid][pFaccion] > 0)
    {
        new conteo;
        new bid = PLAYER_INFO[playerid][pFaccion];
        for(new k, h = GetVehiclePoolSize(); k <= h; k++) 
        {
            if (Veh_Data[k][vFaccion] == bid && IsValidVehicle(k)) 
            {
                conteo++;
            }
        }
        if(conteo > 0) LVehFaccion(playerid, bid);
        else SendClientMessageEx(playerid, COLOR_GAMEMODE, "%s no tiene ningun vehiculo.", BandasInfo[PLAYER_INFO[playerid][pFaccion]][BNombre]);
    }
    else SendClientMessage(playerid, COLOR_GAMEMODE, "No perteneces a ninguna faccion");
    return 1;   
}
CMD:afaccion(playerid)
{
    RecargarVehFaccion(PLAYER_INFO[playerid][pFaccion], 1);
    return 1;
}
EstacionarVehFaccion(playerid)
{
    if(PLAYER_INFO[playerid][pFaccion] > 0)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        new bid = PLAYER_INFO[playerid][pFaccion];
        new engine, lights, alarm, doors, bonnet, boot, objective;
        if(Veh_Data[vehicleid][vFaccion] == bid)
        {
            GetVehiclePos(vehicleid, Veh_Data[vehicleid][vPos][0], Veh_Data[vehicleid][vPos][1], Veh_Data[vehicleid][vPos][2]);
            GetVehicleZAngle(vehicleid, Veh_Data[vehicleid][vPos][3]);
            GetVehicleHealth(vehicleid, Veh_Data[vehicleid][VidaVeh]);
            GetVehicleColor(vehicleid, Veh_Data[vehicleid][Color][0], Veh_Data[vehicleid][Color][1]);
            ShowPlayerMessage(playerid, "~g~Vehiculo estacionado.");
            AccionesRol(playerid, "estaciono el vehiculo faccionario.", 20);
            GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(vehicleid, 0, lights, alarm, doors, bonnet, boot, objective);
            MotorAuto[vehicleid] = 0;
            TogglePlayerControllable(playerid, 1);
            SetPVarInt(playerid, "IsFrozen", 1);
            SetCameraBehindPlayer(playerid);
            GuardarVehFaccion(vehicleid);
        }  
    }      
}

stock IsVehicleFaccion(vehicleid, bid)
{
    if(bid != 0 && Veh_Data[vehicleid][vFaccion] == bid) return 1;
    return 0;
}