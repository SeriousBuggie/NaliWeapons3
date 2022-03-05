//////////////////////////////////////////////////////////////
//	Nali Weapons III Freezer main projectile
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerProj expands NaliProjectile;

#exec MESH IMPORT MESH=FreezerProjTrail ANIVFILE=MODELS\FreezerProjTrail_a.3d DATAFILE=MODELS\FreezerProjTrail_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerProjTrail STRENGTH=0.5
#exec MESH ORIGIN MESH=FreezerProjTrail X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=FreezerProjTrail SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerProjTrail SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerProjTrail MESH=FreezerProjTrail
#exec MESHMAP SCALE MESHMAP=FreezerProjTrail X=0.25 Y=0.25 Z=0.5

#exec TEXTURE IMPORT NAME=FreezerTrailLine FILE=Coronas\FreezerTrailLine.bmp GROUP=Coronas FLAGS=2


var int maxNonFreezablePClasses;

function BeginPlay()
{
	LoadLists();
	Super.BeginPlay();
}

simulated function PostBeginPlay()
{
local rotator r;

	Super.PostBeginPlay();
	r = Rotation;
	r.Roll = Rand(16384) * 4;
	SetRotation(r);
	RotationRate.Roll = -110000;
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
	SpawnExplosionFX( HitLocation, HitNormal);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function PostProcessVictim( Actor Victim)
{
	FreezePawn(Pawn(Victim));
}

function SpawnExplosionFX(vector HitLocation, vector HitNormal)
{
local vector XY;
local rotator r;
local byte i;

	Spawn(Class'FreezerProjMainExpl',,, HitLocation + HitNormal);
	for (i = 0; i < 2; i++)
	{
		r.Yaw = Rand(16384) * 4;
		XY = ((vector(r) * FRand() * 24) >> rot(16384,0,0));
		Spawn(Class'FreezerProjExpl',,, HitLocation + HitNormal + (XY >> rotator(HitNormal)));
	}
}

function FreezePawn( Pawn P)
{
local FrozenBody fb;
	
	if (P != None && (P.Health <= 0 && (!P.bHidden || PlayerPawn(P) != None)) && CheckFreezablePawn(P))
	{
		fb = Spawn(Class'FrozenBody',,, P.Location, P.Rotation);
		fb.SetFrozenBody(P);
		if (P.bIsPlayer)
			P.HidePlayer();
		else if (ScriptedPawn(P) != None)
			ScriptedPawn(P).CarcassType = None;
		FlashPlayer(PlayerPawn(P));
	}
}

simulated function FlashPlayer( PlayerPawn PP)
{
	if (PP != None)
		PP.ClientFlash( 2, 5000 * vect(1,1,1));
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

simulated function ZoneChange( ZoneInfo NewZone )
{
	if (NewZone.bWaterZone)
	{
		SpawnExplosionFX( Location, vect(0,0,1));
		SpawnIceBase(NewZone);
		Destroy();
	}
	else
		Super.ZoneChange( NewZone);
}

function SpawnIceBase( ZoneInfo FrozenZone)
{
local rotator r;
	
	r.Yaw = Rand(16384) * 4;
	if (FrozenZone.IsA('LavaZone') || FrozenZone.DamageType == 'Burned')
		Spawn(Class'IceFlameBase',,,, r);
	else
		Spawn(Class'IceBase',,,, r);
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=FreezerProjTrail
	MultiSkins(1)=FreezerTrailLine
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=1.500000
	
	ExplosionNoise=0.450000
	
	LightBrightness=100
	LightHue=0
	LightSaturation=255
	LightRadius=6
	LightEffect=LE_NonIncidence
	LightType=LT_Steady
	
	bBounce=False
	bFixedRotationDir=True
	Physics=PHYS_Projectile
	
	Damage=55.000000
	ExplosionDecal=Class'FreezerIceDecal'
	ImpactSound=None
	MaxSpeed=1625.000000
	MomentumTransfer=25000
	MyDamageType=Frozen
	speed=1350.000000
	DmgRadius=200.000000
	
	TrailClass1=Class'FreezerProjTrail'
	TrailClass2=Class'FreezerProjTrailRoundFX'
	
	bWaterHitFX=False
	WaterSplashType=250
	Mass=50.000000
}
