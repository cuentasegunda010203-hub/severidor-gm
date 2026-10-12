
stock CrearNotificacion(playerid,const icon[], const text[], time = 0, color = -1, bg_color = 255, sound = 1, const size = sizeof(text),tipo = 0,noti = 90)
{
	if(noti < 10 && TiempoNotificaciones[playerid][noti] != 0) return 1;
	#pragma unused size
	static
	free_pos,
	lines_count,
	Float:size_bg,
	Float:pos_y
	;
	free_pos = gn_GetFreeNotePos(playerid);		
	if(free_pos == -1) return 0;
	new TextoNotificacion[200];
	format(TextoNotificacion, sizeof(TextoNotificacion), "%s",icon);
	format(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT_I], MAX_GOOD_TEXT_LENGTH, TextoNotificacion);
	format(TextoNotificacion, sizeof(TextoNotificacion), "%s",text);
	format(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT], MAX_GOOD_TEXT_LENGTH, TextoNotificacion);
	lines_count = gn_GetLineOfString(TextoNotificacion);
	if(tipo == 1) lines_count = 3;
	if(tipo == 2) lines_count = 6;
	if(tipo == 4) lines_count = 8;
	if(tipo == 5) lines_count = 2;
	if(tipo == 6) lines_count = 3;
	if(tipo == 7) lines_count = 1;
	if(tipo == 8) lines_count = 3;
	if(tipo == 9) lines_count = 2;
	if(tipo == 10) lines_count = 2;
	if(tipo == 11) lines_count = 3;
	if(tipo == 12) lines_count = 1;
	if(tipo == 14) lines_count = 1;
	if(tipo == 15) lines_count = 4;
	if(tipo == 16) lines_count = 1;
	size_bg = 1.2 + (lines_count * 1.4);
	pos_y = GoodNotePosY;
	if(Player[playerid][uCargos] > 0) 	pos_y = GoodNotePosY2;
	for(new i; i < free_pos; i++)
	{
		if(GoodNoteDirection == GN_DIRECTION_DOWN) {
			pos_y += 13.0 + (GoodNoteData[playerid][i][GOOD_NOTE_LINES] * 16.0) + 6.0;
		} else {
			pos_y -= 13.0 + (GoodNoteData[playerid][i][GOOD_NOTE_LINES] * 16.0) + 6.0;
		}
	}
	if(lines_count > 1 && GoodNoteDirection == GN_DIRECTION_UP) {
		pos_y -= (lines_count - 1) * 16.0;
	}
	GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] = tipo;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_LINES] = lines_count;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_COL_BG] = bg_color;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_COL_TEXT] = color;
	new PlayerText:temp_td;
	if(strfind(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT_I], "none", true) != -1)
	{
		format(TextoNotificacion, sizeof(TextoNotificacion), "%s",Desbug(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT]));	
	}
	else
	{
		format(TextoNotificacion, sizeof(TextoNotificacion), "____%s",Desbug(TextoNotificacion));
	}
	temp_td = CreatePlayerTextDraw(playerid, GoodNotePosX, pos_y+lines_count, TextoNotificacion);
	PlayerTextDrawLetterSize(playerid, temp_td, 0.271250, 1.383465);
	PlayerTextDrawTextSize(playerid, temp_td, 607.500000, size_bg);
	PlayerTextDrawAlignment(playerid, temp_td, 1);
	PlayerTextDrawColor(playerid, temp_td, color);
	PlayerTextDrawUseBox(playerid, temp_td, true);
	PlayerTextDrawBoxColor(playerid, temp_td, 0x00080E99);
	PlayerTextDrawSetShadow(playerid, temp_td, 0);
	PlayerTextDrawSetOutline(playerid, temp_td, 0);
	PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
	PlayerTextDrawFont(playerid, temp_td, 1);
	PlayerTextDrawSetProportional(playerid, temp_td, 1);
	PlayerTextDrawShow(playerid, temp_td);
	GoodNoteLastId++;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_TD_TEXT] = temp_td;
	if(strfind(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT_I], "none", true) != -1)
	{
		//
	}
	else
	{
		format(TextoNotificacion, sizeof(TextoNotificacion), "%s",Desbug(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT_I]));
		temp_td = CreatePlayerTextDraw(playerid, GoodNotePosX, pos_y+1.3, TextoNotificacion);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, temp_td, 13.125000, 13.125000);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 4);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][GOOD_NOTE_ICO] = temp_td;
	}
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 1)//taxi
	{
		Noti_Renta[playerid] = free_pos;
		temp_td = CreatePlayerTextDraw(playerid, 499.250000, pos_y+1.0, "tiempo de alquiler____________________costo");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.144373, 1.271466);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Renta1] = temp_td;
		temp_td = CreatePlayerTextDraw(playerid, 499.250000, pos_y+13.0, "9 minutos.");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.224998, 1.973333);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, 1018966015);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Renta2] = temp_td;
		temp_td = CreatePlayerTextDraw(playerid, 605.875000, pos_y+14.5, "$0");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.224998, 1.673333);
		PlayerTextDrawAlignment(playerid, temp_td, 3);
		PlayerTextDrawColor(playerid, temp_td, 1018966015);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		GoodNoteData[playerid][free_pos][Renta3] = temp_td;
		ActualizarTiempoRenta(playerid,TiempoRenta[playerid]);
		PlayerTextDrawShow(playerid, temp_td);
		temp_td = CreatePlayerTextDraw(playerid, 499.250000, pos_y+33.0, "manten pulsado 2 dentro del~n~vehiculo para desrentar");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.191248, 0.972799);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1650090753);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Renta4] = temp_td;
	}	
	//3CBC2F
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 2)//habilidad
	{
		Noti_Habilidad[playerid] = free_pos;
		new Float:p_y;
		p_y = 20.0;
		for(new h = 1; h < 5; h++)
		{
			if(h == 1)	GoodNoteData[playerid][free_pos][Barra_Camionero]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.500000, 0xFC5000FF, 100);
			if(h == 2) GoodNoteData[playerid][free_pos][Barra_Minero]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.500000, 0xEFC5000FF, 100);
			if(h == 3) GoodNoteData[playerid][free_pos][Barra_Basurero]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.500000, 0xFC5000FF, 100);
			if(h == 4) GoodNoteData[playerid][free_pos][Barra_Pescador]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.500000, 0xFC5000FF, 100);
			p_y += 25.0;
		}
		p_y = 1.0;
		pos_y += 5.0;
		for(new h = 1; h < 5; h++)
		{
			new exptrabajototal,exptrabajo;
			if(h == 1) temp_td = CreatePlayerTextDraw(playerid, 496.799987, pos_y+p_y, "Camionero");
			if(h == 2) temp_td = CreatePlayerTextDraw(playerid, 496.799987, pos_y+p_y, "Minero");
			if(h == 3) temp_td = CreatePlayerTextDraw(playerid, 496.799987, pos_y+p_y, "Basurero");
			if(h == 4) temp_td = CreatePlayerTextDraw(playerid, 496.799987, pos_y+p_y, "Pescador");
			PlayerTextDrawLetterSize(playerid, temp_td, 0.237994, 1.263998);
			PlayerTextDrawAlignment(playerid, temp_td, 1);
			PlayerTextDrawColor(playerid, temp_td, -1);
			PlayerTextDrawSetShadow(playerid, temp_td, 0);
			PlayerTextDrawSetOutline(playerid, temp_td, 1);
			PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
			PlayerTextDrawFont(playerid, temp_td, 1);
			PlayerTextDrawSetProportional(playerid, temp_td, 1);
			PlayerTextDrawShow(playerid, temp_td);
			if(h == 1) GoodNoteData[playerid][free_pos][Job1] = temp_td;
			if(h == 2) GoodNoteData[playerid][free_pos][Job2] = temp_td;
			if(h == 3) GoodNoteData[playerid][free_pos][Job3] = temp_td;
			if(h == 4) GoodNoteData[playerid][free_pos][Job4] = temp_td;
			if(h == 1)
			{
				exptrabajototal = GetMaxExpTrabajo(playerid,1);
				exptrabajo = Player[playerid][uCamionero];
				format(TextoNotificacion, sizeof(TextoNotificacion), "%d/%d (%d/8)",exptrabajo,exptrabajototal,Player[playerid][uCamioneroN]);
				SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Camionero], exptrabajototal);
				SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Camionero],exptrabajo);
				UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Camionero]);
				ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Camionero]);
			}
			if(h == 2)
			{
				exptrabajototal = GetMaxExpTrabajo(playerid,3);
				exptrabajo = Player[playerid][uMinero];
				format(TextoNotificacion, sizeof(TextoNotificacion), "%d/%d (%d/8)",exptrabajo,exptrabajototal,Player[playerid][uMineroN]);
				SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Minero], exptrabajototal);
				SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Minero],exptrabajo);
				UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Minero]);
				ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Minero]);
			}
			if(h == 3)
			{
				exptrabajototal = GetMaxExpTrabajo(playerid,4);
				exptrabajo = Player[playerid][uBasurero];
				format(TextoNotificacion, sizeof(TextoNotificacion), "%d/%d (%d/3)",exptrabajo,exptrabajototal,Player[playerid][uBasureroN]);
				SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Basurero], exptrabajototal);
				SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Basurero],exptrabajo);
				UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Basurero]);
				ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Basurero]);
			}
			if(h == 4)
			{
				exptrabajototal = GetMaxExpTrabajo(playerid,2);
				exptrabajo = Player[playerid][uPescador];
				format(TextoNotificacion, sizeof(TextoNotificacion), "%d/%d (%d/3)",exptrabajo,exptrabajototal,Player[playerid][uPescadorN]);
				SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Pescador], exptrabajototal);
				SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Pescador],exptrabajo);
				UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Pescador]);
				ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Pescador]);
			}
			temp_td = CreatePlayerTextDraw(playerid, 605.799987, pos_y+p_y, TextoNotificacion);
			PlayerTextDrawLetterSize(playerid, temp_td, 0.213998, 1.077332);
			PlayerTextDrawAlignment(playerid, temp_td, 3);
			PlayerTextDrawColor(playerid, temp_td, -1);
			PlayerTextDrawSetShadow(playerid, temp_td, 0);
			PlayerTextDrawSetOutline(playerid, temp_td, 1);
			PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
			PlayerTextDrawFont(playerid, temp_td, 1);
			PlayerTextDrawSetProportional(playerid, temp_td, 1);
			PlayerTextDrawShow(playerid, temp_td);
			if(h == 1) GoodNoteData[playerid][free_pos][Exp1] = temp_td;
			if(h == 2) GoodNoteData[playerid][free_pos][Exp2] = temp_td;
			if(h == 3) GoodNoteData[playerid][free_pos][Exp3] = temp_td;
			if(h == 4) GoodNoteData[playerid][free_pos][Exp4] = temp_td;
			p_y += 25.0;
		}
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 3)//Analgesico
	{
		Noti_Analgesico[playerid] = free_pos;
		new Float:p_y;
		p_y = 13.0;
		pos_y += 3.0;
		temp_td = CreatePlayerTextDraw(playerid, 497.799987, pos_y, "");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.237994, 1.263998);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][EfectoA] = temp_td;
		GoodNoteData[playerid][free_pos][Barra_A]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.000000, 0x16DC4590, 100);
		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_A], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_A],EfectoAnalgesico[playerid]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_A]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_A]);
		Noti_Analgesico[playerid] = free_pos;
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 4)//EST
	{
		pos_y += 3.0;
		temp_td = CreatePlayerTextDraw(playerid, 497.300000, pos_y+3.0, "dinero_______________________en banco~n~~n~~n~nivel_______________________experiencia~n~~n~~n~tiempo jugado~n~~n~~n~trabajo actual");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.171246, 1.189331);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1061109505);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][VerEST1] = temp_td;
		new stringest[130];
		format(stringest, sizeof(stringest), "%s~w~~n~~n~%d~n~~n~%d horas y %d minutos~n~~n~%s",convertir_numeros(Player[playerid][uMoney]),Player[playerid][uLevel],Player[playerid][uHours],Player[playerid][uPayTime],GetJobName(Player[playerid][uJob]));
		temp_td = CreatePlayerTextDraw(playerid, 497.300000, pos_y+17.0, stringest);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.246872, 1.739329);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, 0x16DC45FF);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 255);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][VerEST2] = temp_td;
		format(stringest, sizeof(stringest), "%s~w~~n~~n~%d/%d",convertir_numeros(Player[playerid][uBank]),Player[playerid][uEXP],(Player[playerid][uLevel]) * 6);
		temp_td = CreatePlayerTextDraw(playerid, 605.125000, pos_y+17.0, stringest);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.242496, 1.719464);
		PlayerTextDrawAlignment(playerid, temp_td, 3);
		PlayerTextDrawColor(playerid, temp_td, 0x16DC45FF);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][VerEST3] = temp_td;
		/* GoodNoteData[playerid][free_pos][Barra_A]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 130.500000, 2.000000, 0x8FE358FF, 100);
		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_A], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_A],EfectoAnalgesico[playerid]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_A]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_A]);
		Noti_Analgesico[playerid] = free_pos;*/
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 5)//Pescando..
	{
		Noti_Pesca[playerid] = free_pos;
		pos_y += 3.0;
		temp_td = CreatePlayerTextDraw(playerid, 504.125000, pos_y-2.5, "Pescando...");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.265623, 1.600000);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Pesca1] = temp_td;
		temp_td = CreatePlayerTextDraw(playerid, 499.250000, pos_y+11.0, "Espera a que muerdan el anzuelo...");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.168748, 1.189332);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Pesca2] = temp_td;
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 6)//Pescando..
	{
		Noti_Pesca[playerid] = free_pos;
		pos_y += 3.0;
		new fix_string[100];
		if(TeclaPesca[playerid] == 1) format(fix_string,sizeof fix_string, "¡Pulsa ESPACIO tan rápido~n~como puedas!");	
		if(TeclaPesca[playerid] == 2) format(fix_string,sizeof fix_string, "¡Pulsa ALT IZQ tan rápido~n~como puedas!");	
		if(TeclaPesca[playerid] == 3) format(fix_string,sizeof fix_string, "¡Pulsa MAYUS IZQ tan~n~rápido como puedas!");	
		temp_td = CreatePlayerTextDraw(playerid, 499.875000, pos_y+1.0, Desbug(fix_string));
		PlayerTextDrawLetterSize(playerid, temp_td, 0.231249, 1.264000);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Pesca1] = temp_td;
		if(ColorPesca[playerid] == 1) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0x97A594FF, 100);
		if(ColorPesca[playerid] == 2) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0xEC5151FF, 100);
		if(ColorPesca[playerid] == 3) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0x51ECA2FF, 100);
		if(ColorPesca[playerid] == 4) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0x862BF9FF, 100);
		if(ColorPesca[playerid] == 5) GoodNoteData[playerid][free_pos][Barra_Pescando]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+30.0, 110.500000, 4.000000, 0x2BF95FFF, 100);
		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Pescando], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Pescando],Pescando_Barra[playerid]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Pescando]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Pescando]);
	}	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 7)//Camionero
	{
		Noti_Camio[playerid] = free_pos;
		temp_td = CreatePlayerTextDraw(playerid, 500.000000, pos_y+1.0, "Tiempo restante:");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.223749, 1.293866);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][CamioTD] = temp_td;
	}	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 8)//Grafiti
	{
	  Noti_Grafiti[playerid] = free_pos;
	  temp_td = CreatePlayerTextDraw(playerid, 496.375000, pos_y+1.0, "hud:radar_spray");
	  PlayerTextDrawLetterSize(playerid, temp_td, -0.001874, -0.029866);
	  PlayerTextDrawTextSize(playerid, temp_td, 14.375000, 16.426662);
      PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawFont(playerid, temp_td, 4);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_Ico] = temp_td;

	  temp_td = CreatePlayerTextDraw(playerid, 510.125000, pos_y+1.0, "_");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.186249, 1.883733);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, -1);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, -256);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_Name] = temp_td;
			
			
	  temp_td = CreatePlayerTextDraw(playerid, 496.375000, pos_y+17.0, "");//grafiti en X
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210622, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1061109505);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_Desc] = temp_td;
			
	  temp_td = CreatePlayerTextDraw(playerid, 498.500000, pos_y+20.0, "_");//Banda 1
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210621, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -65281);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_B1] = temp_td;
	
	  temp_td = CreatePlayerTextDraw(playerid, 498.500000, pos_y+30.00, "_");//Banda 1
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210621, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -65281);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_B2] = temp_td;
	
	  temp_td = CreatePlayerTextDraw(playerid, 498.500000, pos_y+40.0, "_");//Banda 1
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210621, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -65281);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_B3] = temp_td;
	
	  temp_td = CreatePlayerTextDraw(playerid, 498.500000, pos_y+50.0, "_");//Banda 1
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.210621, 1.174399);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -65281);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  PlayerTextDrawShow(playerid, temp_td);
	  GoodNoteData[playerid][free_pos][Graf_B4] = temp_td;
		
		
	}	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 9)//habilidad
	{
		Noti_Hambre[playerid] = free_pos;

		GoodNoteData[playerid][free_pos][Barra_Hambre]	= CreatePlayerProgressBar(playerid, 499.000000, pos_y+15.0, 105.000000, 2.300000, GetColorHambre(playerid), 100);
		GoodNoteData[playerid][free_pos][Barra_Sed]	= CreatePlayerProgressBar(playerid, 499.000000, pos_y+35.0, 105.000000, 1.900000, GetColorSed(playerid), 100);


		pos_y += 5.0;
		temp_td = CreatePlayerTextDraw(playerid, 499.625000, pos_y-5.0, "Hambre");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.278125, 1.525332);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Hambre_TD1] = temp_td;


		temp_td = CreatePlayerTextDraw(playerid, 499.625000, pos_y+15.0, "Sed");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.278125, 1.52533);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, -1);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Hambre_TD2] = temp_td;

		new estadobarra[120];
		format(estadobarra,sizeof(estadobarra),"%s",GetEstadoHambre(playerid));

		temp_td = CreatePlayerTextDraw(playerid, 606.875000, pos_y-5.0, estadobarra);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.249999, 1.114666);
		PlayerTextDrawAlignment(playerid, temp_td, 3);
		PlayerTextDrawColor(playerid, temp_td, GetColorHambre(playerid));
		PlayerTextDrawSetShadow(playerid, temp_td, -1);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Hambre_TD3] = temp_td;

		format(estadobarra,sizeof(estadobarra),"%s",GetEstadoSed(playerid));
		temp_td = CreatePlayerTextDraw(playerid, 606.250000, pos_y+15.0, estadobarra);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.231249, 1.151998);
		PlayerTextDrawAlignment(playerid, temp_td, 3);
		PlayerTextDrawColor(playerid, temp_td, GetColorSed(playerid));
		PlayerTextDrawSetShadow(playerid, temp_td, -1);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Job1] = temp_td;
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Hambre_TD4] = temp_td;
			

		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Hambre], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Hambre],Player[playerid][uHambre]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Hambre]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Hambre]);

		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_Sed], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_Sed],Player[playerid][uSed]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Sed]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_Sed]);


	}	

	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 10)//taxi
	{
		Noti_Recuperandote[playerid] = free_pos;

		temp_td = CreatePlayerTextDraw(playerid, 498.000000,  pos_y,  Desbug("Recuperándote..."));
		PlayerTextDrawLetterSize(playerid, temp_td, 0.224998, 1.637331);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -2082641409);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Recuperandote1] = temp_td;
		
				
		temp_td = CreatePlayerTextDraw(playerid, 498.000000,  pos_y+13.0, "60 segundos restantes.");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.190623, 1.271466);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		GoodNoteData[playerid][free_pos][Recuperandote2] = temp_td;
		ActualizarTiempoRecuperandote(playerid,TiempoRecuperandote[playerid]);
		PlayerTextDrawShow(playerid, temp_td);
	}		
	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 11)//SAPD
	{
		Noti_Informe[playerid] = free_pos;
		temp_td = CreatePlayerTextDraw(playerid, 498.250000, pos_y+3, InformePolicia1[playerid]);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.211248, 1.488000);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, 0x2396FAFF);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Informe1] = temp_td;

		temp_td = CreatePlayerTextDraw(playerid, 498.875000, pos_y+17, InformePolicia2[playerid]);
		PlayerTextDrawLetterSize(playerid, temp_td, 0.206873, 1.181866);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Informe2] = temp_td;
	}		
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 12)//taxi
	{
		Noti_Carcel[playerid] = free_pos;
		temp_td = CreatePlayerTextDraw(playerid, 498.000000,  pos_y,  Desbug("Encarcelado..."));
		PlayerTextDrawLetterSize(playerid, temp_td, 0.224998, 1.637331);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, 0xF33232FF);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][Recuperandote1] = temp_td;
					
		temp_td = CreatePlayerTextDraw(playerid, 498.000000,  pos_y+13.0, "60 segundos restantes.");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.190623, 1.271466);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 0);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		GoodNoteData[playerid][free_pos][Recuperandote2] = temp_td;
		ActualizarTiempoCarcel(playerid,Player[playerid][uJailTime]);
		PlayerTextDrawShow(playerid, temp_td);
	}		
	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 13)//PayDay
	{
	  Noti_PD[playerid] = free_pos;
	  temp_td = CreatePlayerTextDraw(playerid, 497.000000, pos_y+2.0, "hud:radar_cash");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.000000, 0.000000);
	  PlayerTextDrawTextSize(playerid, temp_td, 14.375000, 14.933334);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 0);
	  PlayerTextDrawFont(playerid, temp_td, 4);
	  GoodNoteData[playerid][free_pos][PayDay1] = temp_td;

	  temp_td = CreatePlayerTextDraw(playerid, 512.000000, pos_y+1.5, "Hora de pago");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.211874, 1.764267);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 1);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  GoodNoteData[playerid][free_pos][PayDay2] = temp_td;

	  temp_td = CreatePlayerTextDraw(playerid, 498.000000, pos_y+20.0, "impu_");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.193749, 1.122133);
	  PlayerTextDrawAlignment(playerid, temp_td, 1);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 1);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  GoodNoteData[playerid][free_pos][PayDay3] = temp_td;

	  temp_td = CreatePlayerTextDraw(playerid, 603.000000, pos_y+20.0, "_diner");
	  PlayerTextDrawLetterSize(playerid, temp_td, 0.193749, 1.122133);
	  PlayerTextDrawAlignment(playerid, temp_td, 3);
	  PlayerTextDrawColor(playerid, temp_td, -1);
	  PlayerTextDrawSetShadow(playerid, temp_td, 0);
	  PlayerTextDrawSetOutline(playerid, temp_td, 1);
	  PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
	  PlayerTextDrawFont(playerid, temp_td, 1);
	  PlayerTextDrawSetProportional(playerid, temp_td, 1);
	  GoodNoteData[playerid][free_pos][PayDay4] = temp_td;
	  ActualizarPD(playerid);
	}		
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 14)//Experiencia mas
	{
		Noti_XP[playerid] = free_pos;
		new Float:p_y;
		new MaxVXP,VXP;
		p_y = 13.0;
		pos_y += 3.5;
		temp_td = CreatePlayerTextDraw(playerid, 497.799987, pos_y, "");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.237994, 1.263998);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][EfectoXP] = temp_td;
		GoodNoteData[playerid][free_pos][Barra_XP]	= CreatePlayerProgressBar(playerid, 497.000000, pos_y+p_y, 109.000000, 2.400000, 0xB6BDC3FF, 100);
		//-----------------------------------------------
		VXP = Player[playerid][uEXP];
		MaxVXP = (Player[playerid][uLevel]) * 6;
  		//------------------------------------------------
 		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_XP], MaxVXP);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_XP],VXP-1);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_XP]);
  		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_XP]);
  		SetPlayerProgressBarValueH(playerid, GoodNoteData[playerid][free_pos][Barra_XP], VXP);
	}	
	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 15)//Experiencia mas
	{
		  temp_td = CreatePlayerTextDraw(playerid, 499.875000, pos_y+3.3, "Mover~n~Mover rapido~n~Rotar~n~Subir y bajar~n~Terminar");
		  PlayerTextDrawLetterSize(playerid, temp_td, 0.161874, 1.301333);
		  PlayerTextDrawAlignment(playerid, temp_td, 1);
		  PlayerTextDrawColor(playerid, temp_td, -1);
		  PlayerTextDrawSetShadow(playerid, temp_td, 0);
		  PlayerTextDrawSetOutline(playerid, temp_td, 1);
		  PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		  PlayerTextDrawFont(playerid, temp_td, 1);
		  PlayerTextDrawSetProportional(playerid, temp_td, 1);
		  PlayerTextDrawShow(playerid, temp_td);
		  GoodNoteData[playerid][free_pos][Editor1] = temp_td;

		  temp_td = CreatePlayerTextDraw(playerid, 601.250000, pos_y+3.3, "W,A,S,D~n~Espacio + W,A,S,D~n~MAYUS + A,D~n~MAYUS + W,S~n~INTRO");
		  PlayerTextDrawLetterSize(playerid, temp_td, 0.161874, 1.301333);
		  PlayerTextDrawAlignment(playerid, temp_td, 3);
		  PlayerTextDrawColor(playerid, temp_td, 597097215);
		  PlayerTextDrawUseBox(playerid, temp_td, true);
		  PlayerTextDrawBoxColor(playerid, temp_td, 0);
		  PlayerTextDrawSetShadow(playerid, temp_td, 0);
		  PlayerTextDrawSetOutline(playerid, temp_td, 1);
		  PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
		  PlayerTextDrawFont(playerid, temp_td, 1);
		  PlayerTextDrawSetProportional(playerid, temp_td, 1);
		  PlayerTextDrawShow(playerid, temp_td);
		  GoodNoteData[playerid][free_pos][Editor2] = temp_td;

	}	
	
	if(GoodNoteData[playerid][free_pos][GOOD_NOTE_TYPE] == 16)//Pirula
	{
		Noti_Pirula[playerid] = free_pos;
		new Float:p_y;
		p_y = 13.0;
		pos_y += 3.0;
		temp_td = CreatePlayerTextDraw(playerid, 497.799987, pos_y, "");
		PlayerTextDrawLetterSize(playerid, temp_td, 0.237994, 1.263998);
		PlayerTextDrawAlignment(playerid, temp_td, 1);
		PlayerTextDrawColor(playerid, temp_td, -1);
		PlayerTextDrawSetShadow(playerid, temp_td, 0);
		PlayerTextDrawSetOutline(playerid, temp_td, 1);
		PlayerTextDrawBackgroundColor(playerid, temp_td, 51);
		PlayerTextDrawFont(playerid, temp_td, 1);
		PlayerTextDrawSetProportional(playerid, temp_td, 1);
		PlayerTextDrawShow(playerid, temp_td);
		GoodNoteData[playerid][free_pos][EfectoP] = temp_td;
		GoodNoteData[playerid][free_pos][Barra_P]	= CreatePlayerProgressBar(playerid, 496.000000, pos_y+p_y, 110.500000, 3.000000, 0x006DFF98, 100);
		SetPlayerProgressBarMaxValue(playerid, GoodNoteData[playerid][free_pos][Barra_P], 100);
		SetPlayerProgressBarValue(playerid, GoodNoteData[playerid][free_pos][Barra_P],EfectoPirula[playerid]);
		UpdatePlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_P]);
		ShowPlayerProgressBar(playerid, GoodNoteData[playerid][free_pos][Barra_P]);
		Noti_Pirula[playerid] = free_pos;
	}	
	
	if(time == 0) {
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIME_OUT] = 0;
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIMER] = 0;
	} else {
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIME_OUT] = time + Timestamp();
		GoodNoteData[playerid][free_pos][GOOD_NOTE_NOTI] = noti;
		if(noti < 10 && noti != 90) TiempoNotificaciones[playerid][noti] = 6;
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIMER] = SetTimerEx("DestroyGoodNote", time * 1000, false, "dd", playerid, GoodNoteLastId);
	}
	if(sound) {
		PlayerPlaySound(playerid, GoodNoteSound, 0.0, 0.0, 0.0);
	}
	GoodNoteData[playerid][free_pos][GOOD_NOTE_ID] = GoodNoteLastId;
	return GoodNoteLastId;
}
stock SetGoodNoteSound(sound)
{
	GoodNoteSound = sound;
	return 1;
}
stock SetGoodNoteDirection(type)
{
	switch(type)
	{
		case GN_DIRECTION_UP, GN_DIRECTION_DOWN:
		{
			GoodNoteDirection = type;
			return 1;
		}
	}
	return 0;
}
stock SetGoodNotePos(Float:pos_x, Float:pos_y)
{
	GoodNotePosX = pos_x;
	GoodNotePosY = pos_y;
	return 1;
}

stock SetGoodNotePos2(Float:pos_y)
{
	GoodNotePosY2 = pos_y;
	return 1;
}

forward DestroyGoodNote(playerid, goodnoteid);
public DestroyGoodNote(playerid, goodnoteid)
{
	static pos;
	pos = gn_FindGoodNotePosById(playerid, goodnoteid);
	if(pos == -1) return 1;
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TIMER] != 0) {
		KillTimer(GoodNoteData[playerid][pos][GOOD_NOTE_TIMER]);
	}
	PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_TEXT]);
	PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_TEXT]);
	GoodNoteData[playerid][pos][GOOD_NOTE_ID] = 0;
	if(strfind(GoodNoteData[playerid][pos][GOOD_NOTE_TEXT_I], "none", true) != -1)
	{
		//
	}
	else
	{
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_ICO]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_ICO]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 1)
	{
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta1]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta2]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta3]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Renta4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Renta4]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 2)
	{
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Job1]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Job2]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Job3]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Job4]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Exp1]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Exp2]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Exp3]);
		PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][Exp4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Job4]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Exp4]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Camionero]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescador]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Minero]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Basurero]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Camionero]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescador]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Minero]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Basurero]);
		Noti_Habilidad[playerid] = -1;
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 3)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoA]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_A]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 4)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][VerEST3]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 5)
	{		
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca2]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 6)
	{		
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Pesca1]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescando]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Pescando]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 7)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][CamioTD]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 8)
	{	
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Ico]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Name]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_Desc]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Graf_B4]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 9)
	{	
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD2]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD3]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Hambre_TD4]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Hambre]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Hambre]);
		HidePlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Sed]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_Sed]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 10)
	{	
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote1]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote2]);
	}
 	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 11)
	{	
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Informe1]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Informe2]);
	}
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 12)
	{	
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote1]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Recuperandote2]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 13)
	{
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay1]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay2]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay3]);
	  PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][PayDay4]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 14)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoXP]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_XP]);
	}
	
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 15)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Editor1]);
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][Editor2]);
	}

	if(GoodNoteData[playerid][pos][GOOD_NOTE_TYPE] == 16)
	{
		PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][EfectoP]);
		DestroyPlayerProgressBar(playerid, GoodNoteData[playerid][pos][Barra_P]);
	}
	
 	if(GoodNoteData[playerid][pos][GOOD_NOTE_NOTI] < 10){ TiempoNotificaciones[playerid][GoodNoteData[playerid][pos][GOOD_NOTE_NOTI]] = 0; }
	GoodNoteData[playerid][pos][GOOD_NOTE_NOTI] = 90;
	if(pos + 1 >= MAX_GOOD_NOTES) return 1;
	for(new j = pos + 1, time; j < MAX_GOOD_NOTES; j++)
	{
		if(GoodNoteData[playerid][j][GOOD_NOTE_ID] == 0) continue;
		if(GoodNoteData[playerid][j][GOOD_NOTE_TIME_OUT] == 0) {
			CrearNotificacion(
			playerid,GoodNoteData[playerid][j][GOOD_NOTE_TEXT_I], GoodNoteData[playerid][j][GOOD_NOTE_TEXT], 0,
			GoodNoteData[playerid][j][GOOD_NOTE_COL_TEXT], GoodNoteData[playerid][j][GOOD_NOTE_COL_BG], 0
			,300,GoodNoteData[playerid][j][GOOD_NOTE_TYPE],GoodNoteData[playerid][j][GOOD_NOTE_NOTI]);
		} else {
			time = GoodNoteData[playerid][j][GOOD_NOTE_TIME_OUT] - Timestamp();
			if(time > 0) {
				CrearNotificacion(
				playerid,GoodNoteData[playerid][j][GOOD_NOTE_TEXT_I], GoodNoteData[playerid][j][GOOD_NOTE_TEXT], time,
				GoodNoteData[playerid][j][GOOD_NOTE_COL_TEXT], GoodNoteData[playerid][j][GOOD_NOTE_COL_BG], 0
				,300,GoodNoteData[playerid][j][GOOD_NOTE_TYPE],GoodNoteData[playerid][j][GOOD_NOTE_NOTI]);
			}
		}
		DestroyGoodNote(playerid, GoodNoteData[playerid][j][GOOD_NOTE_ID]);
		return 1;
	}
	NotificacionesP(playerid);
	return 1;
}
stock gn_FindGoodNotePosById(playerid, goodnoteid)
{
	for(new i = 0; i < MAX_GOOD_NOTES; i++)
	{
		if(GoodNoteData[playerid][i][GOOD_NOTE_ID] == goodnoteid) return i;
	}
	return -1;
}
stock gn_GetFreeNotePos(playerid)
{
	for(new i = 0; i < MAX_GOOD_NOTES; i++)
	{
		if(GoodNoteData[playerid][i][GOOD_NOTE_ID] == 0) {
			return i;
		}
	}
	return -1;
}
stock gn_GetLineOfString(const string[])
{
	new lines_count = 1;
	lines_count = strlen(string)/23;
	return lines_count;
}


stock Desbug(string[])
{
	new
	szFixed[1024],
	iPos,
	iLen;
	for (iLen = strlen(string); iPos < iLen; iPos ++)
	switch (string[iPos])
	{
		case 'à':   szFixed[iPos] = 151;
		case 'á':   szFixed[iPos] = 152;
		case 'â':   szFixed[iPos] = 153;
		case 'ä':   szFixed[iPos] = 154;
		case 'À':   szFixed[iPos] = 128;
		case 'Á':   szFixed[iPos] = 129;
		case 'Â':   szFixed[iPos] = 130;
		case 'Ä':   szFixed[iPos] = 131;
		case 'è':   szFixed[iPos] = 157;
		case 'é':   szFixed[iPos] = 158;
		case 'ê':   szFixed[iPos] = 159;
		case 'ë':   szFixed[iPos] = 160;
		case 'È':   szFixed[iPos] = 134;
		case 'É':   szFixed[iPos] = 135;
		case 'Ê':   szFixed[iPos] = 136;
		case 'Ë':   szFixed[iPos] = 137;
		case 'ì':   szFixed[iPos] = 161;
		case 'í':   szFixed[iPos] = 162;
		case 'î':   szFixed[iPos] = 163;
		case 'ï':   szFixed[iPos] = 164;
		case 'Ì':   szFixed[iPos] = 138;
		case 'Í':   szFixed[iPos] = 139;
		case 'Î':   szFixed[iPos] = 140;
		case 'Ï':   szFixed[iPos] = 141;
		case 'ò':   szFixed[iPos] = 165;
		case 'ó':   szFixed[iPos] = 166;
		case 'ô':   szFixed[iPos] = 167;
		case 'ö':   szFixed[iPos] = 168;
		case 'Ò':   szFixed[iPos] = 142;
		case 'Ó':   szFixed[iPos] = 143;
		case 'Ô':   szFixed[iPos] = 144;
		case 'Ö':   szFixed[iPos] = 145;
		case 'ù':   szFixed[iPos] = 169;
		case 'ú':   szFixed[iPos] = 170;
		case 'û':   szFixed[iPos] = 171;
		case 'ü':   szFixed[iPos] = 172;
		case 'Ù':   szFixed[iPos] = 146;
		case 'Ú':   szFixed[iPos] = 147;
		case 'Û':   szFixed[iPos] = 148;
		case 'Ü':   szFixed[iPos] = 149;
		case 'ñ':   szFixed[iPos] = 174;
		case 'Ñ':   szFixed[iPos] = 173;
		case '¡':   szFixed[iPos] = 64;
		case '¿':   szFixed[iPos] = 175;
		case '`':   szFixed[iPos] = 177;
		case '&':   szFixed[iPos] = 38;
		default:    szFixed[iPos] = string[iPos];
	}
	return szFixed;
}