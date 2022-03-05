//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Drone
//				Feralidragon (13-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDrone expands Cybot;

#exec MESH IMPORT MESH=CybDrone ANIVFILE=MODELS\CybDrone_a.3d DATAFILE=MODELS\CybDrone_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDrone STRENGTH=0.25
#exec MESH ORIGIN MESH=CybDrone X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDrone SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=CybDrone SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybDrone SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybDrone SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDrone MESH=CybDrone
#exec MESHMAP SCALE MESHMAP=CybDrone X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=DroneSk FILE=SKINS\DroneSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybDrone NUM=2 TEXTURE=DroneSk

#exec MESHMAP SETTEXTURE MESHMAP=CybDrone NUM=3 TEXTURE=TranslucInvis

#exec AUDIO IMPORT NAME="CybDroneHomingFireSnd" FILE=SOUNDS\CybDroneHomingFireSnd.wav GROUP="Attack"



var() vector MainWeaponOffset;
var() float MinEnemyAprox, SafeEnemyAprox;
var bool isStrafing;
var() float RetreatOdds;

var() class<Projectile> FireHomingProjClass[4];
var() float FireHomingDelay, FireHomingOdds;
var() sound FireHomingSnd;
var() byte FireHomingMaxAttacks;
var() vector PeriphericalWeaponOffset;
var Pawn tempP[7];
var byte tempI, tempJ;
var byte cachedHProjs;
var float cachedHCounter;

var() float DodgeSpeed;


function setMaster(Pawn P)
{
	Super.setMaster(P);
	if (MasterPawn != None)
	{
		Health = Class'CybotLauncher'.default.CybotDroneHealth;
		SetupHealth();
	}
}

function bool isInFireRange()
{
	if (Enemy == None)
		return False;
	return (FastTrace(Enemy.Location, Location));
}

function bool bGettingAway( Pawn P, float factor)
{
	if (P == None)
		return False;
	
	return ((Normal(Velocity) dot Normal(P.Location - Location)) < factor);
}

function FireHomingProjectile( vector Loc, vector Dir, actor A)
{
local Projectile proj;

	proj = Spawn(FireHomingProjClass[MyTeam], Self,, Loc, rotator(Dir));
	if (proj != None && MasterPawn != None)
		proj.Instigator = MasterPawn;
	if (CybHomingProj(proj) != None)
		CybHomingProj(proj).LTarget = A;
	
	if (FireHomingSnd != None)
		PlaySound(FireHomingSnd,,8.0,,800.0);
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Transform')
		TweenAnim('UnTransform', 0.1);
}

function FireHoming()
{
local Pawn P;
local byte i, j;
local vector locOffset;

	for (i = 0; i < ArrayCount(tempP); i++)
		tempP[i] = None;
	
	i = 0;
	ForEach VisibleCollidingActors(Class'Pawn', P, 4800)
	{
		if (P != Self && LineOfSightTo(P) && !isFriend(P))
		{
			tempP[i] = P;
			i++;
			if (i >= ArrayCount(tempP))
				break;
		}
	}
	
	if (tempP[0] != None)
	{
		for (i = 0; i < ArrayCount(tempP); i++)
		{
			if (tempP[j] == None)	j = 0;
			locOffset = ((PeriphericalWeaponOffset >> (rot(0,8192,0)*(i+1))) >> Rotation);
			FireHomingProjectile(Location + locOffset, Normal(locOffset), tempP[j]);
			j++;
		}
	}
	
	SpawnHomingFireFX();
	cachedHProjs++;
}

function SpawnHomingFireFX()
{
local CybAndroidFireOv o;

	o = Spawn(Class'CybDroneFireOvHoming', Self);
	if (o != None) o.SetTeam(MyTeam, Self);
	
	if (FireHomingSnd != None)
		PlaySound(FireHomingSnd,,14.0,,1800.0);
}

function DecreaseHomingCache( float Delta)
{
	cachedHCounter += Delta;
	if (cachedHCounter >= 2.0)
	{
		cachedHCounter = 0.0;
		if (cachedHProjs > 0)
			cachedHProjs--;
	}
}

function DodgeProjectile(Projectile proj)
{	
	AddVelocity(DodgeSpeed*DodgeMoveDir());
	bIsDodging = False;
}

function vector DodgeMoveDir()
{
local rotator R;

	if (projDir >= 2)	projDir = Rand(2);
	
	R.Yaw = Rand(16384)*2 - 16384;
	R.Pitch = Rand(16384)*2 - 16384;
	R.Roll = Rand(16384)*2 - 16384;
	
	if (projDir == 0)
		return (vect(0,-1,0) >> (Rotation + R));
	return (vect(0,1,0) >> (Rotation + R));
}
	

// --------- FOLLOW MASTER --------------
state FollowMaster
{
Begin:
	if (ShouldBeAttacking(True))
		GotoState('Attacking');
	
	if (FollowActor != None && !isDangerousZone(FollowActor.Region.Zone))
	{
		if (howFarFromMaster() == 2)
		{
			if (checkReachMaster())
			{
				Destination = FollowActor.Location;
				MoveToward(FollowActor);
			}
			else if (checkMasterLastSeenPos() && howFarFromPoint(MasterLastSeenLoc) > 0)
			{
				Destination = MasterLastSeenLoc;
				if (RefPnt != None)
				{
					RefPnt.SetLocation(MasterLastSeenLoc);
					MoveToward(RefPnt);
				}
				else
					MoveTo(MasterLastSeenLoc);
			}
			else if (checkTeleporterLink())
				MoveTo(Destination);
			
			if (howFarFromMaster() == 0 || VSize(FollowActor.Location - (Location + Velocity/10)) < (FollowActor.CollisionRadius + MinDistFromMaster))
			{
				Destination = Location + Normal(Location - FollowActor.Location)*(MinDistFromMaster + MaxDistFromMaster)/2;
				MoveTo(Destination);
			}
			
			Sleep(0.1);
			Goto('Begin');
		}
		else if (howFarFromMaster() == 0)
		{
			Destination = Location + Normal(Location - FollowActor.Location)*(MinDistFromMaster + MaxDistFromMaster)/2;
			MoveTo(Destination);
			Sleep(0.1);
			Goto('Begin');
		}
		else
			Goto('Wait');
	}
	
	GotoState('Waiting');

Wait:
	StopFlying();
	GotoState('Waiting');
}


// --------- WAITING --------------
state Waiting
{
	function bool bFollowMaster()
	{
		return (ShouldFollow() && FollowActor != None && howFarFromMaster() != 1 && (checkReachMaster(True) || 
		(checkMasterLastSeenPos(True) && howFarFromPoint(MasterLastSeenLoc) > 0) || checkTeleporterLink()) 
		&& !isDangerousZone(FollowActor.Region.Zone));
	}
	
	function vector getWanderLook()
	{
	local rotator R;
	
		R.Yaw = Rotation.Yaw + (Rand(16384)*2 -  16384);
		return vector(R);
	}

Begin:
	if (ShouldBeAttacking(True)) GotoState('Attacking');
	
	if (!bFollowMaster())
	{
		TurnTo(Location + getWanderLook());
		StopFlying();
		Sleep(FRand()*2 + 1.0);
		Goto('Begin');
	}
	else
		GotoState('FollowMaster');
}

// --------- ATTACKING --------------
state Attacking
{
	function SpawnFireFX()
	{
	local CybAndroidFireOv o;

		o = Spawn(Class'CybDroneFireOvMain', Self);
		if (o != None) o.SetTeam(MyTeam, Self);
	}

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
			if (Enemy != None && (VSize(Velocity) < 20.0 || MoveTarget == None || bGettingAway( Enemy, 0.15)))
			{
				MoveToward(Enemy);
				isStrafing = True;
			}
		}
		else
		{
			if (FRand() <= FireHomingOdds*5)
			{
				tempJ = Min(FireHomingMaxAttacks - cachedHProjs, Rand(FireHomingMaxAttacks));
				for (tempI = 0; tempI < tempJ; tempI++)
					FireHoming();
			}
		
			bCanStrafe = True;
			StrafeFacing(Location + Normal(Location - Enemy.Location)*(SafeEnemyAprox + Enemy.CollisionRadius)*1.25 + VRand()*SafeEnemyAprox*0.2, Enemy);
			bCanStrafe = False;
			isStrafing = True;
		}
	}
	
	if (Enemy != None)
	{
		Enemy.Enemy = Self;
		
		if (FRand() <= FireHomingOdds && cachedHProjs < FireHomingMaxAttacks)
		{
			StopFlying();
			tempJ = Min(FireHomingMaxAttacks - cachedHProjs, Rand(FireHomingMaxAttacks));
			for (tempI = 0; tempI < tempJ; tempI++)
			{
				Sleep(FireHomingDelay);
				FireHoming();
			}
		}
		else
		{
			DecreaseHomingCache(FireDelay);
			if (!isStrafing)	Sleep(FireDelay);
			if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
			{
				FireProjectile( Location + (MainWeaponOffset >> Rotation), Normal(Enemy.Location - Location));
				SpawnFireFX();
			}
		}
	}
	else
	{
		StopFlying();
		GotoState('Waiting');
	}

	Goto('Begin');
}

// --------- BOOT UP --------------
state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

Begin:
	StopFlying();
	initFollowingPattern();
	GotoState('Waiting');
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDrone
	
	CollisionHeight=11.000000
	CollisionRadius=12.000000
	MultiSkins(1)=CybotSk
	
	CoreSkinN=3
	MultiSkins(3)=CybotCoreRed
	bFollower=True
	bDodgeProj=True
	
	FireProjClass(0)=Class'CybProj'
	FireProjClass(1)=Class'CybProjB'
	FireProjClass(2)=Class'CybProjG'
	FireProjClass(3)=Class'CybProjY'
	FireDelay=0.09000
	MainWeaponOffset=(X=12.000000)
	MinEnemyAprox=150.000000
	SafeEnemyAprox=350.000000
	RetreatOdds=0.650000
	
	CybFXCoronas(0)=(CoronaClass=Class'CybDroneCoronas',hasExtras=True,isTeamCenter=False,isTeamRing=True,bFlicker=False)
	CybFXCoronas(1)=(CoronaClass=Class'CybDroneCoronasAmb',hasExtras=False,isTeamCenter=True,isTeamRing=False,bFlicker=True)
	
	Health=850
	WaterDmg=0
	ElectricDmgFactor=1.150000
	
	WreckParts(0)=(WreckClass=Class'CybDroneWreckWeaps',WreckOffset=(Z=1.000000),UseYawOnly=False)
	WreckParts(1)=(WreckClass=Class'CybDroneWreckUpperShell',WreckOffset=(Z=8.000000),UseYawOnly=False)
	WreckParts(2)=(WreckClass=Class'CybDroneWreckLowerShell',WreckOffset=(Z=-8.000000),UseYawOnly=False)
	WreckParts(3)=(WreckClass=Class'CybDroneWreckHead',WreckOffset=(X=4.000000),UseYawOnly=False)
	
	TransformAnim=Transform
	TransformRate=5.000000
	NextStateFromTransform=BootUp
	TransformSnd=CybTransformSnd
	
	Physics=PHYS_Flying
	
	RotationRate=(Pitch=15000,Yaw=50000,Roll=8192)
	MaxDistFromMaster=250.000000
	MinDistFromMaster=100.000000
	DodgeSpeed=1850.000000
	DodgeDetectionRadius=315.000000
	
	AirSpeed=1350.000000
	AirControl=1.000000
	AccelRate=1000.000000
	PeripheralVision=-0.995000
	SightRadius=9750.000000
	JumpZ=10.000000
	
	SoundVolume=150
	SoundRadius=30
	SoundPitch=48
	
	FireHomingProjClass(0)=Class'CybHomingProj'
	FireHomingProjClass(1)=Class'CybHomingProjB'
	FireHomingProjClass(2)=Class'CybHomingProjG'
	FireHomingProjClass(3)=Class'CybHomingProjY'
	PeriphericalWeaponOffset=(X=14.000000)
	FireHomingDelay=0.500000
	FireHomingOdds=0.100000
	FireHomingSnd=CybDroneHomingFireSnd
	FireHomingMaxAttacks=3
	
	MyModel="Drone Follower"
}
