		switch(dialogid)
	    {
	   	   case DIALOG_ARMAS_1:
	   	   {
		        switch(listitem)
				{
		   	   		case 0:
		   	   		{
		   	   			if(SiTieneArma(playerid,3) ||SiTieneArma(playerid,4) ||SiTieneArma(playerid,5) ||SiTieneArma(playerid,6) ||SiTieneArma(playerid,7) ||SiTieneArma(playerid,7) ||SiTieneArma(playerid,8) ||SiTieneArma(playerid,9) || SiTieneArma(playerid,14)|| SiTieneArma(playerid,15))
						{
							dialogs_ShowPlayerDialog(playerid, CLICK_VENDER_ARMA_INV, DIALOG_STYLE_INPUT, "Opciones de arma.", "Introduce la id del jugador al que deseas vender el arma seleccionada:", "Aceptar","Cancelar");
						}
		   	   		}
		   	   		case 1:
		   	   		{
						TirarArma_1(playerid);SendClientMessage(playerid, -1, "PASANDO DE LARGO POR AQUI");

						TirarArma(playerid);SendClientMessage(playerid, -1, "TIRARARMA EJECUTADO");
		   	   		}
	   	   		}
	   	   		return 1;
	   	   }
   	   	   case DIALOG_ARMAS_2:
	   	   {
		        switch(listitem)
				{
		   	   		case 0:
		   	   		{
		   	   			PUSH(playerid, "Proximamente.");
		   	   		}
		   	   		case 1:
		   	   		{
						TirarArma_2(playerid);
		   	   		}
	   	   		}
	   	   		return 1;
	   	   }
   	   	   case DIALOG_ARMAS_3:
	   	   {
		        switch(listitem)
				{
		   	   		case 0:
		   	   		{
		   	   			PUSH(playerid, "Proximamente.");
		   	   		}
		   	   		case 1:
		   	   		{
						TirarArma_3(playerid);
		   	   		}
	   	   		}
	   	   		return 1;
	   	   }
   	   	   case DIALOG_ARMAS_4:
	   	   {
		        switch(listitem)
				{
			   	   		case 0:
		   	   		{
		   	   			PUSH(playerid, "Proximamente.");
		   	   		}
		   	   		case 1:
		   	   		{
						TirarArma_4(playerid);
		   	   		}
	   	   		}
	   	   		return 1;
	   	   }
   	   	   case DIALOG_ARMAS_5:
	   	   {
		        switch(listitem)
				{
		   	   		case 0:
		   	   		{
		   	   			PUSH(playerid, "Proximamente.");
		   	   		}
		   	   		case 1:
		   	   		{
						TirarArma_5(playerid);
		   	   		}
	   	   		}
	   	   		return 1;
	   	   }
   	   	   case DIALOG_ARMAS_6:
	   	   {
		        switch(listitem)
				{
		   	   		case 0:
		   	   		{
		   	   			PUSH(playerid, "Proximamente.");
		   	   		}
		   	   		case 1:
		   	   		{
						TirarArma_6(playerid);
		   	   		}
	   	   		}
	   	   		return 1;
	   	   }