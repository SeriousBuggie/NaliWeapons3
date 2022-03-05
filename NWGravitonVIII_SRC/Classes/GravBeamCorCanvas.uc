//////////////////////////////////////////////////////////////
//				Feralidragon (22-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravBeamCorCanvas expands GravBeamCorona;

simulated function Tick(float Delta)
{
	Super(NaliTrail).Tick(Delta);
}

defaultproperties
{
	ScaleGlow=0.100000
	bHidden=True
}
