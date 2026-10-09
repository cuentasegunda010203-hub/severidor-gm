//======================================   DEFINES   ====================================//
#define		funcion%0(%1)					forward %0(%1); public %0(%1)
#define             MAX_CONNECTIONS_FROM_IP     5
#define     		MAX_DROPS_BP                 100

//========================= YOUTUBE =================================//
#define SEARCH_YT_PATH "mp3.gtazonerp.net/search"
#define DOWNLOAD_YT_PATH "mp3.gtazonerp.net/download"
#define DOWNLOADED_YT_PATH "http://mp3.gtazonerp.net/mp3/"
#define API_URL "127.0.0.1:8080" // API local pendiente de reconstruccion
//========================= YOUTUBE =================================//
#define     RangoBarrerasTren   150.0
#define     RangoSonidoPlayer   55.0
// Sistema de graffitis
#define 	MAX_PLAYER_TOYS  	4
#define     TALLER                      (9818)
#define     TALLER2                     (9819)
#define     DCAMBIAR                    (9820)
#define 	MAX_PEDIDOS 		300
#define     MAX_PCASAS          4
#define MAX_OBJETOS_CASAS  (200)
#define MAX_MUEBLES           (1000)
#define MAX_INCENDIOS              (60)
#define MAX_SPLITLENGTH 		   (124)
#define C_COLORPOLICIA   		(0x8D8DFFFF)
#define MAX_RADIO_STREAM			(500)
#define MAX_RADIO_STREAM_MIN		(250)
#define MAX_DOTS 					40
#define Dialog(                             dialogs_ShowPlayerDialog(

#define	_enPos(%2,%1,%3,%4,%5)			  	IsPlayerInRangeOfPoint(%2,%1,%3,%4,%5)
#define S_TUNNING 1534.4369,-2171.7649,13.5469
new Tipo_Notificaciones  = 1;
new Debug_Mysql = 1;
new Avion[MAX_PLAYERS];
new VBOMB[10];
new elevadorminero2,elevadorminero;
new AvisoAnticheat = 0;
new BarreraTren[36], PasoTrenBarrera[5][18];
new Text3D:CabinasTextos[5];
new AreaCabinas[6];
new godmode[MAX_PLAYERS];
new PrimerSpawnDisponible[MAX_PLAYERS];
new ExpPD = 1;
enum pi_info
{
	pi_ID,
	pi_DB,
	pi_ESTADO,
	pt_NAME[25],
	pt_TIPO[30],
	pi_TEXT[256],
	Float:pt_POS[3],
	pt_TIME
};
new PEDIDO_INFO[MAX_PEDIDOS][pi_info];
#define MAX_WORDS	100
enum ACWords
{
    palabras[32],
    used,
}
new AntiSpam[MAX_WORDS][ACWords];
new Iterator:WordSPAM<MAX_WORDS>;

enum
{
	WORK_TYPE_NONE,
	WORK_TYPE_NORMAL,
	WORK_TYPE_FAMILY,
}

//
#define MAX_RESULTS	10
#define BanPlayer false
#define NewHealthTime 1000 //change if you dont want to check new health after 1 second
#define TakenHealthTime 1000 //change if you dont want to check taken health after 1 second
#define BanHackerTime 1000 //change if you dont want to ban hacker after 1 second

#define D_INVALIDO      		   (0)
#define D_INVALIDO1      		   (9991)
#define		RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define 	SafeDialogEx(%1, PETITION_DIALOG, DIALOG_STYLE_MSGBOX, "Peticiùn", %2, "Aceptar", "Rechazar")+
#define     PETITION_DIALOG 	911
#define		MAX_CONECTADOS GetPlayerPoolSize()
#define		Ciclo(%0,%1) \
for(new %0 = 0; %0 <= %1; %0++)

#define   	MAX_OBJETOS		 	10	//no cambiar
#define        MAX_ANUNCIOS    3
#define 	RATE_INC 			(500)
#define 	RATE_MAX 			(2500)
#define 	THRESOLD_ACTION 	2
#define 	INFINITY_HEALTH 	Float:0x7F800000
#define		EstaEn    			IsPlayerInRangeOfPoint

#define     jAdminNvl			pAdmin
#define  	MAX_NPC_ROBOS       200
#define 	MAX_ARMAS           (200)
#define  	TIEMPO_CONQUISTA 	500    	//Tiempo para conquistar
#define  	PD_POR_TERRITORIO 	550 	//Dinero por cada territorio en el PD
#define  	MAX_TIEMPO_NUEVO 	120  	//Tiempo de espera de cada banda para volver a atacar
#define  	MAX_T				100
#define		DEBUG_GM   			0
#define 	TIME_RESPAWN 		(7200)
#define 	MAX_PLAYERTOYS 		4
#define 	MAX_TEXTDRAWS       2048
#define  	MAX_ACTION_Q        500
#define		MAX_REPORTS         500
#define		MAX_PROPIEDADES     4000
#define 	MAX_DOORS 			1000
#define		MAX_GARAGES         1000
#define		MAX_BANDAS			1000
#define		MAX_PRICE_MEJORAS	50
#define  	MAX_MARIHUANA       (500)
#define 	MAX_ENCARGOS 		8
#define		habilidad           51
#define  	SPEED_CONTROLS      000.1
#define 	INVALID_REPORT_ID 	-1
#define 	DH_TIPO_HOSPITAL    (1)
#define 	DH_TIPO_COMISARIA   (2)
#define 	DH_TIPO_PIZZERIA    (3)
#define 	DH_TIPO_TIENDA      (4)
#define 	DH_TIPO_BANCO       (5)
#define 	DH_TIPO_24/7        (6)
#define  	PBANDA             	2102
#define     KITSAPD             3212
#define     MCARMAS             3213
#define 	DH_TIPO_NORMAL      (7)
#define 	DH_TIPO_MINA        (8)
#define 	DH_TIPO_ESTADIO     (9)
#define     DH_TIPO_LOVE        (10)
#define     DH_TIPO_SPRAY	    (11)
#define 	SECONDS_TO_LOGIN 	60
#define     MAX_LADRONES        (9)
#define     MAX_MAFIOSOS        (5)
#define     MAX_GUARDIAS        (4)
#define     INVALID_TOY_ID 		19382
#define     _PICARROCA          (4)
#define     _LANZARARPON        (5)
#define     _FORZARCERRADURA    (6)
#define		MAX_SELECTORS       (6)
#define     Button_Close        "X"
#define     RangoSonidoPlayer   55.0
#define     MAX_CASAS_ROBO      15
#define 	DIALOG_AD			12914
#define     DSEXO               544
#define     CTELF               545
#define     TNEON               546
#define     TNEON2              547
#define		VENDERBITCOINS		548
#define     CNAMEBANDA          593
#define     ARMASSAPD           594
#define     ALQUILARV           595
#define		INVITAR				356
#define     BANDATIPO           (220)
#define     CREARPANDILLA       (221)
#define     CREARMAFIA          (222)
#define  	CRANGOBANDA        	2103
#define  	CNAMERANGOBANDA1    21041
#define  	CNAMERANGOBANDA2    21051
#define  	CNAMERANGOBANDA3    21061
#define 	CNAMERANGOBANDA4    21071
#define  	CNAMERANGOBANDA5    21081
#define  	CNAME6    			1698
#define  	CNAME7    			1699
#define  	CNAME8    			1696
#define 	Tuning 				6300
#define Verde 0x006900FF
#define Cafe 0x662F00FF
#define Negro 0x000000FF
#define Blanco 0x00000000
#define AzulOscuro 0x00008CFF
#define Celeste 0x00A2FFFF
#define Rojo 0xFF0100FF
#define Amarillo 0xFFFF00FF
#define Rosado 0xFF01FFFF
#define Verde_Agua 0x00FFC5FF
#define Morado 0x6D04C6FF
#define Gris 0x01000062
#define 	COLORWHITE1		0xFFFFFFFF
#define SendClient:					SendClientMessage
new g_small_string[256],g_big_string[4000];
#define pformat:(					g_small_string[0] = EOS,format(g_small_string,sizeof(g_small_string),						
#define psend:(%0,%1) 				_SendClientMessage(%0,%1,g_small_string)
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
/////////Autos///////
new Autot1;
new Autot2;
new Autot3;
enum Propiedades
{
	pMapIcon,
	pIDPropietario,
	pGanancias,
	pVW,
	pEnVenta,
	pEnVentaPor,
	pPrecio,
	pNivel,
	Float:pPosX,
	Float:pPosY,
	Float:pPosZ,
	Float:pPosXS,
	Float:pPosYS,
	Float:pPosZS,
	Float:pPosA,
	Float:pPosAS,
	pEnUso,
	pTipo,
	pID,
	Float:pRoperoX,
	Float:pRoperoY,
	Float:pRoperoZ,
	pRoperoAbierto,
	pAK47,
	pM4,
	pEscopetaNormal,
	pEscopetaDeCombate,
	pMP5,
	p9mm,
	p9mmSilenciada,
	pDesertEagle,
	pRifle,
	pGranada,
	pManopla,
	pPaloDeBillar,
	pCuchillo,
	pKatana,
	pPaloDeGolf,
	pBateDeBeisbol,
	pConsoladorRosa,
	pVibradorBlanco,
	pGranVibradorBlanco,
	pVibradorPlateado,
	pBaston,
	pPala,
	pFlores,
	pCamara,
	pMedicamentos,
	pMarihuana,
	pCrack,
	pLugarRopero,
	Float:pGX,
	Float:pGY,
	Float:pGZ,
	Float:pGA,
	Text3D:pLabel,
	Text3D:pLabel2,
	Text3D:pLabel3,
	Text3D:pLabel4,
	Text3D:pLabel5,
	Text3D:pLabel6,
	pPickup,
	pPropietario[40],
	pInterior,
	pInteriorID,
	pAbierta,
	pLugarHeladera,
	pSprunk,
	pCerveza,
	pAquarius,
	pPizzas,
	pVino,
	Float:pHeladeraX,
	Float:pHeladeraY,
	Float:pHeladeraZ,
	pLocalizacion[80],
	Amater,
	pEmisora,
	PuertaIT,
	Inmobiliario[MAX_OBJETOS_CASAS],
    MuebleID[MAX_OBJETOS_CASAS],
	Float:MuebleX1[MAX_OBJETOS_CASAS],
	Float:MuebleY1[MAX_OBJETOS_CASAS],
	Float:MuebleZ1[MAX_OBJETOS_CASAS],
	Float:MuebleX2[MAX_OBJETOS_CASAS],
	Float:MuebleY2[MAX_OBJETOS_CASAS],
	Float:MuebleZ2[MAX_OBJETOS_CASAS],
	ModeloMuebles[MAX_OBJETOS_CASAS],
	Puesto[MAX_OBJETOS_CASAS],
};
new PropInfo[MAX_PROPIEDADES][Propiedades];

enum dInfo {
    dID,
    dName[128],
    dOwner[MAX_PLAYER_NAME],
    dPickup,
    Float:dExitX,
    Float:dExitY,
    Float:dExitZ,
    Text3D:dLabel,
}
new DoorInfo[MAX_DOORS][dInfo];

enum
{
	CHEAT_WEAPON,
	CHEAT_AMMO,
	CHEAT_CAR_MOD,
	CHEAT_VEHICLE_SPEED_HACK,
	CHEAT_POS,
	CHEAT_TEXT_SPAMMER,
	CHEAT_COMMAND_SPAMMER,
	CHEAT_DEATH_SPAMMER,
	CHEAT_STATE_SPAMMER,
	CHEAT_VEHICLE_ENTER_SPAMMER,
	CHEAT_JETPACK,
	CHEAT_PLAYER_SPEED,
	CHEAT_PLAYER_HEALTH,
	CHEAT_PLAYER_ARMOUR,
	CHEAT_VEHICLE_HEALTH,
	CHEAT_PLAYER_VEHICLE_WORK, //Entra a un vehiculo que no es de su trabajo
	CHEAT_PLAYER_VEHICLE_DOORS,
	CHEAT_VEHICLE_NOFUEL,
	CHEAT_SPECTATE,
	CHEAT_UNDETECTED_WEAPON,
	CHEAT_DRIVE_BY,
	CHEAT_UNOCCUPIED_VEHICLE_TP,
	CHEAT_HIGH_POS,
	CHEAT_CAR_JACKING,
	CHEAT_FAKE_TRAILER_SYNC,
	CHEAT_DESTROY_VEHICLE,
	CHEAT_CBUG,
	CHEAT_AFKPOS
}

enum e_ac_Info
{
	ac_Name[24],
	bool:ac_Enabled,
	bool:ac_Kick, // 1 = kickea, 0 = avisa a admins
	ac_Detections, //enviar aviso cuando llege a este num en los seg de abajo
	ac_Interval,
}
new ac_Info[][e_ac_Info] = /* Valores por defecto si no se carga de AC.txt */
{
	{"armas",					true, true,		1, 0},
	{"municion",				true, true,		1, 0},
	{"mod car",					true, true,		1, 0},
	{"vehicle speed",			true, true,		1, 0},
	{"pos",						true, false,	3, 10},
	{"text spammer",			true, true,		10, 5},
	{"command spammer",			true, true,		5, 5},
	{"death spammer",			true, false,	1, 0},
	{"state change spammer",	true, false,	1, 0},
	{"vehicle enter spammer",	true, false,	1, 0},
	{"jetpack",					true, true,		1, 0},
	{"player speed",			true, true,		1, 0},
	{"player health",			true, true,		1, 0},
	{"player armour",			true, true,		1, 0},
	{"vehicle health",			true, true,		1, 0},
	{"pwork != vwork",			true, true,		1, 0},
	{"enter closed vehicle",	true, false,	1, 0},
	{"vehicle nofuel cs",		true, false,	50, 10},
	{"player spectate",			true, false,	1, 0},
	{"pweapon != sweapon",		true, false,	1, 0},
	{"drive by",				true, false,	1, 0},
	{"unoccupied veh tp",		true, true,		1, 0},
	{"high pos",				true, true,		1, 0},
	{"car jacking",				true, true,		1, 0},
	{"fake trailer sync",		true, true,		1, 0},
	{"destroy vehicle",			true, false,	1, 0},
	{"cbug",					true, false,	1, 0},
	{"afk pos",					true, true,		1, 0}
};

enum e_PLAYER_AC_INFO
{
	p_ac_info_DETECTIONS,
	p_ac_info_LAST_DETECTION,
	p_ac_info_IMMUNITY, //gettime + seconds
}
new PLAYER_AC_INFO[MAX_PLAYERS][sizeof(ac_Info)][e_PLAYER_AC_INFO];
//==================================   CONFIGURACION   ==================================//


#define SERVER_NAME ""SERVER_NAME2" Roleplay"
#define SERVER_NAME2 "Nexus"
#define DIALOG_CAPTION	"{DBED15}"SERVER_NAME2""
#define SERVER_NAME3 ""SERVER_COIN2":RP"
#define RCON_PSSWRD "CONFIGURADO_EN_SERVER_CFG"
#define SERVER_VERSION "1.52"
#define SERVER_NUMBER "1"
#define PREFIX_DB "smf_"
//===================================     MONEDA     ====================================//
#define SERVER_COIN "GZ"
#define SERVER_COIN2 "GZ"
#define SERVER_COIN3 "gz"
//===================================    SONIDOS     ====================================//
#define AUDIO_BALDE "sonidos.gtazonerp.net/AguaBalde.mp3"
#define AUDIO_REGAR "sonidos.gtazonerp.net/Agua.mp3"
#define AUDIO_CORTAR "sonidos.gtazonerp.net/Cortar.mp3"
#define AUDIO_BOMBA "sonidos.gtazonerp.net/Explosion.mp3"
#define AUDIO_HALLOWEEN "sonidos.gtazonerp.net/HalloweenC.mp3"
#define AUDIO_LOGRO "sonidos.gtazonerp.net/Logro.mp3"
#define AUDIO_DESTORNILLADOR "sonidos.gtazonerp.net/Destornillador.mp3"
#define AUDIO_CAMPANAS "sonidos.gtazonerp.net/Campanas.mp3"
#define AUDIO_BARRETA "sonidos.gtazonerp.net/Barreta.mp3"
#define AUDIO_ARPON "sonidos.gtazonerp.net/Arpon.mp3"
#define AUDIO_MINERO "sonidos.gtazonerp.net/Minero.mp3"
#define AUDIO_ALARMA "sonidos.gtazonerp.net/Alarma.mp3"
#define AUDIO_GOLPES "sonidos.gtazonerp.net/Golpes.mp3"
#define AUDIO_MISION "sonidos.gtazonerp.net/Sonido-Mision.mp3"
#define AUDIO_BOVEDA "sonidos.gtazonerp.net/Boveda.mp3"
#define AUDIO_SIRENA "sonidos.gtazonerp.net/Sirena.mp3"
#define WEB_ROL "rol.gtazonerp.net"
#define WEB_LOGEO "ROL.GTAZONERP.NET"
#define WEB_INDEX "rol.gtazonerp.net"
#define MAILER_MAIL "sistema@GTAzonerp.net"
#define WEB_INDEX2 "Nexus - Servidor Roleplay"
#define WEB_SONIDOS "rol.gtazonerp.net/Sonidos"
#define WEB_RADIO "radio.gtazonerp.net"
#define NAME "(ESP)ïNexus RolePlay"
#define NAME_LARGO "Nexus"
#define DISCORD "discord.gtazonerp.net"
#define WWW_WEB "www.GTAZoneRP.net"
#define PASS_SERVER "tester"
#define DESCRIPCION "ï Android*PC ï"
#define IP_SERVER "sv.gtazonerp.net"
//Nuevo sistema de STATS
#define S_COINS 50
#define S_MEDIS 500
#define S_CRACK 500
#define S_LSD	300
#define S_KP	300
#define S_DINERO 100000
#define S_MONEDAS 50
#define S_GPS 	  1
#define S_NIVEL   4
#define S_BOTIQUINES 10
#define S_LEGOS 1000
#define S_PATINES 0


//Niveles de trabajos
#define S_N_CAMIONERO 		1
#define S_N_ARMERO 		6
#define S_N_BASURERO	1
#define S_N_LADRON		1
#define GPS_COLOR 0xfb7701FF

// Definitions
enum E_SERVER_RULE_FLAGS (<<= 1)
{
	CON_VARFLAG_DEBUG = 1,
	CON_VARFLAG_READONLY,
	CON_VARFLAG_RULE,
	CON_VARFLAG_UNREMOVABLE
}
enum _InfoAnuncioEx
{
	Text:TDAnuncio,
	Anuncio[128]
}
new _InfoAnuncio[MAX_ANUNCIOS][_InfoAnuncioEx];
#if !defined IsValidVehicle
    native IsValidVehicle(vehicleid);
#endif


#define isAcceptedDBWeapon(%1) ((%1 >= 29 && %1 <= 31) || %1 == 22 || %1 == 25)
#if !defined isnull
#define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif
#if !defined pb_percent
#define pb_percent(%1,%2,%3,%4) ((%1 - 6.0) + ((((%1 + 6.0 + %2 - 2.0) - %1) / %3) * %4))
#endif
#define strLower(%0) static i, e; i = 0, e = strlen(%0); for( ; i != e; ++i) %0[i] |= (1 << 5)
//===================================    COLORES     ====================================//
#define 	COLOR_GM 			"fd7b39"
#define		COLOR_GAMEMODE		0xfd7b39FF
#define 	COLOR_NARANJA		0xff9c00FF
#define     COLOR_SERVER        0xa9c4e4cc
#define     COLOR_CHEAT         0xa9c4e4cc
#define 	COLOR_SEIS 			0x000000FF
#define COLOR_LIGHTRED 0xFF6347AA
#define 	COLORCARGO0         0xFFFFFF00
#define 	INVISIBLE2     		(0xFFFFFF00)
#define 	COLORCARGO1         0xFFFDBAFF
#define 	COLORCARGO2         0xFFC600FF
#define 	COLORCARGO3         0xFFA200FF
#define 	COLORCARGO4         0xFF8400FF
#define 	COLORCARGO5         0xFF5A00FF
#define 	COLORCARGO6         0xFF1E00FF
#define 	COLORCARGO7         0x00FF00FF
#define 	COLORABATIDO        0x00FF3BFF
#define     COLOR_SAMP          0xafc0d3FF
#define 	COLOR_ACCIONES    	0x33CC99FF
#define 	COLOR_WHITE         0xFFFFFF00
#define 	COLOR_BLANCO        0xFFFFFF00
#define 	COLOR_MEGAPHONE 	0x3399FF00
#define     COLOR_MILITAR       0x3A1B0B00
#define 	COLOR_BOMBERO		0xb6413e00
#define 	COLOR_BOMBEROREF	0xb6413eFF
#define     COLOR_MILITARREF    0x3A1B0BFF
#define 	COLOR_POLICIA       0x3399FF00
#define 	COLOR_POLICIAREF    0x3399FFFF
#define		COLOR_GRAD1 		0xB4B5B7FF
#define 	COLOR_GRAD2         0xBFC0C2FF
#define 	COLOR_GRAD3 		0xCBCCCEFF
#define 	COLOR_GRAD4 		0xD8D8D8FF
#define 	COLOR_GRAD5 		0xE3E3E3FF
#define 	COLOR_GRAD6 		0xF0F0F0FF
#define		c0_color			0xFFFFFF00
#define		c1_color			0xFFFDBAFF
#define		c2_color			0xFFC600FF
#define		c3_color			0xFFA200FF
#define 	COLOR_GREY 			0xAFAFAFAA
#define 	COLOR_LIGHTBLUE 	0x33CCFFAA
#define		c4_color			0xFF8400FF
#define		c5_color			0xFF5A00FF
#define		c6_color			0xFF1E00FF
#define		c7_color			0x00FF00FF
#define     COLOR_COMBATE       0xAFAFAFAA
#define 	COLOR_ORANGE 		0xFF7F00FF
#define 	COLOR_TEAL 			0x00AAAAAA
#define 	COLOR_OFFWHITE 		0xF5DEB3AA
#define		COLOR_DARKAQUA 		0x83BFBFAA
#define 	COLOR_PURPLE 		0xC2A2DAAA
#define 	COLOR_GREEN3        0x9EC73D00
#define 	TEAM_BLUE_COLOR 	0x3399FF00
#define 	COLOR_FADE1 		0xE6E6E6E6
#define 	COLOR_FADE2 		0xC8C8C8C8
#define 	COLOR_FADE3 		0xAAAAAAAA
#define 	COLOR_FADE4 		0x8C8C8C8C
#define 	COLOR_FADE5 		0x6E6E6E6E
#define 	COLOR_GREY          0xAFAFAFAA
#define 	COLOR_DORADO		0xdabb3eFF
#define 	COLOR_YELLOW        0xDBED15FF
#define		COLOR_AMARILLO      0xFFFF00FF
#define 	COLOR_ROJO 			0xEB0000FF
#define 	Hablar              0xE6E6E6E6
#define 	Hablar2             0xC8C8C8C8
#define 	Hablar3             0xAAAAAAAA
#define 	Hablar4             0x8C8C8C8C
#define 	Hablar5             0x6E6E6E6E
#define 	CHAT                0xE6E6E6E6
#define 	CHAT2               0xC8C8C8C8
#define 	CHAT3               0xAAAAAAAA
#define 	CHAT4               0x8C8C8C8C
#define 	CHAT5               0x6E6E6E6E
#define		COLOR_AZUL          0x00FAFFFF
#define 	COLOR_MUTE	        0xAA3333AA
#define 	DEFAULT_COLOR       0xFFFFFF00
#define		COLOR_VERDE2		0x00FF00FF
#define		COLOR_RED           0xEE0000FF
#define 	COLOR_AMARILLO2     0xF4FA58FF
#define 	COLOR_VERDECLARO    0x63C000FF
//===================================    MACROS     =====================================//
#define 	GetVehicleName(%0) 	NombreAuto[GetVehicleModel(%0)-400]
#define		segundos(%0) 		(1000 * %0)
#define  	minutos(%0) 		(1000 * %0 * 60)
#define		horas(%0) 			(1000 * %0 * 60 * 60)
#define		PlayerToPoint(%1,%2,%3,%4,%5)  	IsPlayerInRangeOfPoint(%2,%1,%3,%4,%5)
#define		function%0(%1)					forward %0(%1); public %0(%1)
#define 	GetDynamicObjectModel(%0) Streamer_GetIntData(STREAMER_TYPE_OBJECT, %0, E_STREAMER_MODEL_ID)
#define     MAX_COP_OBJECTS     (300)
#define     COPOBJECTS_DIALOG   (6450)
#define SINRETORNO 17091
#define MAX_LABELS_FABRICA 32
#define MAX_ACTORS_FABRICA 12
#define MAX_FABRICAS 13
#define	MAX_MERCADOS 1000
#define MAX_GASOLINERAS 64
//============ Sistema Bomba ================== //
#define COLOR_BAR_1 0xD9D9D9FF //Blanco
#define COLOR_BAR_2 0xB71700FF //Rojo
#define MAX_BOMBA (1)
#define ID_BOMBA (1654)
#define TIMER_BOOM (30)
#define COSTO_BOMBA (50000)
//============================================//
// 	-= Estado =-
new AntiLagLS = 0;
new RecogeArmas[MAX_PLAYERS];
new Tirando_Recogiendo[MAX_PLAYERS];
new Text:EntrarTD;
new Text:ArmasTD[11];
new Text:InventarioTD[11];
new PasswordADMIN[15] = "@lzrp@.$";
new DropBackPack[MAX_DROPS_BP], TimeDrop[MAX_DROPS_BP];
new ALM_List[MAX_PLAYERS][15], ALM_Slot[MAX_PLAYERS], ALM_Sel[MAX_PLAYERS];
new spam[][] =
{
	"BrightSun","zone","omegazone","tails","tailszone","danova","delux zone","fenixzone","alpha zone","omegazone","legendzone","viper","sobeit","sobiet","s0beit","s0b31t","s0b3it","s0b1et","s0b13t","dox","wearelegal",
	"discordapp.com","discord.gg","invite.gg","/dox/","delux","discord","discord.com",".gg","whatsapp","Parzival","Parzival"
};
new LOG_DC = 0;
new spam2[][] = {"alphazone",".es","oz","fz","dz","vz","f z",".com","delux"};
//
new VEHICLE_GRUA[MAX_PLAYERS];
//
enum MI
{
	Creado,
	IDMaria,
	Seg,
	Min,
	Hor,
	Float:pX,
	Float:pY,
	Float:pZ,
	Plantador[24],
	State,
	Text3D:Label,
	TimerMaria,
	ObjetoID
};
new MariInfo[MAX_MARIHUANA][MI];

enum E_PLAYER_TEXTDRAW
{
	PlayerText:ptextdraw_SHOP_BUTTONS[5],
	PlayerText:ptextdraw_SHOP_ARTICLES_PAGE,
	PlayerText:ptextdraw_SHOP_ARTICLES_MODEL[6],
	PlayerText:ptextdraw_SHOP_ARTICLES_PRICE[6],
	PlayerText:ptextdraw_SHOP_ARTICLE_NUMBER,
	PlayerText:ptextdraw_SHOP_ARTICLE_INFO,
	PlayerText:ptextdraw_SHOP_ARTICLE_MODELID,
	PlayerText:ptextdraw_TUNING_SHOP,
	PlayerText:ptextdraw_MESSAGE,
	PlayerText:ptextdraw_HUD[3]
};

new PlayerTextdraws[MAX_PLAYERS][E_PLAYER_TEXTDRAW];
/*enum LabelsPlayer
{
	Text3D:LbID,
	LbPos[3],
	LbValid
};
new PLAYER_LABELS[MAX_LABELS_PLAYERS][LabelsPlayer];
*/
enum i_gaso
{
    ORM:ORM_ID,
    gaID,
    gDuenoID,
    gPrecio,
	gPrecioL,
    gNivel,
    gGasolina,
    gMaxGasolina,
    gEnUso,
	gGanancias,
    gaNombre[MAX_PLAYER_NAME+1],
    Float:Posss[4],
	Float:Poss2[4],
    Text3D:gTexto,
    Text3D:gTextoCompra,
    gPickup,
};
new Gasolineras[MAX_GASOLINERAS][i_gaso];

enum
{
	ADMIN_LVL_USER = 0,
	ADMIN_LVL_AYUDANTE,
	ADMIN_LVL_DUDAS,
	ADMIN_LVL_JUEGO1,
	ADMIN_LVL_JUEGO2,
	ADMIN_LVL_GLOBAL1,
	ADMIN_LVL_GLOBAL2,
	ADMIN_LVL_SUBDUE,
	ADMIN_LVL_ADM
}

#define MAX_POLICE_OBJECTS	300
enum enum_POLICE_OBJECTS
{
	bool:police_object_VALID,
	police_object_USER[24],
	police_object_OBJECT_ID
};
new POLICE_OBJECTS[MAX_POLICE_OBJECTS][enum_POLICE_OBJECTS];
//
//

//TextDraw Login
new COLOR_ARMA[MAX_PLAYERS];
new iWeaponTints[6] = {
    0xFF4B5320, // Army
    0xFF9EAF43, // Green
    0xFFFFAE1A, // Orange
    0xFF0073E6, // LSPD
    0xFFFF1493, // Pink
    0xFFFFD700 // Gold
};
new pCurrentWeapon[MAX_PLAYERS];

enum ptInfo
{
	pt_ID,
    pt_MODEL_ID,
	pt_BONE,
	bool:pt_ATTACHED,
	Float:pt_POS[3],
	Float:pt_ROT[3],
	Float:pt_SCALE[3],
	player_toy_COLOR_1,
	player_toy_COLOR_2
};
new PLAYER_TOYS[MAX_PLAYERS][MAX_PLAYER_TOYS][ptInfo];
enum yt_result
{
	videoID[11 + 1],
	yt_title[100 + 1],
}
new RESULT_YOUTUBE[MAX_RESULTS][yt_result],
	PLAYER_DIALOG_MP3_RESULT[MAX_PLAYERS][MAX_RESULTS][yt_result];

new Float:FCSPAWN[30][4] =
{
	{199.1747,1459.5541,1089.1055,180.0000},{195.1056,1459.3986,1089.1055,180.0000},{190.7936,1459.7858,1089.1055,180.0000},{187.0855,1459.4928,1089.1055,180.0000},{183.4470,1459.5338,1089.1055,180.0000},{179.6088,1459.3896,1089.1055,180.0000},{175.6575,1459.4519,1089.1055,180.0000},{199.0618,1439.0070,1089.1055,0.0000},{195.0666,1439.3788,1089.1055,0.0000},{191.5202,1439.1429,1089.1055,0.0000},{187.3893,1439.7242,1089.1055,0.0000},{183.3691,1439.5751,1089.1055,0.0000},{179.7219,1439.6594,1089.1055,0.0000},{175.5549,1439.4552,1089.1055,0.0000},{198.9114,1459.6091,1084.8462,180.0000},{194.9099,1460.5367,1084.8462,180.0000},{191.0115,1460.5378,1084.8462,180.0000},{187.3833,1460.6614,1084.8462,180.0000},{183.5765,1460.1118,1084.8462,180.0000},{179.5950,1459.6536,1084.8462,180.0000},{175.8583,1460.5348,1084.8462,180.0000},{172.0326,1460.0111,1084.8462,180.0000},{171.9444,1438.8562,1084.8462,0.0000},{175.6630,1438.8634,1084.8462,0.0000},{179.4310,1438.5083,1084.8462,0.0000},{183.5618,1438.8528,1084.8462,0.0000},{187.3934,1438.2661,1084.8462,0.0000},{191.3599,1438.7249,1084.8462,0.0000},{195.1422,1439.3063,1084.8462,0.0000},{199.2997,1439.0018,1084.8462,0.0000}
};

new activocanal = 0;


enum GRUA_P
{
	Tipo,
	ID_VEH,

}
new TimerTxtMarcelo;
new INFO_GRUA[MAX_PLAYERS][GRUA_P];
new LocalizarID[MAX_PLAYERS][10];

new AdminDuty[MAX_PLAYERS];
new TintaApasata[MAX_PLAYERS];
#define EMISORA_URL "radio.linoxzone.net:8000/listen.pls"
new ListaAdmins[MAX_PLAYERS][30],DB_SELECT[MAX_PLAYERS];
new AnuncioTipo[MAX_PLAYERS];
new AnuncioTexto[MAX_PLAYERS][128];
new AnuncioTextoVivo[MAX_PLAYERS][128];
new Text:FondoInv[13],PlayerText:FondoInvP[8][MAX_PLAYERS],ViendoINV[MAX_PLAYERS];
new Text:MapaInv;
#define NA 4

new ViendoCajas[MAX_PLAYERS];
new RecienRegistrado[MAX_PLAYERS];
new TimerWeapons[MAX_PLAYERS];

#define MAX_VEH_FAC  (5)
enum vfac
{
	vVehicleID,
	vFaccID,
	vSlot,
	vfFuel,
	bool:vfSeguro,
	vfSlot,
	vfBaul[11],
	vfPatente[10],
	Float:vfEstacionado[4],
	vfEstVW,
	vfEstINT,
}
new VehicleFacData[MAX_VEHICLES][vfac];
new actbomb;
new actbomb2;
new distribuidor;
new distribuidor2;
new BeerActor[14];
new BeerActorTime[6];
new MapasFiestaCerveza[71];
new actor_tiendadp;
new target1;
new TEX_CV[11], CV_ACTIVATE = 0, EVENTO_DM, AUTORIZED_POLICE_OBJECT_ID = 0;
new objetos = mS_INVALID_LISTID;
new comprarmuebles = mS_INVALID_LISTID;
new RopaHombreBZ = mS_INVALID_LISTID, RopaMujerBZ = mS_INVALID_LISTID, Helrp = mS_INVALID_LISTID, Motosrp = mS_INVALID_LISTID, vehrp = mS_INVALID_LISTID, barp = mS_INVALID_LISTID,RopaHombre = mS_INVALID_LISTID, RopaMujer = mS_INVALID_LISTID;
new NombreArmas[47][] =
{
	"puùo","brass knuckles","golf club","nitestick","knife","baseball bat","shovel","palo de billar","katana","chainsaw","purple dildo","small white vibrator","large white vibrator","silver vibrator",
	"bouquet of flowers","cane","grenade","tear gas grenade","molotov cocktail","jetpack"," "," ","Colt .45","silenced Colt .45","Desert Eagle","12-gauge shotgun","sawn-off shotgun","SPAS-12",
	"Micro Uzi","MP5","AK-47","M4A1","TEC-9","rifle","sniper rifle","rocket launcher","heatseeker","flamethrower","minigun","satchel charge","detonator","spray can","fire extinguisher",
	"camera","nightvision goggles", "thermal goggles","parachute"
};
new TrailerTruck2[MAX_PLAYERS];
new TrailerTruck[MAX_PLAYERS];
new rtatrucker[MAX_PLAYERS];
new QueSlot[MAX_PLAYERS];
new VenderA[MAX_PLAYERS];
new Retador[MAX_PLAYERS];
new EnCuantoLoVende[MAX_PLAYERS];
new AutosMilitar[MAX_VEHICLES];
new TRENES[MAX_VEHICLES];
new AutosTrailers[MAX_VEHICLES];
new Autos_Sultans[MAX_VEHICLES];
new Autos_Apsa[MAX_VEHICLES];
new Militar[18];
new Traileros[6];
new Sultan_V[6];
new Apsa_V[6];
new AutosTriatlon[MAX_VEHICLES];
new Triatlon[51];
new bool:ValidVeh[MAX_VEHICLES];
new carEnterTime[MAX_PLAYERS];

//==================================== Sistema de baul para patrullas ===================================//
#define MAX_ARMAS_P 12
enum Patrullas{
	M4,
	EDC,
	DK,
	SNIPER,
	PaloPolicia
}
new BaulPatrullas[MAX_VEHICLES][Patrullas];
// =================================== Sistema de tirar armas By Black ================================== //
enum ArmaO{
	Float:Objeto_xyz[9],
	Objeto_id[3],
	Objeto_Info[4],
	Text3D:LabelObject[3],
	oWorld[3]
}
new ArmaObjeto[MAX_ARMAS][ArmaO];
//new ReduceTimeb [MAX_PLAYERS];
new GunObjects[47][0] = { // [Objetos armas Borrar]
    {0}, // Emty
    {331}, // Brass Knuckles
    {333}, // Golf Club
	{334}, // Nitestick
    {335}, // Knife
    {336}, // Baseball Bat
    {337}, // Showel
    {338}, // Pool Cue
    {339}, // Katana
    {341}, // Chainsaw
    {321}, // Purple Dildo
    {322}, // Small White Dildo
    {323}, // Long White Dildo
    {324}, // Vibrator
    {325}, // Flowers
    {326}, // Cane
    {342}, // Grenade
    {343}, // Tear Gas
    {344}, // Molotov
    {0},
    {0},
    {0},
    {346}, // Glock
    {347}, // Silenced Colt
    {348}, // Desert Eagle
    {349}, // Shotgun
    {350}, // Sawn Off
    {351}, // Combat Shotgun
    {352}, // Micro UZI
    {353}, // MP5
    {355}, // AK47
    {356}, // M4
    {372}, // Tec9
    {357}, // Rifle
    {358}, // Sniper Rifle
    {0}, // Rocket Launcher
    {0},
    {361}, // Flamethrower
    {0},
    {363}, // Detonator
    {364}, // Detonator Button
    {365}, // Spraycan
    {366}, // Fire Extinguisher
    {367}, // Camera
    {0},
    {368}, // Infrared Vision
    {371}// Parachute
};
// =================================== Sistema de Anti-Cbug by Black ================================== //
#define MAX_SLOTS 48
new NotMoving[MAX_PLAYERS];
new WeaponID[MAX_PLAYERS];
new CheckCrouch[MAX_PLAYERS];
new Ammo[MAX_PLAYERS][MAX_SLOTS];

new Text:DineroB[MAX_PLAYERS];
new YaEstaAbierta[40];
new EmisoraEscuchando[MAX_VEHICLES];
new Text3D:veicolo_callsign_testo[MAX_VEHICLES];
new veicolo_callsign_status[MAX_VEHICLES];
new Text:Territorio_TD[2];
//Callsign-------------
new EstadoAD[MAX_PLAYERS];
new militarhombre = mS_INVALID_LISTID;
new militarmujer = mS_INVALID_LISTID;
new policiahombre = mS_INVALID_LISTID;
new policiamujer = mS_INVALID_LISTID;
new bomberohombre = mS_INVALID_LISTID;
new bomberomujer = mS_INVALID_LISTID;
new PidioRefuerzos[MAX_PLAYERS];
new DIALOG_CREATE_CREW_COLOR_String[4200];


// Setup a custom type that holds all data about a location on the map (used for missions)
enum TLocation
{
	LocationName[50], // The name of the location
	Float:LocX, // The X-position of the location
	Float:LocY, // The Y-position of the location
	Float:LocZ // The Z-position of the location
}

new ALocations[][TLocation] =
{
	// LocationName, LocationX, LocationY, LocationZ
	{"Dummy location", 0.0, 0.0, 0.0}, // Location 0 = dummy location (never used)
	{"SF Construction Site", -2083.0, 209.0, 35.5}, // Location 2
	{"LV Construction Site", 2708.0, 878.0, 10.0}, // Location 3
	{"Monte Chilliad", -2320.3762, -1646.2222, 485.7523}, // Location 10
	{"Easter Bay Lumberyard", -763.5, -136.0, 65.7}, // Location 13
	{"LV Freight Depot", 599.5, 1224.75, 11.8}, // Location 18
	{"Sleepy ville (ferry)", 8685.03, -1800.60,   86.52}, // Location 19
	{"LV Industrial Estate", 1635.75, 750.5, 11.0}, // Location 20
	{"SF Hill Farm", -1423.5, -1469.0, 101.7}, // Location 22
	{"SF Xoomer Gas Station", -1659.0, 444.0, 7.2}, // Location 28
	{"SF Gas Station", -2421.5, 953.25, 45.3}, // Location 29
	{"LS Going Station", 1926.0, -1791.5, 13.5}, // Location 30
	{"Xoomer Gas Station", -1488.75, 1875.25, 32.7}, // Location 31
	{"Whetstone Gas Station", -1629.0, -2700.0, 48.6}, // Location 32
	{"Dilimore Gas Station", 664.5, -583.75, 16.4}, // Location 34
	{"Abandoned Airport Fuel", 387.9, 2590.25, 16.5}, // Location 35
	{"San Fierro International", -1152.25, -146.5, 14.2}, // Location 36
	{"Easter Bay Chemical", -1032.17, -653.68,   32.04}, // Location 37
	{"Sleepy ville (ferry)", 8685.03, -1800.60,   86.52}, // Location 39
	{"Sleepy ville (ferry)", 8685.03, -1800.60,   86.52}, // Location 40
	{"Sleepy ville (ferry)", 8685.03, -1800.60,   86.52}, // Location 41
	{"Bayside Boatyard", -2430.75, 2310.5, 5.0}, // Location 42
	{"Sleepy ville (ferry)", 8685.03, -1800.60,   86.52} // Location 43


};

new CanalAnuncios[MAX_PLAYERS];
new BloquearAnuncio[MAX_PLAYERS] = 0;
enum    _:e_object_types
{
	OBJECT_TYPE_ROADBLOCK,
	OBJECT_TYPE_SIGN,
	OBJECT_TYPE_POLICELINE,
	OBJECT_TYPE_SPIKE
}

new PlayerText:Textdraw0[MAX_PLAYERS];
enum nNeon
{
 	TieneNeon,
	neon0,
	neon1,
	neon2,
	neon3,
 	NeonPrendido
};
new Neon[MAX_VEHICLES][nNeon];
#define MAX_SLOTS_BAUL 10
enum VarVeh
{
	vvID,
	BDvID,
	PropID,
	Motor,
	Aceleracion,
	EstAceleracion,
	Float:VidaVeh,
	Float:vPos[4],
	Patente[32],
	Color[2],
	Multa,
	FaccMulta,
	AgMulta,
	MSlot[MAX_SLOTS_BAUL],
	vModel,
	vWorld,
	vInt,
	vLlaves[10],
	vPrecio,
	vMoneda,
	vTraba,
	vFaccion,
	vRango,
	vFuel
};
new Veh_Data[MAX_VEHICLES][VarVeh];

/*new CarColHex[256] =
{
	// The existing colours from San Andreas
	0xF5F5F5FF, 0xF5F5F5FF, 0x2A77A1FF, 0x840410FF, 0x263739FF, 0x86446EFF, 0xD78E10FF, 0x4C75B7FF, 0xBDBEC6FF, 0x5E7072FF,
	0x46597AFF, 0x656A79FF, 0x5D7E8DFF, 0x58595AFF, 0xD6DAD6FF, 0x9CA1A3FF, 0x335F3FFF, 0x730E1AFF, 0x7B0A2AFF, 0x9F9D94FF,
	0x3B4E78FF, 0x732E3EFF, 0x691E3BFF, 0x96918CFF, 0x515459FF, 0x3F3E45FF, 0xA5A9A7FF, 0x635C5AFF, 0x3D4A68FF, 0x979592FF,
	0x421F21FF, 0x5F272BFF, 0x8494ABFF, 0x767B7CFF, 0x646464FF, 0x5A5752FF, 0x252527FF, 0x2D3A35FF, 0x93A396FF, 0x6D7A88FF,
	0x221918FF, 0x6F675FFF, 0x7C1C2AFF, 0x5F0A15FF, 0x193826FF, 0x5D1B20FF, 0x9D9872FF, 0x7A7560FF, 0x989586FF, 0xADB0B0FF,
	0x848988FF, 0x304F45FF, 0x4D6268FF, 0x162248FF, 0x272F4BFF, 0x7D6256FF, 0x9EA4ABFF, 0x9C8D71FF, 0x6D1822FF, 0x4E6881FF,
	0x9C9C98FF, 0x917347FF, 0x661C26FF, 0x949D9FFF, 0xA4A7A5FF, 0x8E8C46FF, 0x341A1EFF, 0x6A7A8CFF, 0xAAAD8EFF, 0xAB988FFF,
	0x851F2EFF, 0x6F8297FF, 0x585853FF, 0x9AA790FF, 0x601A23FF, 0x20202CFF, 0xA4A096FF, 0xAA9D84FF, 0x78222BFF, 0x0E316DFF,
	0x722A3FFF, 0x7B715EFF, 0x741D28FF, 0x1E2E32FF, 0x4D322FFF, 0x7C1B44FF, 0x2E5B20FF, 0x395A83FF, 0x6D2837FF, 0xA7A28FFF,
	0xAFB1B1FF, 0x364155FF, 0x6D6C6EFF, 0x0F6A89FF, 0x204B6BFF, 0x2B3E57FF, 0x9B9F9DFF, 0x6C8495FF, 0x4D8495FF, 0xAE9B7FFF,
	0x406C8FFF, 0x1F253BFF, 0xAB9276FF, 0x134573FF, 0x96816CFF, 0x64686AFF, 0x105082FF, 0xA19983FF, 0x385694FF, 0x525661FF,
	0x7F6956FF, 0x8C929AFF, 0x596E87FF, 0x473532FF, 0x44624FFF, 0x730A27FF, 0x223457FF, 0x640D1BFF, 0xA3ADC6FF, 0x695853FF,
	0x9B8B80FF, 0x620B1CFF, 0x5B5D5EFF, 0x624428FF, 0x731827FF, 0x1B376DFF, 0xEC6AAEFF, 0x000000FF,
	// SA-MP extended colours (0.3x)
	0x177517FF, 0x210606FF, 0x125478FF, 0x452A0DFF, 0x571E1EFF, 0x010701FF, 0x25225AFF, 0x2C89AAFF, 0x8A4DBDFF, 0x35963AFF,
	0xB7B7B7FF, 0x464C8DFF, 0x84888CFF, 0x817867FF, 0x817A26FF, 0x6A506FFF, 0x583E6FFF, 0x8CB972FF, 0x824F78FF, 0x6D276AFF,
	0x1E1D13FF, 0x1E1306FF, 0x1F2518FF, 0x2C4531FF, 0x1E4C99FF, 0x2E5F43FF, 0x1E9948FF, 0x1E9999FF, 0x999976FF, 0x7C8499FF,
	0x992E1EFF, 0x2C1E08FF, 0x142407FF, 0x993E4DFF, 0x1E4C99FF, 0x198181FF, 0x1A292AFF, 0x16616FFF, 0x1B6687FF, 0x6C3F99FF,
	0x481A0EFF, 0x7A7399FF, 0x746D99FF, 0x53387EFF, 0x222407FF, 0x3E190CFF, 0x46210EFF, 0x991E1EFF, 0x8D4C8DFF, 0x805B80FF,
	0x7B3E7EFF, 0x3C1737FF, 0x733517FF, 0x781818FF, 0x83341AFF, 0x8E2F1CFF, 0x7E3E53FF, 0x7C6D7CFF, 0x020C02FF, 0x072407FF,
	0x163012FF, 0x16301BFF, 0x642B4FFF, 0x368452FF, 0x999590FF, 0x818D96FF, 0x99991EFF, 0x7F994CFF, 0x839292FF, 0x788222FF,
	0x2B3C99FF, 0x3A3A0BFF, 0x8A794EFF, 0x0E1F49FF, 0x15371CFF, 0x15273AFF, 0x375775FF, 0x060820FF, 0x071326FF, 0x20394BFF,
	0x2C5089FF, 0x15426CFF, 0x103250FF, 0x241663FF, 0x692015FF, 0x8C8D94FF, 0x516013FF, 0x090F02FF, 0x8C573AFF, 0x52888EFF,
	0x995C52FF, 0x99581EFF, 0x993A63FF, 0x998F4EFF, 0x99311EFF, 0x0D1842FF, 0x521E1EFF, 0x42420DFF, 0x4C991EFF, 0x082A1DFF,
	0x96821DFF, 0x197F19FF, 0x3B141FFF, 0x745217FF, 0x893F8DFF, 0x7E1A6CFF, 0x0B370BFF, 0x27450DFF, 0x071F24FF, 0x784573FF,
	0x8A653AFF, 0x732617FF, 0x319490FF, 0x56941DFF, 0x59163DFF, 0x1B8A2FFF, 0x38160BFF, 0x041804FF, 0x355D8EFF, 0x2E3F5BFF,
	0x561A28FF, 0x4E0E27FF, 0x706C67FF, 0x3B3E42FF, 0x2E2D33FF, 0x7B7E7DFF, 0x4A4442FF, 0x28344EFF
};*/

enum TerriInfo
{
	bool:Territorio_Valido,
	Territorio_ID,
	Territorio_Banda,
	Territorio_Lugar[32],
	bool:Territorio_Usado,
	Territorio_BandaID,
	Territorio_BandaID2,
	Territorio_Color,
	Float:Territorio_MinX,
	Float:Territorio_MinY,
	Float:Territorio_MinZ,
	Float:Territorio_MaxX,
	Float:Territorio_MaxY,
	Float:Territorio_MaxZ,
	Territorio_Area,
	Territorio_GZ,
	bool:Territorio_EnGuerra,
	Territorio_AtacanteID,
	Territorio_Tiempo,
	Text:Territorio_TD1,
	Text:Territorio_TD2,
	Territorio_TimerEx,
	Territorio_UltimoA,
};
new TerritorioInfo[MAX_T][TerriInfo];

enum	e_object_data
{
	Owner[MAX_PLAYER_NAME],
	Type,
	ObjData,
	ObjModel,
	Float: ObjX,
	Float: ObjY,
	Float: ObjZ,
	Float: ObjRX,
	Float: ObjRY,
	Float: ObjRZ,
	ObjInterior,
	ObjVirtualWorld,
	ObjID,
	Text3D: ObjLabel,
	ObjArea,
	bool: ObjCreated
}
new
	CopObjectData[MAX_COP_OBJECTS][e_object_data],
	EditingCopObjectID[MAX_PLAYERS] = {-1, ...},
	RoadblockList = mS_INVALID_LISTID,
	SignList = mS_INVALID_LISTID;
new
    Float: zOffsets[5] = {1.35, 3.25, 0.35, 0.4, 5.35};
	
enum talleres_info
{
	Float:xXx,
	Float:yYy,
	Float:zZz
}
new POSTALLERES[][talleres_info] =
{
	{1821.2252,-1420.8545,13.6476},
	{1821.6571,-1412.2068,13.7136},
	{1820.3185,-1403.4597,13.6476},
	{1820.5509,-1394.5631,13.6476}
};
#define MAX_CURRICULUMS 80
enum cv_info
{
	bool:cv_VALID,
	cv_NAME[24],
	cv_DBPLAYER,
	cv_ESTADO,          //0 = Enviado, 1 = Aprovado , 2 = Rechazado
	cv_RESPUESTA_1[145],
	cv_RESPUESTA_2[145],
	cv_RESPUESTA_3[145],
	cv_RESPUESTA_4[145],
	cv_RESPUESTA_5[145],
	cv_RESPUESTA_6[145],
	cv_RESPUESTA_7[145],
	cv_RESPUESTA_8[145],
	cv_RESPUESTA_9[145]
}
new CURRICULUM_INFO[MAX_CURRICULUMS][cv_info];

new FabricaMedicaID[MAX_PLAYERS],FabricaMedica[MAX_PLAYERS], FabricaToxica[MAX_PLAYERS], AreaQuimicos;
new Float:POS_FABRICA[MAX_FABRICAS][4],Float:POS_GARAJE_FABRICA[MAX_FABRICAS][4],FABRICA_ID_DB[MAX_FABRICAS];

enum f_info
{
	bool:f_VALID,
	f_ID,
	f_DBID,
	Float:f_POS[4],
	Float:f_POS_GARAJE[4],
	f_INTERIOR,
	f_VW,
	f_FACCION_ID,
	f_LOCALITATION[64],
	f_DINERO,
	f_VEHICLES[2],
	f_ACTIVIDAD,
	f_VEHICLE_BARRIL,
	f_ALMACE_BARRIL,
	f_VEHICLE_CAJAS,
	f_VENTA_ID,
	Text3D:f_LABELS[MAX_LABELS_FABRICA],
	f_ACTORES[MAX_ACTORS_FABRICA],
	f_TIPO_ACTOR[MAX_ACTORS_FABRICA],
	f_TANQUE[9],
	f_CESTADO[3],
	f_CRISTAL[3],
	f_ESTADO_COCINERO[5],
	f_PORCIENTO_COCINERO[5],
	f_PORCIENTO_HORNO[3],
	f_CAJA_COCINERO[5],
	f_CAJAS_SLOT[10],
	f_CAJAS[20],
	f_PUERTA,
	f_PUERTA_ESTADO,
	f_DINERO_PARED,
	f_BOLSOS_DINERO[32],
	f_CANTIDAD_BOLSOS,
	f_SOBORNO_TIME,
 	f_SOBORNO_ACTIVE,
 	f_SOBORNO_COUNT,
 	f_MAPICON,
 	f_VENTA,
 	f_CHALECOS,
	f_OBJETO_CHALECOS[23],
	f_SNIPER,
	f_OBJETO_SNIPER[10],
	f_TEC9,
	f_OBJETO_TEC9[10],
	f_RECORTADA,
	f_OBJETOS_RECORTADA[10],
	f_UZI,
	f_OBJETO_UZI[10],
	f_PORTON_ESTADO,
	f_PORTON[2],
	f_PICK,
	GE_FABRICA[7]
};
new FABRICAS_INFO[MAX_FABRICAS][f_info];

enum
{
    ACTIVIDAD_NONE,
	ACTIVIDAD_QUIMICOS,
	ACTIVIDAD_VENDER,
	ACTIVIDAD_SOBORNO
};

new Float:CP_Fabricas_Barril[][] =
{
    {0.0,0.0,0.0},
    {-27.3778, 2337.5212, 24.1406},   	//FAB 1
	{-1853.9966, 123.2759, 15.1172},   	//FAB 2
	{-1043.5349, 1546.3799, 33.0007},   //FAB 3
	{259.63461, 2882.35962, 12.52660},	//FAB 4
	{-1102.5535, -1667.3662, 75.8600},	//FAB 5
	{-1505.0505, -626.2808, 13.7065},	//FAB 6
	{-1656.9155,2555.5271,84.4662},   	//FAB 7
	{-377.4531,-1049.9742,58.6779},   	//FAB 8
	{1949.1938,150.8239,36.3711}, 	  	//FAB 9
	{21.6984,897.0439,24.1439},	  		//FAB 10
	{-772.8023,2432.9861,157.0723},  	//FAB 11
	{1060.3553,-296.5565,73.9851} 		//FAB 12
};

new Float:Pos_Recoger_Barril_Fab[][] =
{
    {0.0,0.0,0.0},
    {-28.1522,2349.0771,24.1406},   //FAB 1
	{-1862.2274,112.1568,15.1172},  //FAB 2
	{-1051.8615,1548.0118,33.4376}, //FAB 3
	{260.2088,2890.1047,11.0993},   //FAB 4
	{-1106.3296,-1675.2111,76.3739},//FAB 5
	{-1506.4595,-633.1711,14.1484}, //FAB 6
	{-1661.9880,2555.5720,85.2760}, //FAB 7
	{-377.2772,-1045.2987,59.0874}, //FAB 8
	{1946.3438,151.7602,37.0120},   //FAB 9
	{21.0083,901.5230,24.1700},     //FAB 10
	{-772.6041,2428.4346,157.0908}, //FAB 11
	{1055.1442,-295.8933,73.9851}   //FAB 12
};
new Float:Tanque_Pos_Fabrica[][] =
{
    {-2025.3972, 209.3350, 1041.0414},
	{-2025.3972, 212.2440, 1041.0414},
	{-2025.3972, 215.3320, 1041.0414},
	{-2025.3972, 194.5190, 1041.0414},
	{-2025.3972, 197.5950, 1041.0414},
	{-2025.3972, 200.4760, 1041.0414},
	{-1976.9731, 200.2980, 1041.0414},
	{-1976.9731, 197.4360, 1041.0414},
	{-1976.9731, 194.3620, 1041.0414}
};

new Float:CP_Fabricas_Ventas[][] =
{
	{2431.9109,-1672.5043,13.6113},
	{1520.5901,-1473.3662,9.5000},
	{1091.5337,-1245.3550,15.8272},
	{2206.5029,-2296.2642,14.7647},
	{2548.5298,-1329.7080,34.6677},
	{2477.8740,-1335.9674,27.7025}
};

enum caf_info
{
	c_ID,
	c_SLOT,
	Float:c_POS_X,
	Float:c_POS_Y,
	Float:c_POS_Z
};

new CAJAS_INFO[][caf_info] =
{
	{0, 2, -1995.44226, 220.87140, 1036.28809},
	{0, 1, -1995.43774, 220.88451, 1035.22485},
	{1, 2, -1999.65063, 220.83051, 1036.28809},
	{1, 1, -1999.66272, 220.86720, 1035.21875},
 	{2, 2, -2003.90698, 220.84540, 1036.28809},
	{2, 1, -2003.91345, 220.83290, 1035.21521},
 	{3, 2, -2008.23206, 220.82809, 1036.28809},
	{3, 1, -2008.19434, 220.78900, 1035.22705},
 	{4, 2, -2012.24988, 220.80341, 1036.28809},
	{4, 1, -2012.22876, 220.87730, 1035.21497},
 	{5, 2, -2016.73218, 220.91370, 1036.28809},
	{5, 1, -2016.68604, 220.89410, 1035.21497},
 	{6, 2, -2020.99927, 220.85710, 1036.28809},
	{6, 1, -2020.97791, 220.85620, 1035.21497},
 	{7, 2, -2025.99988, 223.90810, 1036.35596},
	{7, 1, -2026.01501, 223.92320, 1035.28625},
 	{8, 2, -2026.00830, 227.28999, 1036.35596},
	{8, 1, -2025.99390, 227.31190, 1035.28625},
 	{9, 2, -2018.13245, 233.20580, 1036.29602},
	{9, 1, -2018.12109, 233.21930, 1035.21436}
};

new GuardarCajas[][caf_info] =
{
    {0, 0,-1995.4396,222.0775,1035.8162},
	{1, 0,-1999.7394,222.0569,1035.8162},
	{2, 0,-2003.7048,222.0569,1035.8162},
	{3, 0,-2008.2246,222.0594,1035.8162},
	{4, 0,-2012.2891,222.0584,1035.8225},
	{5, 0,-2016.6409,222.0570,1035.8225},
	{6, 0,-2020.9897,222.0580,1035.8225},
	{7, 0,-2024.7925,223.9127,1035.8225},
	{8, 0,-2024.7935,227.3083,1035.8162},
	{9, 0,-2018.1141,231.9926,1035.8162}
};

new Float:BolsoSpawn[][6] =
{
	{-2026.49500, 252.92755, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2026.31030, 253.44168, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2026.50281, 253.90945, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2026.33667, 254.40216, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2025.83167, 254.63782, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2025.89404, 254.09216, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2025.75586, 253.54041, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2025.83398, 252.93347, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2025.34473, 253.10786, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.92517, 252.83632, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2025.17676, 253.58061, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2025.35071, 254.06973, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2025.22717, 254.59962, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.71033, 254.65564, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.87915, 254.20277, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.42456, 254.29457, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.66357, 253.69652, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.66895, 253.19490, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.32520, 252.85796, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.26550, 253.44356, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.13940, 253.93353, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2024.13062, 254.67595, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.80359, 254.29774, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.79785, 253.63652, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.91846, 253.06677, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.59717, 252.76834, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.22083, 252.83463, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.38904, 253.24394, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.40515, 253.76410, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.36169, 254.28839, 1035.20044,   0.00000, 0.00000, 0.00000},
	{-2023.60840, 254.67216, 1035.20044,   0.00000, 0.00000, 0.00000}
};

new Float:ChalecoSpawn[][6] =
{
    {-2018.02710, 238.33360, 1035.69897,   -26.67480, -56.53550, 96.00000},
    {-2018.02710, 238.33360, 1036.35901,   -26.67480, -56.53550, 96.00000},
    {-2018.54712, 238.33360, 1037.05896,   -26.67480, -56.53550, 96.00000},
    {-2020.52710, 238.33360, 1037.05896,   -26.67480, -56.53550, 96.00000},
    {-2018.02710, 238.33360, 1037.05896,   -26.67480, -56.53550, 96.00000},
    {-2019.56714, 238.33360, 1035.69897,   -26.67480, -56.53550, 96.00000},
    {-2021.50708, 238.33360, 1036.35901,   -26.67480, -56.53550, 96.00000},
    {-2020.52710, 238.33360, 1035.69897,   -26.67480, -56.53550, 96.00000},
    {-2019.06714, 238.33360, 1036.35901,   -26.67480, -56.53550, 96.00000},
    {-2018.54712, 238.33360, 1035.69897,   -26.67480, -56.53550, 96.00000},
    {-2019.56714, 238.33360, 1037.05896,   -26.67480, -56.53550, 96.00000},
    {-2020.52710, 238.33360, 1036.35901,   -26.67480, -56.53550, 96.00000},
    {-2018.54712, 238.33360, 1036.35901,   -26.67480, -56.53550, 96.00000},
    {-2021.50708, 238.33360, 1035.69897,   -26.67480, -56.53550, 96.00000},
    {-2021.00708, 238.33360, 1036.35901,   -26.67480, -56.53550, 96.00000},
    {-2021.50708, 238.33360, 1037.05896,   -26.67480, -56.53550, 96.00000},
    {-2021.00708, 238.33360, 1035.69897,   -26.67480, -56.53550, 96.00000},
    {-2019.06714, 238.33360, 1035.69897,   -26.67480, -56.53550, 96.00000},
    {-2020.04712, 238.33360, 1036.35901,   -26.67480, -56.53550, 96.00000},
    {-2020.04712, 238.33360, 1037.05896,   -26.67480, -56.53550, 96.00000},
    {-2019.06714, 238.33360, 1037.05896,   -26.67480, -56.53550, 96.00000},
    {-2021.00708, 238.33360, 1037.05896,   -26.67480, -56.53550, 96.00000},
    {-2019.56714, 238.33360, 1036.35901,   -26.67480, -56.53550, 96.00000}
};
new Float:EscopetasRecortadas[10][6] =
{
	{-2021.98181, 244.37700, 1035.66382,   0.00000, 0.00000, 0.00000},
	{-2021.86084, 244.04727, 1035.22876,   90.00000, 7.00000, 0.00000},
	{-2021.35913, 244.18207, 1035.22888,   90.00000, 7.00000, 180.00000},
	{-2021.08179, 244.37700, 1035.30383,   0.00000, 0.00000, 0.00000},
	{-2021.98181, 244.37700, 1035.30383,   0.00000, 0.00000, 0.00000},
	{-2021.04321, 244.38640, 1035.50781,   0.00000, 0.00000, 180.00000},
	{-2021.09961, 244.04617, 1035.22876,   90.00000, 7.00000, 0.00000},
	{-2020.49866, 244.19951, 1035.22888,   90.00000, 7.00000, 180.00000},
	{-2021.07385, 244.37820, 1035.66382,   0.00000, 0.00000, 0.00000},
	{-2020.22290, 244.40649, 1035.50781,   0.00000, 0.00000, 180.00000}
};
new Float:PTec[10][6] =
{
	{-2019.88318, 244.41052, 1037.08557,   0.00000, 0.00000, 180.00000},
	{-2021.94531, 244.36340, 1036.84961,   0.00000, 0.00000, 0.00000},
	{-2019.89148, 244.23950, 1036.58472,   90.00000, 0.00000, 180.00000},
	{-2021.05835, 244.38280, 1037.08557,   0.00000, 0.00000, 180.00000},
	{-2021.07922, 244.22166, 1036.58472,   90.00000, 0.00000, 180.00000},
	{-2020.84509, 244.35448, 1036.84961,   0.00000, 0.00000, 0.00000},
	{-2018.65576, 244.27119, 1036.58472,   90.00000, 0.00000, 180.00000},
	{-2018.41455, 244.34410, 1036.84961,   0.00000, 0.00000, 0.00000},
	{-2019.59436, 244.36140, 1036.84961,   0.00000, 0.00000, 0.00000},
	{-2018.63733, 244.43520, 1037.08557,   0.00000, 0.00000, 180.00000}
};
new Float:PUzis[10][6] =
{
	{-2018.87012, 244.21410, 1035.22949,   90.00000, 7.00000, 222.00000},
	{-2019.57410, 244.23192, 1035.22949,   90.00000, 7.00000, 160.00000},
	{-2018.89648, 244.43968, 1035.64746,   0.00000, 0.00000, 185.00000},
	{-2018.54041, 244.43912, 1035.64746,   0.00000, 25.00000, 185.00000},
	{-2019.23901, 244.14301, 1035.22949,   90.00000, 7.00000, 127.00000},
	{-2019.25305, 244.44669, 1035.64746,   0.00000, 25.00000, 185.00000},
	{-2018.13232, 244.43910, 1035.64746,   0.00000, 0.00000, 185.00000},
	{-2018.18652, 244.01750, 1035.22949,   90.00000, 7.00000, 77.00000},
	{-2019.61877, 244.43066, 1035.64746,   0.00000, 0.00000, 185.00000},
	{-2018.60645, 244.13139, 1035.22949,   90.00000, 7.00000, -18.00000}
};
new Float:PSnipers[10][6] =
{
	{-2019.85730, 244.38020, 1035.99414,   0.00000, 0.00000, 5.00000},
	{-2021.63086, 244.38510, 1036.28320,   0.00000, 0.00000, 5.00000},
	{-2019.33923, 244.45490, 1036.28320,   0.00000, 0.00000, 187.00000},
	{-2021.60779, 244.37869, 1036.01819,   0.00000, 0.00000, 5.00000},
	{-2019.56970, 244.15793, 1035.87146,   60.00000, 0.00000, 180.00000},
	{-2018.33521, 244.45239, 1036.02905,   0.00000, 0.00000, 187.00000},
	{-2021.14893, 244.14674, 1035.87146,   60.00000, 0.00000, 180.00000},
	{-2018.38452, 244.44810, 1036.29419,   0.00000, 0.00000, 187.00000},
 	{-2020.17102, 244.44839, 1036.24646,   0.00000, 0.00000, 187.00000},
	{-2018.12842, 244.14818, 1035.87146,   60.00000, 0.00000, 180.00000}
};

/*enum rf_info
{
	rf_ID,          	//fabrica ID
	rf_SLOT,
	rf_OBJETO_ID,   	//ID OBJETO
	//
	Float:rf_POS_X,     //POS REJA NORMAL
	Float:rf_POS_Y,     //POS REJA NORMAL
	Float:rf_POS_Z,     //POS REJA NORMAL
	Float:rf_POS_RX,     //POS REJA NORMAL
	Float:rf_POS_RY,     //POS REJA NORMAL
	Float:rf_POS_RZ,     //POS REJA NORMAL
	//
	Float:rf_NEW_POS_X, //POS REJA ABIERTA
	Float:rf_NEW_POS_Y, //POS REJA ABIERTA
	Float:rf_NEW_POS_Z //POS REJA ABIERTA
};

new REJAS_INFO[][rf_info] =
{
    {6, 0, 985, 	-493.44370, -562.68237, 25.58250,   0.00000, 0.00000, 180.12000,  	-500.00000, -562.68237, 25.58250},
	{6, 1, 986, 	-485.58951, -562.66730, 25.58250,   0.00000, 0.00000, 180.12000,   	-479.00000, -562.66730, 25.58250},
	{7, 0, 19912, 	-2120.61108, -80.85220, 37.11180,   0.00000, 0.00000, 0.00000,      -2111.6400, -80.852200, 37.11180}
};*/

//GENERAL
new MedicoReanimo[MAX_PLAYERS];
new CeldaJugador[MAX_PLAYERS];
new Float:LocalizandoAuto[MAX_PLAYERS][2];
new ObjetoRobo[100];
new Zonasegura[30];
new ContadorLlenarGaso[MAX_VEHICLES] = 0;
new TimerMedico[MAX_PLAYERS];
new TimerMeca[MAX_PLAYERS];
new TimerTaxista[MAX_PLAYERS];
new AUTOS = 0;
new AlquiladoTimer;
new TimerSlap[MAX_PLAYERS];
new Text3D:LabelRobo[MAX_PLAYERS];
new Slapeo[MAX_PLAYERS];
new Participo[MAX_PLAYERS];
new EnEstacion[MAX_PLAYERS];
new DineroTirado[MAX_PLAYERS][7];
new ProgresoSexoOral[MAX_PLAYERS];
new Dildo[MAX_PLAYERS];
new ContadorBaile[MAX_PLAYERS];
new ProgresoProstituta[6];
new Paciente2[MAX_PLAYERS];
new BotonesAcademia[7];
new ErrorMensaje[MAX_PLAYERS];
new CamillaLS[MAX_PLAYERS];
new CamillaGA[MAX_PLAYERS];
new CamillaSF[MAX_PLAYERS];
new Boton_discoteca[2],puerta_discoteca[2],AREA_DISCOTEC[2];
new CamillaLV[MAX_PLAYERS];
new mapIconMedico[MAX_PLAYERS][MAX_PLAYERS];
new EmailEnviado[MAX_PLAYERS];
new pickupCarreras;
new EmpezoCarreraP[MAX_PLAYERS];
//new ContadorCBug[MAX_PLAYERS];
new RoboTienda[MAX_PLAYERS];
new valortotal[MAX_PLAYERS];
new roboTiendasObjeto[MAX_PLAYERS];
new PuedeTomarDinero[MAX_PLAYERS];
new UltimoRobado[MAX_PLAYERS];
new RoboActual[MAX_PLAYERS];
new Float:VidaCheat[MAX_PLAYERS];
new Float:ChalecoCheat[MAX_PLAYERS];
new cbomba[MAX_PLAYERS];
new Float:Saltos[][3] =	{    {135.1563,2349.8230,1949.2449,},	{131.8110,2350.3130,1949.1318},    {131.7475,2344.1021,1950.5651},	{135.2510,2344.7883,1950.4067},	{133.2603,2347.3042,1949.8262},	{133.5275,2342.2461,1950.9934}	};
new MAPICONS[MAX_PLAYERS], prendaHalloween[MAX_PLAYERS];
new _Select_Status[ MAX_PLAYERS ] = false, TiempoVida[MAX_PLAYERS];
new Float:PosPDX[MAX_PLAYERS],Float:PosPDY[MAX_PLAYERS],Float:PosPDZ[MAX_PLAYERS],TiempoChaleco[MAX_PLAYERS];
new Cargas[MAX_PLAYERS], PlayerText:NotiConnect[MAX_PLAYERS][5],AceptoRepara[MAX_PLAYERS];
new TimerPescador[MAX_PLAYERS],combustible60, RocaActiva[MAX_PLAYERS], Text:LanzarArponMensaje, Text:DejarRoca;
new LanzarArpon[MAX_PLAYERS], VirtualWorldAutos[MAX_PLAYERS], LanzarArponID[MAX_PLAYERS];
new PlayerText:Pescar[MAX_PLAYERS][4], PlayerText:RocasPT[MAX_PLAYERS][4];
new suicidio[MAX_PLAYERS], TiempoForzarCerradura[MAX_PLAYERS], CasaForzada[MAX_PLAYERS];
new ForzarCerraduraID[MAX_PLAYERS], TowedCar[MAX_PLAYERS][4], TimerReparar[MAX_PLAYERS];
new TimerRevisar[MAX_PLAYERS], TimerRecoleccion[MAX_PLAYERS], TimerDescargarCamion[MAX_PLAYERS];
new TimerCamionero[MAX_PLAYERS], Float:VidaVehiculo[MAX_VEHICLES] = 1000.0;
new avion[3], ViajeAvion[MAX_PLAYERS], contadoravion = 0, Text3D:TextBot[9];
new TimerBasurero[MAX_PLAYERS], PortonAbiertoCasa, TimerName[MAX_PLAYERS];
new TimerMalherido[MAX_PLAYERS], TimerCombustible[MAX_PLAYERS], TimerCargarCamion[MAX_PLAYERS];
new ContarMensajes[MAX_PLAYERS], VerAdmin[MAX_PLAYERS],VerAnticheat[MAX_PLAYERS], VerComandos[MAX_PLAYERS];
new Float:PosJugador[MAX_PLAYERS][3],TimerTP[MAX_PLAYERS], Text:EsperarT[2], LogeoCorrecto[MAX_PLAYERS];
new PlayerText:IndicacionesT[MAX_PLAYERS],Text:MisionT[9],Text:MisionT2[6],Text:MinutoAsalto[3];
new AceptacionBlindado[MAX_PLAYERS],PuestoRobo[MAX_PLAYERS],MarcarCPCamion[MAX_PLAYERS],C4Detonado[2],ObjetosRobo[31],VehiculoAsalto[9],PuntosRobo[19],OrdenGrupo[20],EmpezoMision,CondicionRobo[MAX_PLAYERS],TiempoRobo[3][2],TiempoIniciarAsalto,GrupoRobo[MAX_PLAYERS];
new StatusBlindado, TimerLuces[MAX_VEHICLES], TimerLuces2[MAX_VEHICLES];
new alarmaon[MAX_VEHICLES], PlayerText:Radly[MAX_PLAYERS], NotificacionConectado[MAX_PLAYERS];
new PlayerText:LogroTitulo[MAX_PLAYERS], PlayerText:LogroTexto1[MAX_PLAYERS], PlayerText:LogroTexto2[MAX_PLAYERS];
new PlayerText:LogroNumero[MAX_PLAYERS], PlayerText:CarreraT[MAX_PLAYERS][3];
//new SAPDH[] = { 282,281,280,265,266,267 }
new PlayerText:MensajeBox[MAX_PLAYERS], PlayerText:RoboCasas[MAX_PLAYERS][4], PlayerText:NewPlayerr[MAX_PLAYERS];
new PlayerText:TextDPGPS[MAX_PLAYERS][MAX_TEXTDRAWS], PlayerText:TextDPGPS2[MAX_PLAYERS][MAX_TEXTDRAWS];
new PlayerText:PlayerGPS[MAX_PLAYERS], PlayerText:LogroRueda[MAX_PLAYERS], PlayerText:LogroLinea[MAX_PLAYERS];
new PlayerText:AfinidadconX[MAX_PLAYERS], PlayerText:LineasPutiNivel[MAX_PLAYERS], PlayerText:tren[MAX_PLAYERS][MAX_PLAYERS];
new PlayerText:jugador[MAX_PLAYERS], PlayerText:TAXIMET2[MAX_PLAYERS], nuevoszonesmap[12];
new ValueTimerBugH[MAX_PLAYERS], Text3D:TextoDulces[32],Text3D:TextoSombrero[32], MapaHall[117],PuestoCamioneros[18], EstMuni[14], PuestosPuentesote[25], PUnity[26],PMontana[13], PBell[13], PTung[13];
new PColinas[13],PCNN[13],PBAY[13],PELQUE[13],PEME[13],PTRANS[13],PESTALV[13],PMARK[13],PSANT[13],PBASU[13],PLSSF[13],PGILI[13],PJULIU[13],PPICKE[13],PAA[13],PPAYA[13],PELQ[13],PLSF[13],PPIZEA[13],PDELAPI[13],PFADO[13],PASF[13],PC1[13];
new TimeChange[MAX_PLAYERS],EventoBolo[MAX_PLAYERS], Piso[MAX_PLAYERS], BuscandoAmigo[MAX_PLAYERS], ResetearYaMostro[MAX_PLAYERS];
new YaMostroAlertaSed[MAX_PLAYERS] = 0, YaPuedeCargarValores[MAX_PLAYERS], TimerForcep, bool:PayDayActive = false, Forzando[MAX_PLAYERS] = 0;
new Float:PuntoGPSX[MAX_PLAYERS],Float:PuntoGPSY[MAX_PLAYERS],Float:PuntoGPSZ[MAX_PLAYERS], PuertaID[MAX_PLAYERS];
new Text3D:EscaparLabel[12], Text:EquisCerrar, Text:BoxRobar, Text:SeleccionaPuerta, Text:CuadroPrendasLargo;
new Text:CuadroPrendasCorto, TieneHerramientaEnMano[MAX_PLAYERS];
new TieneGPSActivo[MAX_PLAYERS];
new PlayerText:CarreraPosicion[MAX_PLAYERS];
new MensajeSinGasoEnviado[MAX_PLAYERS] = 0;
new TipoPrision[MAX_PLAYERS] = 1;
new rejacuartilla = 0;
new bool:PuedenSalirPatio = false;
new npctoggle = 0;
new Text:MapaLateral[4];
new Text:TTren[9];
new LlamadaTipo[MAX_PLAYERS] = 0;
new paredx,ofi1,ofi2,ofi3,ofi4,tuberis1,tuberis2,tuberis3,luz1,luz2,luz3,luz4,luz5;
new ESPROSTI[MAX_PLAYERS] = -1;
new SexoOral[MAX_PLAYERS] = -1;
new VerFPS[MAX_PLAYERS];
new VarFPS;
new pDrunkLevelLast[MAX_PLAYERS];
new pFPS[MAX_PLAYERS];
new pFPSOld[MAX_PLAYERS];
new Text:FPS[MAX_PLAYERS];
new minimcactor, vendedormc[20], actors[20],Guardia3,Guardia4,Guardia6,Guardia7,Guardia8,Guardia12,Entrenador,Entrenador2,IslaSeguridad,IslaSeguridad2,Hombreemisora,Chicataxista,Minero,Minero1,Avionista,vendedorautos[20],tiendav;
new Strip2[50],Stripx[50];
new SlotP[MAX_PLAYERS];
new precioofertax[MAX_PLAYERS];
new Float:CaidaTaxi[3][MAX_PLAYERS];
new MinutoLlamada[MAX_PLAYERS];
new Tiburon;
new YoLlame[MAX_PLAYERS] = 0;
new CriminalAceptado[MAX_PLAYERS];
new CLlamada[MAX_PLAYERS];
new Text:FranjaCriminal;
new puertarobobanco;
new Float:cpo[MAX_VEHICLES][3];
new Float:FortCarsonX[MAX_PLAYERS][4];
new TipoOferta[MAX_PLAYERS];
new bool:LoggedYet[MAX_PLAYERS] = false;
new SprunkOfrecido[MAX_PLAYERS], Ofertante[MAX_PLAYERS];
new Text:Sangre2;
new giPlayerStatus[ MAX_PLAYERS ];
new FlashRef[MAX_PLAYERS];
new FlashRef2[MAX_PLAYERS];
new GPSActivado[MAX_PLAYERS];
new tiempomsjadmin[MAX_PLAYERS];
new Text3D:LABELPARLANTE[MAX_PLAYERS];
new EmisoraOn[MAX_PLAYERS];
new tiempoentrega[MAX_PLAYERS];
new tiempoabrir[MAX_PLAYERS];
new kitsapd[MAX_PLAYERS];

new LoadMonTimee[MAX_PLAYERS];
new robobanco[MAX_PLAYERS];
new Text:TextDGPS[MAX_TEXTDRAWS];
new LCHAT[MAX_PLAYERS];

new bool:EnConteo;

new Float:Concesionaria_Spawn_Positions[][] =
{
	{1656.1246,-1883.6947,13.1237,359.9166},
	{557.6544,-1260.8588,16.8133,17.7973},
	{2127.5342,-1123.4701,24.9874,3.9086},
	{-1989.7445,288.3349,33.9223,90.9973},
	{1494.5084,-1744.7078,13.5469,358.7261}
};
new PlayerSitting[MAX_PLAYERS];
new mostrarmuertes[MAX_PLAYERS];
new parlante[MAX_PLAYERS];
new parlanteObject[MAX_PLAYERS];
new parlanteStream[MAX_PLAYERS];
new parlantePlayer[MAX_PLAYERS];
new parlanteURL[MAX_PLAYERS][256];
new Float:bpos[MAX_PLAYERS][4];
/*VOLAR ADMIN*/


new VehicleWindows[MAX_VEHICLES] = 0;
new explotopuertabanco;
new bool:ConEstado[MAX_PLAYERS];
new BOMBA[MAX_PLAYERS];
new Text3D:estado[MAX_PLAYERS];
new Text3D:textorobo;
new yarobocaja[MAX_PLAYERS];
new Banco_Activo;
new canceltimer[MAX_PLAYERS];
//new roberthsotoestuvoaca[MAX_PLAYERS];
new CajaAbierta = 0,Text3D:CajaFuerteTX,Robado[4] = 0,RobadaTM = 0;
new rapel[75];
new rappelactivo[MAX_PLAYERS];
new Text:BoxCarrera[4];
new comprarchaleco[MAX_TEXTDRAWS];
new UltimaIDBandas;
//new NombreRandom[MAX_PLAYERS][128];
new TDGPSCreadoS;
new TDPGPSCreado[MAX_PLAYERS][MAX_TEXTDRAWS];
new TDGPSCreado[MAX_TEXTDRAWS];
enum LIST_ANTIFLOOD
{
	lastCheck,
	floodRate
}

new timerparlante[MAX_PLAYERS];
new AntiFlood_Data[MAX_PLAYERS][LIST_ANTIFLOOD];
new Criminal[MAX_PLAYERS],TieneEncargo[MAX_PLAYERS],TomoEncargo[MAX_PLAYERS],Colega[MAX_PLAYERS],Invito[MAX_PLAYERS],Invitador[MAX_PLAYERS];
new Text:MisionCriminal[MAX_ENCARGOS],Text:MisionColega[MAX_ENCARGOS],Text:TiempoMision[MAX_ENCARGOS];
new Text:Sangre, ComprandoPrendas[MAX_PLAYERS] = 0,TimerDineroP[MAX_PLAYERS], YaEs24 = 0;
new RecienDuda[MAX_PLAYERS],Reportado[MAX_PLAYERS][5];
new Text:ConsigueUNN, Text:DescartableD, TieneSombrero[MAX_PLAYERS], PuestoUnityTiene[MAX_PLAYERS][4],PuestoUnityxTiene[MAX_PLAYERS][4], PuestoEstMuniTiene[MAX_PLAYERS][4], PuestoAGTiene[MAX_PLAYERS][4], PuestoPGTiene[MAX_PLAYERS][4], PuestoColinasTiene[MAX_PLAYERS][4], PuestoCamioneroTiene[MAX_PLAYERS][4], GorrosSFBridgeTiene[MAX_PLAYERS][4];
new PuestoMountTiene[MAX_PLAYERS][4], GorrosBridgeTiene[MAX_PLAYERS][4],PuestoJTTiene[MAX_PLAYERS][4], PuestoAATiene[MAX_PLAYERS][4], PuestoTransTiene[MAX_PLAYERS][4],PuestoCBTiene[MAX_PLAYERS][4], PuestoAESFTiene[MAX_PLAYERS][4], PuestoBaysideTiene[MAX_PLAYERS][4], PuestoWeelsTiene[MAX_PLAYERS][4], PuestoCNNTiene[MAX_PLAYERS][4], PuestoQuebradoTiene[MAX_PLAYERS][4], PuestoEmeTiene[MAX_PLAYERS][4],PuestoFaDoTiene[MAX_PLAYERS][4], PuestoC1Tiene[MAX_PLAYERS][4];
new PuestoLeSFTiene[MAX_PLAYERS][4], PuestoEstaLVTiene[MAX_PLAYERS][4], PuestoMarketTiene[MAX_PLAYERS][4], PuestoSMBTiene[MAX_PLAYERS][4],PuestoMCTiene[MAX_PLAYERS][4], PuestoPPTiene[MAX_PLAYERS][4], PuestoBasuTiene[MAX_PLAYERS][4], PuestoElqTiene[MAX_PLAYERS][4], PuestoPayaTiene[MAX_PLAYERS][4], PuestoLSFTiene[MAX_PLAYERS][4], PuestoCamionero[4], PuestoEstMuni[4], GorrosSFBridge[4], GorrosBridge[4], PuestoUnity[4];
new PuestoUnityx[4],PuestoMount[4],PuestoCB[4],PuestoWeels[4],PuestoColinas[4],PuestoCNN[4],PuestoBayside[4],PuestoQuebrado[4],PuestoEme[4],PuestoTrans[4],PuestoEstaLV[4],PuestoMarket[4],PuestoSMB[4],PuestoBasu[4],PuestoLSF[4],PuestoMC[4],PuestoJT[4],PuestoPP[4],PuestoAA[4],PuestoPaya[4],PuestoElq[4],PuestoLeSF[4],PuestoPG[4],PuestoAG[4],PuestoFaDo[4],PuestoAESF[4],PuestoC1[4];
new vehaveriado[MAX_VEHICLES] = 0,DineroColegiala[33], TiempoAvion;
new Text3D:LabelFC[6], ActorFC[9], bool:EventoActivo,bool:NidadX, bool:HallX, bool:EVT, t_cerveza,MapaNavi[17], Text3D:TextoNavi,TextoStriptease, Text:Cuadroputi, Text:Cuadroputi1, Text:PuticlubMedia,Text:PuticlubAlta;

new Text:FlechasArribaPuti, Text:FlechasArribaPuti2, EnClub[MAX_PLAYERS] = 0, Text:Completonegro, Text:LuegoDe,Bailarina1 = 0,Bailarina2 = 0,Bailarina3 = 0,Bailarina4 = 0,Bailarina5 = 0,Bailarina6 = 0, Banear[MAX_PLAYERS], Ratita[MAX_PLAYERS], EstaDomiciliaria[MAX_PLAYERS],SpecJugador[MAX_PLAYERS] = INVALID_PLAYER_ID;
new ComandoEstado = 1,TiempoReinicio = -1,RejasFC[33];
new PuertasRobo[13];
new TrenUno, TrenTres, TrenCuatro, TrenDos;
new quienfue[MAX_PLAYER_NAME], vecesa[MAX_PLAYERS],AguaBalde[MAX_PLAYERS],PrendaMarcada[MAX_PLAYERS], TextosIslas1,TextosIslas2,bool:EnPrueba[MAX_PLAYERS],bool:PruebaOnline[MAX_PLAYERS],Frecuencia[MAX_PLAYERS],FraseLoro[MAX_PLAYERS][70],EnCarreras[MAX_PLAYERS],lugarcarrera,EmpezoCarrera,ParticipantesCarrera,HabilitarCarreras,ParticipantesCarrera2, Text3D:TextoCarrera,ConteoCarrera;
new VueltasCarrera[MAX_PLAYERS],bool:EntradaCarrera[MAX_PLAYERS],VehiculoCarrera[14], SlotGanador,InfoCP[4][6], asdtren[MAX_PLAYERS],asd[MAX_PLAYERS],frecuencias[9];
new TotemBuscar[MAX_PLAYERS][10],EnLlamada911[MAX_PLAYERS],LoginTimer[MAX_PLAYERS],IDReporte[MAX_PLAYERS],ListItemReportId[MAX_PLAYERS][40],CancelReport[MAX_PLAYERS];
new ViendoPantalla[MAX_PLAYERS] = 0, ViendoGPS[MAX_PLAYERS],AutoBuscado[MAX_PLAYERS], JugadorBuscado[MAX_PLAYERS], PatenteBuscada[MAX_PLAYERS][10],PaydayDado,JustReported[MAX_PLAYERS],Balde[MAX_VEHICLES],LSDCamello, KpCamello, DineroCamello, CrackCamello, MarihuanaCamello, MedicamentosCamello, Camello,BotonesFC[6],BotonesLVPD[3],PickupRopa[MAX_PLAYERS],ObjExp[19], ObjBox[34], ObjCon[5], ObjHumo1[3], ObjHumo2[3];
new VerBaul[MAX_PLAYERS],Entrando[MAX_PLAYERS],Forzada4,Forzada5,Forzada6,Forzada8,Quitando[MAX_PLAYERS],Advertido[MAX_PLAYERS],GolpesAdv[MAX_PLAYERS],Objeto[MAX_PLAYERS],Forzada1,Forzada2,Forzada3,Avisos[MAX_PLAYERS],CasaAbierta,CasaAbierta6,CasaAbierta2,CasaAbierta3,CasaAbierta4,CasaAbierta5,reportar[MAX_PLAYERS],Float:PosTP[MAX_PLAYERS][3],AvisoTP[MAX_PLAYERS];
new Float: fVehSpeed[MAX_PLAYERS],AutoJugador[MAX_PLAYERS],EnPatrulla[MAX_PLAYERS],Logeando[MAX_PLAYERS],RecorridoBasu[MAX_PLAYERS],CargandoC[MAX_PLAYERS],CasaAbierta8,CasaAbierta10,ExpObj, BoxObj, ConObj, Humo1Ojb, Humo2Ojb,BotonesACA[7],PuertasFC[6],iVehicleObjective[MAX_VEHICLES][2],PuertasLVPD[3],PuertasACA[7],Localizando[MAX_PLAYERS],Monto[MAX_PLAYERS],Ficha[MAX_PLAYERS],Text:NewPlayer[3];
new AvisosAuto[MAX_PLAYERS],Mecanico[MAX_PLAYERS],MConductor[MAX_PLAYERS],EnAuto[MAX_PLAYERS],RopaMeca[MAX_PLAYERS],RopaMine[MAX_PLAYERS],Bidon[MAX_PLAYERS],Baul[MAX_VEHICLES],llenado[MAX_VEHICLES],Muriendo[MAX_PLAYERS],LlamadaTaxi[MAX_PLAYERS],EnTaxi[MAX_PLAYERS],VRepuestos[MAX_PLAYERS];
new CanalDudas[MAX_PLAYERS],CanalTwt[MAX_PLAYERS],Oficial[MAX_PLAYERS],RopaMedi[MAX_PLAYERS],RopaBasu[MAX_PLAYERS],Capo[MAX_VEHICLES],BajandoV[MAX_PLAYERS],Bajando[MAX_PLAYERS],MRepuestos[MAX_PLAYERS],Cambiando[MAX_PLAYERS],PBasura[MAX_PLAYERS],Companero[MAX_PLAYERS],recogiendo[MAX_PLAYERS],TM[MAX_PLAYERS],CheatAlerta[MAX_PLAYERS],TipoCosecha[MAX_PLAYERS],Cosechando[MAX_PLAYERS],PCosechar[MAX_PLAYERS],Taxista[MAX_PLAYERS],Pasajero[MAX_PLAYERS];
new LlamadaMeca[MAX_PLAYERS],ResponderMeca[MAX_PLAYERS],ResponderTaxi[MAX_PLAYERS],ResponderMedi[MAX_PLAYERS],Forzada10;
new Forzada7,CasaAbierta7,Forzada9,CasaAbierta9,Forzada11,CasaAbierta11;
new Forzada12,CasaAbierta12,EnTuto[MAX_PLAYERS],rocajugador[MAX_PLAYERS], pescador[MAX_PLAYERS], pesca[MAX_PLAYERS], RecorridoPescador[MAX_PLAYERS],TelefonoEstado[MAX_PLAYERS],tviaje[MAX_PLAYERS],tcarga[MAX_PLAYERS],Hora, Minuto, Segundo,  SinGaso[MAX_VEHICLES],Float:SpecX[MAX_PLAYERS];
new Luces[MAX_VEHICLES],TimerCombate[MAX_PLAYERS],EnCombate[MAX_PLAYERS],CColocado[MAX_PLAYERS],CagoSeguro[MAX_PLAYERS], BaulPB[MAX_PLAYERS],HCalculo[MAX_PLAYERS],Text:TAXIMET,Text:TAXIMET3,Text:TAXIMET4,HCurando[MAX_PLAYERS],DudaTexto[MAX_PLAYERS][128],RobandoTienda[MAX_PLAYERS];
new Float:OldPosx[MAX_VEHICLES],Float:OldPosy[MAX_VEHICLES],Float:OldPosz[MAX_VEHICLES],EnLlamada[MAX_PLAYERS],Robando[MAX_PLAYERS],CargosRobar[MAX_PLAYERS], cavion[MAX_PLAYERS],AvionID[MAX_PLAYERS],NoQuitar[MAX_PLAYERS],Agresor[MAX_PLAYERS],TCV[MAX_PLAYERS],TCV2[MAX_PLAYERS],RobadoReciente[MAX_PLAYERS],GuardaEspalda[MAX_PLAYERS],Float:SpecY[MAX_PLAYERS],SpecInt[MAX_PLAYERS];
new Deposito[MAX_PLAYERS],NPrendas[MAX_PLAYERS], SlotP2[4][MAX_PLAYERS], UsandoP[MAX_PLAYERS], UsandoObj[MAX_PLAYERS], UsandoObj2[MAX_PLAYERS], UsandoObj3[MAX_PLAYERS], UsandoObj4[MAX_PLAYERS],YaOfrecio[MAX_PLAYERS];
new Chofer[MAX_VEHICLES] = INVALID_PLAYER_ID,Carga[MAX_PLAYERS],NombresOcultos[MAX_PLAYERS], TipoCargo[MAX_PLAYERS],CamionCargado[MAX_VEHICLES] = 0,CamionID[MAX_PLAYERS],Paciente[MAX_PLAYERS],armaofertada[MAX_PLAYERS],CrackOfrecidos[MAX_PLAYERS],KrippyOfrecidos[MAX_PLAYERS],LSDOfrecidos[MAX_PLAYERS],PiezasOfrecidas[MAX_PLAYERS],EVOfrecidos[MAX_PLAYERS];
new MedicamentosOfrecidos[MAX_PLAYERS],MarihuanaOfrecida[MAX_PLAYERS],dineropedido[MAX_PLAYERS],ofertador[MAX_PLAYERS],LeOfreci[MAX_PLAYERS],Mats1[MAX_PLAYERS],Mats2[MAX_PLAYERS],Mats3[MAX_PLAYERS],MedicoCP2[MAX_PLAYERS],PuntoMats[MAX_PLAYERS],EstadoRadio[MAX_PLAYERS],Curando[MAX_PLAYERS],MedicoCP[MAX_PLAYERS],Mobile2[MAX_PLAYERS],PacienteAmbu[MAX_PLAYERS],Reanimado[MAX_PLAYERS],MarcadoMedicos[MAX_PLAYERS];
new LlamadaMedicos[MAX_PLAYERS],bloqueado[MAX_VEHICLES],alarma[MAX_VEHICLES],PrimerSpawn[MAX_PLAYERS] = 0,averiado[MAX_VEHICLES],Jail[MAX_PLAYERS],San[MAX_PLAYERS],barrera, porton, puerta_1, puerta_2, puerta_3, reja1, reja2, reja3, reja4, reja5, reja6,Manejando[MAX_PLAYERS],iVehicle[MAX_PLAYERS],pistas[9], suelo[4], isla[9];
new EspacioBaul[MAX_VEHICLES][11],VarAvion[MAX_PLAYERS],TrabajoAvion[MAX_PLAYERS],VehicleFuel[MAX_VEHICLES],Float:DeathX[MAX_PLAYERS], Float:DeathY[MAX_PLAYERS];
new Float:DeathZ[MAX_PLAYERS], Float:PuntoBaX[MAX_PLAYERS], Float:PuntoBaY[MAX_PLAYERS], Float:PuntoBaZ[MAX_PLAYERS], Float:PuntoBaA[MAX_PLAYERS],Float:PuntoCX[MAX_PLAYERS], Float:PuntoCY[MAX_PLAYERS], Float:PuntoCZ[MAX_PLAYERS], Float:PuntoTraX[MAX_PLAYERS], Float:PuntoTraY[MAX_PLAYERS], Float:PuntoTraZ[MAX_PLAYERS];
new TieneMicrofono[MAX_PLAYERS],Botones[40],PuertasDeBotones[40],Alquilador[MAX_PLAYER_NAME],bool:Alquilado,HorasSalon,bool:PermisoSalon[MAX_PLAYERS],bool:Boleto[MAX_PLAYERS],Personas,PrecioSalon,NivelSalon,Text3D:TextoSalon,Text3D:TextoSalon2,NombreEvento[100],DescriEvento[150],TipoEvento,bool:Escuchando[MAX_PLAYERS],PuertaAbierta[5],Puerta[5];
new Esposando[MAX_PLAYERS], TimerEsposar[MAX_PLAYERS],Cargando2[MAX_PLAYERS] = 0,Picando[MAX_PLAYERS] = 0,autos[MAX_PLAYERS],autos2[MAX_PLAYERS],autos3[MAX_PLAYERS],autos4[MAX_PLAYERS],autos5[MAX_PLAYERS],JugadorLogeado[MAX_PLAYERS], Text:Textdraw5, Text:Textdraw6, Text:Textdraw7;
new Text:AlertaRefuerzos[5],YaEncendiendo[MAX_PLAYERS],MotorAuto[MAX_VEHICLES],DudaOff[MAX_PLAYERS],BigEar[MAX_PLAYERS], Text:PantallaGTA[2],ModoCombate,TieneSprunk[MAX_PLAYERS], TienePorro[MAX_PLAYERS],TieneCerveza[MAX_PLAYERS],TieneVino[MAX_PLAYERS], TienePizza[MAX_PLAYERS], TieneAquariu[MAX_PLAYERS], Contador[MAX_PLAYERS], permisopesca[MAX_PLAYERS];
new Boletos[MAX_PLAYERS], VWTemporal[MAX_PLAYERS], llamadasonido1[MAX_PLAYERS], llamadasonido2[MAX_PLAYERS],NPC_Tren[7],RopaIcono[7], Specteado[MAX_PLAYERS];
new EstaEnBus[MAX_PLAYERS], tipogrua[MAX_PLAYERS],hands[MAX_PLAYERS],NombreErroneo[MAX_PLAYERS], muelles[5], mares,idTimerOfertaPerdida[MAX_PLAYERS],idTimerTiempoVenta[MAX_PLAYERS],Float:SpecZ[MAX_PLAYERS], SpecVW[MAX_PLAYERS];
new QUERY_BUFFER[4096];	
new MySQL:handle_db,Text3D:ForzarTD[MAX_CASAS_ROBO];
new Float: vidayarmadura[MAX_PLAYERS][2];
new Text:IntroDepa[8],FaseDepa[MAX_PLAYERS],FaseDepa1[MAX_PLAYERS],TimerDepa[MAX_PLAYERS],TimerDepa1[MAX_PLAYERS];
//====Sistema de eventos===//
new bool:EventoStatus = false;
new NombreEventoDynamic[64] = "Sin configurar";
new bool:JugandoEventoDinamico[MAX_PLAYERS];
new Text:TeleportEvent[14];
new TiempoAnuncioEvento = 0;
new bool:AnunciadoEvento = false;
new VehiculoEvento[MAX_PLAYERS];
new TipoDeAuto[MAX_PLAYERS];
new Float:EventoX;
new Float:EventoY;
new Float:EventoA;
new Float:EventoZ;
new EventoInt;
new EventoVw;
new Float:BeforeEventX[MAX_PLAYERS];
new Float:BeforeEventY[MAX_PLAYERS];
new Float:BeforeEventZ[MAX_PLAYERS];
new Float:BeforeEventA[MAX_PLAYERS];
new BeforeEventInt[MAX_PLAYERS];
new BeforeEventVw[MAX_PLAYERS];
//=================================================//
//Notificaciones
#if defined _GoodNote_included
#endinput
#endif
#define _GoodNote_included
#if !defined MAX_GOOD_NOTES
#define MAX_GOOD_NOTES 8
#endif
#if !defined MAX_GOOD_TEXT_LENGTH
#define MAX_GOOD_TEXT_LENGTH 400
#endif
#define GN_DIRECTION_UP 2		/* /\ */
#define GN_DIRECTION_DOWN 1		/* \/ */

enum GOOD_NOTE_INFO
{
	GOOD_NOTE_ID,
	PlayerText:GOOD_NOTE_TD_TEXT,
	PlayerText:GOOD_NOTE_ICO,
	GOOD_NOTE_TEXT[MAX_GOOD_TEXT_LENGTH],
	GOOD_NOTE_TEXT_I[MAX_GOOD_TEXT_LENGTH],
	GOOD_NOTE_TIME_OUT,
	GOOD_NOTE_TIMER,
	GOOD_NOTE_NOTI,
	GOOD_NOTE_LINES,
	GOOD_NOTE_COL_BG,
	GOOD_NOTE_COL_TEXT,
	GOOD_NOTE_TYPE,
	//renta--------
	PlayerText:Renta1,
	PlayerText:Renta2,
	PlayerText:Renta3,
	PlayerText:Renta4,
	PlayerText:Pesca1,
	PlayerText:Pesca2,
	PlayerText:Job1,
	PlayerText:Exp1,
	PlayerText:Job2,
	PlayerText:Exp2,
	PlayerText:Job3,
	PlayerText:Exp3,
	PlayerText:Job4,
	PlayerText:Exp4,
	PlayerBar:Barra_Hambre,
	PlayerBar:Barra_Sed,
	PlayerText:Hambre_TD1,
	PlayerText:Hambre_TD2,
	PlayerText:Hambre_TD3,
	PlayerText:Hambre_TD4,
	PlayerBar:Barra_Camionero,
	PlayerBar:Barra_Pescador,
	PlayerBar:Barra_Minero,
	PlayerBar:Barra_Basurero,
	PlayerBar:Barra_Pescando,
	PlayerText:EfectoA,
	PlayerBar:Barra_A,
	PlayerText:EfectoP,
	PlayerBar:Barra_P,
	PlayerText:VerEST1,
	PlayerText:VerEST2,
	PlayerText:VerEST3,
	PlayerText:CamioTD,
	PlayerText:Graf_Ico,
	PlayerText:Graf_Name,
	PlayerText:Graf_Desc,
	PlayerText:Graf_B1,
	PlayerText:Graf_B2,
	PlayerText:Graf_B3,
	PlayerText:Graf_B4,
	PlayerText:Recuperandote1,
	PlayerText:Recuperandote2,
	PlayerText:Informe1,
	PlayerText:Informe2,
	PlayerText:PayDay1,
	PlayerText:PayDay2,
	PlayerText:PayDay3,
	PlayerText:PayDay4,
	PlayerText:EfectoXP,
	PlayerText:Editor1,
	PlayerText:Editor2,
	PlayerBar:Barra_XP
	//-----------
}
new
GoodNoteData[MAX_PLAYERS][MAX_GOOD_NOTES][GOOD_NOTE_INFO],
GoodNoteLastId = 0,
Float:GoodNotePosX = 499.375000,
Float:GoodNotePosY = 0.0,
Float:GoodNotePosY2 = 0.0,
GoodNoteDirection = GN_DIRECTION_DOWN,
GoodNoteSound = 1002
;
new InformePolicia1[MAX_PLAYERS],InformePolicia2[MAX_PLAYERS];
new Noti_Hambre[MAX_PLAYERS],Noti_Renta[MAX_PLAYERS],Noti_Habilidad[MAX_PLAYERS],Noti_PD[MAX_PLAYERS],Noti_Recuperandote[MAX_PLAYERS],Noti_XP[MAX_PLAYERS],Noti_Informe[MAX_PLAYERS],Noti_Grafiti[MAX_PLAYERS],Noti_Camio[MAX_PLAYERS],Noti_Analgesico[MAX_PLAYERS],Noti_Pirula[MAX_PLAYERS],Noti_Carcel[MAX_PLAYERS],Noti_Pesca[MAX_PLAYERS];
new TeclaPesca[MAX_PLAYERS];
new Pescando_Barra[MAX_PLAYERS];
new ColorPesca[MAX_PLAYERS];
new TiempoNotificaciones[MAX_PLAYERS][13];
new EfectoPirula[MAX_PLAYERS];



enum disc_info
{
	bool:d_USED,
	d_DJ,
	d_URL[128]
};
new DISCOTEC_INFO[disc_info];
new Float:ServicioMedicoPos[3][6] =
{
	{1148.0066,-1322.5038,-10.7922},{-2713.3152,636.8893,1385.6547},{1242.1221,-809.4786,1164.2759}
};

#define MAX_PHONE_CONTACTS	20
enum Phone_Book_Enum
{
	phone_book_contact_VALID,
	phone_book_contact_ID,
	phone_book_contact_NAME[24],
	phone_book_contact_PHONE_NUMBER
};
new PLAYER_PHONE_BOOK[MAX_PLAYERS][MAX_PHONE_CONTACTS][Phone_Book_Enum]; //PB = PhoneBook
new g_dialog_select[MAX_PLAYERS][150];
#define YEAR0           1900  				// the first year
#define EPOCH_YR        1970  				// EPOCH = Jan 1 1970 00:00:00
#define SECS_DAY        (24 * 60 * 60)
#define LEAPYEAR(%0)    (!((%0) % 4) && (((%0) % 100) || !((%0) % 400)))
#define YEARSIZE(%0)    (LEAPYEAR(%0) ? 366 : 365)
enum IRB
{
	iID,
	iPosX,
	iPosY,
	iPosZ,
	iPosX1,
	iPosY1,
	iPosZ1,
	iModelo,
	iStatus,
	iCasaRobo
}
enum dialogs
{
	LOGIN,
	DPRENDAS,
	DPRENDAS2,
	LocalizarP,
	DIALOG_FIANZA,
	DIALOG_LOC,
	DIALOG_INACTIVOS,
	DIALOG_DESOCUPAR_CASAS,
	PARLANTE_V2,
	INFOMEDICO,
	REGISTRO,
	BUSCARCOCHE,
	// -= Estado =- //
	DIALOG_ESTADO,
	DIALOG_REG_ESTADO,
	GPS,
	GPSMC,
	DIALOG_TOYS,
	DIALOG_TOYS_MENU,
	DIALOG_TOYS_EDIT,
	DIALOG_TOYS_EDIT_2,
	DIALOG_PLAYER_TOY_COLOR_1,
	DIALOG_PLAYER_TOY_COLOR_2,
	DIALOG_PLAYER_MP3,
	DIALOG_PLAYER_MP3_RESULTS,
	GPST,
	DIALOG_COCINERA,
	INVENTARIO,
	VENDERAUTO_J1,
	VENDERAUTO_J2,
	VENDERAUTO_J3,
	VENDEROPCION,
	VENDEROPCION1,
	SEXO,
	SEXO1,
	GPS2,
	GPS3,
	GPS4,
	GPS5,
	GPS6,
	GPS7,
	GPS8,
	GPS9,
	GPS10,
	GPS11,
	GPS12,
	GPS13,
	GPS14,
	GPS15,
	GPS16,
	PRODUCTOS,
	TRABAJOS,
	INDOMEDICO,
	CAMIOND,
	D_ADMINS,
	D_ADMINS2,
	BANCO,
	BANCO1,
	BANCO2,
	BANCO3,
	BANCO4,
	DIALOG_TELEPORT_EVENT,
	DARAMAS_EVENTO,
	DIALOG_AUDIO_EVENT,
	DIALOG_ARMAS_EVENT,
	DIALOG_SETEAR_VIDA,
	DIALOG_VEHICLE_EVENT,
	DIALOG_EVENT,
 	DIALOG_CHANGENAME_EVENT,
	DIALOG_KICKPLAYER_EVENT,
	DIALOG_SET_VEHICLE_EVENT,
	DIALOG_VIDA_JUGADORES,
	DIALOG_ARMOR_JUGADORES,
	VENDERAUTO,
	VENDERAUTO2,
	BUSCARCOCHE2,
	BUSCARCOCHE3,
	BUSCARCOCHE4,
	VENDERCASA,
	VENDERCASA1,
	D_REGALOS,
	ESTANTE,
	REGLAS,
	REGLAS2,
	REGLAS3,
 	REGLAS4,
	GRUA,
	GRUA2,
	GRUA3,
	GRUA5,
	GRUA6,
	REGISTROOFF,
	CREPUESTOS,
	INMIGRACION,
	INFOLADRON,
	DHOSPITAL,
	BOTIQUIN,
	DEMAIL,
	DAYUDA,
	DRECARGA,
	DCONFIG,
	COMPRARCAMELLO,
	VENDERCAMELLO,
	HERRAMIENTAS,
	INFOBASU,
	COMPRARMEDICAMENTOS,
	JUGUETES,
	PRODUCTOS2,
	COMPRARCAMELLO2,
	COMPRARCRACK,
	COMPRARKP,
	COMPRARLSD,
	VENDERMEDICAMENTOS,
	VENDERCRACK,
	VENDERLSD,
	VENDERKP,
	DIALOG_SALON,
	SERVICIOGRUA1,
	SERVICIOGRUA2,
	SERVICIOGRUA3,
	DIALOG_PIZZA,
	COMPRARLICENCIA,
	LOCALIZARAMIGO,
	CONTRASENA,
	NUEVONOMBRE,
	TROCAR_SEXO,
	COMPRARRADIO,
	AlquilarSalon1,
	DIALOG_CREARARMA,
	AlquilarSalon2,
	AlquilarSalon3,
	AlquilarSalon4,
	AlquilarSalon5,
	AlquilarSalon6,
    AlquilarSalon7,
    CBOTIQUIN,
	REPORTSMENU,
	DSEXOO,
	DIALOG_VOBJECT_MENU,
	DIALOG_VOBJECT_OBJECTS,
	DIALOG_VOBJECT_OBJECT,
	DIALOG_VOBJECT_OBJECT_CNAME,
	DIALOG_VOBJECT_OBJECT_COLORS,
	DIALOG_VOBJECT_OBJECT_COLOR,
	DIALOG_VOBJECT_OBJECT_COLOR_HEX,
	DIALOG_VOBJECT_OBJECT_CDELETE,
	DIALOG_VOBJECT_DELETE_ALL,
	DIALOG_VOBJECT_TEXT_MENU,
	DIALOG_VOBJECT_TEXT_TEXT,
	DIALOG_VOBJECT_TEXT_FONT,
	DIALOG_VOBJECT_TEXT_FONT_SIZE,
	DIALOG_VOBJECT_TEXT_FONT_COLOR,
	DIALOG_VOBJECT_COUNTRY,
	CONTROLES,
	TRABAV,
	ALARMAV,
	ENTREGARSE1,
	ENTREGARSE2,
	ENTREGARSE3,
	ENTREGARSE4,
	ENTREGARSE5,
	ENTREGARSE6,
	DIALOGO_FRECUENCIAS,
	DIALOGO_GRUA,
	DIALOGO_INFO,
	DIALOGO_GRUA3,
	DIALOGO_GRUA4,
	DIALOGO_LORO,
	DIALOGO_LORO2,
	VENDERFZ,
	COMPRAR_PRENDA,
	TRABAJO_MEDICO,
	TRABAJO_MEDICO2,
	COMPRARMARIHUANA,
	VENDERMARIHUANA,
	DOMICILIARIA,
	DASCENSOR,
	DCLUB,
	GeoLocalization,
	INVITARCRI,
	CCCOBJETOS,
	CVEHICULO,
	MISION,
	MISION2,
	MISION3,
	D_REGALOS2,
	D_REGALOS3,
	D_REGALOS4,
	C_BOLETO,
	DIALOG_PURGAON,
	DIALOG_PURGAOFF,
	D_COLOR1,
	D_COLOR2,
	MMEDICO,
	DIALOG_DESOCUPAR_FABRICAS,
	DIALOG_DESOCUPAR_FABRICAS_2,
	DIALOG_ACTIVIDAD,
	MENU_BORRAR_AUTO,
	DIALOG_ADMINISTRACION,
	DIALOG_EMPLEADOS,
	DIALOG_EMPLEADOS2,
	DIALOG_ARMAS_FABRICA,
	DIALOG_SACAR_ARMAS_FABRICA,
	DIALOG_CHALE_FABRICA,
	DIALOG_FABRICA_VEH,
	DIALOG_FABRICA_DESBUG,
	EDAD,
	DIALOG_POSTULACION,
	DIALOG_POSTULACION_1,
	DIALOG_POSTULACION_2,
	DIALOG_POSTULACION_3,
	DIALOG_POSTULACION_4,
	DIALOG_POSTULACION_5,
	DIALOG_POSTULACION_6,
	DIALOG_POSTULACION_7,
	DIALOG_POSTULACION_8,
	DIALOG_POSTULACION_9,
	DIALOG_CURRICULUMS,
	DIALOG_CURRICULUMS_1,
	DIALOG_CURRICULUMS_2,
	DIALOG_MEJORAR_MOTOR,
	DIALOG_SALTICO_VEH,
	DIALOG_MEJORAS_VEH,
	DIALOG_ACTIVE_MEJORAS,
	DIALOG_ACTIVE_SALTO_V,
	MERCADONEGRO,
	DIALOG_ANUNCIO,
	DIALOG_ANUNCIO1,
	DIALOG_ANUNCIO2,
	DIALOG_ANUNCIO3,
	DIALOG_STATS,
	DIALOG_STATS1,
	DIALOG_ACENTO,
	MINIMC,
 	DIALOG_PHONE,
	DIALOG_PHONE_BOOK,
	DIALOG_PHONE_BOOK_ADD_NUMBER,
	DIALOG_PHONE_BOOK_ADD_NAME,
	DIALOG_PHONE_BOOK_OPTIONS,
	DIALOG_PHONE_BOOK_CHANGE_NAME,
	DIALOG_PHONE_BOOK_CONFIRM_DELET,
	DIALOG_PHONE_BOOK_DELETE_ALL,
	DIALOG_PHONE_CALL_NUMBER,
	DIALOG_PHONE_SMS_NUMBER,
	DIALOG_PHONE_SMS_MESSAGE,
	DIALOG_PHONE_BOOK_SEND_MESSAGE,
	DIALOG_PAINTW,
	DIALOG_BACKPACK,
	DIALOG_BACKPACK_ALM,
	DIALOG_BP_ALM_CANT,
	DIALOG_BP_SAC_CANT,
	DIALOG_WEAPONSPD,
	VERIFICAR_ADMIN,
	D_RECEPDEPA,
	D_RECEPDEPA2,
	D_RECEPDEPA3,
	D_RECEPDEPA4,
	TYPE_LIST_MENU,
	TYPE_LIST_EDIT,
	TYPE_LIST_CREATE,
	TYPE_LIST_TAGS,
	TYPE_LIST_TAGS_DELETE,
	TYPE_LIST_TAGS_CREATE,
	TYPE_LIST_TAGS_FIND,
	SPRAYTAG_MENU,
	SPRAYTAG_DELETE,
	SPRAYTAG_CREATE,
	SPRAYTAG_CREATE_MAIN,
	SPRAYTAG_CREATE_TEXT,
	SPRAYTAG_CREATE_FONT,
	SPRAYTAG_CREATE_SIZE,
	SPRAYTAG_CREATE_COLOR,
	SPRAYTAG_CREATE_FINISH,
	SPRAYTAG_EDIT_MAIN,
	SPRAYTAG_EDIT_TEXT,
	SPRAYTAG_EDIT_FONT,
	SPRAYTAG_EDIT_SIZE,
	SPRAYTAG_EDIT_COLOR,
	SPRAYTAG_EDIT_FINISH,
	SPRAYTAG_EDIT_LIST,
	SPRAYTAG_FIND,
	SPRAYTAG_DIALOG_RETURN,
	DIALOG_COMPRAMOCHILA,
	DIALOG_ESTADISTICAS,
	MNEGRO,
	MCRACK,
	MMARI,
	MPIEZAS,
	ADMINISTRARMERCADO,
	MDEPOSITAR,
	MRETIRAR,
	MREPONER,
	MVENDER,
	DIALOG_PEDIDO,
	DIALOG_TUNEO,
	DIALOG_PEDIDO_2,
	DIALOG_PEDIDO_PROPIEDAD,
	DIALOG_PEDIDO_NOMBRE,
	MENU_PEDIDOS,
	CONFIG_BANDA,
	CONFIG_BANDA2,
	CHANGE_CREW_NAME,
	VIEW_RANK_NAME,
	CHANGE_RANK_NAME,
	CHANGE_PROP_RANK,
	CREW_RANK_EDI,
	CREW_RANK_EXP,
	CREW_RANK_INV,
	MENU_INVITACIONES,
	DIALOG_PLAYER_INV_DELETE_ALL,
	DIALOG_PLAYER_INV_ACEPT,
	DIALOGO_PB,
	DIALOGO_PB2,
	DIALOGO_PB3,
    DIALOG_ARMAS,
    DIALOG_ARMAS2,
    DIALOG_ARMAS3,
    DIALOG_ARMAS_1,
    DIALOG_ARMAS_2,
    DIALOG_ARMAS_3,
    DIALOG_ARMAS_4,
    DIALOG_ARMAS_5,
    DIALOG_ARMAS_6,
    DIALOG_VENDER_ARMA,
    DIALOG_VENDER_ARMA_1,
    DIALOG_VENDER_ARMA_2,
    DIALOG_INV_AUTOS,
    JOB_ALBAnIL_CONSEGUIR,
    JOB_ALBAnIL_COBRAR,
    DIALOG_CONSOLA,
	D_Ilista,
	D_Ibuscar,
	D_Gbuscar,
	KITBOMBERO,
	BOTIQUIN_CURAR,
	DIALOG_HELP,
	DIALOG_GENERAL,
	DIALOG_ANDROID,
	ADM_GASOLINERA,
	ADM_GASOLINERA_L,
	DIALOG_GASOLINERAE,
	DIALOG_GASOLINERA_C,
	GASOLINERA_ADD,
	GUARDA,
	G_Apunta,
	G_Disparar,
	C_GUARDA,
	DIALOG_GE_LIST,
	DIALOG_GE_CREAR,
	VENDER_CASA_A,
	VENDER_CASA_A2,
	VENDER_CASA_A3,
	VENDER_CASA_A4,
	VENDER_CASA_A5,
	CI_CASA,
	CI_CASA2,
	G_AUTO,
	DIALOG_INV_CASAS,
	KIT_ILEGAL,
	Opciones_Apsa,
	DIALOG_ENVIVO,
	DIALOG_A_PATRULLAS,
	EDITARCASA,
	EDITARCASAM,
	D_PONERM,
	D_VENDERM,
	D_ACOMODARM,
	D_QUITARM,
	NMusica,
	LOCALIZARCASAD,
	//Sistema de muebles LinoxZone Roleplay
    D_Casa,
	D_CasaMuebles,
	D_ColocarMueble,
	D_BorrarMueble,
	D_AcomodarMueble,
	D_OcultarMueble,
	D_QuitarMueble,
	D_PonerMueble,
	D_VenderMueble,
	D_G_FABRICA,
	D_G_FABRICA2,
	ARMAS_GE,
	C_GUARDA2,
	DIALOG_GE_CREAR2,
	SKIN_GE,
	BOOST_CREW,
	D_BAUL,
	D_BAUL2,
	D_BAUL3,
	D_BAUL4,
	TIENDA_DP_COLOR,
	TIENDA_DP_COLOR2,
	TIENDA_DP3,
	D_PARLANTE,
	D_PARLANTE2,
	D_TOPS,
	D_INMIGRACION,
	DIALOG_TIENDA_DP,
	D_Mbuscar,
	D_ACEPTAR_VENTA,
	D_VEHFACC,
	D_VEHFACC_OPT,
	D_CONFIG_VEHDATA,
	D_CONFIG_VEHDATA_R,
	DIALOG_HOTDOG
}
//new FakeQuery = 22;
enum
{
	PICKUP_TYPE_NONE = 0,
	PICKUP_TYPE_ENTER_EXIT,
	PICKUP_TYPE_ATM,
	PICKUP_TYPE_PROPERTY,
	PICKUP_TYPE_HOTDOG
};
new Text:APSA[2];
new Name_GE[MAX_PLAYERS][128],Name_GE2[MAX_PLAYERS][128],Name_GE3[MAX_PLAYERS][128],Name_GE4[MAX_PLAYERS][128],Name_GE5[MAX_PLAYERS][128],Name_GE6[MAX_PLAYERS][128];
new AutoSeleccionado[MAX_PLAYERS];
new CasaSeleccionada_INV[MAX_PLAYERS];

new CamionBombero[MAX_PLAYERS];
new dudas_largo = 0;
new dudas_debate = 0;
new dudas_fz = 0;
 

enum eInfo
{
	IdMision,
	IdCriminal,
	IdColega,
	NumeroMision,
	Actor1,
	Objetivo,
	Actor2,
	SegundosMision,
	ObjetivoTake,
	Bajas,
	Tiene9mm,
	MisionActiva
}
new Encargo[MAX_ENCARGOS][eInfo];
enum Spikes
{
	Float:sX,
	Float:sY,
	Float:sZ,
	sObjectID,
	sDeployedBy[MAX_PLAYER_NAME],
	sDeployedAt[MAX_ZONE_NAME]
}
new SpikeStrips[20][Spikes];

 

 
 
 
enum GPSInfo
{
	Float:GPSIconPos_X,	Float:GPSIconPos_Y,	GPSIconTipo
}

enum
{
	AREA_TYPE_NONE,
	AREA_TYPE_GANGZONE
};

enum Robos
{
	rPolicia,
	rID,
	Actor,
	TiendaRobada,
	TiendaLadron,
	Float:RoboX,
	Float:RoboY,
	Float:RoboZ,
	Float:RoboA,
	RoboVW,
	RoboInt,
	RoboSkin,
	LocalidadRobo[32],
	Float:EntradaX,
	Float:EntradaY,
	Float:EntradaZ,
 	RoboProceso
}
new RoboTiendas[MAX_NPC_ROBOS][Robos];

enum B_TEXTDRAW
{
	Text:_button_close,
 	Text:_string,
	Text:_background[ 2 ]
};

new PlayerBackGround[ B_TEXTDRAW ];

enum eInformacion
{
	eID,
	eEnUso,
	Pickup,
	Text3D:Etiqueta,
	Text3D:EtiquetaInterior,
	Dueno,
	DuenoName[MAX_PLAYER_NAME],
 	ePrecio,
	Nivel,
	Float:PosX,
	Float:PosY,
	Float:PosZ,
	Float:PosA,
	Float:SalidX,
	Float:SalidY,
	Float:SalidZ,
	Float:SalidA,
	eMundoVirtual,
	eInterior
};
new Estacionamientos[MAX_GARAGES][eInformacion];

new MapIconPos[][GPSInfo]=
{
	{2227.411376,-1718.254028,1},
	{2123.630126,-2274.889648,1},
	{1174.8502,-1361.3514,1},
	{-1716.7922,-62.7255,1},
	{1377.0605,1152.7566,1},
	{-172.498428,-1542.868408,1},
	{1743.017211,-1864.421386,1},
	{2789.3672,-2574.6675,1},
	{2014.8400,1150.4700,1},
	{-2177.0659,690.9559,1},
	{-384.8185,2206.1106,1}
};
new Float:GPSPOS[MAX_TEXTDRAWS][2];

enum rankingEnum
{
    player_Score,
    player_ID
}

enum _:Trabajos
{
	T_Ninguno,
	T_Medico,
	T_Taxista,
	T_Guardaespaldas,
	T_Camionero,
	T_Cosechador,
	T_Armero,
	T_Mecanico,
	T_Basurero,
	T_Transportista,
	T_Ladron,
	T_Minero,
	T_Pescador,
	T_Criminal,
	T_Prostituta,
	T_Trailero,
	T_Albanil
}
enum IntFijoInfo
{
	Float:int_Pickup_X,	Float:int_Pickup_Y,	Float:int_Pickup_Z,	int_Tipo,	int_InteriorID,	int_Nombre[128]
}
new DynamicHousesInfo[][IntFijoInfo] =
{
	{0.0,0.0,0.0, 0, 0, ""},
	{1172.0809,-1323.3261,15.4029, DH_TIPO_HOSPITAL, 2, "All Saints General Hospital"},
	{2034.1003,-1401.6727,17.2941, DH_TIPO_HOSPITAL, 1, "County General Hospital"},
	{1607.4504,1815.2471,10.8203, DH_TIPO_HOSPITAL, 1, "Las Venturas Hospital"},
	{-2661.7305,599.8032,14.4531, DH_TIPO_HOSPITAL, 1, "San Fierro Hospital"},
	{1555.3919,-1675.5589,16.1953, DH_TIPO_COMISARIA, 18, "Departamento de policia"},
	{2287.1091,2432.3657,10.8203, DH_TIPO_COMISARIA, 19, "Departamento de policia"},
	{-1605.5440,711.4725,13.8671, DH_TIPO_COMISARIA, 18, "Departamento de policia"},
	{-1808.7142,945.9161,24.8906, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{-1720.9456,1359.7822,7.1853, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{2083.3376,2224.7012,11.0234, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{2756.7642,2477.3533,11.0625, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{2638.7839,1849.7867,11.0234, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{2331.8098,75.0506,26.6210, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{1367.5475,248.2522,19.5669, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{203.3945,-201.9418,1.5781, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{2105.4844,-1806.4695,13.5547, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{2351.8242,2533.6289,10.8203, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{2330.6023,2533.6121,10.8203, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{2309.5044,2533.6143,10.8203, DH_TIPO_PIZZERIA, 25, "The Well Stacked Pizza"},
	{1094.0945,1597.0083,12.5469, DH_TIPO_ESTADIO, 32, "Estadio Las Venturas"},
	{1833.7745,-1842.4498,13.5781, DH_TIPO_24/7, 5, "24/7"},
	{1000.5937,-919.9277,42.3281, DH_TIPO_24/7, 6, "24/7"},
	{2247.6574,2396.1682,10.8203, DH_TIPO_24/7, 6, "24/7"},
	{1112.0471,-1370.0366,13.9843, DH_TIPO_24/7, 6, "24/7"},
	{1315.5830, -897.7324, 39.5781, DH_TIPO_24/7, 5, "24/7"},
	{2424.2266, -1742.7798, 13.5457, DH_TIPO_24/7, 5, "24/7"},
	{2194.9385, 1991.0005, 12.2969, DH_TIPO_24/7, 6, "24/7"},
	{2097.6768, 2224.6963, 11.0234, DH_TIPO_24/7, 5, "24/7"},
	{1937.8212, 2307.2593, 10.8203, DH_TIPO_24/7, 5, "24/7"},
	{1565.6444,-1171.1234,24.0931, DH_TIPO_24/7, 6, "24/7"},
	{1928.5809,-1776.2848,13.5469, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{1000.5939,-919.9257,42.3281, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{-78.3736,-1169.9005,2.1355, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{-1676.1718,432.1964,7.1797, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{-2420.1506,969.8429,45.2969, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{-1320.4795,2698.6536,50.2663, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{639.0652,1683.3542,7.1875, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{1599.0673,2221.8108,11.0625, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{2637.2786,1129.6777,11.1797, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{2117.5002,896.7776,11.1797, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{2344.0371,583.3854,11.2078, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{2187.7114,2469.6384,11.2422, DH_TIPO_NORMAL, 31, "Tienda de autoservicio"},
	{2310.0407,-1643.4899,14.8270, DH_TIPO_NORMAL, 8, "Bar"},
	{824.6143,860.6437,12.2336, DH_TIPO_NORMAL, 7, "Bar"},
	{-1821.9484,-125.7622,5.6484, DH_TIPO_NORMAL, 7, "Bar"},
	{1137.9938,-1365.5095,13.9843, DH_TIPO_NORMAL, 3, "Sex Shop"},
	{2085.1201,2074.0693,11.0546, DH_TIPO_NORMAL, 3, "Sex Shop"},
	{2515.3167, 2297.3269, 10.8203, DH_TIPO_NORMAL, 3, "Sex Shop"},
	{1498.3905,-1581.2242,13.5498, DH_TIPO_BANCO, 23, "Banco Plaza"},
	{-1581.3144,867.9341,7.6953, DH_TIPO_BANCO, 17, "Banco central de San Fierro"},
	{1466.3624,-1009.9306,26.8437, DH_TIPO_BANCO, 27, "Banco central de Los Santos"},
	{2449.4663, 2290.2431, 10.8203, DH_TIPO_BANCO, 27, "Banco central de Las Venturas"},
	{1456.4036,-1137.6667,23.9483, DH_TIPO_TIENDA, 16, "ZIP"},
	{454.2059,-1478.0029,30.8145, DH_TIPO_TIENDA, 13, "Didder Sachs"},
	{461.6936,-1500.8106,31.0455, DH_TIPO_TIENDA, 12, "Victim"},
	{499.5280,-1360.6315,16.3689, DH_TIPO_TIENDA, 14, "Pro Laps"},
	{2244.3674,-1665.5603,15.4765, DH_TIPO_TIENDA, 11, "Binco"},
	{2112.8615,-1211.4549,23.9628, DH_TIPO_TIENDA, 15, "Sub Urban"},
	{-1480.9353,2591.6696,55.8359, DH_TIPO_NORMAL, 9, "Ferreteria"},
	{2107.7407,2165.6501,10.8203, DH_TIPO_NORMAL, 9, "Ferreteria"},
	{2861.2902,2430.7707,11.0689, DH_TIPO_NORMAL, 9, "Ferreteria"},
	{1836.9897,-1682.4479,13.3248, DH_TIPO_NORMAL, 10, "Alhambra"},
	{1707.3498,950.1061,10.8203, DH_TIPO_NORMAL, 22, "HS Haul"},
	{224.2623,1443.8137,10.8052, DH_TIPO_NORMAL, 4, "Penitenciaria de Fort Carson"},
	{2516.8284,-627.7029,114.7803, DH_TIPO_MINA, 28, "Mina Los Santos Colinas"}, //minero
	{1742.9369, -1864.4482, 13.5738, DH_TIPO_BANCO, 20, "Unity Station"},
	{2229.9121, -1721.2922, 13.5616, DH_TIPO_NORMAL, 24, "GYM Ganton"},
	{-550.2115,2347.3640,76.3864, DH_TIPO_NORMAL, 29, "Empleados solamente"},
	{2362.7698,2306.3025,8.1406, DH_TIPO_NORMAL, 33, "Academia de policia"},
	{2014.8101,1107.0100,10.9203, DH_TIPO_LOVE, 33, "Club de striptease"},
	{-2425.9731,1034.6635,50.3906, DH_TIPO_SPRAY, 33, "Paint's Spray"},
	{488.8548,-1729.9846,11.1288, DH_TIPO_SPRAY, 33, "Paint's Spray"},
	{-1904.6188,272.1454,41.0469, DH_TIPO_SPRAY, 33, "Paint's Spray"},
	{2076.4985,-1831.2183,13.5545, DH_TIPO_SPRAY, 33, "Paint's Spray"},
	{-99.8633,1104.8828,19.7422, DH_TIPO_SPRAY, 33, "Paint's Spray"},
	{1961.2501,2162.3440,10.8203, DH_TIPO_SPRAY, 33, "Paint's Spray"},
	{1025.1273,-1033.7855,31.7578, DH_TIPO_SPRAY, 33, "Paint's Spray"},
	{720.2676,-466.9585,16.3437, DH_TIPO_SPRAY, 33, "Paint's Spray"},
	{-1420.9324,2595.5127,55.7080, DH_TIPO_SPRAY, 33, "Paint's Spray"}
};

new Float:CamillasLS[][5] =
{
	{1161.3247,-1334.8248,-10.7922,271.2708,2.0},
	{1161.6248,-1327.0193,-10.7922,270.4997,1.0},
	{1146.0052,-1341.2516,-10.7922,93.1505,4.0},
	{1164.0238,-1334.7267,-10.7922,270.2720,2.0},
	{1167.5248,-1334.5248,-10.7922,270.6050,2.0},
	{1167.6248,-1326.8646,-10.7922,270.4997,1.0},
	{1163.6246,-1345.8657,-10.7849,268.9404,3.0},
	{1166.3246,-1345.5560,-10.7922,268.9404,3.0},
	{1168.0043,-1341.1843,-10.7922,93.0450,3.0},
	{1151.2059,-1341.3474,-10.7922,88.6033,4.0},
	{1148.9045,-1349.2318,-10.7922,89.1554,5.0},
	{1146.1086,-1349.1567,-10.7922,87.1579,5.0},
	{1148.5044,-1341.1702,-10.7922,88.9362,4.0},
	{1151.8046,-1349.2213,-10.7922,89.1554,5.0},
	{1147.1246,-1345.9316,-10.7922,276.0371,4.0},
	{1149.7246,-1345.8223,-10.7922,271.7092,4.0},
	{1162.7048,-1329.9869,-10.7922,92.4929,2.0},
	{1164.6245,-1326.8224,-10.7922,270.4997,1.0},
	{1169.0248,-1345.6031,-10.7922,272.4887,3.0}
};
new Float:CamillasSF[10][5] =
{
    {-2721.8760,605.4824,1385.6470,89.2424,2.0},
	{-2709.1360,614.9445,1385.6547,89.7947,4.0},
	{-2734.1257,616.8509,1385.6547,90.5742,3.0},
	{-2701.9238,614.8807,1385.6547,89.7947,3.0},
	{-2736.6060,605.3529,1385.6547,89.4617,1.0},
	{-2719.0046,605.4175,1385.6470,91.2399,2.0},
	{-2705.5659,614.8506,1385.6547,89.7947,4.0},
	{-2716.3760,605.4506,1385.6470,91.2399,2.0},
	{-2738.2854,616.7706,1385.6547,89.9083,3.0},
	{-2733.7061,605.1204,1385.6466,88.4629,1.0}
};
new Float:CamillasLV[][5] =
{
	{1235.7244,-808.0383,1164.2759,89.5639,1.0},
	{1250.4841,-824.1636,1167.9960,273.8879,4.0},
	{1247.0929,-827.2189,1167.9960,90.2216,5.0},
	{1249.4652,-827.2841,1167.9960,90.8875,5.0},
	{1251.7042,-827.3507,1167.9960,90.8875,5.0},
	{1248.0647,-824.2131,1167.9960,273.2220,4.0},
	{1231.5941,-813.3441,1164.2759,89.8969,1.0},
	{1245.6648,-824.1623,1164.2759,268.6747,2.0},
	{1245.6635,-824.1140,1167.9960,268.5611,4.0},
	{1250.5448,-824.2269,1164.2759,272.0038,2.0},
	{1231.6140,-808.1431,1164.2759,88.8981,1.0},
	{1244.9840,-827.2869,1164.2759,90.3352,3.0},
	{1249.4642,-827.1910,1164.2759,88.6706,3.0},
    {1251.7042,-827.1281,1164.2759,88.6706,3.0},
	{1248.0647,-824.1572,1164.2759,269.3405,2.0},
	{1233.7240,-808.1099,1164.2759,88.5652,1.0},
	{1243.5237,-824.3701,1164.2759,273.3355,2.0},
	{1247.0841,-827.2117,1164.2759,92.6656,3.0},
	{1243.4446,-824.2711,1167.9960,272.2232,4.0},
	{1244.9845,-827.3311,1167.9960,90.5546,5.0}
};

new VEHICLE_COLORS[256] =
{
	0x000000FF, 0xF5F5F5FF, 0x2A77A1FF, 0x840410FF, 0x263739FF, 0x86446EFF, 0xD78E10FF, 0x4C75B7FF, 0xBDBEC6FF, 0x5E7072FF,
	0x46597AFF, 0x656A79FF, 0x5D7E8DFF, 0x58595AFF, 0xD6DAD6FF, 0x9CA1A3FF, 0x335F3FFF, 0x730E1AFF, 0x7B0A2AFF, 0x9F9D94FF,
	0x3B4E78FF, 0x732E3EFF, 0x691E3BFF, 0x96918CFF, 0x515459FF, 0x3F3E45FF, 0xA5A9A7FF, 0x635C5AFF, 0x3D4A68FF, 0x979592FF,
	0x421F21FF, 0x5F272BFF, 0x8494ABFF, 0x767B7CFF, 0x646464FF, 0x5A5752FF, 0x252527FF, 0x2D3A35FF, 0x93A396FF, 0x6D7A88FF,
	0x221918FF, 0x6F675FFF, 0x7C1C2AFF, 0x5F0A15FF, 0x193826FF, 0x5D1B20FF, 0x9D9872FF, 0x7A7560FF, 0x989586FF, 0xADB0B0FF,
	0x848988FF, 0x304F45FF, 0x4D6268FF, 0x162248FF, 0x272F4BFF, 0x7D6256FF, 0x9EA4ABFF, 0x9C8D71FF, 0x6D1822FF, 0x4E6881FF,
	0x9C9C98FF, 0x917347FF, 0x661C26FF, 0x949D9FFF, 0xA4A7A5FF, 0x8E8C46FF, 0x341A1EFF, 0x6A7A8CFF, 0xAAAD8EFF, 0xAB988FFF,
	0x851F2EFF, 0x6F8297FF, 0x585853FF, 0x9AA790FF, 0x601A23FF, 0x20202CFF, 0xA4A096FF, 0xAA9D84FF, 0x78222BFF, 0x0E316DFF,
	0x722A3FFF, 0x7B715EFF, 0x741D28FF, 0x1E2E32FF, 0x4D322FFF, 0x7C1B44FF, 0x2E5B20FF, 0x395A83FF, 0x6D2837FF, 0xA7A28FFF,
	0xAFB1B1FF, 0x364155FF, 0x6D6C6EFF, 0x0F6A89FF, 0x204B6BFF, 0x2B3E57FF, 0x9B9F9DFF, 0x6C8495FF, 0x4D8495FF, 0xAE9B7FFF,
	0x406C8FFF, 0x1F253BFF, 0xAB9276FF, 0x134573FF, 0x96816CFF, 0x64686AFF, 0x105082FF, 0xA19983FF, 0x385694FF, 0x525661FF,
	0x7F6956FF, 0x8C929AFF, 0x596E87FF, 0x473532FF, 0x44624FFF, 0x730A27FF, 0x223457FF, 0x640D1BFF, 0xA3ADC6FF, 0x695853FF,
	0x9B8B80FF, 0x620B1CFF, 0x5B5D5EFF, 0x624428FF, 0x731827FF, 0x1B376DFF, 0xEC6AAEFF, 0x000000FF,
	0x177517FF, 0x210606FF, 0x125478FF, 0x452A0DFF, 0x571E1EFF, 0x010701FF, 0x25225AFF, 0x2C89AAFF, 0x8A4DBDFF, 0x35963AFF,
	0xB7B7B7FF, 0x464C8DFF, 0x84888CFF, 0x817867FF, 0x817A26FF, 0x6A506FFF, 0x583E6FFF, 0x8CB972FF, 0x824F78FF, 0x6D276AFF,
	0x1E1D13FF, 0x1E1306FF, 0x1F2518FF, 0x2C4531FF, 0x1E4C99FF, 0x2E5F43FF, 0x1E9948FF, 0x1E9999FF, 0x999976FF, 0x7C8499FF,
	0x992E1EFF, 0x2C1E08FF, 0x142407FF, 0x993E4DFF, 0x1E4C99FF, 0x198181FF, 0x1A292AFF, 0x16616FFF, 0x1B6687FF, 0x6C3F99FF,
	0x481A0EFF, 0x7A7399FF, 0x746D99FF, 0x53387EFF, 0x222407FF, 0x3E190CFF, 0x46210EFF, 0x991E1EFF, 0x8D4C8DFF, 0x805B80FF,
	0x7B3E7EFF, 0x3C1737FF, 0x733517FF, 0x781818FF, 0x83341AFF, 0x8E2F1CFF, 0x7E3E53FF, 0x7C6D7CFF, 0x020C02FF, 0x072407FF,
	0x163012FF, 0x16301BFF, 0x642B4FFF, 0x368452FF, 0x999590FF, 0x818D96FF, 0x99991EFF, 0x7F994CFF, 0x839292FF, 0x788222FF,
	0x2B3C99FF, 0x3A3A0BFF, 0x8A794EFF, 0x0E1F49FF, 0x15371CFF, 0x15273AFF, 0x375775FF, 0x060820FF, 0x071326FF, 0x20394BFF,
	0x2C5089FF, 0x15426CFF, 0x103250FF, 0x241663FF, 0x692015FF, 0x8C8D94FF, 0x516013FF, 0x090F02FF, 0x8C573AFF, 0x52888EFF,
	0x995C52FF, 0x99581EFF, 0x993A63FF, 0x998F4EFF, 0x99311EFF, 0x0D1842FF, 0x521E1EFF, 0x42420DFF, 0x4C991EFF, 0x082A1DFF,
	0x96821DFF, 0x197F19FF, 0x3B141FFF, 0x745217FF, 0x893F8DFF, 0x7E1A6CFF, 0x0B370BFF, 0x27450DFF, 0x071F24FF, 0x784573FF,
	0x8A653AFF, 0x732617FF, 0x319490FF, 0x56941DFF, 0x59163DFF, 0x1B8A2FFF, 0x38160BFF, 0x041804FF, 0x355D8EFF, 0x2E3F5BFF,
	0x561A28FF, 0x4E0E27FF, 0x706C67FF, 0x3B3E42FF, 0x2E2D33FF, 0x7B7E7DFF, 0x4A4442FF, 0x28344EFF
};


new NombreHerramienta[5][] = { "",	"{00CC00}Martillo{FFFFFF} | ",	"{00CC00}Destornillador{FFFFFF} | ",	"{00CC00}Barreta{FFFFFF} | ",	"{00CC00}Balde{FFFFFF} | "};


new Float:DineroSpawn1[7][3] = {
	{1219.4506, -6.7681, 1000.3845},
	{1219.7976, -6.8836, 1000.3845},
	{1219.9985, -7.0584, 1000.3845},
	{1219.6404, -7.0946, 1000.3845},
	{1219.4285, -6.9823, 1000.3845},
	{1219.3450, -7.1265, 1000.3845},
	{1219.5104, -7.2973, 1000.3845}
};
new Float:DineroSpawn2[12][3] =
{
	{1214.65063, -4.69790, 1000.38452},
	{1214.14819, -4.23293, 1000.38452},
	{1214.53308, -4.04349, 1000.38452},
	{1214.60669, -4.41849, 1000.38452},
	{1214.12769, -4.46524, 1000.38452},
	{1214.36548, -4.61390, 1000.38452},
	{1214.47095, -4.19637, 1000.38452},
	{1214.20825, -3.98005, 1000.38452},
	{1213.84241, -4.38125, 1000.38452},
	{1213.93042, -4.66804, 1000.38452},
	{1214.29126, -4.78296, 1000.38452},
	{1214.34155, -4.37421, 1000.38452}
};

new Float:DineroSpawn3[17][3] = {
	{1202.96399, 8.28210, 999.92468},
	{1202.75500, 8.12750, 999.92468},
	{1202.69250, 8.37438, 999.92468},
	{1202.84998, 8.55979, 999.92468},
	{1203.11084, 8.45035, 999.92468},
	{1203.26245, 8.19671, 999.92468},
	{1203.00867, 8.04549, 999.92468},
	{1202.72449, 7.95939, 999.92468},
	{1203.16357, 7.83645, 999.92468},
	{1202.79993, 7.77427, 999.92468},
	{1202.38135, 7.93154, 999.92468},
	{1203.31152, 8.00469, 999.92468},
	{1203.44116, 8.41645, 999.92468},
	{1203.38232, 8.70793, 999.92468},
	{1203.12512, 8.74535, 999.92468},
	{1202.73047, 8.74830, 999.92468},
	{1202.73047, 8.74830, 999.92468}
};

new Float:DineroSpawn4[17][3] =
{
	{1221.45471, 8.70950, 1000.38733},
	{1221.18079, 8.95026, 1000.38733},
	{1221.64392, 9.20410, 1000.38733},
	{1221.03357, 8.71232, 1000.38733},
	{1220.81445, 8.96599, 1000.38733},
	{1220.77930, 8.68179, 1000.38733},
	{1220.98523, 9.16584, 1000.38733},
	{1221.35608, 9.19465, 1000.38733},
	{1221.58569, 8.95798, 1000.38733},
	{1221.34583, 8.49501, 1000.38733},
	{1221.00684, 8.51719, 1000.38733},
	{1221.30237, 8.80439, 1000.38733},
	{1221.68201, 8.54490, 1000.38733},
	{1221.73621, 8.74649, 1000.38733},
	{1221.88123, 9.05650, 1000.38733},
	{1221.11169, 8.30978, 1000.38733},
	{1221.55042, 8.29642, 1000.38733}
};

new Float:DineroSpawn5[14][3] =
{
	{1207.96570, -6.90310,1000.38733},
	{1208.19617, -6.73263,1000.38733},
	{1207.97278, -6.56259,1000.38733},
	{1208.36243, -6.45283,1000.38733},
	{1208.52686, -6.81083,1000.38733},
	{1208.20422, -7.08637,1000.38733},
	{1208.58374, -6.59465,1000.38733},
	{1208.57703, -6.26913,1000.38733},
	{1208.25940, -6.17592,1000.38733},
	{1207.94446, -6.35177,1000.38733},
	{1207.91321, -6.08451,1000.38733},
	{1208.63062, -5.99649,1000.38733},
	{1208.85559, -6.40737,1000.38733},
	{1208.88074, -6.13652, 1000.38733}
};

new Float:DineroSpawn6[11][3] =
{
	{1203.41333, -8.66540, 1001.10388},
	{1203.19043, -8.34746, 1001.10388},
	{1203.29358, -8.47133, 1001.10388},
	{1203.10022, -8.61934, 1001.10388},
	{1202.93945, -8.46910, 1001.10388},
	{1202.90540, -8.30045, 1001.10388},
	{1203.38538, -8.25599, 1001.10388},
	{1203.04211, -8.15435, 1001.10388},
	{1202.86487, -8.78291, 1001.10388},
	{1202.84534, -8.62792, 1001.10388},
	{1203.17700, -8.80070, 1001.10388}
};
new Float:EstacionamientoMinero[10][4] =
{
	{-1280.7651,450.4886,7.0840,358.9461},
	{-1275.2996,450.8217,7.0841,358.0985},
	{-1269.7046,451.7606,7.0840,4.4092},
	{-1263.7773,450.7595,7.0840,3.3909},
	{-1259.1250,451.1145,7.0841,2.1065},
	{-1260.1409,471.3822,7.0807,180.4372},
	{-1265.9272,471.8560,7.0807,177.4233},
	{-1270.8258,471.8618,7.0807,179.1856},
	{-1276.2070,471.8233,7.0808,179.0241},
	{-1281.6302,471.3324,7.0806,179.3396}
};

new Float:EstacionamientoCamionero[59][4] =
{
	{2069.7180,2422.4978,10.7178,269.8497}, {2069.0488,2416.7107,10.7178,270.8350},	{2069.0100,2413.7415,10.7178,269.9562},
	{2069.3208,2410.7585,10.7178,267.8664},	{2069.1484,2407.7351,10.7178,268.9985},	{2069.2466,2404.8096,10.7197,269.5660},
	{2068.8679,2401.7734,10.7250,270.4845},	{2069.5366,2398.9690,10.7217,270.0494},	{2069.1985,2396.0447,10.7256,270.9738},
	{2068.7021,2393.2031,10.7255,271.3805},	{2069.0479,2390.0613,10.7255,268.8426},	{2078.3579,2422.3350,10.7178,90.1878},
	{2078.6353,2419.4163,10.7178,88.7606},	{2078.9937,2416.5027,10.7223,88.7923},	{2078.8472,2413.6343,10.7178,91.6046},
	{2078.6589,2410.7097,10.7178,90.9780},	{2069.4436,2419.5530,10.7178,269.2118},	{2078.0088,2407.6951,10.7177,91.5206},
	{2079.1050,2404.7798,10.7178,88.3970},	{2077.7427,2401.6953,10.7177,90.9732},	{2079.0037,2398.7427,10.7178,89.1851},
	{2079.1719,2395.9822,10.7177,89.6311},	{2078.4805,2392.9758,10.7178,88.8372},	{2078.3494,2389.9963,10.7179,91.4931},
	{2086.6340,2422.5757,10.7178,269.6368},	{2087.0779,2419.5530,10.7178,269.6935},	{2086.2122,2416.6030,10.7178,271.3036},
	{2086.3079,2413.6252,10.7176,270.9491},	{2087.0103,2410.7585,10.7178,270.8611},	{2086.5947,2407.7368,10.7178,271.1256},
	{2086.2122,2404.7976,10.7178,267.3324},	{2086.9910,2401.9883,10.7178,269.0317},	{2086.4133,2398.8130,10.7178,267.5578},
	{2086.2700,2395.9319,10.6875,269.5852},	{2086.2354,2392.9148,10.7178,269.0103},	{2086.1912,2390.1309,10.7178,270.2054},
	{2096.6958,2390.0129,10.7178,270.2597}, {2095.8147,2392.9041,10.7178,90.5982},	{2095.6445,2395.8586,10.7178,86.6870},
	{2096.2080,2398.9033,10.7178,89.0238},	{2096.4546,2401.8137,10.7178,87.6966},	{2096.3569,2404.7004,10.7178,88.0389},
	{2096.6760,2407.6082,10.7178,87.7897},	{2095.8726,2410.5107,10.7139,86.8762},	{2096.2737,2413.5745,10.7178,90.0802},
	{2096.4568,2416.6282,10.6877,89.0720},	{2096.4822,2419.4331,10.7178,89.4069},	{2096.3069,2422.3921,10.7178,91.2038},
	{2104.2380,2422.4290,10.7178,268.7301},	{2104.0344,2419.5662,10.7178,269.6224},	{2104.2651,2416.6438,10.7178,269.8183},
	{2103.8311,2413.6514,10.7178,271.1700},	{2104.4236,2410.7073,10.7178,270.8135},	{2104.9734,2407.8037,10.7177,268.0424},
	{2103.7742,2401.7839,10.6845,271.5938},	{2104.1587,2398.9211,10.7178,272.2759},	{2104.6467,2396.0334,10.7177,271.8693},
	{2103.9285,2392.9788,10.7178,269.3462},	{2104.2876,2390.0640,10.7178,269.4435}
};
new Float:EstacionamientoNormal[87][4] =
{
	{1700.9434,-1893.0575,-49.5459,359.1727},
	{1692.1959,-1892.3928,-49.5500,358.5018},
	{1687.4604,-1892.0718,-49.5457,359.5341},
	{1683.2198,-1891.9866,-49.5437,359.3870},
	{1678.6841,-1891.8391,-49.5452,359.3071},
	{1674.3474,-1891.7332,-49.5457,358.7783},
	{1670.0671,-1891.9661,-49.5439,358.9673},
	{1661.3129,-1891.8578,-49.5450,357.9927},
	{1652.4753,-1892.2537,-49.5214,359.0848},
	{1648.3402,-1892.2540,-49.5463,359.1805},
	{1643.7401,-1892.3600,-49.5437,358.9878},
	{1635.0544,-1892.2921,-49.5446,359.0557},
	{1630.7037,-1891.9773,-49.5178,359.3072},
	{1624.9020,-1885.8916,-49.5503,269.3125},
	{1624.9250,-1881.2821,-49.5458,270.2203},
	{1624.6895,-1876.6132,-49.5436,269.3907},
	{1624.7087,-1871.7465,-49.5199,270.7915},
	{1624.8037,-1866.7968,-49.5450,268.8862},
	{1624.8608,-1862.1732,-49.5446,269.6339},
	{1625.0593,-1857.2717,-49.5470,267.8584},
	{1624.9291,-1852.4271,-49.5458,269.1884},
	{1624.5190,-1847.6683,-49.5460,269.2230},
	{1643.8900,-1848.1674,-49.5444,356.9514},
	{1661.1975,-1848.7606,-49.5454,359.7119},
	{1682.9938,-1859.1254,-49.5460,270.7711},
	{1683.1062,-1863.2749,-49.5530,268.7698},
	{1682.7625,-1867.3658,-49.5182,269.2705},
	{1682.2968,-1872.0295,-49.5421,268.7775},
	{1692.0452,-1892.4513,-60.2719,359.0346},
	{1687.5537,-1891.8564,-60.2702,359.4271},
	{1678.9497,-1892.2196,-60.2717,358.1399},
	{1648.4669,-1891.5432,-60.2703,359.9407},
	{1643.8351,-1892.3015,-60.2711,359.1833},
	{1634.9308,-1892.0286,-60.2469,359.3054},
	{1624.5059,-1886.2368,-60.2436,270.3784},
	{1624.8840,-1881.0900,-60.2731,269.9742},
	{1625.0099,-1876.4462,-60.2453,272.3181},
	{1624.8190,-1852.7928,-60.2807,268.3029},
	{1624.3732,-1847.9072,-60.2442,271.4542},
	{1648.2174,-1849.0896,-60.2706,358.6554},
	{1661.0142,-1849.0599,-60.2452,359.5746},
	{1669.9652,-1848.4615,-60.2729,359.4380},
	{1682.5824,-1858.9597,-60.2738,269.5594},
	{1682.1111,-1863.0200,-60.2724,271.0364},
	{1682.3948,-1867.2174,-60.2725,269.7123},
	{1682.8677,-1871.9066,-60.2774,270.5558},
	{1698.5054,-1868.1997,-49.5449,90.5219},
	{1698.6495,-1863.1975,-49.5454,89.9168},
	{1698.7686,-1858.2522,-49.5480,91.1162},
	{1699.0171,-1853.0203,-49.5453,91.0152},
	{1698.3234,-1848.2490,-49.5494,91.2853},
	{1698.7477,-1843.3202,-49.5452,90.9259},
	{1698.1277,-1838.2383,-49.5191,89.5903},
	{1699.2198,-1833.3199,-49.5450,89.8076},
	{1699.1166,-1828.4044,-49.5181,92.6670},
	{1698.2000,-1823.2429,-49.5463,90.9048},
	{1698.7080,-1823.0408,-60.2779,89.5352},
	{1699.1685,-1828.2711,-60.2722,89.1948},
	{1698.3683,-1833.1237,-60.2443,88.8886},
	{1698.5221,-1838.2834,-60.2743,90.4589},
	{1699.1111,-1843.2233,-60.2729,90.1863},
	{1698.2303,-1848.1890,-60.2713,89.2910},
	{1698.6639,-1853.1273,-60.2731,89.2623},
	{1698.7783,-1858.1204,-60.2726,89.9146},
	{1698.5807,-1863.0490,-60.2723,90.2713},
	{1698.5999,-1867.9010,-60.2711,89.7022},
	{1696.6182,-1893.3223,-49.5174,2.0531},
	{1656.8086,-1892.0720,-49.5456,0.2596},
	{1639.4436,-1891.7799,-49.5199,0.0611},
	{1647.8235,-1848.3661,-49.5179,0.5933},
	{1652.1539,-1848.6429,-49.5468,0.6608},
	{1656.4976,-1848.3142,-49.5185,1.1586},
	{1665.6100,-1848.9293,-49.5456,0.2534},
	{1670.0616,-1848.5620,-49.5184,1.0163},
	{1700.9070,-1891.7345,-60.2478,0.7216},
	{1696.3022,-1891.9620,-60.2723,0.0890},
	{1683.2422,-1891.8271,-60.2709,0.1301},
	{1674.4420,-1891.9174,-60.2717,1.0014},
	{1670.2343,-1892.0488,-60.2461,0.0316},
	{1661.3765,-1891.9287,-60.2478,0.8051},
	{1656.9729,-1892.1548,-60.2722,0.3159},
	{1652.5803,-1891.8945,-60.2742,1.0098},
	{1639.4609,-1892.2233,-60.2710,0.4207},
	{1630.4873,-1892.0220,-60.2705,1.2220},
	{1652.2684,-1848.9530,-60.2729,0.5955},
	{1656.7208,-1849.1294,-60.2712,0.2793},
	{1665.4950,-1848.5863,-60.2708,0.8123}
};
new ArmaNombre2[47][] =
{
	"","Manopla","Palo de golf","Porra","Cuchillo","Bate de Beisbol","Pala","Palo de Pool","Katana","Motosierra","Dildo pUrpura","Dildo blanco","Dildo blanco grande","Dildo",	"Ramo de flores","Baston","Granada","Granada lagrimogena","Molotov",""," "," ","9mm","9mm silenciada","Desert eagle","Escopeta","Escopeta recortada","Escopeta de combate",	"Uzi","MP5","AK-47","M4","TEC-9","Rifle","Sniper Rifle","Bazooca","heatseeker","Lanzallamas","Minigun","satchel charge","Bomba",
	"Aerosol","Matafuego",	"Camara","Lentes de vision", "Lentes tùrrmico","Paracaidas"
};

new NombreArma[47][] =
{
	"",	"{ff3300}Manopla{FFFFFF} | ",	"{ff3300}Palo de golf{FFFFFF} | ",	"{ff3300}Palo de policia{FFFFFF} | ",	"{ff3300}Cuchillo{FFFFFF} | ",	"{ff3300}Bate de beisbol{FFFFFF} | ",	"{ff3300}Pala{FFFFFF} | ",	"{ff3300}Palo de billar{FFFFFF} | ",	"{ff3300}Katana{FFFFFF} | ",	"{ff3300}Motosierra{FFFFFF} | ",	"{ff3300}Consolador rosa{FFFFFF} | ",	"{ff3300}Vibrador blanco{FFFFFF} | ",	"{ff3300}Gran vibrador blanco{FFFFFF} | ",	"{ff3300}Vibrador plateado{FFFFFF} | ",
	"{ff3300}Ramo de flores{FFFFFF} | ",	"{ff3300}Baston{FFFFFF} | ",	"{ff3300}Granada{FFFFFF} | ",	"{ff3300}Gas Lacrimogeno{FFFFFF} | ",	"{ff3300}Molotov{FFFFFF} | ",	"{ff3300}jetpack{FFFFFF} | ",	" ",	" ",	"{ff3300}9mm{FFFFFF} | ",	"{ff3300}9mm con silenciador{FFFFFF} | ",	"{ff3300}Desert Eagle{FFFFFF} | ",	"{ff3300}Escopeta{FFFFFF} | ",	"{ff3300}Sawn Off{FFFFFF} | ",	"{ff3300}Escopeta de combate{FFFFFF} | ",
	"{ff3300}UZI{FFFFFF} | ",	"{ff3300}MP5{FFFFFF} | ",	"{ff3300}AK-47{FFFFFF} | ",	"{ff3300}M4{FFFFFF} | ",	"{ff3300}TEC-9{FFFFFF} | ",	"{ff3300}Rifle{FFFFFF} | ",	"{ff3300}Sniper{FFFFFF} | ",	"{ff3300}Lanzacohetes{FFFFFF} | ",	"{ff3300}Bazooka{FFFFFF} | ",	"{ff3300}Lanzallamas{FFFFFF} | ",	"{ff3300}Minigun{FFFFFF} | ",	"{ff3300}Bomba{FFFFFF} | ",	"{ff3300}Detonador{FFFFFF} | ",	"{ff3300}Spray{FFFFFF} | ",	"{ff3300}Extintor De Incendios{FFFFFF} | ",
	"{ff3300}Camara{FFFFFF} | ",	"{ff3300}Lentes de visiùn nocturna{FFFFFF} | ",	"{ff3300}Gafas termicas{FFFFFF} | ",	"{ff3300}Paracaidas"
};

new NombreAuto[212][] =
{
	{"Landstalker"},{"Bravura"},{"Buffalo"},{"Linerunner"},{"Perrenial"},{"Sentinel"},{"Dumper"},	{"Firetruck"},{"Trashmaster"},{"Stretch"},{"Manana"},{"Infernus"},{"Voodoo"},{"Pony"},{"Mule"},	{"Cheetah"},{"Ambulance"},{"Leviathan"},{"Moonbeam"},{"Esperanto"},{"Taxi"},{"Washington"},	{"Bobcat"},{"Mr Whoopee"},{"BF Injection"},{"Hunter"},{"Premier"},{"Enforcer"},{"Securicar"},
	{"Banshee"},{"Predator"},{"Bus"},{"Rhino"},{"Barracks"},{"Hotknife"},{"Trailer 1"},{"Previon"},	{"Coach"},{"Cabbie"},{"Stallion"},{"Rumpo"},{"RC Bandit"},{"Romero"},{"Packer"},{"Monster"},	{"Admiral"},{"Squalo"},{"Seasparrow"},{"Pizzaboy"},{"Tram"},{"Trailer 2"},{"Turismo"},	{"Speeder"},{"Reefer"},{"Tropic"},{"Flatbed"},{"Yankee"},{"Caddy"},{"Solair"},{"Berkleys RC Van"},
	{"Skimmer"},{"PCJ-600"},{"Faggio"},{"Freeway"},{"RC Baron"},{"RC Raider"},{"Glendale"},{"Oceanic"},	{"Sanchez"},{"Sparrow"},{"Patriot"},{"Quad"},{"Coastguard"},{"Dinghy"},{"Hermes"},{"Sabre"},	{"Rustler"},{"ZR-350"},{"Walton"},{"Regina"},{"Comet"},{"BMX"},{"Burrito"},{"Camper"},{"Marquis"},	{"Baggage"},{"Dozer"},{"Maverick"},{"News Chopper"},{"Rancher"},{"FBI Rancher"},{"Virgo"},{"Greenwood"},
	{"Jetmax"},{"Hotring"},{"Sandking"},{"Blista Compact"},{"Police Maverick"},{"Boxville"},{"Benson"},	{"Mesa"},{"RC Goblin"},{"Hotring Racer A"},{"Hotring Racer B"},{"Bloodring Banger"},{"Rancher"},	{"Super GT"},{"Elegant"},{"Journey"},{"Bike"},{"Mountain Bike"},{"Beagle"},{"Cropdust"},{"Stunt"},	{"Tanker"}, {"Roadtrain"},{"Nebula"},{"Majestic"},{"Buccaneer"},{"Shamal"},{"Hydra"},{"FCR-900"},
	{"NRG-500"},{"HPV1000"},{"Cement Truck"},{"Tow Truck"},{"Fortune"},{"Cadrona"},{"FBI Truck"},	{"Willard"},{"Forklift"},{"Tractor"},{"Combine"},{"Feltzer"},{"Remington"},{"Slamvan"},	{"Blade"},	{"Freight"},{"Streak"},{"Vortex"},{"Vincent"},{"Bullet"},{"Clover"},{"Sadler"},	{"Firetruck LA"},{"Hustler"},{"Intruder"},{"Primo"},{"Cargobob"},{"Tampa"},{"Sunrise"},{"Merit"},	{"Utility"},
	{"Nevada"},{"Yosemite"},{"Windsor"},{"Monster A"},{"Monster B"},{"Uranus"},{"Jester"},	{"Sultan"},{"Stratum"},{"Elegy"},{"Raindance"},{"RC Tiger"},{"Flash"},{"Tahoma"},{"Savanna"},	{"Bandito"},	{"Freight Flat"},{"Streak Carriage"},{"Kart"},{"Mower"},{"Duneride"},{"Sweeper"},	{"Broadway"},{"Tornado"},{"AT-400"},{"DFT-30"},{"Huntley"},{"Stafford"},{"BF-400"},{"Newsvan"},	{"Tug"},{"Trailer 3"},
	{"Emperor"},{"Wayfarer"},{"Euros"},{"Hotdog"},{"Club"},{"Freight Carriage"},	{"Trailer 3"},{"Andromada"},{"Dodo"},{"RC Cam"},{"Launch"},{"Police Car (LSPD)"},{"Police Car (SFPD)"},	{"Police Car (LVPD)"},	{"Police Ranger"},{"Picador"},{"S.W.A.T Van"},{"Alpha"},{"Phoenix"},{"Glendale Chocado"},	{"Sadler"},{"Luggage Trailer A"},{"Luggage Trailer B"},{"Stair Trailer"},{"Boxville"},{"Farm Plow"},	{"Utility Trailer"}
};

enum HalloweenEvento
{
	sombreros[128],
	Payasos[32]
}
new E_Halloween[HalloweenEvento];

enum HalloweenPuestos
{
	P1Hora,P2Hora,P3Hora,P4Hora,P5Hora,P6Hora,P7Hora,P8Hora,P9Hora,P10Hora,P11Hora,P12Hora,P13Hora,P14Hora,P15Hora,P16Hora,P17Hora,P18Hora,P19Hora,P20Hora,P21Hora,P22Hora,P23Hora,P24Hora,P25Hora,P26Hora,P27Hora,P28Hora,P29Hora,P30Hora,P31Hora,P32Hora,sombreros[128]
}
new Halloween[MAX_PLAYERS][HalloweenPuestos];


enum ACFZ
{
	@Teleport,
 	@pWeapon = 0,
	p_CarWarpVehicleID,
	acKicked,
	acHealth,
	acArmour,
	bool:acDeathRes,
	bool:acDead,
	acUpdateTick,
	acDmgRes,
	acGtc[20]
}
new PlayerAnticheat[MAX_PLAYERS][ACFZ];

enum RutaCosechas
{
	RutaCosecha,
	ProgresoCosecha,
	CosechaLugar,
}
new Cosechas[MAX_PLAYERS][RutaCosechas];

enum TransportistasO
{
	Objeto1,
	Objeto2,
	Objeto3,
	Ruta
}
new Transportistas[MAX_PLAYERS][TransportistasO];

enum Barras
{
    PlayerBar:Cosecha,
	PlayerBar:Camionero,
	PlayerBar:ReparandoBar,
	PlayerBar:Picar,
	PlayerBar:Revisar
};
new Progressbar[MAX_PLAYERS][Barras];

enum _:E_ADMIN_LEVELS
{
	ADMIN_LEVEL_USER,
	ADMIN_LEVEL_AYUDANTE,
	ADMIN_LEVEL_DUDAS,
	ADMIN_LEVEL_BANEOS,
	ADMIN_LEVEL_SANCIONES,
	ADMIN_LEVEL_GLOBAL,
	ADMIN_LEVEL_ADM_TEMP,
	ADMIN_LEVEL_ADM,
	ADMIN_LEVEL_PROGRAMMER
}

enum Users
{
	User,
	Cantidad
};
new Usuarios[Users];

enum jInfo
{
	suspendido, 
	pBotiquines, 
	enHospital, 
	pLogroNivel, 
	pCaramelos,    
	pTrucoTrato,	
	TiempoPD,    
	pFiestaCerveza,	
	pHechizado, 	
	pLogroPutiClub,    
	pAfinidad1,    
	pAfinidad2,    
	pAfinidad3,    
	pAfinidad4,    
	pAfinidad5,    
	pAfinidad6,    
	pPuntosCarrera,	
	pObj,	
	Float:pfOffsetX,	
	Float:pfOffsetY,	
	Float:pfOffsetZ,	
	Float:pfRotX,	
	Float:pfRotY,	
	Float:pfRotZ,	
	Float:pfScaleX,	
	Float:pfScaleY,	
	Float:pfScaleZ,	
	pSlot,	
	pObj2,
	AsaltoBlindado, 
	Striptease,
	Float:pfOffsetX2,	
	Float:pfOffsetY2,	
	Float:pfOffsetZ2,	
	Float:pfRotX2,	
	Float:pfRotY2,	
	Float:pfRotZ2,	
	Float:pfScaleX2,	
	Float:pfScaleY2,	
	Float:pfScaleZ2,	
	pSlot2,	
	pObj3,	
	Float:pfOffsetX3,	
	Float:pfOffsetY3,	
	Float:pfOffsetZ3,	
	Float:pfRotX3,	
	Float:pfRotY3,	
	Float:pfRotZ3,	
	Float:pfScaleX3,	
	Float:pfScaleY3,	
	Float:pfScaleZ3,	
	pSlot3,	
	pObj4,	
	Float:pfOffsetX4,	
	Float:pfOffsetY4,	
	Float:pfOffsetZ4,	
	Float:pfRotX4,	
	Float:pfRotY4,
	pAutomedicado, 
	pKrippy, 
	pLSD,	
	pRemedios,
	pMedicamentos,	
	pAdicto,	
	pCracks,	
	pMedico,	
	pReanimados,	
	pTortuga,	
	pCasa,	
	pRestaurante,	
	pOficina,	
	pCerrajero,	
	pForzadas,	
	pPilotoExperto,	
	pGanadas,	
	pNegocioRedondo,	
	pCosecha,	
	pMarihuanero,	
	pPorros,	
	pWP0,	
	pWP1,	
	pWP2,	
	pWP3,	
	pWP4,	
	pWP5,	
	pWP6,	
	pWP7,	
	pWP8,	
	pWP9,	
	pWP10,	
	pWP11,	
	pWP12,	
	pNivelMecanico,	
	pExpPiloto,	
	pNivelLadron,	
	pExpLadron,	
	pNivelBasurero,	
	pExpBasurero,	
	pNivelCamionero,	
	pExpCamionero,
	pNivelTransportista,	
	pExpTransportista,	
	pNivelArmero, 
	pSemillas,	
	pExpArmero,	
	pNivelPescador,	
	pExpPescador,	
	pNivelMedico,	
	Float:jPosE_x,	
	Float:jPosE_y,	
	Float:jPosE_z,	
	pExpMedico,	
	pExpMinero,	
	pNivelMinero,	
	ConsumiendoEfecto,
	Float:hx,	
	Float:hy,	
	Float:hz,
	Float:@analgesico,
	Float:@Salud,	
	Float:@Chaleco,	
	Float:@X,	
	Float:@Y,	
	Float:@Z,	
	Float:@A,	
	pPassword[128],	
	tempPassword[129],	
	pExpulsando[32],	
	pLNumero,	
	pPasajeros,	
	pDineroRobado,	
	pEMS,	
	pCama,	
	pVwCama,	
	pAtendido,
	pMedicina,	
	pEnfermedad,	
	pBanco,
	pRango,	
	pMarihuana,	
	pCrack,	
	pMateriales,	
	pAgenda,	
	pNumero,	
	pMascara,	
	pGuia, 
	j_ARMAS[13],	
	pMascaraPuesta,  
	pSonidos,	
	pMuteos,	
	pBarras,	
	pAlerta,	
	pVelocimetro,	
	pID,	
	pOnline,	
	pPatines,	
	pGPS,	
	pRadio,	
	pDuty,	
	pModelo,	
	pSocioHP,	
	pTipoCarcel,	
	pTiempoCarcel,	
	pTiempoJail,	
	pTiempoDepa,	
	pCargos,	
	p_Ban,	
	pRazon[32],	
	pInterior,	
	pMundoVirtual,	
	QuienC[150],	
	IP[16],	
	EnCasa,	
	EnRopero,
	EnGarage,	
	PrecioNivel,	
	NivelExp,	
	hprecio,	
	hmoneda,	
	h2precio,	
	h2moneda,	
	Repuestos,	
	Mobile,	
	MobileSub,	
	CasaID[4],	
	CasaID2, 
	CasaID3,	
	EstacionamientoID,	
	vEstacionado1,	
	vEstacionado2,	
	vEstacionado3,	
	vEstacionado4,
	vEstacionado5,	
	pEnEstacionamiento,	
	Moneda,	
	Totem[32],	
	Totems,	
	arrestado,	
	horasjugadas,	
	Float:Ent_Totem,	
	pVip,	
	pTrabajo2,	
	finmes,	
	findia,	
	finano,	
	piezas,	
	Agonizando,	
	pAdmin,	
	jSexo,	
	pTrabajo,	
	jEdad,	
	jRopa,	
	pFaccion,	
	@Nivel,	
	jDinero,	
	jTiempoON,
	jExperiencia, 
	pEnFC,	
	pIpRegistro[32],	
	finlicencia,	
	ContraTemporal[128],	
	pPaisRegistro[30],	
	PaisDistinto,	
	jRegistrado,	
	Nickname[MAX_PLAYER_NAME],	
	jConexion[90],	
	pSed,	
	pLicencia,	
	pHambre,	
	jMartillo,	
	jDestornillador,	
	jBarreta,	
	jBalde,	
	Float:pOX,	
	Float:pOY,	
	Float:pOZ,	
	Float:pOA,	
	VE1,	
	VE2,	
	VE3,	
	VE4,	
	vMonedaa,	
	vModelo,	
	vGas,	
	vinterior,	
	vvw,	
	vColor1,
	vColor2,	
	Float:pVidaV,	
	vBaul,	
	vBaul2,	
	vBaul3,	
	vBaul4,	
	vBaul5,	
	vBaul6,	
	vBaul7,	
	vBaul8,
	vBaul9,
	vBaul10,	
	vPJ,	
	vpatente[10],	
	vComponentes0,	
	vComponentes1,	
	vComponentes2,	
	vComponentes3,	
	vComponentes4,	
	vComponentes5,
	vComponentes6,	
	vComponentes7,	
	vComponentes8,	
	vComponentes9,	
	vComponentes10,	
	vComponentes11,	
	vComponentes12,	
	vComponentes13,	
	vPrecio,	
	vTraba,	
	Float:vX,	
	Float:vY,	
	Float:vZ,	
	Float:vA,	
	vOvw,	
	vSeguro,	
	vOinterior,	
	Float:pOX2,	
	Float:pOY2,
	Float:pOZ2,	
	Float:pOA2,	
	V2E1,	
	V2E2,	
	V2E3,	
	V2E4,	
	v2Monedaa,	
	vModelo2,	
	v2Gas,	
	v2interior,	
	v2vw,	
	v2Color1,	
	v2Color2,	
	Float:pVidaV2,	
	v2Baul,	
	v2Baul2,	
	v2Baul3,	
	v2Baul4,	
	v2Baul5,	
	v2Baul6,	
	v2Baul7,	
	v2Baul8,	
	vPJ2,	
	v2patente[10],	
	v2Componentes0,	
	v2Componentes1,	
	v2Componentes2,	
	v2Componentes3,	
	v2Componentes4,	
	v2Componentes5,	
	v2Componentes6,	
	v2Componentes7,	
	v2Componentes8,	
	v2Componentes9,	
	v2Componentes10,	
	v2Componentes11,
	v2Componentes12,	
	v2Componentes13,	
	v2Precio,	
	v2Traba,	
	Float:v2X,	
	Float:v2Y,	
	Float:v2Z,	
	Float:v2A,	
	v2Ovw,	
	vSeguro2,	
	v2Ointerior,	
	Float:pOX3,	
	Float:pOY3,	
	Float:pOZ3,	
	Float:pOA3,	
	V3E1,	
	V3E2,	
	V3E3,	
	V3E4,	
	v3Monedaa,	
	vModelo3,	
	v3Gas,	
	v3interior,	
	v3vw,	
	v3Color1,	
	v3Color2,	
	Float:pVidaV3,	
	v3Baul,	
	v3Baul2,	
	v3Baul3,	
	v3Baul4,	
	v3Baul5,	
	v3Baul6,	
	v3Baul7,	
	v3Baul8,	
	vPJ3,	
	v3patente[10],	
	v3Componentes0,	
	v3Componentes1,
	v3Componentes2,	
	v3Componentes3,	
	v3Componentes4,	
	v3Componentes5,	
	v3Componentes6,	
	v3Componentes7,	
	v3Componentes8,	
	v3Componentes9,	
	v3Componentes10,	
	v3Componentes11,	
	v3Componentes12,	
	v3Componentes13,	
	v3Precio,	
	v3Traba,	
	Float:v3X,	
	Float:v3Y,	
	Float:v3Z,	
	Float:v3A,	
	v3Ovw,	
	vSeguro3,	
	v3Ointerior,	
	Float:pOX4,	
	Float:pOY4,	
	Float:pOZ4,	
	Float:pOA4,	
	V4E1,	
	V4E2,	
	V4E3,	
	V4E4,	
	v4Monedaa,	
	vModelo4,	
	v4Gas,	
	v4interior,	
	v4vw,	
	v4Color1,	
	v4Color2,
	Float:pVidaV4,	
	v4Baul,	
	v4Baul2,	
	v4Baul3,	
	v4Baul4,	
	v4Baul5,	
	v4Baul6,	
	v4Baul7,	
	v4Baul8,	
	vPJ4,	
	v4patente[10],	
	v4Componentes0,	
	v4Componentes1,	
	v4Componentes2,	
	v4Componentes3,	
	v4Componentes4,	
	v4Componentes5,	
	v4Componentes6,	
	v4Componentes7,	
	v4Componentes8,	
	v4Componentes9,	
	v4Componentes10,	
	v4Componentes11,	
	v4Componentes12,	
	v4Componentes13,	
	v4Precio,	
	v4Traba,	
	Float:v4X,	
	Float:v4Y,	
	Float:v4Z,	
	Float:v4A,	
	v4Ovw,	
	vSeguro4,
	v4Ointerior,
	Float:pOX5,	
	Float:pOY5,	
	Float:pOZ5,	
	Float:pOA5,	
	V5E1,	
	V5E2,	
	V5E3,	
	V5E4,	
	v5Monedaa,	
	vModelo5,	
	v5Gas,	
	v5interior,	
	v5vw,	
	v5Color1,	
	v5Color2,
	Float:pVidaV5,	
	v5Baul,	
	v5Baul2,	
	v5Baul3,	
	v5Baul4,	
	v5Baul5,	
	v5Baul6,	
	v5Baul7,	
	v5Baul8,
	v5Baul9,
	v5Baul10,	
	vPJ5,	
	v5patente[10],	
	v5Componentes0,	
	v5Componentes1,	
	v5Componentes2,	
	v5Componentes3,	
	v5Componentes4,	
	v5Componentes5,	
	v5Componentes6,	
	v5Componentes7,	
	v5Componentes8,	
	v5Componentes9,	
	v5Componentes10,	
	v5Componentes11,	
	v5Componentes12,	
	v5Componentes13,	
	v5Precio,	
	v5Traba,	
	Float:v5X,	
	Float:v5Y,	
	Float:v5Z,	
	Float:v5A,	
	v5Ovw,	
	vSeguro5,
	v5Ointerior,
	pt_LAST_TERRITORY,
	pt_LAST_SHOT_TIME,	
	jRegalo,	
	jMuteado, 
	CodigoEmail[10],	
	EstadoCorreo,	
	PuedeCambiar,	
	pEmail[52],
	vAlarma,	
	v2Alarma,	
	v3Alarma,	
	v4Alarma,
	v5Alarma,	
	vAAlarma,	
	vAAlarma2,	
	vAAlarma3,	
	vAAlarma4,
	vAAlarma5, 
	BaneosD, 
	BaneosD2, 
	v2Baul9,
	v2Baul10,
	v3Baul9,
	v3Baul10,
	v4Baul9,
	v4Baul10,
	pMapper, 
	pBloqueado, 
	pRazonSan[50], 
	@TempBan, 
	acSetPosTick, 
	pStats,
	pRecompensaLZ,
	sancionado,
	Float:pfRotZ4,	
	Float:pfScaleX4,	
	Float:pfScaleY4,	
	Float:pfScaleZ4,
	pSlot4,	
	pSobreRuedas,
	varzonasegura,
	pEstadoX[60],
	vID1,
	vID2,
	vID3,
	vID4,
	vID5,
	vSALTO_V, 
	vSALTO_V_1, 
	vSALTO_V_2, 
	vACELERACION, 
	vACTIVE,
	v2SALTO_V, 
	v2SALTO_V_1, 
	v2SALTO_V_2, 
	v2ACELERACION, 
	v2ACTIVE,
	v3SALTO_V, 
	v3SALTO_V_1, 
	v3SALTO_V_2, 
	v3ACELERACION, 
	v3ACTIVE,
	v4SALTO_V, 
	v4SALTO_V_1, 
	v4SALTO_V_2,
	v4ACELERACION, 
	v4ACTIVE, 
	v5SALTO_V, 
	v5SALTO_V_1, 
	v5SALTO_V_2,
	v5ACTIVE,
	v5ACELERACION, 	
	pAcento, 
	TiempoTwitter,
	TUNEANDO,
	SEXOSELECCIONADO,
	EstadoON,
	Muertos, //Cuantos ha abatido
	Muertes, //Cuantas veces ha muerto
	pClima,
	Trabajando,
	CargoTrailer,
	Text:VehicleName, // The TextDraw that contains the vehicle name
	Text:SpeedometerText, // The TextDraw of the speedometer for this player
	Text:FuelGauge, // The textdraw of the fuel-gauge for this player
	Text:Velo0,
	Text:Velo1,
	Text:Velo2,
	Text:Velo3,
	Text:Velo4,
	Text:Velo5,
	Text:Velo6,
	Text:Velo7,
	Text:Velo8,
	Text:Velo9,
	Text:Velo10,
	Text:Velo11,
	Text:Velo12,
	Text:Velo13,
	//        Text:Velo14,
	SpeedometerTimer, // Holds the reference to the speedometer timer for this player
	PlayerSpeed, // Holds the speed of the player
	PlayerCaughtSpeeding, // This holds a value to prevent being caught multiple times by the same speedcamera 
	Text:VeloDraw[20],
	OtrasArmas,
	T_Guarda,
	T_Guarda2,
	T_Guarda3,
	T_Guarda4,
	T_Guarda5,
	T_Guarda6,
	LiderApsa,
	EnApsa,
	ViendoTransmision,
	TransmitiendoApsa,
	BalasGoma,
	EmpresaActual,
	jEmpresaKey, // Empresa
	jEmpresaLlaves,
	jContrato, // Contrato en empresa
};
new PLAYER_INFO[MAX_PLAYERS][jInfo];
new AC_LZ = 0;
new Envivo = 0;
new EnvivoAutorizado = 0;
new bool:EnGaraje[MAX_PLAYERS],bool:EnGaraje2[MAX_PLAYERS],C_Type[MAX_PLAYERS],Float:EditandoCoche[MAX_PLAYERS][6],ObjetoSlot[MAX_PLAYERS],ColorSlot[MAX_PLAYERS],TuneandoCoche[MAX_PLAYERS],PickupTuning[MAX_PLAYERS],ObjetoTuning[MAX_PLAYERS],ObjetoTuning2[MAX_PLAYERS];
#define MAX_VEHICLE_OBJECTS_INDEXS	5
enum
{
	VOBJECT_TYPE_OBJECT,
	VOBJECT_TYPE_TEXT,
	VOBJECT_TYPE_COUNTRY_FLAG,
	VOBJECT_TYPE_COUNTRY_PANEL
};
enum e_VEHICLE_OBJECTS
{
	bool:vobject_VALID,
	vobject_TYPE,
	vobject_NAME[32],
	vobject_ID,
	vobject_OBJECT_ID,
	vobject_MODELID,
	Float:vobject_OFFSET[3],
	Float:vobject_ROT[3],
	vobject_ATTACHED,
	vobject_COLORS[MAX_VEHICLE_OBJECTS_INDEXS],

	vobject_text_TEXT[32],
	vobject_text_FONT[24],
	vobject_text_FONT_SIZE,
	vobject_text_BOLD,
	vobject_text_FONT_COLOR
};
new VEHICLE_OBJECTS[MAX_VEHICLES][10][e_VEHICLE_OBJECTS];

enum e_Tuning_Shop_Objects
{
	tuning_object_MODELID,
	tuning_object_NAME[24],
	tuning_object_PRICE
};
new Tuning_Shop_Objects[][e_Tuning_Shop_Objects] =
{
	{11701, "Luces_emergencia", 45000},
	{1000, "spl_b_mar_m", 30000},
	{1001, "spl_b_bab_m", 30000},
	{1002, "spl_b_bar_m", 30000},
	{1003, "spl_b_mab_m", 30000},
	{1004, "bnt_b_sc_m", 90000},
	{1005, "bnt_b_sc_l", 30000},
	{1007, "wg_l_b_ssk", 20000},
	{1018, "exh_b_ts", 35000},
	{1019, "exh_b_t", 35000},
	{1021, "exh_b_m", 35000},
	{1024, "lgt_b_sspt", 20000},
	{1029, "exh_c_s", 30000},
	{1043, "exh_lr_br2", 35000},
	{1044, "exh_lr_br1", 30000},
	{1047, "wg_l_a_f", 25000},
	{1048, "wg_l_c_f", 25000},
	{1049, "spl_a_f_r", 30000},
	{1050, "spl_c_f_r", 30000},
	{1056, "wg_l_a_st", 25000},
	{1090, "wg_l_a_u", 25000},
	{19078, "TheParrot1", 80000},
	{19917, "CutsceneEngine1", 105000},
	{19893, "LaptopSAMP1", 60000},
	{2768, "CJ_CB_BURG", 10000},
	{19838, "CoffeeCup1", 10000},
	{11736, "MedicCase1", 30000},
	{1247, "bribe", 80000},
	{19147, "PinSpotLight5", 50000},
	{19148, "PinSpotLight6", 50000},
	{19149, "PinSpotLight7", 50000},
	{19151, "PinSpotLight9", 50000},
	{19153, "PinSpotLight11", 50000},
	{19580, "Pizza1", 10000},
	{2690, "CJ_FIRE_EXT", 50000},
	{19308, "taxi01", 30000},
	{1550, "CJ_MONEY_BAG", 40000},
	{19306, "kmb_goflag2", 50000},
	{19307, "kmb_goflag3", 50000},
	{18647, "RedNeonTube1", 60000},
	{18648, "BlueNeonTube1", 60000},
	{18649, "GreenNeonTube1", 60000},
	{18650, "YellowNeonTube1", 60000},
	{18651, "PinkNeonTube1", 60000},
	{18652, "WhiteNeonTube1", 60000},
	{18749, "SAMPLogoSmall", 50000},
	{19054, "XmasBox1", 30000},
	{19133, "ArrowType4", 50000},
	{19471, "forsale02", 30000},
	{19878, "Skateboard1", 20000},
	{19314, "bullhorns01", 50000},
	{2404, "CJ_SURF_BOARD", 30000},
	{2405, "CJ_SURF_BOARD2", 30000},
	{2406, "CJ_SURF_BOARD3", 30000},
	{19317, "bassguitar01", 20000},
	{19318, "flyingv01", 20000},
	{2232, "MED_SPEAKER_4", 30000},
	{1840, "speaker_2", 20000},
	{2229, "SWANK_SPEAKER", 40000},
	{1025, "wheel_or1", 25000},
	{1073, "wheel_sr6", 25000},
	{1074, "wheel_sr3", 25000},
	{1075, "wheel_sr2", 25000},
	{1076, "wheel_lr4", 25000},
	{1077, "wheel_lr1", 25000},
	{1078, "wheel_lr3", 25000},
	{1079, "wheel_sr1", 25000},
	{1080, "wheel_sr5", 25000},
	{1081, "wheel_sr4", 25000},
	{1082, "wheel_gn1", 25000},
	{1083, "wheel_lr2", 25000},
	{1084, "wheel_lr5", 25000},
	{1085, "wheel_gn2", 25000},
	{1096, "wheel_gn3", 25000},
	{1097, "wheel_gn4", 25000},
	{1098, "wheel_gn5", 25000},
	{19894, "laptop", 45000},
	{19873, "toiletpaperroll1", 2000},
	{19874, "soapbar1", 2000},
	{19624, "case1", 6000},
	{19621, "obj1", 15000},
	{19620, "police", 105000},
	{1115, "parachoque", 25000},
	{1046, "parachoque", 25000},
	{1153, "parachoque", 25000},
	{1152, "parachoque", 25000},
	{1160, "parachoque", 25000},
	{1013, "parachoque", 25000},
	{1171, "parachoque", 25000},
	{1169, "parachoque", 25000},
	{1184, "parachoque", 25000},
	{1185, "parachoque", 25000},
	{1188, "parachoque", 25000},
	{1189, "parachoque", 25000},
	{1190, "parachoque", 25000},
	{1191, "parachoque", 25000},
	{1192, "parachoque", 25000},
	{1193, "parachoque", 25000},
	{1164, "Aleron", 250000},
	{1111, "Insignia", 250000}
};
enum Global_Vehicles_Info
{
	bool:gb_vehicle_VALID,
	bool:gb_vehicle_OCCUPIED,
	gb_vehicle_TYPE,
	gb_vehicle_MODELID,
	gb_vehicle_NUMBER_PLATE[32],
	Float:gb_vehicle_POS[3],
	Float:gb_vehicle_SPAWN_X,
	Float:gb_vehicle_SPAWN_Y,
	Float:gb_vehicle_SPAWN_Z,
	Float:gb_vehicle_SPAWN_ANGLE,
	pt_INMUTE_VEH_TP,
	Float:gb_vehicle_HEALTH,
	gb_vehicle_DAMAGE_PANELS,
	gb_vehicle_DAMAGE_DOORS,
	gb_vehicle_DAMAGE_LIGHTS,
	gb_vehicle_DAMAGE_TIRES,
	gb_vehicle_COLOR_1,
	gb_vehicle_COLOR_2,
	gb_vehicle_PAINTJOB,
	Float:gb_vehicle_GAS,
	Float:gb_vehicle_MAX_GAS,
	gb_vehicle_COMPONENTS[14],
	gb_vehicle_STATE,
	gb_vehicle_INTERIOR,
	gb_vehicle_WORLD,
	gb_vehicle_PARAMS_ENGINE,
	gb_vehicle_PARAMS_LIGHTS,
	gb_vehicle_PARAMS_ALARM,
	gb_vehicle_PARAMS_DOORS,
	gb_vehicle_PARAMS_BONNET,
	gb_vehicle_PARAMS_BOOT,
	gb_vehicle_PARAMS_OBJECTIVE,
	gb_vehicle_DRIVER,
	gb_vehicle_LAST_DRIVER,
	gb_vehicle_LAST_CLOSED_TIME,
	gb_vehicle_LAST_REPAIR_TIME,
	bool:gb_vehicle_SPAWNED,
	gb_vehicle_TP_IMMUNITY,
	gp_vehicle_vip,
	gb_vehicle_ATTACHED_TO,
	Text3D:gb_vehicle_LABEL,
	gb_vehicle_ACELERACION,
	gb_vehicle_ACELERACION_ACTIVE,
	gb_vehicle_SALTO_V,
	gb_vehicle_SALTO_V_1,
	gb_vehicle_SALTO_V_2,
	gb_vehicle_EMISORA_ID
};
new GLOBAL_VEHICLES[MAX_VEHICLES][Global_Vehicles_Info];

#define     MAX_LISTITEMS       300
enum E_TEMP_INFO
{
	PuedeRobar,
	@TemporalWeapon,
	@pHospital,
	@Specteando,
	WaterSound,
	@ContraVacia,
	pCuentasIP,
	NAMES[2500],
	pt_RolBasurero,
	bool:pt_Transportista,
	bool:pt_Camionero,
	pOwner,
	pt_SPEAKERS_TIME,
	bool:pt_MUSIC_FOR_SPEAKERS,
	pt_DIALOG_ID,
	pt_VIDEO_ID[24],
	pt_VIDEO_NAME[64],
	pt_PLAYER_WAITING_MP3_HTTP,
	bool:pt_MUSIC_FOR_PROPERTY,
	bool:pt_MUSIC_FOR_VEHICLE,
	bool:pt_DIALOG_RESPONDED,
	pOwnerCMD_Use,
	voIP[32],
	pSeleccion_Regalos,
	pSeleccion_Regalos_Staff,
	pSeleccion_Regalos_Jugador,
	TimerRobar,
	TimerBendaje,
	TiendaRobando,
	pVEHICLES[5],
	pVEHICLES_SLOT[5],
	pVehiclesFaccion[MAX_VEH_FAC],
	pt_FABRICA_ID,
	pt_TIENE_BARRIL,
	pt_TIENE_CRISTAL,
	pt_TIENE_CAJA,
	pt_PARTICIPO,
	pt_LLEVA_DINERO,
	pt_TIEMPO_BOLSO,
	bool:pt_ENPOSTULACION,
	bool:pt_EXIPOSTULACION,
	pt_RESPUES_POSTULACION_0[145],
	pt_RESPUES_POSTULACION_1[145],
	pt_RESPUES_POSTULACION_2[145],
	pt_RESPUES_POSTULACION_3[145],
	pt_RESPUES_POSTULACION_4[145],
	pt_RESPUES_POSTULACION_5[145],
	pt_RESPUES_POSTULACION_6[145],
	pt_RESPUES_POSTULACION_7[145],
	pt_RESPUES_POSTULACION_8[145],
	pt_RESPONSED_CV,
	t_TIME_POSTULACION,
	p_PLAYER_LISTITEM[MAX_LISTITEMS],
	p_SELECTED_TOY_SLOT,
	pt_PLAYER_PHONE_BOOK_SELECTED,
	pt_PLAYER_PHONE_BOOK_ADD_NUMBER,
	pt_PLAYER_PHONE_NUMBER_SELECTED,
	bool:LoroHabla,
	pDELETE_CAR_PLAYERID,
	pt_PLAYER_EVENTODM,
	pt_EVENTO_INT,
	pt_EVENTO_VW,
	Float:pt_EVENTO_POS[3],
	pt_SELECTED_POLICE_OBJECT_ID,
	pt_COUNT_DEATHS,
	VariableCaido,
	p_ESCUCHANDO_EMISORA,
	PagoPeaje,
	Macros,
	pt_Nombre,
	bool:p_IN_DISCOTEC,
	jSelectRango,
	jOpcionBanda,
	p_INVITACIONES[15],
	p_INVITACIONES_ID[15],
	BandaOfertada[2],
	PidioTimbre,
	pFianzaTotal,
	pTiempoFianza,
	EntrandoAuto,
	pt_PIVOT_OBJECT,
	pt_TUNING_EDIT_SLOT,
	p_TUNNING_VEHICLE_ID,
	Float:pt_OLD_EDIT_VOBJECT_POS[6],
	bool:p_TUNING,
	pt_COUNTRY_TYPE,
	IsAndroid,
	CpIncendio,
	ListaIncendios1[60],
	AparecioLogin,
	ListaGasolineras[60],
	LVehFacc[MAX_LISTITEMS],
	ListaMnegros[60],
	CargaGasolinera,
	GE_Seleccionado,
	CasaOfrecida,
	CasaSeleccionada,
	HeridoBalasGoma,
	ViendoApsa,
	Hurtado,
	TextEntrar,
	restriccion_mochila,
	CoolDown_Incautar,
	BaulSeleccionado,
	AnuncioTipo2,
	TDP_TIPO,
	Float:TDP_X,
	Float:TDP_Y,
	Float:TDP_Z,
	Float:TDP_A,
	TDP_COLOR1,
	TDP_COLOR2,
	TDP_MODEL,
	TDP_PRECIO,
	TDP_VMONEDA,
	Float:TP_X,
	Float:TP_Y,
	Float:TP_Z,
	DESBUG,
	pt_LAST_VEHICLE_DESTROY,
	pt_Antiflood,
	ViendoMenu,
	Taximetro,
	VPN,
	PaisActual[120],
	Ciudad[60],
	ISP[64],
	ADVCHEAT,
	EncendiendoVeh,
	RecienRegistradoTmp,
	Expulsando,
	Adv_NAR,
	Logueos,
	UltDialog,
	SecondsDialog,
	VehFacc_S,
	pNavidad,
	pt_LAST_PICKUP_ID,
	HotDog_S
}
new PLAYER_TEMP[MAX_PLAYERS][E_TEMP_INFO];
new const ADMIN_RANKS_FULLNAME[][] =
{
	"Usuario",
	"Ayudante",
	"Moderador de dudas",
	"Moderador del foro",
	"Moderador del juego",
	"Moderador Global",
	"Administrador",
	"Administrator",
	"Programador"
};
enum BI
{
	bID,
	BIntegrantes,
	BNombre[32],
	BLider[32],
	BRango1[32],
	BRango2[32],
	BRango3[32],
	BRango4[32],
	BRango5[32],
	BRango6[32],
	BRango7[32],
	BRango8[32],
	RANK_EXP[7],
	RANK_EDIT[7],
	RANK_INV[7],
	EnUso,
	UltimoAtaque,
	B_Atacando,
	BColor,
	territorio[15],
	bVehFac[MAX_VEH_FAC],
	bVehID[MAX_VEH_FAC],
	bool:bVehLoad,
	Mejoras,
	DiscordInv[100],
	Uniforme1,
	Uniforme2,
	MaxIntegrantes,
	Webhook[200]
};

new BandasInfo[MAX_BANDAS][BI];

enum Times
{
	TiempoTruck,
	TimerChupar,
	RemoveReportTimer[5],
	TimerRevisando,
	RevisadoTime,
	TiempoSacarClub,
	TiempoFumarPorro,
	TiempoCargo,
	TiempoMensajeRobar,
	TiempoBebida,
	TiempoSexoOfrecido,
	TiempoDarDinero,
	TiempoDuda,
	TiempoCombate,
	TiempoRef,
	TiempoComputadora,
	TiempoCLUB,
	TiempoAgresor,
	TiempoCrack,
	TiempoLSD,
	TiempoKrippy,
	TiempoLlenar,
	TiempoReparar,
	TiempoMedicamentos,
	TiempoMarihuana,
	TiempoAceptar,
	TiempoCaramelos,
	TiempoBolso,
	TiempoIntentar,
	TiempoGPS,
	TiempoExpulsar,
	TiempoCarrera,
	TiempoCarrera2,
	TiempoAcademia,
	TiempoVenta,
	TiempoMotor,
	TiempoAntiA,
	TiempoAntiC,
	TiempoAntiHH,
	TiempoAntiAB,
	TiempoAntiAim,
	TiempoCubrir,
	TiempoAD,
	pTIME_LORO,
	TIMER_VIDA,
	TIMER_CHALECO,
	Consumible,
	pTIME_PEDIDO,
	TiempoGuarda,
	TiempoGuarda2,
	TiempoGuarda3,
	TiempoGuarda4,
	TiempoGuarda5,
	TiempoGuarda6,
	CompraWeb,
	TiempoTaxi,
	FarmearLZ,
	UltGuardado
}
new PLAYER_TIMES[MAX_PLAYERS][Times];

new PlayerGPSTimer[MAX_PLAYERS];
new bool:WebAuto[MAX_PLAYERS];
new ArmaVender[MAX_PLAYERS];
new CompradorArma[MAX_PLAYERS];
new PrecioArma[MAX_PLAYERS];
new VendedorArma[MAX_PLAYERS];
new Text:Reloj;
new StatsStatus, ArbolStatus, CervezaStatus, HalloweenStatus;
new peaje1, peaje2;
new ptbomb;
new ptbomb2;
new MercaID[MAX_PLAYERS];new Text:ConquistandoMercaoide;
new CarrerasAviso = 1;
new PlayerText:MensajeTD[MAX_PLAYERS],TimerMensaje[MAX_PLAYERS];
enum mercaInfo
{
	mID,
	mEnVenta,
	mPickup,
	Text3D:mLabel,
	mIcon,
	mBandaID,
	mDuenoID,
	mBandaN[80],
	mDuenoN[40],
	mAbierto,
	mValor,
	mNivel,
	Float:mX,
	Float:mY,
	Float:mZ,
	mDinero,
	mPistolas,
	mDk,
	mM4,
	mEDC,
	mMari,
	mCrack,
	mEnUso,
	mPiezas,
	mSpray,
	mMascara

};
new InfoMercado[MAX_MERCADOS][mercaInfo];

//<=================================> sistema de incendios
enum iInfo
{
	Text3D:pInfoIncendio,
	pIntensidad,
	pIDI,
	pType,
	pObject[15],
};
new Incendios[MAX_INCENDIOS][iInfo];
stock UpdatePlayerProgressBar(playerid, PlayerBar:barid)
{
	if(IsPlayerConnected(playerid))
	{
		return ShowPlayerProgressBar(playerid, barid);
	}
	return 1;
}