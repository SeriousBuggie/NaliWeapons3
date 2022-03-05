//////////////////////////////////////////////////////////////
//				Feralidragon (03-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileMBoxMissile expands MMissile;

#exec MESH IMPORT MESH=MultiMissileMBoxMissile ANIVFILE=MODELS\MultiMissileMBoxMissile_a.3d DATAFILE=MODELS\MultiMissileMBoxMissile_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMissileMBoxMissile STRENGTH=0.15
#exec MESH ORIGIN MESH=MultiMissileMBoxMissile X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=MultiMissileMBoxMissile SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissileMBoxMissile SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMissileMBoxMissile MESH=MultiMissileMBoxMissile
#exec MESHMAP SCALE MESHMAP=MultiMissileMBoxMissile X=0.15 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=Sk_MultiMBoxMissile FILE=SKINS\Sk_MultiMBoxMissile.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileMBoxMissile NUM=1 TEXTURE=Sk_MultiMBoxMissile

#exec AUDIO IMPORT NAME="MMBoxMissileSpawn" FILE=SOUNDS\MMBoxMissileSpawn.wav GROUP="MMMissile"
#exec AUDIO IMPORT NAME="MMBoxMissileFly" FILE=SOUNDS\MMBoxMissileFly.wav GROUP="MMMissile"



function BeginPlay()
{
	Super.BeginPlay();
	PlaySound(SpawnSound,, 100,, 3500);
}

simulated function PostBeginPlay()
{
	Super(NaliProjectile).PostBeginPlay();
	SetTimer(0.05, True);
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	Spawn(class'MBoxMissileExplProj',,, HitLocation + HitNormal, rotator(HitNormal));
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function ExplodeOnWall(vector HitNormal, actor Wall)
{
	Spawn(Class'MBoxMissileWallParts',,, Location, rotator(HitNormal));
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=MultiMissileMBoxMissile
	DrawScale=1.000000
	AmbientGlow=0
	bUnlit=False
	LightRadius=16
	bFixedRotationDir=False
	RotationRate=(Roll=0)
	SpawnSound=MMBoxMissileSpawn
	AmbientSound=MMBoxMissileFly
	SoundRadius=255
	SoundVolume=255
	SoundPitch=64
	
	SeekUpdateRate=0.050000
	SeekTurnRate=0.150000
	
	ExplosionDecal=Class'MBoxMissileBlastDecal'
	TrailClass1=Class'MBoxMissileTrailA'
	TrailClass2=Class'MBoxMissileTrailB'
	enableSmokeGen=True
	SmokeClass=Class'MultiMissileMBoxMissileSmokeB'
	SmokeGenRateMax=15.000000
	SmokeGenRateMin=11.500000
	
	MyDamageType=ThermicExplosion
	DmgRadius=1200.000000
	speed=2000.000000
	MaxSpeed=3000.000000
	Damage=1000.000000
	MomentumTransfer=500000
	bProjTarget=False
	ExplosionNoise=5.000000
	
	CanHitInstigator=False
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	
	bWaterHitFX=True
	WaterSplashType=3
	ProjAccel=50.000000
}
