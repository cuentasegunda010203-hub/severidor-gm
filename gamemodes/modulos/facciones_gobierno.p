// Recupera solamente los registros de gobierno ausentes, antes de cargar las facciones.
stock RP_CoreFactionsEnsure() {
    new Cache:result;
    result=mysql_query(handle_db,"INSERT INTO facciones (id,Nombre,Lider,tipobanda,FabricaM,Veh1,Veh2,Veh3,Veh4,Veh5,Cs1,Cs2,Cs3,Cs4,Cs5,Cs6,Cs7,cuentaterris,Webhook,Mejoras,EnUso,Color,MaxIntegrantes,Rango1,Rango2,Rango3,Rango4,Rango5,Rango6,Rango7,Rango8) SELECT 1,'San Andreas Police Department','Gobierno','Gobierno',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,1,865730559,100,'Cadete','Oficial','Cabo','Sargento','Teniente','Capitan','Subjefe','Jefe de Policia' WHERE NOT EXISTS (SELECT 1 FROM facciones WHERE id=1);");
    if(cache_is_valid(result)) cache_delete(result);
    if(mysql_errno(handle_db)) return print("[Facciones] No se pudo recuperar el registro base; revisa MySQL."),0;
    result=mysql_query(handle_db,"INSERT INTO facciones (id,Nombre,Lider,tipobanda,FabricaM,Veh1,Veh2,Veh3,Veh4,Veh5,Cs1,Cs2,Cs3,Cs4,Cs5,Cs6,Cs7,cuentaterris,Webhook,Mejoras,EnUso,Color,MaxIntegrantes,Rango1,Rango2,Rango3,Rango4,Rango5,Rango6,Rango7,Rango8) SELECT 2,'Ejercito de San Andreas','Gobierno','Gobierno',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,1,-1250477313,100,'Recluta','Soldado','Cabo','Sargento','Teniente','Capitan','Coronel','General' WHERE NOT EXISTS (SELECT 1 FROM facciones WHERE id=2);");
    if(cache_is_valid(result)) cache_delete(result);
    if(mysql_errno(handle_db)) return print("[Facciones] No se pudo recuperar el registro base; revisa MySQL."),0;
    result=mysql_query(handle_db,"INSERT INTO facciones (id,Nombre,Lider,tipobanda,FabricaM,Veh1,Veh2,Veh3,Veh4,Veh5,Cs1,Cs2,Cs3,Cs4,Cs5,Cs6,Cs7,cuentaterris,Webhook,Mejoras,EnUso,Color,MaxIntegrantes,Rango1,Rango2,Rango3,Rango4,Rango5,Rango6,Rango7,Rango8) SELECT 3,'San Andreas Fire Department','Gobierno','Gobierno',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,1,-1237238017,100,'Aspirante','Bombero','Conductor','Cabo','Sargento','Teniente','Subjefe','Jefe de Bomberos' WHERE NOT EXISTS (SELECT 1 FROM facciones WHERE id=3);");
    if(cache_is_valid(result)) cache_delete(result);
    if(mysql_errno(handle_db)) return print("[Facciones] No se pudo recuperar el registro base; revisa MySQL."),0;
    return 1;
}
