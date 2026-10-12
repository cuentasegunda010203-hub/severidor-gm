// Showrooms nativos: cinco mapas, catalogo individual y compra transaccional.
#include <YSI_Coding\y_hooks>
#define DC_MAX (512)
#define DC_MENU (31210)
#define DC_BUY (31211)
#define DC_LIST (31212)
#define DC_WORLD (74000)
enum DC_Item {dcDB,dcDealer,dcModel,dcPrice,dcCurrency};
new DC_Items[DC_MAX][DC_Item],DC_Count;
new bool:DC_Active[MAX_PLAYERS],bool:DC_Pending[MAX_PLAYERS],bool:DC_SavedBack[MAX_PLAYERS];
new DC_Owner[MAX_PLAYERS],DC_Dealer[MAX_PLAYERS],DC_Index[MAX_PLAYERS],DC_Color[MAX_PLAYERS];
new DC_Vehicle[MAX_PLAYERS],DC_Luxury[MAX_PLAYERS][2],DC_Timer[MAX_PLAYERS],DC_Angle[MAX_PLAYERS];
new DC_World[MAX_PLAYERS],DC_Interior[MAX_PLAYERS],Float:DC_Back[MAX_PLAYERS][4];
new PlayerText:DC_TD[MAX_PLAYERS][22],DC_TDCount[MAX_PLAYERS],DC_Action[MAX_PLAYERS][22];
new DC_IgnoreEscape[MAX_PLAYERS],DC_Quote[MAX_PLAYERS],DC_ListRows[MAX_PLAYERS][14],DC_ListCount[MAX_PLAYERS];
new DC_Actor[5];new DC_Display[5][2];new bool:DC_Exhibition[MAX_VEHICLES];
new Float:DC_MapX[5],Float:DC_MapY[5],Float:DC_MapZ[5];
static const DC_Names[][]={"Unity | Industrial","Grotti | Signature","Coutt & Schutz | Executive","Wang SF | Technology","Wang LS | Urban"};
static const DC_Accent[]={0xEBA34AFF,0xDDB866FF,0x799CCFFF,0x4AE8DAFF,0xEF4158FF};
stock DC_CreateVehicle(model,Float:x,Float:y,Float:z,Float:a,c1,c2,respawn) {
 new v=CreateVehicle(model,x,y,z,a,c1,c2,respawn);
 if(!v || v==INVALID_VEHICLE_ID) return 0;
 new blank[VI];VehiculosInfo[v]=blank;VehiculosInfo[v][vmodelo]=model;ValidVeh[v]=true;DC_Exhibition[v]=true;return v;
}
stock DC_DestroyVehicle(v) {if(v>0 && v<MAX_VEHICLES) {DC_Exhibition[v]=false;DestroyVehicleEx(v);}return 1;}
stock DC_RejectExhibition(p,v) {if(v>0 && v<MAX_VEHICLES && DC_Exhibition[v]) {RemovePlayerFromVehicle(p);ClearAnimations(p);SendClientMessage(p,-1,"Este auto es de exhibicion. Consulta los modelos en /concesionario.");return 1;}return 0;}
stock DC_Live(p) {return IsPlayerConnected(p) && !IsPlayerNPC(p) && LogeoCorrecto[p] && PLAYER_INFO[p][pID]>0;}
stock DC_Safe(p) {return DC_Live(p) && !PLAYER_INFO[p][Agonizando] && !PLAYER_TEMP[p][VariableCaido] && !EnCombate[p] && !PLAYER_INFO[p][arrestado] && !PLAYER_INFO[p][pTiempoCarcel] && !PLAYER_INFO[p][pTiempoJail];}
stock DC_Closest(Float:x,Float:y) {
 new best=-1;new Float:dist=999999999.0;
 for(new d;d<5;d++) {new Float:v=floatpower(x-Concesionaria_Spawn_Positions[d][0],2.0)+floatpower(y-Concesionaria_Spawn_Positions[d][1],2.0);if(v<dist){dist=v;best=d;}}
 return best;
}
stock DC_ResetCatalog() {DC_Count=0;return 1;}
stock DC_Import(db,model,price,currency,Float:x,Float:y) {
 if(DC_Count>=DC_MAX || model<400 || model>611 || price<1 || currency<0 || currency>1) return 0;
 DC_Items[DC_Count][dcDB]=db;DC_Items[DC_Count][dcDealer]=DC_Closest(x,y);DC_Items[DC_Count][dcModel]=model;
 DC_Items[DC_Count][dcPrice]=price;DC_Items[DC_Count][dcCurrency]=currency;DC_Count++;return 1;
}
stock DC_MapObject(d,model,Float:x,Float:y,Float:z,Float:rz=0.0,color=0) {
 new obj=CreateDynamicObject(model,DC_MapX[d]+x,DC_MapY[d]+y,DC_MapZ[d]+z,0.0,0.0,rz,-1,0,-1,120.0,120.0);
 if(color) SetDynamicObjectMaterial(obj,0,19379,"none","none",color);return obj;
}
stock DC_Map(d,bool:outside=false) {
 DC_MapX[d]=outside?Concesionaria_Spawn_Positions[d][0]+8.0:1000.0+100.0*d;DC_MapY[d]=outside?Concesionaria_Spawn_Positions[d][1]+12.0:1000.0;DC_MapZ[d]=outside?Concesionaria_Spawn_Positions[d][2]+0.4:1500.0;
 // Floors and ceilings; room dimensions change with the architectural profile.
 new dark=d==0 || d==2 || d==4;new floorColor=dark?0xFF25292E:0xFFE5E6E2;
 for(new ix;ix<3;ix++) for(new iy;iy<3;iy++) {
  new obj=CreateDynamicObject(19379,DC_MapX[d]-10.5+10.5*ix,DC_MapY[d]-9.6+9.6*iy,DC_MapZ[d]-0.10,0.0,90.0,0.0,-1,0,-1,120.0,120.0);
  SetDynamicObjectMaterial(obj,0,19379,"none","none",floorColor);
  obj=CreateDynamicObject(19379,DC_MapX[d]-10.5+10.5*ix,DC_MapY[d]-9.6+9.6*iy,DC_MapZ[d]+6.2,0.0,90.0,0.0,-1,0,-1,120.0,120.0);
  SetDynamicObjectMaterial(obj,0,19379,"none","none",0xFF151A21);
 }
 for(new side;side<2;side++) for(new n;n<10;n++) {
  DC_MapObject(d,19353,-15.8+side*31.6,-12.8+n*3.2,1.65,0.0,0xFF303640);
  if(side || n!=1) DC_MapObject(d,19353,-14.4+n*3.2,-14.4+side*28.8,1.65,90.0,0xFF303640);
 }
 // Glass gallery, illuminated columns, reception and seating vary per site.
 for(new n;n<5;n++) DC_MapObject(d,19466,-12.0+n*2.3,14.35,1.7,90.0);
 new sign=DC_MapObject(d,19353,3.0,13.9,2.8,90.0);
 SetDynamicObjectMaterialText(sign,0,DC_Names[d],OBJECT_MATERIAL_SIZE_512x256,"Arial",30,1,0xFFFFFFFF,0xFF161C25,1);
 for(new n;n<4;n++) {
  DC_MapObject(d,18762,-12.0+n*8.0,12.0,2.4,0.0,d==1?0xFFB99A55:0xFF45515F);
  DC_MapObject(d,18647,-12.0+n*8.0,11.65,3.8,90.0);
 }
 switch(d) {
  case 0: { // Industrial: exposed beams and a warehouse reception.
   for(new n;n<4;n++) DC_MapObject(d,18762,-11.0+n*7.0,-5.0,4.9,90.0,0xFFAD7840);
   DC_MapObject(d,2190,-11.0,-8.0,0.0,90.0);DC_MapObject(d,1760,-12.0,2.0,0.0,90.0);
  }
  case 1: { // Signature: gold frames, a central island and paired lounge seats.
   DC_MapObject(d,19325,-7.0,2.0,1.7,0.0);DC_MapObject(d,19325,-7.0,-5.0,1.7,0.0);
   DC_MapObject(d,2190,-11.0,-6.0,0.0);DC_MapObject(d,1760,-11.0,4.0,0.0,90.0);DC_MapObject(d,1760,-8.0,4.0,0.0,270.0);
  }
  case 2: { // Executive: glass office, dark surfaces and a blue gallery.
   for(new n;n<3;n++) DC_MapObject(d,19466,-7.0,-8.0+n*2.3,1.7,0.0);
   DC_MapObject(d,2190,-11.0,-9.0,0.0,90.0);DC_MapObject(d,1760,-12.0,4.0,0.0,90.0);DC_MapObject(d,1760,-12.0,8.0,0.0,90.0);
  }
  case 3: { // Technology: white open plan, transparent divisions and cyan lighting.
   DC_MapObject(d,19325,-8.0,7.0,1.7,90.0);DC_MapObject(d,2190,-12.0,-7.0,0.0,90.0);
   for(new n;n<4;n++) DC_MapObject(d,18647,-12.0+n*7.5,3.0,5.8,90.0);
   DC_MapObject(d,1760,-12.0,6.0,0.0,90.0);
  }
  case 4: { // Urban: staggered pillars, graphite lounge and red reception panels.
   DC_MapObject(d,2190,-10.0,-8.0,0.0,45.0);DC_MapObject(d,1760,-12.0,1.0,0.0,90.0);DC_MapObject(d,1760,-8.0,8.0,0.0,180.0);
   for(new n;n<3;n++) DC_MapObject(d,18762,-12.0+n*4.0,8.0-n*3.0,2.4,0.0,0xFF9E293E);
  }
 }
 new studioSign=DC_MapObject(d,19353,5.0,7.1,2.8,90.0);
 SetDynamicObjectMaterialText(studioSign,0,"VISTA EN VIVO",OBJECT_MATERIAL_SIZE_512x256,"Arial",32,1,0xFFFFFFFF,0xFF161C25,1);
 CreateDynamicActor(187,DC_MapX[d]-11.0,DC_MapY[d]-8.0,DC_MapZ[d]+0.5,180.0,1,100.0,-1,0);
 // The preview podium and two exhibition bays.
 for(new n;n<3;n++) {new Float:x=n?(-8.0+float(n)*7.0):5.0;new Float:y=n?9.0:2.0;
  new obj=CreateDynamicObject(19379,DC_MapX[d]+x,DC_MapY[d]+y,DC_MapZ[d]+0.02,0.0,90.0,0.0,-1,0,-1,120.0,120.0);
  SetDynamicObjectMaterial(obj,0,19379,"none","none",0xFF343B45);
 }
 return 1;
}
stock DC_Hide(p) {
 for(new n;n<DC_TDCount[p];n++) PlayerTextDrawDestroy(p,DC_TD[p][n]);DC_TDCount[p]=0;
 return 1;
}
stock DC_Close(p,bool:restore=true) {
 if(!DC_Active[p]) return 1;DC_Active[p]=false;
 if(DC_Timer[p]) KillTimer(DC_Timer[p]);DC_Timer[p]=0;DC_Quote[p]=0;
 DC_Hide(p);DC_IgnoreEscape[p]++;CancelSelectTextDraw(p);
 if(DC_Vehicle[p]) {DC_DestroyVehicle(DC_Vehicle[p]);DC_Vehicle[p]=0;}
 for(new n;n<2;n++) if(DC_Luxury[p][n]) {DC_DestroyVehicle(DC_Luxury[p][n]);DC_Luxury[p][n]=0;}
 if(restore && IsPlayerConnected(p)) {
  SetPlayerVirtualWorld(p,DC_World[p]);SetPlayerInterior(p,DC_Interior[p]);
  SetPlayerPos(p,DC_Back[p][0],DC_Back[p][1],DC_Back[p][2]);SetPlayerFacingAngle(p,DC_Back[p][3]);
  SetCameraBehindPlayer(p);TogglePlayerControllable(p,true);
 }
 return 1;
}
stock DC_AccountPosition(p) {
 if(!DC_Active[p] && !DC_SavedBack[p]) return 0;
 PLAYER_INFO[p][@X]=DC_Back[p][0];PLAYER_INFO[p][@Y]=DC_Back[p][1];PLAYER_INFO[p][@Z]=DC_Back[p][2];PLAYER_INFO[p][@A]=DC_Back[p][3];
 PLAYER_INFO[p][pInterior]=DC_Interior[p];PLAYER_INFO[p][pMundoVirtual]=DC_World[p];return 1;
}
stock DC_Next(p,step) {
 new start=DC_Index[p];
 for(new n;n<DC_Count;n++) {start=(start+step+DC_Count)%DC_Count;if(DC_Items[start][dcDealer]==DC_Dealer[p]) {DC_Index[p]=start;DC_Quote[p]=0;return 1;}}
 return 0;
}
stock DC_Text(p,Float:x,Float:y,const text[],Float:w=0.21,Float:h=1.1,color=-1) {
 if(DC_TDCount[p]>=22) return -1;new n=DC_TDCount[p];
 DC_TD[p][n]=CreatePlayerTextDraw(p,x,y,text);if(DC_TD[p][n]==PlayerText:INVALID_TEXT_DRAW) return -1;
 DC_TDCount[p]++;DC_Action[p][n]=-1;PlayerTextDrawFont(p,DC_TD[p][n],1);PlayerTextDrawLetterSize(p,DC_TD[p][n],w,h);
 PlayerTextDrawColor(p,DC_TD[p][n],color);PlayerTextDrawSetShadow(p,DC_TD[p][n],0);PlayerTextDrawSetOutline(p,DC_TD[p][n],1);return n;
}
stock DC_Box(p,Float:x,Float:y,Float:w,Float:h,color,action=-1) {
 new n=DC_Text(p,x,y,"LD_SPAC:white");if(n<0) return 0;
 PlayerTextDrawFont(p,DC_TD[p][n],4);PlayerTextDrawTextSize(p,DC_TD[p][n],w,h);PlayerTextDrawColor(p,DC_TD[p][n],color);
 if(action>=0) {DC_Action[p][n]=action;PlayerTextDrawSetSelectable(p,DC_TD[p][n],true);}return 1;
}
stock DC_Button(p,Float:y,const label[],action) {DC_Box(p,32.0,y,190.0,24.0,0x303A48FF,action);DC_Text(p,42.0,y+5.0,label,0.18,1.0);return 1;}
stock DC_Menu(p) {
 if(!DC_Active[p]) return 1;DC_IgnoreEscape[p]++;CancelSelectTextDraw(p);
 return dialogs_ShowPlayerDialog(p,DC_MENU,DIALOG_STYLE_LIST,"NEXUS MOTORS | Catalogo","Siguiente vehiculo\nAnterior vehiculo\nComprar / confirmar\nCambiar color\nCambiar angulo de camara\nLista de modelos\nVolver a vista cinematografica\nSalir del concesionario","Elegir","Salir");
}
stock DC_Camera(p,bool:initial=false) {
 new Float:base=1000.0+100.0*DC_Dealer[p],a=DC_Angle[p]%3;
 new Float:xs[]={12.0,11.0,-2.0},Float:ys[]={-9.0,0.0,-7.0};
 if(initial) {SetPlayerCameraPos(p,base+xs[a],1000.0+ys[a],1503.1);SetPlayerCameraLookAt(p,base+2.0,1002.0,1500.8);}
 else {new Float:x,Float:y,Float:z;GetPlayerCameraPos(p,x,y,z);InterpolateCameraPos(p,x,y,z,base+xs[a],1000.0+ys[a],1503.1,6500,CAMERA_MOVE);InterpolateCameraLookAt(p,base+2.0,1002.0,1500.8,base+2.0,1002.0,1500.8,6500,CAMERA_MOVE);}
 return 1;
}
stock DC_Show(p,bool:replace=true) {
 if(!DC_Active[p] || !DC_Live(p) || DC_Owner[p]!=PLAYER_INFO[p][pID]) return DC_Close(p);
 if(replace) {
  if(DC_Vehicle[p]) DC_DestroyVehicle(DC_Vehicle[p]);DC_Vehicle[p]=0;
  new v=DC_CreateVehicle(DC_Items[DC_Index[p]][dcModel],1005.0+100.0*DC_Dealer[p],1002.0,1500.8,150.0,DC_Color[p],DC_Color[p],-1);
  if(v==INVALID_VEHICLE_ID || !v) {SendClientMessage(p,-1,"No hay espacio para la vista en vivo. Intenta luego.");return DC_Close(p);}
  DC_Vehicle[p]=v;SetVehicleVirtualWorld(v,DC_WORLD+p);SetVehicleParamsEx(v,0,1,0,1,0,0,0);DC_Camera(p,true);
 }
 DC_Hide(p);new i=DC_Index[p],text[128];DC_Box(p,23.0,47.0,210.0,352.0,0x111820EE);DC_Box(p,23.0,47.0,210.0,4.0,DC_Accent[DC_Dealer[p]]);
 DC_Text(p,32.0,63.0,"NEXUS MOTORS",0.30,1.6,DC_Accent[DC_Dealer[p]]);DC_Text(p,32.0,91.0,DC_Names[DC_Dealer[p]],0.16,1.0);
 DC_Text(p,32.0,125.0,NombreAuto[DC_Items[i][dcModel]-400],0.30,1.5);
 format(text,sizeof text,"%d %s",DC_Items[i][dcPrice],DC_Items[i][dcCurrency]?SERVER_COIN:"dolares");DC_Text(p,32.0,153.0,text,0.24,1.2,0xE8C275FF);
 format(text,sizeof text,"Color %d | Modelo %d",DC_Color[p],DC_Items[i][dcModel]);DC_Text(p,32.0,176.0,text,0.17,1.0);
 DC_Button(p,203.0,"< ANTERIOR",0);DC_Button(p,233.0,"SIGUIENTE >",1);DC_Button(p,263.0,"COMPRAR",2);
 DC_Button(p,293.0,"COLORES / CAMARA / LISTA",3);DC_Button(p,323.0,"SALIR",4);
 DC_Text(p,32.0,359.0,"/concesionario menu",0.16,0.9);DC_Text(p,32.0,375.0,"Exhibicion de lujo: no se vende",0.13,0.8);
 if(DC_TDCount[p]<19) {DC_Hide(p);return DC_Menu(p);}
 for(new n;n<DC_TDCount[p];n++) PlayerTextDrawShow(p,DC_TD[p][n]);SelectTextDraw(p,DC_Accent[DC_Dealer[p]]);return 1;
}
stock DC_Open(p) {
 if(DC_Active[p]) return DC_Show(p,false);
 if(!DC_Safe(p) || GetPlayerState(p)!=PLAYER_STATE_ONFOOT) return SendClientMessage(p,-1,"Acercate al vendedor a pie, fuera de combate y con la cuenta cargada."),1;
 if(GetPlayerVirtualWorld(p)!=0 || GetPlayerInterior(p)!=0) return SendClientMessage(p,-1,"Acercate al NPC en la entrada del concesionario."),1;
 new d=ConceCercano(p);if(d<0 || !IsPlayerInRangeOfPoint(p,5.0,Concesionaria_Spawn_Positions[d][0]-3.0,Concesionaria_Spawn_Positions[d][1],Concesionaria_Spawn_Positions[d][2]+0.4)) return SendClientMessage(p,-1,"Usa F o /concesionario junto al vendedor."),1;
 new first=-1;for(new n;n<DC_Count;n++) if(DC_Items[n][dcDealer]==d){first=n;break;}
 if(first<0) return SendClientMessage(p,-1,"El concesionario no tiene modelos registrados en el catalogo."),1;
 new sessions;for(new n;n<MAX_PLAYERS;n++) if(DC_Active[n]) sessions++;if(sessions>=24) return SendClientMessage(p,-1,"Todas las salas estan ocupadas; intenta en un momento."),1;
 GetPlayerPos(p,DC_Back[p][0],DC_Back[p][1],DC_Back[p][2]);GetPlayerFacingAngle(p,DC_Back[p][3]);DC_World[p]=GetPlayerVirtualWorld(p);DC_Interior[p]=GetPlayerInterior(p);
 DC_Active[p]=true;DC_SavedBack[p]=false;DC_Owner[p]=PLAYER_INFO[p][pID];DC_Dealer[p]=d;DC_Index[p]=first;DC_Color[p]=1;DC_Angle[p]=0;DC_Quote[p]=0;
 SetPlayerVirtualWorld(p,DC_WORLD+p);SetPlayerInterior(p,0);SetPlayerPos(p,988.0+100.0*d,992.0,1500.5);TogglePlayerControllable(p,false);Streamer_Update(p);
 new luxury[]={411,451};for(new n;n<2;n++) {
  new v=DC_CreateVehicle(luxury[n],999.0+100.0*d+7.0*n,1009.0,1500.8,180.0,n==1?3:1,1,-1);
  if(v && v!=INVALID_VEHICLE_ID) {DC_Luxury[p][n]=v;SetVehicleVirtualWorld(v,DC_WORLD+p);SetVehicleParamsEx(v,0,1,0,1,0,0,0);}
 }
 DC_Timer[p]=SetTimerEx("DC_Cinema",7000,true,"dd",p,DC_Owner[p]);return DC_Show(p);
}
forward DC_Cinema(p,account);
public DC_Cinema(p,account) {if(!DC_Active[p] || !DC_Live(p) || PLAYER_INFO[p][pID]!=account || !DC_Safe(p)) return DC_Close(p);DC_Angle[p]++;return DC_Camera(p);}
stock DC_Confirm(p) {
 if(!DC_Active[p] || DC_Pending[p]) return 1;DC_Quote[p]=gettime()+45;new i=DC_Index[p],text[450];
 format(text,sizeof text,"Vehiculo: %s\nPrecio: %d %s\nColor: %d\n\nLa compra se guarda en tu cuenta. Se verifican el saldo y el limite VIP.\nLos autos de lujo del showroom son solo exhibicion.\nEntrega en la salida del concesionario.",NombreAuto[DC_Items[i][dcModel]-400],DC_Items[i][dcPrice],DC_Items[i][dcCurrency]?SERVER_COIN:"dolares",DC_Color[p]);
 DC_IgnoreEscape[p]++;CancelSelectTextDraw(p);return dialogs_ShowPlayerDialog(p,DC_BUY,DIALOG_STYLE_MSGBOX,"NEXUS MOTORS | Confirmar compra",text,"Comprar","Volver");
}
stock DC_Purchase(p) {
 if(!DC_Active[p] || !DC_Safe(p) || DC_Owner[p]!=PLAYER_INFO[p][pID] || DC_Pending[p] || gettime()>DC_Quote[p] || !DC_Quote[p]) return 1;
 DC_Quote[p]=0;new i=DC_Index[p],d=DC_Dealer[p],count,slot;
 new models[5];models[0]=PLAYER_INFO[p][vModelo];models[1]=PLAYER_INFO[p][vModelo2];models[2]=PLAYER_INFO[p][vModelo3];models[3]=PLAYER_INFO[p][vModelo4];models[4]=PLAYER_INFO[p][vModelo5];
 for(new n;n<5;n++) {if(models[n])count++;else if(!slot)slot=n+1;}
 new limit=min(5,2+max(0,PLAYER_INFO[p][pVip]));if(!slot || count>=limit) return SendClientMessage(p,-1,"Alcanzaste el limite de vehiculos de tu membresia."),DC_Menu(p);
 new price=DC_Items[i][dcPrice],currency=DC_Items[i][dcCurrency],cash=PLAYER_INFO[p][jDinero],gz=PLAYER_INFO[p][Moneda];
 if((currency?gz:cash)<price) return SendClientMessage(p,-1,"No tienes saldo suficiente para ese vehiculo."),DC_Menu(p);
 new q[1000];DC_Pending[p]=true;
 if(!RP_BizSQL("START TRANSACTION")) {DC_Pending[p]=false;return SendClientMessage(p,-1,"No se pudo iniciar la compra."),DC_Menu(p);}
 // Lock the account before checking persisted vehicle slots; no payment on a failed insert.
 format(q,sizeof q,"SELECT ID FROM usuarios WHERE ID=%d FOR UPDATE",DC_Owner[p]);new Cache:c=mysql_query(handle_db,q,true);new bool:ok=mysql_errno(handle_db)==0 && cache_num_rows()==1;if(c!=MYSQL_INVALID_CACHE)cache_delete(c);
 format(q,sizeof q,"SELECT id FROM p_vehicles WHERE Propietario=%d AND Garage=0",DC_Owner[p]);c=mysql_query(handle_db,q,true);ok=ok && mysql_errno(handle_db)==0 && cache_num_rows()<limit;if(c!=MYSQL_INVALID_CACHE)cache_delete(c);
 new Float:x=Concesionaria_Spawn_Positions[d][0],Float:y=Concesionaria_Spawn_Positions[d][1],Float:z=Concesionaria_Spawn_Positions[d][2],Float:a=Concesionaria_Spawn_Positions[d][3];
 format(q,sizeof q,"INSERT INTO p_vehicles(Propietario,Slot,Modelo,Precio,vMoneda,Color1,Color2,X,Y,Z,A,EstacionadoX,EstacionadoY,EstacionadoZ,EstacionadoA,Garage,Patente,vfaccion) VALUES(%d,%d,%d,%d,%d,%d,%d,%f,%f,%f,%f,%f,%f,%f,%f,0,'NEXUS',0)",DC_Owner[p],slot,DC_Items[i][dcModel],price,currency,DC_Color[p],DC_Color[p],x,y,z,a,x,y,z,a);
 new db;if(ok) {c=mysql_query(handle_db,q,true);db=cache_insert_id();ok=mysql_errno(handle_db)==0 && db>0;if(c!=MYSQL_INVALID_CACHE)cache_delete(c);}
 if(currency)gz-=price;else cash-=price;
 format(q,sizeof q,"UPDATE usuarios SET Money=%d,Moneda=%d WHERE ID=%d",cash,gz,DC_Owner[p]);if(ok)ok=RP_BizSQL(q);
 if(!ok || !RP_BizSQL("COMMIT")) {RP_BizSQL("ROLLBACK");DC_Pending[p]=false;SendClientMessage(p,-1,"No se pudo guardar la compra. No se cobro el vehiculo.");return DC_Menu(p);}
 if(currency)PLAYER_INFO[p][Moneda]=gz;else QuitarDinero(p,price);
 switch(slot) {case 1:PLAYER_INFO[p][vModelo]=DC_Items[i][dcModel];case 2:PLAYER_INFO[p][vModelo2]=DC_Items[i][dcModel];case 3:PLAYER_INFO[p][vModelo3]=DC_Items[i][dcModel];case 4:PLAYER_INFO[p][vModelo4]=DC_Items[i][dcModel];case 5:PLAYER_INFO[p][vModelo5]=DC_Items[i][dcModel];}
 DC_Close(p);DC_Pending[p]=false;new plate[10];format(plate,sizeof plate,"NX%d",db);
 mysql_format(handle_db,q,sizeof q,"UPDATE p_vehicles SET Patente='%e' WHERE id=%d",plate,db);RP_BizSQL(q);
 format(q,sizeof q,"SELECT * FROM p_vehicles WHERE id=%d AND Propietario=%d",db,PLAYER_INFO[p][pID]);mysql_tquery(handle_db,q,"DC_Deliver","ddd",p,PLAYER_INFO[p][pID],slot);
 SendClientMessage(p,-1,"Compra guardada. Tu vehiculo se entrega en la salida del concesionario.");return 1;
}
forward DC_Deliver(p,account,slot);
public DC_Deliver(p,account,slot) {if(!DC_Live(p) || PLAYER_INFO[p][pID]!=account || cache_num_rows()!=1)return 1;L_Vehicles(slot,p);return 1;}
stock DC_List(p) {
 new text[1800]="Modelo\tPrecio",row[120];DC_ListCount[p]=0;
 for(new n;n<DC_Count && DC_ListCount[p]<14;n++) if(DC_Items[n][dcDealer]==DC_Dealer[p]) {
  DC_ListRows[p][DC_ListCount[p]++]=n;format(row,sizeof row,"\n%s\t%d %s",NombreAuto[DC_Items[n][dcModel]-400],DC_Items[n][dcPrice],DC_Items[n][dcCurrency]?SERVER_COIN:"$");strcat(text,row);
 }
 DC_IgnoreEscape[p]++;CancelSelectTextDraw(p);return dialogs_ShowPlayerDialog(p,DC_LIST,DIALOG_STYLE_TABLIST_HEADERS,"Modelos | Usa siguiente para recorrer todos",text,"Ver","Volver");
}
CMD:concesionario(playerid,params[]) {
 if(!DC_Active[playerid]) return DC_Open(playerid);
 if(isnull(params)) return DC_Show(playerid,false);
 if(!strcmp(params,"cerrar",true) || !strcmp(params,"salir",true)) return DC_Close(playerid);
 if(!strcmp(params,"siguiente",true)) {DC_Next(playerid,1);return DC_Show(playerid);}
 if(!strcmp(params,"anterior",true)) {DC_Next(playerid,-1);return DC_Show(playerid);}
 if(!strcmp(params,"comprar",true))return DC_Confirm(playerid);
 if(!strcmp(params,"confirmar",true))return DC_Purchase(playerid);
 if(!strcmp(params,"lista",true))return DC_List(playerid);
 if(!strcmp(params,"camara",true)) {DC_Angle[playerid]++;return DC_Camera(playerid);}
 if(!strcmp(params,"color",true)) {DC_Color[playerid]=(DC_Color[playerid]+1)%128;DC_Quote[playerid]=0;return DC_Show(playerid);}
 if(!strcmp(params,"menu",true))return DC_Menu(playerid);
 return DC_Show(playerid,false);
}
stock DC_Key(p,newkeys,oldkeys) {if((newkeys & KEY_SECONDARY_ATTACK) && !(oldkeys & KEY_SECONDARY_ATTACK) && !DC_Active[p] && DC_Live(p) && GetPlayerVirtualWorld(p)==0 && GetPlayerInterior(p)==0 && GetPlayerState(p)==PLAYER_STATE_ONFOOT) {new d=ConceCercano(p);if(d>=0 && IsPlayerInRangeOfPoint(p,3.0,Concesionaria_Spawn_Positions[d][0]-3.0,Concesionaria_Spawn_Positions[d][1],Concesionaria_Spawn_Positions[d][2]+0.4)) {DC_Open(p);return 1;}}return 0;}
hook OnGameModeInit() {
 for(new d;d<5;d++) {
  DC_Map(d,true);DC_Map(d);
  new luxury[]={411,451};for(new n;n<2;n++) {
   new v=DC_CreateVehicle(luxury[n],Concesionaria_Spawn_Positions[d][0]+7.0+7.0*n,Concesionaria_Spawn_Positions[d][1]+21.0,Concesionaria_Spawn_Positions[d][2]+1.2,180.0,n?3:1,1,-1);
   if(v) {DC_Display[d][n]=v;SetVehicleVirtualWorld(v,0);SetVehicleParamsEx(v,0,1,0,1,0,0,0);}
  }
  new Float:x=Concesionaria_Spawn_Positions[d][0]-3.0,Float:y=Concesionaria_Spawn_Positions[d][1],Float:z=Concesionaria_Spawn_Positions[d][2]+0.4;
  DC_Actor[d]=CreateDynamicActor(187,x,y,z,90.0,1,100.0,0,0);new text[220];format(text,sizeof text,"{FFFFFF}%s\n{EF4158}NEXUS MOTORS\n{FFFFFF}F / boton de accion /concesionario\nCatalogo y showroom",DC_Names[d]);CreateDynamic3DTextLabel(text,-1,x,y,z+1.0,15.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,0);
  new sign=CreateDynamicObject(19353,x-1.8,y,z+2.5,0.0,0.0,90.0,0,0);SetDynamicObjectMaterialText(sign,0,DC_Names[d],OBJECT_MATERIAL_SIZE_512x256,"Arial",28,1,0xFFFFFFFF,0xFF161C25,1);
 }
 return 1;
}
hook OnPlayerConnect(playerid) {
 for(new d;d<5;d++) RemoveBuildingForPlayer(playerid,-1,Concesionaria_Spawn_Positions[d][0]+8.0,Concesionaria_Spawn_Positions[d][1]+12.0,Concesionaria_Spawn_Positions[d][2]+4.0,18.0);DC_Active[playerid]=false;DC_Pending[playerid]=false;DC_IgnoreEscape[playerid]=0;DC_SavedBack[playerid]=false;return 1;}
hook OnPlayerDisconnect(playerid,reason) {DC_SavedBack[playerid]=DC_Active[playerid];DC_Close(playerid,false);DC_Pending[playerid]=false;return 1;}
hook OnPlayerDeath(playerid,killerid,reason) {DC_Close(playerid);return 1;}
hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
 if(dialogid<DC_MENU || dialogid>DC_LIST)return 1;
 if(!DC_Active[playerid] || !DC_Live(playerid) || DC_Owner[playerid]!=PLAYER_INFO[playerid][pID] || dl_playerDialogID[playerid]!=dialogid)return 1;
 if(!response) {if(dialogid==DC_MENU)DC_Close(playerid);else DC_Menu(playerid);return 1;}
 if(dialogid==DC_BUY)return DC_Purchase(playerid);
 if(dialogid==DC_LIST){if(listitem>=0 && listitem<DC_ListCount[playerid]) {DC_Index[playerid]=DC_ListRows[playerid][listitem];DC_Quote[playerid]=0;DC_Show(playerid);}return 1;}
 switch(listitem) {
  case 0:{DC_Next(playerid,1);DC_Show(playerid);DC_Menu(playerid);}
  case 1:{DC_Next(playerid,-1);DC_Show(playerid);DC_Menu(playerid);}
  case 2:DC_Confirm(playerid);
  case 3:{DC_Color[playerid]=(DC_Color[playerid]+1)%128;DC_Quote[playerid]=0;DC_Show(playerid);DC_Menu(playerid);}
  case 4:{DC_Angle[playerid]++;DC_Camera(playerid);DC_Menu(playerid);}
  case 5:DC_List(playerid);
  case 6:DC_Show(playerid,false);
  default:DC_Close(playerid);
 }
 return 1;
}
stock DC_Click(playerid,PlayerText:playertextid) {
 if(!DC_Active[playerid])return 0;
 for(new n;n<DC_TDCount[playerid];n++)if(DC_TD[playerid][n]==playertextid) {
  switch(DC_Action[playerid][n]) {case 0:{DC_Next(playerid,-1);DC_Show(playerid);}case 1:{DC_Next(playerid,1);DC_Show(playerid);}case 2:DC_Confirm(playerid);case 3:DC_Menu(playerid);case 4:DC_Close(playerid);}break;
 }
 return 1;
}
hook OnPlayerClickTextDraw(playerid,Text:clickedid) {if(clickedid==Text:INVALID_TEXT_DRAW) {if(DC_IgnoreEscape[playerid]>0)DC_IgnoreEscape[playerid]--;else if(DC_Active[playerid])DC_Close(playerid);}return 1;}
