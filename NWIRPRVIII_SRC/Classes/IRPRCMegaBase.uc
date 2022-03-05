//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCMegaBase expands NaliWActor;

#exec MESH IMPORT MESH=IRPRCMegaBase ANIVFILE=MODELS\IRPRCMegaBase_a.3d DATAFILE=MODELS\IRPRCMegaBase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRCMegaBase STRENGTH=0.0
#exec MESH ORIGIN MESH=IRPRCMegaBase X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=All STARTFRAME=0 NUMFRAMES=5
#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=Openned STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=Closed STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=OpenHalf1 STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=OpenHalf2 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=OpenFull STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=CloseHalf1 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=CloseHalf2 STARTFRAME=3 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCMegaBase SEQ=CloseFull STARTFRAME=2 NUMFRAMES=3 RATE=2.0

#exec MESHMAP NEW MESHMAP=IRPRCMegaBase MESH=IRPRCMegaBase
#exec MESHMAP SCALE MESHMAP=IRPRCMegaBase X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_IRPRCBase01 FILE=SKINS\Sk_IRPRCBase01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCMegaBase NUM=1 TEXTURE=Sk_IRPRCBase01

#exec TEXTURE IMPORT NAME=Sk_IRPRCBase02 FILE=SKINS\Sk_IRPRCBase02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCMegaBase NUM=2 TEXTURE=Sk_IRPRCBase02

#exec AUDIO IMPORT NAME="IRPRCBInit" FILE=SOUNDS\IRPRCBInit.wav GROUP="IRPRCBase"
#exec AUDIO IMPORT NAME="IRPRCBDoorsOpen1" FILE=SOUNDS\IRPRCBDoorsOpen1.wav GROUP="IRPRCBase"
#exec AUDIO IMPORT NAME="IRPRCBDoorsOpen2" FILE=SOUNDS\IRPRCBDoorsOpen2.wav GROUP="IRPRCBase"
#exec AUDIO IMPORT NAME="IRPRCBTurretLiftAmb" FILE=SOUNDS\IRPRCBTurretLiftAmb.wav GROUP="IRPRCBase"
#exec AUDIO IMPORT NAME="IRPRCBTurretLiftStart" FILE=SOUNDS\IRPRCBTurretLiftStart.wav GROUP="IRPRCBase"
#exec AUDIO IMPORT NAME="IRPRCBTurretLiftEnd" FILE=SOUNDS\IRPRCBTurretLiftEnd.wav GROUP="IRPRCBase"
#exec AUDIO IMPORT NAME="IRPRCannonOpen" FILE=SOUNDS\IRPRCannonOpen.wav GROUP="IRPRCBase"


var() float RisingTime, RisePauseTime, OpeningTime, LoadLiftTime, LoadPause, ActiveTime;
var() float SleepPauseTime, SleepDownTime, ClosingTime, ClosePauseTime, SinkingTime;
var() float OpenLiftInterectTime, CloseDownInterectTime;

var() float BaseHeightTop, BaseHeightMiddle, BaseHeightBottom, HeightToOrigin;
var() float BaseRadiusTop, BaseRadiusMiddle, BaseRadiusBottom, TurretRadius;

var() sound InitSound, DoorsOpenSnd1, DoorsOpenSnd2, DoorsCloseSnd1, DoorsCloseSnd2;
var() sound LiftAmbSnd, LiftStartSnd, LiftEndSnd, CannonOpenSnd, CannonCloseSnd;

enum EBaseState
{
	IRBS_Rising,
	IRBS_RisePause,
	IRBS_Opening,
	IRBS_LoadLift,
	IRBS_LoadPause,
	IRBS_Active,
	IRBS_SleepPause,
	IRBS_SleepDown,
	IRBS_Closing,
	IRBS_ClosePause,
	IRBS_Sinking
};
var EBaseState IRBaseState;
var vector startPrePivot, startTurretPrePivot;
var float tCount, fCount;
var bool isAnimDoor;
var float rotateToYaw, rotateToPitch, curToYaw, curToPitch;
var float clientRotToYaw, clientRotToPitch;
var PlayerPawn localPlayer;
var bool hasInit;

var() float TurretRotRate, FireCycleRate;
var() float LaserPrepareTime, LaserCooldownTime, LaserFireMaxTime;
var() float ScanEnemiesRadius, RangedEnemiesPeriph, AttackMinPeriph;
var float laserTCount;

var() int LaserDamage;
var() name LaserDamageType;
var() int MaxWTTraces, MaxWTTracePrecision;
var() float MaxTraceRange, MaxWTTraceDepth;
var() float IdleRotateOdds, StopFireOdds;

var IRPRCBaseColPart MiddleBaseColPart, TurretColPart, BaseColPart[4];
var IRPRCTurretBase IRTBase;
var IRPRCTurret IRTurret;
var IRPRCannon IRCannon;
var NWPoint pnt;

enum ELaserState
{
	IRLS_Idle,
	IRLS_Preparing,
	IRLS_Firing,
	IRLS_Cooldown
};
var ELaserState IRLaserState;
var ELaserState shutdownIRLStateControl;
var int IRPRCannonSync, IRPRCannonSyncClient;

var Pawn CurVictim, OtherVictims[16];
var int OtherVictimsAmount;

var() float syncMaxPitchDif, syncMaxYawDif;


replication
{
	reliable if (Role == ROLE_Authority)
		ActiveTime, rotateToYaw, rotateToPitch, LaserPrepareTime, LaserCooldownTime, LaserFireMaxTime, IRPRCannonSync, TurretRotRate,
		MaxWTTraces, MaxWTTracePrecision, MaxTraceRange, MaxWTTraceDepth, IRLaserState;
	unreliable if (Role == ROLE_Authority)
		curToYaw, curToPitch;
}

function PreBeginPlay()
{
	if (Class'IRPR'.default.OversurrectionLifeTime > 0.0)
		ActiveTime = Class'IRPR'.default.OversurrectionLifeTime;
	if (Class'IRPR'.default.OversurrectionTurretRotRate > 0.0)
		TurretRotRate = Class'IRPR'.default.OversurrectionTurretRotRate;
	if (Class'IRPR'.default.OversurrectionFireCycleRate > 0.0)
		FireCycleRate = Class'IRPR'.default.OversurrectionFireCycleRate;
	if (Class'IRPR'.default.OversurrectionLaserPrepareTime > 0.0)
		LaserPrepareTime = Class'IRPR'.default.OversurrectionLaserPrepareTime;
	if (Class'IRPR'.default.OversurrectionLaserCooldownTime > 0.0)
		LaserCooldownTime = Class'IRPR'.default.OversurrectionLaserCooldownTime;
	if (Class'IRPR'.default.OversurrectionLaserFireMaxTime > 0.0)
		LaserFireMaxTime = Class'IRPR'.default.OversurrectionLaserFireMaxTime;
	if (Class'IRPR'.default.OversurrectionScanEnemiesRadius > 0.0)
		ScanEnemiesRadius = Class'IRPR'.default.OversurrectionScanEnemiesRadius;
	if (Class'IRPR'.default.OversurrectionRangedEnemiesPeriph > 0.0)
		RangedEnemiesPeriph = Class'IRPR'.default.OversurrectionRangedEnemiesPeriph;
	if (Class'IRPR'.default.OversurrectionAttackMinPeriph > 0.0)
		AttackMinPeriph = Class'IRPR'.default.OversurrectionAttackMinPeriph;
	if (Class'IRPR'.default.OversurrectionLaserDamage > 0)
		LaserDamage = Class'IRPR'.default.OversurrectionLaserDamage;
	if (Class'IRPR'.default.OversurrectionMaxWTTraces > 0)
		MaxWTTraces = Class'IRPR'.default.OversurrectionMaxWTTraces;
	if (Class'IRPR'.default.OversurrectionMaxWTTracePrecision > 0)
		MaxWTTracePrecision = Class'IRPR'.default.OversurrectionMaxWTTracePrecision;
	if (Class'IRPR'.default.OversurrectionMaxTraceRange > 0.0)
		MaxTraceRange = Class'IRPR'.default.OversurrectionMaxTraceRange;
	if (Class'IRPR'.default.OversurrectionMaxWTTraceDepth > 0.0)
		MaxWTTraceDepth = Class'IRPR'.default.OversurrectionMaxWTTraceDepth;
	if (Class'IRPR'.default.OversurrectionStopFireOdds > 0.0)
		StopFireOdds = Class'IRPR'.default.OversurrectionStopFireOdds;

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
local vector HL, HN, sPoint;
local Actor A;
local IRPRCBaseInitBaseCloudMaster irbIBCM;
local rotator R;

	startPrePivot = (BaseHeightTop + BaseHeightMiddle + 64.f) * DrawScale * vect(0,0,-1);
	startTurretPrePivot = -getMegaBaseOffsetFromGround() - DrawScale*(Class'IRPRCannon'.default.CannonHeight + 8.f)*vect(0,0,1);
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
		
		IRTBase = Spawn(Class'IRPRCTurretBase');
		InitMegaBaseTPart(IRTBase);
		IRTurret = Spawn(Class'IRPRCTurret');
		InitMegaBaseTPart(IRTurret);
		IRCannon = Spawn(Class'IRPRCannon');
		IRCannon.IRMB = Self;
		InitMegaBaseTPart(IRCannon);
		
		A = Trace(HL, HN, Location + startTurretPrePivot, Location, False);
		if (A == None)
		{
			HL = Location + startTurretPrePivot;
			HN = vect(0,0,1);
		}
		
		sPoint = HL + HN;
		R = rotator(HN);
		Spawn(Class'IRPRCBaseInitShake',,, sPoint);
		Spawn(Class'IRPRCBaseInitWallParts',,, sPoint, R);
		
		R = rot(0,0,0);
		irbIBCM = Spawn(Class'IRPRCBaseInitBaseCloudMaster',,, sPoint, R);
		Spawn(Class'IRPRCInitBaseCloud', irbIBCM,, sPoint, R);
		Spawn(Class'IRPRCInitBaseCloudB', irbIBCM,, sPoint, R);
	}
}

simulated function InitMegaBaseTPart(IRPRCTurretBase MPart)
{
	if (MPart == None)
		return;
	MPart.DrawScale = DrawScale;
	MPart.PrePivot = startTurretPrePivot + PrePivot;
	MPart.setRotAngRate(TurretRotRate);
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
	if (IRTBase != None)
		IRTBase.PrePivot = PPivot;
	if (IRTurret != None)
		IRTurret.PrePivot = PPivot;
	if (IRCannon != None)
		IRCannon.PrePivot = PPivot;
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
		BaseColPart[i] = Spawn(Class'IRPRCBaseColPart',,, vSpawn, rot(0,0,0));
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
		MiddleBaseColPart = Spawn(Class'IRPRCBaseColPart',,, vSpawn, rot(0,0,0));
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
		TurretColPart = Spawn(Class'IRPRCBaseColPart',,, vSpawn, rot(0,0,0));
		if (TurretColPart != None)
			TurretColPart.SetCollidingPart(TurretRadius*DrawScale, VSize(vEnd - vStart)*DrawScale/2, True);
	}
}


simulated function Timer()
{
local int i;

	if (IRBaseState == IRBS_Rising)
	{
		IRBaseState = IRBS_RisePause;
		SetTimer(RisePauseTime, False);
		SpawnCollision();
	}
	else if (IRBaseState == IRBS_RisePause)
	{
		IRBaseState = IRBS_Opening;
		SetTimer(OpeningTime - OpenLiftInterectTime, False);
		isAnimDoor = True;
		PlayAnim('OpenHalf1', 1/(OpeningTime/2), 0.0);
		DoSound(DoorsOpenSnd1);
		PrePivot = vect(0,0,0);
	}
	else if (IRBaseState == IRBS_Opening)
	{
		IRBaseState = IRBS_LoadLift;
		SetTimer(LoadLiftTime, False);
		DoSound(LiftStartSnd);
		AmbientSound = LiftAmbSnd;
	}
	else if (IRBaseState == IRBS_LoadLift)
	{
		IRBaseState = IRBS_LoadPause;
		SetTimer(LoadPause, False);
		DoSound(LiftEndSnd);
		AmbientSound = None;
		UpdateTPartsPrePivot();
		if (Level.NetMode != NM_DedicatedServer)
			Spawn(Class'IRPRCBaseMidShake');
		DoSound(CannonOpenSnd);
		if (IRCannon != None)
			IRCannon.OpenCannon(LoadPause);
	}
	else if (IRBaseState == IRBS_LoadPause)
	{
		IRBaseState = IRBS_Active;
		SetTimer(ActiveTime, False);
		SpawnTurretCollision();
		DoSound(LiftEndSnd);
		if (Level.NetMode != NM_DedicatedServer)
			Spawn(Class'IRPRCBaseMidShake');
	}
	else if (IRBaseState == IRBS_Active)
	{
		if (IRLaserState == IRLS_Preparing || IRLaserState == IRLS_Firing || (IRLaserState == IRLS_Cooldown && shutdownIRLStateControl == IRLS_Firing))
		{
			shutdownIRLStateControl = IRLaserState;
			if (IRLaserState == IRLS_Cooldown)
				SetTimer(LaserCooldownTime/2, False);
			else
				SetTimer(0.1, False);
		}
		else
		{
			IRBaseState = IRBS_SleepPause;
			SetTimer(SleepPauseTime, False);
			DoSound(CannonCloseSnd);
			if (IRCannon != None && IRTurret != None)
			{
				IRTurret.rotateTo(IRTurret.Rotation.Yaw);
				IRCannon.rotateTo(IRTurret.Rotation.Yaw, IRTurret.Rotation.Pitch);
				IRCannon.CloseCannon(SleepPauseTime);
				IRCannon.ClientStopFireLaser();
			}
		}
	}
	else if (IRBaseState == IRBS_SleepPause)
	{
		IRBaseState = IRBS_SleepDown;
		SetTimer(SleepDownTime, False);
		DoSound(LiftStartSnd);
		AmbientSound = LiftAmbSnd;
		if (Level.NetMode != NM_DedicatedServer)
			Spawn(Class'IRPRCBaseMidShake');
		if (TurretColPart != None)
			TurretColPart.Destroy();
		TurretColPart = None;
	}
	else if (IRBaseState == IRBS_SleepDown)
	{
		IRBaseState = IRBS_Closing;
		SetTimer(ClosingTime - CloseDownInterectTime, False);
		isAnimDoor = True;
		PlayAnim('CloseHalf1', 1/(ClosingTime/2), 0.0);
		AmbientSound = None;
		DoSound(DoorsCloseSnd1);
	}
	else if (IRBaseState == IRBS_Closing)
	{
		IRBaseState = IRBS_ClosePause;
		SetTimer(ClosePauseTime, False);
	}
	else if (IRBaseState == IRBS_ClosePause)
	{
		IRBaseState = IRBS_Sinking;
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
	else if (IRBaseState == IRBS_Sinking)
		Destroy();
	tCount = 0.0;
}

simulated function AnimEnd()
{
	if (isAnimDoor)
	{
		if (IRBaseState == IRBS_Opening)
		{
			PlayAnim('OpenHalf2', 1/(OpeningTime/2), 0.0);
			DoSound(DoorsOpenSnd2);
		}
		else if (IRBaseState == IRBS_Closing)
		{
			PlayAnim('CloseHalf2', 1/(ClosingTime/2), 0.0);
			DoSound(DoorsCloseSnd2);
		}
		isAnimDoor = False;
	}
}


simulated function Tick(float Delta)
{
local bool compensatePing, isgrt, isUpdate;
local int syncPhase;

	if (!hasInit && Rotation != rot(0,0,0))
	{
		hasInit = True;
		if (Level.NetMode != NM_StandAlone && Level.NetMode != NM_DedicatedServer)
			InitMegaBase();
	}

	tCount += Delta;
	if (IRBaseState == IRBS_Active)
	{
		if (Role == ROLE_Authority)
		{
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
			
			if (IRLaserState > IRLS_Idle && laserTCount > 0.0)
			{
				laserTCount -= Delta;
				if (laserTCount <= 0.0)
				{
					if (IRLaserState == IRLS_Firing)
						LaserStop();
					else if (IRLaserState == IRLS_Cooldown)
						IRLaserState = IRLS_Idle;
				}
				else if (IRLaserState == IRLS_Firing)
					ProcessTraceLaser();
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
				if (IRTurret != None)
				{
					IRTurret.rotateTo(clientRotToYaw);
					if (compensatePing)
						IRTurret.Tick(localPlayer.PlayerReplicationInfo.Ping / 1000.f);
				}
				if (IRCannon != None)
				{
					IRCannon.rotateTo(clientRotToYaw, clientRotToPitch);
					if (compensatePing)
						IRCannon.Tick(localPlayer.PlayerReplicationInfo.Ping / 1000.f);
				}
			}
			
			if (IRCannon != None && (Abs(IRCannon.rotPitch - curToPitch) >= syncMaxPitchDif || Abs(IRCannon.rotYaw - curToYaw) >= syncMaxYawDif))
			{
				IRCannon.adjustSyncRot(clientRotToYaw, curToYaw, clientRotToPitch, curToPitch);
				if (IRTurret != None)
					IRTurret.adjustSyncRot(clientRotToYaw, curToYaw);
			}
		}
	}
	else if (IRBaseState == IRBS_Rising)
	{
		UpdateMainPrePivot(((RisingTime - tCount)/RisingTime) * startPrePivot);
		UpdateTPartsPrePivot(startTurretPrePivot + PrePivot);
	}
	else if (IRBaseState == IRBS_Sinking)
	{
		UpdateMainPrePivot((tCount/SinkingTime) * startPrePivot);
		UpdateTPartsPrePivot(startTurretPrePivot + PrePivot);
	}
	else if (IRBaseState == IRBS_LoadLift)
		UpdateTPartsPrePivot(((LoadLiftTime - tCount)/LoadLiftTime) * startTurretPrePivot);
	else if (IRBaseState == IRBS_SleepDown)
		UpdateTPartsPrePivot((tCount/SleepDownTime) * startTurretPrePivot);
		
	if (Level.NetMode != NM_DedicatedServer && IRPRCannonSync != IRPRCannonSyncClient)
	{
		IRPRCannonSyncClient = IRPRCannonSync;
		if (IRCannon != None)
		{
			syncPhase = (IRPRCannonSyncClient % 3);
			if (syncPhase == 1)
				IRCannon.ClientPrepareFireLaser();
			else if (syncPhase == 2)
				IRCannon.ClientStartFireLaser(LaserFireMaxTime);
			else
				IRCannon.ClientStopFireLaser();
		}
	}
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
		LaserPrepare();
		if ((Normal(CurVictim.Location - Location) dot vector(R)) >= AttackMinPeriph && LaserReady())
			LaserFire();
		else
		{
			R = rotator(CurVictim.Location - Location);
			rotateToYaw = R.Yaw;
			rotateToPitch = R.Pitch;
			normalizeCurToRot();
		}
	}
	else if (!processNextTarget())
	{
		if (IRLaserState == IRLS_Preparing || (IRLaserState == IRLS_Firing && FRand() <= StopFireOdds))
			LaserStop();
		if (FRand() <= IdleRotateOdds)
		{
			rotateToYaw = int((FRand()*2-1) * 32768);
			rotateToPitch = int((FRand()*1.0-0.2) * Class'IRPRCannon'.default.PitchLimitUp / 1.5);
			normalizeCurToRot();
		}
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

function Pawn getNextTarget(optional out Pawn RangedVictims[16], optional out int RangedVictimsFound)
{
local Pawn P, PList[64];
local int pawnsAmount, i;
local float minDist, maxDist, dist;
local rotator R;
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
		isVPawn = (isVPawn && R.Pitch > Class'IRPRCannon'.default.PitchLimitDown && R.Pitch < Class'IRPRCannon'.default.PitchLimitUp);
		isVPawn = (isVPawn && VSize(P.Location - Location) > Class'IRPRCannon'.default.CannonLength);
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


function LaserPrepare()
{
	if (IRLaserState != IRLS_Idle)
		return;
	IRLaserState = IRLS_Preparing;
	IRPRCannonSync++;
	while (IRPRCannonSync % 3 != 1)
		IRPRCannonSync++;
	laserTCount = LaserPrepareTime;
}

function LaserFire()
{
	if (IRLaserState != IRLS_Preparing)
		return;
	IRLaserState = IRLS_Firing;
	IRPRCannonSync++;
	while (IRPRCannonSync % 3 != 2)
		IRPRCannonSync++;
	laserTCount = LaserFireMaxTime;
}

function LaserStop()
{
	if (IRLaserState != IRLS_Preparing && IRLaserState != IRLS_Firing)
		return;
	IRLaserState = IRLS_Cooldown;
	IRPRCannonSync++;
	while (IRPRCannonSync % 3 != 0)
		IRPRCannonSync++;
	laserTCount = LaserCooldownTime;
}

function bool LaserReady()
{
	return (IRLaserState == IRLS_Preparing && laserTCount <= 0.0);
}


simulated function ProcessTraceLaser(optional IRPRCannon refClientCallback)
{
local int i;
local float remainingWallThickness, remainingDistance;
local float precisionComp, precisionDist;
local bool canWallIn, hitSomething;
local vector X, StartTrace, EndTrace, HitLocation, HitNormal, LastHitLoc;
local Actor Other;
local rotator R;

	//Shot initialization
	i = MaxWTTraces;
	remainingWallThickness = MaxWTTraceDepth;
	remainingDistance = MaxTraceRange;
	if (refClientCallback != None)
		R = refClientCallback.Rotation;
	else
	{
		R.Yaw = curToYaw;
		R.Pitch = curToPitch;
	}
	X = vector(R);
	if (remainingDistance <= 0)
		return;
	
	if (pnt == None && MaxWTTraceDepth > 0 && MaxWTTraces > 0)
	{
		pnt = Spawn(Class'NWPoint');
		if (pnt == None || pnt.bDeleteMe)
			return;
		pnt.SetCollisionSize(0,0);
		pnt.bCollideWorld = True;
	}
	
	do
	{
		//Starting position
		if (i == MaxWTTraces)
		{
			StartTrace = Location + (Class'IRPRCannon'.default.CannonLength * X);
			EndTrace = StartTrace + (remainingDistance * X);
		}
		else
		{
			StartTrace = HitLocation;
			precisionDist = MaxWTTraceDepth / (1.f * MaxWTTracePrecision);
			canWallIn = False;
			while (!canWallIn && remainingWallThickness > 0)
			{
				StartTrace += (precisionDist * X);
				remainingWallThickness -= precisionDist;
				remainingDistance -= precisionDist;
				if (pnt.SetLocation(StartTrace))
					canWallIn = True;
			}
			
			if (!canWallIn)
				break;
			
			Other = Trace(HitLocation, HitNormal, StartTrace - MaxWTTraceDepth*X, StartTrace, False);
			if (Other == None)
			{
				HitLocation = StartTrace - MaxWTTraceDepth*X;
				HitNormal = Normal(X);
			}
			else if (Level.NetMode != NM_DedicatedServer && refClientCallback != None)
				refClientCallback.ClientProcessOther(Other, HitLocation, HitNormal, StartTrace, True);
			
			precisionComp = VSize(StartTrace - HitLocation + HitNormal*2);
			remainingDistance += precisionComp;
			remainingWallThickness += precisionComp;
			StartTrace = HitLocation + HitNormal*2;
		}
		
		//Shot
		hitSomething = False;
		ForEach TraceActors(Class'Actor', Other, HitLocation, HitNormal, EndTrace, StartTrace)
		{
			if (refClientCallback == None && Role == ROLE_Authority && Other != Instigator && 
			(Other.bProjTarget || Other.bBlockActors || Other.bBlockPlayers) && (Pawn(Other) == None || !isFriendlyPawn(Pawn(Other))))
				ProcessTraceHit(Other, HitLocation, HitNormal);
			hitSomething = True;
			LastHitLoc = HitLocation;
		}
		
		if (!hitSomething)
		{
			HitLocation = EndTrace;
			LastHitLoc = EndTrace;
			HitNormal = Normal(StartTrace - EndTrace);
		}
		remainingDistance -= VSize(LastHitLoc - StartTrace);
		
		//Process shot
		if (Level.NetMode != NM_DedicatedServer && refClientCallback != None)
			refClientCallback.ClientProcessOther(Other, LastHitLoc, HitNormal, StartTrace);
		i--;
	}
	until (i < 0 || remainingWallThickness <= 0 || remainingDistance <= 0);
}


function ProcessTraceHit(Actor Other, vector HitLocation, vector HitNormal)
{
	if (Other != None)
		Other.TakeDamage(LaserDamage, Instigator, HitLocation, vect(0,0,0), LaserDamageType);
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
	
	if (pnt != None)
		pnt.Destroy();
	if (MiddleBaseColPart != None)
		MiddleBaseColPart.Destroy();
	if (TurretColPart != None)
		TurretColPart.Destroy();
	if (IRTBase != None)
		IRTBase.Destroy();
	if (IRTurret != None)
		IRTurret.Destroy();
	if (IRCannon != None)
	{
		IRCannon.IRMB = None;
		IRCannon.Destroy();
	}
	
	pnt = None;
	MiddleBaseColPart = None;
	TurretColPart = None;
	IRTBase = None;
	IRTurret = None;
	IRCannon = None;
	
	Super.Destroyed();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRCMegaBase
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
	SleepPauseTime=1.000000
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
	
	InitSound=IRPRCBInit
	DoorsOpenSnd1=IRPRCBDoorsOpen1
	DoorsOpenSnd2=IRPRCBDoorsOpen2
	DoorsCloseSnd1=IRPRCBDoorsOpen2
	DoorsCloseSnd2=IRPRCBDoorsOpen1
	LiftAmbSnd=IRPRCBTurretLiftAmb
	LiftStartSnd=IRPRCBTurretLiftStart
	LiftEndSnd=IRPRCBTurretLiftEnd
	CannonOpenSnd=IRPRCannonOpen
	CannonCloseSnd=IRPRCannonOpen
	
	TurretRotRate=6500.000000
	FireCycleRate=1.000000

	ScanEnemiesRadius=40000.000000
	RangedEnemiesPeriph=0.500000
	AttackMinPeriph=0.900000
	LaserPrepareTime=2.000000
	LaserCooldownTime=3.500000
	LaserFireMaxTime=6.000000
	IdleRotateOdds=0.150000
	StopFireOdds=0.250000
	
	LaserDamage=1000
	LaserDamageType=Laser
	MaxWTTraces=5
	MaxTraceRange=40000.000000
	MaxWTTraceDepth=1024.000000
	MaxWTTracePrecision=16
	
	syncMaxPitchDif=3600.000000
	syncMaxYawDif=2400.000000
}
