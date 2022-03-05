//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXCCorc expands MultiMFXCCor;

#exec MESH IMPORT MESH=MultiMFXCCorc ANIVFILE=MODELS\MultiMFXCCor_a.3d DATAFILE=MODELS\MultiMFXCCor_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=MultiMFXCCorc X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=MultiMFXCCorc SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXCCorc MESH=MultiMFXCCorc
#exec MESHMAP SCALE MESHMAP=MultiMFXCCorc X=0.01 Y=0.01 Z=0.02


defaultproperties
{
	Mesh=MultiMFXCCorc
	StartingRot=(Pitch=-2500,Roll=5500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-75000)
}
