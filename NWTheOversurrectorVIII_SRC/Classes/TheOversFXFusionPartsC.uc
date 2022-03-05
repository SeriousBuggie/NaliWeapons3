//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXFusionPartsC expands TheOversFXFusionPartsA;

#exec MESH IMPORT MESH=TheOversFXFusionPartsC ANIVFILE=MODELS\TheOversFXFusionParts_a.3d DATAFILE=MODELS\TheOversFXFusionParts_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheOversFXFusionPartsC STRENGTH=0
#exec MESH ORIGIN MESH=TheOversFXFusionPartsC X=0 Y=0 Z=0 YAW=16 ROLL=192

#exec MESH SEQUENCE MESH=TheOversFXFusionPartsC SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsC SEQ=Collapse STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsC SEQ=Expand STARTFRAME=6 NUMFRAMES=7 RATE=6.0

#exec MESHMAP NEW MESHMAP=TheOversFXFusionPartsC MESH=TheOversFXFusionPartsC
#exec MESHMAP SCALE MESHMAP=TheOversFXFusionPartsC X=0.06 Y=0.06 Z=0.12

defaultproperties
{
	Mesh=TheOversFXFusionPartsC
	LifeSpan=1.100000

	RRate2=(Yaw=30000)
}
