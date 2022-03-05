//////////////////////////////////////////////////////////////
//				Feralidragon (22-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravOverPickupFX expands NWOverPickupFX;

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = 1.25 + FRand()*0.75;
}

defaultproperties
{
}
