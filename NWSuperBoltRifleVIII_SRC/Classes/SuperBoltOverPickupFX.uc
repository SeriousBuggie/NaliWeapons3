//////////////////////////////////////////////////////////////
//				Feralidragon (21-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SuperBoltOverPickupFX expands NWOverPickupFX;

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = 1.0 + FRand();
}

defaultproperties
{
}
