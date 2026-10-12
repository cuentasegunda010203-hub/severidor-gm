#define RP_IA_MENU 29710
#define RP_IA_INPUT 29711
#define RP_IA_CONFIRM 29712
#define RP_IA_DROPS 64
#define RP_IA_SCALE (0.85)
new PlayerText:RP_IAMenuTD[MAX_PLAYERS][16];
new RP_IAMenuCount[MAX_PLAYERS],RP_IAMenuButtons[MAX_PLAYERS][6];
new bool:RP_IAMenuVisible[MAX_PLAYERS];
new RP_IAItem[MAX_PLAYERS], RP_IAAction[MAX_PLAYERS], RP_IAAmount[MAX_PLAYERS];
new RP_IAAccount[MAX_PLAYERS];
new const RP_IANames[][] = {"Medicamentos", "Crack", "Marihuana"};
new const RP_IACommands[][] = {"medicamentos", "crack", "marihuana"};
new bool:RP_IADropActive[RP_IA_DROPS];
new RP_IADropQty[RP_IA_DROPS], RP_IADropItem[RP_IA_DROPS], RP_IADropPickup[RP_IA_DROPS];
new Text3D:RP_IADropLabel[RP_IA_DROPS];
new RP_IADropToken[RP_IA_DROPS], RP_IADropTimer[RP_IA_DROPS];
new RP_IADropWorld[RP_IA_DROPS], RP_IADropInterior[RP_IA_DROPS], RP_IADropTime[RP_IA_DROPS];
new Float:RP_IADropPos[RP_IA_DROPS][3];

stock RP_IAQty(p,item) {
 switch(item) {
  case 0:return PLAYER_INFO[p][pRemedios];
  case 1:return PLAYER_INFO[p][pCrack];
  case 2:return PLAYER_INFO[p][pMarihuana];
 }
 return 0;
}
stock RP_IAChange(p,item,amount) {
 switch(item) {
  case 0:PLAYER_INFO[p][pRemedios]+=amount;
  case 1:PLAYER_INFO[p][pCrack]+=amount;
  case 2:PLAYER_INFO[p][pMarihuana]+=amount;
 }
 return 1;
}
stock RP_IAReady(p) {
 return JugadorLogeado[p]==1 && !IsPlayerNPC(p) && !Muriendo[p] && !PLAYER_INFO[p][Agonizando] && !Esposando[p] && !PLAYER_TEMP[p][VariableCaido] && GetPlayerState(p)!=PLAYER_STATE_WASTED && GetPlayerState(p)!=PLAYER_STATE_SPECTATING && PLAYER_INFO[p][pTiempoCarcel]==0 && PLAYER_INFO[p][pTiempoJail]==0 && !PLAYER_TEMP[p][pt_PLAYER_EVENTODM];
}
stock RP_IAReset(p) {RP_IAMenuHide(p,false);RP_IAItem[p]=-1;RP_IAAccount[p]=0;RP_IAAction[p]=-1;RP_IAAmount[p]=0;return 1;}
stock RP_IAOpen(p,item) {
 if(item<0 || item>2 || !RP_IAReady(p)) return SendClientMessage(p,-1,"No puedes abrir las opciones ahora.");
 if(RP_IAQty(p,item)<1) return SendClientMessage(p,-1,"Ya no tienes ese objeto.");
 RP_IAItem[p]=item;RP_IAAccount[p]=PLAYER_INFO[p][pID];RP_IAAction[p]=-1;
 return RP_IAMenuShow(p);
}
stock RP_IAInput(p) {
 new text[240];
 switch(RP_IAAction[p]) {
  case 1:format(text,sizeof text,"Escribe: ID cantidad precio_total\nEjemplo: 3 5 1000\nDisponible: %d. La venta requiere aceptacion del comprador.",RP_IAQty(p,RP_IAItem[p]));
  case 2:format(text,sizeof text,"Escribe: ID cantidad\nEjemplo: 3 5\nDisponible: %d. El jugador debe estar a menos de 5 metros.",RP_IAQty(p,RP_IAItem[p]));
  case 3:format(text,sizeof text,"Cantidad que quieres dejar en el suelo (1 a 10000).\nDisponible: %d\nSe puede recoger durante 10 minutos; desaparece al reiniciar.",RP_IAQty(p,RP_IAItem[p]));
 }
 return dialogs_ShowPlayerDialog(p,RP_IA_INPUT,DIALOG_STYLE_INPUT,RP_IANames[RP_IAItem[p]],text,"Continuar","Volver");
}
stock RP_IADropClear(i) {
 if(RP_IADropActive[i]) {DestroyDynamicPickup(RP_IADropPickup[i]);DestroyDynamic3DTextLabel(RP_IADropLabel[i]);}
 if(RP_IADropTimer[i]) KillTimer(RP_IADropTimer[i]);
 RP_IADropActive[i]=false;RP_IADropQty[i]=0;RP_IADropTimer[i]=0;RP_IADropToken[i]++;return 1;
}
forward RP_IADropExpire(i,token);
public RP_IADropExpire(i,token) {if(i>=0 && i<RP_IA_DROPS && RP_IADropToken[i]==token) RP_IADropClear(i);return 1;}
stock RP_IADrop(p,item,qty) {
 new i=-1;for(new n;n<RP_IA_DROPS;n++) if(!RP_IADropActive[n]) {i=n;break;}
 if(i<0) return SendClientMessage(p,-1,"Hay demasiados objetos en el suelo. Intenta luego.");
 new const models[]={1580,1575,1578};new Float:x,Float:y,Float:z,Float:a;
 GetPlayerPos(p,x,y,z);GetPlayerFacingAngle(p,a);x+=floatsin(-a,degrees)*1.5;y+=floatcos(-a,degrees)*1.5;
 new world=GetPlayerVirtualWorld(p),interior=GetPlayerInterior(p);
 new pickup=CreateDynamicPickup(models[item],1,x,y,z-0.7,world,interior);
 if(!IsValidDynamicPickup(pickup)) return SendClientMessage(p,-1,"No se pudo dejar el objeto. Conservas tus objetos.");
 new text[100];format(text,sizeof text,"%s x%d\nAcercate para recoger",RP_IANames[item],qty);
 new Text3D:label=CreateDynamic3DTextLabel(text,0xFFFFFFFF,x,y,z-0.3,12.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,world,interior);
 if(!IsValidDynamic3DTextLabel(label)){DestroyDynamicPickup(pickup);return SendClientMessage(p,-1,"No se pudo dejar el objeto.");}
 RP_IADropActive[i]=true;RP_IADropPickup[i]=pickup;RP_IADropLabel[i]=label;RP_IADropItem[i]=item;RP_IADropQty[i]=qty;
 RP_IADropWorld[i]=world;RP_IADropInterior[i]=interior;RP_IADropTime[i]=gettime();
 RP_IADropPos[i][0]=x;RP_IADropPos[i][1]=y;RP_IADropPos[i][2]=z;
 RP_IADropTimer[i]=SetTimerEx("RP_IADropExpire",600000,false,"ii",i,++RP_IADropToken[i]);
 RP_IAChange(p,item,-qty);GuardarCuenta(p);AccionesRol(p,"deja unos objetos en el suelo.",20);
 return SendClientMessage(p,-1,"Objetos dejados en el suelo. Se pueden recoger durante 10 minutos.");
}
stock RP_IAPickup(playerid,pickupid) {
 for(new i;i<RP_IA_DROPS;i++) if(RP_IADropActive[i] && RP_IADropPickup[i]==pickupid) {
  if(RP_IADropQty[i]<=0) return 1;
  if(!RP_IAReady(playerid) || gettime()-RP_IADropTime[i]<3 || GetPlayerVirtualWorld(playerid)!=RP_IADropWorld[i] || GetPlayerInterior(playerid)!=RP_IADropInterior[i] || !IsPlayerInRangeOfPoint(playerid,2.5,RP_IADropPos[i][0],RP_IADropPos[i][1],RP_IADropPos[i][2])) return 1;
  new qty=RP_IADropQty[i],item=RP_IADropItem[i];
  if(RP_IAQty(playerid,item)>1000000-qty) return 1;
  // Keep the native pickup alive until Streamer and Nex-AC finish this callback.
  RP_IADropQty[i]=0;
  if(RP_IADropTimer[i]) KillTimer(RP_IADropTimer[i]);
  RP_IADropTimer[i]=SetTimerEx("RP_IADropExpire",500,false,"ii",i,RP_IADropToken[i]);
  RP_IAChange(playerid,item,qty);GuardarCuenta(playerid);
  SendClientMessageEx(playerid,-1,"Recogiste %s x%d.",RP_IANames[item],qty);
  return 1;
 }
 return 0;
}
stock RP_IADialog(playerid,dialogid,response,listitem,inputtext[]) {
 if(dialogid<RP_IA_MENU || dialogid>RP_IA_CONFIRM) return 0;
 new p=playerid,item=RP_IAItem[p];
 if(item<0 || item>2 || RP_IAAccount[p]!=PLAYER_INFO[p][pID] || !RP_IAReady(p)){RP_IAReset(p);return 1;}
 if(!response) {
  if(dialogid==RP_IA_MENU){RP_IAReset(p);Menu_AbrirInventario(p);}
  else RP_IAOpen(p,item);
  return 1;
 }
 if(dialogid==RP_IA_MENU) {
  if(listitem<0 || listitem>3) return 1;
  if(listitem==0){RP_IAReset(p);new const actions[]={1,0,2};RP_InvLegacyAction(p,actions[item]);GuardarCuenta(p);}
  else {RP_IAAction[p]=listitem;RP_IAInput(p);}
  return 1;
 }
 if(dialogid==RP_IA_INPUT) {
  new id=-1,qty,price,action=RP_IAAction[p],bad;
  switch(action){case 1:bad=sscanf(inputtext,"ddd",id,qty,price);case 2:bad=sscanf(inputtext,"dd",id,qty);case 3:bad=sscanf(inputtext,"d",qty);default:return 1;}
  if(bad || qty<1 || qty>10000 || qty>RP_IAQty(p,item) || (action==1 && (price<1 || price>qty*500))) {SendClientMessage(p,-1,"Datos invalidos. Cantidad: 1 a 10000, sin superar tus objetos. Precio positivo.");RP_IAInput(p);return 1;}
  if(action==3){RP_IAAmount[p]=qty;new text[180];format(text,sizeof text,"Dejar %s x%d en el suelo?\nCualquier jugador puede recogerlos durante 10 minutos.",RP_IANames[item],qty);dialogs_ShowPlayerDialog(p,RP_IA_CONFIRM,DIALOG_STYLE_MSGBOX,"Confirmar",text,"Tirar","Volver");return 1;}
  if(id<0 || id>=MAX_PLAYERS || id==p || !IsPlayerConnected(id) || !RP_IAReady(id) || GetPlayerVirtualWorld(p)!=GetPlayerVirtualWorld(id) || GetPlayerInterior(p)!=GetPlayerInterior(id) || !EstaEnP(p,id,5.0)) {SendClientMessage(p,-1,"Elige un jugador conectado a menos de 5 metros.");RP_IAInput(p);return 1;}
  if(RP_IAQty(id,item)>1000000-qty){SendClientMessage(p,-1,"El otro inventario no tiene capacidad.");RP_IAInput(p);return 1;}
  RP_IAReset(p);
  if(action==1){new params[80];format(params,sizeof params,"%s %d %d %d",RP_IACommands[item],id,qty,price);callcmd::vender(p,params);}
  else {RP_IAChange(p,item,-qty);RP_IAChange(id,item,qty);GuardarCuenta(p);GuardarCuenta(id);SendClientMessageEx(p,-1,"Cediste %s x%d a %s.",RP_IANames[item],qty,PLAYER_INFO[id][Nickname]);SendClientMessageEx(id,-1,"%s te cedio %s x%d.",PLAYER_INFO[p][Nickname],RP_IANames[item],qty);}
  return 1;
 }
 if(dialogid==RP_IA_CONFIRM && RP_IAAction[p]==3){new qty=RP_IAAmount[p];RP_IAReset(p);if(qty>0 && qty<=10000 && qty<=RP_IAQty(p,item) && !IsPlayerInAnyVehicle(p)) RP_IADrop(p,item,qty);else SendClientMessage(p,-1,"No puedes tirar esa cantidad ahora. Baja del vehiculo.");}
 return 1;
}
stock RP_IACleanup(){for(new i;i<RP_IA_DROPS;i++) RP_IADropClear(i);return 1;}
stock RP_IAMenuHide(p,bool:cancel=true) {
 new bool:was=RP_IAMenuVisible[p];RP_IAMenuVisible[p]=false;
 for(new i;i<RP_IAMenuCount[p];i++) if(RP_IAMenuTD[p][i]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(p,RP_IAMenuTD[p][i]);
 RP_IAMenuCount[p]=0;
 if(was && cancel) CancelSelectTextDraw(p);
 return 1;
}
stock RP_IAMenuRect(p,Float:x,Float:y,Float:w,Float:h,color) {
 x=320.0+(x-320.0)*RP_IA_SCALE;y=225.0+(y-225.0)*RP_IA_SCALE;w*=RP_IA_SCALE;h*=RP_IA_SCALE;
 new i=RP_IAMenuCount[p]++;
 RP_IAMenuTD[p][i]=CreatePlayerTextDraw(p,x,y,"LD_SPAC:white");
 if(RP_IAMenuTD[p][i]==PlayerText:INVALID_TEXT_DRAW) return i;
 PlayerTextDrawFont(p,RP_IAMenuTD[p][i],4);PlayerTextDrawTextSize(p,RP_IAMenuTD[p][i],w,h);
 PlayerTextDrawColor(p,RP_IAMenuTD[p][i],color);PlayerTextDrawSetShadow(p,RP_IAMenuTD[p][i],0);return i;
}
stock RP_IAMenuText(p,Float:x,Float:y,const text[],Float:w,Float:h,Float:size=0.12,color=-1,bool:click=false,box=0) {
 x=320.0+(x-320.0)*RP_IA_SCALE;y=225.0+(y-225.0)*RP_IA_SCALE;w*=RP_IA_SCALE;h*=RP_IA_SCALE;size*=RP_IA_SCALE;
 new i=RP_IAMenuCount[p]++;
 RP_IAMenuTD[p][i]=CreatePlayerTextDraw(p,x,y,text);
 if(RP_IAMenuTD[p][i]==PlayerText:INVALID_TEXT_DRAW) return i;
 PlayerTextDrawFont(p,RP_IAMenuTD[p][i],1);PlayerTextDrawLetterSize(p,RP_IAMenuTD[p][i],size,0.75*RP_IA_SCALE);
 PlayerTextDrawTextSize(p,RP_IAMenuTD[p][i],x+w,h);PlayerTextDrawColor(p,RP_IAMenuTD[p][i],color);
 PlayerTextDrawSetShadow(p,RP_IAMenuTD[p][i],0);PlayerTextDrawSetOutline(p,RP_IAMenuTD[p][i],0);
 PlayerTextDrawSetProportional(p,RP_IAMenuTD[p][i],true);PlayerTextDrawSetSelectable(p,RP_IAMenuTD[p][i],click);
 if(box){PlayerTextDrawUseBox(p,RP_IAMenuTD[p][i],true);PlayerTextDrawBoxColor(p,RP_IAMenuTD[p][i],box);}
 return i;
}
stock RP_IAMenuShow(p) {
 RP_IAMenuHide(p,false);
 RP_IAMenuRect(p,230.0,184.0,180.0,82.0,0x0C1015F5);
 RP_IAMenuRect(p,230.0,184.0,180.0,0.8,0xDC2D43FF);
 RP_IAMenuText(p,236.0,190.0,"NEX~r~US",42.0,8.0,0.16);
 RP_IAMenuButtons[p][4]=RP_IAMenuText(p,397.0,190.0,"X",7.0,9.0,0.13,0xC8D3DBFF,true,0x27313BFF);
 new const models[]={1580,1575,1578};
 new i=RP_IAMenuCount[p]++;
 RP_IAMenuTD[p][i]=CreatePlayerTextDraw(p,320.0+(236.0-320.0)*RP_IA_SCALE,225.0+(205.0-225.0)*RP_IA_SCALE," ");
 if(RP_IAMenuTD[p][i]!=PlayerText:INVALID_TEXT_DRAW){PlayerTextDrawFont(p,RP_IAMenuTD[p][i],5);PlayerTextDrawTextSize(p,RP_IAMenuTD[p][i],19.0*RP_IA_SCALE,20.0*RP_IA_SCALE);PlayerTextDrawSetPreviewModel(p,RP_IAMenuTD[p][i],models[RP_IAItem[p]]);PlayerTextDrawSetPreviewRot(p,RP_IAMenuTD[p][i],0.0,0.0,0.0,1.2);PlayerTextDrawBackgroundColor(p,RP_IAMenuTD[p][i],0x202732FF);}
 RP_IAMenuText(p,260.0,206.0,RP_IANames[RP_IAItem[p]],142.0,9.0,0.16);
 new qty[48];format(qty,sizeof qty,"Disponible: x%d",RP_IAQty(p,RP_IAItem[p]));
 RP_IAMenuText(p,260.0,217.0,qty,142.0,9.0,0.11,0xAAB7C4FF);
 new const labels[][]={"USAR","VENDER","CEDER","TIRAR"};
 for(new b;b<4;b++) RP_IAMenuButtons[p][b]=RP_IAMenuText(p,236.0+float(b)*43.0,233.0,labels[b],39.0,11.0,0.12,b==3?0xEC8896FF:-1,true,b==0?0xDC2D43FF:(b==3?0x3B2029FF:0x27313BFF));
 RP_IAMenuButtons[p][5]=RP_IAMenuText(p,236.0,253.0,"VOLVER AL INVENTARIO",140.0,9.0,0.10,0xAAB7C4FF,true);
 for(new n;n<RP_IAMenuCount[p];n++) if(RP_IAMenuTD[p][n]==PlayerText:INVALID_TEXT_DRAW){RP_IAMenuHide(p,false);CancelSelectTextDraw(p);return SendClientMessage(p,-1,"No se pudo abrir el menu. Cierra otros paneles.");}
 RP_IAMenuVisible[p]=true;
 for(new n;n<RP_IAMenuCount[p];n++) PlayerTextDrawShow(p,RP_IAMenuTD[p][n]);
 SelectTextDraw(p,0xFF8899FF);return 1;
}
stock RP_IAMenuClick(p,PlayerText:td) {
 if(!RP_IAMenuVisible[p]) return 0;
 for(new b;b<6;b++) if(td==RP_IAMenuTD[p][RP_IAMenuButtons[p][b]]) {
  RP_IAMenuHide(p,b<4);
  return RP_IADialog(p,RP_IA_MENU,b<4,b,"");
 }
 return 1;
}
stock RP_IAMenuCancel(p) {
 if(!RP_IAMenuVisible[p]) return 0;
 RP_IAMenuHide(p,false);RP_IAReset(p);Menu_AbrirInventario(p);return 1;
}
