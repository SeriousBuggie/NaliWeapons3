//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXFusionPartsA expands TheOversColoredFX;

#exec MESH IMPORT MESH=TheOversFXFusionPartsA ANIVFILE=MODELS\TheOversFXFusionParts_a.3d DATAFILE=MODELS\TheOversFXFusionParts_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheOversFXFusionPartsA STRENGTH=0
#exec MESH ORIGIN MESH=TheOversFXFusionPartsA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TheOversFXFusionPartsA SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsA SEQ=Collapse STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheOversFXFusionPartsA SEQ=Expand STARTFRAME=6 NUMFRAMES=7 RATE=6.0

#exec MESHMAP NEW MESHMAP=TheOversFXFusionPartsA MESH=TheOversFXFusionPartsA
#exec MESHMAP SCALE MESHMAP=TheOversFXFusionPartsA X=0.075 Y=0.075 Z=0.15


var() float ExpandTime, CollapseTime;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		PlayAnim('Expand', 1/ExpandTime, 0.0);
	Super.PostBeginPlay();
}

simulated function AnimEnd()
{
local float delay;

	delay = LifeSpan - CollapseTime;
	if (delay <= 0)
		Collapse();
	else
		SetTimer(delay, False);
}

simulated function Timer()
{
	Collapse();
}

simulated function Collapse()
{
	TweenAnim('Expand', CollapseTime);
	RRate2 = rot(0,0,0);
}

simulated function Tick(float Delta)
{
	if (!isSlave && Level.NetMode != NM_DedicatedServer && (default.LifeSpan - LifeSpan) > ExpandTime && LifeSpan <= CollapseTime)
		RRate2 = (LifeSpan - CollapseTime) * default.RRate2 / (default.LifeSpan - ExpandTime - CollapseTime);
	Super.Tick(Delta);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheOversFXFusionPartsA
	Texture=OversFXCorR
    TextureG=OversFXCorG
    TextureB=OversFXCorB
	
	renderOnTop=True
	
	bUnlit=True
	bParticles=True
	LifeSpan=1.250000
	DrawScale=0.010000
	ScaleGlow=2.000000
	
	enableRot=True
	StartingRot=(Roll=0)
	RRate1=(Pitch=0,Roll=0)
	RRate2=(Yaw=40000)
	
	enableScaling=True
	FlickerFactorMax=1.150000
	FlickerFactorMin=0.850000
	ScaleVarianceMax=1.100000
	ScaleVarianceMin=0.900000
	fadeInTime=0.100000
	fadeOutTime=0.100000
	scaleInTime=0.100000
	scaleOutTime=0.000000
	
	ExpandTime=0.100000
	CollapseTime=0.400000
}
