// Posiciones y mapeo originales de la GM donante.
new Float:PosBolsoBlindado[10][2] =
{
	{-0.48080, -0.50520},
	{-0.00040, -0.50260},
	{0.44660, -0.50190},
	{-0.45870, -0.98660},
	{0.00630, -0.98660},
	{0.72830, -1.43360},
	{0.47130, -0.98660},
	{0.26330, -1.46760},
	{-0.72270, -1.39960},
	{-0.24670, -1.46760}
};


new Float:PosBlindado[3][4] =
{
	{-1587.8663, 857.0839, 7.6145, 270.6797},
	{2430.8196, 2284.2197, 10.7964, 180.2363},
	{1449.7277, -1030.2803, 23.7806, 90.3334}
};

new Float:PosPointRepartMoney[6][3] =
{
	{2276.3118,63.8199,26.4844},
	{-258.5555,-2190.0417,28.9734},
	{-2287.7114,-126.1337,35.3203},
	{-1453.9968,1077.3398,7.1875},
	{1888.3954,1379.9729,16.3167},
	{1533.3528,2350.1743,10.8203}
};

new Float:PosBolsaBurrito[10][2] =
{
	{-0.63921, -0.43842},
	{-0.63851, -0.89747},
	{0.61167, -0.33579},
	{0.61475, -0.84175},
	{-0.16911, -0.39741},
	{0.19239, -0.69290},
	{-0.19766, -0.94760},
	{0.22150, -1.15379},
	{0.65461, -1.25213},
	{-0.63887, -1.33928}
};

new Float:PosBolsaYosemite[10][2] =
{
	{0.79592, -2.52131},
	{-0.81451, -2.50532},
	{-0.78838, -0.90649},
	{0.78789, -0.90345},
	{-0.54350, -1.95420},
	{0.43940, -1.99800},
	{-0.50630, -1.34650},
	{0.42850, -1.49870},
	{0.33887, -0.91951},
	{-0.21252, -0.97774}
};

new Float:PosBolsaBobCat[10][2] =
{
	{0.58480, -2.19110},
	{-0.63700, -2.15270},
	{-0.62321, -0.65525},
	{0.59087, -0.67633},
	{-0.35023, -1.27829},
	{0.32495, -1.37003},
	{-0.36390, -1.72390},
	{0.17416, -1.86887},
	{0.20429, -0.88859},
	{-0.23875, -0.86775}
};

new Float:PosBolsaSadler[10][2] =
{
	{0.69460, -2.36930},
	{-0.72880, -2.36570},
	{-0.71881, -0.74943},
	{0.70091, -0.79424},
	{-0.35407, -1.89714},
	{0.30932, -1.93016},
	{-0.24920, -2.28900},
	{0.24110, -2.32930},
	{0.37230, -1.45230},
	{-0.38107, -1.46523}
};


stock RB_LoadMarketMap() {
	// Mercado negro
	CreateDynamicObject(1447, 2429.00317, -1879.64258, 13.82031,   356.85840, 0.00000, 0.00000);
	CreateDynamicObject(1447, 2426.49243, -1879.64331, 13.82031,   356.85840, 0.00000, 0.00000);
	CreateDynamicObject(1447, 2457.52393, -1879.77930, 13.82031,   356.85840, 0.00000, -0.01745);
	CreateDynamicObject(1447, 2464.58618, -1882.27832, 13.82031,   356.85840, 0.00000, 89.48364);
	CreateDynamicObject(1447, 2464.48535, -1887.55505, 13.82031,   356.85840, 0.00000, 89.48364);
	CreateDynamicObject(1447, 2464.39697, -1892.81445, 13.82031,   356.85840, 0.00000, 89.48364);
	CreateDynamicObject(1447, 2464.35156, -1898.15015, 13.82031,   356.85840, 0.00000, 89.48364);
	CreateDynamicObject(1447, 2464.31519, -1901.67334, 13.82031,   356.85840, 0.00000, 89.48364);
	CreateDynamicObject(1437, 2448.67529, -1901.46338, 11.62895,   0.00000, 0.00000, 179.81390);
	CreateDynamicObject(2060, 2438.83398, -1901.52539, 12.67800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2060, 2438.79614, -1901.00696, 12.67800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2060, 2438.78955, -1900.51709, 12.67800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2060, 2438.79395, -1900.05664, 12.67800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2064, 2438.87573, -1898.92053, 13.14150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(853, 2440.93823, -1900.68140, 12.85060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(853, 2440.59619, -1899.70190, 12.85060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(960, 2438.86426, -1896.34680, 12.84492,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(939, 2452.45435, -1900.80200, 14.90951,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(12957, 2455.33569, -1893.56128, 13.25432,   0.00000, 0.00000, 17.86772);
	CreateDynamicObject(3174, 2459.68506, -1885.29456, 12.54385,   0.00000, 0.00000, 47.04800);
 	new MERCADO[8];
	MERCADO[0] = CreateDynamicObject(19393, 2447.41943, -1886.09387, 14.26070,   0.00000, 0.00000, 0.00000);
	MERCADO[1] = CreateDynamicObject(19456, 2442.64844, -1884.59729, 14.26060,   0.00000, 0.00000, 89.93550);
	MERCADO[2] = CreateDynamicObject(19456, 2447.42407, -1892.26367, 14.26070,   0.00000, 0.00000, 0.00000);
	MERCADO[3] = CreateDynamicObject(19456, 2447.42969, -1898.19324, 14.26070,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(MERCADO[0], 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(MERCADO[1], 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(MERCADO[2], 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(MERCADO[3], 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	//
	MERCADO[4] = CreateDynamicObject(19377, 2442.35010, -1889.32751, 15.96695,   0.00000, 90.00000, 360.00000);
	MERCADO[5] = CreateDynamicObject(19377, 2442.33936, -1898.63513, 15.96695,   0.00000, 90.00000, 360.00000);
	SetDynamicObjectMaterial(MERCADO[4], 0, 15041, "bigsfsave", "mp_carter_tilewall", 0x00000000);
	SetDynamicObjectMaterial(MERCADO[5], 0, 15041, "bigsfsave", "mp_carter_tilewall", 0x00000000);
	//
	MERCADO[6] = CreateDynamicObject(1499, 2447.50171, -1886.80554, 12.54830,   0.00000, 0.00000, 91.09558);
	SetDynamicObjectMaterial(MERCADO[6], 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(MERCADO[6], 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	//
	MERCADO[7] = CreateDynamicObject(11102, 2447.467285, -1895.509521, 14.046877, 0.000000, 0.000000, 179.699996);
	SetDynamicObjectMaterialText(MERCADO[7], 0, "MERCADO\nNEGRO", 60, "Calibri", 37, 0, 0xFF000000, 0x00000000, 1);
	//
	CreateDynamicObject(2068, 2444.00610, -1895.77075, 15.52445,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2068, 2441.16089, -1896.14795, 15.52445,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2068, 2440.39551, -1888.86975, 15.52445,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2068, 2443.82471, -1888.89124, 15.52445,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1570, 2446.42090, -1900.58557, 13.74087,   0.00000, 0.00000, 267.63217);
	CreateDynamicObject(1570, 2446.44385, -1897.18848, 13.74087,   0.00000, 0.00000, 267.63217);
	CreateDynamicObject(3797, 2439.10791, -1892.62622, 13.80089,   0.00000, 0.00000, 79.26933);
	CreateDynamicObject(2035, 2445.88159, -1899.51929, 13.14080,   36.00000, -2.00000, -91.00000);
	CreateDynamicObject(2035, 2445.87158, -1900.64172, 13.14080,   36.00000, -2.00000, -91.00000);
	CreateDynamicObject(2035, 2446.18408, -1900.68372, 13.33880,   36.00000, -2.00000, -91.00000);
	CreateDynamicObject(2035, 2446.25684, -1899.56982, 13.33880,   36.00000, -2.00000, -91.00000);
	CreateDynamicObject(2035, 2446.51050, -1899.62317, 13.53680,   36.00000, -2.00000, -91.00000);
	CreateDynamicObject(2035, 2446.47363, -1900.60767, 13.53680,   36.00000, -2.00000, -91.00000);
	CreateDynamicObject(1242, 2445.88574, -1895.94934, 13.30006,   0.00000, 0.00000, 78.38548);
	CreateDynamicObject(1242, 2445.89136, -1896.33423, 13.30006,   0.00000, 0.00000, 78.38548);
	CreateDynamicObject(1242, 2445.87793, -1896.70947, 13.30006,   0.00000, 0.00000, 78.38548);
	CreateDynamicObject(1242, 2445.84741, -1897.07593, 13.30006,   0.00000, 0.00000, 78.38548);
	CreateDynamicObject(1242, 2445.82617, -1897.42456, 13.30006,   0.00000, 0.00000, 78.38548);
	CreateDynamicObject(321, 2445.04248, -1897.63245, 12.54820,   84.00000, -8.00000, 0.00000);
	CreateDynamicObject(3795, 2440.08423, -1885.55554, 12.87780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3795, 2440.14697, -1886.90442, 12.87780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1210, 2438.49585, -1890.17712, 12.67970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1210, 2438.48389, -1890.04944, 12.67970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1210, 2438.44360, -1889.92126, 12.67970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1210, 2438.45996, -1889.79419, 12.67970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1252, 2455.25806, -1892.95593, 13.19120,   89.00000, 0.00000, 17.00000);
	CreateDynamicObject(1252, 2455.72070, -1892.90332, 13.19120,   89.00000, 0.00000, 17.00000);
	CreateDynamicObject(1252, 2455.50439, -1892.02527, 13.19120,   89.00000, 0.00000, 17.00000);
	CreateDynamicObject(1252, 2454.94409, -1892.18542, 13.19120,   89.00000, 0.00000, 17.00000);
	CreateDynamicObject(1252, 2454.73291, -1893.09460, 13.19120,   89.00000, 0.00000, 17.00000);
	CreateDynamicObject(1252, 2454.51416, -1892.28870, 13.19120,   89.00000, 0.00000, 17.00000);
	CreateDynamicObject(960, 2446.53174, -1889.71448, 12.84492,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2061, 2446.87573, -1889.99353, 12.88120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2061, 2446.79932, -1889.67761, 12.88120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2061, 2446.28418, -1889.33289, 12.88120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1447, 2447.38843, -1879.76135, 13.82031,   356.85840, 0.00000, -0.08727);

return 1;
}

stock RB_AttachCarBag(v,slot) {
    new Float:x,Float:y,Float:z;
    switch(GetVehicleModel(v)) {
        case 482,459,440,413: {x=PosBolsaBurrito[slot][0];y=PosBolsaBurrito[slot][1];z=-0.14840;}
        case 554: {x=PosBolsaYosemite[slot][0];y=PosBolsaYosemite[slot][1];z=0.11660;}
        case 422: {x=PosBolsaBobCat[slot][0];y=PosBolsaBobCat[slot][1];z=0.04860;}
        default: {x=PosBolsaSadler[slot][0];y=PosBolsaSadler[slot][1];z=0.16060;}
    }
    RB_CarObjects[v][slot]=CreateDynamicObject(1550,0.0,0.0,0.0,0.0,0.0,0.0,0);
    AttachDynamicObjectToVehicle(RB_CarObjects[v][slot],v,x,y,z,0.0,0.0,0.0);return 1;
}
stock RB_CanWeapon(p,w) {
    if(PLAYER_INFO[p][j_ARMAS][GetWeaponSlot(w)]!=0) return RB_Message(p,"Guarda el arma de ese espacio antes de comprar otra."),0;
    return 1;
}
stock RB_RewardBand(band) {
    new query[220];mysql_format(handle_db,query,sizeof query,"INSERT INTO rb_blindado_bandas (banda,experiencia) VALUES (%d,8) ON DUPLICATE KEY UPDATE experiencia=experiencia+8",band);
    mysql_query(handle_db,query,false);
    if(!mysql_errno(handle_db)) foreach(new p:Player) if(PLAYER_INFO[p][pFaccion]==band) SendClientMessage(p,-1,"[Radio Banda] La banda recibio +8 de experiencia por detonar las puertas del blindado.");
    return 1;
}
