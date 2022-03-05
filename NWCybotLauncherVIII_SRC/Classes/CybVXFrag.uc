//////////////////////////////////////////////////////////////
//				Feralidragon (04-04-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVXFrag expands Projectile;

#exec MESH IMPORT MESH=CybWFrag01 ANIVFILE=MODELS\CybWFrag01_a.3d DATAFILE=MODELS\CybWFrag01_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybWFrag01 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybWFrag01 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=CybWFrag01 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybWFrag01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=CybWFrag01 MESH=CybWFrag01
#exec MESHMAP SCALE MESHMAP=CybWFrag01 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=CybWFrag01 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=CybWFrag02 ANIVFILE=MODELS\CybWFrag02_a.3d DATAFILE=MODELS\CybWFrag02_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybWFrag02 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybWFrag02 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=CybWFrag02 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybWFrag02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=CybWFrag02 MESH=CybWFrag02
#exec MESHMAP SCALE MESHMAP=CybWFrag02 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=CybWFrag02 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=CybWFrag03 ANIVFILE=MODELS\CybWFrag03_a.3d DATAFILE=MODELS\CybWFrag03_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybWFrag03 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybWFrag03 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=CybWFrag03 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybWFrag03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=CybWFrag03 MESH=CybWFrag03
#exec MESHMAP SCALE MESHMAP=CybWFrag03 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=CybWFrag03 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=CybWFrag04 ANIVFILE=MODELS\CybWFrag04_a.3d DATAFILE=MODELS\CybWFrag04_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybWFrag04 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybWFrag04 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=CybWFrag04 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybWFrag04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=CybWFrag04 MESH=CybWFrag04
#exec MESHMAP SCALE MESHMAP=CybWFrag04 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=CybWFrag04 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=CybWFrag05 ANIVFILE=MODELS\CybWFrag05_a.3d DATAFILE=MODELS\CybWFrag05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybWFrag05 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybWFrag05 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=CybWFrag05 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybWFrag05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=CybWFrag05 MESH=CybWFrag05
#exec MESHMAP SCALE MESHMAP=CybWFrag05 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=CybWFrag05 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=CybWFrag06 ANIVFILE=MODELS\CybWFrag06_a.3d DATAFILE=MODELS\CybWFrag06_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybWFrag06 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybWFrag06 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=CybWFrag06 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybWFrag06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=CybWFrag06 MESH=CybWFrag06
#exec MESHMAP SCALE MESHMAP=CybWFrag06 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=CybWFrag06 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=CybWFrag07 ANIVFILE=MODELS\CybWFrag07_a.3d DATAFILE=MODELS\CybWFrag07_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybWFrag07 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybWFrag07 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=CybWFrag07 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybWFrag07 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=CybWFrag07 MESH=CybWFrag07
#exec MESHMAP SCALE MESHMAP=CybWFrag07 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=CybWFrag07 NUM=1 TEXTURE=DefaultTexture

var() mesh CybWFragMeshes[7];
var() float PullForce;
var() float FlowRotational;

var() sound FragHitSound[5];
var() sound HeavyFragHitSound[5];

simulated function PostBeginPlay()
{
local rotator r;
local vector FlowDir;

	r = Rotation;
	r.Roll = Rand(16384)*4;
	SetRotation(r);
	
	RotationRate.Pitch = (Rand(20000) - 5000) * 8;
	RotationRate.Yaw = (Rand(20000) - 5000) * 8;
	
	Mesh = CybWFragMeshes[Rand(ArrayCount(CybWFragMeshes))];
	if (Owner != None)
	{
		DrawScale = VSize(Location - Owner.Location) / 200;
		FlowDir = (Normal(Owner.Location - Location) >> (FlowRotational*rot(0,1,0)));
		Velocity = PullForce * vector(Rotation);
	}
	
	SetTimer(0.1, True);
}

simulated function Timer()
{
local vector FlowDir;
local float oldVelMag;

	if (Owner != None && !Owner.bDeleteMe)
	{
		FlowDir = (Normal(Owner.Location - Location) >> (FlowRotational*rot(0,1,0)));
		oldVelMag = VSize(Velocity);
		Velocity += (PullForce * FlowDir);
		Velocity = Normal(Velocity) * oldVelMag;
	}
	else
		Destroy();
}

simulated singular function TakeDamage( int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType)
{
	if (DamageType == 'GravityVacuum')
		Destroy();
}

simulated function HitWall (vector HitNormal, actor Wall)
{
	if (VSize(Velocity) > 80) 
	{
		if (DrawScale > 1.5)
			PlaySound(HeavyFragHitSound[Rand(ArrayCount(HeavyFragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
		else
			PlaySound(FragHitSound[Rand(ArrayCount(FragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
	}
		
	Velocity = (VRand()*0.5 + HitNormal) * PullForce;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybWFrag01
	
    bNetTemporary=False
    Physics=PHYS_Falling
    RemoteRole=ROLE_SimulatedProxy
    LifeSpan=5.000000
    CollisionRadius=0.000000
    CollisionHeight=0.000000
	bProjTarget=True
    bBounce=True
    bFixedRotationDir=True
    NetPriority=1.400000
	
	CybWFragMeshes(0)=CybWFrag01
	CybWFragMeshes(1)=CybWFrag02
	CybWFragMeshes(2)=CybWFrag03
	CybWFragMeshes(3)=CybWFrag04
	CybWFragMeshes(4)=CybWFrag05
	CybWFragMeshes(5)=CybWFrag06
	CybWFragMeshes(6)=CybWFrag07
	
	PullForce=1500.000000
	FlowRotational=12000.000000
	
	FragHitSound(0)=FragSound01
	FragHitSound(1)=FragSound02
	FragHitSound(2)=FragSound03
	FragHitSound(3)=FragSound04
	FragHitSound(4)=Sound'UnrealShare.General.Chunkhit1'
	
	HeavyFragHitSound(0)=HeavyFrag01
	HeavyFragHitSound(1)=HeavyFrag02
	HeavyFragHitSound(2)=HeavyFrag03
	HeavyFragHitSound(3)=HeavyFrag04
	HeavyFragHitSound(4)=HeavyFrag05
}
