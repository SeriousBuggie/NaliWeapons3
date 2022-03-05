//////////////////////////////////////////////////////////////
//	Nali Weapons III Vulcan 2nd projectile
//				Feralidragon (15-10-2010)
//
// NW3 VULCAN BUILD 1.00
//////////////////////////////////////////////////////////////

class VulcanMiniProj expands NaliProjectile;

#exec AUDIO IMPORT NAME="VulcanMiniHit1" FILE=SOUNDS\VulcanMiniHit1.wav GROUP="Explode"
#exec AUDIO IMPORT NAME="VulcanMiniHit2" FILE=SOUNDS\VulcanMiniHit2.wav GROUP="Explode"
#exec AUDIO IMPORT NAME="VulcanMiniHit3" FILE=SOUNDS\VulcanMiniHit3.wav GROUP="Explode"

var float fadeDown;
var() Mesh RndMesh[4];
var() Sound RndSnd[3];

simulated function PostBeginPlay()
{
local vector X,Y,Z;

	Super.PostBeginPlay();
	RandSpin(50000);
	Mesh = RndMesh[Rand(ArrayCount(RndMesh))];
}

simulated function HitWall( vector HitNormal, actor Wall )
{
	HitInstigatorTimeOut = 0.01;
	Velocity = 0.75*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
	RandSpin(100000);
	speed = VSize(Velocity);
	if ( Level.NetMode != NM_DedicatedServer )
		PlaySound(RndSnd[Rand(ArrayCount(RndSnd))], SLOT_Misc, 8.0,, 800);
	if ( Velocity.Z > 400 )
		Velocity.Z = 0.5 * (400 + Velocity.Z);	
	else if ( speed < 20 )
	{
		bBounce = False;
		SetPhysics(PHYS_None);
	}
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	SpawnExplosionFX( HitLocation, HitNormal, A);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function SpawnExplosionFX(vector HitLocation, vector HitNormal, optional actor A)
{
	if (Carcass(A) != None || Pawn(A) != None)
		PlaySound(Sound 'ChunkHit',, 4.0,,200);
	Spawn(Class'VulcanProjFX');
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

simulated function ZoneChange( ZoneInfo NewZone )
{
	if (NewZone.bWaterZone && !NewZone.IsA('LavaZone') && NewZone.DamageType != 'Burned')
		fadeDown = 0;
	Super.ZoneChange( NewZone);
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=LodMesh'Botpack.chunkM'
	bUnlit=True
	ScaleGlow=2.500000
	Texture=VulcanProjSk
	DrawScale=0.125000
	
	ExplosionNoise=0.500000
	CanHitInstigator=True
	
	bBounce=True
	bFixedRotationDir=True
	Physics=PHYS_Falling
	LifeSpan=3.000000
	
	Damage=15.000000
	ExplosionDecal=None
	ImpactSound=None
	MaxSpeed=750.000000
	MomentumTransfer=10000
	MyDamageType=Vulcanized
	speed=600.000000
	DmgRadius=0.000000
	bDirectHit=True
	bDirectionalBlow=True
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=50
    LightHue=0
    LightSaturation=0
    LightRadius=1
	
	TrailClass1=Class'VulcanProjMiniCor'
	
	bWaterHitFX=True
	WaterSplashType=0
	Mass=5.000000
	
	fadeDown=2.000000
	RndMesh(0)=LodMesh'Botpack.chunkM'
	RndMesh(1)=LodMesh'Botpack.chunk2M'
	RndMesh(2)=LodMesh'Botpack.chunk3M'
	RndMesh(3)=LodMesh'Botpack.chunk4M'
	
	RndSnd(0)=VulcanMiniHit1
	RndSnd(1)=VulcanMiniHit2
	RndSnd(2)=VulcanMiniHit3
}
