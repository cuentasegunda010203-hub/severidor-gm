// Public storefronts and administration. All interactions are commands/dialogs.
#include <YSI_Coding\y_hooks>
#include "modulos/negocios_compra_textdraw.p"
stock RP_BizAdmin(playerid) {
    if(!RP_BizLive(playerid) || PLAYER_INFO[playerid][pAdmin]<ADMIN_LEVEL_GLOBAL) return 0;
    if(!AdminDuty[playerid]) return SendClientMessage(playerid,-1,"Activa el servicio administrativo con /aduty."),0;
    if(!RP_BizReady) return SendClientMessage(playerid,-1,"El sistema de negocios no esta disponible."),0;
    return 1;
}
CMD:accesonegocio(playerid,params[]) {
    if(!RP_BizLive(playerid) || !RP_BizReady) return 1;
    if(PLAYER_TEMP[playerid][VariableCaido] || EnCombate[playerid] || PLAYER_INFO[playerid][pTiempoCarcel]>0 || PLAYER_INFO[playerid][pTiempoJail]>0) return SendClientMessage(playerid,-1,"No puedes usar este acceso en tu estado actual.");
    if(RP_BizParkingAccess(playerid)) return 1;
    if(GetPlayerInterior(playerid)>0 || GetPlayerVirtualWorld(playerid)>0) return callcmd::salir(playerid,"");
    return callcmd::entrar(playerid,"");
}
stock RP_BizParkingAccess(p) {
    if(!RP_BizLive(p) || GetPlayerState(p)!=PLAYER_STATE_DRIVER) return 0;
    new v=GetPlayerVehicleID(p),own=-1;
    if(v==autos[p]) own=0; else if(v==autos2[p]) own=1; else if(v==autos3[p]) own=2; else if(v==autos4[p]) own=3; else if(v==autos5[p]) own=4;
    for(new i=1;i<MAX_GARAGES;i++) if(RP_BizValid(RP_BIZ_PARKING,i)) {
        new bool:inside=GetPlayerVirtualWorld(p)==Estacionamientos[i][eMundoVirtual] && GetPlayerInterior(p)==Estacionamientos[i][eInterior];
        new bool:outside=GetPlayerVirtualWorld(p)==0 && GetPlayerInterior(p)==0;
        if(inside && !IsPlayerInRangeOfPoint(p,6.0,Estacionamientos[i][SalidX],Estacionamientos[i][SalidY],Estacionamientos[i][SalidZ])) continue;
        if(outside && !IsPlayerInRangeOfPoint(p,5.0,Estacionamientos[i][PosX],Estacionamientos[i][PosY],Estacionamientos[i][PosZ])) continue;
        if(!inside && !outside) continue;
        if(own<0) return SendClientMessage(p,-1,"Usa un vehiculo de tu propiedad para este acceso."),1;
        if(GetVehicleModel(v)==609 || GetVehicleModel(v)==456) return SendClientMessage(p,-1,"Este vehiculo no puede entrar al estacionamiento."),1;
        if(!inside && PLAYER_INFO[p][jDinero]<150) return SendClientMessage(p,-1,"Necesitas $150 para entrar al estacionamiento."),1;
        if(inside) SetPosVeh(v,Estacionamientos[i][PosX],Estacionamientos[i][PosY],Estacionamientos[i][PosZ],Estacionamientos[i][PosA],0,0);
        else {
            if(!RP_EcoServiceCredit(RP_BIZ_PARKING,i,150)) return SendClientMessage(p,-1,"No se pudo registrar el pago del estacionamiento."),1;
            CargarMapeosEx(p); SetPosVeh(v,Estacionamientos[i][SalidX],Estacionamientos[i][SalidY],Estacionamientos[i][SalidZ],Estacionamientos[i][SalidA],Estacionamientos[i][eInterior],Estacionamientos[i][eMundoVirtual]);
            QuitarDinero(p,150); SendClientMessage(p,-1,"Ingresaste al estacionamiento: $150. Usa /estacionar para guardar el vehiculo y /accesonegocio para salir junto al acceso.");
        }
        new parked=inside?0:i;
        switch(own) { case 0: PLAYER_INFO[p][vEstacionado1]=parked; case 1: PLAYER_INFO[p][vEstacionado2]=parked; case 2: PLAYER_INFO[p][vEstacionado3]=parked; case 3: PLAYER_INFO[p][vEstacionado4]=parked; case 4: PLAYER_INFO[p][vEstacionado5]=parked; }
        return 1;
    }
    return 0;
}
CMD:crearnegocio(playerid,params[]) {
    if(!RP_BizAdmin(playerid)) return 1;
    new kind[24],coin[16],price,currency,type,category;
    if(sscanf(params,"s[24]ds[16]",kind,price,coin)) return SendClientMessage(playerid,-1,"Uso: /crearnegocio [tipo] [precio] [dinero/gz/coins]. /adminnegocios muestra los tipos.");
    category=RP_PublicKind(kind); type=category?RP_BIZ_PUBLIC:RP_BizType(kind); currency=RP_BizCurrency(coin);
    if(!type || price<1 || price>RP_BIZ_MAX_PRICE || currency<0) return SendClientMessage(playerid,-1,"Tipo, precio o moneda invalidos. Consulta /adminnegocios.");
    if(GetPlayerInterior(playerid)!=0 || GetPlayerVirtualWorld(playerid)!=0 || IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,-1,"Colocate a pie en el exterior donde quieres la entrada.");
    new Float:x,Float:y,Float:z,Float:a; GetPlayerPos(playerid,x,y,z); GetPlayerFacingAngle(playerid,a);
    mysql_tquery(handle_db,"SELECT 1","RP_AdminCreateCommit","ddddddffff",playerid,RP_BizSession[playerid],type,category,price,currency,x,y,z,a); return 1;
}
CMD:adminnegocios(playerid,params[]) {
    if(!RP_BizAdmin(playerid)) return 1;
    return ShowPlayerDialog(playerid,RP_BIZ_HELP_PAGE,DIALOG_STYLE_MSGBOX,"Administracion - Negocios",
        "{FFFFFF}Usa tipo + ID del negocio (no ID del jugador).\n\n{DBED15}/crearnegocio [tipo] [precio] [moneda]\n{FFFFFF}Tipos: local, 24/7, tienda, restaurante, ropa, bar, ferreteria, sexshop,\nnegocio (tienda de armas), gasolinera, estacionamiento, mercado, fabrica.\nMonedas: dinero, gz, coins. Se crea en tu posicion y queda en venta.\n\n{DBED15}/editarnegocio [tipo] [ID] [precio] [moneda]\n/movernegocio [tipo] [ID]\n/borrarnegocio [tipo] [ID]\n/quitarduenonegocio [tipo] [ID]\n{FFFFFF}Mover usa tu posicion exterior actual. Borrar y quitar dueno piden confirmacion.\nQuitar dueno conserva el negocio y lo pone en venta;\n\n{DBED15}/infonegocio [tipo] [ID]\n{FFFFFF}Muestra dueno, posicion, precio y moneda. /infonegocio solo: local cercano.\nLos locales nuevos usan tipo local para administrar existencias, caja y ventas.\n\nEjemplos:\n/crearnegocio tienda 35 coins\n/crearnegocio gasolinera 80 gz\n/editarnegocio local 1 150000 dinero\n/movernegocio local 1\n\nLos cambios se guardan en MySQL. Android y PC usan los mismos comandos.","Cerrar","");
}
CMD:infonegocio(playerid,params[]) {
    if(!RP_BizLive(playerid)) return 1;
    new name[24],db,t,i=-1;
    if(!strlen(params)) { t=RP_BIZ_PUBLIC; for(new n;n<RP_PUBLIC_MAX;n++) if(RP_BizValid(t,n) && GetPlayerInterior(playerid)==0 && GetPlayerVirtualWorld(playerid)==0 && IsPlayerInRangeOfPoint(playerid,5.0,RP_Public[n][pbX],RP_Public[n][pbY],RP_Public[n][pbZ])) { i=n; break; } }
    else { if(sscanf(params,"s[24]d",name,db)) return SendClientMessage(playerid,-1,"Uso: /infonegocio [tipo] [ID negocio]"); t=RP_BizType(name); i=RP_BizFind(t,db); }
    if(i<0) return SendClientMessage(playerid,-1,"No se encontro ese negocio.");
    new Float:x,Float:y,Float:z,s=RP_PriceSlot(t,RP_BizDB(t,i)),coin[16]; RP_BizPosition(t,i,x,y,z); RP_BizTypeName(t,name,sizeof name);
    SendClientMessageEx(playerid,-1,"%s #%d | %s | propietario/banda ID: %d",name,RP_BizDB(t,i),RP_BizHasOwner(t,i)?"Privado":"En venta",RP_BizOwnerKey(t,i));
    if(s>=0) { RP_BizCurrencyName(RP_BizPrices[s][bpCurrency],coin,sizeof coin); SendClientMessageEx(playerid,-1,"Precio inicial: %d %s | Entrada: %.2f, %.2f, %.2f",RP_BizPrices[s][bpPrice],coin,x,y,z); }
    return 1;
}
// Fill mandatory legacy columns explicitly so creation works with strict SQL mode.
stock RP_BizBlankRow(const table[],db) {
    new q[1024],columns[8192],values[8192],sql[18000];
    mysql_format(handle_db,q,sizeof q,"SELECT COLUMN_NAME,DATA_TYPE,COLUMN_DEFAULT,IS_NULLABLE,EXTRA FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='%e' ORDER BY ORDINAL_POSITION",table);
    new Cache:c=mysql_query(handle_db,q,true),rows; cache_get_row_count(rows);
    if(!rows || mysql_errno(handle_db)) { if(c!=MYSQL_INVALID_CACHE) cache_delete(c); return 0; }
    for(new r;r<rows;r++) {
        new col[64],datatype[32],def[256],nullable[8],extra[64],value[600],bool:isnull;
        cache_get_value_name(r,"COLUMN_NAME",col,sizeof col); cache_get_value_name(r,"DATA_TYPE",datatype,sizeof datatype); cache_get_value_name(r,"IS_NULLABLE",nullable,sizeof nullable); cache_get_value_name(r,"EXTRA",extra,sizeof extra);
        if(strfind(extra,"GENERATED",true)>=0) continue;
        cache_is_value_name_null(r,"COLUMN_DEFAULT",isnull);
        if(!strcmp(col,"ID",true)) format(value,sizeof value,"%d",db);
        else if(!isnull) { cache_get_value_name(r,"COLUMN_DEFAULT",def,sizeof def); mysql_format(handle_db,value,sizeof value,"'%e'",def); }
        else if(!strcmp(nullable,"YES",true)) format(value,sizeof value,"NULL");
        else if(!strcmp(datatype,"varchar",true) || !strcmp(datatype,"char",true) || strfind(datatype,"text",true)>=0) format(value,sizeof value,"''");
        else format(value,sizeof value,"0");
        if(strlen(columns)+strlen(col)+4>=sizeof columns || strlen(values)+strlen(value)+2>=sizeof values) { cache_delete(c); return 0; }
        if(strlen(columns)) { strcat(columns,","); strcat(values,","); }
        format(q,sizeof q,"`%s`",col); strcat(columns,q); strcat(values,value);
    }
    if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
    mysql_format(handle_db,sql,sizeof sql,"INSERT INTO `%s` (%s) VALUES (%s)",table,columns,values); return RP_BizSQL(sql);
}
stock RP_BizGasORM(i) {
    new ORM:o=Gasolineras[i][ORM_ID]=orm_create("gasolineras");
    orm_addvar_int(o,Gasolineras[i][gaID],"ID"); orm_setkey(o,"ID");
    orm_addvar_int(o,Gasolineras[i][gDuenoID],"DuenoID"); orm_addvar_int(o,Gasolineras[i][gPrecio],"Precio"); orm_addvar_int(o,Gasolineras[i][gPrecioL],"PrecioL"); orm_addvar_int(o,Gasolineras[i][gNivel],"Nivel"); orm_addvar_int(o,Gasolineras[i][gGasolina],"Gasolina"); orm_addvar_int(o,Gasolineras[i][gGanancias],"Ganancias"); orm_addvar_int(o,Gasolineras[i][gMaxGasolina],"MaxGasolina"); orm_addvar_int(o,Gasolineras[i][gEnUso],"EnUso"); orm_addvar_string(o,Gasolineras[i][gaNombre],25,"Nombre");
    orm_addvar_float(o,Gasolineras[i][Posss][0],"PosX"); orm_addvar_float(o,Gasolineras[i][Posss][1],"PosY"); orm_addvar_float(o,Gasolineras[i][Posss][2],"PosZ"); orm_addvar_float(o,Gasolineras[i][Poss2][0],"EcharX"); orm_addvar_float(o,Gasolineras[i][Poss2][1],"EcharY"); orm_addvar_float(o,Gasolineras[i][Poss2][2],"EcharZ"); return 1;
}
forward RP_AdminCreateCommit(p,session,t,category,price,currency,Float:x,Float:y,Float:z,Float:a);
public RP_AdminCreateCommit(p,session,t,category,price,currency,Float:x,Float:y,Float:z,Float:a) {
    if(p<0 || p>=MAX_PLAYERS || RP_BizSession[p]!=session || !RP_BizAdmin(p)) return 1;
    new i=-1,db,table[40],q[2048];
    switch(t) {
        case RP_BIZ_PUBLIC: for(new n;n<RP_PUBLIC_MAX;n++) if(!RP_Public[n][pbID]) { i=n; break; }
        case RP_BIZ_PROPERTY: { i=CasaDesocupada(); format(table,sizeof table,"propiedades"); }
        case RP_BIZ_GAS: { for(new n;n<MAX_GASOLINERAS;n++) if(!Gasolineras[n][gEnUso]) { i=n; break; } format(table,sizeof table,"gasolineras"); }
        case RP_BIZ_PARKING: { for(new n=1;n<MAX_GARAGES;n++) if(!Estacionamientos[n][eEnUso]) { i=n; break; } format(table,sizeof table,"estacionamientos"); }
        case RP_BIZ_MARKET: { i=MercadoDesocupado(); format(table,sizeof table,"mercados"); }
        case RP_BIZ_FACTORY: { for(new n=1;n<MAX_FABRICAS;n++) if(!FABRICAS_INFO[n][f_VALID]) { i=n; break; } format(table,sizeof table,"fabricas"); }
    }
    if(i<0) return SendClientMessage(p,-1,"Se alcanzo el limite de negocios de este tipo.");
    for(new ot=1;ot<=RP_BIZ_PUBLIC;ot++) for(new n,lim=RP_BizLimit(ot);n<lim;n++) if(RP_BizValid(ot,n)) { new Float:ox,Float:oy,Float:oz; RP_BizPosition(ot,n,ox,oy,oz); if(floatabs(oz-z)<5.0 && floatsqroot(floatpower(ox-x,2.0)+floatpower(oy-y,2.0))<3.0) return SendClientMessage(p,-1,"La entrada esta demasiado cerca de otro negocio."); }
    if(!RP_BizSQL("START TRANSACTION")) return 1;
    new bool:ok=true;
    if(t==RP_BIZ_PUBLIC) {
        new Float:ix,Float:iy,Float:iz,Float:ia,interior,world,name[64]; RP_PublicTemplate(-1,category,ix,iy,iz,ia,interior,world);
        switch(category) { case 1: name="24/7"; case 2: name="Restaurante"; case 3: name="Tienda de ropa"; case 4: name="Bar"; case 5: name="Ferreteria"; case 6: name="Sex Shop"; }
        mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_public_businesses (kind,name,x,y,z,a,ix,iy,iz,ia,interior,world) VALUES (%d,'%e',%f,%f,%f,%f,%f,%f,%f,%f,%d,0)",category,name,x,y,z,a,ix,iy,iz,ia,interior);
        new Cache:c=mysql_query(handle_db,q,true); ok=mysql_errno(handle_db)==0; db=cache_insert_id(); if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
        world=100000+db; mysql_format(handle_db,q,sizeof q,"UPDATE rp_public_businesses SET world=%d WHERE id=%d",world,db); if(ok) ok=bool:RP_BizSQL(q);
        if(ok) { RP_Public[i][pbDoor]=-1; RP_Public[i][pbKind]=category; format(RP_Public[i][pbName],64,"%s",name); RP_Public[i][pbInsideX]=ix; RP_Public[i][pbInsideY]=iy; RP_Public[i][pbInsideZ]=iz; RP_Public[i][pbInsideA]=ia; RP_Public[i][pbInterior]=interior; RP_Public[i][pbWorld]=world; }
    } else {
        if(t==RP_BIZ_PROPERTY || t==RP_BIZ_PARKING || t==RP_BIZ_MARKET) db=i;
        else {
            mysql_format(handle_db,q,sizeof q,"SELECT COALESCE(MAX(ID),0)+1 AS next_id FROM `%s`",table);
            new Cache:c=mysql_query(handle_db,q,true); cache_get_value_name_int(0,"next_id",db); if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
        }
        ok=bool:RP_BizBlankRow(table,db);
        switch(t) {
            case RP_BIZ_PROPERTY: mysql_format(handle_db,q,sizeof q,"UPDATE propiedades SET EnUso=1,IDPropietario=0,Propietario='Nadie',EnVenta=1,Precio=%d,Nivel=1,Tipo=4,EnVentaPor=%d,PosX=%f,PosY=%f,PosZ=%f,PosA=%f,Interior=43,VW=%d,Abierta=1 WHERE ID=%d",price,currency,x,y,z,a,i+1,db);
            case RP_BIZ_GAS: mysql_format(handle_db,q,sizeof q,"UPDATE gasolineras SET EnUso=1,DuenoID=0,Nombre='Nadie',Precio=%d,PrecioL=100,Nivel=3,Gasolina=1400,MaxGasolina=1400,PosX=%f,PosY=%f,PosZ=%f,EcharX=%f,EcharY=%f,EcharZ=%f WHERE ID=%d",price,x,y,z,x+5.0,y,z,db);
            case RP_BIZ_PARKING: mysql_format(handle_db,q,sizeof q,"UPDATE estacionamientos SET EnUso=1,Propietario=0,Precio=%d,Nivel=5,SalidaX=%f,SalidaY=%f,SalidaZ=%f,SalidaA=%f,EntradaX=1412.6399,EntradaY=-1.7875,EntradaZ=1000.9244,EntradaA=90,Interior=1,VirtualWorld=%d WHERE ID=%d",price,x,y,z,a,40000+i,db);
            case RP_BIZ_MARKET: mysql_format(handle_db,q,sizeof q,"UPDATE mercados SET EnUso=1,EnVenta=1,BandaID=0,DuenoID=0,BandaN='Nadie',DuenoN='Nadie',EstaAbierto=1,Valor=%d,X=%f,Y=%f,Z=%f WHERE ID=%d",price,x,y,z,db);
            case RP_BIZ_FACTORY: mysql_format(handle_db,q,sizeof q,"UPDATE fabricas SET BandaID=0,EnVenta=0,EntradaX=%f,EntradaY=%f,EntradaZ=%f,EntradaA=%f,GarajeE_X=%f,GarajeE_Y=%f,GarajeE_Z=%f,GarajeE_A=%f WHERE ID=%d",x,y,z,a,x+5.0,y,z,a,db);
        }
        if(ok) ok=bool:RP_BizSQL(q);
    }
    mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_business_prices (business_type,business_id,price,currency) VALUES (%d,%d,%d,%d) ON DUPLICATE KEY UPDATE price=VALUES(price),currency=VALUES(currency)",t,db,price,currency); if(ok) ok=bool:RP_BizSQL(q);
    if(!ok || !RP_BizSQL("COMMIT")) { RP_BizSQL("ROLLBACK"); return SendClientMessage(p,-1,"No se pudo crear el negocio. Se revirtio el registro."); }
    new ps=RP_PriceSlot(t,db,true); if(ps>=0) { RP_BizPrices[ps][bpPrice]=price; RP_BizPrices[ps][bpCurrency]=currency; }
    switch(t) {
        case RP_BIZ_PROPERTY: { new blank[Propiedades]; PropInfo[i]=blank; }
        case RP_BIZ_GAS: { new blank[i_gaso]; Gasolineras[i]=blank; }
        case RP_BIZ_PARKING: { new blank[eInformacion]; Estacionamientos[i]=blank; }
        case RP_BIZ_MARKET: { new blank[mercaInfo]; InfoMercado[i]=blank; }
    }
    switch(t) {
        case RP_BIZ_PUBLIC: { RP_Public[i][pbID]=db; RP_Public[i][pbOwner]=0; format(RP_Public[i][pbOwnerName],25,"Nadie"); RP_Public[i][pbActive]=true; RP_Public[i][pbX]=x; RP_Public[i][pbY]=y; RP_Public[i][pbZ]=z; RP_Public[i][pbA]=a; RP_PublicRefresh(i); }
        case RP_BIZ_PROPERTY: { PropInfo[i][pID]=db; PropInfo[i][pEnUso]=1; PropInfo[i][pIDPropietario]=0; format(PropInfo[i][pPropietario],40,"Nadie"); PropInfo[i][pEnVenta]=1; PropInfo[i][pPrecio]=price; PropInfo[i][pNivel]=1; PropInfo[i][pEnVentaPor]=currency; PropInfo[i][pTipo]=4; PropInfo[i][pPosX]=x; PropInfo[i][pPosY]=y; PropInfo[i][pPosZ]=z; PropInfo[i][pPosA]=a; PropInfo[i][pVW]=i+1; PropInfo[i][pAbierta]=1; PropInfo[i][pInterior]=43; DarInteriorCasa(i,43); GuardarPropiedad(i); CargarPropiedad(i); }
        case RP_BIZ_GAS: { Gasolineras[i][gaID]=db; Gasolineras[i][gEnUso]=1; Gasolineras[i][gDuenoID]=0; format(Gasolineras[i][gaNombre],25,"Nadie"); Gasolineras[i][gPrecio]=price; Gasolineras[i][gPrecioL]=100; Gasolineras[i][gNivel]=3; Gasolineras[i][gGasolina]=1400; Gasolineras[i][gMaxGasolina]=1400; Gasolineras[i][Posss][0]=x; Gasolineras[i][Posss][1]=y; Gasolineras[i][Posss][2]=z; Gasolineras[i][Poss2][0]=x+5.0; Gasolineras[i][Poss2][1]=y; Gasolineras[i][Poss2][2]=z; RP_BizGasORM(i); CargarGasolinera(i); }
        case RP_BIZ_PARKING: { Estacionamientos[i][eID]=db; Estacionamientos[i][eEnUso]=1; Estacionamientos[i][Dueno]=0; format(Estacionamientos[i][DuenoName],MAX_PLAYER_NAME,"Nadie"); Estacionamientos[i][ePrecio]=price; Estacionamientos[i][Nivel]=5; Estacionamientos[i][PosX]=x; Estacionamientos[i][PosY]=y; Estacionamientos[i][PosZ]=z; Estacionamientos[i][PosA]=a; Estacionamientos[i][SalidX]=1412.6399; Estacionamientos[i][SalidY]=-1.7875; Estacionamientos[i][SalidZ]=1000.9244; Estacionamientos[i][SalidA]=90.0; Estacionamientos[i][eInterior]=1; Estacionamientos[i][eMundoVirtual]=40000+i; CargarParking(i); }
        case RP_BIZ_MARKET: { InfoMercado[i][mID]=db; InfoMercado[i][mEnUso]=1; InfoMercado[i][mEnVenta]=1; InfoMercado[i][mDuenoID]=0; InfoMercado[i][mBandaID]=0; format(InfoMercado[i][mDuenoN],40,"Nadie"); format(InfoMercado[i][mBandaN],80,"Nadie"); InfoMercado[i][mAbierto]=1; InfoMercado[i][mValor]=price; InfoMercado[i][mX]=x; InfoMercado[i][mY]=y; InfoMercado[i][mZ]=z; CargarMerca(i); }
        case RP_BIZ_FACTORY: { FABRICAS_INFO[i][f_VALID]=true; FABRICAS_INFO[i][f_DBID]=db; FABRICAS_INFO[i][f_POS][0]=x; FABRICAS_INFO[i][f_POS][1]=y; FABRICAS_INFO[i][f_POS][2]=z; FABRICAS_INFO[i][f_POS][3]=a; FABRICAS_INFO[i][f_POS_GARAJE][0]=x+5.0; FABRICAS_INFO[i][f_POS_GARAJE][1]=y; FABRICAS_INFO[i][f_POS_GARAJE][2]=z; FABRICAS_INFO[i][f_POS_GARAJE][3]=a; DesocuparFabrica(i); FABRICAS_INFO[i][f_DINERO]=0; FABRICAS_INFO[i][f_FACCION_ID]=0; FABRICAS_INFO[i][f_VENTA]=0; CargarFabrica(i); }
    }
    RP_BizRefreshConfigured(t,i);
    new name[24],coin[16]; RP_BizTypeName(t,name,sizeof name); RP_BizCurrencyName(currency,coin,sizeof coin);
    printf("[Negocios ADMIN] Cuenta %d crea %s #%d por %d %s",PLAYER_INFO[p][pID],name,db,price,coin);
    return SendClientMessageEx(p,-1,"Creaste %s #%d en venta por %d %s. Usa ese tipo e ID en /editarnegocio y /movernegocio.",name,db,price,coin);
}
stock RP_BizOwnerKey(t,i) {
    switch(t) { case RP_BIZ_PUBLIC: return RP_Public[i][pbOwner]; case RP_BIZ_PROPERTY: return PropInfo[i][pIDPropietario]; case RP_BIZ_GAS: return Gasolineras[i][gDuenoID]; case RP_BIZ_PARKING: return Estacionamientos[i][Dueno]; case RP_BIZ_MARKET: return InfoMercado[i][mBandaID]; case RP_BIZ_FACTORY: return FABRICAS_INFO[i][f_FACCION_ID]; } return 0;
}
CMD:editarnegocio(playerid,params[]) {
    if(!RP_BizAdmin(playerid)) return 1;
    new name[24],coin[16],db,price,t,i,c;
    if(sscanf(params,"s[24]dds[16]",name,db,price,coin)) return SendClientMessage(playerid,-1,"Uso: /editarnegocio [tipo] [ID negocio] [precio] [dinero/gz/coins]");
    t=RP_BizType(name); i=RP_BizFind(t,db); c=RP_BizCurrency(coin);
    if(i<0 || price<1 || price>RP_BIZ_MAX_PRICE || c<0) return SendClientMessage(playerid,-1,"Tipo, ID, precio o moneda invalidos.");
    mysql_tquery(handle_db,"SELECT 1","RP_AdminEditCommit","ddddddffffd",playerid,RP_BizSession[playerid],1,t,db,price,0.0,0.0,0.0,float(c),RP_BizOwnerKey(t,i)); return 1;
}
CMD:movernegocio(playerid,params[]) {
    if(!RP_BizAdmin(playerid)) return 1;
    new name[24],db,t,i;
    if(sscanf(params,"s[24]d",name,db)) return SendClientMessage(playerid,-1,"Uso: /movernegocio [tipo] [ID negocio]. Colocate en la nueva entrada.");
    t=RP_BizType(name); i=RP_BizFind(t,db); if(i<0) return SendClientMessage(playerid,-1,"No existe ese negocio.");
    if(GetPlayerInterior(playerid)!=0 || GetPlayerVirtualWorld(playerid)!=0 || IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,-1,"Colocate a pie en el exterior del mundo principal.");
    new Float:x,Float:y,Float:z,Float:a; GetPlayerPos(playerid,x,y,z); GetPlayerFacingAngle(playerid,a);
    mysql_tquery(handle_db,"SELECT 1","RP_AdminEditCommit","ddddddffffd",playerid,RP_BizSession[playerid],2,t,db,0,x,y,z,a,RP_BizOwnerKey(t,i)); return 1;
}
CMD:borrarnegocio(playerid,params[]) { return RP_AdminAsk(playerid,params,2); }
CMD:quitarduenonegocio(playerid,params[]) { return RP_AdminAsk(playerid,params,1); }
stock RP_AdminAsk(p,const params[],action) {
    if(!RP_BizAdmin(p)) return 1;
    new name[24],db,t,i,text[350];
    if(sscanf(params,"s[24]d",name,db)) return SendClientMessage(p,-1,"Uso: /borrarnegocio o /quitarduenonegocio [tipo] [ID negocio]");
    t=RP_BizType(name); i=RP_BizFind(t,db); if(i<0) return SendClientMessage(p,-1,"No existe ese negocio.");
    RP_AdminType[p]=t; RP_AdminDB[p]=db; RP_AdminAction[p]=action;
    SetPVarInt(p,"RP_BizExpectedOwner",RP_BizOwnerKey(t,i)); SetPVarInt(p,"RP_BizAdminExpiry",gettime()+60);
    format(text,sizeof text,"%s %s #%d\n\n%s\nLas ofertas se cancelaran. Borrar elimina caja y existencias; quitar dueno las conserva.\nNo se devuelve dinero al propietario.\n\nConfirma esta accion administrativa.",action==2?"Borrar":"Quitar propietario de",name,db,action==2?"El negocio dejara de existir como propiedad comprable.":"El negocio quedara libre y en venta al precio configurado.");
    return ShowPlayerDialog(p,RP_BIZ_ADMIN_CONFIRM,DIALOG_STYLE_MSGBOX,"Administrar negocio",text,"Confirmar","Cancelar");
}
forward RP_AdminEditCommit(p,session,action,t,db,price,Float:x,Float:y,Float:z,Float:a,owner);
public RP_AdminEditCommit(p,session,action,t,db,price,Float:x,Float:y,Float:z,Float:a,owner) {
    if(p<0 || p>=MAX_PLAYERS || RP_BizSession[p]!=session || !RP_BizAdmin(p)) return 1;
    new i=RP_BizFind(t,db); if(i<0 || RP_BizOwnerKey(t,i)!=owner) return SendClientMessage(p,-1,"El negocio cambio mientras se procesaba la accion. Repite el comando.");
    if(action>=3) return RP_BizAdminRemove(p,t,i,action==4);
    if(action==1) {
        if(!RP_PriceSet(t,db,price,floatround(a))) return SendClientMessage(p,-1,"No se pudo guardar el precio.");
        RP_BizRefreshConfigured(t,i);
        return SendClientMessage(p,-1,"Precio y moneda de compra inicial guardados. Las ventas entre jugadores acuerdan su propio precio.");
    }
    new q[512],Float:ox,Float:oy,Float:oz; RP_BizPosition(t,i,ox,oy,oz);
    switch(t) {
        case RP_BIZ_PUBLIC: mysql_format(handle_db,q,sizeof q,"UPDATE rp_public_businesses SET x=%f,y=%f,z=%f,a=%f WHERE id=%d",x,y,z,a,db);
        case RP_BIZ_PROPERTY: mysql_format(handle_db,q,sizeof q,"UPDATE propiedades SET PosX=%f,PosY=%f,PosZ=%f,PosA=%f WHERE ID=%d",x,y,z,a,db);
        case RP_BIZ_GAS: mysql_format(handle_db,q,sizeof q,"UPDATE gasolineras SET PosX=%f,PosY=%f,PosZ=%f,EcharX=EcharX+%f,EcharY=EcharY+%f,EcharZ=EcharZ+%f WHERE ID=%d",x,y,z,x-ox,y-oy,z-oz,db);
        case RP_BIZ_PARKING: mysql_format(handle_db,q,sizeof q,"UPDATE estacionamientos SET SalidaX=%f,SalidaY=%f,SalidaZ=%f,SalidaA=%f WHERE ID=%d",x,y,z,a,db);
        case RP_BIZ_MARKET: mysql_format(handle_db,q,sizeof q,"UPDATE mercados SET X=%f,Y=%f,Z=%f WHERE ID=%d",x,y,z,db);
        case RP_BIZ_FACTORY: mysql_format(handle_db,q,sizeof q,"UPDATE fabricas SET EntradaX=%f,EntradaY=%f,EntradaZ=%f,EntradaA=%f,GarajeE_X=GarajeE_X+%f,GarajeE_Y=GarajeE_Y+%f,GarajeE_Z=GarajeE_Z+%f WHERE ID=%d",x,y,z,a,x-ox,y-oy,z-oz,db);
    }
    if(!RP_BizSQL(q)) return SendClientMessage(p,-1,"No se pudo guardar la posicion.");
    switch(t) {
        case RP_BIZ_PUBLIC: { RP_Public[i][pbX]=x; RP_Public[i][pbY]=y; RP_Public[i][pbZ]=z; RP_Public[i][pbA]=a; RP_PublicRefresh(i); }
        case RP_BIZ_PROPERTY: { PropInfo[i][pPosX]=x; PropInfo[i][pPosY]=y; PropInfo[i][pPosZ]=z; PropInfo[i][pPosA]=a; BorrarLabelCasa(i); CargarPropiedad(i); }
        case RP_BIZ_GAS: { Gasolineras[i][Poss2][0]+=x-ox; Gasolineras[i][Poss2][1]+=y-oy; Gasolineras[i][Poss2][2]+=z-oz; Gasolineras[i][Posss][0]=x; Gasolineras[i][Posss][1]=y; Gasolineras[i][Posss][2]=z; CargarGasolinera(i); }
        case RP_BIZ_PARKING: { Estacionamientos[i][PosX]=x; Estacionamientos[i][PosY]=y; Estacionamientos[i][PosZ]=z; Estacionamientos[i][PosA]=a; CargarParking(i); }
        case RP_BIZ_MARKET: { InfoMercado[i][mX]=x; InfoMercado[i][mY]=y; InfoMercado[i][mZ]=z; CargarMerca(i); }
        case RP_BIZ_FACTORY: { FABRICAS_INFO[i][f_POS_GARAJE][0]+=x-ox; FABRICAS_INFO[i][f_POS_GARAJE][1]+=y-oy; FABRICAS_INFO[i][f_POS_GARAJE][2]+=z-oz; FABRICAS_INFO[i][f_POS][0]=x; FABRICAS_INFO[i][f_POS][1]=y; FABRICAS_INFO[i][f_POS][2]=z; FABRICAS_INFO[i][f_POS][3]=a; CargarFabrica(i); }
    }
    RP_BizInvalidate(t,i); RP_BizRefreshConfigured(t,i);
    return SendClientMessage(p,-1,"Entrada trasladada y guardada. ");
}
stock RP_BizInvalidate(t,i) {
    for(new p;p<MAX_PLAYERS;p++) {
        if(RP_BizOffer[p][boType]==t && RP_BizOffer[p][boIndex]==i) RP_BizClearOffer(p);
        if(RP_Quote[p][bqType]==t && RP_Quote[p][bqIndex]==i) { RP_BuyHide(p); RP_Quote[p][bqExpiry]=0; RP_Quote[p][bqGeneration]++; RP_Quote[p][bqProcessing]=false; }
    }
    return 1;
}
stock RP_BizFactoryCleanup(i) {
    if(IsValidDynamicMapIcon(FABRICAS_INFO[i][f_MAPICON])) DestroyDynamicMapIcon(FABRICAS_INFO[i][f_MAPICON]);
    for(new k;k<2;k++) if(IsValidDynamicObject(FABRICAS_INFO[i][f_PORTON][k])) DestroyDynamicObject(FABRICAS_INFO[i][f_PORTON][k]);
    for(new k;k<20;k++) if(IsValidDynamicObject(FABRICAS_INFO[i][f_CAJAS][k])) DestroyDynamicObject(FABRICAS_INFO[i][f_CAJAS][k]);
    for(new k;k<32;k++) if(IsValidDynamicObject(FABRICAS_INFO[i][f_BOLSOS_DINERO][k])) DestroyDynamicObject(FABRICAS_INFO[i][f_BOLSOS_DINERO][k]);
    for(new k;k<23;k++) if(IsValidDynamicObject(FABRICAS_INFO[i][f_OBJETO_CHALECOS][k])) DestroyDynamicObject(FABRICAS_INFO[i][f_OBJETO_CHALECOS][k]);
    for(new k;k<10;k++) {
        if(IsValidDynamicObject(FABRICAS_INFO[i][f_OBJETO_SNIPER][k])) DestroyDynamicObject(FABRICAS_INFO[i][f_OBJETO_SNIPER][k]);
        if(IsValidDynamicObject(FABRICAS_INFO[i][f_OBJETO_TEC9][k])) DestroyDynamicObject(FABRICAS_INFO[i][f_OBJETO_TEC9][k]);
        if(IsValidDynamicObject(FABRICAS_INFO[i][f_OBJETOS_RECORTADA][k])) DestroyDynamicObject(FABRICAS_INFO[i][f_OBJETOS_RECORTADA][k]);
        if(IsValidDynamicObject(FABRICAS_INFO[i][f_OBJETO_UZI][k])) DestroyDynamicObject(FABRICAS_INFO[i][f_OBJETO_UZI][k]);
    }
    return 1;
}
stock RP_BizAdminRemove(p,t,i,bool:erase) {
    new db=RP_BizDB(t,i),q[1024];
    if(erase && t==RP_BIZ_PARKING) {
        mysql_format(handle_db,q,sizeof q,"SELECT COUNT(*) AS parked FROM usuarios WHERE Estacionado1=%d OR Estacionado2=%d OR Estacionado3=%d OR Estacionado4=%d OR Estacionado5=%d",db,db,db,db,db);
        new Cache:c=mysql_query(handle_db,q,true),parked; cache_get_value_name_int(0,"parked",parked); new err=mysql_errno(handle_db); if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
        if(parked || err) return SendClientMessage(p,-1,"Retira los vehiculos guardados antes de borrar este estacionamiento.");
        for(new v=1;v<=GetVehiclePoolSize();v++) if(IsValidVehicle(v) && GetVehicleVirtualWorld(v)==Estacionamientos[i][eMundoVirtual] && GetVehicleInterior(v)==Estacionamientos[i][eInterior]) return SendClientMessage(p,-1,"Hay vehiculos dentro; retiralos antes de borrar el estacionamiento.");
    }
    if(!RP_BizSQL("START TRANSACTION")) return 1;
    new bool:ok=true;
    if(t==RP_BIZ_PROPERTY) {
        for(new s=1;s<=MAX_PCASAS && ok;s++) { mysql_format(handle_db,q,sizeof q,"UPDATE usuarios SET CasaID%d=0 WHERE CasaID%d=%d",s,s,db); ok=bool:RP_BizSQL(q); }
        if(erase && ok) { mysql_format(handle_db,q,sizeof q,"DELETE FROM server_muebles WHERE CasaID=%d",db); ok=bool:RP_BizSQL(q); }
    }
    if(erase) {
        switch(t) { case RP_BIZ_PUBLIC: mysql_format(handle_db,q,sizeof q,"UPDATE rp_public_businesses SET active=0,owner=0,owner_name='Nadie' WHERE id=%d",db); case RP_BIZ_PROPERTY: mysql_format(handle_db,q,sizeof q,"DELETE FROM propiedades WHERE ID=%d",db); case RP_BIZ_GAS: mysql_format(handle_db,q,sizeof q,"DELETE FROM gasolineras WHERE ID=%d",db); case RP_BIZ_PARKING: mysql_format(handle_db,q,sizeof q,"DELETE FROM estacionamientos WHERE ID=%d",db); case RP_BIZ_MARKET: mysql_format(handle_db,q,sizeof q,"DELETE FROM mercados WHERE ID=%d",db); case RP_BIZ_FACTORY: mysql_format(handle_db,q,sizeof q,"DELETE FROM fabricas WHERE ID=%d",db); }
    } else {
        switch(t) { case RP_BIZ_PUBLIC: mysql_format(handle_db,q,sizeof q,"UPDATE rp_public_businesses SET owner=0,owner_name='Nadie' WHERE id=%d",db); case RP_BIZ_PROPERTY: mysql_format(handle_db,q,sizeof q,"UPDATE propiedades SET IDPropietario=0,Propietario='Nadie',EnVenta=1 WHERE ID=%d",db); case RP_BIZ_GAS: mysql_format(handle_db,q,sizeof q,"UPDATE gasolineras SET DuenoID=0,Nombre='Nadie' WHERE ID=%d",db); case RP_BIZ_PARKING: mysql_format(handle_db,q,sizeof q,"UPDATE estacionamientos SET Propietario=0 WHERE ID=%d",db); case RP_BIZ_MARKET: mysql_format(handle_db,q,sizeof q,"UPDATE mercados SET DuenoID=0,DuenoN='Nadie',BandaID=0,BandaN='Nadie',EnVenta=1 WHERE ID=%d",db); case RP_BIZ_FACTORY: mysql_format(handle_db,q,sizeof q,"UPDATE fabricas SET BandaID=0,EnVenta=0 WHERE ID=%d",db); }
    }
    if(ok) ok=bool:RP_BizSQL(q);
    if(ok && erase) ok=bool:RP_EcoDelete(t,db);
    if(erase) { mysql_format(handle_db,q,sizeof q,"DELETE FROM rp_business_prices WHERE business_type=%d AND business_id=%d",t,db); if(ok) ok=bool:RP_BizSQL(q); }
    if(!ok || !RP_BizSQL("COMMIT")) { RP_BizSQL("ROLLBACK"); return SendClientMessage(p,-1,"No se guardo la accion; se revirtieron los cambios."); }
    RP_BizInvalidate(t,i);
    if(erase) { new s=RP_PriceSlot(t,db); if(s>=0) RP_BizPrices[s][bpType]=0; }
    switch(t) {
        case RP_BIZ_PUBLIC: { RP_Public[i][pbOwner]=0; format(RP_Public[i][pbOwnerName],25,"Nadie"); if(erase) RP_Public[i][pbActive]=false; RP_PublicRefresh(i); }
        case RP_BIZ_PROPERTY: {
            foreach(new u:Player) for(new s;s<MAX_PCASAS;s++) if(PLAYER_INFO[u][CasaID][s]==db) PLAYER_INFO[u][CasaID][s]=0;
            PropInfo[i][pIDPropietario]=0; format(PropInfo[i][pPropietario],40,"Nadie"); PropInfo[i][pEnVenta]=1;
            BorrarLabelCasa(i); if(erase) PropInfo[i][pEnUso]=0; else CargarPropiedad(i);
        }
        case RP_BIZ_GAS: { Gasolineras[i][gDuenoID]=0; format(Gasolineras[i][gaNombre],25,"Nadie"); if(erase) { Gasolineras[i][gEnUso]=0; DestroyDynamic3DTextLabel(Gasolineras[i][gTexto]); DestroyDynamic3DTextLabel(Gasolineras[i][gTextoCompra]); DestroyDynamicPickup(Gasolineras[i][gPickup]); orm_destroy(Gasolineras[i][ORM_ID]); Gasolineras[i][gaID]=0; } else CargarGasolinera(i); }
        case RP_BIZ_PARKING: { Estacionamientos[i][Dueno]=0; format(Estacionamientos[i][DuenoName],MAX_PLAYER_NAME,"Nadie"); if(erase) { Estacionamientos[i][eEnUso]=0; DestroyDynamic3DTextLabel(Estacionamientos[i][Etiqueta]); DestroyDynamic3DTextLabel(Estacionamientos[i][EtiquetaInterior]); DestroyDynamicPickup(Estacionamientos[i][Pickup]); } else CargarParking(i); }
        case RP_BIZ_MARKET: { InfoMercado[i][mDuenoID]=0; InfoMercado[i][mBandaID]=0; InfoMercado[i][mEnVenta]=1; format(InfoMercado[i][mDuenoN],40,"Nadie"); format(InfoMercado[i][mBandaN],80,"Nadie"); if(erase) { InfoMercado[i][mEnUso]=0; DestroyDynamic3DTextLabel(InfoMercado[i][mLabel]); DestroyDynamicPickup(InfoMercado[i][mPickup]); DestroyDynamicMapIcon(InfoMercado[i][mIcon]); } else CargarMerca(i); }
        case RP_BIZ_FACTORY: { RP_BizRemoveFactoryGuards(i); FABRICAS_INFO[i][f_FACCION_ID]=0; FABRICAS_INFO[i][f_VENTA]=0; if(erase) { RP_BizFactoryCleanup(i); DesocuparFabrica(i); FABRICAS_INFO[i][f_VALID]=false; } else CargarFabrica(i); }
    }
    if(!erase) RP_BizRefreshConfigured(t,i);
    printf("[Negocios ADMIN] Cuenta %d: %s tipo %d ID %d",PLAYER_INFO[p][pID],erase?"borrar":"quitar dueno",t,db);
    return SendClientMessage(p,-1,erase?"Negocio borrado, contratos y ofertas cancelados.":"Propietario retirado; negocio disponible para comprar.");
}
stock RP_PublicKind(const name[]) {
    if(!strcmp(name,"24/7",true) || !strcmp(name,"tienda",true) || !strcmp(name,"local",true) || !strcmp(name,"Tienda de autoservicio",true)) return 1;
    if(!strcmp(name,"restaurante",true) || !strcmp(name,"pizzeria",true) || !strcmp(name,"The Well Stacked Pizza",true)) return 2;
    if(!strcmp(name,"ropa",true) || !strcmp(name,"ZIP",true) || !strcmp(name,"Didder Sachs",true) || !strcmp(name,"Victim",true) || !strcmp(name,"Pro Laps",true) || !strcmp(name,"Binco",true) || !strcmp(name,"Sub Urban",true)) return 3;
    if(!strcmp(name,"bar",true)) return 4;
    if(!strcmp(name,"ferreteria",true)) return 5;
    if(!strcmp(name,"sexshop",true) || !strcmp(name,"Sex Shop",true)) return 6;
    return 0;
}
stock RP_PriceSlot(type,db,bool:create=false) {
    new free=-1;
    for(new i;i<sizeof RP_BizPrices;i++) {
        if(RP_BizPrices[i][bpType]==type && RP_BizPrices[i][bpDB]==db) return i;
        if(!RP_BizPrices[i][bpType] && free<0) free=i;
    }
    if(create && free>=0) { RP_BizPrices[free][bpType]=type; RP_BizPrices[free][bpDB]=db; return free; }
    return -1;
}
stock RP_PriceSet(type,db,price,currency) {
    new slot=RP_PriceSlot(type,db),q[256];
    if(slot<0) for(new n;n<sizeof RP_BizPrices;n++) if(!RP_BizPrices[n][bpType]) { slot=n; break; }
    if(slot<0) return 0;
    mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_business_prices (business_type,business_id,price,currency) VALUES (%d,%d,%d,%d) ON DUPLICATE KEY UPDATE price=VALUES(price),currency=VALUES(currency)",type,db,price,currency);
    if(!RP_BizSQL(q)) return 0;
    RP_BizPrices[slot][bpType]=type; RP_BizPrices[slot][bpDB]=db; RP_BizPrices[slot][bpPrice]=price; RP_BizPrices[slot][bpCurrency]=currency; return 1;
}
stock RP_PublicRefresh(i) {
    RP_EcoCashRefresh(i);
    if(IsValidDynamic3DTextLabel(RP_Public[i][pbLabel])) DestroyDynamic3DTextLabel(RP_Public[i][pbLabel]);
    if(IsValidDynamicPickup(RP_Public[i][pbPickup])) DestroyDynamicPickup(RP_Public[i][pbPickup]);
    if(!RP_Public[i][pbActive]) return 1;
    new text[420],coin[16],s=RP_PriceSlot(RP_BIZ_PUBLIC,RP_Public[i][pbID]);
    if(s<0) return 0;
    RP_BizCurrencyName(RP_BizPrices[s][bpCurrency],coin,sizeof coin);
    if(RP_Public[i][pbOwner]) format(text,sizeof text,"{37DB3F}%s {FFFFFF}| local #%d\nPropietario: {00AEFF}%s\n{FFFFFF}Pulsa [ F ]",RP_Public[i][pbName],RP_Public[i][pbID],RP_Public[i][pbOwnerName]);
    else format(text,sizeof text,"{37DB3F}%s {FFFFFF}| local #%d\n{00CC00}EN VENTA: %d %s\n{FFFFFF}/comprarnegocio local %d\nPulsa [ F ]",RP_Public[i][pbName],RP_Public[i][pbID],RP_BizPrices[s][bpPrice],coin,RP_Public[i][pbID]);
    RP_Public[i][pbLabel]=CreateDynamic3DTextLabel(text,-1,RP_Public[i][pbX],RP_Public[i][pbY],RP_Public[i][pbZ]+0.6,12.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0,0);
    RP_Public[i][pbPickup]=CreateDynamicPickup(1318,1,RP_Public[i][pbX],RP_Public[i][pbY],RP_Public[i][pbZ],0,0);
    return 1;
}
stock RP_PublicSuppressDoor(door) {
    for(new i;i<RP_PUBLIC_MAX;i++) if(RP_Public[i][pbID] && RP_Public[i][pbDoor]==door) return 1;
    for(new d;d<door;d++) if(RP_PublicKind(RP_OriginalDoors[d][rp_doorName]) && floatabs(RP_OriginalDoors[d][rp_doorX]-RP_OriginalDoors[door][rp_doorX])+floatabs(RP_OriginalDoors[d][rp_doorY]-RP_OriginalDoors[door][rp_doorY])<2.0) return RP_PublicSuppressDoor(d);
    return 0;
}
stock RP_PublicInit() {
    if(!RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_business_prices (business_type INT NOT NULL,business_id INT NOT NULL,price INT NOT NULL,currency INT NOT NULL,PRIMARY KEY(business_type,business_id)) ENGINE=InnoDB")) return 0;
    if(!RP_BizSQL("CREATE TABLE IF NOT EXISTS rp_public_businesses (id INT AUTO_INCREMENT PRIMARY KEY,door INT NULL UNIQUE,kind INT NOT NULL,name VARCHAR(64) NOT NULL,owner INT NOT NULL DEFAULT 0,owner_name VARCHAR(25) NOT NULL DEFAULT 'Nadie',active INT NOT NULL DEFAULT 1,x FLOAT NOT NULL,y FLOAT NOT NULL,z FLOAT NOT NULL,a FLOAT NOT NULL DEFAULT 0,ix FLOAT NOT NULL,iy FLOAT NOT NULL,iz FLOAT NOT NULL,ia FLOAT NOT NULL,interior INT NOT NULL,world INT NOT NULL) ENGINE=InnoDB")) return 0;
    new q[1024];
    for(new d;d<sizeof RP_OriginalDoors;d++) {
        new kind=RP_PublicKind(RP_OriginalDoors[d][rp_doorName]); if(!kind) continue;
        // Close duplicate reconstructed door entries share the same business.
        new bool:duplicate;
        for(new k;k<d;k++) if(RP_PublicKind(RP_OriginalDoors[k][rp_doorName]) && floatsqroot(floatpower(RP_OriginalDoors[d][rp_doorX]-RP_OriginalDoors[k][rp_doorX],2.0)+floatpower(RP_OriginalDoors[d][rp_doorY]-RP_OriginalDoors[k][rp_doorY],2.0))<2.0) duplicate=true;
        if(duplicate) continue;
        new Float:ix,Float:iy,Float:iz,Float:ia,interior,world;
        RP_PublicTemplate(d,kind,ix,iy,iz,ia,interior,world);
        mysql_format(handle_db,q,sizeof q,"INSERT IGNORE INTO rp_public_businesses (door,kind,name,x,y,z,ix,iy,iz,ia,interior,world) VALUES (%d,%d,'%e',%f,%f,%f,%f,%f,%f,%f,%d,%d)",d,kind,RP_OriginalDoors[d][rp_doorName],RP_OriginalDoors[d][rp_doorX],RP_OriginalDoors[d][rp_doorY],RP_OriginalDoors[d][rp_doorZ],ix,iy,iz,ia,interior,world);
        if(!RP_BizSQL(q)) return 0;
    }
    if(!RP_BizSQL("INSERT IGNORE INTO rp_business_prices SELECT 6,id,35,2 FROM rp_public_businesses")) return 0;
    new Cache:c=mysql_query(handle_db,"SELECT * FROM rp_business_prices",true),rows; cache_get_row_count(rows);
    if(mysql_errno(handle_db) || rows>sizeof RP_BizPrices) { if(c!=MYSQL_INVALID_CACHE) cache_delete(c); return 0; }
    for(new r;r<rows;r++) { cache_get_value_name_int(r,"business_type",RP_BizPrices[r][bpType]); cache_get_value_name_int(r,"business_id",RP_BizPrices[r][bpDB]); cache_get_value_name_int(r,"price",RP_BizPrices[r][bpPrice]); cache_get_value_name_int(r,"currency",RP_BizPrices[r][bpCurrency]); }
    if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
    c=mysql_query(handle_db,"SELECT * FROM rp_public_businesses ORDER BY id",true); cache_get_row_count(rows);
    if(mysql_errno(handle_db) || rows>RP_PUBLIC_MAX) { if(c!=MYSQL_INVALID_CACHE) cache_delete(c); return 0; }
    for(new r;r<rows;r++) {
        cache_get_value_name_int(r,"id",RP_Public[r][pbID]);
        new bool:isnull; cache_is_value_name_null(r,"door",isnull); if(isnull) RP_Public[r][pbDoor]=-1; else cache_get_value_name_int(r,"door",RP_Public[r][pbDoor]);
        cache_get_value_name_int(r,"kind",RP_Public[r][pbKind]); cache_get_value_name_int(r,"owner",RP_Public[r][pbOwner]);
        new active; cache_get_value_name_int(r,"active",active); RP_Public[r][pbActive]=bool:active;
        cache_get_value_name(r,"name",RP_Public[r][pbName],64); cache_get_value_name(r,"owner_name",RP_Public[r][pbOwnerName],25);
        cache_get_value_name_float(r,"x",RP_Public[r][pbX]); cache_get_value_name_float(r,"y",RP_Public[r][pbY]); cache_get_value_name_float(r,"z",RP_Public[r][pbZ]); cache_get_value_name_float(r,"a",RP_Public[r][pbA]);
        cache_get_value_name_float(r,"ix",RP_Public[r][pbInsideX]); cache_get_value_name_float(r,"iy",RP_Public[r][pbInsideY]); cache_get_value_name_float(r,"iz",RP_Public[r][pbInsideZ]); cache_get_value_name_float(r,"ia",RP_Public[r][pbInsideA]);
        cache_get_value_name_int(r,"interior",RP_Public[r][pbInterior]); cache_get_value_name_int(r,"world",RP_Public[r][pbWorld]);
    }
    if(c!=MYSQL_INVALID_CACHE) cache_delete(c);
    for(new i;i<rows;i++) RP_PublicRefresh(i);
    return 1;
}
stock RP_PublicEnter(playerid) {
    if(!RP_BizReady || GetPlayerInterior(playerid)!=0 || GetPlayerVirtualWorld(playerid)!=0) return 0;
    for(new i;i<RP_PUBLIC_MAX;i++) if(RP_BizValid(RP_BIZ_PUBLIC,i) && IsPlayerInRangeOfPoint(playerid,2.0,RP_Public[i][pbX],RP_Public[i][pbY],RP_Public[i][pbZ])) {
        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,-1,"Baja del vehiculo para entrar."),1;
        RP_PublicInside[playerid]=RP_Public[i][pbID];
        SetPosEntrar(playerid,RP_Public[i][pbInsideX],RP_Public[i][pbInsideY],RP_Public[i][pbInsideZ],RP_Public[i][pbInsideA],RP_Public[i][pbInterior],RP_Public[i][pbWorld],RP_Public[i][pbKind]==1?1:0); return 1;
    }
    // Block old access after an administrator moved/deleted an original door.
    for(new d;d<sizeof RP_OriginalDoors;d++) if(RP_PublicSuppressDoor(d) && IsPlayerInRangeOfPoint(playerid,2.0,RP_OriginalDoors[d][rp_doorX],RP_OriginalDoors[d][rp_doorY],RP_OriginalDoors[d][rp_doorZ])) return SendClientMessage(playerid,-1,"Este acceso comercial fue retirado o trasladado."),1;
    return 0;
}
stock RP_PublicExit(playerid) {
    if(!RP_BizReady) return 0;
    for(new i;i<RP_PUBLIC_MAX;i++) if(RP_Public[i][pbID] && GetPlayerInterior(playerid)==RP_Public[i][pbInterior] && GetPlayerVirtualWorld(playerid)==RP_Public[i][pbWorld] && IsPlayerInRangeOfPoint(playerid,2.5,RP_Public[i][pbInsideX],RP_Public[i][pbInsideY],RP_Public[i][pbInsideZ])) {
        RP_PublicInside[playerid]=0; SetPosEntrar(playerid,RP_Public[i][pbX],RP_Public[i][pbY],RP_Public[i][pbZ],RP_Public[i][pbA],0,0); return 1;
    }
    return 0;
}
stock RP_BizRefreshConfigured(type,index) {
    if(type==RP_BIZ_PUBLIC) return RP_PublicRefresh(index);
    new s=RP_PriceSlot(type,RP_BizDB(type,index)); if(s<0 || RP_BizHasOwner(type,index)) return 1;
    new coin[16],name[24],text[320]; RP_BizCurrencyName(RP_BizPrices[s][bpCurrency],coin,sizeof coin); RP_BizTypeName(type,name,sizeof name);
    format(text,sizeof text,"{37DB3F}%s #%d\n{00CC00}EN VENTA: %d %s\n{FFFFFF}/comprarnegocio %s %d",name,RP_BizDB(type,index),RP_BizPrices[s][bpPrice],coin,name,RP_BizDB(type,index));
    switch(type) {
        case RP_BIZ_PROPERTY: UpdateDynamic3DTextLabelText(PropInfo[index][pLabel],-1,text);
        case RP_BIZ_GAS: UpdateDynamic3DTextLabelText(Gasolineras[index][gTextoCompra],-1,text);
        case RP_BIZ_PARKING: UpdateDynamic3DTextLabelText(Estacionamientos[index][Etiqueta],-1,text);
        case RP_BIZ_MARKET: UpdateDynamic3DTextLabelText(InfoMercado[index][mLabel],-1,text);
        case RP_BIZ_FACTORY: UpdateDynamic3DTextLabelText(FABRICAS_INFO[index][f_LABELS][0],-1,text);
    }
    return 1;
}
stock RP_InitialCheck(p) {
    new t=RP_Quote[p][bqType],i=RP_Quote[p][bqIndex],s=RP_PriceSlot(t,RP_Quote[p][bqDB]);
    if(!RP_BizReady || !RP_BizLive(p) || !RP_BizValid(t,i) || RP_BizDB(t,i)!=RP_Quote[p][bqDB] || RP_BizHasOwner(t,i) || s<0 || gettime()>RP_Quote[p][bqExpiry]) return 0;
    if(RP_Quote[p][bqPrice]<1 || RP_Quote[p][bqPrice]>RP_BIZ_MAX_PRICE || RP_Quote[p][bqCurrency]<0 || RP_Quote[p][bqCurrency]>2) return 0;
    if(RP_BizPrices[s][bpPrice]!=RP_Quote[p][bqPrice] || RP_BizPrices[s][bpCurrency]!=RP_Quote[p][bqCurrency] || RP_BizBalance(p,RP_Quote[p][bqCurrency])<RP_Quote[p][bqPrice]) return 0;
    if(GetPlayerInterior(p)!=0 || GetPlayerVirtualWorld(p)!=0) return 0;
    new Float:x,Float:y,Float:z; RP_BizPosition(t,i,x,y,z); if(!IsPlayerInRangeOfPoint(p,3.0,x,y,z)) return 0;
    if(!RP_BizVipCanBuy(p,t)) return 0;
    switch(t) {
        case RP_BIZ_PROPERTY: {
            if(SlotPropiedad(p)<0 || PLAYER_INFO[p][@Nivel]<PropInfo[i][pNivel]) return 0;
        }
        case RP_BIZ_GAS: if(PLAYER_INFO[p][@Nivel]<Gasolineras[i][gNivel]) return 0;
        case RP_BIZ_PARKING: if(ObtenerEstacionamientos(p)>=2 || PLAYER_INFO[p][@Nivel]<Estacionamientos[i][Nivel]) return 0;
        case RP_BIZ_MARKET,RP_BIZ_FACTORY: {
            if(PLAYER_INFO[p][pFaccion]<=1 || PLAYER_INFO[p][pRango]!=8) return 0;
            if(t==RP_BIZ_FACTORY && TieneFabrica(PLAYER_INFO[p][pFaccion])) return 0;
            if(t==RP_BIZ_MARKET) for(new m=1;m<MAX_MERCADOS;m++) if(RP_BizValid(t,m) && InfoMercado[m][mBandaID]==PLAYER_INFO[p][pFaccion] && !InfoMercado[m][mEnVenta]) return 0;
        }
    }
    return 1;
}
CMD:comprarnegocio(playerid,params[]) {
    if(!RP_BizReady || !RP_BizLive(playerid)) return 1;
    if (params[0] != EOS && !strcmp(params,"menu",true)) return RP_BuyDialog(playerid);
    new typeName[24],db,type,index=-1;
    if(!strlen(params)) {
        type=RP_BIZ_PUBLIC;
        for(new i;i<RP_PUBLIC_MAX;i++) if(RP_BizValid(type,i) && GetPlayerInterior(playerid)==0 && GetPlayerVirtualWorld(playerid)==0 && IsPlayerInRangeOfPoint(playerid,3.0,RP_Public[i][pbX],RP_Public[i][pbY],RP_Public[i][pbZ])) { index=i; break; }
    } else {
        if(sscanf(params,"s[24]d",typeName,db)) return SendClientMessage(playerid,-1,"Uso: /comprarnegocio [tipo] [ID negocio]. Sin parametros compra el local cercano.");
        type=RP_BizType(typeName); index=RP_BizFind(type,db);
    }
    if(index<0) return SendClientMessage(playerid,-1,"No se encontro ese negocio.");
    if(RP_Quote[playerid][bqProcessing]) return SendClientMessage(playerid,-1,"Espera a que termine la compra pendiente.");
    new s=RP_PriceSlot(type,RP_BizDB(type,index)); if(s<0) return SendClientMessage(playerid,-1,"Usa /comprar con el tipo del negocio para su compra original.");
    RP_Quote[playerid][bqType]=type; RP_Quote[playerid][bqIndex]=index; RP_Quote[playerid][bqDB]=RP_BizDB(type,index);
    RP_Quote[playerid][bqPrice]=RP_BizPrices[s][bpPrice]; RP_Quote[playerid][bqCurrency]=RP_BizPrices[s][bpCurrency]; RP_Quote[playerid][bqExpiry]=gettime()+60; RP_Quote[playerid][bqGeneration]++;
    if(!RP_InitialCheck(playerid)) return SendClientMessage(playerid,-1,"El negocio debe estar libre; acercate a su entrada y revisa saldo, nivel y limites.");
    return RP_BuyShow(playerid);
}
stock RP_BizPurchaseRoute(playerid,const item[]) {
    new type=RP_BizType(item); if(!type) return 0;
    for(new i,limit=RP_BizLimit(type);i<limit;i++) if(RP_BizValid(type,i) && RP_PriceSlot(type,RP_BizDB(type,i))>=0) {
        new Float:x,Float:y,Float:z; RP_BizPosition(type,i,x,y,z);
        if(GetPlayerInterior(playerid)==0 && GetPlayerVirtualWorld(playerid)==0 && IsPlayerInRangeOfPoint(playerid,15.0,x,y,z)) {
            new params[64],name[24]; RP_BizTypeName(type,name,sizeof name); format(params,sizeof params,"%s %d",name,RP_BizDB(type,i)); callcmd::comprarnegocio(playerid,params); return 1;
        }
    }
    return 0;
}
stock RP_BizLimit(t) {
    switch(t) { case RP_BIZ_PROPERTY: return MAX_PROPIEDADES; case RP_BIZ_GAS: return MAX_GASOLINERAS; case RP_BIZ_PARKING: return MAX_GARAGES; case RP_BIZ_MARKET: return MAX_MERCADOS; case RP_BIZ_FACTORY: return MAX_FABRICAS; case RP_BIZ_PUBLIC: return RP_PUBLIC_MAX; } return 0;
}
forward RP_InitialCommit(p,session,generation);
public RP_InitialCommit(p,session,generation) {
    if(p<0 || p>=MAX_PLAYERS || RP_BizSession[p]!=session || RP_Quote[p][bqGeneration]!=generation || !RP_Quote[p][bqProcessing]) return 1;
    RP_Quote[p][bqProcessing]=false;
    if(!RP_InitialCheck(p)) return SendClientMessage(p,-1,"La compra fue cancelada: cambiaron el precio, el propietario o los requisitos.");
    new t=RP_Quote[p][bqType],i=RP_Quote[p][bqIndex],db=RP_Quote[p][bqDB],price=RP_Quote[p][bqPrice],cur=RP_Quote[p][bqCurrency],slot=-1,q[1024];
    if(t==RP_BIZ_PROPERTY) slot=SlotPropiedad(p);
    if(!RP_BizSQL("START TRANSACTION")) return 1;
    switch(t) {
        case RP_BIZ_PUBLIC: mysql_format(handle_db,q,sizeof q,"UPDATE rp_public_businesses SET owner=%d,owner_name='%e' WHERE id=%d AND owner=0 AND active=1",PLAYER_INFO[p][pID],PLAYER_INFO[p][Nickname],db);
        case RP_BIZ_PROPERTY: mysql_format(handle_db,q,sizeof q,"UPDATE propiedades SET IDPropietario=%d,Propietario='%e',EnVenta=0 WHERE ID=%d AND EnVenta=1",PLAYER_INFO[p][pID],PLAYER_INFO[p][Nickname],db);
        case RP_BIZ_GAS: mysql_format(handle_db,q,sizeof q,"UPDATE gasolineras SET DuenoID=%d,Nombre='%e' WHERE ID=%d AND DuenoID<=0",PLAYER_INFO[p][pID],PLAYER_INFO[p][Nickname],db);
        case RP_BIZ_PARKING: mysql_format(handle_db,q,sizeof q,"UPDATE estacionamientos SET Propietario=%d WHERE ID=%d AND Propietario<=0",PLAYER_INFO[p][pID],db);
        case RP_BIZ_MARKET: mysql_format(handle_db,q,sizeof q,"UPDATE mercados SET DuenoID=%d,DuenoN='%e',BandaID=%d,BandaN='%e',EnVenta=0 WHERE ID=%d AND EnVenta=1",PLAYER_INFO[p][pID],PLAYER_INFO[p][Nickname],PLAYER_INFO[p][pFaccion],BandasInfo[PLAYER_INFO[p][pFaccion]][BNombre],db);
        case RP_BIZ_FACTORY: mysql_format(handle_db,q,sizeof q,"UPDATE fabricas SET BandaID=%d,EnVenta=1 WHERE ID=%d AND EnVenta=0",PLAYER_INFO[p][pFaccion],db);
    }
    new bool:ok=bool:RP_BizSQL(q,true);
    new cash=RP_BizBalance(p,0),gz=RP_BizBalance(p,1),coins=RP_BizBalance(p,2); switch(cur) { case 0: cash-=price; case 1: gz-=price; case 2: coins-=price; }
    if(t==RP_BIZ_PROPERTY) mysql_format(handle_db,q,sizeof q,"UPDATE usuarios SET Money=%d,Moneda=%d,totems=%d,CasaID%d=%d WHERE ID=%d",cash,gz,coins,slot+1,db,PLAYER_INFO[p][pID]);
    else mysql_format(handle_db,q,sizeof q,"UPDATE usuarios SET Money=%d,Moneda=%d,totems=%d WHERE ID=%d",cash,gz,coins,PLAYER_INFO[p][pID]);
    if(ok) ok=bool:RP_BizSQL(q,true);
    mysql_format(handle_db,q,sizeof q,"INSERT INTO rp_business_sales (business_type,business_id,seller_id,buyer_id,price,currency) VALUES (%d,%d,0,%d,%d,%d)",t,db,PLAYER_INFO[p][pID],price,cur);
    if(ok) ok=bool:RP_BizSQL(q);
    if(!ok || !RP_BizSQL("COMMIT")) { RP_BizSQL("ROLLBACK"); return SendClientMessage(p,-1,"No se pudo guardar la compra. No se cobro."); }
    RP_BizChangeBalance(p,cur,-price);
    switch(t) {
        case RP_BIZ_PUBLIC: { RP_Public[i][pbOwner]=PLAYER_INFO[p][pID]; format(RP_Public[i][pbOwnerName],25,"%s",PLAYER_INFO[p][Nickname]); RP_PublicRefresh(i); }
        case RP_BIZ_PROPERTY: { PLAYER_INFO[p][CasaID][slot]=db; PropInfo[i][pIDPropietario]=PLAYER_INFO[p][pID]; PropInfo[i][pEnVenta]=0; format(PropInfo[i][pPropietario],40,"%s",PLAYER_INFO[p][Nickname]); BorrarLabelCasa(i); CargarPropiedad(i); }
        case RP_BIZ_GAS: { Gasolineras[i][gDuenoID]=PLAYER_INFO[p][pID]; format(Gasolineras[i][gaNombre],25,"%s",PLAYER_INFO[p][Nickname]); CargarGasolinera(i); }
        case RP_BIZ_PARKING: { Estacionamientos[i][Dueno]=PLAYER_INFO[p][pID]; format(Estacionamientos[i][DuenoName],MAX_PLAYER_NAME,"%s",PLAYER_INFO[p][Nickname]); CargarParking(i); }
        case RP_BIZ_MARKET: { InfoMercado[i][mDuenoID]=PLAYER_INFO[p][pID]; InfoMercado[i][mBandaID]=PLAYER_INFO[p][pFaccion]; InfoMercado[i][mEnVenta]=0; format(InfoMercado[i][mDuenoN],40,"%s",PLAYER_INFO[p][Nickname]); format(InfoMercado[i][mBandaN],80,"%s",BandasInfo[PLAYER_INFO[p][pFaccion]][BNombre]); CargarMerca(i); }
        case RP_BIZ_FACTORY: { FABRICAS_INFO[i][f_FACCION_ID]=PLAYER_INFO[p][pFaccion]; FABRICAS_INFO[i][f_VENTA]=1; CargarFabrica(i); }
    }
    return SendClientMessage(p,-1,"Negocio comprado y guardado. Consulta /misnegocios y /ayuda negocios.");
}
hook OnPlayerConnect(playerid) { RP_BuyCount[playerid]=0; RP_BuyVisible[playerid]=false; RP_BuyTimer[playerid]=0; RP_PublicInside[playerid]=0; RP_Quote[playerid][bqExpiry]=0; RP_Quote[playerid][bqProcessing]=false; RP_Quote[playerid][bqGeneration]++; RP_AdminAction[playerid]=0; return 1; }
hook OnPlayerDisconnect(playerid,reason) { RP_BuyHide(playerid,false); RP_Quote[playerid][bqGeneration]++; RP_Quote[playerid][bqProcessing]=false; RP_AdminAction[playerid]=0; return 1; }
hook OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
    if(dialogid==RP_PUBLIC_BUY) {
        if(!response) return RP_BuyCancel(playerid);
        return RP_BuyConfirm(playerid);
    }
    if(dialogid==RP_BIZ_ADMIN_CONFIRM) {
        new action=RP_AdminAction[playerid]; RP_AdminAction[playerid]=0;
        if(!response || !action || !RP_BizAdmin(playerid)) return 1;
        new i=RP_BizFind(RP_AdminType[playerid],RP_AdminDB[playerid]); if(i<0) return SendClientMessage(playerid,-1,"Ese negocio ya no existe.");
        if(gettime()>GetPVarInt(playerid,"RP_BizAdminExpiry")) return SendClientMessage(playerid,-1,"La confirmacion vencio; repite el comando.");
        mysql_tquery(handle_db,"SELECT 1","RP_AdminEditCommit","ddddddffffd",playerid,RP_BizSession[playerid],action==2?4:3,RP_AdminType[playerid],RP_AdminDB[playerid],0,0.0,0.0,0.0,0.0,GetPVarInt(playerid,"RP_BizExpectedOwner")); return 1;
    }
    return 1;
}
