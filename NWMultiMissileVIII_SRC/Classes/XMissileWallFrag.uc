//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XMissileWallFrag expands NWWallFrag;

simulated function SpawnWaterSplash(bool inWater, ZoneInfo WZone)
{
	if (Class'NuclearExplosions'.default.enableNukeDebrisWaterFX)
		Super.SpawnWaterSplash(inWater, WZone);
}

defaultproperties
{
	MinDrawScale=3.650000
	MaxDrawScale=6.650000
	
	InitMinForce=650.000000
	InitMaxForce=1500.000000
}
