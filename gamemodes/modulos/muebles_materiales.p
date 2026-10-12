// Persisted per-surface colors and textures, edited through native dialogs.
new bool:MC_MaterialsReady;
new MC_MaterialVersion[MAX_PROPIEDADES][MAX_OBJETOS_CASAS];
new const MC_Colors[]={0xFFFFFFFF,0xFF222222,0xFF888888,0xFFD9C7A5,0xFF785034,0xFFB63232,0xFF3274B6,0xFF367D46,0xFFE2C13C,0xFF965BA7,0xFFE59DBE,0xFF45BCBC};
enum MC_TEX {mtModel,mtTXD[32],mtName[32]};
new const MC_Textures[][MC_TEX]={
 {-1,"none","none"},
 {13007,"sw_bankint","woodfloor1"},
 {14577,"casinovault01","cof_wood1"},
 {18800,"mroadhelix1","concretemanky1"},
 {9220,"sfn_apart02sfn","concreteslab"},
 {18265,"w_town3cs_t","ws_redbrickold"},
 {2624,"cj_urb","cj_bricks"},
 {11090,"cf_metals_sfse","gen_chrome"}
};
stock MC_MaterialsInit() {
 MC_MaterialsReady=bool:RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_furniture_materials (MuebleID INT NOT NULL,Surface INT NOT NULL,Color INT NOT NULL DEFAULT 0,Texture INT NOT NULL DEFAULT 0,PRIMARY KEY(MuebleID,Surface)) ENGINE=InnoDB");
 if(MC_MaterialsReady) RP_BizSQL("DELETE r FROM rp_furniture_materials r LEFT JOIN server_muebles m ON m.ID=r.MuebleID WHERE m.ID IS NULL");
 return _:MC_MaterialsReady;
}
stock MC_DeleteMaterials(id) {
 if(!MC_MaterialsReady) return 1;
 new q[150];format(q,sizeof q,"DELETE FROM rp_furniture_materials WHERE MuebleID=%d",id);return RP_BizSQL(q);
}
stock MC_ReadMaterials(h,s) {
 if(!MC_MaterialsReady || h<0 || h>=MAX_PROPIEDADES || s<0 || s>=MAX_OBJETOS_CASAS || !PropInfo[h][Puesto][s] || !IsValidDynamicObject(PropInfo[h][Inmobiliario][s])) return 0;
 new q[180];format(q,sizeof q,"SELECT Surface,Color,Texture FROM rp_furniture_materials WHERE MuebleID=%d",PropInfo[h][MuebleID][s]);
 mysql_tquery(handle_db,q,"MC_MaterialLoaded","iiii",h,s,PropInfo[h][MuebleID][s],++MC_MaterialVersion[h][s]);return 1;
}
forward MC_MaterialLoaded(h,s,id,version);
public MC_MaterialLoaded(h,s,id,version) {
 if(h<0 || h>=MAX_PROPIEDADES || s<0 || s>=MAX_OBJETOS_CASAS || PropInfo[h][MuebleID][s]!=id || MC_MaterialVersion[h][s]!=version || !PropInfo[h][Puesto][s] || !IsValidDynamicObject(PropInfo[h][Inmobiliario][s])) return 1;
 for(new n;n<cache_num_rows();n++) {
  new surface,color,texture;cache_get_value_name_int(n,"Surface",surface);cache_get_value_name_int(n,"Color",color);cache_get_value_name_int(n,"Texture",texture);
  if(surface<0 || surface>15 || texture<0 || texture>=sizeof MC_Textures) continue;
  if(texture==0 && color==0) continue;
  SetDynamicObjectMaterial(PropInfo[h][Inmobiliario][s],surface,MC_Textures[texture][mtModel],MC_Textures[texture][mtTXD],MC_Textures[texture][mtName],color);
 }
 return 1;
}
stock MC_SaveMaterial(p,bool:texture,value) {
 if(!MC_MaterialsReady || !MC_Selected(p)) return 0;
 new surface=MC_Surface[p];if(surface<0 || surface>15 || (texture && (value<0 || value>=sizeof MC_Textures))) return 0;
 new q[320];
 if(texture) format(q,sizeof q,"INSERT INTO rp_furniture_materials (MuebleID,Surface,Texture) VALUES (%d,%d,%d) ON DUPLICATE KEY UPDATE Texture=VALUES(Texture)",MC_Record[p],surface,value);
 else format(q,sizeof q,"INSERT INTO rp_furniture_materials (MuebleID,Surface,Color) VALUES (%d,%d,%d) ON DUPLICATE KEY UPDATE Color=VALUES(Color)",MC_Record[p],surface,value);
 if(!RP_BizSQL(q)) return SendClientMessage(p,-1,"No se pudo guardar el material. Intenta nuevamente."),0;
 MC_RebuildMaterialObject(MC_HouseID[p],MC_Slot[p]);
 MC_ReadMaterials(MC_HouseID[p],MC_Slot[p]);SendClientMessage(p,-1,"Material guardado. Si no cambia la parte deseada, elige otra superficie (0 a 15).");return 1;
}
stock MC_RebuildMaterialObject(h,s) {
 if(IsValidDynamicObject(PropInfo[h][Inmobiliario][s])) DestroyDynamicObject(PropInfo[h][Inmobiliario][s]);
 PropInfo[h][Inmobiliario][s]=0;
 if(PropInfo[h][Puesto][s]) PropInfo[h][Inmobiliario][s]=CreateDynamicObject(PropInfo[h][ModeloMuebles][s],PropInfo[h][MuebleX1][s],PropInfo[h][MuebleY1][s],PropInfo[h][MuebleZ1][s],PropInfo[h][MuebleX2][s],PropInfo[h][MuebleY2][s],PropInfo[h][MuebleZ2][s],PropInfo[h][pVW],PropInfo[h][pInteriorID]);
 return 1;
}
stock MC_ResetMaterial(p) {
 if(!MC_MaterialsReady || !MC_Selected(p)) return 0;
 new q[160];format(q,sizeof q,"DELETE FROM rp_furniture_materials WHERE MuebleID=%d",MC_Record[p]);if(!RP_BizSQL(q)) return 0;
 new h=MC_HouseID[p],s=MC_Slot[p];MC_MaterialVersion[h][s]++;
 MC_RebuildMaterialObject(h,s);
 return SendClientMessage(p,-1,"Se restauro el aspecto original del mueble.");
}
stock MC_MaterialShow(p,dialog) {
 if(!MC_MaterialsReady || !MC_Selected(p)) return SendClientMessage(p,-1,"El editor de materiales no esta disponible.");
 if(dialog==MC_COLOR) return dialogs_ShowPlayerDialog(p,dialog,DIALOG_STYLE_LIST,"Mueble | Color","Blanco\nNegro\nGris\nBeige\nMarron\nRojo\nAzul\nVerde\nAmarillo\nMorado\nRosa\nTurquesa","Aplicar","Volver");
 if(dialog==MC_TEXTURE) return dialogs_ShowPlayerDialog(p,dialog,DIALOG_STYLE_LIST,"Mueble | Textura","Conservar textura / solo color\nMadera de piso\nMadera oscura\nCemento\nHormigon\nLadrillo rojo\nLadrillo claro\nMetal cromado","Aplicar","Volver");
 new text[500],line[25];for(new i;i<16;i++) {format(line,sizeof line,"Superficie %d\n",i);strcat(text,line);}
 return dialogs_ShowPlayerDialog(p,MC_SURFACE,DIALOG_STYLE_LIST,"Elegir parte del mueble",text,"Elegir","Volver");
}
stock MC_MaterialDialog(p,dialog,response,row) {
 if(!MC_Selected(p)) return 1;
 if(response) {
  if(dialog==MC_COLOR && row>=0 && row<sizeof MC_Colors) MC_SaveMaterial(p,false,MC_Colors[row]);
  else if(dialog==MC_TEXTURE && row>=0 && row<sizeof MC_Textures) MC_SaveMaterial(p,true,row);
  else if(dialog==MC_SURFACE && row>=0 && row<16) MC_Surface[p]=row;
 }
 MC_EditShow(p);return 1;
}
