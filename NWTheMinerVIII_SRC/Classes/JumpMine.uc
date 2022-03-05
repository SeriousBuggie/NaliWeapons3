//////////////////////////////////////////////////////////////
//	Nali Weapons III Jump Mine
//				Feralidragon (26-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class JumpMine expands NWMine;

#exec MESH IMPORT MESH=JumpMine ANIVFILE=MODELS\JumpMine_a.3d DATAFILE=MODELS\JumpMine_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=JumpMine STRENGTH=0.25
#exec MESH ORIGIN MESH=JumpMine X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=JumpMine SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=JumpMine SEQ=Still STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=JumpMine SEQ=Openned STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=JumpMine SEQ=Closed STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=JumpMine SEQ=Open STARTFRAME=1 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=JumpMine SEQ=Close STARTFRAME=0 NUMFRAMES=2 RATE=2.0

#exec MESHMAP NEW MESHMAP=JumpMine MESH=JumpMine
#exec MESHMAP SCALE MESHMAP=JumpMine X=0.08 Y=0.08 Z=0.16

#exec TEXTURE IMPORT NAME=JumpMineSk01 FILE=SKINS\JumpMineSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=JumpMine NUM=1 TEXTURE=JumpMineSk01

#exec TEXTURE IMPORT NAME=JumpMineSk02 FILE=SKINS\JumpMineSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=JumpMine NUM=2 TEXTURE=JumpMineSk02

#exec TEXTURE IMPORT NAME=TheMinerMetal FILE=SKINS\TheMinerMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="MineDeploy02" FILE=SOUNDS\MineDeploy02.wav GROUP="Deploy"
#exec AUDIO IMPORT NAME="JumpMineRelease" FILE=SOUNDS\JumpMineRelease.wav GROUP="Deploy"
#exec AUDIO IMPORT NAME="JumpMineJumping" FILE=SOUNDS\JumpMineJumping.wav GROUP="Loop"


function PreBeginPlay()
{
	Super.PreBeginPlay();
	MineHealth = Class'TheMiner'.default.armorJump;
}

simulated function PostBeginPlay()
{
	PlayAnim('Still', 0.5, 0.0);
	Super.PostBeginPlay();
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	Spawn(Class'MineExplosionMultA');
	Super.ExplodeX(HitLocation, HitNormal, A);
}

simulated function genWallFX( vector HitNormal, Actor Wall)
{
	PlaySound(Sound'MineDeploy02',,12.0,,300);
}

function SensorTouch( actor Other)
{
	if (MineOv != None && killThisActor(Other))
		MineOv.setBlinkRate(10.0);
}

function SensorUnTouch( actor Other)
{
local JumpMine jm;

	if (killThisActor(Other))
	{
		if (Level.NetMode == NM_StandAlone)
			MineJump();
		else
		{
			jm = Spawn(Class);
			jm.Kickback = Kickback;
			jm.Splasher = Splasher;
			jm.MoreDamage = MoreDamage;
			jm.HealthGiver = HealthGiver;
			jm.setSurfNormal(SurfNormal);
			jm.MineJump();
			PlaySound(Sound'JumpMineRelease',,20.0,,1000);
			Destroy();
		}
	}
}

simulated function MineJump()
{
	if (MineOv != None)
		MineOv.setBlinkRate(10.0);
	
	RandSpin(0);
	bWallSet = True;
	PlayAnim('Open', 10.0, 0.0);
	PlaySound(Sound'JumpMineRelease',,20.0,,1000);
	AmbientSound = Sound'JumpMineJumping';
	
	Move(SurfNormal);
	SetPhysics(PHYS_Falling);
	Velocity = SurfNormal * 400;
	
	bFixedRotationDir = True;
	RotationRate.Roll = 500000;
	
	SetTimeOut2(0.175);
}

simulated function TimedOut2()
{
	ExplodeX( Location, SurfNormal);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=JumpMine
	Texture=TheMinerMetal
	
	SensorRadius=48.000000
	SensorHeight=48.000000
	TargetRadius=16.000000
	TargetHeight=16.000000
	bLandedOnly=True
	bTriggerByMachines=False
	MineHealth=80
	MineOvClass=Class'JumpMineTeamOv'
	AISensorMult=3.500000
	
	MineDecalGenClass=Class'JumpMineDecalFX'
	DmgRadius=245.000000
	speed=1200.000000
	MaxSpeed=1500.000000
	Damage=80.000000
	MomentumTransfer=90000
	ExplosionNoise=1.550000
	
	bWaterHitFX=True
	WaterSplashType=1
	Mass=50.000000
	
	TeamTexIndex=0
	TeamTex(0)=None
	TeamTex(1)=None
	TeamTex(2)=None
	TeamTex(3)=None
	
	AnimSequence=Still
	AmbientSound=None
	SoundRadius=64
	SoundVolume=128
	SoundPitch=96
}
