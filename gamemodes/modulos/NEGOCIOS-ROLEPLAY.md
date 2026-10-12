Sistema implementado en `negocios_roleplay.p`, incluido desde GZRP.pwn.

## Android y PC

Las ventas, cancelaciones, consultas, contrataciones y atención de vendedores se realizan mediante comandos y diálogos. No requieren teclas exclusivas de PC, apuntar a un NPC ni usar editores de objetos. La colocación de empleados utiliza la posición y dirección del propietario. Los servicios abiertos por los vendedores reutilizan los comandos y diálogos originales. Se revisaron estas rutas en el código; queda verificar visualmente el flujo en clientes Android y PC reales.

## Venta entre jugadores

`/misnegocios` muestra los tipos y los IDs correctos de tus negocios.

`/vendernegocio tipo ID_negocio ID_jugador precio moneda`

Tipos: `negocio` (propiedades comerciales de tipo 2, 3 o 4), `gasolinera`, `estacionamiento`, `mercado`, `fabrica`. Se aceptan `restaurante` y `tienda` como alias de `negocio`.

Monedas: `dinero`, `gz`, `coins`. Se usa una moneda por venta. GZ es el saldo Moneda y Coins es el saldo Totems del código original. El precio permitido va de 1 a 1.000.000.000.

Ejemplos:

```text
/vendernegocio negocio 42 8 150000 dinero
/vendernegocio gasolinera 12 8 80 gz
/vendernegocio estacionamiento 6 8 100 coins
```

También funciona `/vender negocio ...` y `/vender gasolinera ...`. El comando original `/vender propiedad` conserva el menú de casas.

El comprador recibe una confirmación con precio y moneda. La oferta dura 60 segundos. Ambos deben estar en el negocio o junto a su entrada, en el mismo mundo e interior y a menos de 5 metros entre sí. El vendedor necesita nivel 6 y 2 horas de juego. El comprador debe cumplir los límites y el nivel del sistema original. Mercados y fábricas se transfieren entre líderes de distintas bandas criminales; el comprador no puede tener otro negocio de ese tipo en su banda.

`/cancelarnegocio` cancela las ofertas enviadas o recibidas. Al desconectarse cualquiera de las partes, la oferta se invalida. La confirmación vuelve a comprobar propietario, cuenta, cercanía, saldo y límites. El negocio conserva sus existencias, mejoras, ganancias y contratos vigentes. La transferencia de propiedad y ambos pagos se guardan en una transacción MySQL junto al historial.

## Guardias y vendedores

```text
/empleadonegocio contratar negocio 42 guardia dinero
/empleadonegocio contratar negocio 42 vendedor gz
/empleadonegocio contratar gasolinera 12 vendedor coins
/empleadonegocio despedir negocio 42 guardia
```

El NPC se coloca en la posición y dirección del propietario al contratar. Coloca al vendedor junto al punto original de venta, y al guardia donde deba vigilar. La contratación conserva los requisitos de propiedad y cercanía.

| Empleado | Dinero | GZ | Coins |
|---|---:|---:|---:|
| Guardia | 15.000 | 5 | 10 |
| Vendedor | 8.000 | 3 | 6 |

Se elige una moneda para pagar. Cada contrato dura 12 horas reales, incluido el tiempo que el servidor esté apagado. Un negocio admite un guardia y un vendedor; el límite global es 32 empleados. Despedir no devuelve el pago. Si FCNPC no puede crear el empleado, no se cobra. Los valores están configurados en `CMD:empleadonegocio` y la duración en `RP_BIZ_CONTRACT`.

Los guardias responden a agresiones contra los empleados y el propietario cercano; en mercados y fábricas consideran aliados a los miembros de la banda propietaria. No atacan a transeúntes por acercarse. Responden durante un máximo de 15 segundos y dentro de 20 metros, respetando mundo e interior. Si mueren, vuelven a los 60 segundos mientras el contrato siga vigente.

`/atendernegocio`, a menos de 3 metros de un vendedor, abre la atención del negocio. Restaurantes y tiendas usan sus compras originales; gasolineras ofrecen el bidón; mercados usan el catálogo original. En estacionamientos y fábricas el vendedor orienta al acceso existente. Se conservan los precios, el stock y los requisitos de esos servicios. Esta primera versión no agrega catálogos nuevos ni un sistema de empleados humanos.

## Persistencia y activación

- Los propietarios se guardan en las tablas originales `propiedades`, `gasolineras`, `estacionamientos`, `mercados` y `fabricas`.
- Los saldos y los slots de propiedades se guardan en `usuarios`.
- `rp_business_sales` registra negocio, vendedor, comprador, precio, moneda y fecha.
- `rp_business_staff` guarda rol, negocio, vencimiento, posición, dirección, mundo e interior. Los empleados se recuperan al cargar el mundo, sin duplicarlos. Si falta capacidad de NPC, se reintenta cada 30 segundos.

Al iniciar la GM, el módulo comprueba los motores de las seis tablas originales y convierte a InnoDB las que todavía son MyISAM, para permitir rollback. Crea las dos tablas complementarias. Si falla esta preparación, deshabilita las ventas. SQL manual equivalente: `database/negocios-roleplay.sql`. Se recomienda que el primer arranque tras instalar se haga sin jugadores para completar la conversión.

El módulo utiliza los plugins MySQL R41-4, FCNPC y streamer ya presentes. El límite de NPC del servidor también cuenta taxis y guardias antiguos. El paquete Linux conserva su configuración existente de `maxnpc`; si llega al límite, no cobra nuevas contrataciones que no pueda crear.

## Validación realizada

Ambas GM compilan sin errores ni advertencias. Pruebas sobre una base temporal separada: los cinco tipos de negocio en las tres monedas, cambios de slots, ofertas vencidas, cuenta reemplazada, mundos distintos, saldo insuficiente, overflow, límites, divergencia entre memoria y SQL y rollback al faltar la cuenta del comprador. Con los plugins reales se comprobó creación de guardia/vendedor desde contratos guardados, mundo/interior recuperados, ausencia de duplicados y eliminación por vencimiento. Resultado: 67 comprobaciones Pawn aprobadas, cero fallidas y cero errores de ejecución en la última prueba.

Falta la revisión visual dentro de GTA del combate, los puntos de atención y los menús con jugadores reales. Las pruebas usaron posiciones y cuentas simuladas en un servidor aislado. La base y el usuario SQL de prueba se eliminaron después. No se reinició el servidor principal.

Respaldo previo: `diagnostico/respaldo-negocios-20261007`. Evidencia y harness: `diagnostico/prueba-negocios`.
