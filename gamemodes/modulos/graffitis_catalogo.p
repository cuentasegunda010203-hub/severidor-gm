// Puntos urbanos iniciales. Panel nativo compacto: no necesita modelos descargados.
// PX/PY/PZ es la posicion del jugador; el panel queda a 1.8 m de ella.
enum GF_SeedData {gsKey[24],gsZone[32],Float:gsPX,Float:gsPY,Float:gsPZ,Float:gsRZ};
new const GF_Seeds[][GF_SeedData] = {
 {"ls_idlewood","LS - Idlewood",2115.0,-1749.0,13.55,90.0},
 {"sf_doherty","SF - Doherty",-2020.0,145.0,28.84,180.0},
 {"lv_airport","LV - Aeropuerto",1690.0,1447.0,10.82,90.0},
 {"ls_ganton","LS - Ganton",2486.0,-1670.0,13.34,0.0},
 {"sf_garcia","SF - Garcia",-2408.0,-598.0,132.65,90.0},
 {"lv_redeast","LV - Redsands East",2084.0,2070.0,10.82,180.0},
 {"ls_willowfield","LS - Willowfield",2424.0,-2110.0,13.55,180.0},
 {"sf_oceanflats","SF - Ocean Flats",-2692.0,-278.0,7.0,0.0},
 {"lv_redewest","LV - Redsands West",1593.0,2215.0,10.82,90.0},
 {"ls_elcorona","LS - El Corona",1880.0,-2025.0,13.55,0.0},
 {"sf_esplanade","SF - Esplanade",-1710.0,1343.0,7.19,180.0},
 {"lv_creek","LV - Creek",2814.0,2235.0,10.82,0.0},
 {"ls_seville","LS - Playa del Seville",2725.0,-2030.0,13.55,90.0},
 {"sf_easterbasin","SF - Easter Basin",-1640.0,15.0,3.55,90.0},
 {"lv_whitewood","LV - Whitewood Estates",1098.0,2045.0,10.82,180.0},
 {"ls_oceandocks","LS - Ocean Docks",2782.0,-2416.0,13.63,0.0},
 {"sf_battery","SF - Battery Point",-2634.0,1370.0,7.11,90.0},
 {"lv_rockshore","LV - Rockshore East",2535.0,700.0,10.82,0.0}
};
new GF_DefaultIDs[sizeof GF_Seeds];

stock GF_IsDefault(g) {
 for(new n;n<sizeof GF_DefaultIDs;n++) if(GF_DefaultIDs[n]>0 && GF_DefaultIDs[n]==GF[g][gfID]) return 1;
 return 0;
}
stock GF_SeedCatalog() {
 if(!GF_SQL("CREATE TABLE IF NOT EXISTS nexus_graffiti_catalog(seed_key VARCHAR(24) PRIMARY KEY,graffiti_id INT NOT NULL UNIQUE) ENGINE=InnoDB")) return 0;
 new created;
 for(new n;n<sizeof GF_Seeds;n++) {
  new q[650],id,rows;GF_DefaultIDs[n]=0;
  mysql_format(handle_db,q,sizeof q,"SELECT g.ID FROM nexus_graffiti_catalog c JOIN grafitis g ON g.ID=c.graffiti_id WHERE c.seed_key='%e'",GF_Seeds[n][gsKey]);
  new Cache:c=mysql_query(handle_db,q,true),ok=mysql_errno(handle_db)==0;
  if(ok) {cache_get_row_count(rows);if(rows) cache_get_value_name_int(0,"ID",id);}
  if(c!=MYSQL_INVALID_CACHE) cache_delete(c);if(!ok) return 0;
  if(id>0) {GF_DefaultIDs[n]=id;continue;}
  c=mysql_query(handle_db,"SELECT COUNT(*) AS total FROM grafitis",true);ok=mysql_errno(handle_db)==0;
  new total;if(ok) cache_get_value_name_int(0,"total",total);if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
  if(!ok) return 0;if(total>=GF_MAX) {printf("[Grafitis] Catalogo: limite de %d puntos; se conservaron los existentes.",GF_MAX);break;}
  if(!GF_SQL("START TRANSACTION")) return 0;
  new Float:a=GF_Seeds[n][gsRZ],Float:x=GF_Seeds[n][gsPX]+floatcos(a,degrees)*1.8,Float:y=GF_Seeds[n][gsPY]+floatsin(a,degrees)*1.8;
  mysql_format(handle_db,q,sizeof q,"INSERT INTO grafitis(IDB,NombreBanda,GX,GY,GZ,GRX,GRY,GRZ,Tiempo,Direccion,PX,PY,PZ) VALUES(0,'LIBRE',%f,%f,%f,0,0,%f,0,'%e',%f,%f,%f)",x,y,GF_Seeds[n][gsPZ]+0.75,a,GF_Seeds[n][gsZone],GF_Seeds[n][gsPX],GF_Seeds[n][gsPY],GF_Seeds[n][gsPZ]);
  c=mysql_query(handle_db,q,true);ok=mysql_errno(handle_db)==0;if(ok) id=cache_insert_id();if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
  if(!ok || id<=0) {GF_SQL("ROLLBACK");return 0;}
  mysql_format(handle_db,q,sizeof q,"INSERT INTO nexus_graffiti_catalog(seed_key,graffiti_id) VALUES('%e',%d) ON DUPLICATE KEY UPDATE graffiti_id=VALUES(graffiti_id)",GF_Seeds[n][gsKey],id);
  if(!GF_SQL(q) || !GF_SQL("COMMIT")) {GF_SQL("ROLLBACK");return 0;}
  GF_DefaultIDs[n]=id;created++;
 }
 printf("[Grafitis] Catalogo LS/SF/LV: %d nuevos puntos; propietarios y coordenadas existentes conservados.",created);return 1;
}
