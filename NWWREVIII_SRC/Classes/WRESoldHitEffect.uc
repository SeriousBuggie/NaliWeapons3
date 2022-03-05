//////////////////////////////////////////////////////////////
//				Feralidragon (10-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldHitEffect expands UT_HeavyWallHitEffect;

simulated function SpawnEffects()
{
local byte j;
local vector Dir;
local bool bFog;

	SpawnSound();
	Dir = Vector(Rotation);
	
	bFog = Region.Zone.bFogZone;
	if (bFog)
		Region.Zone.bFogZone = False;
	Spawn(class'WRESoldDecal');
	Region.Zone.bFogZone = bFog;
	
	if (Level.NetMode != NM_DedicatedServer)
		Spawn(class'WRESoldSmokePuff',,,Location + 8 * Vector(Rotation));
	
	if (Region.Zone.bWaterZone || Level.bDropDetail)
		return;
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		for (j = 0; j < 3; j++) 
			spawn(class'WRESoldSpark',,, Location + 8 * Vector(Rotation));
	}
}

defaultproperties
{
	ScaleGlow=1.650000
	bNetOptional=False
	DrawScale=1.200000
}

