// Native dialogs for furniture management on Android and PC.
#define MC_MENU 31200
#define MC_LIST 31201
#define MC_CATALOG 31202
#define MC_BUY 31203
#define MC_EDIT 31204
#define MC_SELL 31205
#define MC_COLOR 31206
#define MC_TEXTURE 31207
#define MC_SURFACE 31208
new MC_HouseID[MAX_PLAYERS],MC_Account[MAX_PLAYERS],MC_Slot[MAX_PLAYERS],MC_Record[MAX_PLAYERS];
new MC_Page[MAX_PLAYERS],MC_Rows[MAX_PLAYERS][22],MC_Count[MAX_PLAYERS],MC_Model[MAX_PLAYERS];
new MC_Step[MAX_PLAYERS],MC_Surface[MAX_PLAYERS];
new const Float:MC_Steps[]={0.05,0.25,1.0};
stock MC_House(p) {
 if(!IsPlayerConnected(p) || IsPlayerNPC(p) || !JugadorLogeado[p] || PLAYER_INFO[p][pID]<=0 || GetPlayerState(p)!=PLAYER_STATE_ONFOOT || PLAYER_TEMP[p][VariableCaido]) return -1;
 if(GetPlayerVirtualWorld(p)==0) return -1;
 for(new i;i<MAX_PROPIEDADES;i++) if(PropInfo[i][pEnUso] && PropInfo[i][pIDPropietario]==PLAYER_INFO[p][pID] && PropInfo[i][pVW]==GetPlayerVirtualWorld(p) && PropInfo[i][pInteriorID]==GetPlayerInterior(p)) return i;
 return -1;
}
stock MC_Context(p) {new h=MC_House(p);return h>=0 && h==MC_HouseID[p] && PLAYER_INFO[p][pID]==MC_Account[p];}
stock MC_Selected(p) {
 new s=MC_Slot[p];return MC_Context(p) && s>=0 && s<MAX_OBJETOS_CASAS && PropInfo[MC_HouseID[p]][ModeloMuebles][s]>0 && MC_Record[p]>0 && PropInfo[MC_HouseID[p]][MuebleID][s]==MC_Record[p];
}
stock MC_Meta(model) {for(new i=1;i<sizeof ObjetosInterior;i++) if(ObjetosInterior[i][0]==model) return i;return -1;}
stock MC_MenuShow(p) {
 new h=MC_House(p);if(h<0) return SendClientMessage(p,-1,"Debes estar a pie dentro de una casa tuya.");
 MC_HouseID[p]=h;MC_Account[p]=PLAYER_INFO[p][pID];
 return dialogs_ShowPlayerDialog(p,MC_MENU,DIALOG_STYLE_LIST,"Casa | Muebles","Mis muebles: colocar / ajustar / guardar / vender\nComprar muebles","Elegir","Cerrar");
}
stock MC_ListShow(p,bool:catalog,page=0) {
 if(!MC_Context(p)) return SendClientMessage(p,-1,"Debes permanecer dentro de tu casa.");
 new available[ MAX_OBJETOS_CASAS + sizeof ObjetosInterior ],count,h=MC_HouseID[p];
 if(catalog) {for(new i=1;i<sizeof ObjetosInterior;i++) if(ObjetosInterior[i][0]>0 && ObjetosInterior[i][1]>0) available[count++]=i;}
 else {for(new s;s<MAX_OBJETOS_CASAS;s++) if(PropInfo[h][ModeloMuebles][s]>0 && PropInfo[h][MuebleID][s]>0) available[count++]=s;}
 if(!count) {SendClientMessage(p,-1,"No tienes muebles. Usa Comprar muebles.");return MC_MenuShow(p);}
 page=max(0,min(page,(count-1)/20));MC_Page[p]=page;MC_Count[p]=0;
 new text[2300],line[115];strcat(text,catalog?("Mueble\tPrecio\n"):("Mueble\tEstado\n"));
 for(new n=page*20;n<count && n<page*20+20;n++) {
  new index=available[n],meta=catalog?index:MC_Meta(PropInfo[h][ModeloMuebles][index]);
  if(meta<0) format(line,sizeof line,"Objeto %d\t%s\n",PropInfo[h][ModeloMuebles][index],PropInfo[h][Puesto][index]?("Colocado"):("Guardado"));
  else if(catalog) format(line,sizeof line,"%s\t$%d\n",ObjetosInterior[meta][2],ObjetosInterior[meta][1]);
  else format(line,sizeof line,"#%d %s\t%s\n",index+1,ObjetosInterior[meta][2],PropInfo[h][Puesto][index]?("Colocado"):("Guardado"));
  strcat(text,line);MC_Rows[p][MC_Count[p]++]=index;
 }
 if(page>0) {strcat(text,"Pagina anterior\t\n");MC_Rows[p][MC_Count[p]++]=-1;}
 if((page+1)*20<count) {strcat(text,"Pagina siguiente\t\n");MC_Rows[p][MC_Count[p]++]=-2;}
 return dialogs_ShowPlayerDialog(p,catalog?MC_CATALOG:MC_LIST,DIALOG_STYLE_TABLIST_HEADERS,catalog?("Casa | Comprar muebles"):("Casa | Mis muebles"),text,"Elegir","Volver");
}
stock MC_EditShow(p) {
 if(!MC_Selected(p)) return SendClientMessage(p,-1,"El mueble o la propiedad ya no esta disponible.");
 new title[90];format(title,sizeof title,"Mueble #%d | Parte %d | Paso %.2f m",MC_Slot[p]+1,MC_Surface[p],MC_Steps[MC_Step[p]]);
 return dialogs_ShowPlayerDialog(p,MC_EDIT,DIALOG_STYLE_LIST,title,"Colocar delante de mi\nMover +X\nMover -X\nMover +Y\nMover -Y\nSubir\nBajar\nGirar +15 grados\nGirar -15 grados\nCambiar paso (0.05 / 0.25 / 1 m)\nGuardar mueble\nVender por la mitad del precio\nVolver a mis muebles\nCambiar color\nCambiar textura\nRestaurar aspecto original\nElegir superficie (0 a 15)","Aplicar","Volver");
}
stock MC_Apply(p,row) {
 if(!MC_Selected(p)) return 0;
 new h=MC_HouseID[p],s=MC_Slot[p],put=PropInfo[h][Puesto][s];
 new Float:x=PropInfo[h][MuebleX1][s],Float:y=PropInfo[h][MuebleY1][s],Float:z=PropInfo[h][MuebleZ1][s];
 new Float:rx=PropInfo[h][MuebleX2][s],Float:ry=PropInfo[h][MuebleY2][s],Float:rz=PropInfo[h][MuebleZ2][s],Float:step=MC_Steps[MC_Step[p]];
 if(row==0) {GetPlayerPos(p,x,y,z);GetPosInFrontOfPlayer(p,x,y,1.5);GetPlayerFacingAngle(p,rz);rx=0.0;ry=0.0;put=1;}
 else if(row==10) put=0;
 else {
  if(!put) return SendClientMessage(p,-1,"Primero elige Colocar delante de mi."),0;
  switch(row) {case 1:x+=step;case 2:x-=step;case 3:y+=step;case 4:y-=step;case 5:z+=step;case 6:z-=step;case 7:rz+=15.0;case 8:rz-=15.0;default:return 0;}
 }
 if(put && !IsPlayerInRangeOfPoint(p,10.0,x,y,z)) return SendClientMessage(p,-1,"Acercate al mueble para ajustarlo (maximo 10 metros)."),0;
 new object=PropInfo[h][Inmobiliario][s];
 if(put && !IsValidDynamicObject(object)) {
  object=CreateDynamicObject(PropInfo[h][ModeloMuebles][s],x,y,z,rx,ry,rz,PropInfo[h][pVW],PropInfo[h][pInteriorID]);
  if(!IsValidDynamicObject(object)) return SendClientMessage(p,-1,"No se pudo crear el mueble."),0;
 }
 new q[500];mysql_format(handle_db,q,sizeof q,"UPDATE server_muebles SET x=%f,y=%f,z=%f,x1=%f,y1=%f,z1=%f,Puesto=%d WHERE ID=%d AND CasaID=%d",x,y,z,rx,ry,rz,put,MC_Record[p],h);
 if(!RP_BizSQL(q)) {if(object!=PropInfo[h][Inmobiliario][s] && IsValidDynamicObject(object)) DestroyDynamicObject(object);return SendClientMessage(p,-1,"No se pudo guardar el cambio."),0;}
 PropInfo[h][MuebleX1][s]=x;PropInfo[h][MuebleY1][s]=y;PropInfo[h][MuebleZ1][s]=z;PropInfo[h][MuebleX2][s]=rx;PropInfo[h][MuebleY2][s]=ry;PropInfo[h][MuebleZ2][s]=rz;PropInfo[h][Puesto][s]=put;
 if(!put) {if(IsValidDynamicObject(object)) DestroyDynamicObject(object);PropInfo[h][Inmobiliario][s]=0;}
 else {PropInfo[h][Inmobiliario][s]=object;SetDynamicObjectPos(object,x,y,z);SetDynamicObjectRot(object,rx,ry,rz);MC_ReadMaterials(h,s);}
 return 1;
}
stock MC_Buy(p) {
 if(!MC_Context(p)) return 0;
 new meta=MC_Model[p];MC_Model[p]=-1;if(meta<1 || meta>=sizeof ObjetosInterior) return 0;
 new h=MC_HouseID[p],slot=-1,price=ObjetosInterior[meta][1];
 for(new s;s<MAX_OBJETOS_CASAS;s++) if(PropInfo[h][ModeloMuebles][s]<=0 && PropInfo[h][MuebleID][s]<=0) {slot=s;break;}
 if(slot<0) return SendClientMessage(p,-1,"Tu casa alcanzo el limite de muebles."),0;
 if(price<1 || PLAYER_INFO[p][jDinero]<price) return SendClientMessage(p,-1,"No tienes dinero suficiente para este mueble."),0;
 if(!RP_BizSQL("START TRANSACTION")) return 0;
 new q[500];mysql_format(handle_db,q,sizeof q,"INSERT INTO server_muebles (CasaID,x,y,z,x1,y1,z1,Modelo,EnUso,Puesto) VALUES (%d,0,0,0,0,0,0,%d,1,0)",h,ObjetosInterior[meta][0]);
 new Cache:c=mysql_query(handle_db,q,true),id=cache_insert_id(),bool:ok=mysql_errno(handle_db)==0 && id>0;if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
 if(ok) {mysql_format(handle_db,q,sizeof q,"UPDATE usuarios SET Money=%d WHERE ID=%d",PLAYER_INFO[p][jDinero]-price,PLAYER_INFO[p][pID]);ok=bool:RP_BizSQL(q,true);}
 if(ok) ok=bool:RP_BizSQL("COMMIT");if(!ok) {RP_BizSQL("ROLLBACK");return SendClientMessage(p,-1,"Compra cancelada. No se desconto dinero."),0;}
 PropInfo[h][MuebleID][slot]=id;PropInfo[h][ModeloMuebles][slot]=ObjetosInterior[meta][0];PropInfo[h][Puesto][slot]=0;
 QuitarDinero(p,price);GuardarCuenta(p);MC_Slot[p]=slot;MC_Record[p]=id;MC_Step[p]=1;
 SendClientMessage(p,-1,"Mueble comprado y guardado. Usa Colocar delante de mi.");return MC_EditShow(p);
}
stock MC_Sell(p) {
 if(!MC_Selected(p)) return 0;
 new h=MC_HouseID[p],s=MC_Slot[p],meta=MC_Meta(PropInfo[h][ModeloMuebles][s]);if(meta<1) return 0;
 new reward=ObjetosInterior[meta][1]/2;if(PLAYER_INFO[p][jDinero]>2000000000-reward) return 0;
 if(!RP_BizSQL("START TRANSACTION")) return 0;
 new q[350];mysql_format(handle_db,q,sizeof q,"DELETE FROM server_muebles WHERE ID=%d AND CasaID=%d",MC_Record[p],h);new bool:ok=bool:RP_BizSQL(q,true);
 if(ok) ok=bool:MC_DeleteMaterials(MC_Record[p]);
 if(ok) {mysql_format(handle_db,q,sizeof q,"UPDATE usuarios SET Money=%d WHERE ID=%d",PLAYER_INFO[p][jDinero]+reward,PLAYER_INFO[p][pID]);ok=bool:RP_BizSQL(q,true);}
 if(ok) ok=bool:RP_BizSQL("COMMIT");if(!ok) {RP_BizSQL("ROLLBACK");return SendClientMessage(p,-1,"No se pudo vender. Conservas el mueble."),0;}
 if(IsValidDynamicObject(PropInfo[h][Inmobiliario][s])) DestroyDynamicObject(PropInfo[h][Inmobiliario][s]);
 PropInfo[h][ModeloMuebles][s]=0;PropInfo[h][MuebleID][s]=0;PropInfo[h][Puesto][s]=0;PropInfo[h][Inmobiliario][s]=0;MC_Record[p]=0;
 DarDinero(p,reward);GuardarCuenta(p);SendClientMessageEx(p,-1,"Mueble vendido por $%d.",reward);return MC_ListShow(p,false,MC_Page[p]);
}
stock MC_Dialog(p,dialog,response,row) {
 if(dialog>=MC_COLOR && dialog<=MC_SURFACE) return MC_MaterialDialog(p,dialog,response,row);
 if(dialog<MC_MENU || dialog>MC_SELL) return 0;
 if(!MC_Context(p)) {SendClientMessage(p,-1,"Operacion cancelada: debes estar dentro de tu casa.");return 1;}
 if(!response) {if(dialog!=MC_MENU) MC_MenuShow(p);return 1;}
 if(dialog==MC_MENU) {if(row==0) MC_ListShow(p,false);else if(row==1) MC_ListShow(p,true);return 1;}
 if(dialog==MC_LIST || dialog==MC_CATALOG) {
  if(row<0 || row>=MC_Count[p]) return 1;
  new index=MC_Rows[p][row];if(index<0) {MC_ListShow(p,dialog==MC_CATALOG,MC_Page[p]+(index==-1?-1:1));return 1;}
  if(dialog==MC_CATALOG) {MC_Model[p]=index;new text[200];format(text,sizeof text,"Comprar %s por $%d?\nSe guardara en los muebles de tu casa.",ObjetosInterior[index][2],ObjetosInterior[index][1]);dialogs_ShowPlayerDialog(p,MC_BUY,DIALOG_STYLE_MSGBOX,"Confirmar compra",text,"Comprar","Cancelar");}
  else {MC_Slot[p]=index;MC_Record[p]=PropInfo[MC_HouseID[p]][MuebleID][index];MC_Step[p]=1;MC_Surface[p]=0;MC_EditShow(p);}return 1;
 }
 if(dialog==MC_BUY) {MC_Buy(p);return 1;}
 if(dialog==MC_SELL) {MC_Sell(p);return 1;}
 if(dialog==MC_EDIT) {
  if(!MC_Selected(p)) return 1;
  if(row==13) return MC_MaterialShow(p,MC_COLOR),1;
  if(row==14) return MC_MaterialShow(p,MC_TEXTURE),1;
  if(row==15) return MC_ResetMaterial(p),MC_EditShow(p),1;
  if(row==16) return MC_MaterialShow(p,MC_SURFACE),1;
  if(row==12) return MC_ListShow(p,false,MC_Page[p]),1;
  if(row==11) {new meta=MC_Meta(PropInfo[MC_HouseID[p]][ModeloMuebles][MC_Slot[p]]),text[160];if(meta<1) return 1;format(text,sizeof text,"Vender %s por $%d?",ObjetosInterior[meta][2],ObjetosInterior[meta][1]/2);dialogs_ShowPlayerDialog(p,MC_SELL,DIALOG_STYLE_MSGBOX,"Confirmar venta",text,"Vender","Cancelar");return 1;}
  if(row==9) MC_Step[p]=(MC_Step[p]+1)%sizeof MC_Steps;else MC_Apply(p,row);MC_EditShow(p);return 1;
 }return 1;
}
CMD:muebles(playerid,params[]) {return MC_MenuShow(playerid);}
