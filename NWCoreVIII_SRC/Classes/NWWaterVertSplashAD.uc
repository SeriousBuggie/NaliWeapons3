//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterVertSplashAD expands NWWaterVertSplashAC;

////////////////////////////////////////////////////////////////////////////////
//Category BIG Water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWWaterVertSplashA03 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWaterVertSplashA03 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWWaterVertSplashA03 X=0 Y=0 Z=48

#exec MESH SEQUENCE MESH=NWWaterVertSplashA03 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWWaterVertSplashA03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA03 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA03 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWWaterVertSplashA03 MESH=NWWaterVertSplashA03
#exec MESHMAP SCALE MESHMAP=NWWaterVertSplashA03 X=2.0 Y=2.0 Z=3.5

defaultproperties
{
	Mesh=NWWaterVertSplashA03
	DrawScale=0.500000
	FinalDrawScale=2.000000
	SplashLevel=3
}
