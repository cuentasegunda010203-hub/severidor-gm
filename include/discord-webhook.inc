stock MensajeWebhook(const nombre[], const token[], const mensaje[], ev = 0, skin = 0)
{
    return CallRemoteFunction("NativeWebhook", "iisss", ev,skin,nombre,token,mensaje);
}
stock FormatMensajeWebhook(ev, skin, const nombre[], const token[], const form[], {Float, _}: ...)
{
    #pragma unused form
	static tmp[200];
	new t1 = playerid,t2 = color;
	const n4 = -4, n16 = -16, size = sizeof tmp;
    #emit stack 28
    #emit push.c size
    #emit push.c tmp
    #emit stack n4
    #emit sysreq.c format
    #emit stack n16
	return CallRemoteFunction("NativeWebhook", "iisss", ev,skin,nombre,token,tmp);
}