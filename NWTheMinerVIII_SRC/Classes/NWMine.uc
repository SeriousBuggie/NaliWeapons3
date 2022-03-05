//////////////////////////////////////////////////////////////
//	Nali Weapons III The Miner Mine main class
//				Feralidragon (24-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMine expands NaliProjectile
abstract;

#exec AUDIO IMPORT NAME="MineHit1" FILE=SOUNDS\MineHit1.wav GROUP="Impact"
#exec AUDIO IMPORT NAME="MineHit2" FILE=SOUNDS\MineHit2.wav GROUP="Impact"

var() float SensorRadius, SensorHeight;
var() float TargetRadius, TargetHeight;
var() bool bLandedOnly;
var() float LandMinZ;
var() float AISensorMult;
var() bool bTriggerByMachines;
var() int MineHealth;
var() class<NWMineTeamOv> MineOvClass;
var() texture TeamTex[4];
var() byte TeamTexIndex;
var() class<NWDecalGen> MineDecalGenClass;
var() float HitWallDamping;
var() bool bSetTeamAtStart, noHUDRender, noChainReaction;
var() bool bNeverHurtFriends, bNoAI;

var NWMineTeamOv MineOv;
var float MineLifeTime;
var bool bLifeForever;
var vector SurfNormal;
var bool bWallSet;
var int maxSensedMachineClasses;

var NWMineSensor mySensor;
var NWMineSensor myAI;

replication
{
	reliable if (Role == ROLE_Authority)
		SurfNormal;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	MineLifeTime = Class'TheMiner'.default.MinesLifeSpan;
	bLifeForever = (MineLifeTime <= 0);
	LoadLists();
}

simulated function PostBeginPlay()
{
local rotator r;

	Super.PostBeginPlay();
	r = Rotation;
	r.Roll = Rand(16384) * 4;
	RandSpin(50000);
	SetRotation(r);
	
	if (bSetTeamAtStart)
		setTeam();
}

function LoadLists()
{
local int i;

	maxSensedMachineClasses = ArrayCount(Class'TheMiner'.default.SensedMachines);
	if (Class'TheMiner'.default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(Class'TheMiner'.default.SensedMachines); i++)
		{
			if (Class'TheMiner'.default.SensedMachines[i] == '')
			{
				maxSensedMachineClasses = i;
				break;
			}
		}
	}
}

function setTeam()
{
	if (MineOv == None)
	{
		if (MineOvClass != None)
		{
			MineOv = Spawn(MineOvClass, Self);
			if (Instigator != None && Instigator.PlayerReplicationInfo != None && Instigator.PlayerReplicationInfo.Team < 4)
				MineOv.SetTeamTex(Instigator.PlayerReplicationInfo.Team);
			else
				MineOv.SetTeamTex(0);
		}
		else if (TeamTexIndex < 8 && Instigator != None && Instigator.PlayerReplicationInfo != None && Instigator.PlayerReplicationInfo.Team < 4)
			MultiSkins[TeamTexIndex] = TeamTex[Instigator.PlayerReplicationInfo.Team];
	}
}

function setSensors()
{
	mySensor = Spawn(Class'NWMineSensor');
	mySensor.SetMineProperties( SensorRadius, SensorHeight, Self);
	if (AISensorMult > 0.0 && Class'TheMiner'.default.bDetectableMinesByAI && !Class'NWUtils'.static.isMonsterGame(Level))
	{
		myAI = Spawn(Class'NWMineSensor');
		myAI.SetMineProperties( SensorRadius*AISensorMult, SensorHeight*AISensorMult, Self, True);
	}
}

simulated function Destroyed()
{
	if (mySensor != None)
		mySensor.Destroy();
	if (myAI != None)
		myAI.Destroy();
	if (MineOv != None)
		MineOv.Destroy();
		
	mySensor = None;
	myAI = None;
	MineOv = None;
	
	Super.Destroyed();
}

simulated function SetWall(vector HitNormal, Actor Wall)
{
local rotator r;

	RandSpin(0);
	Velocity = vect(0,0,0);
	SetPhysics(PHYS_None);
	bFixedRotationDir = False;
	setSurfNormal(HitNormal);
	r = rotator(-HitNormal);
	r.Roll = Rotation.Roll;
	SetRotation(r);
	bWallSet = True;
	
    if (Mover(Wall) != None)
        SetBase(Wall);
	
	setTeam();
	setSensors();
	SetTimeOut1(0.2);
	genWallFX(HitNormal, Wall);
}

function TimedOut1()
{
	bProjTarget = True;
	bCollideWorld = False;
	SetCollisionSize( TargetRadius, TargetHeight);
}

function setSurfNormal( vector HN){	SurfNormal = HN;}

simulated function genWallFX( vector HitNormal, Actor Wall);

function ProcessTouch( Actor Other, Vector HitLocation)
{
	if (bWallSet)
		return;
	Super.ProcessTouch( Other, HitLocation);
}

simulated function HitWall( vector HitNormal, actor Wall)
{
	if ((!bLandedOnly && (Mover(Wall) == None || (Mover(Wall) != None && Abs(HitNormal.Z) >= LandMinZ))) || (bLandedOnly && HitNormal.Z >= LandMinZ))
		SetWall( HitNormal, Wall);
	else if (VSize(Velocity) > 75.0)
	{
		Velocity = HitWallDamping*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
		speed = VSize(Velocity);
		if ( ImpactSound != None && Level.NetMode != NM_DedicatedServer )
			PlaySound(ImpactSound, SLOT_Misc, 12.0);
	}
	else
		Super.HitWall( HitNormal, Wall);
}

simulated function Tick( float Delta)
{
	Super.Tick( Delta);
	if (!bLifeForever)
	{
		if (MineLifeTime > 0)
			MineLifeTime -= Delta;
		else
			ExplodeX( Location, SurfNormal);
		
		if (mySensor != None && mySensor.Location != Location)
		{
			mySensor.SetLocation(Location);
			if (myAI != None)
				myAI.SetLocation(Location);
		}
	}
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	if (!bNeverHurtFriends)
	{
		bNeverHurtInstigator = False;
		bNoHurtTeam = False;
	}
	if (MineDecalGenClass != None)
		Spawn(MineDecalGenClass,,, HitLocation + HitNormal, rotator(HitNormal));
	
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function SensorTouch( actor Other)
{
	if (killThisActor(Other))
		ExplodeX( Location, SurfNormal, Other);
}

function bool killThisActor( actor Other)
{
	if (Pawn(Other) != None)
		return !Class'NWUtils'.static.isFriend(Pawn(Other), Level, Instigator, savedTeam, bNoHurtTeam, bNeverHurtInstigator, ownerName, Self);
	else if (bTriggerByMachines && isAValidMachine(Other) && !isFriend(Other))
		return True;
	return False;
}

function SensorUnTouch( actor Other);

function bool isAValidMachine( actor A)
{
local int i;

	if (A == None)
		return false;
	
	if (class'TheMiner'.default.bInvertListsProcessing)
	{
		for (i = maxSensedMachineClasses-1; i >= 0; i--)
		{
			if (Class'TheMiner'.default.SensedMachines[i] != '' && A.IsA(Class'TheMiner'.default.SensedMachines[i]))
				return true;
		}
	}
	else
	{
		for (i = 0; i < maxSensedMachineClasses; i++)
		{
			if (Class'TheMiner'.default.SensedMachines[i] != '' && A.IsA(Class'TheMiner'.default.SensedMachines[i]))
				return true;
		}
	}
	
	return false;
}

function bool isFriend(actor A)
{
	if (A == None)
		return False;
	
	if (Pawn(A) != None)
		return Class'NWUtils'.static.isFriend(Pawn(A), Level, Instigator, savedTeam, bNoHurtTeam, bNeverHurtInstigator, ownerName, Self);
	else if (A.Instigator != None)
		return Class'NWUtils'.static.isFriend(A.Instigator, Level, Instigator, savedTeam, bNoHurtTeam, bNeverHurtInstigator, ownerName, Self);
	return False;
}

singular function TakeDamage(int NDamage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType )
{
	if (MineHealth <= 0 || ((!noChainReaction || !Class'TheMiner'.default.bMineChainReaction) && damageType == MyDamageType))
		return;
	
	if (instigatedBy != None && instigatedBy != Instigator && noHurtThisPawn(instigatedBy) && !Class'TheMiner'.default.enableFriendlyDamage)
		return;
	
	MineHealth -= NDamage;
	if (MineHealth <= 0)
	{
		Instigator = instigatedBy;
		ExplodeX( Location, SurfNormal);
	}
}

simulated function ZoneChange( Zoneinfo NewZone )
{
	if (NewZone.IsA('LavaZone') || NewZone.DamageType == 'Burned')
		ExplodeX( Location, SurfNormal);
	
	Super.ZoneChange( NewZone);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=None
	DrawScale=1.000000
	AmbientGlow=0
	bUnlit=False
	bBounce=True
	bNetTemporary=False
	SpawnSound=None
	AmbientSound=None
	bNoHurtTeam=True
	
	ExplosionDecal=None
	MyDamageType=MineExplosion
	DmgRadius=35.000000
	speed=400.000000
	MaxSpeed=600.000000
	Damage=25.000000
	MomentumTransfer=20000
	ExplosionNoise=2.000000
	ProjAccel=25.000000
	
	bWaterHitFX=True
	WaterSplashType=2
	Mass=100.000000
	
	ImpactSound=MineHit2
	
	Physics=PHYS_Falling
	LifeSpan=100000.000000
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	bFixedRotationDir=True
	
	LandMinZ=0.650000
	AISensorMult=2.500000
	
	SurfNormal=(Z=1.000000)
	HitWallDamping=0.500000
	NetUpdateFrequency=25.000000
}
