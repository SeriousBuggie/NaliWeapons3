//////////////////////////////////////////////////////////////
//				Feralidragon (19-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerLauncher expands NaliWActor;

#exec MESH IMPORT MESH=IonizerLauncher ANIVFILE=MODELS\IonizerLauncher_a.3d DATAFILE=MODELS\IonizerLauncher_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerLauncher STRENGTH=0.0
#exec MESH ORIGIN MESH=IonizerLauncher X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonizerLauncher SEQ=All STARTFRAME=0 NUMFRAMES=11
#exec MESH SEQUENCE MESH=IonizerLauncher SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerLauncher SEQ=Openned STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerLauncher SEQ=Openning STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonizerLauncher MESH=IonizerLauncher
#exec MESHMAP SCALE MESHMAP=IonizerLauncher X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_IonizerLauncher FILE=SKINS\Sk_IonizerLauncher.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerLauncher NUM=1 TEXTURE=Sk_IonizerLauncher

#exec TEXTURE IMPORT NAME=IonLauncherGlassRed FILE=SKINS\IonLauncherGlassRed.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=IonLauncherGlassBlue FILE=SKINS\IonLauncherGlassBlue.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=IonLauncherGlassGreen FILE=SKINS\IonLauncherGlassGreen.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=IonLauncherGlassYellow FILE=SKINS\IonLauncherGlassYellow.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="IonRocketEngStart" FILE=SOUNDS\IonRocketEngStart.wav GROUP="IonizerLauncher"


var() float FadeInTime;
var() float RocketOffset;
var() float LauncherRadius;
var() texture TeamGlass[4];
var() sound EngineStartSnd;
var() float GroundSmokeZOffset;

struct IonColKarma
{
	var() float ColRadius, ColHeight;
	var() vector PartOffset;
	var() rotator OriginOffsetVectRot;
	var IonizerLauncherColPart colPart;
};

var() IonColKarma IonizerColKarma[10];

struct IonTLights
{
	var() vector IonTeamLightOffset;
	var() rotator IonTeamLightRot;
	var IonizerLauncherLight IonTeamLight;
};

var() IonTLights IonTeamLights[9];

var float countDown;
var bool triggeredStart, hasLaunched;
var IonizerRocketPlaceHolder RocketHolder;
var IonizerRocket LaunchedRocket;
var Ionizer IonizerOwner;
var float launcherLifespan;
var bool isDestroying;
var IonizerRocketEngFX IonEngFX;

replication
{
	unreliable if (Role == ROLE_Authority)
		countDown;
	reliable if (Role == ROLE_Authority)
		launcherLifespan, isDestroying, RocketHolder, hasLaunched;
}

simulated function PostBeginPlay()
{
	ScaleGlow = 0.0;
	SpawnRockethold();
	SpawnKarmaCollision();
	StartCountdown();
	Super.PostBeginPlay();
}

function StartCountdown()
{
	countDown = FMax(3.0, Class'Ionizer'.default.SatelliteLaunchSeconds);
}

function SpawnKarmaCollision()
{
local byte i;
local vector vSpawn, vOffset, HitLoc, HitNorm;
local float nRadius, nHeight, dif;

	for (i = 0; i < ArrayCount(IonizerColKarma); i++)
	{
		if (IonizerColKarma[i].ColRadius > 0 && IonizerColKarma[i].ColHeight > 0)
		{
			vOffset = (IonizerColKarma[i].PartOffset >> IonizerColKarma[i].OriginOffsetVectRot);
			vSpawn = Location + vOffset;
			if (FastTrace(vSpawn, Location))
			{
				nHeight = IonizerColKarma[i].ColHeight;
				nRadius = IonizerColKarma[i].ColRadius;
			}
			else
			{
				Trace(HitLoc, HitNorm, vSpawn, Location, False);
				vSpawn = HitLoc + HitNorm;
				if (vOffset.Z != 0)
				{
					dif = vSpawn.Z - Location.Z;
					nHeight = dif * IonizerColKarma[i].ColHeight / vOffset.Z;
				}
				else
					nHeight = IonizerColKarma[i].ColHeight;
					
				if (vOffset.X != 0 || vOffset.Y != 0 )
				{
					dif = VSize((vSpawn - Location)*vect(1,1,0));
					nRadius = dif * IonizerColKarma[i].ColRadius / VSize(vOffset*vect(1,1,0));
				}
				else
					nRadius = IonizerColKarma[i].ColRadius;
			}
			
			if (nHeight > 0 && nRadius > 0)
			{
				IonizerColKarma[i].colPart = Spawn(Class'IonizerLauncherColPart',,, vSpawn, rot(0,0,0));
				if (IonizerColKarma[i].colPart != None)
					IonizerColKarma[i].colPart.SetCollidingPart(nRadius, nHeight);
			}
		}
	}
}

function SetTeamLights(byte team, optional Ionizer IOwner)
{
local byte i;

	if (team > 3)
		team = 0;
	
	Texture = TeamGlass[team];
	if (IonizerOwner == None && IOwner != None)
	{
		IonizerOwner = IOwner;
		if (IonizerOwner != None)
		{
			IonizerOwner.SetStatus(2);
			IonizerOwner.IonLauncher = Self;
		}
	}

	for (i = 0; i < ArrayCount(IonTeamLights); i++)
	{
		if (IonTeamLights[i].IonTeamLight == None)
			IonTeamLights[i].IonTeamLight = Spawn(Class'IonizerLauncherLight',,, Location + (IonTeamLights[i].IonTeamLightOffset >> IonTeamLights[i].IonTeamLightRot));
		if (IonTeamLights[i].IonTeamLight != None)
			IonTeamLights[i].IonTeamLight.SetTeam(team);
	}
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (isDestroying && ScaleGlow > 0)
			ScaleGlow -= (Delta*default.ScaleGlow/launcherLifespan);
		else if (ScaleGlow < default.ScaleGlow)
			ScaleGlow += (Delta*default.ScaleGlow/FadeInTime);
	}
	
	if (Role == ROLE_Authority)
		countDown -= Delta;
	if (countDown <= 3.0 && !triggeredStart)
	{
		triggeredStart = True;
		PlayEngineStart();
	}
	
	if (countDown <= 0 && !hasLaunched)
		Launch();
}

simulated function Launch()
{
	ServerLaunch();
	PlayAnim('Openning', 0.35, 0.0);
	SpawnSmokeBase();
}

function ServerLaunch()
{
local byte i;
local vector loc;

	hasLaunched = True;

	for (i = 0; i < ArrayCount(IonTeamLights); i++)
	{
		if (IonTeamLights[i].IonTeamLight != None)
			IonTeamLights[i].IonTeamLight.Destroy();
		IonTeamLights[i].IonTeamLight = None;
	}
	
	if (RocketHolder != None)
	{
		loc = RocketHolder.Location;
		RocketHolder.Destroy();
		RocketHolder = None;
		LaunchedRocket = Spawn(Class'IonizerRocket',,, loc, rot(16384,0,0));
		LaunchedRocket.IonizerOwner = IonizerOwner;
		LaunchedRocket.IonLauncher = Self;
		if (Class'Ionizer'.default.RocketTakeoffIgnitionDamage > 0)
			LaunchedRocket.HurtRadiusX(Class'Ionizer'.default.RocketTakeoffIgnitionDamage, 260.0, 'Burned', 0.0, LaunchedRocket.Location + (vect(-304,0,0) >> LaunchedRocket.Rotation));
	}
	
	if (IonizerOwner != None)
		IonizerOwner.SetStatus(3);
	Spawn(Class'IonRocketTakeoffShake');
}

function Abort()
{
local byte i;
local vector loc;

	hasLaunched = True;

	for (i = 0; i < ArrayCount(IonTeamLights); i++)
	{
		if (IonTeamLights[i].IonTeamLight != None)
			IonTeamLights[i].IonTeamLight.Destroy();
		IonTeamLights[i].IonTeamLight = None;
	}
	
	if (RocketHolder != None && !RocketHolder.bDeleteMe)
	{
		AbortRocket(RocketHolder);
		RocketHolder.Destroy();
		RocketHolder = None;
	}
	
	SetLauncherLifespan();
}

function AbortRocket(Actor Ref)
{
local IonSatWreckedPiece ionwp;
local byte i;
local rotator R, myRot;

	if (Ref == None)
		return;

	SpawnAbortedRocketParts(Ref);
	
	myRot = rotator(-vector(Ref.Rotation));
	for (i = 0; i < ArrayCount(Class'IonizerSatellite'.default.WreckParts); i++)
	{
		if (Class'IonizerSatellite'.default.WreckParts[i].WreckClass != None)
		{	
			R.Roll = Class'IonizerSatellite'.default.WreckParts[i].WreckRollOffset;
			ionwp = Spawn(Class'IonizerSatellite'.default.WreckParts[i].WreckClass,,, 
				Location + (((Class'IonizerSatellite'.default.WreckParts[i].WreckOffset*DrawScale) >> R) >> myRot) + 
				Class'IonizerRocket'.default.DeployOffsetLen*vector(Ref.Rotation), 
				myRot + R);
			if (ionwp != None)
			{
				ionwp.DrawScale = Ref.DrawScale;
				ionwp.SetVelocity(Normal(((Class'IonizerSatellite'.default.WreckParts[i].WreckOffset*DrawScale) >> myRot) + 
					VRand()*VSize(Class'IonizerSatellite'.default.WreckParts[i].WreckOffset*DrawScale)/3));
			}
		}
	}
	
	PlaySound(Class'IonizerSatellite'.default.ExploSnd,,20.0,,6000.0);
	Spawn(Class'IonSatDmgExplShake',,, Ref.Location);
	Spawn(Class'IonSatDmgExpl',,, Ref.Location);
	for (i = 0; i < 5; i++)
		Spawn(Class'IonSatDmgExpl',,, Ref.Location + Class'IonizerRocket'.default.DeployOffsetLen*vector(Ref.Rotation) + 
			VRand()*FMax(Class'IonizerSatellite'.default.CollisionRadius, Class'IonizerSatellite'.default.CollisionHeight)*3);
}

function SpawnAbortedRocketParts(Actor Ref)
{
local byte i;
local rotator R;

	Spawn(Class'IonizerRocketFuelBody',,, Ref.Location, Ref.Rotation);
	
	for (i = 0; i < 6; i++)
	{
		R = Ref.Rotation;
		R.Roll = Int(i*10922.666667);
		Spawn(Class'IonizerRocketShell',,,, R);
	}
}

function SetLauncherLifespan()
{
	launcherLifespan = Class'IonizerLauncherOutFX'.default.AppearTime;
	SetTimer(FMax(0.1, Class'Ionizer'.default.LauncherLifespan - launcherLifespan), False);
}

function Timer()
{
local IonizerLauncherOutFX ioux;
local byte team;

	if (isDestroying)
	{
		ioux = Spawn(Class'IonizerLauncherOutFX');
		if (Instigator != None && Instigator.PlayerReplicationInfo != None)
			team = Instigator.PlayerReplicationInfo.Team;
		ioux.SetTeam(team, IonizerOwner);
		Destroy();
	}
	else
	{
		isDestroying = True;
		SetTimer(launcherLifespan, False);
	}
}

function SpawnSmokeBase()
{
local rotator R;
local IonRocketBaseCloudMaster master;

	R.Yaw = Rand(16384);
	master = Spawn(Class'IonRocketBaseCloudMaster',,, Location + GroundSmokeZOffset*vect(0,0,1), R);
	Spawn(Class'IonRocketBaseCloud', master,, Location + GroundSmokeZOffset*vect(0,0,1), R);
	Spawn(Class'IonRocketBaseCloudB', master,, Location + GroundSmokeZOffset*vect(0,0,1), R);
}

simulated function PlayEngineStart()
{
	PlaySound(EngineStartSnd,, 1000,, 5000);
	if (Level.NetMode != NM_DedicatedServer && RocketHolder != None)
		IonEngFX = Spawn(Class'IonizerRocketEngFX',,, RocketHolder.Location, RocketHolder.Rotation);
}

function SpawnRockethold()
{
	RocketHolder = Spawn(Class'IonizerRocketPlaceHolder',,, Location + RocketOffset*vect(0,0,1), rot(16384,0,0));
}

simulated function Destroyed()
{
local byte i;
	
	for (i = 0; i < ArrayCount(IonizerColKarma); i++)
	{
		if (IonizerColKarma[i].colPart != None)
			IonizerColKarma[i].colPart.Destroy();
		IonizerColKarma[i].colPart = None;
	}
	
	for (i = 0; i < ArrayCount(IonTeamLights); i++)
	{
		if (IonTeamLights[i].IonTeamLight != None)
			IonTeamLights[i].IonTeamLight.Destroy();
		IonTeamLights[i].IonTeamLight = None;
	}
	
	if (RocketHolder != None)
		RocketHolder.Destroy();
	if (IonEngFX != None)
		IonEngFX.Destroy();
	
	if (IonizerOwner != None && Role == ROLE_Authority)
		IonizerOwner.IonLauncher = None;
		
	RocketHolder = None;
	IonEngFX = None;
	IonizerOwner = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerLauncher
	RemoteRole=ROLE_SimulatedProxy
	Texture=IonLauncherGlassRed
	bAlwaysRelevant=True
	
	FadeInTime=3.000000
	RocketOffset=456.000000
	LauncherRadius=259.000000
	EngineStartSnd=IonRocketEngStart
	GroundSmokeZOffset=80.000000
	
	TeamGlass(0)=IonLauncherGlassRed
	TeamGlass(1)=IonLauncherGlassBlue
	TeamGlass(2)=IonLauncherGlassGreen
	TeamGlass(3)=IonLauncherGlassYellow
	
	IonizerColKarma(0)=(ColRadius=260.000000,ColHeight=190.000000,PartOffset=(Z=-192.000000))
	IonizerColKarma(1)=(ColRadius=260.000000,ColHeight=10.000000,PartOffset=(Z=12.000000))
	IonizerColKarma(2)=(ColRadius=176.000000,ColHeight=10.000000,PartOffset=(Z=36.000000))
	IonizerColKarma(3)=(ColRadius=144.000000,ColHeight=10.000000,PartOffset=(Z=60.000000))
	IonizerColKarma(4)=(ColRadius=32.000000,ColHeight=160.000000,PartOffset=(X=112.000000,Z=256.000000),OriginOffsetVectRot=(Yaw=0))
	IonizerColKarma(5)=(ColRadius=32.000000,ColHeight=160.000000,PartOffset=(X=112.000000,Z=256.000000),OriginOffsetVectRot=(Yaw=21845))
	IonizerColKarma(6)=(ColRadius=32.000000,ColHeight=160.000000,PartOffset=(X=112.000000,Z=256.000000),OriginOffsetVectRot=(Yaw=-21845))
	IonizerColKarma(7)=(ColRadius=48.000000,ColHeight=272.000000,PartOffset=(X=-224.000000,Z=320.000000),OriginOffsetVectRot=(Yaw=0))
	IonizerColKarma(8)=(ColRadius=48.000000,ColHeight=272.000000,PartOffset=(X=-224.000000,Z=320.000000),OriginOffsetVectRot=(Yaw=21845))
	IonizerColKarma(9)=(ColRadius=48.000000,ColHeight=272.000000,PartOffset=(X=-224.000000,Z=320.000000),OriginOffsetVectRot=(Yaw=-21845))
	
	IonTeamLights(0)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=0))
	IonTeamLights(1)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=5461))
	IonTeamLights(2)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=-5461))
	IonTeamLights(3)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=16384))
	IonTeamLights(4)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=-16384))
	IonTeamLights(5)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=21845))
	IonTeamLights(6)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=-21845))
	IonTeamLights(7)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=27306))
	IonTeamLights(8)=(IonTeamLightOffset=(X=214.000000,Z=14.000000),IonTeamLightRot=(Yaw=-27306))
}
