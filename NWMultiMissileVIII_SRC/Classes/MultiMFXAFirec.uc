//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXAFirec expands MultiMFXAFire;

#exec MESH IMPORT MESH=MultiMFXAFirec ANIVFILE=MODELS\MultiMFXAFire_a.3d DATAFILE=MODELS\MultiMFXAFire_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MultiMFXAFirec STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMFXAFirec X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=MultiMFXAFirec SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXAFirec MESH=MultiMFXAFirec
#exec MESHMAP SCALE MESHMAP=MultiMFXAFirec X=0.02 Y=0.02 Z=0.04


defaultproperties
{
	Mesh=MultiMFXAFirec
	StartingRot=(Pitch=-2500,Roll=5500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-75000)
}
