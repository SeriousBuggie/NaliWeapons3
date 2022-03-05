//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProtosOVRed expands NWOverPickupFX;

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = 1.25 + FRand();
}

defaultproperties
{
}
