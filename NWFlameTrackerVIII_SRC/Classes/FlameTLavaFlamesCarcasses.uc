//////////////////////////////////////////////////////////////
//				Feralidragon (24-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTLavaFlamesCarcasses expands NWCarcassFX;

simulated function ExecuteCarcass( Carcass c, optional byte chosenIndex)
{
	Spawn(Class'NWFlameController', c,, c.Location);
}

defaultproperties
{
	CarcassRadiusCheck=95.000000
	ValidCarcassTypes(0)="CreatureChunks"
	ValidCarcassTypes(1)="UTCreatureChunks"
}
