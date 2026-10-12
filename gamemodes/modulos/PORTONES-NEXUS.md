# Portones y rejas administrativos, Android y PC

Sistema nuevo en portones_nexus.p. Los portones antiguos de mapeossv.txt siguen disponibles.

## Crear y ajustar
Nivel administrativo GLOBAL o superior. A pie, en el lugar y mundo/interior donde se desea crear:
- /crearporton casa 1
- /crearporton faccion 3 985
- /crearporton fabrica 0 986
Formato: /crearporton <casa|faccion|fabrica> <ID> [Modelo]. Modelo predeterminado 971.
Fabrica usa el ID del sistema actual (incluido 0 si existe); internamente se guarda f_DBID estable.

Se abre un dialogo nativo al crear. Primero editar posicion CERRADA y luego ABIERTA. Colocar aqui usa posicion/angulo del administrador; tambien ajustar X/Y/Z, giro e inclinacion. Pasos 0.05, 0.25 y 1 metro. Cada cambio se guarda inmediatamente. La posicion abierta inicial esta 4 metros arriba.
La separacion de ambos extremos puede llegar hasta 40 metros. Editor disponible hasta 30 metros en el mismo mundo/interior.
- /editarporton <ID>: continuar ajustes y cambiar entre 15 modelos nativos.
- /terminarporton: salir y dejar cerrado.
- /vincularporton <PortonID> <casa|faccion|fabrica> <ID>: cambiar entidad de acceso, conservando ubicacion.
- /borrarporton <ID>: eliminar con confirmacion.

Los modelos nativos son 969,971,974,975,976,980,982,983,984,985,986,987,988,989,991. No requieren modelos descargables.
Cada administrador tiene un bloqueo exclusivo; cancelar, terminar, desconectar, perder permisos o alejarse libera la edicion y deja cerrado. No se opera un porton mientras se edita.

## Uso
- Bocina en vehiculo (KEY_CROUCH), solo conductor, hasta 15 metros.
- H a pie (KEY_CROUCH), hasta 7 metros.
- /porton [ID]: abre/cierra con las mismas comprobaciones.
- /portones: lista hasta 20 portones con permiso dentro de 60 metros; para operar acercarse al radio de uso.
- /casa > Portones: abre el mismo menu.
En clientes con controles distintos, usar el comando o dialogo.

Acceso: propietario actual de la casa; miembros de la faccion; miembros de la faccion propietaria de la fabrica; administradores GLOBAL. Los permisos cambian con las ventas/asignaciones. Sin entidad valida no se puede operar; el administrador aun puede corregir el vinculo o eliminarlo.
Solo permite jugadores conectados y autenticados, a pie o conductores, no incapacitados, dentro del mundo/interior guardado. No concede acceso general a policias/militares.

La accion alterna abrir/cerrar. Desplazamiento animado a 2 metros/segundo; rotacion sin desplazamiento se aplica directamente. No hay cierre automatico. Durante movimiento no acepta otra accion.

## Database
Tabla MySQL rp_gates, InnoDB. Guarda ID unico, modelo, tipo/vinculo, mundo/interior y X/Y/Z/RX/RY/RZ de ambos extremos. Se crea automaticamente al iniciar. Limite de 300.
Siempre carga cerrado tras reiniciar; las posiciones persisten. Los cambios se aplican despues de guardar; fallos SQL mantienen valores anteriores. Borrar elimina registro y objeto.

## Verificacion
Ambas GM compilaron sin errores ni advertencias. 36 comprobaciones aisladas sin fallos con MySQL, Streamer y sscanf reales, jugadores y teclas simulados. Incluye comandos, poses independientes, reja, permisos de compra/transferencia, mundo/interior/distancia, bloqueo de edicion, SQL fallido, recarga, giro, animacion y borrado.
AMX instaladas con respaldo y hashes verificados para el proximo reinicio. No se reinicio el servidor activo.
Pendiente prueba visual e interaccion real dentro de GTA en Android y PC.
Actualizacion de edicion: /editarporton sin numero elige el porton mas cercano hasta 30 metros, en el mismo mundo/interior. /editarporton ID usa el ID del porton, distinto del ID de casa/faccion/fabrica y del modelo. Si el ID no existe informa el ID cercano sin seleccionarlo automaticamente. Mensaje de creacion incluye el comando exacto para volver a editar. QA actualizado: 40 comprobaciones, 0 fallos; ambas GM compiladas sin errores ni advertencias. Pendiente prueba GTA de este acceso por proximidad.
