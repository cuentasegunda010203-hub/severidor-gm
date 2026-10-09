	if(clickedid == INVALID_TEXT_DRAW)
	{
	    switch(SelecTextDraw[playerid])
	    {
			case TD_INVENTARIO:
			{
			    Menu_CerrarInventario(playerid)
			}
	    }
		CancelSelectTextDraw(playerid);
	    return 1;
	}