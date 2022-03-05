//////////////////////////////////////////////////////////////
//				Feralidragon (25-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravOversFXCb expands GravOversFXC;

#exec MESH IMPORT MESH=GravOversFXCb ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravOversFXCb STRENGTH=0.0
#exec MESH ORIGIN MESH=GravOversFXCb X=0 Y=0 Z=0 ROLL=128

#exec MESH SEQUENCE MESH=GravOversFXCb SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravOversFXCb SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravOversFXCb SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravOversFXCb SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravOversFXCb MESH=GravOversFXCb
#exec MESHMAP SCALE MESHMAP=GravOversFXCb X=0.009 Y=0.009 Z=0.018


defaultproperties
{
	Mesh=GravOversFXCb
	ScaleGlow=0.800000
	DrawScale=0.006000

	StartingRot=(Roll=-800)
	RRate1=(Roll=-300)
	RRate2=(Yaw=-20000)
}
