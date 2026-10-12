# Blindado y mercado negro importados de RB

Origen: `C:\Users\williangel\Downloads\GM\gamemodes\RB.pwn`, `necessary\robbery.pwn`, el bloque Mercado negro de `filterscripts\Mapas.pwn` y las grabaciones Armando1/2/3.

La integracion se hizo en GZRP, conservando sus demas sistemas. Se retiraron el evento anterior de grupos (ladrones/guardias/mafiosos), sus dialogos, checkpoints y TextDraws; los mercados comprables y sus vendedores/menu anteriores. Se retiraron los mapas del antiguo mercado junto al gimnasio, el puesto de armas de Sleepy y los objetos del mercado subterraneo. Los registros antiguos de mercados en MySQL se conservan como datos historicos, sin cargar los negocios ni permitir su compra.

## Mercado

Ubicacion original: Los Santos, 2445.1499, -1900.0063, 13.5469. Se copio el bloque completo de objetos y materiales y sus dos RemoveBuildingForPlayer. Se abre con `/mercado`, `/comprar mercado`, `/comprar armas` o Y junto al vendedor. `/mercado gps` marca su ubicacion.

| Producto | Precio original |
| --- | --- |
| Mascara | 150 monedas del servidor |
| Escopeta recortada, Uzi, Tec-9, motosierra | 80 monedas cada una |
| Molotov | 100 monedas |
| Cuchillo | $250.000 |
| Granada | $180.000 |
| C4 | $10.000 |
| Cocaina | $2.000 por gramo |

Las monedas usan el saldo `Moneda` de GZRP, sin conversion a Totems. Las armas usan `DarArma` y no reemplazan otra arma de su mismo espacio. La mascara estaba marcada como "Proximamente" en la GM donante: aqui se habilito para que el robo pueda completarse usando `/mascara`. Tambien se acepta el pasamontanas original modelo 19801 si esta puesto.

El C4 usa `cbomba`, compartido con el sistema existente de cajeros: `/comprar c4`, `/detonar` o `/robar cajero`. No se cobran los precios antiguos ni se vende en los puestos retirados. Es temporal y se pierde al desconectarse.

Cocaina: `/cocaina` consulta la cantidad, `/cocaina consumir` o `/consumir cocaina` consume un gramo. Mantiene la recuperacion de 30 puntos de salud, excedente hacia chaleco hasta 100 y 60 segundos entre consumos. Se valida cantidad y capacidad antes de cobrar. `/mercado inventario` consulta cocaina y C4.

## Robo

Armando aparece en la puerta del banco, camina hacia el Securicar (428), entra con animacion en el asiento del conductor e inicia las grabaciones originales SF -> LV, LV -> LS y LS -> SF. La caminata, entrada y reproduccion usan FCNPC, ya incluido en el servidor. El nombre se adjunta al NPC durante la caminata, con offset vertical -0.4. Al completar la entrada se adjunta al camion en el asiento izquierdo, usando VEHICLE_MODEL_INFO_FRONTSEAT y altura del asiento +0.65. No se usa timer ni se recrea el nombre mientras conduce. El nombre nativo duplicado y el punto blanco del radar siguen ocultos. Los NPC se excluyen del anticheat y HUD de entrada de jugadores. Si no puede crear al conductor, reproducir el archivo o completar la entrada en 60 segundos, se cancela el evento con un mensaje de diagnostico en el log.

El sistema queda habilitado automaticamente en cada inicio de la GM, sin intervencion de un administrador. Sale a las horas pares, minuto 01, segun el reloj del servidor. No depende del antiguo valor Blindado de la tabla registros. Las rutas se alternan. El camion se averia; tras 7 segundos abre una ventana de robo de 297 segundos y luego retoma su recorrido. Las grabaciones originales ya contienen la espera de la averia; no se agrega una segunda pausa a la reproduccion.

1. Compra C4 y ponte la mascara o el pasamontanas antes de acercarte al blindado.
2. Dos jugadores de nivel 5 colocan una bomba cada uno con `/detonar` o `/colocar c4` detras del camion.
3. Cada jugador completa 10 pasos con `/blindadorobo avanzar`, a un paso por segundo. Y ofrece el mismo progreso en PC. No depende de pulsar teclas exclusivas de PC.
4. Tras las explosiones, jugadores de nivel 4 usan `/robar bolsas`. Hay 10 bolsas, de $25.000, $30.000, $35.000, $40.000 o $42.000, como en el origen.
5. Guarda cada bolsa con `/guardar bolsa`, `/guardar bolso` o `/blindadorobo guardar` junto al baul abierto de una camioneta compatible. H ofrece el mismo acceso. Modelos: 605, 543, 554, 482, 459, 440, 422, 413. Se conservaron los objetos y offsets de bolsas originales.
6. Al agotarse las bolsas o terminar la averia, escapa durante 10 minutos. `/blindadorobo estado` muestra tu tiempo. Despues, `/blindadorobo ruta` repone el checkpoint si usaste otro GPS.
7. Conduce la misma camioneta al punto de reparto (uno de los 6 originales). El checkpoint reparte el dinero; `/blindadorobo repartir` es la alternativa por comando en el mismo lugar. La parte corresponde a los integrantes de esa camioneta; los presentes a menos de 80 metros reciben su pago.

El robo avisa a la policia y agrega 3 cargos al colocar C4 o 5 al sacar bolsas. Solo se retiran los cargos del robo si no se agregaron cargos de otro origen. Destruir o reaparecer la camioneta hace perder el botin; los implicados deben escapar 8 minutos. Morir, quedar incapacitado, ir a la carcel o desconectarse cancela la participacion. La bolsa usa un espacio de accesorio libre, sin quitar la mascara.

Si las dos bombas las coloca la misma banda, recibe +8 de experiencia. GZRP no tiene el sistema de niveles de banda de RB; este premio se guarda por separado y se consulta con `/blindadorobo banda`.

`/ayuda` incluye la opcion Robo al blindado. La misma ayuda se abre con `/blindadorobo` y el antiguo `/participar`, en tres paginas compatibles con Android y PC. Incluye la informacion de la ayuda donante: rutas, niveles, mascara/pasamontanas, dos personas colocando C4, cargos, dinero aleatorio, camionetas, huida y reparto; con los comandos actuales y el premio de banda.

Administracion: `/crobob` inicia una ruta, `/trobob` cancela la ruta y el botin pendiente, `/blindado activar` habilita las salidas programadas y `/blindado desactivar` las deshabilita y cancela el evento. La desactivacion es temporal: al reiniciar la GM vuelve a habilitarse automaticamente. `/crobob` y `/trobob` siguen disponibles para testear sin esperar la hora programada. `/irmercado` teletransporta a administradores al nuevo punto.

## Archivos y base de datos

- `blindado_mercado_rb.p`: logica adaptada.
- `blindado_rb_datos.p`: posiciones, offsets y mapeo originales.
- `npcmodes/recordings/Armando1.rec`, `Armando2.rec`, `Armando3.rec`: recorridos originales reproducidos por FCNPC. Los antiguos scripts y AMX de NPC se conservan como referencia; el evento ya no usa ConnectNPC.
- Al iniciar la GM se crean, sin modificar las tablas anteriores, `rb_mercado_cocaina(cuenta,cantidad)` y `rb_blindado_bandas(banda,experiencia)`. La cuenta SQL debe poder crear esas tablas; tambien se entrega el SQL para instalarlas previamente.
- Respaldo de los archivos anteriores: `entrega/reemplazo-blindado-mercado-rb/respaldo`. El informe de entrega lista los archivos modificados.

## Comprobacion

Se compilaron GZRP y los tres NPC con Pawn 3.10.10 sin errores ni advertencias. Se revisaron comandos, dialogos, teclas alternativas, sesiones, muerte/desconexion, explosiones, dinero y rutas de compra. Las tres grabaciones se verificaron contra el origen.

La correccion de salida se verifico en un servidor local aislado con FCNPC y streamer: los mismos callbacks del modulo completaron la caminata, entrada con animacion, asiento 0 y primeros 10 segundos de circulacion de las tres rutas. Log: `diagnostico/servidor-prueba-blindado/server_log.txt` (PROBE TOTAL PASS 3). La prueba se cerro automaticamente y no interrumpio el servidor principal. Se verifico ademas que las grabaciones originales contienen mas de 310 segundos cerca de la averia, cubriendo los 304 segundos de la ventana logica.

No se realizaron pruebas de jugadores dentro de GTA en Android ni PC. Pendientes: comprobar visualmente las caminatas y los nombres, recorrido completo y parada de cada NPC, colision/acceso del mapeo, dos jugadores colocando bombas, recoger/guardar todas las bolsas, escape/reparto, policia cerca y destruccion/desconexion durante el robo. El servidor que estaba abierto no se reinicio; cargara el AMX nuevo al reiniciar.

Correccion de rol: Armando habla en chat cercano y burbuja al salir, averiarse, detectar el primer C4, pedir apoyo por bolsas, retomar la ruta y llegar al banco; los avisos de radio siguen llegando a la policia. Se recuperaron las narraciones de humo, motor de arranque y explosiones. Las amenazas y pedidos por robo no se repiten con cada bolsa o intento. Compilacion: diagnostico/compilacion-blindado-textos-marcador.log, sin errores ni advertencias. Pendiente comprobacion visual dentro de GTA del nombre y radar en Android y PC.

Correccion de nombre estable: compilacion-blindado-nombre-estable.log sin errores ni advertencias. Verificado el anclaje al entrar y la retirada del timer anterior; posicion visual pendiente de comprobar en GTA en Android y PC.

Contador C4: TextDraw personal con 0/10 a 10/10 al pulsar Y o usar /blindadorobo avanzar, un paso por segundo. Al completar, muestra la cuenta atras real de la bomba correspondiente. Se oculta al cancelar, morir, finalizar el evento o terminar la explosion; al desconectar se destruye. En Android muestra el comando. El aviso de pago diario se desplazo completo +20 unidades verticales del lienzo 640x448 para separarlo de las estrellas. Compilacion final: diagnostico/compilacion-contador-c4-payday.log, sin errores ni advertencias. Pendiente prueba visual en GTA Android y PC.
