//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN BUILD 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireMegaProj expands VulcanProj;

#exec AUDIO IMPORT NAME="VulcanSkyFireMegaProjAmb" FILE=SOUNDS\VulcanSkyFireMegaProjAmb.wav GROUP="Loop"

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SoundPitch = Byte(Rand(32) + 48);
}

function SpawnExplosionFX(vector HitLocation, vector HitNormal, optional actor A)
{
	if (Carcass(A) != None || Pawn(A) != None)
		return;
	MiniProjDmg = Damage / 5;
	Super.SpawnExplosionFX(HitLocation, HitNormal, A);
}

simulated function SpawnExplosionClientFX(vector HitLocation, vector HitNormal, optional actor A)
{
local byte i;

	Spawn(Class'VulcanSkyFireMegaProjExpl',,, HitLocation + HitNormal);
	Spawn(Class'VulcanSkyFireMegaProjShake',,, HitLocation + HitNormal);
	Spawn(Class'VulcanSkyFireMPWallParts',,, HitLocation + HitNormal, rotator(HitNormal));
	for (i = 0; i < 8; i++)
		Spawn(Class'VulcanSkyFireMegaProjSmallExpl',,, HitLocation + HitNormal + VRand()*200);
}

defaultproperties
{
	ExplosionNoise=3.850000
	DrawScale=18.000000
	LODBias=8.000000
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	
	Damage=1000.000000
	ExplosionDecal=Class'VulcanSkyFireMegaProjDecal'
	ImpactSound=None
	MaxSpeed=3600.000000
	MomentumTransfer=105500
	MyDamageType=Vulcanized
	speed=3500.000000
	DmgRadius=300.000000
	bDirectHit=False
	bDirectionalBlow=False
	LightType=LT_None
	TrailClass1=Class'VulcanSkyFireMegaProjCor'
	TrailClass2=Class'VulcanSkyFireMegaProjLightLine'
	
	enableSmokeGen=True
	bClientOnlySmokeGen=True
	SmokeClass=Class'VulcanSkyFireMegaProjSmokeB'
	SmokeGenRateMax=22.500000
	SmokeGenRateMin=22.500000
	
	bWaterHitFX=True
	WaterSplashType=4
	
	fadeDown=4000.000000
	MiniProjClass=Class'VulcanSKFMegaProj'
	MiniProjAmount=10
	
	AmbientSound=VulcanSkyFireMegaProjAmb
	SoundRadius=255
	SoundVolume=255
}
