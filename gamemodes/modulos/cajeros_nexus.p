// Street ATMs and C4 robbery. Commands/native dialogs work on PC and Android.
#include <YSI_Coding\y_hooks>
#define ATM_CONFIRM (31160)
#define ATM_LIST (31161)
#define ATM_COOLDOWN (1200)
enum ATM_POS {Float:ax,Float:ay,Float:az,Float:aa,ac,an[32]};
new ATM_Points[][ATM_POS]={
 {1497.3,-1750.1,13.55,180.0,0,"Pershing Square"},
 {1828.5,-1842.8,13.58,90.0,0,"Unity Station"},
 {1194.5,-1324.2,13.40,270.0,0,"Hospital Market"},
 {1931.3,-1776.2,13.55,90.0,0,"Gasolinera Idlewood"},
 {2106.8,-1800.8,13.55,90.0,0,"Pizzeria Idlewood"},
 {1008.5,-929.0,42.33,180.0,0,"Temple"},
 {-1980.1,137.5,27.69,90.0,1,"Doherty"},
 {-2244.0,541.5,35.17,90.0,1,"Garcia"},
 {-2670.8,260.8,4.34,90.0,1,"Ocean Flats"},
 {-2445.4,751.7,35.17,180.0,1,"Juniper Hill"},
 {-1695.5,950.8,24.89,180.0,1,"Esplanade"},
 {-1805.2,1197.4,25.12,90.0,1,"Esplanade North"},
 {2018.5,1005.3,10.82,180.0,2,"The Strip"},
 {2168.5,1690.5,10.82,90.0,2,"Redsands East"},
 {1592.5,2221.2,10.82,180.0,2,"Redsands West"},
 {2840.7,1290.0,11.39,90.0,2,"Hospital LV"},
 {2630.5,1814.2,11.02,90.0,2,"Starfish Casino"},
 {2102.5,2494.2,10.82,90.0,2,"Emerald Isle"}
};
new const ATM_Cities[][]={"Los Santos","San Fierro","Las Venturas"};
new ATM_Phase[sizeof ATM_Points],ATM_Deadline[sizeof ATM_Points],ATM_Cool[sizeof ATM_Points],ATM_Player[sizeof ATM_Points],ATM_Account[sizeof ATM_Points],ATM_Cash[sizeof ATM_Points];
new Text3D:ATM_Label[sizeof ATM_Points],ATM_Object[sizeof ATM_Points],ATM_Bomb[sizeof ATM_Points];
new ATM_ConfirmID[MAX_PLAYERS],ATM_ConfirmAccount[MAX_PLAYERS],ATM_ConfirmUntil[MAX_PLAYERS];
new bool:ATM_Ready;
new ATM_Loot[sizeof ATM_Points];
new ATM_Icon[sizeof ATM_Points];
new bool:ATM_Damaged[sizeof ATM_Points],ATM_Smoke[sizeof ATM_Points],ATM_SmokeUntil[sizeof ATM_Points],ATM_CP[sizeof ATM_Points];
new ATM_Money[sizeof ATM_Points][3];
new Float:ATM_LootX[sizeof ATM_Points],Float:ATM_LootY[sizeof ATM_Points];
stock ATM_Front(i) {
 // Model 19324 faces local -Y, opposite to a player's default facing vector.
 ATM_LootX[i]=ATM_Points[i][ax]+floatsin(ATM_Points[i][aa],degrees)*1.8;
 ATM_LootY[i]=ATM_Points[i][ay]-floatcos(ATM_Points[i][aa],degrees)*1.8;
 return 1;
}
new ATM_BankID[MAX_PLAYERS];
stock ATM_Usable(i) {return i>=0 && i<sizeof ATM_Points && !ATM_Phase[i] && ATM_Cool[i]<=gettime();}
stock ATM_Live(p) {
 if(p<0 || p>=MAX_PLAYERS || !IsPlayerConnected(p) || IsPlayerNPC(p)) return 0;
 new Float:health;GetPlayerHealth(p,health);
 return health>0.0 && JugadorLogeado[p] && PLAYER_INFO[p][pID]>0 && GetPlayerState(p)==PLAYER_STATE_ONFOOT && !PLAYER_TEMP[p][VariableCaido] && !EnCombate[p] && PLAYER_INFO[p][pTiempoCarcel]==0 && PLAYER_INFO[p][pTiempoJail]==0;
}
stock ATM_Near(p,Float:radius=2.5) {
 if(GetPlayerInterior(p)!=0 || GetPlayerVirtualWorld(p)!=0) return -1;
 for(new i;i<sizeof ATM_Points;i++) if(IsPlayerInRangeOfPoint(p,radius,ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az])) return i;
 return -1;
}

stock ATM_BuyC4(p) { return RB_BuyC4(p); }

stock ATM_Refresh(i) {
 if(IsValidDynamic3DTextLabel(ATM_Label[i])) DestroyDynamic3DTextLabel(ATM_Label[i]);
 new text[240];
 if(ATM_Phase[i]==1) format(text,sizeof text,"{FFAA33}CAJERO #%d - COLOCANDO C4",i+1);
 else if(ATM_Phase[i]==2) format(text,sizeof text,"{FF3333}PELIGRO: C4 ACTIVADO\n{FFFFFF}Alejate del cajero");
 else if(ATM_Phase[i]==3) format(text,sizeof text,"{FFAA33}BOTIN DEL CAJERO\n{FFFFFF}Entra al checkpoint para recoger\nAlternativa: /cajero recoger");
 else if(ATM_Cool[i]>gettime()) format(text,sizeof text,"{FF7777}CAJERO #%d - FUERA DE SERVICIO\n{FFFFFF}Reparacion: %d minutos",i+1,(ATM_Cool[i]-gettime()+59)/60);
 else format(text,sizeof text,"{55DD99}CAJERO #%d - %s\n{FFFFFF}/cajero: operaciones\n/robar cajero: requiere C4",i+1,ATM_Points[i][an]);
 ATM_Label[i]=CreateDynamic3DTextLabel(text,-1,ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az]+0.6,12.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,0);return 1;
}
stock ATM_End(i) {
 if(ATM_Phase[i]==1 && ATM_Live(ATM_Player[i]) && PLAYER_INFO[ATM_Player[i]][pID]==ATM_Account[i]) {ClearAnimations(ATM_Player[i]);SendClientMessage(ATM_Player[i],-1,"Colocacion interrumpida. Perdiste el C4.");}
 if(IsValidDynamicObject(ATM_Bomb[i])) DestroyDynamicObject(ATM_Bomb[i]);
 if(IsValidDynamicPickup(ATM_Loot[i])) DestroyDynamicPickup(ATM_Loot[i]);
 if(IsValidDynamicCP(ATM_CP[i])) DestroyDynamicCP(ATM_CP[i]);ATM_CP[i]=0;
 for(new k;k<3;k++) {if(IsValidDynamicObject(ATM_Money[i][k])) DestroyDynamicObject(ATM_Money[i][k]);ATM_Money[i][k]=0;}
 ATM_Loot[i]=0;
 ATM_Bomb[i]=0;ATM_Phase[i]=0;ATM_Player[i]=INVALID_PLAYER_ID;ATM_Account[i]=0;ATM_Cash[i]=0;ATM_Refresh(i);return 1;
}
stock ATM_LoadCooldown() {
 new Cache:c=mysql_query(handle_db,"SELECT id,until_time FROM rp_atm_cooldown",true),rows;
 if(mysql_errno(handle_db)!=0 || c==MYSQL_INVALID_CACHE) {if(c!=MYSQL_INVALID_CACHE) cache_delete(c);return 0;}
 cache_get_row_count(rows);
 for(new r;r<rows;r++) {new id,until;cache_get_value_name_int(r,"id",id);cache_get_value_name_int(r,"until_time",until);if(id>=0 && id<sizeof ATM_Points) ATM_Cool[id]=until;}
 if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
 return 1;
}
stock ATM_LoadPositions() {
 new Cache:c=mysql_query(handle_db,"SELECT id,x,y,z,angle FROM rp_atm_positions",true),rows;
 if(mysql_errno(handle_db)!=0 || c==MYSQL_INVALID_CACHE) {if(c!=MYSQL_INVALID_CACHE) cache_delete(c);return 0;}
 cache_get_row_count(rows);
 for(new r;r<rows;r++) {
  new id;cache_get_value_name_int(r,"id",id);
  if(id<0 || id>=sizeof ATM_Points) continue;
  cache_get_value_name_float(r,"x",ATM_Points[id][ax]);cache_get_value_name_float(r,"y",ATM_Points[id][ay]);
  cache_get_value_name_float(r,"z",ATM_Points[id][az]);cache_get_value_name_float(r,"angle",ATM_Points[id][aa]);
 }
 cache_delete(c);return 1;
}
stock ATM_Spawn(i) {
 if(IsValidDynamicObject(ATM_Object[i])) DestroyDynamicObject(ATM_Object[i]);
 if(IsValidDynamicMapIcon(ATM_Icon[i])) DestroyDynamicMapIcon(ATM_Icon[i]);
 if(IsValidDynamicObject(ATM_Smoke[i])) DestroyDynamicObject(ATM_Smoke[i]);ATM_Smoke[i]=0;
 if(ATM_Damaged[i]) {
  ATM_Object[i]=CreateDynamicObject(19324,ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az]-0.8,72.0,12.0,ATM_Points[i][aa]+15.0,0,0);
  for(new material;material<16;material++) SetDynamicObjectMaterial(ATM_Object[i],material,-1,"none","none",0xFF282828);
  if(ATM_SmokeUntil[i]>gettime()) ATM_Smoke[i]=CreateDynamicObject(18725,ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az]-0.3,0.0,0.0,0.0,0,0);
 }else ATM_Object[i]=CreateDynamicObject(19324,ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az]-0.55,0.0,0.0,ATM_Points[i][aa],0,0);
 ATM_Icon[i]=CreateDynamicMapIcon(ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az],52,0,0,0,-1,250.0,MAPICON_LOCAL);
 ATM_Refresh(i);return 1;
}
stock ATM_LoadDamage() {
 new Cache:c=mysql_query(handle_db,"SELECT id FROM rp_atm_damage",true),rows;
 if(mysql_errno(handle_db)!=0 || c==MYSQL_INVALID_CACHE) {if(c!=MYSQL_INVALID_CACHE)cache_delete(c);return 0;}
 cache_get_row_count(rows);for(new r;r<rows;r++) {new id;cache_get_value_name_int(r,"id",id);if(id>=0 && id<sizeof ATM_Points && ATM_Cool[id]>gettime()) {ATM_Damaged[id]=true;ATM_SmokeUntil[id]=gettime()+60;}}
 cache_delete(c);return 1;
}
stock ATM_Move(p,i) {
 if(!JugadorLogeado[p] || PLAYER_INFO[p][pAdmin]<ADMIN_LEVEL_ADM) return SendClientMessage(p,-1,"Solo administradores pueden mover cajeros.");
 if(i<0 || i>=sizeof ATM_Points) return SendClientMessage(p,-1,"ID invalida. Consulta los numeros con /cajeros.");
 if(!ATM_Ready) return SendClientMessage(p,-1,"No se pueden guardar cajeros ahora.");
 if(!ATM_Live(p) || GetPlayerInterior(p)!=0 || GetPlayerVirtualWorld(p)!=0) return SendClientMessage(p,-1,"Debes estar a pie, en el exterior y en el mundo principal.");
 if(ATM_Phase[i]) return SendClientMessage(p,-1,"No puedes mover un cajero durante un robo o con botin pendiente.");
 new Float:x,Float:y,Float:z,Float:a,q[320];GetPlayerPos(p,x,y,z);GetPlayerFacingAngle(p,a);
 mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_atm_positions (id,x,y,z,angle) VALUES (%d,%f,%f,%f,%f) ON DUPLICATE KEY UPDATE x=VALUES(x),y=VALUES(y),z=VALUES(z),angle=VALUES(angle)",i,x,y,z,a);
 if(!RP_BizSQL(q)) return SendClientMessage(p,-1,"No se pudo guardar la posicion. El cajero conserva su ubicacion.");
 ATM_Points[i][ax]=x;ATM_Points[i][ay]=y;ATM_Points[i][az]=z;ATM_Points[i][aa]=a;ATM_Spawn(i);
 printf("[Cajeros] Cuenta %d movio cajero #%d a %.3f %.3f %.3f, angulo %.2f.",PLAYER_INFO[p][pID],i+1,x,y,z,a);
 SendClientMessageEx(p,-1,"Cajero #%d movido y guardado en tu posicion. Orientacion: %.1f grados.",i+1,a);return 1;
}
CMD:movercajero(playerid,params[]) {
 new id;if(sscanf(params,"i",id)) return SendClientMessage(playerid,-1,"Uso: /movercajero [ID]. Colocate en el lugar nuevo y mira hacia donde debe apuntar el cajero. /cajeros muestra las IDs.");
 return ATM_Move(playerid,id-1);
}
stock ATM_Init() {
 ATM_Ready=bool:RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_atm_cooldown (id INT PRIMARY KEY,until_time INT NOT NULL) ENGINE=InnoDB");
 if(ATM_Ready) ATM_Ready=bool:RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_atm_positions (id INT PRIMARY KEY,x FLOAT NOT NULL,y FLOAT NOT NULL,z FLOAT NOT NULL,angle FLOAT NOT NULL) ENGINE=InnoDB");
 if(ATM_Ready) ATM_Ready=bool:RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_atm_damage (id INT PRIMARY KEY) ENGINE=InnoDB");
 if(ATM_Ready) ATM_Ready=bool:ATM_LoadCooldown();
 if(ATM_Ready) ATM_Ready=bool:ATM_LoadPositions();
 if(ATM_Ready) ATM_Ready=bool:ATM_LoadDamage();
 if(!ATM_Ready) print("[Cajeros] MySQL no disponible, robos deshabilitados.");
 for(new i;i<sizeof ATM_Points;i++) {
  ATM_Player[i]=INVALID_PLAYER_ID;ATM_Spawn(i);
 }
 SetTimer("ATM_Tick",1000,true);printf("[Cajeros] 18 cajeros: 6 LS, 6 SF y 6 LV. Robos disponibles: %d.",_:ATM_Ready);return 1;
}
stock ATM_Request(p) {
 new i=ATM_Near(p);
 if(!ATM_Ready) return SendClientMessage(p,-1,"Los robos de cajeros no estan disponibles ahora.");
 if(!ATM_Live(p) || i<0) return SendClientMessage(p,-1,"Acercate a pie a un cajero de la calle. Usa /cajeros para localizarlo.");
 if(IsAPolice(p) || PLAYER_INFO[p][pFaccion]==2) return SendClientMessage(p,-1,"Policias y militares no pueden robar cajeros.");
 if(ATM_Phase[i] || ATM_Cool[i]>gettime()) return SendClientMessage(p,-1,"Este cajero esta ocupado o fuera de servicio.");
 if(!C4_Load(p)) return SendClientMessage(p,-1,"No se pudo cargar tu C4.");
 if(!cbomba[p]) return SendClientMessage(p,-1,"Necesitas comprar un C4 en el mercado negro (/comprar c4).");
 for(new a;a<sizeof ATM_Points;a++) if(ATM_Phase[a] && ATM_Account[a]==PLAYER_INFO[p][pID]) return SendClientMessage(p,-1,"Ya tienes un robo de cajero en curso.");
 ATM_ConfirmID[p]=i;ATM_ConfirmAccount[p]=PLAYER_INFO[p][pID];ATM_ConfirmUntil[p]=gettime()+30;
 return dialogs_ShowPlayerDialog(p,ATM_CONFIRM,DIALOG_STYLE_MSGBOX,"Cajero | Confirmar robo","Se consume un C4 al empezar.\nColocacion: 10 segundos sin alejarte.\nLuego tienes 10 segundos para apartarte de la explosion.\nLa Policia recibira una alerta.\nRegresa y pasa sobre la bolsa para recoger el dinero.\nAlternativa: /cajero recoger.\nSi interrumpes la colocacion pierdes el C4.","Colocar","Cancelar");
}
stock ATM_Start(p) {
 new i=ATM_ConfirmID[p],account=ATM_ConfirmAccount[p],expiry=ATM_ConfirmUntil[p];ATM_ConfirmUntil[p]=0;
 if(!ATM_Ready || i<0 || i>=sizeof ATM_Points || !expiry || gettime()>expiry || !ATM_Live(p) || PLAYER_INFO[p][pID]!=account || ATM_Near(p)!=i || IsAPolice(p) || PLAYER_INFO[p][pFaccion]==2 || !cbomba[p]) return 1;
 if(ATM_Phase[i] || ATM_Cool[i]>gettime()) return SendClientMessage(p,-1,"El cajero ya no esta disponible.");
 for(new a;a<sizeof ATM_Points;a++) if(ATM_Phase[a] && ATM_Account[a]==account) return 1;
 new q[220],until=gettime()+ATM_COOLDOWN;
 mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_atm_cooldown VALUES (%d,%d) ON DUPLICATE KEY UPDATE until_time=VALUES(until_time)",i,until);
 if(!RP_BizSQL(q)) return SendClientMessage(p,-1,"No se pudo registrar el robo. Conservas tu C4.");
 if(!C4_Change(p,false)) return 1;
 ATM_Cool[i]=until;ATM_Phase[i]=1;ATM_Player[i]=p;ATM_Account[i]=account;ATM_Deadline[i]=gettime()+10;
 PLAYER_INFO[p][pCargos]=max(PLAYER_INFO[p][pCargos],3);
 SetPlayerWantedLevelEx(p,PLAYER_INFO[p][pCargos]);ReportCrimen(p,PLAYER_INFO[p][pCargos]);ActualizarRadar();GuardarCuenta(p);
 ATM_Bomb[i]=CreateDynamicObject(1252,ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az]-0.25,0.0,0.0,0.0,0,0);
 ApplyAnimation(p,"BOMBER","BOM_Plant",4.0,0,0,0,0,10000);ATM_Refresh(i);
 new message[180];format(message,sizeof message,"[CENTRAL] Robo de cajero #%d en %s, %s. /cajeros para localizarlo.",i+1,ATM_Points[i][an],ATM_Cities[ATM_Points[i][ac]]);
 foreach(new police:Player) if(JugadorLogeado[police] && PLAYER_INFO[police][pFaccion]==1 && PLAYER_INFO[police][pDuty]) SendClientMessage(police,0x55AAFFFF,message);
 return SendClientMessage(p,-1,"Colocando C4: permanece junto al cajero durante 10 segundos.");
}
forward ATM_Tick();
public ATM_Tick() {
 for(new i;i<sizeof ATM_Points;i++) {
  if(ATM_Smoke[i] && ATM_SmokeUntil[i]<=gettime()) {if(IsValidDynamicObject(ATM_Smoke[i])) DestroyDynamicObject(ATM_Smoke[i]);ATM_Smoke[i]=0;}
  if(ATM_Phase[i]==1) {
   new p=ATM_Player[i];
   if(!ATM_Live(p) || PLAYER_INFO[p][pID]!=ATM_Account[i] || ATM_Near(p)!=i) {ATM_End(i);continue;}
   if(gettime()>=ATM_Deadline[i]) {ATM_Phase[i]=2;ATM_Deadline[i]=gettime()+10;ClearAnimations(p);ATM_Refresh(i);SendClientMessage(p,-1,"C4 activado: alejate. Explotara en 10 segundos.");}
  }else if(ATM_Phase[i]==2 && gettime()>=ATM_Deadline[i]) {
   CreateExplosion(ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az],2,3.0);
   if(IsValidDynamicObject(ATM_Bomb[i])) DestroyDynamicObject(ATM_Bomb[i]);ATM_Bomb[i]=0;
   ATM_Phase[i]=3;ATM_Cash[i]=15000+random(10001);ATM_Deadline[i]=gettime()+90;
   ATM_Damaged[i]=true;ATM_SmokeUntil[i]=gettime()+60;ATM_Spawn(i);
   new q[100];mysql_format(handle_db,q,sizeof q,"INSERT IGNORE INTO rp_atm_damage (id) VALUES (%d)",i);RP_BizSQL(q);
   ATM_Front(i);
   ATM_Loot[i]=CreateDynamicPickup(1212,1,ATM_LootX[i],ATM_LootY[i],ATM_Points[i][az]-0.3,0,0);
   ATM_CP[i]=CreateDynamicCP(ATM_LootX[i],ATM_LootY[i],ATM_Points[i][az]-0.5,1.35,0,0,-1,60.0,-1,1000);
   for(new k;k<3;k++) ATM_Money[i][k]=CreateDynamicObject(1212,ATM_LootX[i]+float(k-1)*0.3,ATM_LootY[i]+0.18,ATM_Points[i][az]-0.6,0.0,0.0,float(k)*35.0,0,0);
   foreach(new viewer:Player) if(GetPlayerVirtualWorld(viewer)==0 && GetPlayerInterior(viewer)==0 && IsPlayerInRangeOfPoint(viewer,60.0,ATM_Points[i][ax],ATM_Points[i][ay],ATM_Points[i][az])) {
    Streamer_Update(viewer,STREAMER_TYPE_OBJECT);Streamer_Update(viewer,STREAMER_TYPE_PICKUP);Streamer_Update(viewer,STREAMER_TYPE_CP);
   }
   ATM_Refresh(i);
  }else if(ATM_Phase[i]==3 && gettime()>=ATM_Deadline[i]) ATM_End(i);
  else if(!ATM_Phase[i] && ATM_Cool[i] && ATM_Cool[i]<=gettime()) {ATM_Cool[i]=0;ATM_Damaged[i]=false;new q[100];mysql_format(handle_db,q,sizeof q,"DELETE FROM rp_atm_damage WHERE id=%d",i);RP_BizSQL(q);ATM_Spawn(i);}
 }return 1;
}
stock ATM_BankCheck(p) {
 new i=ATM_BankID[p];
 if(i<0) return 1;
 if(!ATM_Live(p) || ATM_Near(p)!=i || ATM_Phase[i] || ATM_Cool[i]>gettime()) {SendClientMessage(p,-1,"Operacion cancelada: el cajero no esta disponible o te alejaste.");return 0;}
 return 1;
}
stock ATM_Open(playerid) {
 if(!ATM_Live(playerid)) return 1;
 new i=ATM_Near(playerid);
 ATM_BankID[playerid]=i;
 if(i>=0 && (ATM_Phase[i] || ATM_Cool[i]>gettime())) return SendClientMessage(playerid,-1,"Cajero fuera de servicio.");
 if(!EnCajero(playerid)) return SendClientMessage(playerid,-1,"Acercate a un cajero. Usa /cajeros.");
 return dialogs_ShowPlayerDialog(playerid,BANCO,DIALOG_STYLE_LIST,"Cajero | Operaciones","Retirar\nDepositar\nConsultar saldo\nTransferir dinero","Elegir","Cerrar");
}
stock ATM_Collect(playerid,i) {
 if(!ATM_Live(playerid)) return 0;
 if(i<0 || i>=sizeof ATM_Points || ATM_Phase[i]!=3 || ATM_Deadline[i]<=gettime() || ATM_Cash[i]<=0) return 0;
 if(GetPlayerInterior(playerid)!=0 || GetPlayerVirtualWorld(playerid)!=0 || !IsPlayerInRangeOfPoint(playerid,2.5,ATM_LootX[i],ATM_LootY[i],ATM_Points[i][az])) return 0;
 if(IsAPolice(playerid) || PLAYER_INFO[playerid][pFaccion]==2) return 0;
 new reward=ATM_Cash[i];ATM_End(i);DarDinero(playerid,reward);GuardarCuenta(playerid);
 SendClientMessageEx(playerid,-1,"Recogiste $%d del cajero. Escapa de la zona.",reward);
 return 1;
}
stock ATM_Pickup(playerid,pickupid) {
 for(new i;i<sizeof ATM_Points;i++) if(ATM_Phase[i]==3 && ATM_Loot[i]==pickupid) {ATM_Collect(playerid,i);return 1;}
 return 0;
}
hook OnPlayerEnterDynamicCP(playerid,checkpointid) {
 for(new i;i<sizeof ATM_Points;i++) if(ATM_Phase[i]==3 && ATM_CP[i]==checkpointid) {ATM_Collect(playerid,i);break;}
 return 1;
}
CMD:cajero(playerid,params[]) {
 if(!ATM_Live(playerid)) return 1;
 new i=ATM_Near(playerid);
 if(params[0] && !strcmp(params,"robar",true)) return ATM_Request(playerid);
 if(params[0] && !strcmp(params,"recoger",true)) {
  if(i<0 || ATM_Phase[i]!=3 || ATM_Deadline[i]<=gettime()) return SendClientMessage(playerid,-1,"No hay botin disponible aqui.");
  if(IsAPolice(playerid) || PLAYER_INFO[playerid][pFaccion]==2) return SendClientMessage(playerid,-1,"No puedes recoger botin robado.");
  if(!ATM_Collect(playerid,i)) return SendClientMessage(playerid,-1,"No puedes recoger este botin ahora.");
  return 1;
 }
 return ATM_Open(playerid);
}
CMD:cajeros(playerid,params[]) {
 if(!JugadorLogeado[playerid]) return 1;
 new text[2200],line[130];
 strcat(text,"Ciudad / zona\tEstado\n");
 for(new i;i<sizeof ATM_Points;i++) {format(line,sizeof line,"%d. %s - %s\t%s\n",i+1,ATM_Cities[ATM_Points[i][ac]],ATM_Points[i][an],ATM_Phase[i]?("Robo en curso"):(ATM_Cool[i]>gettime()?("Fuera de servicio"):("Disponible")));strcat(text,line);}
 return dialogs_ShowPlayerDialog(playerid,ATM_LIST,DIALOG_STYLE_TABLIST_HEADERS,"Cajeros de San Andreas",text,"Marcar","Cerrar");
}
hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
 if(dialogid==ATM_CONFIRM) {if(response) ATM_Start(playerid);else ATM_ConfirmUntil[playerid]=0;return 1;}
 if(dialogid==ATM_LIST) {
  if(!response || !JugadorLogeado[playerid] || listitem<0 || listitem>=sizeof ATM_Points) return 1;
  if(GetPlayerInterior(playerid)!=0 || GetPlayerVirtualWorld(playerid)!=0) return SendClientMessage(playerid,-1,"Sal al exterior para marcar el cajero.");
  StartPlayerPath(playerid,ATM_Points[listitem][ax],ATM_Points[listitem][ay],ATM_Points[listitem][az],3.0);MarcarLocalizarGPS(playerid,ATM_Points[listitem][ax],ATM_Points[listitem][ay]);return 1;
 }return 1;
}
hook OnPlayerConnect(playerid) {ATM_ConfirmUntil[playerid]=0;ATM_BankID[playerid]=-1;cbomba[playerid]=0;return 1;}
hook OnPlayerDisconnect(playerid,reason) {ATM_ConfirmUntil[playerid]=0;cbomba[playerid]=0;for(new i;i<sizeof ATM_Points;i++) if(ATM_Phase[i]==1 && ATM_Player[i]==playerid) ATM_End(i);return 1;}
