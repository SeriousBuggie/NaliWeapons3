//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher X-Missile
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XMissile expands MMissile;

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
local NaliWEffects shock;

	shock = Spawn(class'XShockwave',,, HitLocation, rotator(HitNormal));
	GiveSpecials(shock);
	
	SpawnOthers(HitLocation, HitNormal);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

simulated function SpawnOthers(vector HitLocation, vector HitNormal)
{
	Spawn(class'XShockCor',,, HitLocation + HitNormal*10);
	Spawn(class'XShockAfterEffects',,, HitLocation + HitNormal*10);
}

function ExplodeOnWall(vector HitNormal, actor Wall)
{
	Spawn(Class'XMissileWallParts',,, Location, rotator(HitNormal));
}

defaultproperties
{
	ExplosionDecal=Class'XMMDecal'
	MyDamageType=MiniNuclear
	DmgRadius=200.000000
	speed=1000.000000
	MaxSpeed=2000.000000
	Damage=1000.000000
	MomentumTransfer=420000
	bProjTarget=False
	MultiSkins(3)=MPurpleFX
	ExplosionNoise=10.000000
}
