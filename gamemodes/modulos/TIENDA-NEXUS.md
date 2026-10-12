# Tienda Exclusiva: Nexus rojo

El menú principal y el catálogo usan el diseño rojo elegido: lista de categorías, saldos reales, modelo del producto, precio, anterior, siguiente, comprar y volver. Vehículos incluyen selección de colores. La confirmación final usa un diálogo nativo para Android y PC.

Se abre junto a Irene con la interacción existente, `/tiendadp` o `/tiendaexclusiva`.

Alternativas para ambos clientes:

- `/tiendaexclusiva menu`: categorías y producto mediante diálogos.
- `/tiendaexclusiva anterior` y `/tiendaexclusiva siguiente`: navegar el catálogo.
- `/tiendaexclusiva comprar`: confirmar el producto seleccionado.
- `/tiendaexclusiva colores`: seleccionar los dos colores del vehículo.
- `/tiendaexclusiva cerrar`: cerrar la tienda y cancelar la cotización.

Los vehículos usan localmente los 93 precios originales de web-local/api/tienda-dp.php; la tienda no necesita la web para abrir el catálogo. La cotización vence después de 60 segundos. La compra de Coins continúa sin estar disponible.

La ropa y los vehículos se pagan con GZ (`Moneda`), y VIP y prendas con Coins (`Totems`), siguiendo la economía existente. Los 80 Coins de la propuesta visual eran un ejemplo y no se instalaron como precio.

El catálogo reutiliza los archivos de `scriptfiles`: `RopaHombreBZ.txt`, `RopaMujerBZ.txt`, `helirc.txt`, `vehrc.txt`, `motosar.txt` y `prendas.txt`. Las prendas se filtran por los modelos admitidos en `OBJETOS_INFO`. Las compras de prendas requieren VIP 2 o 3.

## Comprobaciones

El 8 de octubre de 2026 se compilaron ambas GM sin errores ni advertencias. Se ejecutaron 28 comprobaciones aisladas del código de selección y confirmación, con saldos y entrega simulados: saldo insuficiente, monedas separadas, confirmación repetida, precio vencido, cambio de producto, cuenta y catálogo, y pérdida de condiciones de acceso. No prueban la integración MySQL completa ni el aspecto o los botones dentro de GTA.

Pendiente en Android y PC tras reiniciar: abrir la tienda junto a Irene, navegar todas las categorías, cambiar colores, ver el precio local de un vehículo, confirmar/cancelar compras y comprobar que el saldo y el artículo se guardan. Verificar también `/tiendaexclusiva menu`.

## Facciones y carteles

La tabla local `facciones` estaba vacía. Se recuperaron los registros de Policía (1), Militares (2) y Bomberos (3). `facciones_gobierno.p` añade únicamente los registros base ausentes antes de cargarlos; para importación manual está `database/facciones-gobierno.sql` (también incluido en la entrega Linux).

Se cambiaron los carteles de acceso que mostraban `/entrar` a `Pulsar [ F ]`, conservando el comando. Se retiró el cartel antiguo del vestuario SAFD de `mapas.inc` para dejar solamente el del módulo de Bomberos.

Reiniciar el servidor carga la GM actualizada y las facciones recuperadas. Para asignar Bomberos: `/setleader ID 3 8`; para ponerse de servicio: `/bomberos uniforme` en el vestuario.

Se corrigió la cancelación de selección que cerraba el catálogo después de redibujarlo. La caja guardada en -29.9737,-185.0800,1007.7300 (interior 10) muestra Pulsar [ F ] y /comprar productos en cada mundo de supermercado registrado; usa el catálogo, stock y caja del negocio correspondiente.
