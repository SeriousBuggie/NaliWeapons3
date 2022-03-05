//////////////////////////////////////////////////////////////
//				Feralidragon (24-02-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreSkelSmkMaster expands NWGoreSkelSmk;

simulated function PostBeginPlay();

simulated function Tick(float Delta);

defaultproperties
{
	bAnimByOwner=False
	DrawScale=0.010000
	LodBIAS=0.010000
	Physics=PHYS_None
	bParticles=False
	bHidden=True
}
