//////////////////////////////////////////////////////////////
//	Nali Weapons III Flame Tracker Lava Big Burst
//				Feralidragon (21-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlamesTLavaProjBlob expands FlamesTLavaProj;

simulated function HitWall( vector HitNormal, actor Wall )
{
	if (bMeshEnviroMap)
	{
		SetCollisionSize(0.0, 0.0);
		SetCollision(False, False, False);
		bProjTarget = False;
		bCollideWorld = False;
		SpawnBlobs(HitNormal);
		SetPhysics(PHYS_None);
		Destroy();
	}
	else
		Super.HitWall( HitNormal, Wall);
}

function SpawnBlobs( vector HitNormal)
{
local vector SplashDir, SpPoint;
local byte i;
local FlamesTLavaProj ftlp;
local byte maxAmount;

	maxAmount = Max(1, Class'FlameTracker'.default.LavaBlobsAmount);
	for (i = 0; i < maxAmount; i++)
	{
		SplashDir.Z = 2 * FRand() - 1;
		SplashDir.Y = 2 * FRand() - 1;
		SplashDir.X = FRand()*0.75 + 0.25;
		
		SplashDir = Normal(SplashDir >> rotator(HitNormal));
		SpPoint = Location + SplashDir + Normal(Velocity) + HitNormal*2;
		
		ftlp = Spawn(Class'FlamesTLavaProj',,, SpPoint, rotator(SpPoint - Location));
		if (ftlp != None)
		{
			ftlp.Kickback = Kickback;
			ftlp.HealthGiver = HealthGiver;
			ftlp.Splasher = Splasher;
			ftlp.MoreDamage = MoreDamage;
		}
	}
	
	ftlp = Spawn(Class'FlamesTLavaProj',,,, rotator(-HitNormal));
	if (ftlp != None)
	{
		ftlp.Kickback = Kickback;
		ftlp.HealthGiver = HealthGiver;
		ftlp.Splasher = Splasher;
		ftlp.MoreDamage = MoreDamage;
	}
}

defaultproperties
{
	DrawScale=5.000000
	ExplosionDecal=None
	
    LightRadius=6
	
	CollisionRadius=10.000000
    CollisionHeight=10.000000
	speed=1150.000000
	MaxSpeed=1500.000000
	Damage=150.000000
	
	WaterSplashType=2
	Mass=100.000000
}
