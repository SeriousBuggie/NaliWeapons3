//////////////////////////////////////////////////////////////
//				Feralidragon (09-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravWFrag expands Projectile;

#exec MESH IMPORT MESH=GravWFrag01 ANIVFILE=MODELS\GravWFrag01_a.3d DATAFILE=MODELS\GravWFrag01_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravWFrag01 STRENGTH=0.1
#exec MESH ORIGIN MESH=GravWFrag01 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=GravWFrag01 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravWFrag01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=GravWFrag01 MESH=GravWFrag01
#exec MESHMAP SCALE MESHMAP=GravWFrag01 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=GravWFrag01 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=GravWFrag02 ANIVFILE=MODELS\GravWFrag02_a.3d DATAFILE=MODELS\GravWFrag02_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravWFrag02 STRENGTH=0.1
#exec MESH ORIGIN MESH=GravWFrag02 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=GravWFrag02 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravWFrag02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=GravWFrag02 MESH=GravWFrag02
#exec MESHMAP SCALE MESHMAP=GravWFrag02 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=GravWFrag02 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=GravWFrag03 ANIVFILE=MODELS\GravWFrag03_a.3d DATAFILE=MODELS\GravWFrag03_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravWFrag03 STRENGTH=0.1
#exec MESH ORIGIN MESH=GravWFrag03 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=GravWFrag03 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravWFrag03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=GravWFrag03 MESH=GravWFrag03
#exec MESHMAP SCALE MESHMAP=GravWFrag03 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=GravWFrag03 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=GravWFrag04 ANIVFILE=MODELS\GravWFrag04_a.3d DATAFILE=MODELS\GravWFrag04_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravWFrag04 STRENGTH=0.1
#exec MESH ORIGIN MESH=GravWFrag04 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=GravWFrag04 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravWFrag04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=GravWFrag04 MESH=GravWFrag04
#exec MESHMAP SCALE MESHMAP=GravWFrag04 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=GravWFrag04 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=GravWFrag05 ANIVFILE=MODELS\GravWFrag05_a.3d DATAFILE=MODELS\GravWFrag05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravWFrag05 STRENGTH=0.1
#exec MESH ORIGIN MESH=GravWFrag05 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=GravWFrag05 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravWFrag05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=GravWFrag05 MESH=GravWFrag05
#exec MESHMAP SCALE MESHMAP=GravWFrag05 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=GravWFrag05 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=GravWFrag06 ANIVFILE=MODELS\GravWFrag06_a.3d DATAFILE=MODELS\GravWFrag06_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravWFrag06 STRENGTH=0.1
#exec MESH ORIGIN MESH=GravWFrag06 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=GravWFrag06 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravWFrag06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=GravWFrag06 MESH=GravWFrag06
#exec MESHMAP SCALE MESHMAP=GravWFrag06 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=GravWFrag06 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=GravWFrag07 ANIVFILE=MODELS\GravWFrag07_a.3d DATAFILE=MODELS\GravWFrag07_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravWFrag07 STRENGTH=0.1
#exec MESH ORIGIN MESH=GravWFrag07 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=GravWFrag07 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravWFrag07 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=GravWFrag07 MESH=GravWFrag07
#exec MESHMAP SCALE MESHMAP=GravWFrag07 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=GravWFrag07 NUM=1 TEXTURE=DefaultTexture

var() mesh GravWFragMeshes[7];
var() float PullForce;

simulated function PostBeginPlay()
{
local rotator r;

	r = Rotation;
	r.Roll = Rand(16384)*4;
	SetRotation(r);
	
	RotationRate.Pitch = (Rand(20000) - 5000) * 8;
	RotationRate.Yaw = (Rand(20000) - 5000) * 8;
	
	Mesh = GravWFragMeshes[Rand(ArrayCount(GravWFragMeshes))];
	DrawScale = 0.25 + 1.0*FRand();
	
	SetTimer(0.05, True);
}

simulated function Timer()
{
	if (Owner != None && !Owner.bDeleteMe)
		Velocity += (PullForce * Normal(Owner.Location - Location));
	else
		Destroy();
}

simulated singular function TakeDamage( int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType)
{
	if (DamageType == Class'GravBall'.default.MyDamageType)
		Destroy();
}

simulated function HitWall (vector HitNormal, actor Wall)
{
	Velocity += (PullForce/3 * HitNormal);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=GravWFrag01
	
    bNetTemporary=False
    Physics=PHYS_Falling
    RemoteRole=ROLE_SimulatedProxy
    LifeSpan=60.000000
    CollisionRadius=0.000000
    CollisionHeight=0.000000
	bProjTarget=True
    bBounce=True
    bFixedRotationDir=True
    NetPriority=1.400000
	
	GravWFragMeshes(0)=GravWFrag01
	GravWFragMeshes(1)=GravWFrag02
	GravWFragMeshes(2)=GravWFrag03
	GravWFragMeshes(3)=GravWFrag04
	GravWFragMeshes(4)=GravWFrag05
	GravWFragMeshes(5)=GravWFrag06
	GravWFragMeshes(6)=GravWFrag07
	
	PullForce=250.000000
}
