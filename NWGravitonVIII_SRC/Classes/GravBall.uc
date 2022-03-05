//////////////////////////////////////////////////////////////
//	Nali Weapons III Graviton weapon
//				Feralidragon (30-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravBall expands NaliProjectile;

#exec MESH IMPORT MESH=GravBall ANIVFILE=MODELS\GravBall_a.3d DATAFILE=MODELS\GravBall_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravBall STRENGTH=0.225
#exec MESH ORIGIN MESH=GravBall X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravBall SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravBall SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GravBall MESH=GravBall
#exec MESHMAP SCALE MESHMAP=GravBall X=0.025 Y=0.025 Z=0.05

#exec TEXTURE IMPORT NAME=GravBallSk FILE=SKINS\GravBallSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=GravBall NUM=1 TEXTURE=GravBallSk

#exec AUDIO IMPORT NAME="GravityProj_Loop" FILE=SOUNDS\GravityProj_Loop.wav GROUP="Loop"

var GravRotTracesFX GRotTraceFX01, GRotTraceFX02, GRotTraceFX03;
var GravRotParticlesFX GRotPartFX01, GRotPartFX02, GRotPartFX03;
var GravProjRingTrace GRingTrace01;
var GravProjRingParticle GRingPart01;

var() float RotTrailRate;
var() bool bVortex;

var bool bVxPhysics;

replication
{
	reliable if (Role == ROLE_Authority)
		bVxPhysics;
}

function PreBeginPlay()
{
	bVxPhysics = Class'Graviton'.default.bUseVortexPhysics;
	if (Class'Graviton'.default.VortexRadius > 0)
		DmgRadius = Class'Graviton'.default.VortexRadius;
	if (Class'Graviton'.default.VortexDamage > 0)
		Damage = Class'Graviton'.default.VortexDamage;
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (bVortex)
	{
		TimeOut1 = 0.1;
		bRepeating1 = True;
		TimeOut2 = 0.5;
		bRepeating2 = True;
	}
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		GRotTraceFX01 = Spawn(Class'GravRotTracesFX', Self);
		GRotTraceFX01.InitializePlay( 0, RotTrailRate, True);
		GRotTraceFX02 = Spawn(Class'GravRotTracesFX', Self);
		GRotTraceFX02.InitializePlay( 1, RotTrailRate, True);
		GRotTraceFX03 = Spawn(Class'GravRotTracesFX', Self);
		GRotTraceFX03.InitializePlay( 2, RotTrailRate, True);
		
		GRotPartFX01 = Spawn(Class'GravRotParticlesFX', Self);
		GRotPartFX01.InitializePlay( 0, RotTrailRate, True);
		GRotPartFX02 = Spawn(Class'GravRotParticlesFX', Self);
		GRotPartFX02.InitializePlay( 1, RotTrailRate, True);
		GRotPartFX03 = Spawn(Class'GravRotParticlesFX', Self);
		GRotPartFX03.InitializePlay( 2, RotTrailRate, True);
		
		GRingTrace01 = Spawn(Class'GravProjRingTrace', Self);
		GRingTrace01.InitializePlay( RotTrailRate, True);
		
		GRingPart01 = Spawn(Class'GravProjRingParticle', Self);
		GRingPart01.InitializePlay( RotTrailRate, True);
	}
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{	
	Super.ExplodeX(HitLocation, HitNormal, A);
	SpawnFX(HitLocation, HitNormal, A);
}

simulated function ProcessTouch (Actor Other, vector HitLocation)
{
local bool bDmgInstigator;

	if (bVortex && Role == ROLE_Authority)
	{
		bDmgInstigator = (Other != Instigator || !HealthGiver);
		if (Pawn(Other) != None && (noHurtThisPawn(Pawn(Other)) || !bDmgInstigator))
		{
			if (HealthGiver)
				Class'NWUtils'.static.processFiredHealth(FMax(1.0, MoreDamage), Pawn(Other), Instigator);
			return;
		}
		Other.TakeDamage(Damage * FMax(1.0, MoreDamage), Instigator, HitLocation, vect(0,0,0), MyDamageType);
	}
	else if (!bVortex)
		Super.ProcessTouch(Other, HitLocation);
}

simulated function SpawnFX(vector HitLocation, vector HitNormal, optional actor A)
{
local GravBlackCoreEclipseFX gbfx;

	if (Level.NetMode != NM_DedicatedServer)
		Spawn(Class'GravBlackCoreFX',,, HitLocation + HitNormal, rotator(HitNormal));
	
	if (Role == ROLE_Authority)
	{
		gbfx = Spawn(Class'GravBlackCoreEclipseFX',,, HitLocation + HitNormal, rotator(HitNormal));
		gbfx.Kickback = Kickback;
		gbfx.Splasher = Splasher;
		gbfx.MoreDamage = MoreDamage;
		gbfx.HealthGiver = HealthGiver;
		gbfx.bVPhys = Class'Graviton'.default.bUseVortexPhysics;
		gbfx.bVortex = bVortex;
		gbfx.HitRot = rotator(HitNormal);
	}
}

simulated function Destroyed()
{
	if (GRotTraceFX01 != None)
		GRotTraceFX01.Destroy();
	if (GRotTraceFX02 != None)
		GRotTraceFX02.Destroy();
	if (GRotTraceFX03 != None)
		GRotTraceFX03.Destroy();
	if (GRotPartFX01 != None)
		GRotPartFX01.Destroy();
	if (GRotPartFX02 != None)
		GRotPartFX02.Destroy();
	if (GRotPartFX03 != None)
		GRotPartFX03.Destroy();
	if (GRingTrace01 != None)
		GRingTrace01.Destroy();
	if (GRingPart01 != None)
		GRingPart01.Destroy();
		
	GRotTraceFX01 = None;
	GRotTraceFX02 = None;
	GRotTraceFX03 = None;
	GRotPartFX01 = None;
	GRotPartFX02 = None;
	GRotPartFX03 = None;
	GRingTrace01 = None;
	GRingPart01 = None;
	
	Super.Destroyed();
}

simulated function TimedOut1()
{
local Actor A;
local float QRadius, QForce, QDist, QSpeed;

	QRadius = DmgRadius * FMax(1.0, Splasher);
	ForEach VisibleCollidingActors( Class'Actor', A, QRadius)
	{
		if (!A.bStatic && !A.IsA('Projectile') && A.Physics != PHYS_None && A.Physics != PHYS_Rotating && A != Instigator && (Pawn(A) == None || !noHurtThisPawn(Pawn(A))))
		{
			QDist = VSize(Location - A.Location);
			if (bVxPhysics)
				QForce = (MomentumTransfer + Kickback) / A.Mass;
			else
				QForce = (MomentumTransfer + Kickback) / 100.0;
			QSpeed = (QRadius - QDist) * QForce / QRadius;
					
			if (A.Physics == PHYS_Projectile)
			{
				if (VSize(A.Velocity) < QSpeed)
				{
					if (Pawn(A) != None)
						Pawn(A).AddVelocity(QSpeed * Normal(Location - A.Location));
					else
						A.Velocity += (QSpeed * Normal(Location - A.Location));
				}
			}
			else if (Pawn(A) != None)
				Pawn(A).AddVelocity(QSpeed * Normal(Location - A.Location));
			else
				A.Velocity += (QSpeed * Normal(Location - A.Location));
		}
	}
}

simulated function TimedOut2()
{
local Actor A;
local vector HitLocation, HitNormal;
local vector EndTrace;

	if (Level.NetMode != NM_DedicatedServer)
	{
		EndTrace = Location + vector(RotRand())*DmgRadius*FMax(1.0, Splasher);
		A = Trace(HitLocation, HitNormal, EndTrace, Location, False);
		if (A != None)
			Spawn(Class'GravFragSpot', Self,, HitLocation + HitNormal, rotator(Location - EndTrace));
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=GravBall
	
	bUnlit=True
	DrawScale=1.000000
	
	bBounce=False
	bNetTemporary=True
	AmbientSound=GravityProj_Loop
	SoundRadius=52
	SoundVolume=128
	
	ExplosionDecal=Class'GravDecal'
	MyDamageType=Quantumized
	DmgRadius=340.000000
	speed=435.000000
	MaxSpeed=675.000000
	Damage=2000.000000
	MomentumTransfer=100000
	ProjAccel=50.000000
	
	TrailClass1=Class'GravBallEclipse'
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=100
    LightHue=192
    LightSaturation=32
    LightRadius=10
	
	bWaterHitFX=True
	WaterSplashType=3
	ExplosionNoise=2.000000
	Mass=200.000000
	WaterSpeedScale=0.650000
	
	RotTrailRate=1.350000
	bFixedRotationDir=True
	RotationRate=(Pitch=18000,Yaw=18000)
	
	CollisionRadius=10.000000
	CollisionHeight=10.000000
	bNoHurtTeam=True
	
	bVortex=True
}
