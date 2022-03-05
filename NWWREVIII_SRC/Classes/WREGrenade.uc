//////////////////////////////////////////////////////////////
//	Nali Weapons III War Ready Enforcer (W.R.E.) Grenade
//				Feralidragon (12-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREGrenade expands NaliProjectile;

#exec MESH IMPORT MESH=WREGrenade ANIVFILE=MODELS\WREGrenade_a.3d DATAFILE=MODELS\WREGrenade_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WREGrenade STRENGTH=0.5
#exec MESH ORIGIN MESH=WREGrenade X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WREGrenade SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREGrenade SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WREGrenade MESH=WREGrenade
#exec MESHMAP SCALE MESHMAP=WREGrenade X=0.08 Y=0.08 Z=0.16

#exec TEXTURE IMPORT NAME=Sk_WREGrenade FILE=SKINS\Sk_WREGrenade.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WREGrenade NUM=1 TEXTURE=Sk_WREGrenade

#exec TEXTURE IMPORT NAME=WREMetal FILE=SKINS\WREMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="WREMetalHit" FILE=SOUNDS\WREMetalHit.wav GROUP="Hits"

var() float LifeTime;

simulated function PostBeginPlay()
{
local vector X,Y,Z;

	Super.PostBeginPlay();
	
	if (Instigator != None)
	{
		GetAxes(Instigator.ViewRotation,X,Y,Z);
		Velocity = X * (Instigator.Velocity Dot X)*0.4 + Vector(Rotation) * (Speed + FRand() * 100);
		Velocity.Z += 150;
		
		if (Region.Zone.bWaterZone)
			Velocity = WaterSpeedScale * Velocity;
	}
	
	SetTimeOut1(LifeTime, False);
	RandSpin(50000);	
}

simulated function TimedOut1()
{
	ExplodeX(Location, vect(0,0,1));
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	LifeTime -= Delta;
	LightBrightness = (Default.LifeTime - LifeTime) * Default.LightBrightness / Default.LifeTime;
}

simulated function HitWall(vector HitNormal, actor Wall)
{
	HitInstigatorTimeOut = 0.01;
	Velocity = 0.65*(-2.0*(Velocity dot HitNormal)*HitNormal + Velocity);   // Reflect off Wall w/damping
	RandSpin(100000);
	speed = VSize(Velocity);
	if (Level.NetMode != NM_DedicatedServer)
		PlaySound(ImpactSound, SLOT_Misc, 8.0);
	if (Velocity.Z > 300)
		Velocity.Z = 0.45 * (400 + Velocity.Z);	
	else if (speed < 20)
	{
		bBounce = False;
		SetPhysics(PHYS_None);
	}
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
local WREGrenadeExplosion s;
local bool bFog;

	if ( Level.NetMode != NM_DedicatedServer && ExplosionDecal != None)
	{
		bFog = Region.Zone.bFogZone;
		if (bFog)
			Region.Zone.bFogZone = False;
		Spawn(ExplosionDecal,,,,rot(16384,0,0));
		Region.Zone.bFogZone = bFog;
	}
	
	SpawnExplosionFX( HitLocation);
	Super.ExplodeX(HitLocation, HitNormal, A);
	
	if (!Region.Zone.bWaterZone)
		Spawn(class'WREFlamesCarcasses',,, HitLocation);
}

simulated function SpawnExplosionFX(vector HitLocation)
{
local rotator R;
local vector HitLoc, HitNorm;
local actor A;
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		A = Trace( HitLoc, HitNorm, HitLocation + vect(0,0,-128), HitLocation, False);
		if (A != Level)
			HitNorm = vect(0,0,1);
		R = rotator(HitNorm);
		R.Roll = Rand(32768) * 2;
	
		Spawn(class'WREIonWave',,, HitLocation + HitNorm, R);
		Spawn(class'WREGrenadeExplosion',,, HitLocation);
		Spawn(class'WREGrenadeExplCor',,, HitLocation);
	}
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=WREGrenade
	MultiSkins(2)=IonChargeOffFX
	
	CanHitInstigator=True
	HitInstigatorTimeOut=0.350000
	ExplosionNoise=1.000000
	
	LightBrightness=100
	LightHue=191
	LightSaturation=13
	LightRadius=6
	LightEffect=LE_NonIncidence
	LightType=LT_Steady
	
	bBounce=True
	bFixedRotationDir=True
	Physics=PHYS_Falling
	
	Damage=80.000000
	ExplosionDecal=Class'WREIonDecal'
	ImpactSound=WREMetalHit
	MaxSpeed=850.000000
	MomentumTransfer=100000
	MyDamageType=Ionized
	speed=600.000000
	DmgRadius=200.000000
	
	TrailClass1=Class'WREGrenadeOver'
	TrailClass2=Class'WREGrenadeLight'
	LifeTime=2.500000
	LifeSpan=14000.000000
	ExplosionNoise=1.250000
	
	bWaterHitFX=True
	WaterSplashType=1
	Mass=50.000000
}
