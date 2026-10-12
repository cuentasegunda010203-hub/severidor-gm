# Bomberos: uso y comprobación

El sistema se incluye desde `bomberos_nexus.p` en las GM local y de entrega Linux.

## Comandos para Android y PC

- `/bomberos`: menú de uniforme, equipo e incendios activos.
- `/bomberos uniforme`: en el vestuario abre una lista de uniformes; si ya estás de servicio, recuperas tu ropa y sales de servicio.
- `/bomberos equipo`: toma chaleco, vendas, botiquín o extintor en el vestuario o dentro de un vehículo de emergencias de Bomberos. Se puede tomar equipo seguido, sin tiempo de espera entre entregas.
- `/bomberos vehiculos`: a pie en la base, permite usar los vehículos disponibles sin exigir uniforme ni rango.
- `/bomberos porton`: abre el portón durante siete segundos estando cerca y de servicio.
- `/bomberos incendios`: lista los incendios y marca una ruta al seleccionado.
- `/bomberos extinguir`: inicia o detiene la extinción automática. A pie exige uniforme y extintor equipado, a menos de seis metros. Desde un camión exige ser conductor, rango 3 y estar a menos de quince metros. Se detiene al perder las condiciones.
- `/apagarincendio`: también permite iniciar la extinción.

Los vehículos de Bomberos se pueden conducir sin restricciones de facción, empleo ni rango. Al volver del garaje se conserva el interior 4 de la oficina, donde aparecen los textos del vestuario. Los comandos de portón, vehículos y extinción siguen disponibles aunque se quitaron del menú principal.

La oficina tiene entrada por `/entrar` y salida por `/salir`. Los accesos de la base usan `/entrar`. Cada punto tiene un texto indicando su comando.

## Revisión realizada el 8 de octubre de 2026

Se revisaron las rutas en código y se compilaron ambas GM sin errores ni advertencias. Se completó la integración Linux pendiente y se actualizaron ambos `GZRP.amx`. No se realizaron pruebas dentro de GTA ni con dispositivos Android o PC.

Las comprobaciones de código incluyen ubicación y permisos al confirmar equipo, uniforme y vehículo; vehículos ocupados o alejados; selección de incendios que ya desaparecieron o fueron reemplazados; límites de propiedades y estacionamientos; extinción con comando o tecla; y eliminación del incendio antes de entregar la recompensa.

## Prueba pendiente dentro del juego

Después de reiniciar el servidor, realizar en Android y PC:

1. Entrar y salir de la oficina; verificar todos los textos de entrada, vestuario y garaje.
2. Con un miembro de Bomberos, abrir `/bomberos`, tomar uniforme y equipo; comprobar que se puede tomar equipo seguido sin esperar un minuto.
3. Acceder a la base y volver; verificar que el acceso no devuelva al jugador inmediatamente al punto anterior.
4. Seleccionar un vehículo libre, comprobar el rechazo de uno ocupado y probar el portón.
5. Con administrador de nivel 6 o superior, crear un incendio de prueba con `/crearincendio 0 ID` para una propiedad existente, o `/crearincendio 1 ID` para un estacionamiento existente.
6. Localizarlo desde `/bomberos incendios` y extinguirlo a pie con el comando y con disparo. Probar también un camión con rango 3.
7. Alejarse, desequipar el extintor o salir de servicio: la extinción debe detenerse. Al terminar el fuego, debe desaparecer y entregarse una única recompensa.
8. Abrir la lista antes de eliminar un incendio y seleccionarlo después: debe rechazarse la selección antigua.

Los incendios automáticos se intentan generar cada cinco minutos cuando hay al menos un bombero de servicio; necesitan propiedades o estacionamientos con dueño y un espacio libre para incendio.
