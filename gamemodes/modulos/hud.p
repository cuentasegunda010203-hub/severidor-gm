// Compact circular status HUD: native SA-MP circles, tightly spaced beside the radar.
#define RP_HUD_SLOTS (50)
#define RP_HUD_ICON (2)
new Text:RP_HUDStatic[4][RP_HUD_SLOTS];
new bool:RP_HUDStaticReady;
new PlayerText:RP_HUDBar[MAX_PLAYERS][4];
new bool:RP_HUDCreated[MAX_PLAYERS], bool:RP_HUDActive[MAX_PLAYERS];
new bool:RP_HUDVisible[MAX_PLAYERS][4];
new RP_HUDLast[MAX_PLAYERS][4], RP_HUDTimer[MAX_PLAYERS];
static const RP_HUDColors[] = {0xF34B50FF,0x319CEBFF,0xF3B638FF,0x27BED8FF};

stock Text:RP_HUDSprite(Float:x,Float:y,Float:w,Float:h,const sprite[],color) {
 new Text:td=TextDrawCreate(x,y,sprite);
 if(td==Text:INVALID_TEXT_DRAW) return td;
 TextDrawFont(td,4);TextDrawTextSize(td,w,h);TextDrawColor(td,color);
 TextDrawSetOutline(td,0);TextDrawSetShadow(td,0);TextDrawSetSelectable(td,false);
 return td;
}
stock RP_HUDInit() {
 if(RP_HUDStaticReady) return 1;
 // Detailed white silhouettes from the selected reference: 19 by 19 samples.
 static const masks[4][19] = {
  {63736,130556,262142,524287,524287,524287,524287,524287,262142,262142,131068,65528,32752,16352,8128,3968,512,0,0},
  {0,32752,131068,131068,131068,131068,131068,131068,131068,131068,65528,32752,16352,8128,8128,3968,1792,512,512},
  {49236,49236,57428,57428,57428,57428,57428,57468,57368,57368,57368,49176,49176,49176,49176,49176,49176,49176,49176},
  {0,512,1792,1792,3968,3968,8128,16352,16352,32752,32752,65528,131068,65528,65528,65528,32752,16352,8128}
 };
 new iconCount[4];
 for(new stat;stat<4;stat++) for(new slot;slot<RP_HUD_SLOTS;slot++) RP_HUDStatic[stat][slot]=Text:INVALID_TEXT_DRAW;
 for(new stat;stat<4;stat++) {
  new Float:x=112.0+float(stat)*14.0,Float:y=409.0;
  // The native circle texture has transparent padding; closer centres keep visible circles together.
  RP_HUDStatic[stat][0]=RP_HUDSprite(x,y,18.0,22.5,"LD_BEAT:chit",RP_HUDColors[stat]);
  RP_HUDStatic[stat][1]=RP_HUDSprite(x+1.0,y+1.25,16.0,20.0,"LD_BEAT:chit",0x10171FFF);
  RP_HUDStatic[stat][49]=RP_HUDSprite(x+4.0,431.0,10.0,1.5,"LD_SPAC:white",0x39424EFF);
  // Merge mask pixels into rectangles, keeping the icon count low.
  new iconCoveredRows[19];
  for(new row;row<19;row++) {
   new column;
   while(column<19) {
    if(!(masks[stat][row] & (1<<column)) || (iconCoveredRows[row] & (1<<column))) {column++;continue;}
    new first=column;
    while(column<19 && (masks[stat][row] & (1<<column)) && !(iconCoveredRows[row] & (1<<column))) column++;
    new bits=((1<<column)-1)^((1<<first)-1),rows=1;
    while(row+rows<19 && (masks[stat][row+rows]&bits)==bits && !(iconCoveredRows[row+rows]&bits)) rows++;
    for(new r;r<rows;r++) iconCoveredRows[row+r]|=bits;
    if(RP_HUD_ICON+iconCount[stat]>=49) return 0;
    RP_HUDStatic[stat][RP_HUD_ICON+iconCount[stat]++]=RP_HUDSprite(x+5.68+float(first)*0.35,y+6.88+float(row)*0.4375,float(column-first)*0.35,float(rows)*0.4375+0.02,"LD_SPAC:white",0xF1F4F8FF);
   }
  }

 }
 for(new stat;stat<4;stat++) for(new slot;slot<RP_HUD_SLOTS;slot++) {
  if(slot>=RP_HUD_ICON+iconCount[stat] && slot!=49) continue;
  if(RP_HUDStatic[stat][slot]==Text:INVALID_TEXT_DRAW) {
   for(new s;s<4;s++) for(new t;t<RP_HUD_SLOTS;t++) if(RP_HUDStatic[s][t]!=Text:INVALID_TEXT_DRAW) TextDrawDestroy(RP_HUDStatic[s][t]);
   printf("[HUD Minimal] No hay TextDraws disponibles.");return 0;
  }
 }
 RP_HUDStaticReady=true;return 1;
}
stock RP_HUDClamp(value) { return value<0?0:(value>100?100:value); }
stock RP_HUDRead(playerid,stat) {
 new Float:value;
 switch(stat) {
  case 0: {GetPlayerHealth(playerid,value);return RP_HUDClamp(floatround(value));}
  case 1: {GetPlayerArmour(playerid,value);return RP_HUDClamp(floatround(value));}
  case 2: return RP_HUDClamp(PLAYER_INFO[playerid][pHambre]);
  case 3: return RP_HUDClamp(PLAYER_INFO[playerid][pSed]);
 }
 return 0;
}
stock RP_HUDUpdateStat(playerid,stat) {
 if(!RP_HUDCreated[playerid] || !RP_HUDActive[playerid] || !RP_HUDVisible[playerid][stat]) return 0;
 new value=RP_HUDRead(playerid,stat);
 if(RP_HUDLast[playerid][stat]==value) return 1;
 PlayerTextDrawTextSize(playerid,RP_HUDBar[playerid][stat],float(value)*0.10,1.5);
 if(value>0) PlayerTextDrawShow(playerid,RP_HUDBar[playerid][stat]);
 else PlayerTextDrawHide(playerid,RP_HUDBar[playerid][stat]);
 RP_HUDLast[playerid][stat]=value;return 1;
}
stock RP_HUDShowStat(playerid,stat) {
 if(RP_InvVisible[playerid] || !RP_HUDCreated[playerid] || !RP_HUDActive[playerid]) return 0;
 if(RP_LoadingVisible[playerid]) {RP_LoadingHudMask[playerid] |= (1 << stat);return 0;}
 if(!RP_HUDVisible[playerid][stat]) {
  RP_HUDVisible[playerid][stat]=true;RP_HUDLast[playerid][stat]=-1;
  for(new slot;slot<RP_HUD_SLOTS;slot++) if(RP_HUDStatic[stat][slot]!=Text:INVALID_TEXT_DRAW) TextDrawShowForPlayer(playerid,RP_HUDStatic[stat][slot]);
 }
 return RP_HUDUpdateStat(playerid,stat);
}
stock RP_HUDHideStat(playerid,stat) {
 #if defined RP_InvVisible
 if(RP_InvVisible[playerid]) RP_FooterHide(playerid);
 #endif
 #if defined RP_LoadingVisible
 if(RP_LoadingVisible[playerid]) RP_FooterHide(playerid);
 #endif
 if(RP_LoadingVisible[playerid]) RP_LoadingHudMask[playerid] &= ~(1 << stat);
 if(!RP_HUDCreated[playerid]) return 0;
 for(new slot;slot<RP_HUD_SLOTS;slot++) if(RP_HUDStatic[stat][slot]!=Text:INVALID_TEXT_DRAW) TextDrawHideForPlayer(playerid,RP_HUDStatic[stat][slot]);
 if(RP_HUDBar[playerid][stat]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(playerid,RP_HUDBar[playerid][stat]);
 RP_HUDVisible[playerid][stat]=false;
 RP_HUDLast[playerid][stat]=-1;return 1;
}
forward RP_HUDTick(playerid);
public RP_HUDTick(playerid) {
 RP_InvBalanceTick(playerid);
 if(!IsPlayerConnected(playerid) || IsPlayerNPC(playerid) || !RP_HUDCreated[playerid] || !RP_HUDActive[playerid]) return 0;
 RP_FooterTick(playerid);
 for(new stat;stat<4;stat++) RP_HUDUpdateStat(playerid,stat);
 return 1;
}
stock DestroyHUD(playerid) {
 RP_FooterDestroy(playerid);
 if(RP_HUDTimer[playerid]) KillTimer(RP_HUDTimer[playerid]);RP_HUDTimer[playerid]=0;
 if(RP_HUDCreated[playerid]) for(new stat;stat<4;stat++) {
  RP_HUDHideStat(playerid,stat);
  if(RP_HUDBar[playerid][stat]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid,RP_HUDBar[playerid][stat]);
 }
 RP_HUDCreated[playerid]=false;RP_HUDActive[playerid]=false;return 1;
}
stock CrearHUD(playerid) {
 DestroyHUD(playerid);
 if(IsPlayerNPC(playerid) || !RP_HUDInit()) return 0;
 for(new stat;stat<4;stat++) RP_HUDBar[playerid][stat]=PlayerText:INVALID_TEXT_DRAW;
 RP_HUDCreated[playerid]=true;
 for(new stat;stat<4;stat++) {
  RP_HUDLast[playerid][stat]=-1;RP_HUDVisible[playerid][stat]=false;
  RP_HUDBar[playerid][stat]=CreatePlayerTextDraw(playerid,116.0+float(stat)*14.0,431.0,"LD_SPAC:white");
  new PlayerText:bar=RP_HUDBar[playerid][stat];
  if(bar==PlayerText:INVALID_TEXT_DRAW) {DestroyHUD(playerid);return 0;}
  PlayerTextDrawFont(playerid,bar,4);PlayerTextDrawTextSize(playerid,bar,10.0,1.5);
  PlayerTextDrawColor(playerid,bar,RP_HUDColors[stat]);PlayerTextDrawSetOutline(playerid,bar,0);PlayerTextDrawSetShadow(playerid,bar,0);

 }
 return 1;
}
stock MostrarHUD(playerid) {
 if(IsPlayerNPC(playerid)) return 0;
 if(!RP_HUDCreated[playerid] && !CrearHUD(playerid)) {printf("[HUD Minimal] No se pudo crear el HUD para %d.",playerid);return 0;}
 RP_HUDActive[playerid]=true;
 RP_FooterTick(playerid);
 for(new stat;stat<4;stat++) RP_HUDShowStat(playerid,stat);
 if(!RP_HUDTimer[playerid]) RP_HUDTimer[playerid]=SetTimerEx("RP_HUDTick",1000,true,"i",playerid);
 return 1;
}
stock OcultarSed(playerid) { return RP_HUDHideStat(playerid,3); }
stock OcultarHambre(playerid) { return RP_HUDHideStat(playerid,2); }
stock ActualizarHambre(playerid,mode) {
 if(mode==2) return OcultarHambre(playerid);
 if(mode==1) return RP_HUDShowStat(playerid,2);
 return 0;
}
stock ActualizarSed(playerid,mode) {
 if(mode==2) return OcultarSed(playerid);
 if(mode==1) return RP_HUDShowStat(playerid,3);
 return 0;
}
// Bank operations keep their existing API; the balance has no on-screen widget.
stock ActualizarBanco(playerid) { return IsPlayerConnected(playerid); }
// Experience is still calculated and saved; its on-screen widget is disabled.
stock BarraExp(playerid,mode) {
 #pragma unused playerid,mode
 return 1;
}

// Selected lower strip 1: one thin row, real character data, no extra rewards.
new PlayerText:RP_FooterTD[MAX_PLAYERS][8];
new bool:RP_FooterReady[MAX_PLAYERS], bool:RP_FooterVisible[MAX_PLAYERS];
new RP_FooterLast[MAX_PLAYERS][6][96];
stock RP_FooterHide(p) {
 if(RP_FooterVisible[p]) for(new i;i<8;i++) PlayerTextDrawHide(p,RP_FooterTD[p][i]);
 RP_FooterVisible[p]=false;return 1;
}
stock RP_FooterDestroy(p) {
 RP_FooterHide(p);
 if(RP_FooterReady[p]) for(new i;i<8;i++) if(RP_FooterTD[p][i]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(p,RP_FooterTD[p][i]);
 RP_FooterReady[p]=false;return 1;
}
stock RP_FooterCreate(p) {
 if(RP_FooterReady[p]) return 1;
 for(new i;i<8;i++) RP_FooterTD[p][i]=PlayerText:INVALID_TEXT_DRAW;
 for(new i;i<6;i++) RP_FooterLast[p][i][0]=EOS;
 RP_FooterReady[p]=true;
 for(new i;i<2;i++) {
  RP_FooterTD[p][i]=CreatePlayerTextDraw(p,0.0,435.0,"LD_SPAC:white");
  new PlayerText:td=RP_FooterTD[p][i];
  if(td==PlayerText:INVALID_TEXT_DRAW) {RP_FooterDestroy(p);return 0;}
  PlayerTextDrawFont(p,td,4);PlayerTextDrawTextSize(p,td,640.0,i==0?15.0:0.4);
  PlayerTextDrawColor(p,td,i==0?0x000000FF:0x494C50FF);
  PlayerTextDrawSetOutline(p,td,0);PlayerTextDrawSetShadow(p,td,0);PlayerTextDrawSetSelectable(p,td,false);
 }
 static const Float:positions[]={4.0,108.0,315.0,377.0,522.0,636.0};
 for(new i;i<6;i++) {
  RP_FooterTD[p][i+2]=CreatePlayerTextDraw(p,positions[i],438.0,"_");
  new PlayerText:td=RP_FooterTD[p][i+2];
  if(td==PlayerText:INVALID_TEXT_DRAW) {RP_FooterDestroy(p);return 0;}
  PlayerTextDrawFont(p,td,1);PlayerTextDrawLetterSize(p,td,i==5?0.12:0.13,0.72);
  PlayerTextDrawColor(p,td,0xECEEF1FF);PlayerTextDrawSetProportional(p,td,true);
  PlayerTextDrawSetOutline(p,td,0);PlayerTextDrawSetShadow(p,td,1);PlayerTextDrawBackgroundColor(p,td,0x000000FF);
  PlayerTextDrawAlignment(p,td,i==5?3:((i==2 || i==4)?2:1));
  PlayerTextDrawSetSelectable(p,td,false);
 }
 return 1;
}
stock RP_FooterSet(p,index,const text[]) {
 if(RP_FooterLast[p][index][0]==EOS || strcmp(RP_FooterLast[p][index],text)) {
  format(RP_FooterLast[p][index],96,"%s",text);
  PlayerTextDrawSetString(p,RP_FooterTD[p][index+2],text);
 }
 return 1;
}
stock RP_FooterTick(p) {
 if(!RP_HUDActive[p] || JugadorLogeado[p]!=1) return RP_FooterHide(p);
 #if defined RP_InvVisible
 if(RP_InvVisible[p]) return RP_FooterHide(p);
 #endif
 #if defined RP_LoadingVisible
 if(RP_LoadingVisible[p]) return RP_FooterHide(p);
 #endif
 if(!RP_FooterCreate(p)) return 0;
 new text[96],zone[MAX_ZONE_NAME],year,month,day,hour,minute,second;
 RP_FooterSet(p,0,"NEX~r~US~w~ Roleplay");
 getdate(year,month,day);gettime(hour,minute,second);
 new y=year,m=month;if(m<3) {m+=12;y--;}
 new weekday=(day+(13*(m+1))/5+y%100+(y%100)/4+(y/100)/4+5*(y/100))%7;
 static const days[][]={"Sab","Dom","Lun","Mar","Mie","Jue","Vie"};
 static const months[][]={"Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"};
 format(text,sizeof text,"%s, %d %s %d - %02d:%02d",days[weekday],day,months[month-1],year,hour,minute);
 RP_FooterSet(p,1,text);
 GetPlayer2DZone(p,zone,sizeof zone);RP_FooterSet(p,2,zone);
 format(text,sizeof text,"Nivel %d  ~g~%d / %d EXP",PLAYER_INFO[p][@Nivel],PLAYER_INFO[p][jExperiencia],PLAYER_INFO[p][NivelExp]);
 RP_FooterSet(p,3,text);
 format(text,sizeof text,"~y~$~w~ %d Coins",PLAYER_INFO[p][Totems]);RP_FooterSet(p,4,text);
 format(text,sizeof text,"%s [ ID %d ]",PLAYER_INFO[p][Nickname],p);RP_FooterSet(p,5,text);
 if(!RP_FooterVisible[p]) {for(new i;i<8;i++) PlayerTextDrawShow(p,RP_FooterTD[p][i]);RP_FooterVisible[p]=true;}
 return 1;
}
