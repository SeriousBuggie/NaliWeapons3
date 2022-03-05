//////////////////////////////////////////////////////////////
//				Feralidragon (15-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearHaloRing expands NaliFullMeshFX;

#exec MESH IMPORT MESH=NuclearHaloRing ANIVFILE=MODELS\NuclearHaloRing_a.3d DATAFILE=MODELS\NuclearHaloRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearHaloRing STRENGTH=0.25
#exec MESH ORIGIN MESH=NuclearHaloRing X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NuclearHaloRing SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NuclearHaloRing SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearHaloRing SEQ=Revolve STARTFRAME=0 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=NuclearHaloRing MESH=NuclearHaloRing
#exec MESHMAP SCALE MESHMAP=NuclearHaloRing X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=HaloRing FILE=CORONAS\HaloRing.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearHaloRing NUM=1 TEXTURE=HaloRing

var() float MinDrawScale, FadeInTime, FadeOutTime;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	PlayAnim('Revolve', 1/Default.LifeSpan, 0.0);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		RotationRate.Yaw = Rand(16384) + 8192;
		if (FRand() > 0.5)
			RotationRate.Yaw *= -1;
	}
}

simulated function Tick( float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		if (Default.LifeSpan - LifeSpan <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (FadeOutTime > 0 && LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		else if (FadeOutTime == 0)
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearHaloRing
	
	Style=STY_Translucent
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	bAlwaysRelevant=True
	
	MultiSkins(1)=HaloRing
	MinDrawScale=6.250000
	FadeInTime=0.500000
	FadeOutTime=3.000000
	LifeSpan=8.000000
	DrawScale=27.000000
	ScaleGlow=3.000000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	
	RadiusView=35000.000000
	bAffectByDrawScale=False
}
