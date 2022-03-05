//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPSphere expands NaliProjectile;

#exec MESH IMPORT MESH=SEMPSphere ANIVFILE=MODELS\SEMPSphere_a.3d DATAFILE=MODELS\SEMPSphere_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SEMPSphere STRENGTH=0.5
#exec MESH ORIGIN MESH=SEMPSphere X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=SEMPSphere SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SEMPSphere SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=SEMPSphere MESH=SEMPSphere
#exec MESHMAP SCALE MESHMAP=SEMPSphere X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=SEMPCover FILE=Effects\SEMPCover.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=SEMPSphere NUM=1 TEXTURE=SEMPCover

#exec AUDIO IMPORT NAME="SEMPAmb" FILE=SOUNDS\SEMPAmb.wav GROUP="Loop"

var SEMPSparks Sparks1, Sparks2, Sparks3, Sparks4;
var() name ComboDamageType;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SpawnSparks();
	if (Role == ROLE_Authority)
		Damage = Class'SuperBoltRifle'.default.ProjectileDamage;
}

simulated function SpawnSparks()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		Sparks1 = Spawn(Class'SEMPSparks', Self);
		Sparks2 = Spawn(Class'SEMPSparks', Self);
		Sparks2.ChangeMesh(1);
		Sparks3 = Spawn(Class'SEMPSparks', Self);
		Sparks3.ChangeMesh(2);
		Sparks4 = Spawn(Class'SEMPSparks', Self);
		Sparks4.ChangeMesh(3);
	}
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
local SEMPSparksExpl empExpl;

	Spawn(class'SEMPSphereExpl',,, HitLocation);
	Spawn(class'SEMPGlowExpand',,, HitLocation);
	Spawn(class'SEMPLightExpl',,, HitLocation);

	Spawn(class'SEMPSparksExpl',,, HitLocation);
	empExpl = Spawn(class'SEMPSparksExpl',,, HitLocation);
	empExpl.ChangeMesh(1);
	empExpl = Spawn(class'SEMPSparksExpl',,, HitLocation);
	empExpl.ChangeMesh(2);
	empExpl = Spawn(class'SEMPSparksExpl',,, HitLocation);
	empExpl.ChangeMesh(3);
	
	Super.ExplodeX(HitLocation, HitNormal, A);
	Spawn(class'SEMPFlamesCarcasses',,, HitLocation);
}

simulated function ExplodeOnWall(vector HitNormal, actor Wall)
{
	if (Level.NetMode != NM_DedicatedServer)
		Spawn(class'SEMPSmokeGen',,, Location);
}

simulated function Destroyed()
{
	if (Sparks1 != None)
		Sparks1.Destroy();
	if (Sparks2 != None)
		Sparks2.Destroy();
	if (Sparks3 != None)
		Sparks3.Destroy();
	if (Sparks4 != None)
		Sparks4.Destroy();
		
	Sparks1 = None;
	Sparks2 = None;
	Sparks3 = None;
	Sparks4 = None;
	
	Super.Destroyed();
}

function Combo()
{
	Spawn(class'SEMPLightCombo');
	ComboEffects();
	Destroy();
}

function ComboEffects()
{
local SEMPSparksExplCombo sEmpExpl;
local byte i;

	HurtRadiusX(Class'SuperBoltRifle'.default.ComboDamage, 280, ComboDamageType, MomentumTransfer*2.5, Location);

	Spawn(class'SEMPCombo');
	Spawn(class'SEMPGlowComboSec');
	
	Spawn(class'SEMPSparksExplCombo');
	sEmpExpl = Spawn(class'SEMPSparksExplCombo');
	sEmpExpl.ChangeMesh(1);
	sEmpExpl = Spawn(class'SEMPSparksExplCombo');
	sEmpExpl.ChangeMesh(2);
	sEmpExpl = Spawn(class'SEMPSparksExplCombo');
	sEmpExpl.ChangeMesh(3);
	
	for (i = 0; i < 4; i++)
		Spawn(class'SBoltTracedExpl',,,, RotRand());
	
	Spawn(class'SEMPComboFlamesCarcasses',,, Location);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=SEMPSphere
	
	bFixedRotationDir=True
	RotationRate=(Pitch=500000,Yaw=500000)
	
	bUnlit=True
	DrawScale=0.250000
	ScaleGlow=0.400000
	Style=STY_Translucent
	
	bBounce=False
	bNetTemporary=False
	SpawnSound=None
	AmbientSound=SEMPAmb
	SoundRadius=52
	SoundVolume=128
	
	ExplosionDecal=Class'SEMPDecal'
	MyDamageType=Electrified
	ComboDamageType=ElectricCombo
	DmgRadius=150.000000
	speed=850.000000
	MaxSpeed=1000.000000
	Damage=60.000000
	MomentumTransfer=30000
	bProjTarget=True
	ProjAccel=50.000000
	
	TrailClass1=Class'SEMPLightTrail'
	TrailClass2=Class'SEMPGlowTrail'
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=100
    LightHue=0
    LightSaturation=72
    LightRadius=12
	
	CollisionHeight=12.000000
	CollisionRadius=12.000000
	bProjTarget=True
	ExplosionNoise=0.950000
	
	bWaterHitFX=True
	WaterSplashType=2
}
