//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeAWallFrag expands NWWallFrag;

simulated function SpawnWaterSplash(bool inWater, ZoneInfo WZone)
{
	if (Class'NuclearExplosions'.default.enableNukeDebrisWaterFX)
		Super.SpawnWaterSplash(inWater, WZone);
}

defaultproperties
{
	MinDrawScale=4.750000
	MaxDrawScale=9.650000
	
	InitMinForce=650.000000
	InitMaxForce=1500.000000
}
