//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class FOversMine expands NWMine;

#exec MESH IMPORT MESH=FOversMine ANIVFILE=MODELS\FOversMine_a.3d DATAFILE=MODELS\FOversMine_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FOversMine STRENGTH=0.25
#exec MESH ORIGIN MESH=FOversMine X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=FOversMine SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOversMine SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FOversMine MESH=FOversMine
#exec MESHMAP SCALE MESHMAP=FOversMine X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=Sk_FMine FILE=SKINS\Sk_FMine.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FOversMine NUM=1 TEXTURE=Sk_FMine

#exec AUDIO IMPORT NAME="FMineDeploy" FILE=SOUNDS\FMineDeploy.wav GROUP="Deploy"


var Pawn myInstig;

function PreBeginPlay()
{
	Super.PreBeginPlay();
	MineHealth = Class'TheMinerGndMineField'.default.MinesHealth;
	MineLifeTime = RandRange(Class'TheMinerGndMineField'.default.MinesMinLifeSpan, Class'TheMinerGndMineField'.default.MinesMaxLifeSpan);
	Damage = Class'TheMinerGndMineField'.default.MinesHealth;
	DmgRadius = Class'TheMinerGndMineField'.default.MinesDmgRadius;
	bLifeForever = (MineLifeTime <= 0);
}

function ProcessTouch(Actor Other, Vector HitLocation);

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	if (myInstig != None)
		Instigator = myInstig;
	Spawn(Class'MineExplosionFProj',,, HitLocation + HitNormal, rotator(HitNormal));
	Super.ExplodeX(HitLocation, HitNormal, A);
}

simulated function genWallFX(vector HitNormal, Actor Wall)
{
	PlayWallFXSound();
}

function PlayWallFXSound()
{
	PlaySound(Sound'FMineDeploy',,12.0,,1250);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FOversMine
	
	SensorRadius=140.000000
	SensorHeight=90.000000
	TargetRadius=16.000000
	TargetHeight=16.000000
	bLandedOnly=False
	bTriggerByMachines=True
	MineHealth=200
	MineOvClass=Class'FOversMineOV'
	AISensorMult=3.500000
	noHUDRender=True
	noChainReaction=True
	CanHitInstigator=False
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	bNeverHurtFriends=True
	AISensorMult=0.000000
	
	MineDecalGenClass=Class'FOversMineDecalFX'
	DmgRadius=384.000000
	speed=800.000000
	MaxSpeed=1500.000000
	Damage=500
	MomentumTransfer=300000
	ExplosionNoise=2.350000
	
	bWaterHitFX=True
	WaterSplashType=1
	Mass=50.000000
	
	TeamTexIndex=0
	TeamTex(0)=None
	TeamTex(1)=None
	TeamTex(2)=None
	TeamTex(3)=None
}
