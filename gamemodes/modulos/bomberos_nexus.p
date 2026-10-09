// SAFD station signs and validated fire interactions for PC / Android.
#include <YSI_Coding\y_hooks>
#define RP_SAFD_MENU (31130)
#define RP_SAFD_CARS (31131)
#define RP_SAFD_UNIFORM (31132)
new Text3D:RP_SAFDSigns[6];
new RP_SAFDCarRows[MAX_PLAYERS][9],RP_SAFDCarCount[MAX_PLAYERS];
new bool:RP_SAFDSpray[MAX_PLAYERS];
new RP_SAFDFireVersion[MAX_INCENDIOS],RP_SAFDListVersion[MAX_PLAYERS][MAX_INCENDIOS],RP_SAFDListCount[MAX_PLAYERS];

stock RP_SAFDReady(p) {
 return IsPlayerConnected(p) && !IsPlayerNPC(p) && JugadorLogeado[p]==1 && IsABombero(p) && PLAYER_INFO[p][suspendido]==0 && PLAYER_INFO[p][pDuty]>0 && GetPlayerState(p)!=PLAYER_STATE_WASTED && PLAYER_TEMP[p][VariableCaido]!=1;
}
stock RP_SAFDUniformPoint(p) {
 return GetPlayerVirtualWorld(p)==0 && GetPlayerInterior(p)==4 && IsPlayerInRangeOfPoint(p,3.0,1425.9586,-1632.2804,974.9464);
}
stock RP_SAFDCanEquip(p) {
 if(!RP_SAFDReady(p) || EnCombate[p]) return 0;
 if(RP_SAFDUniformPoint(p)) return 1;
 new v=GetPlayerVehicleID(p);
 return v>0 && IsValidVehicle(v) && Bomberos(v) && (GetVehicleModel(v)==407 || GetVehicleModel(v)==416 || GetVehicleModel(v)==544);
}
stock RP_SAFDGaragePoint(p) {
 return GetPlayerVirtualWorld(p)==0 && GetPlayerInterior(p)==0 && IsPlayerInRangeOfPoint(p,80.0,2070.0,-2088.0,13.55);
}
stock RP_SAFDFreeVehicle(v) {
 if(v<=0 || v>=MAX_VEHICLES || !IsValidVehicle(v)) return 0;
 return Bomberos(v) || Veh_Data[v][vFaccion]==3 || VehiculosInfo[v][vfaccion]==3;
}
stock RP_SAFDCanTakeVehicle(p) {
 return IsPlayerConnected(p) && !IsPlayerNPC(p) && JugadorLogeado[p]==1 && GetPlayerState(p)==PLAYER_STATE_ONFOOT && PLAYER_TEMP[p][VariableCaido]!=1;
}
stock RP_SAFDTruck(p) {
 if(!RP_SAFDReady(p) || GetPlayerState(p)!=PLAYER_STATE_DRIVER || PLAYER_INFO[p][pRango]<3) return 0;
 new v=GetPlayerVehicleID(p);
 return v>0 && IsValidVehicle(v) && Bomberos(v) && (GetVehicleModel(v)==407 || GetVehicleModel(v)==544);
}
stock RP_SAFDUniform(p) {
 if(!IsABombero(p) || PLAYER_INFO[p][suspendido]!=0 || !RP_SAFDUniformPoint(p) || GetPlayerState(p)!=PLAYER_STATE_ONFOOT || EnCombate[p] || PLAYER_TEMP[p][VariableCaido]==1) return SendClientMessage(p,-1,"Ve al vestuario de Bomberos a pie para cambiar tu uniforme.");
 if(PLAYER_INFO[p][pDuty]>0) return callcmd::uniforme(p,"bombero");
 return dialogs_ShowPlayerDialog(p,RP_SAFD_UNIFORM,DIALOG_STYLE_LIST,"Nexus | Uniformes",PLAYER_INFO[p][jSexo]==2?("Uniforme femenino"):("Uniforme 277\nUniforme 278\nUniforme 279"),"Vestir","Cerrar");
}
stock RP_SAFDOpenEquipment(p) {
 if(!RP_SAFDCanEquip(p)) return SendClientMessage(p,-1,"Necesitas uniforme de Bomberos. Ve al vestuario o entra en un vehiculo de emergencias de la base.");
 return dialogs_ShowPlayerDialog(p,KITBOMBERO,DIALOG_STYLE_LIST,"Nexus | Equipo de Bomberos","Chaleco\nVendas\nBotiquin\nExtintor","Tomar","Cerrar");
}
stock RP_SAFDOpenCars(p) {
 if(!RP_SAFDCanTakeVehicle(p) || !RP_SAFDGaragePoint(p)) return SendClientMessage(p,-1,"Ve a pie a la base de Bomberos para elegir un vehiculo.");
 new text[800],line[90];RP_SAFDCarCount[p]=0;
 for(new k;k<sizeof(VBOMB);k++) {
  new v=VBOMB[k];if(v<=0 || !IsValidVehicle(v)) continue;
  new Float:x,Float:y,Float:z;GetVehiclePos(v,x,y,z);
  if(GetVehicleVirtualWorld(v)!=0 || GetVehicleInterior(v)!=0 || floatsqroot((x-2070.0)*(x-2070.0)+(y+2088.0)*(y+2088.0)+(z-13.55)*(z-13.55))>100.0) continue;
  RP_SAFDCarRows[p][RP_SAFDCarCount[p]++]=v;
  format(line,sizeof line,"%s [ID %d]%s\n",NombreAuto[GetVehicleModel(v)-400],v,IsVehicleOccupied(v)?(" - Ocupado"):(""));strcat(text,line,sizeof text);
 }
 if(!RP_SAFDCarCount[p]) return SendClientMessage(p,-1,"Los vehiculos estan fuera de la base o no hay ninguno disponible.");
 return dialogs_ShowPlayerDialog(p,RP_SAFD_CARS,DIALOG_STYLE_LIST,"Nexus | Vehiculos de Bomberos",text,"Utilizar","Cerrar");
}
stock RP_SAFDGate(p) {
 if(!RP_SAFDReady(p) || GetPlayerVirtualWorld(p)!=0 || GetPlayerInterior(p)!=0 || !IsPlayerInRangeOfPoint(p,15.0,2066.2815,-2099.2964,15.3126)) return SendClientMessage(p,-1,"Acercate al porton de la base con el uniforme de Bomberos.");
 MoveDynamicObject(ptbomb,2082.899658,-2099.296386,15.312640,2.0);
 MoveDynamicObject(ptbomb2,2082.899658,-2099.296386,15.312640,2.0);
 SetTimer("CerrarPortonBomberos",7000,false);return 1;
}
CMD:bomberos(playerid,params[]) {
 if(JugadorLogeado[playerid]!=1) return 1;
 if(!IsABombero(playerid)) return SendClientMessage(playerid,-1,"No perteneces a la faccion de Bomberos.");
 if(!params[0]) return dialogs_ShowPlayerDialog(playerid,RP_SAFD_MENU,DIALOG_STYLE_LIST,"Nexus | Bomberos","Uniforme\nEquipamiento\nIncendios activos","Elegir","Cerrar");
 if(!strcmp(params,"uniforme",true)) return RP_SAFDUniform(playerid);
 if(!strcmp(params,"equipo",true)) return RP_SAFDOpenEquipment(playerid);
 if(!strcmp(params,"vehiculos",true)) return RP_SAFDOpenCars(playerid);
 if(!strcmp(params,"porton",true)) return RP_SAFDGate(playerid);
 if(!strcmp(params,"incendios",true)) return LIncendios(playerid);
 if(!strcmp(params,"extinguir",true)) {
  if(RP_SAFDSpray[playerid]) {RP_SAFDSpray[playerid]=false;return SendClientMessage(playerid,-1,"Extincion detenida.");}
  new bool:truck=bool:RP_SAFDTruck(playerid);
  if(!RP_SAFDReady(playerid) || (!truck && (GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT || GetPlayerWeapon(playerid)!=42)) || RP_SAFDNearFire(playerid,truck?15.0:6.0)<0) return SendClientMessage(playerid,-1,"Acercate con uniforme y extintor, o conduce un camion de Bomberos con rango 3.");
  RP_SAFDSpray[playerid]=true;return SendClientMessage(playerid,-1,"Extincion iniciada. Mantente cerca del fuego. /bomberos extinguir para detener.");
 }
 return SendClientMessage(playerid,-1,"Usa /bomberos [uniforme / equipo / vehiculos / porton / incendios / extinguir]");
}
stock RP_SAFDPoint(f,Float:pos[3]) {
 if(f<0 || f>=MAX_INCENDIOS || Incendios[f][pIDI]<=0) return 0;
 new id=Incendios[f][pIDI];
 if(Incendios[f][pType]==0) {
  if(id>=MAX_PROPIEDADES || !PropInfo[id][pTipo]) return 0;
  pos[0]=PropInfo[id][pPosX];pos[1]=PropInfo[id][pPosY];pos[2]=PropInfo[id][pPosZ];
 }else {
  if(id>=MAX_GARAGES || !Estacionamientos[id][eEnUso]) return 0;
  pos[0]=Estacionamientos[id][PosX];pos[1]=Estacionamientos[id][PosY];pos[2]=Estacionamientos[id][PosZ];
 }return 1;
}
stock RP_SAFDNearFire(p,Float:range) {
 if(GetPlayerVirtualWorld(p)!=0 || GetPlayerInterior(p)!=0) return -1;
 for(new f;f<MAX_INCENDIOS;f++) {new Float:pos[3];if(RP_SAFDPoint(f,pos) && IsPlayerInRangeOfPoint(p,range,pos[0],pos[1],pos[2])) return f;}
 return -1;
}
stock RP_SAFDComplete(p,f,bool:truck=false) {
 if(!RP_SAFDReady(p) || f<0 || f>=MAX_INCENDIOS || Incendios[f][pIDI]<=0 || Incendios[f][pIntensidad]>0) return 0;
 if(!DestroyFire(f)) return 0;
 RP_SAFDSpray[p]=false;
 new reward=truck?3000:3500;DarDinero(p,reward);
 new bonus;if(PLAYER_TIMES[p][FarmearLZ]==0) {PLAYER_INFO[p][Totems]+=3;bonus=3;PLAYER_TIMES[p][FarmearLZ]=1800;}
 new msg[192],zone[MAX_ZONE_NAME];GetPlayer3DZone(p,zone,sizeof zone);
 format(msg,sizeof msg,"Incendio apagado. Recibiste $%d%s",reward,bonus?(" + 3 Coins."):("."));SendClientMessage(p,-1,msg);
 format(msg,sizeof msg,"[CENTRAL SAFD] %s apago el incendio en %s.",PLAYER_INFO[p][Nickname],zone);_MensajeRfac(3,COLOR_BOMBERO,msg);
 NX_Job(p,99);
 GuardarCuenta(p);return 1;
}
stock RP_SAFDTick(p) {
 if(!RP_SAFDReady(p)) {RP_SAFDSpray[p]=false;return 0;}
 new keys,ud,lr;GetPlayerKeys(p,keys,ud,lr);
 new bool:truck=false,f=-1;
 if(GetPlayerState(p)==PLAYER_STATE_ONFOOT && GetPlayerWeapon(p)==42 && (RP_SAFDSpray[p] || (keys & KEY_FIRE))) f=RP_SAFDNearFire(p,6.0);
 else if(RP_SAFDTruck(p) && (RP_SAFDSpray[p] || (keys & KEY_FIRE))) {
  f=RP_SAFDNearFire(p,15.0);truck=true;
 }
 if(f<0) {RP_SAFDSpray[p]=false;return 0;}
 if(Incendios[f][pIntensidad]>0) Incendios[f][pIntensidad]--;
 if(Incendios[f][pIntensidad]<=0) return RP_SAFDComplete(p,f,truck);
 new msg[96];format(msg,sizeof msg,"{FF4000}Incendio\n{FFC100}Intensidad: {FFFFFF}%d%%\n{FFFFFF}/bomberos extinguir",Incendios[f][pIntensidad]);
 UpdateDynamic3DTextLabelText(Incendios[f][pInfoIncendio],-1,msg);return 1;
}
stock RP_SAFDFireMenu(p,bool:admin=false) {
 if(admin && PLAYER_INFO[p][pAdmin]<3) return 0;
 if(!admin && !IsABombero(p)) return 0;
 new text[4096],line[90];RP_SAFDListCount[p]=0;
 for(new f;f<MAX_INCENDIOS;f++) if(Incendios[f][pIDI]>0) {
  new row=RP_SAFDListCount[p]++;PLAYER_TEMP[p][ListaIncendios1][row]=f;RP_SAFDListVersion[p][row]=RP_SAFDFireVersion[f];
  format(line,sizeof line,"Incendio %d - %s %d - Intensidad %d%%\n",f,Incendios[f][pType]==0?("Propiedad"):("Estacionamiento"),Incendios[f][pIDI],Incendios[f][pIntensidad]);strcat(text,line,sizeof text);
 }
 if(!RP_SAFDListCount[p]) return SendClientMessage(p,-1,"No hay incendios activos.");
 return Dialog(p,admin?D_Ilista:D_Ibuscar,DIALOG_STYLE_LIST,"Nexus | Incendios",text,admin?("Eliminar"):("Acudir"),"Cerrar");
}
stock RP_SAFDFireSelection(p,row,bool:admin=false) {
 if(row<0 || row>=RP_SAFDListCount[p]) return 1;
 if((admin && PLAYER_INFO[p][pAdmin]<3) || (!admin && !IsABombero(p))) return 1;
 new f=PLAYER_TEMP[p][ListaIncendios1][row],Float:pos[3];
 if(!RP_SAFDPoint(f,pos) || RP_SAFDListVersion[p][row]!=RP_SAFDFireVersion[f]) return SendClientMessage(p,-1,"El incendio ya fue atendido. Vuelve a abrir la lista.");
 if(admin) {DestroyFire(f);return SendClientMessage(p,-1,"Incendio eliminado.");}
 PLAYER_TEMP[p][CpIncendio]=1;StartPlayerPath(p,pos[0],pos[1],pos[2],2.0);
 new zone[MAX_ZONE_NAME],msg[160];Get2DZone(zone,sizeof zone,pos[0],pos[1],pos[2]);
 format(msg,sizeof msg,"[CENTRAL SAFD] %s acude al incendio en %s.",PLAYER_INFO[p][Nickname],zone);_MensajeRfac(3,COLOR_BOMBERO,msg);
 return SendClientMessage(p,-1,"Incendio marcado en el mapa. Usa el extintor o /bomberos extinguir.");
}
stock RP_SAFDNewFire(f) {RP_SAFDFireVersion[f]++;return 1;}
stock RP_SAFDRandomFire() {
 if(FuegoSiguiente()<0) return 0;
 new chosen=-1,tipo=random(2),count;
 for(new pass;pass<2;pass++) {
  count=0;chosen=-1;
  new limit=tipo==0?MAX_PROPIEDADES:MAX_GARAGES;
  for(new id=1;id<limit;id++) {
   if(tipo==0 && (!PropInfo[id][pTipo] || PropInfo[id][pIDPropietario]<=0)) continue;
   if(tipo==1 && (!Estacionamientos[id][eEnUso] || Estacionamientos[id][Dueno]<=0)) continue;
   new bool:exists=false;for(new f;f<MAX_INCENDIOS;f++) if(Incendios[f][pIDI]==id && Incendios[f][pType]==tipo) {exists=true;break;}
   if(exists) continue;count++;if(random(count)==0) chosen=id;
  }
  if(chosen>0) break;tipo=1-tipo;
 }
 if(chosen<0 || !CrearIncendioP(chosen,tipo)) return 0;
 new Float:pos[3],zone[MAX_ZONE_NAME],msg[192];
 for(new f;f<MAX_INCENDIOS;f++) if(Incendios[f][pIDI]==chosen && Incendios[f][pType]==tipo) {RP_SAFDPoint(f,pos);break;}
 Get2DZone(zone,sizeof zone,pos[0],pos[1],pos[2]);
 format(msg,sizeof msg,"[CENTRAL SAFD] Incendio en %s %d, %s. Consulta /bomberos incendios.",tipo==0?("propiedad"):("estacionamiento"),chosen,zone);_MensajeRfac(3,COLOR_BOMBERO,msg);return 1;
}
hook OnGameModeInit() {
 RP_SAFDSigns[0]=CreateDynamic3DTextLabel("{E52E44}BOMBEROS - OFICINA\n{FFFFFF}Pulsar [ F ] Para Entrar.",-1,2016.6925,-2094.7124,14.0,15.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,0);
 RP_SAFDSigns[1]=CreateDynamic3DTextLabel("{E52E44}SALIDA DE LA OFICINA\n{FFFFFF}/salir",-1,1438.2672,-1615.5339,975.35,12.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,4);
 RP_SAFDSigns[2]=CreateDynamic3DTextLabel("{E52E44}VESTUARIO Y EQUIPAMIENTO\n{FFFFFF}/uniforme bombero\n/bomberos equipo",-1,1425.9586,-1632.2804,975.35,12.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,4);
 RP_SAFDSigns[3]=CreateDynamic3DTextLabel("{E52E44}ACCESO A LA BASE\n{FFFFFF}Pulsar [ F ] Para Entrar.",-1,2042.1675,-2070.6011,19.15,12.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,0);
 RP_SAFDSigns[4]=CreateDynamic3DTextLabel("{E52E44}SALIDA A LA BASE\n{FFFFFF}Pulsar [ F ] Para Entrar.",-1,1420.8352,-1605.9150,975.35,12.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,4);
 RP_SAFDSigns[5]=CreateDynamic3DTextLabel("{E52E44}GARAJE DE BOMBEROS\n{FFFFFF}/bomberos vehiculos\n/bomberos porton",-1,2070.0,-2088.0,14.0,18.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,0);
 print("[Nexus SAFD] Oficina, vestuario, garaje e incendios inicializados.");return 1;
}
hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
 if(dialogid==RP_SAFD_UNIFORM) {
  if(!response || JugadorLogeado[playerid]!=1 || !IsABombero(playerid) || PLAYER_INFO[playerid][suspendido]!=0 || PLAYER_INFO[playerid][pDuty]!=0 || !RP_SAFDUniformPoint(playerid) || GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT || EnCombate[playerid] || PLAYER_TEMP[playerid][VariableCaido]==1) return 1;
  new female=PLAYER_INFO[playerid][jSexo]==2;
  if(listitem<0 || listitem> (female?0:2)) return 1;
  return OnPlayerModelSelection(playerid,1,female?bomberomujer:bomberohombre,female?193:277+listitem);
 }
 if(dialogid==RP_SAFD_MENU) {
  if(!response) return 1;
  switch(listitem) {case 0:callcmd::bomberos(playerid,"uniforme");case 1:RP_SAFDOpenEquipment(playerid);case 2:LIncendios(playerid);}return 1;
 }
 if(dialogid==RP_SAFD_CARS) {
  if(!response || !RP_SAFDCanTakeVehicle(playerid) || !RP_SAFDGaragePoint(playerid) || listitem<0 || listitem>=RP_SAFDCarCount[playerid]) return 1;
  new v=RP_SAFDCarRows[playerid][listitem],Float:x,Float:y,Float:z;
  if(v<=0 || !IsValidVehicle(v) || !Bomberos(v) || IsVehicleOccupied(v)) return SendClientMessage(playerid,-1,"Este vehiculo ya esta ocupado o no esta disponible.");
  GetVehiclePos(v,x,y,z);
  if(GetVehicleVirtualWorld(v)!=0 || GetVehicleInterior(v)!=0 || floatsqroot((x-2070.0)*(x-2070.0)+(y+2088.0)*(y+2088.0)+(z-13.55)*(z-13.55))>100.0) return SendClientMessage(playerid,-1,"El vehiculo ya salio de la base.");
  NoTeleportHack(playerid);PutPlayerInVehicle(playerid,v,0);return 1;
 }return 1;
}
hook OnPlayerConnect(playerid) {RP_SAFDSpray[playerid]=false;RP_SAFDCarCount[playerid]=0;RP_SAFDListCount[playerid]=0;return 1;}
hook OnPlayerDisconnect(playerid,reason) {RP_SAFDSpray[playerid]=false;return 1;}
hook OnPlayerDeath(playerid,killerid,reason) {RP_SAFDSpray[playerid]=false;return 1;}
hook OnGameModeExit() {for(new i;i<sizeof RP_SAFDSigns;i++) if(IsValidDynamic3DTextLabel(RP_SAFDSigns[i])) DestroyDynamic3DTextLabel(RP_SAFDSigns[i]);return 1;}
