# Análisis de dependencias y plan de migración de GZRP

## Alcance
Revisión estática de `gamemodes.rar` recibido. Se analizaron las rutas y directivas `#include` locales; no se reescribió el código fuente.

## Hallazgos confirmados
- Archivo principal: `GZRP.pwn`, 4.330.243 bytes y aproximadamente 71.027 líneas.
- Se identificaron 77 archivos Pawn locales (`.p`, `.pwn`, `.inc`) y 62 alcanzables desde `GZRP.pwn` siguiendo la cadena de includes locales.
- El GM ya está parcialmente dividido en `modulos/` e `Inventario/`, pero conserva grandes bloques directamente en el archivo principal.
- Los módulos se incluyen en distintos puntos de `GZRP.pwn` (desde las primeras líneas hasta las líneas 71.026). El orden de inclusión debe tratarse como dependencia.
- El RAR solo contiene `gamemodes`; no incluye el compilador, todos los includes externos, plugins, configuración completa ni SQL. Por eso todavía no se puede certificar una compilación completa.

## Dependencias locales entre módulos
- `modulos/battlepass_nexus.p` → `modulos/battlepass_datos.p`
- `modulos/blindado_mercado_rb.p` → `modulos/blindado_rb_datos.p`
- `modulos/casas_vacias.p` → `modulos/casas_muebles_nativos.p`
- `modulos/graffitis_nexus.p` → `modulos/graffitis_catalogo.p`
- `modulos/login.p` → `modulos/login_cinematico.p`
- `modulos/login_cinematico.p` → `modulos/login_recorrido.p`
- `modulos/negocios_publicos.p` → `modulos/negocios_compra_textdraw.p`
- `modulos/negocios_roleplay.p` → `modulos/negocios_datos.p`, `modulos/negocios_publicos.p`, `modulos/negocios_economia.p`

## Archivos no alcanzables desde el include principal
El análisis estático no encontró una ruta de includes desde `GZRP.pwn` hacia estos archivos: `Inventario/Dialog_armas.p`, `Inventario/Inv_OnPlayerClickTextDraw.p`, `Inventario/Inventario_PlayerTextDrawShow.p`, `modulos/anticheat.p`, `modulos/borrador.p`, `modulos/concesionarios_nexus.p`, `modulos/graffitis.p`, `modulos/guardaespaldas.p`, `modulos/guardias-fabricas.p`, `modulos/inventario.pwn`, `modulos/navidad.p`, `modulos/notes.p`, `modulos/notificaciones3.p`, `modulos/tienda_exclusiva_precios.p`, `modulos/vars.p`.

Esto no demuestra que sean obsoletos: no se deben borrar ni renombrar sin confirmar si los usa otro flujo de compilación o si están pendientes de integrar.

## Riesgos que deben preservarse
1. **Orden de compilación:** `#include` concatena código; no crea módulos aislados. Cambiar el orden puede romper declaraciones, `forward`, callbacks y hooks.
2. **Rutas:** mover un archivo requiere revisar todas sus referencias y los includes anidados.
3. **Símbolos compartidos:** las variables y funciones globales pueden declararse en un archivo y consumirse desde otros.
4. **YSI y callbacks:** no consolidar ni reordenar mecánicamente los includes repetidos de `YSI_Coding\\y_hooks`.
5. **Lógica de juego:** no cambiar comandos, permisos, consultas SQL, precios, coordenadas, nombres de variables ni comportamiento durante la reorganización.
6. **Secretos:** mantener credenciales fuera del repositorio.

## Plan seguro
1. Mantener `GZRP.pwn` como punto de entrada y conservar una copia de referencia.
2. Completar el mapa de callbacks, declaraciones globales, `forward` y símbolos compartidos.
3. Migrar grupos pequeños de archivos, actualizando las rutas de forma controlada.
4. Revisar el diff para verificar que no cambie la lógica.
5. Compilar con la misma versión del compilador y los mismos includes/plugins del entorno original.
6. Probar arranque, MySQL, registro/login, inventario, vehículos, casas, negocios, facciones, textdraws y timers.
7. Integrar en `main` solo tras validar la compilación y las pruebas.

## Estado
- [x] RAR recibido y extraído.
- [x] Inventario y análisis inicial de includes locales.
- [x] Grafo inicial de dependencias locales.
- [x] Primera migración controlada: identidad del servidor a `gamemodes/core/identidad_servidor.p`, conservando un puente en la ruta anterior.
- [ ] Compilación con el entorno original.
- [ ] Pruebas funcionales.

## Validación de la primera migración
El archivo `modulos/identidad_servidor.p` contiene únicamente tres definiciones de macros. Su contenido se trasladó sin cambios a `core/identidad_servidor.p`; la ruta antigua ahora incluye la nueva ubicación para no modificar el include inicial de `GZRP.pwn`. Esta migración aún no tiene compilación confirmada.

**Conclusión:** continuar por tandas pequeñas, sin mover módulos dependientes hasta validar compilación y revisar cada diff.