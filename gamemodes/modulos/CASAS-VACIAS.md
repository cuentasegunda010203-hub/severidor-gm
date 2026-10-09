# Interiores originales y mobiliario

Se conservan los interiores originales elegidos con /crearcasa y /ci, sus habitaciones, coordenadas y dimensiones. Se retiro el reemplazo por habitaciones genericas.

Al arrancar esta version, las casas que estaban en 2000,1997.6,1501.1 recuperan el interior original del respaldo, cuando coincide su selector. Las creadas despues recuperan las coordenadas de DarInteriorCasa. Los muebles comprados para la habitacion generica se guardan en el inventario para recolocarlos; no se eliminan. La decoracion posterior dentro del interior original se conserva al reiniciar.

La limpieza nativa utiliza instancias extraidas de los IPL originales del GTA instalado en el equipo. Retira mobiliario separado de casas al entrar, una sola vez por jugador e instancia; evita repetir las retiradas que ya realizaba la GM. No retira puertas ni los modelos que contienen la estructura. Los muebles globales del mapeo se retiran por modelo y cercania, conservando los muebles comprados en el mundo privado de la propiedad.

Limitacion real: parte del mobiliario de interiores como el 29 esta integrado en el mismo modelo que las paredes. Esa parte permanece para conservar la casa original; no se ha convertido cada modelo en una version completamente vacia. Hacerlo requiere editar o reconstruir esos modelos y resolver su distribucion compatible con Android y PC.

/crearcasa ya no impone los 10 metros de separacion entre propiedades. Conserva permisos administrativos y validaciones de precio, moneda e interior.

/muebles -> elegir mueble -> Cambiar color / Cambiar textura / Elegir superficie (0 a 15). Incluye 12 colores y 7 texturas, mas la opcion de conservar la textura original. Cada superficie se guarda en rp_furniture_materials y se recupera al colocar o cargar el objeto. Restaurar aspecto original elimina las modificaciones; vender elimina tambien sus registros de materiales. Comandos y dialogos nativos disponibles en Android y PC.

Validacion: 11 comprobaciones de restauracion y limpieza, 35 de compra/colocacion/materiales y 88 de cajeros, todas sin fallos, con MySQL y Streamer en servidores aislados. Los jugadores se simularon: no son pruebas reales de GTA en dispositivos Android o PC. Registros en diagnostico/prueba-casas/resultado-final.log, diagnostico/prueba-muebles/resultado-final.log y diagnostico/prueba-cajeros/resultado-final.log.

Las AMX actualizadas se instalan para el proximo reinicio, sin interrumpir la partida del jugador conectado.
