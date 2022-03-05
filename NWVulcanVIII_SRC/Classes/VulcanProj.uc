//////////////////////////////////////////////////////////////
//	Nali Weapons III Vulcan 2nd projectile
//				Feralidragon (15-10-2010)
//
// NW3 VULCAN BUILD 1.00
//////////////////////////////////////////////////////////////

class VulcanProj expands NaliProjectile;

#exec MESH IMPORT MESH=VulcanProj ANIVFILE=MODELS\VulcanProj_a.3d DATAFILE=MODELS\VulcanProj_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=VulcanProj STRENGTH=0.35
#exec MESH ORIGIN MESH=VulcanProj X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=VulcanProj SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanProj SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=VulcanProj MESH=VulcanProj
#exec MESHMAP SCALE MESHMAP=VulcanProj X=0.1 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=VulcanProjSk FILE=Skins\VulcanProjSk.bmp GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=VulcanProj NUM=1 TEXTURE=VulcanProjSk

#exec TEXTURE IMPORT NAME=VulcanProjTrailFX FILE=Coronas\VulcanProjTrailFX.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanProj NUM=2 TEXTURE=VulcanProjTrailFX

#exec AUDIO IMPORT NAME="VulcanProjHit" FILE=SOUNDS\VulcanProjHit.wav GROUP="Explode"

var float fadeDown;
var() class<VulcanMiniProj> MiniProjClass;
var() int MiniProjDmg, MiniProjAmount;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	RotationRate.Roll = -90000;
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	SpawnExplosionFX(HitLocation, HitNormal, A);
	if (Level.NetMode != NM_DedicatedServer)
		SpawnExplosionClientFX(HitLocation, HitNormal, A);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

simulated function Tick( float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && fadeDown >= -Delta)
	{
		fadeDown -= Delta;
		ScaleGlow = FMax(0.0, fadeDown);
		LightBrightness = FMax(0.0, fadeDown) * Default.LightBrightness / Default.fadeDown;
		if (Trail1 != None)
			Trail1.ScaleGlow = ScaleGlow / 3;
	}
}

simulated function SpawnExplosionClientFX(vector HitLocation, vector HitNormal, optional actor A);

function SpawnExplosionFX(vector HitLocation, vector HitNormal, optional actor A)
{
local VulcanMiniProj vmp;
local vector SplashDir, SpPoint, MyDir;
local rotator r;
local byte i;

	if (Carcass(A) != None || Pawn(A) != None)
	{
		PlaySound(Sound 'ChunkHit',, 12.0,,750);
		Spawn(Class'VulcanProjBFX');
	}
	else if (MiniProjClass != None)
	{
		for (i = 0; i < MiniProjAmount; i++)
		{
			if (A == None || A == Level)
			{
				SplashDir.Z = 2 * FRand() - 1;
				SplashDir.Y = 2 * FRand() - 1;
				SplashDir.X = FRand()*0.75 + 0.25;
			
				MyDir = 2 * Normal(Velocity) * (1 - Abs(Normal(Velocity) dot HitNormal));
				SplashDir = Normal(SplashDir >> rotator(HitNormal));
				SpPoint = Location + SplashDir + Normal(Velocity) + HitNormal + MyDir;
				
				r = rotator(SpPoint - Location);
			}
			else
			{
				r.Yaw = Rand(16384)*4 - 32768;
				r.Pitch = Rand(16384)*4 - 32768;
				r.Roll = Rand(16384)*4 - 32768;
			}
			
			vmp = Spawn(MiniProjClass,,, HitLocation + HitNormal, r);
			if (vmp != None)
			{
				vmp.Damage = MiniProjDmg;
				vmp.Kickback = Kickback;
				vmp.MoreDamage = MoreDamage;
				vmp.HealthGiver = HealthGiver;
				vmp.Splasher = Splasher;
				vmp.fadeDown = FClamp(fadeDown, 0.0, 2.0);
			}
		}
		
		PlaySound( ImpactSound,, 10.0,, 1500);
	}
}

simulated function ZoneChange( ZoneInfo NewZone )
{
	if (NewZone.bWaterZone && !NewZone.IsA('LavaZone') && NewZone.DamageType != 'Burned')
		fadeDown = 0;

	Super.ZoneChange( NewZone);
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=VulcanProj
	bUnlit=True
	ScaleGlow=2.500000
	
	ExplosionNoise=1.850000
	
	bBounce=False
	bFixedRotationDir=True
	Physics=PHYS_Projectile
	
	Damage=60.000000
	ExplosionDecal=Class'VulcanProjDecal'
	ImpactSound=VulcanProjHit
	MaxSpeed=1800.000000
	MomentumTransfer=25500
	MyDamageType=Vulcanized
	speed=1300.000000
	DmgRadius=0.000000
	bDirectHit=True
	bDirectionalBlow=True
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=50
    LightHue=0
    LightSaturation=0
    LightRadius=5
	
	TrailClass1=Class'VulcanProjCor'
	
	bWaterHitFX=True
	WaterSplashType=2
	
	fadeDown=4.000000
	MiniProjClass=Class'VulcanMiniProj'
	MiniProjDmg=15
	MiniProjAmount=4
}
