//////////////////////////////////////////////////////////////
//	Nali Weapons III Color Component class
//				Feralidragon (20-07-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliColorComp expands Effects;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		bHidden = (ScaleGlow <= 0);
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_Trailer
	LifeSpan=0.000000
	Mass=0.000000
	Style=STY_Translucent
	bAnimByOwner=False
}