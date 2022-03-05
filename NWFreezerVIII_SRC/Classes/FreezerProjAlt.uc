//////////////////////////////////////////////////////////////
//	Nali Weapons III Freezer underwater projectile
//				Feralidragon (05-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerProjAlt expands NaliProjectile;

#exec MESH IMPORT MESH=FreezerProjAlt ANIVFILE=MODELS\FreezerProjAlt_a.3d DATAFILE=MODELS\FreezerProjAlt_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerProjAlt STRENGTH=0.2
#exec MESH ORIGIN MESH=FreezerProjAlt X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=FreezerProjAlt SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerProjAlt SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerProjAlt MESH=FreezerProjAlt
#exec MESHMAP SCALE MESHMAP=FreezerProjAlt X=0.15 Y=0.15 Z=0.3

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	RotationRate.Roll = -180000;
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	if (A == None || A == Level)
	{
		SpawnExplosionFX( HitLocation, HitNormal);
		Super.ExplodeX(HitLocation, HitNormal, A);
	}
}

function SpawnExplosionFX(vector HitLocation, vector HitNormal)
{
	Spawn(Class'FreezeProjWallParts',,, HitLocation + HitNormal, rotator(HitNormal));
	Spawn(Class'FreezeProjRemain');
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=FreezerProjAlt
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.500000
	bMeshEnviroMap=True
	Texture=Ice
	
	ExplosionNoise=3.750000
	
	LightBrightness=100
	LightHue=0
	LightSaturation=255
	LightRadius=6
	LightEffect=LE_NonIncidence
	LightType=LT_Steady
	
	bBounce=False
	bFixedRotationDir=True
	Physics=PHYS_Projectile
	
	Damage=120.000000
	ExplosionDecal=Class'FreezeProjRemainDecal'
	ImpactSound=None
	MaxSpeed=2000.000000
	MomentumTransfer=57500
	MyDamageType=IcePierced
	speed=1600.000000
	DmgRadius=0.000000
	bDirectHit=True
	bDirectionalBlow=True
	
	TrailClass1=Class'FreezerProjTrail'
	TrailClass2=Class'FreezerProAltTrailRoundFX'
	
	bWaterHitFX=True
	WaterSplashType=3
	Mass=200.000000
	WaterSpeedScale=1.500000
}
