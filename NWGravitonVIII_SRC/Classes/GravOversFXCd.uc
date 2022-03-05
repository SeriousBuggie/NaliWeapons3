//////////////////////////////////////////////////////////////
//				Feralidragon (25-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravOversFXCd expands GravOversFXC;

#exec MESH IMPORT MESH=GravOversFXCd ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravOversFXCd STRENGTH=0.0
#exec MESH ORIGIN MESH=GravOversFXCd X=0 Y=0 Z=0 ROLL=128

#exec MESH SEQUENCE MESH=GravOversFXCd SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravOversFXCd SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravOversFXCd SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravOversFXCd SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravOversFXCd MESH=GravOversFXCd
#exec MESHMAP SCALE MESHMAP=GravOversFXCd X=0.003 Y=0.003 Z=0.006


defaultproperties
{
	Mesh=GravOversFXCd
	ScaleGlow=2.200000
	DrawScale=0.022000

	StartingRot=(Roll=-500)
	RRate1=(Roll=-200)
	RRate2=(Yaw=-8000)
}
