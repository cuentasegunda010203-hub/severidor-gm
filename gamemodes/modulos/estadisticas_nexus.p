#include <YSI_Coding\y_hooks>
#define RP_ST_MAX (100)
#define RP_ST_RED 0xDB3543FF
#define RP_ST_SCALE (0.80)
new PlayerText:RP_STTD[MAX_PLAYERS][RP_ST_MAX];
new RP_STCount[MAX_PLAYERS],RP_STToken[MAX_PLAYERS],RP_STConnected[MAX_PLAYERS];
new RP_STClose[MAX_PLAYERS],RP_STInventory[MAX_PLAYERS],RP_STSkills[MAX_PLAYERS],RP_STRegistro[MAX_PLAYERS];
new bool:RP_STVisible[MAX_PLAYERS];
new RP_STX[MAX_PLAYERS];

stock RP_StatsHide(p,bool:cancelSelection=true) {
 new bool:was=RP_STVisible[p];RP_STVisible[p]=false;RP_STToken[p]++;
 if(was && cancelSelection) CancelSelectTextDraw(p);
 for(new i;i<RP_STCount[p];i++) if(RP_STTD[p][i]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(p,RP_STTD[p][i]);
 RP_STCount[p]=0;return 1;
}
stock RP_STText(p,Float:x,Float:y,const text[],Float:w=0.135,Float:h=0.75,color=-1,align=1) {
 if(RP_STCount[p]>=RP_ST_MAX) return -1;
 new index=RP_STCount[p]++;
 RP_STTD[p][index]=CreatePlayerTextDraw(p,320.0+(x-320.0)*RP_ST_SCALE,227.5+(y-227.5)*RP_ST_SCALE,text);
 if(RP_STTD[p][index]==PlayerText:INVALID_TEXT_DRAW) return -1;
 PlayerTextDrawFont(p,RP_STTD[p][index],1);PlayerTextDrawLetterSize(p,RP_STTD[p][index],w*RP_ST_SCALE,h*RP_ST_SCALE);
 PlayerTextDrawColor(p,RP_STTD[p][index],color);PlayerTextDrawAlignment(p,RP_STTD[p][index],align);
 PlayerTextDrawSetProportional(p,RP_STTD[p][index],true);PlayerTextDrawSetOutline(p,RP_STTD[p][index],0);
 PlayerTextDrawSetShadow(p,RP_STTD[p][index],0);PlayerTextDrawSetSelectable(p,RP_STTD[p][index],false);
 return index;
}
stock RP_STRect(p,Float:x,Float:y,Float:w,Float:h,color) {
 new index=RP_STText(p,x,y,"LD_SPAC:white");if(index<0) return index;
 PlayerTextDrawFont(p,RP_STTD[p][index],4);PlayerTextDrawTextSize(p,RP_STTD[p][index],w*RP_ST_SCALE,h*RP_ST_SCALE);
 PlayerTextDrawColor(p,RP_STTD[p][index],color);return index;
}
stock RP_STRow(p,column,row,const label[],const value[],color=-1) {
 new Float:left=column==0?170.0:330.0,Float:right=column==0?310.0:469.0;
 new Float:y=column==0?176.0+float(row)*10.5:136.0+float(row)*10.5;
 RP_STText(p,left,y,label,0.13,0.75,0xB3BFCCFF);
 return RP_STText(p,right,y,value,0.13,0.75,color,3);
}
stock RP_STButton(p,Float:x,Float:y,Float:w,const text[],color) {
 RP_STRect(p,x,y,w,14.0,color);
 new index=RP_STText(p,x+w/2.0,y+3.0,text,0.12,0.75,-1,2);
 if(index>=0) {
  PlayerTextDrawTextSize(p,RP_STTD[p][index],14.0*RP_ST_SCALE,w*RP_ST_SCALE);
  PlayerTextDrawSetSelectable(p,RP_STTD[p][index],true);
 }
 return index;
}
forward RP_StatsRegistered(p,token,accountid);
public RP_StatsRegistered(p,token,accountid) {
 if(!IsPlayerConnected(p) || !RP_STVisible[p] || RP_STToken[p]!=token || PLAYER_INFO[p][pID]!=accountid) return 1;
 if(cache_num_rows() && RP_STRegistro[p]>=0) {
  new date[32];cache_get_value_name(0,"Registro",date,sizeof date);
  if(!date[0]) date="Sin datos";
  PlayerTextDrawSetString(p,RP_STTD[p][RP_STRegistro[p]],date);
 }
 return 1;
}
stock RP_StatsShow(p) {
 if(!IsPlayerConnected(p) || IsPlayerNPC(p) || JugadorLogeado[p]!=1) return 0;
 #if defined RP_LoadingVisible
 if(RP_LoadingVisible[p]) return 1;
 #endif
 #if defined RP_InvVisible
 if(RP_InvVisible[p]) {RP_InvDestroy(p);SelecTextDraw[p]=TD_NONE;}
 #endif
 RP_StatsHide(p,false);RP_STVisible[p]=true;
 new text[96],name[25],email[24],zone[MAX_ZONE_NAME];
 format(name,sizeof name,"%s",PLAYER_INFO[p][Nickname]);
 for(new i;name[i];i++) if(name[i]=='_') name[i]=' ';
 RP_STRect(p,163.0,85.0,314.0,285.0,0x080B0EF7);
 RP_STRect(p,163.0,85.0,314.0,1.0,RP_ST_RED);
 RP_STRect(p,163.0,106.0,314.0,0.4,0x2A3038FF);
 RP_STRect(p,320.0,114.0,0.4,226.0,0x2B343EFF);
 RP_STText(p,170.0,90.0,"NEX~r~US",0.23,1.1);
 RP_STText(p,216.0,92.0,"ESTADISTICAS DEL PERSONAJE",0.13,0.8,0xC2C9D2FF);
 RP_STX[p]=RP_STButton(p,455.0,88.0,15.0,"X",0x27323EFF);
 new avatar=RP_STText(p,171.0,116.0," ");
 if(avatar>=0) {
  PlayerTextDrawFont(p,RP_STTD[p][avatar],5);PlayerTextDrawTextSize(p,RP_STTD[p][avatar],28.0*RP_ST_SCALE,46.0*RP_ST_SCALE);
  PlayerTextDrawSetPreviewModel(p,RP_STTD[p][avatar],GetPlayerSkin(p));
  PlayerTextDrawSetPreviewRot(p,RP_STTD[p][avatar],0.0,0.0,0.0,1.0);
  PlayerTextDrawBackgroundColor(p,RP_STTD[p][avatar],0x18202AFF);
 }
 RP_STText(p,207.0,119.0,name,0.22,1.15);
 new required,cost;ObtenerReputacionCostoNivel(PLAYER_INFO[p][@Nivel]+1,required,cost);
 format(text,sizeof text,"NIVEL %d",PLAYER_INFO[p][@Nivel]);RP_STText(p,207.0,137.0,text,0.13,0.75);
 format(text,sizeof text,"%d / %d EXP",PLAYER_INFO[p][jExperiencia],required);RP_STText(p,310.0,137.0,text,0.12,0.75,RP_ST_RED,3);
 RP_STRect(p,207.0,149.0,103.0,2.0,0x242B34FF);
 new Float:progress=required>0?float(PLAYER_INFO[p][jExperiencia])/float(required):0.0;
 if(progress<0.0) progress=0.0;if(progress>1.0) progress=1.0;
 if(progress>0.0) RP_STRect(p,207.0,149.0,103.0*progress,2.0,RP_ST_RED);
 RP_STText(p,207.0,156.0,"NEXUS ROLEPLAY",0.11,0.6,0x82909EFF);
 format(text,sizeof text,"%d",PLAYER_INFO[p][pID]);RP_STRow(p,0,0,"Cuenta ID",text);
 format(text,sizeof text,"%d",p);RP_STRow(p,0,1,"ID en el servidor",text);
 RP_STRow(p,0,2,"Dispositivo",IsPlayerMobile(p)?"Android":"PC");
 if(PLAYER_INFO[p][pEmail][0]) {strmid(email,PLAYER_INFO[p][pEmail],0,6,sizeof email);format(text,sizeof text,"%s...",email);} else text="Sin correo";
 RP_STRow(p,0,3,"Correo",text);
 RP_STRow(p,0,4,"Correo verificado",PLAYER_INFO[p][EstadoCorreo]?"Verificado":"No verificado",RP_ST_RED);
 format(text,sizeof text,"%d horas",PLAYER_INFO[p][horasjugadas]);RP_STRow(p,0,5,"Horas jugadas",text);
 format(text,sizeof text,"%d minutos",(GetTickCount()-RP_STConnected[p])/60000);RP_STRow(p,0,6,"Conexion actual",text);
 RP_STRow(p,0,7,"Ultima conexion",PLAYER_INFO[p][jConexion]);
 format(text,sizeof text,"$ %d",GetPlayerMoney(p));RP_STRow(p,0,8,"Dinero",text,RP_ST_RED);
 format(text,sizeof text,"$ %d",PLAYER_INFO[p][pBanco]);RP_STRow(p,0,9,"Banco",text,RP_ST_RED);
 format(text,sizeof text,"%d",PLAYER_INFO[p][Totems]);RP_STRow(p,0,10,"Coins",text,RP_ST_RED);
 if(PLAYER_INFO[p][pVip]>0) format(text,sizeof text,"VIP %d",PLAYER_INFO[p][pVip]);else text="Ninguno";
 RP_STRow(p,0,11,"VIP",text);
 new faction=PLAYER_INFO[p][pFaccion];
 if(faction>0) format(text,sizeof text,"%.24s",BandasInfo[faction][BNombre]);else text="Civil";
 RP_STRow(p,0,12,"Faccion",text);
 if(faction>0) format(text,sizeof text,"%.24s",RangoBanda(faction,PLAYER_INFO[p][pRango]));else text="Sin rango";
 RP_STRow(p,0,13,"Rango",text);
 format(text,sizeof text,"%d",PLAYER_INFO[p][Moneda]);RP_STRow(p,0,14,"GZ",text,RP_ST_RED);
 format(text,sizeof text,"%d",RP_NexusTotems[p]);RP_STRow(p,0,15,"Totems",text,RP_ST_RED);
 RP_STText(p,330.0,119.0,"ESTADISTICAS DEL PERSONAJE",0.13,0.8);
 format(text,sizeof text,"%d anos",PLAYER_INFO[p][jEdad]);RP_STRow(p,1,0,"Edad",text);
 RP_STRow(p,1,1,"Sexo",PLAYER_INFO[p][jSexo]==2?"Femenino":"Masculino");
 GetPlayer2DZone(p,zone,sizeof zone);RP_STRow(p,1,2,"Zona actual",zone);
 RP_STRow(p,1,3,"Pais de registro",PLAYER_INFO[p][pPaisRegistro]);
 if(PLAYER_INFO[p][pNumero]>0) format(text,sizeof text,"%d",PLAYER_INFO[p][pNumero]);else text="No posee";
 RP_STRow(p,1,4,"Telefono",text);
 RP_STRow(p,1,5,"Licencia de conducir",PLAYER_INFO[p][pLicencia] && PLAYER_INFO[p][finlicencia]>gettime()?"Vigente":"No vigente",RP_ST_RED);
 format(text,sizeof text,"%d",GetPlayerSkin(p));RP_STRow(p,1,6,"Ropa / Skin",text);
 format(text,sizeof text,"%d",PLAYER_INFO[p][pCargos]);RP_STRow(p,1,7,"Cargos policiales",text);
 format(text,sizeof text,"%d",PLAYER_INFO[p][arrestado]);RP_STRow(p,1,8,"Arrestos",text);
 format(text,sizeof text,"%d",PLAYER_INFO[p][sancionado]);RP_STRow(p,1,9,"Sanciones",text);
 new prison=PLAYER_INFO[p][pTiempoCarcel]+PLAYER_INFO[p][pTiempoJail];
 if(prison>0) format(text,sizeof text,"%d min %d seg",prison/60,prison%60);else text="Ninguno";
 RP_STRow(p,1,10,"Tiempo en prision",text);
 RP_STRegistro[p]=RP_STRow(p,1,11,"Fecha de registro","Cargando...");
 RP_STText(p,330.0,274.0,"TRABAJO Y ESTADO",0.13,0.8,RP_ST_RED);
 RP_STRow(p,1,15,"Trabajo principal",PLAYER_INFO[p][pTrabajo]>0?NombreTrabajo(PLAYER_INFO[p][pTrabajo]):"Sin trabajo");
 RP_STRow(p,1,16,"Trabajo secundario",PLAYER_INFO[p][pTrabajo2]>0?NombreTrabajo(PLAYER_INFO[p][pTrabajo2]):"Sin trabajo");
 new territories;if(faction>0) for(new t;t<MAX_T;t++) if(TerritorioInfo[t][Territorio_Valido] && TerritorioInfo[t][Territorio_BandaID]==faction) territories++;
 format(text,sizeof text,"%d",territories);RP_STRow(p,1,17,"Territorios",text);
 new Float:health,Float:armour;GetPlayerHealth(p,health);GetPlayerArmour(p,armour);
 format(text,sizeof text,"%d / %d",floatround(health),floatround(armour));RP_STRow(p,1,18,"Vida / Chaleco",text);
 format(text,sizeof text,"%d / %d",PLAYER_INFO[p][pHambre],PLAYER_INFO[p][pSed]);RP_STRow(p,1,19,"Hambre / Sed",text);
 RP_STRect(p,163.0,349.0,314.0,0.4,0x29323BFF);
 RP_STInventory[p]=RP_STButton(p,170.0,354.0,43.0,"INVENTARIO",RP_ST_RED);
 RP_STSkills[p]=RP_STButton(p,217.0,354.0,43.0,"HABILIDADES",0x27323EFF);
 RP_STClose[p]=RP_STButton(p,428.0,354.0,42.0,"CERRAR",RP_ST_RED);
 for(new i;i<RP_STCount[p];i++) {
  if(RP_STTD[p][i]==PlayerText:INVALID_TEXT_DRAW) {RP_StatsHide(p);return SendClientMessage(p,-1,"No se pudo abrir /est. Cierra otras ventanas y vuelve a intentarlo.");}
  PlayerTextDrawShow(p,RP_STTD[p][i]);
 }
 SelectTextDraw(p,0xFF8899FF);
 new query[96];mysql_format(handle_db,query,sizeof query,"SELECT Registro FROM usuarios WHERE ID=%d LIMIT 1",PLAYER_INFO[p][pID]);
 mysql_tquery(handle_db,query,"RP_StatsRegistered","iii",p,RP_STToken[p],PLAYER_INFO[p][pID]);
 return 1;
}
stock RP_StatsClick(p,PlayerText:td) {
 if(!RP_STVisible[p]) return 0;
 if((RP_STX[p]>=0 && td==RP_STTD[p][RP_STX[p]]) || (RP_STClose[p]>=0 && td==RP_STTD[p][RP_STClose[p]])) {RP_StatsHide(p);return 1;}
 if(RP_STInventory[p]>=0 && td==RP_STTD[p][RP_STInventory[p]]) {RP_StatsHide(p,false);SelecTextDraw[p]=TD_NONE;Menu_AbrirInventario(p);return 1;}
 if(RP_STSkills[p]>=0 && td==RP_STTD[p][RP_STSkills[p]]) {RP_StatsHide(p);return callcmd::habilidades(p,"");}
 return 1;
}
stock RP_StatsCancel(p) {if(!RP_STVisible[p]) return 0;RP_StatsHide(p);return 1;}
hook OnPlayerConnect(playerid) {RP_STCount[playerid]=0;RP_STVisible[playerid]=false;RP_STToken[playerid]++;RP_STConnected[playerid]=GetTickCount();return 1;}
hook OnPlayerDisconnect(playerid,reason) {RP_StatsHide(playerid);return 1;}
hook OnPlayerDeath(playerid,killerid,reason) {RP_StatsHide(playerid);return 1;}
hook OnGameModeInit() {print("[Nexus] /est: panel clasico rojo compacto (80%) con X de cierre.");return 1;}
