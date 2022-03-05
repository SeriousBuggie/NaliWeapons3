//////////////////////////////////////////////////////////////
//				Feralidragon (13-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTOversFXB expands FlameTOversFXA;

#exec MESH IMPORT MESH=FlameTOversFXB ANIVFILE=MODELS\FlameTOversFXA_a.3d DATAFILE=MODELS\FlameTOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTOversFXB STRENGTH=0
#exec MESH ORIGIN MESH=FlameTOversFXB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=FlameTOversFXB SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=FlameTOversFXB SEQ=Fluid STARTFRAME=0 NUMFRAMES=20 RATE=19.0

#exec MESHMAP NEW MESHMAP=FlameTOversFXB MESH=FlameTOversFXB
#exec MESHMAP SCALE MESHMAP=FlameTOversFXB X=0.0075 Y=0.0075 Z=0.015

#exec TEXTURE IMPORT NAME=FlameTLavaGlowB FILE=Coronas\FlameTLavaGlowB.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	Mesh=FlameTOversFXB
	Style=STY_Translucent
	DrawScale=0.250000
	ScaleGlow=0.550000
	bParticles=True
	Texture=FlameTLavaGlowB
	MultiSkins(1)=None
	
	renderOnTop=True
}
