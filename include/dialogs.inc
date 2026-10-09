#if defined _dialogs_included
    #endinput
#endif
#define _dialogs_included

#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

#define IsDialogOpen(%0,%1) (dl_playerDialogID[%0] == %1)
#define DLG(%0,%1,%2,%3,%4) forward dia_%0(%1,%2,%3,%4); public dia_%0(%1,%2,%3,%4)
	
new dl_playerDialogID[MAX_PLAYERS];

stock dialogs_ShowPlayerDialog(playerid, dialogid, style, const caption[], const info[], const button1[], const button2[])
{
    if(!IsPlayerConnected(playerid)) return 0;
	dl_playerDialogID[playerid] = dialogid;
	ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
	return 1;
}	


public OnPlayerConnect(playerid)
{
    dl_playerDialogID[playerid] = -1;
    #if defined dialogs_OnPlayerConnect
		return dialogs_OnPlayerConnect(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#if defined dialogs_OnPlayerConnect
	forward dialogs_OnPlayerConnect(playerid);
#endif
#define OnPlayerConnect dialogs_OnPlayerConnect
