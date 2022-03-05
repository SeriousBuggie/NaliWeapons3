//////////////////////////////////////////////////////////////
//				Feralidragon (25-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravOversFXCa expands GravOversFXC;

#exec MESH IMPORT MESH=GravOversFXCa ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravOversFXCa STRENGTH=0.0
#exec MESH ORIGIN MESH=GravOversFXCa X=0 Y=0 Z=0 ROLL=128

#exec MESH SEQUENCE MESH=GravOversFXCa SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravOversFXCa SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravOversFXCa SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravOversFXCa SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravOversFXCa MESH=GravOversFXCa
#exec MESHMAP SCALE MESHMAP=GravOversFXCa X=0.00625 Y=0.00625 Z=0.0135


defaultproperties
{
	Mesh=GravOversFXCa
	ScaleGlow=1.800000
	DrawScale=0.009000

	StartingRot=(Roll=-1000)
	RRate1=(Roll=-250)
	RRate2=(Yaw=-15000)
}
