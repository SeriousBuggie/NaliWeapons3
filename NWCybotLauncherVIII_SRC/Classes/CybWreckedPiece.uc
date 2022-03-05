//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybWreckedPiece expands Projectile
abstract;

#exec TEXTURE IMPORT NAME=CybWrecked FILE=Skins\CybWrecked.bmp GROUP=Skins LODSET=2
#exec AUDIO IMPORT NAME="CybWreckMetalHit" FILE=SOUNDS\CybWreckMetalHit.wav GROUP="Hit"

var bool bHitWater;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if ( Role == ROLE_Authority )
		RandSpin(50000);
}

function SetVelocity( vector dir)
{
	Velocity = dir*Speed;
	if (Region.Zone.bWaterZone)
	{
		Velocity = 0.6*Velocity;
		bHitWater = True;
	}
}

simulated function ZoneChange( Zoneinfo NewZone )
{
local waterring w;
	
	if (!NewZone.bWaterZone || bHitWater) return;

	bHitWater = True;
	w = Spawn(class'WaterRing',,,,rot(16384,0,0));
	w.DrawScale = 0.2;
	w.RemoteRole = ROLE_None;
	Velocity = 0.6*Velocity;
}

simulated function Landed( vector HitNormal )
{
	HitWall( HitNormal, None );
}

simulated function ProcessTouch( actor Other, vector HitLocation )
{
	HitWall(-Normal(Velocity), Other );
}

simulated function HitWall( vector HitNormal, actor Wall )
{
	Velocity = 0.75*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
	RandSpin(100000);
	speed = VSize(Velocity);
	if ( Level.NetMode != NM_DedicatedServer )
		PlaySound(ImpactSound, SLOT_Misc, 4.0,,500.0);
	if ( Velocity.Z > 400 )
		Velocity.Z = 0.5 * (400 + Velocity.Z);	
	else if ( speed < 20 ) 
	{
		bBounce = False;
		SetPhysics(PHYS_None);
	}
}



defaultproperties
{
	DrawType=DT_Mesh
	bBounce=True
	bFixedRotationDir=True
	Physics=PHYS_Falling
	RemoteRole=ROLE_SimulatedProxy
	ExplosionDecal=None
	ImpactSound=CybWreckMetalHit
	MaxSpeed=700.000000
	speed=400.000000
	Multiskins(0)=CybWrecked
	Multiskins(1)=CybWrecked
	Multiskins(2)=CybWrecked
	Multiskins(3)=CybWrecked
	Multiskins(4)=CybWrecked
	Multiskins(5)=CybWrecked
	Multiskins(6)=CybWrecked
	Multiskins(7)=CybWrecked
	Texture=CybotMetal
	LifeSpan=10.000000
}
