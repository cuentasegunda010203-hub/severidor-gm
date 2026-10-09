# Core de GZRP

Aquí se ubicarán, después de auditar sus dependencias, las piezas compartidas del gamemode: definiciones globales, estado común, inicialización, conexión a base de datos y utilidades transversales.

**Regla:** no mover código desde `GZRP.pwn` ni desde `modulos/` hasta identificar referencias, orden de declaración, callbacks y compilación de referencia. No duplicar funciones ni variables globales.
