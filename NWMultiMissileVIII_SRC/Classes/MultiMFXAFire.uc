//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXAFire expands TheOversColoredFX;

#exec MESH IMPORT MESH=MultiMFXAFire ANIVFILE=MODELS\MultiMFXAFire_a.3d DATAFILE=MODELS\MultiMFXAFire_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMFXAFire STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMFXAFire X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMFXAFire SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXAFire MESH=MultiMFXAFire
#exec MESHMAP SCALE MESHMAP=MultiMFXAFire X=0.03 Y=0.03 Z=0.06


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMFXAFire
	bUnlit=True
	Texture=ExplB06
	Style=STY_Translucent
	bParticles=True
	bRandomFrame=True
	
	MultiSkins(0)=ExplB08
	MultiSkins(1)=ExplB07
	MultiSkins(2)=ExplB06
	MultiSkins(3)=ExplB05
	MultiSkins(4)=ExplB04
	MultiSkins(5)=ExplB03
	MultiSkins(6)=ExplB02
	MultiSkins(7)=ExplB01
	
	renderOnTop=True
	DrawScale=0.008000
	ScaleGlow=1.500000
	LifeSpan=6.000000

	fadeInTime=0.600000
	fadeOutTime=0.100000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=1000,Roll=500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=65000)
}
