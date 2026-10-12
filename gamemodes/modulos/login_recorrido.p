// Local music URL. Set to your public HTTP audio URL when hosting remotely.
#if !defined RP_LOGIN_MUSIC_URL
 #define RP_LOGIN_MUSIC_URL "http://127.0.0.1:8080/audio/nexus-city-nights.mp3"
#endif
new RP_LGTourTimer[MAX_PLAYERS],RP_LGTourStart[MAX_PLAYERS],RP_LGTourLeg[MAX_PLAYERS];
new RP_LGMusicTimer[MAX_PLAYERS];
new bool:RP_LGMusicPlaying[MAX_PLAYERS];
// Position and look-at keyframes. A full lap lasts 216 seconds.
static const Float:RP_LGTourPoints[][6]={
 {1685.0,-2440.0,130.0,1723.0,-2317.0,16.0},
 {1120.0,-2450.0,145.0,1380.0,-2230.0,25.0},
 {520.0,-1910.0,135.0,680.0,-1810.0,15.0},
 {290.0,-1530.0,140.0,470.0,-1480.0,30.0},
 {470.0,-1000.0,165.0,650.0,-1120.0,65.0},
 {960.0,-850.0,185.0,1130.0,-1000.0,65.0},
 {1420.0,-1070.0,260.0,1510.0,-1240.0,85.0},
 {1610.0,-1550.0,265.0,1480.0,-1730.0,25.0},
 {2050.0,-1550.0,150.0,2180.0,-1740.0,20.0},
 {2530.0,-1850.0,140.0,2390.0,-1730.0,25.0},
 {2540.0,-2360.0,155.0,2430.0,-2500.0,35.0},
 {2120.0,-2670.0,150.0,2000.0,-2480.0,25.0}
};
#define RP_LG_LEG_MS (18000)
stock RP_LGTourAllowed(p) {
 return RP_LGValid(p) && RP_LGStage[p]!=LG_NONE && RP_LGStage[p]!=LG_CHARACTER && RP_LGStage[p]!=LG_SAVING;
}
stock RP_LGTourStop(p) {
 if(RP_LGTourTimer[p]) KillTimer(RP_LGTourTimer[p]);
 RP_LGTourTimer[p]=0;return 1;
}
stock RP_LGMusicStop(p) {
 if(RP_LGMusicTimer[p]) KillTimer(RP_LGMusicTimer[p]);RP_LGMusicTimer[p]=0;
 if(RP_LGMusicPlaying[p] && IsPlayerConnected(p)) StopAudioStreamForPlayer(p);
 RP_LGMusicPlaying[p]=false;return 1;
}
forward RP_LGMusicLoop(p);
public RP_LGMusicLoop(p) {
 if(!RP_LGTourAllowed(p)){RP_LGMusicStop(p);return 0;}
 RP_LGMusicPlaying[p]=true;PlayAudioStreamForPlayer(p,RP_LOGIN_MUSIC_URL);return 1;
}
stock RP_LGMusicStart(p) {
 if(RP_LGMusicPlaying[p]) return 1;
 RP_LGMusicLoop(p);RP_LGMusicTimer[p]=SetTimerEx("RP_LGMusicLoop",102000,true,"i",p);return 1;
}
stock RP_LGTourApply(p,bool:camera=true) {
 new leg=RP_LGTourLeg[p],next=(leg+1)%sizeof(RP_LGTourPoints);
 new elapsed=GetTickCount()-RP_LGTourStart[p];if(elapsed<0) elapsed=0;if(elapsed>RP_LG_LEG_MS) elapsed=RP_LG_LEG_MS;
 new Float:t=float(elapsed)/float(RP_LG_LEG_MS),Float:pos[6];
 for(new i;i<6;i++) pos[i]=RP_LGTourPoints[leg][i]+(RP_LGTourPoints[next][i]-RP_LGTourPoints[leg][i])*t;
 if(RP_LGAnchor[p] && GetVehicleModel(RP_LGAnchor[p])!=0) {
  SetVehiclePos(RP_LGAnchor[p],pos[0],pos[1],pos[2]-40.0);SetVehicleVelocity(RP_LGAnchor[p],0.0,0.0,0.0);
 }
 Streamer_UpdateEx(p,pos[0],pos[1],pos[2],70000+p,0);
 if(camera) {
  new remaining=RP_LG_LEG_MS-elapsed;if(remaining<1) remaining=1;
  InterpolateCameraPos(p,pos[0],pos[1],pos[2],RP_LGTourPoints[next][0],RP_LGTourPoints[next][1],RP_LGTourPoints[next][2],remaining,CAMERA_MOVE);
  InterpolateCameraLookAt(p,pos[3],pos[4],pos[5],RP_LGTourPoints[next][3],RP_LGTourPoints[next][4],RP_LGTourPoints[next][5],remaining,CAMERA_MOVE);
 }
 return 1;
}
forward RP_LGTourTick(p);
public RP_LGTourTick(p) {
 if(!RP_LGTourAllowed(p)){RP_LGTourStop(p);return 0;}
 if(GetTickCount()-RP_LGTourStart[p]>=RP_LG_LEG_MS) {
  RP_LGTourLeg[p]=(RP_LGTourLeg[p]+1)%sizeof(RP_LGTourPoints);RP_LGTourStart[p]=GetTickCount();
  RP_LGTourApply(p,true);
 }else RP_LGTourApply(p,false);
 return 1;
}
stock RP_LGTourStartScene(p) {
 if(!RP_LGTourAllowed(p)) return 0;
 if(!RP_LGTourTimer[p]) {
  RP_LGTourLeg[p]=0;RP_LGTourStart[p]=GetTickCount();
  RP_LGTourTimer[p]=SetTimerEx("RP_LGTourTick",500,true,"i",p);
 }
 RP_LGMusicStart(p);return RP_LGTourApply(p,true);
}
