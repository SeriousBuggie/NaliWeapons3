//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Projectile (Egg)
//				Feralidragon (29-11-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybotDeployProj expands NaliProjectile
abstract;

#exec MESH IMPORT MESH=CybDeployProj ANIVFILE=MODELS\CybDeployProj_a.3d DATAFILE=MODELS\CybDeployProj_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybDeployProj STRENGTH=0.1
#exec MESH ORIGIN MESH=CybDeployProj X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybDeployProj SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybDeployProj SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybDeployProj MESH=CybDeployProj
#exec MESHMAP SCALE MESHMAP=CybDeployProj X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=CybotSk FILE=SKINS\CybotSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybDeployProj NUM=1 TEXTURE=CybotSk

#exec AUDIO IMPORT NAME="CybShellMetalHit" FILE=SOUNDS\CybShellMetalHit.wav GROUP="Hits"

var() float LifeTime;
var() float ExtraLifeTime;
var() float ShellRotationRate;
var() class<Cybot> CybotClass;
var() float EndZSpeed;
var() float SpawnZOffset;

var() bool bStationaryProj;
var() float MinZDistToJump;

simulated function PostBeginPlay()
{
local vector X,Y,Z;
local rotator R;

	Super.PostBeginPlay();
	
	if (Instigator != None)
	{
		GetAxes(Instigator.ViewRotation,X,Y,Z);
		Velocity = X * (Instigator.Velocity Dot X)*0.4 + Vector(Rotation) * (Speed + FRand() * 100);
		Velocity.Z += 210;
		
		if (Region.Zone.bWaterZone)
			Velocity = WaterSpeedScale * Velocity;
	}
	
	R.Yaw = Rotation.Yaw;
	SetRotation(R);
	if (!bStationaryProj)
		SetTimeOut1(LifeTime + ExtraLifeTime, False);
	RotationRate.Pitch = ShellRotationRate;
}

simulated function TimedOut1()
{
local vector LandPnt;

	LandPnt = Location + (MinZDistToJump*vect(0,0,-1));
	if (FastTrace(LandPnt, Location))
		ExplodeX(Location, vect(0,0,1));
}

simulated function TimedOut2()
{
	ExplodeX(Location, vect(0,0,1));
}

simulated function HitWall( vector HitNormal, actor Wall )
{
	Velocity = 0.5*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
	speed = VSize(Velocity);
	if (Mover(Wall) != None || CybFFieldSphere(Wall) != None)
		Velocity += (HitNormal * 600) + VRand() * 200;
	if ( Level.NetMode != NM_DedicatedServer && speed > 35)
		PlaySound(ImpactSound, SLOT_Misc, 8.0);
	if ( Velocity.Z > 400 )
		Velocity.Z = 0.25 * (400 + Velocity.Z);	
	else if ( speed < 200 )
	{
		if (Abs(HitNormal.Z) < 0.35)
			Velocity += (HitNormal * 200);
		else
			Landed(HitNormal);
	}
}

simulated function Landed( vector HitNormal)
{
	if (ExtraLifeTime <= 0)
		TimedOut2();
	else
	{
		SetTimeOut2(ExtraLifeTime, False);
		Velocity = Velocity + (EndZSpeed*HitNormal);
	}
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	if (Other == None || Other == Instigator)	return;
	
	if (HitLocation.Z >= (Other.Location.Z + Other.CollisionHeight)*0.95 || HitLocation.Z <= (Other.Location.Z - Other.CollisionHeight)*0.95)
		HitWall(Normal(HitLocation - Location), None);
	else
		HitWall(Normal(HitLocation - Location)*vect(1,1,0), None);
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	SetCollision(False, False, False);
	bCollideWorld = False;
	if (!SpawnCybot(Location))
		ExplodeSelf();
	Destroy();
}

function ExplodeSelf()
{
local Actor A;
local float dist, damageScale;
local vector dir;
local float MaxRadius;
local int MaxMomentum, MaxDamage;

	Spawn(Class'CybDmgExplosionMult',,,, rotator(vect(0,0,1)));
	Spawn(Class'CybShock',,,, rotator(vect(0,0,1)));
	Spawn(Class'CybAfterEffects');
	
	if (CybotClass != None)
	{
		MaxRadius = CybotClass.default.WreckedExplosionRadius;
		MaxMomentum = CybotClass.default.WreckedExplosionMomentum * 5;
		MaxDamage = CybotClass.default.WreckedExplosionDmg * 5;
	}
	else
	{
		MaxRadius = 512.0;
		MaxMomentum = 100000;
		MaxDamage = 1000;
	}
	
	ForEach VisibleCollidingActors(Class'Actor', A, MaxRadius)
	{
		if (A != Self)
		{
			dir = A.Location - Location;
            dist = FMax(1,VSize(dir));
            dir = dir/dist; 
            damageScale = 1 - FMax(0,(dist - A.CollisionRadius)/MaxRadius);
            A.TakeDamage(damageScale * MaxDamage, Instigator, 
                A.Location - 0.5 * (A.CollisionHeight + A.CollisionRadius) * dir,(damageScale * MaxMomentum * dir),'Exploded');
		}
	}
}

function bool SpawnCybot(vector HitLocation)
{
local Cybot c;
local rotator R;

	if (CybotClass != None)
	{
		R.Yaw = Rotation.Yaw;
		c = Spawn(CybotClass,,, Location + vect(0,0,1)*SpawnZOffset, R);
		if (c != None)
		{
			c.setMaster(Instigator);
			if (!c.bStationary && c.Physics != PHYS_Flying)
			{
				c.SetPhysics(PHYS_Falling);
				c.AddVelocity(Velocity);
			}
			return True;
		}
	}
	return False;
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDeployProj
	CollisionRadius=9.000000
	CollisionHeight=9.000000
	
	CanHitInstigator=False
	
	bBounce=True
	bFixedRotationDir=True
	Physics=PHYS_Falling
	
	Damage=0.000000
	ExplosionDecal=None
	ImpactSound=CybShellMetalHit
	MaxSpeed=1000.000000
	MomentumTransfer=0
	MyDamageType=None
	speed=600.000000
	DmgRadius=0.000000
	
	bWaterHitFX=True
	WaterSplashType=2
	Mass=100.000000
	
	ShellRotationRate=-140000.000000
	LifeTime=1.500000
	ExtraLifeTime=0.500000
	MinZDistToJump=100.000000
}
