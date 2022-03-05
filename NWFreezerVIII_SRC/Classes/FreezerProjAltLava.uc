//////////////////////////////////////////////////////////////
//	Nali Weapons III Freezer underwater projectile
//				Feralidragon (05-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerProjAltLava expands FreezerProjAlt;

function SpawnExplosionFX(vector HitLocation, vector HitNormal)
{
	Spawn(Class'FreezeProjWallParts',,, HitLocation + HitNormal, rotator(HitNormal));
	Spawn(Class'FreezeProjRemainLava');
}

defaultproperties
{
	Style=STY_Normal
	ScaleGlow=2.500000
	bMeshEnviroMap=False
	MultiSkins(1)=IceFlamesBaseSk
	
	TrailClass1=Class'FreezerProAltTrailRoundFX'
}
