//////////////////////////////////////////////////////////////
//				Feralidragon (31-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreSegmAStart expands NWGoreSegmA;

#exec MESH IMPORT MESH=GoreSegmPartAStart ANIVFILE=MODELS\GoreSegmPartAStart_a.3d DATAFILE=MODELS\GoreSegmPartAStart_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSegmPartAStart STRENGTH=0.5
#exec MESH ORIGIN MESH=GoreSegmPartAStart X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSegmPartAStart SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GoreSegmPartAStart SEQ=Still STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GoreSegmPartAStart SEQ=Segm STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GoreSegmPartAStart MESH=GoreSegmPartAStart
#exec MESHMAP SCALE MESHMAP=GoreSegmPartAStart X=0.4 Y=0.4 Z=0.8

defaultproperties
{
	Mesh=GoreSegmPartAStart
}
