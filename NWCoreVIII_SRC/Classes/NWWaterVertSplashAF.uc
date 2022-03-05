//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterVertSplashAF expands NWWaterVertSplashAC;

////////////////////////////////////////////////////////////////////////////////
//Category HUGE Water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWWaterVertSplashA05 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWaterVertSplashA05 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWWaterVertSplashA05 X=0 Y=0 Z=48

#exec MESH SEQUENCE MESH=NWWaterVertSplashA05 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWWaterVertSplashA05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA05 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA05 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWWaterVertSplashA05 MESH=NWWaterVertSplashA05
#exec MESHMAP SCALE MESHMAP=NWWaterVertSplashA05 X=8.0 Y=8.0 Z=14.0

defaultproperties
{
	Mesh=NWWaterVertSplashA05
	DrawScale=2.000000
	FinalDrawScale=8.000000
	SplashLevel=5
}
