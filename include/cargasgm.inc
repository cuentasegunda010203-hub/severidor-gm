//asdasdasd
new ActorPrueba,ActorPrueba2,ActorGST,ActorGST2,ActorGST3,ActorGST4,ActorGST5,CiudadanoPerdido,PizzeroActor,ActorOrinando,PoliciaUnity,GordoGlenPark,Accidente,GuardaespaldasAlhambra,Chulo,Abuelita,PoliFuma,PoliCansado,PoliEntrada;
new GuardiaESP, GuardiaESP2,SacaDinero,Sentado,Sentada,SeguridadBar,Bankera,Bankero,negrobaila,mujerbaila,mujerchata,hombrechata,dijey,papel,Strip[50],Stripx[50];
new vendedormc[20],actors[20],Guardia3,Guardia4,Guardia6,Guardia7,Guardia8,Guardia12,Entrenador,Entrenador2,IslaSeguridad,IslaSeguridad2,Hombreemisora,Chicataxista,Minero,Minero1,Avionista,vendedorautos[20],PoliHabla1,PoliHabla2,ChicoBarRie,tiendav,ChicoBar;
stock LoadActors()
{
Strip[1] = CreateActor(87, 1213.2875,-3.9009,1001.3281,261.5670);
ApplyActorAnimation(Strip[1], "STRIP","STR_Loop_A",4.1,7,5,1,1,0);
Strip[2] = CreateActor(178, 1219.3636,-6.2801,1001.3281,266.2902);
Strip[3] = CreateActor(244, 1202.9968,-8.4485,1002.0255,266.6595);
Strip[4] = CreateActor(245, 1202.8573,8.9183,1000.9219,133.9969);
Strip[5] = CreateActor(124, 1206.0651,-13.5290,1000.9219,0.0000);
ApplyActorAnimation(Strip[5],"COP_AMBIENT", "Coplook_loop",4.1,7,5,1,1,0);
Strip[7] = CreateActor(152, 1208.3020,-6.1708,1001.3281,176.0823+45);
Strip[8] = CreateActor(87, 1213.2875,-3.9009,1001.3281,261.5670);
Strip[9] = CreateActor(246, 1221.3643,8.4586,1001.3356,261.5670);
Strip[10] = CreateActor(90,1206.2085,-0.9576,1000.9219,174.0048);
ApplyActorAnimation(Strip[10], "STRIP","PUN_LOOP", 4.1,7,5,1,1,0);
Strip[11] = CreateActor(171, 501.7544,-20.4735,1000.6797,85.9272);
SetActorVirtualWorld(Strip[11], 3);

Stripx[2] = CreateActor(178,1203.4559,16.1060,1000.9219,325.5020);
SetActorVirtualWorld(Stripx[2], 9999);
Stripx[3] = CreateActor(244, 1203.4559,16.1060,1000.9219,325.5020);
SetActorVirtualWorld(Stripx[3], 9999);
Stripx[4] = CreateActor(245, 1203.4559,16.1060,1000.9219,325.5020);
SetActorVirtualWorld(Stripx[4], 9999);
Stripx[7] = CreateActor(152, 1203.4559,16.1060,1000.9219,325.5020);
SetActorVirtualWorld(Stripx[7], 9999);
Stripx[8] = CreateActor(87, 1203.4559,16.1060,1000.9219,325.5020);
SetActorVirtualWorld(Stripx[8], 9999);
Stripx[9] = CreateActor(246, 1203.4559,16.1060,1000.9219,325.5020);
SetActorVirtualWorld(Stripx[9], 9999);
for(new b = 0, bj = sizeof(Strip); b < bj; b++)
{
if(IsValidActor(Strip[b])) SetActorVirtualWorld(Strip[b], 5);
}
vendedormc[0] = CreateActor(149, 2111.3699,-1875.2085,13.5469,355.9907);//chaleco
ApplyActorAnimation(vendedormc[0], "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
vendedormc[1] = CreateActor(5, 2108.6609,-1875.2838,13.5469,358.5758); // armas
ApplyActorAnimation(vendedormc[1], "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
vendedormc[2] = CreateActor(28, 2113.8672,-1875.1899,13.5469,2.4611); //bates
ApplyActorAnimation(vendedormc[2], "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
vendedormc[3] = CreateActor(65, 2116.0447,-1875.2800,13.5469,3.5265); //c4
ApplyActorAnimation(vendedormc[3], "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
tiendav = CreateActor(87,1182.8756,-1128.6050,24.0500,357.6064);
ApplyActorAnimation(tiendav, "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
//SAPD//
actors[1] = CreateActor(280, 246.404174,120.395568,1003.266967,178.847152);
actors[2] = CreateActor(307, 238.564437,112.894973,1003.218750,268.148071);
actors[3] = CreateActor(300, 253.797485,117.371421,1003.218750,93.306335);
actors[4] = CreateActor(71, 219.338485,116.030166,999.015625,180.895050);
//Salón de eventos//
actors[6] = CreateActor(64, 1208.2064,-6.2447,1001.3281,180.9896);
actors[7] = CreateActor(85, 1221.3612,8.5217,1001.3356,131.3608);
actors[8] = CreateActor(152, 1215.6638,-6.3362,1001.3281,95.1821);
actors[9] = CreateActor(178, 1219.7606,-6.4455,1001.3281,178.2887);
//Pizzería//
actors[12] = CreateActor(25, -1253.4526,2118.3821,1246.5457,175.7945);
actors[13] = CreateActor(163, -1245.2422,2116.1465,1246.5457,29.4371);
actors[14] = CreateActor(223, -1248.9423,2095.2004,1246.6360,72.3647);
//Guardia3 LVPD
Guardia3 = CreateActor(282, 2238.222412, 2449.497802, 11.037217, 89.597267);
SetActorVirtualWorld(Guardia3, 0);
//Guardia4 camionero
Guardia4 = CreateActor(71, -1674.989624, 5.721164, 3.554687, 226.057571);
SetActorVirtualWorld(Guardia4, 0);
Guardia6 = CreateActor(267, -1701.200439, 688.873352, 24.890625, 84.270515);
SetActorVirtualWorld(Guardia6, 0);
Guardia7 = CreateActor(301, -1572.609497, 657.566528, 7.187500, 274.657836);
SetActorVirtualWorld(Guardia7, 0);
Guardia8 = CreateActor(281, 233.047821, 166.339050, 1003.023437, 268.459442);
SetActorVirtualWorld(Guardia8, 7);
Entrenador = CreateActor(49, 761.044006, -31.975740, 1000.585937, 268.381744);
SetActorVirtualWorld(Entrenador, 0);
Entrenador2 = CreateActor(81, 763.955139, -75.041831, 1000.656250, 357.676940);
SetActorVirtualWorld(Entrenador2, 0);
//actores by Prócton
CreateActor(57, 1810.978393, -1300.798950, 65.812500, 51.239631);
CreateActor(3, 1804.497436, -1303.756591, 93.039062, 87.539863);
CreateActor(141, 1803.932373, -1287.233032, 13.642095, 114.823440);
CreateActor(225, 2785.956054, -2577.147216, 3.191699, 46.244449);
CreateActor(80, 767.066894, 14.329621, 1000.700012, 181.610961);
CreateActor(71, 2704.813964, -2514.520263, 13.649707, 89.008201);
CreateActor(131, -32.635578, 53.932895, 3.117187, 341.870483);
CreateActor(128, 216.828369, -233.098983, 1.778618, 358.369598);
CreateActor(261, 194.831649, -231.076309, 1.778618, 273.142181);
//actores fabrica
CreateActor(30, 35.614139, -292.886352, 2.114686, 283.343627);
CreateActor(47, 59.118892, -294.536254, 1.578125, 2.304267);
CreateActor(183, 83.618896, -315.884796, 1.578125, 359.315856);
CreateActor(202, 93.779579, -311.980926, 1.578125, 89.556777);
Guardia12 = CreateActor(71, -76.284889, -382.248352, 5.366365, 92.477394);
SetActorVirtualWorld(Guardia12, 0);
Hombreemisora = CreateActor(3, 393.601165, 183.666946, 1040.115600, 358.571380);
SetActorVirtualWorld(Hombreemisora, 5);
IslaSeguridad = CreateActor(71, 833.686462, -2958.572998, 12.137064, 55.661621);
SetActorVirtualWorld(IslaSeguridad, 0);
IslaSeguridad2 = CreateActor(71, 833.256469, -2959.604736, 12.121186, 218.549713);
SetActorVirtualWorld(IslaSeguridad2, 0);
Guardia8 = CreateActor(306, 219.108505, 1416.221191, 1091.199951, 76.925292);
SetActorVirtualWorld(Guardia8, 15);
Minero = CreateActor(153, -384.346038, 2199.279052, 25.410528, 269.214111);
SetActorVirtualWorld(Minero, 1);
Minero1 = CreateActor(27, -381.239776, 2193.452880, 25.410528, 354.273162);
ApplyActorAnimation(Minero1, "ped", "SEAT_down", 4.000000, 0, 0, 0, 1, 0);
SetActorVirtualWorld(Minero1, 1);
Avionista = CreateActor(61, 415.143218, 2537.129150, 19.148437, 151.044891);
SetActorVirtualWorld(Avionista, 0);
CreateActor(163, 1222.399536, 4.901185, 1000.921875, 99.739120);  //Seguridad
CreateActor(163, 1200.141601, 12.485798, 1000.921875, 268.917297);  //Seguridad
Chicataxista = CreateActor(150, -2023.212890, -113.827125, 1038.818725, 114.691848);
ApplyActorAnimation(Chicataxista, "ped", "SEAT_down", 4.000000, 0, 0, 0, 1, 0);
SetActorVirtualWorld(Chicataxista, 5);
SetActorVirtualWorld(actors[1], 1);
SetActorVirtualWorld(actors[2], 1);
SetActorVirtualWorld(actors[3], 1);
SetActorVirtualWorld(actors[4], 1);
SetActorVirtualWorld(actors[5], 0);
SetActorVirtualWorld(actors[12], 1);
SetActorVirtualWorld(actors[13], 1);
SetActorVirtualWorld(actors[6], 12);
ApplyActorAnimation(actors[6], "STRIP","STR_Loop_A", 4.1,1,0,0,1,0);
SetActorVirtualWorld(actors[7], 12);
ApplyActorAnimation(actors[7], "STRIP","STR_Loop_A", 4.1,1,0,0,1,0);
SetActorVirtualWorld(actors[8], 12);
ApplyActorAnimation(actors[8], "STRIP","STR_Loop_A", 4.1,1,0,0,1,0);
SetActorVirtualWorld(actors[9], 12);
ApplyActorAnimation(actors[9], "STRIP","STR_Loop_A", 4.1,1,0,0,1,0);
SetActorVirtualWorld(actors[14], 1);
ApplyActorAnimation(actors[14], "ped", "SEAT_down", 4.1,0,0,0,1,0);
//vendedorautos
vendedorautos[0] = CreateActor(259, 1454.7415,-1787.1669,13.8853, 0.0);
ApplyActorAnimation(vendedorautos[0], "ped", "SEAT_down", 4.000000, 0, 0, 0, 1, 0);
vendedorautos[1] = CreateActor(259, 537.4973,-1293.9254,17.2422, 0.0);
ApplyActorAnimation(vendedorautos[1],"SMOKING", "M_smklean_loop",4.1,0,1,1,1,1);
vendedorautos[2] = CreateActor(259, 2130.1746,-1151.3208,24.0419, 0.0);
ApplyActorAnimation(vendedorautos[2],"SMOKING", "M_smklean_loop",4.1,0,1,1,1,1);
vendedorautos[3] = CreateActor(259, 1643.0615,-1888.9283,13.5552, 184.3094);
ApplyActorAnimation(vendedorautos[3],"SMOKING", "M_smklean_loop",4.1,0,1,1,1,1);
vendedorautos[4] = CreateActor(259, -1951.4429,277.2766,35.4688,90.6770);
ApplyActorAnimation(vendedorautos[4], "COP_AMBIENT", "Coplook_loop", 4.0, 1, 1, 1, 0, 1);
ApplyActorAnimation(vendedorautos[3],"SMOKING", "M_smklean_loop",4.1,0,1,1,1,1);
// Seguridad Gobierno.
ActorPrueba = CreateActor(163, 1482.867187, -1749.45, 13.546875, 0.0);
ApplyActorAnimation(ActorPrueba, "DEALER", "DEALER_IDLE_01", 4.0, 1, 0, 1, 0, 0);
SetActorInvulnerable(ActorPrueba, true);
ActorPrueba2 = CreateActor(164, 1476.726806, -1749.45, 13.546875, 0.0);
ApplyActorAnimation(ActorPrueba2, "GRAVEYARD","prst_loopa", 4.0, 1, 0, 1, 0, 0);
SetActorInvulnerable(ActorPrueba2, false);
ActorGST = CreateActor(106, 2472.077880, -1683.179687, 13.466216, 18.715963);
ApplyActorAnimation(ActorGST, "MISC", "Idle_Chat_02", 4.0, 1, 0, 1, 0, 0);
ActorGST2 = CreateActor(107, 2471.089599, -1682.367065, 13.461606, 252.850814);
ApplyActorAnimation(ActorGST2, "MISC", "Idle_Chat_02", 4.0, 1, 0, 1, 0, 0);
ActorGST3 = CreateActor(19, 2487.855224, -1649.080688, 13.578062, 179.031860);
ApplyActorAnimation(ActorGST3, "MISC","SEAT_LR", 4.0, 1, 0, 1, 0, 0);
ActorGST4 = CreateActor(28, 2464.729492, -1651.682739, 13.470606, 182.333404);
ApplyActorAnimation(ActorGST4, "SMOKING","M_smklean_loop", 4.0, 1, 0, 1, 0, 0);
ActorGST5 = CreateActor(105, 2533.216796, -1668.503417, 15.166041, 90.926933);
ApplyActorAnimation(ActorGST5, "RAPPING","RAP_C_Loop", 4.0, 1, 0, 1, 0, 0);
CiudadanoPerdido = CreateActor(37, 1933.427001, -1763.058349, 13.546875, 329.391998);
ApplyActorAnimation(CiudadanoPerdido, "GANGS","smkcig_prtl", 4.0, 1, 0, 1, 0, 0);
CreateActor(155, 2101.368164, -1813.309326, 13.554687, 91.256454); // Pizzero.
// 2 Pizzeros atendiendo.
CreateActor(155, 376.714202, -117.082450, 1001.492187, 183.487182);
CreateActor(205, 374.882507, -113.622993, 1001.492187, 2.088534);
PizzeroActor = CreateActor(167, 2100.587402, -1812.249511, 13.554687, 216.068786);
ApplyActorAnimation(PizzeroActor, "MISC", "Idle_Chat_02", 4.0, 1, 0, 1, 0, 0);
ActorOrinando = CreateActor(45, 2192.138916, -1716.468139, 13.619745, 234.764038);
ApplyActorAnimation(ActorOrinando, "Freeweights", "gym_free_B",4.0,1,0,1,0,0);
PoliciaUnity = CreateActor(280, 1811.891845, -1878.977905, 13.570352, 269.832733);
ApplyActorAnimation(PoliciaUnity, "DEALER", "DEALER_IDLE_01", 4.0, 1, 0, 1, 0, 0);
GordoGlenPark = CreateActor(5, 1861.351074, -1377.398193, 13.562500, 92.814888);
ApplyActorAnimation(GordoGlenPark, "CRACK", "crckidle1", 4.0, 1, 0, 1, 0, 0);
Accidente = CreateActor(16, 1928.518066, -1495.239990, 3.293456, 92.107200);
ApplyActorAnimation(Accidente, "MISC","Hiker_Pose", 4.0, 1, 0, 1, 0, 0);
CreateActor(166, 1830.317138, -1685.308471, 13.546875, 88.788421); // Negro Alhambra.
GuardaespaldasAlhambra = CreateActor(163, 1832.002929, -1680.25, 13.315485, 182.974868);
ApplyActorAnimation(GuardaespaldasAlhambra, "POLICE","CopTraf_Come", 4.0, 1, 0, 1, 0, 0);
CreateActor(12, 1830.408691, -1648.066650, 13.546875, 144.666427); // Chica Alhambra
CreateActor(55, 1829.989746, -1649.549804, 13.546875, 356.690673); // Chica 2
Chulo = CreateActor(296, 1828.836669, -1648.052612, 13.546875, 242.322967); //Chulo
ApplyActorAnimation(Chulo, "RAPPING","RAP_A_Loop", 4.0, 1, 0, 1, 0, 0);
Abuelita = CreateActor(10, 1723.837890, -1720.298583, 13.540523, 88.080329);
ApplyActorAnimation(Abuelita, "DEALER", "DEALER_DEAL", 4.0, 1, 0, 1, 0, 0);
PoliFuma = CreateActor(265, 1547.009277, -1668.111206, 13.566131, 131.802383);
ApplyActorAnimation(PoliFuma, "SMOKING","M_smk_in", 4.0, 1, 0, 1, 0, 0);
PoliCansado = CreateActor(266, 1541.322998, -1677.312377, 13.552323, 95.591743);
ApplyActorAnimation(PoliCansado, "DEALER", "DEALER_IDLE_01", 4.0, 1, 0, 1, 0, 0);
PoliEntrada = CreateActor(280, 1552.910278, -1673.570922, 16.195312, 90.883155);
ApplyActorAnimation(PoliEntrada, "GRAVEYARD","prst_loopa", 4.0, 1, 0, 1, 0, 0);
PoliHabla1 = CreateActor(275, 1538.249633, -1644.277709, 13.546875, 178.802688);
ApplyActorAnimation(PoliHabla1, "MISC", "Idle_Chat_02", 4.0, 1, 0, 1, 0, 0);
PoliHabla2 = CreateActor(281, 1538.308105, -1646.506103, 13.546875, 358.971099);
ApplyActorAnimation(PoliHabla2, "MISC", "Idle_Chat_02", 4.0, 1, 0, 1, 0, 0);
/// Actors - VVZ.
CreateActor(111, 1433.800781, -1880.8, 13.546875, 0.0);
CreateActor(112, 1418.787719, -1880.8, 13.546875, 0.0);
ChicoBarRie = CreateActor(20, 1575.546997, -1887.168090, 13.558238, 61.486454);
ApplyActorAnimation(ChicoBarRie, "RAPPING", "Laugh_01", 4.0, 1, 0, 1, 0, 0);
ChicoBar = CreateActor(56, 1574.649780, -1886.714355, 13.558128, 199.699783);
ApplyActorAnimation(ChicoBar, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 1, 0, 0);
/// ESP (Piscina Municipal)
CreateActor(166, 1137.372070, -1762.117431, 13.595738, 5.776687); // Guardia.
GuardiaESP = CreateActor(164, 1062.632202, -1731.940795, 13.758134, 182.474975);
ApplyActorAnimation(GuardiaESP, "MISC","Seat_talk_01", 4.0, 1, 0, 1, 0, 0); //asiento 5
GuardiaESP2 = CreateActor(165, 1061.490722, -1732.510620, 13.740871, 291.452056);
ApplyActorAnimation(GuardiaESP2, "MISC", "Idle_Chat_02", 4.0, 1, 0, 1, 0, 0); //  /talk
CreateActor(163, 1068.849487, -1731.774902, 13.778193, 183.165527); // Guardia Parado.
/// Ammu Nation
SacaDinero = CreateActor(59, 1366.061767, -1296.653198, 13.546875, 277.166748);
ApplyActorAnimation(SacaDinero, "DEALER", "DEALER_DEAL", 4.0, 1, 0, 1, 0, 0); //  /En cajero.
Sentado = CreateActor(7, 1366.298095, -1293.704223, 13.546875, 87.244537);
ApplyActorAnimation(Sentado, "ped", "SEAT_down", 4.0, 0, 0, 0, 1, 0); //  /Sentado 7
Sentada = CreateActor(219, 1366.180297, -1294.696166, 13.546875, 97.166923);
ApplyActorAnimation(Sentada, "MISC", "Seat_talk_01", 4.0, 1, 0, 1, 0, 0); //  /Sentada 5
SeguridadBar = CreateActor(66, 1071.203857, -1352.627441, 13.554672, 139.341934);
ApplyActorAnimation(SeguridadBar, "GRAVEYARD", "prst_loopa", 4.0, 1, 0, 1, 0, 0);
// Seguridad IBTV
CreateActor(163, 651.197082, -1351.284667, 13.736300, 181.810470);
CreateActor(164, 647.323913, -1347.257690, 13.546875, 92.695526);
// Bancos
Bankera = CreateActor(172, 986.138427, -1172.712402, 25.342069, 358.674102);
ApplyActorAnimation(Bankera, "ped", "SEAT_down", 4.0, 0, 0, 0, 1, 0); //  /Sentada 7
Bankero = CreateActor(171, 989.974487, -1173.982910, 25.145936, 180.931045);
ApplyActorAnimation(Bankero, "Freeweights", "gym_free_B",4.0,1,0,1,0,0);
// ALHAMBRA.
negrobaila = CreateActor(221, 485.713531, -13.734642, 1000.679687, 272.918273);
ApplyActorAnimation(negrobaila, "DANCING","dnce_M_d",4.0,1,0,0,0,0);
mujerbaila = CreateActor(12, 487.818206, -13.482046, 1000.679687, 98.703300);
ApplyActorAnimation(mujerbaila, "DANCING","dnce_M_c",4.0,1,0,0,0,0);
mujerchata = CreateActor(13, 489.617431, -17.132623, 1000.679687, 105.741676);
ApplyActorAnimation(mujerchata,"RAPPING","RAP_C_Loop",4.0,1,1,1,1,0);
hombrechata = CreateActor(29, 488.825775, -17.310316, 1000.679687, 287.308410);
ApplyActorAnimation(hombrechata, "RAPPING","RAP_A_Loop",4.0,1,1,1,1,0);
dijey = CreateActor(67, 476.102783, -15.044513, 1003.695312, 270.075042);
ApplyActorAnimation(dijey, "SCRATCHING","scdlulp",4.0,1,0,0,0,0);
papel = CreateActor(82, 487.496551, -5.009051, 1002.078125, 182.387710);
ApplyActorAnimation(papel, "DANCING","DAN_Left_A",4.0,1,0,0,0,0);
}
IsPlayerOnBike(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		new vehicleclass = GetVehicleModel(GetPlayerVehicleID(playerid));
		switch(vehicleclass)
		{
			case 448:return 1;
			case 461:return 1;
			case 462:return 1;
			case 463:return 1;
			case 468:return 1;
			case 521:return 1;
			case 522:return 1;
			case 523:return 1;
			case 581:return 1;
			case 586:return 1;
			case 471:return 1;
		}
	}
	return 0;
}
IsPlayerInBoat(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		new vehicleclass = GetVehicleModel(GetPlayerVehicleID(playerid));
		switch(vehicleclass)
		{
			case 430:return 1;
			case 446:return 1;
			case 452:return 1;
			case 453:return 1;
			case 454:return 1;
			case 472:return 1;
			case 473:return 1;
			case 484:return 1;
			case 493:return 1;
			case 595:return 1;
		}
	}
	return 0;
}
IsPlayerOnBicycle(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		new vehicleclass = GetVehicleModel(GetPlayerVehicleID(playerid));
		switch(vehicleclass)
		{
			case 481:return 1;
			case 509:return 1;
			case 510:return 1;
		}
	}
	return 0;
}
public IsAtBlueBusStop(playerid)
{
    if(IsPlayerConnected(playerid))
	{
    	if(IsPlayerInRangeOfPoint(playerid,2.0,2868.9033,-1416.4062,11.0131) || IsPlayerInRangeOfPoint(playerid,2.0,2636.3242,-1693.125,10.9544) || IsPlayerInRangeOfPoint(playerid,2.0,2649.0073,-1710.6044,11.1854)
    	   || IsPlayerInRangeOfPoint(playerid,2.0,2243.8457,-1725.9121,13.5960) || IsPlayerInRangeOfPoint(playerid,2.0,2252.8876,-1738.8710,13.6260) || IsPlayerInRangeOfPoint(playerid,2.0,1948.3310,-1454.3525,13.5960)
    	   || IsPlayerInRangeOfPoint(playerid,2.0,1926.4199,-1472.3593,13.6260) || IsPlayerInRangeOfPoint(playerid,2.0,1571.0644,-2188.0107,13.6260) || IsPlayerInRangeOfPoint(playerid,2.0,1712.9423,-1818.7148,13.6260))
		{
			return 1;
		}
	}
	return 0;
}

public IsAtredBusStop(playerid)
{
    if(IsPlayerConnected(playerid))
	{
    	if(IsPlayerInRangeOfPoint(playerid,2.0,1567.0966,-1725.4755,13.6260) || IsPlayerInRangeOfPoint(playerid,2.0,1544.9990,-1739.0458,13.6260) || IsPlayerInRangeOfPoint(playerid,2.0,1503.9716,-1027.7617,23.7701)
    	   || IsPlayerInRangeOfPoint(playerid,2.0,1440.3242,-1040.7060,23.9073) || IsPlayerInRangeOfPoint(playerid,2.0,1188.8359,-1354.6279,13.6483) || IsPlayerInRangeOfPoint(playerid,2.0,1212.8427,-1327.8398,13.6470)
    	   || IsPlayerInRangeOfPoint(playerid,2.0,861.7125,-1313.3009,13.6260) || IsPlayerInRangeOfPoint(playerid,2.0,850.6757,-1333.9707,13.6153) || IsPlayerInRangeOfPoint(playerid,2.0,393.6944,-1766.2702,5.6197)
    	   || IsPlayerInRangeOfPoint(playerid,2.0,1705.5898,-1805.8476,13.5300))
		{
			return 1;
		}
	}
	return 0;
}
forward MensajesAleatorios(playerid);
public MensajesAleatorios(playerid)
{
    new msj = random(28);
    if(msj == 0) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Nosotros guardamos los respectivos creditos si quieres verlos utiliza {00AEFF}/creditos."); }
    if(msj == 1) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Si deseas anunciarte utiliza el comando {00AEFF}/ad{FFFFFF} para poder hacerlo."); }
    if(msj == 2) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Recuerda que si viste algún bug puedes reportar en el foro en su respectiva sección."); }
    if(msj == 3) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Muestrale tu estado a los demás usuarios usa el comando {00AEFF}/estado{FFFFFF} para poder usarlo."); }
    if(msj == 4) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Si estás cansado de los anuncios utilizar {00AEFF}/ocultar anuncios{FFFFFF} o {00AEFF}/mostrar anuncios{FFFFFF} respectivamente."); }
    if(msj == 5) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Adquiere una membresía VIP y obtén gran cantidad de beneficios! + Info en /ayuda vip2."); }
	if(msj == 6) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Recuerda visitar nuestro servidor de discord para hablar con otros usuarios, utiliza {00AEFF}/discord."); }
	if(msj == 7) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Recuerda ingresar a {00AEFF}rol.linoxzone.com{FFFFFF} para estar informado siempre sobre novedades del servidor."); }
	if(msj == 8) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Si vez a algún usuario que incumple las reglas o usa cheat, reportalo usando el comando {00AEFF}(/re)."); }
	if(msj == 9) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Usa {00AEFF}/fps{FFFFFF} para ver la cantidad de frames por segundo de tu juego."); }
	if(msj == 10) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Unete al grupo de facebook para estar atento a las novedades del servidor {00AEFF}(fb.com/groups/linoxzonerp)."); }
	if(msj == 11) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Ahora los usuarios vip 2 podrán crear snipers y dar headshot con el mismo, utilizalo correctamente."); }
	if(msj == 12) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} ¿Estás cansado de trabajar?, ¿Quieres dinero rápido?, Hemos agregado diferentes golpes a los bancos y tiendas repartidos por la ciudad."); }
	if(msj == 13) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Si tienes un helicoptero no olvides usar el comando {00AEFF}/rappel{FFFFFF} para poder bajar del mismo en una cuerda."); }
	if(msj == 14) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Hemos agregado una lista de usuarios dedicados usa {00AEFF}/dedicados{FFFFFF} para verlos."); }
    if(msj == 16) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Hemos agregado diferentes robos al{00AEFF} banco{FFFFFF} hechales un vistazo."); }
    if(msj == 17) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} ¿No encuentras tu casa? no hay problema, usa {00AEFF}/localizar casa{FFFFFF} y pondrás encontrarla."); }
    if(msj == 18) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Si deseas cambiar de correo electronico, ve a la {00AEFF}Tienda Virtual{FFFFFF} y pondrás hacerlo de inmediato."); }
    if(msj == 19) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} ¿Quieres ver tu gps?, entra a tu vehículo y usa las teclas {00AEFF}Click + 2{FFFFFF} y pondrás abrir tu gps."); }
    if(msj == 20) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Hemos agregado las teclas {00AEFF}ESPACIO + N {FFFFFF}o{00AEFF} ESPACIO + Y{FFFFFF} para poder abrir y cerrar vehículos."); }
    if(msj == 21) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Recuerda unirse al grupo de facebook oficial del servidor {00AEFF}(fb.com/groups/linoxzonerp)."); }
    if(msj == 22) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Hemos agregado un tablero a los vehículos usa {00AEFF}/tablero."); }
    if(msj == 23) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} No olvides que el servidor se reinicia automáticamente cada {00AEFF}20{FFFFFF} horas."); }
    if(msj == 24) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} ¿Eres armero? ¿No sabes como crear un arma?, utiliza el comando {00AEFF}/crear armas{FFFFFF} y elige un arma del dialogo."); }
    if(msj == 25) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Informate sobre nuestro sistema de autobuses utiliza el comando{00AEFF} /ayuda bus{FFFFFF}."); }
    if(msj == 26) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Ahora podrás crear tus armas con mayor rápidez usa {00AEFF}/crear dk {FFFFFF}o{00AEFF} /crear edc{FFFFFF} respectivamente."); }
    if(msj == 27) { SendClientMessageToAll(-1, "{00AEFF}[LZ]:{FFFFFF} Para desechar un objeto en tu mano usa el comando {00AEFF}/tirar objeto."); }

}
BICI(carid)
{
	if(GetVehicleModel(carid) == 481 ||GetVehicleModel(carid) == 509 || GetVehicleModel(carid) == 510)
	{
		
		return 1;
	}
	return 0;
}
TREN(carid)
{
	if(GetVehicleModel(carid) == 570 ||GetVehicleModel(carid) == 537)
	{

		return 1;
	}
	return 0;
}

MOTO(carid)
{
	new MotoVeh[] = { 448, 461, 462, 463, 468, 471, 521, 522, 581, 586 };
	for(new i = 0; i < sizeof(MotoVeh); i++)
	{
		
		if(GetVehicleModel(carid) == MotoVeh[i]) return 1;
	}
	return 0;
}
SAPD(carid)
{
	new SAPDVeh[] = { 427, 430, 490, 528, 596, 597, 598, 599, 601,  523 };
	for(new i = 0; i < sizeof(SAPDVeh); i++)
	{
	if(GetVehicleModel(carid) == SAPDVeh[i]) return 1;
	}
	return 0;
}

HELISAPD(carid)
{
	if(GetVehicleModel(carid) == 497) return 1;
	return 0;
}
AMBU(carid)
{
	if(GetVehicleModel(carid) == 416) return 1;
	return 0;
}
CAMION(carid)
{
	if(GetVehicleModel(carid) == 609 ||GetVehicleModel(carid) == 456) return 1;
	return 0;
}
EsUnTren(carid)
{
	if(GetVehicleModel(carid) == 570 || GetVehicleModel(carid) == 538) return 1;
	return 0;
}
BOTE(carid)
{
	if(GetVehicleModel(carid) == 453) return 1;
	return 0;
}
AVION(carid)
{
	new AirVeh[] = { 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 548, 425, 417, 487, 488, 497, 563, 447, 469 };
	for(new i = 0; i < sizeof(AirVeh); i++)
	{
		
		if(GetVehicleModel(carid) == AirVeh[i]) return 1;
	}
	return 0;
}
BAUL6(carid)
{
	new v = GetVehicleModel(carid);
	if(v == 400||v == 404||v == 418||v == 422||v == 470||v == 478||v == 489||v == 495||v == 505||v == 543||v == 554||v == 579||v == 605) return 1;
	return 0;
}
BAUL8(carid)
{
	new v = GetVehicleModel(carid);
	if(v == 403||v == 413||v == 414||v == 431||v == 437||v == 440||v == 443||v == 459||v == 482||v == 499||v == 514||v == 515||v == 578) return 1;
	return 0;
}
DFT(carid)
{
	if(GetVehicleModel(carid) == 578) return 1;
	return 0;
}
COSECHA(carid)
{
	if(GetVehicleModel(carid) == 532) return 1;
	return 0;
}
BASU(carid)
{
	if(GetVehicleModel(carid) == 408) return 1;
	return 0;
}
TAXI(carid)
{
	if(GetVehicleModel(carid) == 420 || GetVehicleModel(carid) == 438) return 1;
	return 0;
}

new texturaPizzeria,texturaPuerta,pizzaSign;
new bancosUno,bancosDos;
new separadorBancosUno,separadorBancosDos;
new garageMotos,guard;

#define 	COLOR_WHITE         0xFFFFFF00
#define 	COLOR_SEIS 			0x000000FF
new fso_map,ZADMIN[4],BancoLS,tmpobjid;

forward playerremoves(playerid);
public playerremoves(playerid)
{
	//Remove Buildings///////////////////////////////////////////////////////////////////////////////////////////////
	    //Pizzeria Nueva
	RemoveBuildingForPlayer(playerid, 5530, 2112.9375, -1797.0938, 19.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 5418, 2112.9375, -1797.0938, 19.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 1522, 2105.9219, -1807.2500, 12.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2099.8516, -1813.9063, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2099.8594, -1819.3594, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2099.8594, -1799.4219, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2102.6016, -1822.0781, 13.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2099.8516, -1793.9766, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2102.6641, -1791.3281, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, 2104.0156, -1812.4219, 12.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, 2101.9922, -1814.7109, 12.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, 2103.4063, -1817.3047, 12.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, 2102.1250, -1819.9531, 12.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, 2101.6328, -1798.1719, 12.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, 2103.9609, -1800.5625, 12.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, 2103.6875, -1795.9063, 12.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, 2102.0625, -1793.1406, 12.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2114.7188, -1785.1797, 16.3984, 0.25);
	//hps
	RemoveBuildingForPlayer(playerid, 5930, 1134.2500, -1338.0781, 23.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 5708, 1134.2500, -1338.0781, 23.1563, 0.25);
	//fabela
	RemoveBuildingForPlayer(playerid, 710, 2422.8516, -1022.1953, 66.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 709, 2653.4219, -909.7031, 71.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 706, 2691.1953, -849.9297, 63.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 706, 2699.8438, -961.7969, 75.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 709, 2626.3828, -847.2813, 71.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 706, 2559.3047, -915.7422, 81.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3298, 2512.1797, -1023.9219, 69.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 3298, 2578.9531, -1029.9844, 69.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 3300, 2544.5469, -1029.1250, 70.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 3299, 2493.3906, -944.1484, 81.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 3299, 2564.9609, -1028.2422, 69.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2417.4922, -1015.3516, 50.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 700, 2443.3594, -1015.9219, 54.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 2447.0625, -1021.2734, 56.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 660, 2467.0391, -1021.4063, 59.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 617, 2492.2969, -1029.8594, 64.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 617, 2520.8984, -1031.3750, 67.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 3241, 2512.1797, -1023.9219, 69.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 656, 2511.2734, -1014.6641, 68.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 700, 2443.0000, -1006.6641, 55.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 2441.3672, -967.4766, 79.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 671, 2471.6250, -976.6953, 78.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2468.1172, -975.4297, 79.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 617, 2484.9297, -966.9922, 80.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 2516.9688, -979.1406, 80.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 1407, 2508.9844, -977.7891, 81.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2486.6563, -952.0859, 81.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 3283, 2493.3906, -944.1484, 81.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 656, 2536.5000, -1019.5859, 69.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 3285, 2544.5469, -1029.1250, 70.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 3241, 2578.9531, -1029.9844, 69.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 3283, 2564.9609, -1028.2422, 69.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 659, 2555.4297, -1026.7969, 68.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 659, 2568.9375, -1021.5078, 68.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2693.3984, -1037.4609, 68.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2731.0938, -1037.1016, 54.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2765.2813, -1037.1016, 41.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 617, 2540.5859, -975.1641, 80.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 617, 2620.9688, -966.2422, 78.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 671, 2571.2422, -958.1016, 80.6484, 0.25);

	RemoveBuildingForPlayer(playerid, 5033, 1745.2031, -1882.8516, 26.1406, 0.25); // unity textura
	RemoveBuildingForPlayer(playerid, 13133, 299.2031, -193.6250, 3.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 13437, 210.9375, -245.1406, 10.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 292.6641, -201.9922, 0.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1495, 293.7500, -194.6875, 0.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 13132, 299.2031, -193.6250, 3.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 1687, 303.9375, -194.9297, 4.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1691, 297.1016, -195.6094, 4.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, 312.6406, -199.8750, 1.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, 305.1328, -188.5625, 1.0625, 0.25);
	/*FABRICA NEW */
	RemoveBuildingForPlayer(playerid, 7673, 966.3594, 2140.9688, 13.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1002.1484, 2063.4688, 9.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3459, 997.8438, 2075.3984, 17.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 3460, 1002.9688, 2096.0781, 13.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3474, 978.2891, 2094.9922, 16.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 7493, 966.3594, 2140.9688, 13.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 1497, 965.8047, 2159.1406, 9.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1497, 965.7891, 2162.1484, 9.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3459, 997.5078, 2183.0469, 17.3203, 0.25);
/*	RemoveBuildingForPlayer(playerid, 5941, 982.3359, -1169.6016, 32.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 5720, 982.3359, -1169.6016, 32.8203, 0.25);*/
    RemoveBuildingForPlayer(playerid, 5839, 1198.9922, -1128.8125, 27.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 5727, 1198.9922, -1128.8125, 27.8438, 0.25);
	/*plaza lspd*/
	RemoveBuildingForPlayer(playerid, 4192, 1591.699, -1674.849, 20.492, 0.250);
	RemoveBuildingForPlayer(playerid, 3976, 1571.599, -1675.750, 35.679, 0.250);
	RemoveBuildingForPlayer(playerid, 4064, 1571.599, -1675.750, 35.679, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1541.449, -1642.030, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1541.739, -1638.910, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1541.479, -1648.449, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1546.869, -1658.339, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1547.569, -1661.030, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1546.599, -1664.630, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1547.569, -1689.979, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1546.869, -1687.099, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1546.599, -1693.390, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 646, 1545.520, -1678.839, 14.000, 0.250);
	RemoveBuildingForPlayer(playerid, 646, 1545.560, -1672.219, 14.000, 0.250);
	RemoveBuildingForPlayer(playerid, 646, 1553.869, -1677.729, 16.437, 0.250);
	RemoveBuildingForPlayer(playerid, 646, 1553.869, -1673.459, 16.437, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1541.300, -1702.599, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1541.449, -1709.640, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1541.449, -1713.300, 14.429, 0.250);
	//fab
	RemoveBuildingForPlayer(playerid, 985, 2497.4063, 2777.0703, 11.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 986, 2497.4063, 2769.1094, 11.5313, 0.25);
	//Interior casa
	RemoveBuildingForPlayer(playerid, 1739, 149.226593, 1381.523438, 1083.750000, 0.250000);
	RemoveBuildingForPlayer(playerid, 1739, 149.226593, 1380.546875, 1083.750000, 0.250000);
	RemoveBuildingForPlayer(playerid, 1739, 151.546906, 1380.546875, 1083.750000, 0.250000);
	RemoveBuildingForPlayer(playerid, 1739, 151.546906, 1381.523438, 1083.750000, 0.250000);
	RemoveBuildingForPlayer(playerid, 1739, 149.226593, 1382.742188, 1083.750000, 0.250000);
	RemoveBuildingForPlayer(playerid, 1739, 151.546906, 1382.656250, 1083.750000, 0.250000);
	RemoveBuildingForPlayer(playerid, 1739, 151.546906, 1383.750000, 1083.750000, 0.250000);
	RemoveBuildingForPlayer(playerid, 1739, 149.226593, 1383.820313, 1083.750000, 0.250000);
	//VIAS TREN
	RemoveBuildingForPlayer(playerid, 1374, 2194.7578, -1901.1016, 14.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 2206.4766, -1887.8750, 14.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, -1960.6563, -71.3516, 27.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, -1938.8438, -57.7500, 27.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, -1946.0313, -233.4766, 27.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, -1960.9844, -246.5859, 27.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, -1987.9141, -587.0078, 26.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, -1976.4453, -573.1875, 26.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 2757.9844, 907.6016, 11.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 2773.3125, 920.8438, 10.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 2380.6172, 2699.2734, 11.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 2394.1719, 2685.0313, 11.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 2092.9922, 2691.1797, 11.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 2081.6797, 2697.1563, 11.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 1901.9844, 2697.1563, 11.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 1913.2969, 2691.1797, 11.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 1593.0156, 2629.0313, 11.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 1581.7031, 2639.3359, 11.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 1252.9609, 2629.0313, 11.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 1241.6484, 2639.3359, 11.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 733.7422, 1908.1797, 5.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 745.8516, 1922.1406, 5.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 733.9922, 1844.2344, 5.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1374, 746.2188, 1854.6875, 5.8828, 0.25);
	//
	RemoveBuildingForPlayer(playerid, 2024, 960.2500, -58.0625, 1000.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 2118, 960.8672, -45.6484, 1000.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 221.9766, 123.7344, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 222.0781, 124.6641, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 223.6016, 123.6797, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 223.6406, 124.6250, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 222.0547, 125.6719, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 222.8281, 127.2266, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 223.6250, 125.6797, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 228.3516, 124.1172, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1714, 229.1953, 126.0234, 1009.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 229.6328, 124.1172, 1009.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 235.7500, 109.5469, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1715, 235.8438, 110.8203, 1009.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1714, 237.8438, 109.8906, 1009.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 2255, 1202.2500, 13.7500, 1001.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 4024, 1479.8672, -1790.3984, 56.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 4044, 1481.1875, -1785.0703, 22.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1527, 1448.2344, -1755.8984, 14.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 1432.3047, -1832.9141, 15.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 4002, 1479.8672, -1790.3984, 56.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3980, 1481.1875, -1785.0703, 22.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 4003, 1481.0781, -1747.0313, 33.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 1405.7656, -1424.2500, 13.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1409.7969, -1429.2734, 14.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 1411.6250, -1430.1328, 13.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1408.5313, -1425.3984, 14.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1409.8672, -1418.1328, 14.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 1411.5703, -1416.5391, 12.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, 1510.8906, -1607.3125, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 1789.2109, -1369.2656, 15.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 3669, 1762.4453, -2096.7109, 15.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 1634.1094, -2237.5313, 12.8906, 0.25);
	RemoveBuildingForPlayer(playerid, 3634, 1762.4453, -2096.7109, 15.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 1729.7891, -1943.0469, 12.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 3707, 2720.3203, -2530.9141, 19.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 3708, 2720.3203, -2530.9141, 19.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 2060.1172, -1897.6406, 12.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 9.0234, 15.1563, -5.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1535, 2482.6484, -1994.9609, 12.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 5341, 2489.5156, -1987.4219, 14.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 2480.8594, -1959.2734, 12.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1778.4531, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1774.3125, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 1928.7344, -1772.4453, 12.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1771.3438, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1767.2891, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 2139.5156, -1161.4844, 23.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 2153.2344, -1016.1484, 62.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 3654, 2372.6875, -1132.3359, 29.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 17910, 2916.7656, -1877.6484, 0.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 3695, 2239.9297, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 3695, 2282.9922, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 3695, 2314.8203, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 3695, 2352.7188, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 3695, 2387.8203, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 17953, 2916.7656, -1877.6484, 0.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2229.0469, -1810.0313, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2226.1641, -1807.3281, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3584, 2239.9297, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2226.1641, -1775.5078, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2273.6953, -1810.0313, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3584, 2282.9922, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2267.8125, -1767.2734, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2273.3359, -1767.3438, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 645, 2285.7578, -1762.1250, 12.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 3584, 2314.8203, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2304.7813, -1767.3828, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1307, 2322.6484, -1815.4141, 12.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 645, 2332.8281, -1817.7109, 12.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 17887, 2343.6094, -1784.5078, 20.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 2349.6172, -1763.3438, 11.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 2325.9766, -1645.1328, 14.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 3584, 2352.7188, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2376.6172, -1767.2734, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2374.1016, -1775.5078, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3584, 2387.8203, -1790.6953, 17.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 645, 2387.0234, -1763.6406, 12.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 2352.1797, -1357.1563, 23.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 3649, 2372.6875, -1132.3359, 29.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 17907, 2426.1641, -1110.0938, 43.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 6253, 1305.4688, -1619.7422, 13.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 6046, 1305.4688, -1619.7422, 13.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 1154.7266, -1460.8906, 15.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1307, 937.9375, -986.5391, 37.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 3778, 337.4531, -1875.0000, 3.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 3615, 337.4531, -1875.0000, 3.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 13744, 1272.5938, -803.1094, 86.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 705, -2491.5859, -670.7188, 138.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 10496, -2501.7891, -701.1875, 227.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 10511, -2276.3438, -14.9219, 40.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3840, -2728.2422, -159.9297, 8.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 3840, -2728.2734, -55.3281, 8.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 10675, -2529.1875, -705.0391, 141.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 10369, -2276.3438, -14.9219, 40.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2529.2813, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2528.0781, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2524.0156, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2522.8125, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2517.5469, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2518.7500, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 654, -2521.0469, -589.3828, 129.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2514.8672, -690.9375, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 654, -2510.4531, -739.5625, 129.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 10357, -2501.7891, -701.1875, 227.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 1684, -2508.5000, -680.9531, 139.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2513.4844, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2508.2188, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1684, -2508.4063, -669.0938, 139.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2502.9531, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2497.6875, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2492.4219, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 654, -2494.4844, -742.8672, 131.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2487.1563, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2484.2969, -597.1641, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2484.2969, -602.4297, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2484.2969, -607.6953, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 654, -2444.1406, -694.1406, 130.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1341, -2384.2266, -584.0078, 132.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -690.9609, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -696.1875, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -701.4219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -706.6563, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -711.8828, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -717.1172, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2538.6094, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -2539.8359, -718.3203, 152.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2533.3438, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2539.8125, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2534.5469, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3826, -2728.2422, -159.9297, 8.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 3826, -2728.2734, -55.3281, 8.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 10840, -1666.1250, -62.0781, 10.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 10843, -1711.4688, -107.5703, 10.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 10892, -1711.4688, -107.5703, 10.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 10912, -1666.1250, -62.0781, 10.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 10914, -1706.4766, 13.0156, 7.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 11024, -2076.2734, 359.3203, 44.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2120.7656, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2103.3281, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2032.2891, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2022.0859, 347.1328, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2022.0859, 364.5781, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2032.2969, 380.7422, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2131.1797, 347.2813, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2131.1797, 364.7266, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2049.7344, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2131.1797, 347.2813, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2120.7656, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2103.3281, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2049.7344, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2032.2891, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2022.0859, 347.1328, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2131.1797, 364.7266, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 10949, -2076.2734, 359.3203, 44.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2032.2969, 380.7422, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2022.0859, 364.5781, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -1995.4766, 298.0859, 34.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1685.9688, 409.6406, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1679.3594, 403.0547, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1681.8281, 413.7813, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1675.2188, 407.1953, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1676.5156, 419.1172, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1669.9063, 412.5313, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1672.1328, 423.5000, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1665.5234, 416.9141, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -1350.1172, 492.2891, 10.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 956, -1350.1172, 493.8594, 10.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2118.9688, -423.6484, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2118.6172, -422.4141, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2097.2734, -398.3359, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 11280, -2137.6875, -198.0781, 34.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -2126.0859, -279.8203, 48.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2092.0859, -490.0547, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2063.2734, -490.0547, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2005.6484, -490.0547, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2034.4609, -490.0547, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2068.5625, -398.3359, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2039.8516, -398.3359, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2011.1406, -398.3359, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 956, -2229.1875, 286.4141, 34.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -1980.7891, 142.6641, 27.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -1996.7109, 238.7344, 48.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 10831, -1706.4766, 13.0156, 7.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -1706.1172, 33.1641, 16.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 10252, -2175.7578, 661.9219, 50.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -2410.8047, 970.8516, 44.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -2410.8047, 976.1875, 44.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1209, -2420.2188, 984.5781, 44.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1302, -2420.1797, 985.9453, 44.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -2410.8047, 981.5234, 44.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 2319.9922, 2532.8516, 10.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 8145, 1493.9297, 751.0156, 20.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 8376, 1325.2188, 1538.5469, 11.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 8132, 1436.5938, 673.2578, 12.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 7980, 1325.2188, 1538.5469, 11.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 746, 1498.3672, 682.0313, 10.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 8130, 1493.9297, 751.0156, 20.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 1520.1484, 1055.2656, 10.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 1659.4609, 1722.8594, 10.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2806.2109, 838.6094, 23.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2866.0313, 838.6094, 23.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2782.6641, 851.7656, 23.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2889.7344, 851.7656, 23.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2782.6641, 899.2813, 23.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1219, 2887.3047, 871.9141, 9.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 1219, 2887.3047, 874.5781, 9.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2889.6172, 895.2109, 23.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, 2782.6641, 929.2969, 23.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1219, 2858.2734, 944.9766, 9.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 1343, 2863.4688, 946.0156, 10.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1344, 2879.6484, 945.9688, 10.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 2647.6953, 1129.6641, 10.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 2503.1406, 1243.6953, 10.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 2845.7266, 1295.0469, 10.7891, 0.25);
	RemoveBuildingForPlayer(playerid, 3548, 1345.1172, 2612.5703, 12.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3548, 1667.4375, 2612.5703, 12.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3443, 1667.4375, 2612.5703, 12.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 1398.8438, 2222.6094, 10.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 3443, 1345.1172, 2612.5703, 12.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 2085.7734, 2071.3594, 10.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 3460, 940.3828, 1957.7109, 13.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3297, -1667.2656, 2594.5469, 82.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 3300, -1464.3438, 2656.5000, 56.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 3341, -1446.4531, 2639.3516, 54.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 3342, -1447.2344, 2653.3047, 54.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1477.6563, 1859.7344, 31.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1464.9375, 1860.5625, 31.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1477.8516, 1867.3125, 31.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1465.4766, 1868.2734, 31.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -862.8281, 1536.6094, 21.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 3242, -1667.2656, 2594.5469, 82.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 11460, -1523.2891, 2618.5938, 65.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 956, -1455.1172, 2591.6641, 55.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 672, -1454.2734, 2640.1406, 55.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 11461, -1466.0313, 2637.5938, 54.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 669, -1457.8672, 2648.9922, 55.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -1436.1094, 2607.3906, 55.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3170, -1446.4531, 2639.3516, 54.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -1438.6719, 2630.0234, 55.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 700, -1441.7891, 2647.3281, 55.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 3173, -1447.2344, 2653.3047, 54.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3285, -1464.3438, 2656.5000, 56.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -1436.1016, 2655.4766, 55.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1329.2031, 2669.2813, 49.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1328.5859, 2674.7109, 49.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1327.7969, 2680.1250, 49.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1327.0313, 2685.5938, 49.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 3682, 247.9297, 1461.8594, 33.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3682, 192.2734, 1456.1250, 33.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3682, 199.7578, 1397.8828, 33.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3683, 133.7422, 1356.9922, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3683, 166.7891, 1356.9922, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3683, 166.7891, 1392.1563, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3683, 133.7422, 1392.1563, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3683, 166.7891, 1426.9141, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3683, 133.7422, 1426.9141, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3288, 221.5703, 1374.9688, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3289, 212.0781, 1426.0313, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3290, 218.2578, 1467.5391, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3291, 246.5625, 1435.1953, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3291, 246.5625, 1410.5391, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3291, 246.5625, 1385.8906, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3291, 246.5625, 1361.2422, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3290, 190.9141, 1371.7734, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3289, 183.7422, 1444.8672, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3289, 222.5078, 1444.6953, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3289, 221.1797, 1390.2969, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3288, 223.1797, 1421.1875, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3683, 133.7422, 1459.6406, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3289, 207.5391, 1371.2422, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3424, 220.6484, 1355.1875, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3424, 221.7031, 1404.5078, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3424, 210.4141, 1444.8438, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3424, 262.5078, 1465.2031, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -250.2188, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 956, -76.0313, 1227.9922, 19.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -14.7031, 1175.3594, 18.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 16359, 821.4063, 862.0781, 11.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 3259, 220.6484, 1355.1875, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3636, 133.7422, 1356.9922, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3636, 166.7891, 1356.9922, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3256, 190.9141, 1371.7734, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 16392, 150.0781, 1378.3438, 11.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 3636, 166.7891, 1392.1563, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3636, 133.7422, 1392.1563, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3258, 207.5391, 1371.2422, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 205.6484, 1394.1328, 10.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 205.6484, 1392.1563, 16.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 205.6484, 1394.1328, 23.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 207.3594, 1390.5703, 19.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 206.5078, 1387.8516, 27.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 3673, 199.7578, 1397.8828, 33.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3257, 221.5703, 1374.9688, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3258, 221.1797, 1390.2969, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 203.9531, 1409.9141, 16.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3674, 199.3828, 1407.1172, 35.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 204.6406, 1409.8516, 11.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 206.5078, 1404.2344, 18.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 206.5078, 1400.6563, 22.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 3259, 221.7031, 1404.5078, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 207.3594, 1409.0000, 19.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 3257, 223.1797, 1421.1875, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3258, 212.0781, 1426.0313, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3636, 166.7891, 1426.9141, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3636, 133.7422, 1426.9141, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 16391, 239.2969, 1367.9922, 11.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 3255, 246.5625, 1361.2422, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3255, 246.5625, 1385.8906, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3255, 246.5625, 1410.5391, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3258, 183.7422, 1444.8672, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3259, 210.4141, 1444.8438, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3258, 222.5078, 1444.6953, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 16086, 232.2891, 1434.4844, 13.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 16393, 149.3750, 1452.9375, 11.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 16394, 238.2734, 1452.9375, 11.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 3673, 192.2734, 1456.1250, 33.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3674, 183.0391, 1455.7500, 35.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 3636, 133.7422, 1459.6406, 17.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 196.0234, 1462.0156, 10.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 198.0000, 1462.0156, 16.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 196.0234, 1462.0156, 23.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 180.2422, 1460.3203, 16.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 180.3047, 1461.0078, 11.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 3256, 218.2578, 1467.5391, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 199.5859, 1463.7266, 19.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 181.1563, 1463.7266, 19.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 185.9219, 1462.8750, 18.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 202.3047, 1462.8750, 27.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 189.5000, 1462.8750, 22.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 3255, 246.5625, 1435.1953, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 254.6797, 1451.8281, 27.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 253.8203, 1458.1094, 23.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 255.5313, 1454.5469, 19.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 253.8203, 1456.1328, 16.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 253.8203, 1458.1094, 10.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 3259, 262.5078, 1465.2031, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 254.6797, 1468.2109, 18.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3673, 247.9297, 1461.8594, 33.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 254.6797, 1464.6328, 22.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 3674, 247.5547, 1471.0938, 35.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 255.5313, 1472.9766, 19.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 252.8125, 1473.8281, 11.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 3675, 252.1250, 1473.8906, 16.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 16089, 342.1250, 1431.0938, 5.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 16090, 315.7734, 1431.0938, 5.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 16091, 289.7422, 1431.0938, 5.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 16087, 358.6797, 1430.4531, 11.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -532.3438, 2345.5859, 72.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -543.3828, 2351.0469, 74.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -555.6484, 2354.7109, 76.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -522.3984, 2338.8672, 70.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 16054, -427.7734, 2238.2578, 44.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 3350, -429.0547, 2237.8359, 41.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -253.7422, 2597.9531, 62.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 956, -253.7422, 2599.7578, 62.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 624.0469, 1677.6016, 6.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 603.4844, 1707.2344, 6.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 606.8984, 1702.2188, 6.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 610.2500, 1697.2656, 6.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 613.7188, 1692.2656, 6.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 617.1250, 1687.4531, 6.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 620.5313, 1682.4609, 6.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1610.6172, -2721.0000, 47.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1607.3047, -2716.6016, 47.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1603.9922, -2712.2031, 47.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1600.6719, -2707.8047, 47.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -2246.7031, -2559.7109, 31.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -2241.7188, -2562.2891, 31.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 13191, 65.2578, -303.9844, 14.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 13192, 164.7109, -234.1875, 0.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 13195, 36.8281, -256.2266, 0.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 3377, -207.6563, -246.7344, 1.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 3377, -196.7188, -246.1641, 1.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 3377, -224.5000, -183.9063, 1.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 3377, -200.3281, -189.7344, 1.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 3377, -200.3281, -189.7344, 3.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 3377, -176.6797, -195.3594, 1.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 3377, -156.9453, -266.9141, 4.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 3377, -149.9141, -324.3438, 1.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 201.0156, -107.6172, 0.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 655.6641, -571.2109, 15.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 655.6641, -569.6016, 15.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 655.6641, -558.9297, 15.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 655.6641, -560.5469, 15.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 662.4297, -552.1641, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 1277.8359, 372.5156, 18.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 1378.9609, 461.0391, 19.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 1380.6328, 460.2734, 19.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 1385.0781, 458.2969, 19.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, 1383.3984, 459.0703, 19.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 12932, -117.9609, -337.4531, 3.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 3378, -149.9141, -324.3438, 1.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 12934, -184.5781, -289.8984, 3.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 3378, -156.9453, -266.9141, 4.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 12861, 36.8281, -256.2266, 0.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 3378, -207.6563, -246.7344, 1.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 12805, 65.2578, -303.9844, 14.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 12956, 96.3281, -261.1953, 3.8594, 0.25);
	RemoveBuildingForPlayer(playerid, 3378, -196.7188, -246.1641, 1.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 12860, 164.7109, -234.1875, 0.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 215.0000, -224.0000, 2.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3378, -176.6797, -195.3594, 1.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 3378, -200.3281, -189.7344, 1.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 3378, -200.3281, -189.7344, 3.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 3378, -224.5000, -183.9063, 1.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 2271.7266, -76.4609, 25.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 17349, -542.0078, -522.8438, 29.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -1405.0391, -810.6563, 81.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -1198.9453, -717.8125, 55.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, -92.1016, -1161.7891, 2.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, -97.0703, -1173.7500, 3.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, -85.2422, -1165.0313, 2.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, -90.1406, -1176.6250, 2.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 17019, -606.0313, -528.8203, 30.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1415, -541.4297, -561.2266, 24.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 17012, -542.0078, -522.8438, 29.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1415, -513.7578, -561.0078, 24.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1441, -503.6172, -540.5313, 25.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1415, -502.6094, -528.6484, 24.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, -502.1172, -521.0313, 25.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1441, -502.4063, -513.0156, 25.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1415, -620.4141, -490.5078, 24.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1415, -619.6250, -473.4531, 24.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, -553.6875, -481.6328, 25.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1441, -554.4531, -496.1797, 25.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 1441, -537.0391, -469.1172, 25.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, -516.9453, -496.6484, 25.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, -503.1250, -509.0000, 25.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -491.8594, -479.9219, 38.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 17020, -475.9766, -544.8516, 28.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -471.5547, -479.9219, 38.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 693, -184.8750, -1587.8516, 8.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 790, -141.2813, -1618.9531, 5.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 790, -130.3203, -1602.4922, 5.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 670, -141.8906, -1584.0156, 6.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 1438, -79.2578, -1593.4688, 1.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 670, -111.7734, -1553.6875, 2.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, 2225.2031, -1153.4219, 1025.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, 2576.7031, -1284.4297, 1061.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 330.6797, 178.5000, 1020.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 331.9219, 178.5000, 1020.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 1502, 341.1328, 168.7969, 1018.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 350.9063, 206.0859, 1008.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 361.5625, 158.6172, 1008.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 371.5938, 178.4531, 1020.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 374.8906, 188.9766, 1008.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, 2155.9063, 1606.7734, 1000.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, 2209.9063, 1607.1953, 1000.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 2155.8438, 1607.8750, 1000.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 2202.4531, 1617.0078, 1000.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 2209.2422, 1621.2109, 1000.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 2222.3672, 1602.6406, 1000.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, 2222.2031, 1606.7734, 1000.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, -19.0391, -57.8359, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, -36.1484, -57.8750, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, -16.1172, -91.6406, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, -17.5469, -91.7109, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, -16.5313, -140.2969, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, -15.1016, -140.2266, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, -33.8750, -186.7656, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, -32.4453, -186.6953, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, -35.7266, -140.2266, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1771, 190.6406, 174.7422, 1002.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1771, 194.8750, 174.7422, 1002.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1771, 199.1328, 174.7422, 1002.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 14878, 302.2422, 312.7578, 998.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 2204, 225.1094, 122.7422, 1009.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 2204, 225.1094, 125.9688, 1009.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 2210, 226.7891, 128.3984, 1009.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 1771, 188.4922, 162.0234, 1002.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1771, 192.7266, 162.0234, 1002.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1771, 196.9844, 162.0234, 1002.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 14856, 198.4688, 168.6797, 1003.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, 495.9688, -24.3203, 1000.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 500.5625, -1.3672, 1000.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, 501.8281, -1.4297, 1000.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, 373.8281, -178.1406, 1000.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1776, 379.0391, -178.8828, 1000.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1977, 316.8750, -140.3516, 998.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 13625, -1336.8281, -305.1094, 1053.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, -788.4766, 491.1641, 1375.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, -787.2500, 497.7656, 1375.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, -787.4766, 504.5938, 1370.8594, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, -790.6016, 509.0391, 1370.8594, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, -787.8203, 509.0469, 1370.8594, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, -783.0078, 509.0156, 1370.8594, 0.25);
	RemoveBuildingForPlayer(playerid, 1432, -779.8750, 509.0547, 1370.8594, 0.25);
	RemoveBuildingForPlayer(playerid, 4269, 2882.0781, -2711.4531, -4.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 4403, 2882.0781, -2711.4531, -4.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1023.1328, -1632.4609, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1062.1406, -1631.7188, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1023.1328, -1629.2813, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1023.1328, -1626.1016, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1023.1328, -1622.9766, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1052.3594, -1631.7188, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1042.4375, -1631.7188, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1032.7031, -1622.9766, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1032.6719, -1631.7188, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1032.7031, -1629.2813, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1032.7031, -1626.1016, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1032.7031, -1632.4609, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1032.7031, -1619.9063, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1023.1328, -1631.7188, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1062.1406, -1622.2031, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1052.3594, -1622.2031, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1042.4375, -1622.2031, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1032.6719, -1622.2031, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1023.1328, -1622.2031, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -991.9531, -1688.1875, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -991.9219, -1703.1094, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -991.9531, -1700.6797, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -991.9531, -1697.5000, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -991.9531, -1703.8594, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -991.9531, -1691.3047, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -991.9531, -1694.3750, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -991.9531, -1685.0781, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -982.3828, -1703.1094, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -991.9219, -1693.6016, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -982.3828, -1693.6016, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -991.9219, -1684.1719, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -982.3828, -1684.1719, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1011.9297, -1655.8672, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1011.8984, -1667.6719, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1011.9297, -1665.2422, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1011.9297, -1662.0625, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1011.9297, -1668.4219, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1011.9297, -1652.7500, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1011.9297, -1658.9375, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1011.9297, -1649.6406, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1011.8984, -1658.1563, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1011.8984, -1648.7344, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1000.7500, -1652.7500, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1000.7266, -1667.6719, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1000.7500, -1665.2422, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1000.7500, -1662.0625, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1000.7500, -1668.4219, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1000.7500, -1655.8672, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1000.7500, -1658.9375, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1000.7500, -1649.6406, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1000.7266, -1658.1563, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1000.7266, -1648.7344, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1052.3828, -1632.4609, 75.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1052.3828, -1629.2813, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1052.3828, -1626.1016, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1052.3828, -1622.9766, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1042.4531, -1631.9375, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3261, -1042.4531, -1635.0547, 75.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1023.1328, -1636.3906, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -991.9219, -1688.8438, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -982.3828, -1688.8438, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -982.3828, -1698.2734, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -991.9219, -1698.2734, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -982.3828, -1707.7813, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1011.8984, -1662.8281, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1000.7266, -1672.3438, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1011.8984, -1653.4063, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1032.6719, -1636.3906, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1052.3594, -1636.3906, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1042.4375, -1636.3906, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1062.1406, -1626.8750, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1023.1328, -1626.8750, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1000.7266, -1662.8281, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1000.7266, -1653.4063, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1032.6719, -1626.8750, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1042.4375, -1626.8750, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1052.3594, -1626.8750, 75.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3409, -1062.1406, -1636.3906, 75.3359, 0.25);
	//Casa valeria
    RemoveBuildingForPlayer(playerid, 713, 1105.0938, -2111.6875, 65.0781, 0.25);
    RemoveBuildingForPlayer(playerid, 672, 1079.9219, -2088.8672, 61.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 691, 1103.1016, -2093.6641, 61.5469, 0.25);
    RemoveBuildingForPlayer(playerid, 691, 1097.0391, -2079.4453, 61.5469, 0.25);
    RemoveBuildingForPlayer(playerid, 712, 1208.4297, -2045.2422, 75.7578, 0.25);
    RemoveBuildingForPlayer(playerid, 1280, 1204.4922, -2039.8047, 68.3750, 0.25);

    return 1;
}
forward mapaslz();
public mapaslz()
{
CreateDynamicObject(661,1134.6398900,-1988.8358200,64.6790000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1136.9043000,-1991.1401400,65.6790400,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1140.6543000,-1992.9698500,65.6790400,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(693,1208.4240700,-2024.1647900,67.9952700,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(693,1208.6721200,-2045.4845000,67.9952700,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(693,1104.2977300,-2015.6699200,67.9932600,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(693,1122.1881100,-2123.2971200,65.9497300,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1260,1208.4049100,-2034.6966600,79.0007000,0.0000000,0.0000000,1.0000000); //
CreateDynamicObject(661,1220.6572300,-2063.6867700,66.4372000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1218.7385300,-2064.7487800,66.4372000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(16084,1229.8678000,-2028.9751000,56.3328000,0.0000000,-18.0000000,200.0000000); //
CreateDynamicObject(693,1136.6809100,-1987.5197800,64.8436500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19641,1189.6872600,-2040.3071300,68.0020200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19641,1191.0013400,-2033.5775100,68.0020200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(984,1131.0587200,-2023.7351100,68.6601000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(984,1131.1058300,-2050.2175300,68.6601000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(4724,1131.2303500,-2001.7648900,69.9255000,0.0000000,0.0000000,-91.0000000); //
CreateDynamicObject(4724,1131.5285600,-2072.0097700,69.9255000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1103.7255900,-2000.2783200,71.2493000,0.0000000,0.0000000,90.0000000); //
CreateDynamicObject(19313,1209.8198200,-2071.2522000,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1189.2146000,-2071.0588400,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1175.2323000,-2071.0380900,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1161.2373000,-2071.1550300,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1147.3710900,-2071.2080100,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1144.0935100,-2071.0349100,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1137.1195100,-2078.0935100,71.2493000,0.0000000,0.0000000,90.0000000); //
CreateDynamicObject(19313,1103.6200000,-2060.0139200,71.2493000,0.0000000,0.0000000,90.0000000); //
CreateDynamicObject(19313,1094.1513700,-2121.0256300,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1100.3221400,-2049.6892100,71.2493000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19313,1100.4847400,-2024.4975600,71.2493000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19313,1103.5762900,-2056.2246100,71.2493000,0.0000000,0.0000000,90.0000000); //
CreateDynamicObject(19313,1103.7275400,-2017.6333000,71.2493000,0.0000000,0.0000000,90.0000000); //
CreateDynamicObject(19313,1103.7357200,-2003.6422100,71.2493000,0.0000000,0.0000000,90.0000000); //
CreateDynamicObject(19313,1117.1337900,-2114.5029300,71.2493000,0.0000000,0.0000000,91.0000000); //
CreateDynamicObject(19313,1130.0369900,-2080.8503400,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1110.7186300,-1993.2004400,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1124.7204600,-1993.1744400,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1138.7393800,-1993.1751700,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1152.7236300,-1993.2004400,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1166.6746800,-1993.2093500,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1180.7421900,-1993.1809100,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1246.7110600,-1998.0387000,61.2493000,0.0000000,0.0000000,-44.0000000); //
CreateDynamicObject(19313,1203.4951200,-1993.2136200,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1222.0992400,-2071.3979500,69.3853000,0.0000000,21.0000000,0.0000000); //
CreateDynamicObject(19313,1234.6059600,-2071.3239700,64.2333000,0.0000000,21.0000000,0.0000000); //
CreateDynamicObject(19313,1194.7513400,-1993.2244900,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1284.3471700,-2037.9036900,60.9853000,0.0000000,0.0000000,91.0000000); //
CreateDynamicObject(19313,1234.7404800,-1993.2121600,61.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1258.7172900,-2002.9199200,61.4973000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1239.9765600,-2064.9626500,61.1493000,0.0000000,0.0000000,93.0000000); //
CreateDynamicObject(19313,1276.9824200,-2002.8363000,60.9853000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1283.9451900,-2009.8206800,60.9853000,0.0000000,0.0000000,91.0000000); //
CreateDynamicObject(19313,1284.1611300,-2023.8873300,60.9853000,0.0000000,0.0000000,91.0000000); //
CreateDynamicObject(3749,1283.9821800,-2054.8813500,63.5934000,0.0000000,0.0000000,89.0000000); //
CreateDynamicObject(19313,1272.6148700,-2002.8505900,61.1493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1274.8458300,-2064.6853000,61.1493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1260.9132100,-2064.7636700,61.1493000,0.0000000,0.0000000,1.0000000); //
CreateDynamicObject(19313,1246.8986800,-2064.8547400,61.1493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1230.3248300,-2045.3961200,60.6217900,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1230.9691200,-2058.8535200,60.6217900,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1230.7423100,-2052.1853000,60.6217900,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1221.8906300,-2048.6901900,62.0852500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1222.0643300,-2065.0688500,62.0852500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1222.4166300,-2055.1701700,62.0852500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1231.1511200,-2014.0462600,60.0745200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1230.8341100,-2024.8966100,60.0745200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1231.1292700,-2017.9332300,60.0745200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1218.1629600,-2020.1909200,64.2457400,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(661,1217.8001700,-2011.4134500,64.2457400,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1228.2453600,-1993.2203400,64.2333000,0.0000000,21.0000000,0.0000000); //
CreateDynamicObject(19313,1215.2733200,-1993.2423100,69.3853000,0.0000000,21.0000000,0.0000000); //
CreateDynamicObject(19313,1203.0799600,-2071.1521000,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(693,1240.2282700,-2072.5700700,59.0284900,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19905,1272.0710400,-2026.3023700,58.1225000,0.0000000,0.0000000,-91.0000000); //
CreateDynamicObject(878,1196.4202900,-2057.8327600,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1194.8172600,-2021.4751000,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1190.7927200,-2017.9766800,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1186.8407000,-2023.1057100,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1197.7174100,-2048.0402800,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1156.4958500,-2022.4093000,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1189.0360100,-2054.2614700,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1158.3881800,-2050.5451700,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1152.0771500,-2054.1377000,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1144.9276100,-2047.1842000,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1143.9512900,-2024.8258100,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(878,1150.0788600,-2014.3815900,68.2610000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1597,1182.6110800,-2030.3354500,70.5912000,0.0000000,0.0000000,37.0000000); //
CreateDynamicObject(1597,1167.8040800,-2029.9054000,70.5912000,0.0000000,0.0000000,-36.0000000); //
CreateDynamicObject(1597,1182.3204300,-2043.9195600,70.5912000,0.0000000,0.0000000,-36.0000000); //
CreateDynamicObject(1597,1167.5844700,-2043.3797600,70.5912000,0.0000000,0.0000000,37.0000000); //
CreateDynamicObject(7662,1139.1246300,-2054.8908700,68.6321000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(7662,1145.8743900,-2055.2155800,68.6321000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(7662,1154.3721900,-2055.2439000,68.6321000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(7662,1174.8724400,-2054.7121600,68.6321000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(7662,1161.5871600,-2055.4333500,68.6321000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19641,1204.2824700,-2040.4284700,68.0020200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19641,1196.4067400,-2040.2824700,68.0020200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19641,1206.6312300,-2033.5224600,68.0020200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19641,1198.8220200,-2033.5690900,68.0020200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(703,1198.5564000,-2062.9274900,67.9962200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(703,1197.4030800,-2027.2226600,67.9962200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(703,1190.7131300,-2016.3896500,67.9962200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(703,1192.6475800,-2052.6411100,67.9962200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19321,1154.6085200,-1999.1829800,69.5128000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19315,1152.5585900,-2053.0212400,68.4111000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19315,1143.8068800,-2052.3728000,68.4111000,0.0000000,0.0000000,0.0000000); //
//CreateDynamicObject(980,1285.2280300,-2054.8725600,60.3206000,0.0000000,0.0000000,89.0000000); //
CreateDynamicObject(4874,1096.4980500,-2083.0564000,71.5646000,0.0000000,0.0000000,91.0000000); //
CreateDynamicObject(693,1123.0728800,-2088.5346700,65.9497300,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(693,1120.9303000,-2096.2077600,65.9497300,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(693,1123.7185100,-2109.4213900,65.9497300,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(18228,1092.2401100,-2069.9169900,48.3598000,0.0000000,0.0000000,232.0000000); //
CreateDynamicObject(18228,1090.1724900,-2100.4580100,48.3598000,0.0000000,0.0000000,232.0000000); //
CreateDynamicObject(5126,1077.8623000,-2118.2526900,58.7711600,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(5126,1076.4799800,-2083.6528300,58.7711600,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1103.6317100,-2073.9489700,71.2493000,0.0000000,0.0000000,90.0000000); //
CreateDynamicObject(19313,1116.5780000,-2087.8349600,71.2493000,0.0000000,0.0000000,91.0000000); //
CreateDynamicObject(19313,1116.9429900,-2101.9050300,71.2493000,0.0000000,0.0000000,91.0000000); //
CreateDynamicObject(19313,1122.8555900,-2080.8945300,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1110.3701200,-2121.4311500,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(5126,1084.6787100,-2126.2800300,71.7782700,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19313,1108.2343800,-2121.2893100,71.2493000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19868,1093.8746300,-2049.7067900,69.0029400,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19868,1082.7706300,-2040.4117400,68.8701000,0.0000000,0.0000000,109.0000000); //
CreateDynamicObject(19868,1094.1416000,-2024.5141600,68.8700800,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19868,1089.1660200,-2025.8064000,68.8701000,0.0000000,0.0000000,29.0000000); //
CreateDynamicObject(19868,1084.7959000,-2029.3720700,68.8701000,0.0000000,0.0000000,57.0000000); //
CreateDynamicObject(19868,1082.6584500,-2033.9740000,68.8701000,0.0000000,0.0000000,72.0000000); //
CreateDynamicObject(1262,1209.1839600,-2031.8212900,85.1838000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.4250500,-2042.0229500,84.1718000,0.0000000,34.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.4135700,-2041.3903800,84.1718000,0.0000000,-25.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.4344500,-2040.9074700,85.1718000,0.0000000,-25.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.2575700,-2042.6385500,85.1718000,0.0000000,29.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.1980000,-2032.3448500,85.7198000,0.0000000,91.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.2699000,-2035.1731000,84.1718000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.1137700,-2032.2334000,83.9878000,0.0000000,45.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.1759000,-2032.9842500,84.1718000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.2136200,-2034.5122100,83.6078000,0.0000000,91.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.2419400,-2032.9759500,85.1838000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.3065200,-2038.8678000,84.3838000,0.0000000,91.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.2076400,-2027.6032700,84.1718000,0.0000000,29.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.2061800,-2029.4112500,84.1718000,0.0000000,-25.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.2271700,-2028.9346900,85.1718000,0.0000000,-25.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.3259300,-2028.2032500,85.1718000,0.0000000,29.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.3836700,-2028.5576200,84.4278000,0.0000000,91.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.2002000,-2030.6551500,84.1718000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.1923800,-2030.6429400,85.1838000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.1214600,-2034.5293000,84.6838000,0.0000000,91.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.3155500,-2034.5234400,85.7198000,0.0000000,91.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.2108200,-2035.2159400,85.1838000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.1754200,-2036.4079600,83.6078000,0.0000000,91.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.2321800,-2036.9841300,84.1718000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.1578400,-2036.9722900,85.1838000,0.0000000,1.0000000,-96.0000000); //
CreateDynamicObject(1262,1209.4172400,-2040.0648200,84.1718000,0.0000000,-25.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.2545200,-2039.5649400,85.1718000,0.0000000,-25.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.4318800,-2038.1065700,84.1718000,0.0000000,29.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.2893100,-2038.6789600,85.1718000,0.0000000,29.0000000,-100.0000000); //
CreateDynamicObject(1262,1209.1295200,-2032.3374000,84.6838000,0.0000000,91.0000000,-96.0000000); //

/*
Objects converted: 158
Vehicles converted: 0
Vehicle models found: 0
----------------------
In the time this conversion took to finish the US national debt has risen by about $155.08!
*/

texturaPizzeria = CreateObject(5418, 2112.9375, -1797.0938, 19.3359,   0.00000, 0.00000, 0.00000, 300.0); //Edificio
texturaPuerta = CreateObject(1522, 2105.9219, -1807.2500, 12.5156,   0.000000, 0.0000, 90.00, 300.0); //Puerta
pizzaSign = CreateObject(19466, 2104.4609, -1806.28198, 18.71050,   0.00000, 0.00000, 0.00000, 300.0); //PizzaSign
SetObjectMaterial(texturaPizzeria, 9, 3673, "xrf_refineryla", "steel256128", 0xFFFFFFFF); //Garage
SetObjectMaterial(texturaPizzeria, 11, 5174, "warehus_las2", "newall2", 0xFFFFFFFF); //EdificioText
SetObjectMaterial(texturaPizzeria, 13, 5174, "warehus_las2", "newall2", 0xFFFFFFFF); //EdificioText
SetObjectMaterial(texturaPizzeria, 1, 5174, "warehus_las2", "newall2", 0x10FFFFFF); //PizzaStack icono OFF
SetObjectMaterial(texturaPizzeria, 12, 5174, "warehus_las2", "newall2", 0x10FFFFFF); //Garage Text OFF
SetObjectMaterial(texturaPizzeria, 2, 8395, "pyramid", "luxorwindow01_128", 0xFFFFFFFF); //Ventana
SetObjectMaterial(texturaPuerta, 0, 6060, "shops2_law", "bevdoor01_law", 0xFFFFFFFF); //Puerta
SetObjectMaterial(texturaPizzeria, 8, 13691, "bevcunto2_lahills", "desgreengrass", 0xFFFFFFFF); //Pasto
SetObjectMaterial(texturaPizzeria, 4, 13691, "bevcunto2_lahills", "crazypave", 0xFFFFFFFF); //Camino
SetObjectMaterial(texturaPizzeria, 7, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF); //PizzaSignMadera
SetObjectMaterial(texturaPizzeria, 0, 18265, "w_town3cs_t", "ws_whitewall2_top", 0xFFFFFFFF); //SueloTecho
SetObjectMaterial(texturaPizzeria, 3, 10433, "hashmarket1_sfs", "woodboards2", 0xFFFFFFFF); //Tejado
SetObjectMaterial(pizzaSign, 0, 5418, "idlewood3_lae", "pizzasign2LA", 0xFFFFFFFF); //PizzaSign
CreateDynamicObject(2665, 2104.62817, -1810.76489, 16.49040,   0.00000, 0.00000, 270.00000);
CreateDynamicObject(2665, 2104.66284, -1802.01990, 16.47040,   0.00000, 0.00000, 270.00000);
bancosUno = CreateObject(12842, 2102.34399, -1816.32117, 13.00000, 0.00000, 0.00000, 0.00000, 300.00000);
bancosDos = CreateObject(12842, 2102.24097, -1796.86670, 13.00000, 0.00000, 0.00000, 0.00000, 300.00000);
CreateDynamicObject(2770, 2105.43701, -1804.96033, 13.22618,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(2770, 2105.41431, -1807.84363, 13.22618,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19122, 2097.28613, -1802.56860, 13.10080,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19122, 2093.59888, -1802.59375, 13.10080,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19122, 2097.22192, -1811.43005, 13.10080,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19122, 2093.46338, -1811.32080, 13.10080,   0.00000, 0.00000, 0.00000);
SetObjectMaterial(bancosUno, 0, 16150, "ufo_bar", "sa_wood07_128", 0xFFFFFFFF); //Bancos
SetObjectMaterial(bancosDos, 0, 16150, "ufo_bar", "sa_wood07_128", 0xFFFFFFFF); //Bancos
SetObjectMaterial(bancosUno, 1, 2770, "cb_details", "CJ_red_COUNTER", 0xFFFFFFFF);
SetObjectMaterial(bancosDos, 1, 2770, "cb_details", "CJ_red_COUNTER", 0xFFFFFFFF);
SetObjectMaterial(bancosUno, 2, 2770, "cb_details", "CJ_cbell_top", 0xFFFFFFFF);
SetObjectMaterial(bancosDos, 2, 2770, "cb_details", "CJ_cbell_top", 0xFFFFFFFF);
CreateDynamicObject(870, 2097.93481, -1827.85925, 12.78000,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1597, 2097.07983, -1830.93066, 15.14000,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(870, 2094.55493, -1824.47156, 12.78000,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(870, 2094.48730, -1827.62354, 12.78000,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(870, 2097.70947, -1824.84082, 12.78000,   0.00000, 0.00000, 0.54000);
CreateObject(16151, 2113.68433, -1790.19543, 12.90000,   0.00000, 0.00000, 270.00000, 300.0); //BAR
CreateDynamicObject(19124, 2116.23511, -1786.81750, 13.11380,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19124, 2111.14819, -1786.82373, 13.11380,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19893, 2114.77881, -1789.37134, 13.52000,   0.00000, 0.00000, 0.00000);
separadorBancosUno = CreateDynamicObject(973, 2098.53296, -1797.01599, 12.42360,   0.00000, 0.00000, 90.00000);
separadorBancosDos = CreateDynamicObject(973, 2098.48169, -1817.12598, 12.42360,   0.00000, 0.00000, 90.00000);
SetDynamicObjectMaterial(separadorBancosUno, 0, 18265, "w_town3cs_t", "ws_redbrickold", 0xFFFFFFFF);
SetDynamicObjectMaterial(separadorBancosDos, 0, 18265, "w_town3cs_t", "ws_redbrickold", 0xFFFFFFFF);
CreateDynamicObject(1226, 2101.23047, -1825.01575, 16.38630,   356.85840, 0.00000, 0.00000);
CreateDynamicObject(1226, 2101.04443, -1789.26855, 16.38630,   356.85840, 0.00000, 0.00000);
CreateDynamicObject(19608, 2121.39941, -1775.61890, 12.34890,   0.00000, 0.00000, 270.00000);
CreateDynamicObject(19613, 2119.57935, -1773.89905, 12.39330,   0.00000, 0.00000, 269.88000);
CreateDynamicObject(19613, 2119.59058, -1777.50757, 12.39330,   0.00000, 0.00000, 267.11996);
CreateDynamicObject(19611, 2120.96094, -1776.83643, 12.40540,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19610, 2121.07690, -1776.84094, 14.04000,   0.00000, 0.00000, 270.00000);
CreateDynamicObject(19611, 2120.93701, -1774.44519, 12.40540,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19610, 2121.01172, -1774.46094, 14.04000,   0.00000, 0.00000, 270.00000);
CreateDynamicObject(1622, 2106.85107, -1789.86182, 16.45730,   0.00000, 0.00000, 210.00000);
CreateDynamicObject(1415, 2124.16064, -1809.30823, 12.66000,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(12957, 2133.14624, -1815.60962, 13.24750,   0.00000, 0.00000, 20.00000);
CreateDynamicObject(19589, 2124.99536, -1813.95068, 12.51840,   0.00000, 0.00000, 270.00000);
CreateDynamicObject(3005, 2124.75684, -1811.00720, 12.59250,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(3092, 2124.44531, -1814.19250, 12.86490,   90.00000, 90.00000, 270.00000);
CreateDynamicObject(1507, 2123.67163, -1801.17749, 12.52680,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(955, 2107.64551, -1790.54492, 12.92060,   0.00000, 0.00000, 180.00000);
CreateObject(2639, 2110.47168, -1778.81335, 13.09940,   0.00000, 0.00000, 270.00000, 300.0);
CreateObject(2639, 2112.42163, -1780.18921, 13.08940,   0.00000, 0.00000, 1.00000, 300.0);
CreateObject(1827, 2112.69312, -1778.68726, 12.38130,   0.00000, 0.00000, 0.00000, 300.0);
CreateObject(1827, 2113.08057, -1771.72241, 12.38130,   0.00000, 0.00000, 0.00000, 300.0);
CreateObject(2639, 2113.02588, -1770.06897, 13.08940,   0.00000, 0.00000, 180.00000, 300.0);
CreateObject(2639, 2111.12183, -1771.68494, 13.08940,   0.00000, 0.00000, 270.00000, 300.0);
CreateObject(2639, 2104.79541, -1769.93604, 13.08940,   0.00000, 0.00000, 180.00000, 300.0);
CreateObject(1827, 2104.79053, -1771.69543, 12.38130,   0.00000, 0.00000, 0.00000, 300.0);
CreateObject(2639, 2102.91016, -1771.85132, 13.08940,   0.00000, 0.00000, 270.12000, 300.0);
CreateObject(2639, 2102.48950, -1778.96252, 13.09940,   0.00000, 0.00000, 269.58002, 300.0);
CreateObject(2639, 2103.80908, -1780.74878, 13.08940,   0.00000, 0.00000, 1.00000, 300.0);
CreateObject(1827, 2104.30908, -1778.95081, 12.38130,   0.00000, 0.00000, 0.06000, 300.0);
CreateObject(970, 2100.53125, -1772.64746, 12.93370,   0.00000, 0.00000, 80.00000, 300.0);
CreateObject(970, 2099.80811, -1776.79065, 12.93370,   0.00000, 0.00000, 80.00000, 300.0);
CreateObject(970, 2099.05444, -1780.95190, 12.93370,   0.00000, 0.00000, 80.00000, 300.0);
guard = CreateDynamicObject(967, 2107.7031, -1760.2855, 12.5400, 0.0000, 0.0000, 270.0000);
SetDynamicObjectMaterial(guard, 2, 6095, "shops01_law", "GB_chatwall03b", 0x10FFFFFF);
garageMotos = CreateObject(8661, 2138.6704, -1785.16199, 12.56350,   0.00000, 0.00000, 90.00000, 300.0);
CreateDynamicObject(970, 2128.67456, -1788.17224, 13.01300,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(970, 2128.67456, -1794.1259, 13.01300,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(970, 2128.67456, -1797.88770, 13.01300,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(970, 2128.67456, -1803.09033, 13.01300,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(970, 2130.76440, -1805.13806, 13.01300,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(970, 2134.85229, -1805.13806, 13.01300,   0.00000, 0.00000, 0.00000);
SetObjectMaterial(garageMotos, 0, 3673, "xrf_refineryla", "steel256128", 0xFFFFFFFF);
CreateActor(192, 2114.82, -1790.01, 13.55, 1.13); //Actor barman
CreateActor(300, 2107.73, -1760.22, 13.56, 275.07); //Actor policia


	/*************Labels*************/
//	CreateDynamicPickup(19135, 1, 93.4527,-188.6557,2.4948,0,0,-1,100.0);     		//Tunning
	CreateDynamic3DTextLabel("{FFFFFF}Para tunear tu vehículo, usa el comando\n{FF0000}'/tunning'{FFFFFF}.",COLOR_WHITE,93.4527,-188.6557,2.4948,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el listado de productos.",COLOR_WHITE,-28.0060,-89.9514,1003.5469,7.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,-1,-1,-1,100.0);
	CreateDynamic3DTextLabel("{00AEFF}/vender objeto",COLOR_WHITE, 216.8291,-232.7234,1.7786,7,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(1)Pulsa {00AEFF}'F'{FFFFFF} para salir.",0xFFFFFF00,274.8173,311.2780,1009.1297, 7.0);//garage
 	CreateDynamic3DTextLabel("{FFFFFF}Para accesar acá\nUsa la tecla {00AEFF}'F'.",0xFFFFFF00,1434.4745,-968.5344,37.3876, 5.0);
    CreateDynamic3DTextLabel("{FFFFFF}Para accesar acá\nUsa la tecla {00AEFF}'F'.",0xFFFFFF00,992.6885,-1169.0198,20.3868, 5.0);
    CreateDynamic3DTextLabel("{FFFFFF}Para accesar a la boveda\nUsa la tecla {00AEFF}'F'.",0xFFFFFF00,978.3593,-1170.2479,12.6105, 5.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para escapar de la boveda \nUsa el comando {00AEFF}'/escapar'.",0xFFFFFF00,994.2881,-1169.8217,12.7304, 5.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para explotar la puerta de la boveda\nUsa el comando {00AEFF}'/explotar puerta'.",0xFFFFFF00,998.5244,-1170.1731,12.7304, 5.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para robar las bolsas de dinero\nUsa el comando {00AEFF}'/atracar banco'.",0xFFFFFF00,1014.0793,-1170.7107,12.6183, 5.0);
	CreateDynamic3DTextLabel("{FFFFFF}Casa de la playa {00AEFF}#1{FFFFFF}\nDueño: {00AEFF}Hareem_Garcia.",0xFFFFFF00,325.3072,-1821.3037,4.4483, 5.0);
	CreateDynamic3DTextLabel("{FFFFFF}Puede {00AEFF}/inscribirse{FFFFFF} para participar en la carrera.\nCosto:{00CC00} $2.000",COLOR_WHITE,-1447.7421,-313.3544,1052.0969,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1,25.0);
	CreateDynamic3DTextLabel("{FFFFFF}Aquí puedes solicitar un {00AEFF}/encargo{ffffff}", COLOR_WHITE, -2187.0981,715.3529,53.8992, 20.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,  0, 0, 0, -1, 20.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para unirte al crimen escribe {00AEFF}/trabajo criminal{ffffff}\nPara recibir ayuda sobre los trabajos disponibles, escribe /ayuda trabajos.", COLOR_WHITE, -2181.7563,714.6966,53.8916, 20.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,  0, 0, 0, -1, 20.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'H'{ffffff} para salir en el vehículo.", COLOR_WHITE, -2139.2771,-247.7624,544.7359, 7.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,  0, 0, -1, -1, 20.0);
  	//asotea
    CreateDynamic3DTextLabel("{FFFFFF}Para accesar acá\nUsa la tecla {00AEFF}'F'.",0xFFFFFF00,214.7758,126.6979,999.0216, 5.0);
    CreateDynamic3DTextLabel("{FFFFFF}Para accesar acá\nUsa la tecla {00AEFF}'F'.",0xFFFFFF00,1558.0908,-1675.5757,28.3955, 5.0);
   	/*banda*/
   	CreateDynamic3DTextLabel("{FFFFFF}Acá puedes comprar una facción\nUsa {00AEFF}/comprar faccion {FFFFFF}para comprar una mafia o banda",0xFFFFFF00,-2223.8730,131.3405,1035.4210, 5.0);
 	CreateDynamicPickup(1313, 23, -2223.8730,131.3405,1035.4210); // PD /enter
    CreateDynamic3DTextLabel("{FFFFFF}Te damos la bienvenida al servidor\nDisfruta del {00AEFF}servidor{FFFFFF}.",0xFFFFFF00,838.6092,-1342.2065,7.1719, 5.0);
    CreateDynamic3DTextLabel("{FFFFFF}Pinta tu vehículo acá\nUsa {00AEFF}/pintar vehiculo {FFFFFF}para poder pintarlo {00AEFF}.",0xFFFFFF00,2066.6091,-1831.4408,13.5469, 5.0);
    //NUEVA TIENDA DP
   	CreateDynamic3DTextLabel("{FFFFFF}Acá puedes comprar una membresía VIP #1\nUsa {00AEFF}/comprar vip1 {FFFFFF}para comprar la membresía",0xFFFFFF00,1192.5087,-1129.6179,24.6058, 5.0);
    CreateDynamic3DTextLabel("{FFFFFF}Acá puedes comprar una membresía VIP #2\nUsa {00AEFF}/comprar vip2 {FFFFFF}para comprar la membresía",0xFFFFFF00,1190.7648,-1129.7584,24.6058, 5.0);
   	CreateDynamic3DTextLabel("{FFFFFF}Tienda Virtual\nPulsa la tecla {00AEFF}'N' {FFFFFF}para comprar acá",0xFFFFFF00,1182.8645,-1127.0809,24.0924, 5.0);
   	CreateDynamic3DTextLabel("{FFFFFF}Prendas exclusivas\nUsa {00AEFF}/comprar accesorios {FFFFFF}para comprar aca prendas bitcoins",0xFFFFFF00,1190.2949,-1124.1346,24.1948, 5.0);
  	CreateDynamic3DTextLabel("{FFFFFF}Acá puedes comprar una facción\nPulsa {00AEFF}'Y'{FFFFFF}para comprar una mafia o banda",0xFFFFFF00,1198.1205,-1123.7181,25.3495, 5.0);
   	CreateDynamic3DTextLabel("{FF1111}Mercado negro\n{FFFFFF}Si deseas comprar un blindaje usa {FF1111}/comprar chaleco{FFFFFF}.",0xFFFFFF00,2111.4026,-1873.5719,13.5469, 25.0);
   	CreateDynamic3DTextLabel("{FF1111}Mercado negro\n{FFFFFF}Acá vendemos armas poco comunes usa {FF1111}/comprar armas{FFFFFF}.",0xFFFFFF00,2108.5903,-1873.6472,13.5469, 25.0);
   	CreateDynamic3DTextLabel("{FF1111}Mercado negro\n{FFFFFF}Venta de boombas para comprar usa {FF1111}/comprar c4{FFFFFF}.",0xFFFFFF00,2115.8987,-1873.6434,13.5469, 25.0);
	Create3DTextLabel("{00AEFF}Tienda de Bebidas\n {FFFFFF}Para comprar en la tienda escribe{00AEFF} /comprarbebidas{FFFFFF}.",COLOR_WHITE,499.9684,-20.6495,1000.6797,23,0,1);
	Create3DTextLabel("{FFFFFF}Los pescadores pueden {00AEFF}/lanzar arpon{FFFFFF} para pescar en esta zona.",COLOR_WHITE,893.5552,-2447.8867,-0.3858,23,0,1);
	Create3DTextLabel("{FFFFFF}Los pescadores pueden {00AEFF}/lanzar arpon{FFFFFF} para pescar en esta zona.",COLOR_WHITE,44.3815,-1690.3977,-0.3986,23,0,1);
	Create3DTextLabel("{FFFFFF}Para vender tu vehículo, escribe{00AEFF} /vender vehiculo{FFFFFF}.",COLOR_WHITE,1802.7854,-1303.8938,93.0391,23,0,1);
	Create3DTextLabel("{FFFFFF}Para comprar materiales\nEscribe {00AEFF}/comprar materiales{FFFFFF}\nCantidad {00AEFF}50 materiales{FFFFFF} | Costo: {00EB18}$1250{FFFFFF}.",COLOR_WHITE,2823.3486,-1420.3571,16.2562,23,0,1);
	Create3DTextLabel("{FFFFFF}Para comprar materiales\nEscribe {00AEFF}/comprar materiales{FFFFFF}\nCantidad {00AEFF}50 materiales{FFFFFF} | Costo: {00EB18}$1250{FFFFFF}.",COLOR_WHITE,1422.6765,-1319.3438,13.5547,23,0,1);
	Create3DTextLabel("{FFFFFF}Para comprar materiales\nEscribe {00AEFF}/comprar materiales{FFFFFF}\nCantidad {00AEFF}250 materiales{FFFFFF} | Costo: {00EB18}$6250{FFFFFF}.",COLOR_WHITE,-1735.7610,1244.9299,7.5469,23,0,1);
	//Faros
	CreateDynamic3DTextLabel("{FFFFFF}Usa {00AEFF}/bajar{FFFFFF} para bajar y salir del faro.",COLOR_WHITE,909.7603,-3016.5725,49.9987,20,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Usa {00AEFF}/bajar{FFFFFF} para bajar y salir del faro.",COLOR_WHITE,154.4787,-1953.9596,47.8722,20,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Usa {00AEFF}/subir{FFFFFF} para subir al faro.",COLOR_WHITE,905.4720,-3021.9995,7.5059,20,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Usa {00AEFF}/subir{FFFFFF} para subir al faro.",COLOR_WHITE,154.1846,-1946.6228,5.3903,20,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	// Trabajos
	Create3DTextLabel("{FFFFFF}Para ser de Médico, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,1178.1359,-1361.3021,14.2302,23,0,1);
	Create3DTextLabel("{FFFFFF}Para ser fabricante y vendedor de armas, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,2122.9236,-2275.1238,20.6719,23,0,1);
	Create3DTextLabel("{FFFFFF}Para ser de Camionero, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,-1715.0378,-63.1466,3.6340,23,0,1);
	Create3DTextLabel("{FFFFFF}Para ser de Guardaespaldas, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,2226.3508,-1719.0221,13.5261,23,0,1);
	CreateDynamic3DTextLabel("{00AEFF}¿Busca un empleo?\n\n{FFFFFF}Pulsa la tecla {3399FF}'Y'{FFFFFF} para confirmar.",COLOR_WHITE,958.2482,-54.3517,1001.1172,5.0); // TRABAJO PROSTITUCION
	CreateDynamic3DTextLabel("{FFFFFF}Para ser de Taxista, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,-2024.7489,-113.9102,1038.8187,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 5,5,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para ser de Basurero, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,-177.6093,-1549.4420,6.3284,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para ser de Mecánico, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,114.7220,-151.4292,1.5781,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para ser de Pescador, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,2790.0251,-2574.5549,3.3469,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para ser de Transportista, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,2583.8274,1644.3837,1087.5602,23, INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,5,1,-1,100.0); //Aquí seria para conseguir el Trabajo de Transportista
	CreateDynamic3DTextLabel("{FFFFFF}Para trabajar de Minero, pulsa la tecla {3399FF}'Y'{FFFFFF}\nPara recibir ayuda sobre los trabajos disponibles, escribe {00AEFF}/ayuda trabajos{FFFFFF}.",COLOR_WHITE,-382.5980,2199.3918,25.4105,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de {00AEFF}/mecanico{FFFFFF}.",COLOR_WHITE,84.3491,-149.0520,2.6000,15,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Los mineros aquí pueden {00AEFF}/dejar roca",COLOR_WHITE, -548.2949,2336.7649,83.4777, 23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CCFF}Venta de repuestos{FFFFFF}\n Precio: {00CC00}$100{FFFFFF} c/u.\n{FFFFFF}Para comprar repuestos escribe{00AEFF} /comprar repuestos{FFFFFF}.",COLOR_WHITE,93.3250,-161.6600,2.5938,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de {00AEFF}/basurero{FFFFFF}.",COLOR_WHITE,-170.3641,-1555.9705,6.5706,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Escribe {00AEFF}/reparar embarcacion{FFFFFF} para reparar tu embarcación.",COLOR_WHITE,2745.3225,-2596.3396,-0.1532,23,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,0,0,-1,100.0);
	CreateDynamic3DTextLabel("{00BCFE}Permiso de pesca{FFFFFF}\n Escribe {00AEFF}/permiso pesca{FFFFFF} para conseguir tu permiso",COLOR_WHITE,2785.9165,-2575.4348,3.1600,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Los mineros aquí pueden\nponerse su {00AEFF}/uniforme minero{FFFFFF}.",COLOR_WHITE, 269.1445,295.4604,999.8400, 23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CC00}Hierro\n{FFFFFF}Nivel de minero necesario: {00CC00}1{FFFFFF}\nEscribe {00AEFF}/picar{FFFFFF}.",COLOR_WHITE,-740.4136,2392.6699,4.1117,23, INVALID_PLAYER_ID, INVALID_VEHICLE_ID,-1,-1,-1,-1,100.0);
	CreateDynamic3DTextLabel("{00CC00}Cobre\n{FFFFFF}Nivel de minero necesario: {00CC00}2{FFFFFF}\nEscribe {00AEFF}/picar{FFFFFF}.",COLOR_WHITE,-745.1193,2408.8325,1.3375,23, INVALID_PLAYER_ID, INVALID_VEHICLE_ID,-1,-1,-1,-1,100.0);
	CreateDynamic3DTextLabel("{00CC00}Titanio\n{FFFFFF}Nivel de minero necesario: {00CC00}3{FFFFFF}\nEscribe {00AEFF}/picar{FFFFFF}.",COLOR_WHITE,-729.0903,2410.1563,7.2710,23, INVALID_PLAYER_ID, INVALID_VEHICLE_ID,-1,-1,-1,-1,100.0);
	CreateDynamic3DTextLabel("{00CC00}Mercurio\n{FFFFFF}Nivel de minero necesario: {00CC00}4{FFFFFF}\nEscribe {00AEFF}/picar{FFFFFF}.",COLOR_WHITE,-728.3772,2422.0627,7.1895,23, INVALID_PLAYER_ID, INVALID_VEHICLE_ID,-1,-1,-1,-1,100.0);
	CreateDynamic3DTextLabel("{37db3f}Estudio de radio y Televisión\n\n{FFFFFF}Pulsar [ F ] Para Entrar.", COLOR_WHITE, 649.0013,-1360.7864,13.5868, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1, 100.0);
	CreateDynamic3DTextLabel("{37db3f}Salón de eventos{FFFFFF}\n\n{FFFFFF}Pulsar [ F ] Para Entrar.", COLOR_WHITE, 1423.4301,-1180.1801,25.9922, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1, 100.0);
	CreateDynamic3DTextLabel("{37db3f}Club Alhambra{FFFFFF}\n\n{FFFFFF}Pulsar [ F ] Para Entrar.", COLOR_WHITE, 1836.9700,-1682.4700,13.4258, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1, 100.0);
	CreateDynamic3DTextLabel("{d0d3d4}Escuela de paracaidismo\n{FFFFFF}Puedes {00AEFF}/inscribirse {FFFFFF}para participar en el siguiente salto\nCosto: {00cc00}$5000", -1, 415.0879,2535.5859,19.1484, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1, 100.0);
	CreateDynamic3DTextLabel("{37db3f}Burdel\n\n{FFFFFF}Pulsar [ F ] Para Entrar.", COLOR_WHITE, 2014.8400,1150.4700,10.9203+1.0, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Compra y venta de objetos\n{00AEFF}/comprar objetos{FFFFFF} - {00AEFF}/vender objetos",COLOR_WHITE,196.3872,-231.1294,1.7786,5.0);
	//Salidas
	Create3DTextLabel("{FFFFFF}(2){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-27.3408,-31.7468,1003.6600+1.0,7.0, -1, -1);
	Create3DTextLabel("{FFFFFF}(3){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-27.3931,-58.2556,1003.6500+1.0,7.0, -1, -1);
	Create3DTextLabel("{FFFFFF}(4){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,2532.6731,1598.2499,1087.7430+1.0,7.0, -1, -1);
	Create3DTextLabel("{FFFFFF}(4){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-2737.1101,625.3660,1385.6547+1.00,7.0, -1, -1); //HPSF
	Create3DTextLabel("{FFFFFF}(5){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,1251.8484,-812.2070,1164.2759+1.00,7.0, -1, -1); //HPLV // GANTON
	Create3DTextLabel("{FFFFFF}(7){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,2332.5701,-1254.7500,1026.29,7.0, -1, -1); //albergue
	Create3DTextLabel("{FFFFFF}(8){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,493.3470,-24.8391,1000.7800,7.0, -1, -1); //Alhambra
	Create3DTextLabel("{FFFFFF}(9){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,1204.8600,-13.8459,1001.0200,7.0, -1, -1); //Club Striptis
	Create3DTextLabel("{FFFFFF}(10){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,246.38,107.31,1003.22+1.00,7.0, 1, 1);
	Create3DTextLabel("{FFFFFF}(11){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,2304.6858,-16.1730,26.7422+1.00,7.0, 1, 1);
	Create3DTextLabel("{FFFFFF}(12){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-2240.7715,137.1613,1035.4141+1.00,7.0, 1, 6);
	Create3DTextLabel("{FFFFFF}(13){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-30.9883,-92.0101,1003.5469+1.00,7.0,0,1);
	Create3DTextLabel("{FFFFFF}(14){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,493.4037,-24.8556,1000.6797+1.00,7.0,0,1);
	Create3DTextLabel("{FFFFFF}(15){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,246.7735,62.6075,1003.6406+1.00,7.0,0,1);
	Create3DTextLabel("{FFFFFF}(16){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,207.7022,-111.1636,1005.1328+1.00,7.0,0,1);
	Create3DTextLabel("{FFFFFF}(17){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,772.2999,-5.2435,1000.7286+1.00,7.0,0,1);
	Create3DTextLabel("{FFFFFF}(18){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,834.5561,7.3938,1004.1870+1.00,7.0,0,1);
	Create3DTextLabel("{FFFFFF}(19){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-229.1293,1401.1205,27.7656+1.00,7.0, 0, 1);
	Create3DTextLabel("{FFFFFF}(20){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,223.0810,1287.0770,1082.1406+1.00,7.0, -1, 1);
	Create3DTextLabel("{FFFFFF}(21){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,1403.8179,601.0150,1001.0300+0.3,4.0, -1, -1); //Int 43
	Create3DTextLabel("{FFFFFF}(22){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,246.4200,107.3000,1003.2200+1.00,7.0, -1, 1);//SFPD
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'H'{FFFFFF} para salir en el vehículo.",COLOR_WHITE,-1976.4287,212.0480,1035.8162+0.25,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0); //Salida Fabrica Garaje
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'H'{FFFFFF} para ver la lista de actividades.",COLOR_WHITE,-2018.3846,248.9650,1035.8389+0.6,3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0); //Actividades
	CreateDynamic3DTextLabel("{779ab5}Keypad\n{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para usar.", COLOR_WHITE, -2022.8929, 253.0043, 1036.1030, 1);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'H'{FFFFFF} para\nadministrar la fábrica.",COLOR_WHITE,-2020.4500,251.5991,1035.9010+0.2,3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0); //Administrar Fabrica
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'H'{FFFFFF} para dejar un {00CC00}bolso con dinero{FFFFFF}.",COLOR_WHITE,235.7830,109.9401,1010.2188+0.2,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0); //Pulsa 'H' Para dejar un bolso con dinero.
	CreateDynamic3DTextLabel("{FFFFFF}(23){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,965.5889,-53.1844,1001.1246+0.8,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0); //PROSTIBULO
	CreateDynamic3DTextLabel("{FFFFFF}(24){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,2332.5701,-1254.7500,1026.2899+0.8,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0); //ALBERGUE
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} o usa {00AEFF}/salir{FFFFFF} para salir del vestuario.",COLOR_WHITE,251.0166,76.3774,1003.6406,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(25){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-1166.5009,2126.8232,1246.5457+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Usa {00AEFF}/salir{FFFFFF} para salir.",COLOR_WHITE,168.1524,1436.1014,1084.8462+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsar [ F ] Para Entrar.",COLOR_WHITE,186.8628,1428.6979,10.5912+0.6,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,0,0,-1,100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Escribe {00AEFF}/salir{FFFFFF} para salir del elevador.",COLOR_WHITE,1783.8291,-1301.7024,13.5026+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(26){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,203.4271,1417.9021,1091.2000+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(27){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-1074.4355,339.9846,1180.5259+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(28){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,387.4330,194.3359,1040.1078+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(29){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,207.6859,-110.8290,1005.1328+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(30){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,161.4287,-96.9712,1001.8047+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(31){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,1092.6782,-152.2306,1001.1160+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(32){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,207.0226,-140.2560,1003.5078+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(33){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,204.2934,-168.8588,1000.5234+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(34){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,227.5291,-8.1299,1002.2109+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(35){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,502.0160,-67.6595,998.7578+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(36){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-2029.7441,-118.6951,1038.8187+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(37){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,2594.2100,1649.7188,1087.5581+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(38){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,1204.5865,-13.8364,1000.9219+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(39){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,372.3595,-133.5242,1001.4922+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(40){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-1387.9806,-324.9726,1052.0834+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(41){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,1156.9583,-1312.1549,-10.7849+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(42){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-1544.0551,-446.6218,6.0068+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 0,0,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(43){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-1232.5634,54.9100,14.1276+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 0,0,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(44){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,1719.9429,1619.2629,10.0866+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 0,0,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(45){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,390.4993,173.9211,1008.3828+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 3,3,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(46){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-376.4527,2196.6853,25.4105+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(47){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,269.1789,293.6963,999.8400+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(48){FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para salir.",COLOR_WHITE,-718.7835,2462.5969,9.9039+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(49){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-1275.5626,2108.7246,1246.5457+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(50){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-31.0100,-92.0103,1003.5469+1.00,7.0,	INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(51){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,254.1746,-41.6122,1002.0308+1.00,7.0,	INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(52){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-25.9019,-188.0416,1007.7300+1.00,7.0,	INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(53){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,663.4366,-202.8868,1276.7941+1.00,7.0,	INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(54){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,1167.2426,-14.5519,1020.6459+1.00,7.0,	INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(55){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,-100.3841,-25.0388,1000.7188+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(56){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,238.5774,138.7619,1003.0234+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}(57){FFFFFF}Pulsa {00AEFF}'F'{FFFFFF} para salir.",COLOR_WHITE,2304.6863,-16.1371,26.7422+1.00,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	//ESTACIONAMIENTOS//
	CreateDynamic3DTextLabel("{FFFFFF}Vestuario y depósito de armas\n{FFFFFF}Pulsar [ F ] Para Entrar.",COLOR_WHITE,276.2080,122.0958,1004.6172, 7,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Vestuario y depósito de armas\n{FFFFFF}Pulsar [ F ] Para Entrar.",COLOR_WHITE,207.9470,142.3866,1003.0234, 7,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 7,3,-1, 100.0);
	CreateDynamic3DTextLabel("{00AEFF}/control",COLOR_WHITE,-1192.7047,2064.7141,1254.8612,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el listado de productos.",COLOR_WHITE,-1262.6428,2119.9490,1246.5457,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el listado de productos.",COLOR_WHITE,-30.5101,-28.9864,1003.5573,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el listado de productos.",COLOR_WHITE,-23.2806,-55.6424,1003.5469,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CC00}Listado de productos\n{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para interacturar.",COLOR_WHITE,969.3793,-44.8069,1001.1172,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);//STRIPER CLUB
	CreateDynamic3DTextLabel("{00CC00}Listado de productos\n{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para interacturar.",COLOR_WHITE,499.9690,-20.6826,1000.6797,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CC00}Listado de productos\n{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para interacturar.",COLOR_WHITE,1214.8466,-13.3504,1000.9219,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,831.5464,-1361.7238,-0.5015,23);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,1757.1368,-1943.4417,13.5703,23);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,1746.9652,-1943.4482,13.5703,23);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,-1974.0217,116.7847,27.6875,23);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,1437.3113,2655.2742,11.3926,23);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,1437.4141,2620.1450,11.3926,23);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,2856.5955,1314.5538,11.3906,23);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,2856.5969,1266.9460,11.3906,23);
	CreateDynamic3DTextLabel("{FFFFFF}Venta de Boletos{00AEFF}\n/comprar boleto{FFFFFF}.",COLOR_WHITE,826.7249,-1353.6726,13.5369,23);
	CreateDynamic3DTextLabel("{FFFFFF}Alquiler de motocicletas{00AEFF}\n/alquilar vehículo{FFFFFF}.",COLOR_WHITE,825.1167,-1356.1001,13.5428,23);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver la ubicación de los puntos de interés.",COLOR_WHITE,-1959.7164,141.9694,27.6875,7);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver la ubicación de los puntos de interés.",COLOR_WHITE,-1962.3730,130.1360,27.6875,7);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver la ubicación de los puntos de interés.",COLOR_WHITE,1729.7041,-1943.3695,13.5705,7);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver la ubicación de los puntos de interés.",COLOR_WHITE,822.8813,-1353.8101,-0.5078,7);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver la ubicación de los puntos de interés.",COLOR_WHITE,1439.4858,2644.6511,11.3926,7);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver la ubicación de los puntos de interés.",COLOR_WHITE,2856.4263,1296.8097,11.3906,7);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para solicitar el paso.",COLOR_WHITE,832.2947,-2958.3792,12.1438,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para solicitar el paso.",COLOR_WHITE,834.7955,-2959.8113,12.1212,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CCFF}Piso: 9\n{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,1783.6853,-1300.7665,65.8125,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CCFF}Piso: 14\n{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,1783.8641,-1300.7637,93.0391,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CCFF}Piso: 17\n{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,1783.6937,-1300.7670,109.3594,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00AEFF}/comprar herramientas{FFFFFF}.",COLOR_WHITE,-1072.1169,354.2132,1180.5259,7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,-1,-1,-1,100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,1159.4829,-1356.8820,-10.7922,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 9,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,1159.4829,-1356.8820,-10.7922,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 8,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,1159.4829,-1356.8820,-10.7922,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 6,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,1159.4829,-1356.8820,-10.7922,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 7,6,-1, 100.0);
	//SF
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,1234.4447,-830.0233,1164.2759,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 9,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,1234.4447,-830.0233,1164.2759,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 8,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,1234.4447,-830.0233,1164.2759,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 6,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,1234.4447,-830.0233,1164.2759,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 7,6,-1, 100.0);
	//LV
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,-2729.9434,614.0607,1385.6534,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 9,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,-2729.9434,614.0607,1385.6534,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 8,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,-2729.9434,614.0607,1385.6534,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 6,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Ropa de médico: {00AEFF}/uniforme medico{FFFFFF}.",COLOR_WHITE,-2729.9434,614.0607,1385.6534,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 7,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el botiquín.",COLOR_WHITE,1169.7440,-1353.4617,-10.7922,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 8,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el botiquín.",COLOR_WHITE,1169.7440,-1353.4617,-10.7922,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 7,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el botiquín.",COLOR_WHITE,1169.7440,-1353.4617,-10.7922,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 6,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el botiquín.",COLOR_WHITE,1169.7440,-1353.4617,-10.7922,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 9,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el botiquín.",COLOR_WHITE,-2720.8923,647.0943,1385.6534,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 9,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el botiquín.",COLOR_WHITE,1235.0582,-821.8716,1164.2759,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 9,6,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para vender tu propiedad, escribe {00AEFF}/vender propiedad{FFFFFF}.",COLOR_WHITE,1809.5894,-1299.8063,65.8125, 7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 0,0,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Para pedir el servicio de grúa, escribe {00AEFF}/servicio grua{FFFFFF}.",COLOR_WHITE,1821.7529,-1280.6038,109.3594, 7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, 0,0,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Vaso de Sprunk\nPrecio:{00CC00}$65\n{00AEFF}/comprar sprunk",COLOR_WHITE,-19.4919,-180.4340,1007.7656, 5.0);
	CreateDynamic3DTextLabel("{FFFFFF}Vaso de Sprunk\nPrecio:{00CC00}$65\n{00AEFF}/comprar sprunk",COLOR_WHITE,-21.0096,-74.3110,1003.5542, 5.0);
	CreateDynamic3DTextLabel("{00AEFF}Estantería\n{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para verla.",COLOR_WHITE,255.7412,-40.2322,1002.0234,7.0,				INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsar [ F ] Para Entrar.",COLOR_WHITE,300.3342,311.4263,999.1484+0.6,15.0,				INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Consigue tu {00AEFF}/chaleco {FFFFFF}antibalas y botiquín.",COLOR_SEIS,248.7588,74.3215,1002.6406, 5.0);
	CreateDynamic3DTextLabel("{FFFFFF}Consigue tus {00AEFF}/armas {FFFFFF} en estas cajas.",COLOR_SEIS,249.3380,73.3156,1003.1578+0.5, 5.0);
	CreateDynamic3DTextLabel("{FFFFFF}Uniforme de policía\nPresiona {00AEFF}'Y' {FFFFFF}para ponertelo",COLOR_SEIS,254.4149,73.7001,1003.6406, 3.0);
	CreateDynamic3DTextLabel("{FFFFFF}Cerveza {00CC00}$40 {00AEFF}/comprar cerveza{FFFFFF}.\n{FFFFFF}Vino {00CC00}$60 {00AEFF}/comprar vino{FFFFFF}.\n{FFFFFF}Sprunk {00CC00}$70 {00AEFF}/comprar sprunk{FFFFFF}.",COLOR_WHITE,-225.1540,1404.1327,27.7734,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Cerveza {00CC00}$40 {00AEFF}/comprar cerveza{FFFFFF}.\n{FFFFFF}Vino {00CC00}$60 {00AEFF}/comprar vino{FFFFFF}.\n{FFFFFF}Sprunk {00CC00}$70 {00AEFF}/comprar sprunk{FFFFFF}.",COLOR_WHITE,498.6868,-76.0385,998.7578,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CC00}Listado de productos\n{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para interacturar.",COLOR_WHITE,-784.2098,500.1945,1371.7422,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00CC00}Listado de productos\n{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para interacturar.",COLOR_WHITE,-1396.3044,-320.4939,1052.0834,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}¿Cometió algún crimen?\nAquí puede {00AEFF}/entregarse{FFFFFF}.",COLOR_WHITE,240.4520,112.8195,1003.2188,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}¿Cometió algún crimen?\nAquí puede {00AEFF}/entregarse{FFFFFF}.",COLOR_WHITE,235.2946,166.3358,1003.0300,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00AEFF}/comprar juguetes{FFFFFF}.",COLOR_WHITE,-103.9013,-22.6749,1000.7188,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00AEFF}/comprar juguetes{FFFFFF}.",COLOR_WHITE,1214.0737,-13.3524,1000.9219,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Caja de aquarius con 12 unidades\nPrecio: {00CC00}$1560\n{00AEFF}/comprar caja{FFFFFF}.",COLOR_WHITE,93.7855,-305.2337,1.5781,23,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,0,0,-1,100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Caja de vino con 12 unidades\nPrecio: {00CC00}$600\n{00AEFF}/comprar caja{FFFFFF}.",COLOR_WHITE,93.7853,-309.5841,1.5781,23,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,0,0,-1,100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Caja de cerveza con 12 unidades\nPrecio: {00CC00}$480\n{00AEFF}/comprar caja{FFFFFF}.",COLOR_WHITE,93.7853,-313.7030,1.5781,23,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,0,0,-1,100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Caja de sprunk con 12 unidades\nPrecio: {00CC00}$480\n{00AEFF}/comprar caja{FFFFFF}.",COLOR_WHITE,86.0509,-315.2853,1.8494,23,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,0,0,-1,100.0);
	CreateDynamic3DTextLabel("{00AEFF}Propiedad de Groove Street",0xEB0000FF,2495.4424,-1691.1359,14.7656,20,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,0,0,-1,100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para ver el listado de productos.",COLOR_WHITE,373.7276,-118.8039,1001.4922,7.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID,1,-1,-1,-1,100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Escribe {00AEFF}/comprar licencia {FFFFFF}para para adquirir una licencia de piloto.",COLOR_WHITE,1163.9730,-2.7876,1020.6459,5.0,	INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	//Nuevos TextLabel's//
	CreateDynamic3DTextLabel("{37db45}Salón de Eventos{FFFFFF}\nEntrada para vehículos\n\n{FFFFFF}Pulsar [ F ] Para Entrar.",COLOR_WHITE,1410.7946,-1228.7570,13.5469+1.0,23,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{37db3f}Albergue para indigentes\n{FFFFFF}Propietario: {00D0FF}Gobierno\n\n{FFFFFF}Pulsar [ F ] Para Entrar.",COLOR_WHITE,-1724.9301,-26.2651,3.5547,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{37db3f}Club de striptease\n\n{FFFFFF}Pulsar [ F ] Para Entrar.",COLOR_WHITE,2014.8101,1107.0100,10.9203,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Bolso con dinero para transportar\n{00AEFF}/agarrar bolso",COLOR_WHITE,1401.7382,523.9576,1000.9901,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Armamento\n{00AEFF}/agarrar armas",COLOR_WHITE,1424.4259,491.4817,1007.4585,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Camión de caudales\n{00AEFF}/guardar bolso",COLOR_WHITE,1439.8810,472.1569,1007.4581,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("\n{FFFFFF}Pulsa {00AEFF}'Y'{FFFFFF} para arrojar\n{00CC00}$500{FFFFFF} a la bailarina",COLOR_WHITE,1212.3831,-5.3079,1000.9219,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}\n\n\n\n¿Necesitas ayuda?\n{00AEFF}/ayuda club",COLOR_WHITE,1206.2085,-0.9576,1000.9519+1.40,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Sala privada\n{FFFFFF}Pulsar [ F ] Para Entrar.",COLOR_WHITE,1204.8096,12.6643,1000.9219+0.75,7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	//ASCENSOR
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,10.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,14.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,19.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,23.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,27.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,31.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,36.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,40.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,44.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{FFFFFF}Pulsa '{00AEFF}Y{FFFFFF}' para usar el elevador.",COLOR_WHITE,2117.8604,2415.0771,48.8428,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 1, -1,-1,-1, 100.0);
	CreateDynamic3DTextLabel("{00AEFF}SALA 1",COLOR_WHITE,1160.1355,-1323.6254,-8.2668,4.0);
	CreateDynamic3DTextLabel("{00AEFF}SALA 2",COLOR_WHITE,1160.0181,-1333.1748,-8.2668,4.0);
	CreateDynamic3DTextLabel("{00AEFF}SALA 3",COLOR_WHITE,1153.3662,-1332.9631,-8.2668,4.0);
	CreateDynamic3DTextLabel("{00AEFF}SALA 4",COLOR_WHITE,1160.4609,-1342.7770,-8.2668,4.0);
	CreateDynamic3DTextLabel("{00AEFF}SALA 5",COLOR_WHITE,1153.8414,-1342.8153,-8.2668,4.0);
	CreateDynamic3DTextLabel("{00AEFF}SALA 6",COLOR_WHITE,1153.6920,-1351.9772,-8.2668,4.0);

	/*****************MAPS ICONS *****************/
	// Map icon
	CreateDynamicMapIcon(2014.8101,1107.0100,10.9203, 21, -1, -1, -1, -1, 600.0);       //Striptease
	CreateDynamicMapIcon(-1808.7142,945.9161,24.8906, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(-1720.9456,1359.7822,7.1853, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(2083.3376,2224.7012,11.0234, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(2756.7642,2477.3533,11.0625, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(2638.7839,1849.7867,11.0234, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(2331.8098,75.0506,26.6210, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(1367.5475,248.2522,19.5669, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(203.3945,-201.9418,1.5781, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(2105.4844,-1806.4695,13.5547, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(2351.8242,2533.6289,10.8203, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(2330.6023,2533.6121,10.8203, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(2309.5044,2533.6143,10.8203, 29, 0, 0, 0, -1, 600.0);			//Pizzeria
	CreateDynamicMapIcon(-1735.7610,1244.9299,7.5469, 18, 0, 0, 0, -1, 600.0);			//Materiales I (SF)
	CreateDynamicMapIcon(1422.6765,-1319.3438,13.5547, 18, 0, 0, 0, -1, 600.0); 		//Materiales II (LS)
	CreateDynamicMapIcon(2823.3486,-1420.3571,16.2562, 18, 0, 0, 0, -1, 600.0); 		//Materiales III (LS)
	CreateDynamicMapIcon(1173.7434,-1323.3525,15.1953, 22, 0, 0, 0, -1, 600.0);			//Hospital LS
	CreateDynamicMapIcon(2027.2164,-1420.3737,16.9922, 22, 0, 0, 0, -1, 600.0);			//Hospital Groove
	CreateDynamicMapIcon(-2665.0000,640.1640,14.5531, 22, 0, 0, 0, -1, 600.0);			//Hospital SF
	CreateDynamicMapIcon(1607.4094,1815.2427,10.8203, 22, 0, 0, 0, -1, 600.0);			//Hospital LV
	CreateDynamicMapIcon(1564.6022,-1675.2286,61.8959, 30, 0, 0, 0, -1, 600.0);			//LSPD
	CreateDynamicMapIcon(-1605.5137,710.2757,13.8672, 30, 0, 0, 0, -1, 600.0);			//SFPD
	CreateDynamicMapIcon(2290.1978,2431.4529,10.8203, 30, 0, 0, 0, -1, 600.0);			//LVPD
	CreateDynamicPickup(1318, 1, -1724.9301,-26.2651,3.5547,0,0,-1,100.0);     			//ALBERGUE
	CreateDynamicPickup(1318, 1, 1836.9700,-1682.4700,13.4258,0,0,-1,100.0);     		//Club Alhambra
	CreateDynamicPickup(1318, 1, 2014.8101,1107.0100,10.9203,0,0,-1,100.0);     		//Club Stripsea
	CreateDynamicMapIcon(-1954.3665,142.0110,26.8579, 42, 0, 0, 0, -1, 600.0); 			//Estacion Tren SF
	CreateDynamicMapIcon(1729.2218,-1949.7788,14.1172, 42, 0, 0, 0, -1, 600.0); 		//Estacion Tren LS 1
	CreateDynamicMapIcon(824.6184,-1354.0803,13.5379, 42, 0, 0, 0, -1, 600.0); 			//Estacion Tren LS 2
	CreateDynamicMapIcon(1433.2081,2628.2771,11.3926, 42, 0, 0, 0, -1, 600.0); 			//Estacion Tren LV 1
	CreateDynamicMapIcon(2854.0220,1290.9554,11.3906, 42, 0, 0, 0, -1, 600.0); 			//Estacion Tren LV
	CreateDynamicMapIcon(2244.4436,-1665.2526,15.4766, 45, 0, 0, 0, -1, 600.0); 		//Binco
	CreateDynamicMapIcon(1456.4785,-1137.6067,23.9485, 45, 0, 0, 0, -1, 600.0); 		//ZIP
	CreateDynamicMapIcon(499.5177,-1360.6284,16.3690, 45, 0, 0, 0, -1, 600.0); 			//Pro Laps
	CreateDynamicMapIcon(454.2013,-1477.9746,30.8137, 45, 0, 0, 0, -1, 600.0); 			//DS
	CreateDynamicMapIcon(2111.9539,-1213.1942,23.9654, 45, 0, 0, 0, -1, 600.0); 		//Sub Urban
	CreateDynamicMapIcon(461.7039,-1500.7959,31.0453, 45, 0, 0, 0, -1, 600.0); 			//Victim
	CreateDynamicMapIcon(-1581.2299,867.9284,7.6953, 52, 0, 0, 0, -1, 600.0); 			//Banco SF
	CreateDynamicMapIcon(1498.4614,-1580.7184,13.5498, 52, 0, 0, 0, -1, 600.0); 		//Banco LSPD
	CreateDynamicMapIcon(2449.4690,2290.2200,10.8203, 52, 0, 0, 0, -1, 600.0); 			//Banco LV
	CreateDynamicMapIcon(1457.1293,-1009.9208,26.8438, 52, 0, 0, 0, -1, 600.0); 		//Banco LS grande
	CreateDynamicMapIcon(1656.1246,-1883.6947,13.1237, 55, 0, 0, 0, -1, 600.0);			//Conce Barato
	CreateDynamicMapIcon(2127.5342,-1123.4701,24.9874, 55, 0, 0, 0, -1, 600.0);			//Conce Coutt And Schutz
	CreateDynamicMapIcon(557.6544,-1260.8588,16.8133, 55, 0, 0, 0, -1, 600.0);			//Conce GROTTI
	CreateDynamicMapIcon(-1989.7445,288.3349,33.9223, 55, 0, 0, 0, -1, 600.0);			//Conce Wang Cars
	CreateDynamicMapIcon(1464.9510,-1780.9888,13.9439, 55, 0, 0, 0, -1, 600.0);			//Conce Wang Cars Los Santos
	CreateDynamicMapIcon(1790.4875,-1291.0826,13.5947, 57, 0, 0, 0, -1, 600.0);			//Edificio Municipal
	CreateDynamicMapIcon(1377.0605,1152.7566,10.8203, 60, 0, 0, 0, -1, 600.0);			//Trabajo Transportista
	CreateDynamicMapIcon(2226.3508,-1719.0221,13.5261, 60, 0, 0, 0, -1, 600.0);			//Trabajo Guardaespalda
	CreateDynamicMapIcon(-384.8158,2206.0991,42.4235, 60, 0, 0, 0, -1, 600.0);			//Trabajo Minero
	CreateDynamicMapIcon(1742.9551,-1864.2202,13.5741, 60, 0, 0, 0, -1, 600.0);			//Trabajo Taxi
	CreateDynamicMapIcon(114.7220,-151.4292,1.5781, 60, 0, 0, 0, -1, 600.0);			//Trabajo Mecanico
	CreateDynamicMapIcon(1178.1359,-1361.3021,14.2302, 60, 0, 0, 0, -1, 600.0);			//Trabajo Medico
	CreateDynamicMapIcon(-177.6093,-1549.4420,6.3284, 60, 0, 0, 0, -1, 600.0);			//Trabajo Basurero
	CreateDynamicMapIcon(2122.9236,-2275.1238,20.6719, 60, 0, 0, 0, -1, 600.0);			//Trabajo Armero
	CreateDynamicMapIcon(-1715.0378,-63.1466,3.6340, 60, 0, 0, 0, -1, 600.0);			//Trabajo Camionero
	CreateDynamicMapIcon(2789.3672,-2574.6675,3.1683, 60, 0, 0, 0, -1, 600.0);			//Trabajo Pescador
	CreateDynamicMapIcon(-386.7375,-1470.0562,25.7266, 60, 0, 0, 0, -1, 600.0);			//Trabajo Cosechador FR
	CreateDynamicMapIcon(-38.5154,56.1632,3.1172, 60, 0, 0, 0, -1, 600.0);				//Trabajo Cosechador BB
	CreateDynamicMapIcon(2014.8400,1150.4700,10.9203, 60, 0, 0, 0, -1, 600.0);			//Trabajo Prostitución LV
	CreateDynamicPickup(1318, 1, 2014.8400,1150.4700,10.9203,0,0,-1,100.0);     		//Trabajo Prostitución LV
	CreateDynamicMapIcon(2362.7698,2306.3025,8.1406, 58, 0, 0, 0, -1, 600.0);			//Academia
	CreateDynamicMapIcon(1451.6383,-2287.0015,13.5469, 5, 0, 0, 0, -1, 600.0);			//Escuela de Aviación

	/***************ACTORES**********/
	//Actores Academia
	CreateDynamicActor(96,663.7415,-236.8033,1276.7600,43.9748, 1,100.0,9);
	CreateDynamicActor(266,664.5109,-219.4480,1276.7600,129.0393, 1,100.0,9);
	CreateDynamicActor(265,643.4172,-236.0282,1276.7600,357.3718, 1,100.0,9);
	CreateDynamicActor(280,647.9240,-190.3933,1276.7993,135.8160, 1,100.0,9);
	CreateDynamicActor(59,628.5812,-211.7128,1276.7863,267.7645, 1,100.0,9);
	CreateDynamicActor(40,627.1611,-208.5336,1276.7897,89.9853, 1,100.0,9);
	CreateDynamicActor(307,628.4916,-192.4982,1276.7865,221.3817, 1,100.0,9);
	//Actores FC
	//CreateDynamicActor(282,208.9395,1446.4591,1091.1978,86.0158, 1,100.0,15);
	CreateDynamicActor(310,207.3759,1446.1738,1091.1978,90.1247, 1,100.0,15);
	CreateDynamicActor(282,287.2974,1416.9502,10.3933,179.6222, 1,100.0,0);
	CreateDynamicActor(282,261.9764,1406.2178,10.5000,359.3414, 1,100.0,0);
	CreateDynamicActor(282,170.9301,1418.2113,10.5859,240.8782, 1,100.0,0);
	CreateDynamicActor(282,172.5020,1429.9185,10.5912,274.8922, 1,100.0,0);
	CreateDynamicActor(209,173.1992,1427.0421,10.5912,321.5572, 1,100.0,0);
	CreateDynamicActor(282,168.1867,1482.0898,10.5859,179.9514, 1,100.0,0);
	CreateDynamicActor(282,147.0375,1425.4022,10.5912,266.0696, 1,100.0,0);
	//ACTORES ISLA
	new IslaActor1 = CreateDynamicActor(154,870.3842,-2998.8372,3.8814,358.4109, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD -1,0);
	ApplyDynamicActorAnimation(IslaActor1, "COP_AMBIENT", "Coplook_loop", 4.1, 1, 0, 0, 1, 0);
	new IslaActor2 = CreateDynamicActor(136,827.7870,-3022.0591,5.7904,274.2031, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD -1,0);
	ApplyDynamicActorAnimation(IslaActor2, "SMOKING", "M_smklean_loop", 4.1, 1, 0, 0, 1, 0);
	new IslaActor3 = CreateDynamicActor(92, 804.8068,-3033.8596,6.0631,87.2346, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD -1,0);
	ApplyDynamicActorAnimation(IslaActor3, "SKATE","skate_idle", 4.1, 1, 0, 0, 1, 0);
	new IslaActor4 = CreateDynamicActor(45, 713.2985,-3003.8955,3.9369,139.8708, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD -1,0);
	ApplyDynamicActorAnimation(IslaActor4, "SUNBATHE", "ParkSit_M_in", 4.1, 1, 0, 0, 1, 0);
	new IslaActor5 = CreateDynamicActor(18, 789.5573,-3000.6533,4.0739,143.6871, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD -1,0);
	ApplyDynamicActorAnimation(IslaActor5, "SUNBATHE", "ParkSit_M_in", 4.1, 1, 0, 0, 1, 0);
	new IslaActor6 = CreateDynamicActor(138, 895.3869,-3004.3044,4.6576,62.4296, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD -1,0);
	ApplyDynamicActorAnimation(IslaActor6, "SUNBATHE","ParkSit_W_idleA", 4.1, 1, 0, 0, 1, 0);
	new IslaActor7 = CreateDynamicActor(138, 788.1647,-3002.9846,4.3914,358.9342, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD, -1,0);
	ApplyDynamicActorAnimation(IslaActor7, "SUNBATHE", "ParkSit_M_in", 4.1, 1, 0, 0, 1, 0);
	new IslaActor8 = CreateDynamicActor(140, 890.8132,-3001.8557,4.3214,233.9699, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD -1,0);
	ApplyDynamicActorAnimation(IslaActor8, "SUNBATHE", "Lay_Bac_in", 4.1, 1, 0, 0, 1, 0);
	new IslaActor9 = CreateDynamicActor(97,781.3519,-3001.0222,4.3688,347.9118, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD -1,0);
	ApplyDynamicActorAnimation(IslaActor9, "COP_AMBIENT", "Coplook_loop", 4.1, 1, 0, 0, 1, 0);
	//ACTORES ESCUELA DE STRIP
	CreateDynamicActor(249,956.9611,-54.3932,1001.1172,268.8569, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD, -1,0);
	new EscuelaStrip3 = CreateDynamicActor(257,956.8380,-52.8452,1002.0612,269.7083, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD, -1,0);
	ApplyDynamicActorAnimation(EscuelaStrip3, "SUNBATHE", "Lay_Bac_in", 4.1, 0, 1, 1, 1, 0);
	new Actorsxx = CreateDynamicActor(123, -2172.753173, 679.367126, 55.162170, 108.508644, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD, -1,0);
	ApplyDynamicActorAnimation(Actorsxx, "COP_AMBIENT", "Coplook_loop", 4.1 , 0 , 0 , 0 , 1 , 0 ) ;
	CreateDynamicActor(125, -2181.774658, 710.965881, 53.890625, 178.695983, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD, -1,0);
	CreateDynamicActor(112, -2187.197998, 716.059631, 53.899868, 224.153121, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD, -1,0);
	CreateDynamicActor(111, -2181.458740, 715.438049, 53.891841, 150.687530, 1,100.0, 0, -1,-1,STREAMER_ACTOR_SD, -1,0);
	//criminal
	new piloto = CreateDynamicActor(57,  1164.0037,-1.3924,1020.6459,198.3095,1,100.0, 1, 1,INVALID_PLAYER_ID, STREAMER_ACTOR_SD, -1, 0);
	SetDynamicActorVirtualWorld(piloto,1);
	ApplyDynamicActorAnimation(piloto, "ped", "SEAT_down", 4.1 , 0 , 0 , 0 , 1 , 0);
	//Actores fábrica metanfetamina
	CreateDynamicActor(175, -1863.8221,115.7855,15.1228,264.6047, 1, 100.0, 0, 0); //Camionero 1
	CreateDynamicActor(174, -1855.9402,111.9866,15.1172,357.8773, 1, 100.0, 0, 0); // Camionero2
	CreateDynamicActor(159, -35.9745,2347.9880,24.1406,265.5083, 1, 100.0, 0, 0); // LV 1
	CreateDynamicActor(133, -32.1657,2350.0381,24.3026,188.9284, 1, 100.0, 0, 0); // LV 2
	CreateDynamicActor(108, 1084.5171,-1243.0818,15.8272,237.4417, 1, 100.0, 0, 0); // Atras HPC 1
	CreateDynamicActor(109, 1084.7194,-1247.4625,15.8272,249.2716, 1, 100.0, 0, 0);  // Atras HPC 2
	CreateDynamicActor(107, 2434.2212,-1678.4426,13.7456,48.6505, 1, 100.0, 0, 0); // Ganton 1
	CreateDynamicActor(106, 2429.9333,-1678.3491,13.7436,350.7008, 1, 100.0, 0, 0); // Ganton 2
	CreateDynamicActor(117, 1517.0229,-1464.9922,9.5000,217.3292, 1, 100.0, 0, 0); // Atras LSPD
	CreateDynamicActor(118, 1513.6154,-1468.3397,9.5000,252.2451, 1, 100.0, 0, 0);  // Atras LSPD
	CreateDynamicActor(124, 2443.1526,-1760.7987,13.5905,224.9609, 1, 100.0, 0, 0); // GYM 1
	CreateDynamicActor(125, 2446.9443,-1760.1896,13.5891,134.5076, 1, 100.0, 0, 0); // GYM 1
	CreateDynamicActor(121, 2213.5964,-2286.3254,14.7647,161.4671, 1, 100.0, 0, 0); // Armero 1
	CreateDynamicActor(122, 2216.6262,-2290.7490,14.7647,111.5373, 1, 100.0, 0, 0); // Armero 2
	CreateDynamicActor(158, -1040.6403,1557.9347,33.3431,147.7098, 1, 100.0, 0, 0); // Lejanías por LV 1
	CreateDynamicActor(161, -1043.7644,1558.5656,33.2156,223.1056, 1, 100.0, 0, 0); // Lejanías por LV 2

	/********************************MAPEOS************************************/
	//BURDEL
	CreateDynamicObject(19859, 966.55151, -52.46260, 1001.37531,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(11711, 966.53741, -53.23390, 1003.04089,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19741, 966.62500, -53.06500, 1003.08228,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19620, 966.53833, -53.20070, 1003.67072,   -90.00000, 0.00000, -90.00000);
	CreateDynamicObject(19822, 970.26343, -48.18420, 1001.21979,   0.00000, 0.00000, 270.40500);
	CreateDynamicObject(19818, 960.24030, -57.65086, 1000.71191,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19818, 960.03271, -57.61160, 1000.71191,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19824, 960.10101, -57.93270, 1000.63092,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2024, 959.32562, -58.15600, 1000.09839,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(321, 961.54358, -45.66540, 1001.01398,   0.00000, 115.00000, 22.35356);
	CreateDynamicObject(325, 960.89258, -45.77770, 1001.03387,   0.00000, 90.00000, 33.17600);
	CreateDynamicObject(2118, 960.86719, -45.64840, 1000.10339,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19823, 971.91608, -45.69839, 1001.21979,   0.00000, 0.00000, 270.40500);
	CreateDynamicObject(19820, 971.94049, -45.08165, 1001.21985,   0.00000, 0.00000, 270.40503);
	CreateDynamicObject(19822, 971.85309, -44.45580, 1001.21979,   0.00000, 0.00000, 270.40500);
	CreateDynamicObject(2588, 966.33441, -42.69520, 1002.27869,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19741, 2014.80420, 1150.45691, 14.11850,   0.00000, 10.00000, 10.00000);
	CreateDynamicObject(11720, 2016.05115, 1152.58691, 13.85700,   10.00000, 0.00000, 100.53670);
	CreateDynamicObject(3809, 2018.92041, 1150.28577, 12.69980,   0.00000, 0.00000, 54.81940);
	CreateDynamicObject(1670, 2013.60461, 1153.11609, 14.33210,   0.00000, 10.00000, 10.00000);
	CreateDynamicObject(3809, 2012.85608, 1154.15601, 12.69980,   0.00000, 0.00000, 54.81940);
	CreateDynamicObject(2714, 2015.18152, 1151.08875, 16.10840,   0.00000, 0.00000, 147.73750);
	CreateDynamicObject(2074, 2015.50586, 1151.63501, 16.86390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(7093, 2032.43994, 1160.33264, 19.69620,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(7392, 2015.04858, 1107.43762, 25.06287,   0.00000, 0.00000, 303.10672);
	CreateDynamicObject(9121, 1944.80469, 1183.91406, 19.77310,   0.00000, 0.00000, 0.00000);
	/***********MAPEO BILLY*********/
	CreateDynamicObject(10843, 1543.22913, -1790.66699, 20.52264,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3823, 316.44699, -193.68137, 6.83667,   0.00000, 0.00000, 89.29350);
	CreateDynamicObject(3842, 307.03568, -197.13260, 5.02154,   0.00000, 0.00000, 90.17840);
	CreateDynamicObject(3843, 297.69870, -195.97469, 6.34613,   0.00000, 0.00000, 90.74757);
	//mercado negro
	CreateDynamicObject(19356, 2107.43604, -1870.14807, 12.53274,   0.00000, 0.00000, 0.18000);
	CreateDynamicObject(19356, 2107.52026, -1873.24548, 13.24384,   0.00000, 0.00000, 0.18000);
	CreateDynamicObject(19356, 2107.53491, -1876.33496, 13.55398,   0.00000, 0.00000, 0.18000);
	CreateDynamicObject(19356, 2107.50366, -1870.09534, 12.53274,   0.00000, 0.00000, 0.18000);
	CreateDynamicObject(19356, 2109.16992, -1876.47632, 13.25409,   0.00000, 0.00000, 89.61466);
	CreateDynamicObject(19356, 2112.40552, -1876.49695, 13.55398,   0.00000, 0.00000, 89.61466);
	CreateDynamicObject(19356, 2115.41650, -1876.45667, 13.36130,   0.00000, 0.00000, 89.73466);
	CreateDynamicObject(19356, 2117.16309, -1875.27051, 12.53274,   0.00000, 0.00000, 351.62601);
	CreateDynamicObject(19356, 2117.51758, -1869.47058, 13.25409,   0.00000, 0.00000, 175.95459);
	CreateDynamicObject(19356, 2117.66064, -1866.54272, 12.53274,   0.00000, 0.00000, 177.57455);
	CreateDynamicObject(19356, 2117.70654, -1865.11145, 12.53274,   0.00000, 0.00000, -0.98532);
	CreateDynamicObject(19356, 2117.36768, -1872.47937, 12.53274,   0.00000, 0.00000, -2.24534);
	CreateDynamicObject(19356, 2112.95264, -1863.80750, 12.53274,   0.00000, 0.00000, 271.35416);
	CreateDynamicObject(19356, 2117.69482, -1865.26660, 13.34689,   0.00000, 0.00000, -0.98532);
	CreateDynamicObject(19356, 2117.36768, -1872.47937, 12.53274,   0.00000, 0.00000, -2.24534);
	CreateDynamicObject(19356, 2115.99243, -1863.76331, 12.54274,   0.00000, 0.00000, 90.66004);
	CreateDynamicObject(19356, 2116.06030, -1863.79834, 13.04675,   0.00000, 0.00000, 90.84003);
	CreateDynamicObject(19356, 2112.98242, -1863.78088, 12.53274,   0.00000, 0.00000, 271.35416);
	CreateDynamicObject(19356, 2113.01245, -1863.82813, 13.04284,   0.00000, 0.00000, 271.35416);
	CreateDynamicObject(19356, 2107.50366, -1870.09534, 13.55294,   0.00000, 0.00000, 0.18000);
	CreateDynamicObject(19356, 2109.80615, -1863.83728, 12.66431,   0.00000, 0.00000, 88.97993);
	CreateDynamicObject(19356, 2110.03589, -1863.88281, 13.07035,   0.00000, 0.00000, 90.89987);
	CreateDynamicObject(19386, 2107.51172, -1867.10217, 14.35640,   0.00000, 0.00000, -1.92000);
	CreateDynamicObject(19356, 2108.12085, -1864.64856, 13.15427,   0.00000, 0.00000, 333.22763);
	CreateDynamicObject(1491, 2107.60303, -1866.29065, 12.55745,   0.00000, 0.00000, -91.25999);
	CreateDynamicObject(3095, 2112.94287, -1868.31189, 14.79384,   0.00000, 0.00000, -0.48000);
	CreateDynamicObject(3095, 2112.91748, -1873.52026, 14.93709,   0.00000, 0.00000, -0.54000);
	CreateDynamicObject(3095, 2112.05420, -1868.05103, 14.82897,   0.00000, 0.00000, 359.38022);
	CreateDynamicObject(3095, 2112.15259, -1873.51550, 14.93709,   0.00000, 0.00000, -0.54000);
	CreateDynamicObject(3095, 2112.63354, -1868.06824, 14.79384,   0.00000, 0.00000, -0.48000);
	CreateDynamicObject(19356, 2117.66064, -1866.54272, 12.53274,   0.00000, 0.00000, 177.57455);
	CreateDynamicObject(19356, 2117.65186, -1866.56067, 13.24179,   0.00000, 0.00000, 177.57455);
	CreateDynamicObject(19356, 2117.12476, -1875.29346, 13.25409,   0.00000, 0.00000, 351.50601);
	CreateDynamicObject(19356, 2117.36768, -1872.47937, 13.24384,   0.00000, 0.00000, -2.24534);
	CreateDynamicObject(2115, 2115.42236, -1874.46765, 12.43654,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 2113.27173, -1874.37756, 12.43654,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 2110.91870, -1874.39612, 12.43654,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 2108.06714, -1874.47144, 12.43654,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(363, 2115.09644, -1874.17444, 13.54657,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(363, 2115.49731, -1874.20569, 13.54657,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(363, 2115.91455, -1874.27942, 13.54657,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(363, 2116.31128, -1874.35107, 13.54657,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19914, 2113.48291, -1873.89758, 13.32624,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19914, 2113.50562, -1874.38806, 13.32624,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19914, 2113.44800, -1874.13416, 13.32624,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3013, 2111.86865, -1874.18579, 13.33628,   0.00000, 0.00000, 359.38477);
	CreateDynamicObject(3013, 2111.34741, -1874.22046, 13.33628,   0.00000, 0.00000, 359.38477);
	CreateDynamicObject(3013, 2110.82471, -1874.25476, 13.33628,   0.00000, 0.00000, 359.38477);
	CreateDynamicObject(964, 2108.47339, -1870.41675, 12.41121,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2044, 2108.37329, -1874.43762, 13.24205,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2044, 2108.93164, -1874.45557, 13.24205,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2044, 2109.31299, -1874.45447, 13.24205,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2044, 2107.94067, -1874.49646, 13.24205,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2034, 2107.92725, -1874.20129, 13.23649,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2034, 2108.35913, -1874.13892, 13.23649,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2034, 2108.73486, -1874.20593, 13.23649,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2034, 2109.16724, -1874.18201, 13.23649,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2034, 2107.89087, -1874.74390, 13.23649,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2035, 2108.64526, -1874.76538, 13.23681,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1254, 2115.09790, -1876.11011, 14.19310,   0.00000, 0.00000, -1.68000);
	CreateDynamicObject(1254, 2114.55591, -1876.06653, 14.19310,   0.00000, 0.00000, -1.68000);
	CreateDynamicObject(1254, 2113.92041, -1876.32715, 14.19310,   0.00000, 0.00000, -1.68000);
	CreateDynamicObject(1254, 2113.35352, -1876.60193, 14.19310,   0.00000, 0.00000, -1.68000);
	CreateDynamicObject(1254, 2113.34741, -1876.42065, 14.19310,   0.00000, 0.00000, -1.68000);
	CreateDynamicObject(1274, 2111.75171, -1876.45032, 14.20245,   0.00000, 0.00000, 175.31984);
	CreateDynamicObject(1274, 2111.71362, -1876.41089, 14.15315,   0.00000, 0.00000, -186.59990);
	CreateDynamicObject(1274, 2112.05225, -1876.36194, 14.15315,   0.00000, 0.00000, -186.59990);
	CreateDynamicObject(2000, 2108.70898, -1864.47388, 12.54600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1271, 2110.97949, -1864.31323, 12.85070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1271, 2112.05566, -1864.25256, 12.85070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(930, 2113.73486, -1864.63770, 13.05752,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(930, 2115.13257, -1864.64319, 13.05752,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3576, 2115.55518, -1867.13440, 13.15172,   0.00000, 0.00000, 0.40604);
	CreateDynamicObject(3576, 2115.35278, -1870.90002, 13.15172,   0.00000, 0.00000, 0.40604);
	AntiDeAMX();
	//*******************Tienda dp*******************
	//tienda dp
	new tienda;
	tienda = CreateDynamicObjectEx(19400, 1190.52173, -1130.33679, 24.65810, 0.00000, 0.00000, 90.00000); //paredes
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19446, 1199.76880, -1125.60999, 24.65820, 0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19400, 1193.58167, -1130.33679, 24.65810, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19400, 1184.40173, -1130.33679, 24.65810, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19400, 1181.23975, -1130.33679, 24.65810, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19446, 1194.96326, -1117.62598, 24.66000, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19354, 1178.06824, -1130.33472, 24.65580, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19354, 1196.73425, -1130.33472, 24.65580, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19427, 1198.99744, -1130.33533, 24.65600, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19446, 1199.76880, -1122.34595, 24.65820, 0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19446, 1185.47729, -1117.62598, 24.66000, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19427, 1175.73340, -1130.33533, 24.65600, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19400, 1174.93896, -1120.96594, 24.65810, 0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19446, 1179.66333, -1117.62598, 24.66000, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19427, 1174.94031, -1118.46033, 24.65600, 0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19427, 1174.94031, -1129.62305, 24.65600, 0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19400, 1174.93896, -1127.08606, 24.65810, 0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19427, 1174.94031, -1119.07227, 24.65600, 0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19427, 1174.94031, -1129.11304, 24.65600, 0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19378, 1194.44043, -1126.28796, 22.96410, 0.00000, 90.00000, 0.00000); //Piso
	SetDynamicObjectMaterial(tienda, 0, 13007, "sw_bankint", "woodfloor1", 0);
	tienda = CreateDynamicObjectEx(19378, 1184.03638, -1126.28796, 22.96410, 0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 13007, "sw_bankint", "woodfloor1", 0);
	tienda = CreateDynamicObjectEx(19378, 1194.39612, -1122.43652, 23.16810, 2.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 13007, "sw_bankint", "woodfloor1", 0);
	tienda = CreateDynamicObjectEx(19378, 1184.01904, -1122.44946, 23.16810, 2.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 13007, "sw_bankint", "woodfloor1", 0);
	tienda = CreateDynamicObjectEx(19378, 1177.91638, -1126.28796, 22.96410, 0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 13007, "sw_bankint", "woodfloor1", 0);
	tienda = CreateDynamicObjectEx(19378, 1177.89905, -1122.44946, 23.16810, 2.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 13007, "sw_bankint", "woodfloor1", 0);
	tienda = CreateDynamicObjectEx(1491, 1185.92151, -1130.40479, 23.05090, 0.00000, 0.00000, 0.00000); //puerta 1
	SetDynamicObjectMaterial(tienda, 0, 1649, "wglass", "carshowwin2", 0);
	tienda = CreateDynamicObjectEx(1491, 1188.91394, -1130.40881, 23.05090, 0.00000, 0.00000, 179.00000);
	SetDynamicObjectMaterial(tienda, 0, 1649, "wglass", "carshowwin2", 0);
	tienda = CreateDynamicObjectEx(1491, 1174.94336, -1125.56226, 23.15290, 0.00000, 0.00000, 90.00000); //puerta 2
	SetDynamicObjectMaterial(tienda, 0, 1649, "wglass", "carshowwin2", 0);
	tienda = CreateDynamicObjectEx(1491, 1174.94336, -1122.53418, 23.15290, 0.00000, 0.00000, 269.00000);
	SetDynamicObjectMaterial(tienda, 0, 1649, "wglass", "carshowwin2", 0);
	tienda = CreateDynamicObjectEx(19329, 1186.34558, -1130.38721, 25.95140, 0.00000, 0.00000, -360.00000); //coso en puerta
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19329, 1188.38562, -1130.38721, 25.95140, 0.00000, 0.00000, -360.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19329, 1174.93994, -1125.07385, 25.98000, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19329, 1174.93994, -1123.03381, 25.98000, 0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(tienda, 0, 5722, "sunrise01_lawn", "otb_floor1", 0);
	tienda = CreateDynamicObjectEx(19377, 1194.59619, -1125.64050, 26.38540, 0.00000, 90.00000, 0.00000); //techo
	SetDynamicObjectMaterial(tienda, 0, 4600, "theatrelan2", "gm_labuld2_b", 0);
	tienda = CreateDynamicObjectEx(19377, 1184.19226, -1125.64050, 26.38540, 0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 4600, "theatrelan2", "gm_labuld2_b", 0);
	tienda = CreateDynamicObjectEx(19377, 1180.01025, -1125.64050, 26.38540, 0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 4600, "theatrelan2", "gm_labuld2_b", 0);
	tienda = CreateDynamicObjectEx(19377, 1180.01025, -1122.27454, 26.38540, 0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 4600, "theatrelan2", "gm_labuld2_b", 0);
	tienda = CreateDynamicObjectEx(19377, 1194.59619, -1122.27454, 26.38540, 0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 4600, "theatrelan2", "gm_labuld2_b", 0);
	tienda = CreateDynamicObjectEx(19377, 1187.25220, -1122.27454, 26.38540, 0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(tienda, 0, 4600, "theatrelan2", "gm_labuld2_b", 0);
	CreateObject(640, 1177.53796, -1130.80396, 23.60000, 0.00000, 0.00000, 90.00000);
	CreateObject(640, 1182.88989, -1130.80396, 23.60000, 0.00000, 0.00000, 90.00000);
	CreateObject(640, 1191.92395, -1130.80396, 23.60000, 0.00000, 0.00000, 90.00000);
	CreateObject(640, 1197.19604, -1130.80396, 23.60000, 0.00000, 0.00000, 90.00000);
	CreateObject(949, 1174.53857, -1125.83191, 23.80600, 0.00000, 0.00000, 0.00000);
	CreateObject(949, 1185.84094, -1130.86414, 23.69600, 0.00000, 0.00000, 0.00000);
	CreateObject(949, 1189.01953, -1130.88525, 23.69600, 0.00000, 0.00000, 0.00000);
	CreateObject(949, 1174.60571, -1122.29749, 23.90000, 0.00000, 0.00000, 0.00000);
	CreateObject(640, 1175.29395, -1130.80396, 23.60000, 0.00000, 0.00000, 90.00000);
	CreateObject(3802, 1191.72571, -1131.07886, 25.18690, 0.00000, 0.00000, 268.42191);
	CreateObject(3802, 1195.09167, -1131.07886, 25.18690, 0.00000, 0.00000, 268.42191);
	CreateObject(3802, 1182.74976, -1131.07886, 25.18690, 0.00000, 0.00000, 268.42191);
	CreateObject(3802, 1179.68970, -1131.07886, 25.18690, 0.00000, 0.00000, 268.42191);
	CreateObject(3802, 1174.12024, -1128.11047, 25.18690, 0.00000, 0.00000, 178.00000);
	CreateObject(3802, 1174.12024, -1120.05249, 25.18690, 0.00000, 0.00000, 178.00000);
	CreateObject(2238, 1194.73450, -1129.25891, 24.20340, 0.00000, 0.00000, 0.00000);
	CreateObject(2118, 1178.61841, -1122.68665, 23.22660, 0.00000, 0.00000, 0.00000);
	CreateObject(2111, 1182.77515, -1122.49841, 23.65940, 0.00000, 0.00000, 0.00000);
	CreateObject(2317, 1197.67224, -1119.80774, 24.50110, 0.00000, 0.00000, -44.00000);
	CreateObject(2229, 1189.76331, -1130.04358, 23.05090, 0.00000, 0.00000, 177.00000);
	CreateObject(2226, 1186.52576, -1122.65808, 23.98320, 0.00000, 0.00000, 0.00000);
	CreateObject(2224, 1181.97534, -1122.92444, 24.09450, 0.00000, 0.00000, -44.00000);
	CreateObject(2315, 1190.97937, -1129.80798, 23.11020, 0.00000, 0.00000, 0.00000);
	CreateObject(2190, 1194.92664, -1118.36938, 23.72060, 0.00000, 0.00000, 0.00000);
	CreateObject(2226, 1179.11414, -1122.70605, 24.00700, 0.00000, 0.00000, 0.00000);
	CreateObject(2230, 1179.11304, -1117.68030, 23.29830, 0.00000, 0.00000, 0.00000);
	CreateObject(2230, 1181.97424, -1117.70020, 23.31490, 0.00000, 0.00000, 0.00000);
	CreateObject(2231, 1190.17773, -1117.70178, 23.32388, 0.00000, 0.00000, 0.00000);
	CreateObject(2231, 1187.11877, -1117.69495, 23.29893, 0.00000, 0.00000, 0.00000);
	CreateObject(2296, 1183.29932, -1117.98584, 23.14060, 0.00000, 0.00000, 0.00000);
	CreateObject(2297, 1175.40967, -1119.13647, 23.36829, 0.00000, 0.00000, 0.00000);
	CreateObject(2316, 1188.32642, -1117.84558, 25.18460, 0.00000, 0.00000, 0.00000);
	CreateObject(2317, 1191.07336, -1124.02136, 24.54990, 0.00000, 0.00000, 270.00000);
	CreateObject(2318, 1192.42029, -1124.10522, 24.55660, 0.00000, 0.00000, 90.00000);
	CreateObject(2322, 1191.75464, -1125.10767, 24.57590, 0.00000, 0.00000, 0.00000);
	CreateObject(2385, 1187.77808, -1117.72571, 23.41950, 0.00000, 0.00000, 0.00000);
	CreateObject(2385, 1179.59814, -1117.72095, 23.41950, 0.00000, 0.00000, 0.00000);
	CreateObject(18865, 1183.50903, -1129.99915, 23.73840, 0.00000, 0.00000, 180.00000);
	CreateObject(19513, 1182.51355, -1130.01294, 23.73840, 0.00000, 0.00000, 180.00000);
	CreateObject(18871, 1183.22791, -1129.98901, 23.73840, 0.00000, 0.00000, 180.00000);
	CreateObject(18872, 1182.88049, -1130.02527, 23.73840, 0.00000, 0.00000, 180.00000);
	CreateObject(18869, 1182.24707, -1130.00525, 23.73840, 0.00000, 0.00000, 180.00000);
	CreateObject(19421, 1182.86438, -1129.98059, 24.46880, 0.00000, 0.00000, 146.00000);
	CreateObject(19422, 1183.32483, -1129.95325, 24.46880, 0.00000, 0.00000, 146.00000);
	CreateObject(19423, 1182.41235, -1130.00476, 24.46880, 0.00000, 0.00000, 146.00000);
	CreateObject(2100, 1175.09375, -1127.41846, 23.10090, 0.00000, 0.00000, 89.00000);
	CreateObject(2102, 1196.06287, -1119.28247, 25.19150, 0.00000, 0.00000, -26.00000);
	CreateObject(2103, 1180.14612, -1118.05139, 24.78350, 0.00000, 0.00000, 0.00000);
	CreateObject(2104, 1198.49561, -1123.92175, 23.21310, 0.00000, 0.00000, 271.00000);
	CreateObject(2424, 1184.76807, -1129.80457, 22.96590, 0.00000, 0.00000, 90.00000);
	CreateObject(2423, 1184.77405, -1127.98401, 22.96500, 0.00000, 0.00000, 90.00000);
	CreateObject(2475, 1183.10205, -1130.17078, 22.94730, 0.00000, 0.00000, 181.82001);
	CreateObject(2424, 1184.76807, -1128.88660, 22.96590, 0.00000, 0.00000, 90.00000);
	CreateObject(2424, 1183.74512, -1127.91003, 22.96590, 0.00000, 0.00000, 180.00000);
	CreateObject(2424, 1182.82715, -1127.91003, 22.96590, 0.00000, 0.00000, 180.00000);
	CreateObject(2424, 1181.90906, -1127.91003, 22.96590, 0.00000, 0.00000, 180.00000);
	CreateObject(2424, 1180.93103, -1128.88660, 22.96590, 0.00000, 0.00000, -91.00000);
	CreateObject(2423, 1181.01428, -1127.89539, 22.96500, 0.00000, 0.00000, -181.00000);
	CreateObject(2779, 1176.97559, -1129.67261, 23.04980, 0.00000, 0.00000, 182.00000);
	CreateObject(2778, 1178.15015, -1129.77112, 23.03260, 0.00000, 0.00000, 182.00000);
	CreateObject(2700, 1191.78125, -1123.19043, 24.49080, 0.00000, 0.00000, 86.00000);
	CreateObject(2690, 1179.80127, -1130.24805, 25.26300, 0.00000, 0.00000, 0.00000);
	CreateObject(2606, 1192.01147, -1118.03174, 23.74010, 0.00000, 0.00000, 0.00000);
	CreateObject(341, 1182.47766, -1130.13672, 25.35600, 0.00000, 32.00000, 0.00000);
	CreateObject(2403, 1194.08228, -1123.24084, 23.07110, 0.00000, 0.00000, 0.00000);
	CreateObject(2403, 1194.19519, -1124.55347, 23.07110, 0.00000, 0.00000, -84.00000);
	CreateObject(2434, 1192.25134, -1125.19666, 23.21660, 0.00000, 0.00000, 0.00000);
	CreateObject(2435, 1192.40979, -1124.07104, 23.22190, 0.00000, 0.00000, 90.00000);
	CreateObject(2434, 1191.12512, -1125.03040, 23.21660, 0.00000, 0.00000, -90.00000);
	CreateObject(2434, 1192.40942, -1123.14905, 23.21660, 0.00000, 0.00000, 92.00000);
	CreateObject(2434, 1191.27344, -1123.00879, 23.21660, 0.00000, 0.00000, 182.00000);
	CreateObject(2435, 1191.12952, -1124.13879, 23.22190, 0.00000, 0.00000, 270.00000);
	CreateObject(2369, 1182.64563, -1128.14355, 24.06930, 0.00000, 0.00000, 180.00000);
	CreateObject(2118, 1186.06445, -1122.68665, 23.22660, 0.00000, 0.00000, 0.00000);
	CreateObject(2229, 1193.02734, -1130.04358, 23.05090, 0.00000, 0.00000, 177.00000);
	CreateObject(2606, 1192.01147, -1118.03174, 24.25010, 0.00000, 0.00000, 0.00000);
	CreateObject(2606, 1192.01147, -1118.03174, 24.76010, 0.00000, 0.00000, 0.00000);
	CreateObject(2606, 1192.01147, -1118.03174, 25.27010, 0.00000, 0.00000, 0.00000);
	CreateObject(16779, 1180.17505, -1124.56006, 26.45020, 0.00000, 0.00000, 0.00000);
	CreateObject(1839, 1197.72656, -1127.55774, 23.79210, 0.00000, 0.00000, -40.00000);
	CreateObject(2412, 1189.39905, -1129.77820, 23.04580, 0.00000, 0.00000, 0.00000);
	CreateObject(2412, 1186.13501, -1129.77820, 23.04580, 0.00000, 0.00000, 0.00000);
	CreateObject(1886, 1175.21301, -1130.08411, 26.16620, 0.00000, 0.00000, 124.00000);
	CreateObject(1885, 1184.82202, -1129.73376, 24.01793, 0.00000, 0.00000, 0.00000);
	CreateObject(2028, 1198.81226, -1124.73706, 23.86860, 0.00000, 0.00000, 0.00000);
	CreateObject(1719, 1198.74207, -1126.22827, 25.14660, 0.00000, 0.00000, 68.00000);
	CreateObject(1718, 1198.68909, -1122.62219, 23.88650, 0.00000, 0.00000, 192.00000);
	CreateObject(1790, 1198.45679, -1121.48096, 24.70480, 0.00000, 0.00000, -65.00000);
	CreateObject(16779, 1187.62109, -1124.56006, 26.45020, 0.00000, 0.00000, 0.00000);
	CreateObject(16779, 1195.06714, -1124.56006, 26.45020, 0.00000, 0.00000, 0.00000);
	CreateObject(18075, 1195.01685, -1124.03406, 26.30710, 0.00000, 0.00000, 0.00000);
	CreateObject(18075, 1180.73706, -1124.03406, 26.30710, 0.00000, 0.00000, 0.00000);
	CreateObject(19466, 1174.89404, -1120.87329, 25.09570, 0.00000, 0.00000, 0.00000);
	CreateObject(2714, 1174.79565, -1122.07031, 25.80400, 0.00000, 0.00000, 269.00000);
	CreateObject(19466, 1174.89404, -1127.09534, 25.09570, 0.00000, 0.00000, 0.00000);
	CreateObject(19466, 1181.15662, -1130.36938, 24.69480, 0.00000, 0.00000, 90.00000);
	CreateObject(19466, 1184.42065, -1130.36938, 24.69480, 0.00000, 0.00000, 90.00000);
	CreateObject(2714, 1185.49426, -1130.49988, 25.80400, 0.00000, 0.00000, 0.00000);
	CreateObject(2714, 1174.79565, -1126.04834, 25.80400, 0.00000, 0.00000, 269.00000);
	CreateObject(19466, 1190.54065, -1130.36938, 24.69480, 0.00000, 0.00000, 90.00000);
	CreateObject(2714, 1189.47241, -1130.49988, 25.80400, 0.00000, 0.00000, 0.00000);
	CreateObject(19466, 1193.49866, -1130.36938, 24.69480, 0.00000, 0.00000, 90.00000);
	//banco
 	CreateObject(19353, 981.81, -1162.84, 27.1,   0.00, 0.00, 90.00);
	BancoLS = CreateObject(5720, 982.34, -1169.66, 32.82,   0.00, 0.00, 0.00);
	SetObjectMaterial(BancoLS, 2, 3942, "bistro", "ahoodfence2", 0);
	SetObjectMaterial(BancoLS, 4, 16016, "des_n", "ranchwall1", 0);
	SetObjectMaterial(BancoLS, 5, 16005, "des_stownmain2", "des_redslats", 0);
	SetObjectMaterial(BancoLS, 6, 964, "cj_crate_will", "CJ_FLIGHT_CASE", 0);
	SetObjectMaterial(BancoLS, 7, 16021, "des_geyser", "shingles1", 0);
	SetObjectMaterial(BancoLS, 8, 16005, "des_stownmain2", "sanruf", 0);
	SetObjectMaterial(BancoLS, 9, 6295, "lawland2", "lightglass", 0);
	CreateDynamicObject(14576, 991.44, -1170.17, 19.80,   0.00, 0.00, -90.00);
	CreateDynamicObject(19358, 972.07, -1162.51, 25.72,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 978.72, -1162.90, 25.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 990.76, -1163.69, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 990.75, -1166.89, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 990.75, -1170.09, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(1223, 998.22, -1159.26, 22.81,   0.00, 0.00, 105.73);
	CreateDynamicObject(19358, 990.75, -1172.71, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 834.35, -998.25, 25.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 970.30, -1163.89, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 970.30, -1166.95, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 970.29, -1170.30, 27.79,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 970.28, -1173.48, 27.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 971.80, -1175.10, 29.33,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 975.01, -1175.09, 29.17,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 978.22, -1175.10, 25.72,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 981.39, -1175.08, 25.72,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 984.57, -1175.07, 25.72,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 987.69, -1175.03, 25.72,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 990.24, -1175.04, 25.72,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 990.74, -1174.60, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(19376, 981.97, -1177.22, 24.10,   0.00, 90.00, 0.00);
	CreateDynamicObject(19376, 992.43, -1171.29, 24.06,   0.00, 90.00, 0.00);
	CreateDynamicObject(19376, 986.34, -1167.59, 24.08,   0.00, 90.00, 0.00);
	CreateDynamicObject(19376, 978.84, -1167.62, 24.10,   0.00, 90.00, 0.00);
	CreateDynamicObject(19375, 975.62, -1167.64, 27.38,   0.00, 90.00, 0.00);
	CreateDynamicObject(19375, 985.72, -1167.64, 27.40,   0.00, 90.00, 0.00);
	CreateDynamicObject(19375, 985.58, -1170.30, 27.42,   0.00, 90.00, 0.00);
	CreateDynamicObject(19375, 975.40, -1170.27, 27.44,   0.00, 90.00, 0.00);
	CreateDynamicObject(19358, 991.94, -1162.71, 25.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 984.43, -1162.88, 25.87,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 985.72, -1162.66, 25.87,   0.00, 0.00, 90.00);
	CreateDynamicObject(19433, 971.85, -1167.77, 24.09,   0.00, 90.00, 0.00);
	CreateDynamicObject(19433, 971.84, -1166.27, 24.10,   0.00, 90.00, 0.00);
	CreateDynamicObject(19433, 971.88, -1164.67, 24.09,   0.00, 90.00, 0.00);
	CreateDynamicObject(19433, 971.92, -1163.23, 24.08,   0.00, 90.00, 0.00);
	CreateDynamicObject(19358, 971.92, -1168.42, 25.73,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 975.04, -1168.57, 25.72,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 976.64, -1170.10, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 976.65, -1173.84, 25.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 976.62, -1170.68, 25.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(3109, 978.80, -1171.03, 12.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19385, 978.77, -1170.30, 13.17,   0.00, 0.00, 0.00);
	CreateDynamicObject(1829, 1014.36, -1167.28, 12.08,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.76, -1167.27, 12.98,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.76, -1167.27, 13.84,   0.00, 0.00, -90.00);
	CreateDynamicObject(1829, 1014.37, -1168.14, 12.08,   0.00, 0.00, -90.00);
	CreateDynamicObject(1829, 1014.35, -1170.68, 12.08,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.74, -1168.99, 12.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.73, -1169.83, 12.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.73, -1171.53, 12.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.72, -1172.38, 12.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.72, -1172.38, 12.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.72, -1172.38, 13.74,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.72, -1172.38, 14.56,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.72, -1171.51, 12.93,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.77, -1168.10, 12.99,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.86, -1167.28, 14.72,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.90, -1169.88, 14.56,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.81, -1169.84, 12.93,   0.00, 0.00, -90.00);
	CreateDynamicObject(2332, 1014.85, -1169.85, 13.74,   0.00, 0.00, -90.00);
	CreateDynamicObject(1569, 974.13, -1175.86, 19.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2946, 983.41, -1162.74, 24.08,   0.00, 0.00, 90.00);
	CreateDynamicObject(2946, 980.25, -1162.72, 24.08,   0.00, 0.00, -90.00);
	CreateDynamicObject(19437, 980.90, -1162.85, 25.80,   0.00, 0.00, 90.00);
	CreateDynamicObject(19437, 982.48, -1162.92, 25.90,   0.00, 0.00, 90.00);
	CreateDynamicObject(19437, 982.86, -1162.89, 25.96,   0.00, 0.00, 90.00);
	CreateDynamicObject(2946, 980.25, -1163.00, 24.08,   0.00, 0.00, -90.00);
	CreateDynamicObject(2946, 983.41, -1163.02, 24.08,   0.00, 0.00, 90.00);
	CreateDynamicObject(19437, 981.28, -1162.87, 25.90,   0.00, 0.00, 90.00);
	CreateDynamicObject(19437, 982.84, -1162.85, 25.80,   0.00, 0.00, 90.00);
	CreateDynamicObject(2208, 987.63, -1171.89, 24.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(2208, 984.24, -1171.92, 24.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(2208, 984.20, -1176.36, 24.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(1649, 986.18, -1172.01, 26.52,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 990.54, -1172.01, 26.52,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 986.15, -1172.01, 26.52,   0.00, 0.00, 900.00);
	CreateDynamicObject(1649, 990.54, -1172.01, 26.52,   0.00, 0.00, 900.00);
	CreateDynamicObject(1808, 983.85, -1162.97, 24.17,   0.00, 0.00, 0.00);
	CreateDynamicObject(1808, 979.87, -1162.99, 24.17,   0.00, 0.00, 0.00);
	CreateDynamicObject(1892, 981.32, -1163.52, 24.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(2191, 990.19, -1174.43, 24.13,   0.00, 0.00, 180.00);
	CreateDynamicObject(2123, 986.16, -1173.34, 24.83,   0.00, 0.00, -90.00);
	CreateDynamicObject(2123, 988.57, -1173.37, 24.83,   0.00, 0.00, -90.00);
	CreateDynamicObject(2284, 990.19, -1169.39, 25.76,   0.00, 0.00, -90.00);
	CreateDynamicObject(2266, 982.23, -1174.49, 25.65,   0.00, 0.00, 180.00);
	CreateDynamicObject(2267, 979.97, -1174.97, 25.83,   0.00, 0.00, 180.00);
	CreateDynamicObject(1736, 977.04, -1173.91, 27.03,   0.00, 0.00, 90.00);
	CreateDynamicObject(1736, 981.81, -1163.29, 26.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(2257, 990.64, -1165.75, 26.17,   0.00, 0.00, -90.00);
	CreateDynamicObject(1616, 990.58, -1163.21, 27.14,   0.00, 0.00, 90.00);
	CreateDynamicObject(1616, 977.15, -1169.78, 27.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(2961, 979.02, -1163.00, 25.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(2961, 986.20, -1172.41, 24.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(2961, 988.36, -1172.39, 24.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(1616, 979.26, -1167.64, 15.71,   0.00, 0.00, 180.00);
	CreateDynamicObject(1616, 999.80, -1168.37, 15.71,   0.00, 0.00, 180.00);
	CreateDynamicObject(1616, 1014.70, -1172.40, 16.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(19088, 994.68, -1170.02, 14.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(19087, 994.68, -1170.02, 17.02,   0.00, 0.00, 0.00);
	CreateDynamicObject(19087, 994.68, -1170.02, 19.46,   0.00, 0.00, 0.00);
	CreateDynamicObject(2606, 986.33, -1175.06, 26.13,   0.00, 0.00, 180.00);
	CreateDynamicObject(1828, 981.74, -1166.75, 24.19,   0.00, 0.00, 90.00);
	CreateDynamicObject(18643, 992.37, -1184.86, 12.71,   0.00, 0.00, 90.00);
	CreateDynamicObject(18643, 992.37, -1155.46, 12.71,   0.00, 0.00, -90.00);
	CreateDynamicObject(18643, 988.92, -1155.51, 13.32,   0.00, 0.00, -90.00);
	CreateDynamicObject(18643, 975.92, -1194.26, 13.32,   0.00, 0.00, 90.00);
	CreateDynamicObject(18643, 983.36, -1174.27, 16.66,   20.00, 40.00, 90.00);
	CreateDynamicObject(18643, 981.29, -1166.34, 16.66,   20.00, 40.00, -90.00);
	CreateDynamicObject(18643, 982.40, -1155.55, 13.74,   0.00, 0.00, -90.00);
	CreateDynamicObject(18643, 982.40, -1184.78, 13.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(3109, 976.74, -1174.56, 25.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(2773, 974.46, -1167.98, 24.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(2773, 972.09, -1167.94, 24.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(2773, 972.08, -1166.25, 24.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(2773, 974.53, -1166.24, 24.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(2773, 974.38, -1165.23, 24.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(2773, 971.78, -1165.20, 24.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(2773, 971.64, -1163.60, 24.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(2773, 974.14, -1163.54, 24.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(2942, 970.73, -1167.24, 24.80,   0.00, 0.00, 90.00);
	CreateDynamicObject(2942, 970.72, -1164.30, 24.80,   0.00, 0.00, 90.00);
	CreateDynamicObject(1726, 990.05, -1163.10, 24.17,   0.00, 0.00, -90.00);
	CreateDynamicObject(1726, 990.05, -1166.85, 24.17,   0.00, 0.00, -90.00);
	CreateDynamicObject(1822, 989.57, -1166.52, 24.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(2894, 990.07, -1165.98, 24.65,   0.00, 0.00, -90.00);
	CreateDynamicObject(914, 966.34, -1176.41, 23.28,   0.00, 0.00, -90.00);
	CreateDynamicObject(2653, 962.24, -1170.42, 22.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(914, 996.35, -1167.14, 11.62,   90.00, 0.00, 0.00);
	CreateDynamicObject(1616, 1006.12, -1173.06, 16.36,   0.00, 0.00, 600.00);
	CreateDynamicObject(1649, 988.26, -1162.70, 25.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(1649, 975.86, -1162.58, 25.78,   0.00, 0.00, 359.80);
	CreateDynamicObject(19375, 985.72, -1167.64, 27.70,   0.00, 90.00, 0.00);
	CreateDynamicObject(19375, 975.62, -1167.64, 27.68,   0.00, 90.00, 0.00);
	CreateDynamicObject(19375, 985.72, -1167.64, 27.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(1649, 988.34, -1162.66, 26.06,   0.00, 0.00, 180.00);
	CreateDynamicObject(1649, 975.82, -1162.43, 26.06,   0.00, 0.00, 180.00);
	CreateDynamicObject(19375, 975.62, -1167.64, 27.84,   0.00, 90.00, 0.00);
	CreateDynamicObject(1649, 988.34, -1162.66, 22.92,   0.00, 0.00, 180.00);
	CreateDynamicObject(1649, 975.82, -1162.43, 22.83,   0.00, 0.00, 180.00);
	CreateDynamicObject(19357, 995.80, -1159.25, 23.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(19437, 980.62, -1162.86, 25.90,   0.00, 0.00, 90.00);
	CreateDynamicObject(19437, 980.62, -1162.86, 22.42,   0.00, 0.00, 90.00);

	ZADMIN[0] = CreateObject(18981, 89.47059, -9.95276, 71.06293,   0.00000, 90.00000, 343.85077);
	SetObjectMaterial(ZADMIN[0], 0, 19341, "egg_texts", "easter_egg01", 0x00FFFFFF);
	ZADMIN[1] = CreateObject(18981, 96.42380, 14.05030, 71.06290,   0.00000, 90.00000, 343.85080);
	SetObjectMaterial(ZADMIN[1], 0, 19341, "egg_texts", "easter_egg01", 0x00FFFFFF);
	ZADMIN[2] = CreateObject(18981, 72.40910, 21.00550, 71.06290,   0.00000, 90.00000, 343.85080);
	SetObjectMaterial(ZADMIN[2], 0, 19341, "egg_texts", "easter_egg01", 0x00FFFFFF);
	ZADMIN[3] = CreateObject(18981, 65.45550, -3.00180, 71.06290,   0.00000, 90.00000, 343.85080);
	SetObjectMaterial(ZADMIN[3], 0, 19341, "egg_texts", "easter_egg01", 0x00FFFFFF);

	//puerta abierta
	CreateDynamicObject(2990, 997.85522, 2133.24268, 19.33750,   0.00000, 0.00000, 90.00000);

	/*bus*/
	    //Objects
    CreateDynamicObject(1257, 2868.9033203125, -1416.40625, 11.013171195984, 0, 0, 179.99450683594);//Bus Stops
    CreateDynamicObject(1257, 2636.32421875, -1693.125, 10.954420089722, 0, 0, 179.99450683594);
    CreateDynamicObject(1257, 2649.0073242188, -1710.6044921875, 11.185441970825, 0, 0, 0);
    CreateDynamicObject(1257, 2243.845703125, -1725.912109375, 13.596067428589, 0, 0, 90);
    CreateDynamicObject(1257, 2252.8876953125, -1738.87109375, 13.62606716156, 0, 0, 270);
    CreateDynamicObject(1257, 1948.3310546875, -1454.3525390625, 13.596067428589, 0, 0, 90);
    CreateDynamicObject(1257, 1926.419921875, -1472.359375, 13.62606716156, 0, 0, 270);
    CreateDynamicObject(1257, 1571.064453125, -2188.0107421875, 13.62606716156, 0, 0, 90);
    CreateDynamicObject(1257, 1712.9423828125, -1818.71484375, 13.62606716156, 0, 0, 270);
    CreateDynamicObject(1257, 1567.0966796875, -1725.4755859375, 13.62606716156, 0, 0, 90);
    CreateDynamicObject(1257, 1544.9990234375, -1739.0458984375, 13.62606716156, 0, 0, 270);
    CreateDynamicObject(1257, 1503.9716796875, -1027.76171875, 23.770128250122, 0, 0, 83.995971679688);
    CreateDynamicObject(1257, 1440.32421875, -1040.7060546875, 23.907316207886, 0, 0, 270);
    CreateDynamicObject(1257, 1188.8359375, -1354.6279296875, 13.648303985596, 0, 0, 179.99450683594);
    CreateDynamicObject(1257, 1212.8427734375, -1327.83984375, 13.647026062012, 0, 0, 0);
    CreateDynamicObject(1257, 861.71252441406, -1313.3009033203, 13.626066970825, 0, 0, 90);
    CreateDynamicObject(1257, 850.67578125, -1333.970703125, 13.615329742432, 0, 0, 270);
    CreateDynamicObject(1257, 393.69442749023, -1766.2702636719, 5.6197347640991, 0, 0, 90);
    CreateDynamicObject(1257, 1705.58984375, -1805.84765625, 13.530066490173, 0, 0, 90);//
    CreateDynamicObject(2631, 2022.0, 2236.7, 2102.9, 0.0, 0.0, 90.0);//Bus Interior
	CreateDynamicObject(2631, 2022.0, 2240.6, 2102.9, 0.0, 0.0, 90.0);
	CreateDynamicObject(2631, 2022.0, 2244.5, 2102.9, 0.0, 0.0, 90.0);
	CreateDynamicObject(2631, 2022.0, 2248.4, 2102.9, 0.0, 0.0, 90.0);
	CreateDynamicObject(16501, 2022.1, 2238.3, 2102.8, 0.0, 90.0, 0.0);
	CreateDynamicObject(16501, 2022.1, 2245.3, 2102.8, 0.0, 90.0, 0.0);
	CreateDynamicObject(16000, 2024.2, 2240.1, 2101.2, 0.0, 0.0, 90.0);
	CreateDynamicObject(16000, 2019.8, 2240.6, 2101.2, 0.0, 0.0, -90.0);
	CreateDynamicObject(16000, 2022.2, 2248.7, 2101.2, 0.0, 0.0, 180.0);
	CreateDynamicObject(16501, 2021.8, 2246.5, 2107.3, 0.0, 270.0, 90.0);
	CreateDynamicObject(16501, 2022.0, 2240.8, 2107.3, 0.0, 270.0, 0.0);
	CreateDynamicObject(16501, 2022.0, 2233.7, 2107.3, 0.0, 270.0, 0.0);
	CreateDynamicObject(18098, 2024.3, 2239.6, 2104.8, 0.0, 0.0, 90.0);
	CreateDynamicObject(18098, 2024.3, 2239.7, 2104.7, 0.0, 0.0, 450.0);
	CreateDynamicObject(18098, 2020.1, 2239.6, 2104.8, 0.0, 0.0, 90.0);
	CreateDynamicObject(18098, 2020.0, 2239.6, 2104.7, 0.0, 0.0, 90.0);
	CreateDynamicObject(2180, 2023.6, 2236.1, 2106.7, 0.0, 180.0, 90.0);
	CreateDynamicObject(2180, 2023.6, 2238.1, 2106.7, 0.0, 180.0, 90.0);
	CreateDynamicObject(2180, 2023.6, 2240.1, 2106.7, 0.0, 180.0, 90.0);
	CreateDynamicObject(2180, 2023.6, 2242.1, 2106.7, 0.0, 180.0, 90.0);
	CreateDynamicObject(2180, 2023.6, 2244.1, 2106.7, 0.0, 180.0, 90.0);
	CreateDynamicObject(2180, 2023.6, 2246.1, 2106.7, 0.0, 180.0, 90.0);
	CreateDynamicObject(2180, 2023.6, 2248.1, 2106.7, 0.0, 180.0, 90.0);
	CreateDynamicObject(2180, 2020.3, 2235.1, 2106.7, 0.0, 180.0, 270.0);
	CreateDynamicObject(2180, 2020.3, 2237.1, 2106.7, 0.0, 180.0, 270.0);
	CreateDynamicObject(2180, 2020.3, 2239.1, 2106.7, 0.0, 180.0, 270.0);
	CreateDynamicObject(2180, 2020.3, 2241.1, 2106.7, 0.0, 180.0, 270.0);
	CreateDynamicObject(2180, 2020.3, 2243.1, 2106.7, 0.0, 180.0, 270.0);
	CreateDynamicObject(2180, 2020.3, 2245.1, 2106.7, 0.0, 180.0, 270.0);
	CreateDynamicObject(2674, 2023.4, 2238.3, 2102.9, 0.0, 0.0, 600.0);
	CreateDynamicObject(2674, 2020.4, 2242.3, 2102.9, 0.0, 0.0, 600.0);
	CreateDynamicObject(2674, 2023.4, 2246.3, 2102.9, 0.0, 0.0, 600.0);
	CreateDynamicObject(14405, 2022.0, 2242.1, 2103.5, 0.0, 0.0, 540.0);
	CreateDynamicObject(14405, 2022.0, 2243.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2022.0, 2245.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2022.0, 2246.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2022.0, 2248.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2022.0, 2249.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2022.0, 2251.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2024.6, 2242.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2024.6, 2243.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2024.6, 2245.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2024.6, 2246.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2024.6, 2248.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2024.6, 2249.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2024.6, 2251.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2019.4, 2242.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2019.4, 2243.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2019.4, 2245.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2019.4, 2246.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2019.4, 2248.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2019.4, 2249.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2019.4, 2251.1, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2022.0, 2253.6, 2104.0, -6.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2021.1, 2253.6, 2104.0, -6.0, 0.0, 180.0);
	CreateDynamicObject(14405, 2024.6, 2253.6, 2103.5, 0.0, 0.0, 180.0);
	CreateDynamicObject(2674, 2020.4, 2235.7, 2102.9, 0.0, 0.0, 52.0);
	CreateDynamicObject(2673, 2020.4, 2246.7, 2102.9, 0.0, 0.0, 270.0);
	CreateDynamicObject(2700, 2023.5, 2235.1, 2105.5, 180.0, -4.0, 90.0);
	CreateDynamicObject(2700, 2020.4, 2235.1, 2105.5, 180.0, 0.0, 90.0);
	CreateDynamicObject(2700, 2023.5, 2242.1, 2105.5, 180.0, -4.0, 90.0);
	CreateDynamicObject(2700, 2020.4, 2242.1, 2105.5, 180.0, 0.0, 90.0);
	CreateDynamicObject(1799, 2023.1, 2234.2, 2105.7, 270.0, 0.0, 360.0);
	CreateDynamicObject(1799, 2019.8, 2234.2, 2105.7, 270.0, 0.0, 0.0);
	CreateDynamicObject(1538, 2022.7, 2234.7, 2102.8, 0.0, 0.0, 180.0);
	CreateDynamicObject(1799, 2022.1, 2234.2, 2106.1, 720.0, 90.0, 450.0);
	CreateDynamicObject(1799, 2021.8, 2234.2, 2105.1, 0.0, 270.0, 270.0);
	CreateDynamicObject(1799, 2022.1, 2234.2, 2107.3, 0.0, 90.0, 90.0);
	CreateDynamicObject(1799, 2021.6, 2234.2, 2106.3, 0.0, 270.0, 270.0);
	CreateDynamicObject(1799, 2022.3, 2234.2, 2104.3, 90.0, 0.0, 180.0);//

	//Casa de robo Seville
	CreateDynamicObject(970, 2471.58008, -2000.00000, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2477.32007, -2000.00000, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1369, 2479.47998, -1989.59998, 13.63000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3092, 2480.18994, -1986.53992, 13.83000,   91.00000, 90.00000, 180.00000);
	CreateDynamicObject(1649, 2478.97998, -1994.40991, 13.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 2478.97998, -1994.40991, 13.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2306, 2480.56982, -1988.15991, 13.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19361, 2480.66992, -1988.92993, 14.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2063, 2480.54980, -1991.59998, 13.93000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19361, 2480.66992, -1991.96997, 14.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2482.30981, -1983.70996, 13.64000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2090, 2480.45996, -1995.53992, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2846, 2482.13989, -1987.21997, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1794, 2482.55981, -1987.06995, 13.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19390, 2482.36987, -1990.44995, 14.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 2482.32983, -1991.19995, 12.79000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 2481.41992, -1997.63000, 13.57000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 2481.41992, -1997.63000, 13.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 2482.66992, -1991.92993, 12.79000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 2483.26001, -1988.92993, 12.79000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19390, 2483.44995, -1991.94995, 14.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19390, 2484.04980, -1988.92993, 14.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2844, 2482.94995, -1996.92993, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2482.43994, -2000.00000, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2296, 2485.28979, -1985.17993, 13.03000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2231, 2485.55981, -1984.51001, 13.03000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19506, 2484.63989, -1991.45996, 14.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19505, 2484.63989, -1991.45996, 14.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19361, 2485.68994, -1985.29993, 14.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2277, 2484.37988, -1994.77002, 14.58000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19361, 2485.66992, -1987.31995, 14.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(913, 2484.12988, -1997.00000, 13.85000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2231, 2485.55981, -1988.32996, 13.03000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19361, 2484.97998, -1992.62000, 14.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2135, 2486.26001, -1984.41992, 13.02000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2832, 2486.07983, -1986.35999, 14.08000,   0.00000, 0.00000, 62.00000);
	CreateDynamicObject(2524, 2485.92993, -1988.64990, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2136, 2486.25000, -1986.51001, 13.02000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19361, 2484.97998, -1995.79993, 14.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2305, 2486.26001, -1987.46997, 13.02000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1535, 2487.00000, -1983.76001, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 2486.17993, -1989.55994, 12.79000,   0.00000, 0.00000, 310.09000);
	CreateDynamicObject(19390, 2486.67993, -1990.16992, 14.55000,   0.00000, 0.00000, 39.96000);
	CreateDynamicObject(19361, 2487.19995, -1988.06995, 14.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2303, 2487.26978, -1987.47998, 13.02000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2525, 2487.47998, -1988.64990, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2807, 2486.98999, -1994.59998, 13.55000,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(2846, 2487.21997, -1993.93994, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19361, 2488.10986, -1989.58997, 14.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2747, 2488.84985, -1985.52991, 13.45000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2832, 2487.10986, -1996.78992, 13.03000,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(2002, 2488.73999, -1988.42993, 13.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 2488.45996, -1991.21997, 12.79000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2807, 2488.54980, -1992.67993, 13.55000,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(2812, 2488.45996, -1994.52991, 13.87000,   0.00000, 0.00000, 55.00000);
	CreateDynamicObject(2747, 2488.51978, -1994.33997, 13.45000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19390, 2489.25000, -1991.27002, 14.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2807, 2488.42993, -1996.28992, 13.55000,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(630, 2490.42993, -1984.39990, 14.05000,   0.00000, 0.00000, -69.00000);
	CreateDynamicObject(1649, 2488.67993, -1997.63000, 13.57000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 2488.67993, -1997.63000, 13.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2488.54004, -2000.00000, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14532, 2490.30981, -1990.39990, 13.99000,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(19325, 2490.83984, -1987.07996, 13.64000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2807, 2489.97998, -1994.60999, 13.55000,   0.00000, 0.00000, 11.00000);
	CreateDynamicObject(19325, 2490.84985, -1994.14990, 13.64000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2493.54004, -2000.00000, 13.03000,   0.00000, 0.00000, 0.00000);
	//Puerta salir participar
	CreateDynamicObject(1566, 2233.280029, -2000.130005, 14.060000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	//CAsa de robo c2
	CreateDynamicObject(19456, -2387.62012, -27.74000, 34.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, -2381.94995, -7.46000, 34.86000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, -2381.97998, -3.31000, 34.86000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(669, -2386.71265, -14.23170, 34.67910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2231, -2393.87256, -25.48170, 35.01910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19325, -2392.50269, -20.90170, 35.77910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14680, -2393.32251, -22.50170, 36.22910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2225, -2394.58252, -25.46170, 35.01910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2356, -2392.73267, -19.44170, 35.91910,   84.00000, 0.00000, 265.00000);
	CreateDynamicObject(2636, -2392.79272, -17.84170, 35.64910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2636, -2392.87256, -17.87170, 35.60910,   0.00000, -172.00000, 4.00000);
	CreateDynamicObject(2231, -2395.43262, -25.48170, 35.01910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2636, -2392.82251, -16.58170, 35.64910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2607, -2393.81274, -19.45170, 35.41910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -2394.07251, -19.95170, 36.49910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2636, -2392.94263, -16.55170, 35.60910,   0.00000, -172.00000, 4.00000);
	CreateDynamicObject(2846, -2395.58252, -24.05170, 35.01910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1794, -2395.66260, -23.51170, 35.01910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19456, -2397.23999, -27.74000, 34.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2307, -2396.87256, -23.89170, 34.97910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2596, -2397.35254, -24.99170, 36.69910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19358, -2396.99268, -19.93170, 36.49910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2825, -2397.24268, -20.50170, 35.01910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -2398.51270, -23.89170, 36.49910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, -2395.85254, -15.37170, 36.00910,   0.00000, 0.00000, 41.02000);
	CreateDynamicObject(2525, -2399.07251, -23.84170, 35.01910,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1491, -2398.51270, -21.55170, 34.73910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, -2398.52271, -20.80170, 36.49910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, -2396.99268, -16.30170, 35.91910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2524, -2399.11255, -22.41170, 35.02910,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19358, -2397.03271, -15.93170, 36.49910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, -2395.18262, -10.67170, 36.21910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, -2395.18262, -10.67170, 36.21910,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2526, -2400.29272, -24.99170, 35.01910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19497, -2396.94263, -14.46170, 36.60910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19498, -2396.94263, -14.46170, 36.60910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1491, -2398.51270, -18.35170, 34.73910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, -2398.52271, -17.60170, 36.49910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, -2400.06274, -22.21170, 36.49910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, -2395.72266, -9.74170, 35.05910,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1817, -2401.52271, -24.88170, 35.41910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19462, -2400.20264, -20.69170, 34.97910,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(13188, -2395.21265, -6.22170, 36.24910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1491, -2400.84253, -22.18170, 34.73910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -2401.49268, -23.89170, 36.49910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, -2401.52271, -23.98170, 35.41910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, -2401.58252, -23.89170, 36.49910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, -2397.25269, -11.22170, 35.03910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2073, -2397.45264, -11.11170, 37.74910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -2401.45264, -22.77170, 36.49910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19435, -2395.98267, -7.33170, 35.03910,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1817, -2401.52271, -22.98170, 35.27910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, -2402.47266, -25.40170, 36.73910,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(2272, -2400.87256, -19.79170, 36.25910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, -2401.52271, -21.20170, 35.43910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19435, -2395.98267, -5.53170, 35.01910,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19358, -2401.45264, -19.57170, 36.49910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2289, -2397.87256, -9.15170, 36.74910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -2401.58252, -19.57170, 36.49910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, -2401.52271, -19.42170, 35.43910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, -2401.67261, -19.16170, 38.03910,   0.00000, 90.00000, 180.00000);
	CreateDynamicObject(1724, -2399.43262, -12.58170, 35.05910,   0.00000, 0.00000, 114.00000);
	CreateDynamicObject(1817, -2403.83252, -25.52170, 35.45910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19462, -2402.92261, -20.69170, 34.95910,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(2296, -2402.05273, -17.66170, 35.06910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2069, -2399.88257, -11.05170, 35.09910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1724, -2399.84253, -10.59170, 35.05910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, -2405.12256, -25.53170, 36.39910,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, -2400.44263, -11.05170, 34.97910,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19358, -2403.12256, -18.05170, 36.49910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, -2403.83252, -19.00170, 35.43910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, -2401.28271, -11.05170, 34.95910,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(14384, -2405.12256, -21.84170, 36.37910,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19456, -2406.86011, -27.74000, 34.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19462, -2405.04272, -20.69170, 34.97910,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(2636, -2402.80273, -13.48170, 35.68910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2636, -2403.84253, -14.99170, 35.68910,   0.00000, 0.00000, 286.60999);
	CreateDynamicObject(19454, -2401.60254, -7.33170, 35.03910,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19325, -2400.30273, -3.81170, 35.79910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, -2406.54272, -21.28170, 35.79910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, -2404.08252, -13.48170, 37.74910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2747, -2404.03271, -13.46170, 35.43910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2800, -2404.09253, -13.54170, 35.64910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, -2401.60254, -5.59170, 35.01910,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(2636, -2404.06274, -12.00170, 35.68910,   0.00000, 0.00000, 94.84000);
	CreateDynamicObject(1649, -2403.36255, -9.05170, 35.94910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, -2403.36255, -9.05170, 35.94910,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2636, -2405.40259, -13.44170, 35.68910,   0.00000, 0.00000, 177.92000);
	CreateDynamicObject(19325, -2406.54272, -15.04170, 35.79910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, -2405.86255, -9.55170, 36.04910,   0.00000, 0.00000, 41.02000);
	CreateDynamicObject(1535, -2406.46265, -8.06170, 34.92910,   0.00000, 0.00000, 90.00000);
	//Medico mapeo
	CreateDynamicObject(1649, 1181.80005, -1364.65002, 14.06000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1181.85999, -1364.68005, 13.71000,   0.00000, 0.00000, 90.09000);
	CreateDynamicObject(1649, 1181.80005, -1364.68005, 14.06000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1523, 1181.80005, -1362.46997, 13.20000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(630, 1181.32996, -1366.15002, 14.24000,   0.00000, 0.00000, 0.30000);
	CreateDynamicObject(14680, 1180.68994, -1363.56006, 15.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1523, 1181.80005, -1359.43005, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(2002, 1179.93005, -1367.00000, 13.19000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2774, 1181.01001, -1360.05005, 16.53000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(14680, 1180.68994, -1368.00000, 15.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14680, 1180.68005, -1359.45996, 15.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2685, 1179.53003, -1367.42004, 15.04000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14680, 1177.65002, -1363.42004, 15.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1181.80005, -1357.26001, 14.06000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1181.80005, -1357.21997, 14.06000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1181.83997, -1357.17004, 13.71000,   0.00000, 0.00000, 90.09000);
	CreateDynamicObject(14680, 1177.53003, -1367.71997, 15.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14680, 1177.75000, -1359.54004, 15.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2605, 1176.28003, -1366.41003, 13.60000,   0.00000, 0.00000, 269.73001);
	CreateDynamicObject(630, 1181.26001, -1355.62000, 14.24000,   0.00000, 0.00000, 0.30000);
	CreateDynamicObject(2607, 1173.98999, -1365.05005, 13.60000,   0.00000, 0.00000, 180.10001);
	CreateDynamicObject(2007, 1174.02002, -1366.95996, 13.21000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2356, 1173.59998, -1366.04004, 13.23000,   0.00000, 0.00000, 328.28000);
	CreateDynamicObject(2000, 1173.27002, -1366.96997, 13.21000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2774, 1181.01001, -1367.66003, 3.26000,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(2596, 1175.64001, -1354.71997, 15.78000,   0.00000, 0.00000, 359.75000);
	CreateDynamicObject(19003, 1172.06006, -1360.53003, 13.21000,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(19003, 1170.76001, -1360.67004, 16.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, 1173.33997, -1354.72998, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2774, 1181.01001, -1354.18005, 3.26000,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1166.83997, -1354.69995, 14.86000,   0.00000, 0.00000, -90.00000);
	//FABELA 1 COLINAS
	CreateDynamicObject(3655, 2608.99976, -1031.84192, 72.31073,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2589.36353, -1032.11230, 72.31073,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2588.86450, -1018.97418, 75.50790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3655, 2609.49048, -1018.90131, 76.22925,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3655, 2606.63550, -1004.89429, 77.56875,   0.00000, 0.00000, 22.99210);
	CreateDynamicObject(3655, 2587.20679, -1009.94879, 77.87171,   0.00000, 0.00000, 20.18665);
	CreateDynamicObject(3655, 2581.56543, -1002.21344, 80.95146,   0.00000, 0.00000, 45.50563);
	CreateDynamicObject(3655, 2601.86426, -993.59015, 80.91378,   0.00000, 0.00000, 22.99210);
	CreateDynamicObject(3655, 2588.94702, -971.90009, 83.69572,   0.00000, 0.00000, 94.30769);
	CreateDynamicObject(3655, 2576.93872, -972.70428, 83.69572,   0.00000, 0.00000, 94.30769);
	CreateDynamicObject(3655, 2570.78125, -954.18097, 83.69572,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2582.48682, -951.64185, 83.69572,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2553.78906, -957.93323, 83.69572,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2593.89990, -947.92004, 83.69572,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2604.02271, -967.87189, 82.77140,   0.00000, 0.00000, 102.49490);
	CreateDynamicObject(3655, 2615.67285, -964.33051, 82.77142,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2627.21533, -961.41901, 82.64950,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2605.13013, -943.49170, 82.87344,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2616.50415, -939.62488, 82.00202,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2610.04395, -987.09491, 82.77140,   0.00000, 0.00000, 102.49490);
	CreateDynamicObject(3655, 2621.85376, -984.92822, 82.77140,   0.00000, 0.00000, 102.49490);
	CreateDynamicObject(3655, 2633.41382, -983.14398, 82.36433,   0.00000, 0.00000, 102.08578);
	CreateDynamicObject(3655, 2573.93848, -996.72388, 82.29117,   0.00000, 0.00000, 61.90626);
	CreateDynamicObject(3655, 2560.16821, -989.35474, 83.62772,   0.00000, 0.00000, 61.90626);
	CreateDynamicObject(3655, 2549.62500, -983.78589, 83.62772,   0.00000, 0.00000, 61.90626);
	CreateDynamicObject(3655, 2532.05249, -980.89203, 84.20581,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2565.67383, -1010.40009, 81.68581,   0.00000, 0.00000, 94.30769);
	CreateDynamicObject(19377, 2567.45020, -999.56183, 78.91843,   0.00000, 90.00000, 332.82407);
	CreateDynamicObject(19377, 2559.87183, -1006.40662, 78.91843,   0.00000, 90.00000, 332.82407);
	CreateDynamicObject(19377, 2558.00586, -994.88086, 78.91843,   0.00000, 90.00000, 332.82407);
	CreateDynamicObject(3655, 2552.07690, -1004.86548, 83.02068,   0.00000, 0.00000, 61.90626);
	CreateDynamicObject(19377, 2538.32129, -985.92566, 80.59683,   0.00000, 90.00000, 332.82407);
	CreateDynamicObject(19377, 2546.46216, -989.99377, 80.49482,   0.00000, 90.00000, 332.82407);
	CreateDynamicObject(19377, 2555.51099, -994.11774, 78.31060,   0.00000, 115.00000, 333.00000);
	CreateDynamicObject(3655, 2541.97803, -998.95197, 83.52469,   0.00000, 0.00000, 61.90626);
	CreateDynamicObject(3655, 2542.78760, -959.28638, 83.69572,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2532.23901, -960.71649, 84.20581,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2520.65234, -960.58673, 84.20581,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2506.78101, -961.30066, 84.20581,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2495.27490, -962.48352, 84.20581,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2485.61914, -959.94293, 83.57824,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2468.20093, -961.65118, 82.45295,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2456.59009, -960.84210, 82.45295,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2444.96338, -962.08441, 82.45295,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(18368, 2515.07837, -1002.54315, 76.25788,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19377, 2535.23413, -995.22650, 80.59683,   0.00000, 90.00000, 332.82407);
	CreateDynamicObject(3655, 2530.17090, -990.41968, 83.52469,   0.00000, 0.00000, 61.90626);
	CreateDynamicObject(3655, 2516.09668, -995.05841, 83.79977,   0.00000, 0.00000, 100.50851);
	CreateDynamicObject(19377, 2526.89917, -996.40845, 80.59680,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(3655, 2509.12939, -994.14941, 83.52469,   0.00000, 0.00000, 61.90626);
	CreateDynamicObject(3655, 2496.87988, -983.00702, 83.52469,   0.00000, 0.00000, 61.90626);
	CreateDynamicObject(3655, 2520.36084, -981.33240, 84.20581,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(19377, 2503.79736, -993.70337, 80.79780,   0.00000, 90.00000, 332.69931);
	CreateDynamicObject(19377, 2505.95776, -984.27209, 80.79780,   0.00000, 90.00000, 332.69931);
	CreateDynamicObject(19377, 2510.33960, -975.72125, 80.79780,   0.00000, 90.00000, 332.69931);
	CreateDynamicObject(19377, 2517.13623, -985.23877, 80.79780,   0.00000, 90.00000, 332.69931);
	CreateDynamicObject(14409, 2469.08276, -979.72101, 77.61694,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2494.51294, -988.91858, 80.79780,   0.00000, 90.00000, 332.69931);
	CreateDynamicObject(3655, 2488.38843, -981.22992, 84.20581,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2476.97119, -980.76868, 82.45295,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2461.40527, -981.00317, 82.45295,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2449.92944, -980.67200, 82.45295,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2438.51147, -981.57758, 81.64594,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2432.92822, -960.77802, 82.45295,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(19377, 2485.61694, -986.80774, 80.79780,   0.00000, 90.00000, 271.66339);
	CreateDynamicObject(3629, 2539.79785, -1003.40649, 58.16787,   0.00000, 90.00000, 240.37004);
	CreateDynamicObject(3629, 2527.38452, -839.38293, 72.37581,   0.00000, -90.00000, 271.87460);
	CreateDynamicObject(19377, 2457.19995, -987.61670, 80.79780,   0.00000, 90.00000, 271.66339);
	CreateDynamicObject(19377, 2447.67944, -987.91241, 80.79780,   0.00000, 90.00000, 271.66339);
	CreateDynamicObject(14409, 2494.19116, -996.32977, 77.61690,   0.00000, 0.00000, 152.00000);
	CreateDynamicObject(14409, 2440.75391, -987.80133, 77.61690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2424.60571, -981.57367, 80.02393,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(19377, 2434.17017, -980.30579, 77.69466,   0.00000, 90.00000, 271.66339);
	CreateDynamicObject(3629, 2417.80225, -991.07715, 55.39502,   0.00000, 90.00000, 271.87463);
	CreateDynamicObject(3285, 2434.60938, -1009.07813, 55.24219,   3.14159, 0.00000, 1.32002);
	CreateDynamicObject(19377, 2434.09546, -988.68732, 77.66050,   0.00000, 90.00000, 1.35501);
	CreateDynamicObject(19377, 2423.86548, -988.99164, 77.66050,   0.00000, 90.00000, 1.35501);
	CreateDynamicObject(19377, 2413.43921, -989.25452, 77.66050,   0.00000, 90.00000, 1.35501);
	CreateDynamicObject(19377, 2402.94336, -989.47913, 77.66050,   0.00000, 90.00000, 1.35501);
	CreateDynamicObject(19377, 2397.76587, -989.80127, 77.66050,   0.00000, 90.00000, 1.35501);
	CreateDynamicObject(3655, 2412.63306, -981.95758, 80.02393,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2401.76489, -983.56482, 80.02393,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2401.71460, -983.33997, 72.63282,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(14409, 2394.47656, -982.78204, 74.49690,   0.00000, 0.00000, 1.51589);
	CreateDynamicObject(19377, 2392.34766, -981.16235, 72.96937,   0.00000, 0.00000, 1.35500);
	CreateDynamicObject(3655, 2421.41357, -961.86810, 81.00069,   0.00000, 0.00000, 94.39017);
	CreateDynamicObject(3655, 2406.13599, -963.33881, 78.61256,   0.00000, 0.00000, 96.47125);
	CreateDynamicObject(3655, 2404.89648, -954.38263, 86.06733,   0.00000, 0.00000, 96.47125);
	CreateDynamicObject(3655, 2420.70874, -953.91071, 84.80464,   0.00000, 0.00000, 94.92133);
	CreateDynamicObject(3629, 2510.74463, -992.16022, 58.16787,   0.00000, 90.00000, 240.37004);
	CreateDynamicObject(19791, 2565.29053, -1013.30664, 67.95702,   0.00000, 0.00000, 1.49474);
	CreateDynamicObject(19791, 2572.96509, -1014.31476, 69.59487,   0.00000, 0.00000, 1.49474);
	CreateDynamicObject(19791, 2582.06030, -1014.83459, 69.59487,   0.00000, 0.00000, 1.49474);
	CreateDynamicObject(19791, 2574.54126, -1005.03070, 69.59487,   0.00000, 0.00000, 1.49474);
	CreateDynamicObject(19313, 2482.88501, -992.09167, 81.36220,   0.00000, 0.00000, 1.49474);
	CreateDynamicObject(19313, 2392.68628, -988.58380, 78.06810,   0.00000, 0.00000, 91.75595);
	CreateDynamicObject(19377, 2392.45337, -981.11188, 72.96937,   0.00000, 0.00000, 1.35500);
	CreateDynamicObject(19377, 2494.87329, -999.20044, 76.56506,   0.00000, 0.00000, 331.57217);
	CreateDynamicObject(3655, 2611.78149, -920.15424, 80.92349,   0.00000, 0.00000, 100.45744);
	CreateDynamicObject(3655, 2600.63086, -923.70374, 82.74361,   0.00000, 0.00000, 100.45744);
	CreateDynamicObject(3655, 2589.44287, -929.60199, 83.66151,   0.00000, 0.00000, 100.45744);
	CreateDynamicObject(3655, 2563.80713, -934.14069, 84.66705,   0.00000, 0.00000, 100.45744);
	CreateDynamicObject(3655, 2552.39282, -936.98529, 85.23017,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2540.77441, -938.63806, 85.23017,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2525.55884, -940.27039, 85.23017,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2510.68726, -943.88928, 85.23017,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2497.55103, -942.32721, 84.20581,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2485.98145, -941.80225, 83.57824,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2467.30762, -944.17224, 82.64139,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2455.37769, -942.98730, 82.39830,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2443.69336, -944.07043, 82.65692,   0.00000, 0.00000, 91.89890);
	CreateDynamicObject(3655, 2433.91333, -942.43127, 83.68127,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2418.06104, -938.09064, 86.86395,   0.00000, 0.00000, 94.92133);
	CreateDynamicObject(3655, 2399.61548, -941.45764, 95.16232,   0.00000, 0.00000, 96.47125);
	CreateDynamicObject(17513, 2505.21094, -890.45038, 89.21368,   0.00000, 0.00000, 5.33978);
	CreateDynamicObject(19377, 2476.08472, -987.09833, 80.79780,   0.00000, 90.00000, 271.66339);
	CreateDynamicObject(19377, 2475.97144, -931.68054, 80.37267,   2.00000, 102.00000, 272.00000);
	CreateDynamicObject(3655, 2484.86865, -919.08960, 96.85624,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2485.44629, -928.19464, 83.57824,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2485.93994, -929.75275, 90.46906,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2466.84082, -932.37347, 90.46906,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2466.83960, -931.23230, 83.57824,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2466.46558, -919.33234, 96.85624,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(12814, 2476.76880, -925.85883, 87.82265,   22.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2466.52905, -987.37903, 80.79780,   0.00000, 90.00000, 271.66339);
	CreateDynamicObject(12814, 2427.42261, -905.22754, 98.06187,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2484.29810, -904.98773, 97.46327,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2484.75464, -919.07562, 90.46906,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2485.18164, -883.78937, 100.38031,   0.00000, 0.00000, 271.54996);
	CreateDynamicObject(3655, 2473.91846, -886.03552, 100.38031,   0.00000, 0.00000, 271.54996);
	CreateDynamicObject(3655, 2462.71777, -888.89667, 101.53599,   0.00000, 0.00000, 271.54996);
	CreateDynamicObject(3655, 2451.60425, -891.02716, 101.53599,   0.00000, 0.00000, 271.54996);
	CreateDynamicObject(3655, 2452.89038, -907.78583, 101.18060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2465.15454, -907.63281, 96.85624,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2466.44458, -919.35150, 90.46906,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(19791, 2487.61792, -912.75916, 93.49819,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2491.10498, -922.09442, 84.18095,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2490.90210, -920.78668, 93.58898,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(3655, 2501.44971, -919.52081, 99.55683,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2508.97876, -925.72241, 86.17020,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2520.94189, -922.42682, 86.67421,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2532.76025, -921.08667, 86.67421,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2544.72217, -921.24567, 86.67421,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2497.22437, -926.96960, 86.17020,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2514.95337, -919.55768, 92.22934,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2526.73706, -919.71332, 92.22934,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2538.71753, -917.86188, 92.22934,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2550.29663, -916.02905, 92.22934,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2554.99683, -919.99603, 86.06087,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2503.04419, -921.84961, 92.22934,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2512.70215, -917.13715, 100.07314,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2524.10278, -914.15790, 99.24458,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2535.78662, -915.71649, 99.02692,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(14409, 2549.17480, -869.55310, 91.33546,   0.00000, 0.00000, 276.39542);
	CreateDynamicObject(19791, 2551.76416, -885.92035, 93.60630,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2552.44971, -895.72137, 93.60630,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2553.21680, -905.64606, 93.60630,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2546.43799, -913.04407, 93.60630,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2551.45654, -876.04510, 84.19096,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2548.72852, -876.28479, 93.60630,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2550.69189, -862.39069, 93.77136,   0.00000, 0.00000, 8.16697);
	CreateDynamicObject(19791, 2550.69189, -862.39069, 84.19096,   0.00000, 0.00000, 8.16697);
	CreateDynamicObject(3655, 2569.33057, -869.02594, 91.33399,   0.00000, 0.00000, 5.80459);
	CreateDynamicObject(3655, 2569.58789, -880.60187, 91.33399,   0.00000, 0.00000, 5.80459);
	CreateDynamicObject(12814, 2555.96680, -882.41467, 88.64074,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12814, 2557.40674, -895.09894, 70.02989,   90.00000, 90.00000, 4.05447);
	CreateDynamicObject(3655, 2569.60767, -891.73334, 91.33399,   0.00000, 0.00000, 5.80459);
	CreateDynamicObject(3655, 2570.26099, -903.13507, 91.33399,   0.00000, 0.00000, 0.37847);
	CreateDynamicObject(14409, 2561.36890, -909.28601, 85.40608,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19791, 2554.63721, -909.30994, 84.53017,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(19791, 2568.00366, -912.88507, 83.59332,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(3655, 2570.49780, -917.80658, 85.02922,   0.00000, 0.00000, 8.55854);
	CreateDynamicObject(3655, 2566.14868, -858.83215, 91.33399,   0.00000, 0.00000, 5.80459);
	CreateDynamicObject(12814, 2491.98779, -859.82013, 94.44500,   0.00000, 0.00000, 90.51320);
	CreateDynamicObject(3655, 2544.90894, -860.88177, 91.75229,   0.00000, 0.00000, 97.49607);
	CreateDynamicObject(3655, 2533.44653, -861.85901, 91.75229,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2522.73267, -863.29370, 92.21650,   0.00000, 0.00000, 93.88690);
	CreateDynamicObject(3655, 2559.87256, -847.43896, 91.75229,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2550.47363, -844.23694, 91.03094,   0.00000, 0.00000, 1.38480);
	CreateDynamicObject(3655, 2537.04712, -843.41553, 91.03094,   0.00000, 0.00000, 1.38480);
	CreateDynamicObject(3655, 2522.72095, -842.86029, 97.74789,   0.00000, 0.00000, 1.38480);
	CreateDynamicObject(3655, 2522.76563, -863.39014, 99.65382,   0.00000, 0.00000, 93.88690);
	CreateDynamicObject(12814, 2539.86914, -858.46698, 84.69042,   23.00000, 0.00000, 90.00000);
	CreateDynamicObject(12814, 2536.50708, -859.22540, 88.53869,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2522.91650, -842.88837, 91.03094,   0.00000, 0.00000, 1.38480);
	CreateDynamicObject(3655, 2501.98999, -856.47443, 97.74789,   0.00000, 0.00000, 1.38480);
	CreateDynamicObject(3655, 2503.22363, -869.49323, 99.82561,   0.00000, 0.00000, 94.95812);
	CreateDynamicObject(3655, 2492.42334, -870.61017, 99.82561,   0.00000, 0.00000, 94.95812);
	CreateDynamicObject(3629, 2542.57935, -840.42065, 72.37581,   0.00000, -90.00000, 271.87460);
	CreateDynamicObject(3629, 2572.09888, -864.67078, 72.37580,   0.00000, -90.00000, 187.32394);
	CreateDynamicObject(3629, 2574.15698, -895.15204, 70.09157,   0.00000, -90.00000, 187.32394);
	CreateDynamicObject(3655, 2439.89551, -892.73755, 101.53599,   0.00000, 0.00000, 271.54996);
	CreateDynamicObject(3655, 2438.36646, -906.61621, 101.53599,   0.00000, 0.00000, 271.54996);
	CreateDynamicObject(3655, 2457.25439, -918.22382, 99.64718,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2446.95850, -924.92322, 101.18060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2435.52100, -925.59131, 101.18060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2424.28857, -922.88165, 101.18060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2426.71484, -906.68909, 101.18060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2415.32739, -906.79749, 101.18060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2412.69067, -924.16437, 93.01060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3629, 2432.46997, -932.70789, 75.55666,   0.00000, 90.00000, 273.62860);
	CreateDynamicObject(3655, 2397.87476, -928.46497, 100.73978,   0.00000, 0.00000, 96.47125);
	CreateDynamicObject(14409, 2406.15186, -931.31812, 89.49863,   0.00000, 0.00000, 186.28352);
	CreateDynamicObject(3655, 2421.41748, -961.15527, 86.16010,   0.00000, 0.00000, 94.30614);
	CreateDynamicObject(3655, 2408.51172, -906.25519, 101.42116,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2397.80078, -917.46783, 92.78745,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2398.31396, -928.89563, 92.85089,   0.00000, 0.00000, 96.47125);
	CreateDynamicObject(3655, 2399.79077, -941.70483, 88.31675,   0.00000, 0.00000, 96.47125);
	CreateDynamicObject(3655, 2397.80762, -917.62238, 101.18060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2412.69067, -924.16437, 101.18060,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2461.99854, -929.65479, 91.23531,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2534.19824, -862.36505, 99.72764,   0.00000, 0.00000, 96.34878);
	CreateDynamicObject(19791, 2543.79004, -862.96368, 93.77136,   0.00000, 0.00000, 8.16697);
	CreateDynamicObject(946, 2505.88281, -879.09839, 99.15108,   0.00000, 0.00000, 185.02946);
	CreateDynamicObject(946, 2532.29712, -876.71344, 97.84440,   0.00000, 0.00000, 184.51727);
	CreateDynamicObject(946, 2534.69556, -903.76892, 97.72488,   0.00000, 0.00000, 5.02950);
	CreateDynamicObject(946, 2508.42212, -906.50220, 99.35210,   0.00000, 0.00000, 5.02950);
	CreateDynamicObject(16151, 2493.45728, -908.51245, 97.58057,   0.00000, 0.00000, 183.95886);
	CreateDynamicObject(643, 2498.96216, -910.24420, 97.59750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2503.75488, -910.09595, 97.59750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2495.18872, -903.13727, 97.59750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2494.69165, -899.61115, 97.59750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14409, 2405.14648, -922.11279, 94.91566,   0.00000, 0.00000, 186.28352);
	CreateDynamicObject(19791, 2487.03027, -902.92041, 93.60629,   0.00000, 0.00000, 4.14120);
	CreateDynamicObject(3629, 2467.85669, -989.95123, 58.68929,   0.00000, 90.00000, 271.87463);
	CreateDynamicObject(12814, 2477.22949, -877.67181, 97.18370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3655, 2580.13232, -1018.66235, 71.57103,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3655, 2620.58374, -1032.74976, 72.31073,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2632.60742, -1031.55518, 71.69553,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2644.62280, -1032.21423, 71.69553,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2656.60669, -1032.56445, 71.69553,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2668.48853, -1033.32544, 71.69553,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2680.30396, -1032.52832, 78.62075,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2680.43164, -1033.45520, 71.69553,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2680.00439, -1021.11987, 87.12814,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2656.90576, -1023.94720, 79.55020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2645.07129, -1024.37012, 79.55020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2633.08960, -1024.19568, 79.55020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2621.44141, -1024.08093, 79.55020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2668.77710, -1024.19482, 79.55025,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19791, 2681.05518, -1022.06525, 73.42297,   0.00000, 0.00000, 0.04779);
	CreateDynamicObject(3655, 2668.32471, -1014.80554, 87.83718,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2656.89868, -1016.17004, 87.83718,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2645.14844, -1013.86670, 87.83718,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2633.22168, -1013.64606, 85.56132,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2621.27075, -1011.62732, 83.84549,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2610.74097, -999.70844, 84.60151,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2643.77271, -993.83313, 85.55005,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2655.07300, -994.18146, 86.88660,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2679.77759, -1008.50299, 88.03048,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2669.68262, -993.13092, 88.03048,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2666.06104, -980.65955, 85.06247,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2643.01855, -979.79419, 82.05116,   0.00000, 0.00000, 102.49490);
	CreateDynamicObject(3655, 2636.52612, -958.54254, 81.77735,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2651.08765, -977.18384, 81.89262,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2691.52808, -1031.95728, 71.69553,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2705.39429, -1025.63525, 76.06490,   20.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2716.14746, -1025.73230, 72.39368,   20.00000, 0.00000, 91.12047);
	CreateDynamicObject(3655, 2725.17334, -1033.86145, 59.99419,   20.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2769.25513, -1033.39124, 43.69220,   20.00000, 0.00000, 89.76846);
	CreateDynamicObject(3655, 2779.97852, -1031.74597, 39.61226,   20.00000, 0.00000, 89.77076);
	CreateDynamicObject(3655, 2790.87061, -1032.71375, 35.84403,   20.00000, 0.00000, 89.77303);
	CreateDynamicObject(3655, 2758.39648, -1033.11511, 47.96202,   20.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2747.17798, -1032.15063, 51.85143,   20.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2736.12695, -1033.80078, 56.05378,   20.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2802.35791, -1033.02075, 32.42219,   20.00000, 0.00000, 89.65302);
	CreateDynamicObject(3655, 2811.60620, -1033.37830, 30.60669,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2819.61914, -1032.97119, 33.22741,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2691.39746, -1022.83423, 78.62075,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2702.96533, -1032.42029, 68.81844,   20.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2714.31104, -1032.69873, 64.75281,   20.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2727.25122, -1025.32849, 68.09232,   20.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2749.08081, -1022.80615, 59.82476,   20.00000, 0.00000, 90.48908);
	CreateDynamicObject(3655, 2738.20313, -1024.73645, 63.78463,   20.00000, 0.00000, 90.84000);
	CreateDynamicObject(3655, 2764.05786, -1016.14923, 63.51627,   20.00000, 0.00000, 90.48908);
	CreateDynamicObject(3655, 2791.03369, -1006.51776, 59.01030,   20.00000, 0.00000, 90.73927);
	CreateDynamicObject(3655, 2781.77979, -1023.05267, 47.46576,   20.00000, 0.00000, 90.48908);
	CreateDynamicObject(3655, 2797.67310, -1016.15247, 47.96262,   20.00000, 0.00000, 89.66051);
	CreateDynamicObject(3655, 2804.21362, -1026.99109, 38.53531,   20.00000, 0.00000, 89.66051);
	CreateDynamicObject(3655, 2811.36035, -1030.80933, 36.83879,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2821.29419, -1034.20874, 26.21035,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2694.59229, -1033.73181, 65.78124,   0.00000, 0.00000, 1.13223);
	CreateDynamicObject(19791, 2696.84619, -1024.47461, 72.78608,   0.00000, 0.00000, 359.17078);
	CreateDynamicObject(17513, 2738.38892, -972.39093, 64.77603,   0.00000, 0.00000, 90.55604);
	CreateDynamicObject(3655, 2774.70288, -975.74756, 62.81962,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2766.95337, -965.54852, 69.61797,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2766.87231, -953.63019, 68.44992,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2768.23730, -921.26685, 70.47320,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2767.40649, -931.82104, 68.65748,   0.00000, 0.00000, 0.14100);
	CreateDynamicObject(3655, 2761.96899, -985.32678, 76.03636,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3629, 2773.34058, -946.50916, 44.82541,   0.00000, -90.00000, 180.03865);
	CreateDynamicObject(3629, 2773.29980, -969.10071, 44.82541,   0.00000, -90.00000, 180.03865);
	CreateDynamicObject(3655, 2764.63257, -974.32446, 75.94257,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2774.79053, -988.12653, 62.81962,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2774.39258, -963.87671, 62.81962,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2773.60669, -952.18762, 62.81962,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2774.93140, -940.17401, 62.81962,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2774.31274, -927.84412, 62.81962,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3629, 2784.13037, -969.17993, 37.52227,   0.00000, -90.00000, 180.03865);
	CreateDynamicObject(3655, 2792.01270, -987.78113, 62.20440,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2791.86743, -976.78497, 62.20440,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2792.37988, -964.62775, 62.20442,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2791.79883, -953.41791, 62.20440,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2791.98364, -941.86108, 62.20440,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2799.97559, -987.88599, 53.60807,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3629, 2809.39868, -968.38336, 28.22012,   0.00000, -90.00000, 179.63261);
	CreateDynamicObject(3629, 2785.66577, -940.34235, 37.52227,   0.00000, -90.00000, 180.03865);
	CreateDynamicObject(3629, 2776.72754, -910.92084, 38.65130,   -24.00000, -90.00000, 272.44717);
	CreateDynamicObject(3629, 2810.61108, -932.67950, 28.22012,   0.00000, -90.00000, 179.63261);
	CreateDynamicObject(3655, 2776.99829, -921.18518, 62.81962,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2793.45483, -930.36780, 62.20440,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2793.51489, -921.14386, 62.20440,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2799.07861, -977.09106, 53.60807,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2799.97559, -965.22937, 53.60807,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2799.20728, -953.39557, 53.60807,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2800.41797, -941.84491, 53.60807,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2799.07739, -930.41309, 53.60807,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2798.41870, -919.54224, 53.60807,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2793.60083, -920.35724, 58.71607,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2821.18726, -1022.54846, 25.39724,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2822.38525, -1010.29309, 24.96117,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2823.72314, -998.20227, 23.69161,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2815.71631, -986.58197, 52.25350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2830.20435, -909.63818, 15.01453,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2825.09326, -908.96161, 35.07872,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2827.07251, -910.01331, 27.18668,   0.00000, 0.00000, -5.94000);
	CreateDynamicObject(3655, 2826.45850, -921.13593, 27.31514,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2823.98120, -920.79865, 35.01287,   0.00000, 0.00000, -5.94000);
	CreateDynamicObject(3655, 2828.51660, -920.67017, 19.88295,   0.00000, 0.00000, -5.28000);
	CreateDynamicObject(3655, 2828.05957, -931.82715, 19.94560,   0.00000, 0.00000, -5.94000);
	CreateDynamicObject(3655, 2825.61279, -932.51874, 27.56450,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2824.92188, -943.85065, 27.62529,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2827.01611, -943.57526, 20.24966,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2822.67505, -943.84009, 35.64271,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2823.54053, -932.30072, 35.46030,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2827.02466, -954.41272, 20.30867,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2824.22437, -954.44861, 27.86256,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2822.21167, -953.40552, 35.87762,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2822.81079, -963.28619, 36.79187,   0.00000, 0.00000, -5.94000);
	CreateDynamicObject(3655, 2825.05859, -963.77515, 29.02472,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2826.83350, -963.38812, 21.38741,   0.00000, 0.00000, -5.94000);
	CreateDynamicObject(3655, 2823.69775, -975.36304, 28.97790,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2821.41675, -975.18439, 36.74314,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2820.22144, -986.84521, 36.69394,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2822.35327, -986.90106, 28.68704,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2824.46362, -986.74200, 21.57560,   0.00000, 0.00000, -6.12000);
	CreateDynamicObject(3655, 2825.53931, -974.95966, 21.43515,   0.00000, 0.00000, -5.88000);
	CreateDynamicObject(3655, 2828.86011, -909.90082, 19.75576,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2830.24951, -920.62360, 16.67595,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2829.81885, -931.76440, 17.39302,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2828.97363, -943.05316, 18.42259,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(5441, 2785.53003, -876.64056, 31.59497,   0.00000, 23.00000, 357.91888);
	CreateDynamicObject(5441, 2670.40649, -871.91809, 55.13486,   0.00000, 0.00000, 357.46490);
	CreateDynamicObject(12814, 2725.73022, -834.13202, 55.26149,   0.00000, 0.00000, 357.04742);
	CreateDynamicObject(12814, 2737.81152, -923.90613, 68.99265,   0.00000, 0.00000, 90.40604);
	CreateDynamicObject(3655, 2830.47754, -900.40546, 15.01453,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2831.31274, -867.16675, 13.43532,   0.00000, 0.00000, 358.54147);
	CreateDynamicObject(3655, 2826.25659, -900.23547, 20.00655,   0.00000, 0.00000, 358.54147);
	CreateDynamicObject(3655, 2823.38721, -899.97705, 27.18668,   0.00000, 0.00000, -5.94000);
	CreateDynamicObject(3655, 2820.66016, -902.80817, 35.07872,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2788.95752, -864.87701, 33.52820,   20.00000, 0.00000, 89.60052);
	CreateDynamicObject(3655, 2734.76636, -862.26923, 56.46773,   20.00000, 0.00000, 85.27533);
	CreateDynamicObject(3655, 2746.40332, -862.49786, 52.52772,   20.00000, 0.00000, 86.90590);
	CreateDynamicObject(3655, 2768.17261, -864.14197, 42.15866,   20.00000, 0.00000, 86.50803);
	CreateDynamicObject(3655, 2778.44165, -864.66626, 39.03959,   20.00000, 0.00000, 88.83195);
	CreateDynamicObject(3655, 2830.93701, -889.00110, 13.43532,   0.00000, 0.00000, 358.54147);
	CreateDynamicObject(3655, 2821.53418, -889.80914, 19.38553,   20.00000, 0.00000, 89.66051);
	CreateDynamicObject(3655, 2766.76660, -887.94525, 42.26025,   20.00000, 0.00000, 86.93649);
	CreateDynamicObject(3655, 2757.08569, -863.57190, 47.22546,   20.00000, 0.00000, 88.56558);
	CreateDynamicObject(3655, 2811.35474, -865.79694, 24.11872,   20.00000, 0.00000, 88.83195);
	CreateDynamicObject(3655, 2820.40894, -866.12317, 19.38553,   20.00000, 0.00000, 89.60052);
	CreateDynamicObject(3655, 2800.09058, -865.34296, 28.82928,   20.00000, 0.00000, 86.50803);
	CreateDynamicObject(3655, 2811.00830, -889.68988, 24.11872,   20.00000, 0.00000, 88.83195);
	CreateDynamicObject(3655, 2788.94653, -888.67725, 33.70529,   20.00000, 0.00000, 85.77503);
	CreateDynamicObject(3655, 2777.56885, -888.19604, 37.80058,   20.00000, 0.00000, 87.20889);
	CreateDynamicObject(3655, 2744.64648, -887.21283, 52.52772,   20.00000, 0.00000, 86.90590);
	CreateDynamicObject(3655, 2755.44995, -887.46393, 47.22546,   20.00000, 0.00000, 88.56558);
	CreateDynamicObject(3655, 2807.52783, -900.70886, 35.07872,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2799.59814, -889.39117, 28.82928,   20.00000, 0.00000, 86.50803);
	CreateDynamicObject(3655, 2814.88770, -972.91028, 52.25350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2815.71655, -959.00525, 52.25350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2815.24487, -944.53436, 52.25350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2816.10205, -929.93591, 52.25350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2815.34058, -916.08179, 52.25350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(12814, 2714.87158, -886.84515, 58.07551,   -26.00000, 0.00000, 1.06315);
	CreateDynamicObject(12814, 2713.52930, -904.12201, 55.26149,   0.00000, 0.00000, 357.04742);
	CreateDynamicObject(3655, 2743.40430, -897.78210, 59.55960,   20.00000, 0.00000, 86.08128);
	CreateDynamicObject(3655, 2767.30933, -941.60718, 68.61514,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2735.06616, -905.36591, 69.04529,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2747.44702, -902.86108, 63.51361,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2755.40356, -905.81799, 70.47320,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2746.31738, -904.32593, 71.60059,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2755.40356, -905.81799, 61.90995,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2823.38721, -899.97705, 27.18668,   0.00000, 0.00000, -5.94000);
	CreateDynamicObject(3629, 2764.79932, -1000.81433, 43.53353,   -24.00000, 90.00000, 272.54721);
	CreateDynamicObject(3629, 2792.13989, -999.31488, 32.19796,   -18.00000, 90.00000, 272.00000);
	CreateDynamicObject(3655, 2819.73535, -998.28687, 30.91825,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2815.82129, -999.96045, 45.94700,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2817.76782, -997.99030, 38.29014,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2814.82446, -1000.41235, 52.25350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3655, 2803.99414, -902.61530, 53.36876,   20.00000, 0.00000, 91.51564);
	CreateDynamicObject(3655, 2783.94873, -904.31177, 62.43070,   20.00000, 0.00000, 91.51564);
	CreateDynamicObject(3655, 2793.09717, -903.12555, 56.98660,   20.00000, 0.00000, 91.51564);
	CreateDynamicObject(3655, 2772.13818, -904.86285, 66.77034,   20.00000, 0.00000, 91.51564);
	CreateDynamicObject(3655, 2761.88013, -904.72339, 70.47320,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3629, 2777.86328, -898.50818, 36.55777,   -24.00000, -90.00000, 272.44717);
	CreateDynamicObject(3655, 2753.74780, -898.84937, 55.15716,   20.00000, 0.00000, 86.08128);
	CreateDynamicObject(3655, 2806.96387, -905.60815, 43.25922,   0.00000, 0.00000, -6.06000);
	CreateDynamicObject(3655, 2771.14087, -1024.14612, 51.41101,   20.00000, 0.00000, 90.73927);
	CreateDynamicObject(3655, 2779.23633, -1007.71930, 64.21158,   20.00000, 0.00000, 90.73927);
	CreateDynamicObject(3655, 2802.11182, -1006.95471, 55.12341,   20.00000, 0.00000, 90.73927);
	CreateDynamicObject(19791, 2810.34082, -1004.46765, 46.84639,   0.00000, 0.00000, 359.17078);
	CreateDynamicObject(3629, 2725.62329, -1002.64001, 51.97185,   0.00000, 90.00000, 272.54721);
	CreateDynamicObject(3655, 2818.73999, -1011.02118, 30.91825,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2814.91016, -1020.87939, 30.91825,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2815.06787, -1007.64246, 38.29014,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2811.81104, -1019.36035, 38.29014,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2813.23730, -1007.01617, 45.94700,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2809.74048, -1017.88824, 45.94700,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2793.36572, -1025.67212, 42.49555,   20.00000, 0.00000, 89.66051);
	CreateDynamicObject(3655, 2786.87402, -1015.15967, 53.08194,   20.00000, 0.00000, 89.56052);
	CreateDynamicObject(3655, 2776.00464, -1014.90247, 57.43021,   20.00000, 0.00000, 89.56052);
	CreateDynamicObject(3655, 2769.20996, -1008.15082, 70.28011,   20.00000, 0.00000, 90.73927);
	CreateDynamicObject(3655, 2758.52197, -1007.32159, 74.71833,   20.00000, 0.00000, 90.73927);
	CreateDynamicObject(3655, 2748.31665, -989.61774, 76.31139,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2734.89673, -991.30133, 76.31139,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2747.39404, -1007.59595, 76.31139,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2734.13477, -1007.39172, 76.31139,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2760.43286, -1022.88715, 55.81352,   20.00000, 0.00000, 90.48908);
	CreateDynamicObject(3655, 2752.16382, -1017.22308, 68.27571,   20.00000, 0.00000, 90.38908);
	CreateDynamicObject(3655, 2739.41870, -1018.52307, 69.29456,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2726.52515, -1014.58514, 73.86423,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2719.89307, -1007.74316, 79.34185,   0.00000, 0.00000, 4.06797);
	CreateDynamicObject(3655, 2715.49146, -993.10077, 76.31139,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2708.96582, -994.75977, 79.92466,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2732.62231, -991.50775, 75.90536,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2715.35815, -1014.96625, 78.60546,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2706.03198, -1012.20862, 83.84753,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2691.92212, -1011.52100, 84.64764,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2695.59180, -996.48004, 84.45131,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2688.39258, -992.80261, 86.66740,   0.00000, 0.00000, 4.00797);
	CreateDynamicObject(3655, 2682.15137, -985.80151, 88.03048,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2679.04761, -973.87360, 83.49738,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2716.15454, -978.72644, 75.88463,   0.00000, 0.00000, 1.31062);
	CreateDynamicObject(3655, 2716.67749, -967.39087, 75.88463,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(3655, 2715.89795, -955.25336, 75.04845,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(3655, 2712.51099, -943.20776, 75.04845,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(3655, 2713.13599, -931.33215, 72.88715,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(3655, 2707.28711, -919.66980, 72.16579,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(3655, 2703.88208, -979.35883, 81.17347,   0.00000, 0.00000, 93.96278);
	CreateDynamicObject(3655, 2689.06396, -984.47864, 83.51083,   0.00000, 0.00000, 95.19739);
	CreateDynamicObject(3655, 2687.22070, -970.87683, 82.80179,   0.00000, 0.00000, 95.19739);
	CreateDynamicObject(3655, 2701.24951, -965.86847, 81.17347,   0.00000, 0.00000, 93.96278);
	CreateDynamicObject(3655, 2698.93237, -954.74036, 81.17347,   0.00000, 0.00000, 93.96278);
	CreateDynamicObject(3655, 2685.49585, -959.19531, 81.17347,   0.00000, 0.00000, 93.96278);
	CreateDynamicObject(3655, 2698.40552, -947.91638, 73.77048,   0.00000, 0.00000, 93.96278);
	CreateDynamicObject(3655, 2684.95898, -950.32269, 73.77048,   0.00000, 0.00000, 93.96278);
	CreateDynamicObject(3655, 2698.75537, -935.44263, 71.05849,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2684.35010, -936.57086, 71.05849,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2711.55322, -896.70380, 64.31734,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2712.48486, -884.76038, 58.93801,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2710.72192, -908.00232, 70.61493,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2722.94556, -863.73914, 58.93801,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2708.82935, -868.07794, 58.93801,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2733.72388, -894.85040, 63.14736,   0.00000, 0.00000, 1.26998);
	CreateDynamicObject(3655, 2733.58643, -885.64862, 55.95356,   0.00000, 0.00000, 1.26998);
	CreateDynamicObject(3655, 2815.76001, -999.99841, 45.94700,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2818.97534, -987.04108, 45.94700,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2820.30347, -975.44702, 44.67117,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2821.11987, -963.89343, 44.67117,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2821.39697, -951.97638, 44.67117,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2822.26587, -940.32263, 44.67117,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2823.45410, -928.92432, 44.67117,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2824.53613, -917.09387, 44.67117,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2819.49878, -907.08984, 44.67117,   0.00000, 0.00000, -6.00000);
	CreateDynamicObject(3655, 2663.96729, -971.60022, 80.86404,   0.00000, 0.00000, 102.49490);
	CreateDynamicObject(3655, 2676.37524, -959.11090, 81.29079,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2671.70996, -947.69031, 78.46291,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2660.69897, -956.37531, 79.90667,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2643.69189, -958.02490, 81.77735,   0.00000, 0.00000, 102.49493);
	CreateDynamicObject(3655, 2628.29053, -937.92474, 80.26350,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2642.48071, -936.26013, 79.34737,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2624.58838, -918.93835, 80.87870,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2638.51880, -917.21307, 79.13821,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2662.89160, -937.68939, 78.30965,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2652.87280, -914.44312, 76.56659,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2668.97705, -937.01654, 75.26108,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2662.03687, -932.00415, 77.15997,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2672.09692, -929.13428, 74.22086,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2665.96753, -911.37451, 74.93816,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2677.78516, -908.99017, 72.65322,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(12814, 2681.50537, -924.56659, 68.35183,   0.00000, 0.00000, 1.06320);
	CreateDynamicObject(3655, 2685.42993, -907.45892, 71.15848,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2700.59790, -911.42535, 71.15848,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2700.57007, -898.04712, 71.15848,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(12814, 2680.92358, -876.21649, 59.89936,   -20.00000, 0.00000, 1.00000);
	CreateDynamicObject(3655, 2684.38281, -893.95544, 68.21937,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2699.56860, -888.02826, 58.53954,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2684.05542, -880.24091, 66.88642,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2697.58325, -869.67841, 62.71417,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2683.15576, -866.70575, 66.72221,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2699.56860, -888.02826, 66.88642,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2711.75464, -887.13043, 64.31734,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2734.34766, -885.77319, 60.76674,   0.00000, 0.00000, 1.26998);
	CreateDynamicObject(10675, 2725.61890, -820.97455, 58.50078,   0.00000, 0.00000, 358.03851);
	CreateDynamicObject(3629, 2754.39697, -857.41638, 22.31389,   -24.00000, -90.00000, 266.25055);
	CreateDynamicObject(3629, 2792.54883, -859.51660, 4.63979,   -24.00000, -90.00000, 266.25055);
	CreateDynamicObject(3629, 2737.90405, -834.91718, 33.05577,   0.00000, 90.00000, 357.79807);
	CreateDynamicObject(10675, 2724.41968, -844.05377, 58.50078,   0.00000, 0.00000, 358.03851);
	CreateDynamicObject(19313, 2734.91699, -809.78589, 55.48026,   0.00000, 0.00000, 357.48438);
	CreateDynamicObject(19313, 2720.89648, -809.09308, 55.48026,   0.00000, 0.00000, 357.48438);
	CreateDynamicObject(19313, 2741.54175, -816.98169, 55.48030,   0.00000, 0.00000, 87.23875);
	CreateDynamicObject(19313, 2740.85962, -830.97913, 55.48030,   0.00000, 0.00000, 87.23875);
	CreateDynamicObject(19313, 2740.17017, -844.89368, 55.48030,   0.00000, 0.00000, 87.23875);
	CreateDynamicObject(19313, 2739.58789, -858.83093, 55.48030,   0.00000, 0.00000, 87.23875);
	CreateDynamicObject(3629, 2715.69678, -811.06555, 33.05580,   0.00000, 90.00000, 87.28943);
	CreateDynamicObject(3655, 2706.37451, -814.10400, 58.32281,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2706.08423, -825.77399, 58.32281,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2704.16333, -836.61310, 58.32281,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2689.52881, -848.17645, 65.52814,   0.00000, 0.00000, 4.81286);
	CreateDynamicObject(3655, 2709.91528, -863.30896, 58.93801,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2699.19556, -864.89954, 62.82848,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2703.73364, -847.91437, 58.32281,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2679.96680, -848.15710, 67.08586,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2702.87573, -847.74774, 64.84874,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2734.35034, -860.35535, 58.12181,   0.00000, 0.00000, 355.71918);
	CreateDynamicObject(3655, 2402.57129, -1001.04810, 78.68527,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3629, 2417.88599, -1011.88861, 53.74884,   0.00000, 90.00000, 271.87463);
	CreateDynamicObject(3655, 2398.98193, -1018.07361, 54.35648,   0.00000, 0.00000, 89.61490);
	CreateDynamicObject(3655, 2399.11011, -1016.23993, 69.91960,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2399.19995, -1017.29956, 61.81458,   0.00000, 0.00000, 89.61490);
	CreateDynamicObject(3655, 2410.64282, -1018.76904, 54.35648,   0.00000, 0.00000, 89.61490);
	CreateDynamicObject(3655, 2410.73315, -1017.82159, 61.81458,   0.00000, 0.00000, 89.61490);
	CreateDynamicObject(3655, 2410.54272, -1016.17236, 69.91960,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2422.27344, -1018.56116, 54.35648,   0.00000, 0.00000, 89.61490);
	CreateDynamicObject(3655, 2422.36182, -1017.21423, 61.81458,   0.00000, 0.00000, 89.61490);
	CreateDynamicObject(3655, 2422.14551, -1016.28876, 69.91960,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2433.15674, -1014.46875, 68.89432,   0.00000, 0.00000, 96.54688);
	CreateDynamicObject(3655, 2433.38086, -1017.22351, 54.35648,   0.00000, 0.00000, 96.54688);
	CreateDynamicObject(3655, 2433.45190, -1016.10040, 61.43637,   0.00000, 0.00000, 96.54688);
	CreateDynamicObject(3655, 2443.50928, -1011.93176, 71.08360,   0.00000, 0.00000, 96.54688);
	CreateDynamicObject(3655, 2444.50830, -1015.03009, 58.32443,   0.00000, 0.00000, 96.54688);
	CreateDynamicObject(3655, 2443.94580, -1013.27435, 65.01295,   0.00000, 0.00000, 96.54688);
	CreateDynamicObject(3629, 2467.90259, -1010.14624, 53.74884,   0.00000, 90.00000, 271.87463);
	CreateDynamicObject(3655, 2456.45557, -1010.72339, 70.97121,   0.00000, 0.00000, 87.93685);
	CreateDynamicObject(3655, 2456.40698, -1015.48071, 60.94545,   0.00000, 0.00000, 87.93685);
	CreateDynamicObject(3655, 2456.50781, -1013.53137, 67.72005,   0.00000, 0.00000, 87.93685);
	CreateDynamicObject(3655, 2468.10938, -1017.00433, 60.94545,   0.00000, 0.00000, 87.93685);
	CreateDynamicObject(3655, 2468.21680, -1015.33679, 67.72005,   0.00000, 0.00000, 87.93685);
	CreateDynamicObject(3655, 2468.28271, -1013.15479, 70.97121,   0.00000, 0.00000, 87.93685);
	CreateDynamicObject(3655, 2410.20654, -1000.66614, 78.68527,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2422.13525, -1000.30566, 78.68527,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2433.90527, -1000.47510, 78.68527,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2446.11743, -1000.59869, 78.68527,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2457.33154, -1000.38385, 78.68527,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2469.35278, -1000.05511, 78.68527,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(3655, 2480.86304, -999.70477, 78.68527,   0.00000, 0.00000, 91.69283);
	CreateDynamicObject(19313, 2468.80200, -992.47998, 81.36220,   0.00000, 0.00000, 1.49474);
	CreateDynamicObject(19313, 2454.69507, -992.79999, 81.36220,   0.00000, 0.00000, 1.49474);
	CreateDynamicObject(19313, 2440.67505, -993.37909, 81.36220,   0.00000, 0.00000, 1.49474);
	CreateDynamicObject(3655, 2481.91333, -1016.65845, 70.62561,   0.00000, 0.00000, 77.87074);
	CreateDynamicObject(3655, 2481.50269, -1019.02704, 65.90488,   0.00000, 0.00000, 77.87074);
	CreateDynamicObject(3655, 2492.87598, -1022.98590, 68.09080,   0.00000, 0.00000, 77.87074);
	CreateDynamicObject(3655, 2493.50024, -1018.79291, 72.00655,   0.00000, 0.00000, 77.87074);
	CreateDynamicObject(14409, 2440.74927, -991.85211, 77.61690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14409, 2491.06738, -994.70178, 77.61690,   0.00000, 0.00000, 152.00000);
	CreateDynamicObject(3629, 2467.60205, -997.76709, 53.74880,   0.00000, -90.00000, 271.87460);
	CreateDynamicObject(19377, 2487.88428, -996.21869, 79.92366,   0.00000, 0.00000, 331.57217);
	CreateDynamicObject(14409, 2495.33765, -1008.68317, 72.61932,   0.00000, 0.00000, 271.00000);
	CreateDynamicObject(19377, 2497.40771, -1003.79211, 74.76652,   0.00000, 0.00000, 267.08209);
	CreateDynamicObject(19377, 2497.18506, -1011.21448, 73.04073,   0.00000, 0.00000, 267.08209);
	CreateDynamicObject(14409, 2495.26538, -1004.75885, 72.61932,   0.00000, 0.00000, 271.00000);
	CreateDynamicObject(3629, 2511.53369, -1014.16034, 48.91864,   0.00000, 90.00000, 248.21964);
	CreateDynamicObject(3655, 2508.89648, -1000.33002, 73.76144,   0.00000, 0.00000, 66.45991);
	CreateDynamicObject(3655, 2519.50098, -1005.43591, 73.76144,   0.00000, 0.00000, 66.45991);
	CreateDynamicObject(3655, 2530.38037, -1010.03003, 73.76144,   0.00000, 0.00000, 66.45991);
	CreateDynamicObject(3655, 2504.44629, -1019.19092, 72.63405,   0.00000, 0.00000, 66.45991);
	CreateDynamicObject(3655, 2515.67725, -1023.10712, 73.76144,   0.00000, 0.00000, 66.45991);
	CreateDynamicObject(3655, 2526.73047, -1027.13159, 73.76144,   0.00000, 0.00000, 66.45991);
	CreateDynamicObject(3655, 2511.54077, -1031.06140, 71.46148,   0.00000, 0.00000, 77.87074);
	CreateDynamicObject(3655, 2522.64551, -1032.29895, 71.46150,   0.00000, 0.00000, 86.00000);
	CreateDynamicObject(3655, 2534.52881, -1033.12256, 71.46150,   0.00000, 0.00000, 86.00000);
	CreateDynamicObject(3655, 2546.36133, -1032.95618, 71.46150,   0.00000, 0.00000, 86.00000);
	CreateDynamicObject(3629, 2559.09326, -1021.15051, 48.91860,   0.00000, 90.00000, 85.33592);
	CreateDynamicObject(3655, 2541.63599, -1013.43060, 73.76144,   0.00000, 0.00000, 66.45991);
	CreateDynamicObject(3655, 2536.45386, -1029.69568, 73.76144,   0.00000, 0.00000, 66.45991);
	CreateDynamicObject(3655, 2557.24487, -1033.86523, 71.46150,   0.00000, 0.00000, 91.71721);
	CreateDynamicObject(3655, 2551.48779, -1016.86444, 73.41959,   0.00000, 0.00000, 75.94067);
	CreateDynamicObject(3655, 2560.58398, -1017.98029, 73.42297,   0.00000, 0.00000, 91.71721);
	CreateDynamicObject(3655, 2572.84058, -1018.08405, 73.42300,   0.00000, 0.00000, 86.00000);
	CreateDynamicObject(3655, 2568.86157, -1034.31812, 71.46150,   0.00000, 0.00000, 87.05840);
	CreateDynamicObject(3655, 2574.80762, -1034.04956, 71.46150,   0.00000, 0.00000, 87.05840);
	CreateDynamicObject(14409, 2582.56934, -1031.83191, 67.71648,   0.00000, 0.00000, 175.62263);
	CreateDynamicObject(3655, 2503.09009, -1024.27014, 69.69080,   0.00000, 0.00000, 77.87074);
	CreateDynamicObject(19313, 2484.43018, -1011.16107, 76.76064,   0.00000, 0.00000, 1.70183);
	CreateDynamicObject(19313, 2470.39844, -1011.60095, 76.76064,   0.00000, 0.00000, 1.70183);
	CreateDynamicObject(19313, 2456.33862, -1012.01282, 76.76064,   0.00000, 0.00000, 1.70183);
	CreateDynamicObject(19313, 2442.29980, -1012.44727, 76.76064,   0.00000, 0.00000, 1.70183);
	CreateDynamicObject(19313, 2428.26025, -1012.85266, 76.76064,   0.00000, 0.00000, 1.70183);
	CreateDynamicObject(19313, 2414.24146, -1013.26678, 76.76064,   0.00000, 0.00000, 1.70183);
	CreateDynamicObject(19313, 2400.19116, -1013.76471, 76.76064,   0.00000, 0.00000, 1.70183);
	CreateDynamicObject(19377, 2398.25610, -997.93500, 77.66050,   0.00000, 90.00000, 1.35501);
	CreateDynamicObject(14409, 2394.87036, -1005.70575, 74.31290,   0.00000, 0.00000, 178.26688);
	CreateDynamicObject(19377, 2392.92114, -998.49634, 62.93925,   0.00000, 0.00000, 1.35500);
	CreateDynamicObject(19377, 2392.92114, -998.49634, 72.96937,   0.00000, 0.00000, 1.35500);
	CreateDynamicObject(19377, 2393.20923, -1001.83759, 72.32862,   0.00000, 0.00000, 351.30771);
	CreateDynamicObject(19377, 2393.20923, -1001.83759, 62.93930,   0.00000, 0.00000, 351.30771);
	CreateDynamicObject(19313, 2392.97217, -996.18256, 78.06810,   0.00000, 0.00000, 91.75595);
	CreateDynamicObject(19313, 2393.00757, -1006.97894, 77.85075,   0.00000, 0.00000, 89.05861);
	CreateDynamicObject(3655, 2755.25537, -926.94208, 71.63464,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(3655, 2742.09082, -926.53998, 71.63464,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(3655, 2730.01587, -927.12866, 71.63464,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(14409, 2721.69824, -926.31360, 66.71030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3655, 2761.89404, -989.18195, 69.70060,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2767.01465, -977.36371, 69.65908,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2765.27026, -962.53070, 75.53653,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2763.88916, -950.61414, 74.48287,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3655, 2764.25049, -938.73615, 74.48287,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(3594, 2591.63916, -988.52069, 78.85590,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 2591.14868, -986.24084, 79.49223,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 2566.20483, -971.13403, 81.74191,   0.00000, 0.00000, 89.69775);
	CreateDynamicObject(3594, 2566.80786, -973.96149, 81.74191,   0.00000, 0.00000, 89.69775);
	CreateDynamicObject(3594, 2566.94556, -972.27094, 82.50765,   0.00000, 0.00000, 89.69775);
	CreateDynamicObject(3655, 2668.33057, -850.35651, 69.63810,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2668.97021, -867.38452, 70.16529,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2668.40747, -881.75024, 71.92260,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2668.24927, -894.44232, 71.92260,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3629, 2645.02075, -908.68604, 51.31740,   -9.00000, 90.00000, 276.84305);
	CreateDynamicObject(3655, 2656.71069, -895.61261, 66.56615,   0.00000, 0.00000, 94.08279);
	CreateDynamicObject(3655, 2644.88135, -898.44238, 69.24222,   0.00000, 0.00000, 94.08279);
	CreateDynamicObject(3655, 2632.69678, -900.38293, 70.54388,   0.00000, 0.00000, 94.08279);
	CreateDynamicObject(3655, 2621.11597, -902.56927, 72.23935,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3629, 2598.35278, -910.52649, 54.94385,   0.00000, -90.00000, 276.29227);
	CreateDynamicObject(3655, 2607.43115, -903.76495, 80.26350,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2595.38916, -906.44531, 80.87870,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2573.07983, -933.26117, 85.02922,   0.00000, 0.00000, 8.55854);
	CreateDynamicObject(3655, 2682.90210, -927.18762, 71.63895,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2682.90210, -927.18762, 71.63895,   0.00000, 0.00000, 93.90279);
	CreateDynamicObject(3655, 2699.56787, -923.28003, 70.93118,   0.00000, 0.00000, 359.70093);
	CreateDynamicObject(3655, 2575.73193, -896.05920, 82.97338,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2577.39087, -883.77612, 82.97338,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2594.35449, -888.90839, 80.39271,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2608.23071, -885.45978, 79.05832,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2621.11597, -902.56927, 80.87870,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2644.83691, -898.43671, 76.57190,   0.00000, 0.00000, 94.08279);
	CreateDynamicObject(3655, 2656.71069, -895.61261, 74.53393,   0.00000, 0.00000, 94.08279);
	CreateDynamicObject(3655, 2632.69678, -900.38293, 78.46083,   0.00000, 0.00000, 94.08279);
	CreateDynamicObject(3655, 2621.82349, -882.44489, 77.36258,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2635.59277, -880.25623, 74.43933,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2649.19604, -879.07794, 72.35825,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2646.90137, -864.25488, 72.35825,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2655.10718, -847.33173, 71.41587,   0.00000, 0.00000, 5.31143);
	CreateDynamicObject(3655, 2641.38696, -849.74420, 73.71461,   0.00000, 0.00000, 5.31143);
	CreateDynamicObject(3655, 2627.75415, -851.89331, 76.52739,   0.00000, 6.00000, 5.00000);
	CreateDynamicObject(3655, 2613.93164, -853.17719, 78.74725,   0.00000, 6.00000, 5.00000);
	CreateDynamicObject(3655, 2599.96094, -854.57257, 80.89634,   0.00000, 6.00000, 5.00000);
	CreateDynamicObject(3655, 2586.82495, -855.74426, 82.58814,   0.00000, 6.00000, 5.00000);
	CreateDynamicObject(3655, 2576.98535, -872.58533, 82.97338,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2576.57983, -861.11633, 82.97338,   0.00000, 0.00000, 7.18622);
	CreateDynamicObject(3655, 2633.04810, -865.97577, 76.52739,   0.00000, 6.00000, 5.00000);
	CreateDynamicObject(3655, 2615.18359, -868.03729, 77.82176,   0.00000, 6.00000, 5.00000);
	CreateDynamicObject(3655, 2604.47534, -869.93341, 79.70521,   0.00000, 6.00000, 5.00000);
	CreateDynamicObject(3655, 2593.92261, -871.04236, 81.75499,   0.00000, 6.00000, 5.00000);
	CreateDynamicObject(12814, 2502.03857, -823.97333, 94.46851,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12814, 2531.72827, -823.90509, 94.46851,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3655, 2491.18872, -844.71167, 97.81712,   0.00000, 0.00000, 94.95812);
	CreateDynamicObject(3655, 2489.02271, -831.16351, 98.82470,   0.00000, 0.00000, 94.95810);
	CreateDynamicObject(3655, 2489.11670, -817.07318, 98.82470,   0.00000, 0.00000, 94.95810);
	CreateDynamicObject(3655, 2488.33569, -806.19910, 98.82471,   0.00000, 0.00000, 94.95812);
	CreateDynamicObject(3655, 2535.96802, -841.85193, 96.95895,   0.00000, 0.00000, 1.38480);
	CreateDynamicObject(3655, 2543.58936, -840.99225, 96.95895,   0.00000, 0.00000, 1.38480);
	CreateDynamicObject(14407, 2530.63135, -817.85486, 92.86081,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14407, 2534.61157, -819.94427, 94.31170,   0.00000, 0.00000, 0.63516);
	CreateDynamicObject(18764, 2535.01514, -817.73181, 93.83035,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14407, 2534.73779, -815.51428, 94.31170,   0.00000, 0.00000, 180.63519);
	CreateDynamicObject(19377, 2530.61328, -815.82062, 89.19756,   58.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2530.54443, -819.79877, 89.19756,   58.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2532.69678, -819.87054, 90.67084,   58.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2532.75513, -815.57343, 90.67080,   58.00000, 0.00000, 180.00000);
	CreateDynamicObject(19377, 2546.46680, -810.11957, 102.31927,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18765, 2535.02832, -808.32135, 95.09563,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18765, 2534.74756, -826.86591, 95.09050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18765, 2541.56470, -817.18793, 95.09050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18765, 2541.63452, -826.92511, 95.09050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18765, 2541.58984, -808.38330, 95.09050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18770, 2531.13843, -804.33893, 7.43829,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18770, 2530.79272, -830.85278, 7.43829,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18770, 2545.59790, -830.88269, 7.43829,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18770, 2545.45850, -804.37689, 7.43829,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2536.63281, -817.63580, 92.89301,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.42529, -819.55963, 102.31927,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.44482, -826.88055, 102.31927,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(13641, 2539.20264, -816.38275, 86.57706,   0.00000, 0.00000, 89.93881);
	CreateDynamicObject(19325, 2541.44092, -803.52960, 105.37310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2534.94604, -803.53253, 105.37309,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2534.94604, -803.53253, 97.64958,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2534.94604, -803.53253, 101.49508,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2541.42261, -803.53772, 101.49510,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2541.44092, -803.52960, 97.64960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2532.96826, -803.51349, 100.76306,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2537.66235, -803.54242, 105.65170,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2542.87354, -803.55029, 105.65170,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2532.96826, -803.51349, 105.65170,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2537.66235, -803.54242, 100.76310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2542.87354, -803.55029, 100.76310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(13641, 2539.01245, -844.05658, 86.57706,   0.00000, 0.00000, 90.34485);
	CreateDynamicObject(19325, 2541.44238, -831.76764, 97.64960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2534.94604, -803.53253, 97.64958,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2534.91016, -831.78387, 97.64960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2534.91016, -831.78387, 105.37310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2534.91016, -831.78387, 101.49510,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2541.44238, -831.76758, 101.49510,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 2541.44238, -831.76758, 105.37310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2543.08862, -831.69543, 100.76310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2538.32935, -831.71515, 100.76310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2533.47876, -831.74103, 100.76310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2543.08862, -831.69537, 19362.00000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2543.08862, -831.69537, 105.65170,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2538.32935, -831.71509, 105.65170,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19362, 2533.47876, -831.74103, 105.65170,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18762, 2530.65454, -807.66730, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2530.65210, -812.53790, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2530.67627, -817.48730, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2530.66260, -822.47937, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2530.67017, -827.39984, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2534.47021, -803.90375, 107.01790,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(18762, 2539.46362, -803.92407, 107.01790,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(18762, 2543.63306, -803.92517, 107.01790,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(18762, 2546.17163, -807.43011, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2546.17822, -812.25879, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2546.14307, -817.01697, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2546.14966, -821.86731, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2546.10938, -826.82898, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18762, 2546.09595, -829.36023, 107.01789,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2535.29053, -808.81500, 107.50192,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19377, 2541.24731, -808.82050, 107.50192,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19377, 2541.30518, -818.99756, 107.50192,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19377, 2541.34668, -826.50867, 107.50192,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19377, 2535.32910, -826.37317, 107.50192,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19377, 2535.35522, -817.44336, 107.50192,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(18762, 2533.67456, -831.34387, 107.01790,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(18762, 2538.49463, -831.42078, 107.01790,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(18762, 2542.96973, -831.33618, 107.01790,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(2435, 2537.07666, -817.16608, 97.58810,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2435, 2537.07178, -818.08130, 97.58810,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2435, 2537.08154, -816.24579, 97.58810,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2435, 2537.09253, -815.32568, 97.58810,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2434, 2537.07495, -818.98138, 97.58810,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2434, 2537.27979, -814.19727, 97.58810,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(14820, 2537.18018, -817.79742, 98.64230,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14820, 2537.17163, -815.63007, 98.64230,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2546.50415, -832.04712, 95.08281,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.60156, -803.70844, 84.92168,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2541.83252, -798.95135, 84.86548,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2532.24756, -798.94360, 85.55583,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2522.71094, -798.98010, 95.08280,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2513.20435, -798.97937, 95.08280,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2503.56714, -799.04095, 95.08280,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2495.47485, -798.99518, 95.08280,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2546.60156, -803.70844, 95.08281,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.58521, -813.18640, 95.08281,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.57666, -822.68787, 95.08281,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.59888, -832.13727, 95.08281,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.58521, -813.18640, 84.92170,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.57666, -822.68793, 84.92170,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2546.59888, -832.13733, 84.92170,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2541.83252, -798.95135, 95.08280,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 2532.24756, -798.94360, 95.08280,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2232, 2530.31519, -804.39294, 101.60281,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.30859, -804.44897, 100.42588,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.31494, -804.40631, 98.21279,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.31519, -804.39960, 99.36760,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.30933, -805.07056, 98.21279,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.30933, -805.07056, 99.36760,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.30933, -805.07056, 101.60281,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.30933, -805.07056, 100.42588,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.13208, -812.92493, 99.38766,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.13208, -812.92493, 98.21279,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.21191, -812.26917, 99.34121,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.21191, -812.26917, 98.21279,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.10425, -822.31158, 99.23605,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.10571, -823.02045, 99.33715,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.10571, -823.02045, 98.11179,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2530.10425, -822.31158, 98.11179,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2529.93213, -830.13153, 99.22998,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2529.89136, -830.79028, 99.25186,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2529.89136, -830.79028, 98.11179,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2232, 2529.93213, -830.13153, 98.11179,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(16151, 2498.42896, -800.09637, 94.80960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(643, 2496.26709, -804.45654, 95.07982,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2500.00073, -804.61060, 95.07982,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2503.37256, -802.34229, 95.07982,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2498.09595, -808.82281, 95.07982,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2503.11328, -807.64313, 95.07982,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2506.30078, -804.59082, 95.07982,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(643, 2508.85010, -801.62091, 95.07982,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1823, 2542.22046, -830.76074, 97.58736,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1823, 2538.69922, -830.80005, 97.58736,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1823, 2535.49463, -830.76178, 97.58736,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1823, 2542.87915, -805.83008, 97.58736,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19457, 2536.58838, -829.92590, 97.58201,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19457, 2542.01050, -830.02002, 97.57695,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(2125, 2543.30493, -804.33148, 97.97449,   0.00000, 0.00000, -0.06000);
	CreateDynamicObject(2125, 2542.17310, -805.47925, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2535.07202, -830.22101, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2536.00488, -831.27643, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2538.07861, -830.23956, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2539.15894, -831.43481, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2541.51636, -830.25409, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2542.77393, -831.33105, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19457, 2536.88599, -805.26007, 97.58201,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19457, 2541.77661, -805.29138, 97.57695,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1823, 2532.70239, -830.70770, 97.58736,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2533.20654, -831.14142, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2532.03613, -830.24481, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1823, 2533.95313, -805.89972, 97.58736,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2533.25366, -805.29749, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2534.32397, -804.40070, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2537.43945, -804.39014, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2536.44482, -805.37860, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1823, 2536.98560, -805.88922, 97.58736,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1823, 2539.88550, -805.87433, 97.58736,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2125, 2540.28247, -804.37598, 97.97449,   0.00000, 0.00000, -0.06000);
	CreateDynamicObject(2125, 2539.17261, -805.38885, 97.97449,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18656, 2531.25977, -803.16528, 106.33739,   120.00000, 0.00000, 0.00000);
	CreateDynamicObject(18656, 2532.20972, -832.02594, 106.33740,   120.00000, 0.00000, 193.00000);
	CreateDynamicObject(8874, 2536.00439, -806.84064, 102.84232,   -105.00000, 0.00000, 25.00000);
	CreateDynamicObject(8874, 2533.96021, -826.52686, 102.84230,   -105.00000, 0.00000, 91.00000);
	CreateDynamicObject(3438, 2546.29761, -821.29285, 101.13535,   0.00000, 0.00000, 359.69696);
	CreateDynamicObject(3438, 2546.36475, -814.45221, 101.13535,   0.00000, 0.00000, 359.69696);
	CreateDynamicObject(19128, 2540.11670, -820.75854, 97.58782,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19128, 2540.23608, -816.75598, 97.58782,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19128, 2540.24243, -812.95758, 97.58782,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19128, 2544.24170, -812.92480, 97.58782,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19128, 2544.19312, -816.79315, 97.58782,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19128, 2544.08643, -820.73688, 97.58782,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2530.20239, -806.87549, 98.10220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 2530.21680, -811.02856, 98.10220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 2529.85107, -825.42487, 98.10220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 2529.83887, -829.48254, 98.10220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1215, 2532.62305, -815.58704, 96.68025,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2532.69751, -820.06708, 96.68025,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2532.72095, -822.06079, 97.69638,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2532.69800, -813.13116, 97.69638,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19455, 2546.11816, -817.81702, 101.49570,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3655, 2774.38354, -988.01575, 69.70060,   0.00000, 0.00000, 0.20100);
	CreateDynamicObject(19791, 2788.69360, -989.24414, 49.30449,   0.00000, 0.00000, 0.00000);
	//objetos casas.
	CreateDynamicObject(2100, -63.490002, 1367.239990, 1079.209961, 0.000000, 0.000000, 327.720001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, -70.779999, 1356.520020, 1079.150024, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, -70.779999, 1356.520020, 1079.150024, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, -70.779999, 1356.520020, 1079.150024, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, -43.349998, 1413.119995, 1083.439941, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, -43.349998, 1413.119995, 1083.439941, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2100, -52.610001, 1403.459961, 1083.430054, 0.000000, 0.000000, 120.760002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 94.230003, 1332.160034, 1087.369995, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2100, 87.849998, 1322.099976, 1082.859985, 0.000000, 0.000000, 144.300003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 94.230003, 1332.160034, 1087.369995, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2100, 87.849998, 1322.099976, 1082.859985, 0.000000, 0.000000, 144.300003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1491, 20.969999, 1410.709961, 1083.439941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2100, 26.750000, 1343.989990, 1083.369995, 0.000000, 0.000000, 140.699997, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2526, 34.790001, 1340.239990, 1087.869995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2524, 36.020000, 1345.250000, 1087.869995, 0.000000, 0.000000, 270.350006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2525, 36.020000, 1343.410034, 1087.939941, 0.000000, 0.000000, 270.420013, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2527, 33.189999, 1341.359985, 1087.869995, 0.000000, 0.000000, 180.080002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2526, 34.790001, 1340.239990, 1087.869995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 30.580000, 1345.829956, 1087.880005, 0.000000, 0.000000, 360.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2100, 26.750000, 1343.989990, 1083.369995, 0.000000, 0.000000, 140.699997, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2524, 18.620001, 1410.060059, 1083.439941, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 24.750000, 1419.520020, 1083.439941, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2100, 33.470001, 1409.869995, 1083.430054, 0.000000, 0.000000, 214.009995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 24.750000, 1419.520020, 1083.439941, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1491, 20.969999, 1410.709961, 1083.439941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2524, 18.620001, 1410.060059, 1083.439941, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2525, 16.780001, 1409.969971, 1083.430054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2526, 16.690001, 1413.000000, 1083.430054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	//PuertaCasa Especial complementos
	CreateDynamicObject(976, -90.85190, -1135.46204, 0.25050,   0.00000, 0.00000, 68.90480);
	CreateDynamicObject(969, -84.57200, -1118.88611, 0.28050,   0.00000, 0.00000, 69.50000);
	//POSTES (COMPLEMENTO)
	CreateDynamicObject(1226, 2293.08228, -1145.27551, 29.58690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1226, 2279.99194, -1154.52112, 29.58690,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1226, 2292.38257, -1380.08630, 26.92210,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1226, 2280.79126, -1388.83435, 26.92210,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1226, 2204.38525, -1651.12708, 18.14690,   0.00000, 0.00000, 257.73291);
	CreateDynamicObject(1226, 2220.35596, -1643.45129, 18.34730,   0.00000, 0.00000, 77.55600);
	CreateDynamicObject(1226, 2194.36987, -1726.57727, 16.44560,   0.00000, 0.00000, -270.00000);
	CreateDynamicObject(1226, 2207.23291, -1738.21985, 16.25810,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1226, 2282.77783, -1479.52344, 25.64640,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1226, 2267.41089, -1488.68066, 25.43370,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1226, 1957.06165, -1949.97803, 16.40970,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1226, 1966.28027, -1962.03809, 16.40970,   0.00000, 0.00000, 0.00000);
 	//FABRICA METANFETAMINA FENIXZONE // CREDITOS KANOX \ OSVALDO \ KONEKO
	CreateObject(19552, -1998.816895, 222.956100, 1034.783203, 0.000000, 0.000000, 0.000000, 0.0); // 0
	CreateObject(11085, -2001.277710, 222.600204, 1040.706787, 0.000000, 0.000000, 0.000000, 0.0); // 0
	CreateDynamicObject(19376, -2016.017578, 189.778107, 1039.498901, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -2005.197632, 189.778107, 1039.498901, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -1994.497559, 189.778107, 1039.498901, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -1983.837646, 189.778107, 1039.498901, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11700, -1995.663818, 192.188293, 1034.756226, 0.000000, 0.000000, 174.090698, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(3498, -1999.198608, 194.136597, 1044.254150, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 1, 11090, "cf_metals_sfse", "gen_chrome", 0);
	CreateDynamicObject(19924, -1999.198608, 194.129395, 1039.983154, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(3498, -1995.674561, 194.136597, 1044.254150, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 1, 11090, "cf_metals_sfse", "gen_chrome", 0);
	CreateDynamicObject(19924, -1995.678589, 194.129395, 1039.983154, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11090, -1995.749390, 194.120895, 1035.467407, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(3498, -1992.278564, 194.136597, 1044.254150, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 1, 11090, "cf_metals_sfse", "gen_chrome", 0);
	CreateDynamicObject(11089, -2022.444824, 196.445007, 1038.005249, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19924, -1992.278564, 194.129395, 1039.983154, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -2027.477905, 198.186905, 1039.498901, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11235, -2017.181641, 198.876602, 1037.192505, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11089, -1973.890015, 196.324203, 1038.005249, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -1975.122314, 197.451294, 1039.498901, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11087, -1979.972046, 198.994705, 1037.421021, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11727, -1999.162109, 204.507294, 1040.512329, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11233, -2001.252441, 204.797501, 1037.305908, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11236, -2001.179199, 204.829102, 1037.409424, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1449, -1999.167969, 205.376205, 1035.354858, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11234, -2017.238525, 208.750198, 1037.185913, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3066, -2015.634888, 209.336777, 1035.836060, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -2027.477905, 212.246902, 1039.498901, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19858, -1975.693970, 207.165604, 1036.063965, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11089, -2028.523926, 213.360596, 1038.005249, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11007, -2001.251099, 212.209000, 1040.090942, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2021.160889, 216.962204, 1036.216431, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -1975.122314, 212.191299, 1039.498901, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2015.280884, 216.962204, 1036.216431, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19911, -1975.722290, 212.169495, 1034.815430, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2010.920898, 216.962204, 1036.216431, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2006.580933, 216.962204, 1036.216431, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2022.382690, 218.197693, 1036.216431, 0.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2018.102661, 218.197693, 1036.216431, 0.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2013.942749, 218.197693, 1036.216431, 0.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(935, -2026.320435, 218.822800, 1039.497559, 0.000000, 0.000000, 39.629700, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, -2020.203003, 218.691498, 1035.252930, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2009.702759, 218.197693, 1036.216431, 0.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, -2015.963013, 218.691498, 1035.252930, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1447, -2005.342773, 218.197693, 1036.216431, 0.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, -2012.022949, 218.691498, 1035.252930, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, -2007.882935, 218.691498, 1035.252930, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(935, -2025.845215, 220.555603, 1035.377075, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -2020.992676, 220.865295, 1035.808350, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -2016.632690, 220.865295, 1035.808350, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -2012.272705, 220.865295, 1035.808350, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(935, -2026.071167, 221.585037, 1035.377075, 0.000000, 0.000000, 61.718639, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -2008.232666, 220.865295, 1035.808350, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -2003.752686, 220.865295, 1035.808350, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -1999.672729, 220.865295, 1035.808350, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -1995.472656, 220.885300, 1035.808350, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1441, -1977.566284, 218.817703, 1035.456665, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -2025.984985, 223.905746, 1035.808350, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11086, -2000.922852, 222.825806, 1042.744995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14467, -1978.480835, 222.271255, 1037.085815, 0.000000, 0.000000, 269.401367, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -2027.477905, 226.826904, 1039.498901, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(945, -2016.399780, 227.016403, 1044.365356, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19382, "all_walls", "mirror01", 0);
	fso_map = CreateDynamicObject(945, -2012.560059, 227.016403, 1044.365356, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19382, "all_walls", "mirror01", 0);
	CreateDynamicObject(937, -2016.399780, 226.999298, 1035.337891, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -2025.984985, 227.305695, 1035.808350, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(945, -2008.720215, 227.016403, 1044.365356, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19382, "all_walls", "mirror01", 0);
	CreateDynamicObject(937, -2012.560059, 226.999298, 1035.337891, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11727, -2007.285034, 227.019806, 1041.790039, 90.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(937, -2008.720215, 226.999298, 1035.337891, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(945, -2004.880371, 227.036407, 1044.365356, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19382, "all_walls", "mirror01", 0);
	CreateDynamicObject(937, -2004.880737, 226.999298, 1035.337891, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(945, -2001.040649, 227.016403, 1044.365356, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19382, "all_walls", "mirror01", 0);
	CreateDynamicObject(937, -2001.025879, 226.999298, 1035.337891, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2079, -1982.398682, 227.843643, 1035.436279, 0.000000, 0.000000, 311.223419, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1983.586182, 229.233551, 1035.218628, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(931, -2018.088501, 233.184097, 1035.808350, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2079, -1981.359863, 229.467148, 1035.436279, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -1975.122314, 228.771301, 1039.498901, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2120, -1984.681274, 230.740051, 1035.447266, 0.000000, 0.000000, 139.766190, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11727, -2009.985596, 234.065506, 1039.749878, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11236, -2010.198242, 234.187607, 1037.409424, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -2012.608154, 234.718994, 1039.498901, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1778, -2018.053101, 234.981201, 1034.817749, 0.000000, 0.000000, 310.635712, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2079, -1982.112427, 231.265869, 1035.436279, 0.000000, 0.000000, 48.194672, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11727, -1999.705566, 234.065506, 1039.749878, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2534, -1997.094849, 233.589996, 1034.816284, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2534, -1996.114746, 233.589996, 1034.816284, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(935, -1992.555908, 233.243896, 1035.396362, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3761, -1976.495972, 230.735001, 1036.790649, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2534, -1995.114746, 233.589996, 1034.816284, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -2003.068115, 234.718994, 1039.498901, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2534, -1994.114746, 233.589996, 1034.816284, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2074, -2019.756714, 235.932297, 1040.939575, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19860, -2000.389526, 234.415894, 1036.027954, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19393, -2022.099121, 236.302795, 1036.551147, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -1992.568115, 234.718994, 1039.498901, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1499, -2022.105103, 237.088394, 1034.782959, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2523, -2020.581543, 237.386200, 1034.818481, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2525, -2018.647827, 237.422394, 1034.818481, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2017.359741, 237.999893, 1040.051147, 0.000000, 180.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2017.379761, 237.999893, 1036.551147, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2475, -2021.083740, 238.143906, 1035.088745, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2475, -2019.603760, 238.143906, 1035.088745, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2475, -2018.123779, 238.143906, 1035.088745, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19376, -1982.088257, 234.718994, 1039.498901, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19437, -2022.099121, 238.882797, 1036.551147, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2022.079102, 239.522797, 1040.051147, 180.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2074, -2020.336548, 239.633102, 1038.807495, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(19378, -2017.892456, 239.641495, 1035.458740, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19437, "all_walls", "mp_carter_bwall", 0);
	CreateDynamicObject(19393, -2022.099121, 241.289993, 1036.551147, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1499, -2022.105225, 242.080902, 1034.782959, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19437, -2022.099121, 243.697800, 1036.551147, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2026.819824, 244.419907, 1043.491089, 0.000000, 180.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2026.819824, 244.419907, 1040.051147, 0.000000, 180.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19393, -2025.342651, 244.419907, 1036.551147, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19437, -2022.936035, 244.419907, 1036.551147, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1499, -2026.125000, 244.396103, 1034.782959, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2475, -2021.519531, 244.382202, 1035.088745, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2475, -2020.039551, 244.382202, 1035.088745, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2017.379761, 244.539902, 1040.051147, 0.000000, 180.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2475, -2018.559448, 244.382202, 1035.088745, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2017.379761, 244.539902, 1036.551147, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, -2019.713989, 245.164993, 1034.819946, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -2018.611816, 245.188293, 1035.831055, 0.000000, 0.000000, 344.679504, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, -2026.222778, 247.955994, 1034.819946, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16780, -2022.084595, 248.122299, 1039.042847, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2073, -2022.086304, 248.115005, 1038.736450, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2286, -2026.771729, 248.988098, 1036.791992, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19166, -2018.032959, 248.995102, 1036.396606, 90.000000, -90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(19376, -2017.922363, 249.428497, 1035.438843, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19437, "all_walls", "mp_motel_carpet1", 0);
	CreateDynamicObject(19379, -2022.524414, 249.716705, 1034.752930, 0.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(362, -2018.334351, 249.939804, 1037.356323, 0.000000, 25.000000, -77.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(19376, -2026.908447, 250.151703, 1035.438843, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19437, "all_walls", "mp_motel_carpet1", 0);
	CreateDynamicObject(630, -2025.993042, 250.875000, 1035.831055, 0.000000, 0.000000, 344.679504, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2069, -2019.596924, 250.949997, 1034.880859, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1724, -2025.834839, 251.268799, 1034.819946, 0.000000, 0.000000, 41.833900, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2605, -2020.921631, 251.603424, 1035.226074, 0.000000, 0.000000, 141.846390, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2027.670654, 252.492996, 1036.551147, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -2020.016357, 252.589493, 1034.839355, 0.000000, 0.000000, 319.372803, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19305, -2022.979980, 252.916794, 1036.042969, -0.240000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19305, -2022.877441, 252.978195, 1036.103027, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19305, -2022.996948, 253.004303, 1036.103027, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3092, -2024.558960, 253.623795, 1038.208862, 90.000000, 20.000000, 120.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2074, -2024.755859, 253.850098, 1037.563232, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19456, -2027.468750, 254.002304, 1037.893921, 0.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2737, -2026.748657, 254.028107, 1036.692749, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19393, -2022.930542, 254.016205, 1036.551147, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1829, -2018.762451, 254.524399, 1035.302490, 0.000000, 0.000000, 272.027313, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(18856, -2025.436768, 254.956299, 1039.295288, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(19376, -2022.611206, 255.010193, 1035.438843, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19437, "all_walls", "mp_motel_carpet1", 0);
	fso_map = CreateDynamicObject(19376, -2017.922363, 259.062500, 1035.438843, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 19437, "all_walls", "mp_motel_carpet1", 0);
	CreateDynamicObject(975, 2539.38721, 2824.36304, 11.32224,   0.00000, 0.00000, -87.47995);
	CreateDynamicObject(975, 2539.46021, 2824.39087, 14.58857,   0.00000, 0.00000, -87.47995);
	//TAPONES XD
	CreateDynamicObject(19911, 262.13000, -1639.60999, 21.65000,   90.00000, 90.00000, 79.70000);
	CreateDynamicObject(19795, 280.16000, -1613.90002, 33.68000,   0.00000, 0.00000, 80.10000);
	CreateDynamicObject(8948, 298.48001, -1543.05005, 25.36000,   0.00000, 0.00000, 324.82999);
	CreateDynamicObject(19795, 286.17999, -1614.93994, 33.68000,   0.00000, 0.00000, 80.10000);
	CreateDynamicObject(19795, 292.20001, -1616.02002, 33.68000,   0.00000, 0.00000, 80.10000);
	CreateDynamicObject(17951, 199.74001, -1747.54004, 4.98000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(17950, 199.81000, -1751.83997, 5.32000,   0.00000, 0.00000, 0.00000);
	//NUEVA TAPADERA ATAJO ANTIROL
	CreateDynamicObject(17031, -653.23865, -1242.47546, 17.84816,   0.00000, 0.00000, 344.43555);
	CreateDynamicObject(17031, -637.85748, -1199.13257, 17.84816,   0.00000, 0.00000, 344.43555);
	CreateDynamicObject(17031, -671.11127, -1289.79419, 23.87844,   0.00000, 0.00000, 345.63940);
	CreateDynamicObject(17031, -640.53241, -1170.99915, 29.91255,   0.00000, 0.00000, 148.65471);
	CreateDynamicObject(18228, -645.46002, -1064.15002, 20.96000,   0.00000, 0.00000, 317.12000);
	CreateDynamicObject(18228, -649.44000, -1056.64001, 33.09000,   0.00000, 0.00000, 314.87000);
	CreateDynamicObject(18228, -690.65002, -1051.70996, 51.85000,   0.00000, 0.00000, 330.29001);
	CreateDynamicObject(18228, -653.27002, -1036.50000, 49.42000,   0.00000, 0.00000, 330.29001);
	//Puertas empresa privada
	CreateDynamicObject(8378,-1752.3497300,998.9746700,18.6794000,0.0000000,0.0000000,91.0000000); //
	CreateDynamicObject(1682,-1758.8903800,960.1687000,18.3711000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(1682,-1748.9477500,960.1652800,18.3711000,0.0000000,0.0000000,0.0000000); //
		/**************PLAZA LSPD*************/
	tmpobjid = CreateObject(3976, 1571.579101, -1675.743652, 35.681274, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 12, 3979, "civic01_lan", "sl_laglasswall1", 0x00000000);
	SetObjectMaterial(tmpobjid, 13, 13691, "bevcunto2_lahills", "stonewall3_la", 0x00000000);
	tmpobjid = CreateObject(19457, 1535.824340, -1672.709960, 12.302812, 0.000000, 90.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "NO PARKING", 0, 130, "Engravers MT", 75, 0, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjid = CreateObject(19355, 1555.901977, -1675.615356, 18.883323, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "SAPD", 0, 140, "Ariel", 150, 0, 0xFFFFFFFF, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(869, 1546.313110, -1686.470214, 13.289307, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(869, 1546.313110, -1689.569946, 13.289307, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(869, 1546.313110, -1692.940185, 13.289307, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(895, 1546.506103, -1686.655639, 12.266877, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(895, 1546.506103, -1693.565429, 12.266877, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(770, 1546.080566, -1690.325561, 12.824696, 0.000000, 0.000000, 122.099990, 300.00);
	tmpobjid = CreateObject(770, 1546.604003, -1661.217651, 12.824696, 0.000000, 0.000000, 482.099975, 300.00);
	tmpobjid = CreateObject(895, 1546.506103, -1664.935668, 12.266877, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(895, 1546.506103, -1657.585327, 12.266877, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(869, 1546.313110, -1664.459472, 13.289307, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(869, 1546.313110, -1661.509399, 13.289307, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(869, 1546.313110, -1657.899536, 13.289307, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(869, 1546.313110, -1660.269409, 13.289307, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(632, 1546.402709, -1678.732543, 12.992816, 0.000000, 0.000000, 360.000000, 300.00);
	tmpobjid = CreateObject(632, 1546.402709, -1672.411743, 12.992816, 0.000000, 0.000000, 360.000000, 300.00);
	tmpobjid = CreateObject(632, 1552.462890, -1672.471801, 16.102807, 0.000000, 0.000000, 360.000000, 300.00);
	tmpobjid = CreateObject(632, 1552.462890, -1678.773193, 16.102807, 0.000000, 0.000000, 360.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1637.862060, 13.196874, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1640.541870, 13.196874, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1643.301513, 13.196874, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1645.981567, 13.196874, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1648.701416, 13.196874, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1702.051635, 13.216875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1704.691772, 13.216875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1704.691772, 13.216875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1707.421875, 13.216875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1710.201660, 13.216875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(870, 1541.177612, -1713.011474, 13.216875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(970, 1539.565185, -1654.672607, 13.078751, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1652.473632, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(970, 1539.565185, -1662.042236, 13.078751, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1656.884887, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(970, 1539.565185, -1671.202636, 13.078751, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1659.855346, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(970, 1539.565185, -1680.083007, 13.078751, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1664.265747, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(970, 1539.565185, -1688.514892, 13.078751, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1669.026489, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(970, 1539.565185, -1696.523437, 13.078751, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1673.417114, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1677.887451, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1682.299560, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1686.319824, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1690.739868, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1694.318969, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19121, 1539.539062, -1698.749267, 13.056875, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19985, 1535.052978, -1713.062744, 12.516872, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19985, 1524.201660, -1603.729125, 12.456874, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(19978, 1536.095336, -1663.668212, 12.492812, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(3881, 1548.609375, -1620.793579, 14.212810, 0.000000, 0.000000, 90.000000, 300.00);
	//tmpobjid = CreateObject(968, 1544.708496, -1630.835205, 13.012816, 0.000000, 89.299987, 90.000000, 300.00);
	tmpobjid = CreateObject(983, 1544.352172, -1635.921997, 13.056874, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(983, 1544.352172, -1635.921997, 14.326869, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(11245, 1553.334594, -1677.464965, 25.443725, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(11245, 1553.334594, -1673.634765, 25.443725, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(649, 1541.514282, -1703.250732, 12.902812, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(649, 1541.514282, -1712.290893, 12.902812, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(620, 1541.697143, -1707.980102, 12.546875, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(620, 1541.697143, -1642.929931, 12.546875, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(649, 1541.637451, -1647.601196, 13.026876, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(649, 1541.637451, -1638.011108, 13.026876, 0.000000, 0.000000, 180.000000, 300.00);
	//hps
    new DHospitales;
    DHospitales = CreateObject(5708, 1134.2500, -1338.0781, 23.1563, 0.000, 0.000, 0.000, 300.000);
    SetObjectMaterial(DHospitales, 0, 4835, "airoads_las", "grassdry_128HV", 0);
    SetObjectMaterial(DHospitales, 2, 8391, "ballys01", "ballyledge01_128", 0);
    SetObjectMaterial(DHospitales, 3, 8391, "ballys01", "ballyledge01_128", 0);
    SetObjectMaterial(DHospitales, 4, 8391, "ballys01", "ballyledge01_128", 0);
    SetObjectMaterial(DHospitales, 5, 3603, "bevmans01_la", "rooftiles1", 0);
    SetObjectMaterial(DHospitales, 6, 8391, "ballys01", "ballyledge01_128", 0);
    SetObjectMaterial(DHospitales, 8, 6284, "bev_law2", "lasjmposh2", 0);
    SetObjectMaterial(DHospitales, 9, 3603, "bevmans01_la", "rooftiles1", 0);
    SetObjectMaterial(DHospitales, 10, 3603, "bevmans01_la", "rooftiles1", 0);
    CreateDynamicObject(1364, 1181.39099, -1332.33337, 13.08880,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(1364, 1181.39099, -1315.14941, 13.08880,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(2092, 1181.09534, -1317.58838, 12.56840,   0.00000, 0.00000, 121.59390);
    CreateDynamicObject(2092, 1181.46045, -1330.11255, 12.56840,   0.00000, 0.00000, -121.59390);
    new Unity;
	SetObjectMaterial(Unity, 5, 19378, "all_walls", "mp_diner_woodwall", 0);
	SetObjectMaterial(Unity, 2, 19378, "all_walls", "mp_diner_woodwall", 0);
	SetObjectMaterial(Unity, 9, 19378, "all_walls", "mp_diner_woodwall", 0);
	SetObjectMaterial(Unity, 8, 19378, "all_walls", "mp_diner_woodwall", 0);
	Unity = CreateObject(5033, 1745.20313, -1882.85156, 26.14063,   0.00000, 0.00000, 0.00000);
	//ESTACIONAMIENTO INTERIOR 2
	CreateDynamicObject(19313, -540.88000, 2326.52002, 72.31000,   0.00000, 0.00000, 90.00000,6);
	CreateDynamicObject(19313, -540.88000, 2326.52002, 78.96000,   0.00000, 0.00000, 90.00000,6);
	CreateDynamicObject(19313, -540.88000, 2340.58008, 72.31000,   0.00000, 0.00000, 90.00000,6);
	CreateDynamicObject(19313, -540.88000, 2340.58008, 78.96000,   0.00000, 0.00000, 90.00000,6);
	CreateDynamicObject(16083, -546.56000, 2336.44995, 77.03000,   0.00000, 0.00000, 343.60999,6);
	CreateDynamicObject(18673, -546.21002, 2336.45996, 78.42000,   0.00000, 0.00000, 0.00000,6);
	CreateDynamicObject(18673, -546.37000, 2336.30005, 78.42000,   0.00000, 0.00000, 0.00000,6);
	CreateDynamicObject(18673, -546.53003, 2336.45996, 78.42000,   0.00000, 0.00000, 0.00000,6);
	CreateDynamicObject(16337, -548.56000, 2348.02002, 75.52000,   0.00000, 0.00000, 118.51000,6);
	CreateDynamicObject(19313, -547.40002, 2350.09009, 72.31000,   0.00000, 0.00000, 339.87000,6);
	CreateDynamicObject(19313, -547.40002, 2350.09009, 78.96000,   0.00000, 0.00000, 339.87000,6);
	CreateDynamicObject(16318, -559.65997, 2337.90991, 79.22000,   0.00000, 0.00000, 354.45999,6);
	CreateDynamicObject(19382, -566.54999, 2336.28003, 77.49000,   80.44000, 0.00000, 263.20001,6);
	CreateDynamicObject(3350, -555.77002, 2353.07007, 75.63000,   0.00000, 0.00000, 120.00000,6);
	CreateDynamicObject(3276, -568.70001, 2336.33008, 81.55000,   0.00000, 8.90000, -7.28000,6);
	CreateDynamicObject(19382, -571.87000, 2336.92993, 78.37000,   80.44000, 0.00000, 263.20001,6);
	CreateDynamicObject(19313, -563.56000, 2354.19995, 78.96000,   0.00000, 0.00000, 351.51999,6);
	CreateDynamicObject(3276, -580.71997, 2337.71997, 83.41000,   5.02000, 8.00000, -8.02000,6);
	CreateDynamicObject(19382, -582.03998, 2338.16992, 79.87000,   80.44000, 0.00000, 263.20001,6);
	CreateDynamicObject(10032, -1275.28003, 461.26001, 6.20000,   0.00000, 0.00000, 0.00000,6);
	CreateDynamicObject(10843, -1270.55005, 479.95999, 18.26000,   0.00000, 180.00000, 180.00000,6);
	CreateDynamicObject(10843, -1269.72998, 442.45001, 18.26000,   0.00000, 180.00000, 0.00000,6);
	CreateDynamicObject(10843, -1297.96997, 460.89999, 14.27000,   0.00000, 0.00000, 0.00000,6);
	CreateDynamicObject(10843, -1270.54004, 494.12000, 14.27000,   0.00000, 0.00000, 0.00000,6);
	CreateDynamicObject(10843, -1242.53003, 461.47000, 14.27000,   0.00000, 0.00000, 180.00000,6);
	CreateDynamicObject(10843, -1270.54004, 427.63000, 14.27000,   0.00000, 0.00000, 0.00000,6);
	CreateDynamicObject(10834, -1372.68005, 457.81000, 1.17000,   0.00000, 0.00000, 0.00000,6);
	// Interior 43 - Objetos Empresa privada
	CreateObject(14592, 1419.31226, 592.60938, 1006.87689,   0.00000, 0.00000, 90.00000);
	new cobj0 = CreateObject(19003, 1405.479980, 592.429993, 1000.030029, 0.000000, 180.000000, 90.000000);
	SetObjectMaterial(cobj0, 256, 14592, "casinoVault01", "ab_shutter1");
	CreateDynamicObject(1806, 1430.95996, 599.00000, 999.96002,   0.00000, 0.00000, 271.06000);
	CreateDynamicObject(2073, 1429.85999, 597.47998, 1004.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 1430.97998, 596.90002, 999.96002,   0.00000, 0.00000, 267.70001);
	CreateDynamicObject(2008, 1432.45996, 598.82001, 999.96002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2008, 1432.45996, 596.84003, 999.96002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1714, 1433.80005, 599.29999, 999.96002,   0.00000, 0.00000, 276.85001);
	CreateDynamicObject(1714, 1433.81995, 597.02002, 999.96002,   0.00000, 0.00000, 267.91000);
	CreateDynamicObject(1726, 1425.92004, 590.65997, 999.96002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2700, 1434.92004, 597.90002, 1002.88000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2289, 1435.12000, 595.21997, 1002.25000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2073, 1429.85999, 590.46002, 1004.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2141, 1435.89001, 595.66998, 999.25000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 1436.73999, 601.12000, 999.96997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 1436.73999, 601.12000, 1002.44000,   -8.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 1425.80005, 587.50000, 999.96002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1726, 1428.62000, 587.58002, 999.96002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1502, 1435.30005, 591.58002, 999.96002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14638, 1435.28003, 591.58002, 1002.46002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2281, 1429.56006, 587.51001, 1001.96002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2099, 1435.17004, 589.52002, 999.96002,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1726, 1432.57996, 587.58002, 999.96002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1502, 1439.10999, 594.83002, 999.96002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19379, 1440.25000, 599.97498, 999.89001,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(2283, 1440.43005, 598.13000, 1002.08002,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19870, 1408.53003, 601.66998, 1001.21997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(15032, 1443.42004, 599.69000, 1001.71997,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(19899, 1409.01001, 592.17999, 1000.02002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19627, 1409.01001, 592.09003, 1001.28003,   0.00000, 0.00000, 52.39000);
	CreateDynamicObject(19621, 1408.98999, 591.37000, 1001.37000,   0.00000, 0.00000, 332.31000);
	CreateDynamicObject(19921, 1408.79004, 591.84998, 1002.19000,   0.00000, 0.00000, 281.14999);
	CreateDynamicObject(19903, 1409.13000, 589.01001, 1000.02002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2523, 1432.92004, 579.73999, 999.96997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1421, 1414.98999, 581.33002, 1000.71997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11707, 1434.34998, 580.15997, 1001.04999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14638, 1435.28003, 591.58002, 1002.46002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2700, 1434.92004, 597.90002, 1002.88000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2526, 1431.59998, 578.46997, 999.96997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2528, 1432.60999, 578.38000, 999.96997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2525, 1433.41003, 578.28998, 999.96997,   -6.00000, 0.00000, 180.00000);
	CreateDynamicObject(19873, 1433.30005, 578.21002, 1000.52002,   3.00000, 0.00000, 0.00000);
	CreateDynamicObject(1502, 1435.30005, 578.32001, 999.96002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14638, 1435.28003, 578.34003, 1002.46002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3014, 1412.97998, 582.10999, 1000.19000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19171, 1412.33997, 582.35999, 1001.46002,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(3014, 1412.38000, 582.10999, 1000.19000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19169, 1412.33997, 582.35999, 1002.96002,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(2282, 1430.39001, 570.97998, 1001.96002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19170, 1410.83997, 582.35999, 1001.46002,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19168, 1410.83997, 582.35999, 1002.96002,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(11737, 1416.95996, 574.72998, 1002.09998,   90.00000, 0.00000, -90.00000);
	CreateDynamicObject(1721, 1412.38000, 578.19000, 999.96002,   0.00000, 0.00000, 20.00000);
	CreateDynamicObject(1518, 1409.22998, 582.35999, 1000.98999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1721, 1411.38000, 577.77002, 999.96002,   0.00000, 0.00000, 12.00000);
	CreateDynamicObject(1518, 1408.58997, 582.35999, 1000.98999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1502, 1417.12000, 572.29999, 999.96002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14638, 1417.08997, 572.33002, 1002.46002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2181, 1408.09998, 581.94000, 999.96997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 1440.17004, 570.89001, 999.96002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1721, 1410.31995, 577.60999, 999.96002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19870, 1408.53003, 601.66998, 1001.21997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1721, 1409.26001, 577.77002, 999.96002,   0.00000, 0.00000, -12.00000);
	CreateDynamicObject(1721, 1408.21997, 578.19000, 999.96002,   0.00000, 0.00000, -20.00000);
	CreateDynamicObject(19898, 1403.60486, 589.66309, 1000.04999,   0.00000, 0.00000, 293.54010);
	CreateDynamicObject(19450, 1403.15002, 582.51001, 998.28998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19898, 1405.18994, 574.15002, 999.97998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14782, 1398.69995, 591.54999, 1001.03998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(10148, 1403.18994, 608.79498, 1001.96997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19870, 1399.05005, 601.66998, 1001.21997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14450, 1392.68994, 600.88000, 1001.67999,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(16775, 1391.69995, 578.69000, 1003.72998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(925, 1392.53003, 564.71002, 1000.97998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14584, 1386.64001, 565.35999, 1001.71997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1886, 1432.43994, 466.97000, 1011.33002,   15.00000, 0.00000, 142.31000);
	CreateDynamicObject(19873, 2510.32275, 1568.27734, 1087.10352,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19898, 2506.10229, 1597.52026, 1086.72339,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19870, 1408.53003, 601.66998, 1001.21997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19870, 1408.53003, 601.66998, 1001.21997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19870, 1408.53003, 601.66998, 1001.21997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19465, 1438.34998, 594.84003, 1002.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(15032, 1443.42004, 599.69000, 1001.71997,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(1502, 1439.10999, 594.89001, 999.96002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19379, 1440.25000, 599.96002, 999.89001,   0.00000, 90.00000, 90.00000);
	//Hospital SF
	CreateObject(10301, -2718.239990, 616.690002, 1361.599976, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1533, -2737.530029, 625.320007, 1384.380005, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1533, -2737.530029, 623.830017, 1384.380005, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2737.689941, 627.479980, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2773, -2735.129883, 627.440002, 1385.160034, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1533, -2737.530029, 628.039978, 1384.380005, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2739.010010, 622.630005, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3660, -2734.459961, 622.880005, 1386.430054, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1533, -2737.530029, 629.460022, 1384.380005, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19432, -2734.129883, 621.919983, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2773, -2732.510010, 627.440002, 1385.160034, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2739.370117, 632.380005, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2738.989990, 618.150024, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2773, -2729.919922, 627.440002, 1385.160034, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3660, -2734.449951, 632.679993, 1386.430054, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19432, -2734.479980, 633.099976, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2729.389893, 621.530029, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, -2739.189941, 616.900024, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, -2735.030029, 616.900024, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2740.699951, 616.539978, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2773, -2727.399902, 627.440002, 1385.160034, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, -2731.219971, 616.900024, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2729.379883, 618.150024, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2729.570068, 633.309998, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2730.439941, 616.619995, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1846, -2727.860107, 618.979980, 1386.650024, 90.000000, 0.000000, 359.010010, -1, -1);
	CreateDynamicObject(2524, -2728.260010, 617.559998, 1384.640015, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1892, -2725.010010, 624.859985, 1384.650024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1892, -2725.010010, 628.919983, 1384.650024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2380, -2730.310059, 614.729980, 1386.790039, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1808, -2724.370117, 621.409973, 1384.599976, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19389, -2735.899902, 611.809998, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19359, -2724.659912, 619.840027, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1491, -2736.679932, 611.760010, 1384.640015, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2686, -2724.590088, 619.940002, 1386.660034, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(2596, -2733.570068, 612.299988, 1387.760010, 20.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1808, -2730.649902, 612.789978, 1384.640015, 0.000000, 0.000000, 270.000000, -1, -1);
	CreateDynamicObject(19451, -2742.320068, 611.809998, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2712, -2725.010010, 617.070007, 1385.239990, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2796, -2724.659912, 616.669983, 1387.550049, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19389, -2724.659912, 616.469971, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1723, -2731.379883, 611.140015, 1384.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2729.479980, 611.809998, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19389, -2740.699951, 610.140015, 1386.400024, 180.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2690, -2740.770020, 610.059998, 1386.780029, 0.000000, 0.000000, 80.000000, -1, -1);
	CreateDynamicObject(1491, -2724.659912, 615.729980, 1384.650024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2514, -2727.889893, 612.409973, 1384.640015, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1649, -2740.669922, 609.719971, 1386.719971, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19359, -2740.939941, 609.619995, 1386.699951, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2741, -2726.810059, 612.030029, 1385.760010, 0.000000, 0.000000, 184.000000, -1, -1);
	CreateDynamicObject(19359, -2724.659912, 613.299988, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2724.669922, 638.039978, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(932, -2726.459961, 610.760010, 1384.650024, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19432, -2726.020020, 610.929993, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1649, -2735.770020, 606.869995, 1386.750000, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1649, -2735.770020, 606.869995, 1386.750000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19405, -2735.860107, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19389, -2739.070068, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1491, -2739.850098, 606.809998, 1384.640015, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19405, -2732.649902, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19432, -2725.310059, 610.039978, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1523, -2724.689941, 610.000000, 1384.569946, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, -2737.510010, 605.489990, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, -2734.610107, 605.479980, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(932, -2718.050049, 617.929993, 1384.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, -2731.820068, 605.489990, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19359, -2723.139893, 609.979980, 1388.829956, 180.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2190, -2720.689941, 638.729980, 1385.599976, 0.000000, 0.000000, 133.899994, -1, -1);
	CreateDynamicObject(1523, -2721.659912, 610.070007, 1384.569946, 0.000000, 0.000000, -180.000000, -1, -1);
	CreateDynamicObject(19451, -2740.699951, 603.729980, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2558, -2755.030029, 612.500000, 1386.869995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19432, -2724.669922, 643.650024, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2714.949951, 625.859985, 1385.170044, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(10722, -2741.780029, 616.000000, 1405.300049, -90.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2894, -2719.010010, 638.210022, 1385.599976, 0.000000, 0.000000, 148.509995, -1, -1);
	CreateDynamicObject(3657, -2714.949951, 626.590027, 1385.170044, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1808, -2731.459961, 603.869995, 1384.569946, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(3657, -2714.949951, 622.210022, 1385.170044, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1997, -2716.010010, 617.869995, 1384.630005, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3657, -2714.949951, 621.489990, 1385.170044, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(10722, -2741.719971, 635.609985, 1405.310059, -90.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19389, -2723.419922, 643.469971, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3657, -2714.949951, 630.419983, 1385.170044, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2714.949951, 631.150024, 1385.170044, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1723, -2726.919922, 604.830017, 1384.650024, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19451, -2727.280029, 604.219971, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1715, -2719.139893, 640.229980, 1384.650024, 0.000000, 0.000000, 320.369995, -1, -1);
	CreateDynamicObject(2596, -2735.959961, 602.080017, 1387.760010, 20.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2200, -2724.469971, 645.090027, 1384.650024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1997, -2718.919922, 610.390015, 1384.630005, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19451, -2735.820068, 601.770020, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19405, -2721.840088, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2714.090088, 618.409973, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1549, -2713.979980, 618.669983, 1384.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2731.129883, 601.929993, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, -2722.780029, 605.599976, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1649, -2721.040039, 606.849976, 1386.750000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1649, -2721.040039, 606.849976, 1386.750000, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2190, -2715.790039, 637.789978, 1385.599976, 0.000000, 0.000000, 153.570007, -1, -1);
	CreateDynamicObject(19359, -2713.929932, 616.820007, 1386.400024, 0.000000, 0.000000, 4.000000, -1, -1);
	CreateDynamicObject(19451, -2726.659912, 648.539978, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2716.860107, 609.979980, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(932, -2716.500000, 610.419983, 1384.650024, 0.000000, 0.000000, -180.000000, -1, -1);
	CreateDynamicObject(1997, -2714.719971, 613.030029, 1384.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(14855, -2716.429932, 640.369995, 1389.099976, 0.000000, 0.000000, 270.000000, -1, -1);
	CreateDynamicObject(19359, -2713.929932, 613.619995, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19359, -2718.629883, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19432, -2713.050049, 615.030029, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, -2719.909912, 605.609985, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1715, -2715.229980, 639.760010, 1384.650024, 0.000000, 0.000000, 349.920013, -1, -1);
	CreateDynamicObject(1549, -2723.750000, 647.909973, 1384.719971, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1997, -2717.850098, 607.429993, 1384.650024, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(2191, -2717.429932, 642.869995, 1384.609985, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19432, -2712.340088, 615.909973, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2161, -2717.419922, 643.570007, 1384.619995, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19451, -2724.669922, 649.270020, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2723.489990, 602.090027, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2190, -2713.040039, 637.669983, 1385.599976, 0.000000, 0.000000, 153.570007, -1, -1);
	CreateDynamicObject(19451, -2717.010010, 643.469971, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19432, -2713.919922, 611.260010, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2596, -2710.689941, 618.690002, 1387.630005, 24.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19432, -2713.899902, 610.760010, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2710.310059, 618.919983, 1385.170044, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2066, -2720.899902, 647.799988, 1384.640015, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, -2717.280029, 605.599976, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19389, -2715.419922, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3657, -2708.500000, 625.859985, 1385.170044, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2708.500000, 626.559998, 1385.170044, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1549, -2710.899902, 637.070007, 1384.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1715, -2712.370117, 639.969971, 1384.650024, 0.000000, 0.000000, 352.630005, -1, -1);
	CreateDynamicObject(3657, -2708.500000, 622.109985, 1385.170044, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2596, -2710.689941, 636.869995, 1387.630005, 24.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2708.500000, 621.409973, 1385.170044, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, -2710.040039, 615.070007, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2708.500000, 630.390015, 1385.170044, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2708.500000, 631.140015, 1385.170044, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2604, -2718.489990, 647.919983, 1385.459961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2596, -2719.500000, 602.030029, 1387.760010, 20.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19451, -2708.989990, 616.299988, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19359, -2710.610107, 638.570007, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2718.850098, 601.770020, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1491, -2711.219971, 610.030029, 1384.640015, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3384, -2718.260010, 601.859985, 1386.000000, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(3386, -2708.149902, 616.059998, 1384.569946, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2717.040039, 648.539978, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19389, -2710.449951, 609.989990, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1549, -2706.919922, 618.669983, 1384.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1715, -2714.260010, 646.500000, 1384.650024, 0.000000, 0.000000, 124.690002, -1, -1);
	CreateDynamicObject(19389, -2710.610107, 641.780029, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19432, -2706.580078, 632.210022, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1808, -2715.820068, 602.020020, 1384.569946, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1808, -2709.260010, 610.229980, 1384.569946, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19432, -2705.870117, 631.309998, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19432, -2705.870117, 633.080017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, -2706.469971, 615.070007, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1216, -2705.800049, 633.419983, 1385.290039, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1998, -2713.719971, 648.020020, 1384.650024, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19432, -2705.159912, 632.190002, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2596, -2707.939941, 610.340027, 1387.760010, 20.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19451, -2713.979980, 601.929993, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1216, -2704.780029, 632.200012, 1385.290039, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2704.469971, 618.409973, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19405, -2707.239990, 609.989990, 1386.400024, 0.000000, 0.000000, 270.000000, -1, -1);
	CreateDynamicObject(19451, -2709.000000, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3387, -2704.550049, 616.099976, 1384.599976, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2712.159912, 648.340027, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2703.340088, 618.869995, 1385.170044, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2686, -2707.719971, 643.320007, 1386.729980, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1649, -2706.139893, 609.969971, 1385.780029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1649, -2706.139893, 609.969971, 1385.780029, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(1997, -2706.399902, 609.440002, 1384.650024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2707.389893, 643.469971, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(955, -2706.620117, 642.900024, 1385.060059, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, -2702.830078, 615.070007, 1385.000000, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2701.000000, 627.570007, 1385.170044, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19451, -2700.530029, 623.239990, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3383, -2703.379883, 610.909973, 1384.640015, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(10722, -2706.889893, 615.989990, 1405.310059, -90.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2700.530029, 632.859985, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3657, -2701.000000, 635.070007, 1385.170044, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(10722, -2737.790039, 593.419983, 1405.300049, -90.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(10722, -2706.800049, 635.609985, 1405.310059, -90.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3384, -2700.719971, 615.880005, 1385.910034, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3089, -2704.179932, 606.719971, 1385.959961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2699.379883, 616.299988, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19359, -2699.510010, 614.679993, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3089, -2702.679932, 606.719971, 1385.959961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19359, -2702.689941, 606.820007, 1389.060059, 180.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2700.830078, 609.989990, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2705.120117, 602.049988, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2524, -2698.649902, 615.710022, 1384.640015, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2700.530029, 642.460022, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2514, -2697.899902, 613.609985, 1384.640015, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19359, -2697.989990, 613.109985, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1723, -2704.510010, 599.549988, 1384.650024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2741, -2697.239990, 613.289978, 1385.760010, 0.000000, 0.000000, 184.000000, -1, -1);
	CreateDynamicObject(19359, -2699.580078, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1778, -2696.560059, 613.969971, 1384.599976, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19389, -2696.310059, 614.700012, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1491, -2696.310059, 613.960022, 1384.650024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1997, -2694.699951, 619.419983, 1384.650024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19405, -2696.300049, 611.500000, 1386.400024, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19451, -2697.770020, 643.469971, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(932, -2696.000000, 610.989990, 1384.650024, 0.000000, 0.000000, -180.000000, -1, -1);
	CreateDynamicObject(19432, -2697.189941, 606.830017, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3089, -2693.739990, 616.330017, 1385.959961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2693.129883, 619.979980, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19389, -2692.979980, 616.299988, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2702.969971, 595.559998, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19359, -2696.300049, 605.309998, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19405, -2691.679932, 615.070007, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19432, -2696.300049, 602.900024, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(3089, -2696.199951, 602.090027, 1385.959961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19389, -2691.679932, 611.869995, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1808, -2691.500000, 610.280029, 1384.569946, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(3089, -2694.699951, 602.090027, 1385.959961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19389, -2691.679932, 608.669983, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19359, -2694.770020, 602.130005, 1389.060059, 180.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2596, -2689.350098, 616.070007, 1387.750000, 20.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19432, -2691.679932, 606.260010, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2695.669922, 598.609985, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1997, -2692.260010, 604.599976, 1384.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1679, -2689.090088, 613.140015, 1385.119995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19359, -2691.679932, 603.859985, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19432, -2692.409912, 602.190002, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(14384, -2690.399902, 605.940002, 1386.140015, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(10722, -2702.729980, 593.419983, 1405.310059, -90.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2687.010010, 616.400024, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2747, -2688.639893, 609.390015, 1385.260010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2686.580078, 616.299988, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2747, -2686.979980, 609.320007, 1385.260010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2747, -2689.629883, 602.619995, 1385.260010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2747, -2687.219971, 608.159973, 1385.239990, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2747, -2687.239990, 606.479980, 1385.140015, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2687.010010, 606.770020, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2747, -2687.260010, 605.150024, 1385.140015, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2747, -2687.229980, 604.039978, 1385.260010, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2747, -2687.530029, 602.630005, 1385.260010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19451, -2684.719971, 609.849976, 1384.569946, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2686.790039, 602.169983, 1386.400024, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19451, -2687.399902, 597.260010, 1386.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(10722, -2673.379883, 608.349976, 1405.310059, -90.000000, 0.000000, 0.000000, -1, -1);

	//Hospital Ganton - LV
	CreateObject(7996, 1276.479980, -826.630005, 1161.239990, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19176, 1252.380005, -812.229980, 1164.760010, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19445, 1252.550049, -809.880005, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1248.119995, -809.849976, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(14680, 1247.800049, -814.140015, 1165.209961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(630, 1251.699951, -816.849976, 1164.329956, 0.000000, 0.000000, 76.000000, -1, -1);
	CreateDynamicObject(19445, 1252.550049, -809.880005, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(630, 1251.760010, -807.150024, 1164.329956, 0.000000, 0.000000, 76.000000, -1, -1);
	CreateDynamicObject(19379, 1248.140015, -809.849976, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1248.099976, -809.849976, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(1817, 1249.550049, -807.640015, 1163.270020, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1253.959961, -806.570007, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2447, 1249.599976, -807.000000, 1166.989990, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2700, 1250.400024, -818.000000, 1166.040039, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(1723, 1251.939941, -818.520020, 1163.270020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(1723, 1247.530029, -817.039978, 1163.270020, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19445, 1247.640015, -817.630005, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1253.959961, -806.570007, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2272, 1246.500000, -816.989990, 1165.489990, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19445, 1252.550049, -819.500000, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1248.140015, -809.869995, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2448, 1247.180054, -807.000000, 1166.989990, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1723, 1246.439941, -807.159973, 1163.270020, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2700, 1249.900024, -818.000000, 1169.369995, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19445, 1247.640015, -817.630005, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19379, 1248.119995, -819.479980, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(1369, 1246.719971, -818.690002, 1163.880005, 0.000000, 0.000000, -47.000000, -1, -1);
	CreateDynamicObject(2700, 1246.140015, -818.000000, 1166.040039, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19445, 1252.550049, -819.500000, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1248.140015, -819.479980, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1248.099976, -819.479980, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2449, 1244.800049, -807.000000, 1166.989990, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1720, 1242.550049, -811.900024, 1163.280029, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19445, 1244.339966, -806.570007, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2700, 1246.140015, -818.000000, 1169.369995, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(1720, 1242.689941, -808.070007, 1163.280029, 0.000000, 0.000000, -91.000000, -1, -1);
	CreateDynamicObject(1817, 1243.390015, -817.570007, 1163.270020, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1248.140015, -819.500000, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2190, 1241.689941, -811.679993, 1164.060059, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19445, 1244.339966, -806.570007, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2169, 1241.270020, -812.989990, 1163.270020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(2826, 1241.319946, -814.010010, 1164.060059, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2169, 1241.270020, -811.030029, 1163.270020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(14680, 1241.209961, -813.840027, 1165.209961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2196, 1241.069946, -813.549988, 1164.060059, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2169, 1241.290039, -814.789978, 1163.270020, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2196, 1241.060059, -810.349976, 1164.060059, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2169, 1241.270020, -809.090027, 1163.270020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(2190, 1241.609985, -807.890015, 1164.060059, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19383, 1242.910034, -819.309998, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2169, 1241.270020, -807.130005, 1163.270020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(2190, 1240.319946, -815.090027, 1164.060059, 0.000000, 0.000000, 185.000000, -1, -1);
	CreateDynamicObject(2356, 1240.069946, -813.450012, 1163.280029, 0.000000, 0.000000, -156.000000, -1, -1);
	CreateDynamicObject(1523, 1242.939941, -820.059998, 1163.260010, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2356, 1239.890015, -811.390015, 1163.280029, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(14680, 1248.760010, -823.919983, 1165.209961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1523, 1242.939941, -820.059998, 1166.760010, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, 1251.420044, -824.369995, 1163.729980, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19383, 1242.910034, -819.309998, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(6299, 1242.729980, -805.210022, 1169.050049, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1720, 1240.060059, -816.150024, 1163.280029, 0.000000, 0.000000, -170.000000, -1, -1);
	CreateDynamicObject(2603, 1251.359985, -824.369995, 1167.369995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1248.939941, -824.369995, 1163.729980, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2356, 1239.979980, -808.210022, 1163.280029, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(2603, 1248.939941, -824.369995, 1167.369995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2169, 1239.329956, -814.789978, 1163.270020, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(14680, 1249.900024, -824.280029, 1168.699951, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1246.540039, -824.369995, 1163.729980, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2356, 1238.469971, -813.400024, 1163.280029, 0.000000, 0.000000, -178.000000, -1, -1);
	CreateDynamicObject(2190, 1238.630005, -815.000000, 1164.060059, 0.000000, 0.000000, 156.000000, -1, -1);
	CreateDynamicObject(2603, 1246.540039, -824.369995, 1167.369995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1723, 1242.310059, -822.179993, 1163.270020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(1723, 1242.310059, -822.179993, 1167.020020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19445, 1247.640015, -825.789978, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, 1244.400024, -824.369995, 1163.729980, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1237.619995, -809.849976, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1237.640015, -809.849976, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1244.319946, -824.369995, 1167.369995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1237.640015, -809.869995, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1247.640015, -825.789978, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, 1250.800049, -827.090027, 1163.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2069, 1237.750000, -807.080017, 1163.319946, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2174, 1236.790039, -811.150024, 1163.280029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, 1250.800049, -827.090027, 1167.369995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1248.560059, -827.090027, 1163.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2277, 1236.800049, -809.820007, 1165.469971, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, 1248.560059, -827.090027, 1167.369995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1237.640015, -809.869995, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2202, 1236.760010, -808.020020, 1163.280029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1236.199951, -809.390015, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1246.180054, -827.090027, 1163.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1237.640015, -819.479980, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(1649, 1236.199951, -815.789978, 1164.459961, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(1649, 1236.199951, -815.789978, 1164.459961, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19399, 1236.199951, -815.789978, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1237.640015, -819.479980, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1237.640015, -819.500000, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1246.180054, -827.090027, 1167.369995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1242.910034, -825.729980, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1723, 1235.609985, -812.469971, 1163.270020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(2826, 1242.420044, -825.690002, 1163.760010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1817, 1242.930054, -826.130005, 1163.270020, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1242.910034, -825.729980, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1817, 1242.930054, -826.130005, 1167.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2603, 1244.079956, -827.090027, 1163.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1523, 1236.170044, -818.200012, 1163.260010, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(14680, 1235.089966, -813.520020, 1165.209961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1252.550049, -829.119995, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1244.079956, -827.090027, 1167.369995, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1237.640015, -819.500000, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19383, 1236.199951, -818.989990, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1369, 1237.130005, -821.239990, 1163.880005, 0.000000, 0.000000, 20.780001, -1, -1);
	CreateDynamicObject(19379, 1248.119995, -829.109985, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1252.550049, -829.119995, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(14680, 1235.680054, -816.869995, 1168.699951, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1248.099976, -829.109985, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1248.140015, -829.130005, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1234.819946, -807.979980, 1163.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1723, 1242.310059, -827.080017, 1163.270020, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(1723, 1242.310059, -827.080017, 1166.979980, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(14680, 1235.119995, -818.520020, 1165.209961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1234.719971, -806.570007, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19380, 1248.140015, -829.130005, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1234.719971, -806.570007, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1649, 1236.199951, -822.130005, 1164.459961, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1649, 1236.199951, -822.130005, 1164.459961, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(19399, 1236.199951, -822.369995, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2748, 1232.880005, -812.419983, 1167.609985, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2747, 1232.859985, -810.119995, 1167.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2747, 1232.859985, -814.219971, 1167.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2146, 1232.780029, -816.030029, 1163.760010, 0.000000, 0.000000, 55.000000, -1, -1);
	CreateDynamicObject(2603, 1232.819946, -807.940002, 1163.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2748, 1232.880005, -808.260010, 1167.609985, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2748, 1232.880005, -816.500000, 1167.609985, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2700, 1233.660034, -820.280029, 1166.040039, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(14680, 1248.849976, -832.080017, 1165.209961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1523, 1236.170044, -824.780029, 1163.260010, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(2747, 1232.859985, -818.219971, 1167.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19383, 1236.199951, -825.570007, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(14680, 1250.140015, -832.429993, 1168.699951, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2146, 1247.589966, -832.500000, 1163.760010, 0.000000, 0.000000, 75.000000, -1, -1);
	CreateDynamicObject(2748, 1232.880005, -820.140015, 1167.609985, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2146, 1247.589966, -832.500000, 1167.469971, 0.000000, 0.000000, -76.000000, -1, -1);
	CreateDynamicObject(2603, 1230.689941, -813.200012, 1163.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1720, 1233.300049, -822.500000, 1163.280029, 0.000000, 0.000000, -180.000000, -1, -1);
	CreateDynamicObject(2573, 1232.650024, -821.260010, 1163.270020, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(14680, 1235.680054, -825.429993, 1168.699951, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2272, 1230.579956, -813.530029, 1165.449951, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2700, 1250.369995, -833.479980, 1166.040039, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2747, 1232.859985, -821.820007, 1167.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1230.709961, -807.929993, 1163.650024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19383, 1242.910034, -832.150024, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2700, 1250.369995, -833.479980, 1169.469971, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1229.979980, -811.479980, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2146, 1236.949951, -828.380005, 1163.760010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1247.640015, -833.849976, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1231.469971, -820.679993, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19379, 1237.640015, -829.109985, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1237.640015, -829.109985, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19383, 1242.910034, -832.150024, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1237.640015, -829.130005, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1229.979980, -811.479980, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2603, 1230.699951, -819.320007, 1163.729980, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2748, 1232.880005, -823.580017, 1167.609985, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2700, 1245.050049, -833.479980, 1166.040039, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1247.640015, -833.849976, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2700, 1246.589966, -833.479980, 1169.469971, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1523, 1242.939941, -832.900024, 1163.260010, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1523, 1242.939941, -832.900024, 1166.760010, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1649, 1236.199951, -828.770020, 1164.459961, 0.000000, 0.000000, -90.000000, -1, -1);
	CreateDynamicObject(1649, 1236.199951, -828.770020, 1164.459961, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19399, 1236.199951, -828.770020, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1237.640015, -829.130005, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(14680, 1235.910034, -828.960022, 1165.209961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2146, 1231.000000, -822.440002, 1163.760010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2747, 1232.859985, -825.260010, 1167.400024, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1229.979980, -821.099976, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(1369, 1233.630005, -827.330017, 1163.880005, 0.000000, 0.000000, 20.780001, -1, -1);
	CreateDynamicObject(19445, 1229.979980, -821.099976, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19426, 1242.900024, -834.710022, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2146, 1231.989990, -826.080017, 1163.760010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(630, 1242.380005, -834.789978, 1164.329956, 0.000000, 0.000000, 76.000000, -1, -1);
	CreateDynamicObject(2146, 1231.050049, -825.150024, 1163.760010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19426, 1242.900024, -834.710022, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1244.010010, -835.590027, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(630, 1242.380005, -834.789978, 1168.010010, 0.000000, 0.000000, 76.000000, -1, -1);
	CreateDynamicObject(19445, 1244.010010, -835.590027, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(1723, 1241.410034, -835.000000, 1163.270020, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(2380, 1234.469971, -830.289978, 1164.880005, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19379, 1227.140015, -816.659973, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(1723, 1241.410034, -835.000000, 1166.969971, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19377, 1227.140015, -816.659973, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1227.140015, -816.659973, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1227.140015, -807.020020, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1227.140015, -807.020020, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19383, 1236.199951, -832.150024, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1227.140015, -807.020020, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1227.140015, -816.659973, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1227.140015, -807.020020, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(1491, 1236.219971, -832.900024, 1163.280029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2527, 1234.719971, -832.000000, 1163.300049, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2146, 1230.900024, -828.000000, 1163.760010, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19353, 1231.479980, -828.239990, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2146, 1230.900024, -828.049988, 1164.739990, 0.000000, -180.000000, 0.000000, -1, -1);
	CreateDynamicObject(630, 1230.650024, -827.609985, 1168.010010, 0.000000, 0.000000, 76.000000, -1, -1);
	CreateDynamicObject(19426, 1232.290039, -830.460022, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(2063, 1231.469971, -830.039978, 1164.119995, 0.000000, 0.000000, -180.000000, -1, -1);
	CreateDynamicObject(19426, 1235.489990, -833.849976, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(14680, 1236.369995, -834.669983, 1165.209961, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2526, 1232.119995, -831.049988, 1163.300049, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19445, 1231.469971, -830.460022, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(630, 1233.959961, -832.750000, 1168.010010, 0.000000, 0.000000, 76.000000, -1, -1);
	CreateDynamicObject(19353, 1233.010010, -832.150024, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(2524, 1233.569946, -833.250000, 1163.300049, 0.000000, 0.000000, 180.000000, -1, -1);
	CreateDynamicObject(19435, 1232.380005, -832.159973, 1166.849976, 0.000000, 90.000000, 90.000000, -1, -1);
	CreateDynamicObject(2525, 1232.150024, -832.630005, 1163.300049, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19353, 1231.579956, -832.150024, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1227.140015, -826.299988, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2399, 1234.229980, -834.169983, 1169.079956, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1227.140015, -826.299988, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1227.140015, -826.299988, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19353, 1233.089966, -833.849976, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1229.979980, -830.719971, 1165.030029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19353, 1231.579956, -832.150024, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19353, 1233.089966, -833.849976, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1229.979980, -830.719971, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1227.140015, -826.299988, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(2145, 1232.859985, -834.159973, 1167.000000, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1234.380005, -835.590027, 1165.030029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19445, 1234.380005, -835.590027, 1168.530029, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(14395, 1231.760010, -834.090027, 1164.780029, 0.000000, 0.000000, 91.000000, -1, -1);
	CreateDynamicObject(2145, 1232.880005, -835.000000, 1167.000000, 0.000000, 0.000000, 90.000000, -1, -1);
	CreateDynamicObject(19426, 1232.439941, -834.710022, 1168.530029, 0.000000, 0.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1237.640015, -838.739990, 1163.189941, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19377, 1237.619995, -838.750000, 1166.849976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19379, 1237.619995, -838.750000, 1166.910034, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1237.619995, -838.750000, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1231.020020, -835.210022, 1163.209961, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(19380, 1227.140015, -835.890015, 1170.349976, 0.000000, 90.000000, 0.000000, -1, -1);
	CreateDynamicObject(1567, 1271.099976, -821.590027, 1088.780029, 0.000000, 0.000000, 270.000000, -1, -1);
	CreateDynamicObject(2141, 1274.699951, -823.179993, 1084.630005, 0.000000, 0.000000, 90.000000, -1, -1);

	//ESTACIONAMIENTO CAMIONERO
	CreateDynamicObject(8948, 2058.68994, 2437.64990, 11.58000,   0.00000, 0.00000, 90.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 9.96000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 14.24000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 18.56000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 22.84000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(6873, 2053.02002, 2403.21997, 9.82000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 27.16000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 31.46000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 35.74000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 40.06000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 44.34000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(3448, 2082.19995, 2417.37988, 48.66000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(6971, 2098.87012, 2402.58008, 9.83000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 11.15000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 15.45000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 19.75000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 24.05000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19552, 2111.54004, 2437.66992, 49.44000,   90.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 28.35000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(6972, 2053.62988, 2374.30005, 30.75000,   0.00000, 0.00000, 180.00000, 4);
	CreateDynamicObject(6972, 2116.37988, 2409.83008, 30.75000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 32.65000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 36.95000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 41.25000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 45.55000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19305, 2117.87988, 2414.71997, 49.85000,   0.00000, 0.00000, 190.00000, 4);
	CreateDynamicObject(19552, 2116.96997, 2489.23999, 49.44000,   90.00000, 0.00000, 90.00000, 4);
	CreateDynamicObject(6972, 2116.83008, 2374.30005, 30.75000,   0.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(19552, 2103.80005, 2367.11011, 49.44000,   90.00000, 0.00000, 0.00000, 4);
	CreateDynamicObject(19552, 2116.96997, 2345.83008, 49.44000,   90.00000, 0.00000, 90.00000, 4);


	//Salon de eventos
	CreateObject(13657, -1252.810059, 2055.300049, 1248.780029, 0.000000, 0.000000, 0.000000, 0.0); // 0
	CreateDynamicObject(630, -1275.770020, 2110.540039, 1246.569946, 0.000000, 0.000000, 76.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1275.660034, 2107.110107, 1246.569946, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1557, -1276.109985, 2110.250000, 1245.540039, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1557, -1276.109985, 2107.229980, 1245.540039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1270.869995, 2112.800049, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1275.819946, 2101.649902, 1246.569946, 0.000000, 0.000000, 236.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1270.869995, 2103.169922, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1267.420044, 2111.699951, 1246.180054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1267.640015, 2104.899902, 1246.180054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1266.319946, 2110.510010, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1266.550049, 2106.219971, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1266.329956, 2111.790039, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1266.209961, 2111.530029, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1266.469971, 2104.939941, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2667, -1266.729980, 2104.550049, 1248.369995, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1266.359985, 2112.770020, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1266.329956, 2104.919922, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1266.790039, 2103.540039, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, -1275.619995, 2098.580078, 1245.550049, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1265.089966, 2111.520020, 1246.180054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1265.229980, 2104.750000, 1246.180054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1275.530029, 2097.330078, 1246.569946, 0.000000, 0.000000, 236.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, -1272.569946, 2097.280029, 1245.550049, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2259, -1270.949951, 2097.290039, 1247.439941, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1500, -1273.750000, 2121.290039, 1245.540039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1272.109985, 2096.679932, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1817, -1271.290039, 2096.729980, 1245.530029, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1269.010010, 2120.360107, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19387, -1273.739990, 2122.040039, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1262.609985, 2105.100098, 1246.180054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1261.800049, 2111.620117, 1246.180054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2645, -1267.099976, 2120.250000, 1247.300049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1261.420044, 2111.070068, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1261.250000, 2111.469971, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1261.239990, 2111.520020, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, -1266.849976, 2097.280029, 1245.550049, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1270.869995, 2122.429932, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1261.150024, 2106.350098, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1261.160034, 2112.120117, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1261.130005, 2105.060059, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1261.140015, 2105.040039, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1266.030029, 2097.320068, 1246.569946, 0.000000, 0.000000, 236.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1260.680054, 2111.510010, 1246.180054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1261.339966, 2103.669922, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2646, -1265.239990, 2120.219971, 1247.380005, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1264.489990, 2119.729980, 1246.569946, 0.000000, 0.000000, 236.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19387, -1267.180054, 2122.050049, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2671, -1261.680054, 2116.070068, 1245.560059, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1260.390015, 2112.800049, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1259.939941, 2104.870117, 1246.180054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2306, -1268.770020, 2123.479980, 1245.540039, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1270.869995, 2093.570068, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1260.390015, 2103.169922, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2667, -1259.319946, 2114.840088, 1248.369995, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2422, -1262.800049, 2120.800049, 1246.430054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1275.829956, 2126.260010, 1246.569946, 0.000000, 0.000000, 236.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2665, -1262.439941, 2120.310059, 1248.469971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(18766, -1262.800049, 2120.800049, 1243.930054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2667, -1258.300049, 2104.719971, 1248.369995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1262.489990, 2096.679932, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2453, -1262.089966, 2120.689941, 1246.770020, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, -1264.060059, 2122.639893, 1245.540039, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2524, -1267.770020, 2125.560059, 1245.540039, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1278.540039, 2127.080078, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1257.160034, 2111.479980, 1246.180054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19325, -1261.329956, 2120.370117, 1249.900024, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1257.270020, 2105.209961, 1246.180054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2063, -1270.189941, 2126.699951, 1246.449951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1268.859985, 2127.080078, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1273.739990, 2128.459961, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1255.819946, 2110.100098, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2262, -1259.530029, 2097.290039, 1247.319946, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1255.900024, 2106.459961, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2422, -1259.719971, 2120.800049, 1246.430054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2665, -1259.439941, 2120.310059, 1248.469971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1255.829956, 2111.389893, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1255.939941, 2105.060059, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1255.709961, 2111.429932, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1255.829956, 2104.969971, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1260.099976, 2096.010010, 1246.670044, 0.000000, 0.000000, 236.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1255.760010, 2112.750000, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1255.949951, 2103.780029, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2419, -1265.040039, 2126.330078, 1245.540039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1260.390015, 2122.429932, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2453, -1258.390015, 2120.689941, 1246.770020, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1254.380005, 2111.370117, 1246.180054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1267.180054, 2128.459961, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, -1259.209961, 2122.580078, 1245.540039, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1254.500000, 2104.969971, 1246.180054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2417, -1263.130005, 2126.560059, 1245.540039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1260.390015, 2093.570068, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2688, -1263.199951, 2126.860107, 1247.489990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, -1256.839966, 2120.340088, 1245.520020, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2451, -1262.119995, 2126.320068, 1245.540039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1257.030029, 2096.739990, 1246.890015, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1257.030029, 2096.580078, 1246.890015, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1253.890015, 2114.770020, 1246.069946, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, -1260.060059, 2092.439941, 1245.630005, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19387, -1256.050049, 2120.360107, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1260.640015, 2091.810059, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2718, -1261.630005, 2126.719971, 1248.069946, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1500, -1254.719971, 2117.949951, 1245.520020, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2671, -1252.849976, 2107.590088, 1245.560059, 0.000000, 0.000000, 62.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, -1260.530029, 2091.790039, 1245.550049, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2524, -1257.130005, 2122.500000, 1245.540039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19387, -1256.069946, 2096.679932, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19388, -1254.719971, 2118.709961, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2417, -1260.209961, 2126.560059, 1245.540039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2115, -1253.560059, 2117.540039, 1245.979980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2115, -1253.560059, 2117.639893, 1245.239990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2419, -1259.229980, 2126.320068, 1245.540039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19404, -1253.040039, 2117.199951, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1257.729980, 2125.080078, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2524, -1257.130005, 2124.479980, 1245.540039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, -1252.800049, 2117.250000, 1246.760010, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1251.969971, 2114.770020, 1246.069946, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, -1253.469971, 2119.080078, 1245.540039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1251.239990, 2111.479980, 1246.180054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1259.239990, 2127.080078, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1251.229980, 2104.989990, 1246.180054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1817, -1259.479980, 2090.260010, 1245.630005, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, -1252.849976, 2119.300049, 1245.540039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14684, -1255.880005, 2124.669922, 1247.630005, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2002, -1253.739990, 2096.090088, 1245.640015, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2115, -1251.790039, 2118.229980, 1245.239990, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2115, -1251.689941, 2118.229980, 1245.939941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1249.819946, 2110.100098, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1250.060059, 2105.090088, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1249.910034, 2111.389893, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1249.819946, 2106.260010, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2683, -1249.959961, 2104.879883, 1246.510010, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1249.900024, 2104.919922, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(13657, -1252.819946, 2099.149902, 1254.630005, 0.000000, 180.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1249.829956, 2112.729980, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1249.890015, 2112.800049, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19404, -1251.359985, 2118.709961, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1251.030029, 2117.870117, 1246.050049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2667, -1249.469971, 2107.719971, 1248.369995, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, -1251.469971, 2119.120117, 1246.739990, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1250.040039, 2114.770020, 1246.030029, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1249.900024, 2103.610107, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1249.890015, 2103.169922, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, -1260.040039, 2086.939941, 1245.630005, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1248.619995, 2111.370117, 1246.180054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2267, -1251.530029, 2096.489990, 1247.839966, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1248.609985, 2105.030029, 1246.180054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1249.109985, 2115.729980, 1246.069946, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1250.050049, 2118.830078, 1246.069946, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2667, -1247.709961, 2111.320068, 1248.369995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1249.640015, 2120.360107, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1248.130005, 2116.689941, 1246.030029, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1249.650024, 2096.679932, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1260.160034, 2084.669922, 1246.670044, 0.000000, 0.000000, 236.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1249.890015, 2122.429932, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1248.130005, 2118.830078, 1246.030029, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1252.250000, 2126.860107, 1245.459961, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1249.890015, 2093.570068, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2683, -1245.530029, 2111.320068, 1246.510010, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1245.369995, 2110.100098, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1245.410034, 2111.389893, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1245.380005, 2106.229980, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1246.209961, 2116.689941, 1246.069946, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1245.280029, 2111.439941, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1245.410034, 2104.949951, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1245.410034, 2104.929932, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1245.380005, 2112.729980, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1817, -1257.540039, 2084.229980, 1245.630005, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, -1248.260010, 2095.050049, 1245.630005, 0.000000, 0.000000, -98.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1260.640015, 2082.189941, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1245.369995, 2103.620117, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, -1247.819946, 2121.969971, 1245.880005, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, -1260.550049, 2082.149902, 1245.550049, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1257.849976, 2083.939941, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, -1250.050049, 2091.790039, 1245.550049, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.790039, 2108.239990, 1246.689941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.739990, 2108.189941, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2009, -1248.479980, 2094.169922, 1245.619995, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.790039, 2111.419922, 1246.689941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.739990, 2111.370117, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2667, -1246.170044, 2099.239990, 1248.369995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2009, -1249.489990, 2092.199951, 1245.619995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.579956, 2108.189941, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, -1246.209961, 2118.830078, 1246.069946, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.790039, 2105.000000, 1246.689941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.510010, 2108.239990, 1246.689941, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.739990, 2104.979980, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.579956, 2111.370117, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.510010, 2111.419922, 1246.689941, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.579956, 2104.979980, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2596, -1245.150024, 2115.889893, 1248.500000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.790039, 2114.500000, 1246.689941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19430, -1247.189941, 2122.040039, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.510010, 2105.000000, 1246.689941, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.739990, 2114.570068, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, -1247.819946, 2123.649902, 1245.880005, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.579956, 2114.570068, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1245.390015, 2099.709961, 1246.180054, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.510010, 2114.500000, 1246.689941, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.790039, 2101.860107, 1246.689941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.739990, 2101.770020, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1249.619995, 2127.080078, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1244.800049, 2116.830078, 1246.829956, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.579956, 2101.770020, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.510010, 2101.860107, 1246.689941, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -1245.420044, 2098.530029, 1245.949951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2682, -1245.420044, 2098.489990, 1246.550049, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19430, -1247.189941, 2123.719971, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1244.520020, 2116.830078, 1246.829956, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, -1248.579956, 2091.600098, 1245.630005, 0.000000, 0.000000, 171.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19387, -1244.739990, 2117.760010, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1245.359985, 2119.709961, 1246.569946, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19387, -1244.579956, 2117.760010, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, -1247.819946, 2125.330078, 1245.880005, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, -1246.380005, 2095.070068, 1245.630005, 0.000000, 0.000000, -98.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1245.380005, 2097.290039, 1246.180054, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.790039, 2098.659912, 1246.689941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.739990, 2098.570068, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, -1253.540039, 2085.010010, 1245.630005, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2009, -1246.520020, 2094.169922, 1245.619995, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19403, -1244.579956, 2098.570068, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2009, -1247.510010, 2092.199951, 1245.619995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2525, -1245.329956, 2121.250000, 1245.540039, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, -1244.510010, 2098.659912, 1246.689941, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19430, -1245.630005, 2122.040039, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19430, -1247.189941, 2125.399902, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, -1247.819946, 2127.010010, 1245.880005, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2525, -1245.329956, 2122.790039, 1245.540039, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19430, -1245.630005, 2123.719971, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, -1246.449951, 2091.590088, 1245.630005, 0.000000, 0.000000, 185.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2525, -1245.329956, 2124.310059, 1245.540039, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19430, -1245.630005, 2125.399902, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1244.739990, 2124.179932, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2525, -1245.329956, 2126.250000, 1245.540039, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1244.739990, 2092.159912, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19449, -1244.579956, 2092.159912, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2296, -1249.400024, 2084.510010, 1245.640015, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, -1250.050049, 2082.149902, 1245.550049, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, -1245.390015, 2087.120117, 1246.670044, 0.000000, 0.000000, 236.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1247.369995, 2083.939941, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19388, -1243.689941, 2087.770020, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19387, -1244.729980, 2085.739990, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1242.760010, 2087.840088, 1246.829956, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1242.760010, 2087.840088, 1246.829956, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1242.760010, 2087.679932, 1246.829956, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1244.780029, 2084.820068, 1246.890015, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1244.680054, 2084.820068, 1246.890015, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(982, -1245.410034, 2080.199951, 1250.369995, 180.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1237.400024, 2087.770020, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1237.170044, 2083.939941, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(4106, -1254.989990, 2065.469971, 1252.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1232.569946, 2083.040039, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19404, -1232.569946, 2076.620117, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(984, -1232.599976, 2073.800049, 1250.369995, 180.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1237.170044, 2067.760010, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1232.569946, 2070.219971, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1498, -1236.439941, 2063.689941, 1253.839966, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19404, -1232.569946, 2063.800049, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1237.170044, 2058.129883, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(984, -1231.439941, 2063.469971, 1254.479980, 180.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1232.569946, 2057.399902, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1214.260010, 2093.919922, 1223.329956, 180.000000, 0.000000, 229.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1225.069946, 2063.760010, 1253.810059, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3819, -1210.989990, 2099.100098, 1226.520020, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(982, -1232.619995, 2052.790039, 1250.369995, 180.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1225.199951, 2063.469971, 1268.040039, 0.000000, 0.000000, -25.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1214.229980, 2080.510010, 1223.329956, 180.000000, 0.000000, 316.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(4106, -1234.550049, 2050.280029, 1248.209961, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1237.170044, 2048.550049, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2671, -1213.939941, 2072.280029, 1245.560059, 0.000000, 0.000000, 11.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19404, -1232.560059, 2050.989990, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1347, -1213.089966, 2071.739990, 1245.900024, 90.000000, 0.000000, -91.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3819, -1210.989990, 2075.889893, 1226.520020, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3819, -1202.369995, 2099.100098, 1226.520020, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(982, -1212.189941, 2065.459961, 1254.479980, 180.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1232.569946, 2044.640015, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1237.170044, 2038.949951, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1199.359985, 2093.899902, 1223.329956, 180.000000, 0.000000, 141.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3819, -1202.369995, 2075.889893, 1226.520020, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1199.229980, 2080.560059, 1223.329956, 0.000000, 180.000000, 222.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3819, -1195.040039, 2091.729980, 1226.520020, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1232.569946, 2035.060059, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(984, -1232.630005, 2033.599976, 1250.410034, 180.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3819, -1195.040039, 2083.110107, 1226.520020, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1237.170044, 2029.369995, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1347, -1232.119995, 2030.689941, 1246.099976, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(983, -1199.430054, 2062.239990, 1254.439941, 180.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(4106, -1195.010010, 2067.459961, 1252.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19388, -1232.569946, 2028.660034, 1247.290039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1498, -1234.319946, 2027.229980, 1249.729980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1347, -1201.109985, 2055.199951, 1245.900024, 90.000000, 0.000000, 62.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1232.619995, 2027.680054, 1246.890015, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, -1232.520020, 2027.680054, 1246.890015, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1227.709961, 2030.219971, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2671, -1199.890015, 2054.739990, 1245.560059, 0.000000, 0.000000, 62.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1199.349976, 2059.110107, 1267.979980, 0.000000, 0.000000, -25.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(983, -1196.250000, 2059.739990, 1253.819946, 180.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2671, -1186.199951, 2080.209961, 1245.560059, 0.000000, 0.000000, 127.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2808, -1194.660034, 2061.750000, 1254.469971, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(983, -1196.219971, 2059.050049, 1254.439941, 180.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3055, -1192.877319, 2063.196045, 1253.849976, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16644, -1191.859985, 2064.530029, 1253.829956, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14391, -1192.575684, 2063.058594, 1254.780029, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(10766, -1304.910034, 2021.489990, 1269.750000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2808, -1192.489990, 2061.750000, 1254.469971, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16644, -1191.859985, 2061.929932, 1253.829956, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(10766, -1273.469971, 2017.130005, 1276.880005, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1226.660034, 2025.500000, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1218.089966, 2030.219971, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2808, -1190.319946, 2061.750000, 1254.469971, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(984, -1188.359985, 2059.699951, 1253.819946, 180.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(984, -1188.359985, 2059.070068, 1254.479980, 180.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19404, -1211.680054, 2030.219971, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1216.180054, 2025.500000, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1198.540039, 2037.839966, 1246.140015, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(983, -1181.930054, 2062.250000, 1254.439941, 180.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(987, -1175.520020, 2077.159912, 1245.560059, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11392, -1170.380005, 2107.209961, 1245.560059, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, -1205.290039, 2030.219971, 1247.290039, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1197.660034, 2037.219971, 1245.430054, 0.000000, 0.000000, 179.479996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1197.219971, 2037.150024, 1247.949951, 0.000000, 0.000000, -197.869995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1197.219971, 2037.150024, 1249.150024, 0.000000, 0.000000, -197.869995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1197.219971, 2037.150024, 1250.329956, 0.000000, 0.000000, -197.869995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1196.459961, 2037.010010, 1247.949951, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1196.459961, 2037.010010, 1249.150024, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1196.459961, 2037.010010, 1250.329956, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3399, -1204.380005, 2029.010010, 1244.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1199.390015, 2033.739990, 1248.150024, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1199.390015, 2033.739990, 1251.229980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1195.510010, 2037.410034, 1248.150024, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1181.930054, 2059.179932, 1267.979980, 0.000000, 0.000000, -25.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1199.390015, 2031.939941, 1248.150024, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1347, -1176.239990, 2065.340088, 1246.099976, 0.000000, 0.000000, -76.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1200.550049, 2030.760010, 1253.430054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(8615, -1173.479980, 2071.669922, 1248.069946, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, -1205.719971, 2025.500000, 1249.130005, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1199.979980, 2030.400024, 1246.140015, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1199.979980, 2030.400024, 1247.319946, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1199.979980, 2030.400024, 1248.500000, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(987, -1175.689941, 2065.209961, 1245.560059, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1199.979980, 2030.400024, 1249.640015, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1199.390015, 2030.739990, 1251.229980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(984, -1175.510010, 2065.489990, 1254.479980, 180.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1192.750000, 2037.410034, 1248.150024, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1200.550049, 2028.560059, 1251.229980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1200.550049, 2028.560059, 1253.430054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(5779, -1166.489990, 2127.219971, 1247.099976, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16089, -1191.780029, 2036.709961, 1247.219971, 180.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16089, -1191.780029, 2036.709961, 1248.400024, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19348, -1191.920044, 2036.239990, 1247.109985, 0.000000, 4.000000, -84.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3498, -1191.910034, 2036.180054, 1243.479980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19348, -1191.949951, 2035.839966, 1248.839966, 180.000000, 25.000000, 84.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16089, -1191.989990, 2035.500000, 1255.819946, 0.000000, -90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3872, -1191.810059, 2034.869995, 1251.280029, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1189.209961, 2037.410034, 1248.150024, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(18765, -1194.369995, 2030.910034, 1244.819946, 0.000000, 0.000000, 359.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 18765, "matcolours", "black", 0xFF000000);
	fso_map = CreateDynamicObject(18765, -1192.719971, 2032.489990, 1244.839966, 0.000000, 0.000000, 359.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 18765, "matcolours", "black", 0xFF000000);
	CreateDynamicObject(2671, -1181.650024, 2046.369995, 1245.560059, 0.000000, 0.000000, 127.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3273, -1168.500000, 2072.889893, 1245.530029, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14434, -1197.920044, 2027.150024, 1254.689941, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1187.140015, 2037.010010, 1247.949951, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1187.140015, 2037.010010, 1249.150024, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1187.140015, 2037.010010, 1250.329956, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(18765, -1190.880005, 2032.510010, 1244.859985, 0.000000, 0.000000, 359.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 18765, "matcolours", "black", 0xFF000000);
	CreateDynamicObject(3273, -1168.500000, 2068.750000, 1245.530029, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1186.380005, 2037.150024, 1247.949951, 0.000000, 0.000000, 197.869995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1186.380005, 2037.150024, 1249.150024, 0.000000, 0.000000, 197.869995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1186.380005, 2037.150024, 1250.329956, 0.000000, 0.000000, 197.869995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1186.020020, 2037.229980, 1245.430054, 0.000000, 0.000000, 179.479996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1185.040039, 2037.829956, 1246.140015, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(18765, -1189.500000, 2030.900024, 1244.800049, 0.000000, 0.000000, 359.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 0, 18765, "matcolours", "black", 0xFF000000);
	CreateDynamicObject(987, -1163.589966, 2077.010010, 1245.560059, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1190.280029, 2027.880005, 1248.000000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1184.550049, 2033.900024, 1248.150024, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1189.579956, 2027.880005, 1248.000000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1188.880005, 2027.880005, 1248.000000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1188.180054, 2027.880005, 1248.000000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1165.180054, 2069.189941, 1267.979980, 0.000000, 0.000000, -25.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1184.550049, 2031.180054, 1248.150024, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1187.459961, 2027.880005, 1248.000000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(987, -1163.800049, 2065.070068, 1245.560059, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, -1186.699951, 2027.880005, 1248.000000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3398, -1165.229980, 2065.669922, 1267.979980, 0.000000, 0.000000, -25.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(7905, -1192.079956, 2021.930054, 1251.729980, 0.000000, 0.000000, 21.270000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1183.989990, 2030.150024, 1246.140015, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1183.979980, 2030.150024, 1247.319946, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1183.979980, 2030.150024, 1248.500000, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2232, -1183.979980, 2030.150024, 1249.640015, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19374, -1184.550049, 2028.660034, 1248.150024, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(10766, -1265.250000, 1972.280029, 1269.750000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0

	// Marihuana
	CreateDynamicObject(19468, -1111.93994, -1624.77002, 75.50000,   0.00000, 10.00000, 10.20000);
	CreateDynamicObject(19468, -1111.63000, -1624.37000, 75.52000,   0.00000, 90.00000, 62.44000);
	CreateDynamicObject(19468, -1112.01001, -1624.37000, 75.48000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, -1117.32996, -1624.92004, 78.82000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2060, -1104.66003, -1620.97998, 75.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2060, -1103.90002, -1620.71997, 75.76000,   0.00000, 70.00000, 358.10001);
	CreateDynamicObject(2060, -1104.58997, -1620.72998, 75.76000,   0.00000, 0.00000, 358.10001);
	CreateDynamicObject(2060, -1104.68994, -1620.41003, 75.50000,   0.00000, 0.00000, 13.84000);

	// Exterior Salon de eventos
	CreateDynamicObject(1215, 1414.73999, -1235.19995, 13.07000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1406.47998, -1235.19995, 13.07000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1397.50000, -1168.02002, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1398.93994, -1165.78003, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1400.21997, -1163.71997, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1401.57996, -1161.66003, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1388.96997, -1168.02002, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1388.96997, -1161.76001, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1389.62000, -1158.83997, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16760, 1472.81006, -1018.07001, 36.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(4641, 1387.17004, -1164.96997, 24.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(5422, 1302.03003, -1271.59998, 14.61000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8948, 1393.16003, -1170.25000, 24.49000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1215, 1414.73999, -1235.19995, 13.07000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1406.47998, -1235.19995, 13.07000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1397.50000, -1168.02002, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1398.93994, -1165.78003, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1400.21997, -1163.71997, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1401.57996, -1161.66003, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1388.96997, -1168.02002, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1388.96997, -1161.76001, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1389.62000, -1158.83997, 23.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(5779, 1410.65002, -1228.35999, 14.13000,   0.00000, 0.00000, 90.00000);

	//Estadio
	CreateDynamicObject(970, 1095.14001, 1383.33875, 10.26000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1101.04004, 1383.33875, 10.26000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1095.14001, 1703.18005, 10.26000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(970, 1101.04004, 1703.18005, 10.26000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(8168, 1104.43005, 1614.60999, 13.37000,   0.00000, 0.00000, -83.78000);
	CreateDynamicObject(19176, -1388.05005, -325.39999, 1052.58997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19451, -1388.05005, -325.57999, 1052.82996,   0.02000, 0.00000, 90.00000);
	CreateDynamicObject(2412, -1389.65002, -324.41000, 1051.06995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2412, -1385.75000, -324.41000, 1051.06995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1388.44995, -322.82999, 1054.55005,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(2420, -1383.29004, -325.20001, 1051.06995,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2788, -1387.72998, -319.92001, 1051.58997,   0.00000, 0.00000, 189.52000);
	CreateDynamicObject(2788, -1389.31995, -319.95001, 1051.58997,   0.00000, 0.00000, 354.47000);
	CreateDynamicObject(19451, -1383.16003, -323.04001, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(2644, -1386.41003, -319.92999, 1051.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1670, -1390.70996, -319.95001, 1051.93005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2644, -1390.68994, -319.92999, 1051.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2788, -1385.03003, -319.89999, 1051.58997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2666, -1387.68994, -318.85999, 1053.80005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2788, -1392.02002, -320.01999, 1051.58997,   0.00000, 0.00000, 180.46001);
	CreateDynamicObject(19377, -1382.64001, -322.94000, 1049.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -1382.93005, -321.67001, 1054.96997,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, -1395.85999, -324.95999, 1052.08997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1523, -1396.73999, -324.64999, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, -1396.77002, -323.89999, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(1543, -1386.09998, -316.29001, 1051.91003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2788, -1389.18005, -316.14001, 1051.58997,   0.00000, 0.00000, 354.47000);
	CreateDynamicObject(1543, -1386.65002, -316.04999, 1051.91003,   0.00000, 0.00000, 57.13000);
	CreateDynamicObject(2788, -1387.72998, -315.95999, 1051.58997,   0.00000, 0.00000, 173.70000);
	CreateDynamicObject(2644, -1386.41003, -316.09000, 1051.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2644, -1390.68994, -316.09000, 1051.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2788, -1385.03003, -316.06000, 1051.58997,   0.00000, 0.00000, 350.91000);
	CreateDynamicObject(2668, -1390.81006, -315.94000, 1053.80005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1382.64001, -332.44000, 1049.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19451, -1397.67004, -325.57999, 1052.82996,   0.02000, 0.00000, 90.00000);
	CreateDynamicObject(2435, -1397.18994, -321.82001, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2788, -1392.12000, -316.06000, 1051.58997,   0.00000, 0.00000, 174.77000);
	CreateDynamicObject(2430, -1396.87000, -320.64999, 1053.46997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2435, -1397.18994, -320.89999, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2435, -1397.18994, -319.98001, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2190, -1396.88000, -319.17999, 1052.00000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19389, -1398.45996, -322.39001, 1052.82996,   0.02000, 0.00000, 90.00000);
	CreateDynamicObject(2435, -1397.18994, -319.06000, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2677, -1389.15002, -313.91000, 1051.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1502, -1399.31006, -324.64899, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, -1399.31006, -323.89999, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1398.94995, -322.82999, 1054.55005,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(2435, -1397.18994, -318.14001, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1523, -1399.25000, -322.42999, 1051.06995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1388.44995, -313.20999, 1054.55005,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(2435, -1397.18994, -317.22000, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2453, -1397.18994, -316.82999, 1052.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2667, -1386.31006, -312.92001, 1053.80005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19451, -1383.16003, -313.42001, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(2435, -1397.18994, -316.29999, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2788, -1389.28003, -312.16000, 1051.58997,   0.00000, 0.00000, 11.55000);
	CreateDynamicObject(2788, -1387.14001, -312.12000, 1051.58997,   0.00000, 0.00000, 173.70000);
	CreateDynamicObject(2431, -1396.82996, -315.60001, 1053.46997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2644, -1386.41003, -312.14999, 1051.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2432, -1397.12000, -315.60001, 1052.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2644, -1390.68994, -312.14999, 1051.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2788, -1385.79004, -312.04999, 1051.58997,   0.00000, 0.00000, 12.84000);
	CreateDynamicObject(19377, -1382.64001, -313.32001, 1049.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1840, -1397.03003, -315.23001, 1054.51001,   180.00000, 25.00000, -40.00000);
	CreateDynamicObject(2788, -1392.10999, -312.04999, 1051.58997,   0.00000, 0.00000, 164.22000);
	CreateDynamicObject(19359, -1396.77002, -314.57001, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(19359, -1401.66003, -322.39001, 1052.82996,   0.02000, 0.00000, 90.00000);
	CreateDynamicObject(2524, -1401.72998, -322.95999, 1051.06995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19327, -1396.87000, -314.25000, 1052.93005,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2525, -1401.98999, -323.79999, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2416, -1399.62000, -316.79001, 1051.06995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2417, -1401.98999, -321.82001, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2415, -1401.76001, -320.75000, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2418, -1401.81006, -319.79999, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19451, -1402.56995, -320.98001, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(2451, -1401.84998, -317.81000, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2686, -1400.93994, -316.20999, 1052.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2421, -1402.43005, -318.87000, 1052.58997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1840, -1383.56995, -309.56000, 1054.51001,   180.00000, 25.00000, 40.00000);
	CreateDynamicObject(19377, -1398.94995, -313.20999, 1054.55005,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19451, -1401.68005, -316.07999, 1052.82996,   0.02000, 0.00000, 90.00000);
	CreateDynamicObject(19328, -1389.47998, -308.63000, 1052.93005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, -1396.63000, -314.62000, 1061.68994,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, -1386.52002, -308.45999, 1052.53003,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19451, -1391.85999, -308.51001, 1052.82996,   0.02000, 0.00000, 90.00000);
	CreateDynamicObject(18980, -1396.30005, -311.01001, 1057.41003,   72.94000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1388.64001, -308.45999, 1046.25000,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(2420, -1396.66003, -308.98001, 1051.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19432, -1396.77002, -308.97000, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -1382.93005, -308.73999, 1042.97998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -1396.17004, -307.92999, 1043.80005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1399.12000, -308.45999, 1046.25000,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, -1396.63000, -303.75000, 1048.94995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, -1396.63000, -304.22000, 1059.03003,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19327, -1405.06995, -308.60999, 1052.93005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3452, -1411.52002, -307.98999, 1056.81006,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1401.35999, -299.01001, 1048.94495,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19382, -1401.80005, -299.01001, 1059.03003,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, -1411.00000, -299.01001, 1048.94495,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19382, -1412.30005, -299.01001, 1059.03003,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, -1420.62000, -299.01001, 1048.94495,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19382, -1422.78003, -299.01001, 1059.03003,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(630, -1434.56006, -313.45999, 1052.12000,   0.00000, 0.00000, 39.70000);
	CreateDynamicObject(19456, -1433.82996, -308.38000, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1430.23999, -299.01001, 1048.94495,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19382, -1433.26001, -299.01001, 1059.03003,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(3452, -1441.14001, -307.98999, 1056.81006,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8231, -1442.67004, -312.51001, 1052.80005,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(8230, -1442.85999, -312.59000, 1052.95996,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(630, -1442.97998, -310.82999, 1052.12000,   0.00000, 0.00000, 39.70000);
	CreateDynamicObject(18761, -1422.89001, -279.07999, 1055.25000,   0.00000, 0.00000, 111.18000);
	CreateDynamicObject(19377, -1439.85999, -299.01001, 1048.94495,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19451, -1446.17004, -319.45001, 1052.82996,   0.02000, 0.00000, 0.00000);
	CreateDynamicObject(1808, -1445.67004, -315.26999, 1051.09998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1703, -1445.81995, -310.78000, 1051.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, -1447.06006, -314.04001, 1051.09998,   0.00000, 0.00000, 85.12000);
	CreateDynamicObject(1806, -1447.06006, -312.95001, 1051.09998,   0.00000, 0.00000, 105.00000);
	CreateDynamicObject(2262, -1448.46997, -314.13000, 1052.88000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2008, -1448.59998, -313.12000, 1051.09998,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19382, -1443.73999, -299.01001, 1059.03003,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(2606, -1448.91003, -310.06000, 1052.71997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, -1450.02002, -313.98001, 1051.09998,   0.00000, 0.00000, -85.12000);
	CreateDynamicObject(2164, -1451.13000, -313.72000, 1051.08997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, -1449.47998, -299.01001, 1048.94495,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, -1455.91003, -323.34000, 1055.79004,   -12.44000, 0.00000, 0.00000);
	CreateDynamicObject(19382, -1451.00000, -299.01001, 1059.03003,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19382, -1455.16003, -314.79001, 1061.94995,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1455.91003, -314.14001, 1052.91003,   -12.44000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -1455.56006, -310.98999, 1057.43005,   72.94000, 0.00000, 0.00000);
	CreateDynamicObject(19382, -1455.19995, -304.31000, 1059.03003,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1455.91003, -304.88000, 1050.17004,   -12.44000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -1454.80005, -298.60001, 1041.68994,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -1455.81995, -299.37000, 1041.68994,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, -1388.44995, -332.46490, 1054.55005,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, -1398.94995, -332.46490, 1054.55005,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(18980, -1382.93005, -346.63510, 1054.96997,   90.00000, 0.00000, 0.00000);
	CreateObject(18783,-1393.0245400,-318.4621000,1048.5833700,0.0000000,0.0000000,0.0000000); //

	// Mercado, Rutas, mecanico, etc
	CreateDynamicObject(973, -1749.83997, -659.71997, 20.87000,   0.00000, 7.60000, 87.03000);
	CreateDynamicObject(973, -1749.31006, -641.15997, 18.63000,   0.00000, 6.00000, 89.63000);
	CreateDynamicObject(973, -1749.46997, -650.47998, 19.69000,   0.00000, 7.00000, 88.41000);
	CreateDynamicObject(973, -1749.43994, -631.84003, 17.77000,   0.00000, 4.50000, 91.93000);
	CreateDynamicObject(973, -1749.76001, -622.52002, 17.06000,   0.00000, 4.20000, 91.93000);
	CreateDynamicObject(973, -1747.34998, -593.97998, 16.21000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(973, -1737.95996, -593.97998, 16.21000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(973, -1791.59998, -566.09998, 16.30000,   0.00000, 0.00000, 179.99451);
	CreateDynamicObject(973, -1782.40002, -566.09998, 16.30000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(973, -1728.57996, -593.94000, 16.21000,   0.00000, 0.00000, 0.50000);
	CreateDynamicObject(973, -1773.59998, -566.09998, 16.30000,   0.00000, 0.00000, 179.99451);
	CreateDynamicObject(973, -1764.19995, -566.09998, 16.30000,   0.00000, 0.00000, 179.99451);
	CreateDynamicObject(973, -1754.90002, -566.09998, 16.30000,   0.00000, 0.00000, 179.99451);
	CreateDynamicObject(973, -1736.31995, -566.09998, 16.30000,   0.00000, 0.00000, 179.99001);
	CreateDynamicObject(973, -1749.23999, -687.10999, 24.97000,   0.00000, 10.30000, 99.60000);
	CreateDynamicObject(973, -1747.25000, -696.01001, 26.86000,   0.00000, 13.00000, 105.65000);
	CreateDynamicObject(973, -1745.29004, -704.94000, 28.60000,   0.00000, 8.53000, 99.30000);
	CreateDynamicObject(973, -1727.39001, -750.78998, 36.04000,   0.00000, -3.00000, -93.00000);
	CreateDynamicObject(973, -1713.52002, -732.76001, 36.19000,   0.00000, 6.00000, 193.00000);
	CreateDynamicObject(973, -1750.28003, -678.01001, 23.45000,   0.00000, 8.50000, 93.35000);
	CreateDynamicObject(973, -1750.31006, -668.84003, 22.12000,   0.00000, 8.00000, 87.03000);
	CreateDynamicObject(973, -1745.69995, -566.09998, 16.30000,   0.00000, 0.00000, 179.99451);
	CreateDynamicObject(973, -1750.90002, -603.87000, 16.21000,   0.00000, 0.20000, 96.32000);
	CreateDynamicObject(973, -1750.15002, -613.16998, 16.48000,   0.00000, 3.00000, 92.86000);
	CreateDynamicObject(973, -1526.22998, -806.28003, 56.68000,   0.00000, 10.00000, 157.41000);
	CreateDynamicObject(973, -1517.70996, -809.82001, 58.30000,   0.00000, 10.00000, 157.41000);
	CreateDynamicObject(973, -1508.95996, -812.22998, 60.12000,   0.00000, 12.32000, 171.72000);
	CreateDynamicObject(973, -1499.87000, -813.35999, 62.11000,   0.00000, 12.32000, 174.16000);
	CreateDynamicObject(973, -1490.79004, -813.90002, 64.39000,   0.00000, 15.82000, 179.10001);
	CreateDynamicObject(973, -1481.76001, -813.84998, 66.89000,   0.00000, 15.00000, 181.42999);
	CreateDynamicObject(973, -1472.69995, -813.62000, 69.36000,   0.00000, 15.50000, 181.42999);
	CreateDynamicObject(973, -1465.01001, -810.00000, 71.73000,   0.00000, 10.50000, 234.45000);
	CreateDynamicObject(973, -1458.31995, -804.47998, 73.81000,   0.00000, 15.50000, 205.62000);
	CreateDynamicObject(973, -1449.72998, -802.42999, 76.43000,   0.00000, 17.00000, 181.77000);
	CreateDynamicObject(973, -1440.76001, -802.15002, 78.93000,   0.00000, 14.00000, 181.77000);
	CreateDynamicObject(973, -1431.75000, -801.84998, 80.78000,   0.00000, 9.20000, 181.77000);
	CreateDynamicObject(973, -1422.82996, -803.44000, 81.86000,   0.00000, 4.20000, 157.91000);
	CreateDynamicObject(973, -1414.72998, -807.87000, 82.20000,   0.00000, 0.00000, 144.96001);
	CreateDynamicObject(973, -1406.29004, -810.27002, 82.16000,   0.00000, -0.50000, 183.33000);
	CreateDynamicObject(973, -1255.09998, -777.79999, 66.10000,   0.00000, 354.00000, 208.25000);
	CreateDynamicObject(973, -1247.00000, -773.29999, 65.00000,   0.00000, 352.50000, 210.00000);
	CreateDynamicObject(973, -1239.00000, -768.70001, 64.00000,   0.00000, 355.25000, 209.75000);
	CreateDynamicObject(973, -1231.50000, -763.29999, 63.70000,   0.00000, 0.75000, 222.00000);
	CreateDynamicObject(973, -1224.90002, -756.79999, 63.10000,   0.00000, 352.00000, 227.25000);
	CreateDynamicObject(973, -1212.97949, -742.57837, 60.48780,   -0.18000, 351.06000, 231.94000);
	CreateDynamicObject(973, -840.15997, -1038.84998, 87.92000,   359.50000, 7.50000, 44.14000);
	CreateDynamicObject(973, -846.20001, -1045.79004, 89.13000,   359.50000, 7.50000, 53.83000);
	CreateDynamicObject(973, -833.52002, -1032.42004, 86.58000,   359.50000, 9.04000, 44.14000);
	CreateDynamicObject(973, -851.34003, -1053.47998, 90.35000,   359.50000, 7.50000, 58.79000);
	CreateDynamicObject(973, -826.21997, -1026.90002, 85.24000,   359.50000, 7.50000, 30.13000);
	CreateDynamicObject(973, -856.06000, -1061.43994, 91.57000,   359.50000, 7.50000, 60.05000);
	CreateDynamicObject(973, -818.19000, -1022.25000, 84.02000,   359.50000, 7.50000, 30.13000);
	CreateDynamicObject(973, -859.82001, -1069.81995, 92.78000,   359.50000, 7.50000, 71.81000);
	CreateDynamicObject(973, -809.87000, -1018.33002, 82.80000,   359.50000, 7.50000, 20.43000);
	CreateDynamicObject(973, -862.63000, -1078.68005, 94.00000,   359.50000, 7.50000, 73.07000);
	CreateDynamicObject(973, -865.33002, -1087.55005, 95.21000,   359.50000, 7.50000, 73.07000);
	CreateDynamicObject(973, -801.12000, -1015.38000, 81.58000,   359.50000, 7.50000, 16.96000);
	CreateDynamicObject(973, -867.97998, -1096.30005, 96.40000,   359.50000, 7.50000, 73.07000);
	CreateDynamicObject(973, -870.38000, -1105.23999, 97.66000,   359.50000, 8.00000, 77.07000);
	CreateDynamicObject(973, -792.14001, -1013.20001, 80.48000,   359.50000, 5.94000, 10.47000);
	CreateDynamicObject(973, -872.38000, -1114.28003, 98.35000,   0.00000, 0.50000, 78.20000);
	CreateDynamicObject(973, -874.06000, -1123.43994, 98.66000,   0.00000, 3.25000, 81.00000);
	CreateDynamicObject(973, -875.35999, -1132.64001, 99.58000,   0.00000, 8.04000, 83.00000);
	CreateDynamicObject(973, -876.27002, -1141.85999, 100.93000,   1.98000, 8.51000, 85.45000);
	CreateDynamicObject(973, -735.19000, -1015.76001, 75.70000,   359.51999, 4.12000, 354.95001);
	CreateDynamicObject(973, -725.88000, -1016.58002, 75.03000,   359.51999, 4.12000, 354.95001);
	CreateDynamicObject(973, -716.54999, -1016.84998, 74.45000,   359.51999, 3.06000, 1.76000);
	CreateDynamicObject(973, -707.21997, -1016.52002, 73.96000,   359.51999, 3.06000, 2.32000);
	CreateDynamicObject(973, -697.88000, -1016.14001, 73.46000,   359.51999, 3.06000, 2.32000);
	CreateDynamicObject(973, -688.64001, -1015.33002, 72.72000,   359.51999, 6.00000, 7.73000);
	CreateDynamicObject(973, -679.44000, -1013.92999, 71.74000,   359.51999, 6.00000, 9.69000);
	CreateDynamicObject(973, -670.27002, -1012.35999, 70.77000,   359.51999, 6.00000, 9.69000);
	CreateDynamicObject(973, -661.08002, -1010.79999, 69.93000,   359.51999, 4.36000, 9.69000);
	CreateDynamicObject(973, -652.26001, -1008.29999, 69.23000,   359.51999, 4.36000, 21.85000);
	CreateDynamicObject(973, -643.53998, -1005.15002, 68.44000,   359.51999, 5.44000, 17.96000);
	CreateDynamicObject(973, -634.94000, -1001.67999, 67.56000,   359.51999, 5.44000, 26.17000);
	CreateDynamicObject(973, -458.67001, -830.94000, 49.51000,   0.00000, 2.21000, 182.03999);
	CreateDynamicObject(973, -449.81000, -828.89001, 49.53000,   0.00000, -1.99000, 204.11000);
	CreateDynamicObject(973, -441.32999, -825.09998, 49.23000,   0.00000, -1.99000, 204.11000);
	CreateDynamicObject(973, -432.59000, -822.12000, 48.97000,   0.00000, -1.19000, 193.50000);
	CreateDynamicObject(973, -423.57999, -819.92999, 48.73000,   0.00000, -1.48000, 193.50000);
	CreateDynamicObject(973, -414.45999, -818.23999, 48.41000,   0.00000, -2.48000, 187.50000);
	CreateDynamicObject(973, -405.16000, -818.10999, 48.10000,   0.00000, -1.32000, 173.94000);
	CreateDynamicObject(973, -396.03000, -819.73999, 47.77000,   0.00000, -2.84000, 165.58000);
	CreateDynamicObject(18228, -678.86438, -1049.00781, 52.46140,   7.00000, 4.00000, -5.00000);
	CreateDynamicObject(973, -1218.81995, -749.79999, 61.80000,   0.16000, 352.41000, 230.73000);
	CreateDynamicObject(973, -1207.84937, -734.93835, 59.04153,   -0.18000, 351.06000, 240.33989);
	CreateDynamicObject(973, -1203.50293, -726.81506, 57.68426,   -0.06000, 352.13995, 243.51981);
	CreateDynamicObject(973, -1199.37939, -718.50793, 56.38427,   -0.06000, 352.13995, 243.51981);
	CreateDynamicObject(1308, -1199.01233, -717.66583, 55.84375,   356.85840, 0.00000, 3.14159);

	CreateDynamicObject(18228, -1789.28003, -657.90002, 18.03000,   0.00000, 0.00000, 51.42000);
	CreateDynamicObject(13435, -1779.59998, -631.14001, 21.24000,   4.00000, 5.00000, 90.00000);
	CreateDynamicObject(14872, -1795.30005, -629.90002, 17.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1463, -1797.09998, -628.20001, 17.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12937, -1796.59998, -624.29999, 19.00000,   0.00000, 358.00000, 0.00000);
	CreateDynamicObject(12808, -1788.40002, -605.90002, 18.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(837, -1805.50000, -599.40002, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(836, -1774.50000, -603.79999, 16.40000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(747, -1750.23999, -596.77002, 15.44000,   0.00000, 0.00000, 351.54001);
	CreateDynamicObject(13435, -1795.40002, -549.79999, 17.60000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(791, -1795.34998, -545.28003, 4.80000,   0.00000, 0.00000, 301.03000);
	CreateDynamicObject(845, -1785.59998, -544.79999, 15.00000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(982, -1531.18005, 119.19000, 3.23000,   0.00000, 0.00000, 134.89999);
	CreateDynamicObject(982, -1513.00000, 137.34000, 3.23000,   0.00000, 0.00000, 135.02000);
	CreateDynamicObject(982, -1514.70996, 158.09000, 3.23000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(982, -1535.76001, 160.89000, 3.23000,   0.00000, 0.00000, 134.82001);
	CreateDynamicObject(982, -1553.89001, 142.81000, 3.23000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(970, -1566.19995, 135.39999, 4.20000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1566.19995, 135.39999, 3.10000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1570.00000, 139.20000, 3.10000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1570.00000, 139.20000, 4.20000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1573.72998, 139.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1573.72998, 139.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(3627, -1581.50000, 120.30000, 6.40000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1577.72998, 135.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1577.72998, 135.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1581.72998, 131.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1581.72998, 131.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(18228, -1786.29004, -708.04999, 24.30000,   0.00000, 0.00000, 65.10000);
	CreateDynamicObject(2060, -1071.69995, -1201.18005, 128.66000,   0.00000, 70.00000, 356.85001);
	CreateDynamicObject(2060, -1072.23999, -1200.93994, 128.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2060, -1072.06006, -1201.26001, 128.64000,   0.00000, 0.00000, 262.76001);
	CreateDynamicObject(2060, -1072.34998, -1201.50000, 128.38000,   0.00000, 0.00000, 349.26999);
	CreateDynamicObject(17030, -869.94000, -1171.07996, 85.88000,   0.00000, 0.00000, 142.00000);
	CreateDynamicObject(19468, -1086.23999, -1233.41003, 128.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19468, -1086.56006, -1233.54004, 128.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, -1085.98999, -1235.66003, 131.67000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, -1101.20996, -182.77000, 14.44000,   0.00000, 0.00000, 45.02000);
	CreateDynamicObject(3465, -1109.29004, -190.89000, 14.44000,   0.00000, 0.00000, 45.02000);
	CreateDynamicObject(9192, -1118.82996, -199.53999, 17.95000,   0.00000, 0.00000, 47.74000);
	CreateDynamicObject(3934, -1116.75000, -175.00000, 13.15000,   0.00000, 0.00000, 44.57000);
	CreateDynamicObject(11392, -1123.40002, -171.25999, 13.16000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(689, -182.69000, -387.06000, 1.46000,   357.00000, 0.00000, 55.00000);
	CreateDynamicObject(12861, 26.05000, -242.69000, 0.55000,   0.00000, 0.00000, 269.29001);
	CreateDynamicObject(3627, 41.38000, -261.20001, 4.40000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3569, 41.19000, -262.48001, 3.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3630, 32.70000, -294.79999, 2.65000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2567, 35.03000, -308.88000, 3.01000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14680, 80.40000, -152.80000, 2.60000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3630, 50.76000, -294.98001, 2.27000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1347, 84.61426, -166.02344, 2.00000,   90.00000, 180.00549, 359.98352);
	CreateDynamicObject(2816, 84.76000, -166.17819, 2.42000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1347, 84.75801, -165.10396, 2.00000,   90.00000, 180.00549, 359.97803);
	CreateDynamicObject(366, 85.02246, -167.24902, 2.10000,   0.00000, 40.00000, 103.00000);
	CreateDynamicObject(2103, 84.85000, -165.12628, 2.44000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(365, 84.98106, -166.22272, 2.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1431, 53.59000, -294.06000, 1.13000,   0.00000, 0.00000, 14.22000);
	CreateDynamicObject(1787, 84.92001, -162.68915, 2.50000,   0.00000, 90.00000, 89.99988);
	CreateDynamicObject(1787, 85.02881, -163.13712, 2.50000,   0.00000, 90.00000, 89.99982);
	CreateDynamicObject(2846, 83.60000, -149.00000, 1.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2395, 86.35000, -161.48126, 5.00000,   0.00000, 90.00000, 220.00000);
	CreateDynamicObject(5269, 56.47000, -294.26999, 2.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2378, 84.70000, -148.10001, 2.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1431, 58.86000, -291.41000, 1.13000,   0.00000, 0.00000, 329.39999);
	CreateDynamicObject(12991, 85.70000, -150.60001, 1.60000,   0.00000, 0.00000, 179.99988);
	CreateDynamicObject(925, 51.50000, -302.57999, 1.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3055, 88.00293, -160.95020, 2.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2673, 86.21382, -148.26651, 1.67018,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2096, 87.20000, -152.70000, 1.60000,   0.00000, 0.00000, 219.99989);
	CreateDynamicObject(1421, 59.07000, -293.72000, 1.25000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1787, 89.82758, -167.98232, 2.00000,   0.00000, 90.00000, 116.01138);
	CreateDynamicObject(1787, 90.00000, -168.30000, 2.00000,   0.00000, 90.00000, 119.99988);
	CreateDynamicObject(10282, 89.67090, -164.78906, 2.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2673, 87.49727, -149.50848, 1.67109,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1440, 88.21755, -148.51106, 2.10067,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3577, 47.63000, -312.07001, 1.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1439, 90.50000, -160.45000, 1.58575,   0.00000, 0.00000, 179.99451);
	CreateDynamicObject(2674, 90.34708, -158.26065, 1.60558,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2673, 88.98421, -149.61986, 1.66607,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(931, 55.60000, -302.57999, 1.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(5269, 54.41000, -304.50000, 3.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2567, 36.63000, -326.92999, 2.97000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1347, 93.34729, -168.37517, 2.00000,   90.00000, 179.99451, 269.99451);
	CreateDynamicObject(1787, 92.84961, -161.53320, 2.10000,   0.00000, 49.99878, 339.99939);
	CreateDynamicObject(1787, 92.91087, -161.60001, 2.00000,   0.00000, 90.00000, 89.99982);
	CreateDynamicObject(925, 91.06821, -148.62650, 2.63619,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11392, 93.32951, -161.72353, 1.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1347, 94.30000, -168.42996, 2.00000,   90.00000, 180.00000, 270.00012);
	CreateDynamicObject(11392, 93.68375, -161.98639, 1.60000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1787, 93.72372, -161.39999, 2.00000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(3630, 42.01000, -324.23001, 6.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(12957, 94.61621, -158.98926, 2.30000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(5269, 61.25000, -301.63000, 2.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(925, 53.94000, -312.32999, 1.75000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1448, 66.21000, -296.64001, 0.66000,   0.00000, 0.00000, 339.04001);
	CreateDynamicObject(7619, 65.14000, -300.63000, 5.20000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(7832, 65.14000, -300.63000, 5.20000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(7497, 65.14000, -300.63000, 5.20000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1448, 69.49000, -296.54999, 0.66000,   0.00000, 0.00000, 339.04001);
	CreateDynamicObject(1448, 70.08000, -298.39001, 0.66000,   0.00000, 0.00000, 13.08000);
	CreateDynamicObject(3577, 65.88000, -305.67999, 1.51000,   0.00000, 0.00000, 13.77000);
	CreateDynamicObject(5269, 74.48000, -294.31000, 2.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3630, 51.89000, -321.76999, 2.09000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3568, 85.38000, -279.09000, 2.95000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3577, 64.21000, -310.26999, 1.51000,   0.00000, 0.00000, 0.70000);
	CreateDynamicObject(5269, 61.41000, -313.95001, 1.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3630, 53.57000, -324.23001, 6.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 106.90000, -153.10001, 1.50000,   358.00000, 5.00000, 330.00000);
	CreateDynamicObject(1448, 76.10000, -299.73999, 0.66000,   0.00000, 0.00000, 27.62000);
	CreateDynamicObject(5269, 80.56000, -294.31000, 2.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3569, 91.03000, -278.95999, 2.95000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1448, 78.34000, -301.79999, 0.66000,   0.00000, 0.00000, 354.01999);
	CreateDynamicObject(5269, 75.32000, -305.94000, 2.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1847, 77.42000, -305.79999, 0.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2567, 67.73000, -320.20999, 2.45000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3630, 65.21000, -324.23001, 6.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18451, 116.10465, -149.14899, 1.09055,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3577, 73.61000, -318.50000, 1.31000,   0.00000, 0.00000, 126.21000);
	CreateDynamicObject(1448, 88.61000, -298.64999, 0.66000,   0.00000, 0.00000, 47.48000);
	CreateDynamicObject(1883, 77.51000, -314.57999, 0.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2567, 67.96000, -325.54999, 2.45000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1883, 81.81000, -309.78000, 0.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2543, 87.55000, -302.70001, 0.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2543, 88.56000, -301.69000, 0.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(5269, 91.07000, -298.62000, 2.89000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3474, 108.93000, -265.73001, 7.47000,   0.00000, 0.00000, 92.29000);
	CreateDynamicObject(2543, 88.56000, -303.69000, 0.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2543, 89.55000, -302.70001, 0.54000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1883, 81.81000, -314.57999, 0.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2542, 85.08000, -315.79999, 0.52000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(5269, 95.13000, -303.70001, 2.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3014, 94.17000, -305.23999, 0.65000,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(3014, 86.06000, -315.35001, 0.65000,   0.00000, 90.00000, -90.00000);
	CreateDynamicObject(2541, 86.08000, -315.79999, 0.52000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2541, 87.08000, -315.79999, 0.52000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3014, 94.17000, -309.57999, 0.65000,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(5269, 95.13000, -312.12000, 2.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3014, 94.17000, -313.70001, 0.65000,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(12934, 133.92000, -265.03000, 3.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19359, 158.44000, -296.85001, 2.32000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19451, 171.71001, -275.17999, 2.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1500, 193.21001, -229.19000, 0.60000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1714, 194.07001, -231.12000, 0.78000,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(2748, 195.05000, -224.95000, 1.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2747, 195.64000, -226.74001, 1.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18644, 195.69000, -230.46001, 1.60000,   90.00000, 0.00000, 47.00000);
	CreateDynamicObject(2607, 195.62000, -231.07001, 1.18000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18635, 195.58000, -231.75999, 1.56000,   90.00000, 0.00000, 62.00000);
	CreateDynamicObject(18634, 195.78999, -231.24001, 1.62000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(2069, 196.46001, -232.60001, 0.82000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19164, 197.82001, -230.11000, 3.42000,   90.00000, 90.00000, -90.00000);
	CreateDynamicObject(1714, 198.23000, -234.89000, 0.78000,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(2063, 199.53000, -224.75999, 1.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1438, 199.69000, -228.62000, 0.78000,   0.00000, 0.00000, 185.00000);
	CreateDynamicObject(14532, 200.02000, -231.50000, 1.76000,   0.00000, 0.00000, 114.12000);
	CreateDynamicObject(2628, 205.50000, -225.34000, 0.77000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2190, 211.22000, -224.59000, 1.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2710, 212.81000, -233.91000, 0.87000,   0.00000, 0.00000, 171.00000);
	CreateDynamicObject(1210, 213.48000, -235.10001, 0.92000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2226, 213.67999, -233.84000, 0.78000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(19317, 214.41000, -234.97000, 1.50000,   -18.00000, 4.00000, 185.00000);
	CreateDynamicObject(2404, 214.87000, -235.14000, 2.27000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(366, 215.03000, -234.10001, 0.81000,   84.00000, 0.00000, 0.00000);
	CreateDynamicObject(2028, 218.57001, -224.81000, 1.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1788, 219.50999, -224.81000, 1.95000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1429, 220.58000, -224.72000, 2.15000,   0.00000, 0.00000, 193.00000);
	CreateDynamicObject(2225, 220.92000, -225.31000, 0.76000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19318, 221.39000, -225.83000, 1.95000,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(1518, 221.61000, -227.27000, 2.19000,   0.00000, 0.00000, -76.00000);
	CreateDynamicObject(1347, 221.30000, -234.62000, 1.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2406, 222.12000, -228.56000, 2.04000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(672, -98.56000, -403.69000, 0.75000,   356.85999, 0.00000, -0.43000);

	//MAPEO CAMIONERO
	CreateDynamicObject(8948, -1708.43005, -121.02000, 4.28000,   0.00000, 0.00000, 44.25000);
	CreateDynamicObject(10847, -1704.06995, -112.74000, 8.91000,   0.00000, 0.00000, 314.20001);
	CreateDynamicObject(982, -1703.10010, -140.39999, 3.22000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(10847, -1704.06995, -112.74000, 21.52000,   0.00000, 0.00000, 314.20001);
	CreateDynamicObject(982, -1684.69995, -122.10000, 3.22000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(10847, -1717.54004, -98.89000, 8.91000,   0.00000, 0.00000, 314.20001);
	CreateDynamicObject(10847, -1717.54004, -98.89000, 21.53000,   0.00000, 0.00000, 314.20001);
	CreateDynamicObject(3569, -1701.35999, -90.66000, 4.94000,   0.00000, 0.00000, 45.29000);
	CreateDynamicObject(982, -1721.40002, -158.70000, 3.22000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(982, -1686.23999, -153.03999, 13.82360,   180.00000, 0.00000, 315.17001);
	CreateDynamicObject(3627, -1686.63000, -86.57000, 6.40000,   0.00000, 0.00000, 45.06000);
	CreateDynamicObject(982, -1668.18994, -134.87000, 13.82360,   180.00000, 0.00000, 315.17001);
	CreateDynamicObject(3627, -1734.40002, -157.39999, 6.40000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(982, -1665.50000, -102.90000, 3.22000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(982, -1703.12000, -172.25999, 13.82360,   180.00000, 0.00000, 322.29001);
	CreateDynamicObject(16378, -1714.80005, -63.90000, 3.40000,   0.00000, 0.00000, 44.00000);
	CreateDynamicObject(2596, -1712.59998, -63.20000, 5.50000,   0.00000, 0.00000, 282.88000);
	CreateDynamicObject(16780, -1715.59998, -63.20000, 6.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9361, -1716.90002, -62.90000, 5.00000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, -1650.06995, -116.77000, 13.82360,   180.00000, 0.00000, 314.76001);
	CreateDynamicObject(2289, -1716.88000, -61.00000, 4.60000,   0.00000, 0.00000, 44.49000);
	CreateDynamicObject(19357, -1716.85999, -60.79000, 4.28000,   0.00000, 0.00000, 315.20999);
	CreateDynamicObject(1808, -1720.59998, -61.10000, 2.60000,   0.00000, 0.00000, 48.45000);
	CreateDynamicObject(1726, -1716.00000, -60.30000, 2.60000,   0.00000, 0.00000, 314.51999);
	CreateDynamicObject(2818, -1719.26001, -60.58000, 2.70000,   0.00000, 0.00000, 315.51001);
	CreateDynamicObject(2108, -1716.30005, -59.80000, 2.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2851, -1716.90002, -59.50000, 3.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2333, -1718.19995, -59.30000, 2.60000,   0.00000, 0.00000, 315.51001);
	CreateDynamicObject(2101, -1716.31995, -59.01000, 3.60000,   0.00000, 0.00000, 315.51001);
	CreateDynamicObject(1806, -1718.50000, -59.30000, 2.60000,   0.00000, 0.00000, 289.79999);
	CreateDynamicObject(1791, -1716.09998, -58.95000, 4.10000,   0.00000, 0.00000, 315.50000);
	CreateDynamicObject(1791, -1716.56006, -58.54000, 3.60000,   0.00000, 0.00000, 315.51001);
	CreateDynamicObject(1791, -1716.56006, -58.54000, 4.10000,   0.00000, 0.00000, 315.50000);
	CreateDynamicObject(2828, -1717.59998, -58.50000, 3.56000,   0.00000, 0.00000, 154.24001);
	CreateDynamicObject(1791, -1717.00000, -58.10000, 3.60000,   0.00000, 0.00000, 315.51001);
	CreateDynamicObject(1791, -1717.00000, -58.10000, 4.10000,   0.00000, 0.00000, 315.50000);
	CreateDynamicObject(982, -1740.00000, -177.20000, 3.22000,   0.00000, 0.00000, 314.70001);
	CreateDynamicObject(3630, -1664.96997, -72.13000, 4.02000,   0.00000, 0.00000, 132.25000);
	CreateDynamicObject(982, -1717.25000, -193.55000, 13.82360,   180.00000, 0.00000, 330.63000);
	CreateDynamicObject(982, -1645.90002, -83.40000, 3.22000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(997, -1753.30005, -186.10001, 2.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, -1631.92004, -98.70000, 13.82360,   180.00000, 0.00000, 315.04001);
	CreateDynamicObject(997, -1757.40002, -186.10001, 2.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(997, -1762.59998, -186.10001, 2.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(997, -1767.69995, -186.10001, 2.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(997, -1772.09998, -186.20000, 2.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3627, -1651.17004, -51.11000, 6.40000,   0.00000, 0.00000, 224.94000);
	CreateDynamicObject(996, -1772.19995, -187.10001, 3.70000,   0.00000, 342.00000, 270.00000);
	CreateDynamicObject(982, -1727.59998, -216.85001, 13.82360,   180.00000, 0.00000, 341.56000);
	CreateDynamicObject(982, -1626.69995, -64.10000, 3.22000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(10773, -1633.29004, -54.52000, 5.28000,   0.00000, 0.00000, 133.74001);
	CreateDynamicObject(982, -1613.81006, -80.57000, 13.82360,   180.00000, 0.00000, 315.04001);
	CreateDynamicObject(3569, -1650.67004, -34.21000, 4.94000,   0.00000, 0.00000, 45.29000);
	CreateDynamicObject(17579, -1814.56995, -133.67000, 6.49000,   0.00000, -33.00000, 127.00000);
	CreateDynamicObject(17578, -1814.56995, -133.67000, 6.49000,   0.00000, -33.00000, 127.00000);
	CreateDynamicObject(1440, -1816.76172, -122.95470, 5.10000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(997, -1630.69995, -42.80000, 2.60000,   0.00000, 0.00000, 43.99475);
	CreateDynamicObject(1566, -1821.59998, -126.34000, 6.16000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(997, -1617.40002, -54.70000, 2.60000,   0.00000, 0.00000, 44.00000);
	CreateDynamicObject(997, -1647.00000, -26.50000, 2.60000,   0.00000, 0.00000, 45.99976);
	CreateDynamicObject(984, -1622.90002, -43.80000, 3.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(983, -1617.00000, -49.90000, 3.22000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(984, -1648.40002, -18.22000, 3.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(983, -1656.00000, -10.40000, 3.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(3627, -1731.58997, 2.76000, 6.40000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, -1595.70996, -62.44000, 13.82360,   180.00000, 0.00000, 315.04001);
	CreateDynamicObject(934, -1720.80005, 13.40000, 3.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, -1649.29980, 1.00000, 3.24000,   0.00000, 0.00000, 315.29663);
	CreateDynamicObject(982, -1631.29980, 19.00000, 3.23000,   0.00000, 0.00000, 314.89563);
	CreateDynamicObject(3627, -1632.83997, 31.48000, 6.39000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(3627, -1648.21997, 46.75000, 6.39000,   0.00000, 0.00000, -45.00000);
	CreateDynamicObject(982, -1613.19995, 37.20000, 3.23000,   0.00000, 0.00000, 315.39996);
	CreateDynamicObject(1423, -1729.90002, 76.50000, 3.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1427, -1727.40002, 78.10000, 3.10000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1521, -1732.09998, 78.90000, 3.66000,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(1466, -1730.19995, 80.50000, 3.70000,   0.00000, 0.00000, 46.00000);
	CreateDynamicObject(1278, -1716.09998, 87.30000, -4.70000,   0.00000, 0.00000, 223.99475);
	CreateDynamicObject(1278, -1708.90002, 94.70000, -4.70000,   0.00000, 0.00000, 223.99731);
	CreateDynamicObject(3627, -1709.29980, 95.09961, 6.40000,   0.00000, 0.00000, 315.99976);
	CreateDynamicObject(970, -1637.72998, 75.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1637.72998, 75.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(1278, -1701.40002, 101.60000, -4.70000,   0.00000, 0.00000, 223.99475);
	CreateDynamicObject(970, -1633.72998, 79.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1633.72998, 79.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(982, -1692.87000, 108.04000, 3.23000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1629.72998, 83.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1629.72998, 83.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1625.72998, 87.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1625.72998, 87.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(982, -1673.50000, 109.00000, 3.23000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(970, -1621.72998, 91.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1621.72998, 91.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(3627, -1610.80005, 91.10000, 6.40000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1617.72998, 95.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1617.72998, 95.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1613.72998, 99.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1613.72998, 99.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1609.72998, 103.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1609.72998, 103.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1605.72998, 107.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1605.72998, 107.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(982, -1654.10999, 128.28999, 3.23000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(970, -1601.72998, 111.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1601.72998, 111.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1597.72998, 115.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1597.72998, 115.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1593.72998, 119.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1593.72998, 119.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1589.72998, 123.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1589.72998, 123.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(3627, -1581.50000, 120.30000, 6.40000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(982, -1634.77002, 147.82001, 3.23000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(970, -1585.72998, 127.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1585.72998, 127.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1581.72998, 131.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1581.72998, 131.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1577.72998, 135.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1577.72998, 135.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(982, -1606.38000, 158.39999, 3.23000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(970, -1573.72998, 139.45000, 3.10000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1573.72998, 139.45000, 4.20000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(970, -1566.19995, 135.39999, 3.10000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1566.19995, 135.39999, 4.20000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1570.00000, 139.20000, 3.10000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(970, -1570.00000, 139.20000, 4.20000,   0.00000, 0.00000, 315.00000);
	CreateDynamicObject(982, -1615.27002, 167.24001, 3.23000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(973, -1601.88000, 171.74001, 3.43000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(982, -1531.18005, 119.19000, 3.23000,   0.00000, 0.00000, 134.89999);
	CreateDynamicObject(982, -1553.89001, 142.81000, 3.23000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(982, -1513.00000, 137.34000, 3.23000,   0.00000, 0.00000, 135.02000);
	CreateDynamicObject(982, -1535.76001, 160.89000, 3.23000,   0.00000, 0.00000, 134.82001);
	CreateDynamicObject(982, -1514.70996, 158.09000, 3.23000,   0.00000, 0.00000, 45.00000);

 	// Sprunks
	CreateDynamicObject(1775, 365.4287, 164.6942, 1040.2156,   0.0000, 0.0000, 180.0000);
	// Puente basurero
	CreateDynamicObject(1231, 67.80000, -1518.78003, 6.67000,   0.00000, 0.00000, 85.12000);
	CreateDynamicObject(984, 62.47000, -1516.48999, 4.70000,   0.00000, 180.00000, 263.60999);
	CreateDynamicObject(14411, 69.20000, -1549.32996, 1.24000,   0.00000, 0.00000, 83.61000);
	CreateDynamicObject(8838, 51.68000, -1517.79004, 2.48000,   0.00000, 0.00000, 353.60001);
	CreateDynamicObject(1231, 66.63000, -1549.18994, 7.13000,   0.00000, 0.00000, 85.12000);
	CreateDynamicObject(982, 48.17000, -1514.88000, 4.66000,   0.00000, 180.00000, 263.60999);
	CreateDynamicObject(984, 60.40000, -1550.22998, 5.18000,   0.00000, 180.00000, 263.60999);
	CreateDynamicObject(8838, 50.51000, -1546.69995, 2.92000,   0.00000, 0.00000, 173.60001);
	CreateDynamicObject(19911, 262.13000, -1639.60999, 21.65000,   90.00000, 90.00000, 79.70000);
	CreateDynamicObject(1231, 35.62000, -1515.02002, 6.67000,   0.00000, 0.00000, 85.12000);
	CreateDynamicObject(983, 32.37000, -1512.65002, 4.66000,   0.00000, 180.00000, 255.55000);
	CreateDynamicObject(982, 46.09000, -1548.63000, 5.14000,   0.00000, 180.00000, 263.60999);
	CreateDynamicObject(14411, 26.61000, -1513.10999, 0.70000,   0.00000, 0.00000, 255.39000);
	CreateDynamicObject(19461, 25.09000, -1512.48999, 1.21000,   -34.00000, 90.00000, 75.59000);
	CreateDynamicObject(1231, 34.26000, -1545.35999, 7.13000,   0.00000, 0.00000, 85.12000);
	CreateDynamicObject(14411, 31.71000, -1545.01001, 1.24000,   0.00000, 0.00000, 263.60999);
	CreateDynamicObject(19462, 33.41950, -1514.66699, 3.91760,   0.00000, -90.00000, 75.00000);
	// Pescador basurero (delfines)
	CreateDynamicObject(1243, 42.95105, -1692.88330, -2.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1607, 64.31075, -1688.80774, -1.24687,   0.00000, 0.00000, 30.94287);
	CreateDynamicObject(1607, 62.11000, -1715.89001, -0.29000,   0.00000, 0.00000, 312.26999);
	CreateDynamicObject(1607, 38.34000, -1721.72998, -1.49000,   0.00000, 0.00000, 257.26001);
	// Autoservicio
	CreateDynamicObject(19859, -24.389999, -188.419998, 1007.989990, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(19859, -27.389999, -188.419998, 1007.989990, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1216, -22.250000, -187.800003, 1007.409973, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(1650, -30.709999, -186.490005, 1007.940002, 0.000000, 0.000000, 81.529999);
	CreateDynamicObject(1650, -30.690001, -186.169998, 1007.940002, 0.000000, 0.000000, 104.709999);
	CreateDynamicObject(19877, -27.080000, -183.039993, 1008.729980, 0.000000, 0.000000, 90.589996);
	CreateDynamicObject(19627, -30.660000, -185.210007, 1007.650024, 0.000000, 0.000000, 41.130001);
	CreateDynamicObject(2941, -30.719999, -184.550003, 1007.729980, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(1349, -25.639999, -181.880005, 1007.309998, 0.000000, 0.000000, 142.779999);
	CreateDynamicObject(1811, -32.290001, -184.899994, 1007.250000, 0.000000, 0.000000, 180.539993);
	CreateDynamicObject(19325, -33.709999, -187.479996, 1009.020020, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19325, -33.709999, -187.440002, 1009.020020, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19325, -33.709999, -187.380005, 1009.020020, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19325, -17.790001, -187.460007, 1009.020020, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19325, -17.790001, -187.399994, 1009.020020, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19325, -17.790001, -187.360001, 1009.020020, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19449, -33.049999, -182.770004, 1008.469971, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2541, -21.020000, -179.919998, 1006.669983, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19449, -30.730000, -179.440002, 1008.489990, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19449, -21.110001, -179.399994, 1008.489990, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(2541, -20.020000, -179.919998, 1006.669983, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(14669, -25.910000, -177.850006, 1006.729980, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19449, -16.500000, -183.080002, 1008.489990, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2541, -19.020000, -179.919998, 1006.669983, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19825, -19.520000, -179.529999, 1009.270020, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2541, -18.020000, -179.919998, 1006.669983, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19877, -13.070000, -182.869995, 1008.750000, 0.000000, 0.000000, -90.000000);

	// Rejas SFDP
	CreateDynamicObject(984, -1592.29871, 712.25092, -5.61160,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, -1592.29871, 720.33691, -5.61160,   0.00000, 0.00000, 90.00000);

	// Rejas LVDP
	CreateDynamicObject(984, 2288.19019, 2428.52954, 2.89620,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 2274.81592, 2428.52954, 2.89620,   0.00000, 0.00000, 0.00000);

	// Casa circulo
	CreateDynamicObject(8417, 1100.82971, -825.41302, 106.44310,   0.00000, 180.00000, 8.00000);
	CreateDynamicObject(5302, 1103.27002, -816.54999, 86.76000,   90.00000, 0.00000, 91.07000);

	// Boleterias y pantallas
	CreateDynamicObject(2754, 1729.68311, -1942.34570, 13.49110,   0.00000, -16.00000, 90.00000);
	CreateDynamicObject(2754, 823.55548, -1353.05615, -0.43030,   0.00000, -18.00000, 48.00000);
	CreateDynamicObject(2754, -1960.71155, 141.99190, 27.88580,   0.00000, -20.00000, 180.00000);
	CreateDynamicObject(2754, -1961.29834, 130.12930, 27.65780,   0.00000, -20.00000, 0.00000);
	CreateDynamicObject(2754, 1439.53345, 2645.57642, 11.49720,   0.00000, -12.00000, 90.00000);
	CreateDynamicObject(2754, 2855.49438, 1296.84717, 11.55130,   0.00000, -14.00000, 180.00000);
	CreateDynamicObject(19167, 1729.63904, -1942.79016, 14.02160,   -270.00000, -90.00000, 90.00000);
	CreateDynamicObject(19167, 823.24988, -1353.38501, 0.03580,   90.00000, -90.00000, 45.00000);
	CreateDynamicObject(19167, -1960.25183, 141.96091, 28.34970,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19167, -1961.75659, 130.14169, 28.12620,   90.00000, 90.00000, 180.00000);
	CreateDynamicObject(19167, 1439.50928, 2645.16772, 11.99860,   90.00000, -90.00000, 90.00000);
	CreateDynamicObject(19167, 2855.91992, 1296.84387, 12.08330,   90.00000, -90.00000, 180.00000);
	CreateDynamicObject(962, 832.14069, -1361.21155, -0.69850,   90.00000, 2.00000, -47.00000);

	// Interior Banco Peque??	CreateDynamicObject(1495, 824.41998, 10.88000, 1003.17999,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2284, 827.76001, -0.98000, 1005.63000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2290, 828.78003, -1.00000, 1003.16998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2773, 828.46997, 5.09000, 1003.66998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 827.53998, 7.97000, 1003.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 828.46997, 3.18000, 1003.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 826.56000, 7.01000, 1003.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 826.56000, 5.09000, 1003.66998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 827.53998, 2.21000, 1003.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 825.62000, 4.13000, 1003.69000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 825.62000, 2.21000, 1003.69000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8657, 824.95001, 12.86000, 1003.16998,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(8657, 824.95001, -2.32000, 1003.16998,   90.00000, 0.00000, 180.00000);
	CreateDynamicObject(19464, 833.29999, 12.11000, 1005.71002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19464, 834.96997, 1.49000, 1005.71002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19464, 834.96997, 13.33000, 1005.71002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19464, 827.37000, 12.11000, 1005.71002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19464, 833.28003, -1.59000, 1005.71002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19464, 827.35999, -1.59000, 1005.71002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19465, 834.96997, 7.41000, 1005.71002,   0.00000, 0.00000, 0.00000);

	// Entrega Transportista
	CreateDynamicObject(3246, 2881.93994, 1768.18994, 9.79000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3474, 2870.47998, 1726.63000, 16.63000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3585, 2895.11011, 1748.88000, 11.42000,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(3585, 2866.13989, 1689.47998, 11.44000,   0.00000, 0.00000, -49.50000);
	CreateDynamicObject(5126, 2892.34009, 1750.06006, 24.79000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8339, 2886.52002, 1697.48999, 13.77000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8342, 2866.93994, 1777.33997, 12.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12859, 2861.93994, 1751.72998, 9.80000,   0.00000, 0.00000, 0.00000);

	//CLUB STRIPTEASE
	CreateDynamicObject(19374, 1202.20703, -8.99510, 1002.13031,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19374, 1208.33728, -8.70550, 1002.13031,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19374, 1202.20703, -7.91510, 1002.13031,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19374, 1206.78235, -7.06860, 1002.13031,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19374, 1206.78235, -5.74860, 1002.13031,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19374, 1209.84229, -7.02860, 1002.13031,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19374, 1209.84229, -5.74860, 1002.13031,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19374, 1208.31726, -4.06550, 1002.13031,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19374, 1213.85107, -7.29100, 1002.13031,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19374, 1212.80396, -5.11000, 1002.13031,   0.00000, 0.00000, 45.36700);
	CreateDynamicObject(19374, 1212.77759, -2.95590, 1002.13031,   0.00000, 0.00000, 134.48351);
	CreateDynamicObject(14832, 1212.18750, -2.17190, 1001.22882,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14837, 1212.18750, -2.17190, 1001.22882,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14833, 1212.35156, -2.17190, 1001.28882,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 1218.58862, -8.83950, 1002.13031,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19374, 1215.04919, -3.06890, 1002.13031,   0.00000, 0.00000, 45.36700);
	CreateDynamicObject(19374, 1221.92737, -10.91010, 1002.13031,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 1220.52820, -4.11690, 1002.13031,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19374, 1223.41956, -12.56112, 1002.13031,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19374, 1222.01001, -2.69322, 1002.13031,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19374, 1223.65088, -1.15830, 1002.13031,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19836, 1202.71399, 9.10360, 999.94421,   0.00000, 0.00000, 0.00000);

	// Comprar Licencia
	CreateObject(18753, 1170.04004, 5.55000, 1019.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1168.96997, -14.31000, 1020.73999,   0.00000, 0.00000, 185.00000);
	CreateDynamicObject(630, 1165.42004, -14.25000, 1020.73999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1160.73999, -14.40000, 1020.73999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1235, 1160.68005, -9.51000, 1020.15002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1557, 1168.70996, -14.98000, 1019.64001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1557, 1165.70996, -14.98000, 1019.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1704, 1174.15002, -9.70000, 1019.62000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1721, 1174.63000, -6.52000, 1019.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1721, 1165.01001, -3.57000, 1019.66998,   0.00000, 0.00000, 378.00000);
	CreateDynamicObject(1721, 1174.63000, -5.52000, 1019.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1721, 1174.63000, -4.52000, 1019.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1721, 1166.44995, -1.78000, 1019.66998,   0.00000, 0.00000, 78.00000);
	CreateDynamicObject(1721, 1174.63000, -3.52000, 1019.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1721, 1174.63000, -2.52000, 1019.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1721, 1174.80005, 1.61000, 1019.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, 1164.05005, -14.20000, 1019.66998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1723, 1160.70996, -13.04000, 1019.66998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, 1174.13000, -12.22000, 1019.64001,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1742, 1164.25000, 3.84000, 1019.65997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1775, 1160.52002, -7.62000, 1020.64001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1806, 1163.78003, -0.82000, 1019.59998,   0.00000, 0.00000, 198.00000);
	CreateDynamicObject(1806, 1161.78003, -0.80000, 1019.59998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1806, 1172.45996, 0.72000, 1019.59998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1806, 1172.65002, 1.65000, 1019.59998,   0.00000, 0.00000, 15.00000);
	CreateDynamicObject(1823, 1162.06006, 0.49000, 1019.72998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2002, 1174.44995, -7.98000, 1019.64001,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2008, 1162.68994, -1.82000, 1019.69000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2009, 1164.87000, -0.93000, 1019.69000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2069, 1174.23999, -0.46000, 1019.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2069, 1164.91003, 1.85000, 1019.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2162, 1160.96997, 3.73000, 1021.16998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2162, 1175.01001, 3.19000, 1021.41998,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2163, 1162.08997, 3.72000, 1019.65997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 1160.01001, -0.74000, 1019.64001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2164, 1174.91003, -0.09000, 1019.63000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2173, 1172.94995, -0.45000, 1019.65002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2200, 1166.06006, 3.62000, 1019.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2202, 1164.92004, 0.01000, 1019.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2202, 1160.56006, 2.20000, 1019.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2251, 1162.95996, 3.43000, 1021.41998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2272, 1170.78003, 3.24000, 1021.71997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2273, 1160.45996, 1.86000, 1021.73999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2276, 1162.02002, -14.40000, 1021.71997,   0.00000, 0.00000, 2700.00000);
	CreateDynamicObject(2289, 1174.97998, -9.78000, 1021.98999,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2311, 1162.33997, -12.11000, 1019.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2372, 1171.27002, 0.34000, 1019.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2561, 1174.63000, -2.05000, 1020.95001,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2604, 1173.09998, 3.00000, 1020.22998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2610, 1160.32996, -1.49000, 1020.46002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2700, 1159.94995, -8.22000, 1022.40002,   0.00000, 0.00000, -13.50000);
	CreateDynamicObject(2700, 1160.14001, -4.24000, 1022.29999,   0.00000, 0.00000, 0.50000);
	CreateDynamicObject(2811, 1170.19995, 3.08000, 1019.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2825, 1163.18994, -12.07000, 1020.14001,   0.00000, 0.00000, 25.00000);
	CreateDynamicObject(3354, 1175.16003, -4.64000, 1021.35999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3810, 1171.34998, -14.19000, 1022.03998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3810, 1160.69995, -5.84000, 1022.03998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19171, 1160.06006, -10.54000, 1021.64001,   -270.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, 1170.06006, -10.38000, 1019.56000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, 1159.56006, -10.38000, 1019.56000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, 1170.06006, -0.75000, 1019.56000,   0.00000, 90.02000, 0.00000);
	CreateDynamicObject(19378, 1159.56006, -0.75000, 1019.56000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1169.83997, -10.24000, 1023.03998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1159.33997, -10.24000, 1023.03998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1169.83997, -0.62000, 1023.03998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1159.33997, -0.62000, 1023.03998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19407, 1175.09998, -4.08000, 1021.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19453, 1170.22998, -15.04000, 1021.34998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19453, 1160.60999, -15.04000, 1021.34998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19453, 1159.89001, -10.32000, 1021.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19453, 1175.09998, -10.49000, 1021.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19453, 1159.89001, -0.70000, 1021.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19453, 1175.09998, 2.33000, 1021.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19453, 1170.38000, 3.83000, 1021.34998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19453, 1160.76001, 3.83000, 1021.34998,   0.00000, 0.00000, 90.00000);

	// Combustible Aereo LV
	CreateDynamicObject(3465, 1318.78, 1547.69, 11.11,   0.00, 0.00, 180.00);
	CreateDynamicObject(3465, 1318.78, 1532.55, 11.11,   0.00, 0.00, 180.00);
	CreateDynamicObject(3934, 1332.66, 1540.41, 9.81,   0.00, 0.00, 0.00);
	CreateDynamicObject(9192, 1345.28, 1520.65, 14.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(10814, 1322.54, 1542.54, 13.69,   0.00, 0.00, -90.00);
	CreateDynamicObject(11392, 1329.67, 1544.93, 9.83,   0.00, 0.00, 0.00);

	// Combustible Aereo SF
	CreateDynamicObject(3465, -1101.21, -182.77, 14.44,   0.00, 0.00, 45.02);
	CreateDynamicObject(3465, -1109.29, -190.89, 14.44,   0.00, 0.00, 45.02);
	CreateDynamicObject(3934, -1116.75, -175.00, 13.15,   0.00, 0.00, 44.57);
	CreateDynamicObject(9192, -1118.83, -199.54, 17.95,   0.00, 0.00, 47.74);
	CreateDynamicObject(11392, -1123.40, -171.26, 13.16,   0.00, 0.00, 0.00);

	// Combustible Airport LS
	CreateDynamicObject(3465, 1947.42, -2631.66, 13.85,   0.02, 0.00, 0.00);
	CreateDynamicObject(3465, 1947.42, -2646.78, 13.85,   0.02, 0.00, 0.00);
	CreateDynamicObject(3465, 1987.20, -2646.78, 13.85,   0.02, 0.00, 0.00);
	CreateDynamicObject(3465, 1987.20, -2631.66, 13.85,   0.02, 0.00, 0.00);
	CreateDynamicObject(3934, 1968.36, -2638.58, 12.55,   0.00, 0.00, 0.00);
	CreateDynamicObject(9192, 1945.16, -2618.32, 17.14,   0.00, 0.00, 90.00);
	CreateDynamicObject(10814, 1951.03, -2636.59, 16.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(10814, 1983.51, -2641.40, 16.43,   0.00, 0.00, 90.00);

	// Combustible Muelle LV
	CreateDynamicObject(984, 2353.23999, 594.08002, 9.72000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(984, 2353.23999, 570.00000, 9.72000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(3465, 2315.30005, 585.32001, 11.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2315.30005, 582.20001, 11.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2326.10010, 585.32001, 11.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2315.30005, 579.28003, 11.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2326.10010, 582.20001, 11.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2315.30005, 576.17999, 11.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2326.10010, 579.28003, 11.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2326.10010, 576.17999, 11.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2293.78003, 522.59003, 2.15000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3465, 2290.04004, 522.59003, 2.15000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8555, 2315.26001, 583.28998, -13.49000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9171, 2317.36011, 582.97998, 12.95000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(9193, 2294.70996, 604.45001, 14.83000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(9193, 2298.91992, 522.88000, 5.65000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19445, 2357.50000, 596.96997, 8.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19445, 2357.50000, 587.34998, 8.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19445, 2357.50000, 577.71002, 8.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19445, 2352.62012, 563.37000, 8.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19445, 2357.50000, 568.09003, 8.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2355.48999, 588.59998, 9.85000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2355.48999, 598.21997, 9.85000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2355.48999, 568.42999, 9.85000,   0.00000, 90.00000, 0.00000);

	// Banco Central
	CreateObject(14853, 1069.18005, -151.36000, 1001.07001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 1078.71997, -147.31000, 1001.77002,   0.00000, 0.00000, 46.96000);
	CreateDynamicObject(756, 1081.20996, -148.77000, 1000.57001,   0.00000, 0.00000, 131.50999);
	CreateDynamicObject(756, 1079.96997, -147.28999, 1000.57001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(756, 1077.31995, -144.94000, 1000.57001,   0.00000, 0.00000, 90.36000);
	CreateDynamicObject(1549, 1077.10999, -138.34000, 1000.10999,   0.00000, 0.00000, 61.00000);
	CreateDynamicObject(1726, 1076.98999, -141.07001, 1000.10999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1726, 1076.98999, -133.81000, 1000.10999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1727, 1078.84998, -142.58000, 1000.10999,   0.00000, 0.00000, 159.25999);
	CreateDynamicObject(1727, 1077.62000, -137.74001, 1000.10999,   0.00000, 0.00000, 38.82000);
	CreateDynamicObject(1746, 1078.83997, -140.03000, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 1102.56006, -149.21001, 1000.12000,   0.00000, 0.00000, 316.89999);
	CreateDynamicObject(1806, 1102.56006, -145.23000, 1000.12000,   0.00000, 0.00000, 279.00000);
	CreateDynamicObject(1806, 1105.35999, -148.28000, 1000.12000,   0.00000, 0.00000, 92.13000);
	CreateDynamicObject(1806, 1102.56006, -141.75000, 1000.12000,   0.00000, 0.00000, 271.88000);
	CreateDynamicObject(1806, 1105.59998, -144.25000, 1000.12000,   0.00000, 0.00000, 92.13000);
	CreateDynamicObject(1806, 1105.59998, -140.99001, 1000.12000,   0.00000, 0.00000, 99.24000);
	CreateDynamicObject(1806, 1092.01001, -133.64000, 1000.12000,   0.00000, 0.00000, 175.57001);
	CreateDynamicObject(1806, 1093.79004, -133.64000, 1000.12000,   0.00000, 0.00000, 175.57001);
	CreateDynamicObject(1806, 1095.56995, -133.64000, 1000.12000,   0.00000, 0.00000, 204.21001);
	CreateDynamicObject(1806, 1090.01001, -133.64000, 1000.12000,   0.00000, 0.00000, -178.00000);
	CreateDynamicObject(1806, 1105.14001, -132.83000, 1000.12000,   0.00000, 0.00000, 134.92000);
	CreateDynamicObject(1808, 1081.03003, -135.50999, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1808, 1078.13000, -130.50999, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1886, 1096.47998, -152.42000, 1004.60999,   20.26000, 0.00000, 239.69000);
	CreateDynamicObject(1886, 1086.02002, -149.03000, 1005.04999,   40.26000, 0.00000, 180.00000);
	CreateDynamicObject(1886, 1105.69995, -135.85001, 1005.04999,   20.26000, 0.00000, 302.42001);
	CreateDynamicObject(1886, 1077.19995, -135.85001, 1005.04999,   20.26000, 0.00000, 66.76000);
	CreateDynamicObject(1892, 1092.35999, -149.98000, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1892, 1095.47998, -149.98000, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1892, 1089.16003, -149.98000, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1998, 1105.14001, -149.23000, 1000.07001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1998, 1105.14001, -145.28999, 1000.07001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1998, 1105.14001, -141.92999, 1000.07001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1998, 1092.72998, -133.64999, 1000.10999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1998, 1094.65002, -133.64999, 1000.10999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1998, 1090.81006, -133.64999, 1000.10999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1998, 1096.56995, -133.64999, 1000.10999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2001, 1089.18005, -152.25000, 1000.10999,   0.00000, 0.00000, 73.73000);
	CreateDynamicObject(2001, 1096.54004, -152.25000, 1000.10999,   0.00000, 0.00000, 73.73000);
	CreateDynamicObject(2001, 1083.55005, -149.34000, 1000.10999,   0.00000, 0.00000, 73.73000);
	CreateDynamicObject(2161, 1106.23999, -146.32001, 1000.12000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2161, 1096.20996, -130.27000, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2162, 1094.43005, -130.25000, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2162, 1087.39001, -130.25000, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 1089.37000, -130.25000, 1000.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2186, 1091.53003, -130.73000, 1000.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2252, 1076.80005, -143.53999, 1001.34998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2266, 1076.96997, -140.13000, 1002.26001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2282, 1105.77002, -144.33000, 1001.96002,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2700, 1080.40002, -135.52000, 1003.63000,   0.00000, 15.00000, 258.44000);
	CreateDynamicObject(2754, 1086.98999, -149.41000, 1001.01001,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2754, 1084.93005, -149.41000, 1001.01001,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2773, 1093.41003, -142.57001, 1000.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1091.48999, -142.57001, 1000.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1089.56995, -142.57001, 1000.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1094.39001, -141.61000, 1000.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 1096.31995, -141.61000, 1000.64001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 1091.48999, -140.64999, 1000.63000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1089.56995, -140.64999, 1000.63000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1097.25000, -140.64999, 1000.63000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1092.46997, -139.69000, 1000.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 1094.39001, -139.69000, 1000.64001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 1091.48999, -138.73000, 1000.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1089.56995, -138.73000, 1000.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1097.25000, -138.73000, 1000.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 1094.39001, -137.77000, 1000.64001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 1096.31995, -137.77000, 1000.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 1100.67004, -135.53000, 1000.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2773, 1079.46997, -135.53000, 1000.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2826, 1078.82996, -140.03000, 1000.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16760, 2439.73999, 2279.19995, 21.66000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19176, 2449.889893, 2290.260010, 11.300000, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(5422, 2455.979980, 2403.229980, 11.430000, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(16760, 1103.75000, -132.89999, 1008.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18075, 1090.10999, -142.62000, 1004.92999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18075, 1101.31006, -142.62000, 1004.92999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18075, 1078.39001, -142.62000, 1004.92999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18075, 1090.10999, -129.63000, 1004.92999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18075, 1101.31006, -129.63000, 1004.92999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18075, 1078.39001, -129.63000, 1004.92999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18653, 1085.97998, -148.31000, 1002.63000,   180.00000, 0.00000, 206.19000);
	CreateDynamicObject(18653, 1102.20996, -145.84000, 1002.63000,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1102.20996, -142.46001, 1002.63000,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1102.20996, -138.94000, 1002.63000,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1092.93005, -135.22000, 1002.60999,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1091.01001, -135.22000, 1002.60999,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1094.82996, -135.22000, 1002.60999,   180.00000, 0.00000, 206.36000);
	CreateDynamicObject(18653, 1097.31006, -135.22000, 1002.60999,   180.00000, 0.00000, 206.36000);
	CreateDynamicObject(18653, 1087.13000, -135.22000, 1002.60999,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1099.55005, -135.22000, 1002.60999,   180.00000, 0.00000, 206.36000);
	CreateDynamicObject(18653, 1102.31006, -135.22000, 1002.60999,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1080.44995, -135.22000, 1002.60999,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1106.18994, -135.22000, 1002.60999,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1078.48999, -135.22000, 1002.60999,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(18653, 1076.63000, -135.22000, 1002.60999,   180.00000, 0.00000, 192.95000);
	CreateDynamicObject(19176, 2449.88989, 2290.26001, 11.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19176, 1092.82996, -152.88000, 1001.60999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1085.97998, -150.41000, 999.28998,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1104.25000, -145.83000, 999.28998,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1104.25000, -142.45000, 999.28998,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1104.25000, -138.92999, 999.28998,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1083.79004, -135.21001, 1002.07001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1105.63000, -135.21001, 1002.07001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1100.60999, -130.19000, 1002.07001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1075.18994, -135.21001, 1002.07001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1081.32996, -130.19000, 1002.09003,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 1076.35999, -150.61000, 1000.17999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 1076.35999, -140.99001, 1000.17999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1090.53003, -148.05000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1101.03003, -148.05000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1080.03003, -148.05000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1090.53003, -138.42000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1101.03003, -138.42000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1080.03003, -138.42000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1090.53003, -128.80000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1101.03003, -128.80000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1080.03003, -128.80000, 1000.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19446, 1094.81006, -135.21001, 999.26001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19446, 1091.94995, -135.21001, 1004.29999,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(19446, 1085.18994, -135.21001, 999.26001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19446, 1101.56995, -135.21001, 1004.29999,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(19446, 1082.32996, -135.21001, 1004.29999,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(19446, 1102.31006, -133.37000, 1004.29999,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(19446, 1106.51001, -135.21001, 999.26001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19446, 1073.75000, -135.21001, 999.26001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19446, 1072.68994, -135.21001, 1004.29999,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 1098.43994, -135.21001, 1001.88000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 1092.92004, -134.10001, 1001.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 1091.00000, -134.10001, 1001.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 1094.81995, -134.10001, 1001.88000,   0.00000, 0.00000, 0.00000);


	// Oficina Transportista
	CreateDynamicObject(630, 2595.47998, 1649.71997, 1087.57996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 2588.40991, 1640.84998, 1087.57996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 2582.16992, 1649.46997, 1087.57996,   0.00000, 0.00000, 16.78000);
	CreateDynamicObject(630, 2585.79004, 1640.76001, 1087.57996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(923, 2588.64990, 1667.33997, 1087.43994,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(923, 2575.65991, 1659.31006, 1087.43994,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(923, 2580.43994, 1675.54004, 1087.43994,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(923, 2576.39990, 1678.53003, 1087.43994,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1502, 2572.98999, 1640.23999, 1086.55005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1714, 2595.25000, 1643.45996, 1086.56006,   0.00000, 0.00000, 188.88000);
	CreateDynamicObject(1714, 2592.97998, 1643.47998, 1086.56006,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(1714, 2592.30005, 1641.29004, 1086.56006,   0.00000, 0.00000, -4.00000);
	CreateDynamicObject(1714, 2585.14990, 1642.29004, 1086.56006,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(1714, 2583.01001, 1642.28003, 1086.56006,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(1723, 2583.11011, 1649.59998, 1086.55005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, 2582.18994, 1646.59998, 1086.55005,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, 2565.65991, 1635.51001, 1086.55005,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1998, 2592.18994, 1643.84998, 1086.55005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2002, 2589.86011, 1640.84998, 1086.56006,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2008, 2594.14990, 1644.81006, 1086.55005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2008, 2593.17993, 1640.88000, 1086.55005,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2008, 2584.23999, 1643.52002, 1086.55005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2008, 2582.28003, 1643.52002, 1086.55005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 2592.12012, 1643.83997, 1090.67004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 2585.14990, 1647.41003, 1090.67004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 2585.13989, 1643.81995, 1090.67004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2167, 2594.26001, 1640.34998, 1086.56006,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2595.19995, 1640.35999, 1086.56006,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2590.92993, 1640.32996, 1086.56006,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2272, 2592.23999, 1640.83997, 1089.00000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2277, 2595.17993, 1647.22998, 1089.08997,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2286, 2595.78003, 1638.06006, 1088.42004,   0.00000, 91.00000, -90.00000);
	CreateDynamicObject(2356, 2594.07007, 1646.26001, 1086.55005,   0.00000, 0.00000, 189.03000);
	CreateDynamicObject(2356, 2592.13989, 1646.30005, 1086.55005,   0.00000, 0.00000, 174.39000);
	CreateDynamicObject(2356, 2584.92993, 1644.97998, 1086.55005,   0.00000, 0.00000, 174.39000);
	CreateDynamicObject(2356, 2582.60010, 1644.94995, 1086.55005,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(2524, 2573.12012, 1642.42004, 1086.56006,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2525, 2573.76001, 1643.98999, 1086.56006,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2567, 2587.58008, 1674.02002, 1083.30005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2567, 2586.73999, 1676.02002, 1088.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2567, 2561.31006, 1663.97998, 1088.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2567, 2560.96997, 1670.68994, 1088.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2567, 2561.01001, 1676.14001, 1088.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2567, 2561.02002, 1682.10999, 1088.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2596, 2584.68994, 1640.66003, 1089.62000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2773, 2585.96997, 1648.80005, 1087.06995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, 2585.97998, 1644.42004, 1087.06995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3089, 2595.78003, 1637.26001, 1087.90002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3089, 2573.01001, 1640.23999, 1090.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(7891, 2596.39990, 1672.00000, 1088.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(10184, 2596.06006, 1631.66003, 1088.22998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(10184, 2572.47998, 1684.29004, 1089.06006,   0.00000, 0.00000, 265.00000);
	CreateDynamicObject(14583, 2565.68994, 1673.62000, 1088.46997,   0.00000, 0.00000, 0.00000);
	CreateObject(14592, 2587.29004, 1656.21997, 1093.47998,   0.00000, 0.00000, 0.00000);

	// Oficina Unity
	CreateDynamicObject(366, -2022.59998, -112.60000, 1038.90002,   0.00000, 0.00000, 179.05518);
	CreateDynamicObject(1714, -2025.50000, -118.70000, 1037.80005,   0.00000, 0.00000, 207.72949);
	CreateDynamicObject(1714, -2022.59961, -113.50000, 1037.80005,   0.00000, 0.00000, 293.75244);
	CreateDynamicObject(1715, -2026.30005, -115.80000, 1037.80005,   0.00000, 0.00000, 19.77539);
	CreateDynamicObject(1715, -2025.59998, -114.00000, 1037.80005,   0.00000, 0.00000, 89.97803);
	CreateDynamicObject(1716, -2034.80005, -113.60000, 1037.80005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1721, -2027.09998, -112.70000, 1037.80005,   0.00000, 0.00000, 185.07568);
	CreateDynamicObject(1723, -2036.19995, -118.10000, 1037.80005,   0.00000, 0.00000, 88.00049);
	CreateDynamicObject(1723, -2034.59998, -113.10000, 1037.80005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1724, -2036.09998, -114.90000, 1037.80005,   0.00000, 0.00000, 71.19141);
	CreateDynamicObject(1738, -2027.19995, -118.90000, 1038.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1808, -2026.40002, -112.70000, 1037.80005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2008, -2026.00000, -117.40000, 1037.80005,   0.00000, 0.00000, 359.00574);
	CreateDynamicObject(2008, -2023.89941, -114.09961, 1037.80005,   0.00000, 0.00000, 87.00623);
	CreateDynamicObject(2066, -2024.40002, -118.70000, 1037.80005,   0.00000, 0.00000, 270.02197);
	CreateDynamicObject(2066, -2024.00000, -118.10000, 1037.80005,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2162, -2021.40002, -113.60000, 1039.69995,   0.00000, 0.00000, 270.02197);
	CreateDynamicObject(2164, -2021.39941, -113.59961, 1037.80005,   0.00000, 0.00000, 269.04968);
	CreateDynamicObject(2186, -2021.80005, -117.70000, 1037.80005,   0.00000, 0.00000, 271.01074);
	CreateDynamicObject(2195, -2031.30005, -118.60000, 1038.40002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2195, -2031.39941, -113.09961, 1038.40002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2201, -2024.00000, -118.10000, 1039.19995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2239, -2036.09998, -115.30000, 1037.80005,   0.00000, 0.00000, 34.60693);
	CreateDynamicObject(2256, -2030.30005, -119.20000, 1039.40002,   0.00000, 0.00000, 181.03271);
	CreateDynamicObject(2279, -2032.59998, -113.10000, 1040.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2284, -2036.09998, -116.10000, 1039.69995,   0.00000, 0.00000, 89.97803);
	CreateDynamicObject(2287, -2022.00000, -118.00000, 1039.90002,   0.00000, 0.00000, 270.02197);
	CreateDynamicObject(2289, -2022.40002, -112.60000, 1040.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2311, -2033.59998, -116.10000, 1037.80005,   0.00000, 0.00000, 271.01074);
	CreateDynamicObject(2596, -2031.90002, -118.90000, 1040.69995,   0.00000, 0.00000, 198.83044);
	CreateDynamicObject(2596, -2027.55005, -112.88000, 1040.59998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2816, -2033.59998, -117.40000, 1038.30005,   0.00000, 0.00000, 314.51660);
	CreateDynamicObject(2826, -2033.59998, -116.40000, 1038.30005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2833, -2030.69995, -116.60000, 1037.90002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2854, -2024.00000, -114.10000, 1038.59998,   0.00000, 0.00000, 65.25879);
	CreateDynamicObject(2961, -2028.69995, -119.00000, 1039.50000,   0.00000, 0.00000, 183.01025);
	CreateDynamicObject(3055, -2029.90002, -112.40000, 1040.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3089, -2030.64001, -119.20000, 1039.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(4641, -2029.19995, -111.30000, 1039.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14532, -2024.09998, -117.20000, 1038.80005,   0.00000, 0.00000, 0.93384);
	CreateObject(14530, -2029.00000, -114.50000, 1039.59998,   0.00000, 0.00000, 0.00000);

	// Map Garage
	CreateDynamicObject(9093, 302.20901, 300.02090, 999.87598,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1557, 299.47000, 312.13000, 998.15997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1080, 306.12350, 309.86530, 1000.66400,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(2279, 303.07819, 311.51651, 1000.80011,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 304.59659, 311.69241, 999.01239,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1080, 306.12350, 308.93530, 1000.66400,   0.00000, 0.00000, -180.00000);

	//Estacionamiento interior casas
	
	CreateObject(14876, 279.29999, 307.20001, 1013.20001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2280, 277.20001, 311.00000, 1010.90002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1557, 273.94000, 311.70001, 1008.13000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2280, 277.20001, 311.00000, 1010.90002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 279.39999, 311.29999, 1009.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1080, 280.60001, 310.29999, 1010.90002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(9093, 276.79999, 299.67999, 1009.90002,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1080, 280.60001, 309.29999, 1010.90002,   0.00000, 0.00000, 184.00000);
	CreateDynamicObject(1080, 280.60001, 310.29999, 1010.90002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2063, 279.39999, 311.29999, 1009.00000,   0.00000, 0.00000, 0.00000);

	// Barras LS
	CreateDynamicObject(994, 1077.69995, -1842.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(994, 1071.19995, -1842.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(994, 1068.59998, -1836.19995, 12.60000,   0.00000, 0.00000, 294.00000);
	CreateDynamicObject(994, 1066.00000, -1830.30005, 12.60000,   0.00000, 0.00000, 294.00000);
	CreateDynamicObject(994, 1084.19995, -1842.30005, 12.50000,   0.00000, 0.00000, 0.00000);

	// Granjero
	CreateDynamicObject(3279, -388.94119, -1454.96021, 23.98810,   0.00000, 0.00000, 180.00000);

	// Exterior SAPD
	CreateDynamicObject(970, 1544.68994, -1620.40002, 13.03000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(970, 1544.68994, -1635.13000, 13.13000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1495, 1582.62000, -1638.02002, 14.91000,   0.00000, 0.00000, 0.00000);

	// Academia
	CreateObject(19531, 602.830017, -235.979996, 1275.760010, 0.000000, 0.000000, 0.000000, 0.0); // 0
	CreateDynamicObject(19454, 625.73999, -180.13000, 1278.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19460, 624.26001, -180.13000, 1280.38000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19460, 624.26001, -180.13000, 1276.83997,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1720, 630.71002, -186.39999, 1275.76001,   0.00000, 0.00000, 177.66000);
	CreateDynamicObject(19377, 666.75000, -219.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1720, 629.51001, -186.38000, 1275.76001,   0.00000, 0.00000, 174.08000);
	CreateDynamicObject(1720, 628.25000, -186.32001, 1275.76001,   0.00000, 0.00000, 172.23000);
	CreateDynamicObject(1720, 626.97998, -186.38000, 1275.76001,   0.00000, 0.00000, 171.73000);
	CreateDynamicObject(14602, 648.81464, -203.02277, 1281.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 637.46997, -199.25000, 1275.79004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 627.87000, -193.55000, 1275.79004,   0.00000, 0.00000, 270.98001);
	CreateDynamicObject(19377, 657.12000, -219.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19834, 644.28998, -210.03999, 1278.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2627, 663.31000, -222.50000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19273, 643.17999, -210.12000, 1277.14001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19273, 643.15997, -210.48000, 1277.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2627, 660.31000, -222.50000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2162, 625.88000, -196.09000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 657.12000, -219.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1806, 648.38000, -191.71001, 1275.79004,   0.00000, 0.00000, 95.58000);
	CreateDynamicObject(1806, 645.72998, -194.39999, 1275.79004,   0.00000, 0.00000, 271.16000);
	CreateDynamicObject(2627, 663.31000, -222.50000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19834, 644.28998, -210.03999, 1278.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2627, 660.31000, -222.50000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 645.66998, -192.67000, 1275.79004,   0.00000, 0.00000, 293.09000);
	CreateDynamicObject(2627, 657.31000, -222.50000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19273, 643.17999, -210.12000, 1277.14001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19273, 643.15997, -210.48000, 1277.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2627, 654.31000, -222.50000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 647.65002, -218.97000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19273, 645.27002, -217.16000, 1277.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19442, 645.56000, -217.95000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 647.50000, -219.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19397, 644.38000, -217.10001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2164, 645.40997, -187.35001, 1275.79004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19437, 644.28003, -217.94000, 1279.22998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19273, 643.37000, -217.03000, 1277.14001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2202, 642.00000, -189.78999, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 643.26001, -217.95000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14782, 664.73999, -227.67000, 1276.73999,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2001, 637.46997, -199.25000, 1275.79004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 637.46997, -206.71001, 1275.79004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 642.75000, -218.97000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19397, 647.65002, -225.38000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19273, 639.98999, -187.32001, 1277.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19456, 642.75000, -222.16000, 1281.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 643.97998, -181.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 666.75000, -230.49001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19377, 657.12000, -230.49001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(2628, 663.31000, -231.77000, 1275.76001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2628, 660.31000, -231.77000, 1275.76001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19273, 642.81000, -224.42000, 1277.14001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19273, 642.69000, -224.42000, 1277.14001,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1985, 649.91998, -229.36000, 1278.69995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19397, 642.75000, -225.38000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 640.97998, -181.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 643.97998, -178.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2190, 631.96997, -205.32001, 1276.52002,   0.00000, 0.00000, 202.48000);
	CreateDynamicObject(1985, 649.91998, -231.66000, 1278.69995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 647.50000, -230.49001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1714, 630.78998, -203.13000, 1275.79004,   0.00000, 0.00000, 89.60000);
	CreateDynamicObject(19461, 647.65002, -231.78999, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 665.13000, -235.98000, 1275.81006,   90.00000, 90.00000, 180.00000);
	CreateDynamicObject(1256, 640.97998, -175.97000, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 627.87000, -207.05000, 1275.79004,   0.00000, 0.00000, 270.98001);
	CreateDynamicObject(1806, 627.87000, -198.33000, 1275.79004,   0.00000, 0.00000, 270.98001);
	CreateDynamicObject(19461, 642.75000, -231.78999, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14778, 659.35999, -237.75000, 1279.21997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19456, 642.75000, -231.78999, 1281.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1720, 630.71002, -186.39999, 1275.76001,   0.00000, 0.00000, 177.66000);
	CreateDynamicObject(1806, 627.87000, -193.55000, 1275.79004,   0.00000, 0.00000, 270.98001);
	CreateDynamicObject(14791, 657.53998, -238.75999, 1277.28003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 627.87000, -213.61000, 1275.79004,   0.00000, 0.00000, 270.98001);
	CreateDynamicObject(1256, 637.97998, -175.97000, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 634.97998, -178.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2163, 625.84998, -203.17000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2202, 626.37000, -209.19000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2164, 625.89001, -198.62000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1720, 629.51001, -186.38000, 1275.76001,   0.00000, 0.00000, 174.08000);
	CreateDynamicObject(2162, 625.88000, -196.09000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19397, 646.27002, -236.57001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1720, 628.25000, -186.32001, 1275.76001,   0.00000, 0.00000, 172.23000);
	CreateDynamicObject(2164, 625.89001, -213.39999, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3407, 631.69000, -180.16000, 1276.76001,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(19610, 631.69000, -180.16000, 1277.19995,   25.00000, 10.00000, 88.39000);
	CreateDynamicObject(19611, 631.69000, -180.16000, 1275.57996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 666.75000, -240.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19377, 657.12000, -240.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1256, 634.97998, -175.97000, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1720, 626.97998, -186.38000, 1275.76001,   0.00000, 0.00000, 171.73000);
	CreateDynamicObject(19273, 642.81000, -237.25999, 1277.14001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19273, 642.71002, -237.25000, 1277.14001,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2001, 637.46997, -206.71001, 1275.79004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14782, 664.73999, -227.67000, 1276.73999,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1806, 627.87000, -198.33000, 1275.79004,   0.00000, 0.00000, 270.98001);
	CreateDynamicObject(19461, 639.84998, -236.57001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19273, 645.09003, -239.84000, 1277.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 647.50000, -240.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19377, 666.75000, -230.49001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(2627, 657.31000, -222.50000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 602.83002, -173.50999, 1275.81006,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(13640, 625.79999, -222.28999, 1276.65002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 662.03998, -246.17000, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19454, 625.73999, -180.13000, 1278.64001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19364, 663.53998, -246.16000, 1280.96997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2164, 625.89001, -198.62000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1714, 630.78998, -203.13000, 1275.79004,   0.00000, 0.00000, 89.60000);
	CreateDynamicObject(19461, 652.40997, -246.17000, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19460, 624.26001, -180.13000, 1276.83997,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19460, 624.26001, -180.13000, 1280.38000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(3594, 631.03003, -234.74001, 1276.01001,   0.00000, 0.00000, 41.53000);
	CreateDynamicObject(3594, 631.03003, -234.74001, 1278.44995,   0.00000, 0.00000, 39.98000);
	CreateDynamicObject(2627, 654.31000, -222.50000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3594, 631.03003, -234.84000, 1277.22998,   0.00000, 0.00000, 221.86000);
	CreateDynamicObject(3594, 631.03003, -234.74001, 1279.63000,   0.00000, 0.00000, 221.86000);
	CreateDynamicObject(19456, 647.48999, -246.16000, 1280.96997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 627.23999, -237.24001, 1278.13000,   0.00000, 0.00000, 135.62000);
	CreateDynamicObject(13647, 616.77002, -225.89000, 1275.75000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3594, 618.50629, -229.09300, 1278.03003,   30.00000, 0.00000, 5.70440);
	CreateDynamicObject(3594, 625.37000, -239.73000, 1277.05005,   0.00000, 0.00000, 223.85001);
	CreateDynamicObject(3594, 625.37000, -239.73000, 1276.01001,   0.00000, 0.00000, 43.21000);
	CreateDynamicObject(3594, 611.79999, -222.13000, 1276.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2190, 631.96997, -205.32001, 1276.52002,   0.00000, 0.00000, 202.48000);
	CreateDynamicObject(19943, 622.42999, -247.25999, 1276.39001,   -90.00000, 0.00000, 40.60000);
	CreateDynamicObject(19461, 647.65002, -218.97000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 647.50000, -219.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(3594, 603.42999, -222.13000, 1276.01001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3594, 600.79999, -222.08000, 1276.94995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3594, 600.79999, -222.08000, 1276.01001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19913, 617.84998, -252.03000, 1278.08997,   0.00000, 0.00000, 42.22000);
	CreateDynamicObject(19538, 602.83002, -173.50999, 1275.81006,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19943, 617.34998, -252.13000, 1276.39001,   -90.00000, 0.00000, 40.60000);
	CreateDynamicObject(18753, 602.64001, -235.96001, 1301.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(13295, 677.89001, -274.44000, 1282.27002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19943, 612.09003, -256.84000, 1276.39001,   -90.00000, 0.00000, 40.60000);
	CreateDynamicObject(19531, 602.83002, -235.98000, 1307.04004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19955, 589.81000, -221.78000, 1274.93005,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19955, 588.08002, -222.03000, 1274.70996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(13647, 597.09003, -244.91000, 1275.75000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19912, 586.85999, -221.71001, 1281.18005,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(19273, 645.27002, -217.16000, 1277.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 589.69000, -236.11000, 1278.08997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(13590, 584.87000, -226.14999, 1276.89001,   0.00000, 0.00000, 179.83000);
	CreateDynamicObject(1308, 632.35999, -278.20001, 1278.32996,   360.00000, -149.00000, 270.00000);
	CreateDynamicObject(19912, 586.37000, -231.27000, 1278.50000,   0.00000, 0.00000, 85.76000);
	CreateDynamicObject(3594, 587.97998, -236.75999, 1276.13000,   0.00000, 0.00000, 11.48000);
	CreateDynamicObject(19442, 645.56000, -217.95000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 580.75000, -218.77000, 1275.81006,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(8580, 638.73999, -283.16000, 1280.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19437, 644.28003, -217.94000, 1279.22998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19397, 644.38000, -217.10001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19273, 643.37000, -217.03000, 1277.14001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19442, 643.26001, -217.95000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2628, 663.31000, -231.77000, 1275.76001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2163, 625.84998, -203.17000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19461, 642.75000, -218.97000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19912, 582.96002, -231.86000, 1278.50000,   0.00000, 0.00000, 1.99000);
	CreateDynamicObject(19377, 657.12000, -230.49001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(2628, 660.31000, -231.77000, 1275.76001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19456, 642.75000, -222.16000, 1281.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 627.87000, -207.05000, 1275.79004,   0.00000, 0.00000, 270.98001);
	CreateDynamicObject(19538, 665.13000, -235.98000, 1275.81006,   90.00000, 90.00000, 180.00000);
	CreateDynamicObject(19397, 647.65002, -225.38000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2202, 626.37000, -209.19000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1985, 649.91998, -229.36000, 1278.69995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 666.75000, -240.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19273, 642.81000, -224.42000, 1277.14001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19273, 642.69000, -224.42000, 1277.14001,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19397, 642.75000, -225.38000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14778, 659.35999, -237.75000, 1279.21997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1985, 649.91998, -231.66000, 1278.69995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 647.50000, -230.49001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19538, 575.54999, -186.89000, 1275.81006,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 627.87000, -213.61000, 1275.79004,   0.00000, 0.00000, 270.98001);
	CreateDynamicObject(2164, 625.89001, -213.39999, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19461, 647.65002, -231.78999, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 580.56000, -186.91000, 1309.68994,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(14791, 657.53998, -238.75999, 1277.28003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19456, 642.75000, -231.78999, 1281.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 657.12000, -240.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19364, 663.53998, -246.16000, 1280.96997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19538, 580.56000, -186.91000, 1309.68994,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 642.75000, -231.78999, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 662.03998, -246.17000, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19397, 646.27002, -236.57001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19456, 657.12000, -246.16000, 1280.96997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(13640, 625.79999, -222.28999, 1276.65002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 647.50000, -240.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19456, 639.84998, -236.57001, 1281.01001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19273, 642.81000, -237.25999, 1277.14001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19273, 642.71002, -237.25000, 1277.14001,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19397, 646.03998, -239.75999, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19461, 647.65002, -241.41000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19397, 642.74982, -238.25722, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19273, 645.09998, -239.69000, 1277.14001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19273, 645.09003, -239.84000, 1277.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 639.84998, -236.57001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 643.63000, -239.75999, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19461, 652.40997, -246.17000, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19456, 642.75000, -241.41000, 1280.95996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14782, 651.22998, -245.70000, 1276.73999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19456, 647.48999, -246.16000, 1280.96997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 631.03003, -234.74001, 1279.63000,   0.00000, 0.00000, 221.86000);
	CreateDynamicObject(3594, 631.03003, -234.74001, 1278.44995,   0.00000, 0.00000, 39.98000);
	CreateDynamicObject(3594, 631.03003, -234.84000, 1277.22998,   0.00000, 0.00000, 221.86000);
	CreateDynamicObject(3594, 631.03003, -234.74001, 1276.01001,   0.00000, 0.00000, 41.53000);
	CreateDynamicObject(13647, 616.77002, -225.89000, 1275.75000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3594, 611.79999, -222.13000, 1276.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3594, 618.50629, -229.09300, 1278.03003,   30.00000, 0.00000, 5.70440);
	CreateDynamicObject(3594, 627.23999, -237.24001, 1278.13000,   0.00000, 0.00000, 135.62000);
	CreateDynamicObject(19538, 575.54999, -186.89000, 1275.81006,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19273, 639.98999, -187.32001, 1277.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 634.97998, -181.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 645.66998, -192.67000, 1275.79004,   0.00000, 0.00000, 293.09000);
	CreateDynamicObject(19377, 666.75000, -219.99001, 1279.31995,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1720, 626.96002, -174.03000, 1275.76001,   0.00000, 0.00000, 22.26000);
	CreateDynamicObject(19273, 640.00000, -186.89999, 1277.14001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2009, 648.17999, -194.50999, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1806, 645.72998, -191.60001, 1275.79004,   0.00000, 0.00000, 271.16000);
	CreateDynamicObject(1720, 628.25000, -174.03000, 1275.76001,   0.00000, 0.00000, 8.11000);
	CreateDynamicObject(1999, 647.20001, -192.49001, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1806, 648.38000, -193.41000, 1275.79004,   0.00000, 0.00000, 89.62000);
	CreateDynamicObject(2162, 642.83002, -187.35001, 1275.79004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1720, 629.51001, -174.03999, 1275.76001,   0.00000, 0.00000, 6.39000);
	CreateDynamicObject(1256, 634.97998, -178.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 637.97998, -181.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1720, 630.78003, -174.10001, 1275.76001,   0.00000, 0.00000, 350.94000);
	CreateDynamicObject(1806, 648.38000, -191.71001, 1275.79004,   0.00000, 0.00000, 95.58000);
	CreateDynamicObject(2164, 645.40997, -187.35001, 1275.79004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 637.97998, -178.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 640.97998, -181.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 634.97998, -175.97000, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2163, 648.23999, -187.36000, 1275.79004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 640.97998, -178.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 637.97998, -175.97000, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 643.97998, -181.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1557, 663.85999, -202.19000, 1275.80005,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1256, 640.97998, -175.97000, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 643.97998, -178.99001, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 643.97998, -175.97000, 1276.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 625.79999, -156.22000, 1275.81006,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19538, 708.06000, -218.77000, 1275.81006,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 705.21997, -218.75999, 1310.38000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 702.12000, -186.89000, 1275.81006,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 650.02002, -124.46000, 1275.81006,   90.00000, 0.00000, -90.00000);
	CreateDynamicObject(19531, 675.78131, -124.95560, 1283.36462,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3594, 625.37000, -239.73000, 1277.05005,   0.00000, 0.00000, 223.85001);
	CreateDynamicObject(3594, 625.37000, -239.73000, 1276.01001,   0.00000, 0.00000, 43.21000);
	CreateDynamicObject(13295, 677.89001, -274.44000, 1282.27002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3594, 603.42999, -222.13000, 1276.01001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19531, 602.83002, -235.98000, 1307.04004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3594, 600.79999, -222.08000, 1276.94995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3594, 600.79999, -222.08000, 1276.01001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18753, 602.64001, -235.96001, 1301.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3279, 610.69000, -233.49001, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19943, 622.42999, -247.25999, 1276.39001,   -90.00000, 0.00000, 40.60000);
	CreateDynamicObject(19913, 615.96997, -243.08000, 1278.08997,   0.00000, 0.00000, 42.22000);
	CreateDynamicObject(19955, 589.81000, -221.78000, 1274.93005,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19912, 586.85999, -221.71001, 1281.18005,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(19955, 588.08002, -222.03000, 1274.70996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 624.13000, -256.60999, 1278.08997,   0.00000, 0.00000, 42.22000);
	CreateDynamicObject(19913, 617.84998, -252.03000, 1278.08997,   0.00000, 0.00000, 42.22000);
	CreateDynamicObject(19943, 617.34998, -252.13000, 1276.39001,   -90.00000, 0.00000, 40.60000);
	CreateDynamicObject(19538, 580.75000, -218.77000, 1275.81006,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(13590, 584.87000, -226.14999, 1276.89001,   0.00000, 0.00000, 179.83000);
	CreateDynamicObject(19912, 586.37000, -231.27000, 1278.50000,   0.00000, 0.00000, 85.76000);
	CreateDynamicObject(19913, 589.69000, -236.11000, 1278.08997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19912, 582.96002, -231.86000, 1278.50000,   0.00000, 0.00000, 1.99000);
	CreateDynamicObject(19943, 612.09003, -256.84000, 1276.39001,   -90.00000, 0.00000, 40.60000);
	CreateDynamicObject(13647, 597.09003, -244.91000, 1275.75000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 587.97998, -236.75999, 1276.13000,   0.00000, 0.00000, 11.48000);
	CreateDynamicObject(19912, 593.71997, -248.92999, 1279.30005,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(1308, 632.35999, -278.20001, 1278.32996,   360.00000, -149.00000, 270.00000);
	CreateDynamicObject(19956, 583.88000, -239.88000, 1274.97998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(8580, 638.73999, -283.16000, 1280.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19402, 633.98999, -280.12000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19865, 636.89001, -281.20999, 1274.82996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1278, 625.08002, -274.89999, 1276.56006,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19448, 629.25000, -278.42001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19912, 582.20001, -242.03000, 1278.50000,   0.00000, 0.00000, 352.79999);
	CreateDynamicObject(3594, 590.34998, -249.96001, 1278.89001,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19325, 634.03998, -281.89999, 1276.66003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 633.97998, -281.95999, 1276.66003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19912, 571.46002, -232.28000, 1278.50000,   0.00000, 0.00000, 6.94000);
	CreateDynamicObject(19325, 633.94000, -282.07999, 1276.66003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2788, 632.20001, -281.16000, 1276.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19533, 644.45001, -288.09000, 1275.78003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1308, 625.94000, -278.20001, 1278.32996,   360.00000, -149.00000, 270.00000);
	CreateDynamicObject(19402, 633.98999, -283.32001, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2747, 630.89001, -281.26999, 1276.41003,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19589, 599.97998, -259.48999, 1275.76001,   0.00000, 0.00000, 40.13000);
	CreateDynamicObject(19589, 601.96997, -261.29001, 1275.76001,   0.00000, 0.00000, 40.13000);
	CreateDynamicObject(2788, 629.72998, -281.20999, 1276.48999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19386, 627.33002, -280.10999, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19589, 603.23999, -263.31000, 1275.76001,   0.00000, 0.00000, 40.13000);
	CreateDynamicObject(19381, 632.00000, -283.32001, 1275.88000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1491, 627.34998, -280.85001, 1275.76001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3363, 572.82001, -236.53999, 1275.75000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19386, 624.38000, -280.10001, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19386, 633.98999, -286.53000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19378, 628.83002, -283.32001, 1275.90002,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19448, 619.84003, -278.41000, 1277.48999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3279, 558.70001, -222.97000, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 624.39001, -280.84000, 1275.76001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1308, 618.88000, -278.20001, 1278.32996,   360.00000, -149.00000, 270.00000);
	CreateDynamicObject(1726, 629.56000, -284.19000, 1275.98999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1507, 634.01001, -287.26999, 1275.82996,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19912, 583.87000, -252.19000, 1278.50000,   0.00000, 0.00000, 80.19000);
	CreateDynamicObject(19356, 624.38000, -283.31000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1726, 631.54999, -287.42001, 1275.98999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19912, 570.72998, -240.60001, 1278.50000,   0.00000, 0.00000, 349.00000);
	CreateDynamicObject(3594, 586.47998, -256.01001, 1276.13000,   0.00000, 0.00000, 132.55000);
	CreateDynamicObject(19448, 627.33002, -286.53000, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2297, 627.71997, -286.48999, 1275.98999,   0.00000, 0.00000, 44.82000);
	CreateDynamicObject(19448, 629.25000, -288.10001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2417, 621.62000, -283.00000, 1275.98999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19386, 615.08002, -279.98001, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2514, 623.83002, -285.10999, 1275.98999,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19356, 621.03998, -284.01001, 1277.46997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19448, 619.84003, -283.48999, 1277.48999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 563.44000, -235.88000, 1277.96997,   30.00000, 0.00000, 90.00000);
	CreateDynamicObject(19386, 624.38000, -286.51999, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19386, 622.71997, -285.54001, 1277.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2141, 618.91998, -282.88000, 1275.98999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3361, 630.06000, -290.39999, 1277.82996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1498, 615.10999, -280.72000, 1275.79004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19956, 592.38000, -263.54001, 1274.97998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1491, 621.94000, -285.54999, 1275.76001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19378, 618.33002, -283.32001, 1275.90002,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1491, 624.39001, -287.26001, 1275.76001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2049, 547.20001, -218.81000, 1277.25000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2145, 616.89001, -283.17999, 1274.17004,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2145, 616.15002, -283.17999, 1275.03003,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2145, 615.39001, -283.17999, 1275.77002,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1308, 614.84998, -284.64001, 1278.32996,   360.00000, -149.00000, 357.63000);
	CreateDynamicObject(2049, 545.35999, -218.81000, 1277.25000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19448, 619.84003, -288.07001, 1277.48999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1798, 617.82001, -287.04001, 1275.94995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19448, 615.07001, -286.39001, 1277.51001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2049, 543.46002, -218.81000, 1277.25000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19956, 583.71002, -262.14999, 1274.97998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3415, 555.71002, -235.92999, 1275.77002,   0.00000, 0.00000, 180.96001);
	CreateDynamicObject(3594, 550.83331, -231.05580, 1277.96997,   30.00000, 11.00000, 188.00000);
	CreateDynamicObject(3819, 603.22998, -282.67999, 1276.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19955, 550.84998, -236.05000, 1278.71997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 579.57001, -265.69000, 1278.03003,   25.00000, 0.00000, 90.00000);
	CreateDynamicObject(13647, 577.39001, -263.92999, 1275.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3594, 580.57001, -267.57001, 1278.01001,   35.00000, -40.00000, 96.00000);
	CreateDynamicObject(3356, 556.34003, -246.13000, 1279.72998,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3594, 577.78998, -266.42001, 1276.13000,   0.00000, 0.00000, 82.39000);
	CreateDynamicObject(3594, 576.02002, -266.62000, 1277.29004,   0.00000, 0.00000, 107.45000);
	CreateDynamicObject(1327, 591.06000, -278.87000, 1275.73999,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19913, 574.34998, -268.81000, 1278.08997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 549.40002, -243.75999, 1278.08997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19957, 550.83002, -247.14000, 1278.88000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3819, 603.22998, -293.44000, 1276.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19538, 540.35999, -235.98000, 1275.81006,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19912, 562.96997, -263.54999, 1278.50000,   0.00000, 0.00000, 268.98001);
	CreateDynamicObject(1327, 591.22998, -286.98999, 1275.73999,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(3594, 565.83002, -266.51001, 1276.98999,   0.00000, 0.00000, 111.87000);
	CreateDynamicObject(19913, 605.60999, -298.41000, 1278.08997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3594, 565.83002, -266.51001, 1276.13000,   0.00000, 0.00000, 111.87000);
	CreateDynamicObject(19538, 602.83002, -298.44000, 1275.81006,   90.00000, 0.00000, 180.00000);
	CreateDynamicObject(3594, 553.27002, -262.32001, 1276.13000,   0.00000, 0.00000, 93.04000);
	CreateDynamicObject(1327, 560.01001, -278.85001, 1275.73999,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1327, 560.02002, -286.97000, 1275.73999,   0.00000, 90.00000, 90.00000);

	// Interior 40 Oficina
	CreateObject(14576, 1401.660034, 506.440002, 1008.150024, 0.000000, 0.000000, 0.000000, 0.0); // 0
	CreateObject(14577, 1462.270020, 487.500000, 1013.280029, 0.000000, 0.000000, 180.000000, 0.0); // 0
	CreateObject(14592, 1419.300049, 592.619995, 1006.890015, 0.000000, 0.000000, 90.000000, 0.0); // 0
	CreateObject(18753, 1449.310059, 556.010010, 999.440002, 0.000000, 0.000000, 0.000000, 0.0); // 0
	CreateDynamicObject(19354, 1454.079956, 550.039978, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1557, 1454.160034, 550.049988, 999.950012, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1557, 1454.150024, 553.070007, 999.950012, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1454.079956, 553.250000, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2011, 1454.689941, 549.250000, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2010, 1454.739990, 553.919983, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, 1452.420044, 550.200012, 999.909973, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1455.660034, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14527, 1460.380005, 551.669983, 1001.159973, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1455.270020, 548.330017, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1455.270020, 554.750000, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1456.619995, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, 1452.420044, 550.200012, 1003.530029, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1742, 1456.160034, 554.780029, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1457.569946, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1457.699951, 554.729980, 999.950012, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1458.530029, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(9823, 1458.420044, 548.239990, 1001.380005, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19400, 1458.479980, 548.330017, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19384, 1458.479980, 554.750000, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1457.030029, 556.390015, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1459.489990, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14527, 1460.380005, 551.669983, 1001.159973, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2002, 1460.020020, 554.200012, 999.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2561, 1460.459961, 548.840027, 1001.270020, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1460.439941, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1455.510010, 557.919983, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1452.339966, 557.919983, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2558, 1461.180054, 554.250000, 1001.289978, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2273, 1455.640015, 558.489990, 1001.729980, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1459.880005, 556.390015, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1461.400024, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1454.040039, 558.739990, 999.950012, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(9625, 1462.969971, 554.820007, 999.299988, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1461.400024, 554.390015, 1000.000000, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1461.680054, 548.330017, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19400, 1461.680054, 554.750000, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19384, 1454.000000, 559.489990, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1462.349976, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1462.349976, 554.390015, 1000.000000, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, 1462.920044, 550.200012, 999.909973, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2528, 1451.280029, 559.210022, 999.989990, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, 1462.920044, 550.200012, 1003.530029, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, 1452.420044, 559.830017, 999.909973, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2523, 1451.310059, 559.710022, 999.989990, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, 1452.420044, 559.830017, 1003.530029, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1450.699951, 559.599976, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(9625, 1462.969971, 554.820007, 999.299988, 90.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1463.310059, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2258, 1463.300049, 548.450012, 1001.900024, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1459.869995, 559.599976, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1455.510010, 561.109985, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2276, 1458.439941, 560.520020, 1001.609985, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1452.339966, 561.109985, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1722, 1464.270020, 548.659973, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2254, 1464.500000, 554.640015, 1002.109985, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2520, 1464.449951, 562.650024, 999.969971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1468.140015, 558.010010, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1469.719971, 551.530029, 999.989990, 0.000000, 0.000000, 277.170013, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2609, 1469.150024, 547.140015, 1000.710022, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1465.170044, 564.229980, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1458.719971, 561.109985, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1464.890015, 548.330017, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14527, 1471.319946, 552.440002, 1001.159973, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1464.890015, 554.750000, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, 1462.920044, 559.830017, 999.909973, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19400, 1466.510010, 550.039978, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19384, 1466.510010, 553.250000, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1466.530029, 549.570007, 1001.469971, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1466.530029, 549.570007, 1001.469971, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, 1462.920044, 559.830017, 1003.530029, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1466.489990, 554.039978, 999.950012, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2185, 1467.060059, 550.979980, 999.989990, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19382, 1466.510010, 547.630005, 1002.169983, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2528, 1467.280029, 563.619995, 1000.020020, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1999, 1472.150024, 553.460022, 999.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2272, 1471.920044, 547.320007, 1001.729980, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1466.510010, 546.830017, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1466.510010, 556.460022, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2002, 1467.060059, 555.270020, 999.989990, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2161, 1471.829956, 557.909973, 1001.409973, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1470.109985, 561.919983, 999.950012, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1659, 1467.680054, 552.520020, 1002.880005, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1721, 1467.449951, 548.080017, 999.989990, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2165, 1467.109985, 557.440002, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1468.569946, 550.489990, 999.989990, 0.000000, 0.000000, 104.739998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2162, 1467.089966, 557.900024, 1001.799988, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1721, 1467.939941, 555.940002, 999.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2193, 1468.069946, 547.309998, 1000.000000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2522, 1464.469971, 561.719971, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1465.170044, 561.119995, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1468.140015, 546.739990, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2202, 1473.390015, 550.390015, 1000.010010, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1463.859985, 562.669983, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2520, 1464.449951, 562.650024, 999.969971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1468.140015, 558.010010, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1469.719971, 551.530029, 999.989990, 0.000000, 0.000000, 277.170013, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2609, 1469.150024, 547.140015, 1000.710022, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1469.719971, 552.489990, 999.989990, 0.000000, 0.000000, 267.130005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1474.619995, 548.849976, 999.989990, 0.000000, 0.000000, 189.520004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 1470.800049, 564.150024, 999.950012, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, 1473.430054, 559.830017, 1003.530029, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1465.170044, 564.229980, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2008, 1471.310059, 551.549988, 999.989990, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2308, 1475.500000, 548.309998, 1000.000000, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2226, 1475.560059, 548.070007, 1000.789978, 0.000000, 0.000000, 254.279999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1471.569946, 564.229980, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(9093, 1476.050049, 553.070007, 1001.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1476.069946, 550.039978, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1235, 1470.800049, 547.270020, 1000.479980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2162, 1475.979980, 548.460022, 1001.799988, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1742, 1476.130005, 555.669983, 1000.000000, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14527, 1471.319946, 552.440002, 1001.159973, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1468.369995, 561.119995, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2199, 1470.199951, 557.869995, 999.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1471.339966, 546.739990, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2528, 1467.280029, 563.619995, 1000.020020, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1999, 1472.150024, 553.460022, 999.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2272, 1471.920044, 547.320007, 1001.729980, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2523, 1467.750000, 563.650024, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1471.339966, 558.010010, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1472.640015, 552.070007, 999.989990, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2161, 1471.829956, 557.909973, 1001.409973, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1470.109985, 561.919983, 999.950012, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1468.369995, 564.229980, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2202, 1473.390015, 550.390015, 1000.010010, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11707, 1434.349976, 580.159973, 1001.049988, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, 1473.410034, 550.200012, 999.909973, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, 1473.410034, 550.200012, 1003.530029, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19384, 1470.079956, 562.669983, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1978, 1451.290039, 512.539978, 1008.280029, 0.000000, 0.000000, 182.740005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1432.579956, 587.580017, 999.960022, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1471.569946, 561.119995, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1474.619995, 548.849976, 999.989990, 0.000000, 0.000000, 189.520004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1435.300049, 591.580017, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1566, 1453.599976, 506.500000, 1007.619995, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1425.800049, 587.500000, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2073, 1429.859985, 590.460022, 1004.309998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2289, 1435.119995, 595.219971, 1002.250000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1425.920044, 590.659973, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1430.979980, 596.900024, 999.960022, 0.000000, 0.000000, 267.700012, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2073, 1429.859985, 597.479980, 1004.309998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19171, 1412.339966, 582.359985, 1001.460022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19169, 1412.339966, 582.359985, 1002.960022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1430.959961, 599.000000, 999.960022, 0.000000, 0.000000, 271.059998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1721, 1408.219971, 578.190002, 999.960022, 0.000000, 0.000000, -20.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19170, 1410.839966, 582.359985, 1001.460022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19168, 1410.839966, 582.359985, 1002.960022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19898, 1405.189941, 574.150024, 999.979980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1518, 1409.229980, 582.359985, 1000.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1518, 1408.589966, 582.359985, 1000.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2181, 1408.099976, 581.940002, 999.969971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19941, 1402.550049, 524.929993, 1000.849976, 0.000000, 0.000000, 2.450000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19903, 1409.130005, 589.010010, 1000.020020, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2196, 1401.400024, 524.510010, 1000.849976, 0.000000, 0.000000, 137.429993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, 1403.150024, 582.510010, 998.289978, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19621, 1408.989990, 591.369995, 1001.369995, 0.000000, 0.000000, 332.309998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19627, 1409.010010, 592.090027, 1001.280029, 0.000000, 0.000000, 52.389999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19921, 1408.790039, 591.849976, 1002.190002, 0.000000, 0.000000, 281.149994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19899, 1409.010010, 592.179993, 1000.020020, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(925, 1392.530029, 564.710022, 1000.979980, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19898, 1403.604858, 589.663086, 1000.049988, 0.000000, 0.000000, 293.540100, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(19003, 1405.479980, 592.429993, 1000.030029, 0.000000, 180.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 1, 14592, "casinoVault01", "ab_shutter1", 0xFFFFFFFF);
	CreateDynamicObject(2284, 1422.329956, 495.109985, 1008.429993, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(346, 1424.650024, 490.839996, 1006.460022, 90.000000, 0.000000, 335.500000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(356, 1424.880005, 490.559998, 1006.729980, 0.000000, -90.000000, 87.800003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(346, 1424.189941, 490.839996, 1006.460022, 90.000000, 0.000000, 13.410000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(356, 1424.719971, 490.559998, 1006.729980, 0.000000, -90.000000, 85.690002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(349, 1424.359985, 490.640015, 1006.729980, 0.000000, -90.000000, 86.790001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(349, 1424.180054, 490.640015, 1006.729980, 0.000000, -90.000000, 94.029999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(346, 1423.709961, 490.839996, 1006.460022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(349, 1423.959961, 490.640015, 1006.729980, 0.000000, -90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(351, 1423.739990, 490.640015, 1006.429993, 0.000000, -90.000000, 87.739998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16775, 1391.699951, 578.690002, 1003.729980, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14782, 1398.699951, 591.549988, 1001.039978, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1418.619995, 492.420013, 1006.330017, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14584, 1386.640015, 565.359985, 1001.719971, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14782, 1430.449951, 485.820007, 1007.369995, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, 1425.060059, 484.720001, 1006.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2042, 1423.589966, 484.940002, 1007.219971, 0.000000, 0.000000, 172.660004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
 	CreateDynamicObject(2041, 1423.010010, 484.920013, 1007.340027, 0.000000, 0.000000, 175.529999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, 1421.660034, 484.779999, 1006.989990, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19165, 1423.400024, 482.670013, 1008.119995, 90.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1418.619995, 483.779999, 1006.330017, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1432.439941, 466.970001, 1011.330017, 15.000000, 0.000000, 142.309998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1473.089966, 559.599976, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1473.770020, 557.989990, 999.950012, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1474.550049, 546.739990, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 1470.800049, 564.150024, 999.950012, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19379, 1473.410034, 559.830017, 999.909973, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19377, 1473.430054, 559.830017, 1003.530029, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19384, 1474.550049, 558.010010, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2558, 1475.520020, 553.729980, 1001.289978, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2308, 1475.500000, 548.309998, 1000.000000, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2609, 1475.770020, 551.609985, 1000.710022, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2226, 1475.560059, 548.070007, 1000.789978, 0.000000, 0.000000, 254.279999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1471.569946, 564.229980, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2164, 1475.930054, 550.780029, 999.989990, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(9093, 1476.050049, 553.070007, 1001.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1476.069946, 550.039978, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19400, 1476.069946, 553.250000, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2162, 1475.979980, 548.460022, 1001.799988, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1742, 1476.130005, 555.669983, 1000.000000, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1476.069946, 546.830017, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1476.069946, 556.460022, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1476.069946, 559.599976, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2289, 1474.250000, 564.099976, 1001.950012, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1474.770020, 564.229980, 1001.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1476.069946, 562.809998, 1001.710022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1475.569946, 563.729980, 1000.000000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1440.170044, 570.890015, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2282, 1430.390015, 570.979980, 1001.960022, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1435.300049, 578.320007, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14638, 1435.280029, 578.340027, 1002.460022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19873, 1433.300049, 578.210022, 1000.520020, 3.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2525, 1433.410034, 578.289978, 999.969971, -6.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2528, 1432.609985, 578.380005, 999.969971, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11707, 1434.349976, 580.159973, 1001.049988, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2526, 1431.599976, 578.469971, 999.969971, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2523, 1432.920044, 579.739990, 999.969971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1978, 1451.569946, 513.039978, 1007.400024, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1978, 1451.290039, 512.539978, 1008.280029, 0.000000, 0.000000, 182.740005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1432.579956, 587.580017, 999.960022, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2099, 1435.170044, 589.520020, 999.960022, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1435.489990, 514.570007, 1011.320007, 15.000000, 0.000000, 330.510010, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1417.119995, 572.299988, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14638, 1417.089966, 572.330017, 1002.460022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2281, 1429.560059, 587.510010, 1001.960022, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11737, 1416.959961, 574.729980, 1002.099976, 90.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1428.619995, 587.580017, 999.960022, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1435.300049, 591.580017, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14638, 1435.280029, 591.580017, 1002.460022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1566, 1453.599976, 506.500000, 1007.619995, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1425.800049, 587.500000, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2073, 1429.859985, 590.460022, 1004.309998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2289, 1435.119995, 595.219971, 1002.250000, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1425.920044, 590.659973, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2283, 1440.430054, 598.130005, 1002.080017, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1421, 1414.989990, 581.330017, 1000.719971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1721, 1412.380005, 578.190002, 999.960022, 0.000000, 0.000000, 20.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1433.819946, 597.020020, 999.960022, 0.000000, 0.000000, 267.910004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2700, 1434.920044, 597.900024, 1002.880005, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2008, 1432.459961, 596.840027, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1721, 1411.380005, 577.770020, 999.960022, 0.000000, 0.000000, 12.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1430.979980, 596.900024, 999.960022, 0.000000, 0.000000, 267.700012, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(939, 1452.060059, 500.730011, 1008.710022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1721, 1410.319946, 577.609985, 999.960022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3014, 1412.979980, 582.109985, 1000.190002, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1433.800049, 599.299988, 999.960022, 0.000000, 0.000000, 276.850006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3014, 1412.380005, 582.109985, 1000.190002, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2008, 1432.459961, 598.820007, 999.960022, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2073, 1429.859985, 597.479980, 1004.309998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19171, 1412.339966, 582.359985, 1001.460022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19169, 1412.339966, 582.359985, 1002.960022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1721, 1409.260010, 577.770020, 999.960022, 0.000000, 0.000000, -12.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 1436.739990, 601.119995, 999.969971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1567, 1436.739990, 601.119995, 1002.440002, -8.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1430.959961, 599.000000, 999.960022, 0.000000, 0.000000, 271.059998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2188, 1446.880005, 498.839996, 1007.340027, 0.000000, 0.000000, 215.190002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1721, 1408.219971, 578.190002, 999.960022, 0.000000, 0.000000, -20.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19170, 1410.839966, 582.359985, 1001.460022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19168, 1410.839966, 582.359985, 1002.960022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19898, 1405.189941, 574.150024, 999.979980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1518, 1409.229980, 582.359985, 1000.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2785, 1451.380005, 496.880005, 1007.190002, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1518, 1408.589966, 582.359985, 1000.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2181, 1408.099976, 581.940002, 999.969971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1419.729980, 507.769989, 1006.349976, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19941, 1402.550049, 524.929993, 1000.849976, 0.000000, 0.000000, 2.450000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19941, 1402.550049, 524.820007, 1000.849976, 0.000000, 0.000000, 350.660004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19941, 1402.530029, 524.690002, 1000.849976, 0.000000, 0.000000, 358.390015, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2205, 1402.349976, 524.820007, 999.919983, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19042, 1402.280029, 524.840027, 1000.869995, -12.000000, 0.000000, 45.610001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19903, 1409.130005, 589.010010, 1000.020020, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, 1401.310059, 526.219971, 999.960022, 0.000000, 0.000000, 10.960000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2196, 1401.400024, 524.510010, 1000.849976, 0.000000, 0.000000, 137.429993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14601, 1404.449951, 519.799988, 1007.340027, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1514, 1401.050049, 524.739990, 1000.960022, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19450, 1403.150024, 582.510010, 998.289978, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19621, 1408.989990, 591.369995, 1001.369995, 0.000000, 0.000000, 332.309998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1413.229980, 507.790009, 1011.349976, 15.000000, 0.000000, 29.270000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19627, 1409.010010, 592.090027, 1001.280029, 0.000000, 0.000000, 52.389999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19921, 1408.790039, 591.849976, 1002.190002, 0.000000, 0.000000, 281.149994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19899, 1409.010010, 592.179993, 1000.020020, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(925, 1392.530029, 564.710022, 1000.979980, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1403.859985, 513.250000, 1005.039978, 20.000000, 0.000000, 340.779999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19898, 1403.604858, 589.663086, 1000.049988, 0.000000, 0.000000, 293.540100, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	fso_map = CreateDynamicObject(19003, 1405.479980, 592.429993, 1000.030029, 0.000000, 180.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 1
	SetDynamicObjectMaterial(fso_map, 1, 14592, "casinoVault01", "ab_shutter1", 0xFFFFFFFF);
	CreateDynamicObject(14782, 1430.449951, 492.299988, 1007.369995, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2284, 1422.329956, 495.109985, 1008.429993, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
 	CreateDynamicObject(346, 1424.650024, 490.839996, 1006.460022, 90.000000, 0.000000, 335.500000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(356, 1424.880005, 490.559998, 1006.729980, 0.000000, -90.000000, 87.800003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(346, 1424.189941, 490.839996, 1006.460022, 90.000000, 0.000000, 13.410000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(356, 1424.719971, 490.559998, 1006.729980, 0.000000, -90.000000, 85.690002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2467, 1424.530029, 490.559998, 1006.030029, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19870, 1408.530029, 601.669983, 1001.219971, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(356, 1424.540039, 490.559998, 1006.729980, 0.000000, -90.000000, 94.889999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(349, 1424.359985, 490.640015, 1006.729980, 0.000000, -90.000000, 86.790001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(349, 1424.180054, 490.640015, 1006.729980, 0.000000, -90.000000, 94.029999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(346, 1423.709961, 490.839996, 1006.460022, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(349, 1423.959961, 490.640015, 1006.729980, 0.000000, -90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(351, 1423.739990, 490.640015, 1006.429993, 0.000000, -90.000000, 87.739998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16775, 1391.699951, 578.690002, 1003.729980, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14782, 1398.699951, 591.549988, 1001.039978, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1418.619995, 492.420013, 1006.330017, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14584, 1386.640015, 565.359985, 1001.719971, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14782, 1430.449951, 485.820007, 1007.369995, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
 	CreateDynamicObject(1886, 1436.180054, 482.019989, 1011.349976, 15.000000, 0.000000, 193.610001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, 1425.060059, 484.720001, 1006.989990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1523, 1433.140015, 481.290009, 1006.359985, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2042, 1423.589966, 484.940002, 1007.219971, 0.000000, 0.000000, 172.660004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(11690, 1423.430054, 484.790009, 1006.349976, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19304, 1433.010010, 481.290009, 1009.489990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2041, 1423.010010, 484.920013, 1007.340027, 0.000000, 0.000000, 175.529999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2636, 1421.660034, 484.779999, 1006.989990, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19870, 1399.050049, 601.669983, 1001.219971, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19165, 1423.400024, 482.670013, 1008.119995, 90.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1403.819946, 494.839996, 1005.039978, 20.000000, 0.000000, 189.830002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1418.619995, 483.779999, 1006.330017, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(10148, 1403.189941, 608.809998, 1001.969971, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1566, 1404.939941, 491.809998, 1009.619995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1406.819946, 491.260010, 1016.739990, 15.000000, 0.000000, 317.070007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1566, 1404.500000, 491.809998, 1013.799988, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14450, 1392.689941, 600.880005, 1001.679993, 0.000000, 90.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3055, 1453.359985, 472.010010, 1008.419983, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1400.510010, 491.190002, 1012.349976, 15.000000, 0.000000, 55.770000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1432.439941, 466.970001, 1011.330017, 15.000000, 0.000000, 142.309998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14601, 1456.949951, 456.649994, 1013.200012, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0


	// Interior 11 - Objetos Restaurante
	CreateObject(19455, -796.150024, 492.720001, 1368.099976, 0.000000, 0.000000, 0.000000, 0.0); // 0
	CreateDynamicObject(1556, -795.559998, 508.779999, 1370.729980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3964, -796.530029, 504.640015, 1374.359985, 0.000000, 0.000000, 358.829987, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -789.369995, 508.450012, 1370.739990, 0.000000, 0.000000, 93.150002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -789.869995, 504.200012, 1370.739990, 0.000000, 0.000000, 86.650002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2830, -788.119995, 508.570007, 1371.560059, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -787.979980, 508.440002, 1371.140015, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -787.989990, 507.089996, 1370.739990, 0.000000, 0.000000, 177.940002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2683, -787.750000, 508.410004, 1371.680054, -0.020000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -787.929993, 509.809998, 1370.739990, 0.000000, 0.000000, 357.299988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2804, -793.289978, 502.609985, 1367.489990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2769, -788.690002, 504.209991, 1371.579956, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1520, -788.500000, 504.470001, 1371.619995, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -788.510010, 504.239990, 1371.140015, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2769, -788.390015, 504.209991, 1371.579956, 0.000000, 0.000000, 116.750000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -786.530029, 508.450012, 1370.739990, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -787.109985, 504.239990, 1370.739990, 0.000000, 0.000000, 264.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -784.770020, 508.450012, 1370.739990, 0.000000, 0.000000, 86.849998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -785.169983, 504.200012, 1370.739990, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -784.119995, 508.440002, 1371.140015, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1543, -784.059998, 508.589996, 1371.560059, 0.000000, 0.000000, 217.220001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -784.070007, 507.649994, 1370.739990, 0.000000, 0.000000, 177.940002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -784.109985, 509.809998, 1370.739990, 0.000000, 0.000000, 357.299988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -783.409973, 508.450012, 1370.739990, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -783.830017, 504.239990, 1371.140015, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2683, -783.789978, 504.299988, 1371.680054, -0.020000, 0.000000, 47.049999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2561, -790.599976, 497.540009, 1370.000000, 0.000000, 90.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2561, -791.960022, 496.700012, 1370.000000, 0.000000, 90.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -787.780029, 498.529999, 1375.199951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -781.890015, 508.450012, 1370.739990, 0.000000, 0.000000, 94.459999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -789.200012, 497.190002, 1375.199951, 0.000000, 0.000000, 88.400002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -782.469971, 504.239990, 1370.739990, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1491, -792.580017, 494.989990, 1370.739990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1491, -795.609985, 495.220001, 1375.199951, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1544, -787.789978, 497.390015, 1376.020020, 0.000000, 0.000000, 278.940002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19393, -791.799988, 495.010010, 1372.500000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -787.799988, 497.149994, 1375.599976, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2769, -787.840027, 497.160004, 1376.040039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1546, -780.849976, 508.459991, 1371.660034, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19394, -794.830017, 495.239990, 1376.959961, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2252, -796.130005, 494.750000, 1375.479980, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2524, -793.739990, 494.640015, 1375.199951, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -780.539978, 508.440002, 1371.140015, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -786.359985, 497.230011, 1375.199951, 0.000000, 0.000000, 268.029999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -780.489990, 507.089996, 1370.739990, 0.000000, 0.000000, 177.940002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -780.489990, 509.809998, 1370.739990, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1546, -780.289978, 508.320007, 1371.660034, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19393, -791.280029, 494.559998, 1368.109985, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -787.780029, 495.809998, 1375.199951, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2524, -795.940002, 493.640015, 1375.199951, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1494, -790.539978, 494.549988, 1366.339966, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -779.130005, 508.450012, 1370.739990, 0.000000, 0.000000, -90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -794.590027, 493.589996, 1366.359985, 0.000000, 0.000000, 17.180000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -793.289978, 493.630005, 1366.359985, 0.000000, 0.000000, 1.060000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1734, -793.729980, 492.209991, 1369.540039, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -788.359985, 493.670013, 1375.199951, 0.000000, 0.000000, 353.970001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1896, -793.630005, 492.339996, 1367.119995, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, -793.239990, 492.000000, 1375.680054, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, -796.460022, 491.959991, 1375.680054, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -789.780029, 492.239990, 1375.199951, 0.000000, 0.000000, 88.400002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, -788.359985, 492.190002, 1375.599976, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2769, -788.330017, 492.290009, 1376.040039, 0.000000, 0.000000, 70.809998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2277, -793.080017, 490.829987, 1368.239990, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2683, -788.489990, 492.100006, 1376.140015, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1720, -794.340027, 490.989990, 1366.359985, 0.000000, 0.000000, 181.050003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	
	//Objetos HPC - Primer mapeos
	CreateObject(18637, 1193.682983, -1336.747559, 13.398100, 0.000000, 0.000000, 96.000000, 0.0); // 0
	CreateDynamicObject(2773, 1193.780029, -1337.650024, 12.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, 1192.790039, -1336.680054, 12.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, 1194.699951, -1336.699951, 12.900000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2773, 1193.780029, -1335.739990, 12.900000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	// Bar Cantera LV
	CreateDynamicObject(1308, 834.46997, 870.59003, 21.12000,   180.00000, 0.00000, 180.00000);
	CreateDynamicObject(1493, 823.70001, 860.72998, 11.23000,   0.00000, 0.00000, 22.15000);
	CreateDynamicObject(2921, 834.53003, 870.59998, 21.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2921, 834.53003, 870.59998, 21.50000,   0.00000, 0.00000, 93.98000);
	CreateDynamicObject(2921, 834.53003, 870.62000, 21.50000,   0.00000, 0.00000, 187.17999);
	CreateDynamicObject(2921, 834.50000, 870.65002, 21.50000,   0.00000, 0.00000, -84.00000);
	CreateDynamicObject(16146, 818.03998, 866.98999, 14.17000,   0.00000, 0.00000, 112.15000);
	CreateDynamicObject(16288, 801.28003, 857.33002, -4.38000,   -18.00000, 18.00000, 131.22000);

	// Interior Caseta Minero
	CreateObject(16337, 272.23901, 294.95084, 998.84863,   0.00000, 0.00000, 0.48000);
	CreateObject(19362, 269.08850, 294.83221, 998.75409,   0.00000, 90.00000, 359.00000);
	CreateObject(16337, 272.21921, 292.15900, 998.84863,   0.00000, 0.00000, 0.48000);
	CreateObject(16337, 268.86539, 291.80359, 998.84857,   0.00000, 0.00000, 0.48000);
	CreateObject(16337, 271.08670, 291.79904, 998.84863,   0.00000, 0.00000, -88.79997);
	CreateObject(16337, 269.58267, 297.76849, 998.84863,   0.00000, 0.00000, 89.39997);
	CreateObject(16337, 266.81836, 297.86017, 998.84863,   0.00000, 0.00000, 89.39997);
	CreateObject(16337, 266.11240, 294.56009, 998.84863,   0.00000, 0.00000, 180.31140);
	CreateObject(16337, 266.03488, 296.01938, 998.84863,   0.00000, 0.00000, 180.31140);
	CreateDynamicObject(2063, 269.17679, 296.10281, 999.72809,   0.00000, 0.00000, -0.72000);
	CreateDynamicObject(19362, 269.08850, 294.83221, 1001.54437,   0.00000, 90.00000, 359.00000);
	CreateDynamicObject(19622, 267.61765, 295.07437, 999.54382,   0.00000, 0.00000, 87.06000);
	CreateDynamicObject(19631, 268.48871, 296.05334, 999.69330,   -2.00000, -90.00000, 88.00000);
	CreateDynamicObject(19631, 269.54883, 296.05750, 999.69330,   -2.00000, -90.00000, 88.00000);
	CreateDynamicObject(337, 268.45679, 296.05899, 1000.16479,   -191.00000, -90.00000, 183.47992);
	CreateDynamicObject(19942, 269.54150, 295.98141, 1000.19330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19942, 269.70142, 295.97678, 1000.19330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19942, 269.84134, 295.97272, 1000.19330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19330, 269.26682, 296.12921, 1000.62640,   0.00000, -90.00000, -4.14004);
	CreateDynamicObject(19330, 268.75705, 296.14786, 1000.62640,   0.00000, -90.00000, -3.90004);
	CreateDynamicObject(19330, 268.37579, 296.12180, 1000.62640,   0.00000, -90.00000, -3.90004);
	CreateDynamicObject(19330, 269.73642, 296.11203, 1000.62640,   0.00000, -90.00000, -3.90004);
	CreateDynamicObject(19330, 269.73642, 296.11203, 1000.62640,   0.00000, -90.00000, -3.90004);

	//  Oficina minero exterior e interior
	CreateObject(16406, -613.21002, 2323.87012, 77.14000,   0.00000, 0.00000, 37.03000);
	CreateObject(16406, -718.91998, 2465.12988, 7.70000,   0.00000, 2.86000, 272.76999);
	CreateObject(16212, -699.71002, 2485.01001, 3.24000,   356.85999, 0.00000, 0.00000);
	CreateObject(10752, -721.09003, 2530.98999, 17.34000,   -2.32000, 2.64000, 57.40000);
	CreateObject(973, -609.56000, 2326.61011, 78.30000,   80.00000, -4.00000, 40.90000);
	CreateDynamicObject(10843, -431.39999, 2212.17993, 48.86000,   0.00000, 0.00000, 67.52000);
	CreateDynamicObject(880, -731.15002, 2408.01001, 6.75000,   0.00000, 25.00000, 89.00000);
	CreateDynamicObject(880, -734.01001, 2404.15991, 4.48000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(897, -743.07001, 2388.87988, 2.32000,   0.00000, 0.00000, 170.37000);
	CreateDynamicObject(898, -733.37000, 2426.37988, 4.29000,   0.00000, 0.00000, 305.60999);
	CreateDynamicObject(920, -721.51001, 2465.55005, 9.45000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1572, -735.12000, 2406.92993, 4.50000,   22.70000, -4.30000, -84.00000);
	CreateDynamicObject(1572, -749.20001, 2416.90991, -0.76000,   0.30000, -20.40000, 0.00000);
	CreateDynamicObject(2074, -717.35999, 2429.19995, 12.25000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -717.39001, 2435.12012, 12.15000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -717.60999, 2440.76001, 11.95000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -718.01001, 2448.40991, 11.81000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -718.34003, 2453.39990, 11.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -718.64001, 2458.87012, 12.07000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3381, -742.72998, 2423.56006, 0.27000,   184.17999, 7.08000, 0.00000);
	CreateDynamicObject(16123, -755.23999, 2409.75000, -17.47000,   84.00000, 25.00000, 22.24000);
	CreateDynamicObject(16211, -702.06000, 2421.94995, -16.62000,   0.00000, 0.00000, 144.44000);
	CreateDynamicObject(16211, -725.13000, 2387.96997, -16.62000,   0.00000, 0.00000, 35.13000);
	CreateDynamicObject(16258, -749.57001, 2414.59009, -9.97000,   -14.00000, 76.00000, 349.00000);
	CreateDynamicObject(16258, -755.83002, 2378.97998, -0.02000,   -41.22000, 79.34000, 348.59000);
	CreateDynamicObject(16258, -755.35999, 2373.38989, -11.64000,   -14.00000, 91.00000, 348.59000);
	CreateDynamicObject(19375, -718.90002, 2426.14990, 3.76000,   -0.50000, 0.00000, 91.96000);
	CreateDynamicObject(19378, -722.10999, 2461.17993, 8.86000,   0.00000, 0.00000, 2.98000);
	CreateDynamicObject(19378, -718.69000, 2466.04004, 8.86000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(630, -383.98999, 2195.23999, 25.43000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(899, -619.84003, 2325.10010, 81.24000,   62.00000, -91.00000, 142.00000);
	CreateDynamicObject(899, -613.76001, 2313.95996, 74.30000,   62.00000, -91.00000, 131.50999);
	CreateDynamicObject(899, -620.57001, 2319.66992, 84.04000,   4.00000, -84.00000, 114.00000);
	CreateDynamicObject(1491, -384.41000, 2193.29004, 24.39000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1736, -380.29999, 2192.77002, 26.86000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1759, -380.81000, 2192.97998, 24.40000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1763, -379.69000, 2200.31006, 24.40000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1763, -378.25000, 2193.03003, 24.40000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1778, -462.98001, 2355.54004, 74.99000,   0.00000, 0.00000, -91.00000);
	CreateDynamicObject(2063, -464.42001, 2356.80005, 75.83000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2069, -386.19000, 2196.32007, 24.45000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -464.53000, 2355.89990, 77.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -718.01001, 2448.40991, 11.81000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -718.34003, 2453.39990, 11.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -718.64001, 2458.87012, 12.07000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -717.60999, 2440.76001, 11.95000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -717.39001, 2435.12012, 12.15000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, -717.35999, 2429.19995, 12.25000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2120, -381.50000, 2197.60010, 25.05000,   0.00000, 0.00000, -25.00000);
	CreateDynamicObject(2120, -381.35001, 2199.44995, 25.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2120, -383.81000, 2197.61011, 25.05000,   0.00000, 0.00000, -185.00000);
	CreateDynamicObject(2120, -385.10999, 2199.38989, 25.05000,   0.00000, 0.00000, -185.00000);
	CreateDynamicObject(2161, -387.39001, 2197.54004, 24.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2164, -387.38000, 2198.96997, 24.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2279, -381.60001, 2200.18994, 26.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2524, -386.26001, 2194.94995, 24.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2525, -386.78000, 2194.98999, 24.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2525, -465.32999, 2354.87012, 74.99000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2527, -386.69000, 2193.89990, 24.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2604, -383.48001, 2198.81006, 25.21000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2616, -385.38000, 2200.58008, 25.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3276, -568.70001, 2336.33008, 81.55000,   0.00000, 8.90000, -7.28000);
	CreateDynamicObject(3276, -580.71997, 2337.71997, 83.41000,   5.02000, 8.00000, -8.02000);
	CreateDynamicObject(3276, -591.00000, 2334.72998, 83.35000,   2.30000, -8.50000, 39.21000);
	CreateDynamicObject(3276, -599.64001, 2326.95996, 80.13000,   2.08000, -23.50000, 46.33000);
	CreateDynamicObject(3350, -555.77002, 2353.07007, 75.63000,   0.00000, 0.00000, 120.00000);
	CreateDynamicObject(8555, 2315.26001, 583.28998, -13.49000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14597, 1156.69995, -1324.80005, -9.80000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(14597, 1157.19995, -1351.06995, -9.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(16010, -382.17999, 2192.22998, 15.98000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16051, -376.39001, 2207.81006, 27.57000,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(16051, -394.53000, 2203.22998, 27.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(16051, -375.10001, 2194.07007, 27.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16051, -389.44000, 2185.31006, 27.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16083, -546.56000, 2336.44995, 77.03000,   0.00000, 0.00000, 343.60999);
	CreateDynamicObject(16318, -559.65997, 2337.90991, 79.22000,   0.00000, 0.00000, 354.45999);
	CreateDynamicObject(16337, -548.56000, 2348.02002, 75.52000,   0.00000, 0.00000, 118.51000);
	CreateDynamicObject(16337, -464.45001, 2352.86011, 75.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16337, -461.66000, 2355.63989, 75.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16337, -467.22000, 2355.71997, 75.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16337, -464.23001, 2355.64990, 80.46000,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(16337, -464.35999, 2358.50000, 75.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16780, -380.72000, 2196.62988, 27.64000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18634, -464.89001, 2356.65991, 75.78000,   -1.04000, -91.00000, 62.00000);
	CreateDynamicObject(18638, -387.17001, 2197.80005, 25.85000,   0.00000, -105.00000, -142.00000);
	CreateDynamicObject(18638, -463.94000, 2356.69995, 76.28000,   0.00000, -91.00000, 105.00000);
	CreateDynamicObject(18673, -546.21002, 2336.45996, 78.42000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18673, -546.37000, 2336.30005, 78.42000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18673, -546.53003, 2336.45996, 78.42000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19313, -540.88000, 2340.58008, 72.31000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19313, -540.88000, 2340.58008, 78.96000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19313, -547.40002, 2350.09009, 72.31000,   0.00000, 0.00000, 339.87000);
	CreateDynamicObject(19313, -547.40002, 2350.09009, 78.96000,   0.00000, 0.00000, 339.87000);
	CreateDynamicObject(19313, -563.56000, 2354.19995, 78.96000,   0.00000, 0.00000, 351.51999);
	CreateDynamicObject(19313, -540.88000, 2326.52002, 78.96000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19313, -540.88000, 2326.52002, 72.31000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19366, -385.85999, 2195.56006, 26.13000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, -464.01001, 2355.39990, 74.90000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, -382.63000, 2196.08008, 27.73000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19382, -566.54999, 2336.28003, 77.49000,   80.44000, 0.00000, 263.20001);
	CreateDynamicObject(19382, -571.87000, 2336.92993, 78.37000,   80.44000, 0.00000, 263.20001);
	CreateDynamicObject(19382, -582.03998, 2338.16992, 79.87000,   80.44000, 0.00000, 263.20001);
	CreateDynamicObject(19382, -589.78003, 2335.92993, 79.63000,   77.94000, 0.00000, 130.59000);
	CreateDynamicObject(19382, -593.81000, 2332.67993, 79.01000,   77.94000, 0.00000, 130.59000);
	CreateDynamicObject(19382, -600.69000, 2326.37988, 75.99000,   69.00000, 0.00000, 135.00000);
	CreateDynamicObject(19386, -384.42001, 2194.03003, 26.15000,   0.00000, 0.00000, 0.00000);

	// Ferreteria
	CreateObject(18023,-1073.1200000,350.0799900,1181.5799600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(337, -1075.28003, 346.42001, 1179.95996,   4.00000, 90.00000, 76.00000);
	CreateDynamicObject(337, -1077.06006, 345.92999, 1179.95996,   4.00000, 90.00000, 180.00000);
	CreateDynamicObject(337, -1071.16003, 345.91000, 1179.95996,   4.00000, 90.00000, 4.00000);
	CreateDynamicObject(337, -1077.76001, 345.91000, 1180.45996,   4.00000, 90.00000, -11.00000);
	CreateDynamicObject(337, -1078.09998, 345.91000, 1180.45996,   4.00000, 90.00000, 180.00000);
	CreateDynamicObject(365, -1070.50000, 345.73999, 1180.96997,   -4.00000, -4.00000, 18.00000);
	CreateDynamicObject(365, -1070.56995, 345.85999, 1180.96997,   -4.00000, -4.00000, -4.00000);
	CreateDynamicObject(365, -1070.38000, 345.82001, 1180.96997,   -4.00000, -4.00000, 91.00000);
	CreateDynamicObject(366, -1071.44995, 345.78000, 1180.82996,   84.00000, 0.00000, 135.00000);
	CreateDynamicObject(366, -1075.42004, 346.57001, 1180.82996,   84.00000, 0.00000, 33.00000);
	CreateDynamicObject(918, -1075.66003, 343.23001, 1179.89001,   0.00000, 0.00000, -4.00000);
	CreateDynamicObject(918, -1077.71997, 345.88000, 1181.57996,   0.00000, 0.00000, 120.00000);
	CreateDynamicObject(918, -1078.50000, 345.47000, 1179.88000,   0.00000, 0.00000, 11.00000);
	CreateDynamicObject(918, -1075.26001, 347.23001, 1181.57996,   0.00000, 0.00000, 120.00000);
	CreateDynamicObject(920, -1076.46997, 343.38000, 1181.67004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(920, -1079.79004, 341.95001, 1180.59998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(920, -1079.79004, 341.95001, 1180.00000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(943, -1066.67004, 351.62000, 1180.29004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1335, -1067.01001, 347.82001, 1180.65002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1347, -1079.78003, 344.95001, 1180.08997,   180.00000, 0.00000, 20.00000);
	CreateDynamicObject(1348, -1066.52002, 341.70001, 1180.22998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1348, -1079.65002, 347.97000, 1180.22998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1348, -1079.65002, 351.04999, 1180.22998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1426, -1069.80005, 340.60001, 1179.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1428, -1076.03003, 342.54001, 1181.04004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1428, -1075.68005, 346.72000, 1181.04004,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1428, -1077.34998, 348.79999, 1181.04004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1478, -1078.30005, 345.84000, 1181.13000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(1481, -1079.43005, 354.38000, 1180.22998,   0.00000, 0.00000, 18.00000);
	CreateDynamicObject(1494, -1078.54004, 354.95001, 1179.45996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1496, -1075.19995, 339.38000, 1179.44995,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1572, -1069.32996, 347.44000, 1180.09998,   0.00000, 0.00000, 69.00000);
	CreateDynamicObject(1572, -1076.82996, 351.70001, 1180.09998,   0.00000, 0.00000, 69.00000);
	CreateDynamicObject(1650, -1071.25000, 345.95999, 1181.51001,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1714, -1073.40002, 356.67999, 1179.53003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1714, -1078.59998, 356.98999, 1179.53003,   0.00000, 0.00000, 89.00000);
	CreateDynamicObject(1714, -1068.73999, 356.84000, 1179.53003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1778, -1078.95996, 358.51001, 1179.53003,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(1781, -1078.32996, 349.47000, 1181.20996,   0.00000, 0.00000, 18.00000);
	CreateDynamicObject(2063, -1076.39001, 342.66000, 1180.42004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2063, -1071.03003, 345.91000, 1180.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, -1077.91003, 345.91000, 1180.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, -1075.31995, 346.98001, 1180.42004,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2063, -1068.43005, 345.91000, 1180.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, -1071.03003, 349.17001, 1180.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, -1077.91003, 349.17001, 1180.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, -1068.43005, 349.17001, 1180.42004,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2190, -1073.63000, 354.97000, 1180.48999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2190, -1069.67004, 355.01999, 1180.48999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2314, -1074.91003, 355.20999, 1180.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2314, -1074.91003, 355.20999, 1179.53003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2314, -1072.51001, 355.20999, 1180.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2314, -1072.51001, 355.20999, 1179.53003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2314, -1070.10999, 355.20999, 1180.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2314, -1070.10999, 355.20999, 1179.53003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2314, -1067.70996, 355.20999, 1180.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2314, -1067.70996, 355.20999, 1179.53003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2404, -1070.65002, 349.17999, 1179.94995,   -90.00000, 90.00000, 0.00000);
	CreateDynamicObject(2405, -1068.10999, 349.17999, 1180.84998,   -90.00000, 90.00000, 0.00000);
	CreateDynamicObject(2406, -1070.84998, 349.17999, 1180.43005,   -90.00000, 90.00000, 0.00000);
	CreateDynamicObject(2609, -1066.95996, 360.79999, 1180.26001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2690, -1071.68994, 345.97000, 1181.34998,   -90.00000, -90.00000, 0.00000);
	CreateDynamicObject(2700, -1076.02002, 354.57001, 1182.30005,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2748, -1066.75000, 344.56000, 1180.10999,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3761, -1071.32996, 360.37000, 1180.06995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(17951, -1076.56995, 339.25000, 1181.47998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(17951, -1069.75000, 339.25000, 1181.43005,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(17951, -1080.31995, 342.98999, 1181.46997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(17951, -1065.91003, 343.17001, 1181.08997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(17951, -1080.31995, 350.06000, 1181.53003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(17951, -1065.91003, 349.47000, 1181.08997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18634, -1071.77002, 349.10999, 1181.21997,   180.00000, -90.00000, 90.00000);
	CreateDynamicObject(18634, -1068.52002, 355.10999, 1180.56006,   180.00000, -90.00000, 120.00000);
	CreateDynamicObject(18635, -1069.09998, 349.13000, 1181.18994,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(18635, -1072.47998, 355.14001, 1180.48999,   90.00000, 90.00000, 138.00000);
	CreateDynamicObject(18635, -1071.96997, 355.09000, 1180.48999,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(18644, -1070.82996, 349.13000, 1181.27002,   82.00000, 0.00000, 33.00000);
	CreateDynamicObject(18644, -1074.21997, 355.07001, 1180.56995,   82.00000, 0.00000, 33.00000);
	CreateDynamicObject(18644, -1072.67004, 355.04001, 1180.56995,   82.00000, 0.00000, -25.00000);
	CreateDynamicObject(19378, -1074.85999, 344.26001, 1179.43994,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, -1064.38000, 344.26001, 1179.43994,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, -1074.85999, 353.88000, 1179.43994,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, -1064.38000, 353.88000, 1179.43994,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, -1074.85999, 363.50000, 1179.43994,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, -1064.38000, 363.50000, 1179.43994,   0.00000, 90.00000, 0.00000);

	CreateDynamicObject(3684, 805.37000, -3240.43994, 8.28000,   0.00000, 0.00000, -270.00000);
	CreateDynamicObject(3684, 836.37000, -3240.43994, 8.28000,   0.00000, 0.00000, -270.00000);
	CreateDynamicObject(3684, 866.97998, -3240.56006, 8.28000,   0.00000, 0.00000, -270.00000);
	CreateDynamicObject(3337, 826.47797, -2942.98657, 11.09385,   0.00000, 0.00000, 58.71920);
	CreateDynamicObject(966,833.369995,-2954.520020,11.240000 , 0.000000,0.000000,180.000000 );
	CreateDynamicObject(966,833.369995,-2963.800049,10.920000 , 0.000000,0.000000,0.000000 );
	CreateDynamicObject(6295, 908.19000, -3019.65991, 28.53000,   0.00000, 0.00000, 129.69000);
	CreateDynamicObject(3337, 825.34003, -1795.52002, 12.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19535, 888.98999, -3180.76001, 4.86000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(9829, 929.62000, -3096.60010, -61.90000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(9829, 843.26001, -3777.42993, -61.90000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(9829, 912.12000, -3687.53003, -61.90000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(9241, 805.94000, -3119.12012, 6.05000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19535, 749.03998, -3478.15991, -2.60000,   -90.00000, 90.00000, -90.00000);
	CreateDynamicObject(8433, 815.82001, -3611.53003, 9.34000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(9829, 929.62000, -3244.25000, -61.90000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(9829, 912.34003, -3534.80005, -61.90000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19535, 748.98999, -3320.76001, 4.86000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19535, 749.03998, -3328.40991, -2.60000,   -90.00000, 90.00000, 90.00000);
	CreateDynamicObject(1297, 839.39001, -1819.65002, 20.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19966, 839.83002, -1810.59998, 16.97000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -1869.67004, 23.52000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 839.39001, -1919.68994, 26.18000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -1953.98999, 1.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11421, 833.64001, -1962.15002, 16.73000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -1969.67004, 28.42000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3330, 833.53003, -1970.32996, 1.47000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2230, 743.42999, -1669.93994, 3.44000,   90.00000, 0.00000, 3.98000);
	CreateDynamicObject(2230, 742.90997, -1669.98999, 3.54000,   90.00000, 0.00000, 3.98000);
	CreateDynamicObject(2230, 742.75000, -1670.01001, 3.40000,   90.00000, 0.00000, 3.98000);
	CreateDynamicObject(2230, 742.60999, -1670.01001, 3.24000,   90.00000, 0.00000, 3.98000);
	CreateDynamicObject(2230, 742.40002, -1670.03003, 3.00000,   90.00000, 0.00000, 3.98000);
	CreateDynamicObject(2230, 742.25000, -1670.03003, 2.84000,   90.00000, 0.00000, 3.98000);
	CreateDynamicObject(2230, 742.09003, -1670.03003, 2.66000,   90.00000, 0.00000, 3.98000);
	CreateDynamicObject(1297, 839.39001, -2019.68994, 28.45000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2069.66992, 28.46000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3330, 833.53003, -2113.86011, 13.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2119.68994, 28.17000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2169.66992, 28.46000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 839.39001, -2219.68994, 28.17000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2219.68994, 28.17000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -2263.86011, 13.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -2263.86011, 13.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2269.66992, 28.46000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 827.28998, -2269.66992, 28.46000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 839.39001, -2319.68994, 28.17000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2319.68994, 28.17000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2369.66992, 28.46000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 827.28998, -2369.66992, 28.46000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3330, 833.53003, -2413.84009, 13.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -2413.84009, 13.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2419.66992, 28.17000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2419.66992, 28.17000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2469.64990, 26.53000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 827.28998, -2469.64990, 26.53000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 839.39001, -2519.66992, 24.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2519.66992, 24.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -2563.47998, 8.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -2563.47998, 8.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2569.64990, 23.21000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 827.28998, -2569.64990, 23.21000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 839.39001, -2619.66992, 23.04000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2619.66992, 23.04000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2669.64990, 23.17000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 827.28998, -2669.64990, 23.17000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3330, 833.53003, -2713.58008, 8.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -2713.58008, 8.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2719.66992, 23.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2719.66992, 23.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2769.64990, 21.23000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 827.28998, -2769.64990, 21.23000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 839.39001, -2819.66992, 19.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2819.66992, 19.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -2863.33008, 3.26000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.53003, -2863.33008, 3.26000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 827.28998, -2869.64990, 17.79000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 827.28998, -2869.64990, 17.79000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 839.39001, -2919.66992, 16.04000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 839.39001, -2919.66992, 16.04000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19966, 826.65002, -2938.68994, 12.02000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19966, 826.65002, -2938.68994, 12.02000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19124, 833.37000, -2956.08008, 11.72000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(967, 833.41998, -2958.32007, 11.00000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3749, 833.38000, -2959.87988, 17.01000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(967, 833.41998, -2959.86011, 11.00000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19790, 841.65997, -2959.88989, 6.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 833.37000, -2956.08008, 11.72000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(967, 833.41998, -2958.32007, 11.00000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3749, 833.38000, -2959.87988, 17.01000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(967, 833.41998, -2959.86011, 11.00000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19790, 841.65997, -2959.88989, 6.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.29999, -2959.87988, 0.82000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19790, 825.08002, -2959.88989, 6.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 833.37000, -2962.12012, 11.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3330, 833.29999, -2959.87988, 0.82000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19790, 825.08002, -2959.88989, 6.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 833.37000, -2962.12012, 11.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19966, 840.01001, -2976.15991, 10.66000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19966, 840.01001, -2976.15991, 10.66000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6230, 774.25000, -2992.23999, -7.36000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3615, 869.03003, -3002.29004, 5.13000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(642, 888.35999, -3000.88989, 4.40000,   0.00000, 15.00000, 54.93000);
	CreateDynamicObject(642, 789.65997, -3002.05005, 4.32000,   0.00000, 15.00000, 0.00000);
	CreateDynamicObject(642, 789.65997, -3002.05005, 4.32000,   0.00000, 15.00000, 0.00000);
	CreateDynamicObject(712, 845.15002, -3010.76001, 13.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 821.69000, -3010.61011, 13.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3615, 775.40997, -3002.80005, 5.19000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(712, 845.15002, -3010.76001, 13.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 821.69000, -3010.61011, 13.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 868.51001, -3029.00000, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 849.51001, -3031.79004, 3.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 818.84003, -3031.62012, 3.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 871.90997, -3030.86011, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(647, 789.15997, -3028.52002, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 845.21997, -3034.80005, 8.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(712, 793.53998, -3030.79004, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(647, 868.51001, -3029.00000, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 818.84003, -3031.62012, 3.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 789.15997, -3028.52002, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 845.21997, -3034.80005, 8.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(712, 793.53998, -3030.79004, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 808.92999, -3034.80005, 8.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 881.50000, -3034.80005, 8.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 808.92999, -3034.80005, 8.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 881.50000, -3034.80005, 8.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(647, 761.28003, -3028.97998, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 768.92999, -3031.64990, 3.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 772.63000, -3034.80005, 8.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(620, 898.57001, -3032.35010, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(647, 761.28003, -3028.97998, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 768.92999, -3031.64990, 3.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 772.63000, -3034.80005, 8.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(642, 709.73999, -3006.09009, 4.02000,   0.00000, 15.00000, 277.04999);
	CreateDynamicObject(642, 709.73999, -3006.09009, 4.02000,   0.00000, 15.00000, 277.04999);
	CreateDynamicObject(712, 738.53003, -3030.52002, 14.43000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3485, 836.03998, -3067.68994, 12.01000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 895.15002, -3056.32007, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3483, 805.90997, -3067.67993, 11.99000,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(712, 898.84003, -3055.87012, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(3486, 866.37000, -3067.69995, 11.99000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3598, 731.40997, -3046.39990, 7.20000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 895.15002, -3056.32007, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3486, 773.64001, -3065.67993, 11.99000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1297, 742.83002, -3056.32007, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 742.83002, -3056.32007, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 740.78998, -3062.88989, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(3604, 796.38000, -3093.15991, 7.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3920, 881.90997, -3090.66992, 5.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3920, 881.90997, -3090.66992, 5.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(620, 898.67999, -3086.87012, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(8673, 881.42999, -3094.83008, 5.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3483, 773.65002, -3095.96997, 11.99000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1297, 895.15002, -3092.61011, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 898.67999, -3086.87012, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(8673, 881.42999, -3094.83008, 5.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 895.15002, -3092.61011, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3614, 725.46997, -3075.94995, 0.63000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1597, 865.62000, -3102.42993, 7.61000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 866.71997, -3101.72998, -1.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 857.75000, -3104.23999, 12.58000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3920, 881.90997, -3098.94995, 5.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(6230, 700.27002, -3057.98999, -7.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1597, 865.62000, -3102.42993, 7.61000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 866.71997, -3101.72998, -1.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 857.75000, -3104.23999, 12.58000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3920, 881.90997, -3098.94995, 5.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(6230, 700.27002, -3057.98999, -7.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 739.51001, -3088.87988, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(2001, 859.28003, -3107.73999, 5.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3607, 845.79999, -3109.68994, 11.05000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 742.83002, -3092.61011, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3471, 880.90002, -3106.32007, 6.27000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1886, 858.98999, -3111.79004, 8.76000,   10.00000, 0.00000, 103.36000);
	CreateDynamicObject(2001, 859.28003, -3107.73999, 5.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 742.83002, -3092.61011, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3471, 880.90002, -3106.32007, 6.27000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1886, 858.98999, -3111.79004, 8.76000,   10.00000, 0.00000, 103.36000);
	CreateDynamicObject(748, 899.65997, -3102.14990, 5.13000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 859.28003, -3113.67993, 5.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 857.75000, -3117.06006, 12.58000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(748, 899.65997, -3102.14990, 5.13000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 859.28003, -3113.67993, 5.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 857.75000, -3117.06006, 12.58000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3765, 734.29999, -3098.48999, 3.09000,   0.00000, 0.00000, 239.87000);
	CreateDynamicObject(1597, 866.08002, -3118.92993, 7.61000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3471, 880.90002, -3115.90991, 6.27000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(620, 866.52002, -3119.31006, -2.13000,   0.00000, 0.00000, 36.21000);
	CreateDynamicObject(1597, 866.08002, -3118.92993, 7.61000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3471, 880.90002, -3115.90991, 6.27000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(620, 866.52002, -3119.31006, -2.13000,   0.00000, 0.00000, 36.21000);
	CreateDynamicObject(712, 898.84003, -3114.98999, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(3920, 881.90997, -3123.27002, 5.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(712, 898.84003, -3114.98999, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(3920, 881.90997, -3123.27002, 5.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3485, 773.64001, -3126.26001, 11.99000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(8673, 881.42999, -3126.95996, 5.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3462, 875.06000, -3131.96997, 7.58000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3515, 875.04999, -3131.98999, 5.72000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8673, 881.42999, -3126.95996, 5.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3462, 875.06000, -3131.96997, 7.58000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3515, 875.04999, -3131.98999, 5.72000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 881.90997, -3131.07007, 5.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 895.15002, -3128.87988, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 737.46002, -3118.51001, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 881.90997, -3131.07007, 5.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 895.15002, -3128.87988, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 737.46002, -3118.51001, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 739.53998, -3126.09009, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 742.83002, -3128.87988, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 739.53998, -3126.09009, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 742.83002, -3128.87988, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3483, 836.15002, -3154.53003, 11.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 899.34998, -3142.64990, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 899.34998, -3142.64990, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3485, 805.87000, -3154.55005, 11.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3486, 866.32001, -3154.52002, 11.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 898.28998, -3151.41992, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 898.28998, -3151.41992, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(3483, 773.64001, -3156.51001, 11.99000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1297, 895.15002, -3165.16992, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 895.15002, -3165.16992, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 739.09998, -3158.58008, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 742.83002, -3165.16992, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(712, 739.09998, -3158.58008, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 742.83002, -3165.16992, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 841.17999, -3186.97998, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 808.65002, -3186.97998, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 841.17999, -3186.97998, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 808.65002, -3186.97998, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 877.46002, -3186.97998, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 877.46002, -3186.97998, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 768.58002, -3186.97998, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 768.58002, -3186.97998, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(712, 898.12000, -3189.23999, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 898.12000, -3189.23999, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 895.15002, -3196.32007, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 895.15002, -3196.32007, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3485, 836.03998, -3207.46997, 12.01000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3483, 805.90997, -3207.47998, 11.99000,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(3486, 866.37000, -3207.45996, 11.99000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3486, 773.64001, -3205.48999, 11.99000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1297, 742.83002, -3196.32007, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 742.83002, -3196.32007, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 737.35999, -3204.23999, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(3483, 773.65002, -3235.79004, 11.99000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3608, 728.14001, -3223.37012, -3.58000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 742.83002, -3232.61011, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 742.83002, -3232.61011, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(647, 738.34003, -3238.87012, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(748, 626.73999, -3161.75000, 4.84000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 738.15997, -3245.09009, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(19907, 577.84003, -3113.68994, 4.84000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(6230, 700.27002, -3254.55005, -7.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6230, 700.27002, -3254.55005, -7.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3485, 773.64001, -3266.08008, 11.99000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(748, 738.45001, -3267.06006, 4.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 742.83002, -3268.87988, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(748, 738.45001, -3267.06006, 4.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 742.83002, -3268.87988, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3458, 812.44000, -3273.07007, 6.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3458, 812.44000, -3273.07007, 6.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 739.48999, -3286.04004, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 895.15002, -3232.61011, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 895.15002, -3232.61011, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3483, 773.64001, -3296.35010, 11.99000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(620, 899.87000, -3235.10010, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 899.87000, -3235.10010, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(3608, 728.78998, -3298.12012, -3.58000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3458, 855.96002, -3273.07007, 6.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3485, 805.87000, -3294.38989, 11.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3458, 855.96002, -3273.07007, 6.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 742.83002, -3305.16992, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1682, 580.21002, -3205.25000, 15.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 742.83002, -3305.16992, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1682, 580.21002, -3205.25000, 15.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 900.53003, -3244.06006, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3483, 836.15002, -3294.37012, 11.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(647, 900.53003, -3244.06006, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19907, 577.84003, -3217.31006, 4.92000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 768.58002, -3327.05005, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 895.15002, -3268.87988, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3486, 866.32001, -3294.35010, 11.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 768.58002, -3327.05005, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 895.15002, -3268.87988, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 739.20001, -3331.08008, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(647, 764.97998, -3331.91992, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 804.89001, -3327.05005, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(712, 898.73999, -3272.93994, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(620, 793.83002, -3331.33008, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(647, 764.97998, -3331.91992, 6.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 804.89001, -3327.05005, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(712, 898.73999, -3272.93994, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(4832, 629.15002, -3309.82007, 18.55000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 841.17999, -3327.05005, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(712, 841.66998, -3330.29004, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 841.17999, -3327.05005, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2946, 628.96997, -3322.27002, 4.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2946, 628.96997, -3322.27002, 4.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3664, 601.56000, -3303.56006, 11.66000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(748, 859.45001, -3331.29004, 4.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 895.15002, -3305.16992, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 877.46002, -3327.05005, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1297, 895.15002, -3305.16992, 8.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 877.46002, -3327.05005, 8.41000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(620, 900.15997, -3326.83008, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(9229, 865.71002, -3358.08008, -20.07000,   0.00000, 0.00000, 225.59000);
	CreateDynamicObject(620, 900.15997, -3326.83008, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 757.34998, -3479.00000, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 741.59998, -3479.09009, 3.62000,   0.00000, 0.00000, 303.94000);
	CreateDynamicObject(620, 757.34998, -3479.00000, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 741.59998, -3479.09009, 3.62000,   0.00000, 0.00000, 303.94000);
	CreateDynamicObject(620, 797.14001, -3489.76001, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 797.14001, -3489.76001, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 742.83002, -3501.28003, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 742.83002, -3501.28003, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 834.19000, -3489.37012, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(748, 767.84998, -3506.64990, 4.83000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 813.69000, -3499.46997, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(620, 834.19000, -3489.37012, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(748, 767.84998, -3506.64990, 4.83000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(712, 813.69000, -3499.46997, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(620, 867.53003, -3488.63989, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(712, 758.71002, -3520.30005, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(620, 867.53003, -3488.63989, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(712, 758.71002, -3520.30005, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 855.53003, -3499.07007, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 739.03998, -3521.19995, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 855.53003, -3499.07007, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 739.03998, -3521.19995, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(6230, 700.27002, -3523.51001, -7.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 742.83002, -3537.56006, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 742.83002, -3537.56006, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 738.38000, -3551.95996, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 760.81000, -3553.20996, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 738.38000, -3551.95996, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 760.81000, -3553.20996, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(712, 779.72998, -3554.69995, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 779.72998, -3554.69995, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 780.07001, -3562.40991, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 777.94000, -3563.35010, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 780.07001, -3562.40991, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 777.94000, -3563.35010, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 742.83002, -3573.85010, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 742.83002, -3573.85010, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(712, 760.57001, -3581.77002, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 780.07001, -3581.60010, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(712, 739.35999, -3583.79004, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 760.57001, -3581.77002, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 780.07001, -3581.60010, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(712, 739.35999, -3583.79004, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 874.09003, -3546.39990, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 874.09003, -3546.39990, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(620, 777.98999, -3589.90991, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 777.98999, -3589.90991, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(748, 777.73999, -3594.35010, 5.26000,   0.00000, 0.00000, 76.86000);
	CreateDynamicObject(748, 777.73999, -3594.35010, 5.26000,   0.00000, 0.00000, 76.86000);
	CreateDynamicObject(19545, 787.28003, -3601.59009, 4.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19545, 787.28003, -3601.59009, 4.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1297, 742.83002, -3610.12988, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 742.83002, -3610.12988, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(712, 852.21002, -3587.18994, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 852.21002, -3587.18994, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(620, 777.85999, -3613.11011, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 777.85999, -3613.11011, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(8535, 809.04999, -3611.05005, 11.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1297, 780.07001, -3618.27002, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 761.29999, -3621.21997, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 739.13000, -3621.96997, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 780.07001, -3618.27002, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 761.29999, -3621.21997, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 739.13000, -3621.96997, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 885.72998, -3585.82007, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 885.72998, -3585.82007, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 853.85999, -3614.75000, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 780.07001, -3640.66992, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 853.85999, -3614.75000, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 780.07001, -3640.66992, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(712, 759.96997, -3646.25000, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 742.83002, -3646.42993, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(712, 759.96997, -3646.25000, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(1297, 742.83002, -3646.42993, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(748, 778.17999, -3649.20996, 4.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 780.78003, -3649.28003, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(748, 778.17999, -3649.20996, 4.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 780.78003, -3649.28003, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(712, 738.51001, -3657.53003, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 738.51001, -3657.53003, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(19545, 787.28003, -3659.01001, 4.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19545, 787.28003, -3659.01001, 4.92000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(620, 781.21997, -3669.53003, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 781.21997, -3669.53003, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 742.83002, -3682.71997, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1297, 742.83002, -3682.71997, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(712, 875.46997, -3648.27002, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 765.77002, -3689.59009, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 875.46997, -3648.27002, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 765.77002, -3689.59009, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(6230, 700.27002, -3683.16992, -7.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6230, 700.27002, -3683.16992, -7.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(748, 764.70001, -3698.72998, 4.84000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(748, 764.70001, -3698.72998, 4.84000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 739.09998, -3704.21997, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 739.09998, -3704.21997, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 885.94000, -3668.87012, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 742.83002, -3719.00000, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 885.94000, -3668.87012, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(1297, 742.83002, -3719.00000, 8.41000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(620, 762.42999, -3728.19995, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 762.42999, -3728.19995, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(712, 796.78998, -3734.54004, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 796.78998, -3734.54004, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 875.41998, -3704.38989, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 875.41998, -3704.38989, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 844.04999, -3734.57007, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(712, 844.04999, -3734.57007, 14.43000,   0.00000, 0.00000, 45.92000);
	CreateDynamicObject(620, 884.92999, -3735.73999, 3.62000,   0.00000, 0.00000, 321.28000);
	CreateDynamicObject(620, 884.92999, -3735.73999, 3.62000,   0.00000, 0.00000, 321.28000);

	// Estacionamiento
	CreateDynamicObject(7184, 1635.44177, -1833.20691, -40.54200,   0.00000, 0.00000, 90.50000);
	CreateDynamicObject(11327, 1719.15344, -1879.96045, -48.10490,   0.00000, 0.00000, -30.00000);
	CreateDynamicObject(11327, 1719.15344, -1879.96045, -43.91090,   0.00000, 0.00000, -30.00000);
	CreateDynamicObject(10671, 1678.68311, -1824.69714, -49.15850,   0.00000, 180.00000, 1.00000);
	CreateDynamicObject(10671, 1678.68311, -1824.91309, -45.43850,   0.00000, 180.00000, 1.00000);

	// Objetos pescadores

	CreateDynamicObject(11484, 1438.670044, -2796.649902, -17.240000, 0.000000, 0.000000, 178.860001);
	CreateDynamicObject(11484, 1639.569946, -2796.649902, -17.240000, 0.000000, 0.000000, 178.860001);
	CreateDynamicObject(11484, 1839.569946, -2796.649902, -17.240000, 0.000000, 0.000000, 178.860001);
	CreateDynamicObject(11484, 2039.569946, -2796.649902, -17.240000, 0.000000, 0.000000, 178.860001);

	// Objeto para Pescar
	CreateDynamicObject(1243, 890.69623, -2448.19629, -3.40480,   0.00000, 0.00000, 0.00000); // Isla

	// Muelle Ocean Doks
	CreateDynamicObject(12990, 2829.18652, -2587.56079, 0.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12990, 2829.16992, -2615.67993, 1.05000,   0.00000, 3.48000, 0.00000);
	CreateDynamicObject(10830, 2745.78003, -2604.75000, 7.21000,   0.00000, 0.00000, 45.03000);
	CreateDynamicObject(18981, 2786.12988, -2568.20996, 1.66000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(12990, 2811.77002, -2575.05005, 1.05000,   1.00000, 0.00000, 90.00000);
	CreateDynamicObject(12990, 2772.75000, -2595.44995, 1.35000,   1.50000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 2670.16992, -2514.05005, 15.19000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2683.12988, -2514.04004, 13.18000,   180.25000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2683.12988, -2514.04004, 13.18000,   180.25000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2669.96997, -2526.87012, 13.26000,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2669.96997, -2526.87012, 13.26000,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 2696.57007, -2514.01001, 15.21000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1231, 2696.57007, -2514.01001, 15.21000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(966, 2703.97998, -2514.04004, 12.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(966, 2703.97998, -2514.04004, 12.51000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(967, 2705.25000, -2514.69995, 12.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(967, 2705.25000, -2514.69995, 12.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 2712.43994, -2514.04004, 13.36000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 2712.43994, -2514.04004, 13.36000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(19461, 2715.62988, -2514.03003, 13.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3627, 2683.08008, -2536.53003, 16.25000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 2715.62988, -2514.03003, 13.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3627, 2683.08008, -2536.53003, 16.25000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2669.96997, -2549.27002, 13.26000,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2669.96997, -2549.27002, 13.26000,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(3574, 2726.37988, -2523.69995, 15.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3574, 2726.37988, -2523.69995, 15.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 2670.01001, -2562.20996, 15.25000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1231, 2670.01001, -2562.20996, 15.25000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19461, 2726.66992, -2531.72998, 13.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 2726.66992, -2531.72998, 13.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2682.97998, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2682.97998, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(966, 2726.67993, -2543.66992, 12.63000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3881, 2723.43994, -2546.19995, 14.47000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3882, 2724.27002, -2546.50000, 13.53000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(966, 2726.67993, -2543.66992, 12.63000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3881, 2723.43994, -2546.19995, 14.47000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3882, 2724.27002, -2546.50000, 13.53000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3624, 2748.34009, -2531.12988, 16.73000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(982, 2708.60010, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2708.60010, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(3620, 2711.92993, -2565.53003, 25.68000,   0.00000, 0.00000, 316.01001);
	CreateDynamicObject(3620, 2711.92993, -2565.53003, 25.68000,   0.00000, 0.00000, 316.01001);
	CreateDynamicObject(1607, 2701.13281, -2576.19092, 25.71000,   90.00000, 0.00000, 337.79288);
	CreateDynamicObject(19089, 2701.27002, -2575.85010, 37.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1607, 2701.13281, -2576.19092, 25.71000,   90.00000, 0.00000, 337.79288);
	CreateDynamicObject(19089, 2701.27002, -2575.85010, 37.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2734.21997, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2734.21997, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(2600, 2721.70996, -2576.09009, 2.93000,   0.00000, 0.00000, 308.85001);
	CreateDynamicObject(3577, 2749.90381, -2558.76611, 13.37000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3577, 2754.89990, -2554.98999, 13.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1278, 2747.29004, -2562.36011, 26.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1278, 2747.29004, -2562.36011, 26.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3577, 2759.02002, -2559.69995, 13.37000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1278, 2759.31006, -2562.36011, 26.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1278, 2759.31006, -2562.36011, 26.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1278, 2737.94995, -2581.87012, -2.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12990, 2723.70996, -2590.87012, 1.37000,   1.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2772.36011, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2772.36011, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(1278, 2750.92993, -2581.87012, -2.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19075, 2778.91992, -2566.76001, 3.65000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18981, 2738.00000, -2593.22998, -11.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1609, 2780.11011, -2566.03003, 2.78000,   15.00000, -4.00000, 149.00000);
	CreateDynamicObject(1609, 2778.56006, -2567.55005, 2.59000,   0.00000, 171.00000, 293.00000);
	CreateDynamicObject(3474, 2744.60913, -2594.23779, 5.32000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1231, 2780.48999, -2570.97998, 4.86000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(12990, 2723.66992, -2606.01001, 1.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19630, 2773.76001, -2577.27002, 2.33000,   90.00000, 0.00000, 41.00000);
	CreateDynamicObject(2359, 2774.06006, -2577.22998, 2.39000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19630, 2774.02002, -2577.30005, 2.33000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2752.39990, -2592.71997, 2.46000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2358, 2774.08008, -2577.66992, 2.29000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19277, 2751.69995, -2593.89990, 8.99000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3620, 2777.33008, -2576.02002, 10.68000,   0.00000, 0.00000, 55.25000);
	CreateDynamicObject(18981, 2751.23999, -2593.22998, -11.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1280, 2789.90991, -2564.54004, 2.54000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19630, 2773.76001, -2577.27002, 2.33000,   90.00000, 0.00000, 41.00000);
	CreateDynamicObject(2359, 2774.06006, -2577.22998, 2.39000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19630, 2774.02002, -2577.30005, 2.33000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(2358, 2774.08008, -2577.66992, 2.29000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18981, 2752.23999, -2593.22998, -11.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19630, 2787.05005, -2568.02002, 3.05000,   0.00000, 90.00000, 67.90000);
	CreateDynamicObject(19630, 2787.05005, -2568.30005, 3.05000,   0.00000, 90.00000, 91.59000);
	CreateDynamicObject(1265, 2805.68994, -2548.12988, 13.07000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19630, 2787.05005, -2568.58008, 3.05000,   0.00000, 90.00000, 246.27000);
	CreateDynamicObject(929, 2738.01001, -2603.47998, 2.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19630, 2787.05005, -2568.91992, 3.05000,   0.00000, 90.00000, 318.26999);
	CreateDynamicObject(19630, 2787.05005, -2569.23999, 3.05000,   0.00000, 90.00000, 60.68000);
	CreateDynamicObject(19630, 2787.05200, -2569.53955, 3.04510,   0.00000, 90.00000, 106.75790);
	CreateDynamicObject(2372, 2787.26001, -2569.43994, 2.16000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1264, 2796.29004, -2560.72998, 13.07000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3675, 2751.25000, -2597.92993, 0.70000,   -90.00000, 90.00000, 90.00000);
	CreateDynamicObject(1506, 2786.75000, -2571.44995, 2.34000,   0.00000, 0.00000, 32.58000);
	CreateDynamicObject(1280, 2793.92993, -2564.54004, 2.54000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18632, 2778.56006, -2580.63989, 3.49000,   0.00000, 130.00000, 88.94000);
	CreateDynamicObject(982, 2797.93994, -2562.31006, 13.26000,   180.00000, 0.00000, 90.00000);
	CreateDynamicObject(1810, 2782.08008, -2579.16992, 2.14000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 2752.39990, -2601.19995, 2.46000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1461, 2786.37012, -2575.41992, 2.92000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1828, 2789.53003, -2572.32007, 2.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12990, 2767.81006, -2590.87012, 1.27000,   1.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 2791.92993, -2570.51001, 3.67000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2026, 2789.01001, -2573.61011, 5.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18632, 2781.76001, -2580.63989, 3.49000,   0.00000, 130.00000, 88.94000);
	CreateDynamicObject(984, 2781.76001, -2580.63989, 2.88000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(10830, 2745.78003, -2604.75000, -9.19000,   180.00000, 0.00000, 135.03000);
	CreateDynamicObject(19325, 2786.68994, -2576.21997, 3.67000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 2798.54004, -2564.04004, 2.90000,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(1763, 2791.91992, -2571.07007, 2.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2260, 2787.25000, -2576.03003, 3.96000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1721, 2789.41992, -2573.87012, 2.34000,   0.00000, 0.00000, 184.60001);
	CreateDynamicObject(10830, 2745.78003, -2604.75000, -9.19000,   180.00000, 0.00000, 135.03000);
	CreateDynamicObject(2260, 2787.25000, -2576.03003, 3.96000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2278, 2793.04004, -2571.05005, 3.93000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1721, 2790.91992, -2573.87012, 2.34000,   0.00000, 0.00000, 171.17000);
	CreateDynamicObject(2782, 2789.52002, -2575.36011, 3.36000,   0.00000, 0.00000, 63.89000);
	CreateDynamicObject(19382, 2775.12988, -2587.98999, -3.25000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19368, 2788.33008, -2577.29004, 3.62000,   0.00000, 0.00000, 85.13000);
	CreateDynamicObject(18632, 2784.95996, -2580.63989, 3.49000,   0.00000, 130.00000, 88.94000);
	CreateDynamicObject(2180, 2790.55005, -2575.38989, 2.34000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2819, 2787.23999, -2578.60010, 2.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2775.12988, -2587.98999, -3.25000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(2819, 2787.23999, -2578.60010, 2.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18632, 2798.54004, -2567.27002, 3.57000,   0.00000, 130.00000, 173.31000);
	CreateDynamicObject(18632, 2790.84009, -2575.53003, 3.16000,   90.00000, 0.00000, 64.44000);
	CreateDynamicObject(18981, 2785.10010, -2579.34009, -11.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18981, 2797.21411, -2567.23145, -11.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1736, 2789.70996, -2577.02002, 4.66000,   0.00000, 0.00000, 176.16000);
	CreateDynamicObject(2001, 2795.57007, -2570.98999, 2.34000,   0.00000, 0.00000, 321.23999);
	CreateDynamicObject(2079, 2790.05005, -2576.76001, 2.96000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3675, 2751.25000, -2606.28003, -1.16000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2026, 2793.63989, -2573.61011, 5.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18632, 2798.54004, -2568.87012, 3.57000,   0.00000, 130.00000, 182.77000);
	CreateDynamicObject(2287, 2795.47998, -2572.30005, 3.93000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2524, 2787.80005, -2580.09009, 2.34000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19512, 2792.61011, -2575.62988, 4.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19511, 2792.61011, -2575.62988, 4.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19396, 2789.25000, -2579.00000, 3.96000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1736, 2789.70996, -2577.02002, 4.66000,   0.00000, 0.00000, 176.16000);
	CreateDynamicObject(2514, 2788.19995, -2580.17993, 2.34000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19368, 2791.53003, -2577.42993, 3.62000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 2789.26001, -2579.75000, 2.20000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2596, 2792.40991, -2577.07007, 4.62000,   0.00000, 0.00000, 184.46001);
	CreateDynamicObject(2146, 2791.53003, -2577.93994, 2.42000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 2795.96997, -2573.47998, 3.67000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2559, 2795.50000, -2574.01001, 3.21000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(14532, 2789.89990, -2580.10010, 3.32000,   0.00000, 0.00000, 310.92001);
	CreateDynamicObject(2596, 2792.40991, -2577.07007, 4.62000,   0.00000, 0.00000, 184.46001);
	CreateDynamicObject(3004, 2795.95996, -2574.60010, 3.01000,   87.00000, 0.00000, 90.00000);
	CreateDynamicObject(2600, 2798.17993, -2572.59009, 3.12000,   0.00000, 0.00000, 65.58000);
	CreateDynamicObject(19396, 2794.52002, -2576.70996, 3.62000,   0.00000, 0.00000, 116.62000);
	CreateDynamicObject(2559, 2796.28003, -2575.01001, 3.21000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19396, 2793.14990, -2579.00000, 4.08000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19396, 2794.52002, -2576.70996, 3.62000,   0.00000, 0.00000, 116.62000);
	CreateDynamicObject(2559, 2796.28003, -2575.01001, 3.21000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2001, 2795.63989, -2576.64990, 2.34000,   0.00000, 0.00000, 321.23999);
	CreateDynamicObject(1494, 2793.15991, -2579.73999, 2.32000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2803, 2799.37988, -2573.47998, 1.92000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19089, 2789.09009, -2584.78003, 22.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16780, 2795.44995, -2578.80005, 5.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2721.28003, -2628.59009, 10.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19089, 2789.09009, -2584.78003, 22.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2721.28003, -2628.59009, 10.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1506, 2797.83008, -2576.84009, 2.24000,   0.00000, 0.00000, 289.67999);
	CreateDynamicObject(2689, 2794.68994, -2580.60010, 3.94000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2798.54004, -2578.64990, 3.85000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12990, 2767.79004, -2606.01001, 1.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2406, 2797.11011, -2580.41992, 3.60000,   -11.00000, 0.00000, 180.00000);
	CreateDynamicObject(10841, 2729.26001, -2627.71997, -1.08000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19382, 2805.17993, -2572.70996, -3.61000,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 2798.54004, -2578.64990, 3.85000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2805.17993, -2572.70996, -3.61000,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19382, 2805.17993, -2577.44995, -3.61000,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(1215, 2774.98999, -2610.20996, 1.61000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2745.78003, -2628.56006, 15.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2774.98999, -2610.20996, 1.61000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2745.78003, -2628.56006, 15.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(10841, 2762.26001, -2627.71997, -1.08000,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(1215, 2770.26001, -2628.59009, 10.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2770.26001, -2628.59009, 10.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2831.46582, -2572.77832, 1.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 2831.46582, -2572.77832, 1.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2826.83008, -2583.15991, -3.95000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2826.83008, -2583.15991, -3.95000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2831.52002, -2577.87988, -4.07000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2831.52002, -2577.87988, -4.07000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2826.80005, -2608.68994, -3.61000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2826.80005, -2608.68994, -3.61000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2831.45996, -2608.68994, -3.95000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19382, 2831.45996, -2608.68994, -3.95000,   90.00000, 0.00000, 0.00000);

	// Muelle LS
	CreateDynamicObject(5130, 2908.36011, -1032.56995, 7.57000,   0.00000, 0.00000, 135.08000);
	CreateDynamicObject(5130, 2920.32007, -1032.54004, 7.57000,   0.00000, 0.00000, 315.12000);
	CreateDynamicObject(9829, 2929.05005, -1029.16003, -60.72000,   0.00000, 0.00000, 180.00000);

	// Edificio Municipal
	CreateDynamicObject(333, 1770.709961, -1295.109985, 109.949997, 0.000000, 0.000000, 230.389999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1771.150024, -1298.900024, 110.300003, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(333, 1770.709961, -1295.109985, 109.949997, 0.000000, 0.000000, 230.389999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1771.150024, -1298.900024, 110.300003, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2639, 1771.890015, -1299.130005, 108.879997, 0.000000, 0.000000, 216.399994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2639, 1771.089966, -1300.560059, 108.879997, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2639, 1771.069946, -1302.699951, 108.879997, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2762, 1773.310059, -1300.619995, 108.760002, 0.000000, 0.000000, 69.790001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1622, 1777.349976, -1296.670044, 112.940002, 350.029999, 310.149994, 79.760002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2639, 1771.079956, -1304.810059, 108.879997, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2762, 1772.859985, -1302.859985, 108.779999, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1771.079956, -1306.160034, 110.400002, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16779, 1774.199951, -1303.020020, 113.360001, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1780.369995, -1295.869995, 108.250000, 0.000000, 0.000000, 3.960000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2639, 1772.000000, -1306.290039, 108.900002, 0.000000, 0.000000, 322.100006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3675, 1778.530029, -1298.859985, 111.160004, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2762, 1773.780029, -1305.239990, 108.760002, 0.000000, 0.000000, 129.600006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1671, 1773.770020, -1302.739990, 92.456802, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1893, 1776.349976, -1304.329956, 112.820000, 180.529999, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1783.400024, -1295.689941, 108.250000, 0.000000, 0.000000, 3.960000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2207, 1775.869995, -1303.619995, 91.996597, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3675, 1778.579956, -1306.079956, 111.180000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1329, 1783.270020, -1301.670044, 108.800003, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(10250, 1788.550049, -1297.510010, 164.520004, 0.000000, 0.000000, 179.460007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2611, 1783.459961, -1302.979980, 110.449997, 0.000000, 0.000000, 269.769989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(10182, 1783.619995, -1303.800049, 109.959999, 270.989990, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3077, 1783.469971, -1303.770020, 108.000000, 0.000000, 0.000000, 269.519989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2612, 1783.430054, -1304.819946, 110.470001, 0.000000, 0.000000, 269.769989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1790.859985, -1295.449951, 109.830002, 0.000000, 0.000000, 0.190000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1790.869995, -1295.500000, 109.779999, 0.000000, 0.000000, 180.729996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2714, 1787.219971, -1301.530029, 111.260002, 0.000000, 0.000000, 179.759995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14559, 1790.599976, -1303.920044, 134.330002, 1.000000, 359.250000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2970, 1790.060059, -1301.670044, 108.400002, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(10182, 1789.709961, -1303.729980, 110.879997, 270.989990, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1784.079956, -1312.239990, 110.400002, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2191, 1790.530029, -1304.000000, 108.349998, 1.080000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2191, 1790.520020, -1305.449951, 108.349998, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(10250, 1787.250000, -1312.089966, 164.520004, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1792.670044, -1304.640015, 108.230003, 0.000000, 0.000000, 267.459991, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2200, 1812.140015, -1277.180054, 108.300003, 0.000000, 0.000000, 84.849998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2200, 1812.479980, -1277.250000, 110.160004, 180.539993, 0.000000, 88.809998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1794.079956, -1304.099976, 108.349998, 0.000000, 0.000000, 270.600006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1801.130005, -1294.719971, 108.250000, 0.000000, 0.000000, 43.849998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1795.459961, -1302.750000, 108.330002, 0.000000, 0.000000, 178.639999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2165, 1814.199951, -1275.040039, 108.250000, 0.000000, 0.000000, 29.900000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1788.599976, -1312.219971, 109.879997, 0.000000, 0.000000, 176.759995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1803.280029, -1292.650024, 108.220001, 0.000000, 0.000000, 43.840000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1788.670044, -1312.239990, 109.879997, 0.000000, 0.000000, 358.200012, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2200, 1812.030029, -1279.439941, 108.290001, 0.000000, 0.000000, 88.820000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2200, 1812.449951, -1279.459961, 110.150002, 180.539993, 0.000000, 88.820000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1814.939941, -1275.839966, 108.260002, 0.000000, 0.000000, 300.179993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1805.430054, -1290.550049, 108.220001, 0.000000, 0.000000, 43.849998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1329, 1812.339966, -1280.410034, 108.699997, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2165, 1816.670044, -1273.849976, 108.269997, 0.000000, 0.000000, 29.900000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1795.000000, -1305.130005, 108.349998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1796.010010, -1304.150024, 108.330002, 0.000000, 0.000000, 180.539993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1807.609985, -1288.459961, 108.220001, 0.000000, 0.000000, 43.849998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2165, 1818.400024, -1272.560059, 108.269997, 0.000000, 0.000000, 29.910000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1809.760010, -1286.349976, 108.239998, 0.000000, 0.000000, 43.849998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1817.589966, -1274.280029, 108.269997, 0.000000, 0.000000, 29.910000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2183, 1795.770020, -1301.050049, 91.946602, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1820.130005, -1271.349976, 110.320000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1795.750000, -1306.489990, 108.349998, 0.000000, 0.000000, 357.190002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1893, 1798.369995, -1304.310059, 112.870003, 180.539993, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1796.920044, -1305.180054, 108.330002, 0.000000, 0.000000, 90.059998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3675, 1815.800049, -1279.069946, 111.070000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1799.880005, -1301.760010, 108.330002, 0.000000, 0.000000, 180.539993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1819.469971, -1273.410034, 108.269997, 0.000000, 0.000000, 29.900000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1798.060059, -1304.770020, 108.330002, 0.000000, 0.000000, 94.910004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2008, 1820.959961, -1271.089966, 108.269997, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1794.180054, -1310.209961, 108.349998, 0.000000, 0.000000, 178.639999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2379, 1817.849976, -1271.579956, 91.986603, 0.000000, 0.000000, 31.170000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2191, 1799.359985, -1304.319946, 108.330002, 0.000000, 0.000000, 269.190002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1800.380005, -1303.099976, 108.330002, 0.000000, 0.000000, 180.130005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1818.510010, -1276.810059, 108.269997, 0.000000, 0.000000, 270.049988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1821.380005, -1272.209961, 108.269997, 0.000000, 0.000000, 340.049988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1798.199951, -1301.540039, 92.026604, 0.000000, 0.000000, 359.619995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1818.290039, -1277.660034, 108.269997, 0.000000, 0.000000, 270.260010, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2183, 1795.770020, -1305.300049, 91.976601, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16779, 1800.880005, -1305.060059, 113.330002, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1796.099976, -1310.089966, 108.349998, 0.000000, 0.000000, 178.639999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1799.500000, -1305.939941, 108.330002, 0.000000, 0.000000, 0.660000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1794.839966, -1311.729980, 108.349998, 0.000000, 0.000000, 179.779999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1800.430054, -1305.050049, 108.330002, 0.000000, 0.000000, 90.400002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1798.400024, -1303.310059, 92.026604, 0.000000, 0.000000, 179.619995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1796.319946, -1306.290039, 92.026604, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2008, 1823.790039, -1271.030029, 108.269997, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3675, 1811.089966, -1292.520020, 110.989998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1800.040039, -1306.910034, 108.330002, 0.000000, 0.000000, 3.190000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1808, 1805.209961, -1300.520020, 108.250000, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2745, 1796.890015, -1295.589966, 65.970001, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1804.119995, -1302.390015, 108.330002, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1796.709961, -1311.790039, 108.349998, 0.000000, 0.000000, 178.880005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1893, 1809.449951, -1296.540039, 112.849998, 180.529999, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1893, 1823.510010, -1275.040039, 112.839996, 0.000000, 180.539993, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2403, 1817.729980, -1277.930054, 92.006599, 0.000000, 0.000000, 96.879997, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1820.739990, -1278.569946, 108.260002, 0.000000, 0.000000, 80.830002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2601, 1799.010010, -1305.229980, 92.856598, 0.000000, 0.000000, 112.500000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1824.760010, -1272.130005, 108.269997, 0.000000, 0.000000, 39.869999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1806.219971, -1301.089966, 110.370003, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1820.589966, -1279.770020, 108.269997, 0.000000, 0.000000, 89.510002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2183, 1795.770020, -1309.800049, 91.976601, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1821.709961, -1278.439941, 108.320000, 0.000000, 0.000000, 180.529999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1805.839966, -1302.040039, 108.330002, 0.000000, 0.000000, 270.929993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1804.300049, -1304.479980, 108.330002, 0.000000, 0.000000, 270.260010, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1798.349976, -1307.660034, 92.026604, 0.000000, 0.000000, 179.619995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2193, 1799.650024, -1310.750000, 108.269997, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2002, 1798.989990, -1295.479980, 64.790001, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1824.479980, -1275.020020, 108.320000, 0.000000, 0.000000, 270.049988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1823.959961, -1276.020020, 108.320000, 0.000000, 0.000000, 271.339996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1799.569946, -1311.260010, 108.349998, 0.000000, 0.000000, 43.900002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2008, 1826.910034, -1271.010010, 108.269997, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1822.500000, -1278.760010, 108.269997, 0.000000, 0.000000, 180.320007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1822.619995, -1278.979980, 108.260002, 0.000000, 0.000000, 0.850000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2198, 1805.890015, -1303.979980, 108.330002, 0.000000, 0.000000, 271.429993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2753, 1803.660034, -1302.800049, 92.996597, 0.000000, 0.000000, 258.750000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3089, 1818.489990, -1286.989990, 109.599998, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1827.719971, -1271.390015, 108.279999, 0.000000, 0.000000, 359.989990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1818.890015, -1286.500000, 108.279999, 0.000000, 0.000000, 359.779999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1823.410034, -1279.420044, 108.320000, 0.000000, 0.000000, 340.049988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2771, 1803.660034, -1304.949951, 92.946602, 0.000000, 0.000000, 281.250000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1776, 1818.489990, -1289.189941, 109.370003, 0.000000, 0.000000, 269.190002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2208, 1803.670044, -1305.099976, 91.936600, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2191, 1802.260010, -1311.719971, 108.269997, 1.070000, 0.000000, 180.529999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1210, 1830.199951, -1270.560059, 109.250000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1778.739990, -1294.869995, 17.580000, 0.000000, 0.000000, 29.100000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1778.739990, -1294.869995, 17.580000, 0.000000, 0.000000, 209.100006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2008, 1830.000000, -1270.959961, 108.290001, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1826.650024, -1277.229980, 108.320000, 0.000000, 0.000000, 71.940002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3638, 1826.949951, -1282.020020, 134.059998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2204, 1806.439941, -1302.790039, 92.016602, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1826.569946, -1277.939941, 108.320000, 0.000000, 0.000000, 89.459999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2191, 1803.619995, -1311.699951, 108.269997, 1.080000, 0.000000, 180.539993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1827.819946, -1276.849976, 108.320000, 0.000000, 0.000000, 141.729996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1822.750000, -1285.469971, 108.320000, 0.000000, 0.000000, 268.959991, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1828.569946, -1276.030029, 108.320000, 0.000000, 0.000000, 359.730011, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1776, 1818.569946, -1292.449951, 109.370003, 0.000000, 0.000000, 269.190002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1830.910034, -1271.989990, 108.290001, 0.000000, 0.000000, 359.989990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1782.540039, -1292.729980, 17.600000, 0.000000, 0.000000, 29.600000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1782.540039, -1292.729980, 17.590000, 0.000000, 0.000000, 209.600006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1778.739990, -1294.869995, 14.300000, 0.000000, 0.000000, 209.100006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1778.739990, -1294.869995, 14.300000, 0.000000, 0.000000, 29.100000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1828.430054, -1276.939941, 108.320000, 0.000000, 0.000000, 180.270004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3813, 1823.229980, -1287.000000, 112.379997, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2714, 1818.439941, -1294.310059, 111.559998, 0.000000, 0.000000, 270.239990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(970, 1778.719971, -1294.920044, 13.080000, 0.000000, 0.000000, 29.870001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2200, 1832.359985, -1270.969971, 108.309998, 0.000000, 0.000000, 310.149994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2484, 1832.530029, -1271.489990, 111.040001, 0.000000, 0.000000, 132.110001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2174, 1805.599976, -1311.579956, 108.349998, 0.000000, 0.000000, 180.539993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1820.839966, -1272.040039, 64.830002, 0.000000, 0.000000, 242.369995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1806, 1829.510010, -1276.599976, 108.320000, 0.000000, 0.000000, 352.179993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3089, 1810.420044, -1305.900024, 109.629997, 0.000000, 0.000000, 0.040000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1779.979980, -1297.500000, 17.240000, 0.000000, 0.000000, 31.350000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1815.859985, -1280.560059, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1209, 1820.199951, -1286.660034, 92.036598, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1295, 1823.280029, -1287.310059, 108.290001, 0.000000, 0.000000, 280.239990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1786.239990, -1290.489990, 17.600000, 0.000000, 0.000000, 33.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1786.239990, -1290.489990, 17.600000, 0.000000, 0.000000, 213.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1782.540039, -1292.729980, 14.300000, 0.000000, 0.000000, 29.600000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1782.540039, -1292.729980, 14.300000, 0.000000, 0.000000, 209.600006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3675, 1829.319946, -1279.079956, 111.019997, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19003, 1790.319946, -1287.270020, 19.379999, 0.000000, 0.000000, 2.090000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1818.660034, -1277.449951, 64.830002, 0.000000, 0.000000, 265.220001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2949, 1814.349976, -1301.560059, 108.300003, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1808, 1828.630005, -1279.949951, 108.320000, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1775, 1824.250000, -1287.609985, 109.419998, 0.000000, 0.000000, 90.809998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1820.319946, -1275.239990, 64.830002, 0.000000, 0.000000, 188.820007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(970, 1782.520020, -1292.780029, 13.120000, 0.000000, 0.000000, 29.680000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(955, 1821.619995, -1286.560059, 92.436600, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1822.130005, -1272.699951, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2286, 1833.729980, -1272.680054, 111.129997, 0.000000, 0.000000, 309.350006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3856, 1814.250000, -1302.849976, 108.690002, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1789.750000, -1287.949951, 17.600000, 0.000000, 0.000000, 219.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1789.750000, -1287.949951, 17.600000, 0.000000, 0.000000, 39.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1780.020020, -1297.500000, 14.080000, 0.000000, 0.000000, 31.350000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16779, 1833.099976, -1274.869995, 113.379997, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2165, 1833.339966, -1273.199951, 108.300003, 0.000000, 0.000000, 312.089996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(15038, 1780.430054, -1296.380005, 12.990000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1822.829956, -1272.229980, 64.839996, 0.000000, 0.000000, 190.990005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1786.239990, -1290.489990, 14.300000, 0.000000, 0.000000, 213.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1786.239990, -1290.489990, 14.300000, 0.000000, 0.000000, 33.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1808.900024, -1310.699951, 108.300003, 0.000000, 0.000000, 270.049988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1715, 1833.010010, -1274.420044, 108.300003, 0.000000, 0.000000, 130.690002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2596, 1810.869995, -1293.760010, 68.489998, 0.000000, 0.000000, 338.850006, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1820.030029, -1277.760010, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(956, 1822.910034, -1286.560059, 92.406601, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(970, 1786.160034, -1290.599976, 13.110000, 0.000000, 0.000000, 33.990002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1793.150024, -1285.229980, 17.600000, 0.000000, 0.000000, 219.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1793.150024, -1285.229980, 17.600000, 0.000000, 0.000000, 39.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1253, 1834.589966, -1273.650024, 109.680000, 0.000000, 0.000000, 310.149994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1715, 1809.140015, -1311.839966, 108.300003, 0.000000, 0.000000, 140.649994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1781.930054, -1300.050049, 17.240000, 0.000000, 0.000000, 44.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1811.209961, -1292.890015, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1789.750000, -1287.949951, 14.300000, 0.000000, 0.000000, 39.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1789.750000, -1287.949951, 14.300000, 0.000000, 0.000000, 219.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1823.050049, -1274.760010, 64.839996, 0.000000, 0.000000, 86.900002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3089, 1818.489990, -1300.130005, 109.599998, 0.000000, 0.000000, 89.779999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1821.160034, -1278.420044, 64.839996, 0.000000, 0.000000, 333.779999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1818.410034, -1300.849976, 110.320000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1209, 1824.500000, -1291.359985, 108.290001, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1795.979980, -1282.849976, 17.370001, 0.000000, 90.000000, 221.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1795.979980, -1282.849976, 17.370001, 0.000000, 90.000000, 41.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(970, 1789.589966, -1288.119995, 13.120000, 0.000000, 0.000000, 38.139999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1823.020020, -1275.780029, 64.839996, 0.000000, 0.000000, 177.660004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1295, 1823.849976, -1292.689941, 108.209999, 0.000000, 0.000000, 280.239990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1820.890015, -1279.750000, 64.839996, 0.000000, 0.000000, 86.900002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1805.959961, -1301.910034, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1793.150024, -1285.229980, 14.300000, 0.000000, 0.000000, 219.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1793.150024, -1285.229980, 14.300000, 0.000000, 0.000000, 39.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2164, 1835.199951, -1274.829956, 108.309998, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1820.359985, -1281.260010, 64.830002, 0.000000, 0.000000, 349.839996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1805.800049, -1302.729980, 64.820000, 0.000000, 0.000000, 270.549988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3498, 1794.540039, -1283.989990, 14.680000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1781.969971, -1300.050049, 14.080000, 0.000000, 0.000000, 44.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2289, 1806.339966, -1303.750000, 67.879997, 0.000000, 0.000000, 270.010010, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2200, 1835.180054, -1275.589966, 108.260002, 1.080000, 0.000000, 88.809998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1798.979980, -1280.589966, 17.590000, 0.000000, 0.000000, 35.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1798.979980, -1280.589966, 17.590000, 0.000000, 0.000000, 215.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(970, 1792.810059, -1285.530029, 13.120000, 0.000000, 0.000000, 38.730000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1715, 1812.270020, -1310.790039, 108.300003, 0.000000, 0.000000, 270.260010, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2184, 1832.739990, -1280.609985, 108.349998, 0.000000, 0.000000, 244.889999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1811.869995, -1311.729980, 108.300003, 0.000000, 0.000000, 89.510002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1824.969971, -1275.160034, 64.830002, 0.000000, 0.000000, 249.880005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1810.160034, -1298.239990, 64.830002, 0.000000, 0.000000, 253.830002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1833.209961, -1280.680054, 109.120003, 0.000000, 0.000000, 36.230000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1783.020020, -1302.750000, 17.260000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1835.140015, -1277.839966, 110.360001, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1832.189941, -1282.619995, 109.120003, 0.000000, 0.000000, 59.820000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3498, 1797.430054, -1281.709961, 14.580000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2184, 1831.750000, -1283.359985, 108.349998, 0.000000, 0.000000, 288.730011, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1822.890015, -1279.589966, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1817.930054, -1287.530029, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1794.890015, -1283.869995, 12.630000, 0.000000, 0.000000, 41.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1826.270020, -1274.010010, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1809.069946, -1300.630005, 64.830002, 0.000000, 0.000000, 292.480011, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1824.380005, -1295.900024, 109.820000, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2836, 1789.640015, -1291.849976, 12.600000, 0.000000, 0.000000, 28.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1783.199951, -1301.250000, 14.080000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1818.030029, -1288.500000, 64.820000, 0.000000, 0.000000, 270.549988, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1798.979980, -1280.589966, 14.290000, 0.000000, 0.000000, 35.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1798.979980, -1280.589966, 14.290000, 0.000000, 0.000000, 215.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1802.609985, -1278.140015, 17.590000, 0.000000, 0.000000, 33.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1802.609985, -1278.140015, 17.590000, 0.000000, 0.000000, 213.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1502, 1797.150024, -1281.839966, 12.630000, 0.000000, 0.000000, 221.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1805.969971, -1305.670044, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(12842, 1832.430054, -1278.569946, 92.416603, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1827.219971, -1273.969971, 64.839996, 0.000000, 0.000000, 190.990005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1823.750000, -1279.900024, 64.839996, 0.000000, 0.000000, 181.119995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1835.089966, -1279.739990, 109.120003, 0.000000, 0.000000, 355.660004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1812.290039, -1297.530029, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2184, 1835.290039, -1279.250000, 108.349998, 0.000000, 0.000000, 202.509995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19273, 1783.900024, -1301.150024, 14.010000, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16377, 1824.719971, -1291.849976, 92.966599, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1793.780029, -1287.479980, 12.620000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3051, 1783.839966, -1301.349976, 13.790000, 0.000000, 0.000000, 315.510010, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1715, 1833.989990, -1281.930054, 108.309998, 0.000000, 0.000000, 220.419998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1811.579956, -1299.079956, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1783.060059, -1302.750000, 14.080000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1832.630005, -1284.650024, 109.120003, 0.000000, 0.000000, 99.699997, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1715, 1834.810059, -1280.829956, 108.309998, 0.000000, 0.000000, 130.690002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1818.500000, -1306.380005, 110.349998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1810.380005, -1301.010010, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1793.510010, -1288.410034, 12.600000, 0.000000, 0.000000, 283.989990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1825.780029, -1277.650024, 64.839996, 0.000000, 0.000000, 177.660004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2836, 1791.819946, -1290.829956, 12.580000, 0.000000, 0.000000, 21.990000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1812.390015, -1298.500000, 64.839996, 0.000000, 0.000000, 177.369995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14559, 1824.189941, -1302.739990, 134.240005, 359.500000, 359.250000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1824.130005, -1280.839966, 64.839996, 0.000000, 0.000000, 263.769989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1783.020020, -1305.949951, 17.260000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1549, 1794.660034, -1287.310059, 12.600000, 0.000000, 0.000000, 257.989990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1829.319946, -1272.000000, 64.839996, 0.000000, 0.000000, 177.660004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1815.170044, -1294.890015, 64.830002, 0.000000, 0.000000, 183.809998, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1295, 1823.520020, -1299.520020, 108.199997, 0.000000, 0.000000, 280.239990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1823.829956, -1281.650024, 64.839996, 0.000000, 0.000000, 86.900002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1827.170044, -1276.050049, 64.839996, 0.000000, 0.000000, 86.900002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3675, 1815.050049, -1313.859985, 111.040001, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2184, 1832.869995, -1286.020020, 108.349998, 0.000000, 0.000000, 328.609985, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1715, 1834.229980, -1284.430054, 108.309998, 0.000000, 0.000000, 290.209991, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3675, 1829.250000, -1294.180054, 111.099998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1824.459961, -1302.219971, 109.839996, 0.000000, 0.000000, 270.260010, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1811.599976, -1301.199951, 64.839996, 0.000000, 0.000000, 231.679993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1834.219971, -1286.540039, 109.120003, 0.000000, 0.000000, 139.570007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1823.290039, -1282.890015, 64.830002, 0.000000, 0.000000, 3.840000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1715, 1834.949951, -1285.109985, 108.320000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2002, 1817.979980, -1291.750000, 64.790001, 0.000000, 0.000000, 269.130005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1814.880005, -1297.170044, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3638, 1827.890015, -1303.869995, 134.059998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1817.430054, -1293.630005, 64.830002, 0.000000, 0.000000, 173.839996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1816.319946, -1295.540039, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1295, 1823.949951, -1304.930054, 108.070000, 0.000000, 0.000000, 280.239990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1815.109985, -1318.469971, 110.360001, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1815.800049, -1297.689941, 64.839996, 0.000000, 0.000000, 177.369995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(12842, 1832.430054, -1285.819946, 92.416603, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1816.910034, -1296.140015, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1828.959961, -1275.959961, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1806.150024, -1311.849976, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19446, 1787.550049, -1301.239990, 17.260000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14699, 1795.329956, -1291.359985, 17.730000, 0.000000, 0.000000, 34.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1791.069946, -1292.550049, 12.550000, 0.000000, 0.000000, 203.990005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1829.319946, -1299.630005, 109.849998, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1817.930054, -1296.500000, 64.839996, 0.000000, 0.000000, 181.119995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1829.949951, -1276.250000, 64.839996, 0.000000, 0.000000, 179.479996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19003, 1803.900024, -1281.130005, 19.280001, 0.000000, 0.000000, 34.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1802.609985, -1278.140015, 14.290000, 0.000000, 0.000000, 33.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1802.609985, -1278.140015, 14.290000, 0.000000, 0.000000, 213.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1824.420044, -1307.819946, 109.860001, 0.000000, 0.000000, 270.260010, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1806.369995, -1275.880005, 17.590000, 0.000000, 0.000000, 29.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1806.369995, -1275.880005, 17.590000, 0.000000, 0.000000, 209.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1295, 1823.589966, -1309.000000, 108.099998, 0.000000, 0.000000, 280.239990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1783.060059, -1305.949951, 14.080000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1830.189941, -1299.609985, 109.849998, 0.000000, 0.000000, 270.269989, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1831.910034, -1273.979980, 64.839996, 0.000000, 0.000000, 177.660004, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1829.119995, -1279.239990, 64.830002, 0.000000, 0.000000, 3.840000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1835.130005, -1291.640015, 109.849998, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1835.130005, -1291.849976, 109.860001, 0.000000, 0.000000, 269.750000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1998, 1829.949951, -1277.969971, 64.839996, 0.000000, 0.000000, 86.900002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1793.479980, -1291.479980, 12.530000, 0.000000, 0.000000, 203.990005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1817.819946, -1317.869995, 108.309998, 0.000000, 0.000000, 157.619995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1893, 1821.150024, -1314.880005, 112.930000, 180.539993, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1829.310059, -1280.560059, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2202, 1817.729980, -1299.609985, 64.800003, 0.000000, 0.000000, 268.929993, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1809.349976, -1311.719971, 64.820000, 0.000000, 0.000000, 179.800003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1789.939941, -1302.750000, 17.260000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1806.369995, -1275.880005, 14.290000, 0.000000, 0.000000, 29.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1806.369995, -1275.880005, 14.290000, 0.000000, 0.000000, 209.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1232, 1794.270020, -1291.010010, 10.780000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19446, 1787.550049, -1306.479980, 17.260000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, 1789.520020, -1300.670044, 13.630000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1810.469971, -1311.780029, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16377, 1824.719971, -1305.650024, 92.966599, 0.000000, 0.000000, 270.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14699, 1803.839966, -1285.020020, 17.740000, 0.000000, 0.000000, 34.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1790.119995, -1301.250000, 14.080000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1801.489990, -1284.880005, 13.710000, 0.000000, 0.000000, 61.990002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1810.449951, -1274.579956, 17.590000, 0.000000, 0.000000, 7.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1810.449951, -1274.579956, 17.590000, 0.000000, 0.000000, 187.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1801.180054, -1284.719971, 12.660000, 0.000000, 0.000000, 306.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19446, 1794.650024, -1298.739990, 17.240000, 0.000000, 0.000000, 302.670013, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1789.900024, -1302.750000, 14.080000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1789.939941, -1305.949951, 17.260000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1801.689941, -1285.439941, 12.650000, 0.000000, 0.000000, 306.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1821.449951, -1317.819946, 108.330002, 0.000000, 0.000000, 179.460007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19446, 1787.550049, -1306.439941, 14.080000, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2253, 1802.219971, -1286.579956, 13.980000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1829.290039, -1307.489990, 109.849998, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1999, 1815.670044, -1307.560059, 64.730003, 0.000000, 0.000000, 89.389999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3498, 1790.199951, -1301.219971, 11.230000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(12842, 1832.430054, -1296.819946, 92.416603, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1802.209961, -1286.160034, 12.650000, 0.000000, 0.000000, 306.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1810.449951, -1274.579956, 14.290000, 0.000000, 0.000000, 7.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1810.449951, -1274.579956, 14.290000, 0.000000, 0.000000, 187.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1802.369995, -1287.160034, 13.700000, 0.000000, 0.000000, 134.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19446, 1794.650024, -1298.640015, 14.080000, 0.000000, 0.000000, 302.670013, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1835.109985, -1299.479980, 109.849998, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1835.079956, -1299.650024, 109.820000, 0.000000, 0.000000, 269.750000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1830.150024, -1307.479980, 109.849998, 0.000000, 0.000000, 269.190002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14699, 1801.520020, -1292.979980, 17.730000, 0.000000, 0.000000, 34.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1364, 1809.770020, -1276.040039, 13.450000, 0.000000, 0.000000, -7.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19354, 1789.900024, -1305.949951, 14.080000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(16779, 1825.670044, -1315.709961, 113.370003, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1802.760010, -1286.880005, 12.650000, 0.000000, 0.000000, 306.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1818.099976, -1306.290039, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2167, 1805.750000, -1283.069946, 12.650000, 0.000000, 0.000000, 303.489990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1893, 1832.750000, -1306.030029, 112.830002, 0.000000, 180.539993, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2252, 1803.489990, -1288.160034, 14.030000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2961, 1798.390015, -1295.599976, 13.560000, 0.000000, 0.000000, 179.990005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2069, 1818.099976, -1307.479980, 64.839996, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1803.290039, -1287.630005, 12.650000, 0.000000, 0.000000, 306.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2009, 1816.660034, -1309.630005, 64.730003, 0.000000, 0.000000, 89.389999, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1814.829956, -1274.199951, 17.590000, 0.000000, 0.000000, 3.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1814.829956, -1274.199951, 17.590000, 0.000000, 0.000000, 183.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2606, 1803.770020, -1288.079956, 13.410000, 0.000000, 0.000000, 126.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1807.040039, -1289.349976, 19.150000, 29.990000, 0.000000, 257.989990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2164, 1806.329956, -1283.979980, 12.640000, 0.000000, 0.000000, 303.109985, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1825.010010, -1317.810059, 108.330002, 0.000000, 0.000000, 179.460007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1803.839966, -1288.369995, 12.650000, 0.000000, 0.000000, 306.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3675, 1829.260010, -1313.829956, 111.099998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1804.380005, -1289.109985, 12.650000, 0.000000, 0.000000, 306.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2825, 1826.339966, -1298.930054, 66.199997, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1826.300049, -1298.439941, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1814.829956, -1274.199951, 14.290000, 0.000000, 0.000000, 3.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1649, 1814.829956, -1274.199951, 14.290000, 0.000000, 0.000000, 183.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1829.280029, -1294.459961, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2186, 1807.290039, -1285.920044, 12.630000, 0.000000, 0.000000, 302.119995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1826.300049, -1299.390015, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1815.719971, -1314.770020, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(12842, 1832.430054, -1304.150024, 92.416603, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2423, 1804.910034, -1289.829956, 12.640000, 0.000000, 0.000000, 306.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1364, 1813.099976, -1278.380005, 13.450000, 0.000000, 0.000000, -55.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1805.819946, -1289.260010, 12.640000, 0.000000, 0.000000, 34.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1835.060059, -1307.380005, 109.870003, 0.000000, 0.000000, 89.730003, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14867, 1835.099976, -1307.369995, 109.860001, 0.000000, 0.000000, 269.750000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1806.569946, -1288.739990, 12.640000, 0.000000, 0.000000, 33.990002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1828.189941, -1298.439941, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3437, 1808.989990, -1286.560059, 13.630000, -193.000000, -91.000000, -55.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1828.329956, -1317.829956, 108.330002, 0.000000, 0.000000, 179.460007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2424, 1808.400024, -1287.599976, 12.630000, 0.000000, 0.000000, 33.990002, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1828.189941, -1299.550049, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1826.680054, -1302.250000, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1549, 1801.959961, -1297.400024, 12.420000, 0.000000, 0.000000, 257.989990, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1826.680054, -1303.290039, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1830.000000, -1298.780029, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1812.589966, -1286.410034, 15.080000, 0.000000, 0.000000, 307.070007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(626, 1834.650024, -1312.530029, 110.389999, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2108, 1802.829956, -1298.869995, 12.490000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1727, 1809.520020, -1289.160034, 12.630000, 0.000000, 0.000000, 296.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1830.000000, -1299.859985, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1828.550049, -1302.280029, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1804.310059, -1297.140015, 12.510000, 0.000000, 0.000000, 178.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2290, 1831.630005, -1317.420044, 108.330002, 0.000000, 0.000000, 191.369995, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1231, 1815.160034, -1282.510010, 13.630000, 0.000000, 0.000000, 115.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1828.540039, -1303.349976, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1727, 1813.000000, -1285.109985, 12.600000, 0.000000, 0.000000, 46.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1231, 1808.000000, -1294.069946, 13.630000, 0.000000, 0.000000, 45.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2894, 1815.859985, -1280.520020, 12.470000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1826.680054, -1306.609985, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1812.589966, -1286.410034, 12.380000, 0.000000, 0.000000, 307.070007, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1727, 1814.530029, -1283.900024, 12.600000, 0.000000, 0.000000, 10.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1726, 1810.250000, -1290.790039, 12.630000, 0.000000, 0.000000, 255.990005, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1832.079956, -1299.079956, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1826.689941, -1307.609985, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1816.969971, -1283.160034, 15.120000, 0.000000, 0.000000, 275.980011, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1510, 1814.560059, -1285.670044, 13.560000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1830.359985, -1302.430054, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1832.050049, -1300.089966, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2894, 1814.619995, -1286.099976, 13.360000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1814.500000, -1288.400024, 15.120000, 0.000000, 0.000000, 129.970001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1814.500000, -1288.400024, 15.120000, 0.000000, 0.000000, 129.970001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1830.359985, -1303.469971, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2205, 1814.660034, -1286.050049, 12.590000, 0.000000, 0.000000, 34.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1828.560059, -1306.560059, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1815.979980, -1285.109985, 13.530000, 0.000000, 0.000000, 342.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1816.969971, -1283.160034, 12.380000, 0.000000, 0.000000, 275.980011, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1816.199951, -1287.339966, 15.120000, 0.000000, 0.000000, 55.840000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1828.550049, -1307.579956, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2256, 1815.969971, -1287.589966, 14.860000, 0.000000, 0.000000, 220.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1816.989990, -1286.670044, 15.120000, 0.000000, 0.000000, 221.979996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1832.439941, -1302.489990, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1814.500000, -1288.400024, 12.380000, 0.000000, 0.000000, 129.970001, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1671, 1815.959961, -1286.819946, 13.050000, 0.000000, 0.000000, 214.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2067, 1814.670044, -1288.479980, 12.600000, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1832.400024, -1303.469971, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1830.369995, -1306.619995, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1830.359985, -1307.619995, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2395, 1816.989990, -1286.670044, 12.380000, 0.000000, 0.000000, 221.979996, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1832.439941, -1306.560059, 64.809998, 0.000000, 0.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1832.420044, -1307.579956, 64.809998, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2001, 1829.290039, -1314.170044, 64.839996, 0.000000, 0.000000, 357.899994, -1, -1, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0


	// Gasolineras que no explotan
	CreateDynamicObject(3465, 624.11469, 1677.65686, 7.41840,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(3465, 620.68042, 1682.42505, 7.41840,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(3465, 617.26184, 1687.40784, 7.41840,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(3465, 613.98590, 1692.60010, 7.41840,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(3465, 610.47894, 1697.42969, 7.41840,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(3465, 607.00958, 1702.02234, 7.41840,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(3465, 603.81177, 1707.27954, 7.41840,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(3465, -2410.80469, 970.85162, 45.73840,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, -2410.80469, 976.18750, 45.73840,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, -2410.80469, 981.52338, 45.73840,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, -1327.67065, 2685.78345, 50.70320,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(3465, -1328.30115, 2680.36523, 50.70320,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(3465, -1329.24146, 2675.02515, 50.70320,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(3465, -1329.72229, 2669.42847, 50.70320,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(3465, -1611.49487, -2720.44849, 49.17770,   0.00000, 0.00000, 53.00000);
	CreateDynamicObject(3465, -1608.10388, -2716.23560, 49.17770,   0.00000, 0.00000, 53.00000);
	CreateDynamicObject(3465, -1604.72058, -2711.54248, 49.17770,   0.00000, 0.00000, 53.00000);
	CreateDynamicObject(3465, -1601.37097, -2707.27783, 49.17770,   0.00000, 0.00000, 53.00000);
	CreateDynamicObject(3465, -2241.81885, -2562.13354, 32.31090,   0.00000, 0.00000, -25.00000);
	CreateDynamicObject(3465, -2246.73853, -2559.76904, 32.31090,   0.00000, 0.00000, -25.00000);
	CreateDynamicObject(3465, -1679.34534, 403.05856, 7.63320,   0.00000, 0.00000, -46.00000);
	CreateDynamicObject(3465, -1675.07605, 407.30511, 7.63320,   0.00000, 0.00000, -46.00000);
	CreateDynamicObject(3465, -1670.02673, 412.44339, 7.63320,   0.00000, 0.00000, -46.00000);
	CreateDynamicObject(3465, -1665.70520, 416.71310, 7.63320,   0.00000, 0.00000, -46.00000);
	CreateDynamicObject(3465, -1685.80835, 409.79269, 7.63320,   0.00000, 0.00000, -46.00000);
	CreateDynamicObject(3465, -1682.22742, 413.10684, 7.63320,   0.00000, 0.00000, -46.00000);
	CreateDynamicObject(3465, -1676.83447, 418.54181, 7.63320,   0.00000, 0.00000, -46.00000);
	CreateDynamicObject(3465, -1672.30542, 423.09863, 7.63320,   0.00000, 0.00000, -46.00000);
	CreateDynamicObject(3465, 1941.88416, -1774.94519, 13.98870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1941.86865, -1778.07007, 13.98870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1941.87537, -1768.07190, 13.98870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1941.87537, -1770.93335, 13.98870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, -92.25156, -1162.15027, 2.69760,   0.00000, 0.00000, -22.00000);
	CreateDynamicObject(3465, -97.00436, -1173.49390, 2.69760,   0.00000, 0.00000, -22.00000);
	CreateDynamicObject(3465, -85.34810, -1165.04297, 2.60810,   0.00000, 0.00000, -22.00000);
	CreateDynamicObject(3465, -89.94480, -1176.53931, 2.54810,   0.00000, 0.00000, -22.00000);
	CreateDynamicObject(3465, 998.43939, -937.60925, 42.60917,   0.00000, 0.00000, 278.39999);
	CreateDynamicObject(3465, 1002.52905, -936.99786, 42.60917,   0.00000, 0.00000, 278.39999);
	CreateDynamicObject(3465, 1005.40381, -936.60443, 42.60917,   0.00000, 0.00000, 278.39999);
	CreateDynamicObject(3465, 1009.30872, -936.05151, 42.60917,   0.00000, 0.00000, 278.39999);
	CreateDynamicObject(3465, 655.66412, -571.21088, 16.70030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 655.66412, -569.60162, 16.70030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 655.66412, -560.54688, 16.70030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 655.66412, -558.92969, 16.70030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1380.63281, 460.27341, 20.62740,   0.00000, 0.00000, 65.40000);
	CreateDynamicObject(3465, 1378.96094, 461.03909, 20.62740,   0.00000, 0.00000, 65.40000);
	CreateDynamicObject(3465, 1383.39844, 459.07031, 20.62740,   0.00000, 0.00000, 65.40000);
	CreateDynamicObject(3465, 1385.07813, 458.29691, 20.62740,   0.00000, 0.00000, 65.40000);

	// Basurero
	CreateDynamicObject(973, -34.32000, -1590.60999, 3.07000,   0.00000, 1.00000, 56.00000);
	CreateDynamicObject(973, -16.78000, -1569.04004, 2.32000,   0.00000, 0.38000, 49.82000);
	CreateDynamicObject(973, -22.82000, -1576.17004, 2.52000,   0.00000, 2.00000, 49.82000);
	CreateDynamicObject(973, -28.83000, -1583.32996, 2.84000,   0.00000, 2.00000, 50.00000);
	CreateDynamicObject(973, -39.77000, -1598.10999, 3.01000,   0.00000, -1.70000, 52.00000);
	CreateDynamicObject(973, -45.98000, -1604.98999, 2.82000,   0.00000, -0.70000, 44.00000);
	CreateDynamicObject(973, -52.64000, -1611.43994, 2.90000,   0.00000, 1.68000, 44.00000);
	CreateDynamicObject(973, -59.42000, -1617.55005, 3.15000,   0.00000, 1.38000, 40.00000);
	CreateDynamicObject(973, -66.82000, -1623.22998, 3.33000,   0.00000, 1.00000, 35.00000);
	CreateDynamicObject(973, -74.78000, -1628.09998, 3.42000,   0.00000, 0.00000, 28.00000);
	CreateDynamicObject(973, -83.02000, -1632.21997, 3.41000,   0.00000, 0.00000, 25.00000);
	CreateDynamicObject(973, -91.70000, -1635.64001, 3.40000,   0.00000, 0.00000, 18.00000);
	CreateDynamicObject(973, -100.50000, -1637.81006, 3.40000,   0.00000, 0.00000, 10.00000);
	CreateDynamicObject(973, -109.79000, -1638.30005, 3.32000,   0.00000, -1.00000, -4.00000);
	CreateDynamicObject(973, -118.77000, -1639.72998, 3.14000,   0.00000, -1.14000, 22.00000);
	CreateDynamicObject(973, -127.28000, -1642.66003, 3.04000,   0.00000, 0.00000, 16.00000);
	CreateDynamicObject(973, -136.28999, -1644.42004, 2.96000,   0.00000, -0.88000, 6.00000);
	CreateDynamicObject(973, -145.50999, -1644.71997, 2.81000,   0.00000, -1.00000, -2.00000);
	CreateDynamicObject(973, -154.53999, -1644.25000, 2.49000,   0.00000, -3.00000, -4.00000);
	CreateDynamicObject(973, -163.69000, -1643.14001, 2.23000,   0.00000, 0.00000, -10.00000);
	CreateDynamicObject(973, -172.87000, -1641.83997, 2.46000,   0.00000, 2.74000, -6.00000);
	CreateDynamicObject(973, -182.05000, -1641.38000, 2.93000,   0.00000, 3.06000, 0.00000);
	CreateDynamicObject(973, -191.03000, -1642.96997, 3.18000,   0.00000, 0.00000, 20.00000);
	CreateDynamicObject(973, -199.32001, -1647.02002, 3.02000,   0.00000, -2.00000, 32.00000);
	CreateDynamicObject(973, -206.89000, -1652.21997, 2.53000,   0.00000, -4.00000, 37.00000);
	CreateDynamicObject(973, -214.27000, -1657.89001, 2.25000,   0.00000, 0.64000, 38.00000);
	CreateDynamicObject(973, -221.00000, -1664.17004, 2.31000,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(973, -227.08000, -1671.23999, 2.61000,   0.00000, 3.66000, 50.66000);
	CreateDynamicObject(973, -232.25999, -1678.90002, 2.71000,   0.00000, -2.48000, 61.34000);
	CreateDynamicObject(3173, -84.82000, -1546.98999, 1.55000,   0.00000, 0.00000, 315.37000);
	CreateDynamicObject(3256, -99.00000, -1549.29004, 1.59000,   0.00000, 0.00000, 45.01000);
	CreateDynamicObject(3722, -153.73000, -1618.77002, 6.73000,   1.00000, 0.00000, 89.74000);
	CreateDynamicObject(3722, -129.53999, -1491.40002, 6.62000,   0.00000, 0.00000, 317.47000);
	CreateDynamicObject(3722, -107.69000, -1500.95996, 6.62000,   0.00000, 0.00000, 48.75000);
	CreateDynamicObject(18245, -100.24000, -1531.45996, 12.77000,   0.00000, 0.00000, 44.74000);
	CreateDynamicObject(18246, -180.92000, -1564.80005, 7.43000,   0.00000, 0.00000, 228.41000);
	CreateDynamicObject(18247, -147.78999, -1550.91003, 7.65000,   0.00000, 0.00000, 23.00000);
	CreateDynamicObject(18255, -119.80000, -1619.31006, 2.46000,   0.00000, 0.00000, 278.22000);
	CreateDynamicObject(18255, -195.77000, -1596.28003, 3.56000,   0.00000, 0.00000, 208.28999);
	CreateDynamicObject(18255, -187.59000, -1549.28003, 5.00000,   0.00000, 0.00000, 317.79001);
	CreateDynamicObject(18255, -145.59000, -1503.89001, 5.00000,   0.00000, 0.00000, 317.79001);
	CreateDynamicObject(18255, -101.24000, -1501.30005, 2.22000,   0.00000, 0.00000, 229.48000);
	CreateDynamicObject(18364, -198.19000, -1527.04004, 5.21000,   0.00000, 0.00000, 3.08000);

	// Basura Ruta LS 1
	CreateDynamicObject(1440, 990.84741, -1811.63342, 13.73970,   0.00000, 0.00000, -18.00000);
	CreateDynamicObject(1440, 1548.82678, -1879.81689, 13.04970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 2089.15845, -1908.32239, 13.01890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 2222.99683, -1793.54541, 13.02250,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 2114.73682, -1607.74756, 13.04050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1994.07983, -1681.35571, 13.01890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1764.05286, -1724.79907, 13.01290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1735.89990, -1589.89050, 13.01150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1390.03052, -1581.16235, 13.04290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1365.07581, -1155.36572, 23.32600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1097.29639, -1133.71887, 23.28210,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1046.51038, -1304.19653, 13.00090,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 679.16858, -1311.95618, 13.13000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 483.67810, -1277.29492, 15.08710,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 345.50421, -1368.23193, 13.85350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 197.35500, -1743.29724, 3.97610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 390.40100, -1779.22290, 5.08000,   0.00000, 0.00000, 0.00000);

	// Basura Ruta LS 2
	CreateDynamicObject(1440, 188.68381, -1395.97620, 46.73960,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(1440, 353.90302, -1277.78601, 53.34900,   0.00000, 0.00000, 10.00000);
	CreateDynamicObject(1440, 686.07977, -1062.75330, 49.11730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 871.39447, -868.63373, 76.94580,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1081.20752, -778.00488, 107.41340,   0.00000, 0.00000, 8.00000);
	CreateDynamicObject(1440, 912.70129, -677.62421, 116.34180,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 808.19220, -788.32782, 68.25930,   14.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 266.58420, -1101.41675, 81.24170,   0.00000, 0.00000, 244.00000);
	CreateDynamicObject(1440, 343.53821, -1193.13696, 75.97880,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 554.65302, -1161.17566, 53.87030,   0.00000, 0.00000, -149.00000);
	CreateDynamicObject(1440, 322.69870, -1189.30542, 75.82280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 175.10300, -1387.12061, 48.01200,   0.00000, 0.00000, 38.00000);
	CreateDynamicObject(1440, -78.50970, -1592.90540, 2.11320,   0.00000, 0.00000, 84.00000);

	// Basura Ruta LS 3
	CreateDynamicObject(1440, 263.63071, -1438.70276, 13.17330,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(1440, 721.18237, -1121.81775, 17.56860,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(1440, 1106.32288, -964.01251, 42.07460,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(1440, 1254.58521, -1106.22314, 24.82400,   0.00000, 0.00000, 88.00000);
	CreateDynamicObject(1440, 1188.38062, -1499.12134, 13.00090,   0.00000, 0.00000, 102.00000);
	CreateDynamicObject(1440, 1289.61438, -1837.60571, 13.01290,   0.00600, 0.00000, 109.00000);
	CreateDynamicObject(1440, 1045.23132, -1669.80908, 13.00090,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(1440, 932.43561, -1480.95093, 12.99010,   0.00000, 0.00000, -3.00000);
	CreateDynamicObject(1440, 478.30051, -1497.97485, 19.86620,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(1440, 655.27759, -1680.05017, 13.97360,   0.00000, 0.00000, 4.00000);
	CreateDynamicObject(1440, 802.75330, -1756.11914, 13.03090,   0.00000, 2.00000, 88.00000);
	CreateDynamicObject(1440, 108.20380, -1525.65234, 6.46600,   0.00000, -7.00000, 8.00000);

	// Basu Ruta SF
	CreateDynamicObject(1440, -346.30, -756.40, 29.59,   0.00, 0.00, 277.68);
	CreateDynamicObject(1440, -427.09, -433.97, 16.63,   0.00, 0.00, 333.35);
	CreateDynamicObject(1440, -916.01, -446.17, 28.50,   0.00, 0.00, 350.21);
	CreateDynamicObject(1440, -1904.68, -567.53, 24.26,   0.00, 0.00, 0.00);
	CreateDynamicObject(1440, -2245.15, -123.60, 34.83,   0.00, 0.00, 268.65);
	CreateDynamicObject(1440, -2246.00, 84.55, 34.74,   0.00, 0.00, 267.35);
	CreateDynamicObject(1440, -2167.08, 201.88, 34.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(1440, -2033.41, 313.70, 34.67,   0.00, 0.00, 0.00);
	CreateDynamicObject(1440, -2013.50, 137.14, 27.09,   0.00, 0.00, 273.33);
	CreateDynamicObject(1440, -1812.96, -123.07, 5.08,   0.00, 0.00, 0.00);
	CreateDynamicObject(1440, -1824.87, -560.26, 15.88,   0.00, 0.00, 86.22);
	CreateDynamicObject(1440, -120.47, -1160.25, 2.04,   0.00, 0.00, 55.58);

	// Puerta Interior 35
	CreateDynamicObject(1498, -2171.10498, 639.93542, 1051.37500,   0.00000, 0.00000, 0.00000);

	// Ropero Interior
	CreateDynamicObject(2025, 257.64261, -38.93000, 1000.98792,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 255.49550, -39.50740, 1001.92401,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2359, 256.10251, -39.48190, 1001.56708,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(351, 254.56380, -39.63610, 1001.43201,   -76.00000, 14.00000, -2.00000);
	CreateDynamicObject(353, 254.75520, -39.63850, 1001.89270,   -76.00000, 2.00000, -4.00000);
	CreateDynamicObject(349, 255.74760, -39.57610, 1002.35999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(343, 256.10129, -39.66560, 1002.78052,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(343, 256.04645, -39.60429, 1002.78833,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(355, 254.54449, -39.57610, 1002.32922,   -76.00000, 0.00000, 0.00000);
	CreateDynamicObject(2057, 255.50191, -39.53710, 1002.88989,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2061, 254.76669, -39.44990, 1003.01001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1578, 256.23309, -39.50210, 1001.81268,   0.00000, 0.00000, 0.00000);

	// Puerta Roperos
	CreateDynamicObject(1567, 1098.05005, -810.47998, 106.49000,   0.00000, 0.00000, 2.65000);
	CreateDynamicObject(1567, 150.70000, 1387.53003, 1087.34412,   0.00000, 0.00000, 360.00000);
	CreateDynamicObject(1567, -777.59003, 495.39999, 1367.50000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 1470.80005, 564.15002, 999.95001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 224.30000, 1248.09998, 1081.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 232.30000, 1211.09998, 1083.40002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 235.30000, 1031.90002, 1087.30005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 359.29999, 1418.59998, 1080.30005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 2575.69995, -1280.00000, 1064.40002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 1271.09998, -823.13000, 1088.90002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 2315.50000, -1144.80005, 1053.30005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 234.09999, 1292.00000, 1081.19995,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1567, 413.04410, 2536.01221, 8.99820,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 260.06711, 1292.31714, 1079.21216,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, -275.57169, 1446.54016, 1087.85925,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 26.70460, 1414.08679, 1083.34595,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 2270.70801, -1134.29236, 1049.84009,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, -2171.07568, 647.27271, 1056.53662,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 309.76761, 1119.28174, 1082.87476,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 2461.26465, -1699.55920, 1012.43323,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 256.37079, 1243.34570, 1083.16345,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 92.03550, 1332.07739, 1087.29541,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, -70.81540, 1357.09155, 1079.15247,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 237.87579, 1082.24170, 1083.15466,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 486.51981, 1413.51697, 1083.38245,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 327.44629, 1487.80615, 1083.33765,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1567, 299.36938, 1470.88733, 1079.20544,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1567, 454.83481, 1406.17395, 1083.25122,   0.00000, 0.00000, 0.00000);

	// Concesionario Wang Cars LS
	CreateObject(11317, 1481.12000, -1785.51001, 23.69000,   0.00000, 0.00000, -90.00000);
	CreateObject(11317, 1450.14001, -1798.73999, 23.63000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(632, 1497.42004, -1765.10999, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1493.07996, -1768.75000, 13.27000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1492.60999, -1765.22998, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1488.89001, -1778.87000, 18.86000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1488.43994, -1778.93994, 13.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1477.56995, -1792.28003, 18.86000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1473.47998, -1790.42004, 13.27000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1499.68005, -1742.81006, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1490.67004, -1742.78003, 13.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1460.23999, -1790.23999, 13.27000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1455.37000, -1792.18005, 18.85000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1444.38000, -1805.22998, 13.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(632, 1443.93005, -1805.39001, 18.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1537.10999, -1742.16003, 13.27000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(982, 1511.23999, -1742.17004, 13.27000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(982, 1491.87000, -1773.12000, 19.14000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(982, 1477.31006, -1742.23999, 13.27000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(982, 1466.25000, -1773.16003, 19.14000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(982, 1451.54004, -1742.18005, 13.27000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(982, 1460.87000, -1811.15002, 19.09000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(982, 1435.21997, -1811.10999, 19.09000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(983, 1507.25000, -1773.13000, 19.14000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(983, 1498.31995, -1745.44995, 13.27000,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(983, 1490.18005, -1745.51001, 13.27000,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(983, 1476.22998, -1811.18994, 19.09000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(1231, 1510.18005, -1747.67004, 15.24000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 1498.82996, -1747.71997, 15.24000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 1489.77002, -1747.93994, 15.24000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 1479.64001, -1747.93005, 15.24000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 1470.60999, -1747.95996, 15.24000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 1460.68005, -1747.91003, 15.24000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1231, 1451.59998, -1747.94995, 15.24000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1267, 1510.64001, -1765.03003, 28.41000,   0.00000, 0.00000, 307.84000);
	CreateDynamicObject(1267, 1420.59998, -1819.12000, 28.61000,   0.00000, 0.00000, 143.92999);
	CreateDynamicObject(1704, 1477.05005, -1788.93994, 12.88000,   0.00000, 0.00000, 264.45001);
	CreateDynamicObject(1723, 1475.62000, -1790.54004, 12.88000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1723, 1471.60999, -1790.55005, 12.88000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1817, 1473.85999, -1788.25000, 12.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1470.18005, -1788.31006, 12.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2002, 1468.21997, -1790.67004, 12.86000,   0.00000, 0.00000, 179.07001);
	CreateDynamicObject(2069, 1476.54004, -1790.75000, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2165, 1453.93005, -1786.57996, 12.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2167, 1453.47998, -1790.25000, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2202, 1453.90002, -1785.19995, 12.85000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2356, 1464.55005, -1782.89001, 12.92000,   0.00000, 0.00000, 272.07999);
	CreateDynamicObject(2356, 1466.45996, -1787.84998, 12.92000,   0.00000, 0.00000, 96.23000);
	CreateDynamicObject(2356, 1464.69995, -1784.81006, 12.92000,   0.00000, 0.00000, 277.12000);
	CreateDynamicObject(2356, 1466.94995, -1789.78003, 12.92000,   0.00000, 0.00000, 86.95000);
	CreateDynamicObject(2356, 1463.92004, -1787.93994, 12.92000,   0.00000, 0.00000, 272.07999);
	CreateDynamicObject(2356, 1463.67004, -1789.81006, 12.92000,   0.00000, 0.00000, 287.56000);
	CreateDynamicObject(2356, 1456.53003, -1781.72998, 12.92000,   0.00000, 0.00000, 353.81000);
	CreateDynamicObject(2356, 1454.33997, -1782.52002, 12.92000,   0.00000, 0.00000, 335.66000);
	CreateDynamicObject(2356, 1454.67004, -1788.02002, 12.92000,   0.00000, 0.00000, 353.04999);
	CreateDynamicObject(2465, 1465.35999, -1791.06995, 14.92000,   0.00000, 0.00000, 175.71001);
	CreateDynamicObject(2480, 1466.94995, -1791.16003, 14.57000,   0.00000, 0.00000, 177.23000);
	CreateDynamicObject(2596, 1477.51001, -1784.43005, 15.76000,   0.00000, 0.00000, 282.45999);
	CreateDynamicObject(2604, 1465.75000, -1783.39001, 13.70000,   0.00000, 0.00000, 270.57999);
	CreateDynamicObject(2604, 1455.26001, -1781.13000, 13.70000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2605, 1465.14001, -1788.00000, 13.29000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2607, 1465.35999, -1790.06995, 13.29000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2693, 1461.92004, -1780.93994, 13.54000,   0.00000, 0.00000, 159.00999);
	CreateDynamicObject(3851, 1503.19995, -1767.32996, 14.88000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1503.18994, -1767.40002, 20.50000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1485.37000, -1767.12000, 14.85000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1485.30005, -1767.01001, 20.50000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1472.30005, -1766.69995, 14.86000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1472.20996, -1766.91003, 20.50000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1459.13000, -1766.83997, 14.86000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1459.13000, -1766.77002, 20.50000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1472.17004, -1817.53003, 14.83000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1472.17004, -1817.53003, 20.40000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1459.04004, -1817.68005, 14.83000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1459.04004, -1817.54004, 20.40000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1446.01001, -1817.59998, 14.83000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1446.01001, -1817.59998, 20.40000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1428.07996, -1817.56995, 14.83000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3851, 1428.07996, -1817.56995, 20.40000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(4023, 1498.43005, -1800.25000, 24.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(4023, 1431.20996, -1780.67004, 24.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19164, 1455.92004, -1791.13000, 15.06000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(1267, 1420.599976, -1819.119995, 28.610001, 0.000000, 0.000000, 143.929993);
	CreateDynamicObject(1267, 1510.640015, -1765.030029, 28.410000, 0.000000, 0.000000, 307.839996);

	// Mapeo LSPD
	CreateDynamicObject(348, 248.89000, 73.58000, 1002.78998,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(353, 249.39000, 73.19000, 1003.16998,   91.00000, 11.00000, -11.00000);
	CreateDynamicObject(1556, 251.77000, 76.80000, 1002.64001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1556, 275.76001, 121.34000, 1003.60999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2358, 248.82001, 73.15000, 1002.79999,   0.00000, 0.00000, 177.00000);
	CreateDynamicObject(2358, 249.58000, 73.14000, 1003.03003,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2358, 249.58000, 73.14000, 1002.79999,   0.00000, 0.00000, 188.00000);
	CreateDynamicObject(2358, 250.69000, 73.31000, 1002.79999,   0.00000, 0.00000, 229.00000);
	CreateDynamicObject(2359, 249.33000, 73.66000, 1002.84998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2634, 248.17999, 75.90000, 1003.81000,   0.00000, 180.00000, 270.00000);
	CreateDynamicObject(19142, 248.62000, 74.58000, 1002.81000,   0.00000, -91.00000, 0.00000);
	CreateDynamicObject(19142, 248.61000, 74.08000, 1002.82001,   76.00000, 0.00000, 353.00000);

	// Comisaria LSPD
	CreateDynamicObject(14782, 225.51601, 126.16480, 1010.21558,   0.00000, 0.00000, 89.00000);
	CreateDynamicObject(2035, 227.89140, 128.01180, 1010.48138,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2044, 226.93710, 128.00420, 1010.50140,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2359, 227.38721, 128.01970, 1011.08411,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 227.58727, 127.98767, 1010.11499,   0.00000, 0.00000, 0.00000);

	// Casas Ganton
	CreateDynamicObject(3684, 2244.79004, -1774.39001, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3684, 2244.79004, -1805.84998, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3684, 2280.66992, -1805.84998, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3684, 2280.68994, -1774.47998, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3684, 2354.11011, -1774.48999, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3684, 2354.11011, -1805.84998, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3684, 2318.43994, -1815.95996, 15.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3684, 2388.94995, -1806.44995, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3684, 2388.94995, -1774.75000, 15.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(933, 2291.48999, -1825.69995, 12.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(935, 2284.66992, -1822.02002, 13.09000,   180.00000, 0.00000, 270.53000);
	CreateDynamicObject(946, 2317.07007, -1802.04004, 14.86000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(946, 2317.12988, -1774.73999, 14.86000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(967, 2318.06006, -1755.57996, 12.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1264, 2280.00000, -1824.39001, 12.98000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1308, 2278.91992, -1825.35999, 14.83000,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(1308, 2283.12012, -1825.28003, 14.81000,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(1349, 2288.04004, -1826.78003, 13.11000,   0.00000, 0.00000, 306.98001);
	CreateDynamicObject(1447, 2278.39990, -1822.85999, 13.80000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1447, 2279.62988, -1822.87000, 15.14000,   -90.00000, 0.00000, 90.00000);
	CreateDynamicObject(1447, 2281.05005, -1825.22998, 13.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1447, 2282.11011, -1822.84998, 15.14000,   -90.00000, 0.00000, 90.00000);
	CreateDynamicObject(1447, 2283.28003, -1821.10999, 13.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1458, 2370.66992, -1819.79004, 12.78000,   0.00000, 0.00000, 1.27000);
	CreateDynamicObject(1458, 2344.66992, -1818.81006, 12.78000,   0.00000, 0.00000, 203.14999);
	CreateDynamicObject(1462, 2280.82007, -1820.87000, 12.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1685, 2280.52002, -1770.63000, 13.28000,   0.00000, 0.00000, 357.32999);
	CreateDynamicObject(1685, 2283.02002, -1769.06006, 13.28000,   0.00000, 0.00000, 348.70001);
	CreateDynamicObject(1685, 2280.63989, -1768.52002, 13.28000,   0.00000, 0.00000, 339.60999);
	CreateDynamicObject(1765, 2286.89990, -1824.97998, 12.56000,   0.00000, 0.00000, 195.28000);
	CreateDynamicObject(1766, 2286.88989, -1820.73999, 12.53000,   0.00000, 0.00000, 285.73999);
	CreateDynamicObject(1800, 2283.67993, -1822.34998, 12.49000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3593, 2272.13989, -1827.13000, 12.98000,   0.00000, 0.00000, 41.30000);
	CreateDynamicObject(17513, 2318.82007, -1790.81995, 4.64000,   -0.30000, 0.00000, 180.00000);
	CreateDynamicObject(18688, 2284.50000, -1822.06006, 12.39000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18698, 2281.56006, -1826.04004, 12.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19374, 2280.00000, -1821.08997, 15.27000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19374, 2279.97998, -1824.15002, 15.27000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19374, 2280.04004, -1824.04004, 14.93000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19374, 2280.12012, -1820.94995, 14.93000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19374, 2281.76001, -1821.08997, 14.93000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19374, 2281.84009, -1821.08997, 15.27000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19374, 2281.76001, -1823.75000, 14.93000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19374, 2281.84009, -1824.15002, 15.27000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19382, 2283.90991, -1819.21997, 9.93000,   0.00000, 0.00000, 356.44000);

	CreateDynamicObject(630, 1340.05005, 2604.23999, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1340.19995, 2614.72998, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(942, 1356.87000, 2607.64990, 12.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1331.83997, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1336.00000, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1340.14001, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1344.26001, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1329.77002, 2601.85010, 10.38000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1350.28003, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1354.43994, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1334.38000, 2603.40991, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1358.57996, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1338.66003, 2603.40991, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1332.17004, 2606.48999, 11.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1332.17004, 2613.33008, 11.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1336.52002, 2620.62988, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1345.14001, 2620.62988, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1208, 1357.76001, 2612.37012, 10.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1352.01001, 2611.66992, 10.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1337.91003, 2615.22998, 10.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1341.12000, 2615.22998, 10.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1352.01001, 2614.85010, 10.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1535, 1354.98999, 2620.54004, 10.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1334.79004, 2603.50000, 11.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1334.79004, 2603.50000, 11.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1338.22998, 2603.50000, 11.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1338.22998, 2603.50000, 11.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1332.27002, 2606.47998, 11.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1332.27002, 2606.47998, 11.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1332.27002, 2612.91992, 11.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1332.27002, 2612.91992, 11.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1336.50000, 2620.53003, 11.68000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1336.50000, 2620.53003, 11.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1344.85999, 2620.53003, 11.68000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1344.85999, 2620.53003, 11.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, 1337.59998, 2604.98999, 10.56000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1723, 1333.98999, 2606.30005, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, 1339.04004, 2608.48999, 10.56000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1794, 1333.54004, 2616.89990, 10.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1336.07996, 2606.60010, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1341.43005, 2610.78003, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1950, 1347.66003, 2617.39990, 11.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 1356.71997, 2613.66992, 11.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1336.50000, 2607.21997, 13.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1337.10999, 2618.29004, 13.81000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1347.91003, 2617.46997, 13.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 1347.40002, 2617.47998, 10.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 1355.18005, 2616.91992, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2120, 1347.45996, 2615.98999, 11.16000,   0.00000, 0.00000, -84.00000);
	CreateDynamicObject(2120, 1348.32996, 2615.98999, 11.16000,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(2120, 1345.82996, 2617.47998, 11.16000,   0.00000, 0.00000, 171.00000);
	CreateDynamicObject(2120, 1349.94995, 2617.42993, 11.16000,   0.00000, 0.00000, 4.00000);
	CreateDynamicObject(2120, 1352.85999, 2617.27002, 11.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2120, 1347.38000, 2618.96997, 11.16000,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2120, 1348.37000, 2618.95996, 11.16000,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(2120, 1352.88000, 2618.59009, 11.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2120, 1354.00000, 2619.94995, 11.16000,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2135, 1356.56995, 2614.63989, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2136, 1357.56006, 2616.63989, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2138, 1355.56995, 2614.64990, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2139, 1357.55005, 2618.61011, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2139, 1357.55005, 2619.59009, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2219, 1336.59998, 2606.83008, 11.10000,   -25.00000, 22.00000, -10.00000);
	CreateDynamicObject(2225, 1339.97998, 2615.35010, 10.58000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2272, 1332.85999, 2617.94995, 12.12000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2277, 1340.08997, 2607.44995, 12.35000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2289, 1351.84998, 2618.30005, 12.55000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2296, 1334.39001, 2614.85010, 10.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2296, 1340.31995, 2619.10010, 10.59000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2303, 1357.56006, 2617.62988, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2305, 1357.53003, 2614.64990, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2306, 1333.19995, 2616.83008, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2307, 1335.71997, 2616.84009, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2346, 1354.22998, 2613.38989, 10.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2524, 1341.37000, 2616.81006, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2525, 1341.34998, 2618.22998, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2526, 1341.47998, 2619.89990, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2573, 1355.62000, 2611.37012, 10.56000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2830, 1357.64001, 2616.60010, 11.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2832, 1355.22998, 2617.28003, 11.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2846, 1334.78003, 2616.26001, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(13187, 1353.78003, 2603.39990, 11.02000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19359, 1335.50000, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19359, 1352.00000, 2618.80005, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1337.48999, 2615.58008, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1347.98999, 2615.58008, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19384, 1344.69995, 2610.75000, 11.18000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19389, 1348.66003, 2612.40991, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19389, 1352.00000, 2612.40991, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19389, 1338.68994, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, 1341.89001, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, 1352.00000, 2615.59009, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19432, 1333.10999, 2615.25000, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19451, 1353.37000, 2614.04004, 11.67000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19462, 1336.81006, 2605.37012, 10.47000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1336.81006, 2608.87012, 10.47000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1336.81006, 2609.72998, 10.46000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1354.96997, 2615.57007, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 1356.34998, 2615.57007, 10.46000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19464, 1343.41003, 2617.69995, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19464, 1340.75000, 2618.13989, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19503, 1345.12000, 2612.57007, 12.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19504, 1345.12000, 2612.57007, 12.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1332.97998, 2604.10010, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1329.77002, 2601.85010, 10.38000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1350.28003, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1354.43994, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1358.57996, 2599.77002, 10.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1332.17004, 2606.48999, 11.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1332.17004, 2613.33008, 11.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1336.52002, 2620.62988, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1345.14001, 2620.62988, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1208, 1357.76001, 2612.37012, 10.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1352.01001, 2611.66992, 10.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1337.91003, 2615.22998, 10.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1341.12000, 2615.22998, 10.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1352.01001, 2614.85010, 10.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1535, 1354.98999, 2620.54004, 10.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1334.79004, 2603.50000, 11.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1334.79004, 2603.50000, 11.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1338.22998, 2603.50000, 11.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1338.22998, 2603.50000, 11.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1332.27002, 2606.47998, 11.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1332.27002, 2606.47998, 11.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1332.27002, 2612.91992, 11.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1332.27002, 2612.91992, 11.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1336.50000, 2620.53003, 11.68000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1336.50000, 2620.53003, 11.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1344.85999, 2620.53003, 11.68000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1344.85999, 2620.53003, 11.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, 1337.59998, 2604.98999, 10.56000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1723, 1333.98999, 2606.30005, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, 1339.04004, 2608.48999, 10.56000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1794, 1333.54004, 2616.89990, 10.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1336.07996, 2606.60010, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1341.43005, 2610.78003, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1950, 1347.66003, 2617.39990, 11.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 1356.71997, 2613.66992, 11.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1336.50000, 2607.21997, 13.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1337.10999, 2618.29004, 13.81000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1347.91003, 2617.46997, 13.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 1347.40002, 2617.47998, 10.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 1355.18005, 2616.91992, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2120, 1347.45996, 2615.98999, 11.16000,   0.00000, 0.00000, -84.00000);
	CreateDynamicObject(2120, 1348.32996, 2615.98999, 11.16000,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(2120, 1345.82996, 2617.47998, 11.16000,   0.00000, 0.00000, 171.00000);
	CreateDynamicObject(2120, 1349.94995, 2617.42993, 11.16000,   0.00000, 0.00000, 4.00000);
	CreateDynamicObject(2120, 1352.85999, 2617.27002, 11.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2120, 1347.38000, 2618.96997, 11.16000,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2120, 1348.37000, 2618.95996, 11.16000,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(2120, 1352.88000, 2618.59009, 11.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2120, 1354.00000, 2619.94995, 11.16000,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2135, 1356.56995, 2614.63989, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2136, 1357.56006, 2616.63989, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2138, 1355.56995, 2614.64990, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2139, 1357.55005, 2618.61011, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2139, 1357.55005, 2619.59009, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2219, 1336.59998, 2606.83008, 11.10000,   -25.00000, 22.00000, -10.00000);
	CreateDynamicObject(2225, 1339.97998, 2615.35010, 10.58000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2272, 1332.85999, 2617.94995, 12.12000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2277, 1340.08997, 2607.44995, 12.35000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2289, 1351.84998, 2618.30005, 12.55000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2296, 1334.39001, 2614.85010, 10.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2296, 1340.31995, 2619.10010, 10.59000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2303, 1357.56006, 2617.62988, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2305, 1357.53003, 2614.64990, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2306, 1333.19995, 2616.83008, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2307, 1335.71997, 2616.84009, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2346, 1354.22998, 2613.38989, 10.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2524, 1341.37000, 2616.81006, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2525, 1341.34998, 2618.22998, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2526, 1341.47998, 2619.89990, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2573, 1355.62000, 2611.37012, 10.56000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2830, 1357.64001, 2616.60010, 11.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2832, 1355.22998, 2617.28003, 11.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2846, 1334.78003, 2616.26001, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19359, 1335.50000, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19359, 1352.00000, 2618.80005, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1337.48999, 2615.58008, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19384, 1344.69995, 2610.75000, 11.18000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19389, 1348.66003, 2612.40991, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19389, 1352.00000, 2612.40991, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19389, 1338.68994, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, 1341.89001, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, 1352.00000, 2615.59009, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19432, 1333.10999, 2615.25000, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19451, 1353.37000, 2614.04004, 11.67000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19462, 1336.81006, 2605.37012, 10.47000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1336.81006, 2608.87012, 10.47000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1336.81006, 2609.72998, 10.46000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1354.96997, 2615.57007, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 1356.34998, 2615.57007, 10.46000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19464, 1343.41003, 2617.69995, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19464, 1340.75000, 2618.13989, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19504, 1345.12000, 2612.57007, 12.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1655.30005, 2604.10010, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1662.37000, 2604.23999, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1662.52002, 2614.72998, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(942, 1679.18994, 2607.64990, 12.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1654.38000, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1654.48999, 2606.48999, 11.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1654.48999, 2613.33008, 11.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1656.69995, 2603.40991, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1658.50000, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1658.83997, 2620.62988, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1660.97998, 2603.40991, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1662.64001, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1666.80005, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1667.45996, 2620.62988, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1672.62000, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1676.76001, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1680.89001, 2599.85010, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1682.98999, 2601.89990, 10.34000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1208, 1680.07996, 2612.37012, 10.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1660.22998, 2615.22998, 10.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1663.43994, 2615.22998, 10.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1674.32996, 2611.66992, 10.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1674.32996, 2614.85010, 10.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1535, 1677.31006, 2620.54004, 10.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1654.58997, 2606.47998, 11.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1654.58997, 2606.47998, 11.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1654.58997, 2612.91992, 11.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1654.58997, 2612.91992, 11.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1657.10999, 2603.50000, 11.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1657.10999, 2603.50000, 11.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1660.55005, 2603.50000, 11.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1660.55005, 2603.50000, 11.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1658.81995, 2620.53003, 11.68000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1658.81995, 2620.53003, 11.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1667.18005, 2620.53003, 11.68000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1667.18005, 2620.53003, 11.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, 1656.31006, 2606.30005, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, 1659.92004, 2604.98999, 10.56000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1723, 1661.35999, 2608.48999, 10.56000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1794, 1655.85999, 2616.89990, 10.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1658.40002, 2606.60010, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1663.75000, 2610.78003, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1950, 1669.97998, 2617.39990, 11.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 1679.04004, 2613.66992, 11.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1658.81995, 2607.21997, 13.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1659.43005, 2618.29004, 13.81000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1670.22998, 2617.46997, 13.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 1669.71997, 2617.47998, 10.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 1677.50000, 2616.91992, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2120, 1668.15002, 2617.47998, 11.16000,   0.00000, 0.00000, 171.00000);
	CreateDynamicObject(2120, 1669.78003, 2615.98999, 11.16000,   0.00000, 0.00000, -84.00000);
	CreateDynamicObject(2120, 1669.69995, 2618.96997, 11.16000,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2120, 1670.65002, 2615.98999, 11.16000,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(2120, 1670.68994, 2618.95996, 11.16000,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(2120, 1672.27002, 2617.42993, 11.16000,   0.00000, 0.00000, 4.00000);
	CreateDynamicObject(2120, 1675.18005, 2617.27002, 11.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2120, 1675.19995, 2618.59009, 11.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2120, 1676.31995, 2619.94995, 11.16000,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2135, 1678.89001, 2614.63989, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2136, 1679.88000, 2616.63989, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2138, 1677.89001, 2614.64990, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2139, 1679.87000, 2618.61011, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2139, 1679.87000, 2619.59009, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2219, 1658.92004, 2606.83008, 11.10000,   -25.00000, 22.00000, -10.00000);
	CreateDynamicObject(2225, 1662.30005, 2615.35010, 10.58000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2272, 1655.18005, 2617.94995, 12.12000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2277, 1662.41003, 2607.44995, 12.35000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2289, 1674.17004, 2618.30005, 12.55000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2296, 1656.70996, 2614.85010, 10.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2296, 1662.64001, 2619.10010, 10.59000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2303, 1679.88000, 2617.62988, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2305, 1679.84998, 2614.64990, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2306, 1655.52002, 2616.83008, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2307, 1658.04004, 2616.84009, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2346, 1676.55005, 2613.38989, 10.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2524, 1663.68994, 2616.81006, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2525, 1663.67004, 2618.22998, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2526, 1663.80005, 2619.89990, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2573, 1677.93994, 2611.37012, 10.56000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2830, 1679.95996, 2616.60010, 11.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2832, 1677.55005, 2617.28003, 11.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2846, 1657.09998, 2616.26001, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(13187, 1676.09998, 2603.39990, 11.02000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19359, 1657.81995, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19359, 1674.31995, 2618.80005, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1659.81006, 2615.58008, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1670.31006, 2615.58008, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19384, 1667.02002, 2610.75000, 11.18000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19389, 1661.01001, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, 1664.20996, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, 1670.97998, 2612.40991, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19389, 1674.31995, 2612.40991, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19389, 1674.31995, 2615.59009, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19432, 1655.43005, 2615.25000, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19451, 1675.68994, 2614.04004, 11.67000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19462, 1659.13000, 2605.37012, 10.47000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1659.13000, 2608.87012, 10.47000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1659.13000, 2609.72998, 10.46000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1677.29004, 2615.57007, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 1678.67004, 2615.57007, 10.46000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19464, 1663.06995, 2618.13989, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19464, 1665.72998, 2617.69995, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19503, 1667.43994, 2612.57007, 12.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19504, 1667.43994, 2612.57007, 12.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1655.30005, 2604.10010, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1662.37000, 2604.23999, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1662.52002, 2614.72998, 11.59000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(942, 1679.18994, 2607.64990, 12.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1654.38000, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1654.48999, 2606.48999, 11.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1654.48999, 2613.33008, 11.23000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1658.50000, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1658.83997, 2620.62988, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1662.64001, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1666.80005, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1667.45996, 2620.62988, 11.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1672.62000, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1676.76001, 2599.86011, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1680.89001, 2599.85010, 10.32000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1682.98999, 2601.89990, 10.34000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1208, 1680.07996, 2612.37012, 10.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1660.22998, 2615.22998, 10.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1663.43994, 2615.22998, 10.36000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1674.32996, 2611.66992, 10.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1674.32996, 2614.85010, 10.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1535, 1677.31006, 2620.54004, 10.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1654.58997, 2606.47998, 11.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1654.58997, 2606.47998, 11.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1654.58997, 2612.91992, 11.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1654.58997, 2612.91992, 11.57000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1657.10999, 2603.50000, 11.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1660.55005, 2603.50000, 11.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1658.81995, 2620.53003, 11.68000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1658.81995, 2620.53003, 11.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1667.18005, 2620.53003, 11.68000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1649, 1667.18005, 2620.53003, 11.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, 1656.31006, 2606.30005, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, 1659.92004, 2604.98999, 10.56000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1723, 1661.35999, 2608.48999, 10.56000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1794, 1655.85999, 2616.89990, 10.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1658.40002, 2606.60010, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1663.75000, 2610.78003, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1950, 1669.97998, 2617.39990, 11.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 1679.04004, 2613.66992, 11.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1658.81995, 2607.21997, 13.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1659.43005, 2618.29004, 13.81000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1670.22998, 2617.46997, 13.71000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 1669.71997, 2617.47998, 10.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2115, 1677.50000, 2616.91992, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2120, 1668.15002, 2617.47998, 11.16000,   0.00000, 0.00000, 171.00000);
	CreateDynamicObject(2120, 1669.78003, 2615.98999, 11.16000,   0.00000, 0.00000, -84.00000);
	CreateDynamicObject(2120, 1669.69995, 2618.96997, 11.16000,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2120, 1670.65002, 2615.98999, 11.16000,   0.00000, 0.00000, -98.00000);
	CreateDynamicObject(2120, 1670.68994, 2618.95996, 11.16000,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(2120, 1672.27002, 2617.42993, 11.16000,   0.00000, 0.00000, 4.00000);
	CreateDynamicObject(2120, 1675.18005, 2617.27002, 11.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2120, 1675.19995, 2618.59009, 11.16000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2120, 1676.31995, 2619.94995, 11.16000,   0.00000, 0.00000, 98.00000);
	CreateDynamicObject(2135, 1678.89001, 2614.63989, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2136, 1679.88000, 2616.63989, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2138, 1677.89001, 2614.64990, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2139, 1679.87000, 2618.61011, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2139, 1679.87000, 2619.59009, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2219, 1658.92004, 2606.83008, 11.10000,   -25.00000, 22.00000, -10.00000);
	CreateDynamicObject(2225, 1662.30005, 2615.35010, 10.58000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2272, 1655.18005, 2617.94995, 12.12000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2277, 1662.41003, 2607.44995, 12.35000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2289, 1674.17004, 2618.30005, 12.55000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2296, 1656.70996, 2614.85010, 10.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2296, 1662.64001, 2619.10010, 10.59000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2303, 1679.88000, 2617.62988, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2305, 1679.84998, 2614.64990, 10.54000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2306, 1655.52002, 2616.83008, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2307, 1658.04004, 2616.84009, 10.54000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2346, 1676.55005, 2613.38989, 10.54000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2524, 1663.68994, 2616.81006, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2525, 1663.67004, 2618.22998, 10.56000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2526, 1663.80005, 2619.89990, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2573, 1677.93994, 2611.37012, 10.56000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2830, 1679.95996, 2616.60010, 11.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2832, 1677.55005, 2617.28003, 11.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2846, 1657.09998, 2616.26001, 10.56000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19359, 1657.81995, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19359, 1674.31995, 2618.80005, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19379, 1659.81006, 2615.58008, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1670.31006, 2615.58008, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19384, 1667.02002, 2610.75000, 11.18000,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19389, 1661.01001, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, 1664.20996, 2615.23999, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19389, 1670.97998, 2612.40991, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19389, 1674.31995, 2612.40991, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19389, 1674.31995, 2615.59009, 12.11000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19432, 1655.43005, 2615.25000, 12.11000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19451, 1675.68994, 2614.04004, 11.67000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19462, 1659.13000, 2605.37012, 10.47000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1659.13000, 2608.87012, 10.47000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1659.13000, 2609.72998, 10.46000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1677.29004, 2615.57007, 10.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 1678.67004, 2615.57007, 10.46000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19464, 1663.06995, 2618.13989, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19464, 1665.72998, 2617.69995, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19504, 1667.43994, 2612.57007, 12.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19497, -1450.96265, 2647.85229, 57.14750,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(11461, -1474.37769, 2656.11426, 54.39063,   356.85840, 0.00000, 3.14159);
	CreateDynamicObject(8651, -1450.68042, 2634.96509, 55.84330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19498, -1450.96216, 2647.84595, 57.14750,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19466, -1446.49231, 2639.37622, 57.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, -1446.49231, 2643.78101, 57.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, -1460.58594, 2639.07446, 57.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, -1460.58594, 2647.31445, 57.28100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1498, -1460.54333, 2654.41650, 55.48700,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(5043, -1449.19788, 2656.18091, 56.60290,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1500, -1458.23560, 2653.22900, 55.52420,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, -1454.38159, 2658.53271, 57.28100,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, -1456.31335, 2658.53271, 57.28100,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, -1449.19275, 2651.59033, 56.78990,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19471, -1446.49219, 2645.68188, 56.37970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -1448.11475, 2646.06421, 57.13140,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, -1449.71045, 2646.06519, 57.13140,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, -1451.22778, 2644.53296, 57.13040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -1448.08582, 2641.48657, 57.13140,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, -1451.22778, 2641.32031, 57.13040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, -1451.22778, 2638.39185, 57.13040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19431, -1450.48096, 2641.48657, 57.13140,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2524, -1448.17542, 2640.87964, 55.55479,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2526, -1447.02832, 2638.55273, 55.55510,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2517, -1449.62744, 2639.89355, 55.55444,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2525, -1449.40137, 2637.31348, 55.55520,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2845, -1449.88806, 2637.99365, 55.55464,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, -1448.95142, 2645.67725, 55.85794,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, -1450.65088, 2645.45313, 55.55227,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(937, -1447.16736, 2643.72852, 55.96050,   0.00000, 0.00000, 89.85050);
	CreateDynamicObject(2000, -1447.45227, 2644.98779, 55.55230,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1421, -1447.25122, 2642.12744, 55.49470,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1421, -1448.33545, 2642.78076, 55.49470,   0.00000, 0.00000, 59.60940);
	CreateDynamicObject(1742, -1451.15942, 2640.64429, 55.55380,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1742, -1451.13916, 2642.78564, 55.55380,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2002, -1451.69189, 2641.52710, 55.55340,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2297, -1449.53674, 2652.47241, 55.55530,   0.00000, 0.00000, 225.26283);
	CreateDynamicObject(948, -1451.09473, 2646.51855, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1451.62085, 2645.78589, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1451.68591, 2643.55933, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1451.78015, 2639.40259, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1451.80676, 2637.28760, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1450.61938, 2646.51807, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1450.14453, 2646.52319, 55.53960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1449.67847, 2646.53662, 55.53960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -1455.52222, 2651.66577, 57.13040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -1455.52222, 2648.46753, 57.13040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, -1456.60071, 2645.75488, 57.13040,   0.00000, 0.00000, 316.47849);
	CreateDynamicObject(19431, -1458.54175, 2644.56519, 56.91040,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19431, -1459.73438, 2644.56519, 56.91040,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, -1457.66553, 2643.09106, 57.13040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -1457.65552, 2639.88208, 57.13040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, -1457.66553, 2638.37524, 57.13040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1798, -1458.79565, 2640.40942, 55.55380,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2296, -1460.06604, 2644.32788, 55.54980,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2025, -1460.10266, 2641.37646, 55.55490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2628, -1456.87500, 2637.81909, 55.55310,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2627, -1455.16577, 2637.93359, 55.55350,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2630, -1453.25659, 2637.52417, 55.55380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(948, -1457.15430, 2642.06543, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1457.05676, 2644.37793, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1455.49805, 2646.19141, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1454.24695, 2652.85889, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1754, -1454.94385, 2651.98853, 55.55390,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1754, -1454.94385, 2651.00537, 55.55390,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1754, -1454.94385, 2650.02490, 55.55390,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1754, -1454.94385, 2649.09644, 55.55390,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(948, -1454.97595, 2648.30493, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1754, -1453.18152, 2652.76050, 55.55390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1754, -1452.22046, 2652.76050, 55.55390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1451.40332, 2652.92480, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1822, -1453.02271, 2650.16846, 55.55400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, -1449.86523, 2649.06494, 55.53962,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, -1451.27051, 2643.79053, 55.55420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, -1451.25867, 2637.65112, 55.55420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, -1457.57935, 2642.32764, 55.55420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, -1457.06897, 2645.18115, 55.55420,   0.00000, 0.00000, 46.25820);
	CreateDynamicObject(2305, -1460.00952, 2652.71216, 55.55370,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2303, -1460.02075, 2651.70386, 55.55500,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2137, -1460.01074, 2650.73462, 55.55540,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2138, -1460.01074, 2649.75879, 55.55550,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2139, -1460.01074, 2648.76001, 55.55520,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2140, -1460.01074, 2647.76660, 55.55510,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2136, -1460.01074, 2645.78296, 55.55390,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(948, -1457.71411, 2645.25391, 55.53960,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(948, -1456.03528, 2646.93237, 55.53960,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(1432, -1457.40771, 2650.48218, 55.55398,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1432, -1457.49902, 2648.28101, 55.55398,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, 1833.47998, 775.65002, 11.58000,   0.00000, 0.00000, 41.02000);
	CreateDynamicObject(630, 1843.48999, 769.83002, 11.54000,   0.00000, 0.00000, 41.02000);
	CreateDynamicObject(669, 1852.63000, 770.96997, 10.21000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1857.41003, 777.53998, 10.34000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1857.41003, 781.65997, 10.34000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1838.50000, 763.02002, 10.27000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1840.82996, 766.84998, 10.27000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1840.82996, 763.65002, 10.27000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1535, 1832.88000, 777.14001, 10.46000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, 1844.16003, 774.53003, 11.75000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1649, 1844.16003, 774.53003, 11.75000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, 1843.62000, 775.46002, 10.59000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1724, 1839.91003, 772.62000, 10.59000,   0.00000, 0.00000, 114.00000);
	CreateDynamicObject(1724, 1839.50000, 774.60999, 10.59000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1794, 1843.68005, 761.69000, 10.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1834.21997, 759.66998, 11.93000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1817, 1835.51001, 766.20001, 10.97000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1835.51001, 759.67999, 10.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 1836.87000, 759.79999, 12.27000,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(1817, 1837.67004, 766.03998, 13.57000,   0.00000, 90.00000, 180.00000);
	CreateDynamicObject(1817, 1837.81995, 765.78003, 10.97000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, 1837.81995, 764.00000, 10.97000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, 1837.81995, 762.21997, 10.81000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, 1837.81995, 761.21997, 10.95000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, 1837.81995, 760.32001, 10.95000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, 1842.08997, 773.97998, 10.57000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2063, 1842.34998, 768.90002, 11.45000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2069, 1839.45996, 774.15002, 10.63000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1835.26001, 771.71997, 13.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 1841.89001, 774.09003, 13.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2225, 1844.76001, 759.73999, 10.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2231, 1843.91003, 759.71997, 10.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2231, 1845.46997, 759.71997, 10.55000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2272, 1838.46997, 765.40997, 11.79000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2289, 1841.46997, 776.04999, 12.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2296, 1837.29004, 767.53998, 10.60000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2307, 1842.46997, 761.31000, 10.51000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2356, 1846.60999, 765.76001, 11.45000,   84.00000, 0.00000, 265.00000);
	CreateDynamicObject(2524, 1840.22998, 762.78998, 10.56000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2525, 1840.27002, 761.35999, 10.55000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2526, 1839.05005, 760.21002, 10.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2596, 1841.98999, 760.21002, 12.23000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2607, 1845.53003, 765.75000, 10.95000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2636, 1833.93994, 771.76001, 11.22000,   0.00000, 0.00000, 177.92000);
	CreateDynamicObject(2636, 1835.50000, 770.21002, 11.22000,   0.00000, 0.00000, 286.60999);
	CreateDynamicObject(2636, 1835.28003, 773.20001, 11.22000,   0.00000, 0.00000, 94.84000);
	CreateDynamicObject(2636, 1836.54004, 771.71997, 11.22000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2636, 1846.40002, 768.65002, 11.14000,   0.00000, -172.00000, 4.00000);
	CreateDynamicObject(2636, 1846.46997, 767.33002, 11.14000,   0.00000, -172.00000, 4.00000);
	CreateDynamicObject(2636, 1846.55005, 767.35999, 11.18000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2636, 1846.52002, 768.62000, 11.18000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2747, 1835.31006, 771.73999, 10.97000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2800, 1835.25000, 771.65997, 11.18000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2825, 1842.09998, 764.70001, 10.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2846, 1843.76001, 761.15002, 10.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(13188, 1844.13000, 778.97998, 11.78000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(14384, 1834.21997, 763.35999, 11.91000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(14680, 1846.02002, 762.70001, 11.76000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1832.80005, 763.91998, 11.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1832.80005, 770.15997, 11.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1839.04004, 781.39001, 11.33000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19325, 1846.83997, 764.29999, 11.31000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 1836.21997, 767.15002, 12.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 1837.76001, 765.63000, 12.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 1837.89001, 765.63000, 12.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 1837.76001, 761.31000, 12.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 1837.89001, 762.42999, 12.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 1837.84998, 761.31000, 12.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 1840.82996, 761.31000, 12.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 1842.34998, 765.27002, 12.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 1842.31006, 769.27002, 12.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 1845.27002, 765.25000, 12.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19379, 1838.06006, 774.15002, 10.49000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1838.90002, 774.15002, 10.51000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19388, 1839.28003, 762.98999, 12.03000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 1840.81995, 764.40002, 12.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 1840.81995, 767.59998, 12.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19435, 1843.35999, 777.87000, 10.57000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19435, 1843.35999, 779.66998, 10.55000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1837.73999, 777.87000, 10.57000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1837.73999, 779.60999, 10.55000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19462, 1834.30005, 764.51001, 10.51000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 1836.42004, 764.51001, 10.49000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 1839.14001, 764.51001, 10.51000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19497, 1842.40002, 770.73999, 12.14000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19498, 1842.40002, 770.73999, 12.14000,   0.00000, 0.00000, 180.00000);
 	CreateDynamicObject(19505, 1761.59534, -2094.57129, 14.82750,   0.00000, 0.00000, 90.11340);
	CreateDynamicObject(970, 1776.96094, -2102.92627, 13.09640,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1771.46228, -2102.92627, 13.09640,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1766.03381, -2102.92627, 13.09640,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1759.74927, -2102.92627, 13.09640,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1754.77808, -2102.92627, 13.09640,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19506, 1761.59534, -2094.57129, 14.82750,   0.00000, 0.00000, 90.11340);
	CreateDynamicObject(1535, 1763.95911, -2086.84521, 12.97830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19390, 1766.17566, -2094.37769, 14.72310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19390, 1763.37451, -2093.43311, 14.72310,   0.00000, 0.00000, 48.04470);
	CreateDynamicObject(19361, 1764.90405, -2092.68018, 14.48310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19361, 1763.88110, -2090.98145, 14.48310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2002, 1765.48132, -2091.33252, 12.98630,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14532, 1767.20117, -2093.55420, 13.96960,   0.00000, 0.00000, 29.15531);
	CreateDynamicObject(19361, 1762.18005, -2088.46167, 14.48310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19434, 1762.18005, -2090.86475, 14.48310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19361, 1761.87366, -2098.91626, 14.48310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19361, 1761.87366, -2095.78442, 14.48310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19390, 1760.17798, -2094.88062, 14.72310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19390, 1760.65796, -2091.66919, 14.72310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19361, 1757.47424, -2091.66919, 14.48310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2135, 1762.76440, -2087.52588, 12.98600,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2305, 1762.77795, -2090.41089, 12.98600,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2303, 1763.77136, -2090.39502, 12.98670,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2136, 1762.76563, -2089.50342, 12.98560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2812, 1762.61145, -2089.29810, 14.04140,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19434, 1762.20007, -2091.62476, 14.48310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2637, 1766.44800, -2088.76611, 13.40110,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(630, 1767.66565, -2087.18774, 14.01330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2637, 1765.44177, -2097.80591, 13.40110,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2788, 1765.42908, -2099.74463, 13.51370,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2788, 1765.42908, -2096.14795, 13.51370,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2788, 1766.83350, -2097.84351, 13.51370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2788, 1764.11792, -2097.84351, 13.51370,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19434, 1757.77625, -2094.88062, 14.48310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19434, 1756.67615, -2094.88062, 14.48310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19390, 1758.74927, -2093.18872, 14.72310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 1757.33545, -2094.50928, 13.79961,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1369, 1756.48389, -2092.36157, 13.57320,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2296, 1761.83264, -2088.23291, 12.98690,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2231, 1762.05298, -2087.59155, 12.98650,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2231, 1762.05298, -2091.38843, 12.98650,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1794, 1759.60779, -2089.56030, 12.98610,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1416, 1756.40479, -2090.84863, 13.56630,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2812, 1765.27625, -2098.07935, 13.82140,   0.00000, 0.00000, 26.46264);
	CreateDynamicObject(2090, 1757.19214, -2098.42358, 12.96100,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(913, 1760.62866, -2100.02124, 13.80750,   0.00000, 0.00000, 180.25661);
	CreateDynamicObject(2844, 1760.52637, -2098.69702, 12.98670,   0.00000, 0.00000, -171.00000);
	CreateDynamicObject(2851, 1764.33936, -2099.91260, 12.98670,   0.00000, 0.00000, -171.00000);
	CreateDynamicObject(1491, 1765.37878, -2094.43066, 13.00630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1762.77136, -2092.92944, 13.00630,   0.00000, 0.00000, 318.07870);
	CreateDynamicObject(1491, 1759.87988, -2091.71606, 13.00630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 1758.79346, -2093.92822, 13.00630,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 1759.39832, -2094.86768, 13.00630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2524, 1762.65564, -2091.55737, 12.98689,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2525, 1764.18628, -2091.58325, 12.98689,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2851, 1763.99365, -2100.06982, 12.98670,   0.00000, 0.00000, -171.00000);
	CreateDynamicObject(1649, 1765.65894, -2100.74731, 13.90630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 1758.36511, -2100.74634, 13.90630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 1755.88684, -2097.88257, 14.07130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 1758.48877, -2086.79810, 14.07130,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 1760.71484, -2086.79199, 14.07130,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 1767.83972, -2091.81372, 14.16790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 1767.83972, -2098.96973, 14.16790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 1767.83972, -2088.55591, 14.16790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 1767.83972, -2095.39478, 14.16790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19491, -2728.22803, -159.94388, 8.14820,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19492, -2728.20923, -159.92166, 8.13930,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19471, -2715.95093, -160.67703, 3.32646,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1505, -2725.06250, -163.45731, 3.32820,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1506, -2734.65454, -158.85344, 3.42940,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, -2734.71460, -162.64270, 7.52840,   0.00000, 0.00000, 270.23459);
	CreateDynamicObject(1649, -2734.63940, -162.70375, 4.28323,   0.00000, 0.00000, 270.63663);
	CreateDynamicObject(1649, -2734.64990, -159.04031, 7.58840,   0.00000, 0.00000, 270.23459);
	CreateDynamicObject(1649, -2722.13354, -162.33470, 7.52840,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, -2722.18799, -159.11984, 4.43880,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19397, -2732.02051, -159.37520, 7.95200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19442, -2732.02051, -156.96910, 7.95200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19397, -2730.51001, -161.01070, 7.95200,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, -2733.80225, -161.01070, 7.51200,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, -2732.82227, -161.01070, 7.51200,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, -2728.97778, -161.73030, 7.51200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19442, -2728.97778, -163.33031, 7.51200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19442, -2728.97778, -164.93030, 7.51200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2297, -2722.56177, -160.23730, 6.21130,   0.00000, 0.00000, 225.00000);
	CreateDynamicObject(2230, -2722.38794, -160.40860, 6.98190,   0.00000, 0.00000, 274.00000);
	CreateDynamicObject(2230, -2722.38794, -162.04860, 6.98190,   0.00000, 0.00000, 274.00000);
	CreateDynamicObject(2102, -2722.88281, -160.92920, 7.90950,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1736, -2722.54346, -160.94971, 8.46390,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2164, -2723.86865, -157.09850, 6.21190,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2161, -2725.43091, -157.10381, 6.21230,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2199, -2727.02222, -157.14340, 6.21200,   0.00000, 0.00000, 0.40301);
	CreateDynamicObject(2002, -2728.14429, -157.58989, 6.21199,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2294, -2731.42627, -155.53661, 6.21120,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2130, -2731.42627, -157.53200, 6.21300,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2426, -2731.67212, -157.47951, 8.03970,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2814, -2731.42969, -157.71068, 7.25790,   0.00000, 0.00000, 203.20206);
	CreateDynamicObject(2821, -2731.58521, -157.19136, 7.26572,   0.00000, 0.00000, 5.03365);
	CreateDynamicObject(1723, -2728.37207, -164.23070, 6.21230,   0.00000, 0.00000, 89.68267);
	CreateDynamicObject(1330, -2731.48291, -158.35143, 6.67250,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, -2722.84741, -158.29028, 7.24730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, -2722.83081, -159.32257, 7.24730,   0.00000, 0.00000, 33.60771);
	CreateDynamicObject(630, -2722.69849, -162.66278, 7.24730,   0.00000, 0.00000, 33.60771);
	CreateDynamicObject(630, -2722.86914, -163.71359, 7.24730,   0.00000, 0.00000, -135.00000);
	CreateDynamicObject(630, -2728.32153, -161.23206, 7.24730,   0.00000, 0.00000, 33.60771);
	CreateDynamicObject(1665, -2728.08252, -161.87897, 7.10120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1512, -2728.27539, -161.95615, 7.27860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2054, -2728.25562, -162.21960, 6.71530,   0.00000, 0.00000, 84.00000);
	CreateDynamicObject(2843, -2728.93994, -164.15714, 6.69520,   0.00000, 0.00000, -18.00000);
	CreateDynamicObject(2200, -2723.75854, -164.60840, 6.21160,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(2151, -2726.21289, -164.54506, 6.21270,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(1828, -2729.45068, -159.18839, 6.21280,   0.00000, 0.00000, 182.08626);
	CreateDynamicObject(2839, -2726.37769, -164.45030, 7.26262,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1724, -2726.12720, -160.02396, 6.21250,   0.00000, 0.00000, 62.00000);
	CreateDynamicObject(1724, -2726.08032, -162.36314, 6.21250,   0.00000, 0.00000, -258.00000);
	CreateDynamicObject(1822, -2724.91748, -161.47495, 6.21156,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1670, -2724.48608, -161.16399, 6.70770,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2837, -2724.33008, -160.81769, 6.70760,   0.00000, 0.00000, 185.00000);
	CreateDynamicObject(1796, -2734.09180, -160.43240, 6.21260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1738, -2732.31665, -157.55640, 6.81270,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1751, -2733.56201, -160.74680, 6.71750,   0.00000, 0.00000, 179.66020);
	CreateDynamicObject(2234, -2733.93945, -160.96249, 6.20270,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2844, -2734.45361, -158.71910, 6.92080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, -2731.99805, -160.11440, 6.21210,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, -2731.30713, -160.98660, 6.21210,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2025, -2734.08301, -163.40117, 6.21090,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2066, -2733.82471, -164.18950, 6.21230,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2066, -2733.83179, -161.63174, 6.21230,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2063, -2731.90088, -164.44366, 6.65290,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2526, -2729.50220, -163.04321, 6.21290,   0.00000, 0.00000, -89.00000);
	CreateDynamicObject(2517, -2733.16748, -162.53625, 6.21241,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2524, -2729.56445, -161.60719, 6.21220,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2525, -2731.96851, -161.58199, 6.21300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, -2722.11621, -159.21680, 7.52840,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1649, -2734.52515, -161.40768, 4.28323,   0.00000, 0.00000, 270.63663);
	CreateDynamicObject(19325, -2722.18628, -160.31929, 3.98907,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, -2734.68091, -161.46175, 4.03714,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19491, -2728.25610, -55.32800, 7.96720,   0.00000, 0.00000, 179.93021);
	CreateDynamicObject(19492, -2728.26611, -55.32550, 7.96720,   0.00000, 0.00000, 179.93021);
 	CreateDynamicObject(1506, -2725.07886, -57.35420, 3.10900,   0.00000, 0.00000, 269.35532);
	CreateDynamicObject(1651, -2722.16382, -54.21780, 4.47020,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, -2722.15381, -54.75810, 4.47020,   0.00000, 0.00000, 90.05790);
	CreateDynamicObject(1649, -2722.16724, -54.53212, 7.31020,   0.00000, 0.00000, 90.05790);
	CreateDynamicObject(1649, -2722.16675, -57.96201, 7.31020,   0.00000, 0.00000, 90.05790);
	CreateDynamicObject(1649, -2734.72192, -54.46840, 7.43020,   0.00000, 0.00000, 269.87079);
	CreateDynamicObject(1649, -2734.70361, -58.29340, 4.22940,   0.00000, 87.00000, 270.00000);
	CreateDynamicObject(1649, -2734.73755, -57.66450, 7.23020,   -1.00000, 0.00000, 270.00000);
	CreateDynamicObject(1649, -2734.66724, -55.99130, 4.22940,   0.00000, 87.00000, 270.00000);
	CreateDynamicObject(1506, -2734.73364, -52.73708, 3.24900,   0.00000, 0.00000, 269.35529);
	CreateDynamicObject(630, -2722.65479, -52.93792, 7.06000,   0.00000, 0.00000, 311.27170);
	CreateDynamicObject(630, -2722.69629, -59.72608, 7.06000,   0.00000, 0.00000, 311.27170);
	CreateDynamicObject(2173, -2724.75708, -53.05228, 6.03900,   0.00000, 0.00000, 359.14322);
	CreateDynamicObject(1670, -2723.67920, -53.14822, 6.85270,   0.00000, 0.00000, 193.00000);
	CreateDynamicObject(1671, -2724.24048, -53.41575, 6.51980,   0.00000, 0.00000, -185.00000);
	CreateDynamicObject(1726, -2726.66333, -55.71808, 6.04000,   0.00000, 0.00000, 47.00000);
	CreateDynamicObject(1726, -2725.54980, -58.74281, 6.04000,   0.00000, 0.00000, 135.00000);
	CreateDynamicObject(1433, -2724.97119, -56.80975, 6.03940,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1670, -2725.27002, -56.46774, 6.57270,   0.00000, 0.00000, 225.32526);
	CreateDynamicObject(2857, -2724.79688, -56.82399, 6.54520,   0.00000, 0.00000, -25.00000);
	CreateDynamicObject(2229, -2722.49658, -55.96291, 6.03860,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2229, -2722.38330, -57.35289, 6.03860,   0.00000, 0.00000, 273.64761);
	CreateDynamicObject(2596, -2722.62427, -56.33270, 7.26960,   0.00000, 0.00000, 269.30304);
	CreateDynamicObject(1738, -2724.00708, -59.98100, 6.69710,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2202, -2727.83862, -52.87632, 6.03870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2002, -2725.95557, -53.11810, 6.03999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1783, -2722.77515, -56.34430, 7.72920,   0.00000, 0.00000, 269.17499);
	CreateDynamicObject(19442, -2732.07153, -53.10850, 7.32620,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19397, -2732.07007, -55.30700, 7.32620,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19442, -2733.79077, -56.83560, 7.12620,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, -2732.79077, -56.83560, 7.12620,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19397, -2730.39111, -56.91440, 7.32620,   0.00000, 0.00000, -91.00000);
	CreateDynamicObject(19442, -2728.86011, -57.67450, 7.32620,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19442, -2728.86011, -59.27450, 7.32620,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(630, -2728.28467, -59.58486, 7.06000,   0.00000, 0.00000, 311.27170);
	CreateDynamicObject(630, -2731.43994, -51.07799, 7.06000,   0.00000, 0.00000, 311.27170);
	CreateDynamicObject(2063, -2730.87573, -59.72267, 6.16749,   0.00000, 0.00000, 176.56871);
	CreateDynamicObject(2517, -2734.15723, -53.77299, 6.04009,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2525, -2732.91870, -52.98212, 6.04078,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1202, -2733.71655, -56.32267, 6.04101,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2132, -2732.93262, -56.29313, 6.03960,   0.00000, 0.00000, 179.26814);
	CreateDynamicObject(2192, -2732.73901, -56.18163, 7.09070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, -2732.03589, -56.05070, 5.63620,   0.00000, 0.00000, 89.58360);
	CreateDynamicObject(1491, -2731.11621, -56.87161, 5.63619,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19471, -2722.16919, -56.43628, 3.33064,   0.00000, 0.00000, 359.44238);
	CreateDynamicObject(19442, -2732.29297, -59.44620, 7.12620,   0.00000, 0.00000, 180.47990);
	CreateDynamicObject(19442, -2732.29297, -58.03430, 7.12620,   0.00000, 0.00000, 180.47990);
	CreateDynamicObject(19442, -2732.29297, -57.69430, 7.12620,   0.00000, 0.00000, 180.47990);
	CreateDynamicObject(19325, -2722.25195, -56.36411, 6.97092,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, -2722.14844, -55.70474, 4.39862,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, -2734.70947, -56.62324, 6.77488,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, -2734.72046, -57.61562, 3.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3399, 2373.24683, -1144.99634, 26.07540,   180.00000, 0.00000, -91.20000);
	CreateDynamicObject(19505, 2372.61548, -1132.35510, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19361, 2347.55176, -1294.79443, 49.79911,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19506, 2372.60571, -1132.33765, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19506, 2372.60571, -1132.33765, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19506, 2372.60571, -1132.33765, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19506, 2372.60571, -1132.33765, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19506, 2372.60571, -1132.33765, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19506, 2372.60571, -1132.33765, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19506, 2372.61548, -1132.35510, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19506, 2372.66382, -1132.29712, 30.88690,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19361, 2373.17505, -1136.72363, 30.55520,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19361, 2373.19922, -1133.55066, 30.55520,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19361, 2368.53809, -1131.71106, 30.55520,   0.00000, 0.00000, 88.25999);
	CreateDynamicObject(19390, 2371.68262, -1131.80750, 30.55520,   0.00000, 0.00000, 88.26000);
	CreateDynamicObject(19361, 2373.19922, -1133.55066, 30.55520,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19361, 2368.57813, -1128.61218, 30.55520,   0.00000, 0.00000, 88.26000);
	CreateDynamicObject(19390, 2370.83740, -1130.25610, 30.55520,   0.00000, 0.00000, 180.00003);
	CreateDynamicObject(19390, 2371.68262, -1128.70508, 30.55520,   0.00000, 0.00000, 88.26000);
	CreateDynamicObject(19361, 2373.28955, -1127.22900, 30.55520,   0.00000, 0.00000, -3.42001);
	CreateDynamicObject(19361, 2373.35889, -1126.18323, 30.55520,   0.00000, 0.00000, -3.42000);
	CreateDynamicObject(19361, 2374.89087, -1128.60352, 30.55520,   0.00000, 0.00000, 88.25999);
	CreateDynamicObject(19390, 2377.32031, -1128.63611, 30.55520,   0.00000, 0.00000, 88.26000);
	CreateDynamicObject(1649, 2376.51221, -1138.51941, 29.45011,   0.00000, 0.00000, -1.83900);
	CreateDynamicObject(1649, 2378.77246, -1136.38464, 29.45010,   0.00000, 0.00000, 89.14009);
	CreateDynamicObject(1649, 2378.82764, -1133.74194, 29.45010,   0.00000, 0.00000, 89.14010);
	CreateDynamicObject(1649, 2369.18286, -1138.41064, 29.45010,   0.00000, 0.00000, -1.83900);
	CreateDynamicObject(1649, 2370.35571, -1124.50146, 29.45010,   0.00000, 0.00000, 178.75999);
	CreateDynamicObject(1649, 2378.95288, -1126.92078, 29.45010,   0.00000, 0.00000, 88.48009);
	CreateDynamicObject(1649, 2378.89526, -1130.01965, 29.45010,   0.00000, 0.00000, 89.14010);
	CreateDynamicObject(19361, 2373.19922, -1133.55066, 30.55520,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 2366.83936, -1135.63586, 29.45010,   0.00000, 0.00000, 268.56006);
	CreateDynamicObject(1491, 2370.85303, -1129.50781, 28.79530,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1491, 2372.42871, -1131.79517, 28.79530,   0.00000, 0.00000, 175.56004);
	CreateDynamicObject(1491, 2378.05005, -1128.64807, 28.79530,   0.00000, 0.00000, 179.76007);
	CreateDynamicObject(1491, 2372.42847, -1128.73328, 28.79530,   0.00000, 0.00000, 179.76007);
	CreateDynamicObject(3061, 2376.54712, -1124.70483, 30.20000,   0.00000, 0.00000, 88.74000);
	CreateDynamicObject(19325, 2378.88794, -1127.93372, 29.62025,   0.00000, 0.00000, -1.02000);
	CreateDynamicObject(19325, 2378.76880, -1134.89514, 29.62025,   0.00000, 0.00000, -0.54000);
	CreateDynamicObject(19325, 2371.01489, -1124.56738, 29.21170,   0.00000, 0.00000, 88.50007);
	CreateDynamicObject(19325, 2366.83911, -1135.00891, 29.21170,   0.00000, 0.00000, 178.68018);
	CreateDynamicObject(2269, 2374.60474, -1129.18494, 30.68241,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1737, 2376.04028, -1135.53528, 29.04564,   0.00000, 0.00000, 89.94000);
	CreateDynamicObject(1417, 2372.46509, -1137.94690, 29.31810,   0.00000, 0.00000, -179.70000);
	CreateDynamicObject(2090, 2368.87158, -1135.31006, 28.98830,   0.00000, 0.00000, -0.72000);
	CreateDynamicObject(1799, 2370.70166, -1126.92151, 29.04523,   0.00000, 0.00000, 88.92002);
	CreateDynamicObject(1808, 2375.50537, -1129.04211, 29.04457,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2013, 2373.96289, -1126.41431, 28.94096,   0.00000, 0.00000, 86.75999);
	CreateDynamicObject(2017, 2373.89941, -1127.39941, 28.94018,   0.00000, 0.00000, 86.52000);
	CreateDynamicObject(1808, 2375.49487, -1128.87854, 29.04560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2079, 2375.05566, -1135.15710, 29.64861,   0.00000, 0.00000, -180.54001);
	CreateDynamicObject(2079, 2376.93286, -1135.15710, 29.64860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2079, 2376.01855, -1133.59949, 29.64860,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2079, 2376.01855, -1136.89819, 29.64860,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2831, 2376.07031, -1135.20337, 29.83964,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2819, 2374.98145, -1132.26746, 29.04498,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2844, 2371.90576, -1137.50049, 29.04608,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2846, 2368.86377, -1133.84351, 29.67440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2063, 2369.39185, -1131.37390, 29.94658,   0.00000, 0.00000, -180.54005);
	CreateDynamicObject(19503, 932.57257, 1976.01990, 12.76105,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19360, 928.81512, 1975.73108, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 932.02417, 1975.77869, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 935.23297, 1975.80212, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 925.61517, 1975.68701, 10.52980,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 922.42865, 1975.63342, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 926.77661, 1972.32837, 10.52680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 922.47351, 1972.15027, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 925.67255, 1972.20703, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 922.52148, 1968.64990, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 925.72589, 1968.72485, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 926.82935, 1968.84363, 10.52680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 921.23315, 1972.04395, 10.52680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 921.29291, 1968.54431, 10.52680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 921.13629, 1979.03186, 10.52680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 921.18359, 1975.53552, 10.52680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 922.49664, 1979.12598, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 922.33881, 1982.32373, 10.52570,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 921.28662, 1982.52527, 10.52680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 925.55798, 1979.17590, 10.52680,   0.00000, 90.00000, 90.81370);
	CreateDynamicObject(19360, 925.50940, 1982.25195, 10.52570,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 928.76691, 1979.22681, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 931.96820, 1979.27173, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 935.17261, 1979.29773, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 928.72034, 1982.29919, 10.52570,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 931.91541, 1982.35168, 10.52570,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 935.12262, 1982.64417, 10.52570,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 938.42908, 1975.83057, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 941.62939, 1975.87231, 10.53680,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(19360, 944.06512, 1975.91052, 10.53580,   0.00000, 90.00000, 90.81470);
	CreateDynamicObject(1649, 921.82104, 1966.90063, 11.46354,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 925.87701, 1966.87244, 11.46354,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1649, 919.73328, 1969.67969, 11.46350,   0.00000, 0.00000, 90.30640);
	CreateDynamicObject(1649, 919.67426, 1976.82080, 11.46350,   0.00000, 0.00000, 90.30640);
	CreateDynamicObject(1649, 924.35101, 1983.93506, 11.46354,   0.00000, 0.00000, 359.69897);
	CreateDynamicObject(1649, 932.01868, 1983.95593, 11.46350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 934.53107, 1974.40051, 11.95426,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 937.71356, 1974.40845, 11.95426,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 938.39941, 1977.48926, 11.95426,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 936.89191, 1979.18848, 11.95430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 936.91473, 1982.38965, 11.95430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 935.85699, 1983.75598, 11.95430,   0.00000, 0.00000, 86.51940);
	CreateDynamicObject(19358, 932.64471, 1983.89429, 9.04939,   0.00000, 0.00000, 88.82820);
	CreateDynamicObject(19358, 929.50488, 1983.94177, 11.95020,   0.00000, 0.00000, 88.82820);
	CreateDynamicObject(19358, 921.02472, 1983.26868, 11.95600,   0.00000, 0.00000, 111.30029);
	CreateDynamicObject(19358, 929.46063, 1983.78210, 11.95600,   0.00000, 0.00000, 88.82820);
	CreateDynamicObject(19358, 927.14948, 1983.83118, 11.95600,   0.00000, 0.00000, 88.82820);
	CreateDynamicObject(19358, 923.94080, 1983.90039, 9.04939,   0.00000, 0.00000, 88.82820);
	CreateDynamicObject(19358, 919.73578, 1981.11401, 11.95430,   0.00000, 0.00000, 1.24904);
	CreateDynamicObject(19358, 919.75488, 1980.02649, 11.95430,   0.00000, 0.00000, 1.24904);
	CreateDynamicObject(19358, 919.82336, 1973.65662, 11.95430,   0.00000, 0.00000, 1.24904);
	CreateDynamicObject(19358, 919.83862, 1973.08301, 11.95430,   0.00000, 0.00000, 1.24904);
	CreateDynamicObject(19358, 927.90625, 1968.71973, 11.95430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 927.89844, 1971.87146, 11.95430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 927.88147, 1972.96729, 11.95430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 929.55396, 1974.45691, 11.95426,   0.00000, 0.00000, 89.18285);
	CreateDynamicObject(19358, 919.79199, 1976.82800, 9.04940,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(13187, 941.12640, 1966.88904, 11.18371,   0.00000, 0.00000, 89.69699);
	CreateDynamicObject(19388, 926.93506, 1975.71069, 11.95430,   0.00000, 0.00000, 36.61544);
	CreateDynamicObject(19388, 939.34869, 1975.99036, 11.95430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 926.00073, 1982.15576, 11.95430,   0.00000, 0.00000, 359.06027);
	CreateDynamicObject(19358, 926.01575, 1979.00854, 11.95430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 924.28149, 1979.31311, 11.95430,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 921.34723, 1979.30432, 11.95430,   0.00000, 0.00000, 90.09337);
	CreateDynamicObject(19358, 927.66882, 1977.88660, 11.95426,   0.00000, 0.00000, 89.18285);
	CreateDynamicObject(19358, 934.14447, 1977.54285, 11.95426,   0.00000, 0.00000, 89.18285);
	CreateDynamicObject(19358, 935.20685, 1977.52295, 11.95426,   0.00000, 0.00000, 89.18285);
	CreateDynamicObject(19358, 925.98724, 1978.54590, 11.95430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 926.09448, 1966.84192, 11.23014,   0.00000, 0.00000, 359.38477);
	CreateDynamicObject(970, 922.34985, 1966.84448, 11.23014,   0.00000, 0.00000, 359.38477);
	CreateDynamicObject(970, 919.66150, 1970.02917, 11.31972,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 919.61969, 1976.75439, 11.31972,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 932.51831, 1984.05090, 11.21466,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 923.86151, 1984.03760, 11.21466,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19362, 934.06293, 1975.84497, 13.47230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 937.51514, 1976.05872, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 935.06055, 1979.16101, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 935.09467, 1982.38538, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 931.58777, 1979.20911, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 931.61041, 1982.41199, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 928.11517, 1982.11523, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 928.07642, 1978.90320, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 928.24731, 1976.13391, 13.47230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 930.89594, 1975.99670, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 924.69891, 1977.37988, 13.47230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 924.63550, 1980.54004, 13.47230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 924.67316, 1982.32410, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 921.59003, 1982.15625, 13.47230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 921.26093, 1978.97266, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 921.23212, 1975.75208, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 921.24335, 1972.59058, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 921.22742, 1969.38025, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 921.25922, 1967.87415, 13.47230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 924.73218, 1967.89563, 13.47230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 926.49939, 1967.91882, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 926.37817, 1971.07751, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 926.05078, 1974.23572, 13.46230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 924.31073, 1974.23438, 13.47130,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 924.11401, 1970.99805, 13.47230,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 940.92352, 1976.05261, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 940.92352, 1976.05261, 13.47430,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19362, 941.59241, 1977.48987, 12.31760,   0.00000, 0.00000, 90.05999);
	CreateDynamicObject(19362, 941.55859, 1974.26599, 12.31760,   0.00000, 0.00000, 90.05999);
	CreateDynamicObject(19362, 943.21332, 1975.87292, 12.31760,   0.00000, 0.00000, 179.39993);
	CreateDynamicObject(19362, 940.88391, 1974.27271, 12.31760,   0.00000, 0.00000, 90.05999);
	CreateDynamicObject(1498, 942.49811, 1983.94519, 10.29375,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2072, 927.65363, 1974.16382, 11.63206,   0.00000, 0.00000, 57.12001);
	CreateDynamicObject(2072, 919.91486, 1967.18665, 11.63206,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2072, 927.64630, 1967.44153, 11.63206,   0.00000, 0.00000, 79.86000);
	CreateDynamicObject(1703, 922.59717, 1967.56372, 10.62350,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1703, 924.94885, 1967.56262, 10.62350,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1703, 927.27380, 1967.56714, 10.62350,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1703, 920.46680, 1972.31128, 10.62350,   0.00000, 0.00000, 90.53999);
	CreateDynamicObject(16780, 931.54095, 1980.65210, 13.38098,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 923.56952, 1978.18848, 10.61230,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1429, 923.88678, 1978.54773, 11.38379,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2357, 931.48438, 1980.50256, 11.03165,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1721, 930.22339, 1979.40222, 10.62408,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1721, 932.37830, 1979.30090, 10.62408,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1721, 928.58435, 1980.44958, 10.62410,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1721, 932.45874, 1981.64319, 10.62410,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1721, 930.13153, 1981.66479, 10.62410,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1721, 934.31842, 1980.49194, 10.62410,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(16780, 923.82587, 1972.69653, 13.38098,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1491, 926.03394, 1982.94226, 10.22230,   0.00000, 0.00000, 268.02005);
	CreateDynamicObject(1491, 939.38593, 1975.23303, 10.22230,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1491, 927.35138, 1975.11438, 10.22230,   0.00000, 0.00000, 126.17998);
	CreateDynamicObject(1491, 922.10883, 1979.33264, 10.22230,   0.00000, 0.00000, 180.89998);
	CreateDynamicObject(2630, 925.19739, 1980.46960, 10.61438,   0.00000, 0.00000, -180.29997);
	CreateDynamicObject(2627, 923.52808, 1980.47119, 10.62551,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2628, 920.72986, 1982.10596, 10.61474,   0.00000, 0.00000, 91.86001);
	CreateDynamicObject(14806, 927.16547, 1971.04175, 11.34536,   0.00000, 0.00000, -89.45998);
	CreateDynamicObject(1823, 940.55573, 1977.74377, 10.62490,   0.00000, 0.00000, -181.20000);
	CreateDynamicObject(1823, 942.12531, 1975.48633, 10.62490,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1823, 942.11731, 1977.25012, 10.62490,   0.00000, 0.00000, -89.88000);
	CreateDynamicObject(1823, 942.11731, 1977.25012, 10.62490,   0.00000, 0.00000, -89.88000);
	CreateDynamicObject(19357, 934.36115, 1974.10022, 11.66881,   0.00000, 0.00000, -90.11997);
	CreateDynamicObject(1660, -2270.07739, -23.21504, 34.00061,   0.00000, 0.00000, 89.81997);
	CreateDynamicObject(19491, -2277.36328, -14.37268, 39.18981,   0.00000, 0.00000, 178.58746);
	CreateDynamicObject(19325, -2283.77563, -14.70356, 36.02671,   0.00000, 0.00000, 358.38928);
	CreateDynamicObject(19325, -2271.29102, -15.58237, 34.92504,   0.00000, 0.00000, 358.38928);
	CreateDynamicObject(19325, -2271.29224, -15.57960, 38.14920,   0.00000, 0.00000, 358.38931);
	CreateDynamicObject(19325, -2283.79614, -15.29216, 37.56814,   0.00000, 0.00000, 358.38928);
	CreateDynamicObject(19360, -2279.53711, -15.81921, 37.20731,   0.00000, 90.00000, 358.91687);
	CreateDynamicObject(19360, -2279.36792, -11.01106, 37.21340,   0.00000, 90.00000, 358.91687);
	CreateDynamicObject(19360, -2281.24243, -15.78124, 38.10018,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19360, -2277.84229, -15.68678, 38.45790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19360, -2277.69263, -12.63804, 38.45790,   0.00000, 0.00000, 359.30511);
	CreateDynamicObject(19362, -2279.48901, -17.13823, 38.03102,   0.00000, 0.00000, 87.61581);
	CreateDynamicObject(1491, -2280.31860, -14.25948, 37.30159,   0.00000, 0.00000, 357.79807);
	CreateDynamicObject(19362, -2281.03955, -10.93697, 38.28719,   0.00000, 0.00000, 178.56532);
	CreateDynamicObject(19362, -2277.26270, -14.36980, 38.77588,   0.00000, 0.00000, 89.57728);
	CreateDynamicObject(19362, -2281.59424, -14.31658, 39.01590,   0.00000, 0.00000, 89.57730);
	CreateDynamicObject(19360, -2281.26465, -12.93083, 37.80422,   0.00000, 0.00000, -2.52000);
	CreateDynamicObject(19360, -2281.09424, -12.96569, 38.00422,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19360, -2279.38110, -15.44888, 39.82830,   0.00000, 90.00000, 358.91690);
	CreateDynamicObject(19360, -2279.35352, -10.94986, 39.82830,   0.00000, 90.00000, 358.85690);
	CreateDynamicObject(19360, -2279.51904, -14.03340, 39.82620,   0.00000, 90.00000, 359.33679);
	CreateDynamicObject(19362, -2279.19360, -9.45388, 38.38719,   0.00000, 0.00000, 90.15282);
	CreateDynamicObject(19362, -2279.30469, -9.42603, 38.69020,   0.00000, 0.00000, 89.03266);
	CreateDynamicObject(19362, -2279.51099, -17.14675, 37.56020,   0.00000, 0.00000, 87.61581);
	CreateDynamicObject(2272, -2280.31177, -10.05162, 38.40161,   0.00000, 0.00000, 358.41095);
	CreateDynamicObject(1702, -2280.49707, -11.56694, 37.30124,   0.00000, 0.00000, 88.73994);
	CreateDynamicObject(19360, -2279.79370, -14.20448, 37.21340,   0.00000, 90.00000, 358.91687);
	CreateDynamicObject(1823, -2281.15918, -15.65022, 37.27958,   0.00000, 0.00000, -90.30002);
	CreateDynamicObject(1823, -2281.15088, -14.33725, 37.27958,   0.00000, 0.00000, -90.30002);
	CreateDynamicObject(970, -1435.96021, 2658.76807, 55.40715,   0.00000, 0.00000, -89.45998);
	CreateDynamicObject(970, -1435.90588, 2654.61816, 55.40715,   0.00000, 0.00000, -89.45998);
	CreateDynamicObject(970, 917.23737, 1971.84387, 10.38422,   0.00000, 0.00000, -89.94002);
	CreateDynamicObject(970, 917.23859, 1967.70410, 10.38422,   0.00000, 0.00000, -89.94002);
	CreateDynamicObject(970, 917.24152, 1965.44360, 10.38422,   0.00000, 0.00000, -89.94002);
	CreateDynamicObject(970, 919.33203, 1963.27405, 10.38422,   0.00000, 0.00000, -1.56001);
	CreateDynamicObject(970, 923.46826, 1963.23914, 10.38422,   0.00000, 0.00000, 0.59999);
	CreateDynamicObject(970, 927.64990, 1963.26978, 10.38422,   0.00000, 0.00000, 0.59999);
	CreateDynamicObject(970, 933.11206, 1963.30652, 10.38422,   0.00000, 0.00000, 0.59999);
	CreateDynamicObject(970, 938.33704, 1963.30591, 10.38422,   0.00000, 0.00000, 0.59999);
	CreateDynamicObject(970, 942.51709, 1963.34460, 10.38422,   0.00000, 0.00000, 0.59999);
	CreateDynamicObject(970, 946.61688, 1963.40222, 10.38422,   0.00000, 0.00000, 0.59999);
	CreateDynamicObject(970, 948.69843, 1965.49780, 10.38422,   0.00000, 0.00000, -89.94002);
	CreateDynamicObject(970, -2275.84277, -8.32692, 34.84872,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -2271.72339, -8.33081, 34.84872,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -2269.80566, -11.76012, 34.84872,   0.00000, 0.00000, 87.41999);
	CreateDynamicObject(970, -2269.97949, -15.92230, 34.84872,   0.00000, 0.00000, 87.41999);
	CreateDynamicObject(970, -2271.23413, -19.65417, 34.84872,   0.00000, 0.00000, 53.99999);
	CreateDynamicObject(970, -2716.17261, -57.35970, 3.84959,   0.00000, 0.00000, 90.11999);
	CreateDynamicObject(970, -2716.15039, -54.07794, 3.84959,   0.00000, 0.00000, 90.11999);
	CreateDynamicObject(970, -2716.13281, -161.89932, 3.86850,   0.00000, 0.00000, 89.46001);
	CreateDynamicObject(970, -2716.09424, -158.35504, 3.86850,   0.00000, 0.00000, 89.46001);
	CreateDynamicObject(19456, 2361.07544, -1138.54492, 27.38317,   0.00000, 0.00000, -5.10000);
	CreateDynamicObject(19456, 2365.52856, -1143.53259, 27.38317,   0.00000, 0.00000, 88.74002);
	CreateDynamicObject(19364, 2377.99438, -1143.66699, 27.37885,   0.00000, 0.00000, -91.26007);
	CreateDynamicObject(19364, 2381.19678, -1143.70959, 27.37885,   0.00000, 0.00000, -90.30008);
	CreateDynamicObject(19364, 2382.96362, -1142.03833, 27.37885,   0.00000, 0.00000, -182.94005);
	CreateDynamicObject(19364, 2383.13550, -1138.82227, 27.37885,   0.00000, 0.00000, -182.94005);
	CreateDynamicObject(19364, 2381.54443, -1137.12866, 27.37885,   0.00000, 0.00000, -90.30008);
	CreateDynamicObject(19364, 2380.56250, -1137.11279, 27.37885,   0.00000, 0.00000, -90.30008);
	CreateDynamicObject(970, 2370.40796, -1143.66675, 27.11579,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2376.34839, -1143.68091, 27.11579,   0.00000, 0.00000, 0.00000);

	// Hospital LS
	CreateObject(14597, 1156.699951, -1324.799927, -9.800000, 0.000000, 0.000000, 270.000000, 0.0); // 0
	CreateObject(14597, 1157.199951, -1351.069946, -9.800000, 0.000000, 0.000000, 90.000000, 0.0); // 0
	CreateDynamicObject(1997, 1159.199951, -1330.500000, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1724, 1159.099976, -1327.800049, -11.800000, 0.000000, 0.000000, 270.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2994, 1154.199951, -1327.400024, -11.300000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1161.800049, -1329.900024, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3440, 1156.099976, -1337.800049, -9.400000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3440, 1158.599976, -1337.900024, -9.000000, 0.000000, 90.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(3440, 1158.000000, -1337.900024, -9.400000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2596, 1150.300049, -1328.599976, -8.900000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1162.199951, -1334.900024, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1738, 1150.800049, -1328.199951, -11.100000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1523, 1156.199951, -1337.900024, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1162.500000, -1327.099976, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2596, 1164.800049, -1328.900024, -8.700000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1997, 1151.099976, -1334.800049, -11.800000, 0.000000, 0.000000, 179.990005, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1164.199951, -1329.099976, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1164.900024, -1334.900024, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1997, 1149.099976, -1334.900024, -11.800000, 0.000000, 0.000000, 179.990005, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1808, 1153.800049, -1322.800049, -11.700000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1165.500000, -1327.000000, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1148.000000, -1329.099976, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2596, 1167.900024, -1328.900024, -8.700000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1997, 1147.000000, -1334.900024, -11.800000, 0.000000, 0.000000, 179.990005, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2596, 1162.099976, -1320.900024, -8.900000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1162.500000, -1321.300049, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1168.400024, -1334.699951, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2828, 1146.900024, -1324.800049, -10.760000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1150.800049, -1321.400024, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1150.300049, -1341.199951, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1724, 1154.300049, -1319.800049, -11.800000, 0.000000, 0.000000, 88.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2434, 1147.000000, -1325.000000, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2813, 1146.400024, -1325.099976, -10.700000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1997, 1168.900024, -1329.900024, -11.800000, 0.000000, 0.000000, 343.989990, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1147.500000, -1323.400024, -10.700000, 0.000000, 0.000000, 270.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1168.500000, -1327.000000, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2596, 1144.199951, -1329.000000, -8.800000, 0.000000, 0.000000, 16.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1724, 1159.000000, -1319.199951, -11.800000, 0.000000, 0.000000, 216.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1164.599976, -1341.300049, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2435, 1147.170044, -1323.869995, -11.800000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1997, 1144.900024, -1334.900024, -11.800000, 0.000000, 0.000000, 180.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2435, 1146.089966, -1325.000000, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2435, 1147.170044, -1322.939941, -11.800000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2190, 1147.500000, -1321.699951, -10.700000, 0.000000, 0.000000, 270.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1147.599976, -1341.000000, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2596, 1166.599976, -1320.900024, -8.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2435, 1145.199951, -1325.000000, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2435, 1147.160034, -1322.010010, -11.800000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2273, 1169.800049, -1324.900024, -9.800000, 0.000000, 0.000000, 272.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2251, 1143.400024, -1327.900024, -10.900000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2284, 1143.599976, -1326.599976, -10.700000, 0.000000, 0.000000, 88.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1167.099976, -1341.199951, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2435, 1147.160034, -1321.280029, -11.800000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2289, 1153.900024, -1316.400024, -9.100000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2739, 1167.699951, -1321.300049, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14494, 1168.500000, -1321.500000, -10.200000, 0.000000, 0.000000, 176.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2742, 1168.199951, -1320.900024, -10.200000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1145.800049, -1321.500000, -11.800000, 0.000000, 0.000000, 66.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2287, 1143.699951, -1323.800049, -10.600000, 0.000000, 0.000000, 88.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1162.000000, -1345.900024, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1145.099976, -1341.099976, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1154.500000, -1346.699951, -11.800000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1169.560059, -1341.020020, -11.300000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2738, 1169.199951, -1321.199951, -11.200000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1150.599976, -1346.000000, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2186, 1143.599976, -1322.300049, -11.800000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1164.500000, -1346.099976, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1159.500000, -1348.099976, -11.800000, 0.000000, 0.000000, 270.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1148.000000, -1346.099976, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2639, 1162.699951, -1348.099976, -11.200000, 0.000000, 0.000000, 180.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1167.199951, -1345.800049, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, 1154.599976, -1312.599976, -10.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1150.900024, -1349.199951, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(630, 1159.000000, -1312.400024, -10.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1145.000000, -1346.000000, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1997, 1165.699951, -1348.280029, -11.800000, 0.000000, 0.000000, 91.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1169.900024, -1345.699951, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2637, 1162.709961, -1349.800049, -11.400000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2946, 1158.500000, -1311.630005, -11.800000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2946, 1155.319946, -1311.630005, -11.800000, 0.000000, 0.000000, 270.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1148.000000, -1349.099976, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1997, 1167.199951, -1348.599976, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1886, 1170.329956, -1348.349976, -7.750000, 25.000000, 0.000000, -33.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1997, 1169.270020, -1348.510010, -11.800000, 0.000000, 0.000000, 84.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2603, 1145.199951, -1349.000000, -11.410000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14532, 1162.609985, -1354.619995, -10.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14532, 1150.400024, -1354.400024, -10.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2164, 1170.760010, -1351.560059, -11.800000, 0.000000, 0.000000, -90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14532, 1165.930054, -1354.630005, -10.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2878, 1160.069946, -1356.140015, -10.630000, 0.000000, 0.000000, -90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(14532, 1145.800049, -1354.400024, -10.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1714, 1168.109985, -1354.449951, -11.800000, 0.000000, 0.000000, 145.809998, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1971, 1170.699951, -1353.430054, -9.950000, 0.000000, 0.000000, -90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2066, 1170.810059, -1353.160034, -11.800000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2066, 1170.449951, -1353.739990, -11.800000, 0.000000, 0.000000, -90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1210, 1169.229980, -1355.050049, -11.650000, 0.000000, 0.000000, 180.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1990, 1170.310059, -1354.540039, -11.800000, 0.000000, 0.000000, -90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1159.500000, -1359.099976, -11.800000, 0.000000, 0.000000, 270.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2635, 1157.099976, -1360.300049, -11.400000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1746, 1155.300049, -1360.900024, -11.800000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1724, 1158.900024, -1362.400024, -11.800000, 0.000000, 0.000000, 216.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1723, 1157.000000, -1363.099976, -11.800000, 0.000000, 0.000000, 180.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1444, 1181.169556, -1318.203613, 13.385829, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2774, 1181.010010, -1354.180054, 3.260000, 180.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(948, 1173.339966, -1354.729980, 13.200000, 0.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(19003, 1172.060059, -1360.530029, 13.210000, 0.000000, 180.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1523, 1181.800049, -1359.430054, 13.200000, 0.000000, 0.000000, 268.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2356, 1173.599976, -1366.040039, 13.230000, 0.000000, 0.000000, 328.279999, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2000, 1173.270020, -1366.969971, 13.210000, 0.000000, 0.000000, 180.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2007, 1174.020020, -1366.959961, 13.210000, 0.000000, 0.000000, 180.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(1523, 1181.800049, -1362.469971, 13.200000, 0.000000, 0.000000, 90.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2774, 1181.010010, -1367.660034, 3.260000, 180.000000, 0.000000, 0.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0
	CreateDynamicObject(2002, 1179.930054, -1367.000000, 13.190000, 0.000000, 0.000000, 180.000000, -1, 6, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD); // 0

	//Edificio
	CreateDynamicObject(19795, 280.160004, -1613.900024, 33.680000, 0.000000, 0.000000, 80.099998);
	CreateDynamicObject(19795, 286.179993, -1614.939941, 33.680000, 0.000000, 0.000000, 80.099998);
	CreateDynamicObject(19795, 292.200012, -1616.020020, 33.680000, 0.000000, 0.000000, 80.099998);
	CreateDynamicObject(19911, 262.130005, -1639.609985, 21.650000, 90.000000, 90.000000, 79.699997);

	// Vallas /arrestar
	CreateDynamicObject(994, 1556.47, -1691.42, 5.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(994, 1564.66, -1691.42, 5.00,   0.00, 0.00, -90.00);

        return 0;
}