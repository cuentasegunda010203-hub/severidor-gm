stock NX_Live(p) {return p>=0 && p<MAX_PLAYERS && IsPlayerConnected(p) && !IsPlayerNPC(p) && LogeoCorrecto[p]==1 && PLAYER_INFO[p][pID]>0;}
#include "modulos/battlepass_datos.p"
// SQL sincrono: cada premio y su reclamo se confirman juntos; memoria solo tras COMMIT.
stock NX_SQL(const q[]) {return RP_BizSQL(q);}
stock NX_Init() {
 NX_Ready=false;
 if(!NX_SQL("CREATE TABLE IF NOT EXISTS nexus_pass_seasons(id INT PRIMARY KEY AUTO_INCREMENT, starts INT NOT NULL, ends INT NOT NULL, community INT NOT NULL DEFAULT 0, catalog INT NOT NULL DEFAULT 1) ENGINE=InnoDB")) return 0;
 if(!NX_SQL("CREATE TABLE IF NOT EXISTS nexus_pass_progress(account INT NOT NULL, season INT NOT NULL, xp INT NOT NULL DEFAULT 0, premium INT NOT NULL DEFAULT 0, daystamp INT NOT NULL DEFAULT 0, daily INT NOT NULL DEFAULT 0, daymask INT NOT NULL DEFAULT 0, weekstamp INT NOT NULL DEFAULT 0, weekly INT NOT NULL DEFAULT 0, weekmask INT NOT NULL DEFAULT 0, jobs INT NOT NULL DEFAULT 0, seasonmask INT NOT NULL DEFAULT 0, PRIMARY KEY(account,season)) ENGINE=InnoDB")) return 0;
 if(!NX_SQL("CREATE TABLE IF NOT EXISTS nexus_pass_claims(account INT NOT NULL, season INT NOT NULL, track INT NOT NULL, level INT NOT NULL, claimed INT NOT NULL, PRIMARY KEY(account,season,track,level)) ENGINE=InnoDB")) return 0;
 if(!NX_SQL("ALTER TABLE player_toys ENGINE=InnoDB") || !NX_SQL("ALTER TABLE backpack ENGINE=InnoDB")) return 0;
 new q[300];format(q,sizeof q,"INSERT INTO nexus_pass_seasons(starts,ends) SELECT %d,%d WHERE NOT EXISTS(SELECT 1 FROM nexus_pass_seasons)",gettime(),gettime()+NX_BP_DAYS*86400);
 if(!NX_SQL(q)) return 0;
 new Cache:c=mysql_query(handle_db,"SELECT id,starts,ends,community FROM nexus_pass_seasons WHERE catalog=1 ORDER BY id DESC LIMIT 1",true);
 if(mysql_errno(handle_db)==0 && cache_num_rows()==1) {
  cache_get_value_name_int(0,"id",NX_Season);cache_get_value_name_int(0,"starts",NX_Start);cache_get_value_name_int(0,"ends",NX_End);cache_get_value_name_int(0,"community",NX_Community);NX_Ready=true;
 }
 if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
 printf("[NEXUS PASS] Estado=%d temporada=%d fin=%d",NX_Ready,NX_Season,NX_End);return _:NX_Ready;
}
stock NX_Level(xp) {return min(NX_BP_LEVELS,max(1,xp/NX_BP_XP+1));}
stock NX_Active() {return NX_Ready && gettime()>=NX_Start && gettime()<NX_End;}
stock NX_Today() {new y,m,d;getdate(y,m,d);return y*10000+m*100+d;}
stock NX_VIPDate(p) {return PLAYER_INFO[p][finano]*10000+PLAYER_INFO[p][finmes]*100+PLAYER_INFO[p][findia];}
stock NX_Read(p,season=0) {
 if(!NX_Ready || !NX_Live(p)) return 0;
 if(!season) season=NX_View[p]?NX_View[p]:NX_Season;
 new q[400];format(q,sizeof q,"INSERT IGNORE INTO nexus_pass_progress(account,season) VALUES(%d,%d)",PLAYER_INFO[p][pID],season);
 if(season==NX_Season && NX_Active() && !NX_SQL(q)) return 0;
 format(q,sizeof q,"SELECT xp,premium,daystamp,daily,daymask,weekstamp,weekly,weekmask,jobs,seasonmask FROM nexus_pass_progress WHERE account=%d AND season=%d FOR UPDATE",PLAYER_INFO[p][pID],season);
 new Cache:c=mysql_query(handle_db,q,true);new bool:ok=mysql_errno(handle_db)==0 && cache_num_rows()==1;
 if(ok) {
  cache_get_value_name_int(0,"xp",NX_State[p][npXP]);cache_get_value_name_int(0,"premium",NX_State[p][npPremium]);
  cache_get_value_name_int(0,"daystamp",NX_State[p][npDay]);cache_get_value_name_int(0,"daily",NX_State[p][npDaily]);cache_get_value_name_int(0,"daymask",NX_State[p][npDayMask]);
  cache_get_value_name_int(0,"weekstamp",NX_State[p][npWeek]);cache_get_value_name_int(0,"weekly",NX_State[p][npWeekly]);cache_get_value_name_int(0,"weekmask",NX_State[p][npWeekMask]);
  cache_get_value_name_int(0,"jobs",NX_State[p][npJobs]);cache_get_value_name_int(0,"seasonmask",NX_State[p][npSeasonMask]);
 }
 if(c!=MYSQL_INVALID_CACHE) cache_delete(c);if(!ok) return 0;
 NX_View[p]=season;NX_Account[p]=PLAYER_INFO[p][pID];NX_Claims[p][0]=NX_Claims[p][1]=0;
 format(q,sizeof q,"SELECT track,level FROM nexus_pass_claims WHERE account=%d AND season=%d",NX_Account[p],season);
 c=mysql_query(handle_db,q,true);ok=mysql_errno(handle_db)==0;
 if(ok) for(new i;i<cache_num_rows();i++) {new t,l;cache_get_value_name_int(i,"track",t);cache_get_value_name_int(i,"level",l);if(t>=0 && t<2 && l>=1 && l<=30) NX_Claims[p][t]|=1<<(l-1);}
 if(c!=MYSQL_INVALID_CACHE) cache_delete(c);return _:ok;
}
stock NX_SaveProgress(p) {
 new q[900];format(q,sizeof q,"UPDATE nexus_pass_progress SET xp=%d,premium=%d,daystamp=%d,daily=%d,daymask=%d,weekstamp=%d,weekly=%d,weekmask=%d,jobs=%d,seasonmask=%d WHERE account=%d AND season=%d",
 NX_State[p][npXP],NX_State[p][npPremium],NX_State[p][npDay],NX_State[p][npDaily],NX_State[p][npDayMask],NX_State[p][npWeek],NX_State[p][npWeekly],NX_State[p][npWeekMask],NX_State[p][npJobs],NX_State[p][npSeasonMask],NX_Account[p],NX_View[p]);return NX_SQL(q);
}
stock NX_Job(p,work) {
 if(!NX_Active() || !NX_Live(p) || NX_Busy[p] || work<1 || gettime()<NX_Cooldown[p]) return 0;
 NX_Cooldown[p]=gettime()+15;new oldview=NX_View[p];
 if(!NX_SQL("START TRANSACTION")) return 0;
 if(!NX_Read(p,NX_Season)) {NX_SQL("ROLLBACK");return 0;}
 new day=(gettime()-4*3600)/86400,week=(day+3)/7;
 if(NX_State[p][npDay]!=day) {NX_State[p][npDay]=day;NX_State[p][npDaily]=0;NX_State[p][npDayMask]=0;}
 if(NX_State[p][npWeek]!=week) {NX_State[p][npWeek]=week;NX_State[p][npWeekly]=0;NX_State[p][npWeekMask]=0;}
 new oldlevel=NX_Level(NX_State[p][npXP]),gain=NX_State[p][npDaily]<10?50:0;
 NX_State[p][npDaily]=min(10000,NX_State[p][npDaily]+1);NX_State[p][npWeekly]=min(10000,NX_State[p][npWeekly]+1);NX_State[p][npJobs]=min(1000000,NX_State[p][npJobs]+1);
 if(NX_State[p][npDaily]>=3 && !(NX_State[p][npDayMask]&1)) {gain+=400;NX_State[p][npDayMask]|=1;}
 if(NX_State[p][npDaily]>=8 && !(NX_State[p][npDayMask]&2)) {gain+=600;NX_State[p][npDayMask]|=2;}
 if(NX_State[p][npWeekly]>=20 && !(NX_State[p][npWeekMask]&1)) {gain+=1500;NX_State[p][npWeekMask]|=1;}
 if(NX_State[p][npWeekly]>=50 && !(NX_State[p][npWeekMask]&2)) {gain+=2500;NX_State[p][npWeekMask]|=2;}
 if(NX_State[p][npJobs]>=150 && !(NX_State[p][npSeasonMask]&1)) {gain+=5000;NX_State[p][npSeasonMask]|=1;}
 NX_State[p][npXP]=min(30000,NX_State[p][npXP]+gain);
 new q[190];format(q,sizeof q,"UPDATE nexus_pass_seasons SET community=LEAST(1000000,community+1) WHERE id=%d",NX_Season);
 if(!NX_SaveProgress(p) || !NX_SQL(q) || !NX_SQL("COMMIT")) {NX_SQL("ROLLBACK");NX_Read(p,oldview);return 0;}
 NX_Community=min(1000000,NX_Community+1);
 if(gain>0) SendClientMessageEx(p,0xE5BB59FF,"[NEXUS PASS] +%d XP del pase. Nivel %d/30.",gain,NX_Level(NX_State[p][npXP]));
 if(NX_Level(NX_State[p][npXP])>oldlevel) SendClientMessage(p,-1,"Nuevo nivel del pase: /battlepass para reclamar tus recompensas.");
 if(oldview && oldview!=NX_Season) NX_Read(p,oldview);return 1;
}
stock NX_RewardAvailable(p,t,l) {
 return t>=0 && t<2 && l>=1 && l<=30 && l<=NX_Level(NX_State[p][npXP]) && (t==0 || NX_State[p][npPremium]) && !(NX_Claims[p][t]&(1<<(l-1)));
}
stock NX_CanReceive(p,t,l) {
 // arrestado es el total historico, no un estado actual de detencion.
 if(!NX_Live(p)) return SendClientMessage(p,-1,"Termina el inicio de sesion para reclamar. Tu premio sigue pendiente."),0;
 if(GetPlayerState(p)==PLAYER_STATE_WASTED || PLAYER_INFO[p][Agonizando]) return SendClientMessage(p,-1,"No puedes reclamar mientras estas muerto o agonizando. Tu premio sigue pendiente."),0;
 if(PLAYER_INFO[p][pTiempoCarcel]>0) return SendClientMessage(p,-1,"Termina tu condena antes de reclamar. Tu premio sigue pendiente."),0;
 if(PLAYER_INFO[p][pTiempoJail]>0) return SendClientMessage(p,-1,"Termina tu sancion de jail antes de reclamar. Tu premio sigue pendiente."),0;
 new r=l-1,a=NX_Prizes[t][r][nrAmount];
 switch(NX_Prizes[t][r][nrKind]) {
  case NX_MONEY: if(PLAYER_INFO[p][jDinero]>1000000000-a) return SendClientMessage(p,-1,"Tu saldo de dinero esta lleno; premio pendiente."),0;
  case NX_COINS: if(PLAYER_INFO[p][Totems]>1000000000-a) return SendClientMessage(p,-1,"Tu saldo Coins esta lleno; premio pendiente."),0;
  case NX_EXP: if(PLAYER_INFO[p][jExperiencia]>999-a) return SendClientMessage(p,-1,"Avanza de nivel antes de reclamar mas EXP."),0;
  case NX_TOY,NX_PACK: {
   if(CountPlayerToys(p)>=MAX_PLAYER_TOYS) return SendClientMessage(p,-1,"No hay espacio en /accesorios; el premio queda pendiente."),0;
   if(NX_Prizes[t][r][nrKind]==NX_PACK && BackPack[p][bDBID]>0) return SendClientMessage(p,-1,"Ya tienes mochila. Este premio queda pendiente hasta liberar ese espacio."),0;
  }
  case NX_WEAPON: {
   if(PLAYER_INFO[p][@Nivel]<6 || PLAYER_INFO[p][pDuty]) return SendClientMessage(p,-1,"Armas del pase: nivel 6 y fuera de servicio. El premio sigue pendiente."),0;
   if(PLAYER_INFO[p][j_ARMAS][GetWeaponSlot(NX_Prizes[t][r][nrModel])]) return SendClientMessage(p,-1,"Ya tienes un arma en ese espacio. Guarda la actual y vuelve a reclamar."),0;
  }
 }
 return 1;
}
stock NX_DialogShow(p,id,style,const title[],const text[],const yes[],const no[]) {
 NX_Hide(p);NX_Dialog[p]=id;NX_Account[p]=PLAYER_INFO[p][pID];return dialogs_ShowPlayerDialog(p,id,style,title,text,yes,no);
}
stock NX_Error(p) {SendClientMessage(p,-1,"No se pudo guardar la operacion. No se consumio el premio ni se cobro el pase.");return 0;}
stock NX_Queue(p,operation) {
 if(NX_Busy[p] || !NX_Live(p) || NX_Account[p]!=PLAYER_INFO[p][pID]) return 0;
 NX_Busy[p]=true;NX_Dialog[p]=0;
 mysql_tquery(handle_db,"SELECT 1","NX_CommitQueued","ddddd",p,NX_Session[p],NX_Account[p],NX_View[p],operation);return 1;
}
forward NX_CommitQueued(p,session,account,season,operation);
public NX_CommitQueued(p,session,account,season,operation) {
 if(!NX_Live(p) || NX_Session[p]!=session || PLAYER_INFO[p][pID]!=account) return 1;
 NX_Busy[p]=false;
 if(!NX_Read(p,season)) return NX_Error(p);
 if(operation==-1) return NX_Purchase(p);
 if(operation==60) return NX_CommunityClaim(p);
 if(operation<0 || operation>=60) return 1;
 return NX_Claim(p,operation/30,operation%30+1);
}
stock NX_Purchase(p) {
 if(NX_View[p]!=NX_Season || !NX_Active() || NX_Quote[p]<gettime()) return SendClientMessage(p,-1,"La confirmacion vencio; vuelve a abrir el pase.");
 NX_Quote[p]=0;
 if(NX_State[p][npPremium]) return SendClientMessage(p,-1,"Tu Premium ya esta activo para esta temporada.");
 if(PLAYER_INFO[p][Totems]<NX_BP_PRICE) return SendClientMessage(p,-1,"Necesitas 60 Coins para el pase Premium.");
 new q[400];if(!NX_SQL("START TRANSACTION")) return NX_Error(p);
 format(q,sizeof q,"UPDATE nexus_pass_progress SET premium=1 WHERE account=%d AND season=%d AND premium=0",NX_Account[p],NX_View[p]);
 if(!RP_BizSQL(q,true)) {NX_SQL("ROLLBACK");return NX_Error(p);}
 format(q,sizeof q,"UPDATE usuarios SET totems=%d WHERE ID=%d",PLAYER_INFO[p][Totems]-NX_BP_PRICE,NX_Account[p]);
 if(!NX_SQL(q) || !NX_SQL("COMMIT")) {NX_SQL("ROLLBACK");return NX_Error(p);}
 PLAYER_INFO[p][Totems]-=NX_BP_PRICE;NX_State[p][npPremium]=1;GuardarCuenta(p);
 SendClientMessage(p,0xE5BB59FF,"Premium activado. Puedes reclamar los niveles Premium que ya alcanzaste.");return NX_Show(p);
}
stock NX_Claim(p,t,l) {
 if(!NX_RewardAvailable(p,t,l)) return SendClientMessage(p,-1,"Ese premio esta bloqueado o ya fue reclamado.");
 if(!NX_CanReceive(p,t,l)) return NX_List(p);
 new r=l-1,a=NX_Prizes[t][r][nrAmount],m=NX_Prizes[t][r][nrModel],q[1000],toy=-1,toyid,packid,vipYear,vipMonth,vipDay,vipLevel;
 if(!NX_SQL("START TRANSACTION")) return NX_Error(p);
 format(q,sizeof q,"INSERT INTO nexus_pass_claims(account,season,track,level,claimed) VALUES(%d,%d,%d,%d,%d)",NX_Account[p],NX_View[p],t,l,gettime());
 if(!NX_SQL(q)) {NX_SQL("ROLLBACK");return NX_Error(p);}
 new bool:ok=true;
 switch(NX_Prizes[t][r][nrKind]) {
  case NX_MONEY: {format(q,sizeof q,"UPDATE usuarios SET Money=%d WHERE ID=%d",PLAYER_INFO[p][jDinero]+a,NX_Account[p]);ok=NX_SQL(q);}
  case NX_COINS: {format(q,sizeof q,"UPDATE usuarios SET totems=%d WHERE ID=%d",PLAYER_INFO[p][Totems]+a,NX_Account[p]);ok=NX_SQL(q);}
  case NX_EXP: {format(q,sizeof q,"UPDATE usuarios SET Experiencia=%d WHERE ID=%d",PLAYER_INFO[p][jExperiencia]+a,NX_Account[p]);ok=NX_SQL(q);}
  case NX_TOY,NX_PACK: {
   toy=GetNewIDPlayerToy(p);format(q,sizeof q,"INSERT INTO player_toys(player_id,MODEL_ID,BONE,COLOR_1,COLOR_2) VALUES(%d,%d,%d,-1,-1)",NX_Account[p],m,GetBoneObjeto(m));
   new Cache:c=mysql_query(handle_db,q,true);ok=mysql_errno(handle_db)==0;if(ok) toyid=cache_insert_id();if(c!=MYSQL_INVALID_CACHE) cache_delete(c);ok=ok && toyid>0 && toy>=0;
   if(ok && NX_Prizes[t][r][nrKind]==NX_PACK) {
    c=mysql_query(handle_db,"INSERT INTO backpack(Objeto,Cantidad) VALUES('0|0|0|0|0|0|0|0|0','0|0|0|0|0|0|0|0|0')",true);ok=mysql_errno(handle_db)==0;if(ok) packid=cache_insert_id();if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
    format(q,sizeof q,"UPDATE usuarios SET BackPack=%d WHERE ID=%d",packid,NX_Account[p]);ok=ok && packid>0 && NX_SQL(q);
   }
  }
  case NX_VIP: {
   vipLevel=NX_VIPDate(p)>=NX_Today()?max(m,PLAYER_INFO[p][pVip]):m;
   new expiry=NX_VIPDate(p);if(expiry<NX_Today() || !PLAYER_INFO[p][pVip]) expiry=NX_Today();
   format(q,sizeof q,"SELECT YEAR(d) AS y,MONTH(d) AS m,DAY(d) AS d FROM(SELECT DATE_ADD(STR_TO_DATE('%08d','%%Y%%m%%d'),INTERVAL %d DAY) d) dates",expiry,a);
   new Cache:c=mysql_query(handle_db,q,true);ok=mysql_errno(handle_db)==0 && cache_num_rows()==1;
   if(ok) {cache_get_value_name_int(0,"y",vipYear);cache_get_value_name_int(0,"m",vipMonth);cache_get_value_name_int(0,"d",vipDay);ok=vipYear>0 && vipMonth>=1 && vipMonth<=12 && vipDay>=1 && vipDay<=31;}
   if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
   format(q,sizeof q,"UPDATE usuarios SET VIP=%d,FinDia=%d,FinMes=%d,FinAno=%d WHERE ID=%d",vipLevel,vipDay,vipMonth,vipYear,NX_Account[p]);ok=ok && NX_SQL(q);
  }
  case NX_WEAPON: {format(q,sizeof q,"UPDATE usuarios SET WP%d=%d WHERE ID=%d",GetWeaponSlot(m),m,NX_Account[p]);ok=NX_SQL(q);}
  case NX_SKIN: {} // La fila de reclamo es el desbloqueo permanente del vestuario.
 }
 if(!ok || !NX_SQL("COMMIT")) {NX_SQL("ROLLBACK");return NX_Error(p);}
 NX_Claims[p][t]|=1<<r;
 switch(NX_Prizes[t][r][nrKind]) {
  case NX_MONEY: DarDinero(p,a);
  case NX_COINS: PLAYER_INFO[p][Totems]+=a;
  case NX_EXP: PLAYER_INFO[p][jExperiencia]+=a;
  case NX_TOY,NX_PACK: {
   PLAYER_TOYS[p][toy][pt_ID]=toyid;PLAYER_TOYS[p][toy][pt_MODEL_ID]=m;PLAYER_TOYS[p][toy][pt_BONE]=GetBoneObjeto(m);PLAYER_TOYS[p][toy][pt_ATTACHED]=false;
   PLAYER_TOYS[p][toy][pt_POS][0]=0.085;PLAYER_TOYS[p][toy][pt_POS][1]=0.017999;PLAYER_TOYS[p][toy][pt_POS][2]=0.000999;
   PLAYER_TOYS[p][toy][pt_ROT][0]=87.2;PLAYER_TOYS[p][toy][pt_ROT][1]=88.1;PLAYER_TOYS[p][toy][pt_ROT][2]=-7.5;
   for(new i;i<3;i++) PLAYER_TOYS[p][toy][pt_SCALE][i]=1.0;
   PLAYER_TOYS[p][toy][player_toy_COLOR_1]=-1;PLAYER_TOYS[p][toy][player_toy_COLOR_2]=-1;
   if(packid) {CLEAR_ITEMS(p);BackPack[p][bDBID]=packid;}
  }
  case NX_VIP: {PLAYER_INFO[p][pVip]=vipLevel;PLAYER_INFO[p][findia]=vipDay;PLAYER_INFO[p][finmes]=vipMonth;PLAYER_INFO[p][finano]=vipYear;}
  case NX_WEAPON: DarArma(p,m);
  case NX_SKIN: SendClientMessage(p,-1,"Nueva skin desbloqueada: /battlepass ropa. Puedes volver a equiparla cuando quieras.");
 }
 GuardarCuenta(p);SendClientMessageEx(p,0x65DA94FF,"[NEXUS PASS] Recibiste %s (nivel %d).",NX_Prizes[t][r][nrName],l);return NX_Receipt(p,t,l);
}
stock NX_CommunityClaim(p) {
 new q[300];format(q,sizeof q,"SELECT community FROM nexus_pass_seasons WHERE id=%d",NX_View[p]);new Cache:c=mysql_query(handle_db,q,true);new total;
 if(mysql_errno(handle_db)==0 && cache_num_rows()==1) cache_get_value_name_int(0,"community",total);if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
 if(total<500 || NX_State[p][npJobs]<10 || (NX_State[p][npSeasonMask]&2)) return SendClientMessage(p,-1,"Meta comunitaria: 500 trabajos totales y 10 contribuciones tuyas. Premio unico: 2 Coins.");
 if(PLAYER_INFO[p][Totems]>999999998) return 0;
 if(!NX_SQL("START TRANSACTION")) return NX_Error(p);
 format(q,sizeof q,"UPDATE nexus_pass_progress SET seasonmask=seasonmask|2 WHERE account=%d AND season=%d AND (seasonmask&2)=0",NX_Account[p],NX_View[p]);new bool:ok=RP_BizSQL(q,true);
 format(q,sizeof q,"UPDATE usuarios SET totems=%d WHERE ID=%d",PLAYER_INFO[p][Totems]+2,NX_Account[p]);
 if(!ok || !NX_SQL(q) || !NX_SQL("COMMIT")) {NX_SQL("ROLLBACK");return NX_Error(p);}
 PLAYER_INFO[p][Totems]+=2;NX_State[p][npSeasonMask]|=2;GuardarCuenta(p);SendClientMessage(p,0x65DA94FF,"Meta comunitaria reclamada: +2 Coins.");return NX_Missions(p);
}
