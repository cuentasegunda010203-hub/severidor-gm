// Compact contract: 178.5 x 174 in SA-MP's 640 x 448 reference space.
// Buttons, commands and a native dialog share the same validated purchase path.
#define RP_BUY_TD_MAX (32)
#define RP_BUY_WIDTH_SCALE (0.85)
new PlayerText:RP_BuyTD[MAX_PLAYERS][RP_BUY_TD_MAX];
new RP_BuyCount[MAX_PLAYERS], RP_BuyAccept[MAX_PLAYERS], RP_BuyReject[MAX_PLAYERS];
new bool:RP_BuyVisible[MAX_PLAYERS];
new RP_BuyTimer[MAX_PLAYERS];

stock RP_BuyHide(p,bool:selection=true) {
    new bool:was=RP_BuyVisible[p]; RP_BuyVisible[p]=false;
    if(RP_BuyTimer[p]) { KillTimer(RP_BuyTimer[p]); RP_BuyTimer[p]=0; }
    for(new n;n<RP_BuyCount[p];n++) if(RP_BuyTD[p][n]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(p,RP_BuyTD[p][n]);
    RP_BuyCount[p]=0;
    if(was && selection) CancelSelectTextDraw(p);
    return 1;
}
stock RP_BuyText(p,Float:x,Float:y,const text[],Float:size=0.16,Float:height=0.85,color=-1,align=1) {
    if(RP_BuyCount[p]>=RP_BUY_TD_MAX) return -1;
    new n=RP_BuyCount[p]++;
    RP_BuyTD[p][n]=CreatePlayerTextDraw(p,320.0+(x-320.0)*RP_BUY_WIDTH_SCALE,y,text);
    if(RP_BuyTD[p][n]==PlayerText:INVALID_TEXT_DRAW) return -1;
    PlayerTextDrawFont(p,RP_BuyTD[p][n],1); PlayerTextDrawLetterSize(p,RP_BuyTD[p][n],size*RP_BUY_WIDTH_SCALE,height);
    PlayerTextDrawColor(p,RP_BuyTD[p][n],color); PlayerTextDrawAlignment(p,RP_BuyTD[p][n],align);
    PlayerTextDrawSetProportional(p,RP_BuyTD[p][n],true); PlayerTextDrawSetShadow(p,RP_BuyTD[p][n],0);
    PlayerTextDrawSetOutline(p,RP_BuyTD[p][n],0); PlayerTextDrawBackgroundColor(p,RP_BuyTD[p][n],0x00000000);
    PlayerTextDrawSetSelectable(p,RP_BuyTD[p][n],false); return n;
}
stock RP_BuyRect(p,Float:x,Float:y,Float:w,Float:h,color,bool:click=false) {
    new n=RP_BuyText(p,x,y,"LD_SPAC:white"); if(n<0) return -1;
    PlayerTextDrawFont(p,RP_BuyTD[p][n],4); PlayerTextDrawTextSize(p,RP_BuyTD[p][n],w*RP_BUY_WIDTH_SCALE,h);
    PlayerTextDrawColor(p,RP_BuyTD[p][n],color); PlayerTextDrawSetSelectable(p,RP_BuyTD[p][n],click); return n;
}
stock RP_BuyShow(p) {
    RP_EcoHide(p);
    RP_BuyHide(p);
    new text[100],coin[16],name[64],t=RP_Quote[p][bqType],i=RP_Quote[p][bqIndex];
    RP_BizCurrencyName(RP_Quote[p][bqCurrency],coin,sizeof coin);
    if(t==RP_BIZ_PUBLIC) format(name,sizeof name,"%s",RP_Public[i][pbName]);
    else RP_BizTypeName(t,name,sizeof name);
    // Bound dynamic names to keep the right-aligned row inside the compact panel.
    if(strlen(name)>24) { name[21]='.'; name[22]='.'; name[23]='.'; name[24]=EOS; }
    RP_BuyRect(p,215.0,137.0,210.0,174.0,0x101216F5);
    RP_BuyRect(p,215.0,137.0,210.0,3.0,0xED2546FF);
    RP_BuyText(p,227.0,150.0,"NEXUS - CONTRATO DE COMPRA",0.14,0.75,0xED2546FF);
    RP_BuyText(p,227.0,164.0,"Adquisicion de negocio",0.23,1.15);
    RP_BuyText(p,227.0,186.0,"Local",0.15,0.8,0xB8C8DBFF);
    format(text,sizeof text,"#%d - %s",RP_Quote[p][bqDB],name); RP_BuyText(p,413.0,186.0,text,0.15,0.8,-1,3);
    RP_BuyRect(p,227.0,198.0,186.0,0.5,0x30343BFF);
    RP_BuyText(p,227.0,204.0,"Vendedor",0.15,0.8,0xB8C8DBFF); RP_BuyText(p,413.0,204.0,"Servidor",0.15,0.8,-1,3);
    RP_BuyRect(p,227.0,216.0,186.0,0.5,0x30343BFF);
    RP_BuyText(p,227.0,222.0,"Moneda",0.15,0.8,0xB8C8DBFF); RP_BuyText(p,413.0,222.0,coin,0.15,0.8,-1,3);
    RP_BuyRect(p,227.0,234.0,186.0,0.5,0x30343BFF);
    format(text,sizeof text,"%d ~r~%s",RP_Quote[p][bqPrice],coin); RP_BuyText(p,413.0,238.0,text,0.25,1.35,-1,3);
    RP_BuyText(p,227.0,256.0,"Al confirmar pasa a tu nombre y se",0.14,0.75,0xB8C8DBFF);
    RP_BuyText(p,227.0,265.0,"descuenta el precio indicado.",0.14,0.75,0xB8C8DBFF);
    RP_BuyAccept[p]=RP_BuyRect(p,227.0,278.0,91.0,20.0,0xED2546FF,true);
    RP_BuyReject[p]=RP_BuyRect(p,323.0,278.0,90.0,20.0,0x30343BFF,true);
    RP_BuyText(p,272.5,284.0,"CONFIRMAR COMPRA",0.13,0.75,-1,2);
    RP_BuyText(p,368.0,284.0,"RECHAZAR",0.14,0.75,-1,2);
    RP_BuyText(p,227.0,302.0,"Oferta valida durante 60 segundos.",0.12,0.65,0xB8C8DBFF);
    if(RP_BuyAccept[p]<0 || RP_BuyReject[p]<0) { RP_BuyHide(p,false); return RP_BuyDialog(p); }
    for(new n;n<RP_BuyCount[p];n++) if(RP_BuyTD[p][n]==PlayerText:INVALID_TEXT_DRAW) { RP_BuyHide(p,false); return RP_BuyDialog(p); }
    RP_BuyVisible[p]=true;
    for(new n;n<RP_BuyCount[p];n++) PlayerTextDrawShow(p,RP_BuyTD[p][n]);
    SelectTextDraw(p,0xFF8A9CFF);
    RP_BuyTimer[p]=SetTimerEx("RP_BuyExpire",61000,false,"ddd",p,RP_BizSession[p],RP_Quote[p][bqGeneration]);
    SendClientMessage(p,-1,"Compra: pulsa Confirmar/Rechazar o usa /confirmarnegocio y /cancelarcompranegocio. /comprarnegocio menu abre el dialogo.");
    return 1;
}
stock RP_BuyDialog(p) {
    if(RP_Quote[p][bqProcessing]) return SendClientMessage(p,-1,"Espera a que termine la compra pendiente.");
    if(!RP_InitialCheck(p)) { RP_BuyHide(p); return SendClientMessage(p,-1,"No tienes una compra vigente; usa /comprarnegocio junto al local."); }
    RP_BuyHide(p);
    new text[300],coin[16],name[24]; RP_BizCurrencyName(RP_Quote[p][bqCurrency],coin,sizeof coin); RP_BizTypeName(RP_Quote[p][bqType],name,sizeof name);
    format(text,sizeof text,"Adquisicion de %s #%d\nVendedor: Servidor\nPrecio total: %d %s\n\nAl confirmar pasa a tu nombre y se descuenta el precio indicado.\nTiempo restante: %d segundos.",name,RP_Quote[p][bqDB],RP_Quote[p][bqPrice],coin,RP_Quote[p][bqExpiry]-gettime());
    return ShowPlayerDialog(p,RP_PUBLIC_BUY,DIALOG_STYLE_MSGBOX,"Contrato de compra",text,"Confirmar","Rechazar");
}
stock RP_BuyConfirm(p) {
    if(RP_Quote[p][bqProcessing]) return SendClientMessage(p,-1,"Espera a que termine la compra pendiente.");
    if(!RP_InitialCheck(p)) { RP_BuyHide(p); RP_Quote[p][bqExpiry]=0; return SendClientMessage(p,-1,"La compra ya no cumple los requisitos o la oferta vencio."); }
    RP_BuyHide(p); RP_Quote[p][bqProcessing]=true;
    mysql_tquery(handle_db,"SELECT 1","RP_InitialCommit","ddd",p,RP_BizSession[p],RP_Quote[p][bqGeneration]); return 1;
}
stock RP_BuyCancel(p,bool:selection=true) {
    RP_BuyHide(p,selection);
    if(!RP_Quote[p][bqProcessing]) { RP_Quote[p][bqGeneration]++; RP_Quote[p][bqExpiry]=0; }
    return 1;
}
stock RP_BuyClick(p,PlayerText:td) {
    if(!RP_BuyVisible[p]) return 0;
    if(td==RP_BuyTD[p][RP_BuyAccept[p]]) { RP_BuyConfirm(p); return 1; }
    if(td==RP_BuyTD[p][RP_BuyReject[p]]) { RP_BuyCancel(p); return 1; }
    return 0;
}
stock RP_BuyEscape(p) { if(!RP_BuyVisible[p]) return 0; RP_BuyCancel(p,false); return 1; }
forward RP_BuyExpire(p,session,generation);
public RP_BuyExpire(p,session,generation) {
    if(!IsPlayerConnected(p) || RP_BizSession[p]!=session || RP_Quote[p][bqGeneration]!=generation) return 1;
    RP_BuyTimer[p]=0;
    if(!RP_Quote[p][bqProcessing]) { RP_BuyCancel(p); SendClientMessage(p,-1,"La oferta de compra vencio. Usa /comprarnegocio para revisarla de nuevo."); }
    return 1;
}
CMD:confirmarnegocio(playerid,params[]) { if(!RP_BizLive(playerid)) return 1; return RP_BuyConfirm(playerid); }
CMD:cancelarcompranegocio(playerid,params[]) { if(!RP_BizLive(playerid)) return 1; return RP_BuyCancel(playerid); }
hook OnPlayerDeath(playerid,killerid,reason) { RP_BuyCancel(playerid); return 1; }
