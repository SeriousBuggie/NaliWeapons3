//////////////////////////////////////////////////////////////
//	Nali Weapons III Vehicular Mine
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class VehMine expands NWMine;

#exec MESH IMPORT MESH=VehMine ANIVFILE=MODELS\VehMine_a.3d DATAFILE=MODELS\VehMine_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=VehMine STRENGTH=0.25
#exec MESH ORIGIN MESH=VehMine X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=VehMine SEQ=All STARTFRAME=0 NUMFRAMES=8
#exec MESH SEQUENCE MESH=VehMine SEQ=Still STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VehMine SEQ=Close STARTFRAME=0 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=VehMine SEQ=Open STARTFRAME=2 NUMFRAMES=6 RATE=6.0
#exec MESH SEQUENCE MESH=VehMine SEQ=Openned STARTFRAME=7 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=VehMine MESH=VehMine
#exec MESHMAP SCALE MESHMAP=VehMine X=0.12 Y=0.12 Z=0.24

#exec TEXTURE IMPORT NAME=VehMineSk01 FILE=SKINS\VehMineSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=VehMine NUM=1 TEXTURE=VehMineSk01

#exec TEXTURE IMPORT NAME=VehMineSk02 FILE=SKINS\VehMineSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=VehMine NUM=2 TEXTURE=VehMineSk02

#exec TEXTURE IMPORT NAME=TheMinerMetal FILE=SKINS\TheMinerMetal.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=VehMineSk02Red FILE=SKINS\VehMineSk02Red.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=VehMineSk02Blue FILE=SKINS\VehMineSk02Blue.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=VehMineSk02Green FILE=SKINS\VehMineSk02Green.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=VehMineSk02Yellow FILE=SKINS\VehMineSk02Yellow.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="MineDeploy05" FILE=SOUNDS\MineDeploy05.wav GROUP="Deploy"


function PreBeginPlay()
{
	Super.PreBeginPlay();
	MineHealth = Class'TheMiner'.default.armorVeh;
}

simulated function PostBeginPlay()
{
	PlayAnim('Still', 1.0, 0.0);
	Super.PostBeginPlay();
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
local byte i;
local vector v;
local rotator r;

	Spawn(Class'MineExplosionVehProj',,, HitLocation + HitNormal, rotator(HitNormal));
	Spawn(Class'VehMineWallParts',,, HitLocation + HitNormal, rotator(HitNormal));
	Spawn(Class'VehMineShock',,, HitLocation + (HitNormal*2), rotator(HitNormal));
	SpawnOthers( HitLocation, HitNormal);
	
	for (i = 0; i < 5; i++)
	{
		r.Roll = Rand(16384) * 4;
		v.z = 64;
		v = (v >> r);
		Spawn(Class'MineExplosionVehPart',,, HitLocation + HitNormal + (v >> rotator(HitNormal)));
	}
	
	Super.ExplodeX(HitLocation, HitNormal, A);
}

simulated function SpawnOthers(vector HitLocation, vector HitNormal)
{
	Spawn(class'VehMineAfterEffects',,, HitLocation + HitNormal*10);
}

simulated function genWallFX( vector HitNormal, Actor Wall)
{
	PlayAnim('Open', 1.0, 0.0);
	PlaySound(Sound'MineDeploy05',,24.0,,750);
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Open')
		TweenAnim('Openned', 0.1);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=VehMine
	Texture=TheMinerMetal
	
	SensorRadius=64.000000
	SensorHeight=64.000000
	TargetRadius=36.000000
	TargetHeight=24.000000
	bLandedOnly=True
	bTriggerByMachines=True
	MineHealth=250
	MineOvClass=None
	AISensorMult=3.750000
	
	ImpactSound=MineHit1
	MineDecalGenClass=Class'VehMineDecalFX'
	DmgRadius=315.000000
	speed=1200.000000
	MaxSpeed=1500.000000
	Damage=500.000000
	MomentumTransfer=400000
	ExplosionNoise=2.350000
	
	bWaterHitFX=True
	WaterSplashType=2
	Mass=100.000000
	
	TeamTexIndex=2
	TeamTex(0)=VehMineSk02Red
	TeamTex(1)=VehMineSk02Blue
	TeamTex(2)=VehMineSk02Green
	TeamTex(3)=VehMineSk02Yellow
	
	HitWallDamping=0.250000
	AnimSequence=Still
	bSetTeamAtStart=True
}
