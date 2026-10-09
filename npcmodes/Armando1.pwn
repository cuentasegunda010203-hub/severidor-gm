#include <a_npc>
main() {}
public OnNPCEnterVehicle(vehicleid, seatid) { StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"Armando1"); return 1; }
public OnNPCExitVehicle() { StopRecordingPlayback(); return 1; }
public OnRecordingPlaybackEnd() { return 1; }
