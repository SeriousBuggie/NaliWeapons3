//////////////////////////////////////////////////////////////
//				Feralidragon (24-10-2013)
//
// NW3 VULCAN BUILD 1.00
//////////////////////////////////////////////////////////////

class VulcanSKFMegaProj expands VulcanMiniProj;

function SpawnExplosionFX(vector HitLocation, vector HitNormal, optional actor A)
{
	Spawn(Class'VulcanMegaProjFX');
}

defaultproperties
{
	DrawScale=1.000000
	ExplosionNoise=1.000000
	CanHitInstigator=False
	LifeSpan=4.000000
	
	Damage=100.000000
	MaxSpeed=1500.000000
	speed=1200.000000
	
	TrailClass1=Class'VulcanProjMegaCor'
	WaterSplashType=1
	Mass=25.000000
}
