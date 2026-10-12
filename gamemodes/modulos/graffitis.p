#include <YSI_Coding\y_hooks>

#define clean:<%0>					%0[0] = EOS	
#define format:%0(		    		%0[0] = EOS,format(%0,sizeof(%0),
#define pformat:(					g_small_string[0] = EOS,format(g_small_string,sizeof(g_small_string),

#define MINUTO_GRAF 25
#define DB_SERVER							"server"
const MAX_GRAFITIS = 53, MAX_STOCKS = 5;
new HORA_GRAFITI;
new GRAF_HABILIDADOS = 1;
new PayDayDado;
new GR;
new PintandoGraf[MAX_PLAYERS];
enum enum_GRAFITIS
{
	bool:Grafiti_VALID,
	Grafiti_Objeto,
	Grafiti_CP,
	Grafiti_ID,
	Grafiti_IDB,
	Grafiti_Banda[32],
	Grafiti_Zona[32],
	Float:Grafiti_X,
	Float:Grafiti_Y,
	Float:Grafiti_Z,
	Float:Grafiti_X2,
	Float:Grafiti_Y2,
	Float:Grafiti_Z2,
	Float:Grafiti_RX,
	Float:Grafiti_RY,
	Float:Grafiti_RZ,
	Grafiti_Segundos,
	Grafiti_Mapa,
	Grafiti_Timer,
	Grafiti_Conquistable,
	Grafiti_Banda1,
	Grafiti_Banda2,
	Grafiti_Banda3,
	Grafiti_Banda4,
	Grafiti_ObjetoB1,
	Grafiti_ObjetoB2,
	Grafiti_ObjetoB3,
	Grafiti_ObjetoB4,
	Grafiti_Banda1P,
	Grafiti_Banda2P,
	Grafiti_Banda3P,
	Grafiti_Banda4P
};
new Grafiti[MAX_GRAFITIS][enum_GRAFITIS];
new EstadoG,gActivado;
enum e_SERVER
{
	s_name[32],					// Nombre del almacén			
	s_value[7],					// valores
	Float:s_pos_unload[3],		// Coordenadas de descarga
	Text3D:s_load_text,			// texto de acoplamiento 3D
}
new Server[MAX_STOCKS][e_SERVER];					// Variables del almacén del servidor
stock ConverMayus(text[])
{
    new textfinal[60];
    for(new i; i< 32; i++)
    {
        text[i] = toupper(text[i]);
    }
    format(textfinal,60,"%s",text);
    return textfinal;
}

stock GetBandaID( id )
{
	for( new i; i < MAX_BANDAS; i++ )
	{
		if( BandasInfo[i][bID] == id )
		{
			return BandasInfo[i][bID];
		}
	}
	return -1;
}
task Timer6S[6000]()
{
    new hor,m,s;
	gettime(hor,m,s);
	if(hor == 1 && GRAF_HABILIDADOS == 1) GRAF_HABILIDADOS = 0;
	if(hor == 10 && GRAF_HABILIDADOS == 0) GRAF_HABILIDADOS = 1;
    if(m == 16 && PayDayDado == 1 || m == 31 && PayDayDado == 1 || m == 46 && PayDayDado == 1)
	{
	    PayDayDado = 0;
	}
	
	if(m == 10 && PayDayDado == 0 && GRAF_HABILIDADOS == 1)
	{			
		new stringg[300],GraF;
		GraF = RP_NextGrafiti(Server[0][s_value][6]);
        if (GraF == -1) return;
		format(stringg, sizeof(stringg),Desbug("Dentro de 15 minutos un grafiti en %s se liberara, ¡preparate!"),Grafiti[GraF][Grafiti_Zona]);
		MensajeGrafitiGlobal(stringg,-1);
		PayDayDado = 1;
	}
    if(m == 34 && GR == 1)
	{
		GR = 0;
	}
    if(GR == 0 && m == MINUTO_GRAF-1 && GRAF_HABILIDADOS == 1)
	{
		SiguienteGraf();
	}
}
CMD:activarg(playerid)
{
	if(PLAYER_INFO[playerid][pAdmin] > 6)
    {
	    SiguienteGraf();
    }
	return 1;
}
stock RP_NextGrafiti(start) {
    if (start < 0 || start >= MAX_GRAFITIS) start = 0;
    for (new offset; offset < MAX_GRAFITIS; offset++) {
        new index = (start + offset) % MAX_GRAFITIS;
        if (Grafiti[index][Grafiti_VALID]) return index;
    }
    return -1;
}
stock SiguienteGraf() {
    new index = RP_NextGrafiti(Server[0][s_value][6]);
    if (index == -1) return 0;
    GR = 1;
    Grafiti[index][Grafiti_Segundos] = 62;
    Grafiti[index][Grafiti_Conquistable] = 1;
    EstadoG = 1;
    gActivado = index;
    SetDynamicObjectMaterialText(Grafiti[index][Grafiti_Objeto], 0, Grafiti[index][Grafiti_Banda],110,"Comic Sans MS", 22, 0, -1, 0x00000000, 0);
    Server[0][s_value][6] = (index + 1) % MAX_GRAFITIS;
    mysql_format(handle_db, QUERY_BUFFER, sizeof QUERY_BUFFER, "UPDATE `"DB_SERVER"` SET `s_grafiti` = '%d'", Server[0][s_value][6]);
    mysql_tquery(handle_db, QUERY_BUFFER);
    return 1;
}
stock gang_player(playerid)
{
 	if(PLAYER_INFO[playerid][pFaccion] != 0) return 1;
	return 0;
}
hook TimerGlobalPlayers()
{
	//-------------------------------------------------------------------------------
	for(new g = 0; g != MAX_GRAFITIS; g ++)
	{		
		if(!Grafiti[g][Grafiti_VALID]) continue;
		if(Grafiti[g][Grafiti_Segundos] > 0) { Grafiti[g][Grafiti_Segundos]--;	}
		//--------------------------15--------------------------------------------------
		if(Grafiti[g][Grafiti_Segundos] == 900)
		{			
			new stringg[300];
			format(stringg, sizeof(stringg),Desbug("Dentro de 15 minutos un grafiti en %s se liberara, ¡preparate!"),Grafiti[g][Grafiti_Zona]);
			MensajeGrafitiGlobal(stringg,-1);
		}
		if(Grafiti[g][Grafiti_Segundos] == 300)
		{			
			new stringg[300];
			format(stringg, sizeof(stringg), Desbug("Dentro de 5 minutos un grafiti en %s se liberara, ¡preparate!"),Grafiti[g][Grafiti_Zona]);
			MensajeGrafitiGlobal(stringg,-1);
		}
		if(Grafiti[g][Grafiti_Segundos] == 60)
		{			
			new stringg[300];
			format(stringg, sizeof(stringg), Desbug("Dentro de 60 segundos un grafiti en %s se liberara, ¡preparate!"),Grafiti[g][Grafiti_Zona]);
			MensajeGrafitiGlobal(stringg,-1);
		}
		//-------------------------------------------------------------------------------
		if(Grafiti[g][Grafiti_Segundos] == 0 && Grafiti[g][Grafiti_Conquistable] == 1)//modificar a 0 cuando esté listo
		{						
			foreach( new i : Player) if(gang_player(i) || PLAYER_INFO[i][pAdmin] > 0) CrearNotificacion(i,"none", "~n~~n~~n~", 999000,-1,255,1,50,8);
			gActivado = g;
			EstadoG = 2;
			if(IsValidDynamicObject(Grafiti[g][Grafiti_Objeto])) {DestroyDynamicObject(Grafiti[g][Grafiti_Objeto]);}
			if(!IsValidDynamicObject(Grafiti[g][Grafiti_Objeto]))
			{				
				Grafiti[g][Grafiti_Objeto] = CreateDynamicObject(19482, Grafiti[g][Grafiti_X], Grafiti[g][Grafiti_Y], Grafiti[g][Grafiti_Z], Grafiti[g][Grafiti_RX], Grafiti[g][Grafiti_RY], Grafiti[g][Grafiti_RZ], 0, 0);
				SetDynamicObjectMaterialText(Grafiti[g][Grafiti_Objeto], 0, " ", 130, "Segoe Script Bold", 100, 1, -1, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			}
			//Grafiti[g][Grafiti_CP] = CreateDynamicCP(Grafiti[g][Grafiti_X2],Grafiti[g][Grafiti_Y2],Grafiti[g][Grafiti_Z2], 2.0, 0,0,-1, 2.0);
			Grafiti[g][Grafiti_CP] = CreateDynamicCPEx(Grafiti[g][Grafiti_X2],Grafiti[g][Grafiti_Y2],Grafiti[g][Grafiti_Z2], 2.0, 20.0);//STREAMER_TAG_CP CreateDynamicCPEx(Float:x, Float:y, Float:z, Float:size, Float:streamdistance = STREAMER_CP_SD, worlds[] = { -1 }, interiors[] = { -1 }, players[] = { -1 }, maxworlds = sizeof worlds, maxinteriors = sizeof interiors, maxplayers = sizeof players);
			//Grafiti[g][Grafiti_Mapa] = CreateDynamicMapIcon(Grafiti[g][Grafiti_X], Grafiti[g][Grafiti_Y], Grafiti[g][Grafiti_Z], 0, 0x0A9E13FF, 0, 0,-1,100000.0);
			Grafiti[g][Grafiti_Conquistable] = 2;//modificar a 1 cuando esté listo
			SetTimerEx("FG", 420000, false, "ii", g, Grafiti[g][Grafiti_IDB]);
			Grafiti[g][Grafiti_Banda1] = 0; Grafiti[g][Grafiti_Banda2] = 0; Grafiti[g][Grafiti_Banda3] = 0;Grafiti[g][Grafiti_Banda4] = 0;Grafiti[g][Grafiti_Banda1P] = 0;Grafiti[g][Grafiti_Banda2P] = 0;Grafiti[g][Grafiti_Banda3P] = 0;Grafiti[g][Grafiti_Banda4P] = 0;
		}
		//------------------------------------CONQUISTADO---------------------------------------
		if(Grafiti[g][Grafiti_Conquistable] == 2)//Poner 1 cuando termine
		{
			new BandaP;
			if(Grafiti[g][Grafiti_Banda1P] == 100 && Grafiti[g][Grafiti_Banda1] > 0)//Conquisto la primera
			{				
				EstadoG = 1;
				new stringg[300];
				BandaP = GetBandaID(Grafiti[g][Grafiti_Banda1]);
				format(stringg, sizeof(stringg),Desbug("%s~w~ ha ganado el graffiti de %s. En 3 días se volverá a disputar."),BandasInfo[BandaP][BNombre],Grafiti[g][Grafiti_Zona]);
				ResetearGrafiti(g,Grafiti[g][Grafiti_Banda1]);
				MensajeGrafitiGlobal(stringg,BandasInfo[BandaP][BColor]);
			}
			if(Grafiti[g][Grafiti_Banda2P] == 100 && Grafiti[g][Grafiti_Banda2] > 0)//Conquisto la segunda
			{
				EstadoG = 1;
				new stringg[300];
				BandaP = GetBandaID(Grafiti[g][Grafiti_Banda2]);
				format(stringg, sizeof(stringg),Desbug("%s~w~ ha ganado el graffiti de %s. En 3 días se volverá a disputar."),BandasInfo[BandaP][BNombre],Grafiti[g][Grafiti_Zona]);
				ResetearGrafiti(g,Grafiti[g][Grafiti_Banda2]);
				MensajeGrafitiGlobal(stringg,BandasInfo[BandaP][BColor]);
			}
			if(Grafiti[g][Grafiti_Banda3P] == 100 && Grafiti[g][Grafiti_Banda3] > 0)//Conquisto la segunda
			{
				EstadoG = 1;
				new stringg[300];
				BandaP = GetBandaID(Grafiti[g][Grafiti_Banda3]);
				format(stringg, sizeof(stringg),Desbug("%s~w~ ha ganado el graffiti de %s. En 3 días se volverá a disputar."),BandasInfo[BandaP][BNombre],Grafiti[g][Grafiti_Zona]);
				ResetearGrafiti(g,Grafiti[g][Grafiti_Banda3]);
				MensajeGrafitiGlobal(stringg,BandasInfo[BandaP][BColor]);
			}
			if(Grafiti[g][Grafiti_Banda4P] == 100 && Grafiti[g][Grafiti_Banda4] > 0)//Conquisto la segunda
			{				
				BandaP = GetBandaID(Grafiti[g][Grafiti_Banda4]);
				EstadoG = 1;
				new stringg[300];
				format(stringg, sizeof(stringg),Desbug("%s~w~ ha ganado el graffiti de %s. En 3 días se volverá a disputar."),BandasInfo[BandaP][BNombre],Grafiti[g][Grafiti_Zona]);
				ResetearGrafiti(g,Grafiti[g][Grafiti_Banda4]);
				MensajeGrafitiGlobal(stringg,BandasInfo[BandaP][BColor]);
			}
		}
		//--------------------------------------------------------------------------------------
	}		
	//Notificacion
	foreach( new i : Player)
	{		
		if(gang_player(i) && Noti_Grafiti[i] != -1 || PLAYER_INFO[i][pAdmin] > 0 && Noti_Grafiti[i] != -1)
		{			
			new string[128];
			format(string, sizeof(string),"Grafiti en %s",Grafiti[gActivado][Grafiti_Zona]);
			PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Name]);
			PlayerTextDrawSetString(i,GoodNoteData[i][Noti_Grafiti[i]][Graf_Name],string);
			PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Name]);
			new banda1 = GetBandaID(Grafiti[gActivado][Grafiti_Banda1]);
			new banda2 = GetBandaID(Grafiti[gActivado][Grafiti_Banda2]);
			new banda3 = GetBandaID(Grafiti[gActivado][Grafiti_Banda3]);
			new banda4 = GetBandaID(Grafiti[gActivado][Grafiti_Banda4]);
			SetPlayerMapIcon(i, 5, Grafiti[gActivado][Grafiti_X], Grafiti[gActivado][Grafiti_Y], Grafiti[gActivado][Grafiti_Z], 0, 0x0A9E13FF, MAPICON_GLOBAL);
			//Nadie ha pintado todavía
			if(EstadoG == 2)
			{				
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc],Desbug("¡La disputa comenzó! Nadie ha~n~pintado todavia."));
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1], "_");
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2], "_");
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3], "_");
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4], "_");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT],"~n~~n~~n~");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_LINES] = 2;
			}

			if(EstadoG == 3)//Pintando la 1
			{				
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc],"_");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				//Banda 1
				format(string, sizeof(string), "%s %d%",BandasInfo[banda1][BNombre],Grafiti[gActivado][Grafiti_Banda1P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1],BandasInfo[banda1][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1], string);
				//
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2], "_");
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3], "_");
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4], "_");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				//
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT],"~n~~n~~n~");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_LINES] = 2;
			}

			if(EstadoG == 4)//Pintando la 2
			{
				
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc],"_");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				//Banda 1
				format(string, sizeof(string), "%s %d%",BandasInfo[banda1][BNombre],Grafiti[gActivado][Grafiti_Banda1P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1],BandasInfo[banda1][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1], string);
				//
				format(string, sizeof(string), "%s %d%",BandasInfo[banda2][BNombre],Grafiti[gActivado][Grafiti_Banda2P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2],BandasInfo[banda2][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2], string);
				//
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3], "_");
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4], "_");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT],"~n~~n~~n~");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_LINES] = 2;
			}

			if(EstadoG == 5)//Pintando la 3
			{
				
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc],"_");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				//Banda 1
				format(string, sizeof(string), "%s %d%",BandasInfo[banda1][BNombre],Grafiti[gActivado][Grafiti_Banda1P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1],BandasInfo[banda1][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1], string);
				//
				format(string, sizeof(string), "%s %d%",BandasInfo[banda2][BNombre],Grafiti[gActivado][Grafiti_Banda2P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2],BandasInfo[banda2][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2], string);
				//
				format(string, sizeof(string), "%s %d%",BandasInfo[banda3][BNombre],Grafiti[gActivado][Grafiti_Banda3P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3],BandasInfo[banda3][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3], string);
				//
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4], "_");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				//
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT],"~n~~n~~n~~n~");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_LINES] = 3;
			}

			if(EstadoG == 6)//Pintando la 4
			{
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc],"_");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_Desc]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				//Banda 1
				format(string, sizeof(string), "%s %d%",BandasInfo[banda1][BNombre],Grafiti[gActivado][Grafiti_Banda1P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1],BandasInfo[banda1][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1], string);
				//
				format(string, sizeof(string), "%s %d%",BandasInfo[banda2][BNombre],Grafiti[gActivado][Grafiti_Banda2P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2],BandasInfo[banda2][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2], string);
				//
				format(string, sizeof(string), "%s %d%",BandasInfo[banda3][BNombre],Grafiti[gActivado][Grafiti_Banda3P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3],BandasInfo[banda3][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3], string);
				//
				format(string, sizeof(string), "%s %d%",BandasInfo[banda4][BNombre],Grafiti[gActivado][Grafiti_Banda4P]);
				PlayerTextDrawColor(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4],BandasInfo[banda4][BColor]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4], string);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B1]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B2]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B3]);
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][Graf_B4]);
				//
				PlayerTextDrawHide(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				PlayerTextDrawSetString(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT],"~n~~n~~n~~n~~n~");
				PlayerTextDrawShow(i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TD_TEXT]);
				GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_LINES] = 3;
			}
		}		
	}
	return 1;
}

function FG(ig,ib)
{
	if(Grafiti[ig][Grafiti_Conquistable] == 2)
	{
		ResetearGrafiti(ig,ib);
	}
	return 1;
}	
stock MensajeGrafitiGlobal(const text[],color)
{
	foreach(new playerid : Player)
	{
		if(!IsPlayerConnected(playerid)) continue;
		if(PLAYER_INFO[playerid][pFaccion] == 0 && PLAYER_INFO[playerid][pAdmin] == 0) continue;
		new mensaje[123];
		format(mensaje,123,"%s",text);
  		CrearNotificacion(playerid,"none",mensaje,8,color);
  		//CrearNotificacion(playerid,const icon[], const text[], time = 0, color = -1, bg_color = 255, sound = 1,
	}
	return 1;
}
stock ResetearGrafiti(g,b)
{
    if (g < 0 || g >= MAX_GRAFITIS || !Grafiti[g][Grafiti_VALID]) return 0;
	if(b == -1) b = 0;
	new banda = GetBandaID(b);
	new bandap[50];
	if(banda == -1)
	{
		bandap = "LIBRE";
		format(Grafiti[g][Grafiti_Banda],32, "%s", ConverMayus(bandap));
	}
	else if(banda != -1)
	{
		format(bandap, 50, "{%06x}%s", BandasInfo[banda][BColor]>>> 8,BandasInfo[banda][BNombre]);
		format(Grafiti[g][Grafiti_Banda],32, "%s", ConverMayus(bandap));
	}
	//DestroyDynamicMapIcon(Grafiti[g][Grafiti_Mapa]);
	DestroyDynamicCP(Grafiti[g][Grafiti_CP]);
	if(IsValidDynamicObject(Grafiti[g][Grafiti_Objeto])){DestroyDynamicObject(Grafiti[g][Grafiti_Objeto]);}

	EstadoG = 0;
	gActivado = 0;
	if(IsValidDynamicObject(Grafiti[g][Grafiti_ObjetoB1])){DestroyDynamicObject(Grafiti[g][Grafiti_ObjetoB1]);}
	if(IsValidDynamicObject(Grafiti[g][Grafiti_ObjetoB2])){DestroyDynamicObject(Grafiti[g][Grafiti_ObjetoB2]);}
	if(IsValidDynamicObject(Grafiti[g][Grafiti_ObjetoB3])){DestroyDynamicObject(Grafiti[g][Grafiti_ObjetoB3]);}
	if(IsValidDynamicObject(Grafiti[g][Grafiti_ObjetoB4])){DestroyDynamicObject(Grafiti[g][Grafiti_ObjetoB4]);}
	if(!IsValidDynamicObject(Grafiti[g][Grafiti_Objeto]))
	{
		Grafiti[g][Grafiti_Objeto] = CreateDynamicObject(19479, Grafiti[g][Grafiti_X], Grafiti[g][Grafiti_Y], Grafiti[g][Grafiti_Z], Grafiti[g][Grafiti_RX], Grafiti[g][Grafiti_RY], Grafiti[g][Grafiti_RZ], 0, 0);
		SetDynamicObjectMaterialText(Grafiti[g][Grafiti_Objeto], 0, Grafiti[g][Grafiti_Banda],110,"Comic Sans MS", 27, 0, -1, 0x00000000, 0);
	}
	Grafiti[g][Grafiti_Conquistable] = 0;
	Grafiti[g][Grafiti_Banda1] = 0;
	Grafiti[g][Grafiti_Banda2] = 0;
	Grafiti[g][Grafiti_Banda3] = 0;
	Grafiti[g][Grafiti_Banda4] = 0;
	Grafiti[g][Grafiti_Banda1P] = 0;
	Grafiti[g][Grafiti_Banda2P] = 0;
	Grafiti[g][Grafiti_Banda3P] = 0;
	Grafiti[g][Grafiti_Banda4P] = 0;
	Grafiti[g][Grafiti_Segundos] = 1000000;
	Grafiti[g][Grafiti_IDB] = b;
	mysql_format(handle_db, QUERY_BUFFER, sizeof(QUERY_BUFFER),"UPDATE `grafitis` SET `IDB` = '%d', `NombreBanda` = '%s' WHERE `ID` = '%d';", Grafiti[g][Grafiti_IDB],Grafiti[g][Grafiti_Banda],Grafiti[g][Grafiti_ID]);
	mysql_tquery( handle_db, QUERY_BUFFER );	
	foreach( new i : Player)
	{
		if(Noti_Grafiti[i] != -1)
		{
            GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TIME_OUT] = 1 + Timestamp();
            KillTimer(GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TIMER]);
            GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_TIMER] = SetTimerEx("DestroyGoodNote", 100, false, "dd", i, GoodNoteData[i][Noti_Grafiti[i]][GOOD_NOTE_ID]);
            Noti_Grafiti[i] = -1;
            RemovePlayerMapIcon(i, 5);
		}
    }
	return 1;
}

function PintandoGrafiti(playerid)
{
    if (!IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1 || GetPlayerWeapon(playerid) != 41) return 0;
	new weapons[13][2];
	GetPlayerWeaponData(playerid, 9, weapons[9][0], weapons[9][1]);
	SetTimerEx("PintandoGrafiti2", 500, false, "iii", playerid, weapons[9][1], PLAYER_INFO[playerid][pID]);
	return 1;
}

function PintandoGrafiti2(playerid,balas,accountid)
{
    if (!IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1 || PLAYER_INFO[playerid][pID] != accountid || GetPlayerWeapon(playerid) != 41) return 0;
	new weapons[13][2];
	GetPlayerWeaponData(playerid, 9, weapons[9][0], weapons[9][1]);
	if(weapons[9][1] != balas){ PintarGrafiti(playerid); }
	return 1;
}

//gang_player(playerid)
stock PintarGrafiti(playerid)
{
    if (!IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1 || PLAYER_INFO[playerid][pFaccion] <= 0 || PLAYER_INFO[playerid][pFaccion] >= MAX_BANDAS) return 0;
	if(gang_player(playerid))
	{
		new banda = PLAYER_INFO[playerid][pFaccion];
		new crime = GetBandaID(banda);
        if (crime <= 0 || crime >= MAX_BANDAS) return 0;
		for(new g = 0; g != MAX_GRAFITIS; g ++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 5.0, Grafiti[g][Grafiti_X2], Grafiti[g][Grafiti_Y2], Grafiti[g][Grafiti_Z2]) && Grafiti[g][Grafiti_Segundos] == 0)
			{	
			   if(GetPlayerCameraTargetObject(playerid))
			   {
					if(!Grafiti[g][Grafiti_VALID]) continue;
					if(Grafiti[g][Grafiti_Conquistable] == 2)
					{
						new bandap[50],bandaf[60];
						//-----------------------------COMENZAR A PINTAR 1-----------------------------------------------
						if(Grafiti[g][Grafiti_Banda1] == 0 && Grafiti[g][Grafiti_Banda2] == 0)
						{
							Grafiti[g][Grafiti_Banda1] = banda;
							EstadoG = 3;
							if(!IsValidDynamicObject(Grafiti[g][Grafiti_ObjetoB1]))
							{
								format(bandap, 50, "{%06x}%s", BandasInfo[crime][BColor]>>> 8,BandasInfo[crime][BNombre]);
								format(bandaf, 60, "%s", ConverMayus(bandap));
								Grafiti[g][Grafiti_ObjetoB1] = CreateDynamicObject(19479, Grafiti[g][Grafiti_X], Grafiti[g][Grafiti_Y], Grafiti[g][Grafiti_Z], Grafiti[g][Grafiti_RX], Grafiti[g][Grafiti_RY], Grafiti[g][Grafiti_RZ], 0, 0);
								SetDynamicObjectMaterialText(Grafiti[g][Grafiti_ObjetoB1], 0, bandaf, 110,"Comic Sans MS", 27, 0, -1, 0x00000000, 0);
							}
						}
						//-----------------------------------------------------------------------------------------------------
						else if(Grafiti[g][Grafiti_Banda1] > 0 && Grafiti[g][Grafiti_Banda2] == 0 && Grafiti[g][Grafiti_Banda1] != banda)
						{
							Grafiti[g][Grafiti_Banda2] = banda;
							EstadoG = 4;
							if(!IsValidDynamicObject(Grafiti[g][Grafiti_ObjetoB2]))
							{
								format(bandap, 50, "{%06x}%s", BandasInfo[crime][BColor]>>> 8,BandasInfo[crime][BNombre]);
								format(bandaf, 60, "%s", ConverMayus(bandap));
								Grafiti[g][Grafiti_ObjetoB2] = CreateDynamicObject(19479, Grafiti[g][Grafiti_X], Grafiti[g][Grafiti_Y], Grafiti[g][Grafiti_Z], Grafiti[g][Grafiti_RX], Grafiti[g][Grafiti_RY], Grafiti[g][Grafiti_RZ], 0, 0);
								SetDynamicObjectMaterialText(Grafiti[g][Grafiti_ObjetoB2], 0, bandaf, 110,"Comic Sans MS", 27, 0, -1, 0x00000000, 0);
							}
						}
						else if(Grafiti[g][Grafiti_Banda1] > 0 && Grafiti[g][Grafiti_Banda2] > 0 && Grafiti[g][Grafiti_Banda3] == 0 && Grafiti[g][Grafiti_Banda1] != banda && Grafiti[g][Grafiti_Banda2] != banda)
						{
							Grafiti[g][Grafiti_Banda3] = banda;
							EstadoG = 5;
							if(!IsValidDynamicObject(Grafiti[g][Grafiti_ObjetoB3]))
							{
								format(bandap, 50, "{%06x}%s", BandasInfo[crime][BColor]>>> 8,BandasInfo[crime][BNombre]);
								format(bandaf, 60, "%s", ConverMayus(bandap));
								Grafiti[g][Grafiti_ObjetoB3] = CreateDynamicObject(19479, Grafiti[g][Grafiti_X], Grafiti[g][Grafiti_Y], Grafiti[g][Grafiti_Z], Grafiti[g][Grafiti_RX], Grafiti[g][Grafiti_RY], Grafiti[g][Grafiti_RZ], 0, 0);
								SetDynamicObjectMaterialText(Grafiti[g][Grafiti_ObjetoB3], 0, bandaf, 110,"Comic Sans MS", 27, 0, -1, 0x00000000, 0);
							}
						}

						else if(Grafiti[g][Grafiti_Banda1] > 0 && Grafiti[g][Grafiti_Banda2] > 0 && Grafiti[g][Grafiti_Banda3] > 0 && Grafiti[g][Grafiti_Banda4] == 0 && Grafiti[g][Grafiti_Banda1] != banda && Grafiti[g][Grafiti_Banda2] != banda && Grafiti[g][Grafiti_Banda3] != banda)
						{
							Grafiti[g][Grafiti_Banda4] = banda;
							EstadoG = 6;
							if(!IsValidDynamicObject(Grafiti[g][Grafiti_ObjetoB4]))
							{
								format(bandap, 50, "{%06x}%s", BandasInfo[crime][BColor]>>> 8,BandasInfo[crime][BNombre]);
								format(bandaf, 60, "%s", ConverMayus(bandap));
								Grafiti[g][Grafiti_ObjetoB4] = CreateDynamicObject(19479, Grafiti[g][Grafiti_X], Grafiti[g][Grafiti_Y], Grafiti[g][Grafiti_Z], Grafiti[g][Grafiti_RX], Grafiti[g][Grafiti_RY], Grafiti[g][Grafiti_RZ], 0, 0);
								SetDynamicObjectMaterialText(Grafiti[g][Grafiti_ObjetoB4], 0, bandaf, 110,"Comic Sans MS", 27, 0, -1, 0x00000000, 0);
							}
						}

						else if(Grafiti[g][Grafiti_Banda1] != banda && Grafiti[g][Grafiti_Banda2] != banda && Grafiti[g][Grafiti_Banda3] != banda && Grafiti[g][Grafiti_Banda4] != banda)
						{
							ShowPlayerMessage(playerid,"Ya muchas bandas estan pintando este grafiti");
						}
						//--------------------------COMENZO A PINTAR-----------------------------------------------------------
						if(Grafiti[g][Grafiti_Banda1] == banda)
						{
							ShowPlayerMessage(playerid, "Pintando grafiti...");
							Grafiti[g][Grafiti_Banda1P] += 1;//Modificar a 2
							if(Grafiti[g][Grafiti_Banda1P] >= 100) Grafiti[g][Grafiti_Banda1P] = 100;
						}
						//---------------------------COMENZO A PINTAR2--------------------------------------------
						if(Grafiti[g][Grafiti_Banda2] == banda)
						{
							ShowPlayerMessage(playerid, "Pintando grafiti...");
							Grafiti[g][Grafiti_Banda2P] += 1;//Modificar a 2
							if(Grafiti[g][Grafiti_Banda2P] >= 100) Grafiti[g][Grafiti_Banda2P] = 100;
						}
						if(Grafiti[g][Grafiti_Banda3] == banda)
						{
							ShowPlayerMessage(playerid, "Pintando grafiti...");
							Grafiti[g][Grafiti_Banda3P] += 1;//Modificar a 2
							if(Grafiti[g][Grafiti_Banda3P] >= 100) Grafiti[g][Grafiti_Banda3P] = 100;
						}
						if(Grafiti[g][Grafiti_Banda4] == banda)
						{
							ShowPlayerMessage(playerid, "Pintando grafiti...");
							Grafiti[g][Grafiti_Banda4P] += 1;//Modificar a 2
							if(Grafiti[g][Grafiti_Banda4P] >= 100) Grafiti[g][Grafiti_Banda4P] = 100;
						}
						//-----------------------------------------------------------------------------
					}
				}
			}
		}
	}
	return 1;
}
hook cargartodo()
{
    mysql_tquery(handle_db, "SELECT * FROM `grafitis`", "CargarGrafitis" );
}
function CargarGrafitis()
{
    new rows,notis;	
    new content[64];
    new Float:fcontent;
    cache_get_row_count(rows);
    if(rows == 0) return 1;
    for(new i; i < rows && i < MAX_GRAFITIS; i++ )
    {
            cache_get_value_name(i, "ID", content);	Grafiti[i][Grafiti_ID] = strval(content);
            cache_get_value_name(i, "IDB", content); Grafiti[i][Grafiti_IDB] = strval(content);
            cache_get_value_name(i, "NombreBanda", content); format(Grafiti[i][Grafiti_Banda],32,"%s",content);
            cache_get_value_name(i, "Direccion", content); format(Grafiti[i][Grafiti_Zona],32,"%s",content);
            cache_get_value_name(i, "Tiempo", content); Grafiti[i][Grafiti_Segundos] = strval(content);

            cache_get_value_name_float(i, "GX", fcontent); Grafiti[i][Grafiti_X]  = fcontent;
            cache_get_value_name_float(i, "GY", fcontent); Grafiti[i][Grafiti_Y] = fcontent;
            cache_get_value_name_float(i, "GZ", fcontent); Grafiti[i][Grafiti_Z] = fcontent;
            cache_get_value_name_float(i, "PX", fcontent); Grafiti[i][Grafiti_X2] = fcontent;
            cache_get_value_name_float(i, "PY", fcontent); Grafiti[i][Grafiti_Y2] = fcontent;
            cache_get_value_name_float(i, "PZ", fcontent); Grafiti[i][Grafiti_Z2] = fcontent;
            cache_get_value_name_float(i, "GRX", fcontent); Grafiti[i][Grafiti_RX] = fcontent;
            cache_get_value_name_float(i, "GRY", fcontent); Grafiti[i][Grafiti_RY] = fcontent;
            cache_get_value_name_float(i, "GRZ", fcontent); Grafiti[i][Grafiti_RZ] = fcontent;

            Grafiti[i][Grafiti_Conquistable] = 0;
            Grafiti[i][Grafiti_Banda1] = 0;
            Grafiti[i][Grafiti_Banda2] = 0;
            Grafiti[i][Grafiti_Banda3] = 0;
            Grafiti[i][Grafiti_Banda4] = 0;
            Grafiti[i][Grafiti_Banda1P] = 0;
            Grafiti[i][Grafiti_Banda2P] = 0;
            Grafiti[i][Grafiti_Banda3P] = 0;
            Grafiti[i][Grafiti_Banda4P] = 0;
            Grafiti[i][Grafiti_Objeto] = CreateDynamicObject(19479, Grafiti[i][Grafiti_X], Grafiti[i][Grafiti_Y], Grafiti[i][Grafiti_Z], Grafiti[i][Grafiti_RX], Grafiti[i][Grafiti_RY], Grafiti[i][Grafiti_RZ], 0, 0);
            SetDynamicObjectMaterialText(Grafiti[i][Grafiti_Objeto], 0, Grafiti[i][Grafiti_Banda],110,"Comic Sans MS", 27, 0, -1, 0x00000000, 0);


            Grafiti[i][Grafiti_VALID] = true;				
            notis++;
    }

    printf( "••"NAME": | Grafitis cargados (%d).", notis);
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if ((oldkeys & KEY_FIRE) && !(newkeys & KEY_FIRE)) { KillTimer(PintandoGraf[playerid]); PintandoGraf[playerid] = 0; }
    if(PRESSED(KEY_FIRE))
    {		
        if(GetPlayerWeapon(playerid) == 41)
        {	
            KillTimer(PintandoGraf[playerid]);
            PintandoGraf[playerid] = SetTimerEx("PintandoGrafiti", 1000, true, "i", playerid);
        }
    }
}

//De 10AM a 1AM
stock ProxDispu()
{
	new hor,m,s,HoraGraf;
	gettime(hor,m,s);
	HoraGraf = hor;
	if(m >= MINUTO_GRAF)
	{
		HoraGraf += 1;
	}
	if(HoraGraf > 23)
	{
		HoraGraf -= 24;
	}
	HORA_GRAFITI = HoraGraf;
	return HoraGraf;
}


stock ProxDispuList(numero)
{
	new hor,m,s,HoraGraf;
	gettime(hor,m,s);
	HoraGraf = HORA_GRAFITI;
	HoraGraf += numero;
	if(HoraGraf > 23)
	{
		HoraGraf -= 24;
	}
	return HoraGraf;
}
stock TiempoDisputaDialog(HORAG,MINUTOG)
{
	new tiempo[32],hor,m,s,HF,MF;
	gettime(hor,m,s);
	HF = HORAG-hor;
	MF = MINUTOG-m;
	if(HF < 0) HF += 24;
	if(MF < 0)
	{
	MF += 60;
	HF--;
	if(HF < 0) HF += 24;
	}
	if(HF == 1 && MF == 0) format(tiempo,sizeof(tiempo),"%d hora.",HF,MF);
	else if(HF > 0 && MF == 0) format(tiempo,sizeof(tiempo),"%d horas.",HF,MF);
	else if(HF == 1 && MF > 0) format(tiempo,sizeof(tiempo),"%d hora y %d minutos.",HF,MF);
	else if(HF == 1 && MF == 1) format(tiempo,sizeof(tiempo),"%d hora y %d minuto.",HF,MF);
	else if(HF > 0 && MF > 0) format(tiempo,sizeof(tiempo),"%d horas y %d minutos.",HF,MF);
	else if(HF == 0 && MF == 1) format(tiempo,sizeof(tiempo),"%d minuto.",MF);
	else if(HF == 0 && MF > 0) format(tiempo,sizeof(tiempo),"%d minutos.",MF);
	else if(HF == 0 && MF == 0) format(tiempo,sizeof(tiempo),"disputa ahora",MF);
	return tiempo;
}
stock ListaDisputas(playerid) {
    if (GRAF_HABILIDADOS == 0) return SendClientMessage(playerid, -1, "Las disputas de grafitis estan deshabilitadas en este horario. Intenta mas tarde.");
    new index = RP_NextGrafiti(Server[0][s_value][6]);
    if (index == -1) return SendClientMessage(playerid, -1, "No hay grafitis registrados para disputar.");
    new body[1024], line[160], first = index;
    ProxDispu();
    strcat(body, "Consulta las proximas disputas de grafitis.\nPara conquistar: pertenece a una banda y usa spray junto al grafiti disponible.\n\n");
    for (new order; order < 5; order++) {
        format(line, sizeof line, "%d. %s - %s\n", order + 1, Grafiti[index][Grafiti_Zona], TiempoDisputaDialog(ProxDispuList(order), MINUTO_GRAF));
        strcat(body, line);
        index = RP_NextGrafiti((index + 1) % MAX_GRAFITIS);
        if (index == -1 || index == first) break;
    }
    return dialogs_ShowPlayerDialog(playerid, 32701, DIALOG_STYLE_MSGBOX, "Grafitis - Proximas disputas", body, "Cerrar", "");
}
CMD:grafitis(playerid) {
    if (!IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1) return 1;
    return ListaDisputas(playerid);
}

hook OnPlayerDisconnect(playerid, reason) {
    KillTimer(PintandoGraf[playerid]); PintandoGraf[playerid] = 0; return 1;
}
hook OnPlayerDeath(playerid, killerid, reason) {
    KillTimer(PintandoGraf[playerid]); PintandoGraf[playerid] = 0; return 1;
}