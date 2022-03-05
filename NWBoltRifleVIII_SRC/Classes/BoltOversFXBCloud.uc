//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltOversFXBCloud expands TheOversColoredFX;

#exec MESH IMPORT MESH=BoltOversFXBCloud ANIVFILE=MODELS\BoltOversFXBCloud_a.3d DATAFILE=MODELS\BoltOversFXBCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltOversFXBCloud STRENGTH=0.1
#exec MESH ORIGIN MESH=BoltOversFXBCloud X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltOversFXBCloud SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=BoltOversFXBCloud SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=BoltOversFXBCloud SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=BoltOversFXBCloud MESH=BoltOversFXBCloud
#exec MESHMAP SCALE MESHMAP=BoltOversFXBCloud X=0.02 Y=0.02 Z=0.04


simulated function PostBeginPlay()
{
	LoopAnim('LoopRevolve', 0.1);
	Super.PostBeginPlay();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltOversFXBCloud
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
	DrawScale=0.055000
	ScaleGlow=0.400000
	LifeSpan=6.000000

	fadeInTime=0.200000
	fadeOutTime=0.100000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0,Roll=2500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=15000)
}
