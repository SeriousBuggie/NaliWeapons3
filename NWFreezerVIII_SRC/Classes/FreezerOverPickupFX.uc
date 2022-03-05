//////////////////////////////////////////////////////////////
//				Feralidragon (02-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerOverPickupFX expands NWOverPickupFX;

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = 0.95 + FRand()*0.95;
}

defaultproperties
{
}
