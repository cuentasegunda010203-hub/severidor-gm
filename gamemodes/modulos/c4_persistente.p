// Un C4 por cuenta; se guarda al comprar y se descuenta antes de plantarlo.
#include <YSI_Coding\y_hooks>
new bool:C4_Ready,C4_Account[MAX_PLAYERS],C4_Retry[MAX_PLAYERS];
stock C4_Init() {
 mysql_query(handle_db,"CREATE TABLE IF NOT EXISTS rp_player_c4(account_id INT PRIMARY KEY,amount TINYINT NOT NULL DEFAULT 0) ENGINE=InnoDB",false);
 C4_Ready=mysql_errno(handle_db)==0;return C4_Ready;
}
stock C4_Load(p) {
 if(!C4_Ready || !IsPlayerConnected(p) || IsPlayerNPC(p) || !JugadorLogeado[p] || PLAYER_INFO[p][pID]<=0) return 0;
 new account=PLAYER_INFO[p][pID];if(C4_Account[p]==account) return 1;
 new q[110],rows,amount;mysql_format(handle_db,q,sizeof q,"SELECT amount FROM rp_player_c4 WHERE account_id=%d",account);
 new Cache:c=mysql_query(handle_db,q,true),ok=mysql_errno(handle_db)==0;
 if(ok) {cache_get_row_count(rows);if(rows) cache_get_value_name_int(0,"amount",amount);}
 if(c!=MYSQL_INVALID_CACHE) cache_delete(c);if(!ok) return 0;
 cbomba[p]=amount>0?1:0;C4_Account[p]=account;return 1;
}
stock C4_Change(p,bool:give) {
 if(!C4_Load(p)) return SendClientMessage(p,-1,"No se pudo cargar el C4. Intentalo de nuevo."),0;
 new q[220];
 if(give) mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_player_c4(account_id,amount) VALUES(%d,1) ON DUPLICATE KEY UPDATE amount=IF(amount=0,1,amount)",PLAYER_INFO[p][pID]);
 else mysql_format(handle_db,q,sizeof q,"UPDATE rp_player_c4 SET amount=0 WHERE account_id=%d AND amount=1",PLAYER_INFO[p][pID]);
 new Cache:c=mysql_query(handle_db,q,true),ok=mysql_errno(handle_db)==0,changed;if(ok) changed=cache_affected_rows();
 if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
 if(!ok) return SendClientMessage(p,-1,"No se pudo guardar el C4. La accion fue cancelada."),0;
 if(!changed) {C4_Account[p]=0;C4_Load(p);return SendClientMessage(p,-1,give?("Ya tienes un C4 guardado."):("No tienes un C4 disponible.")),0;}
 cbomba[p]=give?1:0;return 1;
}
hook OnPlayerConnect(playerid) {C4_Account[playerid]=0;C4_Retry[playerid]=0;return 1;}
hook OnPlayerDisconnect(playerid,reason) {C4_Account[playerid]=0;C4_Retry[playerid]=0;return 1;}
hook OnPlayerUpdate(playerid) {
 if(JugadorLogeado[playerid] && PLAYER_INFO[playerid][pID]>0 && C4_Account[playerid]!=PLAYER_INFO[playerid][pID] && gettime()>=C4_Retry[playerid]) {C4_Retry[playerid]=gettime()+5;C4_Load(playerid);}
 return 1;
}
