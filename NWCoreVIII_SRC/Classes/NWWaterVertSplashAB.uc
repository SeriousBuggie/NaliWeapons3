//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterVertSplashAB expands NWWaterVertSplashAC;

////////////////////////////////////////////////////////////////////////////////
//Category SMALL + Water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWWaterVertSplashA01 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWaterVertSplashA01 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWWaterVertSplashA01 X=0 Y=0 Z=48

#exec MESH SEQUENCE MESH=NWWaterVertSplashA01 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWWaterVertSplashA01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA01 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA01 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWWaterVertSplashA01 MESH=NWWaterVertSplashA01
#exec MESHMAP SCALE MESHMAP=NWWaterVertSplashA01 X=0.5 Y=0.5 Z=0.875

defaultproperties
{
	Mesh=NWWaterVertSplashA01
	DrawScale=0.125000
	FinalDrawScale=0.500000
	SplashLevel=1
}
