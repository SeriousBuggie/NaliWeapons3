//////////////////////////////////////////////////////////////
//	Nali Weapons III Land Mine
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class LandMine expands NWMine;

#exec MESH IMPORT MESH=LandMine ANIVFILE=MODELS\LandMine_a.3d DATAFILE=MODELS\LandMine_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=LandMine STRENGTH=0.25
#exec MESH ORIGIN MESH=LandMine X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=LandMine SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=LandMine SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=LandMine SEQ=Underground STARTFRAME=39 NUMFRAMES=1
#exec MESH SEQUENCE MESH=LandMine SEQ=Drill STARTFRAME=0 NUMFRAMES=40 RATE=40.0

#exec MESHMAP NEW MESHMAP=LandMine MESH=LandMine
#exec MESHMAP SCALE MESHMAP=LandMine X=0.12 Y=0.12 Z=0.24

#exec TEXTURE IMPORT NAME=LandMineSk01 FILE=SKINS\LandMineSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=LandMine NUM=1 TEXTURE=LandMineSk01

#exec TEXTURE IMPORT NAME=LandMineSk02 FILE=SKINS\LandMineSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=LandMine NUM=2 TEXTURE=LandMineSk02

#exec AUDIO IMPORT NAME="MineDeploy03" FILE=SOUNDS\MineDeploy03.wav GROUP="Deploy"


function PreBeginPlay()
{
	Super.PreBeginPlay();
	MineHealth = Class'TheMiner'.default.armorLand;
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
local byte i;
local vector v;
local rotator r;

	Spawn(Class'MineExplosionProjC',,, HitLocation + HitNormal, rotator(HitNormal));
	
	for (i = 0; i < 3; i++)
	{
		r.Roll = Rand(16384) * 4;
		v.z = 32;
		v = (v >> r);
		Spawn(Class'MineExplosionPartC',,, HitLocation + HitNormal + (v >> rotator(HitNormal)));
	}
	
	Super.ExplodeX(HitLocation, HitNormal, A);
}

simulated function genWallFX( vector HitNormal, Actor Wall)
{
	PlayAnim('Drill', 1.0, 0.0);
	PlaySound(Sound'MineDeploy03',,24.0,,750);
	SetTimeOut2(0.1);
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Drill')
		TweenAnim('Underground', 0.1);
}

function TimedOut2()
{
	Spawn(Class'LandMineWallParts',,,, rotator(-vector(Rotation)));
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=LandMine
	
	SensorRadius=64.000000
	SensorHeight=64.000000
	TargetRadius=24.000000
	TargetHeight=16.000000
	bLandedOnly=True
	bTriggerByMachines=False
	MineHealth=125
	MineOvClass=Class'LandMineTeamOv'
	AISensorMult=3.250000
	
	ImpactSound=MineHit1
	MineDecalGenClass=Class'LandMineDecalFX'
	DmgRadius=200.000000
	speed=1200.000000
	MaxSpeed=1500.000000
	Damage=175.000000
	MomentumTransfer=150000
	ExplosionNoise=2.350000
	
	bWaterHitFX=True
	WaterSplashType=2
	Mass=100.000000
	
	TeamTexIndex=0
	TeamTex(0)=None
	TeamTex(1)=None
	TeamTex(2)=None
	TeamTex(3)=None
	
	HitWallDamping=0.250000
}
