//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybots projectile
//				Feralidragon (15-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybProj expands NaliProjectile;

#exec MESH IMPORT MESH=CybProj ANIVFILE=MODELS\CybProj_a.3d DATAFILE=MODELS\CybProj_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybProj STRENGTH=0.25
#exec MESH ORIGIN MESH=CybProj X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CybProj SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybProj SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybProj MESH=CybProj
#exec MESHMAP SCALE MESHMAP=CybProj X=0.1 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=CybProjTrailRed FILE=Coronas\CybProjTrailRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CybProjTrailBlue FILE=Coronas\CybProjTrailBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CybProjTrailGreen FILE=Coronas\CybProjTrailGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CybProjTrailYellow FILE=Coronas\CybProjTrailYellow.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=CybProj NUM=1 TEXTURE=CybProjTrailRed


var() class<Effects> TeamExplFX;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	RotationRate.Roll = -90000;
}

function BeginPlay()
{
	if (Class'CybotLauncher'.default.CybotProjSpeedMultiplier > 0.0)
		speed *= Class'CybotLauncher'.default.CybotProjSpeedMultiplier;
	Super.BeginPlay();
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	SpawnExplosionFX( HitLocation, HitNormal, A);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function SpawnExplosionFX(vector HitLocation, vector HitNormal, optional actor A)
{
	Spawn(TeamExplFX);
}

simulated function ProcessTouch(Actor Other, vector HitLocation)
{
	if (Other == Owner)
		return;
	
	if (Cybot(Owner) != None)
		Damage *= Cybot(Owner).FireProjDmgMultiplier;
	else if (Cybot(Instigator) != None)
		Damage *= Cybot(Instigator).FireProjDmgMultiplier;
	
	Super.ProcessTouch(Other, HitLocation);
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=CybProj
	bUnlit=True
	ScaleGlow=2.500000
	Style=STY_Translucent
	
	ExplosionNoise=1.000000
	
	bBounce=False
	bFixedRotationDir=True
	Physics=PHYS_Projectile
	
	Damage=30.000000
	ExplosionDecal=Class'CybProjDecal'
	ImpactSound=None
	MaxSpeed=2500.000000
	MomentumTransfer=25500
	MyDamageType=CybotLaser
	speed=1800.000000
	DmgRadius=0.000000
	bDirectHit=True
	bDirectionalBlow=True
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=50
    LightHue=0
    LightSaturation=0
    LightRadius=5
	
	TrailClass1=Class'CybProjCor'
	MultiSkins(1)=CybProjTrailRed
	TeamExplFX=Class'CybProjExplRed'
	
	bWaterHitFX=True
	WaterSplashType=2
	WaterSpeedScale=1.000000
}
