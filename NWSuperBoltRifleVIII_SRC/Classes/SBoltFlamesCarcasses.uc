//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltFlamesCarcasses expands NWCarcassFX;

simulated function ExecuteCarcass( Carcass c, optional byte chosenIndex)
{
	Spawn(Class'NWFlameController', c,, c.Location);
}

defaultproperties
{
	CarcassRadiusCheck=200.000000
	ValidCarcassTypes(0)="CreatureChunks"
	ValidCarcassTypes(1)="UTCreatureChunks"
	SplashType=SPLX_Precise
}
