// Payday 1: automatic compact notice, compatible with PC and Android.
#include <YSI_Coding\y_hooks>
#define RP_PD_MAX (24)
#define RP_PD_RED (0xE52E44FF)
#define RP_PD_Y_OFFSET (20.0) // Separacion bajo las estrellas, en Android y PC.
new PlayerText:RP_PDTD[MAX_PLAYERS][RP_PD_MAX];
new RP_PDCount[MAX_PLAYERS],RP_PDTimer[MAX_PLAYERS];

stock RP_PDHide(p) {
 if(RP_PDTimer[p]) KillTimer(RP_PDTimer[p]);
 RP_PDTimer[p]=0;
 for(new i;i<RP_PDCount[p];i++) if(RP_PDTD[p][i]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(p,RP_PDTD[p][i]);
 RP_PDCount[p]=0;return 1;
}
stock RP_PDText(p,Float:x,Float:y,const text[],Float:w=0.13,Float:h=0.72,color=-1,align=1) {
 if(RP_PDCount[p]>=RP_PD_MAX) return -1;
 new n=RP_PDCount[p]++;
 RP_PDTD[p][n]=CreatePlayerTextDraw(p,x,y+RP_PD_Y_OFFSET,text);
 if(RP_PDTD[p][n]==PlayerText:INVALID_TEXT_DRAW) return -1;
 PlayerTextDrawFont(p,RP_PDTD[p][n],1);
 PlayerTextDrawLetterSize(p,RP_PDTD[p][n],w,h);
 PlayerTextDrawColor(p,RP_PDTD[p][n],color);
 PlayerTextDrawAlignment(p,RP_PDTD[p][n],align);
 PlayerTextDrawSetProportional(p,RP_PDTD[p][n],true);
 PlayerTextDrawSetOutline(p,RP_PDTD[p][n],0);
 PlayerTextDrawSetShadow(p,RP_PDTD[p][n],0);
 PlayerTextDrawBackgroundColor(p,RP_PDTD[p][n],0x00000000);
 PlayerTextDrawSetSelectable(p,RP_PDTD[p][n],false);
 return n;
}
stock RP_PDRect(p,Float:x,Float:y,Float:w,Float:h,color) {
 new n=RP_PDText(p,x,y,"LD_SPAC:white");if(n<0) return n;
 PlayerTextDrawFont(p,RP_PDTD[p][n],4);
 PlayerTextDrawTextSize(p,RP_PDTD[p][n],w,h);
 PlayerTextDrawColor(p,RP_PDTD[p][n],color);return n;
}
stock RP_PDRow(p,Float:y,const label[],amount,color=-1) {
 new text[32];format(text,sizeof text,"$%s",Numeros(amount));
 RP_PDText(p,538.0,y,label,0.13,0.72,0xAFBBC5FF);
 RP_PDText(p,615.0,y,text,0.13,0.72,color,3);return 1;
}
stock RP_PDShow(p,pay,interest,cost,deposit,balance,experience) {
 if(!IsPlayerConnected(p) || IsPlayerNPC(p)) return 0;
 RP_PDHide(p);
 // 90 x 105 on the native 640 x 448 canvas (~270 x 253 at 1080p).
 RP_PDRect(p,532.0,112.0,90.0,105.0,0x080D12F2);
 RP_PDRect(p,532.0,112.0,90.0,0.8,RP_PD_RED);
 RP_PDText(p,538.0,117.0,"NEX~r~US",0.16,0.85);
 RP_PDText(p,615.0,118.0,"PAYDAY",0.105,0.65,0xAFBBC5FF,3);
 RP_PDRect(p,538.0,129.0,77.0,0.4,0x29333DFF);
 RP_PDText(p,538.0,134.0,"PAGO RECIBIDO",0.12,0.70);
 RP_PDRow(p,147.0,"Pago recibido",pay);
 RP_PDRow(p,158.0,"Intereses",interest);
 RP_PDRow(p,169.0,"Gastos",cost,RP_PD_RED);
 RP_PDRect(p,538.0,182.0,77.0,14.0,0x202A34FF);
 RP_PDText(p,541.0,186.0,deposit>=0?("Total depositado"):("Total descontado"),0.11,0.68,0xAFBBC5FF);
 new text[48];
 if(deposit>=0) format(text,sizeof text,"+$%s",Numeros(deposit));
 else format(text,sizeof text,"-$%s",Numeros(-deposit));
 RP_PDText(p,612.0,184.0,text,0.15,0.95,RP_PD_RED,3);
 RP_PDRect(p,538.0,202.0,77.0,0.4,0x29333DFF);
 format(text,sizeof text,"Banco: $%s",Numeros(balance));
 RP_PDText(p,538.0,207.0,text,0.105,0.65,0xAFBBC5FF);
 format(text,sizeof text,"+%d EXP",experience);
 RP_PDText(p,615.0,207.0,text,0.105,0.65,RP_PD_RED,3);
 for(new i;i<RP_PDCount[p];i++) if(RP_PDTD[p][i]==PlayerText:INVALID_TEXT_DRAW) {RP_PDHide(p);return 0;}
 for(new i;i<RP_PDCount[p];i++) PlayerTextDrawShow(p,RP_PDTD[p][i]);
 RP_PDTimer[p]=SetTimerEx("RP_PDExpire",10000,false,"i",p);return 1;
}
forward RP_PDExpire(p);
public RP_PDExpire(p) {return RP_PDHide(p);}
hook OnPlayerConnect(playerid) {RP_PDCount[playerid]=0;RP_PDTimer[playerid]=0;return 1;}
hook OnPlayerDisconnect(playerid,reason) {RP_PDHide(playerid);return 1;}
hook OnPlayerDeath(playerid,killerid,reason) {RP_PDHide(playerid);return 1;}
