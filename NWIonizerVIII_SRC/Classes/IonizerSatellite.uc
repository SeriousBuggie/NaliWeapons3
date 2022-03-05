//////////////////////////////////////////////////////////////
//				Feralidragon (26-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerSatellite expands NaliWPawn;

#exec MESH IMPORT MESH=IonizerSatellite ANIVFILE=MODELS\IonizerSatellite_a.3d DATAFILE=MODELS\IonizerSatellite_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerSatellite STRENGTH=0.0
#exec MESH ORIGIN MESH=IonizerSatellite X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonizerSatellite SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonizerSatellite SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerSatellite SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonizerSatellite SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerSatellite SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonizerSatellite MESH=IonizerSatellite
#exec MESHMAP SCALE MESHMAP=IonizerSatellite X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=Sk_IonizerSatellite01 FILE=SKINS\Sk_IonizerSatellite01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerSatellite NUM=1 TEXTURE=Sk_IonizerSatellite01

#exec TEXTURE IMPORT NAME=Sk_IonizerSatellite02 FILE=SKINS\Sk_IonizerSatellite02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerSatellite NUM=2 TEXTURE=Sk_IonizerSatellite02

#exec TEXTURE IMPORT NAME=IonizerMetal FILE=SKINS\IonizerMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="IonSatAmb" FILE=SOUNDS\IonSatAmb.wav GROUP="IonizerSatellite"
#exec AUDIO IMPORT NAME="IonSatDmgExplosion" FILE=SOUNDS\IonSatDmgExplosion.wav GROUP="IonizerSatellite"
#exec AUDIO IMPORT NAME="IonSatDmgHit1" FILE=SOUNDS\IonSatDmgHit1.wav GROUP="IonizerSatellite"
#exec AUDIO IMPORT NAME="IonSatDmgHit2" FILE=SOUNDS\IonSatDmgHit2.wav GROUP="IonizerSatellite"
#exec AUDIO IMPORT NAME="IonSatDmgHit3" FILE=SOUNDS\IonSatDmgHit3.wav GROUP="IonizerSatellite"


var() float OpenCloseTime, WaitToOpenTime;
var() float RotateSpeed;
var() float ChargeUpTime, AttackingTime;
var() byte BeamSoundMultiple;
var(Sparks) byte MaxSparks, SparkTriggerDmg;
var() sound DamageSnd[3], ExploSnd;

struct IonSatWreckStruct
{
	var() class<IonSatWreckedPiece> WreckClass;
	var() vector WreckOffset;
	var() int WreckRollOffset;
};

var(Wreck) IonSatWreckStruct WreckParts[8];

var vector InitVel;
var float RRoll;
var IonSatOvTeam TeamLightsOV;
var IonSatEnvOv EnvOv;
var IonizerSatLight IonSatLights[3];
var Ionizer IonizerOwner;
var IonizerLauncher IonLauncher;
var IonSatBeam IonBeam;
var IonSatPanelChargeOV IonPanels[10];
var IonSatMainChargeOV IonMainOV;
var IonChargeCor IonChargeLightFX1, IonChargeLightFX2;
var IonNukeTrigger IonNukeT;

var vector AttackPoint, AttackLastNormal;
var byte AtkType;

var vector MvLoc, RotLoc;
var float easingFactor;
var bool finishedRot, finishedMove;
var float OldYaw;
var float AIAwarenessCount;


replication
{
	reliable if (Role == ROLE_Authority)
		IonizerOwner, MvLoc, finishedMove;
}


event EncroachedBy(actor Other);

function InitSat(vector Vel, Pawn newMaster)
{
	AddVelocity(Vel);
	InitVel = Vel;
	setMaster(newMaster);
	TeamLightsOV = Spawn(Class'IonSatOvTeam', Self);
	TeamLightsOV.SetTeam(MyTeam);
	EnvOv = Spawn(Class'IonSatEnvOv', Self);
}

function ChangeSatMaster(Pawn newMaster)
{
local byte i;

	setMaster(newMaster);
	if (TeamLightsOV != None)
		TeamLightsOV.SetTeam(MyTeam);
	for (i = 0; i < ArrayCount(IonSatLights); i++)
	{
		if (IonSatLights[i] != None)
			IonSatLights[i].SetTeam(MyTeam);
	}
	
	if (IonNukeT != None)
		IonNukeT.Instigator = newMaster;
}

function UpdateTactics(float Delta)
{
local rotator R;

	MovingUpdate(Delta);
	TurningUpdate(Delta);

	if (Level.NetMode == NM_StandAlone)
		RotateRoll(Delta);
	if (Class'Ionizer'.default.SatelliteAIAwareness && !Class'Ionizer'.default.SatelliteIsInvincible)
		CreateAwareness(Delta);
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	//Rotation roll and movement client buffering
	if (Role < ROLE_Authority)
	{
		RotateRoll(Delta);
		MovingUpdate(Delta);
	}
}

simulated function RotateRoll(float Delta)
{
local rotator R;

	RRoll += (RotationRate.Roll * Delta);
	if (RRoll > 65536)
		RRoll -= 65536;
	R = Rotation;
	R.Roll = Int(RRoll);
	if (Role < ROLE_Authority)
		SetRotation(R);
	else
		ClientSetRotation(R);
}

function CreateAwareness(float Delta)
{
local Pawn P;

	AIAwarenessCount += Delta;
	if (AIAwarenessCount > 1.0)
	{
		AIAwarenessCount = 0.0;
		for (P = Level.PawnList; P != None; P = P.NextPawn)
		{
			if (Class'NWUtils'.static.isElegibleBotAI(P, True, FRand()*6.5) && P != Self && 
			P.Health > 0 && !P.bHidden && !isFriend(P) && P.LineOfSightTo(Self))
			{
				P.Enemy = Self;
				if (Bot(P) != None)
					Bot(P).OldEnemy = Self;
			}
		}
	}
}

simulated function MovingUpdate(float Delta)
{
local vector newLoc;
local float curSpeed;

	if (finishedMove)
		return;

	curSpeed = Delta * AirSpeed;
	if (VSize(Location - MvLoc) > AirSpeed && easingFactor < 1.0)
		easingFactor += Delta;
	else if (VSize(Location - MvLoc) < AirSpeed*0.5 && easingFactor > 0.0)
		easingFactor -= Delta;
	else
		easingFactor = 1.0;
	
	easingFactor = FClamp(easingFactor, 0.25, 1.0);
	curSpeed *= easingFactor;
	if (VSize(Location - MvLoc) < curSpeed)
	{
		if (Role == ROLE_Authority)
			finishedMove = True;
		easingFactor = 0;
		newLoc = MvLoc;
	}
	else
		newLoc = Location + curSpeed*Normal(MvLoc - Location);
	
	SetLocation(newLoc);
	//ClientSetLocation(newLoc, Rotation);
}

function TurningUpdate(float Delta)
{
local rotator newRot;
local vector dirFrom, dirTo;
local rotator rFrom, rTo;
local float rotRate;

	if (finishedRot)
		return;

	dirFrom = vector(Rotation);
	dirTo = Normal(RotLoc - Location);
	rFrom = rotator(dirFrom);
	rTo = rotator(dirTo);
	rotRate = RotateSpeed * Delta;
	
	if (Abs(rFrom.Pitch - rTo.Pitch) <= rotRate && (Abs(rFrom.Yaw - rTo.Yaw) <= rotRate || Rotation.Yaw == OldYaw))
	{
		finishedRot = True;
		return;
	}
	
	OldYaw = Rotation.Yaw;
	newRot = rTo;
	newRot.Roll = Rotation.Roll;
	
	if (Abs(rFrom.Pitch - rTo.Pitch) > rotRate)
	{
		if (rFrom.Pitch > rTo.Pitch)
			newRot.Pitch = rFrom.Pitch - rotRate;
		else
			newRot.Pitch = rFrom.Pitch + rotRate;
	}
	RotationRate.Pitch = Abs(newRot.Pitch);
	DesiredRotation = newRot;
}

function MoveToPoint(vector newLoc)
{
	finishedMove = False;
	MvLoc = newLoc;
}

function TurnToPoint(vector newFoc)
{
	finishedRot = False;
	RotLoc = newFoc;
}

function bool CanAttackPoint(vector pnt, vector hNormal, out byte typeOfAttack, optional bool bSaveNormal)
{
local vector HitNorm, HitLoc, S, E;
local actor A;
local bool tempB;

	if (pnt.Z > (Location.Z - CollisionHeight) || Abs(hNormal.Z) < 0.25)
		return False;
	
	if (bSaveNormal)
		AttackLastNormal = hNormal;

	//Check direct approach
	S = Location;
	E = pnt;
	A = Trace(HitLoc, HitNorm, E, S, False);
	if (A == None)
	{
		typeOfAttack = 0;
		tempB = True;
	}
	
	//Check alternate approach
	S = Location;
	E = S + (pnt - Location)*vect(1,1,0);
	A = Trace(HitLoc, HitNorm, E, S, False);
	if (A != None)
		return tempB;
		
	S = E;
	E = pnt;
	A = Trace(HitLoc, HitNorm, E, S, False);
	if (A == None)
	{
		typeOfAttack = 1;
		return True;
	}
		
	return tempB;
}

function AttackSpot(vector pnt)
{
	AttackPoint = pnt;
	GotoState('MovingToAttack');
}

function ClientSetLocation( vector NewLocation, rotator NewRotation )
{
	//Ignore rotation, if any rotation must be set, do it through ClientSetRotation
	/*ViewRotation = NewRotation;
	SetRotation(NewRotation);*/
	SetLocation(NewLocation);
}

function ClientSetRotation(rotator NewRotation)
{
    ViewRotation = NewRotation;
    SetRotation(NewRotation);
}

simulated function AddVelocity( vector NewVelocity )
{
	Velocity = vect(0,0,0);
}

simulated function PlayPanelsAnim( optional bool bClosing)
{
	if (bClosing)
		PlayAnim('Closing', 1/OpenCloseTime, 0.0);
	else
		PlayAnim('Openning', 1/OpenCloseTime, 0.0);
}

function SpawnLights()
{
local byte i;
local vector pPivotVect;
local rotator R;

	if (Class'Ionizer'.default.enableSatLights)
	{
		for (i = 0; i < ArrayCount(IonSatLights); i++)
		{
			R.Roll = Int(i * (65536.f/ArrayCount(IonSatLights)));
			pPivotVect = (vect(-39, 0, -216) >> R);
			IonSatLights[i] = Spawn(Class'IonizerSatLight', Self,, Location + (pPivotVect >> Rotation));
			IonSatLights[i].SetTeam(MyTeam);
			IonSatLights[i].SetPrePivot(pPivotVect);
		}
	}
}

function SpawnChargingFX()
{
local byte i;
local float fade, life, ctime;
local float nBeams;
local vector beamDir, satStartOffset;
local int n;
local IonSatBeam IBeam1, IBeam2;
local IonSatBeamFX ifx;

	//Spawn satellite OV
	for (i = 0; i < ArrayCount(IonPanels); i++)
	{
		IonPanels[i] = Spawn(Class'IonSatPanelChargeOV', Self);
		ctime = ChargeUpTime - 1.0;
		life = i * ctime / (ArrayCount(IonPanels) - 1);
		fade = ctime - life + 4.0;
		IonPanels[i].SetPanel(i, fade, life);
	}
	
	//Spawn ion beam
	beamDir = Normal(AttackPoint - Location);
	satStartOffset = 12 * beamDir;
	nBeams = Int(VSize(AttackPoint - Location) / Class'IonSatBeam'.default.BeamLength);
	for (n = nBeams; n >= 0; n--)
	{
		IBeam1 = Spawn(Class'IonSatBeam',,, Location + satStartOffset + n*beamDir*Class'IonSatBeam'.default.BeamLength, rotator(beamDir));
		if (IBeam1 != None && IBeam2 != None)
			IBeam1.SetNextBeam(IBeam2);
		IBeam2 = IBeam1;
		if ((n % BeamSoundMultiple) == 0)
			IBeam1.AmbientSound = IBeam1.default.AmbientSound;
	}
	IonBeam = IBeam1;
	
	//Spawn ion beam fx during the trace
	nBeams = Int(VSize(AttackPoint - Location) / 1000);
	for (n = 0; n < nBeams; n++)
	{
		ifx = Spawn(Class'IonSatBeamFX', IonBeam,, Location + Normal(AttackPoint - Location)*1000*n, rotator(AttackPoint - Location));
		ifx.SetFinishPoint(AttackPoint, Location);
	}
	
	//Spawn main overlay
	IonMainOV = Spawn(Class'IonSatMainChargeOV', Self);
	
	//Spawn ionizer corona charging fx
	IonChargeLightFX1 = Spawn(Class'IonChargeCor',,, Location + (vect(64,0,0)>>Rotation));
	IonChargeLightFX2 = Spawn(Class'IonChargeCor',,, AttackPoint);
	
	//Spawn projectile trigger for additional fx and final nuclear blast
	IonNukeT = Spawn(Class'IonNukeTrigger', Self,, AttackPoint, rotator(AttackLastNormal));
}

singular function TakeDamage( int Damage, Pawn InstigatedBy, vector HitLocation, vector Momentum, name DamageType)
{
local byte i, totalSparks;
local int actualDamage;

	if (Class'Ionizer'.default.SatelliteIsInvincible || Health <= 0 || isFriend(InstigatedBy))
		return;
	
	PlaySound(DamageSnd[Rand(ArrayCount(DamageSnd))],,8.0,,1200.0);
	actualDamage = ReduceDamage(Damage, DamageType, Self, InstigatedBy);
	Health -= Damage;
	
	totalSparks = Min(Max(Byte(actualDamage/SparkTriggerDmg), 1), MaxSparks);
	for (i = 0; i < totalSparks; i++)
		Spawn(Class'IonSatelliteSpark',,, HitLocation, RotRand());
	
	if (Health <= 0)
		ExplodeToBits();
}

function int ReduceDamage(int Damage, name DamageType, pawn injured, pawn instigatedBy)
{
	if (injured.Region.Zone.bNeutralZone)
        return 0;

    if (instigatedBy == None)
        return Damage;
	
	return (Damage * instigatedBy.DamageScaling);
}

function ExplodeToBits()
{
local IonSatWreckedPiece ionwp;
local byte i;
local rotator R;
	
	for (i = 0; i < ArrayCount(WreckParts); i++)
	{
		if (WreckParts[i].WreckClass != None)
		{	
			R.Roll = WreckParts[i].WreckRollOffset;
			ionwp = Spawn(WreckParts[i].WreckClass,,, Location + (((WreckParts[i].WreckOffset*DrawScale) >> R) >> Rotation), Rotation + R);
			ionwp.DrawScale = DrawScale;
			ionwp.SetVelocity(Normal(((WreckParts[i].WreckOffset*DrawScale) >> Rotation) + VRand()*VSize(WreckParts[i].WreckOffset*DrawScale)/3));
		}
	}
	
	PlaySound(ExploSnd,,20.0,,6000.0);
	Spawn(Class'IonSatDmgExplShake');
	Spawn(Class'IonSatDmgExpl');
	for (i = 0; i < 5; i++)
		Spawn(Class'IonSatDmgExpl',,, Location + VRand()*FMax(CollisionRadius, CollisionHeight)*3);
	
	Destroy();
}

simulated function Destroyed()
{
local byte i;

	if (TeamLightsOV != None)
		TeamLightsOV.Destroy();
	if (EnvOv != None)
		EnvOv.Destroy();
	if (IonBeam != None)
		IonBeam.Destroy();
	if (IonMainOV != None)
		IonMainOV.Destroy();
	if (IonChargeLightFX1 != None)
		IonChargeLightFX1.Destroy();
	if (IonChargeLightFX2 != None)
		IonChargeLightFX2.Destroy();
	if (IonNukeT != None)
		IonNukeT.Destroy();
		
	TeamLightsOV = None;
	EnvOv = None;
	IonBeam = None;
	IonMainOV = None;
	IonChargeLightFX1 = None;
	IonChargeLightFX2 = None;
	IonNukeT = None;
		
	for (i = 0; i < ArrayCount(IonSatLights); i++)
	{
		if (IonSatLights[i] != None)
			IonSatLights[i].Destroy();
		IonSatLights[i] = None;
	}
	
	for (i = 0; i < ArrayCount(IonPanels); i++)
	{
		if (IonPanels[i] != None)
			IonPanels[i].Destroy();
		IonPanels[i] = None;
	}
	
	if (IonizerOwner != None)
	{
		if (Role == ROLE_Authority)
			IonizerOwner.SetStatus(0);
		IonizerOwner = None;
	}
		
	Super.Destroyed();
}

state Online
{
ignores SeePlayer, HearNoise;

}

state MovingToAttack
{
ignores SeePlayer, HearNoise;

Begin:
	if (IonizerOwner != None)
		IonizerOwner.SetStatus(5);
	CanAttackPoint(AttackPoint, AttackLastNormal, AtkType);
	
	if (AtkType == 1)
		TurnToPoint(Location + vect(0,0,-1000));
TurningA:
	if (!finishedRot)
	{
		Sleep(0.15);
		Goto('TurningA');
	}
	
	if (AtkType == 1)
		MoveToPoint(Location + (AttackPoint - Location)*vect(1,1,0));
Moving:
	if (!finishedMove)
	{
		Sleep(0.15);
		Goto('Moving');
	}
	
	TurnToPoint(AttackPoint);
TurningB:
	if (!finishedRot)
	{
		Sleep(0.15);
		Goto('TurningB');
	}

	GotoState('Attacking');
}

state Attacking
{
ignores SeePlayer, HearNoise;

	function Timer()
	{
	local IonSatBeamFX ifx;
	
		ifx = Spawn(Class'IonSatBeamFX', IonBeam,, Location, rotator(AttackPoint - Location));
		ifx.SetFinishPoint(AttackPoint);
	}

Begin:
	if (IonizerOwner != None)
		IonizerOwner.SetStatus(6);
	SpawnChargingFX();
	SetTimer(0.5, True);
	Sleep(ChargeUpTime);
	SetTimer(0.0, False);
	Sleep(AttackingTime);
	
	//Finish
	if (IonizerOwner != None)
		IonizerOwner.SetStatus(4);
	GotoState('Online');
}

auto state Deploying
{
ignores SeePlayer, HearNoise, KilledBy, TakeDamage, WarnTarget, Died;
	
	function UpdateTactics(float Delta)
	{
		if (VSize(InitVel) > 0 && Normal(InitVel) dot Normal(Velocity) <= 0)
		{
			SetPhysics(PHYS_Flying);
			Velocity *= 0;
		}

		Global.UpdateTactics(Delta);
	}
	
	function AddVelocity(vector NewVelocity)
	{
		SetPhysics(PHYS_Falling);
		Velocity += NewVelocity;
	}
	
Begin:
	Health = Class'Ionizer'.default.SatelliteArmor;
	if (WaitToOpenTime > 0)
		Sleep(WaitToOpenTime);
	PlayPanelsAnim();
	FinishAnim();
	SpawnLights();
	if (IonizerOwner != None)
		IonizerOwner.SetStatus(4);
	if (IonLauncher != None)
		IonLauncher.SetLauncherLifespan();
	Velocity *= 0;
	SetPhysics(PHYS_Flying);
	GoToState('Online');
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerSatellite
	CollisionRadius=32.000000
	CollisionHeight=64.000000
	AnimSequence=Closed
	Physics=PHYS_Falling
	Intelligence=BRAINS_HUMAN
	RotationRate=(Pitch=65535,Yaw=4096,Roll=8192)
	SightRadius=50000.000000
	HearingThreshold=1.000000
	FovAngle=170.000000
	PeripheralVision=-1.000000
	bStasis=False
	AmbientSound=IonSatAmb
	SoundVolume=128
	SoundRadius=64
	Texture=IonizerMetal
	finishedRot=True
	finishedMove=True
	OldYaw=12345.678900
	
	AirSpeed=1000.000000
	AirControl=1.000000
	AccelRate=1000.000000
	bAdvancedTactics=True
	AttackLastNormal=(Z=1.000000)
	
	bMachine=True
	SparkTriggerDmg=5
	MaxSparks=10
	DamageSnd(0)=IonSatDmgHit1
	DamageSnd(1)=IonSatDmgHit2
	DamageSnd(2)=IonSatDmgHit3
	ExploSnd=IonSatDmgExplosion
	
	OpenCloseTime=1.000000
	WaitToOpenTime=0.750000
	RotateSpeed=4096.000000
	ChargeUpTime=10.000000
	AttackingTime=5.000000
	BeamSoundMultiple=5
	
	WreckParts(0)=(WreckClass=Class'IonSatWreckMain')
	WreckParts(1)=(WreckClass=Class'IonSatWreckReceptor',WreckOffset=(X=-72.000000))
	WreckParts(2)=(WreckClass=Class'IonSatWreckCharger',WreckOffset=(X=52.000000,Z=18.500000))
	WreckParts(3)=(WreckClass=Class'IonSatWreckCharger',WreckOffset=(X=52.000000,Z=18.500000),WreckRollOffset=21845)
	WreckParts(4)=(WreckClass=Class'IonSatWreckCharger',WreckOffset=(X=52.000000,Z=18.500000),WreckRollOffset=-21845)
	WreckParts(5)=(WreckClass=Class'IonSatWreckPanel',WreckOffset=(X=-44.500000,Z=-144.000000))
	WreckParts(6)=(WreckClass=Class'IonSatWreckPanel',WreckOffset=(X=-44.500000,Z=-144.000000),WreckRollOffset=21845)
	WreckParts(7)=(WreckClass=Class'IonSatWreckPanel',WreckOffset=(X=-44.500000,Z=-144.000000),WreckRollOffset=-21845)
}
