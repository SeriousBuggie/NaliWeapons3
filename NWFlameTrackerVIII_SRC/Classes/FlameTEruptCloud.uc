//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTEruptCloud expands NWBaseCloud;

#exec MESH IMPORT MESH=FlameTEruptCloud ANIVFILE=MODELS\FlameTEruptCloud_a.3d DATAFILE=MODELS\FlameTEruptCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTEruptCloud STRENGTH=0.1
#exec MESH ORIGIN MESH=FlameTEruptCloud X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FlameTEruptCloud SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=FlameTEruptCloud SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=FlameTEruptCloud SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=FlameTEruptCloud MESH=FlameTEruptCloud
#exec MESHMAP SCALE MESHMAP=FlameTEruptCloud X=0.3 Y=0.3 Z=0.6

defaultproperties
{
	Mesh=FlameTEruptCloud
	DrawScale=30.000000
	MinDrawScale=1.000000
	
	LifeSpan=10.000000
	bWhiteSmoke=True
	FadeInTime=0.500000
	FadeOutTime=5.000000
	CloudDetail=8
}
