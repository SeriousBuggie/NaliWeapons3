//////////////////////////////////////////////////////////////
//				Feralidragon (25-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravOversFXCc expands GravOversFXC;

#exec MESH IMPORT MESH=GravOversFXCc ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravOversFXCc STRENGTH=0.0
#exec MESH ORIGIN MESH=GravOversFXCc X=0 Y=0 Z=0 ROLL=128

#exec MESH SEQUENCE MESH=GravOversFXCc SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravOversFXCc SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravOversFXCc SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravOversFXCc SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravOversFXCc MESH=GravOversFXCc
#exec MESHMAP SCALE MESHMAP=GravOversFXCc X=0.0055 Y=0.0055 Z=0.011


defaultproperties
{
	Mesh=GravOversFXCc
	ScaleGlow=1.500000
	DrawScale=0.011500

	StartingRot=(Roll=-500)
	RRate1=(Roll=-400)
	RRate2=(Yaw=-2000)
}
