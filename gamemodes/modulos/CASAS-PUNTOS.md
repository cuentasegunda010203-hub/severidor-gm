# Puntos interiores de casa: Android y PC

/casa > Mover textos y puntos, o /textoscasa.
Solo el propietario, conectado y a pie dentro de su casa, puede usarlo.
Elegir Radio, Heladera o Ropero, caminar hasta la posicion deseada y seleccionar Colocar aqui y guardar. Se puede subir/bajar 0.25 metros cerca del punto.
La posicion mueve tanto el texto como el lugar donde funcionan sus comandos y teclas. No coloca un objeto fisico: ese mueble se compra y coloca con /muebles.
Radio usa /emisoras y /apagar radio. Heladera y ropero conservan sus comandos originales.
Guardado en rp_house_points por casa y tipo, condicionado al interior elegido. Al recrear una casa con el mismo ID se borran los puntos antiguos. Una venta conserva la distribucion de la casa.

/crearcasa <Precio> <Nivel> <Moneda> <Interior>
Monedas permitidas: 0 = Dinero, 1 = GZ, 2 = Coins.
Coins conserva el saldo historico usuarios.totems; no se convierten ni alteran saldos. Las casas antiguas en moneda 2 ahora muestran Coins.
Ejemplos: /crearcasa 50000 1 0 30; /crearcasa 10 1 1 30; /crearcasa 10 1 2 30.
Las compras aceptan saldo exactamente igual al precio.

Verificacion: ambas GM compilaron sin errores ni advertencias. QA aislado: 14 comprobaciones sin fallos con MySQL y Streamer reales, jugadores simulados. Cubre guardar/recargar, altura, etiquetas, puntos separados, cambio de propietario/contexto, distancia, fallo SQL, interior distinto e ID reutilizado.
Pendiente comprobar visualmente dentro de GTA en Android y PC. Las AMX se instalaron para el proximo reinicio; no se reinicio el servidor activo.