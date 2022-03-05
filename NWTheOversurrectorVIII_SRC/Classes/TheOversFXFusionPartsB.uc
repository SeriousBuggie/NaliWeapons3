//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXFusionPartsB expands TheOversFXFusionPartsA;

#exec MESH IMPORT MESH=TheOversFXFusionPartsB ANIVFILE=MODELS\TheOversFXFusionParts_a.3d DATAFILE=MODELS\TheOversFXFusionParts_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheOversFXFusionPartsB STRENGTH=0
#exec MESH ORIGIN MESH=TheOversFXFusionPartsB X=0 Y=0 Z=0 ROLL=64

#exec MESH SEQUENCE MESH=TheOversFXFusionPartsB SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsB SEQ=Collapse STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsB SEQ=Expand STARTFRAME=6 NUMFRAMES=7 RATE=6.0

#exec MESHMAP NEW MESHMAP=TheOversFXFusionPartsB MESH=TheOversFXFusionPartsB
#exec MESHMAP SCALE MESHMAP=TheOversFXFusionPartsB X=0.09 Y=0.09 Z=0.18

defaultproperties
{
	Mesh=TheOversFXFusionPartsB
	LifeSpan=1.400000
	
	RRate2=(Yaw=50000)
}
