//////////////////////////////////////////////////////////////
//				Feralidragon (19-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerRocket expands NaliProjectile;

#exec MESH IMPORT MESH=IonizerRocket ANIVFILE=MODELS\IonizerRocket_a.3d DATAFILE=MODELS\IonizerRocket_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerRocket STRENGTH=0.0
#exec MESH ORIGIN MESH=IonizerRocket X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=IonizerRocket SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerRocket SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonizerRocket MESH=IonizerRocket
#exec MESHMAP SCALE MESHMAP=IonizerRocket X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_IonizerRocket FILE=SKINS\Sk_IonizerRocket.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerRocket NUM=1 TEXTURE=Sk_IonizerRocket

#exec AUDIO IMPORT NAME="IonRocketEngLoop" FILE=SOUNDS\IonRocketEngLoop.wav GROUP="IonizerRocket"
#exec AUDIO IMPORT NAME="IonRocketEngTakeoff" FILE=SOUNDS\IonRocketEngTakeoff.wav GROUP="IonizerRocket"
#exec AUDIO IMPORT NAME="IonRocketOpen" FILE=SOUNDS\IonRocketOpen.wav GROUP="IonizerRocket"


var() float AmbSoundStartTime;
var() float DeployOffsetLen;

var Ionizer IonizerOwner;
var IonizerLauncher IonLauncher;
var float SVolume;
var vector DeployLoc, StartLoc;

replication
{
	reliable if (Role == ROLE_Authority)
		PlayIonRocketOpenSound;
}

simulated function PostBeginPlay()
{
	PlaySound(Sound'IonRocketEngTakeoff',, 1000, True, 5000);
	SpawnIgnition();
	SetTimeOut1(0.2, True);
	SetupDestination();
	
	Super.PostBeginPlay();
	SetTimer(1.0, False);
}

function SetupDestination()
{
local vector HitLoc, HitNorm, End;
local Actor A;

	End = Location + Class'Ionizer'.default.MaxSatelliteHeight*vector(Rotation);
	A = Trace(HitLoc, HitNorm, End, Location, False);
	if (A == None)
		HitLoc = End;
	DeployLoc = HitLoc;
	StartLoc = Location;
}

function SpawnIgnition()
{
	Spawn(Class'IonRocketTakeoffCor',,, Location + (vect(-304,0,0) >> Rotation));
	Spawn(Class'IonRocketSmkTrailMaster',,, Location + ((SmokeXOffset*vect(1,0,0))>>Rotation));
}

function TimedOut1()
{
	Spawn(Class'IonRocketPassShake');
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && SVolume < 255)
	{
		SVolume += (Delta * 255 / AmbSoundStartTime);
		if (SVolume > 255)
			SVolume = 255;
		SoundVolume = Byte(SVolume);
	}
	
	if (Role == ROLE_Authority && VSize(DeployLoc)>0 && hasReachedDeployLoc())
		DeploySatellite();
	
	Super.Tick(Delta);
}

function bool hasReachedDeployLoc()
{
local float reachDif;
local vector vectDif;

	reachDif = FMax(Class'IonizerSatellite'.default.CollisionHeight, VSize(Velocity));
	vectDif = Normal(DeployLoc - StartLoc)*reachDif;
	return (VSize(StartLoc-Location) >= VSize(StartLoc-(DeployLoc-vectDif)));
}

function DeploySatellite()
{
local IonizerSatellite IoS;
	
	SpawnRocketParts();
	
	IoS = Spawn(Class'IonizerSatellite',,, Location + vector(Rotation)*DeployOffsetLen, rotator(-vector(Rotation)));
	IoS.InitSat(Velocity, Instigator);
	IoS.IonLauncher = IonLauncher;
	IoS.IonizerOwner = IonizerOwner;
	if (IonizerOwner != None)
		IonizerOwner.IonSat = IoS;
	Destroy();
}

function SpawnRocketParts()
{
local byte i;
local rotator R;
local IonizerRocketFuelBody iRfB;
local IonizerRocketShell iRS;

	iRfB = Spawn(Class'IonizerRocketFuelBody');
	iRfB.Velocity = Velocity * (FRand()/4 + 0.75);
	
	for (i = 0; i < 6; i++)
	{
		R = Rotation;
		R.Roll = Int(i*10922.666667);
		iRS = Spawn(Class'IonizerRocketShell',,,, R);
		iRS.Velocity = Velocity * (FRand()/2 + 0.5);
	}
	
	PlayIonRocketOpenSound();
}

function Abort()
{
local IonSatWreckedPiece ionwp;
local byte i;
local rotator R, myRot;

	SpawnRocketParts();
	
	myRot = rotator(-vector(Rotation));
	for (i = 0; i < ArrayCount(Class'IonizerSatellite'.default.WreckParts); i++)
	{
		if (Class'IonizerSatellite'.default.WreckParts[i].WreckClass != None)
		{	
			R.Roll = Class'IonizerSatellite'.default.WreckParts[i].WreckRollOffset;
			ionwp = Spawn(Class'IonizerSatellite'.default.WreckParts[i].WreckClass,,, 
				Location + (((Class'IonizerSatellite'.default.WreckParts[i].WreckOffset*DrawScale) >> R) >> myRot) + DeployOffsetLen*vector(Rotation), 
				myRot + R);
			ionwp.DrawScale = DrawScale;
			ionwp.SetVelocity(Normal(((Class'IonizerSatellite'.default.WreckParts[i].WreckOffset*DrawScale) >> myRot) + 
				VRand()*VSize(Class'IonizerSatellite'.default.WreckParts[i].WreckOffset*DrawScale)/3));
		}
	}
	
	PlaySound(Class'IonizerSatellite'.default.ExploSnd,,20.0,,6000.0);
	Spawn(Class'IonSatDmgExplShake');
	Spawn(Class'IonSatDmgExpl');
	for (i = 0; i < 5; i++)
		Spawn(Class'IonSatDmgExpl',,, Location + DeployOffsetLen*vector(Rotation) + 
			VRand()*FMax(Class'IonizerSatellite'.default.CollisionRadius, Class'IonizerSatellite'.default.CollisionHeight)*3);

	Destroy();
}

simulated function PlayIonRocketOpenSound()
{
	PlaySound(Sound'IonRocketOpen',, 1000,, 5000);
}

simulated function HitWall(vector HitNormal, actor Wall)
{
	DeploySatellite();
}

simulated function ProcessTouch (Actor Other, Vector HitLocation)
{
	if ((!CanHitInstigator || (CanHitInstigator && (Default.LifeSpan - LifeSpan) < HitInstigatorTimeOut)) && Other == Instigator)
		return;
	if (Other.IsA('Projectile') && !Other.bProjTarget)
		return;
	if (bDirectHit)
		DirectHurtProcess( Other, HitLocation);
}

simulated function ZoneChange(Zoneinfo NewZone)
{
local bool isWaterToDry;

	isWaterToDry = (NewZone.bWaterZone != bHitWater && (Default.LifeSpan - LifeSpan)>0.05);
	Super.ZoneChange(NewZone);
	if (isWaterToDry)
	{
		Velocity = 0.75 * MaxSpeed * Normal(Velocity);
		if (NewZone.bWaterZone)
			Velocity *= WaterSpeedScale;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerRocket
	DrawScale=1.000000
	bBounce=False
	bNetTemporary=False
	SpawnSound=None
	AmbientSound=IonRocketEngLoop
	SoundRadius=140
	SoundVolume=0
	SoundPitch=64
	
	ExplosionDecal=None
	MyDamageType=IonizerRocket
	DmgRadius=0.000000
	speed=10.000000
	MaxSpeed=2000.000000
	Damage=100000.000000
	MomentumTransfer=0
	bProjTarget=True
	ProjAccel=100.000000
	bNoHurtTeam=True
	bNeverHurtInstigator=False
	bDirectHit=True
	
	TrailClass1=Class'IonRocketTrailCor'
	TrailClass2=Class'IonizerRocketExhaust'
	enableSmokeGen=True
	SmokeClass=Class'IonRocketSmkTrailMaster'
	SmokeGenRateMax=0.350000
	SmokeGenRateMin=0.200000
	SmokeXOffset=-24.000000
	bClientOnlySmokeGen=True
	
	bWaterHitFX=True
	WaterSplashType=4
	WaterWaveSize=5.000000
	WaterSpeedScale=1.000000
	Mass=2000.000000
	
	LifeSpan=50000.000000
	
	AmbSoundStartTime=2.000000
	DeployOffsetLen=144.000000
}
