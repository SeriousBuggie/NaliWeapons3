//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXAFireb expands MultiMFXAFire;

#exec MESH IMPORT MESH=MultiMFXAFireb ANIVFILE=MODELS\MultiMFXAFire_a.3d DATAFILE=MODELS\MultiMFXAFire_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MultiMFXAFireb STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMFXAFireb X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=MultiMFXAFireb SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXAFireb MESH=MultiMFXAFireb
#exec MESHMAP SCALE MESHMAP=MultiMFXAFireb X=0.02 Y=0.02 Z=0.04


defaultproperties
{
	Mesh=MultiMFXAFireb
	StartingRot=(Pitch=-4000,Roll=-6500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-45000)
}
