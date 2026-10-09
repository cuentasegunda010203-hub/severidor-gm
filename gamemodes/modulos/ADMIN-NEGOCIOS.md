# Administración de negocios

Activa `/aduty` con una cuenta de administrador global. La GM puede verificar automáticamente tu cuenta e IP; cuando no coinciden, solicita el código administrativo. `/admins` indica quién está en servicio.

Los comandos usan **tipo + ID de negocio**, nunca el ID de un jugador. `/infonegocio` identifica el local cercano; `/infonegocio tipo ID` muestra uno concreto. `/adminnegocios` muestra esta guía dentro del juego.

| Acción | Comando | Resultado |
|---|---|---|
| Crear | `/crearnegocio tienda 35 coins` | Crea en tu posición exterior, libre y en venta. |
| Precio | `/editarnegocio local 1 80 gz` | Guarda el precio y la moneda de compra inicial. Conserva al dueño. |
| Posición | `/movernegocio local 1` | Colócate en la nueva entrada y ejecuta el comando. |
| Retirar dueño | `/quitarduenonegocio local 1` | Confirma en el diálogo. Queda libre y en venta. |
| Borrar | `/borrarnegocio local 1` | Confirma en el diálogo. Elimina el negocio comprable. |

Monedas: `dinero`, `gz` y `coins`; una moneda por operación. Precio de 1 a 1.000.000.000. Los locales originales registrados empiezan a 35 Coins; su configuración se conserva en posteriores reinicios.

Tipos de creación:

- `local`, `24/7` o `tienda`: supermercado.
- `restaurante` o `pizzeria`: pizzería.
- `ropa`, `bar`, `ferreteria`, `sexshop`: local con su interior correspondiente.
- `negocio`: tienda de armas del sistema de propiedades existente.
- `gasolinera`, `estacionamiento`, `mercado`, `fabrica`: negocios del sistema original.

Los seis primeros locales se administran, compran y revenden con el tipo **local**, independientemente de su categoría. Los demás usan el tipo que se mostró al crearlos. Los mercados y las fábricas mantienen la propiedad de bandas y sus requisitos de liderazgo.

## Comprar y usar

`/comprarnegocio local 1`, o `/comprarnegocio` junto a su puerta, abre la confirmación con precio y moneda. Debes estar en el exterior principal, a menos de 3 metros, con saldo suficiente. La confirmación vence en 60 segundos; un precio o dueño que cambia invalida la compra. Los locales no ocupan slots de casas.

`/misnegocios`, `/vendernegocio local ID JUGADOR PRECIO MONEDA` y `/empleadonegocio` permiten revender y contratar guardias o vendedores. `/entrar` y `/salir` funcionan con las entradas originales, nuevas y trasladadas. Los catálogos conservan sus puntos de atención; coloca al vendedor junto al punto de compra correspondiente.

`/accesonegocio` sirve para el acceso cercano a pie y para entrar/salir de estacionamientos con un vehículo propio. La entrada en vehículo cuesta $150 y `/estacionar` guarda el vehículo. Android y PC utilizan los mismos comandos y diálogos.

Mover conserva al dueño y cancela ofertas pendientes. Los empleados mantienen su posición; despídelos y contrátalos de nuevo si necesitan otra ubicación. Borrar o quitar al dueño cancela ofertas y contratos NPC, sin reembolso. No se puede borrar un estacionamiento mientras haya vehículos dentro o guardados. Los accesos públicos borrados se conservan como registros inactivos para que no vuelvan a aparecer al reiniciar.

## Persistencia y puesta en marcha

Las tablas `rp_public_businesses` y `rp_business_prices` se crean automáticamente. Las compras y retiradas de dueño usan transacciones junto con cuentas y contratos. Los cinco tipos antiguos conservan sus tablas originales. La GM registra las acciones de creación y retirada en el log del servidor.

Carga el `GZRP.amx` actualizado y reinicia la GM/servidor para activar los módulos. No se reinició el servidor principal durante este trabajo.

Se verificaron funciones Pawn con MySQL, streamer y FCNPC en un servidor y una base aislados: compra/reventa con las tres monedas, registros bajo SQL estricto, creación y traslado de los seis tipos, edición de precio y eliminación/retirada de dueño de locales. Los datos y posiciones de jugadores fueron simulados; las comprobaciones visuales y los accesos con dispositivos Android y PC reales siguen pendientes.

Resultado final de la prueba ampliada: 105 comprobaciones Pawn aprobadas, 0 fallidas. Se verificaron adicionalmente en SQL las posiciones de los cinco tipos originales, el precio y la moneda editados y el local borrado. Evidencia: diagnostico/prueba-negocios/server_log.txt. Ambas GM compilan sin errores ni advertencias.

## Contrato compacto de compra

La compra inicial muestra un PlayerTextDraw centrado de 178.5 x 174 unidades (pantalla de referencia 640 x 448), con el negocio, vendedor, moneda y precio real. Confirmar y rechazar son botones seleccionables. También están disponibles /confirmarnegocio, /cancelarcompranegocio y /comprarnegocio menu para usar el diálogo nativo en Android y PC. Todas las confirmaciones reutilizan RP_InitialCheck y RP_InitialCommit; conservan el vencimiento de 60 segundos, la protección contra doble confirmación y el guardado transaccional.

El panel se destruye al confirmar, cancelar, morir, desconectarse, vencer la oferta o invalidarse el negocio. La compilación no sustituye la prueba visual ni de controles en dispositivos reales.
