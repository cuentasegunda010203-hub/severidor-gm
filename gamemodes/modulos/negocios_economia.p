#include <YSI_Coding\y_hooks>
new Text3D:RP_EcoCashLabel[RP_PUBLIC_MAX];
// Saved position: comprar productos nueva, interior 10.
stock RP_EcoCashRefresh(i) {
    if(IsValidDynamic3DTextLabel(RP_EcoCashLabel[i])) DestroyDynamic3DTextLabel(RP_EcoCashLabel[i]);
    RP_EcoCashLabel[i]=Text3D:INVALID_STREAMER_ID;
    if(!RP_Public[i][pbActive] || RP_Public[i][pbKind]!=1 || RP_Public[i][pbInterior]!=10) return 1;
    RP_EcoCashLabel[i]=CreateDynamic3DTextLabel("{37DB3F}COMPRAR PRODUCTOS\n{FFFFFF}Pulsar [ F ] Para Entrar.\n/comprar productos",-1,-29.9737,-185.0800,1008.2300,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,RP_Public[i][pbWorld],10);
    return 1;
}
stock RP_EcoCashInteract(p) {
    if(!RP_BizReady || !RP_BizLive(p) || GetPlayerState(p)!=PLAYER_STATE_ONFOOT || PLAYER_TEMP[p][VariableCaido]) return 0;
    if(GetPlayerInterior(p)!=10 || !IsPlayerInRangeOfPoint(p,2.5,-29.9737,-185.0800,1007.7300)) return 0;
    new t,i; if(!RP_EcoContext(p,t,i) || RP_EcoKind(t,i)!=1) return 0;
    return RP_EcoProducts(p,"productos");
}
// Persistent inventory and cashbox. No hired NPCs are used by this module.
#define RP_ECO_MENU (31007)
#define RP_ECO_STOCK (31008)
#define RP_ECO_AMOUNT (31009)
#define RP_ECO_WITHDRAW (31010)
#define RP_ECO_PRODUCTS (31011)
#define RP_ECO_CONFIRM (31012)
#define RP_ECO_MAX_STOCK (10000)
#define RP_ECO_MAX_CASH (1000000000)
enum RP_EcoProduct { epKind, epDialog, epRow, epName[48], epPrice, epCost };
new const RP_EcoCatalog[][RP_EcoProduct] = {
    {1,PRODUCTOS,0,"Telefono movil",1500,750},
    {1,PRODUCTOS,1,"Guia telefonica",35,18},
    {1,PRODUCTOS,2,"Traba para vehiculo",0,1000},
    {1,PRODUCTOS,3,"Alarma para vehiculo",0,2500},
    {1,PRODUCTOS,4,"Radio comunicador",2000,1000},
    {1,PRODUCTOS,5,"GPS",1500,750},
    {1,PRODUCTOS,6,"Pack de cerveza x6",470,235},
    {1,PRODUCTOS,7,"Pack de vino x6",590,295},
    {1,PRODUCTOS,8,"Pack de Sprunk x4",200,100},
    {1,PRODUCTOS,9,"Parlante",150,75},
    {1,PRODUCTOS,10,"Vaso de Sprunk",65,33},
    {2,DIALOG_PIZZA,0,"Porcion de pizza",40,20},
    {2,DIALOG_PIZZA,1,"Pizza completa para llevar",300,150},
    {2,DIALOG_PIZZA,2,"Vaso de Sprunk",65,33},
    {2,DIALOG_PIZZA,3,"Aquarius",170,85},
    {3,0,0,"Conjuntos de ropa (codigo)",0,250},
    {4,DIALOG_SALON,0,"Vino",110,55},
    {4,DIALOG_SALON,1,"Cerveza",80,40},
    {4,DIALOG_SALON,2,"Vaso de Sprunk",65,33},
    {4,DIALOG_SALON,3,"Aquarius",170,85},
    {5,HERRAMIENTAS,0,"Martillo",20,10},
    {5,HERRAMIENTAS,1,"Destornillador",25,13},
    {5,HERRAMIENTAS,2,"Barreta",60,30},
    {5,HERRAMIENTAS,3,"Balde",120,60},
    {6,JUGUETES,0,"Vibrador blanco",1000,500},
    {6,JUGUETES,1,"Vibrador plateado",1200,600},
    {6,JUGUETES,2,"Gran vibrador blanco",1600,800},
    {6,JUGUETES,3,"Consolador rosa",2500,1250},
    {7,PRODUCTOS2,0,"Cerveza",80,40},
    {7,PRODUCTOS2,1,"Vino",100,50},
    {7,PRODUCTOS2,2,"Vaso de Sprunk",65,33},
    {7,PRODUCTOS2,3,"Aquarius",160,80},
    {7,PRODUCTOS2,4,"Porcion de pizza",120,60}
};
new RP_EcoType[MAX_PLAYERS], RP_EcoDB[MAX_PLAYERS], RP_EcoItem[MAX_PLAYERS];
new RP_EcoRows[MAX_PLAYERS][40], RP_EcoRowCount[MAX_PLAYERS];
new bool:RP_EcoBusy[MAX_PLAYERS], bool:RP_EcoExecuting[MAX_PLAYERS], bool:RP_EcoPaid[MAX_PLAYERS];
new RP_EcoSaleType[MAX_PLAYERS], RP_EcoSaleDB[MAX_PLAYERS], RP_EcoSaleOwner[MAX_PLAYERS];
new RP_EcoSaleItem[MAX_PLAYERS], RP_EcoSaleUnits[MAX_PLAYERS];
new RP_EcoTDCount[MAX_PLAYERS], PlayerText:RP_EcoTD[MAX_PLAYERS][30], bool:RP_EcoVisible[MAX_PLAYERS];
new RP_EcoButtons[MAX_PLAYERS][5];
new RP_EcoConfirmAction[MAX_PLAYERS], RP_EcoConfirmUnits[MAX_PLAYERS], RP_EcoConfirmOwner[MAX_PLAYERS], RP_EcoConfirmExpiry[MAX_PLAYERS];
new RP_EcoConfirmType[MAX_PLAYERS], RP_EcoConfirmDB[MAX_PLAYERS], RP_EcoConfirmItem[MAX_PLAYERS];
new const RP_EcoMarketFields[]={mPistolas,mDk,mM4,mEDC,mMari,mCrack,mPiezas,mSpray,mMascara};
new const RP_EcoMarketColumns[][]={"Pistolas","Dk","M4","EDC","Medis","Crack","Piezas","Spray","Mascaras"};
new const RP_EcoMarketNames[][]={"Pistola","Desert Eagle","M4","Escopeta de combate","Marihuana (gramo)","Crack (gramo)","Pieza de arma","Spray","Mascara"};
new const RP_EcoMarketCosts[]={750,6250,10750,23000,75,125,1250,25000,100000};

stock RP_EcoItemMeta(t,i,item,&cost,name[],size) {
    if(item>=0 && item<sizeof RP_EcoCatalog && RP_EcoCatalog[item][epKind]==RP_EcoKind(t,i)) { cost=RP_EcoCatalog[item][epCost]; format(name,size,"%s",RP_EcoCatalog[item][epName]); return 1; }
    if(t==RP_BIZ_GAS && item==100) { cost=5; format(name,size,"Combustible (litro)"); return 1; }
    if(t==RP_BIZ_MARKET && item>=110 && item<119) { cost=RP_EcoMarketCosts[item-110]; format(name,size,"%s",RP_EcoMarketNames[item-110]); return 1; }
    return 0;
}
stock RP_EcoItemQuantity(t,i,item) {
    if(t==RP_BIZ_GAS && item==100) return Gasolineras[i][gGasolina];
    if(t==RP_BIZ_MARKET && item>=110 && item<119) return InfoMercado[i][RP_EcoMarketFields[item-110]];
    return RP_EcoRead(t,RP_BizDB(t,i),item);
}
stock RP_EcoAddNativeSQL(t,i,item,units) {
    new q[500],value=RP_EcoItemQuantity(t,i,item)+units;
    if(t==RP_BIZ_GAS && item==100) mysql_format(handle_db,q,sizeof q,"UPDATE gasolineras SET Gasolina=%d WHERE ID=%d",value,RP_BizDB(t,i));
    else if(t==RP_BIZ_MARKET && item>=110 && item<119) mysql_format(handle_db,q,sizeof q,"UPDATE mercados SET `%s`=%d WHERE ID=%d",RP_EcoMarketColumns[item-110],value,RP_BizDB(t,i));
    else return 0;
    return RP_BizSQL(q);
}
stock RP_EcoAddNative(t,i,item,units) {
    if(t==RP_BIZ_GAS && item==100) { Gasolineras[i][gGasolina]+=units; CargarGasolinera(i); }
    if(t==RP_BIZ_MARKET && item>=110 && item<119) { InfoMercado[i][RP_EcoMarketFields[item-110]]+=units; CargarMerca(i); }
    return 1;
}

stock RP_EcoDelete(t,db) {
    new q[256]; mysql_format(handle_db,q,sizeof q,"DELETE FROM rp_business_stock WHERE business_type=%d AND business_id=%d",t,db); if(!RP_BizSQL(q)) return 0;
    mysql_format(handle_db,q,sizeof q,"DELETE FROM rp_business_cash WHERE business_type=%d AND business_id=%d",t,db); return RP_BizSQL(q);
}
stock RP_EcoLegacyCash(t,i) {
    switch(t) { case RP_BIZ_PROPERTY: return PropInfo[i][pGanancias]; case RP_BIZ_GAS: return Gasolineras[i][gGanancias]; case RP_BIZ_MARKET: return InfoMercado[i][mDinero]; case RP_BIZ_FACTORY: return FABRICAS_INFO[i][f_DINERO]; }
    return 0;
}
stock RP_EcoLegacySQL(t,i,amount) {
    new q[512],db=RP_BizDB(t,i),remaining=RP_EcoLegacyCash(t,i)-amount;
    if(amount<1) return 1;
    switch(t) {
        case RP_BIZ_PROPERTY: mysql_format(handle_db,q,sizeof q,"UPDATE propiedades SET Ganancias=%d WHERE ID=%d",remaining,db);
        case RP_BIZ_GAS: mysql_format(handle_db,q,sizeof q,"UPDATE gasolineras SET Ganancias=%d WHERE ID=%d",remaining,db);
        case RP_BIZ_MARKET: mysql_format(handle_db,q,sizeof q,"UPDATE mercados SET Dinero=%d WHERE ID=%d",remaining,db);
        case RP_BIZ_FACTORY: mysql_format(handle_db,q,sizeof q,"UPDATE fabricas SET DineroAlmacenado=%d WHERE ID=%d",remaining,db);
        default: return 0;
    }
    // An old treasury may not yet have been saved asynchronously; write its current amount.
    return RP_BizSQL(q);
}
stock RP_EcoLegacySet(t,i,amount) {
    switch(t) { case RP_BIZ_PROPERTY: PropInfo[i][pGanancias]-=amount; case RP_BIZ_GAS: Gasolineras[i][gGanancias]-=amount; case RP_BIZ_MARKET: InfoMercado[i][mDinero]-=amount; case RP_BIZ_FACTORY: FABRICAS_INFO[i][f_DINERO]-=amount; }
    return 1;
}
stock RP_EcoTotalCash(t,db) {
    new value=RP_EcoRead(t,db),i=RP_BizFind(t,db); if(value<0 || i<0) return -1;
    new old=RP_EcoLegacyCash(t,i); if(old<0) return -1;
    return old>RP_ECO_MAX_CASH-value?RP_ECO_MAX_CASH:value+old;
}

stock RP_EcoKind(t,i) {
    if(t==RP_BIZ_PUBLIC) return RP_Public[i][pbKind];
    if(t==RP_BIZ_PROPERTY) return PropInfo[i][pTipo]==3?7:1;
    return 0;
}
stock RP_EcoContext(p,&t,&i) {
    // World/interior are authoritative; RP_PublicInside is only a convenience hint.
    for(new n;n<RP_PUBLIC_MAX;n++) if(RP_BizValid(RP_BIZ_PUBLIC,n) && RP_Public[n][pbInterior]>0 && GetPlayerInterior(p)==RP_Public[n][pbInterior] && GetPlayerVirtualWorld(p)==RP_Public[n][pbWorld]) { t=RP_BIZ_PUBLIC; i=n; return 1; }
    for(new n;n<MAX_PROPIEDADES;n++) if(RP_BizValid(RP_BIZ_PROPERTY,n) && PropInfo[n][pInteriorID]>0 && GetPlayerVirtualWorld(p)==PropInfo[n][pVW] && GetPlayerInterior(p)==PropInfo[n][pInteriorID]) { t=RP_BIZ_PROPERTY; i=n; return 1; }
    return 0;
}
stock RP_EcoSaleContext(p,dialog,&t,&i) {
    if(dialog==MNEGRO || dialog==MMARI || dialog==MCRACK || dialog==MPIEZAS) {
        i=MercaID[p]; t=RP_BIZ_MARKET;
        return RP_BizValid(t,i) && InfoMercado[i][mAbierto] && GetPlayerInterior(p)==0 && GetPlayerVirtualWorld(p)==0 && RP_BizNear(p,t,i);
    }
    return RP_EcoContext(p,t,i);
}
stock RP_EcoManageHere(p,t,i) {
    if(t==RP_BIZ_PUBLIC) return RP_BizValid(t,i) && RP_Public[i][pbInterior]>0 && GetPlayerInterior(p)==RP_Public[i][pbInterior] && GetPlayerVirtualWorld(p)==RP_Public[i][pbWorld];
    if(t==RP_BIZ_PROPERTY) return RP_BizValid(t,i) && PropInfo[i][pInteriorID]>0 && GetPlayerInterior(p)==PropInfo[i][pInteriorID] && GetPlayerVirtualWorld(p)==PropInfo[i][pVW];
    return RP_BizNear(p,t,i);
}
stock RP_EcoOwnerCheck(p) {
    new i=RP_BizFind(RP_EcoType[p],RP_EcoDB[p]);
    return RP_BizReady && RP_BizLive(p) && i>=0 && RP_BizOwned(p,RP_EcoType[p],i) && RP_EcoManageHere(p,RP_EcoType[p],i);
}
stock RP_EcoInit() {
    new Cache:c=mysql_query(handle_db,"SELECT COUNT(*) AS n FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='gasolineras' AND COLUMN_NAME='Ganancias'",true),count;
    new err=mysql_errno(handle_db); if(cache_num_rows()) cache_get_value_name_int(0,"n",count); if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
    if(err || (!count && !RP_BizSQL("ALTER TABLE gasolineras ADD COLUMN Ganancias INT NOT NULL DEFAULT 0"))) return 0;
    if(!RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_business_cash (business_type INT NOT NULL,business_id INT NOT NULL,cash INT NOT NULL DEFAULT 0,PRIMARY KEY(business_type,business_id)) ENGINE=InnoDB")) return 0;
    if(!RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_business_stock (business_type INT NOT NULL,business_id INT NOT NULL,product INT NOT NULL,quantity INT NOT NULL DEFAULT 0,PRIMARY KEY(business_type,business_id,product)) ENGINE=InnoDB")) return 0;
    if(!RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_business_operations (id BIGINT AUTO_INCREMENT PRIMARY KEY,business_type INT NOT NULL,business_id INT NOT NULL,account_id INT NOT NULL,action VARCHAR(16) NOT NULL,product INT NOT NULL DEFAULT -1,quantity INT NOT NULL DEFAULT 0,amount INT NOT NULL,created TIMESTAMP DEFAULT CURRENT_TIMESTAMP) ENGINE=InnoDB")) return 0;
    return 1;
}
stock RP_EcoEnsure(t,i) {
    new db=RP_BizDB(t,i),q[512];
    mysql_format(handle_db,q,sizeof q,"INSERT IGNORE INTO rp_business_cash VALUES (%d,%d,0)",t,db); if(!RP_BizSQL(q)) return 0;
    new kind=RP_EcoKind(t,i);
    for(new k;k<sizeof RP_EcoCatalog;k++) if(RP_EcoCatalog[k][epKind]==kind) {
        new amount;
        // Migrate existing restaurant inventory once, without gifting new stock.
        if(t==RP_BIZ_PROPERTY && kind==7) switch(RP_EcoCatalog[k][epRow]) { case 0: amount=PropInfo[i][pCerveza]; case 1: amount=PropInfo[i][pVino]; case 2: amount=PropInfo[i][pSprunk]; case 3: amount=PropInfo[i][pAquarius]; case 4: amount=PropInfo[i][pPizzas]; }
        if(amount<0) amount=0; if(amount>RP_ECO_MAX_STOCK) amount=RP_ECO_MAX_STOCK;
        mysql_format(handle_db,q,sizeof q,"INSERT IGNORE INTO rp_business_stock VALUES (%d,%d,%d,%d)",t,db,k,amount); if(!RP_BizSQL(q)) return 0;
    }
    return 1;
}
stock RP_EcoRead(t,db,k=-1) {
    new q[256],value;
    if(k<0) mysql_format(handle_db,q,sizeof q,"SELECT cash AS value FROM rp_business_cash WHERE business_type=%d AND business_id=%d",t,db);
    else mysql_format(handle_db,q,sizeof q,"SELECT quantity AS value FROM rp_business_stock WHERE business_type=%d AND business_id=%d AND product=%d",t,db,k);
    new Cache:c=mysql_query(handle_db,q,true);
    new err=mysql_errno(handle_db); if(cache_num_rows()) cache_get_value_name_int(0,"value",value);
    if(c!=MYSQL_INVALID_CACHE) cache_delete(c); return err?-1:value;
}
stock RP_EcoLog(p,t,db,const action[],item,units,amount) {
    new q[512]; mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_business_operations (business_type,business_id,account_id,action,product,quantity,amount) VALUES (%d,%d,%d,'%e',%d,%d,%d)",t,db,PLAYER_INFO[p][pID],action,item,units,amount); return RP_BizSQL(q);
}
stock RP_EcoHide(p,bool:selection=true) {
    new bool:was=RP_EcoVisible[p]; RP_EcoVisible[p]=false;
    for(new k;k<RP_EcoTDCount[p];k++) if(RP_EcoTD[p][k]!=PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(p,RP_EcoTD[p][k]);
    RP_EcoTDCount[p]=0; if(was && selection) CancelSelectTextDraw(p); return 1;
}
stock RP_EcoText(p,Float:x,Float:y,const text[],Float:size=0.16,color=-1,align=1) {
    if(RP_EcoTDCount[p]>=30) return -1;
    new k=RP_EcoTDCount[p]++; RP_EcoTD[p][k]=CreatePlayerTextDraw(p,x,y,text);
    if(RP_EcoTD[p][k]==PlayerText:INVALID_TEXT_DRAW) return -1;
    PlayerTextDrawFont(p,RP_EcoTD[p][k],1); PlayerTextDrawLetterSize(p,RP_EcoTD[p][k],size,0.85); PlayerTextDrawColor(p,RP_EcoTD[p][k],color);
    PlayerTextDrawAlignment(p,RP_EcoTD[p][k],align); PlayerTextDrawSetProportional(p,RP_EcoTD[p][k],true); PlayerTextDrawSetShadow(p,RP_EcoTD[p][k],0); PlayerTextDrawSetOutline(p,RP_EcoTD[p][k],0);
    return k;
}
stock RP_EcoRect(p,Float:x,Float:y,Float:w,Float:h,color,bool:click=false) {
    new k=RP_EcoText(p,x,y,"LD_SPAC:white"); if(k<0) return k;
    PlayerTextDrawFont(p,RP_EcoTD[p][k],4); PlayerTextDrawTextSize(p,RP_EcoTD[p][k],w,h); PlayerTextDrawColor(p,RP_EcoTD[p][k],color); PlayerTextDrawSetSelectable(p,RP_EcoTD[p][k],click); return k;
}
stock RP_EcoShow(p,bool:dialog=false) {
    if(!RP_EcoOwnerCheck(p)) { RP_EcoHide(p); return SendClientMessage(p,-1,"Debes ser el propietario y estar dentro de tu negocio."); }
    new t=RP_EcoType[p],i=RP_BizFind(t,RP_EcoDB[p]);
    if(!RP_EcoEnsure(t,i)) return SendClientMessage(p,-1,"No se pudo consultar la caja del negocio.");
    new cash=RP_EcoTotalCash(t,RP_EcoDB[p]); if(cash<0) return 1;
    new text[512],name[24],quantity; RP_BizTypeName(t,name,sizeof name);
    for(new k;k<sizeof RP_EcoCatalog;k++) if(RP_EcoCatalog[k][epKind]==RP_EcoKind(t,i)) { new v=RP_EcoRead(t,RP_EcoDB[p],k); if(v>0) quantity+=v; }
    if(t==RP_BIZ_GAS) quantity=Gasolineras[i][gGasolina];
    if(t==RP_BIZ_MARKET) for(new k;k<sizeof RP_EcoMarketFields;k++) quantity+=InfoMercado[i][RP_EcoMarketFields[k]];
    RP_EcoHide(p); RP_BuyHide(p);
    if(dialog) {
        format(text,sizeof text,"Caja: $%d - Existencias: %d\nVer existencias / invertir en productos\nRetirar dinero de la caja\nVender negocio a otro jugador\nGestion del sistema original\nCerrar",cash,quantity);
        return dialogs_ShowPlayerDialog(p,RP_ECO_MENU,DIALOG_STYLE_LIST,"Menu del negocio",text,"Seleccionar","Cerrar");
    }
    RP_EcoRect(p,225.0,145.0,190.0,177.0,0x101216F5); RP_EcoRect(p,225.0,145.0,190.0,3.0,0xED2546FF);
    RP_EcoText(p,237.0,155.0,"NEXUS - MI NEGOCIO",0.15,0xED2546FF);
    format(text,sizeof text,"%s #%d",name,RP_EcoDB[p]); RP_EcoText(p,237.0,170.0,text,0.20);
    format(text,sizeof text,"Caja disponible: $%d",cash); RP_EcoText(p,237.0,190.0,text,0.17,0x72DD91FF);
    format(text,sizeof text,"Existencias: %d unidades",quantity); RP_EcoText(p,237.0,203.0,text,0.15,0xB8C8DBFF);
    new labels[][]={"PRODUCTOS / INVERTIR","RETIRAR DINERO","VENDER NEGOCIO","GESTION ORIGINAL","CERRAR"};
    for(new k;k<5;k++) { new Float:y=220.0+float(k)*19.0; RP_EcoButtons[p][k]=RP_EcoRect(p,237.0,y,166.0,16.0,k==0?0xED2546FF:0x30343BFF,true); RP_EcoText(p,320.0,y+4.0,labels[k],0.14,-1,2); }
    for(new k;k<RP_EcoTDCount[p];k++) if(RP_EcoTD[p][k]==PlayerText:INVALID_TEXT_DRAW) { RP_EcoHide(p,false); return RP_EcoShow(p,true); }
    RP_EcoVisible[p]=true; for(new k;k<RP_EcoTDCount[p];k++) PlayerTextDrawShow(p,RP_EcoTD[p][k]);
    SelectTextDraw(p,0xFF8A9CFF); return 1;
}
CMD:negocio(playerid,params[]) {
    if(!RP_BizLive(playerid) || !RP_BizReady) return 1;
    RP_EcoConfirmAction[playerid]=0;
    new t,i,db,name[24];
    if(!RP_EcoContext(playerid,t,i)) { RP_EcoHide(playerid); return SendClientMessage(playerid,-1,"Debes estar dentro de tu negocio para usar /negocio."); }
    if(params[0]) {
        if(sscanf(params,"s[24]d",name,db)) return SendClientMessage(playerid,-1,"Uso dentro de tu negocio: /negocio o /negocio [tipo] [ID].");
        if(RP_BizType(name)!=t || db!=RP_BizDB(t,i)) return SendClientMessage(playerid,-1,"Solo puedes administrar el negocio en el que estas dentro.");
    }
    if(!RP_BizOwned(playerid,t,i)) return SendClientMessage(playerid,-1,"Este negocio no te pertenece.");
    RP_EcoType[playerid]=t; RP_EcoDB[playerid]=RP_BizDB(t,i); return RP_EcoShow(playerid);
}
stock RP_EcoStockMenu(p) {
    if(!RP_EcoOwnerCheck(p)) return 1;
    RP_EcoHide(p); new t=RP_EcoType[p],i=RP_BizFind(t,RP_EcoDB[p]),kind=RP_EcoKind(t,i),text[3000],line[160];
    if(!kind && t!=RP_BIZ_GAS && t!=RP_BIZ_MARKET) return RP_EcoOriginal(p);
    if(!RP_EcoEnsure(t,i)) return 1;
    RP_EcoRowCount[p]=0; strcat(text,"Producto\tExistencias\tInversion/unidad\n");
    for(new k;k<sizeof RP_EcoCatalog;k++) if(RP_EcoCatalog[k][epKind]==kind) {
        RP_EcoRows[p][RP_EcoRowCount[p]++]=k;
        format(line,sizeof line,"%s\t%d\t$%d\n",RP_EcoCatalog[k][epName],RP_EcoRead(t,RP_EcoDB[p],k),RP_EcoCatalog[k][epCost]); strcat(text,line);
    }
    if(t==RP_BIZ_GAS || t==RP_BIZ_MARKET) for(new n;n<(t==RP_BIZ_GAS?1:9);n++) {
        new item=t==RP_BIZ_GAS?100:110+n,cost,name[48]; RP_EcoItemMeta(t,i,item,cost,name,sizeof name);
        RP_EcoRows[p][RP_EcoRowCount[p]++]=item;
        format(line,sizeof line,"%s\t%d\t$%d\n",name,RP_EcoItemQuantity(t,i,item),cost); strcat(text,line);
    }
    return dialogs_ShowPlayerDialog(p,RP_ECO_STOCK,DIALOG_STYLE_TABLIST_HEADERS,"Existencias - Selecciona para surtir",text,"Invertir","Volver");
}
stock RP_EcoOriginal(p) {
    RP_EcoHide(p); new t=RP_EcoType[p],i=RP_BizFind(t,RP_EcoDB[p]); if(!RP_EcoOwnerCheck(p)) return 1;
    switch(t) {
        case RP_BIZ_GAS: return callcmd::gasolinera(p);
        case RP_BIZ_MARKET: { MercaID[p]=i; return dialogs_ShowPlayerDialog(p,ADMINISTRARMERCADO,DIALOG_STYLE_LIST,"Mercado - Existencias y caja","Reponer productos\nDepositar dinero\nRetirar dinero\nVender mercado","Aceptar","Cerrar"); }
        default: return SendClientMessage(p,-1,"Consulta /ayuda negocios. Gasolineras, mercados y fabricas conservan su abastecimiento y produccion originales.");
    }
    return 1;
}
stock RP_EcoAction(p,action) {
    if(!RP_EcoOwnerCheck(p)) { RP_EcoHide(p); return 1; }
    switch(action) {
        case 0: return RP_EcoStockMenu(p);
        case 1: { RP_EcoHide(p); return dialogs_ShowPlayerDialog(p,RP_ECO_WITHDRAW,DIALOG_STYLE_INPUT,"Retirar dinero del negocio","Escribe la cantidad a retirar en efectivo.\nEscribe TODO para retirar toda la caja.\nSolo se retira dinero disponible; la inversion no es una ganancia.","Continuar","Volver"); }
        case 2: { RP_EcoHide(p); new name[24]; RP_BizTypeName(RP_EcoType[p],name,sizeof name); return SendClientMessageEx(p,-1,"Para vender: /vendernegocio %s %d [ID comprador] [precio] [dinero/gz/coins]. Existencias y caja pasan al comprador.",name,RP_EcoDB[p]); }
        case 3: return RP_EcoOriginal(p);
        default: return RP_EcoHide(p);
    }
    return 1;
}
stock RP_EcoClick(p,PlayerText:td) {
    if(!RP_EcoVisible[p]) return 0;
    for(new k;k<5;k++) if(RP_EcoButtons[p][k]>=0 && td==RP_EcoTD[p][RP_EcoButtons[p][k]]) { RP_EcoAction(p,k); return 1; }
    return 0;
}
stock RP_EcoEscape(p) { if(!RP_EcoVisible[p]) return 0; RP_EcoHide(p,false); return 1; }
stock RP_EcoNumber(const text[]) {
    if(!text[0] || strlen(text)>10) return -1;
    new value;
    for(new k;text[k];k++) { if(text[k]<'0' || text[k]>'9') return -1; new digit=text[k]-'0'; if(value>(2147483647-digit)/10) return -1; value=value*10+digit; }
    return value;
}
stock RP_EcoAsk(p,action,units) {
    if(!RP_EcoOwnerCheck(p) || RP_EcoBusy[p]) return SendClientMessage(p,-1,"Espera la operacion pendiente y permanece dentro de tu negocio.");
    new text[300],item=RP_EcoItem[p],i=RP_BizFind(RP_EcoType[p],RP_EcoDB[p]);
    if(action==1) {
        new unitcost,name[48]; if(!RP_EcoItemMeta(RP_EcoType[p],i,item,unitcost,name,sizeof name) || units<1 || units>RP_ECO_MAX_STOCK) return SendClientMessage(p,-1,"Ingresa una cantidad valida entre 1 y 10000.");
        new quantity=RP_EcoItemQuantity(RP_EcoType[p],i,item),cost=units*unitcost,limit=RP_ECO_MAX_STOCK;
        if(RP_EcoType[p]==RP_BIZ_GAS) limit=Gasolineras[i][gMaxGasolina];
        if(quantity<0 || quantity>limit-units || PLAYER_INFO[p][jDinero]<cost) return SendClientMessage(p,-1,"No tienes dinero suficiente o superas la capacidad de existencias.");
        format(text,sizeof text,"Invertir en %s\nCantidad: %d\nCosto total: $%d\n\nEl pago sale de tu efectivo y se agregan productos al negocio.\nNo se agrega este pago a la caja de ganancias.",name,units,cost);
    } else { if(units<1) return SendClientMessage(p,-1,"La caja no tiene ese dinero disponible."); format(text,sizeof text,"Retirar $%d de la caja del negocio a tu efectivo.\nConfirma el retiro.",units); }
    RP_EcoConfirmAction[p]=action; RP_EcoConfirmUnits[p]=units; RP_EcoConfirmOwner[p]=RP_BizOwnerKey(RP_EcoType[p],i); RP_EcoConfirmExpiry[p]=gettime()+60;
    RP_EcoConfirmType[p]=RP_EcoType[p]; RP_EcoConfirmDB[p]=RP_EcoDB[p]; RP_EcoConfirmItem[p]=item;
    return dialogs_ShowPlayerDialog(p,RP_ECO_CONFIRM,DIALOG_STYLE_MSGBOX,"Confirmar operacion",text,"Confirmar","Cancelar");
}
forward RP_EcoOwnerCommit(p,session,t,db,owner,action,item,units);
public RP_EcoOwnerCommit(p,session,t,db,owner,action,item,units) {
    if(p<0 || p>=MAX_PLAYERS || RP_BizSession[p]!=session) return 1;
    RP_EcoBusy[p]=false; new i=RP_BizFind(t,db);
    if(!RP_BizLive(p) || GetPlayerState(p)==PLAYER_STATE_WASTED || i<0 || !RP_BizOwned(p,t,i) || !RP_EcoManageHere(p,t,i) || RP_BizOwnerKey(t,i)!=owner || units<1) return SendClientMessage(p,-1,"Operacion cancelada: cambiaron el propietario o los requisitos.");
    if(!RP_EcoEnsure(t,i)) return 1;
    new amount=units,q[600],cash=PLAYER_INFO[p][jDinero],legacy,ledger;
    if(action==1) {
        new unitcost,name[48]; if(!RP_EcoItemMeta(t,i,item,unitcost,name,sizeof name) || units>RP_ECO_MAX_STOCK) return 1;
        amount=units*unitcost; if(cash<amount) return SendClientMessage(p,-1,"Saldo insuficiente para la inversion."); cash-=amount;
        new quantity=RP_EcoItemQuantity(t,i,item),limit=t==RP_BIZ_GAS?Gasolineras[i][gMaxGasolina]:RP_ECO_MAX_STOCK;
        if(quantity<0 || quantity>limit-units) return SendClientMessage(p,-1,"La reposicion supera la capacidad de existencias.");
    } else {
        if(amount>RP_ECO_MAX_CASH || cash>2147483647-amount) return SendClientMessage(p,-1,"El retiro supera el limite de tu efectivo.");
        ledger=RP_EcoRead(t,db); if(ledger<0) return 1;
        if(ledger<amount) legacy=amount-ledger;
        if(legacy>RP_EcoLegacyCash(t,i)) return SendClientMessage(p,-1,"La caja ya no tiene esa cantidad disponible.");
        cash+=amount;
    }
    if(!RP_BizSQL("START TRANSACTION")) return 1;
    if(action==1 && item<100) mysql_format(handle_db,q,sizeof q,"UPDATE rp_business_stock SET quantity=quantity+%d WHERE business_type=%d AND business_id=%d AND product=%d AND quantity<=%d",units,t,db,item,RP_ECO_MAX_STOCK-units);
    else mysql_format(handle_db,q,sizeof q,"UPDATE rp_business_cash SET cash=cash-%d WHERE business_type=%d AND business_id=%d AND cash>=%d",amount-legacy,t,db,amount-legacy);
    new bool:ok; if(action==1 && item>=100) ok=bool:RP_EcoAddNativeSQL(t,i,item,units); else ok=bool:RP_BizSQL(q,action==1 || amount>legacy);
    if(ok && legacy>0) ok=bool:RP_EcoLegacySQL(t,i,legacy);
    mysql_format(handle_db,q,sizeof q,"UPDATE usuarios SET Money=%d WHERE ID=%d",cash,PLAYER_INFO[p][pID]); if(ok) ok=bool:RP_BizSQL(q,true);
    if(ok) ok=bool:RP_EcoLog(p,t,db,action==1?"restock":"withdraw",item,action==1?units:0,amount);
    if(!ok || !RP_BizSQL("COMMIT")) { RP_BizSQL("ROLLBACK"); return SendClientMessage(p,-1,"No se completo la operacion; no se transfirio dinero ni productos."); }
    RP_BizChangeBalance(p,0,action==1?-amount:amount);
    if(legacy>0) RP_EcoLegacySet(t,i,legacy);
    if(action==1 && item>=100) RP_EcoAddNative(t,i,item,units);
    SendClientMessageEx(p,-1,action==1?"Inversion guardada: %d unidades, costo $%d.":"Retiro guardado: $%d. Caja restante: $%d.",action==1?units:amount,action==1?amount:RP_EcoTotalCash(t,db));
    if(RP_EcoType[p]==t && RP_EcoDB[p]==db) RP_EcoShow(p); return 1;
}
stock RP_EcoProductFor(dialog,row,kind) {
    if(dialog==MNEGRO) { if(row>=0 && row<4) return 110+row; if(row==7) return 117; if(row==8) return 118; return -1; }
    if(dialog==MMARI) return 114;
    if(dialog==MCRACK) return 115;
    if(dialog==MPIEZAS) return 116;
    if(dialog==TRABAV) return kind==1?2:-1;
    if(dialog==ALARMAV) return kind==1?3:-1;
    for(new k;k<sizeof RP_EcoCatalog;k++) if(RP_EcoCatalog[k][epKind]==kind && RP_EcoCatalog[k][epDialog]==dialog && RP_EcoCatalog[k][epRow]==row) return k;
    return -1;
}
stock RP_EcoCatalogDialog(dialog) { return dialog==PRODUCTOS || dialog==PRODUCTOS2 || dialog==DIALOG_PIZZA || dialog==DIALOG_SALON || dialog==HERRAMIENTAS || dialog==JUGUETES || dialog==TRABAV || dialog==ALARMAV || dialog==MNEGRO || dialog==MMARI || dialog==MCRACK || dialog==MPIEZAS; }
stock RP_EcoIntercept(p,dialog,response,row,const input[]) {
    if(!response || !RP_EcoCatalogDialog(dialog) || RP_EcoExecuting[p]) return 0;
    new t,i; if(!RP_EcoSaleContext(p,dialog,t,i)) {
        if(dialog==MNEGRO || dialog==MMARI || dialog==MCRACK || dialog==MPIEZAS) return SendClientMessage(p,-1,"Acercate al mercado para comprar."),1;
        return SendClientMessage(p,-1,"Debes estar dentro del negocio para comprar."),1;
    }
    if(!RP_BizReady) return SendClientMessage(p,-1,"El sistema de negocios no esta disponible."),1;
    if(dialog==MNEGRO && row>=4 && row<=6) return 0;
    if(dialog==MNEGRO && row==9) return ATM_BuyC4(p);
    if(dialog==MNEGRO && row==10) { if(!RP_BizOwned(p,t,i)) return 1; RP_EcoType[p]=t; RP_EcoDB[p]=RP_BizDB(t,i); RP_EcoShow(p); return 1; }
    new item=RP_EcoProductFor(dialog,row,RP_EcoKind(t,i)),units=1;
    if(item<0) return SendClientMessage(p,-1,"Ese producto no corresponde a este negocio."),1;
    if(dialog==PRODUCTOS && (row==2 || row==3)) return 0; // Vehicle chooser; charge occurs in its final dialog.
    if(!RP_BizHasOwner(t,i)) return 0;
    if(dialog==MMARI || dialog==MCRACK || dialog==MPIEZAS) { units=RP_EcoNumber(input); if(units<1 || units>RP_ECO_MAX_STOCK) return SendClientMessage(p,-1,"Cantidad invalida (1 a 10000)."),1; }
    if(RP_EcoBusy[p]) return SendClientMessage(p,-1,"Espera la compra u operacion pendiente."),1;
    RP_EcoBusy[p]=true; RP_EcoSaleType[p]=t; RP_EcoSaleDB[p]=RP_BizDB(t,i); RP_EcoSaleOwner[p]=RP_BizOwnerKey(t,i); RP_EcoSaleItem[p]=item; RP_EcoSaleUnits[p]=units;
    mysql_tquery(handle_db,"SELECT 1","RP_EcoReplay","dddds",p,RP_BizSession[p],dialog,row,input); return 1;
}
forward RP_EcoReplay(p,session,dialog,row,input[]);
public RP_EcoReplay(p,session,dialog,row,input[]) {
    if(p<0 || p>=MAX_PLAYERS || RP_BizSession[p]!=session) return 1;
    if(!RP_BizLive(p) || GetPlayerState(p)==PLAYER_STATE_WASTED) { RP_EcoBusy[p]=false; return 1; }
    new t,i;
    if(!RP_EcoSaleContext(p,dialog,t,i) || t!=RP_EcoSaleType[p] || RP_BizDB(t,i)!=RP_EcoSaleDB[p] || RP_BizOwnerKey(t,i)!=RP_EcoSaleOwner[p]) { RP_EcoBusy[p]=false; return SendClientMessage(p,-1,"Compra cancelada: saliste del negocio o cambio su propietario."); }
    RP_EcoExecuting[p]=true; RP_EcoPaid[p]=false;
    CallLocalFunction("OnDialogResponse","dddds",p,dialog,1,row,input);
    RP_EcoExecuting[p]=false; RP_EcoBusy[p]=false;
    if(RP_EcoPaid[p]) Actualizar(p); RP_EcoPaid[p]=false; return 1;
}
stock RP_EcoPay(p,price) {
    if(!RP_EcoExecuting[p]) return 1;
    if(RP_EcoPaid[p]) return 1;
    new t=RP_EcoSaleType[p],db=RP_EcoSaleDB[p],i=RP_BizFind(t,db),item=RP_EcoSaleItem[p],units=RP_EcoSaleUnits[p],q[700];
    if(i<0 || !RP_BizHasOwner(t,i) || RP_BizOwnerKey(t,i)!=RP_EcoSaleOwner[p] || price<1 || price>RP_ECO_MAX_CASH || PLAYER_INFO[p][jDinero]<price) return 0;
    if(item<100 && (TieneSprunk[p] || TieneVino[p] || TieneAquariu[p] || TieneCerveza[p])) return SendClientMessage(p,-1,"Termina la bebida antes de comprar."),0;
    if(!RP_EcoEnsure(t,i) || !RP_BizSQL("START TRANSACTION")) return 0;
    if(units<1 || units>RP_ECO_MAX_STOCK) { RP_BizSQL("ROLLBACK"); return 0; }
    if(t==RP_BIZ_GAS && item==100) {
        if(Gasolineras[i][gGasolina]<units) { RP_BizSQL("ROLLBACK"); return SendClientMessage(p,-1,"La gasolinera no tiene combustible."),0; }
        mysql_format(handle_db,q,sizeof q,"UPDATE gasolineras SET Gasolina=%d WHERE ID=%d",Gasolineras[i][gGasolina]-units,db);
    } else if(t==RP_BIZ_MARKET && item>=110 && item<119) {
        if(RP_EcoItemQuantity(t,i,item)<units) { RP_BizSQL("ROLLBACK"); SendClientMessage(p,-1,"No queda esa cantidad de productos en el mercado."); return 0; }
        mysql_format(handle_db,q,sizeof q,"UPDATE mercados SET `%s`=%d WHERE ID=%d",RP_EcoMarketColumns[item-110],RP_EcoItemQuantity(t,i,item)-units,db);
    } else mysql_format(handle_db,q,sizeof q,"UPDATE rp_business_stock SET quantity=quantity-%d WHERE business_type=%d AND business_id=%d AND product=%d AND quantity>=%d",units,t,db,item,units);
    new bool:ok=bool:RP_BizSQL(q,true);
    mysql_format(handle_db,q,sizeof q,"UPDATE rp_business_cash SET cash=cash+%d WHERE business_type=%d AND business_id=%d AND cash<=%d",price,t,db,RP_ECO_MAX_CASH-price); if(ok) ok=bool:RP_BizSQL(q,true);
    mysql_format(handle_db,q,sizeof q,"UPDATE usuarios SET Money=%d WHERE ID=%d",PLAYER_INFO[p][jDinero]-price,PLAYER_INFO[p][pID]); if(ok) ok=bool:RP_BizSQL(q,true);
    if(ok) ok=bool:RP_EcoLog(p,t,db,"sale",item,units,price);
    if(!ok || !RP_BizSQL("COMMIT")) { RP_BizSQL("ROLLBACK"); SendClientMessage(p,-1,"Producto agotado, caja llena o fallo al guardar. No se cobro; el propietario debe surtir el negocio."); return 0; }
    if(t==RP_BIZ_MARKET && item>=110 && item<119) InfoMercado[i][RP_EcoMarketFields[item-110]]-=units;
    if(t==RP_BIZ_GAS && item==100) { Gasolineras[i][gGasolina]-=units; CargarGasolinera(i); }
    RP_BizChangeBalance(p,0,-price); RP_EcoPaid[p]=true; return 1;
}
stock RP_EcoLegacyMode(p) { return RP_EcoExecuting[p]; }
stock RP_EcoSession(p) { return RP_BizSession[p]; }
stock RP_EcoClothesSession(p,session) { return RP_BizLive(p) && RP_BizSession[p]==session && GetPlayerState(p)!=PLAYER_STATE_WASTED; }
stock RP_EcoClothesDone(p) { RP_EcoPaid[p]=false; Actualizar(p); return 1; }
stock RP_EcoDebit(p,price) { if(!RP_EcoPaid[p]) QuitarDinero(p,price); return 1; }
stock RP_EcoClothing(p,price) {
    new t,i; if(!RP_EcoContext(p,t,i)) return SendClientMessage(p,-1,"Debes estar dentro de la tienda de ropa."),0;
    if(RP_EcoKind(t,i)!=3) return 0;
    if(!RP_BizHasOwner(t,i)) return 1;
    if(!RP_BizReady || RP_EcoBusy[p]) return SendClientMessage(p,-1,"Espera la operacion del negocio pendiente."),0;
    RP_EcoSaleType[p]=t; RP_EcoSaleDB[p]=RP_BizDB(t,i); RP_EcoSaleOwner[p]=RP_BizOwnerKey(t,i); RP_EcoSaleItem[p]=15; RP_EcoSaleUnits[p]=1;
    RP_EcoExecuting[p]=true; RP_EcoPaid[p]=false; new ok=RP_EcoPay(p,price); RP_EcoExecuting[p]=false; return ok;
}
stock RP_EcoProducts(p,const item[]) {
    new t,i; if(!RP_EcoContext(p,t,i)) return 0;
    if(!strcmp(item,"sprunk",true)) {
        new kind=RP_EcoKind(t,i),dialog=-1,row;
        switch(kind) { case 1: { dialog=PRODUCTOS; row=10; } case 2: { dialog=DIALOG_PIZZA; row=2; } case 4: { dialog=DIALOG_SALON; row=2; } case 7: { dialog=PRODUCTOS2; row=2; } }
        if(dialog<0) return SendClientMessage(p,-1,"Este local no vende Sprunk."),1;
        CallLocalFunction("OnDialogResponse","dddds",p,dialog,1,row,""); return 1;
    }
    if(strcmp(item,"productos",true) && strcmp(item,"herramientas",true) && strcmp(item,"herramienta",true) && strcmp(item,"juguetes",true)) return 0;
    new kind=RP_EcoKind(t,i),dialog=-1;
    if(!strcmp(item,"productos",true)) switch(kind) { case 1: dialog=PRODUCTOS; case 2: dialog=DIALOG_PIZZA; case 4: dialog=DIALOG_SALON; case 7: dialog=PRODUCTOS2; }
    if((!strcmp(item,"herramientas",true) || !strcmp(item,"herramienta",true)) && kind==5) dialog=HERRAMIENTAS;
    if(!strcmp(item,"juguetes",true) && kind==6) dialog=JUGUETES;
    if(dialog<0) return SendClientMessage(p,-1,"Usa el catalogo de este tipo de negocio: productos, herramientas, juguetes o codigo de ropa."),1;
    if(TieneSprunk[p] || TieneVino[p] || TieneAquariu[p] || TieneCerveza[p]) return SendClientMessage(p,-1,"Termina la bebida que tienes en la mano antes de comprar."),1;
    if(kind==6 && PLAYER_INFO[p][@Nivel]<2) return SendClientMessage(p,-1,"Necesitas nivel 2 para comprar aqui."),1;
    new text[2200],line[150];
    if(RP_BizHasOwner(t,i) && !RP_EcoEnsure(t,i)) return 1;
    for(new k;k<sizeof RP_EcoCatalog;k++) if(RP_EcoCatalog[k][epKind]==kind && RP_EcoCatalog[k][epDialog]==dialog) {
        new quantity=-1; if(RP_BizHasOwner(t,i)) quantity=RP_EcoRead(t,RP_BizDB(t,i),k);
        if(RP_EcoCatalog[k][epPrice]) format(line,sizeof line,"%s - $%d",RP_EcoCatalog[k][epName],RP_EcoCatalog[k][epPrice]);
        else format(line,sizeof line,"%s - segun vehiculo",RP_EcoCatalog[k][epName]);
        strcat(text,line); if(quantity>=0) { format(line,sizeof line," (%d disponibles)",quantity); strcat(text,line); } strcat(text,"\n");
    }
    dialogs_ShowPlayerDialog(p,dialog,DIALOG_STYLE_LIST,"Productos del negocio",text,"Comprar","Cerrar"); return 1;
}
hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
    if(dialogid==RP_ECO_MENU) { if(response && listitem>0) RP_EcoAction(playerid,listitem-1); return 1; }
    if(dialogid==RP_ECO_STOCK) {
        if(!response) return RP_EcoShow(playerid);
        if(!RP_EcoOwnerCheck(playerid) || listitem<0 || listitem>=RP_EcoRowCount[playerid]) return 1;
        RP_EcoItem[playerid]=RP_EcoRows[playerid][listitem]; new text[250];
        new i=RP_BizFind(RP_EcoType[playerid],RP_EcoDB[playerid]),cost,name[48]; if(!RP_EcoItemMeta(RP_EcoType[playerid],i,RP_EcoItem[playerid],cost,name,sizeof name)) return 1;
        format(text,sizeof text,"Producto: %s\nCosto de inversion: $%d por unidad.\nEscribe cuantas unidades quieres surtir (1 a 10000).",name,cost);
        return dialogs_ShowPlayerDialog(playerid,RP_ECO_AMOUNT,DIALOG_STYLE_INPUT,"Invertir en existencias",text,"Continuar","Volver");
    }
    if(dialogid==RP_ECO_AMOUNT) { if(response) RP_EcoAsk(playerid,1,RP_EcoNumber(inputtext)); else RP_EcoStockMenu(playerid); return 1; }
    if(dialogid==RP_ECO_WITHDRAW) { if(response) RP_EcoAsk(playerid,2,inputtext[0] && !strcmp(inputtext,"TODO",true)?RP_EcoTotalCash(RP_EcoType[playerid],RP_EcoDB[playerid]):RP_EcoNumber(inputtext)); else RP_EcoShow(playerid); return 1; }
    if(dialogid==RP_ECO_CONFIRM) {
        new action=RP_EcoConfirmAction[playerid]; RP_EcoConfirmAction[playerid]=0;
        if(!response || !action) return 1;
        if(!RP_EcoOwnerCheck(playerid) || RP_EcoBusy[playerid] || gettime()>RP_EcoConfirmExpiry[playerid]) return SendClientMessage(playerid,-1,"La confirmacion vencio o ya no cumples los requisitos.");
        RP_EcoBusy[playerid]=true;
        mysql_tquery(handle_db,"SELECT 1","RP_EcoOwnerCommit","dddddddd",playerid,RP_BizSession[playerid],RP_EcoConfirmType[playerid],RP_EcoConfirmDB[playerid],RP_EcoConfirmOwner[playerid],action,RP_EcoConfirmItem[playerid],RP_EcoConfirmUnits[playerid]); return 1;
    }
    return 1;
}
hook OnPlayerConnect(playerid) { RP_EcoBusy[playerid]=false; RP_EcoExecuting[playerid]=false; RP_EcoPaid[playerid]=false; RP_EcoVisible[playerid]=false; RP_EcoTDCount[playerid]=0; RP_EcoConfirmAction[playerid]=0; return 1; }
hook OnPlayerDisconnect(playerid,reason) { RP_EcoHide(playerid,false); RP_EcoBusy[playerid]=false; RP_EcoConfirmAction[playerid]=0; return 1; }
hook OnPlayerDeath(playerid,killerid,reason) { RP_EcoHide(playerid); RP_EcoConfirmAction[playerid]=0; return 1; }

stock RP_EcoBidonRequest(p,i) {
    if(!RP_BizHasOwner(RP_BIZ_GAS,i)) return 0;
    if(!RP_BizReady || RP_EcoBusy[p]) return SendClientMessage(p,-1,"Espera la operacion pendiente."),1;
    RP_EcoBusy[p]=true;
    mysql_tquery(handle_db,"SELECT 1","RP_EcoBidonCommit","dddd",p,RP_BizSession[p],RP_BizDB(RP_BIZ_GAS,i),RP_BizOwnerKey(RP_BIZ_GAS,i)); return 1;
}
forward RP_EcoBidonCommit(p,session,db,owner);
public RP_EcoBidonCommit(p,session,db,owner) {
    if(p<0 || p>=MAX_PLAYERS || RP_BizSession[p]!=session) return 1;
    RP_EcoBusy[p]=false; new i=RP_BizFind(RP_BIZ_GAS,db);
    if(!RP_BizLive(p) || GetPlayerState(p)==PLAYER_STATE_WASTED || i<0 || RP_BizOwnerKey(RP_BIZ_GAS,i)!=owner || Bidon[p] || GetPlayerInterior(p)!=0 || GetPlayerVirtualWorld(p)!=0 || !IsPlayerInRangeOfPoint(p,15.0,Gasolineras[i][Poss2][0],Gasolineras[i][Poss2][1],Gasolineras[i][Poss2][2])) return 1;
    RP_EcoSaleType[p]=RP_BIZ_GAS; RP_EcoSaleDB[p]=db; RP_EcoSaleOwner[p]=owner; RP_EcoSaleItem[p]=100; RP_EcoSaleUnits[p]=5;
    RP_EcoExecuting[p]=true; RP_EcoPaid[p]=false; new ok=RP_EcoPay(p,Gasolineras[i][gPrecioL]*5); RP_EcoExecuting[p]=false;
    if(ok) { SetPlayerAttachedObject(p,4,1650,5,0.125999,0.011999,0.0,-4.999999,-98.099983,16.600004,1.0,1.0,1.0); Bidon[p]=1; Actualizar(p); SendClientMessage(p,-1,"Compraste un bidon de 5 litros. Usa /cargar tanque."); }
    RP_EcoPaid[p]=false; return 1;
}
stock RP_EcoServiceCredit(t,i,amount) {
    if(!RP_BizHasOwner(t,i)) return 1;
    if(amount<1 || amount>RP_ECO_MAX_CASH || !RP_EcoEnsure(t,i)) return 0;
    new q[450];mysql_format(handle_db,q,sizeof q,"UPDATE rp_business_cash SET cash=cash+%d WHERE business_type=%d AND business_id=%d AND cash<=%d",amount,t,RP_BizDB(t,i),RP_ECO_MAX_CASH-amount);return RP_BizSQL(q,true);
}
stock RP_EcoParkingDaily(p) {
    new entries[5];entries[0]=PLAYER_INFO[p][vEstacionado1];entries[1]=PLAYER_INFO[p][vEstacionado2];entries[2]=PLAYER_INFO[p][vEstacionado3];entries[3]=PLAYER_INFO[p][vEstacionado4];entries[4]=PLAYER_INFO[p][vEstacionado5];
    new vehicles[5];vehicles[0]=autos[p];vehicles[1]=autos2[p];vehicles[2]=autos3[p];vehicles[3]=autos4[p];vehicles[4]=autos5[p];
    for(new k;k<5;k++) if(entries[k]>0 && RP_BizValid(RP_BIZ_PARKING,entries[k]) && IsValidVehicle(vehicles[k]) && GetVehicleInterior(vehicles[k])!=0) RP_EcoServiceCredit(RP_BIZ_PARKING,entries[k],150);
    return 1;
}stock RP_EcoGasWithdraw(p,i) { RP_EcoType[p]=RP_BIZ_GAS; RP_EcoDB[p]=Gasolineras[i][gaID]; return RP_EcoAction(p,1); }
stock RP_EcoRestaurantOwned(i) { return RP_BizHasOwner(RP_BIZ_PROPERTY,i); }
