//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Heli
//				Feralidragon (07-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeli expands Cybot;

#exec MESH IMPORT MESH=CybHeli ANIVFILE=MODELS\CybHeli_a.3d DATAFILE=MODELS\CybHeli_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybHeli STRENGTH=0.25
#exec MESH ORIGIN MESH=CybHeli X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybHeli SEQ=All STARTFRAME=0 NUMFRAMES=66
#exec MESH SEQUENCE MESH=CybHeli SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybHeli SEQ=Transform STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybHeli SEQ=UnTransform STARTFRAME=20 NUMFRAMES=21 RATE=20.0

//Fire
#exec MESH SEQUENCE MESH=CybHeli SEQ=LeftFire STARTFRAME=41 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybHeli SEQ=RightFire STARTFRAME=49 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybHeli SEQ=BothFire STARTFRAME=57 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybHeli MESH=CybHeli
#exec MESHMAP SCALE MESHMAP=CybHeli X=0.05 Y=0.05 Z=0.1


#exec TEXTURE IMPORT NAME=SentinelSk FILE=SKINS\SentinelSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybHeli NUM=2 TEXTURE=SentinelSk

#exec TEXTURE IMPORT NAME=HeliSk FILE=SKINS\HeliSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybHeli NUM=3 TEXTURE=HeliSk

#exec MESHMAP SETTEXTURE MESHMAP=CybHeli NUM=4 TEXTURE=TranslucInvis
#exec MESHMAP SETTEXTURE MESHMAP=CybHeli NUM=5 TEXTURE=TranslucInvis


var() texture LaserTeam[4];
var() vector BlastFireOffsetLeft, BlastFireOffsetRight;
var bool bLeftFire;
var() float MaxEnemyAprox, MinEnemyAprox, SafeEnemyAprox;
var() float MaxDodgeDist;
var Pawn dodgeInstigator;
var() float DodgeSpeed, DodgeAccelRate;
var float OldAirSpeed, OldAccelRate;
var bool isRetreating;
var() float RetreatOdds;


function setMaster(Pawn P)
{
	Super.setMaster(P);
	if (MasterPawn != None)
	{
		Health = Class'CybotLauncher'.default.CybotHeliHealth;
		SetupHealth();
	}
}

simulated function SetTeamExtras(byte n)
{
	if (n > 3)	n = 0;
	MultiSkins[5] = LaserTeam[n];
}

function PlayFire(float rate, optional byte type)
{
	if (type == 1)
		PlayAnim('LeftFire', rate);
	else if (type == 2)
		PlayAnim('RightFire', rate);
	else
		PlayAnim('BothFire', rate);
}

function bool isInFireRange()
{
	if (Enemy == None)
		return False;
	return (FastTrace(Enemy.Location, Location));
}

function DodgeProjectile( Projectile proj)
{	
	dodgeInstigator = proj.Instigator;
	GotoState('Dodging');
}

function bool bGettingAway( Pawn P, float factor)
{
	if (P == None)
		return False;
	
	return ((Normal(Velocity) dot Normal(P.Location - Location)) < factor);
}


// --------- FOLLOW MASTER --------------
state FollowMaster
{
Begin:
	isRetreating = False;
	if (ShouldBeAttacking())
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
	isRetreating = False;
	if (ShouldBeAttacking()) GotoState('Attacking');
	
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
	function SpawnFireFX(optional byte side)
	{
	local CybAndroidFireOv o;

		if (side != 1)
		{
			o = Spawn(Class'CybHeliFireOvR', Self);
			if (o != None) o.SetTeam(MyTeam, Self);
		}
		if (side != 2)
		{
			o = Spawn(Class'CybHeliFireOvL', Self);
			if (o != None) o.SetTeam(MyTeam, Self);
		}
	}

Begin:
	if (!KeepEnemy() || !isInFireRange())
	{
		Enemy = None;
		if (!ShouldBeAttacking())
			GotoState('Waiting');
	}
	
	if (isRetreating && Enemy != None && VSize(Enemy.Location - Location) >= (SafeEnemyAprox + Enemy.CollisionRadius))
		isRetreating = False;
	
	if (Enemy != None)
	{
		if ((VSize(Enemy.Location - Location) > (MinEnemyAprox + Enemy.CollisionRadius) && !isRetreating) || FRand() < RetreatOdds)
		{
			TurnToward(Enemy);
			isRetreating = False;
			if (Enemy != None && (VSize(Velocity) < 20.0 || MoveTarget == None || bGettingAway( Enemy, 0.1)))
				MoveToward(Enemy);
		}
		else
		{
			isRetreating = True;
			TurnTo(-Enemy.Location);
			Sleep(0.0125);
			Goto('Begin');
		}
	}
	
	if (Enemy != None)
	{
		Enemy.Enemy = Self;
		if (VSize(Enemy.Location - Location) <= (MaxEnemyAprox + Enemy.CollisionRadius))
		{
			PlayFire(10);
			Sleep(0.0125);
			if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
			{
				FireProjectile( Location + (BlastFireOffsetLeft >> Rotation), Normal(Enemy.Location - Location));
				FireProjectile( Location + (BlastFireOffsetRight >> Rotation), Normal(Enemy.Location - Location));
				SpawnFireFX();
				Sleep(FireDelay - 0.0125);
			}
		}
		else
		{
			bLeftFire = !bLeftFire;
			if (bLeftFire)
			{
				PlayFire(10, 1);
				Sleep(0.0125);
				if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
				{
					FireProjectile( Location + (BlastFireOffsetLeft >> Rotation), Normal(Enemy.Location - Location));
					SpawnFireFX(1);
					Sleep(FireDelay/2 - 0.0125);
				}
			}
			else
			{
				PlayFire(10, 2);
				Sleep(0.0125);
				if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
				{
					FireProjectile( Location + (BlastFireOffsetRight >> Rotation), Normal(Enemy.Location - Location));
					SpawnFireFX(2);
					Sleep(FireDelay/2 - 0.0125);
				}
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

// --------- DODGING --------------
state Dodging
{
	function vector DodgeMove()
	{
	local rotator R;
	
		if (projDir >= 2)	projDir = Rand(2);
		
		R.Yaw = Rand(16384) - 8192;
		R.Pitch = Rand(16384) - 8192;
		R.Roll = Rand(16384) - 8192;
		
		if (projDir == 0)
			return ((MaxDodgeDist*vect(0,-1,0)) >> (Rotation + R));
		return ((MaxDodgeDist*vect(0,1,0)) >> (Rotation + R));
	}
	
	function DodgePrepareSpeed(bool toDodge)
	{
		if (toDodge)
		{
			bCanStrafe = True;
			AirSpeed = DodgeSpeed;
			AccelRate = DodgeAccelRate;
		}
		else
		{
			bCanStrafe = False;
			AirSpeed = OldAirSpeed;
			AccelRate = OldAccelRate;
		}
	}
	
Begin:
	DodgePrepareSpeed(True);
	if (dodgeInstigator != None)
		StrafeFacing( Location + DodgeMove(), dodgeInstigator);
	else
		StrafeTo( Location + DodgeMove(), Location + vector(Rotation)*250);
	Sleep(0.0125);
	DodgePrepareSpeed(False);
	dodgeInstigator = None;
	if (CheckDodgeProjectile())
		Goto('Begin');
	
	bIsDodging = False;
	GotoState('Waiting');
}

// --------- BOOT UP --------------
state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

Begin:
	OldAirSpeed = AirSpeed;
	OldAccelRate = AccelRate;
	StopFlying();
	PlayAttach( 0, 2, 10.0, True);
	PlayAttach( 1, 2, 7.5, True);
	SetAttachSnd(0);
	initFollowingPattern();
	GotoState('Waiting');
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHeli
	CollisionHeight=12.000000
	CollisionRadius=15.000000
	MultiSkins(1)=CybotSk
	
	CoreSkinN=4
	MultiSkins(4)=CybotCoreRed
	bFollower=True
	bDodgeProj=True
	
	FireProjClass(0)=Class'CybProj'
	FireProjClass(1)=Class'CybProjB'
	FireProjClass(2)=Class'CybProjG'
	FireProjClass(3)=Class'CybProjY'
	FireDelay=0.150000
	BlastFireOffsetLeft=(X=24.000000,Y=-12.000000,Z=-4.000000)
	BlastFireOffsetRight=(X=24.000000,Y=12.000000,Z=-4.000000)
	MaxEnemyAprox=500.000000
	MinEnemyAprox=150.000000
	SafeEnemyAprox=350.000000
	RetreatOdds=0.650000
	
	CybFXCoronas(0)=(CoronaClass=Class'CybHeliCoronas',hasExtras=True,isTeamCenter=False,isTeamRing=True,bFlicker=False)
	CybFXCoronas(1)=(CoronaClass=Class'CybHeliCoronas',hasExtras=False,isTeamCenter=True,isTeamRing=False,bFlicker=True)
	
	Health=500
	WaterDmg=250
	ElectricDmgFactor=1.250000
	
	WreckParts(0)=(WreckClass=Class'CybHeliWreckBody',WreckOffset=(Z=-1.000000),UseYawOnly=False)
	WreckParts(1)=(WreckClass=Class'CybHeliWreckBlades',WreckOffset=(Z=10.000000),UseYawOnly=False)
	WreckParts(2)=(WreckClass=Class'CybHeliWreckGuide',WreckOffset=(X=-12.000000),UseYawOnly=False)
	WreckParts(3)=(WreckClass=Class'CybHeliWreckWeaponL',WreckOffset=(Y=-8.000000),UseYawOnly=False)
	WreckParts(4)=(WreckClass=Class'CybHeliWreckWeaponR',WreckOffset=(Y=8.000000),UseYawOnly=False)
	
	TransformAnim=Transform
	TransformRate=5.000000
	NextStateFromTransform=BootUp
	TransformSnd=CybTransformSnd
	
	LaserTeam(0)=SentinelLaserFXRed
	LaserTeam(1)=SentinelLaserFXBlue
	LaserTeam(2)=SentinelLaserFXGreen
	LaserTeam(3)=SentinelLaserFXYellow
	
	Physics=PHYS_Flying
	
	CybAttachClasses(0)=Class'CybHeliBlades'
	CybAttachClasses(1)=Class'CybHeliGuideBlades'
	
	RotationRate=(Pitch=8192,Yaw=50000,Roll=4096)
	MaxDistFromMaster=300.000000
	MinDistFromMaster=150.000000
	MaxDodgeDist=200.000000
	DodgeSpeed=2150.000000
	DodgeAccelRate=1950.000000
	DodgeOdds=0.650000
	DodgeDetectionRadius=350.000000
	
	AirSpeed=950.000000
	AirControl=1.000000
	AccelRate=650.000000
	PeripheralVision=-0.885000
	SightRadius=7750.000000
	JumpZ=10.000000
	
	MyModel="Heli Follower"
}
