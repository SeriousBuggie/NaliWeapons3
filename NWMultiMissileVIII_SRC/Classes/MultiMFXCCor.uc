//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXCCor expands TheOversColoredFX;

#exec MESH IMPORT MESH=MultiMFXCCor ANIVFILE=MODELS\MultiMFXCCor_a.3d DATAFILE=MODELS\MultiMFXCCor_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=MultiMFXCCor X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMFXCCor SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXCCor MESH=MultiMFXCCor
#exec MESHMAP SCALE MESHMAP=MultiMFXCCor X=0.03 Y=0.03 Z=0.06


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMFXCCor
	bUnlit=True
	Texture=MissileLensFlare
	Style=STY_Translucent
	bParticles=True
	bRandomFrame=True
	
	MultiSkins(0)=None
	MultiSkins(1)=MissileLensFlare
	MultiSkins(2)=None
	MultiSkins(3)=None
	MultiSkins(4)=None
	MultiSkins(5)=None
	MultiSkins(6)=None
	MultiSkins(7)=None
	
	renderOnTop=True
	DrawScale=0.025000
	ScaleGlow=1.500000
	LifeSpan=5.000000

	fadeInTime=0.600000
	fadeOutTime=1.000000
	
	FlickerFactorMax=1.350000
	FlickerFactorMin=0.650000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=1000,Roll=500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=65000)
}
