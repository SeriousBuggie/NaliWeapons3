//////////////////////////////////////////////////////////////
//				Feralidragon (25-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravOversFXC expands TheOversColoredFX;

#exec MESH IMPORT MESH=GravOversFXC ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravOversFXC STRENGTH=0.0
#exec MESH ORIGIN MESH=GravOversFXC X=0 Y=0 Z=0 ROLL=128

#exec MESH SEQUENCE MESH=GravOversFXC SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravOversFXC SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravOversFXC SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravOversFXC SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravOversFXC MESH=GravOversFXC
#exec MESHMAP SCALE MESHMAP=GravOversFXC X=0.0045 Y=0.0045 Z=0.009

simulated function PostBeginPlay()
{
local byte i;

	Super.PostBeginPlay();
	for (i = 0; i < ArrayCount(MultiSkins); i++)
	{
		if (FRand() <= 0.7)
			MultiSkins[i] = default.MultiSkins[Rand(ArrayCount(MultiSkins))];
		else
			MultiSkins[i] = None;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GravOversFXC
	bUnlit=True
	Texture=GravVortexRorCor01
	Style=STY_Translucent
	bParticles=True
	bRandomFrame=True
	
	MultiSkins(0)=GravVortexRorCor01
	MultiSkins(1)=GravVortexRorCor02
	MultiSkins(2)=GravVortexRorCor03
	MultiSkins(3)=GravVortexRorCor04
	MultiSkins(4)=GravVortexRorCor01
	MultiSkins(5)=GravVortexRorCor02
	MultiSkins(6)=GravVortexRorCor03
	MultiSkins(7)=GravVortexRorCor04
	
	renderOnTop=False
	DrawScale=0.012000
	ScaleGlow=2.000000
	LifeSpan=6.000000

	fadeInTime=0.200000
	fadeOutTime=0.100000
	FlickerFactorMax=1.250000
	FlickerFactorMin=0.750000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	ScaleVarianceMax=1.100000
	ScaleVarianceMin=0.900000
	
	enableRot=True
	StartingRot=(Pitch=1500,Roll=-600)
	RRate1=(Roll=-350)
	RRate2=(Yaw=-10000)
}
