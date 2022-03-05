//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltDecalFX expands NWZPDecalGen;

simulated function SpawnEffects()
{
local byte j, Sparks;

	if (Level.NetMode != NM_DedicatedServer && !Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
	{
		Sparks = 5 + Rand(10);
		for (j = 0; j <= Sparks; j++) 
			Spawn(Class'BoltSpark',,, Location + 8 * vector(Rotation), Rotation);
	}
	
	Super.SpawnEffects();
}

defaultproperties
{
	DecalClass=Class'BoltDecal'
}
