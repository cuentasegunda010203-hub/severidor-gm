// Lifetime job skill progress is separate from the periodically reset employee ranking.
stock RP_ExtraSkillsInit() {
 mysql_tquery(handle_db, "CREATE TABLE IF NOT EXISTS rp_job_skills (id_player INT NOT NULL, id_work INT NOT NULL, total INT NOT NULL DEFAULT 0, PRIMARY KEY(id_player,id_work)) ENGINE=InnoDB");
 new query[512];
 mysql_format(handle_db,query,sizeof query,"INSERT IGNORE INTO rp_job_skills (id_player,id_work,total) SELECT id_player,id_work,GREATEST(points,0) FROM pworks_points WHERE id_work IN (%d,%d)",T_Taxista,T_Albanil);
 mysql_tquery(handle_db,query);return 1;
}
stock RP_LoadExtraSkills(playerid) {
 new accountId=PLAYER_INFO[playerid][pID],session=RP_ExtraSkillSession[playerid];
 new taxiEvents=RP_ExtraSkillEvents[playerid][0],workerEvents=RP_ExtraSkillEvents[playerid][1];
 inline OnSkillsLoaded() {
  if(!IsPlayerConnected(playerid) || !JugadorLogeado[playerid] || PLAYER_INFO[playerid][pID]!=accountId || RP_ExtraSkillSession[playerid]!=session) return;
  new rows;cache_get_row_count(rows);
  // Awards queued after this SELECT are added to its snapshot once, without losing progress.
  RP_ExtraSkillTotal[playerid][0]=RP_ExtraSkillEvents[playerid][0]-taxiEvents;
  RP_ExtraSkillTotal[playerid][1]=RP_ExtraSkillEvents[playerid][1]-workerEvents;
  for(new i;i<rows;i++) {
   new work,total;cache_get_value_name_int(i,"id_work",work);cache_get_value_name_int(i,"total",total);
   if(work==T_Taxista) RP_ExtraSkillTotal[playerid][0]+=total;
   else if(work==T_Albanil) RP_ExtraSkillTotal[playerid][1]+=total;
  }
 }
 new query[160];mysql_format(handle_db,query,sizeof query,"SELECT id_work,total FROM rp_job_skills WHERE id_player=%d",accountId);
 mysql_tquery_inline(handle_db,query,using inline OnSkillsLoaded);return;
}
stock RP_AddExtraSkill(playerid,work,points) {
 new skill;
 if(work==T_Taxista) skill=0;else if(work==T_Albanil) skill=1;else return 0;
 RP_ExtraSkillTotal[playerid][skill]+=points;RP_ExtraSkillEvents[playerid][skill]+=points;
 new query[256];mysql_format(handle_db,query,sizeof query,"INSERT INTO rp_job_skills (id_player,id_work,total) VALUES (%d,%d,%d) ON DUPLICATE KEY UPDATE total=total+%d",PLAYER_INFO[playerid][pID],work,points,points);
 mysql_tquery(handle_db,query);
 SendClientMessageEx(playerid,-1,"{33CC66}+%d habilidad de %s{FFFFFF}. Nivel %d | Progreso %d/50.",points,skill==0?("Taxista"):("Obrero"),1+RP_ExtraSkillTotal[playerid][skill]/50,RP_ExtraSkillTotal[playerid][skill]%50);
 return 1;
}
