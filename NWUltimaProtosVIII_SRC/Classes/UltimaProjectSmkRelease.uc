//////////////////////////////////////////////////////////////
//				Feralidragon (15-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjectSmkRelease expands NaliWEffects;

#exec MESH IMPORT MESH=UltimaProjectSmkRelease ANIVFILE=MODELS\UltimaProjectSmkRelease_a.3d DATAFILE=MODELS\UltimaProjectSmkRelease_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProjectSmkRelease STRENGTH=0.25
#exec MESH ORIGIN MESH=UltimaProjectSmkRelease X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=UltimaProjectSmkRelease SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=UltimaProjectSmkRelease SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProjectSmkRelease SEQ=Revolve STARTFRAME=0 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=UltimaProjectSmkRelease MESH=UltimaProjectSmkRelease
#exec MESHMAP SCALE MESHMAP=UltimaProjectSmkRelease X=0.5 Y=0.5 Z=1.0

#exec MESHMAP SETTEXTURE MESHMAP=UltimaProjectSmkRelease NUM=1 TEXTURE=HaloRing

var() float MinDrawScale, FadeInTime, FadeOutTime, ForwardSpeed;
var float RevolveRate;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	PlayAnim('Revolve', 1/Default.LifeSpan, 0.0);
	RevolveRate = FRand()*60000 + 40000;
	if (FRand() > 0.5)
		RevolveRate *= -1;
	RotationRate.Roll = RevolveRate;
	Velocity = vector(Rotation)*ForwardSpeed;
}

simulated function Tick( float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		if (RevolveRate > 0)
			RotationRate.Roll = LifeSpan * RevolveRate / Default.LifeSpan + 40000;
		else
			RotationRate.Roll = LifeSpan * RevolveRate / Default.LifeSpan - 40000;
			
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
    Mesh=UltimaProjectSmkRelease
	
	Style=STY_Translucent
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	bUnlit=True
	
	MultiSkins(1)=HaloRing
	MinDrawScale=1.000000
	FadeInTime=0.200000
	FadeOutTime=5.000000
	LifeSpan=3.000000
	DrawScale=3.000000
	ScaleGlow=3.000000
	ForwardSpeed=50.000000
	
	Physics=PHYS_Projectile
	bFixedRotationDir=True
}
