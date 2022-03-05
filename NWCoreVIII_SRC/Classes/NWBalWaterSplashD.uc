//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBalWaterSplashD expands NWBalWaterSplashA;

////////////////////////////////////////////////////////////////////////////////
//Category WTF ballistic water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWBalWaterSplash03 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWBalWaterSplash03 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWBalWaterSplash03 X=0 Y=0 Z=52

#exec MESH SEQUENCE MESH=NWBalWaterSplash03 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWBalWaterSplash03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWBalWaterSplash03 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWBalWaterSplash03 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWBalWaterSplash03 MESH=NWBalWaterSplash03
#exec MESHMAP SCALE MESHMAP=NWBalWaterSplash03 X=2.0 Y=2.0 Z=8.0

defaultproperties
{
	Mesh=NWBalWaterSplash03
	DrawScale=0.620000
	FinalDrawScale=3.000000
	SplashLevel=3
}
