stock RP_TotemsSpend(p,amount) {
 if(JugadorLogeado[p]!=1 || amount<=0 || amount>1000000) return 0;
 new query[200];
 mysql_format(handle_db,query,sizeof query,"UPDATE usuarios SET NexusTotems=NexusTotems-%d WHERE ID=%d AND NexusTotems>=%d",amount,PLAYER_INFO[p][pID],amount);
 new Cache:result=mysql_query(handle_db,query);
 new ok=mysql_errno(handle_db)==0 && cache_affected_rows()==1;
 if(cache_is_valid(result)) cache_delete(result);
 if(!ok) return 0;
 RP_NexusTotems[p]-=amount;
 return 1;
}
stock RP_TotemsRefund(p,amount) {
 new query[200];
 mysql_format(handle_db,query,sizeof query,"UPDATE usuarios SET NexusTotems=NexusTotems+%d WHERE ID=%d AND NexusTotems<=%d",amount,PLAYER_INFO[p][pID],1000000000-amount);
 new Cache:result=mysql_query(handle_db,query);
 new ok=mysql_errno(handle_db)==0 && cache_affected_rows()==1;
 if(cache_is_valid(result)) cache_delete(result);
 if(ok) RP_NexusTotems[p]+=amount;
 else printf("[Nexus Totems] ERROR reembolso cuenta %d cantidad %d",PLAYER_INFO[p][pID],amount);
 return ok;
}
CMD:dartotems(playerid,params[]) {
 if(JugadorLogeado[playerid]!=1 || PLAYER_INFO[playerid][pAdmin]!=ADMIN_LVL_ADM) return SendClientMessage(playerid,-1,"Solo el rango Dueno puede usar /dartotems.");
 new id,amount;
 if(sscanf(params,"dd",id,amount)) return SendClientMessage(playerid,-1,"Uso: /dartotems [ID] [cantidad]");
 if(id<0 || id>=MAX_PLAYERS || !IsPlayerConnected(id) || IsPlayerNPC(id) || JugadorLogeado[id]!=1) return SendClientMessage(playerid,-1,"El jugador debe estar conectado y logeado.");
 if(amount<1 || amount>1000000 || RP_NexusTotems[id]>1000000000-amount) return SendClientMessage(playerid,-1,"Cantidad invalida: 1 a 1000000.");
 new query[240];
 mysql_format(handle_db,query,sizeof query,"UPDATE usuarios SET NexusTotems=NexusTotems+%d WHERE ID=%d AND NexusTotems<=%d",amount,PLAYER_INFO[id][pID],1000000000-amount);
 new Cache:result=mysql_query(handle_db,query);
 new ok=mysql_errno(handle_db)==0 && cache_affected_rows()==1;
 if(cache_is_valid(result)) cache_delete(result);
 if(!ok) return SendClientMessage(playerid,-1,"No se pudieron guardar los Totems. No se ha enviado la moneda.");
 RP_NexusTotems[id]+=amount;
 printf("[Nexus Totems] Dueno cuenta %d envia %d a cuenta %d. Saldo: %d",PLAYER_INFO[playerid][pID],amount,PLAYER_INFO[id][pID],RP_NexusTotems[id]);
 SendClientMessageEx(playerid,-1,"Enviaste %d Totems a %s. Saldo: %d.",amount,PLAYER_INFO[id][Nickname],RP_NexusTotems[id]);
 SendClientMessageEx(id,-1,"Recibiste %d Totems del Dueno. Saldo: %d.",amount,RP_NexusTotems[id]);
 #if defined RP_InvVisible
 RP_InvBalanceTick(id);
 #endif
 #if defined RP_STVisible
 if(RP_STVisible[id]) RP_StatsShow(id);
 #endif
 return 1;
}
CMD:quitartotems(playerid,params[]) {
 if(JugadorLogeado[playerid]!=1 || PLAYER_INFO[playerid][pAdmin]!=ADMIN_LVL_ADM) return SendClientMessage(playerid,-1,"Solo el rango Dueno puede usar /quitartotems.");
 new id,amount;
 if(sscanf(params,"dd",id,amount)) return SendClientMessage(playerid,-1,"Uso: /quitartotems [ID] [cantidad]");
 if(id<0 || id>=MAX_PLAYERS || !IsPlayerConnected(id) || IsPlayerNPC(id) || JugadorLogeado[id]!=1) return SendClientMessage(playerid,-1,"El jugador debe estar conectado y logeado.");
 if(amount<1 || amount>1000000) return SendClientMessage(playerid,-1,"Cantidad invalida: 1 a 1000000.");
 if(!RP_TotemsSpend(id,amount)) return SendClientMessage(playerid,-1,"No se pudieron quitar los Totems. Comprueba que tenga esa cantidad.");
 printf("[Nexus Totems] Dueno cuenta %d quita %d a cuenta %d. Saldo: %d",PLAYER_INFO[playerid][pID],amount,PLAYER_INFO[id][pID],RP_NexusTotems[id]);
 SendClientMessageEx(playerid,-1,"Quitaste %d Totems a %s. Saldo: %d.",amount,PLAYER_INFO[id][Nickname],RP_NexusTotems[id]);
 SendClientMessageEx(id,-1,"El Dueno te quito %d Totems. Saldo: %d.",amount,RP_NexusTotems[id]);
 #if defined RP_InvVisible
 RP_InvBalanceTick(id);
 #endif
 #if defined RP_STVisible
 if(RP_STVisible[id]) RP_StatsShow(id);
 #endif
 return 1;
}
CMD:dartotemstodos(playerid,params[]) {
 if(JugadorLogeado[playerid]!=1 || PLAYER_INFO[playerid][pAdmin]!=ADMIN_LVL_ADM) return SendClientMessage(playerid,-1,"Solo el rango Dueno puede usar /dartotemstodos.");
 new amount,count,failed;
 if(sscanf(params,"d",amount)) return SendClientMessage(playerid,-1,"Uso: /dartotemstodos [cantidad por jugador]");
 if(amount<1 || amount>1000000) return SendClientMessage(playerid,-1,"Cantidad invalida: 1 a 1000000.");
 foreach(new id:Player) {
  if(IsPlayerNPC(id) || JugadorLogeado[id]!=1) continue;
  if(RP_NexusTotems[id]>1000000000-amount || !RP_TotemsRefund(id,amount)){failed++;continue;}
  count++;
  printf("[Nexus Totems] Envio global Dueno cuenta %d: %d a cuenta %d. Saldo: %d",PLAYER_INFO[playerid][pID],amount,PLAYER_INFO[id][pID],RP_NexusTotems[id]);
  SendClientMessageEx(id,-1,"El Dueno envio %d Totems a todos. Tu saldo: %d.",amount,RP_NexusTotems[id]);
  #if defined RP_InvVisible
  RP_InvBalanceTick(id);
  #endif
  #if defined RP_STVisible
  if(RP_STVisible[id]) RP_StatsShow(id);
  #endif
 }
 SendClientMessageEx(playerid,-1,"Enviaste %d Totems por jugador a %d jugadores. Sin enviar: %d.",amount,count,failed);
 return 1;
}
