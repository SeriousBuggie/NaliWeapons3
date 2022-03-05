//////////////////////////////////////////////////////////////
//				Feralidragon (14-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatWreckedPiece expands Projectile
abstract;

#exec TEXTURE IMPORT NAME=IonSatWrecked FILE=Skins\IonSatWrecked.bmp GROUP=Skins LODSET=2
#exec AUDIO IMPORT NAME="IonSatWreckMetalHit" FILE=SOUNDS\IonSatWreckMetalHit.wav GROUP="Hit"

var bool bHitWater;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if ( Role == ROLE_Authority )
		RandSpin(25000);
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
	ImpactSound=IonSatWreckMetalHit
	MaxSpeed=700.000000
	speed=400.000000
	Multiskins(0)=IonSatWrecked
	Multiskins(1)=IonSatWrecked
	Multiskins(2)=IonSatWrecked
	Multiskins(3)=IonSatWrecked
	Multiskins(4)=IonSatWrecked
	Multiskins(5)=IonSatWrecked
	Multiskins(6)=IonSatWrecked
	Multiskins(7)=IonSatWrecked
	Texture=IonizerMetal
	LifeSpan=30.000000
}
