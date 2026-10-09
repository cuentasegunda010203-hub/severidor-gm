/*

Conservar los créditos.

	GGGGGGGGGGGGGGGG    OOOOOOOOOOOOO   NN          N   CCCCCCCCCC  H       H   OOOOOOOOOOOOO
	G                   O           O   N N         N   C           H       H   O           O
	G                   O           O   N  N        N   C           H       H   O           O
	G                   O           O   N   N       N   C           H       H   O           O
	G                   O           O   N    N      N   C           H       H   O           O
	G       GGGGGGGGG   O           O   N     N     N   C           HHHHHHHHH   O           O
	G               G   O           O   N      N    N   C           H       H   O           O
	G               G   O           O   N       N   N   C           H       H   O           O
	G               G   O           O   N        N  N   C           H       H   O           O
	GGGGGGGGGGGGGGGGG   OOOOOOOOOOOOO   N         NNN   CCCCCCCCCC  H       H   OOOOOOOOOOOOO

	- VentanaAbierta(vehicleid, window)
	- PuertaAbierta(vehicleid, door)
	- ActualizarVentana(vehicleid, window)
	- ActualizarPuerta(vehicleid, door)

	- SiVentanaAbierta(vehicleid, window);
	- SiVentanaCerrada(vehicleid, window);
	- SiPuertaAbierta(vehicleid, door);
	- SiPuertaCerrada(vehicleid, door);

*/

#define WINDOW_DRIVER 0
#define WINDOW_PASSENGER 1
#define WINDOW_BACKLEFT 2
#define WINDOW_BACKRIGHT 3

#define DOOR_DRIVER 0
#define DOOR_PASSENGER 1
#define DOOR_BACKLEFT 2
#define DOOR_BACKRIGHT 3

#define VentanaAbierta(%0,%1) (auto_ventanas[%0]{%1})
#define PuertaAbierta(%0,%1) (auto_puertas[%0]{%1})

new
	bool:auto_ventanas[MAX_VEHICLES][4 char],
	bool:auto_puertas[MAX_VEHICLES][4 char];

stock ActualizarVentana(vehicleid, window)
{
	if(!VentanaAbierta(vehicleid, window)) CallLocalFunction("SiVentanaAbierta", "ii", vehicleid, window);
	else CallLocalFunction("SiVentanaCerrada", "ii", vehicleid, window);
	auto_ventanas[vehicleid]{window} = !VentanaAbierta(vehicleid, window) ? true : false;
	return SetVehicleParamsCarWindows(vehicleid, auto_ventanas[vehicleid]{0}, auto_ventanas[vehicleid]{1}, auto_ventanas[vehicleid]{2}, auto_ventanas[vehicleid]{3});
}

stock ActualizarPuerta(vehicleid, door)
{
	if(!PuertaAbierta(vehicleid, door)) CallLocalFunction("SiPuertaAbierta", "ii", vehicleid, door);
	else CallLocalFunction("SiPuertaCerrada", "ii", vehicleid, door);
	auto_puertas[vehicleid]{door}= !PuertaAbierta(vehicleid, door) ? true : false;
	return SetVehicleParamsCarDoors(vehicleid, auto_puertas[vehicleid]{0}, auto_puertas[vehicleid]{1}, auto_puertas[vehicleid]{2}, auto_puertas[vehicleid]{3});
}

forward SiVentanaAbierta(vehicleid, window);
forward SiVentanaCerrada(vehicleid, window);
forward SiPuertaAbierta(vehicleid, door);
forward SiPuertaCerrada(vehicleid, door);
