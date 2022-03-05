//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileMegaBase expands NaliWActor;

#exec MESH IMPORT MESH=MultiMissileMegaBase ANIVFILE=MODELS\MultiMissileMegaBase_a.3d DATAFILE=MODELS\MultiMissileMegaBase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMissileMegaBase STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMissileMegaBase X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=All STARTFRAME=0 NUMFRAMES=5
#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=Openned STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=Closed STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=OpenHalf1 STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=OpenHalf2 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=OpenFull STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=CloseHalf1 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=CloseHalf2 STARTFRAME=3 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MultiMissileMegaBase SEQ=CloseFull STARTFRAME=2 NUMFRAMES=3 RATE=2.0

#exec MESHMAP NEW MESHMAP=MultiMissileMegaBase MESH=MultiMissileMegaBase
#exec MESHMAP SCALE MESHMAP=MultiMissileMegaBase X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_MultiMBase01 FILE=SKINS\Sk_MultiMBase01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileMegaBase NUM=1 TEXTURE=Sk_MultiMBase01

#exec TEXTURE IMPORT NAME=Sk_MultiMBase02 FILE=SKINS\Sk_MultiMBase02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileMegaBase NUM=2 TEXTURE=Sk_MultiMBase02

#exec AUDIO IMPORT NAME="MMBInit" FILE=SOUNDS\MMBInit.wav GROUP="MMBase"
#exec AUDIO IMPORT NAME="MMBDoorsOpen1" FILE=SOUNDS\MMBDoorsOpen1.wav GROUP="MMBase"
#exec AUDIO IMPORT NAME="MMBDoorsOpen2" FILE=SOUNDS\MMBDoorsOpen2.wav GROUP="MMBase"
#exec AUDIO IMPORT NAME="MMBTurretLiftAmb" FILE=SOUNDS\MMBTurretLiftAmb.wav GROUP="MMBase"
#exec AUDIO IMPORT NAME="MMBTurretLiftStart" FILE=SOUNDS\MMBTurretLiftStart.wav GROUP="MMBase"
#exec AUDIO IMPORT NAME="MMBTurretLiftEnd" FILE=SOUNDS\MMBTurretLiftEnd.wav GROUP="MMBase"


var() float RisingTime, RisePauseTime, OpeningTime, LoadLiftTime, LoadPause, ActiveTime;
var() float SleepPauseTime, SleepDownTime, ClosingTime, ClosePauseTime, SinkingTime;
var() float OpenLiftInterectTime, CloseDownInterectTime;

var() float BaseHeightTop, BaseHeightMiddle, BaseHeightBottom, HeightToOrigin;
var() float BaseRadiusTop, BaseRadiusMiddle, BaseRadiusBottom, TurretRadius;

var() sound InitSound, DoorsOpenSnd1, DoorsOpenSnd2, DoorsCloseSnd1, DoorsCloseSnd2;
var() sound LiftAmbSnd, LiftStartSnd, LiftEndSnd;

enum EBaseState
{
	MBS_Rising,
	MBS_RisePause,
	MBS_Opening,
	MBS_LoadLift,
	MBS_LoadPause,
	MBS_Active,
	MBS_SleepPause,
	MBS_SleepDown,
	MBS_Closing,
	MBS_ClosePause,
	MBS_Sinking
};
var EBaseState MBaseState;
var vector startPrePivot, startTurretPrePivot;
var float tCount, fCount;
var bool isAnimDoor;
var float rotateToYaw, rotateToPitch, curToYaw, curToPitch;
var float clientRotToYaw, clientRotToPitch;
var PlayerPawn localPlayer;
var bool hasInit;

var() float TurretRotRate, FireCycleRate;
var() float ReloadPauseTime, ReloadTime;
var() float ScanEnemiesRadius, RangedEnemiesPeriph, AttackMinPeriph;
var() int MissileDamage;
var() float MissileDamageRadius;

var() float AttackNormalInterval, AttackDualInterval, AttackQuadInterval, AttackHexaInterval;
var() float HexaAtkOdds, QuadAtkOdds, DualAtkOdds, IdleRotateOdds;

var MMBaseColPart MiddleBaseColPart, TurretColPart, BaseColPart[4];
var MultiMissileTurretBase MMTBase;
var MultiMissileTurret MMTurret;
var MultiMissileMBox MMMBox;


struct MBoxMQueue
{
	var bool isActive;
	var float PauseTCount;
};
var MBoxMQueue MQueue[12];
var byte MBoxFireSync[12], MBoxFireSyncClient[12];
var float MBoxClientPauseTCount[12];
var() vector PHOffset[12];
var MultiMissileMBoxMissPH PH[12];

struct MBoxMFireQueue
{
	var bool isWaiting;
	var float WaitCount;
	var Actor qTarget;
};
var MBoxMFireQueue MFireQueue[12];
var Pawn CurVictim, OtherVictims[11];
var byte OtherVictimsAmount;

var() float syncMaxPitchDif, syncMaxYawDif;


replication
{
	reliable if (Role == ROLE_Authority)
		ActiveTime, rotateToYaw, rotateToPitch, ReloadPauseTime, ReloadTime, MBoxFireSync, TurretRotRate;
	unreliable if (Role == ROLE_Authority)
		curToYaw, curToPitch;
}

function PreBeginPlay()
{
	if (Class'MultiMissile'.default.OversurrectionLifeTime > 0.0)
		ActiveTime = Class'MultiMissile'.default.OversurrectionLifeTime;
	if (Class'MultiMissile'.default.OversurrectionTurretRotRate > 0.0)
		TurretRotRate = Class'MultiMissile'.default.OversurrectionTurretRotRate;
	if (Class'MultiMissile'.default.OversurrectionFireCycleRate > 0.0)
		FireCycleRate = Class'MultiMissile'.default.OversurrectionFireCycleRate;
	if (Class'MultiMissile'.default.OversurrectionReloadPauseTime > 0.0)
		ReloadPauseTime = Class'MultiMissile'.default.OversurrectionReloadPauseTime;
	if (Class'MultiMissile'.default.OversurrectionReloadTime > 0.0)
		ReloadTime = Class'MultiMissile'.default.OversurrectionReloadTime;
	if (Class'MultiMissile'.default.OversurrectionScanEnemiesRadius > 0.0)
		ScanEnemiesRadius = Class'MultiMissile'.default.OversurrectionScanEnemiesRadius;
	if (Class'MultiMissile'.default.OversurrectionRangedEnemiesPeriph > 0.0)
		RangedEnemiesPeriph = Class'MultiMissile'.default.OversurrectionRangedEnemiesPeriph;
	if (Class'MultiMissile'.default.OversurrectionAttackMinPeriph > 0.0)
		AttackMinPeriph = Class'MultiMissile'.default.OversurrectionAttackMinPeriph;
	if (Class'MultiMissile'.default.OversurrectionHexaAtkOdds > 0.0)
		HexaAtkOdds = Class'MultiMissile'.default.OversurrectionHexaAtkOdds;
	if (Class'MultiMissile'.default.OversurrectionQuadAtkOdds > 0.0)
		QuadAtkOdds = Class'MultiMissile'.default.OversurrectionQuadAtkOdds;
	if (Class'MultiMissile'.default.OversurrectionDualAtkOdds > 0.0)
		DualAtkOdds = Class'MultiMissile'.default.OversurrectionDualAtkOdds;
	if (Class'MultiMissile'.default.OversurrectionMissileDamage > 0)
		MissileDamage = Class'MultiMissile'.default.OversurrectionMissileDamage;
	if (Class'MultiMissile'.default.OversurrectionMissileDamageRadius > 0.0)
		MissileDamageRadius = Class'MultiMissile'.default.OversurrectionMissileDamageRadius;
	
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
local PlayerPawn PP;
	
	if (Level.NetMode != NM_DedicatedServer) 
	{
		foreach AllActors(class'PlayerPawn', PP)
		{
			if (Viewport(PP.Player) != None)
			{
				localPlayer = PP;
				break;
			}
		}
	}
	
	if (Role == ROLE_Authority)
		InitMegaBase();
}

static simulated function vector getMegaBaseOffsetFromGround()
{
	return default.DrawScale * (default.HeightToOrigin + default.BaseHeightTop + 4.f) * vect(0,0,1);
}

static simulated function float getRadialNormalizedHeight(float radius, float sinAngle)
{
local float c1, c2, angleBeta, angleAlpha;

	c1 = radius * sinAngle;
	c2 = sqrt((radius**2) - (c1**2));
	angleBeta = atan(c1/c2);
	angleAlpha = PI/2 - angleBeta;
	return (c1 * sin(angleAlpha));
}

simulated function InitMegaBase()
{
local int i;
local vector HL, HN, sPoint;
local Actor A;
local MultiMBaseInitBaseCloudMaster mmbIBCM;
local rotator R;

	startPrePivot = (BaseHeightTop + BaseHeightMiddle + 64.f) * DrawScale * vect(0,0,-1);
	startTurretPrePivot = -getMegaBaseOffsetFromGround() - DrawScale*(Class'MultiMissileMBox'.default.BoxHeight + 8.f)*vect(0,0,1);
	PrePivot = startPrePivot;
	SetTimer(RisingTime, False);
	DoSound(InitSound);
	
	if (Role == ROLE_Authority)
	{
		rotateToYaw = Rotation.Yaw;
		rotateToPitch = Rotation.Pitch;
		curToYaw = rotateToYaw;
		curToPitch = rotateToPitch;
		normalizeCurToRot();
	}
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		clientRotToYaw = Rotation.Yaw;
		clientRotToPitch = Rotation.Pitch;
		
		MMTBase = Spawn(Class'MultiMissileTurretBase');
		InitMegaBaseTPart(MMTBase);
		MMTurret = Spawn(Class'MultiMissileTurret');
		InitMegaBaseTPart(MMTurret);
		MMMBox = Spawn(Class'MultiMissileMBox');
		MMMBox.MMMB = Self;
		InitMegaBaseTPart(MMMBox);
		for (i = 0; i < ArrayCount(PH); i++)
			PH[i] = Spawn(Class'MultiMissileMBoxMissPH');
		UpdatePHCollection();
		
		A = Trace(HL, HN, Location + startTurretPrePivot, Location, False);
		if (A == None)
		{
			HL = Location + startTurretPrePivot;
			HN = vect(0,0,1);
		}
		
		sPoint = HL + HN;
		R = rotator(HN);
		Spawn(Class'MultiMBaseInitShake',,, sPoint);
		Spawn(Class'MultiMBaseInitWallParts',,, sPoint, R);
		
		R = rot(0,0,0);
		mmbIBCM = Spawn(Class'MultiMBaseInitBaseCloudMaster',,, sPoint, R);
		Spawn(Class'MultiMBaseInitBaseCloud', mmbIBCM,, sPoint, R);
		Spawn(Class'MultiMBaseInitBaseCloudB', mmbIBCM,, sPoint, R);
	}
}

simulated function InitMegaBaseTPart(MultiMissileTurretBase MPart)
{
	if (MPart == None)
		return;
	MPart.DrawScale = DrawScale;
	MPart.PrePivot = startTurretPrePivot + PrePivot;
	MPart.setRotAngRate(TurretRotRate);
}

simulated function UpdatePHCollection()
{
local int i;

	if (MMMBox == None)
		return;
	for (i = 0; i < ArrayCount(PH); i++)
	{
		if (PH[i] != None)
		{
			PH[i].PrePivot = MMMBox.PrePivot;
			PH[i].SetRotation(MMMBox.Rotation);
			PH[i].SetLocation(MMMBox.Location + ((PHOffset[i]*MMMBox.DrawScale) >> MMMBox.Rotation));
		}
	}
}

simulated function UpdateMainPrePivot(optional vector PPivot)
{
	if (PPivot.Z > 0.0)
		PPivot *= 0;
	PrePivot = PPivot;
}

simulated function UpdateTPartsPrePivot(optional vector PPivot)
{
	if (PPivot.Z > 0.0)
		PPivot *= 0;
	if (MMTBase != None)
		MMTBase.PrePivot = PPivot;
	if (MMTurret != None)
		MMTurret.PrePivot = PPivot;
	if (MMMBox != None)
		MMMBox.PrePivot = PPivot;
}

function DoSound(sound Snd)
{
	if (Snd != None)
		PlaySound(Snd,, 200,, 3500);
}

function SpawnCollision()
{
local int i;
local vector vSpawn, HitLoc, HitNorm, vStart, vEnd;
local float h, r;
local Actor A;

	h = (BaseHeightTop / ArrayCount(BaseColPart));
	for (i = 0; i < ArrayCount(BaseColPart); i++)
	{
		r = (i * h / (BaseHeightTop - h)) * (BaseRadiusMiddle - BaseRadiusTop) + BaseRadiusTop;
		vSpawn = Location - ((HeightToOrigin + i * h + h/2) * DrawScale) * vect(0,0,1);
		BaseColPart[i] = Spawn(Class'MMBaseColPart',,, vSpawn, rot(0,0,0));
		if (BaseColPart[i] != None)
			BaseColPart[i].SetCollidingPart(r*DrawScale, h*DrawScale/2);
	}
	
	vStart = Location - ((HeightToOrigin + BaseHeightTop) * DrawScale) * vect(0,0,1);
	vEnd = vStart - (BaseHeightMiddle * DrawScale * vect(0,0,1));
	A = Trace(HitLoc, HitNorm, vEnd, vStart, False);
	if (A != None)
		vEnd = HitLoc;
	if (vEnd.Z < vStart.Z)
	{
		vSpawn = vStart + (vEnd - vStart)/2;
		MiddleBaseColPart = Spawn(Class'MMBaseColPart',,, vSpawn, rot(0,0,0));
		if (MiddleBaseColPart != None)
			MiddleBaseColPart.SetCollidingPart(BaseRadiusMiddle*DrawScale, VSize(vEnd - vStart)*DrawScale/2);
	}
}

function SpawnTurretCollision()
{
local vector vSpawn, HitLoc, HitNorm, vStart, vEnd;
local Actor A;

	vStart = Location;
	vEnd = vStart - (HeightToOrigin * DrawScale * vect(0,0,1));
	A = Trace(HitLoc, HitNorm, vEnd, vStart, False);
	if (A != None)
		vEnd = HitLoc;
	if (vEnd.Z < vStart.Z)
	{
		vSpawn = vStart + (vEnd - vStart)/2;
		TurretColPart = Spawn(Class'MMBaseColPart',,, vSpawn, rot(0,0,0));
		if (TurretColPart != None)
			TurretColPart.SetCollidingPart(TurretRadius*DrawScale, VSize(vEnd - vStart)*DrawScale/2, True);
	}
}


simulated function Timer()
{
local int i;

	if (MBaseState == MBS_Rising)
	{
		MBaseState = MBS_RisePause;
		SetTimer(RisePauseTime, False);
		SpawnCollision();
	}
	else if (MBaseState == MBS_RisePause)
	{
		MBaseState = MBS_Opening;
		SetTimer(OpeningTime - OpenLiftInterectTime, False);
		isAnimDoor = True;
		PlayAnim('OpenHalf1', 1/(OpeningTime/2), 0.0);
		DoSound(DoorsOpenSnd1);
		PrePivot = vect(0,0,0);
	}
	else if (MBaseState == MBS_Opening)
	{
		MBaseState = MBS_LoadLift;
		SetTimer(LoadLiftTime, False);
		DoSound(LiftStartSnd);
		AmbientSound = LiftAmbSnd;
	}
	else if (MBaseState == MBS_LoadLift)
	{
		MBaseState = MBS_LoadPause;
		SetTimer(LoadPause, False);
		DoSound(LiftEndSnd);
		AmbientSound = None;
		UpdateTPartsPrePivot();
		if (Level.NetMode != NM_DedicatedServer)
			Spawn(Class'MultiMBaseMidShake');
	}
	else if (MBaseState == MBS_LoadPause)
	{
		MBaseState = MBS_Active;
		SetTimer(ActiveTime, False);
		SpawnTurretCollision();
		for (i = 0; i < ArrayCount(MQueue); i++)
			MQueue[i].isActive = True;
	}
	else if (MBaseState == MBS_Active)
	{
		MBaseState = MBS_SleepPause;
		SetTimer(SleepPauseTime, False);
		if (MMMBox != None && MMTurret != None)
		{
			MMTurret.rotateTo(MMTurret.Rotation.Yaw);
			MMMBox.rotateTo(MMTurret.Rotation.Yaw, MMTurret.Rotation.Pitch);
		}
	}
	else if (MBaseState == MBS_SleepPause)
	{
		MBaseState = MBS_SleepDown;
		SetTimer(SleepDownTime, False);
		DoSound(LiftStartSnd);
		AmbientSound = LiftAmbSnd;
		if (Level.NetMode != NM_DedicatedServer)
			Spawn(Class'MultiMBaseMidShake');
		if (TurretColPart != None)
			TurretColPart.Destroy();
		TurretColPart = None;
	}
	else if (MBaseState == MBS_SleepDown)
	{
		MBaseState = MBS_Closing;
		SetTimer(ClosingTime - CloseDownInterectTime, False);
		isAnimDoor = True;
		PlayAnim('CloseHalf1', 1/(ClosingTime/2), 0.0);
		AmbientSound = None;
		DoSound(DoorsCloseSnd1);
	}
	else if (MBaseState == MBS_Closing)
	{
		MBaseState = MBS_ClosePause;
		SetTimer(ClosePauseTime, False);
	}
	else if (MBaseState == MBS_ClosePause)
	{
		MBaseState = MBS_Sinking;
		SetTimer(SinkingTime, False);
		for (i = 0; i < ArrayCount(BaseColPart); i++)
		{
			if (BaseColPart[i] != None)
				BaseColPart[i].Destroy();
			BaseColPart[i] = None;
		}
		if (MiddleBaseColPart != None)
			MiddleBaseColPart.Destroy();
		MiddleBaseColPart = None;
	}
	else if (MBaseState == MBS_Sinking)
		Destroy();
	tCount = 0.0;
}

simulated function AnimEnd()
{
	if (isAnimDoor)
	{
		if (MBaseState == MBS_Opening)
		{
			PlayAnim('OpenHalf2', 1/(OpeningTime/2), 0.0);
			DoSound(DoorsOpenSnd2);
		}
		else if (MBaseState == MBS_Closing)
		{
			PlayAnim('CloseHalf2', 1/(ClosingTime/2), 0.0);
			DoSound(DoorsCloseSnd2);
		}
		isAnimDoor = False;
	}
}


simulated function Tick(float Delta)
{
local bool compensatePing, isgrt, isUpdate, hasFired;
local int i;

	if (!hasInit && Rotation != rot(0,0,0))
	{
		hasInit = True;
		if (Level.NetMode != NM_StandAlone && Level.NetMode != NM_DedicatedServer)
			InitMegaBase();
	}

	tCount += Delta;
	if (MBaseState == MBS_Active)
	{
		if (Role == ROLE_Authority)
		{
			for (i = 0; i < ArrayCount(MQueue); i++)
			{
				if (MQueue[i].PauseTCount > 0.0)
				{
					MQueue[i].PauseTCount -= Delta;
					if (MQueue[i].PauseTCount <= 0.0)
					{
						MQueue[i].PauseTCount = 0.0;
						MQueue[i].isActive = True;
						MBoxFireSync[i]++;
						if ((MBoxFireSync[i] % 2) == 1)
							MBoxFireSync[i]++;
					}
				}
			}
			
			for (i = 0; i < ArrayCount(MFireQueue); i++)
			{
				if (MFireQueue[i].isWaiting)
				{
					MFireQueue[i].WaitCount -= Delta;
					if (MFireQueue[i].WaitCount <= 0.0)
					{
						MFireQueue[i].WaitCount = 0.0;
						MFireQueue[i].isWaiting = False;
						FireMissile(i, MFireQueue[i].qTarget);
						MFireQueue[i].qTarget = None;
						hasFired = True;
					}
				}
			}
			
			if (hasFired)
				Spawn(Class'MultiMBaseFireShake');

			if (curToYaw != rotateToYaw)
			{
				isgrt = (rotateToYaw > curToYaw);
				curToYaw += (Class'NWUtils'.static.getSign(rotateToYaw - curToYaw) * TurretRotRate * Delta);
				if ((rotateToYaw > curToYaw) != isgrt)
					curToYaw = rotateToYaw;
			}
			if (curToPitch != rotateToPitch)
			{
				isgrt = (rotateToPitch > curToPitch);
				curToPitch += (Class'NWUtils'.static.getSign(rotateToPitch - curToPitch) * TurretRotRate * Delta);
				if ((rotateToPitch > curToPitch) != isgrt)
					curToPitch = rotateToPitch;
			}
			
			if (CurVictim == None)
				fCount += Delta;
			if (CurVictim != None || fCount >= (1/FireCycleRate))
			{
				if (CurVictim == None)
					fCount -= (1/FireCycleRate);
				processPotentialAttack();			
			}
		}
		
		if (Level.NetMode != NM_DedicatedServer)
		{
			isUpdate = (clientRotToYaw != rotateToYaw || clientRotToPitch != rotateToPitch);
			compensatePing = (Level.NetMode != NM_StandAlone && isUpdate && localPlayer != None && 
				localPlayer.PlayerReplicationInfo != None && localPlayer.PlayerReplicationInfo.Ping > 25);
			
			clientRotToYaw = rotateToYaw;
			clientRotToPitch = rotateToPitch;
			if (isUpdate)
			{
				if (MMTurret != None)
				{
					MMTurret.rotateTo(clientRotToYaw);
					if (compensatePing)
						MMTurret.Tick(localPlayer.PlayerReplicationInfo.Ping / 1000.f);
				}
				if (MMMBox != None)
				{
					MMMBox.rotateTo(clientRotToYaw, clientRotToPitch);
					if (compensatePing)
						MMMBox.Tick(localPlayer.PlayerReplicationInfo.Ping / 1000.f);
				}
			}
			
			if (MMMBox != None && (Abs(MMMBox.rotPitch - curToPitch) >= syncMaxPitchDif || Abs(MMMBox.rotYaw - curToYaw) >= syncMaxYawDif))
			{
				MMMBox.adjustSyncRot(clientRotToYaw, curToYaw, clientRotToPitch, curToPitch);
				if (MMTurret != None)
					MMTurret.adjustSyncRot(clientRotToYaw, curToYaw);
			}
				
			for (i = 0; i < ArrayCount(MBoxClientPauseTCount); i++)
			{
				if (MBoxClientPauseTCount[i] > 0.0)
				{
					MBoxClientPauseTCount[i] -= Delta;
					if (MBoxClientPauseTCount[i] <= 0.0)
					{
						MBoxClientPauseTCount[i] = 0.0;
						if (PH[i] != None)
						{
							PH[i].bHidden = False;
							PH[i].setStatus(True, ReloadTime);
						}
					}
				}
			}
				
			for (i = 0; i < ArrayCount(MBoxFireSyncClient); i++)
			{
				if (MBoxFireSyncClient[i] != MBoxFireSync[i])
				{
					MBoxFireSyncClient[i] = MBoxFireSync[i];
					if (PH[i] != None)
					{
						if ((MBoxFireSyncClient[i] % 2) == 1)
						{
							PH[i].bHidden = True;
							MBoxClientPauseTCount[i] = (ReloadPauseTime - ReloadTime);
						}
					}
				}
			}
		}
	}
	else if (MBaseState == MBS_Rising)
	{
		UpdateMainPrePivot(((RisingTime - tCount)/RisingTime) * startPrePivot);
		UpdateTPartsPrePivot(startTurretPrePivot + PrePivot);
	}
	else if (MBaseState == MBS_Sinking)
	{
		UpdateMainPrePivot((tCount/SinkingTime) * startPrePivot);
		UpdateTPartsPrePivot(startTurretPrePivot + PrePivot);
	}
	else if (MBaseState == MBS_LoadLift)
		UpdateTPartsPrePivot(((LoadLiftTime - tCount)/LoadLiftTime) * startTurretPrePivot);
	else if (MBaseState == MBS_SleepDown)
		UpdateTPartsPrePivot((tCount/SleepDownTime) * startTurretPrePivot);
}


function processPotentialAttack()
{
local rotator R;
local int i;

	R.Yaw = curToYaw;
	R.Pitch = curToPitch;
	if (CurVictim != None)
	{
		if (!isValidTarget(CurVictim))
		{
			CurVictim = None;
			if (OtherVictimsAmount > 0)
			{
				for (i = 0; i < OtherVictimsAmount; i++)
				{
					if (isValidTarget(OtherVictims[i]))
					{
						CurVictim = OtherVictims[i];
						break;
					}
				}
			}
		}
	}
	
	if (CurVictim != None)
	{
		if ((Normal(CurVictim.Location - Location) dot vector(R)) >= AttackMinPeriph)
			FireMissilesBatch();
		else
		{
			R = rotator(CurVictim.Location - Location);
			rotateToYaw = R.Yaw;
			rotateToPitch = R.Pitch;
			normalizeCurToRot();
		}
	}
	else if (!processNextTarget() && FRand() <= IdleRotateOdds)
	{
		rotateToYaw = int((FRand()*2-1) * 32768);
		rotateToPitch = int((FRand()*1.0-0.2) * Class'MultiMissileMBox'.default.PitchLimitUp / 1.5);
		normalizeCurToRot();
	}
}

function normalizeCurToRot()
{
	if (Abs(curToYaw - rotateToYaw) > 32768)
		curToYaw += (Class'NWUtils'.static.getSign(rotateToYaw - curToYaw)*65536);
	if (Abs(curToPitch - rotateToPitch) > 32768)
		curToPitch += (Class'NWUtils'.static.getSign(rotateToPitch - curToPitch)*65536);
}

function bool processNextTarget()
{
local rotator R;

	CurVictim = getNextTarget(OtherVictims, OtherVictimsAmount);
	if (CurVictim != None)
	{
		R = rotator(CurVictim.Location - Location);
		rotateToYaw = R.Yaw;
		rotateToPitch = R.Pitch;
		normalizeCurToRot();
	}
	return (CurVictim != None);
}

function Pawn getNextTarget(optional out Pawn RangedVictims[11], optional out byte RangedVictimsFound)
{
local Pawn P, PList[64];
local int pawnsAmount, i;
local float minDist, maxDist, dist;
local vector PDir;
	
	RangedVictimsFound = 0;
	for (i = 0; i < ArrayCount(RangedVictims); i++)
		RangedVictims[i] = None;
	
	if (Instigator == None)
		return None;
	minDist = ScanEnemiesRadius;
	for (P = Level.PawnList; P != None; P = P.NextPawn)
	{
		dist = VSize(P.Location - Location);
		if (dist <= ScanEnemiesRadius && isValidTarget(P) && !isFriendlyPawn(P))
		{
			PList[pawnsAmount++] = P;
			if (dist > maxDist)
				maxDist = dist;
			if (dist < minDist)
				minDist = dist;
			if (pawnsAmount >= ArrayCount(PList))
				break;
		}
	}
	
	if (pawnsAmount == 0)
		return None;
	P = PList[Rand(pawnsAmount)];
	
	PDir = Normal(P.Location - Location);
	for (i = 0; i < pawnsAmount; i++)
	{
		if (PList[i] != P && (Normal(PList[i].Location - Location) dot PDir) >= RangedEnemiesPeriph)
		{
			RangedVictims[RangedVictimsFound++] = PList[i];
			if (RangedVictimsFound >= ArrayCount(RangedVictims))
				break;
		}
	}
	return P;
}

simulated function bool isValidTarget(Pawn P)
{
local rotator R;
local bool isVPawn;

	isVPawn = (isValidPawn(P) && FastTrace(P.Location, Location));
	if (isVPawn)
	{
		R = rotator(P.Location - Location);
		isVPawn = (isVPawn && R.Pitch > Class'MultiMissileMBox'.default.PitchLimitDown && R.Pitch < Class'MultiMissileMBox'.default.PitchLimitUp);
	}
	return isVPawn;
}

simulated function bool isValidPawn(Pawn P)
{
	return (P != None && !P.bDeleteMe && P.Health > 0 && !P.bHidden && P.bCollideActors && P.bBlockActors);
}

function bool isFriendlyPawn(Pawn P)
{
	return Class'NWUtils'.static.isFriend(P, Level, Instigator,, True, True);
}


function FireMissilesBatch()
{
local bool isValidSlotSet;
local int i, fSlot, PAmount;
local Pawn P[12];
local float qTime;
local rotator R;

	R.Yaw = curToYaw;
	R.Pitch = curToPitch;
	
	//Avaliate victims
	if (isValidTarget(CurVictim))
		P[PAmount++] = CurVictim;
	CurVictim = None;
	for (i = 0; i < OtherVictimsAmount; i++)
	{
		if (isValidTarget(OtherVictims[i]) && (Normal(OtherVictims[i].Location - Location) dot vector(R)) >= RangedEnemiesPeriph)
			P[PAmount++] = OtherVictims[i];
		OtherVictims[i] = None;
	}
	OtherVictimsAmount = 0;

	//Hexa fire
	if (FRand() <= HexaAtkOdds)
	{
		for (i = 0; i < 2; i++)
		{
			isValidSlotSet = (slotFree(i*6) && slotFree(i*6+1) && slotFree(i*6+2) && slotFree(i*6+3) && slotFree(i*6+4) && slotFree(i*6+5));
			if (isValidSlotSet && ((PAmount%6) == 0))
			{
				addToFireQueue(i*6, qTime, P[PAmount--]);
				addToFireQueue(i*6+1, qTime, P[PAmount--]);
				addToFireQueue(i*6+2, qTime, P[PAmount--]);
				addToFireQueue(i*6+3, qTime, P[PAmount--]);
				addToFireQueue(i*6+4, qTime, P[PAmount--]);
				addToFireQueue(i*6+5, qTime, P[PAmount--]);
				qTime += AttackHexaInterval;
			}
			if (PAmount <= 0)
				return;
		}
	}
	
	//Quad fire
	if (FRand() <= QuadAtkOdds)
	{
		for (i = 0; i < 3; i++)
		{
			isValidSlotSet = (slotFree(i*2) && slotFree(i*2+1) && slotFree(i*2+6) && slotFree(i*2+7));
			if (isValidSlotSet && ((PAmount%4) == 0))
			{
				addToFireQueue(i*2, qTime, P[PAmount--]);
				addToFireQueue(i*2+1, qTime, P[PAmount--]);
				addToFireQueue(i*2+6, qTime, P[PAmount--]);
				addToFireQueue(i*2+7, qTime, P[PAmount--]);
				qTime += AttackQuadInterval;
			}
			if (PAmount <= 0)
				return;
		}
	}
	
	//Dual fire
	if (FRand() <= DualAtkOdds)
	{
		for (i = 0; i < 6; i++)
		{
			isValidSlotSet = (slotFree(i) && slotFree(i+6));
			if (isValidSlotSet && ((PAmount%2) == 0))
			{
				addToFireQueue(i, qTime, P[PAmount--]);
				addToFireQueue(i+6, qTime, P[PAmount--]);
				qTime += AttackDualInterval;
			}
			if (PAmount <= 0)
				return;
		}
	}
	
	//Normal fire
	for (i = 0; i < PAmount; i++)
	{
		fSlot = getFreeFireSlot();
		if (fSlot < 0)
			return;
		addToFireQueue(fSlot, qTime, P[i]);
		qTime += AttackNormalInterval;
	}
}

function int getFreeFireSlot()
{
local int i;

	for (i = 0; i < ArrayCount(MFireQueue); i++)
	{
		if (slotFree(i))
			return i;
	}
	return -1;
}

function addToFireQueue(byte n, float qTime, Actor qActor)
{
	if (MFireQueue[n].isWaiting)
		return;
	MFireQueue[n].isWaiting = True;
	MFireQueue[n].WaitCount = qTime;
	MFireQueue[n].qTarget = qActor;
}

function bool slotFree(byte n)
{
	return (!MFireQueue[n].isWaiting && MQueue[n].isActive);
}

function FireMissile(byte n, optional Actor ATarget)
{
local rotator R;
local MultiMissileMBoxMissile MMMBMissile;
local vector corOffset;

	if (n >= ArrayCount(MQueue) || !MQueue[n].isActive)
		return;
	MQueue[n].isActive = False;
	MQueue[n].PauseTCount = ReloadPauseTime;
	MBoxFireSync[n]++;
	if ((MBoxFireSync[n] % 2) == 0)
		MBoxFireSync[n]++;
	
	R.Yaw = curToYaw;
	R.Pitch = curToPitch;
	R.Roll = 0;
	MMMBMissile = Spawn(Class'MultiMissileMBoxMissile',,, Location + ((PHOffset[n]*DrawScale) >> R), R);
	if (MMMBMissile != None)
	{
		MMMBMissile.LTarget = ATarget;
		MMMBMissile.Damage = MissileDamage;
		MMMBMissile.DmgRadius = MissileDamageRadius;
	}
		
	corOffset = PHOffset[n];
	corOffset.X = Class'MultiMissileMBox'.default.BoxWidth / 2;
	Spawn(Class'MultiMBaseFireCor',,, Location + ((corOffset * DrawScale) >> R));
}


simulated function Destroyed()
{
local int i;

	for (i = 0; i < ArrayCount(BaseColPart); i++)
	{
		if (BaseColPart[i] != None)
			BaseColPart[i].Destroy();
		BaseColPart[i] = None;
	}

	for (i = 0; i < ArrayCount(PH); i++)
	{
		if (PH[i] != None)
			PH[i].Destroy();
		PH[i] = None;
	}
	
	if (MiddleBaseColPart != None)
		MiddleBaseColPart.Destroy();
	if (TurretColPart != None)
		TurretColPart.Destroy();
	if (MMTBase != None)
		MMTBase.Destroy();
	if (MMTurret != None)
		MMTurret.Destroy();
	if (MMMBox != None)
	{
		MMMBox.MMMB = None;
		MMMBox.Destroy();
	}
	
	MiddleBaseColPart = None;
	TurretColPart = None;
	MMTBase = None;
	MMTurret = None;
	MMMBox = None;
	
	Super.Destroyed();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMissileMegaBase
	DrawScale=1.000000
	
	AnimSequence=Closed
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	bClientAnim=True
	Physics=PHYS_None
	LifeSpan=0.000000
	bAlwaysRelevant=True
	bGameRelevant=True
	PrePivot=(Z=0.000000)
	NetPriority=2.000000
	
	AmbientSound=None
	SoundVolume=255
	SoundRadius=192
	SoundPitch=64
	
	RisingTime=1.000000
	RisePauseTime=3.000000
	OpeningTime=3.000000
	LoadLiftTime=3.000000
	LoadPause=1.000000
	ActiveTime=45.000000
	SleepPauseTime=1.500000
	SleepDownTime=3.000000
	ClosingTime=3.000000
	ClosePauseTime=5.000000
	SinkingTime=3.000000
	OpenLiftInterectTime=1.000000
	CloseDownInterectTime=1.000000
	
	BaseHeightTop=43.200000
	BaseHeightMiddle=112.800000
	BaseHeightBottom=74.350000
	HeightToOrigin=129.500000
	BaseRadiusTop=144.000000
	BaseRadiusMiddle=259.000000
	BaseRadiusBottom=120.000000
	TurretRadius=72.000000
	
	InitSound=MMBInit
	DoorsOpenSnd1=MMBDoorsOpen1
	DoorsOpenSnd2=MMBDoorsOpen2
	DoorsCloseSnd1=MMBDoorsOpen2
	DoorsCloseSnd2=MMBDoorsOpen1
	LiftAmbSnd=MMBTurretLiftAmb
	LiftStartSnd=MMBTurretLiftStart
	LiftEndSnd=MMBTurretLiftEnd
	
	TurretRotRate=12000.000000
	FireCycleRate=1.000000
	ReloadPauseTime=3.000000
	ReloadTime=0.750000
	ScanEnemiesRadius=40000.000000
	RangedEnemiesPeriph=0.500000
	AttackMinPeriph=0.900000
	
	MissileDamage=1000
	MissileDamageRadius=1200.000000
	
	AttackNormalInterval=0.150000
	AttackDualInterval=0.225000
	AttackQuadInterval=0.300000
	AttackHexaInterval=0.350000
	HexaAtkOdds=0.450000
	QuadAtkOdds=0.450000
	DualAtkOdds=0.750000
	IdleRotateOdds=0.500000
	
	PHOffset(0)=(X=8.000000,Y=68.500000,Z=10.500000)
	PHOffset(1)=(X=8.000000,Y=47.000000,Z=10.500000)
	PHOffset(2)=(X=8.000000,Y=11.000000,Z=10.500000)
	PHOffset(3)=(X=8.000000,Y=-11.000000,Z=10.500000)
	PHOffset(4)=(X=8.000000,Y=-47.000000,Z=10.500000)
	PHOffset(5)=(X=8.000000,Y=-68.500000,Z=10.500000)
	PHOffset(6)=(X=8.000000,Y=68.500000,Z=-10.500000)
	PHOffset(7)=(X=8.000000,Y=47.000000,Z=-10.500000)
	PHOffset(8)=(X=8.000000,Y=11.000000,Z=-10.500000)
	PHOffset(9)=(X=8.000000,Y=-11.000000,Z=-10.500000)
	PHOffset(10)=(X=8.000000,Y=-47.000000,Z=-10.500000)
	PHOffset(11)=(X=8.000000,Y=-68.500000,Z=-10.500000)
	
	syncMaxPitchDif=3600.000000
	syncMaxYawDif=2400.000000
}
