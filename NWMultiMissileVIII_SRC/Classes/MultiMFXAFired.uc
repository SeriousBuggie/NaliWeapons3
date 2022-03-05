//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXAFired expands MultiMFXAFire;

#exec MESH IMPORT MESH=MultiMFXAFired ANIVFILE=MODELS\MultiMFXAFire_a.3d DATAFILE=MODELS\MultiMFXAFire_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMFXAFired STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMFXAFired X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMFXAFired SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXAFired MESH=MultiMFXAFired
#exec MESHMAP SCALE MESHMAP=MultiMFXAFired X=0.025 Y=0.025 Z=0.05


defaultproperties
{
	Mesh=MultiMFXAFired
	StartingRot=(Pitch=3500,Roll=6500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=30000)
}
