// Nexus rojo: catalogo, vista de producto y compra con alternativa nativa.
#include <YSI_Coding\y_hooks>

// Precios del catalogo existente web-local/api/tienda-dp.php, 2026-10-08.
stock EX_VehiclePrice(model) {
 switch(model) {
  case 469:return 35;
  case 584:return 50;
  case 435:return 50;
  case 492:return 10;
  case 515:return 233;
  case 516:return 10;
  case 518:return 10;
  case 521:return 35;
  case 522:return 35;
  case 524:return 35;
  case 526:return 10;
  case 527:return 10;
  case 514:return 35;
  case 510:return 35;
  case 509:return 10;
  case 593:return 85;
  case 494:return 35;
  case 495:return 35;
  case 499:return 20;
  case 502:return 35;
  case 503:return 35;
  case 504:return 35;
  case 507:return 10;
  case 508:return 35;
  case 529:return 10;
  case 540:return 10;
  case 571:return 35;
  case 575:return 15;
  case 576:return 15;
  case 581:return 35;
  case 585:return 10;
  case 586:return 25;
  case 588:return 35;
  case 600:return 15;
  case 568:return 35;
  case 562:return 35;
  case 559:return 35;
  case 541:return 35;
  case 543:return 10;
  case 546:return 10;
  case 547:return 10;
  case 549:return 15;
  case 550:return 10;
  case 555:return 30;
  case 558:return 15;
  case 605:return 5;
  case 401:return 10;
  case 423:return 35;
  case 424:return 35;
  case 426:return 15;
  case 431:return 35;
  case 436:return 10;
  case 437:return 35;
  case 438:return 10;
  case 439:return 35;
  case 440:return 20;
  case 422:return 15;
  case 421:return 20;
  case 402:return 35;
  case 403:return 35;
  case 405:return 20;
  case 408:return 35;
  case 410:return 10;
  case 413:return 10;
  case 418:return 30;
  case 419:return 10;
  case 553:return 90;
  case 420:return 15;
  case 442:return 35;
  case 443:return 35;
  case 462:return 25;
  case 467:return 10;
  case 468:return 35;
  case 470:return 1350;
  case 471:return 35;
  case 474:return 15;
  case 481:return 20;
  case 483:return 20;
  case 461:return 35;
  case 459:return 15;
  case 434:return 35;
  case 455:return 35;
  case 457:return 35;
  case 458:return 10;
  case 453:return 35;
  case 595:return 35;
  case 446:return 35;
  case 493:return 35;
  case 452:return 35;
  case 473:return 30;
  case 454:return 35;
  case 484:return 35;
  case 487:return 110;
 }return 0;
}

#define EX_MENU 31140
#define EX_PRODUCT 31141
#define EX_CONFIRM 31142
#define EX_COLOR1 31143
#define EX_COLOR2 31144
#define EX_MAX 96
new PlayerText:EX_TD[MAX_PLAYERS][EX_MAX];
new EX_Count[MAX_PLAYERS],EX_Action[MAX_PLAYERS][EX_MAX];
new EX_Cat[MAX_PLAYERS],EX_Index[MAX_PLAYERS],EX_Models[8][512],EX_Total[8];
new EX_Owner[MAX_PLAYERS],EX_QuoteTime[MAX_PLAYERS],EX_Pending[MAX_PLAYERS],EX_Timer[MAX_PLAYERS];
new bool:EX_Visible[MAX_PLAYERS],bool:EX_Native[MAX_PLAYERS],bool:EX_Quote[MAX_PLAYERS];
new EX_ConfirmModel[MAX_PLAYERS],EX_ConfirmCat[MAX_PLAYERS],EX_ConfirmIndex[MAX_PLAYERS];
new EX_IgnoreEscape[MAX_PLAYERS];
new const EX_Names[][]={"Ropa","Helicopteros","Autos","Motos","VIP","Coins","Prendas","Cerrar"};
stock EX_IsOpen(p) {return EX_Owner[p]>0 && EX_Owner[p]==PLAYER_INFO[p][pID];}
stock EX_CanReceive(p,m) {return EX_Ready(p) && EX_IsOpen(p) && EX_Pending[p]==m && EX_Model(p)==m;}
stock EX_Ready(p) {
 return IsPlayerConnected(p) && !IsPlayerNPC(p) && JugadorLogeado[p]==1 && GetPlayerState(p)==PLAYER_STATE_ONFOOT && PLAYER_TEMP[p][VariableCaido]!=1 && !EnCombate[p] && GetPlayerInterior(p)==0 && GetPlayerVirtualWorld(p)==0 && IsPlayerInRangeOfPoint(p,5.0,1170.5438,-1700.4456,22.3204);
}
stock EX_Hide(p,bool:cancel=true) {
 new bool:visible=EX_Visible[p];EX_Visible[p]=false;
 for(new n;n<EX_Count[p];n++) PlayerTextDrawDestroy(p,EX_TD[p][n]);
 EX_Count[p]=0;if(visible && cancel) {EX_IgnoreEscape[p]++;CancelSelectTextDraw(p);}
 return 1;
}
stock EX_ResetQuote(p) {
 EX_Quote[p]=false;EX_QuoteTime[p]=0;EX_Pending[p]=0;EX_ConfirmModel[p]=-1;
 PLAYER_TEMP[p][TDP_MODEL]=0;
 if(EX_Timer[p]) {KillTimer(EX_Timer[p]);EX_Timer[p]=0;}return 1;
}
stock EX_Close(p,bool:cancel=true) {EX_Hide(p,cancel);EX_ResetQuote(p);EX_Owner[p]=0;EX_Cat[p]=-1;PLAYER_TEMP[p][ViendoMenu]=0;return 1;}
stock EX_Text(p,Float:x,Float:y,const value[],Float:size=0.20,Float:h=1.05,color=-1,align=1) {
 if(EX_Count[p]>=EX_MAX) return -1;
 new n=EX_Count[p]++;EX_Action[p][n]=-1;
 EX_TD[p][n]=CreatePlayerTextDraw(p,x,y,value);
 PlayerTextDrawFont(p,EX_TD[p][n],1);PlayerTextDrawLetterSize(p,EX_TD[p][n],size,h);
 PlayerTextDrawColor(p,EX_TD[p][n],color);PlayerTextDrawAlignment(p,EX_TD[p][n],align);
 PlayerTextDrawSetOutline(p,EX_TD[p][n],0);PlayerTextDrawSetShadow(p,EX_TD[p][n],0);
 PlayerTextDrawSetProportional(p,EX_TD[p][n],true);return n;
}
stock EX_Box(p,Float:x,Float:y,Float:w,Float:h,color,action=-1) {
 new n=EX_Text(p,x,y,"LD_SPAC:white");if(n<0) return -1;
 PlayerTextDrawFont(p,EX_TD[p][n],4);PlayerTextDrawTextSize(p,EX_TD[p][n],w,h);
 PlayerTextDrawColor(p,EX_TD[p][n],color);PlayerTextDrawSetSelectable(p,EX_TD[p][n],action>=0);EX_Action[p][n]=action;return n;
}
stock EX_Button(p,Float:x,Float:y,Float:w,const label[],action,color=0x292D35FF) {
 EX_Box(p,x,y,w,23.0,color,action);EX_Text(p,x+w/2.0,y+6.0,label,0.17,0.95,-1,2);return 1;
}
stock EX_Table(p) {return EX_Cat[p]==0 && PLAYER_INFO[p][jSexo]==2?7:EX_Cat[p];}
stock EX_Size(p) {new c=EX_Table(p);return c>=0 && c<=7?EX_Total[c]:0;}
stock EX_Model(p) {new c=EX_Table(p);if(c<0 || c>7 || EX_Index[p]<0 || EX_Index[p]>=EX_Total[c]) return -1;return EX_Models[c][EX_Index[p]];}
stock EX_Price(p) {
 switch(EX_Cat[p]) {case 0:return 5;case 4:{switch(EX_Index[p]){case 0:return 30;case 1:return 60;case 2:return 250;}}case 6:return 25;}
 return EX_Quote[p]?PLAYER_TEMP[p][TDP_PRECIO]:0;
}
stock EX_Label(p,value[],len) {
 new c=EX_Cat[p],m=EX_Model(p);
 if(c==0) format(value,len,"Ropa - Modelo %d",m);
 else if(c>=1 && c<=3 && m>=400 && m<=611) format(value,len,"%s",NombreAuto[m-400]);
 else if(c==4) format(value,len,"VIP %d - hasta %d negocios",EX_Index[p]+1,EX_Index[p]==0?2:4);
 else if(c==6) format(value,len,"%s",GetNameObjeto(m));
 else format(value,len,"Coins");return 1;
}
stock EX_Currency(p,value[],len) {format(value,len,"%s",(EX_Cat[p]==4 || EX_Cat[p]==6)?("Coins"):(SERVER_COIN));return 1;}
stock EX_Dialog(p) {
 EX_Hide(p);EX_Native[p]=true;
 if(EX_Cat[p]<0) return ShowPlayerDialog(p,EX_MENU,DIALOG_STYLE_LIST,"Nexus | Tienda Exclusiva","Ropa\nHelicopteros\nAutos\nMotos\nVIP\nCoins\nPrendas\nCerrar","Elegir","Cerrar");
 new name[80],currency[16],text[400];EX_Label(p,name,sizeof name);EX_Currency(p,currency,sizeof currency);
 format(text,sizeof text,"%s - %d %s\nAnterior\nSiguiente\nComprar\nVolver a categorias\nColores del vehiculo",name,EX_Price(p),currency);
 return ShowPlayerDialog(p,EX_PRODUCT,DIALOG_STYLE_LIST,"Nexus | Catalogo",text,"Elegir","Cerrar");
}
stock EX_Show(p) {
 if(!EX_Ready(p) || EX_Owner[p]!=PLAYER_INFO[p][pID]) return EX_Close(p);
 if(EX_Native[p]) return EX_Dialog(p);
 EX_Hide(p,false);new text[128];
 EX_Box(p,36.0,77.0,177.0,268.0,0x0E1218F0);EX_Box(p,36.0,77.0,177.0,3.0,0xE52441FF);
 EX_Text(p,49.0,90.0,"TIENDA ~r~EXCLUSIVA",0.26,1.35);
 format(text,sizeof text,"%d "SERVER_COIN"  /  %d Coins",PLAYER_INFO[p][Moneda],PLAYER_INFO[p][Totems]);EX_Text(p,49.0,111.0,text,0.15,0.85,0xBAC3D0FF);
 for(new c;c<8;c++) {
  new Float:y=132.0+c*24.0;
  EX_Box(p,44.0,y,161.0,23.0,EX_Cat[p]==c?0xD8203DFF:0x171C24EE,c);
  EX_Text(p,55.0,y+5.0,EX_Names[c],0.23,1.2);
  EX_Text(p,194.0,y+5.0,c==7?"X":">",0.20,1.1,-1,3);
 }
 EX_Text(p,49.0,329.0,"/tiendaexclusiva menu",0.14,0.8,0xBAC3D0FF);
 if(EX_Cat[p]>=0 && EX_Cat[p]!=5 && EX_Size(p)>0) {
  new name[80],currency[16],m=EX_Model(p);EX_Label(p,name,sizeof name);EX_Currency(p,currency,sizeof currency);
  EX_Box(p,226.0,77.0,234.0,268.0,0x0E1218F0);EX_Box(p,226.0,77.0,234.0,29.0,0xCC1B35FF);
  format(text,sizeof text,"COMPRAR %s",EX_Names[EX_Cat[p]]);EX_Text(p,343.0,86.0,text,0.24,1.25,-1,2);
  new n=EX_Text(p,239.0,111.0,"_");PlayerTextDrawFont(p,EX_TD[p][n],5);PlayerTextDrawTextSize(p,EX_TD[p][n],208.0,118.0);
  PlayerTextDrawBackgroundColor(p,EX_TD[p][n],0x141A22FF);PlayerTextDrawSetPreviewModel(p,EX_TD[p][n],EX_Cat[p]==4?147:m);
  PlayerTextDrawSetPreviewRot(p,EX_TD[p][n],-16.0,0.0,EX_Cat[p]>=1 && EX_Cat[p]<=3?-55.0:0.0,1.05);
  if(EX_Cat[p]>=1 && EX_Cat[p]<=3) PlayerTextDrawSetPreviewVehCol(p,EX_TD[p][n],PLAYER_TEMP[p][TDP_COLOR1],PLAYER_TEMP[p][TDP_COLOR2]);
  if(strlen(name)>29) name[29]=EOS;EX_Text(p,343.0,232.0,name,0.24,1.2,-1,2);
  if(EX_Pending[p]) format(text,sizeof text,"Consultando precio...");
  else if(EX_Price(p)>0) format(text,sizeof text,"~r~Precio: ~w~%d %s",EX_Price(p),currency);
  else format(text,sizeof text,"Precio no disponible");
  EX_Text(p,343.0,248.0,text,0.22,1.15,-1,2);
  EX_Button(p,238.0,270.0,102.0,"< ANTERIOR",8);EX_Button(p,346.0,270.0,102.0,"SIGUIENTE >",9);
  EX_Button(p,238.0,298.0,102.0,"COMPRAR",10,0xD8203DFF);EX_Button(p,346.0,298.0,102.0,"VOLVER",11);
  format(text,sizeof text,"%d / %d",EX_Index[p]+1,EX_Size(p));EX_Text(p,239.0,329.0,text,0.14,0.8,0xBAC3D0FF);
  if(EX_Cat[p]>=1 && EX_Cat[p]<=3) {EX_Box(p,348.0,325.0,100.0,16.0,0x292D35FF,12);EX_Text(p,398.0,329.0,"CAMBIAR COLORES",0.13,0.75,-1,2);}
 }
 EX_Visible[p]=true;
 for(new n;n<EX_Count[p];n++) {if(EX_TD[p][n]==PlayerText:INVALID_TEXT_DRAW) return EX_Dialog(p);PlayerTextDrawShow(p,EX_TD[p][n]);}
 SelectTextDraw(p,0xFF647AFF);return 1;
}
stock EX_Request(p) {
 EX_ResetQuote(p);
 if(EX_Cat[p]>=1 && EX_Cat[p]<=3) {
  EX_Pending[p]=EX_Model(p);
  if(EX_LocalQuote(p,EX_Pending[p])) return 1;
  EX_Pending[p]=0;SendClientMessage(p,-1,"Este vehiculo no tiene precio en el catalogo.");
 }return EX_Show(p);
}
stock EX_LocalQuote(p,m) {
 new price=EX_VehiclePrice(m);if(price<=0 || !EX_CanReceive(p,m)) return 0;
 new Float:x,Float:y,Float:z,Float:a;
 switch(m) {
  case 430,446,452,453,454,472,473,484,493,595: {x=720.7311;y=-1631.8506;z=-0.3845;a=177.5780;}
  case 487,469: {x=1981.8584;y=-2371.3872;z=14.0095;a=90.0;}
  case 593,553: {x=1628.7157;y=-2625.3000;z=14.0095;a=0.0;}
  default: {
   new const Float:places[][]={
    {1594.9730,-1010.2951,24.6063,187.5361}, {1648.3289,-1089.2202,23.6109,90.7212},
    {1700.3760,-1070.1266,23.6113,180.0457}, {1752.6080,-1014.8112,23.6657,167.1269},
    {1740.2095,-1084.4073,23.6660,359.0909}, {1677.0603,-1106.6633,23.6120,91.0374},
    {1558.2231,-1012.6805,23.6114,180.1122}
   };new i=random(sizeof places);x=places[i][0];y=places[i][1];z=places[i][2];a=places[i][3];
  }
 }
 return CreatePlayerVehicle2(p,m,x,y,z,a,PLAYER_TEMP[p][TDP_COLOR1],PLAYER_TEMP[p][TDP_COLOR2],price,1);
}
forward EX_Timeout(p,owner);
public EX_Timeout(p,owner) {if(EX_Owner[p]!=owner || !EX_Pending[p]) return 1;EX_Timer[p]=0;EX_ResetQuote(p);SendClientMessage(p,-1,"No se obtuvo el precio. Comprueba la web de la tienda y vuelve a elegir el producto.");return EX_Show(p);}
stock EX_Receive(p,model) {
 if(!EX_Ready(p) || EX_Owner[p]!=PLAYER_INFO[p][pID] || EX_Pending[p]!=model || EX_Model(p)!=model) {PLAYER_TEMP[p][TDP_MODEL]=0;return 0;}
 if(EX_Timer[p]) KillTimer(EX_Timer[p]);EX_Timer[p]=0;EX_Pending[p]=0;EX_Quote[p]=true;EX_QuoteTime[p]=gettime()+60;
 return EX_Show(p);
}
stock EX_Category(p,c) {
 if(!EX_Ready(p)) return EX_Close(p);
 if(c==7) return EX_Close(p);
 if(c<0 || c>6) return 1;
 if(EX_Pending[p]) return SendClientMessage(p,-1,"Espera la consulta de precio pendiente.");
 if(c==5) {EX_ResetQuote(p);EX_Cat[p]=5;EX_Hide(p);return ShowPlayerDialog(p,EX_MENU,DIALOG_STYLE_MSGBOX,"Nexus | Coins","La compra de Coins aun no esta disponible en esta tienda.","Volver","Cerrar");}
 if(c==6 && PLAYER_INFO[p][pVip]<2) return SendClientMessage(p,-1,"Las prendas exclusivas requieren VIP 2 o 3.");
 EX_Cat[p]=c;EX_Index[p]=0;PLAYER_TEMP[p][TDP_TIPO]=c;
 if(!EX_Size(p)) {EX_Cat[p]=-1;SendClientMessage(p,-1,"No hay productos disponibles en esta categoria.");return EX_Show(p);}
 return EX_Request(p);
}
stock EX_Open(p) {
 if(!EX_Ready(p)) return SendClientMessage(p,-1,"Acercate a pie a la tienda exclusiva (/gps) para comprar.");
 EX_Close(p);HidePlayerMenu(p);PLAYER_TEMP[p][ViendoMenu]=0;
 EX_Owner[p]=PLAYER_INFO[p][pID];EX_Cat[p]=-1;EX_Native[p]=false;
 PLAYER_TEMP[p][TDP_COLOR1]=-1;PLAYER_TEMP[p][TDP_COLOR2]=-1;return EX_Show(p);
}
stock EX_Buy(p) {
 if(!EX_Ready(p) || EX_Owner[p]!=PLAYER_INFO[p][pID]) return EX_Close(p);
 new c=EX_Cat[p],m=EX_Model(p),price=EX_Price(p);
 if(c<0 || c==5 || m<0 || price<=0 || EX_Pending[p]) return SendClientMessage(p,-1,"Selecciona un producto y espera su precio.");
 if(c>=1 && c<=3 && (!EX_Quote[p] || gettime()>EX_QuoteTime[p])) return EX_Request(p);
 EX_ConfirmModel[p]=m;EX_ConfirmCat[p]=c;EX_ConfirmIndex[p]=EX_Index[p];
 new name[80],currency[16],text[240];EX_Label(p,name,sizeof name);EX_Currency(p,currency,sizeof currency);
 format(text,sizeof text,"Producto: %s\nPrecio: %d %s\n\nConfirmar descuenta el precio indicado de tu cuenta.",name,price,currency);
 EX_Hide(p);return ShowPlayerDialog(p,EX_CONFIRM,DIALOG_STYLE_MSGBOX,"Nexus | Confirmar compra",text,"Confirmar","Volver");
}
stock EX_Commit(p) {
 if(!EX_Ready(p) || EX_Owner[p]!=PLAYER_INFO[p][pID] || EX_ConfirmModel[p]<0 || EX_ConfirmCat[p]!=EX_Cat[p] || EX_ConfirmIndex[p]!=EX_Index[p] || EX_ConfirmModel[p]!=EX_Model(p)) return EX_Close(p);
 new c=EX_Cat[p],m=EX_Model(p),price=EX_Price(p);EX_ConfirmModel[p]=-1;
 if(price<=0) return EX_Close(p);
 if((c==4 || c==6)?PLAYER_INFO[p][Totems]<price:PLAYER_INFO[p][Moneda]<price) {SendClientMessage(p,-1,"No tienes saldo suficiente para esta compra.");return EX_Show(p);}
 if(c>=1 && c<=3) {
  if(!EX_Quote[p] || gettime()>EX_QuoteTime[p] || PLAYER_TEMP[p][TDP_MODEL]!=m) return EX_Request(p);
  EX_Quote[p]=false;RP_CompleteShopVehicle(p);return EX_Request(p);
 }
 if(c==4) AsignarVIP(p,EX_Index[p]+1);
 else if(c==0) OnPlayerModelSelection(p,1,PLAYER_INFO[p][jSexo]==2?RopaMujerBZ:RopaHombreBZ,m);
 else if(c==6) {if(PLAYER_INFO[p][pVip]<2) return EX_Close(p);OnPlayerModelSelection(p,1,objetos,m);}
 GuardarCuenta(p);return EX_Show(p);
}
stock EX_Handle(p,a) {
 if(!EX_Ready(p) || EX_Owner[p]!=PLAYER_INFO[p][pID]) return EX_Close(p);
 if(a>=0 && a<=7) return EX_Category(p,a);
 if(a==11) {if(EX_Pending[p]) return SendClientMessage(p,-1,"Espera la consulta pendiente.");EX_ResetQuote(p);EX_Cat[p]=-1;return EX_Show(p);}
 if(a==10) return EX_Buy(p);
 if(EX_Cat[p]<0) return 1;
 if(a==8 || a==9) {
  if(EX_Pending[p]) return SendClientMessage(p,-1,"Espera la consulta pendiente.");
  if(!EX_Size(p)) return EX_Close(p);
  EX_Index[p]=(EX_Index[p]+EX_Size(p)+(a==8?-1:1))%EX_Size(p);return EX_Request(p);
 }
 if(a==12 && EX_Cat[p]>=1 && EX_Cat[p]<=3 && !EX_Pending[p]) {EX_Hide(p);return ShowPlayerDialog(p,EX_COLOR1,DIALOG_STYLE_INPUT,"Nexus | Color primario","Numero de color: -1 (aleatorio) o 0 a 255.","Siguiente","Volver");}return 1;
}
stock EX_Click(p,PlayerText:td) {if(!EX_Visible[p]) return 0;for(new n;n<EX_Count[p];n++) if(td==EX_TD[p][n]) {if(EX_Action[p][n]>=0) EX_Handle(p,EX_Action[p][n]);return 1;}return 0;}
stock EX_Escape(p) {if(EX_IgnoreEscape[p]>0) {EX_IgnoreEscape[p]--;return 1;}if(!EX_Visible[p]) return 0;EX_Close(p,false);return 1;}
stock EX_Load(c,const filename[]) {
 EX_Total[c]=0;new File:f=fopen(filename,io_read);if(!f) return 0;
 new line[180];while(fread(f,line)) {
  new m=strval(line);if(m<=0) continue;
  if(c>=1 && c<=3 && (m<400 || m>611)) continue;
  if(c==1 && m==447) m=469;
  if(c>=1 && c<=3 && EX_VehiclePrice(m)<=0) continue;
  if(c==6) {new bool:found=false;for(new i;i<sizeof OBJETOS_INFO;i++) if(OBJETOS_INFO[i][obj_ID]==m) {found=true;break;}if(!found) continue;}
  new bool:duplicate=false;for(new i;i<EX_Total[c];i++) if(EX_Models[c][i]==m) duplicate=true;
  if(duplicate) continue;if(EX_Total[c]>=512) break;EX_Models[c][EX_Total[c]++]=m;
 }fclose(f);return EX_Total[c];
}
CMD:tiendaexclusiva(playerid,params[]) {
 if(!EX_Ready(playerid)) return SendClientMessage(playerid,-1,"Acercate a pie a la tienda exclusiva (/gps).");
 if(!params[0]) return EX_Open(playerid);
 if(!strcmp(params,"cerrar",true)) return EX_Close(playerid);
 if(EX_Owner[playerid]!=PLAYER_INFO[playerid][pID]) EX_Open(playerid);
 if(!strcmp(params,"menu",true)) return EX_Dialog(playerid);
 if(!strcmp(params,"anterior",true)) return EX_Handle(playerid,8);
 if(!strcmp(params,"siguiente",true)) return EX_Handle(playerid,9);
 if(!strcmp(params,"comprar",true)) return EX_Buy(playerid);
 if(!strcmp(params,"colores",true)) return EX_Handle(playerid,12);
 return SendClientMessage(playerid,-1,"/tiendaexclusiva [menu / anterior / siguiente / comprar / colores / cerrar]");
}
hook OnGameModeInit() {EX_Load(0,"RopaHombreBZ.txt");EX_Load(7,"RopaMujerBZ.txt");EX_Load(1,"helirc.txt");EX_Load(2,"vehrc.txt");EX_Load(3,"motosar.txt");EX_Load(6,"prendas.txt");EX_Total[4]=3;EX_Models[4][0]=1;EX_Models[4][1]=2;EX_Models[4][2]=3;return 1;}
hook OnPlayerConnect(playerid) {EX_IgnoreEscape[playerid]=0;EX_Count[playerid]=0;EX_Visible[playerid]=false;EX_Cat[playerid]=-1;EX_Owner[playerid]=0;EX_ConfirmModel[playerid]=-1;EX_Timer[playerid]=0;EX_Pending[playerid]=0;EX_Quote[playerid]=false;return 1;}
hook OnPlayerDisconnect(playerid,reason) {EX_Close(playerid,false);return 1;}
hook OnPlayerDeath(playerid,killerid,reason) {EX_Close(playerid);return 1;}
hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
 if(dialogid<EX_MENU || dialogid>EX_COLOR2) return 1;
 if(!EX_Ready(playerid) || EX_Owner[playerid]!=PLAYER_INFO[playerid][pID]) return EX_Close(playerid);
 if(dialogid==EX_MENU) {if(!response) return EX_Close(playerid);if(EX_Cat[playerid]==5 || listitem<0) {EX_Cat[playerid]=-1;return EX_Show(playerid);}return EX_Category(playerid,listitem);}
 if(dialogid==EX_PRODUCT) {if(!response) return EX_Close(playerid);switch(listitem){case 0:return EX_Show(playerid);case 1:return EX_Handle(playerid,8);case 2:return EX_Handle(playerid,9);case 3:return EX_Buy(playerid);case 4:return EX_Handle(playerid,11);case 5:return EX_Handle(playerid,12);}return 1;}
 if(dialogid==EX_CONFIRM) {if(!response){EX_ConfirmModel[playerid]=-1;return EX_Show(playerid);}return EX_Commit(playerid);}
 if(!response) return EX_Show(playerid);
 if(EX_Cat[playerid]<1 || EX_Cat[playerid]>3 || EX_Pending[playerid]) return EX_Close(playerid);
 new color;if(sscanf(inputtext,"d",color) || color < -1 || color>255) {SendClientMessage(playerid,-1,"Color invalido: -1 o un numero de 0 a 255.");return ShowPlayerDialog(playerid,dialogid,DIALOG_STYLE_INPUT,"Nexus | Color","Numero de color: -1 o 0 a 255.","Aceptar","Volver");}
 if(dialogid==EX_COLOR1) {PLAYER_TEMP[playerid][TDP_COLOR1]=color;return ShowPlayerDialog(playerid,EX_COLOR2,DIALOG_STYLE_INPUT,"Nexus | Color secundario","Numero de color: -1 o 0 a 255.","Aceptar","Volver");}
 PLAYER_TEMP[playerid][TDP_COLOR2]=color;return EX_Request(playerid);
}
