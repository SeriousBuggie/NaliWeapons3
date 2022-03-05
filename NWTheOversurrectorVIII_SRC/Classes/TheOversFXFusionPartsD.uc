//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXFusionPartsD expands TheOversFXFusionPartsA;

#exec MESH IMPORT MESH=TheOversFXFusionPartsD ANIVFILE=MODELS\TheOversFXFusionParts_a.3d DATAFILE=MODELS\TheOversFXFusionParts_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheOversFXFusionPartsD STRENGTH=0
#exec MESH ORIGIN MESH=TheOversFXFusionPartsD X=0 Y=0 Z=0 YAW=288 ROLL=64

#exec MESH SEQUENCE MESH=TheOversFXFusionPartsD SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsD SEQ=Collapse STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsD SEQ=Expand STARTFRAME=6 NUMFRAMES=7 RATE=6.0

#exec MESHMAP NEW MESHMAP=TheOversFXFusionPartsD MESH=TheOversFXFusionPartsD
#exec MESHMAP SCALE MESHMAP=TheOversFXFusionPartsD X=0.045 Y=0.045 Z=0.09

defaultproperties
{
	Mesh=TheOversFXFusionPartsD
	LifeSpan=0.950000
	
	RRate2=(Yaw=20000)
}
