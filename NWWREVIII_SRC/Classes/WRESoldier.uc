//////////////////////////////////////////////////////////////
//				Feralidragon (24-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldier expands NaliWPawn;

#exec MESH IMPORT MESH=WRESoldier ANIVFILE=MODELS\WRESoldier_a.3d DATAFILE=MODELS\WRESoldier_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WRESoldier STRENGTH=0
#exec MESH ORIGIN MESH=WRESoldier X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=WRESoldier SEQ=All STARTFRAME=0 NUMFRAMES=72
#exec MESH SEQUENCE MESH=WRESoldier SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRESoldier SEQ=TweenStill STARTFRAME=71 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=LookRight STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=LookRightBack STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=LookLeft STARTFRAME=20 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=LookLeftBack STARTFRAME=30 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=Fire01 STARTFRAME=40 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=Fire02 STARTFRAME=50 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=Fire03 STARTFRAME=60 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=FireFull STARTFRAME=40 NUMFRAMES=31 RATE=30.0
#exec MESH SEQUENCE MESH=WRESoldier SEQ=FireLoop STARTFRAME=40 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=WRESoldier MESH=WRESoldier
#exec MESHMAP SCALE MESHMAP=WRESoldier X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=WREnforcer_Sk01 FILE=SKINS\WREnforcer_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WRESoldier NUM=1 TEXTURE=WREnforcer_Sk01

#exec TEXTURE IMPORT NAME=WREnforcer_Sk02 FILE=SKINS\WREnforcer_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WRESoldier NUM=2 TEXTURE=WREnforcer_Sk02

#exec TEXTURE IMPORT NAME=WREnforcer_Sk03 FILE=SKINS\WREnforcer_Sk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WRESoldier NUM=3 TEXTURE=WREnforcer_Sk03

#exec AUDIO IMPORT NAME="WRESndArmorDmg1" FILE=SOUNDS\WRESndArmorDmg1.wav GROUP="Damage"
#exec AUDIO IMPORT NAME="WRESndArmorDmg2" FILE=SOUNDS\WRESndArmorDmg2.wav GROUP="Damage"
#exec AUDIO IMPORT NAME="WRESndArmorDmg3" FILE=SOUNDS\WRESndArmorDmg3.wav GROUP="Damage"
#exec AUDIO IMPORT NAME="WRESoldAmb" FILE=SOUNDS\WRESoldAmb.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="WRESoldFire" FILE=SOUNDS\WRESoldFire.wav GROUP="WRESoldier"



var(Sparks) byte MaxSparks, SparkTriggerDmg;
var(Sparks) sound DamageSnd[3];

struct WreckStruct
{
	var() class<WRESoldWreckedPiece> WreckClass;
	var() vector WreckOffset;
	var() bool UseYawOnly;
};
var(Wreck) WreckStruct WreckParts[4];

var() float MinEnemyAprox, SafeEnemyAprox;
var bool isStrafing;
var() float RetreatOdds;
var() float FireRate, FireMaxRange, FireAccuracy;
var() sound FireSound;

var(Anim) name LookAnim[2];
var(Anim) name LookAnimBck[2];
var(Anim) name FireAnim[3];
var byte lookType;

var WRESoldTrailCor TrailCor;
var WRESoldOvA Ov1, Ov2;


function PreSetMovement()
{
    if (JumpZ > 0)
        bCanJump = True;
    bCanWalk = (Physics != PHYS_Flying);
    bCanSwim = False;
    bCanFly = (Physics == PHYS_Flying);
    MinHitWall = -0.6;
}

event EncroachedBy(actor Other);

function bool ChangeEnemy(pawn newEnemy)
{
	if (newEnemy == None)
		return False;
	if ((Enemy == None || (VSize(newEnemy.Location - Location) < VSize(Enemy.Location - Location))) && FastTrace(newEnemy.Location, Location))
	{
		Enemy = newEnemy;
		MoveTarget = newEnemy;
		Destination = newEnemy.Location;
		return True;
	}
	return False;
}

function bool ShouldBeAttacking(optional bool bIgnorePeriphericFactor)
{
	return ((Enemy != None && !isFriend(Enemy)) || CheckEnemy(bIgnorePeriphericFactor));
}

function HearNoise(float Loudness, Actor NoiseMaker)
{
	if (Loudness >= HearingThreshold && NoiseMaker != None)
	{
		if (Pawn(NoiseMaker) != None && !isFriend(Pawn(NoiseMaker)))
			ChangeEnemy(Pawn(NoiseMaker));
		else if (NoiseMaker.Instigator != None && !isFriend(NoiseMaker.Instigator))
			ChangeEnemy(NoiseMaker.Instigator);
	}
}

singular function TakeDamage(int Damage, Pawn instigatedBy, Vector hitlocation, vector Momentum, name damageType)
{
local byte i, totalSparks;
local int actualDamage;

	if (Health <= 0)	return;

	if (instigatedBy != None)
	{
		if (!isFriend(instigatedBy))
			ChangeEnemy(instigatedBy);
		else if (instigatedBy.Enemy == Self || (Bot(instigatedBy) != None && Bot(instigatedBy).OldEnemy == Self))
		{
			instigatedBy.Enemy = Enemy;
			if (Bot(instigatedBy) != None && Bot(instigatedBy).OldEnemy == Self)
				Bot(instigatedBy).OldEnemy = Enemy;
		}
	}

    if (Physics == PHYS_None)
        SetMovementPhysics();
    if (Physics == PHYS_Walking)
        Momentum.Z = FMax(Momentum.Z, 0.4 * VSize(Momentum));
    if (InstigatedBy == Self)
        Momentum *= 0.6;
    Momentum = Momentum/Mass;

    actualDamage = ReduceDamage(Damage, DamageType, self, instigatedBy);
	totalSparks = Min(Max(Byte(actualDamage/SparkTriggerDmg), 1), MaxSparks);
	for (i = 0; i < totalSparks; i++)
		Spawn(Class'WRESoliderSpark',,, hitLocation, RotRand());
	
	PlaySound(DamageSnd[Rand(ArrayCount(DamageSnd))],,8.0,,1200.0);
	AddVelocity(Momentum); 
	if (DamageType == 'SpecialDamage' || !isFriend(instigatedBy))
		Health -= actualDamage;
	
	if (Health <= 0)
	{
		MakeNoise(1.65);
		ExplodeSelf(instigatedBy);
		Destroy();
	}
}

singular function Died(pawn Killer, name damageType, vector HitLocation)
{
	if (bDeleteMe)
		return;
	
	MakeNoise(1.65);
	ExplodeSelf(Killer);
	Destroy();
}

function ExplodeSelf( optional Pawn instigatedBy)
{
local byte i;
local WRESoldWreckedPiece cwp;
local Actor A;
local float dist, damageScale;
local vector dir;
local rotator R;
local WRESoldBaseCloudMaster master;

	R.Yaw = Rand(16384);
	master = Spawn(Class'WRESoldBaseCloudMaster',,,, R);
	Spawn(Class'WRESoldBaseCloud', master,,, R);
	Spawn(Class'WRESoldBaseCloudB', master,,, R);
	Spawn(Class'WRESoldIonWave');
	Spawn(Class'WRESoldExplosion');
	Spawn(Class'WRESoldExplCor');
	
	for (i = 0; i < ArrayCount(WreckParts); i++)
	{
		if (WreckParts[i].WreckClass != None)
		{
			R = Rotation;
			if (WreckParts[i].UseYawOnly)
			{
				R.Pitch = 0;
				R.Roll = 0;
			}
			
			cwp = Spawn(WreckParts[i].WreckClass,,, Location + ((WreckParts[i].WreckOffset*DrawScale) >> R), R);
			cwp.DrawScale = DrawScale;
			cwp.SetVelocity(Normal(((WreckParts[i].WreckOffset*DrawScale) >> R) + VRand()*VSize(WreckParts[i].WreckOffset*DrawScale)/3));
		}
	}
}

function int ReduceDamage(int Damage, name DamageType, pawn injured, pawn instigatedBy)
{
	if (injured.Region.Zone.bNeutralZone)
        return 0;
    if (instigatedBy == None)
        return Damage;
	return (Damage * instigatedBy.DamageScaling);
}

function bool CheckEnemy(optional bool bIgnorePeriphericFactor)
{
local Pawn P;
local bool gotEnemy;

	ForEach VisibleCollidingActors(Class'Pawn', P, SightRadius)
	{
		if (P != Self && ((bIgnorePeriphericFactor && LineOfSightTo(P)) || (!bIgnorePeriphericFactor && CanSee(P))) && !isFriend(P))
			gotEnemy = (gotEnemy || ChangeEnemy(P));
	}
	
	return gotEnemy;
}

function bool KeepEnemy()
{
	if (Enemy == None || Enemy.bDeleteMe || Enemy.Health <= 0 || Enemy.bHidden || isFriend(Enemy))
	{
		Enemy = None;
		return False;
	}
	return True;
}

function StopFlying()
{
	Acceleration = vect(0,0,0);
	Velocity = vect(0,0,0);
}

function Bump(actor Other)
{
	Super.Bump(Other);
	
	if (Pawn(Other) != None && (Pawn(Other).Enemy == Self || (Bot(Other) != None && Bot(Other).OldEnemy == Self)) && isFriend(Other))
	{
		Pawn(Other).Enemy = Enemy;
		if (Bot(Other) != None && Bot(Other).OldEnemy == Self)
			Bot(Other).OldEnemy = Enemy;
	}
}

function bool CanFire(vector dir, float dist)
{
local actor A;
local vector HitLoc, HitNorm;

	dir = Normal(dir);
	if (Enemy != None)
		dist = FClamp(VSize(Enemy.Location - Location), 1.0, dist);
	
	A = Trace( HitLoc, HitNorm, Location + dir*dist, Location, True);
	return (A == None || !isFriend(A));
}

function bool bGettingAway(Pawn P, float factor)
{
	if (P == None)
		return False;
	return ((Normal(Velocity) dot Normal(P.Location - Location)) < factor);
}

function bool isInFireRange()
{
	if (Enemy == None)
		return False;
	return (FastTrace(Enemy.Location, Location));
}

//Play anims
function PlayLook(byte n, float rate)
{
	if (n >= ArrayCount(LookAnim))
		return;
	PlayAnim(LookAnim[n], rate);
}

function PlayLookBack(byte n, float rate)
{
	if (n >= ArrayCount(LookAnimBck))
		return;
	PlayAnim(LookAnimBck[n], rate);
}

function PlayFire(byte n, float rate)
{
	if (n >= ArrayCount(FireAnim))
		return;
	PlayAnim(FireAnim[n], rate);
	PlaySound(FireSound,,12.0,, 2200.0);
	Spawn(Class'WRESoldMuzzleR', Self,, Location + (Class'WRESoldMuzzleR'.default.PrePivotRel >> Rotation));
	Spawn(Class'WRESoldMuzzleL', Self,, Location + (Class'WRESoldMuzzleL'.default.PrePivotRel >> Rotation));
	Spawn(Class'WRESoldCorR', Self,, Location + (Class'WRESoldCorR'.default.PrePivot >> Rotation));
	Spawn(Class'WRESoldCorL', Self,, Location + (Class'WRESoldCorL'.default.PrePivot >> Rotation));
	ProcessTraceFire(FireAccuracy, Class'WRESoldCorR'.default.PrePivot);
	ProcessTraceFire(FireAccuracy, Class'WRESoldCorL'.default.PrePivot);
}

function ProcessTraceFire(float Accuracy, optional vector fOffset)
{
local vector HitLoc, HitNorm, STrace, ETrace, X, Y, Z, AimDir;
local Actor A;

	GetAxes(Rotation, X, Y, Z);
	STrace = Location + (fOffset >> Rotation);
	ETrace = STrace + Accuracy*(FRand() - 0.5 )*Y*1000 + Accuracy *(FRand() - 0.5)*Z*1000;
	
	AimDir = vector(Rotation);
	A = Trace(HitLoc, HitNorm, Location + FireMaxRange*AimDir, Location);
	if (A != None)
		AimDir = Normal(HitLoc - STrace);
	ETrace += (FireMaxRange * AimDir);
	
	A = TraceShot(HitLoc, HitNorm, ETrace, STrace);
	MakeNoise(1.0);
	ProcessTraceHit(A, HitLoc, HitNorm, vector(Rotation));
}

simulated function ProcessTraceHit(Actor Other, vector HitLocation, vector HitNormal, vector X)
{
local Pawn Inst;

	if (Other == Level)
	{
		Spawn(class'WRESoldHitEffect',,, HitLocation + HitNormal, rotator(HitNormal));
		if (FRand() < 0.35)
			Spawn(Class'WRESoldWallParts',,, HitLocation + HitNormal, rotator(HitNormal));
	}
	else if (Other != None && !isFriend(Other)) 
	{
		if (Other.bIsPawn || Carcass(Owner) != None)
			Other.PlaySound(Sound 'ChunkHit',, 20.0,,500);
		else if (!Other.bIsPawn && Carcass(Owner) == None)
			Spawn(class'WRESoldSmokePuff',,, HitLocation+HitNormal*9);
			
		if (MasterPawn != None)
			Inst = MasterPawn;
		else
			Inst = Self;

		if (Class'NaliWeapons'.static.isStaticHeadShotDmg(Other, HitLocation))
			Other.TakeDamage(Class'WRE'.default.OversurrectiveAttackHSDmg, Inst, HitLocation, 10000.0 * X + (MirrorVectorByNormal(HitNormal, HitNormal) * 1000), 'Decapitated');
		else
			Other.TakeDamage(Class'WRE'.default.OversurrectiveAttackDmg, Inst, HitLocation, 5000.0 * X + (MirrorVectorByNormal(HitNormal, HitNormal) * 1000), 'Shot');	
	}
}


function StartUp()
{
	InitiateLifeline();
	Health = Max(1, Class'WRE'.default.OversurrectiveHealth);
	
	TrailCor = Spawn(Class'WRESoldTrailCor', Self);
	Ov1 = Spawn(Class'WRESoldOvA', Self);
	Ov2 = Spawn(Class'WRESoldOvB', Self);
}


function InitiateLifeline()
{
local WRESoldLifeline WL;

	if (MasterPawn == None || Class'WRE'.default.OversurrectionLifeTime <= 0.0)
		return;
	WL = Spawn(Class'WRESoldLifeline');
	WL.InitLifeline(Self, Class'WRE'.default.OversurrectionLifeTime);
}


simulated function Destroyed()
{
	if (TrailCor != None)
		TrailCor.Destroy();
	if (Ov1 != None)
		Ov1.Destroy();
	if (Ov2 != None)
		Ov2.Destroy();

	TrailCor = None;
	Ov1 = None;
	Ov2 = None;
	
	Super.Destroyed();
}


//------- BOOT UP --------------
auto state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

Begin:
	StartUp();
	StopFlying();
	Sleep(2.0);
	bCollideWorld = True;
	GotoState('Waiting');
}

// --------- WAITING --------------
state Waiting
{
	function vector getWanderLook()
	{
	local rotator R;
	
		R.Yaw = Rotation.Yaw + (Rand(16384)*2 -  16384);
		return vector(R);
	}

Begin:
	if (ShouldBeAttacking(True)) 
		GotoState('Attacking');
	TurnTo(Location + getWanderLook());
	StopFlying();	
	lookType = Rand(2);
	PlayLook(lookType, 1.35);
	FinishAnim();
	if (ShouldBeAttacking())
	{
		PlayLookBack(lookType, 1.35);
		GotoState('Attacking');
	}
	Sleep(FRand()*3 + 0.1);
	if (ShouldBeAttacking())
		GotoState('Attacking');
	PlayLookBack(lookType, 1.35);
	FinishAnim();
	Goto('Begin');
}

// --------- ATTACKING --------------
state Attacking
{

Begin:
	isStrafing = False;
	if (!KeepEnemy() || !isInFireRange())
	{
		Enemy = None;
		if (!ShouldBeAttacking(True))
			GotoState('Waiting');
	}
	
	if (Enemy != None)
	{
		if (VSize(Enemy.Location - Location) > (MinEnemyAprox + Enemy.CollisionRadius) || FRand() < RetreatOdds)
		{
			TurnToward(Enemy);
			if (Enemy != None && (VSize(Velocity) < 20.0 || MoveTarget == None || bGettingAway(Enemy, 0.15)))
			{
				MoveToward(Enemy);
				isStrafing = True;
			}
		}
		else
		{
			bCanStrafe = True;
			StrafeFacing(Location + Normal(Location - Enemy.Location)*(SafeEnemyAprox + Enemy.CollisionRadius)*1.25 + VRand()*SafeEnemyAprox*0.2, Enemy);
			bCanStrafe = False;
			isStrafing = True;
		}
	}
	
	if (Enemy != None)
	{
		Enemy.Enemy = Self;
		if (Enemy != None && CanFire(Normal(Enemy.Location - Location), 250))
		{
			PlayFire(0, FireRate);
			FinishAnim();
			PlayFire(1, FireRate);
			FinishAnim();
			PlayFire(2, FireRate);
			FinishAnim();
		}
	}
	else
	{
		StopFlying();
		GotoState('Waiting');
	}

	Goto('Begin');
}

// --------- GAME ENDED --------------
state GameEnded
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

    function BeginState()
    {
        SetPhysics(PHYS_None);
    }
}



defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WRESoldier
	Texture=WREMetal
	CollisionHeight=112.000000
	CollisionRadius=162.000000
	bCollideWorld=False
	
	bMachine=True
	Health=100
	Physics=PHYS_Flying
	Intelligence=BRAINS_HUMAN
	RotationRate=(Pitch=8192,Yaw=50000,Roll=4096)
	
	AirSpeed=800.000000
	AirControl=1.000000
	AccelRate=500.000000
	PeripheralVision=-0.500000
	SightRadius=15000.000000
	JumpZ=10.000000
	MeleeRange=350.000000
	
	AmbientSound=WRESoldAmb
	SoundVolume=255
	SoundRadius=115
	SoundPitch=64
	
	MinEnemyAprox=2000.000000
	SafeEnemyAprox=500.000000
	RetreatOdds=0.650000
	FireRate=9.000000
	FireSound=WRESoldFire
	FireMaxRange=60000.000000
	FireAccuracy=0.500000
	
	SparkTriggerDmg=5
	MaxSparks=10
	DamageSnd(0)=WRESndArmorDmg1
	DamageSnd(1)=WRESndArmorDmg2
	DamageSnd(2)=WRESndArmorDmg3
	
	WreckParts(0)=(WreckClass=Class'WRESoldWreckedHead',WreckOffset=(Z=72.000000),UseYawOnly=False)
	WreckParts(1)=(WreckClass=Class'WRESoldWreckedBody',WreckOffset=(Z=-56.000000),UseYawOnly=False)
	WreckParts(2)=(WreckClass=Class'WRESoldWreckedMiniR',WreckOffset=(X=120.000000,Y=168.000000,Z=-128.000000),UseYawOnly=False)
	WreckParts(3)=(WreckClass=Class'WRESoldWreckedMiniL',WreckOffset=(X=120.000000,Y=-168.000000,Z=-128.000000),UseYawOnly=False)
	
	LookAnim(0)=LookRight
	LookAnim(1)=LookLeft
	LookAnimBck(0)=LookRightBack
	LookAnimBck(1)=LookLeftBack
	FireAnim(0)=Fire01
	FireAnim(1)=Fire02
	FireAnim(2)=Fire03
}
