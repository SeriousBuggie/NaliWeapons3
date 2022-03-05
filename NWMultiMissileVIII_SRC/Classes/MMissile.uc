//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher Missile main class
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MMissile expands NaliProjectile
abstract;

#exec MESH IMPORT MESH=MMissile ANIVFILE=MODELS\MMissile_a.3d DATAFILE=MODELS\MMissile_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MMissile STRENGTH=0.1
#exec MESH ORIGIN MESH=MMissile X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=MMissile SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=MMissile SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMissile SEQ=OpenWings STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMissile SEQ=CloseWings STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMissile SEQ=OpenedWings STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMissile SEQ=ClosedWings STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MMissile MESH=MMissile
#exec MESHMAP SCALE MESHMAP=MMissile X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=MissileSk01 FILE=SKINS\MissileSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MMissile NUM=1 TEXTURE=MissileSk01

#exec TEXTURE IMPORT NAME=MissileSk02 FILE=SKINS\MissileSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MMissile NUM=2 TEXTURE=MissileSk02
#exec MESHMAP SETTEXTURE MESHMAP=MMissile NUM=3 TEXTURE=MissileSk02

#exec AUDIO IMPORT NAME="MMFly" FILE=SOUNDS\MMFly.wav GROUP="Missile"
#exec AUDIO IMPORT NAME="MMSpawn" FILE=SOUNDS\MMSpawn.wav GROUP="Missile"

var() float SeekUpdateRate;
var float updateC;
var() float SeekTurnRate;
var() bool bDestroyWhenNoPawnTarget;

var bool bStartedMission, bHaveTarget;
var actor LTarget;

replication
{
	// Things the server should send to the client.
	reliable if(Role==ROLE_Authority)
		LTarget;
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetRotation(Rotation + rot(0,0,8192));
	PlayAnim('OpenWings', 1.25, 0.0);
	SetTimer(0.05, True);
}

simulated function Tick( float Delta)
{
local vector Dir, TrgtLoc, SeekDir;
local float VelMag;
local rotator oldRoll;

	if (LTarget != None)
	{
		updateC += Delta;
		if (updateC >= SeekUpdateRate)
		{
			updateC = 0.0;
			if (!Class'MultiMissile'.static.isValidTarget(LTarget))
			{
				if (Role == ROLE_Authority)
					LTarget = None;
				if (bDestroyWhenNoPawnTarget)
					Explode(Location,vect(0,0,1));
				return;
			}
			
			TrgtLoc = LTarget.Location;
			VelMag = VSize(Velocity);
			Dir = vector(Rotation);
			oldRoll.Roll = Rotation.Roll;
			SeekDir = Normal(Normal(TrgtLoc - Location) * SeekTurnRate * VelMag + Velocity);
			Velocity = VelMag * SeekDir;
			SetRotation(rotator(SeekDir) + oldRoll);
			Acceleration = SeekDir * ProjAccel;
		}
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MMissile
	DrawScale=1.000000
	AmbientGlow=96
	bUnlit=True
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	LightBrightness=85
	LightRadius=6
	LightHue=35
	LightSaturation=160
	bBounce=False
	bFixedRotationDir=True
	RotationRate=(Roll=32000)
	bNetTemporary=False
	SpawnSound=MMSpawn
	AmbientSound=MMFly
	SoundRadius=96
	SoundVolume=255
	SoundPitch=32
	
	ExplosionNoise=1.500000
	bClientOnlySmokeGen=True
	
	SeekUpdateRate=0.050000
	SeekTurnRate=0.350000
	
	TrailClass1=Class'MissileTrailA'
	TrailClass2=Class'MissileTrailB'
	enableSmokeGen=True
	SmokeClass=Class'UTSmokeTrail'
	SmokeGenRateMax=6.650000
	SmokeGenRateMin=5.750000
	
	bWaterHitFX=True
	WaterSplashType=2
	
	ProjAccel=25.000000
}
