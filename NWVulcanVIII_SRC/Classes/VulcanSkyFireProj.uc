//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN BUILD 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireProj expands VulcanProj;

#exec AUDIO IMPORT NAME="VulcanSkyFireProjAmb" FILE=SOUNDS\VulcanSkyFireProjAmb.wav GROUP="Loop"

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SoundPitch = Byte(Rand(192) + 32);
}

simulated function SpawnExplosionClientFX(vector HitLocation, vector HitNormal, optional actor A)
{
	Spawn(Class'VulcanSkyFireBulletExpl',,, HitLocation + HitNormal);
}

defaultproperties
{
	ExplosionNoise=3.850000
	DrawScale=9.000000
	LODBias=8.000000
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	
	Damage=1000.000000
	ExplosionDecal=Class'VulcanSkyFireProjDecal'
	ImpactSound=None
	MaxSpeed=12000.000000
	MomentumTransfer=55500
	MyDamageType=Vulcanized
	speed=11500.000000
	DmgRadius=300.000000
	bDirectHit=False
	bDirectionalBlow=False
	LightType=LT_None
	TrailClass1=Class'VulcanSkyFireProjCor'
	
	bWaterHitFX=True
	WaterSplashType=3
	
	fadeDown=4000.000000
	MiniProjClass=None
	
	AmbientSound=VulcanSkyFireProjAmb
	SoundRadius=255
	SoundVolume=255
}
