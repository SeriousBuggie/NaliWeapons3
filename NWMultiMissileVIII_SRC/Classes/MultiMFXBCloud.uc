//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXBCloud expands TheOversColoredFX;

#exec MESH IMPORT MESH=MultiMFXBCloud ANIVFILE=MODELS\MultiMFXBCloud_a.3d DATAFILE=MODELS\MultiMFXBCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMFXBCloud STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMFXBCloud X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMFXBCloud SEQ=All STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMFXBCloud MESH=MultiMFXBCloud
#exec MESHMAP SCALE MESHMAP=MultiMFXBCloud X=0.03 Y=0.03 Z=0.06


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMFXBCloud
	bUnlit=True
	Texture=NukeWSmk01
	Style=STY_Translucent
	bParticles=True
	bRandomFrame=True
	
	MultiSkins(0)=NukeWSmk01
	MultiSkins(1)=NukeWSmk02
	MultiSkins(2)=NukeWSmk03
	MultiSkins(3)=NukeWSmk04
	MultiSkins(4)=NukeWSmk05
	MultiSkins(5)=NukeWSmk06
	MultiSkins(6)=NukeWSmk07
	MultiSkins(7)=NukeWSmk08
	
	renderOnTop=False
	DrawScale=0.015000
	ScaleGlow=0.600000
	LifeSpan=6.000000

	fadeInTime=0.600000
	fadeOutTime=0.800000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=1000,Roll=500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=15000)
}
