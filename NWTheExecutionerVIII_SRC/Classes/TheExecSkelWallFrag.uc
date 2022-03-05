//////////////////////////////////////////////////////////////
//				Feralidragon (29-01-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecSkelWallFrag expands NWWallFrag;

simulated function SpawnWaterSplash(bool inWater, ZoneInfo WZone);

defaultproperties
{
	MinDrawScale=7.000000
	MaxDrawScale=12.000000
	InitMinForce=500.000000
	InitMaxForce=1000.000000
	LifeSpan=4.000000
	LifeSpanVariation=2.00000
}
