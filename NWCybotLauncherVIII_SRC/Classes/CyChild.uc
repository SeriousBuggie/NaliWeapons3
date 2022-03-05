//////////////////////////////////////////////////////////////
//				Feralidragon (14-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyChild expands Cybot;

#exec MESH IMPORT MESH=CyChild ANIVFILE=MODELS\CyChild_a.3d DATAFILE=MODELS\CyChild_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyChild STRENGTH=0
#exec MESH ORIGIN MESH=CyChild X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyChild SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=CyChild SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyChild SEQ=Transform STARTFRAME=0 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CyChild SEQ=Open STARTFRAME=0 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CyChild SEQ=Close STARTFRAME=3 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CyChild SEQ=UnTransform STARTFRAME=3 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CyChild SEQ=Opened STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyChild SEQ=Closed STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyChild MESH=CyChild
#exec MESHMAP SCALE MESHMAP=CyChild X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=CyChild_Sk FILE=SKINS\CyChild_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CyChild NUM=1 TEXTURE=CyChild_Sk

#exec TEXTURE IMPORT NAME=CyGlassCryst FILE=SKINS\CyGlassCryst.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="CyChildZapSnd" FILE=SOUNDS\CyChildZapSnd.wav GROUP="CyChild"


var() float AttackCooldownZap, AttackCooldownProj, AttackCooldownHoming;
var() int AttackZapDmg, AttackProjDmg, AttackHomingDmg;
var() sound AttackZapSnd, AttackProjSnd, AttackHomingSnd;

var CyChild nextCChild, prevCChild;
var CyMaster CCM;
var vector initGoToLoc;
var bool startedMission;
var CybChildEyeCor cCor;
var Actor curAtkTarget;



simulated function AnimEnd()
{
	if (AnimSequence == 'Open')
		TweenAnim('Close', 0.1);
}

function InitiateLifeline();
function SetupHealth();

function InitiateSelfKill()
{
	CCM = None;
	GotoState('SelfKill');
}

function bool ChangeEnemy(pawn newEnemy)
{
	if (CCM != None && isAvailable())
		CCM.ChildSpottedEnemy(Self, newEnemy);
	return False;
}

simulated function setNewFollowPos(vector Loc)
{
	if (BasePosPnt != None)
		BasePosPnt.SetLocation(Loc);
}

function initFollowingPattern()
{
	Super.initFollowingPattern();
	if (startedMission || BasePosPnt == None)
		return;
	BasePosPnt.SetLocation(initGoToLoc);
	startedMission = True;
}

simulated function Destroyed()
{
	if (prevCChild != None)
		prevCChild.nextCChild = nextCChild;
	else if (CCM != None)
		CCM.cChildList = nextCChild;
		
	if (nextCChild != None)
		nextCChild.prevCChild = prevCChild;
		
	if (cCor != None)
		cCor.Destroy();
	cCor = None;

	Super.Destroyed();
}

function bool isAvailable()
{
	return (IsInState('FollowMaster') || IsInState('Waiting'));
}

function bool isValidAttackActor(Actor A)
{
	if (A == None || A.bDeleteMe || !FastTrace(A.Location, Location))
		return False;
	if (Pawn(A) != None && (A.bHidden || Pawn(A).Health <= 0))
		return False;
	return True;
}

function InitiateActorAttack(Actor A, byte atkType)
{
	if (!isAvailable() || !isValidAttackActor(A))
		return;
	
	curAtkTarget = A;
	if (atkType == 0)
		GotoState('AttackZap');
	else if (atkType == 1)
		GotoState('AttackProj');
	else if (atkType == 2)
		GotoState('AttackHoming');
}

function AttackActorZap(Actor A)
{
	if (!isValidAttackActor(A))
		return;
	
	SpawnFireCor();
	MakeShortLaserTraceTo(A.Location);
	SpawnLocalizedFireCor(A.Location, Projectile(A), AttackZapSnd);
	PlayFireSound(AttackZapSnd);
	if (Projectile(A) != None)
		handleProjTExplode(Projectile(A));
	else
		A.TakeDamage(AttackZapDmg, Instigator, A.Location, vect(0,0,0), 'zapped');
}

function AttackActorProj()
{
local Projectile proj;

	SpawnFireCor();
	PlayFireSound(AttackProjSnd);
	proj = Spawn(Class'CyChildProj', Self);
	if (proj != None)
	{
		proj.Damage = AttackProjDmg;
		if (MasterPawn != None)
			proj.Instigator = MasterPawn;
	}
}

function AttackActorHoming(actor A)
{
local Projectile proj;

	proj = Spawn(Class'CyChildHomingProj', Self);
	if (proj != None)
	{
		proj.Damage = AttackHomingDmg;
		if (MasterPawn != None)
			proj.Instigator = MasterPawn;
	}
	if (CybHomingProj(proj) != None)
		CybHomingProj(proj).LTarget = A;
	PlayFireSound(AttackHomingSnd);
}

function PlayFireSound(sound snd)
{
	if (snd != None)
		PlaySound(snd,,12.0,,2200.0);
}

function PlayHitSound(sound snd, optional Actor ref)
{
	if (snd != None)
	{
		if (ref != None)
			ref.PlaySound(snd,,12.0,,600.0);
		else
			PlaySound(snd,,12.0,,600.0);
	}
}

function handleProjTExplode(Projectile pj)
{
	if (pj != None)
		pj.Explode(pj.Location, Normal(pj.Location - Location));
}

function SpawnFireCor()
{
	Spawn(Class'CybChildFireCor', Self);
	Spawn(Class'CybChildFireCorLine', Self);
}

function SpawnLocalizedFireCor(vector loc, optional Actor nearbyClientActor, optional sound hSound)
{
local CybChildFireCorEnd ccFCE;

	ccFCE = Spawn(Class'CybChildFireCorEnd', Self,, loc);
	PlayHitSound(hSound, ccFCE);
	if (nearbyClientActor != None && Level.NetMode != NM_StandAlone && nearbyClientActor.bNetTemporary)
	{
		ccFCE.clientActorHandle = nearbyClientActor.Class;
		ccFCE.clientActorInstigator = nearbyClientActor.Instigator;
		ccFCE.clientActorDir = Normal(nearbyClientActor.Velocity) * 1000.f;
	}
}

function MakeShortLaserTraceTo(vector loc)
{
local int NumPoints, n;
local float DistSpawn, DistLeftover, TraceSize;
local float tLength, sizeLeftover;
local rotator R;
local vector Dist;
local CyChildTrace cct;
local float RotPitch, RotYaw, RotRoll;


	TraceSize = VSize(Location - loc);
	tLength = class'CyChildTrace'.default.TraceLength;
	NumPoints = Int(TraceSize / tLength);
	DistLeftover = TraceSize - (NumPoints * tLength);
	R = rotator(loc - Location);
	for (n = 0; n <= NumPoints; n++)
	{
		DistSpawn = n * tLength + tLength/2;
		if (n == NumPoints)
			DistSpawn -= ((tLength - DistLeftover)/2);
		sizeLeftover = DistLeftover / tLength;
		Dist = ((vect(1,0,0)*DistSpawn) >> R);
		if (n < NumPoints)
			sizeLeftover = 1.0;
		else if (sizeLeftover <= 0.0)
			continue;

		RotPitch = R.Pitch;
		RotYaw = R.Yaw;
		RotRoll = R.Roll;
		
		cct = Spawn(Class'CyChildTrace',,, Location + Dist);
		cct.SetupTrace(RotPitch, RotYaw, RotRoll, sizeLeftover);
	}
}

// --------- SELF KILL --------------
state SelfKill
{
	function InitiateShortLifeline()
	{
	local CybLifeline CL;

		CL = Spawn(Class'CybLifeline');
		CL.InitLifeline(Self, 6.0 + FRand()*6.0);
	}

	simulated function HitWall(vector HitNormal, actor Wall)
	{
		ExplodeSelf();
	}
	
	simulated function Landed(vector HitNormal)
	{
		HitWall(HitNormal, None);
	}

Begin:
	if (cCor != None)
		cCor.Destroy();
	cCor = None;
	PlayAnim('Close', 1.0, 0.0);
	FinishAnim();
	InitiateShortLifeline();
	SetPhysics(PHYS_Falling);
}

// --------- ATTACK ZAP --------------
state AttackZap
{
Begin:

	if (!isValidAttackActor(curAtkTarget))
	{
		curAtkTarget = None;
		GotoState('Waiting');
	}
	
	StopFlying();
	TurnTo(curAtkTarget.Location);
	TurnToward(curAtkTarget);
	AttackActorZap(curAtkTarget);
	StopFlying();
	Sleep(AttackCooldownZap);
	Goto('Begin');
}

// --------- ATTACK PROJ --------------
state AttackProj
{
Begin:

	if (!isValidAttackActor(curAtkTarget))
	{
		curAtkTarget = None;
		GotoState('Waiting');
	}
	
	StopFlying();
	TurnTo(curAtkTarget.Location);
	TurnToward(curAtkTarget);
	AttackActorProj();
	StopFlying();
	Sleep(AttackCooldownProj);
	Goto('Begin');
}

// --------- ATTACK HOMING --------------
state AttackHoming
{
Begin:

	if (!isValidAttackActor(curAtkTarget))
	{
		curAtkTarget = None;
		GotoState('Waiting');
	}
	
	StopFlying();
	TurnTo(curAtkTarget.Location);
	TurnToward(curAtkTarget);
	AttackActorHoming(curAtkTarget);
	StopFlying();
	Sleep(AttackCooldownHoming);
	Goto('Begin');
}

// --------- FOLLOW MASTER --------------
state FollowMaster
{
Begin:
	
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
	
	if (!bFollowMaster())
	{
		TurnTo(Location + getWanderLook());
		StopFlying();
		Sleep(FRand()*2 + 0.25);
		Goto('Begin');
	}
	else
		GotoState('FollowMaster');
}

// --------- BOOT UP --------------
state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

Begin:
	if (Class'CybotLauncher'.default.OversurrectionChildrenHealth > 0)
		Health = Class'CybotLauncher'.default.OversurrectionChildrenHealth;
	if (Class'CybotLauncher'.default.OversurrectionZapAttackCooldown > 0.0)
		AttackCooldownZap = Class'CybotLauncher'.default.OversurrectionZapAttackCooldown;
	if (Class'CybotLauncher'.default.OversurrectionZapAttackDmg > 0)
		AttackZapDmg = Class'CybotLauncher'.default.OversurrectionZapAttackDmg;
	if (Class'CybotLauncher'.default.OversurrectionProjAttackCooldown > 0.0)
		AttackCooldownProj = Class'CybotLauncher'.default.OversurrectionProjAttackCooldown;
	if (Class'CybotLauncher'.default.OversurrectionProjAttackDmg > 0)
		AttackProjDmg = Class'CybotLauncher'.default.OversurrectionProjAttackDmg;
	if (Class'CybotLauncher'.default.OversurrectionHomingAttackCooldown > 0.0)
		AttackCooldownHoming = Class'CybotLauncher'.default.OversurrectionHomingAttackCooldown;
	if (Class'CybotLauncher'.default.OversurrectionHomingAttackDmg > 0)
		AttackHomingDmg = Class'CybotLauncher'.default.OversurrectionHomingAttackDmg;
	
	StopFlying();
	initFollowingPattern();
	cCor = Spawn(Class'CybChildEyeCor', Self);
	GotoState('Waiting');
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyChild
	Texture=CyGlassCryst
	
	CollisionHeight=8.000000
	CollisionRadius=8.000000
	
	CoreSkinN=3
	bFollower=False
	bDodgeProj=False
	GuardianType=GUARD_ReturnToPoint
	
	Health=5000
	WaterDmg=0
	ElectricDmgFactor=0.500000
	
	TransformAnim=Transform
	TransformRate=1.000000
	NextStateFromTransform=BootUp
	TransformSnd=None
	
	Physics=PHYS_Flying
	RotationRate=(Pitch=15000,Yaw=50000,Roll=8192)
	MaxDistFromMaster=250.000000
	MinDistFromMaster=100.000000
	
	AirSpeed=1350.000000
	AirControl=1.000000
	AccelRate=1000.000000
	PeripheralVision=-0.995000
	SightRadius=2000.000000
	JumpZ=10.000000
	
	SoundVolume=50
	SoundRadius=15
	SoundPitch=32
	
	MyModel="Child"
	neverRenderBeacon=True
	neverDisplayAknMsg=True
	nonDestroyable=True
	
	AttackCooldownZap=1.250000
	AttackZapDmg=500
	AttackZapSnd=CyChildZapSnd
	AttackCooldownProj=0.500000
	AttackProjDmg=300
	AttackProjSnd=CybFire
	AttackCooldownHoming=2.500000
	AttackHomingDmg=750
	AttackHomingSnd=CybDroneHomingFireSnd
}
