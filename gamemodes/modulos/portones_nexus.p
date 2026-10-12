// Administrative native gates. Commands/dialogs work on PC and Android.
#define GT_MAX 300
#define GT_EDIT 31230
#define GT_DELETE 31231
#define GT_LIST 31232
#define GT_MODELS 31233
enum _:GT_DATA {gtID,gtModel,gtType,gtLink,gtWorld,gtInterior,Float:gtCX,Float:gtCY,Float:gtCZ,Float:gtCRX,Float:gtCRY,Float:gtCRZ,Float:gtOX,Float:gtOY,Float:gtOZ,Float:gtORX,Float:gtORY,Float:gtORZ,gtObject,Text3D:gtLabel,bool:gtOpen,gtEditor};
new GT[GT_MAX][GT_DATA],bool:GT_Ready;
new GT_Selected[MAX_PLAYERS],GT_Record[MAX_PLAYERS],GT_Account[MAX_PLAYERS],GT_EndPoint[MAX_PLAYERS],GT_Step[MAX_PLAYERS],GT_Rows[MAX_PLAYERS][20],GT_RowIDs[MAX_PLAYERS][20],GT_Count[MAX_PLAYERS];
new const GT_Models[]={969,971,974,975,976,980,982,983,984,985,986,987,988,989,991};
new const GT_Names[][]={"Porton electrico","Porton de reja grande","Reja alta","Porton de barras","Porton de metal","Porton de aeropuerto","Reja de malla larga","Reja de malla corta","Reja de malla media","Porton derecho","Porton izquierdo","Reja de seguridad","Porton pequeno","Reja pequena","Barrera de reja"};
new const Float:GT_Steps[]={0.05,0.25,1.0};
stock GT_Admin(p) {return IsPlayerConnected(p) && !IsPlayerNPC(p) && JugadorLogeado[p] && PLAYER_INFO[p][pID]>0 && PLAYER_INFO[p][pAdmin]>=ADMIN_LEVEL_GLOBAL;}
stock GT_Live(p) {return IsPlayerConnected(p) && !IsPlayerNPC(p) && JugadorLogeado[p] && PLAYER_INFO[p][pID]>0 && !PLAYER_TEMP[p][VariableCaido] && (GetPlayerState(p)==PLAYER_STATE_ONFOOT || GetPlayerState(p)==PLAYER_STATE_DRIVER);}
stock GT_ModelOK(model) {for(new n;n<sizeof GT_Models;n++) if(GT_Models[n]==model) return 1;return 0;}
stock GT_Factory(db) {for(new n;n<MAX_FABRICAS;n++) if(FABRICAS_INFO[n][f_VALID] && FABRICAS_INFO[n][f_DBID]==db) return n;return -1;}
stock GT_Link(type,id,bool:input=false) {
 switch(type) {
 case 1:return id>0 && id<MAX_PROPIEDADES && PropInfo[id][pEnUso] && PropInfo[id][pTipo]==1;
 case 2:return id>0 && id<MAX_BANDAS && BandasInfo[id][EnUso];
 case 3: {if(input) return id>=0 && id<MAX_FABRICAS && FABRICAS_INFO[id][f_VALID];return GT_Factory(id)>=0;}
 }
 return 0;
}
stock GT_Type(const text[]) {if(!strcmp(text,"casa",true)) return 1;if(!strcmp(text,"faccion",true)) return 2;if(!strcmp(text,"fabrica",true)) return 3;return 0;}
stock GT_Access(p,g) {
 if(!GT_Live(p) || g<0 || g>=GT_MAX || !GT[g][gtID] || !GT_Link(GT[g][gtType],GT[g][gtLink])) return 0;
 if(GT_Admin(p)) return 1;
 switch(GT[g][gtType]) {
 case 1:return PropInfo[GT[g][gtLink]][pIDPropietario]>0 && PropInfo[GT[g][gtLink]][pIDPropietario]==PLAYER_INFO[p][pID];
 case 2:return PLAYER_INFO[p][pFaccion]>0 && PLAYER_INFO[p][pFaccion]==GT[g][gtLink];
 case 3: {new f=GT_Factory(GT[g][gtLink]);return f>=0 && FABRICAS_INFO[f][f_FACCION_ID]>0 && PLAYER_INFO[p][pFaccion]==FABRICAS_INFO[f][f_FACCION_ID];}
 }
 return 0;
}
stock GT_Find(id) {for(new g;g<GT_MAX;g++) if(GT[g][gtID]==id && id>0) return g;return -1;}
stock GT_Near(p,Float:range) {
 new found=-1;new Float:best=range;
 for(new g;g<GT_MAX;g++) if(GT[g][gtID] && GT[g][gtWorld]==GetPlayerVirtualWorld(p) && GT[g][gtInterior]==GetPlayerInterior(p)) {
 new Float:x,Float:y,Float:z;GetPlayerPos(p,x,y,z);new Float:d=VectorSize(x-GT[g][gtCX],y-GT[g][gtCY],z-GT[g][gtCZ]);if(d<=best) {found=g;best=d;}}
 return found;
}
stock GT_GetPose(g,b,Float:pose[6]) {for(new n;n<6;n++)pose[n]=Float:GT[g][b+n];return 1;}
stock GT_PutPose(g,b,const Float:pose[6]) {for(new n;n<6;n++)GT[g][b+n]=_:pose[n];return 1;}
stock GT_Spawn(g,bool:preview=false) {
 if(IsValidDynamicObject(GT[g][gtObject])) DestroyDynamicObject(GT[g][gtObject]);
 if(IsValidDynamic3DTextLabel(GT[g][gtLabel])) DestroyDynamic3DTextLabel(GT[g][gtLabel]);
 new bool:open=preview && GT[g][gtEditor]!=INVALID_PLAYER_ID && GT_EndPoint[GT[g][gtEditor]]==1;
 new b=open?gtOX:gtCX;new Float:pose[6];GT_GetPose(g,b,pose);GT[g][gtObject]=CreateDynamicObject(GT[g][gtModel],pose[0],pose[1],pose[2],pose[3],pose[4],pose[5],GT[g][gtWorld],GT[g][gtInterior]);GT[g][gtOpen]=false;
 new text[180];format(text,sizeof text,"{72B1FF}PORTON #%d\n{FFFFFF}/porton | Bocina en auto | H a pie",GT[g][gtID]);
 GT[g][gtLabel]=CreateDynamic3DTextLabel(text,-1,GT[g][gtCX],GT[g][gtCY],GT[g][gtCZ]+1.0,12.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,GT[g][gtWorld],GT[g][gtInterior]);return IsValidDynamicObject(GT[g][gtObject]);
}
stock GT_Save(g) {
 new q[1000];mysql_format(handle_db,q,sizeof q,"UPDATE rp_gates SET Model=%d,Type=%d,LinkID=%d,World=%d,Interior=%d,CX=%f,CY=%f,CZ=%f,CRX=%f,CRY=%f,CRZ=%f,OX=%f,OY=%f,OZ=%f,ORX=%f,ORY=%f,ORZ=%f WHERE ID=%d",GT[g][gtModel],GT[g][gtType],GT[g][gtLink],GT[g][gtWorld],GT[g][gtInterior],GT[g][gtCX],GT[g][gtCY],GT[g][gtCZ],GT[g][gtCRX],GT[g][gtCRY],GT[g][gtCRZ],GT[g][gtOX],GT[g][gtOY],GT[g][gtOZ],GT[g][gtORX],GT[g][gtORY],GT[g][gtORZ],GT[g][gtID]);return RP_BizSQL(q);
}
stock GT_Init() {
 GT_Ready=false;
 if(!RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_gates (ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,Model INT NOT NULL,Type INT NOT NULL,LinkID INT NOT NULL,World INT NOT NULL,Interior INT NOT NULL,CX FLOAT NOT NULL,CY FLOAT NOT NULL,CZ FLOAT NOT NULL,CRX FLOAT NOT NULL,CRY FLOAT NOT NULL,CRZ FLOAT NOT NULL,OX FLOAT NOT NULL,OY FLOAT NOT NULL,OZ FLOAT NOT NULL,ORX FLOAT NOT NULL,ORY FLOAT NOT NULL,ORZ FLOAT NOT NULL) ENGINE=InnoDB")) return 0;
 for(new p;p<MAX_PLAYERS;p++) GT_Selected[p]=-1;
 for(new g;g<GT_MAX;g++) {if(IsValidDynamicObject(GT[g][gtObject]))DestroyDynamicObject(GT[g][gtObject]);if(IsValidDynamic3DTextLabel(GT[g][gtLabel]))DestroyDynamic3DTextLabel(GT[g][gtLabel]);for(new n;n<GT_DATA;n++)GT[g][n]=0;GT[g][gtEditor]=INVALID_PLAYER_ID;}
 new Cache:c=mysql_query(handle_db,"SELECT * FROM rp_gates ORDER BY ID",true);if(mysql_errno(handle_db)!=0) {if(c!=MYSQL_INVALID_CACHE)cache_delete(c);return 0;}
 new rows=cache_num_rows();if(rows>GT_MAX) printf("[Portones] Limite %d excedido: registros adicionales no cargados.",GT_MAX);
 for(new g;g<min(rows,GT_MAX);g++) {
 cache_get_value_name_int(g,"ID",GT[g][gtID]);cache_get_value_name_int(g,"Model",GT[g][gtModel]);cache_get_value_name_int(g,"Type",GT[g][gtType]);cache_get_value_name_int(g,"LinkID",GT[g][gtLink]);cache_get_value_name_int(g,"World",GT[g][gtWorld]);cache_get_value_name_int(g,"Interior",GT[g][gtInterior]);
 cache_get_value_name_float(g,"CX",GT[g][gtCX]);cache_get_value_name_float(g,"CY",GT[g][gtCY]);cache_get_value_name_float(g,"CZ",GT[g][gtCZ]);cache_get_value_name_float(g,"CRX",GT[g][gtCRX]);cache_get_value_name_float(g,"CRY",GT[g][gtCRY]);cache_get_value_name_float(g,"CRZ",GT[g][gtCRZ]);
 cache_get_value_name_float(g,"OX",GT[g][gtOX]);cache_get_value_name_float(g,"OY",GT[g][gtOY]);cache_get_value_name_float(g,"OZ",GT[g][gtOZ]);cache_get_value_name_float(g,"ORX",GT[g][gtORX]);cache_get_value_name_float(g,"ORY",GT[g][gtORY]);cache_get_value_name_float(g,"ORZ",GT[g][gtORZ]);GT[g][gtEditor]=INVALID_PLAYER_ID;if(GT_ModelOK(GT[g][gtModel])) GT_Spawn(g);
 }
 if(c!=MYSQL_INVALID_CACHE)cache_delete(c);GT_Ready=true;printf("[Portones] %d portones/rejas cargados, siempre cerrados al iniciar.",min(rows,GT_MAX));return 1;
}
stock GT_EndEdit(p) {new g=GT_Selected[p];if(g>=0 && g<GT_MAX && GT[g][gtID]==GT_Record[p] && GT[g][gtID]>0 && GT[g][gtEditor]==p) {GT[g][gtEditor]=INVALID_PLAYER_ID;GT_Spawn(g);}GT_Selected[p]=-1;return 1;}
stock GT_EditContext(p) {new g=GT_Selected[p];return GT_Admin(p) && GetPlayerState(p)==PLAYER_STATE_ONFOOT && g>=0 && g<GT_MAX && GT_Record[p]==GT[g][gtID] && GT_Account[p]==PLAYER_INFO[p][pID] && GT[g][gtEditor]==p && GT[g][gtWorld]==GetPlayerVirtualWorld(p) && GT[g][gtInterior]==GetPlayerInterior(p);}
stock GT_EditShow(p) {
 if(!GT_EditContext(p)) return GT_EndEdit(p);
 new title[110];format(title,sizeof title,"Porton #%d | %s | Paso %.2f",GT_Record[p],GT_EndPoint[p]?("ABIERTO"):("CERRADO"),GT_Steps[GT_Step[p]]);
 return dialogs_ShowPlayerDialog(p,GT_EDIT,DIALOG_STYLE_LIST,title,"Editar posicion CERRADA\nEditar posicion ABIERTA\nColocar aqui\nMover +X\nMover -X\nMover +Y\nMover -Y\nSubir\nBajar\nGirar +15 grados\nGirar -15 grados\nInclinar X +15\nInclinar X -15\nInclinar Y +15\nInclinar Y -15\nCambiar paso (0.05 / 0.25 / 1 m)\nCambiar modelo de porton/reja\nTerminar y dejar cerrado","Elegir","Terminar");
}
stock GT_BeginEdit(p,g) {
 if(!GT_Admin(p) || GetPlayerState(p)!=PLAYER_STATE_ONFOOT || g<0 || g>=GT_MAX || !GT[g][gtID]) return 0;
 if(GT[g][gtWorld]!=GetPlayerVirtualWorld(p) || GT[g][gtInterior]!=GetPlayerInterior(p) || !IsPlayerInRangeOfPoint(p,30.0,GT[g][gtCX],GT[g][gtCY],GT[g][gtCZ])) return SendClientMessage(p,-1,"Acercate a pie al porton (30 metros, mismo mundo/interior).");
 if(GT[g][gtEditor]!=INVALID_PLAYER_ID && GT[g][gtEditor]!=p) return SendClientMessage(p,-1,"Otro administrador esta ajustando ese porton.");
 GT_EndEdit(p);GT_Selected[p]=g;GT_Record[p]=GT[g][gtID];GT_Account[p]=PLAYER_INFO[p][pID];GT_EndPoint[p]=0;GT_Step[p]=1;GT[g][gtEditor]=p;GT_Spawn(g,true);return GT_EditShow(p);
}
stock GT_Toggle(p,g) {
 if(!GT_Ready || !GT_Live(p) || g<0 || g>=GT_MAX || !GT[g][gtID]) return 0;
 new Float:range=GetPlayerState(p)==PLAYER_STATE_DRIVER?15.0:7.0;
 if(GT[g][gtWorld]!=GetPlayerVirtualWorld(p) || GT[g][gtInterior]!=GetPlayerInterior(p) || !IsPlayerInRangeOfPoint(p,range,GT[g][gtCX],GT[g][gtCY],GT[g][gtCZ])) return SendClientMessage(p,-1,"Acercate al porton en su mundo/interior.");
 if(!GT_Access(p,g)) return SendClientMessage(p,-1,"No tienes permiso: propietario de casa o miembro de su faccion/fabrica.");
 if(GT[g][gtEditor]!=INVALID_PLAYER_ID) return SendClientMessage(p,-1,"Porton en edicion administrativa.");
 if(!IsValidDynamicObject(GT[g][gtObject])) return SendClientMessage(p,-1,"Ese porton no esta disponible.");
 if(IsDynamicObjectMoving(GT[g][gtObject])) return SendClientMessage(p,-1,"Espera a que termine de moverse.");
 new b=GT[g][gtOpen]?gtCX:gtOX;new Float:pose[6];GT_GetPose(g,b,pose);
 if(VectorSize(GT[g][gtOX]-GT[g][gtCX],GT[g][gtOY]-GT[g][gtCY],GT[g][gtOZ]-GT[g][gtCZ])<0.01) {SetDynamicObjectPos(GT[g][gtObject],pose[0],pose[1],pose[2]);SetDynamicObjectRot(GT[g][gtObject],pose[3],pose[4],pose[5]);}
 else if(MoveDynamicObject(GT[g][gtObject],pose[0],pose[1],pose[2],2.0,pose[3],pose[4],pose[5])<0) return 0;
 GT[g][gtOpen]=!GT[g][gtOpen];SendClientMessage(p,-1,GT[g][gtOpen]?("Abriendo porton."):("Cerrando porton."));return 1;
}
stock GT_Key(p,newkeys,oldkeys) {
 if(!GT_Live(p) || !(newkeys & KEY_CROUCH) || (oldkeys & KEY_CROUCH)) return 0;
 new g=GT_Near(p,GetPlayerState(p)==PLAYER_STATE_DRIVER?15.0:7.0);if(g<0) return 0;GT_Toggle(p,g);return 1;
}
stock GT_List(p) {
 if(!GT_Live(p)) return 0;GT_Count[p]=0;new text[1900],line[80];
 for(new g;g<GT_MAX && GT_Count[p]<20;g++) if(GT_Access(p,g) && GT[g][gtWorld]==GetPlayerVirtualWorld(p) && GT[g][gtInterior]==GetPlayerInterior(p) && IsPlayerInRangeOfPoint(p,60.0,GT[g][gtCX],GT[g][gtCY],GT[g][gtCZ])) {new n=GT_Count[p]++;GT_Rows[p][n]=g;GT_RowIDs[p][n]=GT[g][gtID];format(line,sizeof line,"Porton #%d | %s\n",GT[g][gtID],GT[g][gtOpen]?("Abierto"):("Cerrado"));strcat(text,line);}
 if(!GT_Count[p]) return SendClientMessage(p,-1,"No hay portones con acceso cerca. /portones se usa hasta 60 metros.");
 return dialogs_ShowPlayerDialog(p,GT_LIST,DIALOG_STYLE_LIST,"Portones | Abrir / cerrar",text,"Usar","Cerrar");
}
stock GT_Dialog(p,d,response,row) {
 if(d!=GT_EDIT && d!=GT_DELETE && d!=GT_LIST && d!=GT_MODELS) return 0;
 if(d==GT_LIST) {if(response && row>=0 && row<GT_Count[p]) {new g=GT_Rows[p][row];if(g>=0 && g<GT_MAX && GT[g][gtID]==GT_RowIDs[p][row]) GT_Toggle(p,g);}return 1;}
 if(!GT_EditContext(p)) return GT_EndEdit(p),1;
 new g=GT_Selected[p];if(!response) {if(d==GT_MODELS) GT_EditShow(p);else GT_EndEdit(p);return 1;}
 if(d==GT_DELETE) {new q[100];mysql_format(handle_db,q,sizeof q,"DELETE FROM rp_gates WHERE ID=%d",GT_Record[p]);if(!RP_BizSQL(q,true)) return SendClientMessage(p,-1,"No se pudo borrar el porton."),GT_EndEdit(p),1;if(IsValidDynamicObject(GT[g][gtObject]))DestroyDynamicObject(GT[g][gtObject]);if(IsValidDynamic3DTextLabel(GT[g][gtLabel]))DestroyDynamic3DTextLabel(GT[g][gtLabel]);GT[g][gtID]=0;GT[g][gtEditor]=INVALID_PLAYER_ID;GT_Selected[p]=-1;SendClientMessage(p,-1,"Porton eliminado y guardado.");return 1;}
 if(d==GT_MODELS) {if(row>=0 && row<sizeof GT_Models) {new old=GT[g][gtModel];GT[g][gtModel]=GT_Models[row];if(!GT_Save(g)) {GT[g][gtModel]=old;SendClientMessage(p,-1,"No se pudo guardar el modelo.");}else GT_Spawn(g,true);}GT_EditShow(p);return 1;}
 if(row==17) return GT_EndEdit(p),1;
 if(row==0 || row==1) {GT_EndPoint[p]=row;GT_Spawn(g,true);GT_EditShow(p);return 1;}
 if(row==15) {GT_Step[p]=(GT_Step[p]+1)%sizeof GT_Steps;GT_EditShow(p);return 1;}
 if(row==16) {new text[900],line[65];for(new n;n<sizeof GT_Models;n++) {format(line,sizeof line,"%d - %s\n",GT_Models[n],GT_Names[n]);strcat(text,line);}dialogs_ShowPlayerDialog(p,GT_MODELS,DIALOG_STYLE_LIST,"Modelos nativos | PC y Android",text,"Usar","Volver");return 1;}
 if(row<2 || row>14) return 1;
 new b=GT_EndPoint[p]?gtOX:gtCX;new Float:old[6],Float:pose[6];GT_GetPose(g,b,old);GT_GetPose(g,b,pose);new Float:step=GT_Steps[GT_Step[p]];
 switch(row) {case 2:{GetPlayerPos(p,pose[0],pose[1],pose[2]);GetPlayerFacingAngle(p,pose[5]);}case 3:pose[0]+=step;case 4:pose[0]-=step;case 5:pose[1]+=step;case 6:pose[1]-=step;case 7:pose[2]+=step;case 8:pose[2]-=step;case 9:pose[5]+=15.0;case 10:pose[5]-=15.0;case 11:pose[3]+=15.0;case 12:pose[3]-=15.0;case 13:pose[4]+=15.0;case 14:pose[4]-=15.0;}
 GT_PutPose(g,b,pose);
 new bool:ok=IsPlayerInRangeOfPoint(p,30.0,pose[0],pose[1],pose[2]) && VectorSize(GT[g][gtOX]-GT[g][gtCX],GT[g][gtOY]-GT[g][gtCY],GT[g][gtOZ]-GT[g][gtCZ])<=40.0;
 if(ok) ok=bool:GT_Save(g);if(!ok) {GT_PutPose(g,b,old);SendClientMessage(p,-1,"No se guardo: punto lejano, recorrido mayor de 40 m o error SQL.");}else {GT_Spawn(g,true);Streamer_Update(p,STREAMER_TYPE_OBJECT);SendClientMessage(p,-1,"Posicion guardada.");}GT_EditShow(p);return 1;
}
CMD:crearporton(playerid,const params[]) {
 if(!GT_Admin(playerid)) return SendClientMessage(playerid,-1,"Comando administrativo.");if(!GT_Ready || GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) return SendClientMessage(playerid,-1,"Debes estar a pie; sistema de portones disponible.");
 new typeText[12],id,model; if(sscanf(params,"s[12]dI(971)",typeText,id,model)) return SendClientMessage(playerid,-1,"/crearporton <casa|faccion|fabrica> <ID> [Modelo: 971]");
 new type=GT_Type(typeText);if(!GT_Link(type,id,true)) return SendClientMessage(playerid,-1,"Casa, faccion o fabrica invalida.");if(!GT_ModelOK(model)) return SendClientMessage(playerid,-1,"Modelo invalido. Usa 971 o cambia el modelo en /editarporton.");
 new g=-1;for(new n;n<GT_MAX;n++) if(!GT[n][gtID]) {g=n;break;}if(g<0) return SendClientMessage(playerid,-1,"Limite de 300 portones.");
 new link=type==3?FABRICAS_INFO[id][f_DBID]:id,Float:x,Float:y,Float:z,Float:a;GetPlayerPos(playerid,x,y,z);GetPlayerFacingAngle(playerid,a);
 new q[800];mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_gates (Model,Type,LinkID,World,Interior,CX,CY,CZ,CRX,CRY,CRZ,OX,OY,OZ,ORX,ORY,ORZ) VALUES (%d,%d,%d,%d,%d,%f,%f,%f,0,0,%f,%f,%f,%f,0,0,%f)",model,type,link,GetPlayerVirtualWorld(playerid),GetPlayerInterior(playerid),x,y,z,a,x,y,z+4.0,a);
 new Cache:c=mysql_query(handle_db,q,true),record=cache_insert_id();new bool:ok=mysql_errno(handle_db)==0 && record>0;if(c!=MYSQL_INVALID_CACHE)cache_delete(c);if(!ok) return SendClientMessage(playerid,-1,"No se pudo crear y guardar el porton.");
 for(new n;n<GT_DATA;n++)GT[g][n]=0;GT[g][gtID]=record;GT[g][gtModel]=model;GT[g][gtType]=type;GT[g][gtLink]=link;GT[g][gtWorld]=GetPlayerVirtualWorld(playerid);GT[g][gtInterior]=GetPlayerInterior(playerid);GT[g][gtCX]=x;GT[g][gtCY]=y;GT[g][gtCZ]=z;GT[g][gtCRZ]=a;GT[g][gtOX]=x;GT[g][gtOY]=y;GT[g][gtOZ]=z+4.0;GT[g][gtORZ]=a;GT[g][gtEditor]=INVALID_PLAYER_ID;GT_Spawn(g);new text[150];format(text,sizeof text,"Porton #%d creado. Ajusta cerrado y abierto; cada cambio se guarda.",record);SendClientMessage(playerid,-1,text);format(text,sizeof text,"Para volver a ajustarlo: /editarporton %d o /editarporton sin numero junto al porton.",record);SendClientMessage(playerid,-1,text);return GT_BeginEdit(playerid,g);
}
CMD:editarporton(playerid,const params[]) {
 if(!GT_Admin(playerid))return 0;
 new id,g;
 if(!strlen(params)) {g=GT_Near(playerid,30.0);if(g<0)return SendClientMessage(playerid,-1,"No hay un porton a 30 metros en este mundo/interior. /editarporton [ID del porton]");}
 else {
 if(sscanf(params,"d",id))return SendClientMessage(playerid,-1,"/editarporton [ID del PORTON]. Sin numero edita el mas cercano.");
 g=GT_Find(id);
 if(g<0) {new near=GT_Near(playerid,30.0),text[144];if(near>=0)format(text,sizeof text,"El porton #%d no existe. Cerca tienes el #%d: usa /editarporton %d o /editarporton sin numero.",id,GT[near][gtID],GT[near][gtID]);else format(text,sizeof text,"El porton #%d no existe. Usa su ID de creacion; el ID de casa/faccion y el modelo son distintos.",id);return SendClientMessage(playerid,-1,text);}
 }
 return GT_BeginEdit(playerid,g);
}
CMD:borrarporton(playerid,const params[]) {if(!GT_Admin(playerid))return 0;new id;if(sscanf(params,"d",id))return SendClientMessage(playerid,-1,"/borrarporton <ID>");new g=GT_Find(id);if(g<0)return SendClientMessage(playerid,-1,"Porton inexistente.");GT_BeginEdit(playerid,g);if(!GT_EditContext(playerid) || GT_Selected[playerid]!=g)return 1;return dialogs_ShowPlayerDialog(playerid,GT_DELETE,DIALOG_STYLE_MSGBOX,"Borrar porton","Se eliminara el porton y su registro guardado. Confirmar?","Borrar","Cancelar");}
CMD:porton(playerid,const params[]) {if(!GT_Live(playerid))return 0;new id,g;if(!strlen(params))g=GT_Near(playerid,GetPlayerState(playerid)==PLAYER_STATE_DRIVER?15.0:7.0);else {if(sscanf(params,"d",id))return SendClientMessage(playerid,-1,"/porton [ID] para abrir/cerrar; /portones para el menu.");g=GT_Find(id);}if(g<0)return SendClientMessage(playerid,-1,"No hay porton cerca con ese ID.");return GT_Toggle(playerid,g);}
CMD:portones(playerid,const params[]) {
 #pragma unused params
 return GT_List(playerid);
}
CMD:terminarporton(playerid,const params[]) {
 #pragma unused params
 GT_EndEdit(playerid);return SendClientMessage(playerid,-1,"Edicion terminada; porton cerrado.");
}
CMD:vincularporton(playerid,const params[]) {
 if(!GT_Admin(playerid))return 0;
 new id,typeText[12],link;if(sscanf(params,"ds[12]d",id,typeText,link)) return SendClientMessage(playerid,-1,"/vincularporton <PortonID> <casa|faccion|fabrica> <ID>");
 new g=GT_Find(id),type=GT_Type(typeText);if(g<0 || !GT_Link(type,link,true))return SendClientMessage(playerid,-1,"Porton o destino invalido.");
 GT_BeginEdit(playerid,g);if(!GT_EditContext(playerid) || GT_Selected[playerid]!=g)return 1;
 new oldType=GT[g][gtType],oldLink=GT[g][gtLink];GT[g][gtType]=type;GT[g][gtLink]=type==3?FABRICAS_INFO[link][f_DBID]:link;
 if(!GT_Save(g)) {GT[g][gtType]=oldType;GT[g][gtLink]=oldLink;SendClientMessage(playerid,-1,"No se pudo guardar el vinculo.");}else SendClientMessage(playerid,-1,"Vinculo guardado; los permisos ahora siguen al nuevo destino.");return GT_EditShow(playerid);
}
forward GT_Tick();
public GT_Tick() {
 for(new g;g<GT_MAX;g++) if(GT[g][gtID] && GT[g][gtEditor]!=INVALID_PLAYER_ID) {new p=GT[g][gtEditor];if(!GT_EditContext(p) || !IsPlayerInRangeOfPoint(p,60.0,GT[g][gtCX],GT[g][gtCY],GT[g][gtCZ])) GT_EndEdit(p);}
 return 1;
}