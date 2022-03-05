//////////////////////////////////////////////////////////////
//				Feralidragon (02-02-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolOversFXB expands UltimaSolOversFXA;

#exec MESH IMPORT MESH=UltimaSolOversFXB ANIVFILE=MODELS\UltimaSolOversFXA_a.3d DATAFILE=MODELS\UltimaSolOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaSolOversFXB STRENGTH=0
#exec MESH ORIGIN MESH=UltimaSolOversFXB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaSolOversFXB SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=UltimaSolOversFXB SEQ=Fluid STARTFRAME=0 NUMFRAMES=20 RATE=19.0

#exec MESHMAP NEW MESHMAP=UltimaSolOversFXB MESH=UltimaSolOversFXB
#exec MESHMAP SCALE MESHMAP=UltimaSolOversFXB X=0.0075 Y=0.0075 Z=0.015

#exec TEXTURE IMPORT NAME=UltimaSolOversGlow FILE=Coronas\UltimaSolOversGlow.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	Mesh=UltimaSolOversFXB
	Style=STY_Translucent
	DrawScale=0.250000
	ScaleGlow=0.250000
	bParticles=True
	Texture=UltimaSolOversGlow
	MultiSkins(1)=None
	SpriteProjForward=0.000000
	
	renderOnTop=False
	FlickerFactorMax=1.100000
	FlickerFactorMin=0.850000
	bSpawnFlr=False
}
