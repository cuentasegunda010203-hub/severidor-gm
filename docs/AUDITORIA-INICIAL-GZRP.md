# Auditoría inicial del proyecto GZRP (paquete completo)

## Estado del trabajo
Se recibió y extrajo el archivo `GM Zone Att Vincenzo.rar` en un área de trabajo separada. El archivo principal local coincide byte por byte con el `gamemodes/GZRP.pwn` de la rama `refactor/estructura-gzrp` del repositorio (Git blob SHA-1 `1bb243ddda9b33895975342631fc103715561029`).

Esta es una auditoría estática inicial. **No se ha compilado ni arrancado el servidor en este entorno** y no se ha cambiado la lógica de gameplay.

## Inventario del código Pawn
- `gamemodes/GZRP.pwn`: 4.330.243 bytes, 71.026 saltos de línea (aprox. 71.027 líneas).
- Archivos `.p`, `.pwn` y `.inc` dentro de `gamemodes/`: 77.
- Archivos alcanzables desde `GZRP.pwn` por directivas `#include` locales: 62.
- Directivas `#include` encontradas en `GZRP.pwn`: 88.
- Relaciones de inclusión local encontradas entre archivos Pawn: 61.
- Referencias a includes locales entre los archivos Pawn analizados que no se pudieron resolver: 0.

## Estructura existente
La GM ya está parcialmente modularizada en `gamemodes/modulos/` y `gamemodes/Inventario/`. El archivo principal todavía incluye grandes bloques de lógica directamente, y varios módulos están incluidos en distintos puntos del archivo. Eso hace que el orden de inclusión y la disponibilidad de símbolos globales sean parte del comportamiento de compilación.

## Dependencias locales observadas
- `modulos/battlepass_nexus.p` → `modulos/battlepass_datos.p`
- `modulos/blindado_mercado_rb.p` → `modulos/blindado_rb_datos.p`
- `modulos/casas_vacias.p` → `modulos/casas_muebles_nativos.p`
- `modulos/graffitis_nexus.p` → `modulos/graffitis_catalogo.p`
- `modulos/login.p` → `modulos/login_cinematico.p`
- `modulos/login_cinematico.p` → `modulos/login_recorrido.p`
- `modulos/negocios_publicos.p` → `modulos/negocios_compra_textdraw.p`
- `modulos/negocios_roleplay.p` → `modulos/negocios_datos.p`, `modulos/negocios_publicos.p`, `modulos/negocios_economia.p`

## Archivos Pawn que no se alcanzan desde `GZRP.pwn`
El análisis estático no encontró una ruta de inclusión desde el punto de entrada hacia:
- `Inventario/Dialog_armas.p`
- `Inventario/Inv_OnPlayerClickTextDraw.p`
- `Inventario/Inventario_PlayerTextDrawShow.p`
- `modulos/anticheat.p`
- `modulos/borrador.p`
- `modulos/concesionarios_nexus.p`
- `modulos/graffitis.p`
- `modulos/guardaespaldas.p`
- `modulos/guardias-fabricas.p`
- `modulos/inventario.pwn`
- `modulos/navidad.p`
- `modulos/notes.p`
- `modulos/notificaciones3.p`
- `modulos/tienda_exclusiva_precios.p`
- `modulos/vars.p`

Esto **no demuestra que sean archivos inútiles**. No se deben borrar hasta verificar otros flujos de compilación, dependencias dinámicas y si son respaldos o sistemas pendientes de integrar.

## Entorno de compilación disponible en el paquete
- Incluye `pawno/pawncc.exe` y 457 archivos `.inc` bajo `pawno/include`.
- El script `COMPILAR-WINDOWS.bat` documenta la compilación esperada.
- Este entorno de análisis es Linux y no tiene Wine disponible; por ello no se ha ejecutado el compilador Windows incluido.
- Se añadió a la rama `refactor/estructura-gzrp` el workflow `.github/workflows/compile-gzrp.yml` para compilar con el mismo `pawncc.exe` en un runner Windows. La existencia del workflow no equivale a una compilación exitosa; hay que revisar el resultado de GitHub Actions cuando esté disponible.

## Diferencias encontradas en el paquete
- `SHA256-ARCHIVOS.json` incluye referencias a `gamemodes/GZRP.amx`, `samp03svr`, `iniciar-linux.sh` y dos logs que no aparecen como archivos en el RAR recibido. Por tanto, el manifiesto y el contenido del archivo no coinciden completamente.
- Los hashes del manifiesto para `pawno/include/Pawn.RakNet.inc` y `plugins/pawnraknet.so` no coinciden con los bytes extraídos. Deben confirmarse antes de usar ese manifiesto como verificación de integridad.
- El lector del archivo informó errores de checksum al extraer dos DLL de Windows (`windows/plugins/pawncmd.dll` y `windows/plugins/streamer.dll`). No se deben considerar verificados esos dos binarios.
- `mysql.ini` está presente en el paquete. Antes de publicar el paquete o subirlo a un repositorio público, confirmar localmente que no contiene credenciales reales. No incluir secretos en commits.

## Principios de la migración
1. Mantener `GZRP.pwn` como punto de entrada hasta que la migración esté validada.
2. No cambiar lógica, SQL, comandos, permisos, coordenadas, callbacks, timers, nombres de símbolos ni comportamiento durante la primera fase.
3. Mover un sistema por vez, conservando orden de inclusión y actualizando todas las referencias.
4. Revisar el diff de cada tanda para asegurarse de que el cambio sea estructural y no funcional.
5. Compilar con el compilador incluido y los mismos includes.
6. Probar conexión MySQL, registro/login, inventario, vehículos, casas, negocios, facciones, textdraws, timers y NPC/FCNPC antes de integrar cambios en `main`.

## Conclusión
Ya se puede planificar la reorganización con el proyecto completo, no solo con la carpeta `gamemodes`. La siguiente fase debe comenzar con una compilación base reproducible y después una migración pequeña. No es seguro mover decenas de archivos a la vez antes de disponer de una compilación de referencia.
