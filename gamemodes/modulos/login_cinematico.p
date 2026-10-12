#include <YSI_Coding\y_hooks>
#define RP_LG_RED 0xDD343DFF
#define RP_LG_CONFIRM 32710
#define RP_LG_AGE 32711
#define RP_LG_SEX 32712
#define RP_LG_MENU 32713
#define RP_LG_CITY 32714
enum { LG_NONE, LG_LOGIN, LG_REGISTER, LG_CONFIRM, LG_EMAIL, LG_CHARACTER, LG_SAVING };
enum { LG_SHADE, LG_TINT, LG_PANEL, LG_LINE, LG_LOGO, LG_TAG, LG_TITLE, LG_SUB, LG_NAME_L, LG_NAME,
 LG_PASS_L, LG_PASS, LG_CONFIRM_L, LG_CONFIRM_F, LG_EMAIL_L, LG_EMAIL_F,
 LG_BUTTON, LG_FOOT, LG_SEX_L, LG_SEX_F, LG_PREV, LG_NEXT, LG_SKIN,
 LG_STAR1, LG_STAR2, LG_STAR3, LG_STAR4, LG_STAR5, LG_REGISTER_F,
 LG_SEX_PREV, LG_SEX_NEXT, LG_AGE_PREV, LG_AGE_NEXT,
 LG_CITY_L, LG_CITY_F, LG_CITY_PREV, LG_CITY_NEXT,
 LG_STAR_FILL_START, LG_BG_START = LG_STAR_FILL_START + 75, LG_TD_COUNT = LG_BG_START * 2 };
new PlayerText:RP_LGTD[MAX_PLAYERS][LG_TD_COUNT], bool:RP_LGCreated[MAX_PLAYERS][LG_TD_COUNT];
new RP_LGStage[MAX_PLAYERS], RP_LGToken[MAX_PLAYERS], RP_LGActor[MAX_PLAYERS], RP_LGFloor[MAX_PLAYERS];
new RP_LGSceneVersion[MAX_PLAYERS], RP_LGAnchor[MAX_PLAYERS];
new RP_LGSex[MAX_PLAYERS], RP_LGSkin[MAX_PLAYERS], RP_LGAge[MAX_PLAYERS], RP_LGCity[MAX_PLAYERS];
new bool:RP_LGPasswordOK[MAX_PLAYERS], bool:RP_LGMailBusy[MAX_PLAYERS], bool:RP_LGAuthBusy[MAX_PLAYERS];
new bool:RP_LGAutoAllowed[MAX_PLAYERS], bool:RP_LGSpectating[MAX_PLAYERS];
static const RP_LGMale[] = {26,7,19,20,23,46,60,101,170,180};
static const RP_LGFemale[] = {11,12,40,41,55,56,69,91,93,148};
#include "modulos/login_recorrido.p"
// Account panel extras reuse the reserved star slots; the creator is unchanged.
enum { LG_INFO_BRAND=LG_STAR_FILL_START, LG_INFO_ROLE, LG_INFO_TAG,
 LG_INFO_ONLINE_L, LG_INFO_ONLINE, LG_INFO_ACCOUNTS_L, LG_INFO_ACCOUNTS,
 LG_INFO_CHARACTERS_L, LG_INFO_CHARACTERS, LG_INFO_RECORD_L, LG_INFO_RECORD,
 LG_INFO_NOTICE, LG_INFO_FOOTER, LG_INFO_HELP, LG_INFO_DISCORD_ICON,
 LG_INFO_DISCORD, LG_INFO_DISCORD_SUB, LG_INFO_WEB_ICON, LG_INFO_WEB, LG_INFO_WEB_SUB };
new RP_LGAccountCount=-1, RP_LGCharacterCount=-1, RP_LGRecord;
new RP_LGStatsNextQuery, bool:RP_LGStatsBusy;
stock RP_LGPanelText(p,slot,Float:x,Float:y,const text[],Float:w=0.15,Float:h=0.85,color=-1,bool:center=false,font=1) {
 if(!RP_LGText(p,slot,x,y,text,w,h,color)) return 0;
 PlayerTextDrawHide(p,RP_LGTD[p][slot]);
 PlayerTextDrawFont(p,RP_LGTD[p][slot],font);
 PlayerTextDrawAlignment(p,RP_LGTD[p][slot],center?2:1);
 PlayerTextDrawShow(p,RP_LGTD[p][slot]);return 1;
}
stock RP_LGOnline() {
 new count;
 for(new i;i<MAX_PLAYERS;i++) if(IsPlayerConnected(i) && !IsPlayerNPC(i)) count++;
 if(count>RP_LGRecord) RP_LGRecord=count;
 return count;
}
stock RP_LGPanelNumbers(p) {
 if(RP_LGStage[p]==LG_NONE || RP_LGStage[p]==LG_CHARACTER || RP_LGStage[p]==LG_SAVING || !RP_LGCreated[p][LG_INFO_ONLINE]) return 0;
 new text[24];format(text,sizeof text,"%d",RP_LGOnline());
 PlayerTextDrawSetString(p,RP_LGTD[p][LG_INFO_ONLINE],text);
 if(RP_LGAccountCount<0) text="...";else format(text,sizeof text,"%d",RP_LGAccountCount);
 PlayerTextDrawSetString(p,RP_LGTD[p][LG_INFO_ACCOUNTS],text);
 if(RP_LGCharacterCount<0) text="...";else format(text,sizeof text,"%d",RP_LGCharacterCount);
 PlayerTextDrawSetString(p,RP_LGTD[p][LG_INFO_CHARACTERS],text);
 format(text,sizeof text,"%d",RP_LGRecord);PlayerTextDrawSetString(p,RP_LGTD[p][LG_INFO_RECORD],text);
 return 1;
}
forward RP_LGStatsLoaded();
public RP_LGStatsLoaded() {
 RP_LGStatsBusy=false;
 if(cache_num_rows()) {
  cache_get_value_name_int(0,"accounts",RP_LGAccountCount);
  cache_get_value_name_int(0,"characters",RP_LGCharacterCount);
 }
 for(new p;p<MAX_PLAYERS;p++) if(IsPlayerConnected(p) && !IsPlayerNPC(p)) RP_LGPanelNumbers(p);
 return 1;
}
stock RP_LGRequestStats() {
 if(RP_LGStatsBusy || gettime()<RP_LGStatsNextQuery) return 0;
 RP_LGStatsBusy=true;RP_LGStatsNextQuery=gettime()+60;
 mysql_tquery(handle_db,"SELECT COUNT(*) AS accounts, COALESCE(SUM(Edad >= 14),0) AS characters FROM usuarios","RP_LGStatsLoaded");
 return 1;
}
forward RP_LGStatsTick();
public RP_LGStatsTick() {
 RP_LGOnline();
 for(new p;p<MAX_PLAYERS;p++) if(IsPlayerConnected(p) && !IsPlayerNPC(p)) RP_LGPanelNumbers(p);
 return 1;
}
stock RP_LGValid(p) { return p>=0 && p<MAX_PLAYERS && IsPlayerConnected(p) && !IsPlayerNPC(p); }
stock RP_LGDestroyTD(p) {
 CancelSelectTextDraw(p);
 for(new i;i<LG_TD_COUNT;i++) if(RP_LGCreated[p][i]) { PlayerTextDrawDestroy(p,RP_LGTD[p][i]); RP_LGCreated[p][i]=false; }
 return 1;
}
stock RP_LGDestroyScene(p) {
 RP_LGTourStop(p);
 if(RP_LGAnchor[p] && (GetVehicleModel(RP_LGAnchor[p]) != 0)) DestroyVehicle(RP_LGAnchor[p]);
 RP_LGAnchor[p]=0;
 if(RP_LGActor[p] && IsValidDynamicActor(RP_LGActor[p])) DestroyDynamicActor(RP_LGActor[p]);
 if(RP_LGFloor[p] && IsValidDynamicObject(RP_LGFloor[p])) DestroyDynamicObject(RP_LGFloor[p]);
 RP_LGActor[p]=0;RP_LGFloor[p]=0;return 1;
}
stock RP_LGHide(p) {
 RP_LGMusicStop(p);
 RP_LGSceneVersion[p]++;RP_LGStage[p]=LG_NONE;RP_LGToken[p]++;RP_LGMailBusy[p]=false;RP_LGAuthBusy[p]=false;RP_LGAutoAllowed[p]=false;
 RP_LGDestroyTD(p);RP_LGDestroyScene(p);return 1;
}
// Scale the whole interface, including sprite rectangles and click regions.
// Full-screen shades retain the viewport dimensions.
stock Float:RP_LGUIScale(p,slot) {
 if(slot==LG_SHADE) return 1.0;
 return RP_LGStage[p]==LG_CHARACTER ? 0.72 : 0.90;
}
stock RP_LGText(p,slot,Float:x,Float:y,const text[],Float:w=0.21,Float:h=1.05,color=-1) {
 new Float:scale=RP_LGUIScale(p,slot);
 if(scale!=1.0) {
  new Float:anchorX=RP_LGStage[p]==LG_CHARACTER ? 19.0 : 320.0;
  new Float:anchorY=RP_LGStage[p]==LG_CHARACTER ? 380.0 : 240.0;
  x=anchorX+(x-anchorX)*scale;y=anchorY+(y-anchorY)*scale;
  w*=scale;h*=scale;
 }
 RP_LGTD[p][slot]=CreatePlayerTextDraw(p,x,y,text);
 if(RP_LGTD[p][slot]==PlayerText:INVALID_TEXT_DRAW) return 0;
 RP_LGCreated[p][slot]=true;
 PlayerTextDrawFont(p,RP_LGTD[p][slot],2);PlayerTextDrawLetterSize(p,RP_LGTD[p][slot],w,h);
 PlayerTextDrawColor(p,RP_LGTD[p][slot],color);PlayerTextDrawSetOutline(p,RP_LGTD[p][slot],0);
 PlayerTextDrawSetShadow(p,RP_LGTD[p][slot],0);PlayerTextDrawSetProportional(p,RP_LGTD[p][slot],1);
 PlayerTextDrawShow(p,RP_LGTD[p][slot]);return 1;
}
// Solid native sprite rectangles: blank text boxes can disappear in SA-MP.
stock RP_LGRect(p,slot,Float:x,Float:y,Float:width,Float:height,color) {
 if(!RP_LGText(p,slot,x,y,"LD_SPAC:white")) return 0;
 PlayerTextDrawHide(p,RP_LGTD[p][slot]);
 PlayerTextDrawFont(p,RP_LGTD[p][slot],4);
 PlayerTextDrawColor(p,RP_LGTD[p][slot],color);
 new Float:scale=RP_LGUIScale(p,slot);
 PlayerTextDrawTextSize(p,RP_LGTD[p][slot],width*scale,height*scale);
 PlayerTextDrawShow(p,RP_LGTD[p][slot]);return 1;
}
stock RP_LGBox(p,slot,Float:x,Float:y,Float:width,Float:height,color,const text[]=" ",bool:click=false) {
 if(text[0]==' ' && text[1]==EOS) return RP_LGRect(p,slot,x,y,width,height,color);
 RP_LGRect(p,slot+LG_BG_START,x,y,width,height,color);
 new bool:account=RP_LGStage[p]!=LG_CHARACTER;
 new bool:left=account && (slot==LG_NAME || slot==LG_PASS);
 if(!RP_LGText(p,slot,left?x+7.0:x+width/2.0,y+(account?7.0:2.0),text,account?0.17:0.21,account?0.85:1.05)) return 0;
 PlayerTextDrawHide(p,RP_LGTD[p][slot]);PlayerTextDrawAlignment(p,RP_LGTD[p][slot],2);
 new Float:scale=RP_LGUIScale(p,slot);
 if(left) {
  PlayerTextDrawFont(p,RP_LGTD[p][slot],1);
  PlayerTextDrawAlignment(p,RP_LGTD[p][slot],1);
  PlayerTextDrawTextSize(p,RP_LGTD[p][slot],320.0+(x+width-320.0)*scale,height*scale);
 } else {
  if(account && slot==LG_REGISTER_F) PlayerTextDrawFont(p,RP_LGTD[p][slot],1);
  PlayerTextDrawTextSize(p,RP_LGTD[p][slot],height*scale,width*scale);
 }
 PlayerTextDrawSetSelectable(p,RP_LGTD[p][slot],click);
 PlayerTextDrawShow(p,RP_LGTD[p][slot]);return 1;
}
// End spectator selection only when the existing account loader is ready to spawn.
stock RP_LGSpawnReady(p) {
 if(RP_LGSpectating[p]) {RP_LGSpectating[p]=false;return TogglePlayerSpectating(p,false);}
 return SpawnPlayer(p);
}
stock RP_LGModel(p) { return RP_LGSex[p]==2 ? RP_LGFemale[RP_LGSkin[p]] : RP_LGMale[RP_LGSkin[p]]; }
// The classic creator chooses the initial position saved by registration.
stock RP_LGSpawnPosition(p, &Float:x, &Float:y, &Float:z) {
 switch(RP_LGCity[p]) {
  case 1: {x=-1985.7;y=138.0;z=27.6875;}
  case 2: {x=2106.5540;y=2203.8977;z=10.8203;}
  default: {x=1714.7008;y=-1898.6792;z=13.5666;}
 }
 return 1;
}
stock RP_LGClassicRow(p,Float:y,labelSlot,valueSlot,prevSlot,nextSlot,const label[],const value[],bool:click=false) {
 RP_LGText(p,labelSlot,29.0,y,label,0.17,0.9,0xBABDC6FF);
 RP_LGBox(p,prevSlot,29.0,y+14.0,22.0,23.0,0x303239FF,"<",true);
 RP_LGBox(p,valueSlot,55.0,y+14.0,143.0,23.0,0x22242AFF,value,click);
 RP_LGBox(p,nextSlot,202.0,y+14.0,22.0,23.0,RP_LG_RED,">",true);
 return 1;
}
stock RP_LGRender(p,bool:select=true) {
 RP_LGDestroyTD(p);
 if(RP_LGStage[p]==LG_CHARACTER) {
  RP_LGRect(p,LG_SHADE,0.0,0.0,640.0,480.0,0x00000033);
  RP_LGRect(p,LG_PANEL,19.0,177.0,215.0,293.0,0x17181CF5);
  RP_LGText(p,LG_TITLE,29.0,187.0,"Creando tu personaje",0.25,1.3);
  RP_LGClassicRow(p,214.0,LG_SEX_L,LG_SEX_F,LG_SEX_PREV,LG_SEX_NEXT,"GENERO",RP_LGSex[p]==2?"FEMENINO":"MASCULINO",true);
  new text[48];format(text,sizeof text,"%d ANOS",RP_LGAge[p]);
  RP_LGClassicRow(p,263.0,LG_PASS_L,LG_PASS,LG_AGE_PREV,LG_AGE_NEXT,"EDAD",text,true);
  format(text,sizeof text,"%d [%d/10]",RP_LGModel(p),RP_LGSkin[p]+1);
  RP_LGClassicRow(p,312.0,LG_NAME_L,LG_SKIN,LG_PREV,LG_NEXT,"ROPA",text);
  switch(RP_LGCity[p]) {
   case 1: text="SAN FIERRO";
   case 2: text="LAS VENTURAS";
   default: text="LOS SANTOS";
  }
  RP_LGClassicRow(p,361.0,LG_CITY_L,LG_CITY_F,LG_CITY_PREV,LG_CITY_NEXT,"CIUDAD",text,true);
  RP_LGBox(p,LG_BUTTON,29.0,418.0,195.0,27.0,RP_LG_RED,"FINALIZAR PERSONAJE",true);
 } else {
  RP_LGRect(p,LG_SHADE,0.0,0.0,640.0,480.0,0x00000018);
  RP_LGRect(p,LG_PANEL,203.33,117.78,233.34,224.44,0x0B0C10ED);
  RP_LGRect(p,LG_LINE,203.33,117.78,233.34,1.33,RP_LG_RED);
  RP_LGRect(p,LG_TINT,327.0,122.22,0.33,215.55,RP_LG_RED);
  RP_LGPanelText(p,LG_TITLE,265.17,128.89,"Nos alegra tenerte~n~con nosotros!",0.25,1.25,-1,true);
  RP_LGPanelText(p,LG_NAME_L,212.0,166.00,"NOMBRE DE USUARIO",0.13,0.70);
  RP_LGBox(p,LG_NAME,212.0,178.00,106.33,18.67,0x24272DFF,PLAYER_INFO[p][Nickname]);
  RP_LGPanelText(p,LG_PASS_L,212.0,204.00,"CONTRASENA",0.13,0.70);
  RP_LGBox(p,LG_PASS,212.0,216.00,106.33,18.67,0x24272DFF,RP_LGPasswordOK[p]?"********":"Escribe tu contrasena",true);
  RP_LGBox(p,LG_BUTTON,212.0,244.00,106.33,18.22,RP_LG_RED,RP_LGStage[p]==LG_LOGIN?"ENTRAR AL SERVIDOR":"REGISTRARSE",true);
  RP_LGBox(p,LG_REGISTER_F,212.0,265.33,106.33,18.22,0x20212AFF,"CREAR UNA CUENTA",true);
  RP_LGPanelText(p,LG_INFO_HELP,265.17,289.00,"Necesitas ayuda con tu cuenta?",0.12,0.65,0xA3A4ADFF,true);
  RP_LGPanelText(p,LG_INFO_DISCORD_ICON,216.5,304.00,"D",0.15,0.9,0xE45963FF);
  RP_LGPanelText(p,LG_INFO_DISCORD,226.0,303.00,"Discord",0.15,0.85);
  RP_LGPanelText(p,LG_INFO_DISCORD_SUB,226.0,313.00,"Comunidad del servidor",0.11,0.65,0x9799A3FF);
  RP_LGPanelText(p,LG_INFO_WEB_ICON,216.5,323.00,"W",0.15,0.9,0xE45963FF);
  RP_LGPanelText(p,LG_INFO_WEB,226.0,322.00,"Web",0.15,0.85);
  RP_LGPanelText(p,LG_INFO_WEB_SUB,226.0,332.00,"Informacion y novedades",0.11,0.65,0x9799A3FF);
  RP_LGPanelText(p,LG_INFO_BRAND,381.5,132.0,"NEX~r~US",0.60,3.3,-1,true,3);
  RP_LGPanelText(p,LG_INFO_ROLE,381.5,166.00,"ROLEPLAY",0.30,1.35,-1,true);
  RP_LGPanelText(p,LG_INFO_TAG,381.5,183.00,"TU HISTORIA EMPIEZA AQUI",0.10,0.60,0xAAAAAAFF,true);
  RP_LGPanelText(p,LG_INFO_ONLINE_L,335.0,204.00,"Jugadores en linea",0.16,0.90);
  RP_LGPanelText(p,LG_INFO_ONLINE,338.0,216.00,"...",0.21,1.0,0xE45963FF);
  RP_LGPanelText(p,LG_INFO_ACCOUNTS_L,335.0,234.00,"Cuentas registradas",0.16,0.90);
  RP_LGPanelText(p,LG_INFO_ACCOUNTS,338.0,246.00,"...",0.21,1.0,0xE45963FF);
  RP_LGPanelText(p,LG_INFO_CHARACTERS_L,335.0,264.00,"Personajes creados",0.16,0.90);
  RP_LGPanelText(p,LG_INFO_CHARACTERS,338.0,276.00,"...",0.21,1.0,0xE45963FF);
  RP_LGPanelText(p,LG_INFO_RECORD_L,335.0,294.00,"Record desde el reinicio",0.15,0.90);
  RP_LGPanelText(p,LG_INFO_RECORD,338.0,306.00,"...",0.21,1.0,0xE45963FF);
  RP_LGPanelText(p,LG_INFO_NOTICE,335.0,328.00,"BIENVENIDO A LOS SANTOS",0.10,0.65,0xE45963FF);
  RP_LGPanelNumbers(p);RP_LGRequestStats();
 }
 if(select) SelectTextDraw(p,0xFF6677FF);return 1;
}
// Camera RPCs immediately after entering spectator mode can be overwritten by
// client initialization. Reapply the fixed scene after that initialization.
forward RP_LGSceneReady(p,token,version);
public RP_LGSceneReady(p,token,version) {
 if(!RP_LGValid(p) || RP_LGToken[p]!=token || RP_LGSceneVersion[p]!=version || RP_LGStage[p]==LG_NONE) return 0;
 SetPlayerInterior(p,0);SetPlayerVirtualWorld(p,70000+p);
 SetPlayerTime(p,RP_LGStage[p]==LG_CHARACTER?19:12,0);SetPlayerWeather(p,2);
 if(RP_LGStage[p]==LG_CHARACTER || RP_LGStage[p]==LG_SAVING) {
  InterpolateCameraPos(p,1481.0,-1747.0,15.1,1481.05,-1747.0,15.1,1000,CAMERA_MOVE);
  InterpolateCameraLookAt(p,1483.0,-1740.0,14.4,1483.0,-1740.0,14.4,1000,CAMERA_MOVE);
  Streamer_UpdateEx(p,1481.0,-1740.0,13.55,70000+p,0);
 } else {
  RP_LGTourStartScene(p);
 }
 return 1;
}
// A private RC vehicle at street level supplies the spectator streaming target.
// Keep it below the camera at street level to stream the visible city blocks.
// It is never shared with another login and is removed on login/disconnect.
stock RP_LGAnchorScene(p) {
 if(!RP_LGAnchor[p] || !(GetVehicleModel(RP_LGAnchor[p]) != 0)) {
  new Float:x=1685.0,Float:y=-2317.0,Float:z=13.6;
  if(RP_LGStage[p]==LG_CHARACTER) {x=1483.0;y=-1740.0;z=13.6;}
  new vehicle=CreateVehicle(441,x,y,z,0.0,0,0,-1);
  if(vehicle==INVALID_VEHICLE_ID || vehicle==0) return 0;
  RP_LGAnchor[p]=vehicle;
  SetVehicleVirtualWorld(vehicle,70000+p);LinkVehicleToInterior(vehicle,0);
 }
 PlayerSpectateVehicle(p,RP_LGAnchor[p],SPECTATE_MODE_FIXED);
 return 1;
}
stock RP_LGQueueScene(p) {
 RP_LGAnchorScene(p);
 RP_LGSceneVersion[p]++;
 RP_LGSceneReady(p,RP_LGToken[p],RP_LGSceneVersion[p]);
 SetTimerEx("RP_LGSceneReady",500,false,"iii",p,RP_LGToken[p],RP_LGSceneVersion[p]);
 SetTimerEx("RP_LGSceneReady",1500,false,"iii",p,RP_LGToken[p],RP_LGSceneVersion[p]);
 return 1;
}
stock RP_LGAccountScene(p) {
 RP_LGDestroyScene(p);SetPlayerInterior(p,0);SetPlayerVirtualWorld(p,70000+p);
 SetPlayerPos(p,1685.0,-2317.0,13.6);
 if(!RP_LGSpectating[p]) {RP_LGSpectating[p]=true;TogglePlayerSpectating(p,true);}
 return RP_LGQueueScene(p);
}
stock RP_LGShowAccount(p,mode) {
 if(!RP_LGValid(p) || JugadorLogeado[p]==1) return 1;
 RP_LGStage[p]=mode;RP_LGToken[p]++;RP_LGMailBusy[p]=false;RP_LGPasswordOK[p]=false;RP_LGAuthBusy[p]=false;RP_LGAutoAllowed[p]=false;
 if(mode==LG_REGISTER) {PLAYER_INFO[p][pPassword][0]=EOS;PLAYER_INFO[p][pEmail][0]=EOS;}
 RP_LGAccountScene(p);RP_LGRender(p);return 1;
}
stock RP_LGUpdateActor(p) {
 if(RP_LGActor[p] && IsValidDynamicActor(RP_LGActor[p])) DestroyDynamicActor(RP_LGActor[p]);
 RP_LGActor[p]=CreateDynamicActor(RP_LGModel(p),1481.0,-1740.0,13.55,180.0,1,100.0,70000+p,0,p);
 Streamer_UpdateEx(p,1481.0,-1740.0,13.55,70000+p,0,STREAMER_TYPE_ACTOR);return 1;
}
stock RP_LGShowCharacter(p) {
 RP_LGMusicStop(p);
 if(!RP_LGValid(p) || !RP_LGPasswordOK[p] || !strlen(PLAYER_INFO[p][pEmail])) return 1;
 RP_LGStage[p]=LG_CHARACTER;RP_LGSex[p]=1;RP_LGSkin[p]=0;RP_LGAge[p]=18;RP_LGCity[p]=0;
 RP_LGDestroyScene(p);
 SetPlayerPos(p,1481.0,-1746.0,14.5);
 RP_LGQueueScene(p);
 Streamer_Update(p,STREAMER_TYPE_OBJECT);RP_LGUpdateActor(p);RP_LGRender(p);return 1;
}
stock RP_LGInput(p,id,style,const title[],const body[],const accept[]="Continuar") {
 CancelSelectTextDraw(p);return dialogs_ShowPlayerDialog(p,id,style,title,body,accept,"Volver");
}
stock RP_LGPassword(p) {
 if(RP_LGStage[p]==LG_LOGIN) return RP_LGInput(p,LOGIN,DIALOG_STYLE_PASSWORD,"{D92732}Nexus / INGRESAR","Introduce la contrasena de tu cuenta.","Entrar");
 RP_LGPasswordOK[p]=false;RP_LGStage[p]=LG_REGISTER;
 return RP_LGInput(p,REGISTRO,DIALOG_STYLE_PASSWORD,"{D92732}Nexus / REGISTRO","Elige una contrasena de 4 a 18 caracteres.\nDespues la confirmaras y crearas tu personaje.");
}
stock RP_LGEnter(p) {
 if(RP_LGStage[p]!=LG_LOGIN || RP_LGAuthBusy[p]) return 1;
 if(RP_LGAutoAllowed[p]) {CancelSelectTextDraw(p);return IngresoAutomatico(p);}
 return RP_LGPassword(p);
}
stock RP_LGEmail(p) {
 if(!RP_LGPasswordOK[p]) return RP_LGPassword(p);
 RP_LGStage[p]=LG_EMAIL;
 return RP_LGInput(p,DEMAIL,DIALOG_STYLE_INPUT,"{D92732}Nexus / CORREO","Escribe tu correo para recuperar el acceso a tu cuenta.\nEl siguiente paso es crear tu personaje.");
}
stock RP_LGFinish(p) {
 if(RP_LGStage[p]!=LG_CHARACTER || !RP_LGPasswordOK[p] || !strlen(PLAYER_INFO[p][pEmail])) return 1;
 PLAYER_INFO[p][jEdad]=RP_LGAge[p];PLAYER_INFO[p][jSexo]=RP_LGSex[p];PLAYER_INFO[p][SEXOSELECCIONADO]=RP_LGSex[p];
 PLAYER_INFO[p][jRopa]=RP_LGModel(p);RP_LGStage[p]=LG_SAVING;CancelSelectTextDraw(p);
 new query[224];mysql_format(handle_db,query,sizeof query,"SELECT ID FROM usuarios WHERE Username = '%e' OR Email = '%e' LIMIT 1",PLAYER_INFO[p][Nickname],PLAYER_INFO[p][pEmail]);
 mysql_tquery(handle_db,query,"RP_LGRegisterChecked","iii",p,RP_LGToken[p],RP_LGSex[p]);return 1;
}
forward RP_LGRegisterChecked(playerid,token,sex);
public RP_LGRegisterChecked(playerid,token,sex) {
 if(!RP_LGValid(playerid) || RP_LGToken[playerid]!=token || RP_LGStage[playerid]!=LG_SAVING) return 1;
 return OnPlayerRegister(playerid,sex);
}
forward RP_LGAccountLoaded(playerid,token);
public RP_LGAccountLoaded(playerid,token) {
 if(!RP_LGValid(playerid) || RP_LGToken[playerid]!=token || (RP_LGStage[playerid]!=LG_LOGIN && RP_LGStage[playerid]!=LG_SAVING)) return 1;
 RP_LGAuthBusy[playerid]=false;
 return OnPlayerSpawnLoaded(playerid);
}
forward RP_LGEmailChecked(playerid,token);
public RP_LGEmailChecked(playerid,token) {
 if(!RP_LGValid(playerid) || RP_LGToken[playerid]!=token || RP_LGStage[playerid]!=LG_EMAIL || !RP_LGMailBusy[playerid]) return 1;
 RP_LGMailBusy[playerid]=false;
 if(cache_num_rows()) {PLAYER_INFO[playerid][pEmail][0]=EOS;SendClientMessage(playerid,-1,"Ese correo ya esta registrado. Usa otro correo o recupera tu cuenta.");return RP_LGEmail(playerid);}
 return RP_LGShowCharacter(playerid);
}
stock RP_LGDialog(p,id,response,item,input[]) {
 if(!RP_LGValid(p) || JugadorLogeado[p]==1) return 0;
 new bool:owned=(id>=RP_LG_CONFIRM && id<=RP_LG_CITY) || id==REGISTRO || (id==DEMAIL && RP_LGStage[p]==LG_EMAIL);
 if(!owned) return 0;
 if(id==REGISTRO && RP_LGStage[p]!=LG_REGISTER) return 1;
 if(RP_LGMailBusy[p] || RP_LGStage[p]==LG_SAVING || RP_LGStage[p]==LG_NONE) return 1;
 if(!response) {RP_LGRender(p);return 1;}
 switch(id) {
  case REGISTRO: {
   if(strlen(input)<4 || strlen(input)>18) {SendClientMessage(p,-1,"La contrasena debe tener entre 4 y 18 caracteres.");RP_LGPassword(p);return 1;}
   format(PLAYER_INFO[p][pPassword],144,"%s",input);RP_LGStage[p]=LG_CONFIRM;
   RP_LGInput(p,RP_LG_CONFIRM,DIALOG_STYLE_PASSWORD,"{D92732}CONFIRMAR CONTRASENA","Repite la contrasena para evitar errores.");
  }
  case RP_LG_CONFIRM: {
   if(RP_LGStage[p]!=LG_CONFIRM) return 1;
   if(strcmp(input,PLAYER_INFO[p][pPassword],false)) {SendClientMessage(p,-1,"Las contrasenas no coinciden.");RP_LGInput(p,RP_LG_CONFIRM,DIALOG_STYLE_PASSWORD,"{D92732}CONFIRMAR","Repite exactamente la contrasena que elegiste.");return 1;}
   RP_LGPasswordOK[p]=true;KillTimer(LoginTimer[p]);LoginTimer[p]=0;RP_LGRender(p,false);RP_LGEmail(p);
  }
  case DEMAIL: {
   if(RP_LGMailBusy[p]) return 1;
   if(!RP_LGPasswordOK[p]) {RP_LGPassword(p);return 1;}
   if(strlen(input)>=32 || !IsCorrectMail(input)) {SendClientMessage(p,-1,"Escribe un correo valido de menos de 32 caracteres.");RP_LGEmail(p);return 1;}
   format(PLAYER_INFO[p][pEmail],32,"%s",input);RP_LGMailBusy[p]=true;
   new query[192];mysql_format(handle_db,query,sizeof query,"SELECT ID FROM usuarios WHERE Email = '%e' LIMIT 1",input);
   mysql_tquery(handle_db,query,"RP_LGEmailChecked","ii",p,RP_LGToken[p]);
  }
  case RP_LG_AGE: {
   if(RP_LGStage[p]!=LG_CHARACTER) return 1;
   new bool:digits=strlen(input)>0 && strlen(input)<=2;for(new i;i<strlen(input);i++) if(input[i]<'0' || input[i]>'9') digits=false;
   new age=strval(input);
   if(!digits || age<14 || age>80) {SendClientMessage(p,-1,"La edad debe ser un numero entre 14 y 80.");RP_LGInput(p,RP_LG_AGE,DIALOG_STYLE_INPUT,"{D92732}EDAD","Edad del personaje (14 a 80):");return 1;}
   RP_LGAge[p]=age;RP_LGRender(p);
  }
  case RP_LG_SEX: {
   if(RP_LGStage[p]!=LG_CHARACTER || item<0 || item>1) return 1;
   RP_LGSex[p]=item+1;RP_LGSkin[p]=0;RP_LGUpdateActor(p);RP_LGRender(p);
  }
  case RP_LG_CITY: {
   if(RP_LGStage[p]!=LG_CHARACTER || item<0 || item>2) return 1;
   RP_LGCity[p]=item;RP_LGRender(p);
  }
  case RP_LG_MENU: {
   if(RP_LGStage[p]==LG_CHARACTER) {
    switch(item) {
     case 0: RP_LGInput(p,RP_LG_AGE,DIALOG_STYLE_INPUT,"{D92732}EDAD","Edad del personaje (14 a 80):");
     case 1: RP_LGInput(p,RP_LG_SEX,DIALOG_STYLE_LIST,"{D92732}SEXO","Hombre\nMujer","Seleccionar");
     case 2,3: {RP_LGSkin[p]=(RP_LGSkin[p]+(item==2?9:1))%10;RP_LGUpdateActor(p);RP_LGRender(p);}
     case 4: RP_LGInput(p,RP_LG_CITY,DIALOG_STYLE_LIST,"{DD343D}CIUDAD","Los Santos\nSan Fierro\nLas Venturas","Seleccionar");
     case 5: RP_LGFinish(p);
    }
   } else if(RP_LGStage[p]==LG_LOGIN) RP_LGEnter(p);
   else if(RP_LGStage[p]>=LG_REGISTER && RP_LGStage[p]<=LG_EMAIL) RP_LGEmail(p);
  }
 }
 return 1;
}
stock RP_LGClick(p,PlayerText:textid) {
 if(!RP_LGValid(p) || RP_LGStage[p]==LG_NONE || RP_LGStage[p]==LG_SAVING) return 0;
 if(RP_LGMailBusy[p] || RP_LGAuthBusy[p]) return 1;
 if(RP_LGStage[p]==LG_CHARACTER) {
  if(textid==RP_LGTD[p][LG_SEX_PREV] || textid==RP_LGTD[p][LG_SEX_NEXT]) {RP_LGSex[p]=RP_LGSex[p]==1?2:1;RP_LGSkin[p]=0;RP_LGUpdateActor(p);RP_LGRender(p);return 1;}
  if(textid==RP_LGTD[p][LG_AGE_PREV] || textid==RP_LGTD[p][LG_AGE_NEXT]) {
   RP_LGAge[p]+=(textid==RP_LGTD[p][LG_AGE_PREV]?-1:1);
   if(RP_LGAge[p]<14) RP_LGAge[p]=14;if(RP_LGAge[p]>80) RP_LGAge[p]=80;
   RP_LGRender(p);return 1;
  }
  if(textid==RP_LGTD[p][LG_CITY_PREV] || textid==RP_LGTD[p][LG_CITY_NEXT]) {RP_LGCity[p]=(RP_LGCity[p]+(textid==RP_LGTD[p][LG_CITY_PREV]?2:1))%3;RP_LGRender(p);return 1;}
  if(textid==RP_LGTD[p][LG_CITY_F]) {RP_LGInput(p,RP_LG_CITY,DIALOG_STYLE_LIST,"{DD343D}CIUDAD","Los Santos\nSan Fierro\nLas Venturas","Seleccionar");return 1;}
  if(textid==RP_LGTD[p][LG_PASS]) {RP_LGInput(p,RP_LG_AGE,DIALOG_STYLE_INPUT,"{D92732}EDAD","Edad del personaje (14 a 80):");return 1;}
  if(textid==RP_LGTD[p][LG_SEX_F]) {RP_LGInput(p,RP_LG_SEX,DIALOG_STYLE_LIST,"{D92732}SEXO","Hombre\nMujer","Seleccionar");return 1;}
  if(textid==RP_LGTD[p][LG_PREV] || textid==RP_LGTD[p][LG_NEXT]) {RP_LGSkin[p]=(RP_LGSkin[p]+(textid==RP_LGTD[p][LG_PREV]?9:1))%10;RP_LGUpdateActor(p);RP_LGRender(p);return 1;}
  if(textid==RP_LGTD[p][LG_BUTTON]) {RP_LGFinish(p);return 1;}
 } else {
  if(RP_LGCreated[p][LG_REGISTER_F] && textid==RP_LGTD[p][LG_REGISTER_F]) {
   if(RP_LGStage[p]==LG_LOGIN) SendClientMessage(p,-1,"Para crear otra cuenta, conecta con un nombre nuevo. Esta cuenta ya esta registrada.");
   else RP_LGEmail(p);
   return 1;
  }
  if(textid==RP_LGTD[p][LG_PASS]) {RP_LGPassword(p);return 1;}
  if(textid==RP_LGTD[p][LG_BUTTON] || (RP_LGCreated[p][LG_EMAIL_F] && textid==RP_LGTD[p][LG_EMAIL_F])) {if(RP_LGStage[p]==LG_LOGIN) RP_LGEnter(p);else RP_LGEmail(p);return 1;}
 }
 return 0;
}
CMD:acceso(playerid,params[]) {
 #pragma unused params
 if(!RP_LGValid(playerid) || JugadorLogeado[playerid]==1) return 1;
 if(RP_LGStage[playerid]==LG_NONE || RP_LGStage[playerid]==LG_SAVING || RP_LGMailBusy[playerid] || RP_LGAuthBusy[playerid]) return SendClientMessage(playerid,-1,"Espera mientras se carga tu cuenta.");
 return RP_LGInput(playerid,RP_LG_MENU,DIALOG_STYLE_LIST,"{DD343D}Nexus / ACCESO",RP_LGStage[playerid]==LG_CHARACTER?"Cambiar edad\nCambiar sexo\nApariencia anterior\nApariencia siguiente\nCambiar ciudad\nFinalizar personaje":"Continuar","Seleccionar");
}
hook OnGameModeInit() {
 print("[Nexus] Login 1: panel clasico rojo compacto, recorrido por Los Santos y musica suave. Introduccion compatible con Nex-AC #021.");
 SetTimer("RP_LGStatsTick",5000,true);
 return 1;
}
hook OnPlayerConnect(playerid) {
 RP_LGTourStop(playerid);RP_LGMusicStop(playerid);
 RP_LGAnchor[playerid]=0;RP_LGSceneVersion[playerid]++;RP_LGSpectating[playerid]=false;RP_LGToken[playerid]++;RP_LGStage[playerid]=LG_NONE;RP_LGActor[playerid]=0;RP_LGFloor[playerid]=0;
 RP_LGPasswordOK[playerid]=false;RP_LGMailBusy[playerid]=false;RP_LGAuthBusy[playerid]=false;RP_LGAutoAllowed[playerid]=false;RP_LGCity[playerid]=0;
 for(new i;i<LG_TD_COUNT;i++) RP_LGCreated[playerid][i]=false;
 return 1;
}
hook OnPlayerDisconnect(playerid,reason) {RP_LGHide(playerid);PLAYER_INFO[playerid][pPassword][0]=EOS;return 1;}
