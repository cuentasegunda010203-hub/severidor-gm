
PoliciasCargos(playerid)
{
	new string[128];
	Congelar(playerid);
	PUSH(playerid, "Eres un delincuente, hemos llamado a la ~b~Policia");
	SetTimerEx("DescongelarCargos",60000,false,"d",playerid);
	format(string, sizeof(string), "[Central]{FFFFFF} %s ha sido detenido en la entrada de LS-SF ((Atrapenlo antes de que escape))", PLAYER_INFO[playerid][Nickname]);
	SendRadioMessage(1, -1, string,playerid,1);
	return 1;
}


UpdateEstadisticas(playerid){
	CerrarPayDay(playerid);
	new costo, reputacion;
	ObtenerReputacionCostoNivel(PLAYER_INFO[playerid][@Nivel] + 1, reputacion, costo);
	new string[64], cuentaterris;
	new banda = PLAYER_INFO[playerid][pFaccion];

	new Estadisticas[128];
	format(Estadisticas, sizeof(Estadisticas), "Estadisticas de tu cuenta");
	PlayerTextDrawSetString(playerid,ESTADISTICAS_TEXT[playerid],Estadisticas);

	PlayerTextDrawSetString(playerid,EST_NAMEUSUARIO[playerid],PLAYER_INFO[playerid][Nickname]);

	format(string, sizeof(string), "%d",PLAYER_INFO[playerid][@Nivel]);
	PlayerTextDrawSetString(playerid,EST_NAMENIVEL[playerid],string);

	new experiencia[64];
	format(experiencia, sizeof(experiencia), "%d/%d",PLAYER_INFO[playerid][jExperiencia],reputacion);
	PlayerTextDrawSetString(playerid,EST_NAMEEXP[playerid],experiencia);

	if(PLAYER_INFO[playerid][pTrabajo] > 0){
		PlayerTextDrawSetString(playerid,EST_NAMEJOB1[playerid],NombreTrabajo(PLAYER_INFO[playerid][pTrabajo]));
	} if(PLAYER_INFO[playerid][pTrabajo] == 0){
		PlayerTextDrawSetString(playerid,EST_NAMEJOB1[playerid],"Sin trabajo");
	}

	if(PLAYER_INFO[playerid][pTrabajo2] > 0){
		PlayerTextDrawSetString(playerid,EST_NAMEJOB2[playerid],NombreTrabajo(PLAYER_INFO[playerid][pTrabajo2]));
	} if(PLAYER_INFO[playerid][pTrabajo2] == 0){
		PlayerTextDrawSetString(playerid,EST_NAMEJOB2[playerid],"Sin trabajo");
	}


	if(PLAYER_INFO[playerid][pFaccion] == 0){
		PlayerTextDrawSetString(playerid,EST_NAMEBANDA[playerid],"Sin faccion");
		PlayerTextDrawSetString(playerid,EST_NAMERANGO[playerid],"_");
		PlayerTextDrawSetString(playerid,EST_NAMETERRITORIOS[playerid],"_");
	}
	

	if(PLAYER_INFO[playerid][pFaccion] > 0)
	{
		new pfacion[128];		
		format(pfacion, sizeof(pfacion), "%s",BandasInfo[banda][BNombre]);
		PlayerTextDrawSetString(playerid,EST_NAMEBANDA[playerid],pfacion);

		PlayerTextDrawSetString(playerid,EST_NAMERANGO[playerid],RangoBanda(banda, PLAYER_INFO[playerid][pRango]));
	    for(new t = 0; t != MAX_T; t ++)
		{
			if(TerritorioInfo[t][Territorio_Valido] && TerritorioInfo[t][Territorio_BandaID] != 0) { if(TerritorioInfo[t][Territorio_BandaID] == PLAYER_INFO[playerid][pFaccion]) cuentaterris++; }
		}	
		new strin222g[128];		
		format(strin222g, sizeof(strin222g), "%d",cuentaterris);

		PlayerTextDrawSetString(playerid,EST_NAMETERRITORIOS[playerid],strin222g);
	}
	if(PLAYER_INFO[playerid][EstadoCorreo] == 0)
	{
		  	PlayerTextDrawSetString(playerid,EST_CORREOVERIFICADO[playerid],"~r~/verificar correo");
	}
	if(PLAYER_INFO[playerid][EstadoCorreo] == 1)
	{
		  	PlayerTextDrawSetString(playerid,EST_CORREOVERIFICADO[playerid],"~g~Correo Verificado");
	}
	AbrirEstadisticas(playerid);
}

stock AbrirEstadisticas(playerid) {return RP_StatsShow(playerid);}


stock PayDayAbrierto(playerid){



	PlayerTextDrawShow(playerid, PAYDAY_BOXAMARILLO[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_FONDO[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_PAGODIARIO[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_BR[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_BR2[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_BANCARIO[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_GASTOS[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_INTERESES[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_BRPARALELO[playerid]);
	
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_BR3[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_BR4[playerid]);
	
	PlayerTextDrawShow(playerid, PAYDAY_PAGODIARIO[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_BR7[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_BANCARIO[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_GASTOS[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TEXT_BR6[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_INTERESES[playerid]);
	PlayerTextDrawShow(playerid, ESTADISTICAS_BOX7[playerid]);

	if(PLAYER_INFO[playerid][pFaccion] > 0){
		PlayerTextDrawShow(playerid, PAYDAY_TEXT_TERRITORIOS[playerid]);
		PlayerTextDrawShow(playerid, PAYDAY_TERRITORIOS[playerid]);
	}
	if(PLAYER_INFO[playerid][pDuty] == 1)
	{
		PlayerTextDrawShow(playerid, PAYDAY_TEXT_POLICIA[playerid]);						
		PlayerTextDrawSetString(playerid,PAYDAY_SUELDOPOLICIA[playerid],"$5.000");
	}
	PlayerTextDrawSetString(playerid,ESTADISTICAS_TEXT[playerid],"PAGO DIARIO RECIBIDO!");
	PlayerTextDrawShow(playerid, ESTADISTICAS_TEXT[playerid]);

	PlayerTextDrawShow(playerid, PAYDAY_TEXT_TOTAL[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_TOTAL[playerid]);
	PlayerTextDrawShow(playerid, PAYDAY_BR22[playerid]);
	if(PayDayActive == false)
	{
		SetTimerEx("CerrarPayDay", 5000, false,"d",playerid); 
	}
}
stock DestroyEst(playerid)
{
	PlayerTextDrawDestroy(playerid, BOXAMARILLO[playerid]);
	PlayerTextDrawDestroy(playerid, EST_BOX_FONDO[playerid]);
	PlayerTextDrawDestroy(playerid, EST_TEXT_USUARIO[playerid]);
	PlayerTextDrawDestroy(playerid, ESTADISTICA_BR[playerid]);
	PlayerTextDrawDestroy(playerid, ESTADISTICA_BR2[playerid]);
	PlayerTextDrawDestroy(playerid, EST_TEXT_NIVEL[playerid]);
	PlayerTextDrawDestroy(playerid, EST_TEXT_TRABAJO1[playerid]);
	PlayerTextDrawDestroy(playerid, EST_TEXT_TRABAJO2[playerid]);
	PlayerTextDrawDestroy(playerid, EST_SEPARADOR_PARALELO[playerid]);
	PlayerTextDrawDestroy(playerid, EST_TEXT_BANDA[playerid]);
	PlayerTextDrawDestroy(playerid, ESTADISTICA_BR3[playerid]);
	PlayerTextDrawDestroy(playerid, ESTADISTICA_BR4[playerid]);
	PlayerTextDrawDestroy(playerid, EST_TEXT_RANGO[playerid]);
	PlayerTextDrawDestroy(playerid, EST_TEXT_TERRITORIO[playerid]);
	PlayerTextDrawDestroy(playerid, ESTADISTICA_BR5[playerid]);
	PlayerTextDrawDestroy(playerid, EST_NAMEUSUARIO[playerid]);
	PlayerTextDrawDestroy(playerid, EST_NAMENIVEL[playerid]);
	PlayerTextDrawDestroy(playerid, ESTADISTICAS_BOX6[playerid]);
	PlayerTextDrawDestroy(playerid, EST_TEXT_EXP[playerid]);
	PlayerTextDrawDestroy(playerid, ESTADISTICAS_BOX7[playerid]);
	PlayerTextDrawDestroy(playerid, EST_NAMEEXP[playerid]);
	PlayerTextDrawDestroy(playerid, EST_NAMEJOB1[playerid]);
	PlayerTextDrawDestroy(playerid, EST_NAMEJOB2[playerid]);
	PlayerTextDrawDestroy(playerid, EST_NAMEBANDA[playerid]);
	PlayerTextDrawDestroy(playerid, ESTADISTICAS_TEXT[playerid]);
	PlayerTextDrawDestroy(playerid, EST_NAMERANGO[playerid]);
	PlayerTextDrawDestroy(playerid, EST_NAMETERRITORIOS[playerid]);
	PlayerTextDrawDestroy(playerid, EST_CORREOVERIFICADO[playerid]);
}
forward CerrarEstadisticas(playerid);
public CerrarEstadisticas(playerid)
{

    PlayerTextDrawHide(playerid, BOXAMARILLO[playerid]);
	PlayerTextDrawHide(playerid, EST_BOX_FONDO[playerid]);
	PlayerTextDrawHide(playerid, EST_TEXT_USUARIO[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICA_BR[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICA_BR2[playerid]);
	PlayerTextDrawHide(playerid, EST_TEXT_NIVEL[playerid]);
	PlayerTextDrawHide(playerid, EST_TEXT_TRABAJO1[playerid]);
	PlayerTextDrawHide(playerid, EST_TEXT_TRABAJO2[playerid]);
	PlayerTextDrawHide(playerid, EST_SEPARADOR_PARALELO[playerid]);
	PlayerTextDrawHide(playerid, EST_TEXT_BANDA[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICA_BR3[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICA_BR4[playerid]);
	PlayerTextDrawHide(playerid, EST_TEXT_RANGO[playerid]);
	PlayerTextDrawHide(playerid, EST_TEXT_TERRITORIO[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICA_BR5[playerid]);
	PlayerTextDrawHide(playerid, EST_NAMEUSUARIO[playerid]);
	PlayerTextDrawHide(playerid, EST_NAMENIVEL[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICAS_BOX6[playerid]);
	PlayerTextDrawHide(playerid, EST_TEXT_EXP[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICAS_BOX7[playerid]);
	PlayerTextDrawHide(playerid, EST_NAMEEXP[playerid]);
	PlayerTextDrawHide(playerid, EST_NAMEJOB1[playerid]);
	PlayerTextDrawHide(playerid, EST_NAMEJOB2[playerid]);
	PlayerTextDrawHide(playerid, EST_NAMEBANDA[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICAS_TEXT[playerid]);
	PlayerTextDrawHide(playerid, EST_NAMERANGO[playerid]);
	PlayerTextDrawHide(playerid, EST_NAMETERRITORIOS[playerid]);
	PlayerTextDrawHide(playerid, EST_CORREOVERIFICADO[playerid]);


    return 1;
}

forward CerrarPayDay(playerid);
public CerrarPayDay(playerid)
{
	PlayerTextDrawHide(playerid, PAYDAY_BOXAMARILLO[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_FONDO[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_PAGODIARIO[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_BR[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_BR2[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_BANCARIO[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_GASTOS[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_INTERESES[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_BRPARALELO[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_TERRITORIOS[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_BR3[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_BR4[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_POLICIA[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_PAGODIARIO[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_BR7[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_BANCARIO[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_GASTOS[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_BR6[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_INTERESES[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICAS_BOX7[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TERRITORIOS[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_SUELDOPOLICIA[playerid]);
	PlayerTextDrawHide(playerid, ESTADISTICAS_TEXT[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TEXT_TOTAL[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_TOTAL[playerid]);
	PlayerTextDrawHide(playerid, PAYDAY_BR22[playerid]);

}

///////////////////////////////////////////////////////////////////////////////

stock DestroyInv(playerid)
{
    return RP_InvDestroy(playerid);
}
forward Menu_AbrirInventario(playerid);
public Menu_AbrirInventario(playerid)
{
    return RP_InvOpen(playerid, 0);
}

////////////////////////////////////////////////////////////////////////////

stock UpdateInventario(playerid){
    return 1; // Los datos se refrescan al abrir el nuevo panel.
}

stock ComprarMercado(playerid) { return RB_Market(playerid); }

