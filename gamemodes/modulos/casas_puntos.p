// Persistent interior service points, native dialogs for Android and PC.
#define HP_MENU 31220
#define HP_EDIT 31221
new bool:HP_Ready;
new Float:HP_Radio[MAX_PROPIEDADES][3],Text3D:HP_Label[MAX_PROPIEDADES];
new HP_House[MAX_PLAYERS],HP_Owner[MAX_PLAYERS],HP_Kind[MAX_PLAYERS];
stock HP_Init() {
 HP_Ready=bool:RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_house_points (HouseID INT NOT NULL, Kind INT NOT NULL, Interior INT NOT NULL, X FLOAT NOT NULL,Y FLOAT NOT NULL,Z FLOAT NOT NULL, PRIMARY KEY(HouseID,Kind)) ENGINE=InnoDB");return HP_Ready;
}
stock HP_Apply(h,k,Float:x,Float:y,Float:z) {
 switch(k) {
  case 0: {HP_Radio[h][0]=x;HP_Radio[h][1]=y;HP_Radio[h][2]=z;if(IsValidDynamic3DTextLabel(HP_Label[h])) DestroyDynamic3DTextLabel(HP_Label[h]);HP_Label[h]=CreateDynamic3DTextLabel("{FFFFFF}Radio\n/emisoras - /apagar radio",-1,x,y,z,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,PropInfo[h][pVW],PropInfo[h][pInteriorID]);}
  case 1: {PropInfo[h][pHeladeraX]=x;PropInfo[h][pHeladeraY]=y;PropInfo[h][pHeladeraZ]=z;if(IsValidDynamic3DTextLabel(PropInfo[h][pLabel3])) Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL,PropInfo[h][pLabel3],E_STREAMER_X,x),Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL,PropInfo[h][pLabel3],E_STREAMER_Y,y),Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL,PropInfo[h][pLabel3],E_STREAMER_Z,z);}
  case 2: {PropInfo[h][pRoperoX]=x;PropInfo[h][pRoperoY]=y;PropInfo[h][pRoperoZ]=z;if(IsValidDynamic3DTextLabel(PropInfo[h][pLabel4])) DestroyDynamic3DTextLabel(PropInfo[h][pLabel4]);PropInfo[h][pLabel4]=CreateDynamic3DTextLabel("{FFFFFF}Ropero\n/entrar",-1,x,y,z+0.6,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,PropInfo[h][pVW],PropInfo[h][pInteriorID]);}
 }
 return 1;
}
stock HP_Load(h) {
 if(!HP_Ready || !PropInfo[h][pEnUso]) return 0;
 if(IsValidDynamic3DTextLabel(HP_Label[h])) DestroyDynamic3DTextLabel(HP_Label[h]);HP_Label[h]=Text3D:0;
 HP_Radio[h][0]=0.0;HP_Radio[h][1]=0.0;HP_Radio[h][2]=0.0;
 new Float:best=100.0,index=-1;
 for(new n;n<sizeof RadiosPos;n++) {new Float:d=VectorSize(RadiosPos[n][0]-PropInfo[h][pPosXS],RadiosPos[n][1]-PropInfo[h][pPosYS],RadiosPos[n][2]-PropInfo[h][pPosZS]);if(d<best) {best=d;index=n;}}
 if(index>=0) HP_Apply(h,0,RadiosPos[index][0],RadiosPos[index][1],RadiosPos[index][2]);
 new q[160];mysql_format(handle_db,q,sizeof q,"SELECT Kind,X,Y,Z FROM rp_house_points WHERE HouseID=%d AND Interior=%d",h,PropInfo[h][pInterior]);
 new Cache:c=mysql_query(handle_db,q,true),rows;cache_get_row_count(rows);
 if(mysql_errno(handle_db)==0) for(new n;n<rows;n++) {new k,Float:x,Float:y,Float:z;cache_get_value_name_int(n,"Kind",k);cache_get_value_name_float(n,"X",x);cache_get_value_name_float(n,"Y",y);cache_get_value_name_float(n,"Z",z);if(k>=0 && k<=2) HP_Apply(h,k,x,y,z);}
 if(c!=MYSQL_INVALID_CACHE) cache_delete(c);return 1;
}
stock HP_Range(p) {
 for(new h;h<MAX_PROPIEDADES;h++) if(PropInfo[h][pEnUso] && PropInfo[h][pTipo]==1 && PropInfo[h][pVW]==GetPlayerVirtualWorld(p) && PropInfo[h][pInteriorID]==GetPlayerInterior(p)) return HP_Radio[h][2]!=0.0 && IsPlayerInRangeOfPoint(p,5.0,HP_Radio[h][0],HP_Radio[h][1],HP_Radio[h][2]);
 return -1;
}
stock HP_Show(p) {
 new h=MC_House(p);if(h<0 || PropInfo[h][pTipo]!=1) return SendClientMessage(p,-1,"Debes estar a pie dentro de una casa tuya.");
 HP_House[p]=h;HP_Owner[p]=PLAYER_INFO[p][pID];return dialogs_ShowPlayerDialog(p,HP_MENU,DIALOG_STYLE_LIST,"Casa | Mover textos y puntos","Radio\nHeladera\nRopero","Elegir","Cerrar");
}
stock HP_EditShow(p) {return dialogs_ShowPlayerDialog(p,HP_EDIT,DIALOG_STYLE_LIST,"Punto de uso | Posicion","Colocar aqui y guardar\nSubir 0.25 metros\nBajar 0.25 metros\nVolver","Elegir","Cerrar");}
stock HP_Dialog(p,d,response,row) {
 if(d!=HP_MENU && d!=HP_EDIT) return 0;
 if(!response) return 1;
 new h=MC_House(p);if(h<0 || h!=HP_House[p] || PLAYER_INFO[p][pID]!=HP_Owner[p] || PropInfo[h][pTipo]!=1) return SendClientMessage(p,-1,"Debes permanecer dentro de tu propia casa."),1;
 if(d==HP_MENU) {if(row>=0 && row<=2) {HP_Kind[p]=row;HP_EditShow(p);}return 1;}
 if(row==3) return HP_Show(p),1;
 if(row<0 || row>2 || !HP_Ready) return 1;
 new k=HP_Kind[p],Float:x,Float:y,Float:z;
 if(k<0 || k>2) return 1;
 if(row==0) GetPlayerPos(p,x,y,z);
 else {switch(k) {case 0:{x=HP_Radio[h][0];y=HP_Radio[h][1];z=HP_Radio[h][2];}case 1:{x=PropInfo[h][pHeladeraX];y=PropInfo[h][pHeladeraY];z=PropInfo[h][pHeladeraZ];}case 2:{x=PropInfo[h][pRoperoX];y=PropInfo[h][pRoperoY];z=PropInfo[h][pRoperoZ];}}z+=(row==1?0.25:-0.25);}
 if(!IsPlayerInRangeOfPoint(p,10.0,x,y,z)) return SendClientMessage(p,-1,"Acercate al punto o elige Colocar aqui."),1;
 new q[360];mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_house_points (HouseID,Kind,Interior,X,Y,Z) VALUES (%d,%d,%d,%f,%f,%f) ON DUPLICATE KEY UPDATE Interior=VALUES(Interior),X=VALUES(X),Y=VALUES(Y),Z=VALUES(Z)",h,k,PropInfo[h][pInterior],x,y,z);
 if(!RP_BizSQL(q)) return SendClientMessage(p,-1,"No se pudo guardar la posicion. Intentalo de nuevo."),1;
 HP_Apply(h,k,x,y,z);Streamer_Update(p,STREAMER_TYPE_3D_TEXT_LABEL);SendClientMessage(p,-1,"Texto y punto de uso movidos y guardados.");HP_EditShow(p);return 1;
}
stock HP_Reset(h) {if(!HP_Ready) return 0;new q[100];mysql_format(handle_db,q,sizeof q,"DELETE FROM rp_house_points WHERE HouseID=%d",h);return RP_BizSQL(q);}
CMD:textoscasa(playerid,params[]) {
 #pragma unused params
 return HP_Show(playerid);
}