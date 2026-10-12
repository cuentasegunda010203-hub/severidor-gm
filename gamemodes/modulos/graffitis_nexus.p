// Grafitis Android/PC. Disputa unica y vencimientos persistentes.
#include <YSI_Coding\y_hooks>
#define GF_MAX 53
#define GF_MENU 32701
#define GF_STATUS 32702
#define GF_COOLDOWN (3*86400)
enum GF_Data {gfID,gfOwner,gfZone[32],Float:gfX,Float:gfY,Float:gfZ,Float:gfRX,Float:gfRY,Float:gfRZ,Float:gfPX,Float:gfPY,Float:gfPZ,gfObject,gfState,gfDeadline,gfNext,gfBand[4],gfProgress[4],gfDirty};
new GF[GF_MAX][GF_Data],GF_Count,GF_Active=-1,GF_Pointer,GF_LastHour=-1;
new bool:GF_Ready,bool:GF_Loading;
new GF_RenderBand[GF_MAX];
new GF_Paint[MAX_PLAYERS],GF_Account[MAX_PLAYERS],GF_PlayerBand[MAX_PLAYERS],GF_Auto[MAX_PLAYERS],GF_LastPaint[MAX_PLAYERS],GF_BandTick[GF_MAX][4];
stock GF_Live(p) {return IsPlayerConnected(p) && !IsPlayerNPC(p) && LogeoCorrecto[p]==1 && PLAYER_INFO[p][pID]>0;}
stock GF_BandValid(b) {return b>3 && b<MAX_BANDAS && BandasInfo[b][EnUso] && BandasInfo[b][bID]==b;}
stock gang_player(p) {return GF_BandValid(PLAYER_INFO[p][pFaccion]);}
stock GF_Hour() {return ((gettime()-14400)%86400+86400)%86400/3600;}
stock GF_HoursOpen() {new h=GF_Hour();return h>=10 || h<1;}
stock GF_SQL(const query[]) {new Cache:c=mysql_query(handle_db,query,true),ok=mysql_errno(handle_db)==0;if(c!=MYSQL_INVALID_CACHE) cache_delete(c);return ok;}
#include "modulos/graffitis_catalogo.p"
stock GF_Save(g) {
 new q[700];
 mysql_format(handle_db,q,sizeof q,"INSERT INTO nexus_graffiti_state(id,owner,state,deadline,next_at,b1,b2,b3,b4,p1,p2,p3,p4) VALUES(%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d) ON DUPLICATE KEY UPDATE owner=VALUES(owner),state=VALUES(state),deadline=VALUES(deadline),next_at=VALUES(next_at),b1=VALUES(b1),b2=VALUES(b2),b3=VALUES(b3),b4=VALUES(b4),p1=VALUES(p1),p2=VALUES(p2),p3=VALUES(p3),p4=VALUES(p4)",GF[g][gfID],GF[g][gfOwner],GF[g][gfState],GF[g][gfDeadline],GF[g][gfNext],GF[g][gfBand][0],GF[g][gfBand][1],GF[g][gfBand][2],GF[g][gfBand][3],GF[g][gfProgress][0],GF[g][gfProgress][1],GF[g][gfProgress][2],GF[g][gfProgress][3]);
 if(!GF_SQL(q)) return 0;GF[g][gfDirty]=0;return 1;
}
stock GF_Object(g) {
 if(IsValidDynamicObject(GF[g][gfObject])) DestroyDynamicObject(GF[g][gfObject]);
 new panel=GF_IsDefault(g);
 GF[g][gfObject]=CreateDynamicObject(panel?19353:19479,GF[g][gfX],GF[g][gfY],GF[g][gfZ],GF[g][gfRX],GF[g][gfRY],GF[g][gfRZ],0,0,-1,100.0,100.0);
 new text[64],b=GF[g][gfOwner],color=0xFFFFFFFF;
 if(GF[g][gfState]==2) format(text,sizeof text,"EN DISPUTA");
 else if(GF_BandValid(b)) {format(text,sizeof text,"%s",BandasInfo[b][BNombre]);color=0xFF000000 | (BandasInfo[b][BColor]>>>8);}
 else format(text,sizeof text,"LIBRE");
 GF_RenderBand[g]=GF[g][gfState]==2?-1:(GF_BandValid(b)?b:0);
 SetDynamicObjectMaterialText(GF[g][gfObject],0,text,OBJECT_MATERIAL_SIZE_512x256,"Arial",36,1,color,panel?0xFF252525:0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);return 1;
}
stock GF_Stop(p,bool:notify=false) {
 new was=GF_Paint[p]>=0;GF_Paint[p]=-1;GF_Auto[p]=0;GF_Account[p]=0;GF_PlayerBand[p]=0;
 if(was && IsPlayerConnected(p)) {ClearAnimations(p);if(notify) SendClientMessage(p,-1,"Dejaste de pintar el grafiti.");}return 1;
}
stock GF_Announce(const text[]) {foreach(new p:Player) if(GF_Live(p) && (gang_player(p) || PLAYER_INFO[p][pAdmin]>0)) SendClientMessage(p,0xE5BB59FF,text);return 1;}
stock GF_Start(g) {
 if(!GF_Ready || GF_Active>=0 || g<0 || g>=GF_Count || GF[g][gfNext]>gettime()) return 0;
 GF[g][gfState]=1;GF[g][gfDeadline]=gettime()+60;
 for(new s;s<4;s++) {GF[g][gfBand][s]=0;GF[g][gfProgress][s]=0;GF_BandTick[g][s]=0;}
 if(!GF_Save(g)) {GF[g][gfState]=0;GF[g][gfDeadline]=0;return 0;}
 GF_Active=g;GF_Pointer=(g+1)%GF_Count;
 new text[150];format(text,sizeof text,"[Grafitis] %s se abre en 60 segundos. Consulta /grafitis.",GF[g][gfZone]);GF_Announce(text);return 1;
}
stock SiguienteGraf() {if(!GF_Count || GF_Active>=0) return 0;for(new n;n<GF_Count;n++) {new g=(GF_Pointer+n)%GF_Count;if(GF[g][gfNext]<=gettime()) return GF_Start(g);}return 0;}
stock GF_Finish(g,winner) {
 if(g<0 || g>=GF_Count || !GF[g][gfState] || (winner>0 && !GF_BandValid(winner))) return 0;
 new oldOwner=GF[g][gfOwner],oldState=GF[g][gfState],oldDeadline=GF[g][gfDeadline],oldNext=GF[g][gfNext];
 if(!GF_SQL("START TRANSACTION")) return 0;
 if(winner>0) GF[g][gfOwner]=winner;
 GF[g][gfState]=0;GF[g][gfDeadline]=0;GF[g][gfNext]=gettime()+GF_COOLDOWN;
 new q[250],name[32]="LIBRE";if(GF_BandValid(GF[g][gfOwner])) format(name,sizeof name,"%s",BandasInfo[GF[g][gfOwner]][BNombre]);
 mysql_format(handle_db,q,sizeof q,"UPDATE grafitis SET IDB=%d,NombreBanda='%e',Tiempo=%d WHERE ID=%d",GF[g][gfOwner],name,GF[g][gfNext],GF[g][gfID]);
 if(!GF_Save(g) || !GF_SQL(q) || !GF_SQL("COMMIT")) {GF_SQL("ROLLBACK");GF[g][gfOwner]=oldOwner;GF[g][gfState]=oldState;GF[g][gfDeadline]=oldDeadline;GF[g][gfNext]=oldNext;GF[g][gfDirty]=1;return 0;}
 GF_Active=-1;GF_Object(g);foreach(new p:Player) if(GF_Paint[p]==g) GF_Stop(p,true);
 new text[180];
 if(winner>0) format(text,sizeof text,"[Grafitis] %s gano en %s. Grafiti protegido 3 dias.",BandasInfo[winner][BNombre],GF[g][gfZone]);
 else format(text,sizeof text,"[Grafitis] Termino %s sin ganador. Conserva su propietario y queda protegido 3 dias.",GF[g][gfZone]);
 GF_Announce(text);return 1;
}
stock GF_CanPaint(p,g) {
 return GF_Live(p) && gang_player(p) && g>=0 && g<GF_Count && GF[g][gfState]==2 && GF[g][gfDeadline]>gettime() &&
  GetPlayerState(p)==PLAYER_STATE_ONFOOT && GetPlayerInterior(p)==0 && GetPlayerVirtualWorld(p)==0 &&
  !PLAYER_INFO[p][Agonizando] && !PLAYER_TEMP[p][VariableCaido] && !PLAYER_INFO[p][pTiempoCarcel] && !PLAYER_INFO[p][pTiempoJail] &&
  !PLAYER_INFO[p][pDuty] && !PLAYER_INFO[p][varzonasegura] && GetPlayerWeapon(p)==41 && IsPlayerInRangeOfPoint(p,3.0,GF[g][gfPX],GF[g][gfPY],GF[g][gfPZ]);
}
stock GF_Begin(p,bool:automatic) {
 new g=GF_Active;
 if(!GF_CanPaint(p,g)) return SendClientMessage(p,-1,"Necesitas banda, spray en mano y estar a pie junto al grafiti activo, fuera de zona segura, sin estar abatido o preso."),0;
 new w,ammo;GetPlayerWeaponData(p,9,w,ammo);if(w!=41 || ammo<=0) return SendClientMessage(p,-1,"No tienes spray disponible."),0;
 GF_Paint[p]=g;GF_Account[p]=PLAYER_INFO[p][pID];GF_PlayerBand[p]=PLAYER_INFO[p][pFaccion];GF_Auto[p]=automatic;
 if(automatic) {ApplyAnimation(p,"SPRAYCAN","spraycan_full",4.1,1,0,0,0,0,1);SendClientMessage(p,-1,"Pintando. /grafitis detener cancela. Alejarte o cambiar de arma cancela tambien.");}return 1;
}
stock GF_PaintStep(p) {
 new g=GF_Paint[p];
 if(!GF_CanPaint(p,g) || GF_Account[p]!=PLAYER_INFO[p][pID] || GF_PlayerBand[p]!=PLAYER_INFO[p][pFaccion]) {GF_Stop(p,true);return 0;}
 new now=gettime();if(GF_LastPaint[p]==now) return 0;
 if(!GF_Auto[p]) {new keys,ud,lr;GetPlayerKeys(p,keys,ud,lr);if(!(keys & KEY_FIRE)) {GF_Stop(p);return 0;}}
 new w,ammo;GetPlayerWeaponData(p,9,w,ammo);if(w!=41 || ammo<=0) {GF_Stop(p,true);return 0;}
 new b=GF_PlayerBand[p],slot=-1;
 for(new s;s<4;s++) if(GF[g][gfBand][s]==b) {slot=s;break;}
 if(slot<0) for(new s;s<4;s++) if(!GF[g][gfBand][s]) {slot=s;GF[g][gfBand][s]=b;break;}
 if(slot<0) {SendClientMessage(p,-1,"Ya participan cuatro bandas.");GF_Stop(p);return 0;}
 GF_LastPaint[p]=now;if(GF_BandTick[g][slot]==now) return 0;
 GF_BandTick[g][slot]=now;SetPlayerAmmo(p,41,ammo-1);GF[g][gfProgress][slot]=min(100,GF[g][gfProgress][slot]+1);GF[g][gfDirty]=1;
 new text[100];format(text,sizeof text,"~y~GRAFITI~w~ %d%%~n~%d segundos restantes",GF[g][gfProgress][slot],max(0,GF[g][gfDeadline]-now));GameTextForPlayer(p,text,1500,4);
 if(GF[g][gfProgress][slot]>=100) return GF_Finish(g,b);return 1;
}
stock GF_Status(p) {
 new g=GF_Active;if(g<0) return SendClientMessage(p,-1,"No hay una disputa activa. Consulta /grafitis lista.");
 new body[850],line[100];format(body,sizeof body,"Zona: %s\nEstado: %s\nTiempo restante: %d segundos\n\n",GF[g][gfZone],GF[g][gfState]==1?("Preparacion"):("En disputa"),max(0,GF[g][gfDeadline]-gettime()));
 for(new s;s<4;s++) if(GF_BandValid(GF[g][gfBand][s])) {format(line,sizeof line,"%s: %d%%\n",BandasInfo[GF[g][gfBand][s]][BNombre],GF[g][gfProgress][s]);strcat(body,line);}
 strcat(body,"\nPrimera banda en 100% gana; maximo 1% por banda/segundo.\nSpray + /grafitis pintar. /grafitis detener cancela.");return dialogs_ShowPlayerDialog(p,GF_STATUS,DIALOG_STYLE_MSGBOX,"Grafitis | Disputa",body,"Volver","Cerrar");
}
stock GF_Locate(p,g) {if(g<0 || g>=GF_Count) return 0;SetPlayerMapIcon(p,5,GF[g][gfPX],GF[g][gfPY],GF[g][gfPZ],0,0xE5BB59FF,MAPICON_GLOBAL);SendClientMessageEx(p,-1,"Grafiti de %s marcado. /grafitis estado para ver la disputa.",GF[g][gfZone]);return 1;}
stock ListaDisputas(p) {
 if(!GF_Ready) return SendClientMessage(p,-1,"Grafitis no cargados: revisa MySQL.");
 if(!GF_Count) return SendClientMessage(p,-1,"El catalogo automatico no pudo cargarse. Revisa la conexion MySQL.");
 new body[6000]="Zona\tEstado\tPropietario",line[130];
 for(new g;g<GF_Count;g++) {
  new owner[32]="Libre",statusText[45];if(GF_BandValid(GF[g][gfOwner])) format(owner,sizeof owner,"%s",BandasInfo[GF[g][gfOwner]][BNombre]);
  if(GF[g][gfState]) format(statusText,sizeof statusText,"%s (%ds)",GF[g][gfState]==1?("Preparacion"):("Disputa"),max(0,GF[g][gfDeadline]-gettime()));
  else if(GF[g][gfNext]>gettime()) format(statusText,sizeof statusText,"Protegido (%dh)",(GF[g][gfNext]-gettime()+3599)/3600);else format(statusText,sizeof statusText,"Disponible");
  format(line,sizeof line,"\n%s\t%s\t%s",GF[g][gfZone],statusText,owner);strcat(body,line);
 }
 return dialogs_ShowPlayerDialog(p,GF_MENU,DIALOG_STYLE_TABLIST_HEADERS,"Grafitis | Selecciona para localizar",body,"Localizar","Cerrar");
}
CMD:grafitis(playerid,params[]) {
 if(!GF_Live(playerid)) return 1;
 if(isnull(params) || !strcmp(params,"lista",true) || !strcmp(params,"menu",true)) return ListaDisputas(playerid);
 if(!strcmp(params,"pintar",true)) return GF_Begin(playerid,true);
 if(!strcmp(params,"detener",true)) return GF_Stop(playerid,true);
 if(!strcmp(params,"estado",true)) return GF_Status(playerid);
 if(!strcmp(params,"localizar",true)) {if(GF_Active>=0) return GF_Locate(playerid,GF_Active);return ListaDisputas(playerid);}
 return SendClientMessage(playerid,-1,"/grafitis lista, estado, localizar, pintar o detener.");
}
CMD:activarg(playerid) {if(PLAYER_INFO[playerid][pAdmin]<=6) return 1;if(!SiguienteGraf()) SendClientMessage(playerid,-1,"No se puede activar: falta carga/puntos, hay otra disputa o todos estan protegidos.");return 1;}
CMD:grafitiadmin(playerid,params[]) {
 if(!GF_Live(playerid) || PLAYER_INFO[playerid][pAdmin]<=6) return 1;
 if(!GF_Ready) return SendClientMessage(playerid,-1,"La base de grafitis no esta disponible.");
 new action[16],arguments[128];if(sscanf(params,"s[16]s[128]",action,arguments)) return SendClientMessage(playerid,-1,"/grafitiadmin colocar Zona | crear GX GY GZ RZ Zona | mover ID GX GY GZ RZ");
 if(!strcmp(action,"colocar",true)) {
  new Float:px,Float:py,Float:pz,Float:a,placement[220];GetPlayerPos(playerid,px,py,pz);GetPlayerFacingAngle(playerid,a);
  format(placement,sizeof placement,"crear %f %f %f %f %s",px-floatsin(a,degrees)*0.65,py+floatcos(a,degrees)*0.65,pz+1.0,a,arguments);
  return callcmd::grafitiadmin(playerid,placement);
 }
 new id,Float:x,Float:y,Float:z,Float:rz,zone[32],create=!strcmp(action,"crear",true);
 if(create) {if(sscanf(arguments,"ffffs[32]",x,y,z,rz,zone)) return SendClientMessage(playerid,-1,"Frente a pared: /grafitiadmin crear GX GY GZ RZ Zona. Tu posicion sera el punto de pintura.");}
 else if(!strcmp(action,"mover",true)) {if(sscanf(arguments,"iffff",id,x,y,z,rz)) return SendClientMessage(playerid,-1,"/grafitiadmin mover ID GX GY GZ RZ. Tu posicion sera el punto de pintura.");}
 else return SendClientMessage(playerid,-1,"Acciones: crear o mover. /activarg inicia el siguiente disponible.");
 if(GetPlayerInterior(playerid)!=0 || GetPlayerVirtualWorld(playerid)!=0 || !IsPlayerInRangeOfPoint(playerid,5.0,x,y,z)) return SendClientMessage(playerid,-1,"Acercate a la pared en el mundo exterior 0.");
 new g=-1;if(create) {if(GF_Count>=GF_MAX) return SendClientMessage(playerid,-1,"Limite de grafitis alcanzado.");g=GF_Count;}
 else {for(new i;i<GF_Count;i++) if(GF[i][gfID]==id) {g=i;break;}if(g<0) return SendClientMessage(playerid,-1,"ID inexistente.");if(GF[g][gfState]) return SendClientMessage(playerid,-1,"Termina la disputa antes de mover el punto.");}
 new Float:px,Float:py,Float:pz,q[600];GetPlayerPos(playerid,px,py,pz);
 if(create) mysql_format(handle_db,q,sizeof q,"INSERT INTO grafitis(IDB,NombreBanda,GX,GY,GZ,GRX,GRY,GRZ,Tiempo,Direccion,PX,PY,PZ) VALUES(0,'LIBRE',%f,%f,%f,0,0,%f,0,'%e',%f,%f,%f)",x,y,z,rz,zone,px,py,pz);
 else mysql_format(handle_db,q,sizeof q,"UPDATE grafitis SET GX=%f,GY=%f,GZ=%f,GRX=0,GRY=0,GRZ=%f,PX=%f,PY=%f,PZ=%f WHERE ID=%d",x,y,z,rz,px,py,pz,id);
 new Cache:c=mysql_query(handle_db,q,true),ok=mysql_errno(handle_db)==0;if(create && ok) id=cache_insert_id();if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
 if(!ok || id<=0) return SendClientMessage(playerid,-1,"No se guardo el punto. Revisa MySQL.");
 if(create) {GF_Count++;GF[g][gfID]=id;format(GF[g][gfZone],32,"%s",zone);}
 GF[g][gfX]=x;GF[g][gfY]=y;GF[g][gfZ]=z;GF[g][gfRX]=0.0;GF[g][gfRY]=0.0;GF[g][gfRZ]=rz;GF[g][gfPX]=px;GF[g][gfPY]=py;GF[g][gfPZ]=pz;GF[g][gfDirty]=1;GF_Object(g);
 SendClientMessageEx(playerid,-1,"Grafiti ID %d guardado. Revisa la pared y usa /activarg para probarlo.",id);return 1;
}
stock GF_Init() {
 if(GF_Ready || GF_Loading) return 1;
 GF_Ready=false;
 if(!GF_SQL("CREATE TABLE IF NOT EXISTS nexus_graffiti_state(id INT PRIMARY KEY,owner INT NOT NULL DEFAULT 0,state INT NOT NULL DEFAULT 0,deadline INT NOT NULL DEFAULT 0,next_at INT NOT NULL DEFAULT 0,b1 INT NOT NULL DEFAULT 0,b2 INT NOT NULL DEFAULT 0,b3 INT NOT NULL DEFAULT 0,b4 INT NOT NULL DEFAULT 0,p1 INT NOT NULL DEFAULT 0,p2 INT NOT NULL DEFAULT 0,p3 INT NOT NULL DEFAULT 0,p4 INT NOT NULL DEFAULT 0) ENGINE=InnoDB")) return 1;
 #if !defined GF_QA_EMPTY_CATALOG
 if(!GF_SeedCatalog()) printf("[Grafitis] Error al registrar el catalogo automatico. Se cargaran los puntos ya guardados.");
 #endif
 GF_Loading=true;for(new p;p<MAX_PLAYERS;p++) GF_Paint[p]=-1;
 mysql_tquery(handle_db,"SELECT g.*,s.owner,s.state,s.deadline,s.next_at,s.b1,s.b2,s.b3,s.b4,s.p1,s.p2,s.p3,s.p4 FROM grafitis g LEFT JOIN nexus_graffiti_state s ON s.id=g.ID ORDER BY g.ID LIMIT 53","GF_Load");return 1;
}
forward GF_Load();
public GF_Load() {
 if(GF_Ready) return 1;GF_Count=min(GF_MAX,cache_num_rows());GF_Active=-1;
 for(new g;g<GF_Count;g++) {
  cache_get_value_name_int(g,"ID",GF[g][gfID]);cache_get_value_name_int(g,"IDB",GF[g][gfOwner]);cache_get_value_name(g,"Direccion",GF[g][gfZone],32);
  cache_get_value_name_float(g,"GX",GF[g][gfX]);cache_get_value_name_float(g,"GY",GF[g][gfY]);cache_get_value_name_float(g,"GZ",GF[g][gfZ]);cache_get_value_name_float(g,"GRX",GF[g][gfRX]);cache_get_value_name_float(g,"GRY",GF[g][gfRY]);cache_get_value_name_float(g,"GRZ",GF[g][gfRZ]);
  cache_get_value_name_float(g,"PX",GF[g][gfPX]);cache_get_value_name_float(g,"PY",GF[g][gfPY]);cache_get_value_name_float(g,"PZ",GF[g][gfPZ]);
  new bool:nullValue;cache_is_value_name_null(g,"state",nullValue);
  if(!nullValue) {
   cache_get_value_name_int(g,"owner",GF[g][gfOwner]);cache_get_value_name_int(g,"state",GF[g][gfState]);cache_get_value_name_int(g,"deadline",GF[g][gfDeadline]);cache_get_value_name_int(g,"next_at",GF[g][gfNext]);
   for(new s;s<4;s++) {new field[4];format(field,sizeof field,"b%d",s+1);cache_get_value_name_int(g,field,GF[g][gfBand][s]);format(field,sizeof field,"p%d",s+1);cache_get_value_name_int(g,field,GF[g][gfProgress][s]);GF[g][gfProgress][s]=min(100,max(0,GF[g][gfProgress][s]));}
  } else {new old;cache_get_value_name_int(g,"Tiempo",old);GF[g][gfNext]=old>1500000000?old:0;}
  if(GF[g][gfState]>0 && GF[g][gfState]<=2 && GF_Active<0) GF_Active=g;
  else if(GF[g][gfState]) {GF[g][gfState]=0;GF[g][gfDeadline]=0;GF[g][gfDirty]=1;}
  GF_Object(g);
 }
 GF_Ready=true;GF_Loading=false;printf("[Grafitis] %d puntos cargados. Android/PC: /grafitis. Horario Venezuela 10:00-01:00.",GF_Count);return 1;
}
task GF_Tick[1000]() {
 if(!GF_Ready) return;
 new now=gettime(),g=GF_Active;
 if(g>=0) {
  if(GF[g][gfState]==1 && GF[g][gfDeadline]<=now) {
   new opening=GF[g][gfDeadline];GF[g][gfState]=2;GF[g][gfDeadline]=opening+420;
   if(GF_Save(g)) {GF_Object(g);GF_Announce("[Grafitis] Comenzo la disputa. /grafitis localizar, estado o pintar.");}
   else {GF[g][gfState]=1;GF[g][gfDeadline]=opening;}
  }
  if(GF[g][gfState]==2) {new winner;for(new s;s<4;s++) if(GF[g][gfProgress][s]>=100 && GF_BandValid(GF[g][gfBand][s])) {winner=GF[g][gfBand][s];break;}if(winner || GF[g][gfDeadline]<=now) GF_Finish(g,winner);}
 }
 foreach(new p:Player) if(GF_Paint[p]>=0) GF_PaintStep(p);
 for(new i;i<GF_Count;i++) {new display=GF[i][gfState]==2?-1:(GF_BandValid(GF[i][gfOwner])?GF[i][gfOwner]:0);if(display!=GF_RenderBand[i]) GF_Object(i);}
 if(now%5==0) for(new i;i<GF_Count;i++) if(GF[i][gfDirty]) GF_Save(i);
 new shifted=now-14400,hour=shifted/3600,minute=(shifted%3600)/60;
 if(GF_HoursOpen() && minute==24 && GF_LastHour!=hour) {GF_LastHour=hour;SiguienteGraf();}
}
hook OnPlayerConnect(playerid) {GF_Paint[playerid]=-1;GF_Account[playerid]=0;GF_Auto[playerid]=0;GF_LastPaint[playerid]=0;return 1;}
hook OnPlayerDisconnect(playerid,reason) {GF_Stop(playerid);return 1;}
hook OnPlayerDeath(playerid,killerid,reason) {GF_Stop(playerid);return 1;}
hook OnPlayerKeyStateChange(playerid,newkeys,oldkeys) {if((newkeys & KEY_FIRE) && !(oldkeys & KEY_FIRE) && GF_Live(playerid) && GetPlayerWeapon(playerid)==41 && GF_Active>=0 && GF_Paint[playerid]<0) GF_Begin(playerid,false);if((oldkeys & KEY_FIRE) && !(newkeys & KEY_FIRE) && !GF_Auto[playerid]) GF_Stop(playerid);return 1;}
hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {if(!GF_Live(playerid)) return 1;if(dialogid==GF_MENU && dl_playerDialogID[playerid]==dialogid && response && listitem>=0 && listitem<GF_Count) GF_Locate(playerid,listitem);if(dialogid==GF_STATUS && dl_playerDialogID[playerid]==dialogid && response) ListaDisputas(playerid);return 1;}
hook OnGameModeExit() {for(new g;g<GF_Count;g++) GF_Save(g);return 1;}
