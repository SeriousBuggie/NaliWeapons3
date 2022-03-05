//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2013)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecOversSkel expands NaliWActor;

#exec MESH IMPORT MESH=TheExecOversSkel ANIVFILE=MODELS\TheExecOversSkel_a.3d DATAFILE=MODELS\TheExecOversSkel_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecOversSkel STRENGTH=0.1
#exec MESH ORIGIN MESH=TheExecOversSkel X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=All STARTFRAME=0 NUMFRAMES=152
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=Still STARTFRAME=51 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=StillAlt STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=Wake STARTFRAME=1 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=Scream STARTFRAME=21 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=CallScythes STARTFRAME=31 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=GetScythes STARTFRAME=41 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=PrepareAttackA STARTFRAME=51 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=DoAttackA STARTFRAME=61 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=StillAttackA STARTFRAME=71 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=PrepareAttackB STARTFRAME=81 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=DoAttackB STARTFRAME=91 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=StillAttackB STARTFRAME=101 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=PrepareAttackC STARTFRAME=111 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=DoAttackC STARTFRAME=121 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=StillAttackC STARTFRAME=131 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkel SEQ=Relax STARTFRAME=141 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=TheExecOversSkel MESH=TheExecOversSkel
#exec MESHMAP SCALE MESHMAP=TheExecOversSkel X=1.5 Y=1.5 Z=3.0

#exec TEXTURE IMPORT NAME=TheExecOversSkel_Sk01 FILE=SKINS\TheExecOversSkel_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheExecOversSkel NUM=1 TEXTURE=TheExecOversSkel_Sk01

#exec TEXTURE IMPORT NAME=TheExecOversSkel_Sk02 FILE=SKINS\TheExecOversSkel_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheExecOversSkel NUM=2 TEXTURE=TheExecOversSkel_Sk02

#exec TEXTURE IMPORT NAME=TheExecOversSkel_Sk03 FILE=SKINS\TheExecOversSkel_Sk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheExecOversSkel NUM=3 TEXTURE=TheExecOversSkel_Sk03

#exec AUDIO IMPORT NAME="TheExecSkelWake" FILE=SOUNDS\TheExecSkelWake.wav GROUP="Surrection"
#exec AUDIO IMPORT NAME="TheExecSkelScream" FILE=SOUNDS\TheExecSkelScream.wav GROUP="Surrection"
#exec AUDIO IMPORT NAME="TheExecSkelDebris01" FILE=SOUNDS\TheExecSkelDebris01.wav GROUP="Surrection"
#exec AUDIO IMPORT NAME="TheExecSkelDebris02" FILE=SOUNDS\TheExecSkelDebris02.wav GROUP="Surrection"
#exec AUDIO IMPORT NAME="TheExecSkelAttack" FILE=SOUNDS\TheExecSkelAttack.wav GROUP="Surrection"


var() float MinAliveTime;
var() float WakeDelay, WakeTime, ScreamPostDelay, WakeScreamTime;
var() float CallScythesTime, GetScythesTime, RatherScythesTime, RelaxTime, FinishTime, NoAttackTime;
var float LTime, cTime;
var TheExecOversSkelScythes MyScythes;
var int DesiredAttackYaw, StartingYaw;
var float YawTCount;

enum ESkelState
{
	SSS_WakingUp,
	SSS_Wake,
	SSS_Scream,
	SSS_ScreamPause,
	SSS_CallScythes,
	SSS_GetScythes,
	SSS_RatherScythes,
	SSS_Attacking,
	SSS_Relaxing,
	SSS_Finish
};
var ESkelState SurrectiveState;

var() sound WakeSnd, ScreamSnd, DebrisHeavySound, DebrisLightSound, AttackSnd;
var() float InitScythesDistFromBody;

struct sAttack
{
	var() float AttackRange, AttackDist;
	var() name PrepareAnim, AttackAnim, StillAnim;
	var() float PrepareTime, AttackTime, StillTime;
};
var() sAttack AttacksData[3];
var() float ScanEnemiesRadius;

enum ESkelAttackState
{
	SAS_Waiting,
	SAS_PrepareAttack,
	SAS_Attack,
	SAS_StillAttack,
};
var ESkelAttackState AttackState;
var byte curAttack, noAttackServerBeep, noAttackClientBeep;
var float noAttackWaitTCount;
var vector lastAtkLoc;
var byte serverAtkSync, clientAtkSync;


replication
{
	reliable if (Role == ROLE_Authority)
		LTime, DesiredAttackYaw, StartingYaw, AttackState, curAttack, noAttackServerBeep, lastAtkLoc, serverAtkSync;
	reliable if (Role == ROLE_Authority && YawTCount >= 0.0)
		YawTCount;
}


function BeginPlay()
{
	LTime = WakeDelay + WakeTime + ScreamPostDelay + WakeScreamTime + FMax(MinAliveTime, Class'TheExecutioner'.default.OversurrectionLifeTime) +
		CallScythesTime + GetScythesTime + RatherScythesTime + RelaxTime + FinishTime;
}

simulated function PostBeginPlay()
{
local vector sLoc;

	Super.PostBeginPlay();
	sLoc = getDebrisSpawnLoc();
	SpawnDebris(sLoc, True);
	SpawnSmokeBase(sLoc, True);
	if (Role == ROLE_Authority)
	{
		DesiredAttackYaw = Rotation.Yaw;
		StartingYaw = Rotation.Yaw;
	}
}

simulated function PlayLoudSound(sound S, optional Actor src)
{
local Actor sndSrc;

	if (S != None)
	{
		if (src == None)
			sndSrc = Self;
		else
			sndSrc = src;
		sndSrc.PlaySound(S, SLOT_None, 100.0, True, 15000.0);
		sndSrc.PlaySound(S, SLOT_Interface, 100.0, True, 15000.0);
		sndSrc.PlaySound(S, SLOT_Misc, 100.0, True, 15000.0);
		sndSrc.PlaySound(S, SLOT_Talk, 100.0, True, 15000.0);
	}
}

function PlayServerLoudSound(sound S, optional Actor src)
{
local Actor sndSrc;

	if (S != None)
	{
		if (src == None)
			sndSrc = Self;
		else
			sndSrc = src;
		sndSrc.PlaySound(S, SLOT_None, 100.0, True, 15000.0);
		sndSrc.PlaySound(S, SLOT_Interface, 100.0, True, 15000.0);
		sndSrc.PlaySound(S, SLOT_Misc, 100.0, True, 15000.0);
		sndSrc.PlaySound(S, SLOT_Talk, 100.0, True, 15000.0);
	}
}

function byte getNextAttack()
{
local Pawn P, PList[48];
local int pawnsAmount;
local float minDist, maxDist, dist;
local rotator R;
	
	if (Instigator == None)
		return 0;
	minDist = ScanEnemiesRadius;
	for (P = Level.PawnList; P != None; P = P.NextPawn)
	{
		dist = VSize(P.Location - Location);
		if (dist <= ScanEnemiesRadius && isValidPawn(P) && FastTrace(P.Location, Location) && !isFriendlyPawn(P))
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
		return 0;
	R = rotator(PList[Rand(pawnsAmount)].Location - Location);
	DesiredAttackYaw = R.Yaw;
	SetupStartingYaw(Rotation.Yaw);
	if (pawnsAmount > 5 && FRand() > 0.2)
		return 1;
	return Byte(Rand(3) + 1);
}

function SetupStartingYaw(int newYaw)
{
	StartingYaw = newYaw;
	if (Abs(StartingYaw - DesiredAttackYaw) > 32768)
		StartingYaw += (Class'NWUtils'.static.getSign(DesiredAttackYaw - StartingYaw)*65536);
}

simulated function bool isValidPawn(Pawn P)
{
	return (P != None && !P.bDeleteMe && P.Health > 0 && !P.bHidden && P.bCollideActors && P.bBlockActors);
}

function bool isFriendlyPawn(Pawn P)
{
	return Class'NWUtils'.static.isFriend(P, Level, Instigator,, True, True);
}

simulated function SpawnDebris(vector Loc, bool bHeavy, optional bool bSpawnInServer)
{
local NWWallFX nwWFX;

	if ((bSpawnInServer && Role != ROLE_Authority) || (!bSpawnInServer && Level.NetMode == NM_DedicatedServer))
		return;
	if (bHeavy)
	{
		nwWFX = Spawn(Class'TheExecSkelWallParts',,, Loc, rotator(vect(0,0,1)));
		if (bSpawnInServer)
			PlayServerSndFromSource(nwWFX, DebrisHeavySound);
		else
			PlayClientSndFromSource(nwWFX, DebrisHeavySound);
	}
	else
	{
		nwWFX = Spawn(Class'TheExecSkelBWallParts',,, Loc, rotator(vect(0,0,1)));
		if (bSpawnInServer)
			PlayServerSndFromSource(nwWFX, DebrisLightSound);
		else
			PlayClientSndFromSource(nwWFX, DebrisLightSound);
	}
	SpawnShake(Loc, bHeavy, bSpawnInServer);
}

simulated function PlayClientSndFromSource(Actor src, sound S)
{
	if (src != None && S != None)
		src.PlaySound(S,, 50.0,, 10000.0);
}

function PlayServerSndFromSource(Actor src, sound S)
{
	if (src != None && S != None)
		src.PlaySound(S,, 50.0,, 10000.0);
}

simulated function SpawnShake(vector Loc, bool bHeavy, optional bool bSpawnInServer)
{
	if ((bSpawnInServer && Role != ROLE_Authority) || (!bSpawnInServer && Level.NetMode == NM_DedicatedServer))
		return;
	if (bHeavy)
		Spawn(Class'TheExecSkelShake',,, Loc);
	else
		Spawn(Class'TheExecSkelBShake',,, Loc);
}

simulated function SpawnSmokeBase(vector Loc, bool bHeavy, optional bool bSpawnInServer)
{
local rotator R;
local TheExecOversBaseCloudMaster master;
local float smklf;
local vector smkvel;
local byte i;
local TheExecOversGroundSmk smk;

	if ((bSpawnInServer && Role != ROLE_Authority) || (!bSpawnInServer && Level.NetMode == NM_DedicatedServer))
		return;

	R.Yaw = Rand(16384);
	master = Spawn(Class'TheExecOversBaseCloudMaster',,, Loc, R);
	if (bHeavy)
	{
		Spawn(Class'TheExecOversBaseCloud', master,, Loc, R);
		Spawn(Class'TheExecOversBaseCloudB', master,, Loc, R);
		for (i = 0; i < 10; i++)
		{
			smkvel = (FRand()*500 + 150)*vect(0,0,1) + (FRand()*2-1)*300*vect(1,0,0) + (FRand()*2-1)*300*vect(0,1,0);
			smklf = (FRand()*2-1) * 1.5;
			smk = Spawn(Class'TheExecOversGroundSmk',,, Loc);
			smk.InitFX(smkvel, smklf);
			smk = Spawn(Class'TheExecOversGroundSmkB',,, Loc);
			smk.InitFX(smkvel, smklf);
		}
	}
	else
	{
		Spawn(Class'TheExecOversBaseCloudMini', master,, Loc, R);
		Spawn(Class'TheExecOversBaseCloudMiniB', master,, Loc, R);
	}
}

simulated function Tick(float Delta)
{
local rotator R;
local float f;

	cTime += Delta;
	if (SurrectiveState == SSS_WakingUp)
	{
		if (Level.NetMode != NM_DedicatedServer)
			PrePivot = default.PrePivot * ((WakeDelay - cTime) / WakeDelay);
		if (cTime >= WakeDelay)
		{
			SurrectiveState = SSS_Wake;
			PrePivot = vect(0,0,0);
			PlayServerAnim('Wake', 1/WakeTime);
			PlayLoudSound(WakeSnd);
			if (Level.NetMode != NM_DedicatedServer)
				Spawn(Class'TheExecSkelShakeLong');
		}
	}
	else if (SurrectiveState == SSS_ScreamPause && cTime >= (WakeDelay + WakeTime + ScreamPostDelay + WakeScreamTime))
	{
		SurrectiveState = SSS_CallScythes;
		PlayServerAnim('CallScythes', 1/CallScythesTime);
	}
	else if (SurrectiveState == SSS_GetScythes && cTime >= (WakeDelay + WakeTime + ScreamPostDelay + WakeScreamTime + CallScythesTime + GetScythesTime))
	{
		SurrectiveState = SSS_RatherScythes;
		PlayServerAnim('GetScythes', 1/RatherScythesTime);
	}
	else if (SurrectiveState == SSS_Attacking)
	{
		if (AttackState == SAS_Waiting)
		{
			if ((LTime - cTime) <= (RelaxTime + FinishTime))
			{
				SurrectiveState = SSS_Relaxing;
				PlayServerAnim('Relax', 1/RelaxTime);
			}
			else
			{
				if (Role == ROLE_Authority)
				{
					if (noAttackWaitTCount <= 0.0)
					{
						curAttack = getNextAttack();
						if (curAttack == 0)
						{
							noAttackWaitTCount = NoAttackTime;
							if (FRand() > 0.75)
							{
								DesiredAttackYaw += (Rand(8000)-4000);
								SetupStartingYaw(Rotation.Yaw);
								YawTCount = -FRand()*0.001;
							}
							noAttackServerBeep++;
						}
						else
						{
							AttackState = SAS_PrepareAttack;
							PlayServerAnim(AttacksData[curAttack-1].PrepareAnim, 1/AttacksData[curAttack-1].PrepareTime);
							YawTCount = -FRand()*0.001;
						}
					}
					else
						noAttackWaitTCount -= Delta;
				}
				
				if (Level.NetMode != NM_DedicatedServer && noAttackClientBeep != noAttackServerBeep)
				{
					noAttackClientBeep = noAttackServerBeep;
					if (FRand() > 0.75)
						TweenAnim('StillAlt', NoAttackTime*0.65);
				}
			}
		}
		else if (Level.NetMode != NM_DedicatedServer && clientAtkSync != serverAtkSync)
		{
			clientAtkSync = serverAtkSync;
			SpawnDebris(lastAtkLoc, curAttack == 3);
			SpawnSmokeBase(lastAtkLoc, curAttack == 3);
		}
		
		if (AttackState == SAS_PrepareAttack)
			f = AttacksData[curAttack-1].PrepareTime;
		else if (AttackState == SAS_Waiting)
			f = NoAttackTime;
		if (f > 0.0 && YawTCount < f && Rotation.Yaw != DesiredAttackYaw)
		{
			YawTCount += Delta;
			R = Rotation;
			R.Yaw = Int((YawTCount/f) * (DesiredAttackYaw - StartingYaw) + StartingYaw);
			if (YawTCount >= f)
			{
				R.Yaw = DesiredAttackYaw;
				if (Role == ROLE_Authority)
				{
					StartingYaw = DesiredAttackYaw;
					YawTCount = -FRand()*0.001;
				}
			}
		}
		else
		{
			R = Rotation;
			R.Yaw = DesiredAttackYaw;
		}
		SetRotation(R);
		
		if (MyScythes != None)
			MyScythes.SetRotation(Rotation);
	}
	else if (SurrectiveState == SSS_Finish)
	{
		if (cTime < FinishTime && Level.NetMode != NM_DedicatedServer)
			PrePivot = Class'TheExecOversSkelScythes'.default.PrePivot * (cTime / FinishTime);
		else if (cTime >= FinishTime && Role == ROLE_Authority)
			Destroy();
	}
}

simulated function AnimEnd()
{
local vector sLoc;

	if (SurrectiveState == SSS_Wake)
	{
		SurrectiveState = SSS_Scream;
		PlayServerAnim('Scream', 1/WakeScreamTime);
		PlayLoudSound(ScreamSnd);
		if (Level.NetMode != NM_DedicatedServer)
			Spawn(Class'TheExecSkelShakeStrong');
	}
	else if (SurrectiveState == SSS_Scream)
		SurrectiveState = SSS_ScreamPause;
	else if (SurrectiveState == SSS_CallScythes)
	{
		SurrectiveState = SSS_GetScythes;
		SpawnScythes();
	}
	else if (SurrectiveState == SSS_RatherScythes)
		SurrectiveState = SSS_Attacking;
	else if (SurrectiveState == SSS_Attacking)
	{
		if (AttackState == SAS_Waiting && AnimSequence == 'StillAlt')
			TweenAnim('Still', NoAttackTime*0.35);
		if (Role == ROLE_Authority)
		{
			if (AttackState == SAS_PrepareAttack)
			{
				PlayServerAnim(AttacksData[curAttack-1].AttackAnim, 1/AttacksData[curAttack-1].AttackTime);
				PlayServerLoudSound(AttackSnd);
				AttackState = SAS_Attack;
			}
			else if (AttackState == SAS_Attack)
			{
				performAttack();
				PlayServerAnim(AttacksData[curAttack-1].StillAnim, 1/AttacksData[curAttack-1].StillTime);
				AttackState = SAS_StillAttack;
			}
			else if (AttackState == SAS_StillAttack)
				AttackState = SAS_Waiting;
		}
	}
	else if (SurrectiveState == SSS_Relaxing)
	{
		SurrectiveState = SSS_Finish;
		cTime = 0.0;
		sLoc = getDebrisSpawnLoc();
		SpawnDebris(sLoc, True);
		SpawnSmokeBase(sLoc, True);
	}
}

function PlayServerAnim(name animName, float animRate)
{
	if (animName != '' && animRate > 0.0)
		PlayAnim(animName, animRate, 0.0);
}

function performAttack()
{
local int dmg;

	if (curAttack == 1)
	{
		if (Role == ROLE_Authority)
			performRadialDamage(Location, AttacksData[curAttack-1].AttackRange, Class'TheExecutioner'.default.OversurrectiveAttackDmgA, 'Decapitated', 0, 1.35);
	}
	else
	{
		lastAtkLoc = getAttackLoc(AttacksData[curAttack-1].AttackDist, CollisionHeight/2);
		serverAtkSync++;
		if (curAttack == 2)
			dmg = Class'TheExecutioner'.default.OversurrectiveAttackDmgB;
		else
			dmg = Class'TheExecutioner'.default.OversurrectiveAttackDmgC;
		performRadialDamage(lastAtkLoc, AttacksData[curAttack-1].AttackRange, dmg, Class'TheExecutioner'.default.ChargeDmgType, 25000, 1.0);
	}
}

function performRadialDamage(vector HitLoc, float MaxDist, int Dmg, name dmgName, int dmgMomentum, optional float periphFactor)
{
local Pawn P;
local float s;

	periphFactor -= 1.0;
	for (P = Level.PawnList; P != None; P = P.NextPawn)
	{
		if (VSize(P.Location - Location) <= MaxDist && (Normal(P.Location - Location) dot vector(Rotation)) >= periphFactor && 
		isValidPawn(P) && FastTrace(P.Location, Location) && !isFriendlyPawn(P))
		{
			s = VSize(P.Location - Location) / MaxDist;
			P.TakeDamage(s*Dmg, Instigator, P.Location, s*dmgMomentum*Normal(P.Location - Location), dmgName);
		}
	}
}

function vector getAttackLoc(float dist, float zOffset)
{
local vector HL, HN, E, S;
local Actor A;
	
	S = Location + zOffset*vect(0,0,1);
	E = S + vector(Rotation)*dist;
	A = Trace(HL, HN, E, S, False);
	if (A != None)
		return (HL + HN);

	S = E;
	E = S + 1.15*(CollisionHeight + zOffset)*vect(0,0,-1);
	A = Trace(HL, HN, E, S, False);
	if (A == None)
		return E;
	return (HL + HN);
}

simulated function vector getDebrisSpawnLoc()
{
local vector HL, HN, E;
local Actor A;

	E = Location + 1.5*CollisionHeight*vect(0,0,-1);
	A = Trace(HL, HN, E, Location, False);
	if (A == None)
		return E;
	return (HL + HN);
}

simulated function SpawnScythes()
{
local vector HL, HN, E, S;
local Actor A;

	if (Level.NetMode != NM_DedicatedServer)
		MyScythes = Spawn(Class'TheExecOversSkelScythes', Self);
	
	S = Location + ((InitScythesDistFromBody*vect(0,1,0)) >> Rotation);
	E = S + 1.5*CollisionHeight*vect(0,0,-1);
	A = Trace(HL, HN, E, S, False);
	if (A != None)
	{
		SpawnDebris(HL + HN, False);
		SpawnSmokeBase(HL + HN, False);
	}
		
	S = Location + ((InitScythesDistFromBody*vect(0,-1,0)) >> Rotation);
	E = S + 1.5*CollisionHeight*vect(0,0,-1);
	A = Trace(HL, HN, E, S, False);
	if (A != None)
	{
		SpawnDebris(HL + HN, False);
		SpawnSmokeBase(HL + HN, False);
	}
}

simulated function Destroyed()
{
	if (MyScythes != None)
		MyScythes.Destroy();
	MyScythes = None;
	
	Super.Destroyed();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheExecOversSkel
	
	AnimSequence=Wake
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	bClientAnim=True
	bCollideActors=True
	bBlockPlayers=True
	bBlockActors=True
	CollisionRadius=135.000000
	CollisionHeight=435.000000
	Physics=PHYS_None
	LifeSpan=0.000000
	bAlwaysRelevant=True
	bGameRelevant=True
	PrePivot=(Z=-560.000000)
	NetPriority=3.000000
	
	MinAliveTime=2.000000
	WakeDelay=0.350000
	WakeTime=2.550000
	WakeScreamTime=0.200000
	ScreamPostDelay=1.100000
	CallScythesTime=1.000000
	GetScythesTime=0.550000
	RatherScythesTime=0.350000
	RelaxTime=0.500000
	FinishTime=0.350000
	NoAttackTime=1.000000
	
	WakeSnd=TheExecSkelWake
	ScreamSnd=TheExecSkelScream
	DebrisHeavySound=TheExecSkelDebris01
	DebrisLightSound=TheExecSkelDebris02
	AttackSnd=TheExecSkelAttack
	
	InitScythesDistFromBody=625.000000
	ScanEnemiesRadius=3250.000000
	
	AttacksData(0)=(AttackRange=3250.000000,AttackDist=1.000000)
	AttacksData(0)=(PrepareAnim="PrepareAttackA",AttackAnim="DoAttackA",StillAnim="StillAttackA")
	AttacksData(0)=(PrepareTime=1.000000,AttackTime=0.350000,StillTime=1.000000)
	
	AttacksData(1)=(AttackRange=1500.000000,AttackDist=1665.000000)
	AttacksData(1)=(PrepareAnim="PrepareAttackB",AttackAnim="DoAttackB",StillAnim="StillAttackB")
	AttacksData(1)=(PrepareTime=1.000000,AttackTime=0.350000,StillTime=1.000000)
	
	AttacksData(2)=(AttackRange=2500.000000,AttackDist=1665.000000)
	AttacksData(2)=(PrepareAnim="PrepareAttackC",AttackAnim="DoAttackC",StillAnim="StillAttackC")
	AttacksData(2)=(PrepareTime=1.000000,AttackTime=0.350000,StillTime=1.000000)
}
