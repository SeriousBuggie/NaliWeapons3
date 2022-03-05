//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXBCloudC expands MultiMFXBCloud;

#exec MESH IMPORT MESH=MultiMFXBCloudC ANIVFILE=MODELS\MultiMFXBCloud_a.3d DATAFILE=MODELS\MultiMFXBCloud_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MultiMFXBCloudC STRENGTH=0.0 YAW=128
#exec MESH ORIGIN MESH=MultiMFXBCloudC X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMFXBCloudC SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXBCloudC MESH=MultiMFXBCloudC
#exec MESHMAP SCALE MESHMAP=MultiMFXBCloudC X=0.02 Y=0.02 Z=0.04


defaultproperties
{
	Mesh=MultiMFXBCloudC
	StartingRot=(Pitch=-4000,Roll=-6500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-12000)
}
