//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXCCord expands MultiMFXCCor;

#exec MESH IMPORT MESH=MultiMFXCCord ANIVFILE=MODELS\MultiMFXCCor_a.3d DATAFILE=MODELS\MultiMFXCCor_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=MultiMFXCCord X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMFXCCord SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXCCord MESH=MultiMFXCCord
#exec MESHMAP SCALE MESHMAP=MultiMFXCCord X=0.025 Y=0.025 Z=0.05


defaultproperties
{
	Mesh=MultiMFXCCord
	StartingRot=(Pitch=3500,Roll=6500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=30000)
}
