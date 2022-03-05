//////////////////////////////////////////////////////////////
//				Feralidragon (24-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldWreckedPiece expands Projectile
abstract;

#exec TEXTURE IMPORT NAME=WREWrecked FILE=Skins\WREWrecked.bmp GROUP=Skins LODSET=2
#exec AUDIO IMPORT NAME="WREWreckMetalHit" FILE=SOUNDS\WREWreckMetalHit.wav GROUP="Hit"

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
	Velocity = 0.25*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
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
	ImpactSound=WREWreckMetalHit
	MaxSpeed=700.000000
	speed=400.000000
	Multiskins(0)=WREWrecked
	Multiskins(1)=WREWrecked
	Multiskins(2)=WREWrecked
	Multiskins(3)=WREWrecked
	Multiskins(4)=WREWrecked
	Multiskins(5)=WREWrecked
	Multiskins(6)=WREWrecked
	Multiskins(7)=WREWrecked
	Texture=WREMetal
	LifeSpan=10.000000
}
