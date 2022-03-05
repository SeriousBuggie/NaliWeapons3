//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearCoronaA expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=NuclearCoronaA FILE=Coronas\NuclearCoronaA.bmp GROUP=Coronas FLAGS=2

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Velocity.Z = Class'NuclearMushHead'.default.RisingSpeed;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		if (Owner != None)
			PrePivot = ((Mass*vect(-1,0,0)) >> Owner.Rotation);
		Super.Tick(Delta);
	}
}

simulated function HitWall( vector HitNormal, actor Wall)
{
	Velocity *= 0;
	SetPhysics(PHYS_None);
}

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.250000
	FadeOutTime=2.000000
	CoronaSprite=NuclearCoronaA
	MaxCoronaSize=800.000000
	MinCoronaSize=700.000000
	CGlow=2.000000
	StartScaleTime=0.250000
	StartScaleCoef=1.000000
	EndScaleTime=4.500000
	EndScaleCoef=1.000000
	
	Physics=PHYS_Projectile
	Mass=0.000000
	LifeSpan=5.000000
	bNetTemporary=False
}
