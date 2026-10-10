# Inventario estructural inicial de GZRP

## Archivos principales observados

- `gamemodes/GZRP.pwn`: punto de entrada actual, aproximadamente 4.33 MB.
- `gamemodes/modulos/`: contiene módulos Pawn `.p/.pwn` y documentos de sistemas.
- `gamemodes/Inventario/`: contiene `Dialog_armas.p`, `Inv_OnPlayerClickTextDraw.p`, `Inventario_PlayerTextDrawShow.p` y `Variables.p`.
- `database/NEXUS-completa.sql`: base de datos existente; no se modifica por reorganizar fuentes.
- `server.cfg`, `mysql.ini`, plugins y NPC: quedan fuera de los movimientos iniciales.

## Clasificación provisional por nombre de archivo

La clasificación es orientativa y no prueba independencia funcional ni indica todavía que un archivo pueda moverse:
- **Interfaz/HUD:** `bienvenida_textdraw.p`, `dispositivo_textdraw.p`, `hud.p`, `dialogs.p`.
- **Inventario/accesorios:** `inventario.pwn`, `inventario_acciones_nexus.p`, `accesorios_validacion.p` y fuentes de `gamemodes/Inventario/`.
- **Casas:** `casas_muebles_nativos.p`, `casas_puntos.p`, `casas_salida_segura.p`, `casas_vacias.p`.
- **Economía/interacciones:** `cajeros_nexus.p`, `hotdogs.p`, `concesionarios_nexus.p`.
- **Facciones/trabajos/NPC:** `facciones_gobierno.p`, `bomberos_nexus.p`, `habilidades_taxista_obrero.p`, `guardaespaldas.p`, `guardias-fabricas.p`.
- **Eventos/progresión:** `battlepass_datos.p`, `battlepass_nexus.p`, `battlepass_ui.p`, `blindado_mercado_rb.p`, `blindado_rb_datos.p`, `c4_persistente.p`.
- **Contenido y servicios:** `graffitis.p`, `graffitis_catalogo.p`, `graffitis_nexus.p`, `discord.p`, `compat_android_pc.p`, `gz_objects.p`.
- **Transversal/core candidato:** `funciones.p`, `identidad_servidor.p`, `anticheat.p`.

## Bloqueo técnico antes de mover código

La herramienta de GitHub puede listar y leer módulos pequeños, pero no entrega el contenido de `GZRP.pwn` porque supera su límite de lectura y contiene bytes que no se decodifican como UTF-8. Por eso todavía no es posible comprobar el orden real de `#include` en el archivo principal, ni asegurar que una mudanza de rutas compile.

Antes de cualquier movimiento real:
1. Obtener la copia completa del repositorio y detectar la codificación del archivo principal sin convertir ni alterar bytes.
2. Buscar todos los `#include`, callbacks, forwards, variables y funciones compartidas.
3. Compilar el original con la misma versión del compilador e includes.
4. Mover un grupo pequeño, ajustar solo rutas necesarias y compilar de nuevo.
5. Mantener el archivo original y comparar el comportamiento antes de seguir.

**Estado real:** rama de trabajo y PR en borrador. Se realizó una primera migración pequeña de identidad del servidor mediante un puente de compatibilidad; no se ha cambiado la lógica del GM. La compilación y las pruebas funcionales siguen pendientes.
