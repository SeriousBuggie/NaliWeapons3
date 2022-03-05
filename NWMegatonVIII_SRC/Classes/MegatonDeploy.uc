//////////////////////////////////////////////////////////////
//	Nali Weapons III Megaton deployable
//				Feralidragon (18-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonDeploy expands NaliNuclearProjectile;

#exec MESH IMPORT MESH=MegatonDeploy ANIVFILE=MODELS\MegatonDeploy_a.3d DATAFILE=MODELS\MegatonDeploy_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonDeploy STRENGTH=0.0
#exec MESH ORIGIN MESH=MegatonDeploy X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MegatonDeploy SEQ=All STARTFRAME=0 NUMFRAMES=60
#exec MESH SEQUENCE MESH=MegatonDeploy SEQ=Openned STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDeploy SEQ=Closed STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDeploy SEQ=Openning STARTFRAME=29 NUMFRAMES=31 RATE=30.0
#exec MESH SEQUENCE MESH=MegatonDeploy SEQ=Closing STARTFRAME=0 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=MegatonDeploy MESH=MegatonDeploy
#exec MESHMAP SCALE MESHMAP=MegatonDeploy X=0.0712 Y=0.0712 Z=0.1424

#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeploy NUM=1 TEXTURE=Sk_Megaton01
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeploy NUM=2 TEXTURE=Sk_Megaton02
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeploy NUM=3 TEXTURE=Sk_Megaton03
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeploy NUM=4 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeploy NUM=5 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeploy NUM=6 TEXTURE=Megaton_N0

#exec AUDIO IMPORT NAME="MegaTon_Count" FILE=SOUNDS\MegaTon_Count.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="MegaTon_WarnCount" FILE=SOUNDS\MegaTon_WarnCount.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="MegaTon_FinalCount" FILE=SOUNDS\MegaTon_FinalCount.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="MegaTon_Impact" FILE=SOUNDS\MegaTon_Impact.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="Megaton_Tranform01" FILE=SOUNDS\Megaton_Tranform01.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="Megaton_Tranform02" FILE=SOUNDS\Megaton_Tranform02.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="Megaton_Tranform03" FILE=SOUNDS\Megaton_Tranform03.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="Megaton_Tranform04" FILE=SOUNDS\Megaton_Tranform04.wav GROUP="Megaton"


var() class<Actor> NuclearBlastClass;
var() float ZSpawnOffset, LandMinZ;
var() float HitWallDamping;
var() float TransformTime;
var() texture DigitParts[9];
var() texture NumbersTex[10];
var() sound TransformSnd[4], TickSnd, TickWarnSnd, TickFinalSnd;
var() localized string MegatonTransformString, MegatonDisarmString;
var() color disarmInfoColor;

var byte deploySeq;
var string Countdown, Password;
var float CountdownSeconds;
var bool canSpawnSmk;
var float smkCounter;

var MegatonAtom MAtom;
var MegatonPassCard MPassCard;

replication
{
	unreliable if (Role == ROLE_Authority)
		CountdownSeconds;
}

function BeginPlay()
{
local class<NuclearExplosions> nClass;

	Velocity = vect(0,0,-10);
	Acceleration = Normal(Velocity) * ProjAccel;
	if (Level.NetMode == NM_StandAlone || !bNetTemporary)
		bCanTeleport = Class'NWInfo'.default.bTeleProjectiles;
	
	if (SpawnSound != None)
		PlaySound(SpawnSound);
	
	nClass = Class<NuclearExplosions>(NuclearBlastClass);
	if (nClass != None)
	{
		CriticalImpactDist = nClass.default.NucleusRadius;
		DeathImpactDist = nClass.default.ShockRadius - (200*nClass.default.ShockRadius/nClass.default.ShockwaveBaseDamage);
		DangerousImpactDist = nClass.default.ShockRadius;
	}
	
	if (Instigator != None && Instigator.PlayerReplicationInfo != None)
	{
		ownerName = Instigator.PlayerReplicationInfo.PlayerName;
		savedTeam = Instigator.PlayerReplicationInfo.Team;
	}
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Role == ROLE_Authority && Instigator != None && Instigator.PlayerReplicationInfo != None)
	{
		if (MegatonDeployInner(Trail1) != None)
			MegatonDeployInner(Trail1).SetTeamSkin(Instigator.PlayerReplicationInfo.Team);
		if (MegatonDeployInnerOV(Trail2) != None)
			MegatonDeployInnerOV(Trail2).SetTeamOV(Instigator.PlayerReplicationInfo.Team);
	}
}

simulated function ProcessTouch (Actor Other, Vector HitLocation);

simulated function HitWall( vector HitNormal, actor Wall)
{
	if (Abs(HitNormal.Z) >= LandMinZ)
	{
		Velocity = vect(0,0,0);
		SetPhysics(PHYS_None);
		if (Mover(Wall) != None)
			SetBase(Wall);
		SetCollision(True, True, True);
		bProjTarget = True;
		GotoState('Deployed');
	}
	else if (VSize(Velocity) > 50.0)
	{
		Velocity = HitWallDamping*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
		speed = VSize(Velocity);
	}
}

function SpawnExplosionFX()
{
local NuclearExplosions nukeExpl;

	if (Role == ROLE_Authority)
	{
		nukeExpl = NuclearExplosions(Spawn(NuclearBlastClass,,, Location - (CollisionHeight-16)*vect(0,0,1), rot(0,0,0)));
		if (nukeExpl != None && ownerName != "")
		{
			nukeExpl.ownerName = ownerName;
			nukeExpl.savedTeam = savedTeam;
			nukeExpl.setShockDmgType(MyDamageType);
			nukeExpl.setNucleusDmgType(MyDamageType);
		}
	}
}

simulated function Transform(bool bArming)
{
	if (bArming)
		PlayAnim('Openning', 1/TransformTime, 0.0);
	else
		PlayAnim('Closing', 1/TransformTime, 0.0);
}

simulated function TweenToTransform(bool bArming)
{
	if (!bArming)
		TweenAnim('Openning', 0.1);
	else
		TweenAnim('Closing', 0.1);
}

function processDigits(string data)
{
local byte i;

	for (i = 0; i < 3; i++)
		MultiSkins[i+4] = NumbersTex[int(Mid(data, i, 1))];
}

function float getSeconds(string data)
{
local byte i;
local int t[3];

	for (i = 0; i < 3; i++)
		t[i] = int(Mid(data, i, 1));
	return t[0]*60 + t[1]*10 + t[2];
}

simulated function getMinutesSeconds(float sec, out int m, out int ss, out int s, out float ms)
{
local float c;

	c = sec;
	m = int(c/60);
	c -= (m*60);
	ss = int(c/10);
	c -= (ss*10);
	s = int(c);
	ms = (c-int(c)) * 1000;
}

function updateCountdown()
{
local int m, ss, s;
local float c, ms;
local string newCountdown;
	
	getMinutesSeconds(CountdownSeconds, m, ss, s, ms);
	newCountdown = string(m) $ string(ss) $ string(s);
	if (newCountdown != Countdown)
	{
		Countdown = newCountdown;
		processDigits(newCountdown);
		if (CountdownSeconds > 6 && TickSnd != None)
			PlaySound(TickSnd, SLOT_Misc, 12.0,,250.0);
		else if (CountdownSeconds >= 1 && TickWarnSnd != None)
			PlaySound(TickWarnSnd, SLOT_Misc, 12.0,,250.0);
		else if (CountdownSeconds < 1 && TickFinalSnd != None)
			PlaySound(TickFinalSnd, SLOT_Misc, 12.0,,250.0);
	}
}

function PlayTransformSound(byte i)
{
	if (i < ArrayCount(TransformSnd) && TransformSnd[i] != None)
		PlaySound(TransformSnd[i], SLOT_Misc, 12.0);
}

simulated function bool isBadZone(ZoneInfo Z)
{
	return (Z.DamagePerSec > 0 || Z.bKillZone);
}

simulated function Destroyed()
{
local MegatonDecoder MD;

	if (MAtom != None)
		MAtom.Destroy();
	MAtom = None;
	
	ForEach AllActors(Class'MegatonDecoder', MD)
	{
		if (MD.EnemyMDeploy == Self)
		{
			MD.DecodingLoc = vect(0,0,0);
			MD.EnemyMDeploy = None;
			MD.knowsCode = False;
		}
	}
		
	Super.Destroyed();
}

state Deployed
{
ignores HitWall, Landed;

	simulated function Timer()
	{
		deploySeq++;
		if (deploySeq >= 5)
			deploySeq = 0;
			
		if (deploySeq == 0)
		{
			MultiSkins[4] = DigitParts[6];
			MultiSkins[5] = DigitParts[0];
			MultiSkins[6] = DigitParts[3];
		}
		else if (deploySeq == 1)
		{
			MultiSkins[4] = DigitParts[1];
			MultiSkins[5] = DigitParts[0];
			MultiSkins[6] = DigitParts[4];
		}
		else if (deploySeq == 2)
		{
			MultiSkins[4] = DigitParts[0];
			MultiSkins[5] = DigitParts[8];
			MultiSkins[6] = DigitParts[0];
		}
		else if (deploySeq == 3)
		{
			MultiSkins[4] = DigitParts[4];
			MultiSkins[5] = DigitParts[0];
			MultiSkins[6] = DigitParts[1];
		}
		else if (deploySeq == 4)
		{
			MultiSkins[4] = DigitParts[5];
			MultiSkins[5] = DigitParts[0];
			MultiSkins[6] = DigitParts[2];
		}
		
	}
	
	function Tick(float Delta)
	{
		if (canSpawnSmk)
		{
			smkCounter += Delta;
			if (smkCounter >= 0.05)
			{
				smkCounter = 0.0;
				Spawn(Class'MegatonTransformSmoke', Self);
			}
		}
	}
	
Begin:
	if (ImpactSound != None)
		PlaySound(ImpactSound, SLOT_Misc, 12.0);
	SetTimer(0.1, True);
	Sleep(2.0);
	Transform(True);
	PlayTransformSound(0);
	Sleep(TransformTime/3);
	canSpawnSmk = True;
	PlayTransformSound(1);
	Sleep(TransformTime/3);
	PlayTransformSound(2);
	FinishAnim();
	canSpawnSmk = False;
	PlayTransformSound(3);
	SetTimer(0.0, False);
	if (Role == ROLE_Authority)
	{
		processDigits(Countdown);
		CountdownSeconds = getSeconds(Countdown);
		MAtom = Spawn(Class'MegatonAtom', Self,,, rot(0,0,0));
		if (MAtom != None && Instigator != None && Instigator.PlayerReplicationInfo != None)
			MAtom.SetTeam(Instigator.PlayerReplicationInfo.Team);
	}
	Sleep(1.0);
	GotoState('CountingDown');
}

state CountingDown
{
ignores HitWall, Landed;

	function Tick(float Delta)
	{
		if (CountdownSeconds > 0)
		{
			if (Class'Megaton'.default.bRealSeconds)
				CountdownSeconds -= (Delta/Level.TimeDilation);
			else
				CountdownSeconds -= Delta;
			updateCountdown();
			
			if (Class'Megaton'.default.bEnablePasswordCard && !isBadZone(Region.Zone) && (MPassCard == None || MPassCard.bDeleteMe))
			{
				MPassCard = Spawn(Class'MegatonPassCard');
				MPassCard.processDigits(Password);
				MPassCard.MDeploy = Self;
				MPassCard.DropFrom(MPassCard.getValidDropSpot(Self, 12));
			}
		}
		else if (!bDeleteMe)
		{
			SpawnExplosionFX();
			if (MPassCard != None)
				MPassCard.DestroyCard();
			Destroy();
		}
	}

Begin:
	TweenToTransform(True);
}

state Disarm
{
ignores HitWall, Landed;

	simulated function Timer()
	{
		deploySeq++;
		if (deploySeq >= 5)
			deploySeq = 0;
			
		if (deploySeq == 0)
		{
			MultiSkins[4] = DigitParts[6];
			MultiSkins[5] = DigitParts[0];
			MultiSkins[6] = DigitParts[3];
		}
		else if (deploySeq == 1)
		{
			MultiSkins[4] = DigitParts[1];
			MultiSkins[5] = DigitParts[0];
			MultiSkins[6] = DigitParts[4];
		}
		else if (deploySeq == 2)
		{
			MultiSkins[4] = DigitParts[0];
			MultiSkins[5] = DigitParts[8];
			MultiSkins[6] = DigitParts[0];
		}
		else if (deploySeq == 3)
		{
			MultiSkins[4] = DigitParts[4];
			MultiSkins[5] = DigitParts[0];
			MultiSkins[6] = DigitParts[1];
		}
		else if (deploySeq == 4)
		{
			MultiSkins[4] = DigitParts[5];
			MultiSkins[5] = DigitParts[0];
			MultiSkins[6] = DigitParts[2];
		}
		
	}
	
	function Tick(float Delta)
	{
		if (canSpawnSmk)
		{
			smkCounter += Delta;
			if (smkCounter >= 0.05)
			{
				smkCounter = 0.0;
				Spawn(Class'MegatonTransformSmoke', Self);
			}
		}
	}
	
Begin:
	if (Class'Megaton'.default.BroadcastDisarmMsg)
		BroadcastMessage(Class'Megaton'.default.DisarmMsg, True, 'CriticalEvent');
	if (MPassCard != None)
		MPassCard.DestroyCard();
	Sleep(2.0);
	if (Role == ROLE_Authority)
		CountdownSeconds = -1000000.0;
	if (MAtom != None)
		MAtom.SetDestroy();
	SetTimer(0.1, True);
	Transform(False);
	canSpawnSmk = True;
	PlayTransformSound(0);
	Sleep(TransformTime/3);
	PlayTransformSound(1);
	Sleep(TransformTime/3);
	PlayTransformSound(2);
	canSpawnSmk = False;
	FinishAnim();
	PlayTransformSound(3);
	SetTimer(0.0, False);
	if (Role == ROLE_Authority)
	{
		SetCollision(False, False, False);
		bCollideWorld = False;
		spawnMegatonCopy();
	}
	
	Destroy();
}

function spawnMegatonCopy()
{
local Megaton M;

	M = Spawn(Class'Megaton',,, Location - ZSpawnOffset*vect(0,0,1));
	M.cannotRespawn = True;
}

function bool acceptsTransmissionData(string data)
{
	if (!IsInState('CountingDown'))
		return False;
		
	if (data == Password)
	{
		GotoState('Disarm');
		return True;
	}
	
	return False;
}

simulated function string getNukeInfoText()
{
local int m, ss, s;
local float ms;
local string st1, st2;

	if (CountdownSeconds == -1000000.0)
		return MegatonDisarmString;
	else if (CountdownSeconds <= 0)
		return MegatonTransformString;
		
	getMinutesSeconds(CountdownSeconds, m, ss, s, ms);
	st1 = string(ss*10+s);
	st2 = string(int(ms/10));
	if ((ss*10+s) < 10)
		st1 = "0" $ st1;
	if (int(ms/10) < 10)
		st2 = "0" $ st2;
	
	return "0" $ string(m) $ ":" $ st1 $ ":" $ st2;
}

simulated function color getNukeInfoColor()
{
	if (CountdownSeconds == -1000000.0)
		return disarmInfoColor;
	if (CountdownSeconds > 0 && CountdownSeconds < 10)
		return warningInfoColor;
	return defaultInfoColor;
}



defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MegatonDeploy
	AnimSequence=Closed
	CollisionRadius=26.000000
	CollisionHeight=49.000000
	
	DrawScale=1.000000
	AmbientGlow=0
	bUnlit=False
	bBounce=True
	bNetTemporary=False
	SpawnSound=None
	AmbientSound=None
	ImpactSound=MegaTon_Impact
	
	ExplosionDecal=None
	MyDamageType=NuclearMega
	ExplosionNoise=50.000000
	
	bWaterHitFX=True
	WaterSplashType=3
	Mass=200.000000
	
	Physics=PHYS_Falling
	LifeSpan=100000.000000
	
	ZSpawnOffset=20.500000
	LandMinZ=0.650000
	HitWallDamping=0.350000
	TransformTime=4.200000
	TrailClass1=Class'MegatonDeployInner'
	TrailClass2=Class'MegatonDeployInnerOV'
	bSpawnServerTrail=True
	
	AmbientGlow=255
	bNoHurtTeam=True
	
	DigitParts(0)=Megaton_NEmpty
	DigitParts(1)=Megaton_NTrUp
	DigitParts(2)=Megaton_NTrUpRight
	DigitParts(3)=Megaton_NTrDownRight
	DigitParts(4)=Megaton_NTrDown
	DigitParts(5)=Megaton_NTrDownLeft
	DigitParts(6)=Megaton_NTrUpLeft
	DigitParts(7)=Megaton_NTrMiddle
	DigitParts(8)=Megaton_NTrUpDown
	NumbersTex(0)=Megaton_N0
	NumbersTex(1)=Megaton_N1
	NumbersTex(2)=Megaton_N2
	NumbersTex(3)=Megaton_N3
	NumbersTex(4)=Megaton_N4
	NumbersTex(5)=Megaton_N5
	NumbersTex(6)=Megaton_N6
	NumbersTex(7)=Megaton_N7
	NumbersTex(8)=Megaton_N8
	NumbersTex(9)=Megaton_N9
	
	TickSnd=MegaTon_Count
	TickWarnSnd=MegaTon_WarnCount
	TickFinalSnd=MegaTon_FinalCount
	TransformSnd(0)=Megaton_Tranform01
	TransformSnd(1)=Megaton_Tranform02
	TransformSnd(2)=Megaton_Tranform03
	TransformSnd(3)=Megaton_Tranform04
	
	defaultInfoText="--:--:--"
	MegatonTransformString="Arming..."
	MegatonDisarmString="Disarming..."
	disarmInfoColor=(R=0,G=255,B=0)
	
	ExplosionNoise=160.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelD'
	NuclearBlastClass=Class'NuclearExplosionLevelD'
	
	NuclearLevel=4
}
