//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher T-Missile
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class TMissile expands MMissile;

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	Spawn(class'TMissileExplController',,, HitLocation, rotator(HitNormal));
	Spawn(class'TShock',,, HitLocation + HitNormal, rotator(HitNormal));
	SpawnOthers(HitLocation, HitNormal);
	Super.ExplodeX(HitLocation, HitNormal, A);
	if (!Region.Zone.bWaterZone)
		Spawn(Class'TMissileFlamesCarcasses',,, HitLocation);
}

function ExplodeOnWall(vector HitNormal, actor Wall)
{
	Spawn(Class'TMissileWallParts',,, Location, rotator(HitNormal));
}

simulated function SpawnOthers(vector HitLocation, vector HitNormal)
{
	Spawn(class'TAfterEffects',,, HitLocation + HitNormal*10);
}

defaultproperties
{
	ExplosionDecal=Class'TMissileBlastDecal'
	MyDamageType=ThermicExplosion
	DmgRadius=600.000000
	speed=1000.000000
	MaxSpeed=2000.000000
	Damage=700.000000
	MomentumTransfer=360000
	bProjTarget=False
	MultiSkins(3)=MRedFX
	ExplosionNoise=5.000000
}
