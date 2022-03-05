//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltDecalFX expands NWZPDecalGen;

simulated function SpawnEffects()
{
local byte j, Sparks;

	if (Level.NetMode != NM_DedicatedServer && !Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
	{
		Sparks = 10 + Rand(20);
		for (j = 0; j <= Sparks; j++)
			Spawn(class'SBoltSpark',,, Location + 8 * vector(Rotation), Rotation);
	}
	
	Super.SpawnEffects();
}

defaultproperties
{
	DecalClass=Class'SBoltDecal'
}
