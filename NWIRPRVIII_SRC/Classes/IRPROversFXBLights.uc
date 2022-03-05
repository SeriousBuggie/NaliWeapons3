//////////////////////////////////////////////////////////////
//				Feralidragon (16-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPROversFXBLights expands TheOversColoredFX;

#exec MESH IMPORT MESH=IRPROversFXBLights ANIVFILE=MODELS\IRPROversFXBLights_a.3d DATAFILE=MODELS\IRPROversFXBLights_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=IRPROversFXBLights X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IRPROversFXBLights SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPROversFXBLights SEQ=Shrink STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPROversFXBLights SEQ=Grow STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPROversFXBLights SEQ=Grown STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPROversFXBLights SEQ=Shrunk STARTFRAME=1 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IRPROversFXBLights MESH=IRPROversFXBLights
#exec MESHMAP SCALE MESHMAP=IRPROversFXBLights X=1.75 Y=1.75 Z=3.5

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPROversFXBLights
	bUnlit=True
	Style=STY_Translucent
	bParticles=True
	bRandomFrame=True
	bAnimByOwner=True
	Texture=IRPRCLaserLight
	
	MultiSkins(1)=IRPRCLaserLight
	MultiSkins(2)=IRPRCLaserLight
	
	renderOnTop=True
	DrawScale=0.010000
	ScaleGlow=1.500000
	LifeSpan=10.000000
	
	fadeInTime=0.600000
	FlickerFactorMax=1.300000
	FlickerFactorMin=0.500000
}
