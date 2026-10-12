// Business resale, inventory and cashbox. GZ=Moneda, Coins=Totems, cash=Money.
#include <YSI_Coding\y_hooks>
#include "modulos/negocios_datos.p"
#define RP_BIZ_SALE_DIALOG (31001)
#define RP_BIZ_HELP_MENU (31003)
#define RP_BIZ_HELP_PAGE (31004)
#define RP_BIZ_MAX_PRICE (1000000000)
enum { RP_BIZ_PROPERTY = 1, RP_BIZ_GAS, RP_BIZ_PARKING, RP_BIZ_MARKET, RP_BIZ_FACTORY };
enum RP_BizOfferData {
    boSeller, boSellerAccount, boBuyerAccount, boType, boIndex,
    boPrice, boCurrency, boExpires, boGeneration, bool:boProcessing
};
new RP_BizOffer[MAX_PLAYERS][RP_BizOfferData];
new RP_BizSession[MAX_PLAYERS];
new bool:RP_BizReady;
stock RP_BizHelp(playerid) {
    return ShowPlayerDialog(playerid,RP_BIZ_HELP_MENU,DIALOG_STYLE_LIST,"Ayuda - Negocios",
        "1. Tus negocios y monedas\n2. Vender y comprar paso a paso\n3. Requisitos y seguridad de la venta\n4. Invertir y reponer productos\n5. Caja, ganancias y guardado\n6. Comprar locales publicos",
        "Leer","Cerrar");
}
stock RP_BizHelpPage(playerid,page) {
    new text[2200],title[64];
    switch(page) {
        case 0: {
            format(title,sizeof title,"Negocios - Tus negocios y monedas");
            strcat(text,"{FFFFFF}Puedes vender negocios a otros jugadores y administrar existencias y retirar ingresos.\n\n");
            strcat(text,"{DBED15}/misnegocios{FFFFFF} muestra los tipos y los ID de los negocios que puedes administrar.\nUsa el ID del negocio que aparece ahi; no es el ID de un jugador.\n\n");
            strcat(text,"Tipos: {DBED15}negocio, gasolinera, estacionamiento, mercado, fabrica{FFFFFF}.\nRestaurantes y tiendas usan el tipo negocio. Mercados y fabricas pertenecen a bandas.\n\n");
            strcat(text,"Puedes elegir una moneda por venta:\n{00CC00}dinero{FFFFFF}: efectivo del personaje.\n{00CC00}gz{FFFFFF}: moneda GZ del servidor.\n{00CC00}coins{FFFFFF}: saldo Coins, separado del saldo GZ.\n\nNo se mezclan ni se convierten las monedas automaticamente.");
        }
        case 1: {
            format(title,sizeof title,"Negocios - Vender y comprar");
            strcat(text,"{FFFFFF}1. Consulta {DBED15}/misnegocios{FFFFFF} y elige el negocio.\n2. Reunete con el comprador en el negocio o junto a su entrada.\n3. Acuerden el precio y la moneda.\n4. Envia la oferta con:\n\n");
            strcat(text,"{DBED15}/vendernegocio [tipo] [ID negocio] [ID jugador] [precio] [moneda]{FFFFFF}\n\n");
            strcat(text,"Ejemplos (el jugador comprador tiene ID 8):\n{00CC00}/vendernegocio negocio 42 8 150000 dinero\n/vendernegocio gasolinera 12 8 80 gz\n/vendernegocio estacionamiento 6 8 100 coins{FFFFFF}\n\n");
            strcat(text,"5. El comprador revisa el negocio, precio y moneda en el dialogo.\nAl pulsar Comprar se efectua el pago y se cambia el propietario.\nRechazar cierra la oferta sin realizar la compra.\n\n");
            strcat(text,"La oferta vence en {DBED15}60 segundos{FFFFFF}.\nUsa {DBED15}/cancelarnegocio{FFFFFF} para cancelar tus ofertas enviadas o recibidas.\nEl negocio incluye sus existencias, mejoras, ganancias.");
        }
        case 2: {
            format(title,sizeof title,"Negocios - Requisitos de venta");
            strcat(text,"{FFFFFF}El vendedor debe ser el propietario y tener {DBED15}nivel 6 y 2 horas de juego{FFFFFF}.\nEl precio debe estar entre 1 y 1.000.000.000 de la moneda elegida.\n\n");
            strcat(text,"Ambos jugadores deben estar conectados, en el mismo mundo e interior,\na menos de {DBED15}5 metros{FFFFFF} entre si y junto al negocio o dentro de el.\nEl comprador debe tener el saldo completo y cumplir el nivel y limite de propiedades.\n\n");
            strcat(text,"Restaurantes y tiendas ocupan un espacio de propiedades del comprador.\nEstacionamientos mantienen el limite de 2 y su nivel requerido.\nLas gasolineras mantienen su nivel requerido.\n\n");
            strcat(text,"Mercados y fabricas: deben negociar los lideres de dos bandas criminales distintas.\nLa banda compradora no puede tener otro mercado o fabrica del mismo tipo.\n\n");
            strcat(text,"Si alguien se desconecta, la oferta se cancela. Al confirmar se revisan\nde nuevo el propietario, los saldos y los requisitos. Si falla el guardado\nde la operacion, se revierte la venta y el pago.");
        }
        case 3: {
            format(title,sizeof title,"Negocios - Inversion y existencias");
            strcat(text,"Abre {DBED15}/negocio [tipo] [ID]{FFFFFF} en tu local.\nTambien puedes usar /negocio dentro de tu local.\nEn el TextDraw pulsa PRODUCTOS / INVERTIR.\nElige un producto, revisa su costo por unidad e ingresa la cantidad.\nConfirma el costo total: se descuenta de tu efectivo, no de GZ ni Coins.\n\nCada compra consume una unidad del producto o pack vendido.\nSi se agota, el negocio no vende ese producto hasta que inviertas otra vez.\nUn local nuevo comienza sin productos; no recibe existencias gratis.\nLas existencias actuales de restaurantes se conservan al migrar.\n\nLas opciones de invertir y retirar abren dialogos compatibles con Android y PC.\nGasolineras y mercados mantienen sus recursos y abastecimiento originales.\nNo hay empleados NPC contratables.");
        }
        case 4: {
            format(title,sizeof title,"Negocios - Caja y retiros");
            strcat(text,"Cada venta de productos del local agrega el pago a su caja.\nNo se entrega automaticamente al propietario.\nAbre /negocio y pulsa RETIRAR DINERO.\nEscribe la cantidad o TODO para retirar la caja completa; luego confirma.\nSolo el propietario puede retirar y debe estar en el negocio.\n\nLa caja contiene ingresos por ventas; recuerda descontar lo invertido\npara calcular tu beneficio real. Reponer mercancia no aumenta la caja.\nLas ventas se registran aunque el propietario este desconectado.\n\nExistencias, caja, inversiones y retiros se guardan en MySQL.\nAl vender el negocio sus existencias y caja pasan al comprador.\nGasolineras, mercados y fabricas conservan sus cajas originales,\naccesibles desde GESTION ORIGINAL cuando corresponde.");
        }
        case 5: {
            format(title,sizeof title,"Negocios - Locales publicos");
            strcat(text,"{FFFFFF}Las tiendas, pizzerias, bares, ropa, ferreterias y sex shops registrados\npueden tener propietario. En su puerta veras {00CC00}EN VENTA{FFFFFF}, precio e ID.\nLos locales originales comienzan a {DBED15}35 Coins{FFFFFF}. La administracion puede cambiarlo.\n\n");
            strcat(text,"Acercate a menos de 3 metros de la entrada y usa:\n{DBED15}/comprarnegocio local [ID]{FFFFFF}\nTambien puedes usar {DBED15}/comprarnegocio{FFFFFF} junto a la puerta.\nRevisa el contrato pequeno: precio y moneda; pulsa Confirmar compra.\nAlternativas: /confirmarnegocio y /cancelarcompranegocio.\nUsa /comprarnegocio menu para confirmar mediante dialogo.\nSi no tienes saldo o alguien lo compro antes, no se efectua el pago.\n\n");
            strcat(text,"{DBED15}/infonegocio local [ID]{FFFFFF} muestra su informacion.\nUsa {DBED15}/entrar{FFFFFF} y {DBED15}/salir{FFFFFF} para acceder al interior.\nPara revenderlo o administrar existencias usa el tipo {DBED15}local{FFFFFF}, por ejemplo:\n/vendernegocio local 1 8 50 coins\n/negocio local 1\n\n");
            strcat(text,"Los locales usan su propio registro y no ocupan un espacio de casas.\nPropietario, ubicacion y precio se recuperan al reiniciar el servidor.\nEl precio inicial no fija el precio de una reventa entre jugadores.");
        }
        default: return RP_BizHelp(playerid);
    }
    return ShowPlayerDialog(playerid,RP_BIZ_HELP_PAGE,DIALOG_STYLE_MSGBOX,title,text,"Volver","Cerrar");
}

stock RP_BizHasOwner(type,index) {
    if(!RP_BizValid(type,index)) return 0;
    switch(type) {
        case RP_BIZ_PUBLIC: return RP_Public[index][pbOwner]>0;
        case RP_BIZ_PROPERTY: return PropInfo[index][pIDPropietario]>0 && !PropInfo[index][pEnVenta];
        case RP_BIZ_GAS: return Gasolineras[index][gDuenoID]>0;
        case RP_BIZ_PARKING: return Estacionamientos[index][Dueno]>0;
        case RP_BIZ_MARKET: return InfoMercado[index][mBandaID]>1 && !InfoMercado[index][mEnVenta];
        case RP_BIZ_FACTORY: return FABRICAS_INFO[index][f_FACCION_ID]>1 && FABRICAS_INFO[index][f_VENTA]==1;
    }
    return 0;
}
stock RP_BizFriendly(playerid,type,index) {
    if(!RP_BizLive(playerid) || !RP_BizValid(type,index)) return 0;
    if(type==RP_BIZ_FACTORY) return PLAYER_INFO[playerid][pFaccion]>1 && PLAYER_INFO[playerid][pFaccion]==FABRICAS_INFO[index][f_FACCION_ID];
    if(type==RP_BIZ_MARKET) return PLAYER_INFO[playerid][pFaccion]>1 && PLAYER_INFO[playerid][pFaccion]==InfoMercado[index][mBandaID];
    return RP_BizOwned(playerid,type,index);
}

stock RP_BizLive(playerid) {
    return playerid >= 0 && playerid < MAX_PLAYERS && IsPlayerConnected(playerid)
        && !IsPlayerNPC(playerid) && JugadorLogeado[playerid] && PLAYER_INFO[playerid][pID] > 0;
}
stock RP_BizType(const value[]) {
    if(!strcmp(value,"local",true) || !strcmp(value,"comercio",true) || !strcmp(value,"24/7",true)) return RP_BIZ_PUBLIC;
    if (!strcmp(value,"negocio",true) || !strcmp(value,"propiedad",true) || !strcmp(value,"restaurante",true) || !strcmp(value,"tienda",true)) return RP_BIZ_PROPERTY;
    if (!strcmp(value,"gasolinera",true)) return RP_BIZ_GAS;
    if (!strcmp(value,"estacionamiento",true)) return RP_BIZ_PARKING;
    if (!strcmp(value,"mercado",true)) return 0;
    if (!strcmp(value,"fabrica",true)) return RP_BIZ_FACTORY;
    return 0;
}
stock RP_BizCurrency(const value[]) {
    if (!strcmp(value,"dinero",true)) return 0;
    if (!strcmp(value,"gz",true)) return 1;
    if (!strcmp(value,"coins",true)) return 2;
    return -1;
}
stock RP_BizCurrencyName(currency, dest[], size) {
    switch(currency) { case 0: format(dest,size,"dinero"); case 1: format(dest,size,"GZ"); case 2: format(dest,size,"Coins"); }
}
stock RP_BizTypeName(type, dest[], size) {
    switch(type) {
        case RP_BIZ_PUBLIC: format(dest,size,"local");
        case RP_BIZ_PROPERTY: format(dest,size,"negocio");
        case RP_BIZ_GAS: format(dest,size,"gasolinera");
        case RP_BIZ_PARKING: format(dest,size,"estacionamiento");
        case RP_BIZ_MARKET: format(dest,size,"mercado");
        case RP_BIZ_FACTORY: format(dest,size,"fabrica");
    }
}
stock RP_BizBalance(playerid, currency) {
    switch(currency) { case 0: return PLAYER_INFO[playerid][jDinero]; case 1: return PLAYER_INFO[playerid][Moneda]; case 2: return PLAYER_INFO[playerid][Totems]; }
    return 0;
}
stock RP_BizChangeBalance(playerid, currency, delta) {
    switch(currency) {
        case 0: { if (delta < 0) QuitarDinero(playerid,-delta); else DarDinero(playerid,delta); }
        case 1: PLAYER_INFO[playerid][Moneda] += delta;
        case 2: PLAYER_INFO[playerid][Totems] += delta;
    }
}
stock RP_BizValid(type, index) {
    switch(type) {
        case RP_BIZ_PUBLIC: return index>=0 && index<RP_PUBLIC_MAX && RP_Public[index][pbID]>0 && RP_Public[index][pbActive];
        case RP_BIZ_PROPERTY: return index >= 0 && index < MAX_PROPIEDADES && PropInfo[index][pID] > 0 && PropInfo[index][pEnUso] && PropInfo[index][pTipo] >= 2 && PropInfo[index][pTipo] <= 4;
        case RP_BIZ_GAS: return index >= 0 && index < MAX_GASOLINERAS && Gasolineras[index][gaID] > 0 && Gasolineras[index][gEnUso];
        case RP_BIZ_PARKING: return index >= 0 && index < MAX_GARAGES && Estacionamientos[index][eEnUso];
        case RP_BIZ_MARKET: return 0; // Mercado fijo RB; no es un negocio comprable.
        case RP_BIZ_FACTORY: return index > 0 && index < MAX_FABRICAS && FABRICAS_INFO[index][f_VALID];
    }
    return 0;
}
stock RP_BizDB(type, index) {
    switch(type) {
        case RP_BIZ_PUBLIC: return RP_Public[index][pbID];
        case RP_BIZ_PROPERTY: return PropInfo[index][pID];
        case RP_BIZ_GAS: return Gasolineras[index][gaID];
        case RP_BIZ_PARKING: return index;
        case RP_BIZ_MARKET: return InfoMercado[index][mID];
        case RP_BIZ_FACTORY: return FABRICAS_INFO[index][f_DBID];
    }
    return 0;
}
stock RP_BizFind(type, dbid) {
    new limit;
    switch(type) { case RP_BIZ_PROPERTY: limit=MAX_PROPIEDADES; case RP_BIZ_GAS: limit=MAX_GASOLINERAS; case RP_BIZ_PARKING: limit=MAX_GARAGES; case RP_BIZ_MARKET: limit=MAX_MERCADOS; case RP_BIZ_FACTORY: limit=MAX_FABRICAS; case RP_BIZ_PUBLIC: limit=RP_PUBLIC_MAX; }
    for(new i; i<limit; i++) if(RP_BizValid(type,i) && RP_BizDB(type,i)==dbid) return i;
    return -1;
}
stock RP_BizOwned(playerid, type, index) {
    if (!RP_BizLive(playerid) || !RP_BizValid(type,index)) return 0;
    switch(type) {
        case RP_BIZ_PUBLIC: return RP_Public[index][pbOwner]==PLAYER_INFO[playerid][pID];
        case RP_BIZ_PROPERTY: return PropInfo[index][pIDPropietario]==PLAYER_INFO[playerid][pID] && !PropInfo[index][pEnVenta];
        case RP_BIZ_GAS: return Gasolineras[index][gDuenoID]==PLAYER_INFO[playerid][pID];
        case RP_BIZ_PARKING: return Estacionamientos[index][Dueno]==PLAYER_INFO[playerid][pID];
        case RP_BIZ_MARKET: return PLAYER_INFO[playerid][pFaccion]>1 && PLAYER_INFO[playerid][pRango]==8 && InfoMercado[index][mBandaID]==PLAYER_INFO[playerid][pFaccion] && !InfoMercado[index][mEnVenta];
        case RP_BIZ_FACTORY: return PLAYER_INFO[playerid][pFaccion]>1 && PLAYER_INFO[playerid][pRango]==8 && FABRICAS_INFO[index][f_FACCION_ID]==PLAYER_INFO[playerid][pFaccion] && FABRICAS_INFO[index][f_VENTA]==1;
    }
    return 0;
}
stock RP_BizPosition(type,index,&Float:x,&Float:y,&Float:z) {
    switch(type) {
        case RP_BIZ_PUBLIC: { x=RP_Public[index][pbX]; y=RP_Public[index][pbY]; z=RP_Public[index][pbZ]; }
        case RP_BIZ_PROPERTY: { x=PropInfo[index][pPosX]; y=PropInfo[index][pPosY]; z=PropInfo[index][pPosZ]; }
        case RP_BIZ_GAS: { x=Gasolineras[index][Posss][0]; y=Gasolineras[index][Posss][1]; z=Gasolineras[index][Posss][2]; }
        case RP_BIZ_PARKING: { x=Estacionamientos[index][PosX]; y=Estacionamientos[index][PosY]; z=Estacionamientos[index][PosZ]; }
        case RP_BIZ_MARKET: { x=InfoMercado[index][mX]; y=InfoMercado[index][mY]; z=InfoMercado[index][mZ]; }
        case RP_BIZ_FACTORY: { x=FABRICAS_INFO[index][f_POS][0]; y=FABRICAS_INFO[index][f_POS][1]; z=FABRICAS_INFO[index][f_POS][2]; }
    }
}
stock RP_BizNear(playerid,type,index) {
    if(!RP_BizValid(type,index)) return 0;
    if(type==RP_BIZ_PUBLIC && GetPlayerVirtualWorld(playerid)==RP_Public[index][pbWorld] && GetPlayerInterior(playerid)==RP_Public[index][pbInterior] && RP_Public[index][pbInterior]>0) return 1;
    if(type==RP_BIZ_PROPERTY && GetPlayerVirtualWorld(playerid)==PropInfo[index][pVW] && GetPlayerInterior(playerid)==PropInfo[index][pInteriorID]) return 1;
    if(GetPlayerVirtualWorld(playerid)!=0 || GetPlayerInterior(playerid)!=0) return 0;
    new Float:x,Float:y,Float:z; RP_BizPosition(type,index,x,y,z);
    return IsPlayerInRangeOfPoint(playerid,15.0,x,y,z);
}
stock RP_BizVipLimit(p) {
    if(PLAYER_INFO[p][pVip]==3) return 6;
    if(PLAYER_INFO[p][pVip]>=2) return 4;
    return PLAYER_INFO[p][pVip]==1?2:1;
}
stock RP_BizPersonalCount(p) {
    new count;
    new types[]={RP_BIZ_PROPERTY,RP_BIZ_GAS,RP_BIZ_PARKING,RP_BIZ_PUBLIC};
    for(new k;k<sizeof types;k++) for(new i,lim=RP_BizLimit(types[k]);i<lim;i++) if(RP_BizOwned(p,types[k],i)) count++;
    return count;
}
stock RP_BizVipCanBuy(p,t) {
    if(t!=RP_BIZ_PROPERTY && t!=RP_BIZ_GAS && t!=RP_BIZ_PARKING && t!=RP_BIZ_PUBLIC) return 1;
    new limit=RP_BizVipLimit(p),count=RP_BizPersonalCount(p);
    if(count>=limit) return SendClientMessageEx(p,-1,"Limite de negocios: %d/%d. Sin VIP: 1; VIP 1: 2; VIP 2: 4; VIP 3 (GVIP): 6.",count,limit),0;
    return 1;
}
stock RP_BizLegacyVipCheck(p,const kind[],i=-1) {
    new t=RP_BizType(kind);
    if(t==RP_BIZ_PROPERTY && !RP_BizValid(t,i)) return 1;
    return RP_BizVipCanBuy(p,t);
}
stock RP_BizVipHelp(p) {
    new text[500];
    format(text,sizeof text,"Limite de negocios personales:\n\nSin VIP: 1 negocio.\nVIP 1: hasta 2 negocios.\nVIP 2: hasta 4 negocios.\nVIP 3 (GVIP): hasta 6 negocios.\n\nTienes %d negocios; tu limite actual es %d.\nSe suman locales, negocios, gasolineras y estacionamientos.\nLas casas y los negocios de bandas tienen sus requisitos propios.\nEl limite se revisa al comprar al servidor o a otro jugador.\nSi cambia tu VIP, conservas tus negocios, pero no puedes superar el limite con nuevas compras.",RP_BizPersonalCount(p),RP_BizVipLimit(p));
    return dialogs_ShowPlayerDialog(p,RP_BIZ_HELP_PAGE,DIALOG_STYLE_MSGBOX,"VIP - Negocios",text,"Cerrar","");
}
stock RP_BizCanBuy(playerid,type,index,seller) {
    if(!RP_BizVipCanBuy(playerid,type)) return 0;
    if(RP_BizOwned(playerid,type,index)) return SendClientMessage(playerid,-1,"Ese negocio ya es tuyo."),0;
    switch(type) {
        case RP_BIZ_PROPERTY: {
            if(SlotPropiedad(playerid)<0) return SendClientMessage(playerid,-1,"Alcanzaste tu limite de propiedades."),0;
            if(PLAYER_INFO[playerid][@Nivel]<PropInfo[index][pNivel]) return SendClientMessage(playerid,-1,"No tienes el nivel requerido por el negocio."),0;
            new ownedslot=-1;
            for(new k;k<MAX_PCASAS;k++) if(PLAYER_INFO[seller][CasaID][k]==PropInfo[index][pID]) ownedslot=k;
            if(ownedslot<0) return SendClientMessage(playerid,-1,"La propiedad no figura en la cuenta del vendedor."),0;
        }
        case RP_BIZ_GAS: if(PLAYER_INFO[playerid][@Nivel]<Gasolineras[index][gNivel]) return SendClientMessage(playerid,-1,"No tienes el nivel requerido por la gasolinera."),0;
        case RP_BIZ_PARKING: if(ObtenerEstacionamientos(playerid)>=2 || PLAYER_INFO[playerid][@Nivel]<Estacionamientos[index][Nivel]) return SendClientMessage(playerid,-1,"No cumples el nivel o el limite de estacionamientos."),0;
        case RP_BIZ_MARKET,RP_BIZ_FACTORY: {
            if(PLAYER_INFO[playerid][pFaccion]<=1 || PLAYER_INFO[playerid][pRango]!=8 || PLAYER_INFO[playerid][pFaccion]==PLAYER_INFO[seller][pFaccion]) return SendClientMessage(playerid,-1,"Debe comprar el lider de otra banda criminal."),0;
            if(type==RP_BIZ_FACTORY && TieneFabrica(PLAYER_INFO[playerid][pFaccion])) return SendClientMessage(playerid,-1,"Tu banda ya tiene una fabrica."),0;
            if(type==RP_BIZ_MARKET) for(new m=1;m<MAX_MERCADOS;m++) if(RP_BizValid(type,m) && InfoMercado[m][mBandaID]==PLAYER_INFO[playerid][pFaccion] && !InfoMercado[m][mEnVenta]) return SendClientMessage(playerid,-1,"Tu banda ya tiene un mercado."),0;
        }
    }
    return 1;
}
stock RP_BizSQL(const query[], bool:mustChange=false) {
    new Cache:result=mysql_query(handle_db,query,true);
    new bool:ok=mysql_errno(handle_db)==0;
    if(ok && mustChange) ok=cache_affected_rows()==1;
    if(result!=MYSQL_INVALID_CACHE) cache_delete(result);
    return ok;
}
stock RP_BizClearOffer(playerid) {
    RP_BizOffer[playerid][boGeneration]++;
    RP_BizOffer[playerid][boExpires]=0;
    RP_BizOffer[playerid][boProcessing]=false;
    return 1;
}
stock RP_BizCheckOffer(buyer) {
    new seller=RP_BizOffer[buyer][boSeller],type=RP_BizOffer[buyer][boType],index=RP_BizOffer[buyer][boIndex];
    if(!RP_BizLive(buyer) || !RP_BizLive(seller) || PLAYER_INFO[buyer][pID]!=RP_BizOffer[buyer][boBuyerAccount] || PLAYER_INFO[seller][pID]!=RP_BizOffer[buyer][boSellerAccount]) return 0;
    if(gettime()>RP_BizOffer[buyer][boExpires] || !RP_BizOwned(seller,type,index)) return 0;
    new Float:x,Float:y,Float:z; GetPlayerPos(seller,x,y,z);
    if(GetPlayerVirtualWorld(seller)!=GetPlayerVirtualWorld(buyer) || GetPlayerInterior(seller)!=GetPlayerInterior(buyer) || !IsPlayerInRangeOfPoint(buyer,5.0,x,y,z)) return 0;
    if(!RP_BizNear(seller,type,index) || !RP_BizNear(buyer,type,index)) return 0;
    new currency=RP_BizOffer[buyer][boCurrency],price=RP_BizOffer[buyer][boPrice];
    if(price<=0 || RP_BizBalance(buyer,currency)<price || RP_BizBalance(seller,currency)>2147483647-price) return 0;
    return RP_BizCanBuy(buyer,type,index,seller);
}
forward RP_BizCommit(buyer,session,generation);
public RP_BizCommit(buyer,session,generation) {
    if(RP_BizSession[buyer]!=session || RP_BizOffer[buyer][boGeneration]!=generation || !RP_BizOffer[buyer][boProcessing]) return 1;
    if(!RP_BizCheckOffer(buyer)) return RP_BizClearOffer(buyer),SendClientMessage(buyer,-1,"La oferta vencio o ya no se cumplen los requisitos de compra.");
    new seller=RP_BizOffer[buyer][boSeller],type=RP_BizOffer[buyer][boType],index=RP_BizOffer[buyer][boIndex];
    new price=RP_BizOffer[buyer][boPrice],currency=RP_BizOffer[buyer][boCurrency],db=RP_BizDB(type,index);
    new buyerSlot=-1,sellerSlot=-1,query[1024],bool:ok;
    if(type==RP_BIZ_PROPERTY) {
        buyerSlot=SlotPropiedad(buyer);
        for(new k;k<MAX_PCASAS;k++) if(PLAYER_INFO[seller][CasaID][k]==db) sellerSlot=k;
    }
    if(!RP_BizSQL("START TRANSACTION")) return RP_BizClearOffer(buyer),SendClientMessage(buyer,-1,"No se pudo iniciar la venta.");
    switch(type) {
        case RP_BIZ_PUBLIC: mysql_format(handle_db,query,sizeof query,"UPDATE rp_public_businesses SET owner=%d,owner_name='%e' WHERE id=%d AND owner=%d AND active=1",PLAYER_INFO[buyer][pID],PLAYER_INFO[buyer][Nickname],db,PLAYER_INFO[seller][pID]);
        case RP_BIZ_PROPERTY: mysql_format(handle_db,query,sizeof query,"UPDATE propiedades SET IDPropietario=%d,Propietario='%e',EnVenta=0 WHERE ID=%d AND IDPropietario=%d AND EnVenta=0",PLAYER_INFO[buyer][pID],PLAYER_INFO[buyer][Nickname],db,PLAYER_INFO[seller][pID]);
        case RP_BIZ_GAS: mysql_format(handle_db,query,sizeof query,"UPDATE gasolineras SET DuenoID=%d,Nombre='%e' WHERE ID=%d AND DuenoID=%d",PLAYER_INFO[buyer][pID],PLAYER_INFO[buyer][Nickname],db,PLAYER_INFO[seller][pID]);
        case RP_BIZ_PARKING: mysql_format(handle_db,query,sizeof query,"UPDATE estacionamientos SET Propietario=%d WHERE ID=%d AND Propietario=%d",PLAYER_INFO[buyer][pID],db,PLAYER_INFO[seller][pID]);
        case RP_BIZ_MARKET: mysql_format(handle_db,query,sizeof query,"UPDATE mercados SET DuenoID=%d,DuenoN='%e',BandaID=%d,BandaN='%e' WHERE ID=%d AND BandaID=%d AND EnVenta=0",PLAYER_INFO[buyer][pID],PLAYER_INFO[buyer][Nickname],PLAYER_INFO[buyer][pFaccion],BandasInfo[PLAYER_INFO[buyer][pFaccion]][BNombre],db,PLAYER_INFO[seller][pFaccion]);
        case RP_BIZ_FACTORY: mysql_format(handle_db,query,sizeof query,"UPDATE fabricas SET BandaID=%d WHERE ID=%d AND BandaID=%d AND EnVenta=1",PLAYER_INFO[buyer][pFaccion],db,PLAYER_INFO[seller][pFaccion]);
    }
    ok=RP_BizSQL(query,true);
    for(new who;who<2 && ok;who++) {
        new p=who?seller:buyer,delta=who?price:-price;
        new cash=PLAYER_INFO[p][jDinero],gz=PLAYER_INFO[p][Moneda],coins=PLAYER_INFO[p][Totems];
        switch(currency) { case 0: cash+=delta; case 1: gz+=delta; case 2: coins+=delta; }
        if(type==RP_BIZ_PROPERTY) mysql_format(handle_db,query,sizeof query,"UPDATE usuarios SET Money=%d,Moneda=%d,totems=%d,CasaID%d=%d WHERE ID=%d",cash,gz,coins,(who?sellerSlot:buyerSlot)+1,who?0:db,PLAYER_INFO[p][pID]);
        else mysql_format(handle_db,query,sizeof query,"UPDATE usuarios SET Money=%d,Moneda=%d,totems=%d WHERE ID=%d",cash,gz,coins,PLAYER_INFO[p][pID]);
        ok=RP_BizSQL(query,true);
    }
    if(ok) {
        mysql_format(handle_db,query,sizeof query,"INSERT INTO rp_business_sales (business_type,business_id,seller_id,buyer_id,price,currency) VALUES (%d,%d,%d,%d,%d,%d)",type,db,PLAYER_INFO[seller][pID],PLAYER_INFO[buyer][pID],price,currency);
        ok=RP_BizSQL(query);
    }
    if(!ok || !RP_BizSQL("COMMIT")) {
        RP_BizSQL("ROLLBACK"); RP_BizClearOffer(buyer);
        return SendClientMessage(buyer,-1,"La venta no se completo. No se transfirio el negocio ni se cobro.");
    }
    RP_BizChangeBalance(buyer,currency,-price); RP_BizChangeBalance(seller,currency,price);
    switch(type) {
        case RP_BIZ_PUBLIC: { RP_Public[index][pbOwner]=PLAYER_INFO[buyer][pID]; format(RP_Public[index][pbOwnerName],25,"%s",PLAYER_INFO[buyer][Nickname]); RP_PublicRefresh(index); }
        case RP_BIZ_PROPERTY: {
            PLAYER_INFO[buyer][CasaID][buyerSlot]=db; PLAYER_INFO[seller][CasaID][sellerSlot]=0;
            PropInfo[index][pIDPropietario]=PLAYER_INFO[buyer][pID];
            format(PropInfo[index][pPropietario],40,"%s",PLAYER_INFO[buyer][Nickname]);
            BorrarLabelCasa(index); CargarPropiedad(index);
            if(PropInfo[index][pTipo]==3) RevisarLogro(buyer,11);
        }
        case RP_BIZ_GAS: { Gasolineras[index][gDuenoID]=PLAYER_INFO[buyer][pID]; format(Gasolineras[index][gaNombre],MAX_PLAYER_NAME+1,"%s",PLAYER_INFO[buyer][Nickname]); CargarGasolinera(index); }
        case RP_BIZ_PARKING: { Estacionamientos[index][Dueno]=PLAYER_INFO[buyer][pID]; format(Estacionamientos[index][DuenoName],MAX_PLAYER_NAME,"%s",PLAYER_INFO[buyer][Nickname]); CargarParking(index); }
        case RP_BIZ_MARKET: {
            InfoMercado[index][mDuenoID]=PLAYER_INFO[buyer][pID]; InfoMercado[index][mBandaID]=PLAYER_INFO[buyer][pFaccion];
            format(InfoMercado[index][mDuenoN],40,"%s",PLAYER_INFO[buyer][Nickname]);
            format(InfoMercado[index][mBandaN],80,"%s",BandasInfo[PLAYER_INFO[buyer][pFaccion]][BNombre]); CargarMerca(index);
        }
        case RP_BIZ_FACTORY: { RP_BizRemoveFactoryGuards(index); FABRICAS_INFO[index][f_FACCION_ID]=PLAYER_INFO[buyer][pFaccion]; CargarFabrica(index); }
    }
    new moneyName[16],typeName[24]; RP_BizCurrencyName(currency,moneyName,sizeof moneyName); RP_BizTypeName(type,typeName,sizeof typeName);
    SendClientMessageEx(buyer,-1,"Compraste %s #%d a %s por %d %s.",typeName,db,PLAYER_INFO[seller][Nickname],price,moneyName);
    SendClientMessageEx(seller,-1,"Vendiste %s #%d a %s por %d %s.",typeName,db,PLAYER_INFO[buyer][Nickname],price,moneyName);
    // Invalidate competing offers; inventory and cashbox belong to the business.
    for(new p;p<MAX_PLAYERS;p++) if(RP_BizOffer[p][boExpires] && RP_BizOffer[p][boType]==type && RP_BizOffer[p][boIndex]==index) RP_BizClearOffer(p);
    return 1;
}
stock RP_BizRemoveFactoryGuards(index) {
    for(new s;s<5;s++) {
        new npc=FABRICAS_INFO[index][GE_FABRICA][s];
        if(npc>0 && npc<MAX_PLAYERS && RP_FactoryOwner[npc]==index) { RP_FactoryOwner[npc]=0; if(FCNPC_IsValid(npc)) FCNPC_Destroy(npc); }
        FABRICAS_INFO[index][GE_FABRICA][s]=0;
    }
}
CMD:vendernegocio(playerid,params[]) {
    if(!RP_BizLive(playerid)) return 1;
    if(!RP_BizReady) return SendClientMessage(playerid,-1,"El sistema de negocios no esta disponible. Revisa la migracion SQL.");
    new textType[24],textCurrency[16],db,buyer,price;
    if(sscanf(params,"s[24]ddds[16]",textType,db,buyer,price,textCurrency)) return SendClientMessage(playerid,-1,"Uso: /vendernegocio [negocio/gasolinera/estacionamiento/mercado/fabrica] [ID negocio] [ID jugador] [precio] [dinero/gz/coins]");
    new type=RP_BizType(textType),currency=RP_BizCurrency(textCurrency),index=RP_BizFind(type,db);
    if(!type || currency<0 || price<=0 || price>RP_BIZ_MAX_PRICE) return SendClientMessage(playerid,-1,"Tipo, moneda o precio invalido. Precio: 1 a 1000000000.");
    if(index<0 || !RP_BizOwned(playerid,type,index)) return SendClientMessage(playerid,-1,"No eres propietario de ese negocio; en bandas debe vender el lider.");
    if(!RP_BizLive(buyer) || buyer==playerid) return SendClientMessage(playerid,-1,"Selecciona otro jugador conectado.");
    if(PLAYER_INFO[playerid][@Nivel]<6 || PLAYER_INFO[playerid][horasjugadas]<2) return SendClientMessage(playerid,-1,"Para vender necesitas nivel 6 y 2 horas de juego.");
    if(RP_BizOffer[buyer][boExpires]>=gettime()) return SendClientMessage(playerid,-1,"Ese jugador ya tiene una oferta de negocio pendiente.");
    RP_BizClearOffer(buyer);
    RP_BizOffer[buyer][boSeller]=playerid; RP_BizOffer[buyer][boSellerAccount]=PLAYER_INFO[playerid][pID]; RP_BizOffer[buyer][boBuyerAccount]=PLAYER_INFO[buyer][pID];
    RP_BizOffer[buyer][boType]=type; RP_BizOffer[buyer][boIndex]=index; RP_BizOffer[buyer][boPrice]=price; RP_BizOffer[buyer][boCurrency]=currency; RP_BizOffer[buyer][boExpires]=gettime()+60;
    if(!RP_BizCheckOffer(buyer)) return RP_BizClearOffer(buyer),SendClientMessage(playerid,-1,"Ambos deben estar junto al negocio y a menos de 5 metros; el comprador debe cumplir los requisitos y tener saldo.");
    new dialog[512],moneyName[16],typeName[24]; RP_BizCurrencyName(currency,moneyName,sizeof moneyName); RP_BizTypeName(type,typeName,sizeof typeName);
    format(dialog,sizeof dialog,"%s te ofrece %s #%d.\n\nPrecio: %d %s\nIncluye existencias, mejoras y el dinero disponible en la caja.\n\nLa oferta vence en 60 segundos.\nAcepta para transferir el negocio y efectuar el pago.",PLAYER_INFO[playerid][Nickname],typeName,db,price,moneyName);
    ShowPlayerDialog(buyer,RP_BIZ_SALE_DIALOG,DIALOG_STYLE_MSGBOX,"Compra de negocio",dialog,"Comprar","Rechazar");
    return SendClientMessage(playerid,-1,"Oferta enviada. El comprador debe confirmar la compra.");
}
CMD:cancelarnegocio(playerid) {
    for(new p;p<MAX_PLAYERS;p++) if(RP_BizOffer[p][boExpires] && (p==playerid || RP_BizOffer[p][boSeller]==playerid)) {
        RP_BizClearOffer(p); if(RP_BizLive(p)) SendClientMessage(p,-1,"La oferta de negocio fue cancelada.");
    }
    return 1;
}
CMD:misnegocios(playerid) {
    if(!RP_BizLive(playerid)) return 1;
    new name[24],count;
    SendClientMessageEx(playerid,-1,"Negocios personales: %d/%d segun tu VIP.",RP_BizPersonalCount(playerid),RP_BizVipLimit(playerid));
    SendClientMessage(playerid,-1,"Tus negocios (usa este tipo e ID en /vendernegocio y /negocio):");
    for(new type=1;type<=RP_BIZ_PUBLIC;type++) {
        new limit;
        switch(type) { case RP_BIZ_PROPERTY: limit=MAX_PROPIEDADES; case RP_BIZ_GAS: limit=MAX_GASOLINERAS; case RP_BIZ_PARKING: limit=MAX_GARAGES; case RP_BIZ_MARKET: limit=MAX_MERCADOS; case RP_BIZ_FACTORY: limit=MAX_FABRICAS; case RP_BIZ_PUBLIC: limit=RP_PUBLIC_MAX; }
        RP_BizTypeName(type,name,sizeof name);
        for(new i;i<limit;i++) if(RP_BizOwned(playerid,type,i)) { SendClientMessageEx(playerid,-1,"%s #%d",name,RP_BizDB(type,i)); count++; }
    }
    if(!count) SendClientMessage(playerid,-1,"No tienes negocios; mercados y fabricas aparecen para el lider de su banda.");
    return 1;
}

hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
    if(dialogid==RP_BIZ_HELP_MENU) { if(response) RP_BizHelpPage(playerid,listitem); return 1; }
    if(dialogid==RP_BIZ_HELP_PAGE) { if(response) RP_BizHelp(playerid); return 1; }
    if(dialogid==RP_BIZ_SALE_DIALOG) {
        if(!response) { new seller=RP_BizOffer[playerid][boSeller]; RP_BizClearOffer(playerid); if(RP_BizLive(seller)) SendClientMessage(seller,-1,"El comprador rechazo la oferta de negocio."); return 1; }
        if(RP_BizOffer[playerid][boProcessing] || !RP_BizCheckOffer(playerid)) return RP_BizClearOffer(playerid),SendClientMessage(playerid,-1,"La oferta vencio o no cumples los requisitos de compra.");
        RP_BizOffer[playerid][boProcessing]=true;
        mysql_tquery(handle_db,"SELECT 1","RP_BizCommit","ddd",playerid,RP_BizSession[playerid],RP_BizOffer[playerid][boGeneration]); return 1;
    }
    return 1;
}
hook OnPlayerConnect(playerid) { RP_BizSession[playerid]++; RP_BizClearOffer(playerid); return 1; }
hook OnPlayerDisconnect(playerid,reason) {
    RP_BizSession[playerid]++; RP_BizClearOffer(playerid);
    for(new p;p<MAX_PLAYERS;p++) if(RP_BizOffer[p][boExpires] && RP_BizOffer[p][boSeller]==playerid) RP_BizClearOffer(p);
    return 1;
}
stock RP_BizInit() {
    RP_BizReady=false;
    // Existing MyISAM accounts/properties must support rollback before any sale is enabled.
    new tables[][]={"usuarios","propiedades","gasolineras","estacionamientos","mercados","fabricas"},query[512];
    for(new i;i<sizeof tables;i++) {
        mysql_format(handle_db,query,sizeof query,"SELECT ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='%e'",tables[i]);
        new Cache:result=mysql_query(handle_db,query,true),rows; cache_get_row_count(rows);
        new engine[16]; if(rows) cache_get_value_name(0,"ENGINE",engine,sizeof engine); if(result!=MYSQL_INVALID_CACHE) cache_delete(result);
        if(!rows) return printf("[Negocios] Falta tabla %s; ventas deshabilitadas.",tables[i]);
        if(strcmp(engine,"InnoDB",true)) {
            mysql_format(handle_db,query,sizeof query,"ALTER TABLE `%s` ENGINE=InnoDB",tables[i]);
            if(!RP_BizSQL(query)) return printf("[Negocios] No se pudo migrar %s a InnoDB; ventas deshabilitadas.",tables[i]);
        }
    }
    if(!RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_business_sales (id INT AUTO_INCREMENT PRIMARY KEY,business_type INT NOT NULL,business_id INT NOT NULL,seller_id INT NOT NULL,buyer_id INT NOT NULL,price INT NOT NULL,currency INT NOT NULL,created TIMESTAMP DEFAULT CURRENT_TIMESTAMP) ENGINE=InnoDB")) return 0;
    if(!RP_PublicInit()) return 0;
    if(!RP_EcoInit()) return 0;
    RP_BizReady=true;
    printf("[Negocios] Ventas con dinero/GZ/Coins, existencias y caja habilitadas. NPC retirados."); return 1;
}
#include "modulos/negocios_publicos.p"
#include "modulos/negocios_economia.p"
hook OnGameModeExit() { RP_BizReady=false; for(new p;p<MAX_PLAYERS;p++) RP_EcoHide(p,false); return 1; }

stock RP_BizRefreshFactory(ID) {return RP_BizRefreshConfigured(RP_BIZ_FACTORY,ID);}
