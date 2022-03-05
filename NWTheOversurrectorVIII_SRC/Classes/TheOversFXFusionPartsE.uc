//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXFusionPartsE expands TheOversFXFusionPartsA;

#exec MESH IMPORT MESH=TheOversFXFusionPartsE ANIVFILE=MODELS\TheOversFXFusionParts_a.3d DATAFILE=MODELS\TheOversFXFusionParts_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheOversFXFusionPartsE STRENGTH=0
#exec MESH ORIGIN MESH=TheOversFXFusionPartsE X=0 Y=0 Z=0 YAW=64 ROLL=16

#exec MESH SEQUENCE MESH=TheOversFXFusionPartsE SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsE SEQ=Collapse STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsE SEQ=Expand STARTFRAME=6 NUMFRAMES=7 RATE=6.0

#exec MESHMAP NEW MESHMAP=TheOversFXFusionPartsE MESH=TheOversFXFusionPartsE
#exec MESHMAP SCALE MESHMAP=TheOversFXFusionPartsE X=0.03 Y=0.03 Z=0.06

defaultproperties
{
	Mesh=TheOversFXFusionPartsE
	LifeSpan=0.800000

	RRate2=(Yaw=10000)
}
