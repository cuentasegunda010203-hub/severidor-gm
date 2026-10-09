// Panel visual y todas las acciones equivalentes mediante dialogos/comandos.
#define NX_TD_MAX (140)
new PlayerText:NX_TD[MAX_PLAYERS][NX_TD_MAX];
new NX_TDCount[MAX_PLAYERS],NX_Action[MAX_PLAYERS][NX_TD_MAX],NX_IgnoreEscape[MAX_PLAYERS];
new bool:NX_Visible[MAX_PLAYERS],bool:NX_DrawFailed[MAX_PLAYERS];
new NX_Wardrobe[MAX_PLAYERS][10],NX_WardrobeCount[MAX_PLAYERS];
stock NX_Hide(p,bool:cancel=true) {
 new bool:was=NX_Visible[p];NX_Visible[p]=false;
 for(new i;i<NX_TDCount[p];i++) PlayerTextDrawDestroy(p,NX_TD[p][i]);NX_TDCount[p]=0;
 if(was && cancel) {NX_IgnoreEscape[p]++;CancelSelectTextDraw(p);}return 1;
}
stock NX_Text(p,Float:x,Float:y,const text[],Float:w=0.17,Float:h=0.9,color=-1,align=1) {
 if(NX_TDCount[p]>=NX_TD_MAX) return -1;new i=NX_TDCount[p]++;NX_Action[p][i]=-1;
 NX_TD[p][i]=CreatePlayerTextDraw(p,320.0+(x-320.0)*0.78,226.0+(y-226.0)*0.78,text);if(NX_TD[p][i]==PlayerText:INVALID_TEXT_DRAW) {NX_TDCount[p]--;NX_DrawFailed[p]=true;return -1;}PlayerTextDrawFont(p,NX_TD[p][i],1);PlayerTextDrawLetterSize(p,NX_TD[p][i],w*0.78,h*0.78);
 PlayerTextDrawColor(p,NX_TD[p][i],color);PlayerTextDrawAlignment(p,NX_TD[p][i],align);PlayerTextDrawSetOutline(p,NX_TD[p][i],0);PlayerTextDrawSetShadow(p,NX_TD[p][i],0);PlayerTextDrawSetProportional(p,NX_TD[p][i],true);return i;
}
stock NX_Box(p,Float:x,Float:y,Float:w,Float:h,color,action=-1) {
 new i=NX_Text(p,x,y,"LD_SPAC:white");if(i<0) return i;
 PlayerTextDrawFont(p,NX_TD[p][i],4);PlayerTextDrawTextSize(p,NX_TD[p][i],w*0.78,h*0.78);PlayerTextDrawColor(p,NX_TD[p][i],color);
 if(action>=0) {PlayerTextDrawSetSelectable(p,NX_TD[p][i],true);NX_Action[p][i]=action;}return i;
}
stock NX_Button(p,Float:x,Float:y,Float:w,const text[],action,color=0x30343DFF) {
 NX_Box(p,x,y,w,20.0,color,action);NX_Text(p,x+w/2.0,y+5.0,text,0.16,0.9,-1,2);return 1;
}
stock NX_Status(p,t,l,dest[],len) {
 if(NX_Claims[p][t]&(1<<(l-1))) return format(dest,len,"RECLAMADO");
 if(l>NX_Level(NX_State[p][npXP])) return format(dest,len,"NIVEL %d",l);
 if(t && !NX_State[p][npPremium]) return format(dest,len,"PREMIUM");return format(dest,len,"RECLAMAR");
}
stock NX_Show(p) {
 if(NX_Busy[p]) return SendClientMessage(p,-1,"Espera a que termine el guardado del pase.");
 if(!NX_Read(p)) return SendClientMessage(p,-1,"No hay progreso tuyo en esta temporada o NEXUS PASS no esta disponible.");
 NX_Hide(p,false);NX_Dialog[p]=0;NX_Visible[p]=true;NX_DrawFailed[p]=false;NX_Page[p]=min(5,max(0,NX_Page[p]));new text[128];
 NX_Box(p,30.0,52.0,580.0,348.0,0x0E1219F5);NX_Box(p,30.0,52.0,580.0,4.0,0xE52441FF);
 NX_Text(p,46.0,66.0,"NEXUS ~r~PASS",0.4,1.7);
 format(text,sizeof text,"TEMPORADA %02d - EL ASCENSO",NX_View[p]);NX_Text(p,46.0,89.0,text,0.2,1.0,0xABB5C5FF);
 if(NX_View[p]==NX_Season && NX_Active()) format(text,sizeof text,"%d dias restantes",max(1,(NX_End-gettime()+86399)/86400));else format(text,sizeof text,"TEMPORADA ARCHIVADA");
 NX_Text(p,594.0,69.0,text,0.18,1.0,0xE5BB59FF,3);
 format(text,sizeof text,"NIVEL %d/30     XP %d/30000     %s",NX_Level(NX_State[p][npXP]),NX_State[p][npXP],NX_State[p][npPremium]?("PREMIUM ACTIVO"):("PASE GRATIS"));NX_Text(p,46.0,111.0,text,0.19,1.0);
 NX_Box(p,46.0,128.0,548.0,4.0,0x30343DFF);if(NX_State[p][npXP]>0) NX_Box(p,46.0,128.0,548.0*float(NX_State[p][npXP])/30000.0,4.0,0xE52441FF);
 NX_Text(p,46.0,150.0,"GRATIS",0.19,1.0,0xB5C5DBFF);NX_Text(p,46.0,240.0,"PREMIUM",0.19,1.0,0xE5BB59FF);
 for(new col;col<5;col++) {
  new l=NX_Page[p]*5+col+1;new Float:x=139.0+float(col)*91.0;
  format(text,sizeof text,"NIVEL %d",l);NX_Text(p,x+42.0,140.0,text,0.17,0.9,-1,2);
  for(new t;t<2;t++) {
   new Float:y=157.0+float(t)*90.0,r=l-1,color=NX_RewardAvailable(p,t,l)?0x193F32FF:(t?0x332B20FF:0x1E2530FF);
   NX_Box(p,x,y,85.0,85.0,color,t*30+r);
   new icon=NX_Text(p,x+23.0,y+2.0,"_");if(icon<0) continue;PlayerTextDrawFont(p,NX_TD[p][icon],5);PlayerTextDrawTextSize(p,NX_TD[p][icon],30.42,33.54);PlayerTextDrawBackgroundColor(p,NX_TD[p][icon],color);
   new model=NX_Prizes[t][r][nrModel];if(NX_Prizes[t][r][nrKind]==NX_WEAPON) model=RP_InvWeaponModel(model);
   if(NX_Prizes[t][r][nrKind]==NX_VIP) model=1247;
   if(NX_Prizes[t][r][nrKind]==NX_SKIN && PLAYER_INFO[p][jSexo]==2) model=NX_Prizes[t][r][nrFemale];
   PlayerTextDrawSetPreviewModel(p,NX_TD[p][icon],model);PlayerTextDrawSetPreviewRot(p,NX_TD[p][icon],-10.0,0.0,0.0,1.15);
   format(text,sizeof text,"%s",NX_Prizes[t][r][nrName]);if(strlen(text)>24) text[24]=EOS;NX_Text(p,x+42.0,y+48.0,text,0.135,0.85,-1,2);
   NX_Status(p,t,l,text,sizeof text);NX_Text(p,x+42.0,y+68.0,text,0.14,0.85,NX_RewardAvailable(p,t,l)?0x65DA94FF:0xE5BB59FF,2);
  }
 }
 NX_Text(p,46.0,339.0,"Cada premio se reclama una vez. /battlepass menu: controles por dialogo",0.16,0.9,0xABB5C5FF);
 NX_Button(p,46.0,361.0,55.0,"<",100);NX_Button(p,105.0,361.0,55.0,">",101);NX_Button(p,164.0,361.0,96.0,"MISIONES",102);
 NX_Button(p,264.0,361.0,90.0,"RECLAMAR",103,0x25583DFF);NX_Button(p,358.0,361.0,137.0,NX_State[p][npPremium]?("VESTUARIO"):("PREMIUM 60 COINS"),NX_State[p][npPremium]?105:104,0x9C7434FF);
 NX_Button(p,499.0,361.0,95.0,"CERRAR",106);
 if(NX_DrawFailed[p]) {NX_Hide(p);SendClientMessage(p,-1,"No hay espacio para el panel; abrimos los controles por dialogo.");return NX_Menu(p);}for(new i;i<NX_TDCount[p];i++) PlayerTextDrawShow(p,NX_TD[p][i]);SelectTextDraw(p,0xFFCF70FF);return 1;
}
stock NX_Receipt(p,t,l) {
 new text[700],detail[240],r=l-1;
 switch(NX_Prizes[t][r][nrKind]) {
  case NX_MONEY: format(detail,sizeof detail,"El dinero ya se sumo a tu efectivo.\nEfectivo actual: $%d.",PLAYER_INFO[p][jDinero]);
  case NX_COINS: format(detail,sizeof detail,"Los Coins ya se sumaron a tu cuenta.\nCoins actuales: %d.",PLAYER_INFO[p][Totems]);
  case NX_EXP: format(detail,sizeof detail,"La EXP ya se sumo a tu personaje.\nEXP actual: %d. Es distinta de la XP del pase.",PLAYER_INFO[p][jExperiencia]);
  case NX_TOY: format(detail,sizeof detail,"La prenda se guardo en tus accesorios.\nUsa /accesorios, selecciona el premio y equipalo.\nNo se coloca automaticamente sobre el personaje.");
  case NX_PACK: format(detail,sizeof detail,"La mochila se guardo en tu cuenta y en tus accesorios.\nUsa /accesorios para equiparla y /mochila para abrirla.");
  case NX_VIP: format(detail,sizeof detail,"VIP actual: %d.\nVencimiento: %02d/%02d/%04d.",PLAYER_INFO[p][pVip],PLAYER_INFO[p][findia],PLAYER_INFO[p][finmes],PLAYER_INFO[p][finano]);
  case NX_WEAPON: format(detail,sizeof detail,"El arma se guardo en el espacio correspondiente de tu inventario.\nUsa los controles habituales para seleccionarla.");
  case NX_SKIN: format(detail,sizeof detail,"La skin se desbloqueo en tu vestuario del pase.\nUsa /battlepass ropa para seleccionarla y equiparla.");
 }
 format(text,sizeof text,"{65DA94}RECOMPENSA ENTREGADA{FFFFFF}\n\n%s\nRuta %s | Nivel %d\n\n%s\n\nEste premio ya figura como RECLAMADO y no se entrega dos veces.",NX_Prizes[t][r][nrName],t?("Premium"):("Gratis"),l,detail);
 return NX_DialogShow(p,NX_BP_INFO,DIALOG_STYLE_MSGBOX,"NEXUS PASS | Premio recibido",text,"Ver pase","Cerrar");
}
stock NX_Menu(p) {
 if(!NX_Read(p)) return NX_Error(p);
 new text[700];format(text,sizeof text,"Panel visual (nivel %d/30)\nRecompensas / reclamar\nMisiones y meta comunitaria\nComprar Premium - 60 Coins\nVestuario de temporada\nAnterior pagina\nSiguiente pagina\nInformacion del pase\nCerrar",NX_Level(NX_State[p][npXP]));
 return NX_DialogShow(p,NX_BP_MENU,DIALOG_STYLE_LIST,"NEXUS PASS | El Ascenso",text,"Elegir","Cerrar");
}
stock NX_List(p) {
 if(!NX_Read(p)) return NX_Error(p);NX_Page[p]=min(5,max(0,NX_Page[p]));new text[1800]="Nivel\tRuta / recompensa\tEstado",line[150],status[32];
 for(new col;col<5;col++) for(new t;t<2;t++) {
  new l=NX_Page[p]*5+col+1;NX_Status(p,t,l,status,sizeof status);
  format(line,sizeof line,"\n%d\t%s: %s\t%s",l,t?("Premium"):("Gratis"),NX_Prizes[t][l-1][nrName],status);strcat(text,line);
 }
 strcat(text,"\n<\tPagina anterior\t\n>\tPagina siguiente\t\nMenu\tVolver al menu\t");
 return NX_DialogShow(p,NX_BP_REWARDS,DIALOG_STYLE_TABLIST_HEADERS,"NEXUS PASS | Recompensas",text,"Ver","Volver");
}
stock NX_Confirm(p,t,l) {
 if(!NX_Read(p) || t<0 || t>1 || l<1 || l>30) return 0;
 if(!NX_RewardAvailable(p,t,l)) return SendClientMessage(p,-1,"Premio bloqueado o ya reclamado. Sube de nivel o activa Premium.");
 new text[800];format(text,sizeof text,"Temporada %d | Nivel %d | %s\n\nPremio: %s\n\nSe entrega una sola vez. Si no hay espacio o no cumples los requisitos,\nel premio queda pendiente y podras reclamarlo despues.\n\nEXP = experiencia de personaje. XP del pase = progreso de misiones.\nVIP: conserva el nivel superior y suma dias.\nArmas: nivel 6, fuera de servicio y espacio libre; reglas normales del servidor.",NX_View[p],l,t?("Premium"):("Gratis"),NX_Prizes[t][l-1][nrName]);
 NX_Choice[p]=t*30+l-1;NX_Quote[p]=gettime()+60;return NX_DialogShow(p,NX_BP_CONFIRM,DIALOG_STYLE_MSGBOX,"NEXUS PASS | Reclamar",text,"Reclamar","Volver");
}
stock NX_Buy(p) {
 if(!NX_Read(p) || NX_View[p]!=NX_Season || !NX_Active()) return SendClientMessage(p,-1,"Solo puedes comprar Premium para la temporada activa.");
 if(NX_State[p][npPremium]) return SendClientMessage(p,-1,"Ya tienes Premium en esta temporada.");
 NX_Quote[p]=gettime()+60;return NX_DialogShow(p,NX_BP_BUY,DIALOG_STYLE_MSGBOX,"NEXUS PASS | Premium",
 "Precio: 60 Coins.\nTemporada: 60 dias desde su inicio global, no desde la compra.\n\nPremium desbloquea una segunda ruta de 30 premios; debes alcanzar cada nivel.\nIncluye Coins, EXP, mochila, prendas, skins, VIP temporal y armas.\nPuedes reclamar los niveles Premium que ya alcanzaste.\n\nEl Premium no se renueva automaticamente ni se incluye con VIP.","Comprar","Volver");
}
stock NX_Missions(p) {
 if(!NX_Read(p)) return NX_Error(p);
 new day=(gettime()-4*3600)/86400,week=(day+3)/7,d=NX_State[p][npDay]==day?NX_State[p][npDaily]:0,w=NX_State[p][npWeek]==week?NX_State[p][npWeekly]:0;
 new text[1500],q[200];format(q,sizeof q,"SELECT community FROM nexus_pass_seasons WHERE id=%d",NX_View[p]);new Cache:c=mysql_query(handle_db,q,true);new community;
 if(mysql_errno(handle_db)==0 && cache_num_rows()==1) cache_get_value_name_int(0,"community",community);if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
 format(text,sizeof text,"{E5BB59}EL ASCENSO | Nivel %d/30 | %d XP\n\n{FFFFFF}DIARIAS (reinicio 00:00 Venezuela)\n3 trabajos: %d/3 | 400 XP\n8 trabajos: %d/8 | 600 XP\nCada uno de los primeros 10 trabajos del dia: 50 XP.\n\nSEMANALES (lunes 00:00 Venezuela)\n20 trabajos: %d/20 | 1.500 XP\n50 trabajos: %d/50 | 2.500 XP\n\nTEMPORADA\n150 trabajos: %d/150 | 5.000 XP\n\nMETA DE LA CIUDAD\n500 trabajos comunitarios: %d/500. Tus contribuciones: %d.\nPremio: 2 Coins, requiere 10 contribuciones personales.\nEstado: %s\n\nCuentan entregas reales de trabajos y fuegos apagados del SAFD.\nLos premios de XP de misiones se otorgan automaticamente una vez.\nNo se obtiene XP estando AFK. Entre eventos: minimo 15 segundos.\n%s",NX_Level(NX_State[p][npXP]),NX_State[p][npXP],min(d,3),min(d,8),min(w,20),min(w,50),min(NX_State[p][npJobs],150),community,NX_State[p][npJobs],NX_State[p][npSeasonMask]&2?("RECLAMADO"):("PENDIENTE"),NX_View[p]!=NX_Season || !NX_Active()?("Temporada archivada: conserva los reclamos pendientes."):(""));
 return NX_DialogShow(p,NX_BP_MISSIONS,DIALOG_STYLE_MSGBOX,"NEXUS PASS | Misiones",text,"Meta ciudad","Volver");
}
stock NX_Info(p) {
 return NX_DialogShow(p,NX_BP_INFO,DIALOG_STYLE_MSGBOX,"NEXUS PASS | Informacion",
 "30 niveles | 1.000 XP por nivel | 60 dias por temporada\nPremium: 60 Coins | Gratis: disponible para todos\n\n/battlepass : panel visual\n/battlepass menu : menu compatible Android y PC\n/battlepass misiones : objetivos\n/battlepass reclamar : lista de premios\n/battlepass comprar : confirmar compra Premium\n/battlepass ropa : skins desbloqueadas\n/battlepass temporada ID : consultar una temporada anterior\n/battlepass cerrar : cerrar panel\n\nLa ropa de la coleccion usa modelos nativos de GTA, sin descargas externas.\nLas skins reclamadas quedan disponibles permanentemente en el vestuario.\nPrendas y mochilas se gestionan con /accesorios e inventario.\nArmas sujetas a perdida y guardado normales; no incluyen inmunidad.\nVIP temporal usa la membresia normal y sus beneficios.\nLos premios pendientes siguen disponibles al finalizar la temporada.","Menu","Cerrar");
}
stock NX_Clothes(p) {
 if(!NX_Live(p)) return 0;new q[500],text[1200]="Coleccion\tSkin",line[120];NX_WardrobeCount[p]=0;
 format(q,sizeof q,"SELECT DISTINCT c.track,c.level FROM nexus_pass_claims c JOIN nexus_pass_seasons s ON s.id=c.season WHERE c.account=%d AND s.catalog=1 AND c.level BETWEEN 1 AND 30 AND c.track BETWEEN 0 AND 1 ORDER BY c.track,c.level",PLAYER_INFO[p][pID]);
 new Cache:c=mysql_query(handle_db,q,true);
 if(mysql_errno(handle_db)==0) for(new row;row<cache_num_rows();row++) {
  new t,l;cache_get_value_name_int(row,"track",t);cache_get_value_name_int(row,"level",l);
  if(NX_Prizes[t][l-1][nrKind]!=NX_SKIN || NX_WardrobeCount[p]>=10) continue;
  new m=PLAYER_INFO[p][jSexo]==2?NX_Prizes[t][l-1][nrFemale]:NX_Prizes[t][l-1][nrModel];NX_Wardrobe[p][NX_WardrobeCount[p]++]=m;
  format(line,sizeof line,"\n%s\t%d",NX_Prizes[t][l-1][nrName],m);strcat(text,line);
 }
 if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
 if(!NX_WardrobeCount[p]) return SendClientMessage(p,-1,"Reclama una skin del pase para desbloquear el vestuario.");
 return NX_DialogShow(p,NX_BP_WARDROBE,DIALOG_STYLE_TABLIST_HEADERS,"NEXUS PASS | Vestuario",text,"Equipar","Volver");
}
stock NX_Equip(p,index) {
 if(index<0 || index>=NX_WardrobeCount[p] || PLAYER_INFO[p][pDuty] || PLAYER_INFO[p][Agonizando] || PLAYER_INFO[p][pTiempoCarcel]>0 || PLAYER_INFO[p][pTiempoJail]>0 || GetPlayerState(p)==PLAYER_STATE_WASTED) return SendClientMessage(p,-1,"Cambia de ropa cuando estes libre, fuera de peligro y fuera de servicio.");
 if(RopaMine[p] || RopaMedi[p] || RopaBasu[p] || RopaMeca[p]) return SendClientMessage(p,-1,"Quitate primero la ropa de trabajo.");
 new m=NX_Wardrobe[p][index],q[160];format(q,sizeof q,"UPDATE usuarios SET Skin=%d WHERE ID=%d",m,PLAYER_INFO[p][pID]);if(!NX_SQL(q)) return NX_Error(p);
 PLAYER_INFO[p][jRopa]=m;SetPlayerSkin(p,m);SendClientMessage(p,0x65DA94FF,"Coleccion de temporada equipada.");return 1;
}
stock NX_DialogResponse(p,id,response,item) {
 if(id<NX_BP_MENU || id>NX_BP_INFO) return 0;
 if(!NX_Live(p) || NX_Account[p]!=PLAYER_INFO[p][pID] || NX_Dialog[p]!=id || dl_playerDialogID[p]!=id || NX_Busy[p]) return 1;
 NX_Dialog[p]=0;dl_playerDialogID[p]=-1;
 if(!response) {if(id==NX_BP_MENU || id==NX_BP_INFO) return 1;return NX_Menu(p);}
 switch(id) {
  case NX_BP_MENU: switch(item) {case 0:return NX_Show(p);case 1:return NX_List(p);case 2:return NX_Missions(p);case 3:return NX_Buy(p);case 4:return NX_Clothes(p);case 5:{NX_Page[p]=max(0,NX_Page[p]-1);return NX_List(p);}case 6:{NX_Page[p]=min(5,NX_Page[p]+1);return NX_List(p);}case 7:return NX_Info(p);}
  case NX_BP_REWARDS: {if(item>=0 && item<10) return NX_Confirm(p,item%2,NX_Page[p]*5+item/2+1);if(item==10) NX_Page[p]=max(0,NX_Page[p]-1);else if(item==11) NX_Page[p]=min(5,NX_Page[p]+1);else return NX_Menu(p);return NX_List(p);}
  case NX_BP_CONFIRM: {if(NX_Choice[p]<0 || NX_Quote[p]<gettime()) return 1;NX_Quote[p]=0;return NX_Queue(p,NX_Choice[p]);}
  case NX_BP_BUY: return NX_Queue(p,-1);
  case NX_BP_MISSIONS: return NX_Queue(p,60);
  case NX_BP_WARDROBE: return NX_Equip(p,item);
  case NX_BP_INFO: return NX_Show(p);
 }
 return 1;
}
stock NX_Click(p,PlayerText:clicked) {
 if(!NX_Visible[p]) return 0;
 if(!NX_Live(p) || NX_Account[p]!=PLAYER_INFO[p][pID] || NX_Busy[p]) {NX_Hide(p);return 1;}
 for(new i;i<NX_TDCount[p];i++) if(NX_TD[p][i]==clicked) {
  new a=NX_Action[p][i];if(a<0) return 1;if(a<60) return NX_Confirm(p,a/30,a%30+1);
  switch(a) {case 100:{NX_Page[p]=max(0,NX_Page[p]-1);return NX_Show(p);}case 101:{NX_Page[p]=min(5,NX_Page[p]+1);return NX_Show(p);}case 102:return NX_Missions(p);case 103:return NX_List(p);case 104:return NX_Buy(p);case 105:return NX_Clothes(p);case 106:return NX_Hide(p);}return 1;
 }
 return 0;
}
stock NX_Escape(p) {if(NX_IgnoreEscape[p]>0) {NX_IgnoreEscape[p]--;return 1;}if(!NX_Visible[p]) return 0;return NX_Hide(p,false);}
stock NX_Reset(p) {NX_Hide(p,false);NX_Session[p]++;NX_Busy[p]=false;NX_View[p]=0;NX_Account[p]=0;NX_Dialog[p]=0;NX_Quote[p]=0;NX_Choice[p]=-1;NX_Page[p]=0;NX_Cooldown[p]=0;NX_IgnoreEscape[p]=0;return 1;}
CMD:battlepass(playerid,params[]) {
 if(!NX_Live(playerid)) {printf("[NEXUS PASS] Acceso rechazado: jugador=%d autenticado=%d logeado=%d cuenta=%d",playerid,LogeoCorrecto[playerid],JugadorLogeado[playerid],PLAYER_INFO[playerid][pID]);return SendClientMessage(playerid,-1,"El pase requiere una cuenta cargada. Reconecta si el inicio de sesion no termino.");}
 if(isnull(params)) {NX_View[playerid]=NX_Season;NX_Page[playerid]=0;return NX_Show(playerid);}
 if(!strcmp(params,"cerrar",true)) {NX_Hide(playerid);NX_Dialog[playerid]=0;return 1;}
 if(NX_Busy[playerid]) return SendClientMessage(playerid,-1,"Espera a que termine el guardado del pase.");
 if(!strcmp(params,"menu",true)) return NX_Menu(playerid);
 if(!strcmp(params,"misiones",true)) return NX_Missions(playerid);
 if(!strcmp(params,"reclamar",true)) return NX_List(playerid);
 if(!strcmp(params,"comprar",true)) return NX_Buy(playerid);
 if(!strcmp(params,"ropa",true)) return NX_Clothes(playerid);
 if(!strcmp(params,"ayuda",true)) return NX_Info(playerid);
 new sub[24],season;if(!sscanf(params,"s[24]d",sub,season) && !strcmp(sub,"temporada",true)) {
  if(season<1) return 1;new q[200];format(q,sizeof q,"SELECT id FROM nexus_pass_seasons WHERE id=%d AND catalog=1",season);new Cache:c=mysql_query(handle_db,q,true);new bool:exists=mysql_errno(handle_db)==0 && cache_num_rows()==1;if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
  if(!exists) return SendClientMessage(playerid,-1,"Esa temporada no existe.");NX_View[playerid]=season;NX_Page[playerid]=0;return NX_Show(playerid);
 }
 return NX_Info(playerid);
}
// Administracion deliberadamente fuera de la ayuda publica.
CMD:pasetemporada(playerid,params[]) {
 if(!NX_Live(playerid) || PLAYER_INFO[playerid][pAdmin]<ADMIN_LEVEL_ADM || !AdminDuty[playerid]) return 0;
 if(strcmp(params,"iniciar",true)) return SendClientMessage(playerid,-1,"/pasetemporada iniciar (solo despues del cierre de la temporada actual)");
 if(NX_Active()) return SendClientMessage(playerid,-1,"La temporada actual todavia esta activa.");
 new q[220];format(q,sizeof q,"INSERT INTO nexus_pass_seasons(starts,ends) VALUES(%d,%d)",gettime(),gettime()+NX_BP_DAYS*86400);
 if(!NX_SQL(q) || !NX_Init()) return NX_Error(playerid);
 SendClientMessageEx(playerid,-1,"Temporada %d iniciada por 60 dias; progreso nuevo, reclamos anteriores conservados.",NX_Season);return 1;
}
stock NX_CancelPending(p) {NX_Session[p]++;NX_Busy[p]=false;NX_Dialog[p]=0;NX_Quote[p]=0;NX_Choice[p]=-1;return 1;}
