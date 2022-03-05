//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBalWaterSplashB expands NWBalWaterSplashA;

////////////////////////////////////////////////////////////////////////////////
//Category NORMAL ballistic water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWBalWaterSplash01 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWBalWaterSplash01 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWBalWaterSplash01 X=0 Y=0 Z=52

#exec MESH SEQUENCE MESH=NWBalWaterSplash01 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWBalWaterSplash01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWBalWaterSplash01 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWBalWaterSplash01 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWBalWaterSplash01 MESH=NWBalWaterSplash01
#exec MESHMAP SCALE MESHMAP=NWBalWaterSplash01 X=0.5 Y=0.5 Z=2.0

defaultproperties
{
	Mesh=NWBalWaterSplash01
	DrawScale=0.155000
	FinalDrawScale=0.750000
	SplashLevel=1
}
