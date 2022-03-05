//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBalWaterSplashC expands NWBalWaterSplashA;

////////////////////////////////////////////////////////////////////////////////
//Category BIG ballistic water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWBalWaterSplash02 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWBalWaterSplash02 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWBalWaterSplash02 X=0 Y=0 Z=52

#exec MESH SEQUENCE MESH=NWBalWaterSplash02 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWBalWaterSplash02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWBalWaterSplash02 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWBalWaterSplash02 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWBalWaterSplash02 MESH=NWBalWaterSplash02
#exec MESHMAP SCALE MESHMAP=NWBalWaterSplash02 X=1.0 Y=1.0 Z=4.0

defaultproperties
{
	Mesh=NWBalWaterSplash02
	DrawScale=0.310000
	FinalDrawScale=1.500000
	SplashLevel=2
}
