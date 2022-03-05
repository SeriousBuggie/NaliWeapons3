//////////////////////////////////////////////////////////////
//				Feralidragon (12-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREFlamesCarcasses expands NWCarcassFX;

simulated function ExecuteCarcass( Carcass c, optional byte chosenIndex)
{
	Spawn(Class'WREIonFlamesController', c,, c.Location);
}

defaultproperties
{
	CarcassRadiusCheck=275.000000
	ValidCarcassTypes(0)="CreatureChunks"
	ValidCarcassTypes(1)="UTCreatureChunks"
}
