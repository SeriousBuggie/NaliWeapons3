//////////////////////////////////////////////////////////////
//	Nali Weapons III ZP Decal Generator class
//				Feralidragon (21-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWZPDecalGen expands NWDecalGen
abstract;

simulated function SpawnEffects()
{
	if (Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
		return;
	Super.SpawnEffects();
}

defaultproperties
{
}