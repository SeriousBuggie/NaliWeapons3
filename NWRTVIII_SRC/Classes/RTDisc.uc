//////////////////////////////////////////////////////////////
//				Feralidragon (13-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTDisc expands NaliWActor;


#exec MESH IMPORT MESH=RTDisc ANIVFILE=MODELS\RTDisc_a.3d DATAFILE=MODELS\RTDisc_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTDisc STRENGTH=0
#exec MESH ORIGIN MESH=RTDisc X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTDisc SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=RTDisc SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTDisc SEQ=Opening STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=RTDisc MESH=RTDisc
#exec MESHMAP SCALE MESHMAP=RTDisc X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=Sk_RTDisc FILE=SKINS\Sk_RTDisc.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RTDisc NUM=1 TEXTURE=Sk_RTDisc

#exec AUDIO IMPORT NAME="RTSurrectionTele" FILE=SOUNDS\RTSurrectionTele.wav GROUP="Surrection"
#exec AUDIO IMPORT NAME="RTSurrectionAmb" FILE=SOUNDS\RTSurrectionAmb.wav GROUP="Surrection"
#exec AUDIO IMPORT NAME="RTSurrectionOpen" FILE=SOUNDS\RTSurrectionOpen.wav GROUP="Surrection"
#exec AUDIO IMPORT NAME="RTSurrectionClose" FILE=SOUNDS\RTSurrectionClose.wav GROUP="Surrection"


var() float RotYawRateMax, RotYawRateMin;
var() float InTime, OutTime, OpenTime, CloseTime, ActiveTimeDelay, MinAliveTime;
var() float SpinnersReleaseDelay, SpinnersDestroyDelay;
var() byte MinAmbSndPitch, MaxAmbSndPitch;
var() sound OpeningSnd, ClosingSnd, MegaTeleSnd;
var() float SpinnersSpawnDist;
var() float RotTInterv;
var bool bCalledPreEnd;
var float cTime, rotYawRate;
var float LTime, rotTCount;
var RTDiscOV rtDscOV;

enum sState
{
	SSS_Initial,
	SSS_Opening,
	SSS_Active,
	SSS_Closing,
	SSS_End,
};
var sState SurrectiveState;

enum spnState
{
	SPN_BeforeSpin,
	SPN_OnSpin,
	SPN_Attacking,
	SPN_EndWaiting,
	SPN_AfterSpin,
};
var spnState SpinnerState;

var RTSpinner Spinners[8];


replication
{
	reliable if (Role == ROLE_Authority)
		LTime;
}


function BeginPlay()
{
	LTime = InTime + OutTime + OpenTime + CloseTime + FMax(MinAliveTime, Class'RT'.default.OversurrectionLifeTime) + 
	ActiveTimeDelay*2 + SpinnersReleaseDelay + SpinnersDestroyDelay;
}

simulated function PostBeginPlay()
{
	rotYawRate = RotYawRateMax;
	SoundPitch = MaxAmbSndPitch;
	SpawnRotatingTeleFXStart();
}

simulated function SpawnRotatingTeleFXStart()
{
local int i;
local RTDiscRotFX rtDRFX;

	PlayTeleFXSnd();
	if (Level.NetMode != NM_DedicatedServer)
	{
		for (i = 0; i < 38; i++)
		{
			rtDRFX = Spawn(Class'RTDiscRotFX',,,, rot(0,0,0));
			rtDRFX.InitFX(i);
		}
		
		Spawn(Class'RTOversurCor');
		Spawn(Class'RTOversurCorLine');
		Spawn(Class'RTOversurFog');
		Spawn(Class'RTOversShake');
		rtDscOV = Spawn(Class'RTDiscOV', Self);
	}
}

simulated function SpawnRotatingTeleFXPreEnd()
{
local int i;
local RTDiscRotFX rtDRFX;

	if (Level.NetMode != NM_DedicatedServer)
	{
		for (i = 0; i < 38; i++)
		{
			rtDRFX = Spawn(Class'RTDiscRotFXB',,,, rot(0,0,0));
			rtDRFX.InitFX(i);
		}
		
		Spawn(Class'RTOversurCorB');
		Spawn(Class'RTOversurCorLineB');
		Spawn(Class'RTOversurFogB');
	}
}

function SpawnRotatingTeleFXEnd()
{
	PlayTeleFXSnd();
	Spawn(Class'RTOversurCorC');
	Spawn(Class'RTOversShake');
}


simulated function Tick(float Delta)
{
	rotTCount += Delta;
	while (rotTCount >= RotTInterv)
	{
		DiscUpdate(RotTInterv);
		rotTCount -= RotTInterv;
	}
}

simulated function DiscUpdate(float Delta)
{
	if (bDeleteMe)
		return;
	
	cTime += Delta;
	if (cTime <= InTime)
	{
		rotYawRate = (cTime/InTime) * (RotYawRateMin - RotYawRateMax) + RotYawRateMax;
		SoundPitch = Byte((cTime/InTime) * (MinAmbSndPitch - MaxAmbSndPitch) + MaxAmbSndPitch);
	}
	else if (LTime > 0.0 && (LTime - cTime) <= (CloseTime + OutTime) && SurrectiveState == SSS_Active)
	{
		PlayChange(False);
		SurrectiveState = SSS_Closing;
	}
	else if (LTime > 0.0 && (LTime - cTime) <= OutTime)
	{
		rotYawRate = ((LTime - cTime)/OutTime) * (RotYawRateMin - RotYawRateMax) + RotYawRateMax;
		SoundPitch = Byte(((LTime - cTime)/OutTime) * (MinAmbSndPitch - MaxAmbSndPitch) + MaxAmbSndPitch);
	}
	else
	{
		if (SurrectiveState == SSS_Initial)
		{
			PlayChange(True);
			SurrectiveState = SSS_Opening;
		}
		else if (SurrectiveState == SSS_Active)
		{
			if (SpinnerState == SPN_BeforeSpin && cTime >= (InTime + OpenTime + ActiveTimeDelay))
			{
				SpawnSpinners();
				SpinnerState = SPN_OnSpin;
			}
			else if (SpinnerState == SPN_OnSpin && cTime >= (InTime + OpenTime + ActiveTimeDelay + SpinnersReleaseDelay))
			{
				LaunchSpinners();
				SpinnerState = SPN_Attacking;
			}
			else if (SpinnerState == SPN_Attacking && (LTime - cTime) <= (OutTime + CloseTime + ActiveTimeDelay + SpinnersDestroyDelay))
			{
				ReturnSpinners();
				SpinnerState = SPN_EndWaiting;
			}
			else if (SpinnerState == SPN_EndWaiting && (LTime - cTime) <= (OutTime + CloseTime + ActiveTimeDelay))
			{
				DestroySpinners();
				SpinnerState = SPN_AfterSpin;
			}
		}

		rotYawRate = RotYawRateMin;
		SoundPitch = MinAmbSndPitch;
	}
	
	SetRotation(Rotation + rotYawRate*rot(0,1,0)*Delta);	
	if (LTime > 0.0)
	{
		if (Role == ROLE_Authority && cTime >= LTime)
		{
			SpawnRotatingTeleFXEnd();
			Destroy();
		}
		else if (!bCalledPreEnd && cTime >= (LTime - 3.0))
		{
			SpawnRotatingTeleFXPreEnd();
			bCalledPreEnd = True;
		}
	}
}

simulated function PlayChange(bool bOpening)
{
	if (bOpening)
	{
		PlayAnim('Opening', 1/OpenTime, 0.0);
		PlaySound(OpeningSnd,, 50.0,, 5000.0);
	}
	else
	{
		PlayAnim('Closing', 1/CloseTime, 0.0);
		PlaySound(ClosingSnd,, 50.0,, 5000.0);
	}
}

simulated function AnimEnd()
{
	if (SurrectiveState == SSS_Opening)
	{
		SurrectiveState = SSS_Active;
		AnimSequence = 'Closing';
		AnimFrame = 0.0;
	}
	else if (SurrectiveState == SSS_Closing)
		SurrectiveState = SSS_End;
}

function PlayTeleFXSnd()
{
	PlaySound(MegaTeleSnd,, 50.0,, 7500.0);
}

function SpawnSpinners()
{
local int i;
local rotator R;

	for (i = 0; i < ArrayCount(Spinners); i++)
	{
		R.Yaw = (i * 8192);
		Spinners[i] = Spawn(Class'RTSpinner', Self,, Location + (((vect(1,0,0)*SpinnersSpawnDist) >> R) >> Rotation), Class'NWUtils'.static.rTurn(R, Rotation));
		if (Spinners[i] != None)
			Spinners[i].InitRotStationary(i, SpinnersSpawnDist);
	}
}

function LaunchSpinners()
{
local byte i;

	for (i = 0; i < ArrayCount(Spinners); i++)
	{
		if (Spinners[i] != None)
			Spinners[i].Release();
	}
}

function ReturnSpinners()
{
local byte i;

	for (i = 0; i < ArrayCount(Spinners); i++)
	{
		if (Spinners[i] != None)
			Spinners[i].ReturnRotStationary();
	}
}

function DestroySpinners()
{
local byte i;

	for (i = 0; i < ArrayCount(Spinners); i++)
	{
		if (Spinners[i] != None && !Spinners[i].bDeleteMe)
		{
			Spinners[i].TeleportTo(Spinners[i].Location);
			Spinners[i].Destroy();
		}
		Spinners[i] = None;
	}
}

function byte getTeam()
{
	if (Instigator != None && Instigator.PlayerReplicationInfo != None && Instigator.PlayerReplicationInfo.Team < 4)
		return Instigator.PlayerReplicationInfo.Team;
	return 0;
}


simulated function Destroyed()
{
local byte i;

	for (i = 0; i < ArrayCount(Spinners); i++)
	{
		if (Spinners[i] != None)
			Spinners[i].Destroy();
		Spinners[i] = None;
	}

	if (rtDscOV != None)
		rtDscOV.Destroy();
	rtDscOV = None;
	
	Super.Destroyed();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTDisc
	
	AnimSequence=Opening
	Texture=RT_Metal
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	bClientAnim=True
	bCollideActors=True
	bBlockPlayers=True
	bBlockActors=True
	CollisionRadius=320.000000
	CollisionHeight=96.000000
	Physics=PHYS_None
	LifeSpan=0.000000
	bAlwaysRelevant=True
	bGameRelevant=True
	
	RotTInterv=0.010000
	RotYawRateMax=160000.000000
	RotYawRateMin=1000.000000
	InTime=7.500000
	OutTime=10.000000
	OpenTime=2.000000
	CloseTime=2.000000
	ActiveTimeDelay=1.000000
	MinAliveTime=2.000000
	SpinnersReleaseDelay=2.000000
	SpinnersDestroyDelay=3.000000
	
	AmbientSound=RTSurrectionAmb
	SoundVolume=255
	SoundRadius=255
	SoundPitch=128
	MinAmbSndPitch=8
	MaxAmbSndPitch=128
	
	OpeningSnd=RTSurrectionOpen
	ClosingSnd=RTSurrectionClose
	MegaTeleSnd=RTSurrectionTele
	
	SpinnersSpawnDist=325.000000
}