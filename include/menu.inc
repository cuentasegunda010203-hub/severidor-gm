#if defined gmenu_included
#endinput
#endif
#define gmenu_included

// GMenu.inc - By Gammix - Last updated: 5 Sept, 2017

#if !defined MENU_SOUND_UPDOWN
#define MENU_SOUND_UPDOWN \
1054
#endif

#if !defined MENU_SOUND_CLOSE
#define MENU_SOUND_CLOSE \
1084
#endif

#if !defined MENU_SOUND_SELECT
#define MENU_SOUND_SELECT \
1083
#endif

#if !defined MENU_MAX_LISTITEMS
#define MENU_MAX_LISTITEMS \
24
#endif

#if !defined MENU_MAX_LISTITEM_SIZE
#define MENU_MAX_LISTITEM_SIZE \
128
#endif

#if !defined MENU_MAX_LISTITEMS_PERPAGE
#define MENU_MAX_LISTITEMS_PERPAGE \
16
#endif

#define MENU_COUNT_PAGES(%0,%1) \
(((%0) - 1) / (%1) + 1)

#define MENU:%0(%1) \
forward menu_%0(%1); public menu_%0(%1)

#define Menu:%0(%1) \
MENU:%0(%1)
enum
{
	MENU_RESPONSE_UP,
	MENU_RESPONSE_DOWN,
	MENU_RESPONSE_SELECT,
	MENU_RESPONSE_CLOSE
};

enum E_PLAYER_MENU
{
	E_PLAYER_MENU_ID[32],
	E_PLAYER_MENU_PAGE,
	E_PLAYER_MENU_LISTITEM,
	E_PLAYER_MENU_TOTAL_LISTITEMS,
	E_PLAYER_MENU_TICKCOUNT
};
new playerMenu[MAX_PLAYERS][E_PLAYER_MENU];

enum E_MENU_TEXTDRAW
{
	E_MENU_TEXTDRAW_LISTITEM_COUNT,
	E_MENU_TEXTDRAW_LISTITEMS[MENU_MAX_LISTITEMS_PERPAGE],
	E_MENU_TEXTDRAW_INFO_BOX,
	E_MENU_TEXTDRAW_INFO_ICON,
	E_MENU_TEXTDRAW_INFO_TEXT,
};
static menuPlayerTextDrawsID[MAX_PLAYERS][E_MENU_TEXTDRAW];
new PlayerText:menuPlayerTextDraws[MAX_PLAYERS][50];
new menuPlayerTextDrawsCount[MAX_PLAYERS];

new playerMenuListitems[MAX_PLAYERS][MENU_MAX_LISTITEMS][MENU_MAX_LISTITEM_SIZE char];
new playerMenuListitemsInfo[MAX_PLAYERS][MENU_MAX_LISTITEMS][MENU_MAX_LISTITEM_SIZE char];

static menuPlayerTextDrawsID2[MAX_PLAYERS][E_MENU_TEXTDRAW];
new PlayerText:menuPlayerTextDraws2[MAX_PLAYERS][51];
new menuPlayerTextDrawsCount2[MAX_PLAYERS];



static Internal_UpdateListitemInfo(playerid)
{
	new listitemid = (playerMenu[playerid][E_PLAYER_MENU_LISTITEM] + (playerMenu[playerid][E_PLAYER_MENU_PAGE] * MENU_MAX_LISTITEMS_PERPAGE));
	if (playerMenuListitemsInfo[playerid][listitemid]{0})
	{
		


	}
	else
	{
		


		PlayerTextDrawHide(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_BOX]]);
		PlayerTextDrawHide(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_ICON]]);
		PlayerTextDrawHide(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_TEXT]]);
	}
}

static Internal_UpdateListitems(playerid)
{
	new string[MENU_MAX_LISTITEM_SIZE];
	new listitem = ((playerMenu[playerid][E_PLAYER_MENU_LISTITEM] + (playerMenu[playerid][E_PLAYER_MENU_PAGE] * MENU_MAX_LISTITEMS_PERPAGE)) + 1);
	format(string, sizeof string, "", listitem, playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS]);
	PlayerTextDrawSetString(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEM_COUNT]], string);

	for (new i; i < MENU_MAX_LISTITEMS_PERPAGE; i++)
	{
		


		listitem = (i + (playerMenu[playerid][E_PLAYER_MENU_PAGE] * MENU_MAX_LISTITEMS_PERPAGE));
		if (listitem >= playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS])
		{
			


			PlayerTextDrawHide(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]]);
			continue;
		}

		if (i == playerMenu[playerid][E_PLAYER_MENU_LISTITEM])
		{
			


			PlayerTextDrawColor(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], -1);
			PlayerTextDrawBoxColor(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], 0x00080EFF);
		}
		else
		{
			


			PlayerTextDrawColor(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], -1);
			PlayerTextDrawBoxColor(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], 0x00080EFF);
		}

		strunpack(string, playerMenuListitems[playerid][listitem]);
		PlayerTextDrawSetString(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], string);
		PlayerTextDrawShow(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]]);
	 	strunpack(string, playerMenuListitemsInfo[playerid][listitem]);
		PlayerTextDrawSetString(playerid, menuPlayerTextDraws2[playerid][menuPlayerTextDrawsID2[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], string);
		PlayerTextDrawShow(playerid, menuPlayerTextDraws2[playerid][menuPlayerTextDrawsID2[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]]);

	}


	Internal_UpdateListitemInfo(playerid);
}

/*
native ShowPlayerMenu(playerid, menuid[], caption[], type[] = "Interaction Menu", captionTextColor = -926365441, captionBoxColor = -1522452536, captionSprite[] = "loadsc12:loadsc12");
*/
#define ShowPlayerMenu(%0,%1, \
Internal_ShowPlayerMenu(%0, #%1,

stock Internal_ShowPlayerMenu(playerid, const menuid[], const caption[], const type[] = "INTERACTION MENU", captionTextColor = 0x36393a66, captionBoxColor = 0xf8a65bFF, const captionSprite[] = "none",colortexto = 0xFFFFFFFF)
{
 	#pragma unused captionTextColor
	if (playerid < 0 || playerid >= MAX_PLAYERS)
	{
		


		return 0;
	}
	SelectTextDraw(playerid, 0xF85B5BFF);
	for (new i; i < menuPlayerTextDrawsCount[playerid]; i++)
	{
		PlayerTextDrawDestroy(playerid, menuPlayerTextDraws[playerid][i]);
	}
	menuPlayerTextDrawsCount[playerid] = 0;

 	for (new i; i < menuPlayerTextDrawsCount2[playerid]; i++)
	{
		PlayerTextDrawDestroy(playerid, menuPlayerTextDraws2[playerid][i]);
	}
	menuPlayerTextDrawsCount2[playerid] = 0;

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,12.000000, 150.000000-60.0, captionSprite);
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 255);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 4);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.000000, 3.500000);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], captionBoxColor);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawBoxColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], captionTextColor);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 139.000000, 50.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 115.000000-60.0, "_box");
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 255);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.000000, 4.000000);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0x00080EFF);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawBoxColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], captionBoxColor);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 165.000000, 0.000000);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]]);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++], 0);

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,16.000000, 121.000000-60.0, caption);
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 255);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.296875, 2.000000);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], colortexto);
	PlayerTextDrawAlignment(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 255);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 115.000000-60.0, "_box");
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.000000, 4.200000);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawBoxColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 165.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);
	
		

	for (new i; type[i] != EOS; i++)
	{

		toupper(type[i]);
	}
	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,14.000000, 143.000000-60.0, type);
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.189998, 1.000000);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0xf7f7f7ff);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,149.000000, 143.000000-60.0, "-/-");
	PlayerTextDrawAlignment(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 3);
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.189998, 1.000000);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0xf7f7f7ff);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]]);
	menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEM_COUNT] = menuPlayerTextDrawsCount[playerid]++;

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 156.000000-60.0, "_box");
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.159999, (1.999999 + (0.3 * (MENU_MAX_LISTITEMS_PERPAGE - 1))));
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawBoxColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0x00080EFF);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 165.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);
	

	for (new i; i < MENU_MAX_LISTITEMS_PERPAGE; i++)
	{
		menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, (166.000000-60.0 + (16 * i)), "_");
		PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
		PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
		PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.230000, 1.299999);
		PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], -1);
		PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
		PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
		PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	 	PlayerTextDrawBoxColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0x00080EFF);
		PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
		PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 165.000000, 16.000000);
		PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
		menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i] = menuPlayerTextDrawsCount[playerid]++;
	}
	
	for (new i; i < MENU_MAX_LISTITEMS_PERPAGE; i++)
	{
		menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]] = CreatePlayerTextDraw(playerid,165.000000, (166.000000-60.0 + (16 * i)), "_");
		PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], 0);
		PlayerTextDrawFont(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], 1);
		PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], 0.230000, 1.299999);
		PlayerTextDrawColor(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], -1);
		PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], 0);
		PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], 1);
		PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], 1);
		PlayerTextDrawUseBox(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], 0);
		PlayerTextDrawAlignment(playerid,menuPlayerTextDraws2[playerid][menuPlayerTextDrawsCount2[playerid]], 3);
		menuPlayerTextDrawsID2[playerid][E_MENU_TEXTDRAW_LISTITEMS][i] = menuPlayerTextDrawsCount2[playerid]++;
	}

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 279.000000-60.0, "_box");
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.159999, 1.999999);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawBoxColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 150.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_BOX] = menuPlayerTextDrawsCount[playerid]++;

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 279.000000-60.0, "_model");
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 5);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.159999, 0.899999);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], -1);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawBoxColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 10.000000, 10.000000);
	PlayerTextDrawSetPreviewModel(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1239);
	PlayerTextDrawSetPreviewRot(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.000000, 0.000000, 0.000000, 1.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_ICON] = menuPlayerTextDrawsCount[playerid]++;

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,23.000000, 279.000000-60.0, "Write listitem info here");
	PlayerTextDrawBackgroundColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.159999, 0.899999);
	PlayerTextDrawColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], -1);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawBoxColor(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 150.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_TEXT] = menuPlayerTextDrawsCount[playerid]++;

	format(playerMenu[playerid][E_PLAYER_MENU_ID], 32, menuid);
	playerMenu[playerid][E_PLAYER_MENU_PAGE] = 0;
	playerMenu[playerid][E_PLAYER_MENU_LISTITEM] = 0;
	playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS] = 0;
	playerMenu[playerid][E_PLAYER_MENU_TICKCOUNT] = 0;
	return 1;
}

/*
native AddPlayerMenuItem(playerid, text[], info[] = "");
*/
stock AddPlayerMenuItem(playerid, const text[], const info[] = "")
{
	if (playerid < 0 || playerid >= MAX_PLAYERS)
	{
		


		return 0;
	}

	if (!playerMenu[playerid][E_PLAYER_MENU_ID][0])
	{
		


		return 0;
	}

	if (playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS] == MENU_MAX_LISTITEMS)
	{
		


		return 0;
	}

	strpack(playerMenuListitems[playerid][playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS]], text, MENU_MAX_LISTITEM_SIZE);
	strpack(playerMenuListitemsInfo[playerid][playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS]], info, MENU_MAX_LISTITEM_SIZE);
	playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS]++;

	Internal_UpdateListitems(playerid);
	return 1;
}

/*
native HidePlayerMenu(playerid);
*/
stock HidePlayerMenu(playerid)
{
	if (playerid < 0 || playerid >= MAX_PLAYERS) return 0;
	
	for (new i; i < menuPlayerTextDrawsCount[playerid]; i++)
	{
		if(menuPlayerTextDraws[playerid][i] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid, menuPlayerTextDraws[playerid][i]);
	}
	
	for (new i; i < menuPlayerTextDrawsCount2[playerid]; i++)
	{
		if(menuPlayerTextDraws2[playerid][i] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid, menuPlayerTextDraws2[playerid][i]);
	}
	
	menuPlayerTextDrawsCount[playerid] = 0;
	menuPlayerTextDrawsCount2[playerid] = 0;
	playerMenu[playerid][E_PLAYER_MENU_ID][0] = EOS;
	TogglePlayerControllable(playerid, 1);
	TogglePlayerControllable(playerid, 1);
	return 1;
}

public OnPlayerConnect(playerid)
{
	menuPlayerTextDrawsCount[playerid] = 0;
	menuPlayerTextDrawsCount2[playerid] = 0;
	playerMenu[playerid][E_PLAYER_MENU_ID][0] = EOS;

	#if defined Menu_OnPlayerConnect
	return Menu_OnPlayerConnect(playerid);
	#else
	return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
#undef OnPlayerConnect
#else
#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Menu_OnPlayerConnect
#if defined Menu_OnPlayerConnect
forward Menu_OnPlayerConnect(playerid);
#endif


