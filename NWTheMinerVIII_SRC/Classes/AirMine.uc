//////////////////////////////////////////////////////////////
//	Nali Weapons III Sea Mine
//				Feralidragon (31-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class AirMine expands NWMine;

#exec MESH IMPORT MESH=AirMine ANIVFILE=MODELS\AirMine_a.3d DATAFILE=MODELS\AirMine_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=AirMine STRENGTH=0.25
#exec MESH ORIGIN MESH=AirMine X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=AirMine SEQ=All STARTFRAME=0 NUMFRAMES=33
#exec MESH SEQUENCE MESH=AirMine SEQ=Still STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=AirMine SEQ=Open STARTFRAME=1 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=AirMine SEQ=Close STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=AirMine SEQ=Openned STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=AirMine SEQ=RotateOnce STARTFRAME=2 NUMFRAMES=31 RATE=31.0
#exec MESH SEQUENCE MESH=AirMine SEQ=RotateLoop STARTFRAME=2 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=AirMine MESH=AirMine
#exec MESHMAP SCALE MESHMAP=AirMine X=0.075 Y=0.075 Z=0.15

#exec TEXTURE IMPORT NAME=AirMineSk01 FILE=SKINS\AirMineSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=AirMine NUM=1 TEXTURE=AirMineSk01

#exec TEXTURE IMPORT NAME=AirMineSk01Red FILE=SKINS\AirMineSk01Red.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=AirMineSk01Blue FILE=SKINS\AirMineSk01Blue.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=AirMineSk01Green FILE=SKINS\AirMineSk01Green.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=AirMineSk01Yellow FILE=SKINS\AirMineSk01Yellow.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=TheMinerMetal FILE=SKINS\TheMinerMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="MineDeploy06" FILE=SOUNDS\MineDeploy06.wav GROUP="Deploy"


function PreBeginPlay()
{
	Super.PreBeginPlay();
	MineHealth = Class'TheMiner'.default.armorAir;
}

simulated function PostBeginPlay()
{
	PlayAnim('Still', 1.0, 0.0);
	SetTimeOut2(1.0);
	Super.PostBeginPlay();
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
local byte i;
local vector v;

	Spawn(Class'MineExplosionAirMult');
	Spawn(Class'AirMineShock',,,, rotator(HitNormal));
	Spawn(Class'VehMineWallParts',,,, rotator(HitNormal));
	SpawnOthers( HitLocation, HitNormal);
	
	for (i = 0; i <= 4; i++)
		Spawn(Class'MineExplosionAirProj',,,, rotator(VRand()));
	
	Super.ExplodeX(HitLocation, HitNormal, A);
}

simulated function SpawnOthers(vector HitLocation, vector HitNormal)
{
	Spawn(Class'AirMineAfterEffects');
}

simulated function HitWall( vector HitNormal, actor Wall)
{
	if (Mover(Wall) != None)
		Super(NaliProjectile).HitWall( HitNormal, Wall);
		
	if (bWallSet || VSize(Velocity) > 75.0)
	{
		Velocity = HitWallDamping*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
		speed = VSize(Velocity);
		if (!bWallSet && ImpactSound != None && Level.NetMode != NM_DedicatedServer )
			PlaySound(ImpactSound, SLOT_Misc, 12.0);
	}
}

simulated function SetWall(vector HitNormal, Actor Wall)
{
local rotator r;

	RandSpin(0);
	SetPhysics(PHYS_None);
	bFixedRotationDir = False;
	r = rotator(HitNormal);
	r.Roll = Rand(16384) * 4;
	SetRotation(r);
	Velocity *= 0;
	
	setSurfNormal(HitNormal);
	bWallSet = True;
	
	setTeam();
	setSensors();
	
	SetTimeOut1(0.1);
	
	genWallFX( HitNormal, Wall);
}

simulated function genWallFX( vector HitNormal, Actor Wall)
{
	PlayAnim('Open', 8.0, 0.0);
	PlaySound(Sound'MineDeploy06',,24.0,,750);
}

function TimedOut1()
{
	bProjTarget = True;
	SetCollisionSize( TargetRadius, TargetHeight);
}

simulated function TimedOut2()
{
	SetWall( vect(0,0,1), None);
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Open')
	{
		LoopAnim('RotateLoop', 5.0);
		AmbientSound = Sound'JumpMineJumping';
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=AirMine
	Texture=TheMinerMetal
	
	SensorRadius=192.000000
	SensorHeight=192.000000
	TargetRadius=24.000000
	TargetHeight=24.000000
	bLandedOnly=False
	bTriggerByMachines=True
	MineHealth=275
	MineOvClass=None
	AISensorMult=3.500000
	
	ImpactSound=MineHit1
	MineDecalGenClass=Class'AirMineDecalFX'
	DmgRadius=650.000000
	speed=1200.000000
	MaxSpeed=1500.000000
	Damage=800.000000
	MomentumTransfer=600000
	ExplosionNoise=3.000000
	
	bWaterHitFX=True
	WaterSplashType=2
	Mass=100.000000
	Buoyancy=185.000000
	
	TeamTexIndex=1
	TeamTex(0)=AirMineSk01Red
	TeamTex(1)=AirMineSk01Blue
	TeamTex(2)=AirMineSk01Green
	TeamTex(3)=AirMineSk01Yellow
	
	AnimSequence=Still
	HitWallDamping=0.375000
	bSetTeamAtStart=True
	SoundRadius=32
	SoundVolume=96
	SoundPitch=48
}
