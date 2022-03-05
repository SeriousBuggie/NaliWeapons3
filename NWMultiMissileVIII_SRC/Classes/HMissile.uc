//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher H-Missile
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class HMissile expands MMissile;

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	Spawn(class'MissileExplAMult',,, HitLocation);
	Spawn(class'MMSmkRing',,, HitLocation);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

defaultproperties
{
	ExplosionDecal=Class'HMissileBlastDecal'
	MyDamageType=RocketExplosion
	DmgRadius=285.000000
	speed=1000.000000
	MaxSpeed=2000.000000
	Damage=150.000000
	MomentumTransfer=120000
	bProjTarget=False
	MultiSkins(3)=MGreenFX
}
