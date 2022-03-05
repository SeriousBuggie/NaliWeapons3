//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlamesTGndLavaBigProj expands FlamesTLavaProj;

function PreBeginPlay()
{
	if (Class'FlameTracker'.default.OversurrectiveBlobsDamage > 0)
		Damage = Class'FlameTracker'.default.OversurrectiveBlobsDamage;
	Super.PreBeginPlay();
}

function SpawnFear();

function SetScale(float newScale)
{
local float newRad, newHeight;

	Super.SetScale(newScale);
	newRad = newScale * default.CollisionRadius / default.DrawScale;
	newHeight = newScale * default.CollisionHeight / default.DrawScale;
	SetCollisionSize(newRad, newHeight);
}

defaultproperties
{
	DrawScale=15.000000
	ExplosionDecal=None
	
    LightRadius=10
	
	CollisionRadius=10.000000
    CollisionHeight=10.000000
	speed=1500.000000
	MaxSpeed=2000.000000
	Damage=500.000000
	
	WaterSplashType=4
	Mass=400.000000
	bCumulativeGlob=False
	
	LifeSpan=25.000000
	TimeToExplode=12.000000
	MaxScale=30.000000
	SmokeClass=None
	CeilStickOdds=0.250000
	FlameTExplClass=Class'FlameTLavaExplosionBig'
}
