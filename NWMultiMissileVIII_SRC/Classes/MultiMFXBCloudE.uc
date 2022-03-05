//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXBCloudE expands MultiMFXBCloud;

#exec MESH IMPORT MESH=MultiMFXBCloudE ANIVFILE=MODELS\MultiMFXBCloud_a.3d DATAFILE=MODELS\MultiMFXBCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMFXBCloudE STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMFXBCloudE X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMFXBCloudE SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXBCloudE MESH=MultiMFXBCloudE
#exec MESHMAP SCALE MESHMAP=MultiMFXBCloudE X=0.025 Y=0.025 Z=0.05


defaultproperties
{
	Mesh=MultiMFXBCloudE
	StartingRot=(Pitch=3500,Roll=6500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=5000)
}
