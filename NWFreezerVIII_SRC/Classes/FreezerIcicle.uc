//////////////////////////////////////////////////////////////
//	Nali Weapons III Freezer 2nd projectile
//				Feralidragon (05-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerIcicle expands NaliProjectile;

#exec MESH IMPORT MESH=FreezerIcicle ANIVFILE=MODELS\FreezerIcicle_a.3d DATAFILE=MODELS\FreezerIcicle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerIcicle STRENGTH=0.5
#exec MESH ORIGIN MESH=FreezerIcicle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=FreezerIcicle SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIcicle SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerIcicle MESH=FreezerIcicle
#exec MESHMAP SCALE MESHMAP=FreezerIcicle X=0.025 Y=0.0125 Z=0.025


var int maxNonFreezablePClasses;

function BeginPlay()
{
	LoadLists();
	Super.BeginPlay();
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	RotationRate.Roll = -90000;
}

function LoadLists()
{
local int i;

	maxNonFreezablePClasses = ArrayCount(class'Freezer'.default.NonFreezablePawns);
	if (Class'Freezer'.default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(class'Freezer'.default.NonFreezablePawns); i++)
		{
			if (class'Freezer'.default.NonFreezablePawns[i] == '')
			{
				maxNonFreezablePClasses = i;
				break;
			}
		}
	}
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	SpawnExplosionFX( HitLocation, HitNormal, A);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function SpawnExplosionFX(vector HitLocation, vector HitNormal, optional actor A)
{
	if (Carcass(A) != None || (Pawn(A) != None && CheckFreezablePawn(Pawn(A))))
		PlaySound(Sound'UnrealI.Razorjack.BladeThunk', SLOT_Misc, 2.0);
	else
		Spawn(Class'FreezerIcicleExpl',,, HitLocation + HitNormal);
}

function bool CheckFreezablePawn(Pawn P)
{
local int i;

	if (class'Freezer'.default.bInvertListsProcessing)
	{
		for (i = maxNonFreezablePClasses-1; i >= 0; i--)
		{
			if (class'Freezer'.default.NonFreezablePawns[i] != '' && P.IsA(class'Freezer'.default.NonFreezablePawns[i]))
				return False;
		}
	}
	else
	{
		for (i = 0; i < maxNonFreezablePClasses; i++)
		{
			if (class'Freezer'.default.NonFreezablePawns[i] != '' && P.IsA(class'Freezer'.default.NonFreezablePawns[i]))
				return False;
		}
	}
	
	return (!noHurtThisPawn(P));
}

function SpawnSmk()
{
	Spawn(Class'FreezerIcicleSmk');
}

simulated function ZoneChange( ZoneInfo NewZone )
{
	if (NewZone.bWaterZone && (NewZone.IsA('LavaZone') || NewZone.DamageType == 'Burned'))
	{
		SpawnSmk();
		Destroy();
	}
	else
		Super.ZoneChange( NewZone);
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=FreezerIcicle
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.500000
	bMeshEnviroMap=True
	Texture=Ice
	
	ExplosionNoise=0.750000
	
	bBounce=False
	bFixedRotationDir=True
	Physics=PHYS_Projectile
	
	Damage=27.000000
	ExplosionDecal=None
	ImpactSound=None
	MaxSpeed=2000.000000
	MomentumTransfer=10500
	MyDamageType=IcePierced
	speed=1600.000000
	DmgRadius=0.000000
	bDirectHit=True
	bDirectionalBlow=True
	
	TrailClass1=Class'FreezerIcicleTrail'
	
	bWaterHitFX=True
	WaterSplashType=0
	Mass=5.000000
	WaterSpeedScale=1.750000
}
