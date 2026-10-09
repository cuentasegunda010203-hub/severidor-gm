//INVENTARIO - ADMINISTRADOR.

#include <YSI_Coding\y_hooks>

ActualizarInventario(playerid, bool:show = true)
{
	new color_1, color_2;

    if(PLAYER_TOYS[playerid][0][pt_MODEL_ID] != 0) PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][PrendasINV][0], PLAYER_TOYS[playerid][0][pt_MODEL_ID]);
    else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][PrendasINV][0], 19382);

	if(PLAYER_TOYS[playerid][1][pt_MODEL_ID] != 0) PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][PrendasINV][1], PLAYER_TOYS[playerid][1][pt_MODEL_ID]);
    else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][PrendasINV][1], 19382);

	if(PLAYER_TOYS[playerid][2][pt_MODEL_ID] != 0) PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][PrendasINV][2], PLAYER_TOYS[playerid][2][pt_MODEL_ID]);
	else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][PrendasINV][2], 19382);

	if(PLAYER_TOYS[playerid][3][pt_MODEL_ID] != 0) PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][PrendasINV][3], PLAYER_TOYS[playerid][3][pt_MODEL_ID]);
	else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][PrendasINV][3], 19382);

	if(PLAYER_INFO[playerid][vModelo] > 0)
	{
		PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][0], GetVehicleModel(autos[playerid]));
        GetVehicleColor(autos[playerid], color_1, color_2);
        PlayerTextDrawSetPreviewVehCol(playerid, PlayerTextdraws[playerid][AutoINV][0], color_1, color_2);
	}
	else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][0], 19382);
	
	if(PLAYER_INFO[playerid][vModelo2] > 0)
	{
		PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][1], GetVehicleModel(autos2[playerid]));
        GetVehicleColor(autos2[playerid], color_1, color_2);
        PlayerTextDrawSetPreviewVehCol(playerid, PlayerTextdraws[playerid][AutoINV][1], color_1, color_2);
	}
	else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][1], 19382);
	
	if(PLAYER_INFO[playerid][vModelo3] > 0)
	{
		PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][2], GetVehicleModel(autos3[playerid]));
        GetVehicleColor(autos3[playerid], color_1, color_2);
        PlayerTextDrawSetPreviewVehCol(playerid, PlayerTextdraws[playerid][AutoINV][2], color_1, color_2);
	}
	else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][2], 19382);
	
	if(PLAYER_INFO[playerid][vModelo4] > 0)
	{
		PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][3], GetVehicleModel(autos4[playerid]));
        GetVehicleColor(autos4[playerid], color_1, color_2);
        PlayerTextDrawSetPreviewVehCol(playerid, PlayerTextdraws[playerid][AutoINV][3], color_1, color_2);
	}
	else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][3], 19382);
	
	if(PLAYER_INFO[playerid][vModelo5] > 0)
	{
		PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][4], GetVehicleModel(autos5[playerid]));
        GetVehicleColor(autos5[playerid], color_1, color_2);
        PlayerTextDrawSetPreviewVehCol(playerid, PlayerTextdraws[playerid][AutoINV][4], color_1, color_2);
	}
	else PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][AutoINV][4], 19382);

	if(show)
	{
	    TextDrawShowForPlayer(playerid, Server.Textdraws[@BoxINV]);
		TextDrawShowForPlayer(playerid, Server.Textdraws[@XINVENTARIO]);

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][PrendasINV][0]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][PrendasINV][1]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][PrendasINV][2]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][PrendasINV][3]);

		PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][SkinINV], GetPlayerSkin(playerid));
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][SkinINV]);

	    PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][AutoINV][0]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][AutoINV][1]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][AutoINV][2]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][AutoINV][3]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][AutoINV][4]);
		SelectTextDraw(playerid,0xFFFFFFAA);
	}
	else
	{
	    TextDrawHideForPlayer(playerid, Server.Textdraws[@BoxINV]);
		TextDrawHideForPlayer(playerid, Server.Textdraws[@XINVENTARIO]);

		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][PrendasINV][0]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][PrendasINV][1]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][PrendasINV][2]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][PrendasINV][3]);

		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][SkinINV]);

	    PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][AutoINV][0]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][AutoINV][1]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][AutoINV][2]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][AutoINV][3]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][AutoINV][4]);
		CancelSelectTextDraw(playerid);
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if((newkeys & KEY_NO) && !(oldkeys & KEY_NO))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        ActualizarInventario(playerid, true);
	    }
	}
	return 1;
}

hook OnPlayerClickPlayerTD(yo,PlayerText:TD)
{
	//prendas
	if(TD == PlayerTextdraws[yo][PrendasINV][0])
	{
		if(PLAYER_TOYS[yo][0][pt_MODEL_ID] == 0) return 1;
		PLAYER_TEMP[yo][p_SELECTED_TOY_SLOT] = 0;
		ShowDialog(yo, DIALOG_TOYS_MENU);
		ActualizarInventario(yo, false);
	}
	if(TD == PlayerTextdraws[yo][PrendasINV][1])
	{
		if(PLAYER_TOYS[yo][1][pt_MODEL_ID] == 0) return 1;
		PLAYER_TEMP[yo][p_SELECTED_TOY_SLOT] = 1;
		ShowDialog(yo, DIALOG_TOYS_MENU);
		ActualizarInventario(yo, false);
	}
	if(TD == PlayerTextdraws[yo][PrendasINV][2])
	{
		if(PLAYER_TOYS[yo][2][pt_MODEL_ID] == 0) return 1;
		PLAYER_TEMP[yo][p_SELECTED_TOY_SLOT] = 2;
		ShowDialog(yo, DIALOG_TOYS_MENU);
		ActualizarInventario(yo, false);
	}
	if(TD == PlayerTextdraws[yo][PrendasINV][3])
	{
		if(PLAYER_TOYS[yo][3][pt_MODEL_ID] == 0) return 1;
		PLAYER_TEMP[yo][p_SELECTED_TOY_SLOT] = 3;
		ShowDialog(yo, DIALOG_TOYS_MENU);
		ActualizarInventario(yo, false);
	}
	//autos
	if(TD == PlayerTextdraws[yo][AutoINV][0])
	{
	    if(PLAYER_INFO[yo][vModelo] == 0) return 1;
 		ShowPlayerDialog(yo, DIALOG_INV_AUTOS, DIALOG_STYLE_LIST, "Funciones de tu vehiculo", "Buscar Auto\nMás opciones", ">>", "Cancelar");
		AutoSeleccionado[yo] = 1;
		ActualizarInventario(yo, false);
	}
	if(TD == PlayerTextdraws[yo][AutoINV][1])
	{
	    if(PLAYER_INFO[yo][vModelo2] == 0) return 1;
 		ShowPlayerDialog(yo, DIALOG_INV_AUTOS, DIALOG_STYLE_LIST, "Funciones de tu vehiculo", "Buscar Auto\nMás opciones", ">>", "Cancelar");
		AutoSeleccionado[yo] = 2;
		ActualizarInventario(yo, false);
	}
	if(TD == PlayerTextdraws[yo][AutoINV][2])
	{
	    if(PLAYER_INFO[yo][vModelo3] == 0) return 1;
 		ShowPlayerDialog(yo, DIALOG_INV_AUTOS, DIALOG_STYLE_LIST, "Funciones de tu vehiculo", "Buscar Auto\nMás opciones", ">>", "Cancelar");
		AutoSeleccionado[yo] = 3;
		ActualizarInventario(yo, false);
	}
	if(TD == PlayerTextdraws[yo][AutoINV][3])
	{
	    if(PLAYER_INFO[yo][vModelo4] == 0) return 1;
 		ShowPlayerDialog(yo, DIALOG_INV_AUTOS, DIALOG_STYLE_LIST, "Funciones de tu vehiculo", "Buscar Auto\nMás opciones", ">>", "Cancelar");
		AutoSeleccionado[yo] = 4;
		ActualizarInventario(yo, false);
	}
	if(TD == PlayerTextdraws[yo][AutoINV][4])
	{
	    if(PLAYER_INFO[yo][vModelo5] == 0) return 1;
 		ShowPlayerDialog(yo, DIALOG_INV_AUTOS, DIALOG_STYLE_LIST, "Funciones de tu vehiculo", "Buscar Auto\nMás opciones", ">>", "Cancelar");
		AutoSeleccionado[yo] = 5;
		ActualizarInventario(yo, false);
	}
	return 1;
}

hook OnPlayerClickTextDraw(playerid,Text:clickedid)
{
	if(_:clickedid != INVALID_TEXT_DRAW)
	{
	    if(clickedid == Server.Textdraws[@XINVENTARIO])
	    {
	        ActualizarInventario(playerid, false);
	    }
	}
	return 1;
}
