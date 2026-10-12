# Muebles de casa en Android y PC

Dentro de una propiedad tuya, a pie: `/casa` -> Muebles / Comprar muebles, o `/muebles`.

La compra usa listas por paginas de 20 muebles y un dialogo de confirmacion. El catalogo y los precios proceden de `ObjetosInterior`. Los muebles existentes se conservan. Cada fila apunta al espacio real del inventario, incluso cuando se vendieron muebles intermedios.

Selecciona un mueble en Mis muebles para:

- Colocarlo delante del personaje, orientado hacia donde mira.
- Moverlo por X e Y, subirlo o bajarlo. El paso cambia entre 0.05, 0.25 y 1 metro.
- Girarlo en incrementos de 15 grados.
- Guardarlo sin venderlo, o venderlo por la mitad de su precio con confirmacion.

Cada ajuste se guarda en `server_muebles`. Compras y ventas guardan el mueble y el saldo en una transaccion. Se revalida que el jugador siga dentro de la propiedad y que continue siendo su propietario. El mueble debe quedar a menos de 10 metros del jugador al ajustarlo.

El flujo nuevo usa comandos y dialogos nativos en ambos clientes. No requiere el editor de objetos de PC ni el catalogo visual antiguo. Las funciones antiguas permanecen en la GM, pero las opciones principales de `/casa` abren el nuevo flujo.

Validacion: ambas GM compiladas; 24 comprobaciones de logica con MySQL y Streamer en un servidor aislado, con estado/posicion de jugador simulados. Registro: `diagnostico/prueba-muebles/resultado-final.log`. Pendiente comprobar visualmente la colocacion y los dialogos dentro de GTA en Android y PC.

Actualizacion de casas vacias: catalogo ampliado a 370 modelos (265 nuevos); 20 productos por pagina. La comprobacion previa de 24 casos corresponde al catalogo anterior. El escenario ampliado se preparo y compilo, pero su ejecucion quedo pendiente por limite de uso en la revision automatica de permisos. Ver CASAS-VACIAS.md.

Validacion actual: 35 comprobaciones sin fallos, incluyendo colores ARGB, texturas por superficie, persistencia, restablecimiento y limpieza al vender. Catalogo de 370 objetos. La revision automatica permitio ejecutar las pruebas aisladas de esta version. La restauracion definitiva conserva los interiores originales; ver CASAS-VACIAS.md.
