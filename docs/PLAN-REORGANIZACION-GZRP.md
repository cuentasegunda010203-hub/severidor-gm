# Plan de reorganización segura de GZRP

## Estado inicial

- Rama base: `main` (no modificar durante esta migración).
- Rama de trabajo: `refactor/estructura-gzrp`.
- Punto de entrada existente: `gamemodes/GZRP.pwn`.
- Áreas existentes identificadas: `gamemodes/modulos/`, `gamemodes/Inventario/`.
- Base de datos documentada: `database/NEXUS-completa.sql`.
- Configuración de conexión: `mysql.ini`.
- El montaje documenta SA-MP 0.3.7-R2-1 Linux x86 y la compatibilidad actual con FCNPC. No migrar a open.mp ni cambiar plugins como parte de una reorganización de carpetas.
- El código principal es muy grande (~4.3 MB). Antes de mover sistemas, hay que analizarlo desde una copia local con búsqueda de includes, callbacks, símbolos compartidos y referencias cruzadas; no es seguro inferir el orden de compilación solo por los nombres de archivo.

## Reglas de seguridad

1. No editar ni eliminar archivos de la rama `main`.
2. No cambiar lógica de gameplay, comandos, permisos, callbacks, consultas SQL, nombres de tablas/columnas ni datos durante una migración estructural.
3. No eliminar archivos por parecer duplicados hasta demostrar que no están incluidos ni referenciados.
4. Conservar el orden efectivo de los `#include` y el orden de declaración requerido por Pawn.
5. No mover binarios, plugins, includes externos, NPC modes, filterscripts ni archivos de datos como parte de la primera etapa.
6. Hacer cambios pequeños, revisar el diff y compilar después de cada grupo.
7. No afirmar que un paso está validado hasta compilarlo y probar el servidor; una compilación correcta no sustituye pruebas de inicio y de gameplay.
8. Mantener un registro de cada archivo: ubicación anterior, nueva ubicación, dependencias y verificación.

## Objetivo de estructura (propuesta, pendiente de validar contra el código)

```text
gamemodes/
├── GZRP.pwn
├── core/
├── sistemas/
│   ├── cuentas/
│   ├── inventario/
│   ├── vehiculos/
│   ├── casas/
│   ├── negocios/
│   ├── facciones/
│   ├── trabajos/
│   ├── economia/
│   ├── administracion/
│   ├── anticheat/
│   ├── interfaz/
│   └── comunicaciones/
├── mundo/
├── integraciones/
└── recursos/
```

Esta estructura es un destino, no una orden de mover todos los archivos a ciegas. Se adaptará a las dependencias reales. Pawn compila los archivos incluidos como una unidad; las carpetas organizan el código fuente, pero no crean módulos aislados en tiempo de ejecución.

## Fases

### Fase 0 — Protección y diagnóstico
- [x] Crear rama de trabajo separada de `main`.
- [ ] Obtener una copia local completa y verificar que coincide con el commit base.
- [ ] Generar inventario de archivos fuente, includes, callbacks, comandos y plugins.
- [ ] Identificar orden de includes y símbolos compartidos.
- [ ] Registrar compilación de referencia y errores/advertencias preexistentes.

### Fase 1 — Mapa de dependencias
- [ ] Identificar qué contiene actualmente `GZRP.pwn` y cómo incorpora los archivos de `modulos/` e `Inventario/`.
- [ ] Identificar sistemas con dependencias externas o acoplamiento alto.
- [ ] Priorizar módulos independientes y dejar para el final los sistemas centrales.

### Fase 2 — Migración estructural incremental
- [ ] Mover un solo grupo de archivos por cambio.
- [ ] Actualizar únicamente rutas de inclusión imprescindibles.
- [ ] Comparar el diff y compilar tras cada grupo.
- [ ] No refactorizar ni optimizar lógica en el mismo cambio de una mudanza.

### Fase 3 — Verificación
- [ ] Compilar con la versión de compilador e includes usados por el proyecto.
- [ ] Revisar carga de plugins y conexión MySQL en el servidor de pruebas.
- [ ] Probar registro/login, inventario, vehículos, casas, negocios, facciones, trabajos, administración y NPC según los sistemas presentes.
- [ ] Resolver diferencias antes de abrir una solicitud de integración.

## Observación de seguridad de configuración

El `server.cfg` de la rama base contiene un valor en `rcon_password`. Aunque `rcon 0` esté configurado, conviene quitar cualquier secreto real del repositorio y rotarlo si llegó a usarse en un servidor accesible. No cambiar esa configuración dentro de la migración estructural sin una revisión separada.

## Estado

**Solo se ha creado la rama y este documento de planificación.** Aún no se han movido ni modificado sistemas de la GM. La siguiente acción es inspeccionar la copia completa del código y construir el mapa de dependencias antes de la primera mudanza.
