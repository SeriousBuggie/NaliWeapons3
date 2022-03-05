//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXCCorb expands MultiMFXCCor;

#exec MESH IMPORT MESH=MultiMFXCCorb ANIVFILE=MODELS\MultiMFXCCor_a.3d DATAFILE=MODELS\MultiMFXCCor_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=MultiMFXCCorb X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=MultiMFXCCorb SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXCCorb MESH=MultiMFXCCorb
#exec MESHMAP SCALE MESHMAP=MultiMFXCCorb X=0.02 Y=0.02 Z=0.04


defaultproperties
{
	Mesh=MultiMFXCCorb
	StartingRot=(Pitch=-4000,Roll=-6500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-45000)
}
