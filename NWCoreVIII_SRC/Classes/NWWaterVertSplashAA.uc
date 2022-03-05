//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterVertSplashAA expands NWWaterVertSplashAC;

////////////////////////////////////////////////////////////////////////////////
//Category SMALL Water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWWaterVertSplashA00 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWaterVertSplashA00 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWWaterVertSplashA00 X=0 Y=0 Z=48

#exec MESH SEQUENCE MESH=NWWaterVertSplashA00 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWWaterVertSplashA00 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA00 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA00 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWWaterVertSplashA00 MESH=NWWaterVertSplashA00
#exec MESHMAP SCALE MESHMAP=NWWaterVertSplashA00 X=0.25 Y=0.25 Z=0.4375

defaultproperties
{
	Mesh=NWWaterVertSplashA00
	DrawScale=0.062500
	FinalDrawScale=0.250000
	SplashLevel=0
}
