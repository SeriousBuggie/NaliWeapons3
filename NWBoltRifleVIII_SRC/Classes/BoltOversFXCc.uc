//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltOversFXCc expands BoltOversFXC;

#exec MESH IMPORT MESH=BoltOversFXCc ANIVFILE=MODELS\BoltStormRotParticles_a.3d DATAFILE=MODELS\BoltStormRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltOversFXCc STRENGTH=0.0
#exec MESH ORIGIN MESH=BoltOversFXCc X=0 Y=0 Z=0 ROLL=128

#exec MESH SEQUENCE MESH=BoltOversFXCc SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=BoltOversFXCc SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltOversFXCc SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=BoltOversFXCc SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=BoltOversFXCc MESH=BoltOversFXCc
#exec MESHMAP SCALE MESHMAP=BoltOversFXCc X=0.006 Y=0.006 Z=0.012

defaultproperties
{
	Mesh=BoltOversFXCc
	
	StartingRot=(Pitch=0,Roll=600)
	RRate1=(Pitch=0)
	RRate2=(Yaw=6000)
}
