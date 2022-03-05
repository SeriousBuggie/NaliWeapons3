//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher Normal Missile
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class RegMissile expands MMissile;

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	SpawnExplosionFX(HitLocation);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function SpawnExplosionFX( vector HitLocation)
{
	Spawn(class'MissileExplAMult',,, HitLocation);
}

defaultproperties
{
	ExplosionDecal=Class'RegMissileBlastDecal'
	MyDamageType=RocketExplosion
	DmgRadius=255.000000
	speed=1000.000000
	MaxSpeed=2000.000000
	Damage=75.000000
	MomentumTransfer=80000
	bProjTarget=False
	MultiSkins(3)=MYellowFX
	bNetTemporary=True
}
