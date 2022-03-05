//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterVertSplashAE expands NWWaterVertSplashAC;

////////////////////////////////////////////////////////////////////////////////
//Category SUPER BIG Water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWWaterVertSplashA04 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWaterVertSplashA04 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWWaterVertSplashA04 X=0 Y=0 Z=48

#exec MESH SEQUENCE MESH=NWWaterVertSplashA04 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWWaterVertSplashA04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA04 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA04 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWWaterVertSplashA04 MESH=NWWaterVertSplashA04
#exec MESHMAP SCALE MESHMAP=NWWaterVertSplashA04 X=4.0 Y=4.0 Z=7.0

defaultproperties
{
	Mesh=NWWaterVertSplashA04
	DrawScale=1.000000
	FinalDrawScale=4.000000
	SplashLevel=4
}
