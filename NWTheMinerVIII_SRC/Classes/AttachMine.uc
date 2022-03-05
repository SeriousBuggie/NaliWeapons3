//////////////////////////////////////////////////////////////
//	Nali Weapons III Attach Mine
//				Feralidragon (26-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class AttachMine expands NWMine;

#exec MESH IMPORT MESH=AttachMine ANIVFILE=MODELS\AttachMine_a.3d DATAFILE=MODELS\AttachMine_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=AttachMine STRENGTH=0.25
#exec MESH ORIGIN MESH=AttachMine X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=AttachMine SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=AttachMine SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=AttachMine SEQ=Openned STARTFRAME=9 NUMFRAMES=1
#exec MESH SEQUENCE MESH=AttachMine SEQ=Open STARTFRAME=0 NUMFRAMES=10 RATE=10.0

#exec MESHMAP NEW MESHMAP=AttachMine MESH=AttachMine
#exec MESHMAP SCALE MESHMAP=AttachMine X=0.04 Y=0.04 Z=0.08

#exec TEXTURE IMPORT NAME=AttachMineSk01 FILE=SKINS\AttachMineSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=AttachMine NUM=1 TEXTURE=AttachMineSk01

#exec TEXTURE IMPORT NAME=AttachMineSk02 FILE=SKINS\AttachMineSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=AttachMine NUM=2 TEXTURE=AttachMineSk02

#exec AUDIO IMPORT NAME="MineDeploy01" FILE=SOUNDS\MineDeploy01.wav GROUP="Deploy"


function PreBeginPlay()
{
	Super.PreBeginPlay();
	MineHealth = Class'TheMiner'.default.armorAttach;
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	Spawn(Class'MineExplosionA');
	Super.ExplodeX(HitLocation, HitNormal, A);
}

simulated function genWallFX( vector HitNormal, Actor Wall)
{
	PlayAnim('Open', 7.0, 0.0);
	PlaySound(Sound'MineDeploy01',,12.0,,300);
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Open')
		TweenAnim('Openned', 0.1);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=AttachMine
	
	SensorRadius=40.000000
	SensorHeight=40.000000
	TargetRadius=16.000000
	TargetHeight=16.000000
	bLandedOnly=False
	bTriggerByMachines=False
	MineHealth=40
	MineOvClass=Class'AttachMineTeamOv'
	AISensorMult=3.500000
	
	MineDecalGenClass=Class'AttachMineDecalFX'
	DmgRadius=128.000000
	speed=1200.000000
	MaxSpeed=1500.000000
	Damage=50.000000
	MomentumTransfer=125000
	ExplosionNoise=1.350000
	
	bWaterHitFX=True
	WaterSplashType=1
	Mass=50.000000
	
	TeamTexIndex=0
	TeamTex(0)=None
	TeamTex(1)=None
	TeamTex(2)=None
	TeamTex(3)=None
}
