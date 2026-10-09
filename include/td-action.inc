// textdraws-action.inc
// By: ForT: https://github.com/dimmyi
// 10/04/2021

#if defined actions_included
	#endinput
#endif
#define actions_included

#define ACTION_RESPONSE_NO_CHOOSE	(-1)	// Quando o jogador não escolher uma opção
#define ACTION_RESPONSE_NO			(0)		// Quando o jogador aperta a tecla N
#define ACTION_RESPONSE_YES			(1)		// Quando o jogador aperta a tecla Y

#define ACTION_TIMER_UPDATE_RATE	(80)

// Som ao mostrar as textdraws de ação.
// Definir 0 para nenhum som.
#define ACTION_SOUND_MENU			(0)

// Congelar o jogador ao mostrar as textdraws.
#define ACTION_FREEZE_PLAYER		(0)

#define Action:%0(%1,%2) \
	forward TDA_%0(%1,%2);public TDA_%0(%1,%2)

enum E_TEXTDRAW_ACTIONS
{
	tda_action_name[32],
	tda_action_timer,
	tda_action_ms,
	Float:tda_action_percent,
}
static g_PlayerActionsData[MAX_PLAYERS][E_TEXTDRAW_ACTIONS];

// Textdraws.
static PlayerText:g_PlayerActionsTD[MAX_PLAYERS][7];

// Selected design 1: compact Y/N hints, 220 px wide at 1920x1080.
static PlayerText:RP_ActionHintTD[MAX_PLAYERS][8];
stock RP_ActionHintsShow(playerid)
{
 for(new row;row<2;row++)
 {
  new base=row*4;
  new Float:y=117.0+float(row)*14.17;
  RP_ActionHintTD[playerid][base]=CreatePlayerTextDraw(playerid,554.0,y,"LD_SPAC:white");
  RP_ActionHintTD[playerid][base+1]=CreatePlayerTextDraw(playerid,554.0,y,"LD_SPAC:white");
  for(new part;part<2;part++)
  {
   new PlayerText:td=RP_ActionHintTD[playerid][base+part];
   PlayerTextDrawFont(playerid,td,4);
   PlayerTextDrawTextSize(playerid,td,part==0?73.33:1.0,12.5);
   PlayerTextDrawColor(playerid,td,part==0?0x111820ED:(row==0?0x68C993FF:0xC0C6CEFF));
   PlayerTextDrawSetOutline(playerid,td,0);
   PlayerTextDrawSetShadow(playerid,td,0);
  }
  RP_ActionHintTD[playerid][base+2]=CreatePlayerTextDraw(playerid,561.0,y+2.0,row==0?"Y":"N");
  RP_ActionHintTD[playerid][base+3]=CreatePlayerTextDraw(playerid,569.0,y+2.0,row==0?"Confirmar":"Cancelar");
  for(new part=2;part<4;part++)
  {
   new PlayerText:td=RP_ActionHintTD[playerid][base+part];
   PlayerTextDrawFont(playerid,td,1);
   PlayerTextDrawLetterSize(playerid,td,0.15,0.90);
   PlayerTextDrawColor(playerid,td,part==3?0xFFFFFFFF:(row==0?0x8CE2ABFF:0xD4D9DFFF));
   PlayerTextDrawSetProportional(playerid,td,true);
   PlayerTextDrawSetOutline(playerid,td,0);
   PlayerTextDrawSetShadow(playerid,td,1);
   PlayerTextDrawBackgroundColor(playerid,td,0x00000088);
  }
  for(new part;part<4;part++)
  {
   PlayerTextDrawSetSelectable(playerid,RP_ActionHintTD[playerid][base+part],false);
   PlayerTextDrawShow(playerid,RP_ActionHintTD[playerid][base+part]);
  }
 }
 return 1;
}
stock RP_ActionHintsDestroy(playerid)
{
 for(new i;i<8;i++) PlayerTextDrawDestroy(playerid,RP_ActionHintTD[playerid][i]);
 return 1;
}


public OnPlayerConnect(playerid)
{
	g_PlayerActionsData[playerid][tda_action_timer] = 0;

	#if defined Action_OnPlayerConnect
		return Action_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect Action_OnPlayerConnect
#if defined Action_OnPlayerConnect
	forward Action_OnPlayerConnect(playerid);
#endif

public OnPlayerDisconnect(playerid, reason)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		HideActionForPlayer(playerid);
	}

	#if defined Action_OnPlayerDisconnect
		return Action_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect Action_OnPlayerDisconnect
#if defined Action_OnPlayerDisconnect
	forward Action_OnPlayerDisconnect(playerid, reason);
#endif

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		if (newkeys & KEY_YES)
		{
			CallLocalFunction(g_PlayerActionsData[playerid][tda_action_name], "dd", playerid, ACTION_RESPONSE_YES);

			HideActionForPlayer(playerid);

			return 1;
		}
		if (newkeys & KEY_NO)
		{
			CallLocalFunction(g_PlayerActionsData[playerid][tda_action_name], "dd", playerid, ACTION_RESPONSE_NO);

			HideActionForPlayer(playerid);

			return 1;
		}
	}

	#if defined Action_OnPlayerKeyStateChange
		return Action_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif

#define OnPlayerKeyStateChange Action_OnPlayerKeyStateChange
#if defined Action_OnPlayerKeyStateChange
	forward Action_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif

forward OnPlayerUpdateAction(playerid);
public OnPlayerUpdateAction(playerid)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		g_PlayerActionsData[playerid][tda_action_percent] += (100.0 / (float(g_PlayerActionsData[playerid][tda_action_ms]) / float(ACTION_TIMER_UPDATE_RATE)));

		PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][6], 393.400024 - ((149.700104 / 100.0) * g_PlayerActionsData[playerid][tda_action_percent]), 0.000000);
		PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][6]);

		if (g_PlayerActionsData[playerid][tda_action_percent] >= 100.0)
		{
			CallLocalFunction(g_PlayerActionsData[playerid][tda_action_name], "dd", playerid, ACTION_RESPONSE_NO_CHOOSE);

			HideActionForPlayer(playerid);
		}
	}
}

#define ShowActionForPlayer(%0,%1, Internal_ShowActionForPlayer(%0,#%1,

stock Internal_ShowActionForPlayer(playerid, tda_callback[], tda_description[], tda_title[] = "AVISO", action_time = 10000)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		HideActionForPlayer(playerid);
	}
	RP_ActionHintsShow(playerid);
	format(g_PlayerActionsData[playerid][tda_action_name], 32, "TDA_%s", tda_callback);

	g_PlayerActionsData[playerid][tda_action_percent] = 0.0;
	g_PlayerActionsData[playerid][tda_action_ms] = action_time;
	g_PlayerActionsData[playerid][tda_action_timer] = SetTimerEx("OnPlayerUpdateAction", ACTION_TIMER_UPDATE_RATE, true, "d", playerid);

	g_PlayerActionsTD[playerid][0] = CreatePlayerTextDraw(playerid, 245.000000, 208.000000, "bg");
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][0], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][0], 0.500000, 7.320001);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][0], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][0], 168430280);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][0], 396.000000, 0.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][0]);

	g_PlayerActionsTD[playerid][1] = CreatePlayerTextDraw(playerid, 252.000000, 211.000000, tda_title);
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][1], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][1], 0.180000, 0.899999);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][1], -1);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][1], 1);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][1]);

	g_PlayerActionsTD[playerid][2] = CreatePlayerTextDraw(playerid, 254.000000, 218.000000, "i");
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][2], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][2], 0.166999, 1.780000);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][2], -156);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][2], 1);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][2]);

	g_PlayerActionsTD[playerid][3] = CreatePlayerTextDraw(playerid, 258.699981, 222.100006, tda_description);
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][3], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][3], 0.165999, 0.960000);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][3], -106);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][3], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][3], 0);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][3], 387.000000, 0.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][3]);

	g_PlayerActionsTD[playerid][4] = CreatePlayerTextDraw(playerid, 287.000000, 251.000000, "Y");
	PlayerTextDrawAlignment(playerid, g_PlayerActionsTD[playerid][4], 2);
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][4], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][4], 0.236000, 1.099999);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][4], -1);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][4], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][4], 434182655);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][4], 307.399902, 40.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][4]);

	g_PlayerActionsTD[playerid][5] = CreatePlayerTextDraw(playerid, 352.899993, 251.000000, "N");
	PlayerTextDrawAlignment(playerid, g_PlayerActionsTD[playerid][5], 2);
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][5], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][5], 0.190000, 1.099999);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][5], -1);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][5], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][5], -11842561);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][5], 374.000000, 40.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][5]);

	g_PlayerActionsTD[playerid][6] = CreatePlayerTextDraw(playerid, 245.699920, 274.699981, "progress");
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][6], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][6], 0.480000, -0.170000);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][6], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][6], -7929601);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][6], 395.400024, 0.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][6]);

	#if ACTION_SOUND_MENU != 0
		PlayerPlaySound(playerid, ACTION_SOUND_MENU, 0.0, 0.0, 0.0);
	#endif

	#if ACTION_FREEZE_PLAYER == 1
		TogglePlayerControllable(playerid, 0);
	#endif
}

stock HideActionForPlayer(playerid)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		RP_ActionHintsDestroy(playerid);
		KillTimer(g_PlayerActionsData[playerid][tda_action_timer]);

		g_PlayerActionsData[playerid][tda_action_timer] = 0;

		for (new i = 0; i < sizeof g_PlayerActionsTD[]; ++i)
		{
			PlayerTextDrawDestroy(playerid, g_PlayerActionsTD[playerid][i]);
		}
		#if ACTION_FREEZE_PLAYER == 1
			TogglePlayerControllable(playerid, 1);
		#endif
	}
}