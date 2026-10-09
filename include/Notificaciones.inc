/*

	Author: knox
	Version: 1.2
	Data: 24.11.2018

*/

#if defined _GoodNote_included
	#endinput
#endif

#define _GoodNote_included

#if !defined MAX_GOOD_NOTES
	#define MAX_GOOD_NOTES 8
#endif

#if !defined MAX_GOOD_TEXT_LENGTH
	#define MAX_GOOD_TEXT_LENGTH 400
#endif

#define GN_DIRECTION_UP 1		/* /\ */
#define GN_DIRECTION_DOWN 2		/* \/ */

enum GOOD_NOTE_INFO
{
	GOOD_NOTE_ID,
	PlayerText:GOOD_NOTE_TD_BG,
	PlayerText:GOOD_NOTE_TD_TEXT,
	GOOD_NOTE_TEXT[MAX_GOOD_TEXT_LENGTH],
	GOOD_NOTE_TIME_OUT,
	GOOD_NOTE_TIMER,
	GOOD_NOTE_LINES,
	GOOD_NOTE_COL_BG,
	GOOD_NOTE_COL_TEXT
}

static
	GoodNoteData[MAX_PLAYERS][MAX_GOOD_NOTES][GOOD_NOTE_INFO],
	GoodNoteLastId = 0,
	Float:GoodNotePosX = 640.000000,
	Float:GoodNotePosY = 0.0,
	GoodNoteDirection = GN_DIRECTION_DOWN,
	GoodNoteSound = 1149
;

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

stock Desbug(const string[])
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


stock CreateGoodNote(playerid, const text[], time = 0, color = -1, bg_color = 255, sound = 1)
{
	static
		free_pos,
		lines_count,
		Float:size_bg,
		Float:pos_y
	;
	free_pos = gn_GetFreeNotePos(playerid);
	if(free_pos == -1) return 0;

	lines_count = gn_GetLineOfString(text);

	size_bg = 1.2 + (lines_count * 1.6);

	pos_y = GoodNotePosY;

	for(new i; i < free_pos; i++)
	{
		if(GoodNoteDirection == GN_DIRECTION_DOWN) {
			pos_y += 13.0 + (GoodNoteData[playerid][i][GOOD_NOTE_LINES] * 16.0) + 5.0;
		} else {
			pos_y -= 13.0 + (GoodNoteData[playerid][i][GOOD_NOTE_LINES] * 16.0) + 5.0;
		}
	}

	if(lines_count > 1 && GoodNoteDirection == GN_DIRECTION_UP) {
		pos_y -= (lines_count - 1) * 16.0;
	}

	GoodNoteData[playerid][free_pos][GOOD_NOTE_LINES] = lines_count;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_COL_BG] = bg_color;
	GoodNoteData[playerid][free_pos][GOOD_NOTE_COL_TEXT] = color;

	new TextoNotificacion[200];
	format(TextoNotificacion, sizeof(TextoNotificacion), "%s",text);

	new PlayerText:temp_td = CreatePlayerTextDraw(playerid, GoodNotePosX, pos_y, Desbug(TextoNotificacion));
	PlayerTextDrawLetterSize(playerid, temp_td, 0.271250, 1.383465);
	PlayerTextDrawTextSize(playerid, temp_td, 607.500000, size_bg);
	PlayerTextDrawAlignment(playerid, temp_td, 1);
	PlayerTextDrawColor(playerid, temp_td, color);
	PlayerTextDrawUseBox(playerid, temp_td, true);
	PlayerTextDrawBoxColor(playerid, temp_td, 0x13141499);
	PlayerTextDrawSetShadow(playerid, temp_td, 0);
	PlayerTextDrawSetOutline(playerid, temp_td, 0);
	PlayerTextDrawBackgroundColor(playerid, temp_td, 0);
	PlayerTextDrawFont(playerid, temp_td, 1);
	PlayerTextDrawSetProportional(playerid, temp_td, 1);
	PlayerTextDrawShow(playerid, temp_td);

	GoodNoteData[playerid][free_pos][GOOD_NOTE_TD_BG] = temp_td;

	format(GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT], MAX_GOOD_TEXT_LENGTH, text);

	temp_td = CreatePlayerTextDraw(playerid, GoodNotePosX + 1.5, pos_y + 6.0, GoodNoteData[playerid][free_pos][GOOD_NOTE_TEXT]);
	PlayerTextDrawLetterSize(playerid, temp_td, 0.230000, 1.500000);
	PlayerTextDrawTextSize(playerid, temp_td, 640.000000, 0.000000);
	PlayerTextDrawColor(playerid, temp_td, color);
	PlayerTextDrawFont(playerid, temp_td, 1);
	PlayerTextDrawSetShadow(playerid, temp_td, 0);
	//PlayerTextDrawShow(playerid, temp_td);

	GoodNoteLastId++;

	GoodNoteData[playerid][free_pos][GOOD_NOTE_TD_TEXT] = temp_td;

	if(time == 0) {
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIME_OUT] = 0;
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIMER] = 0;
	} else {
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIME_OUT] = time + gettime();
		GoodNoteData[playerid][free_pos][GOOD_NOTE_TIMER] = SetTimerEx("DestroyGoodNote", time * 1000, false, "dd", playerid, GoodNoteLastId);
	}

	if(sound) {
		PlayerPlaySound(playerid, GoodNoteSound, 0.0, 0.0, 0.0);
	}

	GoodNoteData[playerid][free_pos][GOOD_NOTE_ID] = GoodNoteLastId;
	return GoodNoteLastId;
}

forward DestroyGoodNote(playerid, goodnoteid);
public DestroyGoodNote(playerid, goodnoteid)
{
	static pos;
	pos = gn_FindGoodNotePosById(playerid, goodnoteid);
	if(pos == -1) return 0;
	if(GoodNoteData[playerid][pos][GOOD_NOTE_TIMER] != 0) {
		KillTimer(GoodNoteData[playerid][pos][GOOD_NOTE_TIMER]);
	}
	PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_BG]);
	PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_BG]);
	PlayerTextDrawHide(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_TEXT]);
	PlayerTextDrawDestroy(playerid, GoodNoteData[playerid][pos][GOOD_NOTE_TD_TEXT]);
	GoodNoteData[playerid][pos][GOOD_NOTE_ID] = 0;

	if(pos + 1 >= MAX_GOOD_NOTES) return 1;

	for(new j = pos + 1, time; j < MAX_GOOD_NOTES; j++)
	{
		if(GoodNoteData[playerid][j][GOOD_NOTE_ID] == 0) continue;
		if(GoodNoteData[playerid][j][GOOD_NOTE_TIME_OUT] == 0) {
			CreateGoodNote(
				playerid, GoodNoteData[playerid][j][GOOD_NOTE_TEXT], 0,
				GoodNoteData[playerid][j][GOOD_NOTE_COL_TEXT], GoodNoteData[playerid][j][GOOD_NOTE_COL_BG], 0
			);
		} else {
			time = GoodNoteData[playerid][j][GOOD_NOTE_TIME_OUT] - gettime();
			if(time > 0) {
				CreateGoodNote(
					playerid, GoodNoteData[playerid][j][GOOD_NOTE_TEXT], time,
					GoodNoteData[playerid][j][GOOD_NOTE_COL_TEXT], GoodNoteData[playerid][j][GOOD_NOTE_COL_BG], 0
				);
			}
		}
		DestroyGoodNote(playerid, GoodNoteData[playerid][j][GOOD_NOTE_ID]);
		return 1;
	}
	return 1;
}

static stock gn_FindGoodNotePosById(playerid, goodnoteid)
{
	for(new i = 0; i < MAX_GOOD_NOTES; i++)
	{
		if(GoodNoteData[playerid][i][GOOD_NOTE_ID] == goodnoteid) return i;
	}
	return -1;
}

static stock gn_GetFreeNotePos(playerid)
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
