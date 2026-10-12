# Ejercito: revision del 8 de octubre de 2026

La base de datos local contiene la faccion 2, Ejercito de San Andreas, activa, con rangos Recluta a General. La tabla f_vehicles no tiene vehiculos de esta faccion: la GM crea 18 vehiculos estaticos en LoadMilitarVehicles(), llamada durante la inicializacion. Hay dos Hunter, dos Rhino, tres Barracks, tres Securicar, tres Patriot, tres Sultan y dos Sanchez.

El mapa exterior y el interior militar estan en mapas.inc y se cargan mediante mapaslz(). La entrada esta en -234.4394,2778.2483,62.2608, en Las Payasadas. El interior usa mundo 1 e interior 1, con vestuario en 682.6887,2537.6265,-89.4532 y armeria en 677.5463,2545.2993,-89.4512. No se encontro una eliminacion de estos recursos en el codigo actual.

Se agregaron carteles para entrada, salida y armeria, y /militar para reunir los accesos existentes. /militar base marca la ubicacion; /militar uniforme abre un dialogo nativo para Android y PC; /uniforme militar utiliza el mismo dialogo al entrar de servicio. /militar armas y /militar chaleco reutilizan los servicios existentes y verifican faccion, uniforme, ubicacion e interior. La seleccion final del uniforme vuelve a comprobar los permisos y la ubicacion.

Se retiro taxi_ciudadanos.p de la GM local y sus llamadas de inicializacion y eventos. La entrega Linux no lo incluia. El respaldo esta en diagnostico/respaldo-taxi-militar-20261008. /taxi, /ficha y los viajes entre jugadores siguen en el sistema original.

Ambas GM compilaron sin errores ni advertencias. En la entrega Linux se agrego modelos_armas_compat.p para la dependencia de previsualizacion de armas del pase de batalla, dado que esa GM no incluye el modulo de inventario local.

Pendiente dentro de GTA en Android y PC, tras reiniciar: asignar /setleader ID 2 8, abrir /militar, seguir la ruta a la base, entrar/salir de oficina, ponerse/quitarse uniforme, usar armeria y conducir un vehiculo militar. No se han probado dispositivos ni se ha confirmado visualmente el mapa dentro del juego.
