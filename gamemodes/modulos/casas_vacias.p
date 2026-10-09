// Preserve original interiors; remove separate furniture only.
#include "modulos/casas_muebles_nativos.p"
new bool:HV_Ready;
new bool:HV_Removed[MAX_PLAYERS][sizeof HV_Native];
stock HV_Init() {
 HV_Ready=false;
 if(!RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_empty_house_backup LIKE propiedades")) return 0;
 if(!RP_BizSQL("START TRANSACTION")) return 0;
 new bool:ok=bool:RP_BizSQL("UPDATE server_muebles m JOIN propiedades p ON p.ID=m.CasaID SET m.Puesto=0 WHERE p.Tipo=1 AND ABS(p.PosXS-2000)<0.1 AND ABS(p.PosYS-1997.6)<0.1 AND ABS(p.PosZS-1501.1)<0.1");
 if(ok) ok=bool:RP_BizSQL("UPDATE propiedades p JOIN rp_empty_house_backup b ON b.ID=p.ID AND b.Interior=p.Interior SET p.PosXS=b.PosXS,p.PosYS=b.PosYS,p.PosZS=b.PosZS,p.PosAS=b.PosAS,p.InteriorID=b.InteriorID WHERE p.Tipo=1 AND ABS(p.PosXS-2000)<0.1 AND ABS(p.PosYS-1997.6)<0.1 AND ABS(p.PosZS-1501.1)<0.1");
 if(ok) ok=bool:RP_BizSQL("COMMIT");if(!ok) {RP_BizSQL("ROLLBACK");return 0;}
 HV_Ready=true;print("[CASAS] Interiores originales conservados; limpieza de muebles separables activa.");return 1;
}
stock HV_IsHouse(h) {return HV_Ready && h>0 && h<MAX_PROPIEDADES && PropInfo[h][pEnUso] && PropInfo[h][pTipo]==1;}
stock HV_Clear(h) {
 #pragma unused h
 return 1;
}
stock HV_StoragePositions(h) {
 #pragma unused h
 return 0;
}
stock HV_Decoration(model) {
 if(model>=1700 && model<=1809) return 1;
 for(new i=1;i<sizeof ObjetosInterior;i++) if(ObjetosInterior[i][0]==model && model<10000 && model!=1502 && model!=1649) return 1;
 return 0;
}
stock HV_Build(h) {
 if(!HV_IsHouse(h)) return 0;
 if(floatabs(PropInfo[h][pPosXS]-2000.0)<0.1 && floatabs(PropInfo[h][pPosYS]-1997.6)<0.1 && floatabs(PropInfo[h][pPosZS]-1501.1)<0.1) DarInteriorCasa(h,PropInfo[h][pInterior]);
 new objects[1000],count=Streamer_GetNearbyItems(PropInfo[h][pPosXS],PropInfo[h][pPosYS],PropInfo[h][pPosZS],STREAMER_TYPE_OBJECT,objects,sizeof objects,40.0);
 for(new n;n<count;n++) if(Streamer_IsInArrayData(STREAMER_TYPE_OBJECT,objects[n],E_STREAMER_WORLD_ID,-1) && HV_Decoration(Streamer_GetIntData(STREAMER_TYPE_OBJECT,objects[n],E_STREAMER_MODEL_ID))) DestroyDynamicObject(objects[n]);
 return 1;
}
stock HV_RemoveForPlayer(p,interior,Float:x,Float:y,Float:z,world) {
 if(!HV_Ready || IsPlayerNPC(p) || world==0) return 0;
 new bool:house=false;
 for(new h=1;h<MAX_PROPIEDADES;h++) if(HV_IsHouse(h) && PropInfo[h][pVW]==world && PropInfo[h][pInteriorID]==interior) {house=true;break;}
 if(!house) return 0;
 for(new n;n<sizeof HV_Native;n++) {
  if(HV_Removed[p][n] || HV_Native[n][hvInterior]!=interior) continue;
  if(VectorSize(HV_Native[n][hvX]-x,HV_Native[n][hvY]-y,HV_Native[n][hvZ]-z)>40.0) continue;
  RemoveBuildingForPlayer(p,HV_Native[n][hvModel],HV_Native[n][hvX],HV_Native[n][hvY],HV_Native[n][hvZ],0.1);HV_Removed[p][n]=true;
 }
 return 1;
}
stock HV_ResetPlayer(p) {for(new n;n<sizeof HV_Native;n++) HV_Removed[p][n]=false;return 1;}
