//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterVertSplashAH expands NWWaterVertSplashAC;

////////////////////////////////////////////////////////////////////////////////
//Category !FUCKING! HUGE NWWater fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWWaterVertSplashA07 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWaterVertSplashA07 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWWaterVertSplashA07 X=0 Y=0 Z=48

#exec MESH SEQUENCE MESH=NWWaterVertSplashA07 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWWaterVertSplashA07 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA07 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA07 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWWaterVertSplashA07 MESH=NWWaterVertSplashA07
#exec MESHMAP SCALE MESHMAP=NWWaterVertSplashA07 X=32.0 Y=32.0 Z=56.0

defaultproperties
{
	Mesh=NWWaterVertSplashA07
	DrawScale=8.000000
	FinalDrawScale=32.000000
	SplashLevel=7
}
