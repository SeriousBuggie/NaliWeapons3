//////////////////////////////////////////////////////////////
//				Feralidragon (07-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMaster expands Cybot;

#exec MESH IMPORT MESH=CyMaster ANIVFILE=MODELS\CyMaster_a.3d DATAFILE=MODELS\CyMaster_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMaster STRENGTH=0
#exec MESH ORIGIN MESH=CyMaster X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMaster SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMaster SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMaster SEQ=Transform STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMaster MESH=CyMaster
#exec MESHMAP SCALE MESHMAP=CyMaster X=0.2 Y=0.2 Z=0.4

#exec AUDIO IMPORT NAME="CyShellOpen" FILE=SOUNDS\CyShellOpen.wav GROUP="CyMaster"
#exec AUDIO IMPORT NAME="CyMasterAmb" FILE=SOUNDS\CyMasterAmb.wav GROUP="CyMaster"


var() float ShellOpenDelay, ShellOpenTime;
var() float InnerMaxRadius, OuterMaxRadius;
var() sound ShellOpenSnd;
var() int MaxCyChildren, MinDefenseCyChildren;
var CyMasterRotA CyRot[3];
var CyMasterShell CyShell[12];
var CyChild cChildList;
var float shellOpenCount;

var() float MinEnemyAprox, SafeEnemyAprox;
var bool isStrafing;
var() float RetreatOdds;
var() float MoveCyChidrenTimeInterval;
var float cyChildrenMvTCount;

var() float ZapAttackOdds, ProjAttackOdds, HomingAttackOdds, ChildAutoAttackOdds;



function SetupHealth();

simulated function PostBeginPlay()
{
	InitCyMaster();
	Super.PostBeginPlay();
}

function InitCyMaster()
{
local int i;
local rotator R;
local float fyaw, startYaw;

	SoundVolume = 0;
	CyRot[0] = Spawn(Class'CyMasterRotA');
	CyRot[0].CyConActor = Self;
	CyRot[1] = Spawn(Class'CyMasterRotB');
	CyRot[1].CyConActor = CyRot[0];
	CyRot[2] = Spawn(Class'CyMasterRotC');
	CyRot[2].CyConActor = CyRot[1];
	
	startYaw = FRand()*65536.f - 32768.f;
	for (i = 0; i < ArrayCount(CyShell); i++)
	{
		fyaw = (i * 65536.f / 6.f);
		R.Yaw = int(fyaw);
		if (i < 6)
			R.Roll = 0;
		else
			R.Roll = 32768;
		CyShell[i] = Spawn(Class'CyMasterShell', Self,,, Class'NWUtils'.static.rTurn(Rotation, R));
		CyShell[i].Init(fyaw, startYaw, i >= 6);
	}
}

function InitiateLifeline()
{
local CybLifeline CL;

	if (MasterPawn == None || Class'CybotLauncher'.default.OversurrectionLifeTime <= 0.0)
		return;
	CL = Spawn(Class'CybLifeline');
	CL.InitLifeline(Self, Class'CybotLauncher'.default.OversurrectionLifeTime);
}

function PlayTransform()
{
	Super.PlayTransform();
	if (CybAttach01 != None)
		CybAttach01.SoundVolume = 0;
}

function UpdateTactics(float Delta)
{
	if (!IsInState('BootUp'))
	{
		cyChildrenMvTCount += Delta;
		if (cyChildrenMvTCount >= MoveCyChidrenTimeInterval)
		{
			MoveCyChildrenRnd();
			cyChildrenMvTCount = 0.0;
		}
	}
	
	if (shellOpenCount < (ShellOpenDelay + ShellOpenTime))
	{
		shellOpenCount += Delta;
		if (shellOpenCount > (ShellOpenDelay + ShellOpenTime))
			shellOpenCount = (ShellOpenDelay + ShellOpenTime);
		SoundVolume = Byte(255.f * shellOpenCount / (ShellOpenDelay + ShellOpenTime));
		if (CybAttach01 != None)
			CybAttach01.SoundVolume = SoundVolume;
	}
	
	Super.UpdateTactics(Delta);
}

simulated function vector getInnerCyChildRandomPoint()
{
local float minRad;

	minRad = Sqrt(CollisionHeight*CollisionHeight + CollisionRadius*CollisionRadius) + Class'CyChild'.default.CollisionRadius;
	return (Location + ((RandRange(minRad, InnerMaxRadius)*vect(1,0,0)) >> RotRand()));
}

simulated function vector getOuterCyChildRandomPoint()
{
	return (Location + ((RandRange(InnerMaxRadius, OuterMaxRadius)*vect(1,0,0)) >> RotRand()));
}

function CastCyChildren()
{
local int i;
local vector loc;
local CyChild c;

	for (i = 0; i < MaxCyChildren; i++)
	{
		loc = getInnerCyChildRandomPoint();
		c = Spawn(Class'CyChild',,, loc, rotator(loc - Location));
		if (c != None)
		{
			c.SetMaster(MasterPawn);
			c.initGoToLoc = c.Location + (vector(c.Rotation) * RandRange(InnerMaxRadius, OuterMaxRadius) * vect(1,1,0.25));
			c.CCM = Self;
			if (cChildList == None)
				cChildList = c;
			else
			{
				c.nextCChild = cChildList;
				cChildList.prevCChild = c;
				cChildList = c;
			}
		}
	}
}

function MoveCyChildrenRnd()
{
local CyChild c;

	for (c = cChildList; c != None; c = c.nextCChild)
	{
		if (c.isAvailable())
			c.setNewFollowPos(getOuterCyChildRandomPoint());
	}
}

function ShellOpen()
{
local int i;

	if (Role == ROLE_Authority)
	{
		Spawn(Class'CyMPostInitLine');
		Spawn(Class'CyMPostInitLight');
	}
	if (ShellOpenSnd != None)
		PlaySound(ShellOpenSnd,, 20.0,, 4200.0);
	for (i = 0; i < ArrayCount(CyShell); i++)
	{
		if (CyShell[i] != None)
			CyShell[i].OpenShell(ShellOpenTime);
	}
}

simulated function ShellOpened();

simulated function Destroyed()
{
local int i;

	killAllChildren();

	for (i = 0; i < ArrayCount(CyRot); i++)
	{
		if (CyRot[i] != None)
			CyRot[i].Destroy();
		CyRot[i] = None;
	}
	
	for (i = 0; i < ArrayCount(CyShell); i++)
	{
		if (CyShell[i] != None)
			CyShell[i].Destroy();
		CyShell[i] = None;
	}
	
	Super.Destroyed();
}

function byte getAttackMethod(Actor Victim)
{
	if (FRand() <= ZapAttackOdds)
		return 0;
	if (FRand() <= ProjAttackOdds)
		return 1;
	if (FRand() <= HomingAttackOdds)
		return 2;
	return 255;
}

function DodgeProjectile(Projectile proj)
{
	bIsDodging = False;
	AttackActor(proj);
}

function ChildSpottedEnemy(CyChild Spotter, Pawn newEnemy)
{
	if (FRand() <= ChildAutoAttackOdds && countAvailableCyChildren() > MinDefenseCyChildren)
		AttackActor(newEnemy, getAttackMethod(newEnemy), Spotter);
}

function bool ChangeEnemy(pawn newEnemy)
{	
	if (newEnemy == None)
		return False;
	if (FastTrace(newEnemy.Location, Location) && countAvailableCyChildren() > MinDefenseCyChildren)
		AttackActor(newEnemy, getAttackMethod(newEnemy));
	Enemy = newEnemy;
	return False;
}

function AttackActor(Actor A, optional byte atkType, optional CyChild c)
{
	if (c == None)
		c = getRandomAvailableCyChild();
	if (c != None && c.isValidAttackActor(A))
		c.InitiateActorAttack(A, atkType);
}

function int countCyChildren()
{
local CyChild c;
local int i;

	for (c = cChildList; c != None; c = c.nextCChild)
		i++;
	return i;
}

function int countAvailableCyChildren()
{
local CyChild c;
local int i;

	for (c = cChildList; c != None; c = c.nextCChild)
	{
		if (c.isAvailable())
			i++;
	}
	return i;
}

function killAllChildren()
{
local CyChild c;

	for (c = cChildList; c != None; c = c.nextCChild)
		c.InitiateSelfKill();
	cChildList = None;
}

function CyChild getRandomAvailableCyChild()
{
local int maxCy, cyIndex, i;
local CyChild c;

	maxCy = countAvailableCyChildren();
	if (maxCy <= 0)
		return None;
	
	cyIndex = Rand(maxCy);
	for (c = cChildList; c != None; c = c.nextCChild)
	{
		if (c.isAvailable() && i == cyIndex)
			return c;
		i++;
	}
	return None;
}

function SpawnExplodeFX()
{
	Spawn(Class'CybSuperExplosionMult',,,, rotator(vect(0,0,1)));
	Spawn(Class'CybSuperShock',,,, rotator(vect(0,0,1)));
	Spawn(Class'CybSuperAfterEffects');
	Spawn(Class'CybSuperExplCor');
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
	CheckEnemy(True);
	if (Enemy != None && (Enemy.bDeleteMe || Enemy.bHidden || Enemy.Health <= 0 || !FastTrace(Enemy.Location, Location)))
		Enemy = None;
	if (Enemy != None)
		TurnTo(Enemy.Location);
	else
		TurnTo(Location + getWanderLook());
	StopFlying();
	Sleep(FRand() + 0.2);
	Goto('Begin');
}


// --------- BOOT UP --------------
state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

Begin:
	if (Class'CybotLauncher'.default.OversurrectionHealth > 0)
		Health = Class'CybotLauncher'.default.OversurrectionHealth;
	if (Class'CybotLauncher'.default.OversurrectionChildrenInnerMaxRadius > 0.0)
		InnerMaxRadius = Class'CybotLauncher'.default.OversurrectionChildrenInnerMaxRadius;
	if (Class'CybotLauncher'.default.OversurrectionChildrenOuterMaxRadius > 0.0)
		OuterMaxRadius = Class'CybotLauncher'.default.OversurrectionChildrenOuterMaxRadius;
	if (Class'CybotLauncher'.default.OversurrectionChildrenMax > 0)
		MaxCyChildren = Class'CybotLauncher'.default.OversurrectionChildrenMax;
	if (Class'CybotLauncher'.default.OversurrectionChildrenDefenseMin > 0)
		MinDefenseCyChildren = Class'CybotLauncher'.default.OversurrectionChildrenDefenseMin;
	if (Class'CybotLauncher'.default.OversurrectionChildrenMoveTimeInterval > 0.0)
		MoveCyChidrenTimeInterval = Class'CybotLauncher'.default.OversurrectionChildrenMoveTimeInterval;
	if (Class'CybotLauncher'.default.OversurrectionChildrenAutoAttackOdds > 0.0)
		ChildAutoAttackOdds = Class'CybotLauncher'.default.OversurrectionChildrenAutoAttackOdds;
	if (Class'CybotLauncher'.default.OversurrectionZapAttackOdds > 0.0)
		ZapAttackOdds = Class'CybotLauncher'.default.OversurrectionZapAttackOdds;
	if (Class'CybotLauncher'.default.OversurrectionProjAttackOdds > 0.0)
		ProjAttackOdds = Class'CybotLauncher'.default.OversurrectionProjAttackOdds;
	if (Class'CybotLauncher'.default.OversurrectionHomingAttackOdds > 0.0)
		HomingAttackOdds = Class'CybotLauncher'.default.OversurrectionHomingAttackOdds;

	SetCollision(False, False, False);
	bCollideWorld = False;
	StopFlying();
	Sleep(ShellOpenDelay);
	ShellOpen();
	CastCyChildren();
	Sleep(ShellOpenTime);
	ShellOpened();
	SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
	bCollideWorld = default.bCollideWorld;
	GotoState('Waiting');
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMaster
	Texture=CybotMetal
	bMeshEnviroMap=True
	bAlwaysRelevant=True
	
	CollisionHeight=56.000000
	CollisionRadius=64.000000
	
	CoreSkinN=3
	bFollower=False
	bDodgeProj=True
	DodgeDetectionRadius=2500.000000
	bDodgeAllProjectiles=True
	
	CybAttachClasses(0)=Class'CyMasterEyeGlass'
	
	Health=50000
	WaterDmg=0
	ElectricDmgFactor=0.500000
	
	TransformAnim=None
	TransformRate=0.000000
	NextStateFromTransform=BootUp
	TransformSnd=None
	
	Physics=PHYS_Flying
	RotationRate=(Pitch=15000,Yaw=10000,Roll=8192)
	
	AirSpeed=450.000000
	AirControl=1.000000
	AccelRate=50.000000
	PeripheralVision=-0.995000
	SightRadius=20000.000000
	JumpZ=10.000000
	
	SoundVolume=255
	SoundRadius=255
	SoundPitch=96
	AmbientSound=CyMasterAmb
	
	MyModel="Master"
	neverRenderBeacon=True
	neverDisplayAknMsg=True
	nonDestroyable=True
	
	WreckedExplosionRadius=2400.000000
	WreckedExplosionDmg=1500
	WreckedExplosionMomentum=850000
	
	ShellOpenDelay=3.000000
	ShellOpenTime=6.000000
	ShellOpenSnd=CyShellOpen
	InnerMaxRadius=140.000000
	OuterMaxRadius=1000.000000
	MaxCyChildren=75
	MinDefenseCyChildren=10
	
	MinEnemyAprox=300.000000
	SafeEnemyAprox=3000.000000
	RetreatOdds=0.350000
	MoveCyChidrenTimeInterval=2.000000
	
	ZapAttackOdds=0.350000
	ProjAttackOdds=0.650000
	HomingAttackOdds=0.150000
	ChildAutoAttackOdds=0.300000
}
