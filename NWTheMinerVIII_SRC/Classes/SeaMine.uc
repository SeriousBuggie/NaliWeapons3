//////////////////////////////////////////////////////////////
//	Nali Weapons III Sea Mine
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class SeaMine expands NWMine;

#exec MESH IMPORT MESH=SeaMine ANIVFILE=MODELS\SeaMine_a.3d DATAFILE=MODELS\SeaMine_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SeaMine STRENGTH=0.25
#exec MESH ORIGIN MESH=SeaMine X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=SeaMine SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=SeaMine SEQ=Still STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SeaMine SEQ=Open STARTFRAME=1 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=SeaMine SEQ=Close STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=SeaMine SEQ=Openned STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=SeaMine MESH=SeaMine
#exec MESHMAP SCALE MESHMAP=SeaMine X=0.075 Y=0.075 Z=0.15

#exec TEXTURE IMPORT NAME=SeaMineSk01 FILE=SKINS\SeaMineSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=SeaMine NUM=1 TEXTURE=SeaMineSk01

#exec TEXTURE IMPORT NAME=SeaMineSk02 FILE=SKINS\SeaMineSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=SeaMine NUM=2 TEXTURE=SeaMineSk02

#exec TEXTURE IMPORT NAME=SeaMineSk02Red FILE=SKINS\SeaMineSk02Red.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SeaMineSk02Blue FILE=SKINS\SeaMineSk02Blue.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SeaMineSk02Green FILE=SKINS\SeaMineSk02Green.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SeaMineSk02Yellow FILE=SKINS\SeaMineSk02Yellow.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="MineDeploy04" FILE=SOUNDS\MineDeploy04.wav GROUP="Deploy"

var bool bSpikesSet;

function PreBeginPlay()
{
	Super.PreBeginPlay();
	MineHealth = Class'TheMiner'.default.armorSea;
}

simulated function PostBeginPlay()
{
	PlayAnim('Still', 1.0, 0.0);
	Super.PostBeginPlay();
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	bNeverHurtInstigator = False;
	bNoHurtTeam = False;
	if (MineDecalGenClass != None && !bWallSet)
		Spawn(MineDecalGenClass,,, HitLocation + HitNormal, rotator(HitNormal));
		
	Spawn(Class'MineExplosionSeaMult');
	Spawn(Class'MineExplosionSeaA');
	
	Super(NaliProjectile).ExplodeX(HitLocation, HitNormal, A);
}

simulated function genWallFX( vector HitNormal, Actor Wall)
{
	PlayAnim('Open', 2.0, 0.0);
	PlaySound(Sound'MineDeploy04',,24.0,,750);
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Open')
		TweenAnim('Openned', 0.1);
}

simulated function HitWall( vector HitNormal, actor Wall)
{
	if (VSize(Velocity) > 75.0)
	{
		Velocity = HitWallDamping*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
		speed = VSize(Velocity);
		if ( ImpactSound != None && Level.NetMode != NM_DedicatedServer )
			PlaySound(ImpactSound, SLOT_Misc, 12.0);
	}
	else
		Super(NaliProjectile).HitWall( HitNormal, Wall);
}

simulated function ZoneChange( Zoneinfo NewZone )
{
	if (bWallSet)
	{
		if (!bSpikesSet && !NewZone.bWaterZone)
		{
			genWallFX( vect(0,0,1), None);
			bSpikesSet = True;
		}
		
		return;
	}
	
	if (NewZone.IsA('LavaZone') || NewZone.DamageType == 'Burned')
		ExplodeX( Location, SurfNormal);
	else if (NewZone.bWaterZone)
		SetWall( vect(0,0,1), None);
	
	Super(NaliProjectile).ZoneChange( NewZone);
}

simulated function SetWall(vector HitNormal, Actor Wall)
{
	Velocity.X = 0;
	Velocity.Y = 0;
	
	setSurfNormal(HitNormal);
	bWallSet = True;
	
	setTeam();
	setSensors();
	
	SetTimeOut1(0.1);
	SetTimeOut2(0.1);
}

function TimedOut1()
{
	bProjTarget = True;
	SetCollisionSize( TargetRadius, TargetHeight);
}

simulated function TimedOut2()
{
	RandSpin(8000);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=SeaMine
	
	SensorRadius=64.000000
	SensorHeight=64.000000
	TargetRadius=32.000000
	TargetHeight=32.000000
	bLandedOnly=False
	bTriggerByMachines=True
	MineHealth=150
	MineOvClass=None
	AISensorMult=3.500000
	
	ImpactSound=MineHit1
	MineDecalGenClass=Class'SeaMineDecalFX'
	DmgRadius=220.000000
	speed=1200.000000
	MaxSpeed=1500.000000
	Damage=190.000000
	MomentumTransfer=200000
	ExplosionNoise=2.250000
	
	bWaterHitFX=True
	WaterSplashType=2
	Mass=100.000000
	Buoyancy=185.000000
	
	TeamTexIndex=2
	TeamTex(0)=SeaMineSk02Red
	TeamTex(1)=SeaMineSk02Blue
	TeamTex(2)=SeaMineSk02Green
	TeamTex(3)=SeaMineSk02Yellow
	
	AnimSequence=Still
	HitWallDamping=0.250000
}
