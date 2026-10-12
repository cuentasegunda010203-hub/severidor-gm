stock bool:RP_ToySlotValid(playerid, slot) {
    if (playerid < 0 || playerid >= MAX_PLAYERS || slot < 0 || slot >= MAX_PLAYER_TOYS) return false;
    if (!IsPlayerConnected(playerid) || JugadorLogeado[playerid] != 1) return false;
    return PLAYER_TOYS[playerid][slot][pt_MODEL_ID] > 0;
}

stock bool:RP_ToyTransformValid(Float:x, Float:y, Float:z,
    Float:rx, Float:ry, Float:rz, Float:sx, Float:sy, Float:sz) {
    // Positive checks also reject NaN/infinite floats before memory or SQL writes.
    if (!(x > -0.6 && x < 0.6 && y > -0.6 && y < 0.6 && z > -0.6 && z < 0.6)) return false;
    if (!(sx > 0.0 && sx < 1.5 && sy > 0.0 && sy < 1.5 && sz > 0.0 && sz < 1.5)) return false;
    if (!(rx >= -3600.0 && rx <= 3600.0 && ry >= -3600.0 && ry <= 3600.0 && rz >= -3600.0 && rz <= 3600.0)) return false;
    return true;
}

stock RP_RestoreToy(playerid, slot) {
    if (!RP_ToySlotValid(playerid, slot)) return 0;
    if (IsPlayerAttachedObjectSlotUsed(playerid, slot)) RemovePlayerAttachedObject(playerid, slot);
    if (PLAYER_TOYS[playerid][slot][pt_ATTACHED]) UpdatePlayerToy(playerid, slot);
    return 1;
}
