// NEXUS PASS: recompensas nativas para Android y PC. Version de catalogo 1.
#define NX_BP_PRICE (60)
#define NX_BP_DAYS (60)
#define NX_BP_LEVELS (30)
#define NX_BP_XP (1000)
#define NX_BP_MENU (28700)
#define NX_BP_REWARDS (28701)
#define NX_BP_CONFIRM (28702)
#define NX_BP_BUY (28703)
#define NX_BP_MISSIONS (28704)
#define NX_BP_WARDROBE (28705)
#define NX_BP_INFO (28706)
enum NX_RewardKind {NX_MONEY, NX_COINS, NX_EXP, NX_TOY, NX_PACK, NX_SKIN, NX_VIP, NX_WEAPON};
enum NX_Reward {NX_RewardKind:nrKind, nrAmount, nrModel, nrFemale, nrName[48]};
new const NX_Prizes[2][NX_BP_LEVELS][NX_Reward] = {
 {
  {NX_MONEY,1500,1212,0,"$1.500 de bienvenida"}, {NX_EXP,1,1240,0,"1 EXP de personaje"},
  {NX_MONEY,2000,1212,0,"$2.000"}, {NX_COINS,1,19941,0,"1 Coin"},
  {NX_TOY,1,18913,0,"Gafas Ascenso"}, {NX_MONEY,2500,1212,0,"$2.500"},
  {NX_EXP,1,1240,0,"1 EXP de personaje"}, {NX_MONEY,3000,1212,0,"$3.000"},
  {NX_COINS,1,19941,0,"1 Coin"}, {NX_SKIN,1,101,91,"Conjunto Calle"},
  {NX_MONEY,3500,1212,0,"$3.500"}, {NX_EXP,1,1240,0,"1 EXP de personaje"},
  {NX_MONEY,4000,1212,0,"$4.000"}, {NX_COINS,1,19941,0,"1 Coin"},
  {NX_TOY,1,18939,0,"Gorra Ascenso"}, {NX_MONEY,4500,1212,0,"$4.500"},
  {NX_EXP,2,1240,0,"2 EXP de personaje"}, {NX_MONEY,5000,1212,0,"$5.000"},
  {NX_MONEY,5500,1212,0,"$5.500"}, {NX_PACK,1,3026,0,"Mochila de inventario"},
  {NX_MONEY,6000,1212,0,"$6.000"}, {NX_EXP,2,1240,0,"2 EXP de personaje"},
  {NX_MONEY,6500,1212,0,"$6.500"}, {NX_COINS,1,19941,0,"1 Coin"},
  {NX_TOY,1,18947,0,"Prenda Calle"}, {NX_MONEY,7000,1212,0,"$7.000"},
  {NX_EXP,2,1240,0,"2 EXP de personaje"}, {NX_MONEY,8000,1212,0,"$8.000"},
  {NX_COINS,1,19941,0,"1 Coin"}, {NX_SKIN,1,60,93,"Conjunto Ascenso"}
 },
 {
  {NX_TOY,1,18961,0,"Prenda Premium Inicio"}, {NX_COINS,2,19941,0,"2 Coins"},
  {NX_EXP,2,1240,0,"2 EXP de personaje"}, {NX_MONEY,10000,1212,0,"$10.000"},
  {NX_PACK,1,19559,0,"Mochila Premium"}, {NX_WEAPON,1,22,0,"Pistola 9mm"},
  {NX_COINS,2,19941,0,"2 Coins"}, {NX_TOY,1,18962,0,"Prenda Premium Distrito"},
  {NX_EXP,3,1240,0,"3 EXP de personaje"}, {NX_VIP,7,1,0,"VIP 1 por 7 dias"},
  {NX_MONEY,15000,1212,0,"$15.000"}, {NX_SKIN,1,240,193,"Coleccion Distrito"},
  {NX_COINS,3,19941,0,"3 Coins"}, {NX_WEAPON,1,25,0,"Escopeta"},
  {NX_TOY,1,18964,0,"Prenda Premium Ascenso"}, {NX_EXP,3,1240,0,"3 EXP de personaje"},
  {NX_MONEY,20000,1212,0,"$20.000"}, {NX_COINS,3,19941,0,"3 Coins"},
  {NX_SKIN,1,59,194,"Coleccion Horizonte"}, {NX_WEAPON,1,29,0,"MP5"},
  {NX_MONEY,25000,1212,0,"$25.000"}, {NX_EXP,4,1240,0,"4 EXP de personaje"},
  {NX_TOY,1,18974,0,"Prenda Premium Elite"}, {NX_COINS,5,19941,0,"5 Coins"},
  {NX_VIP,7,2,0,"VIP 2 por 7 dias"}, {NX_MONEY,30000,1212,0,"$30.000"},
  {NX_EXP,5,1240,0,"5 EXP de personaje"}, {NX_WEAPON,1,24,0,"Desert Eagle"},
  {NX_COINS,5,19941,0,"5 Coins"}, {NX_SKIN,1,46,211,"Coleccion Cumbre - final"}
 }
};
enum NX_Progress {npXP,npPremium,npDay,npDaily,npDayMask,npWeek,npWeekly,npWeekMask,npJobs,npSeasonMask};
new NX_State[MAX_PLAYERS][NX_Progress],NX_Season,NX_Start,NX_End,NX_Community;
new NX_View[MAX_PLAYERS],NX_Account[MAX_PLAYERS],NX_Session[MAX_PLAYERS],NX_Cooldown[MAX_PLAYERS];
new NX_Claims[MAX_PLAYERS][2],NX_Page[MAX_PLAYERS],NX_Dialog[MAX_PLAYERS],NX_Choice[MAX_PLAYERS],NX_Quote[MAX_PLAYERS];
new bool:NX_Ready,bool:NX_Busy[MAX_PLAYERS];
