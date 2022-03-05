//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterVertSplashAG expands NWWaterVertSplashAC;

////////////////////////////////////////////////////////////////////////////////
//Category SUPER HUGE Water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWWaterVertSplashA06 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWaterVertSplashA06 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWWaterVertSplashA06 X=0 Y=0 Z=48

#exec MESH SEQUENCE MESH=NWWaterVertSplashA06 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWWaterVertSplashA06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA06 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA06 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWWaterVertSplashA06 MESH=NWWaterVertSplashA06
#exec MESHMAP SCALE MESHMAP=NWWaterVertSplashA06 X=16.0 Y=16.0 Z=28.0

defaultproperties
{
	Mesh=NWWaterVertSplashA06
	DrawScale=4.000000
	FinalDrawScale=16.000000
	SplashLevel=6
}
