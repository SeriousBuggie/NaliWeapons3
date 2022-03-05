//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class FMineBaseCloud expands NWBaseCloud;

#exec MESH IMPORT MESH=FMineBaseCloud ANIVFILE=MODELS\FMineBaseCloud_a.3d DATAFILE=MODELS\FMineBaseCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FMineBaseCloud STRENGTH=0.1
#exec MESH ORIGIN MESH=FMineBaseCloud X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=FMineBaseCloud SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=FMineBaseCloud SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=FMineBaseCloud SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=FMineBaseCloud MESH=FMineBaseCloud
#exec MESHMAP SCALE MESHMAP=FMineBaseCloud X=0.3 Y=0.3 Z=0.6

defaultproperties
{
	Mesh=FMineBaseCloud
	DrawScale=6.500000
	MinDrawScale=1.000000
	
	LifeSpan=2.500000
	bWhiteSmoke=True
	FadeInTime=0.250000
	FadeOutTime=1.750000
	ScaleGlow=0.350000
	CloudDetail=8
}
