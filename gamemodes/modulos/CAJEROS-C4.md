# Cajeros y robo con C4

18 cajeros de calle en el mundo principal: 6 en Los Santos, 6 en San Fierro y 6 en Las Venturas. Cada uno tiene objeto, cartel y marcador local.

## Uso en Android y PC

- `/cajeros`: abre la lista de ubicaciones y permite marcar una ruta.
- `/cajero`: operaciones bancarias junto a un cajero disponible. El atajo existente también abre este menu.
- `/comprar c4`: compra un C4 por $8.944 en un mercado negro registrado y abierto o junto al vendedor fijo. La opcion C4 del menu existente usa la misma compra.
- `/robar cajero` o `/cajero robar`: confirmacion por dialogo; consume un C4 al comenzar.
- Entrar al checkpoint delante del cajero o pasar sobre el dinero: recoge automaticamente el botin, a pie, en Android y PC. `/cajero recoger` es la alternativa por comando.

## Ciclo

1. Colocar durante 10 segundos, a pie y sin alejarse. La Policia de servicio recibe una alerta con ciudad, zona y numero de cajero.
2. Apartarse: el C4 explota 10 segundos despues de quedar activado.
3. Regresar y entrar al checkpoint delante del cajero para recoger entre $15.000 y $25.000. El botin desaparece a los 90 segundos si nadie lo recoge. Otro jugador habilitado tambien puede recogerlo.
4. El cajero queda fuera de servicio durante 20 minutos desde el inicio. El plazo se guarda en `rp_atm_cooldown`, creada automaticamente, y se recupera al reiniciar.

No se permite robar ni recoger botin a policias o militares. Cada cuenta puede tener un solo robo en curso. Alejarse, morir o desconectarse durante la colocacion cancela el robo y pierde el C4; la espera de reparacion se mantiene. Una bomba activada continua aunque el jugador se desconecte. No se puede usar el cajero para operaciones bancarias durante el robo o la reparacion; los dialogos iniciados desde ese cajero vuelven a comprobar distancia y disponibilidad.

El C4 utiliza el inventario temporal `cbomba` de la GM: solo se permite llevar uno y se elimina al cerrar la sesion. El C4 sin usar no se conserva al reconectar. El botin pendiente tampoco se conserva tras reiniciar el servidor. Si MySQL falla, el robo se bloquea y no consume C4.

## Validacion

Ambas GM compiladas. Prueba aislada con servidor SA-MP, Streamer y base MySQL separada: `diagnostico/prueba-cajeros/resultado-final.log`. Las condiciones de jugador y la posicion se simulan; estas pruebas no equivalen a pruebas dentro de GTA.

Pendiente en dispositivos reales: revisar altura/orientacion de los 18 objetos y carteles, seguir una ruta con `/cajeros`, comprar C4, completar un robo y usar las operaciones bancarias en Android y PC.

## Mover cajeros

Administradores de nivel 8 o superior: /movercajero [ID]. La ID visible empieza en 1 y aparece en /cajeros. Colocate a pie en el nuevo lugar, en el exterior del mundo principal, y mira hacia donde debe apuntar el cajero. Por ejemplo: /movercajero 1.

Se guardan posicion y orientacion en rp_atm_positions y se actualizan objeto, cartel, marcador y ruta. La ubicacion se recupera en los reinicios y solo cambia con otra orden administrativa. Un cajero con robo activo o botin pendiente no se puede mover; moverlo conserva el tiempo de reparacion.

## Aspecto al explotar y cargos

Al iniciar el robo se asignan como minimo 3 cargos y estrellas mediante el sistema policial existente; un nivel superior se conserva. La explosion deja el cajero volcado y ennegrecido, con humo durante 60 segundos y dinero visible en el suelo. Un checkpoint dinamico delante del cajero permite recoger automaticamente el botin. Recogerlo o agotarse los 90 segundos elimina dinero y checkpoint, pero el aspecto destruido permanece hasta la reparacion. La marca de dano se guarda en rp_atm_damage para recuperar el aspecto si se reinicia antes de repararlo. El botin no se repone al reiniciar.

Correccion del botin: modelo 19324 apunta hacia -Y local. El botin se coloca a 1.8 m hacia su frente, con billetes elevados 0.25 m respecto de la version anterior. Checkpoint de radio 1.35, distancia 60 m y prioridad 1000; al explotar se actualizan objetos, pickup y checkpoint para jugadores cercanos. Validacion aislada actual: 88 comprobaciones sin fallos. Pendiente vista real en GTA.
