new vendedormc1[20], actors[20],Guardia3,Guardia4,Guardia6,Guardia7,Guardia8,Guardia12,Entrenador,Entrenador2,IslaSeguridad,IslaSeguridad2,Hombreemisora,Chicataxista,Minero,Minero1,Avionista,vendedorautos[20],PoliHabla1,PoliHabla2,ChicoBarRie,tiendav,ChicoBar;
new ActorPrueba,ActorPrueba2,ActorGST,ActorGST2,ActorGST3,ActorGST4,ActorGST5,CiudadanoPerdido,PizzeroActor,ActorOrinando,PoliciaUnity,GordoGlenPark,Accidente,GuardaespaldasAlhambra,Chulo,Abuelita,PoliFuma,PoliCansado,PoliEntrada;
new GuardiaESP, GuardiaESP2,SacaDinero,Sentado,Sentada,SeguridadBar,Bankera,Bankero,negrobaila,mujerbaila,mujerchata,hombrechata,dijey,papel,Strip[50],Stripx[50];
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
vendedormc1[0] = CreateActor(149, 2111.3699,-1875.2085,13.5469, 355.9907); //chaleco
ApplyActorAnimation(vendedormc[0], "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
vendedormc1[1] = CreateActor(5, 2108.6609,-1875.2838,13.5469,358.5758); // armas
ApplyActorAnimation(vendedormc1[1], "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
vendedormc1[2] = CreateActor(28, 2113.8672,-1875.1899,13.5469,2.4611); //bates
ApplyActorAnimation(vendedormc1[2], "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
vendedormc1[3] = CreateActor(65, 2116.0447,-1875.2800,13.5469,3.5265); //c4
ApplyActorAnimation(vendedormc1[3], "DEALER", "Dealer_idle", 4.1, 1, 0, 0, 0, 0);
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