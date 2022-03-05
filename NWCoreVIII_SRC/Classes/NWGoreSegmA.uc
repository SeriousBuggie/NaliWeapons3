//////////////////////////////////////////////////////////////
//				Feralidragon (31-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreSegmA expands NWCordSegm;

#exec MESH IMPORT MESH=GoreSegmPartA ANIVFILE=MODELS\GoreSegmPartA_a.3d DATAFILE=MODELS\GoreSegmPartA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSegmPartA STRENGTH=0.5
#exec MESH ORIGIN MESH=GoreSegmPartA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSegmPartA SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GoreSegmPartA SEQ=Still STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GoreSegmPartA SEQ=Segm STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GoreSegmPartA MESH=GoreSegmPartA
#exec MESHMAP SCALE MESHMAP=GoreSegmPartA X=0.4 Y=0.4 Z=0.8


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GoreSegmPartA
	MaxLength=384.000000
	DrawScale=0.400000
	
	MultiSkins(1)=NWMeat02
}
