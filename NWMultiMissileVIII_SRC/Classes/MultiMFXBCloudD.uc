//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXBCloudD expands MultiMFXBCloud;

#exec MESH IMPORT MESH=MultiMFXBCloudD ANIVFILE=MODELS\MultiMFXBCloud_a.3d DATAFILE=MODELS\MultiMFXBCloud_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MultiMFXBCloudD STRENGTH=0.0 YAW=128
#exec MESH ORIGIN MESH=MultiMFXBCloudD X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMFXBCloudD SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXBCloudD MESH=MultiMFXBCloudD
#exec MESHMAP SCALE MESHMAP=MultiMFXBCloudD X=0.01 Y=0.01 Z=0.02


defaultproperties
{
	Mesh=MultiMFXBCloudD
	StartingRot=(Pitch=-2500,Roll=5500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-10000)
}
