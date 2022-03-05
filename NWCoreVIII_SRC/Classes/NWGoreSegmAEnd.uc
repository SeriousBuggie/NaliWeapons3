//////////////////////////////////////////////////////////////
//				Feralidragon (31-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreSegmAEnd expands NWGoreSegmA;

#exec MESH IMPORT MESH=GoreSegmPartAEnd ANIVFILE=MODELS\GoreSegmPartAEnd_a.3d DATAFILE=MODELS\GoreSegmPartAEnd_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSegmPartAEnd STRENGTH=0.5
#exec MESH ORIGIN MESH=GoreSegmPartAEnd X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSegmPartAEnd SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GoreSegmPartAEnd SEQ=Still STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GoreSegmPartAEnd SEQ=Segm STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GoreSegmPartAEnd MESH=GoreSegmPartAEnd
#exec MESHMAP SCALE MESHMAP=GoreSegmPartAEnd X=0.4 Y=0.4 Z=0.8

defaultproperties
{
	Mesh=GoreSegmPartAEnd
}
