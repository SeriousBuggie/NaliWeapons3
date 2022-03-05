//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class TMissileFlamesCarcasses expands NWCarcassFX;

simulated function ExecuteCarcass( Carcass c, optional byte chosenIndex)
{
	Spawn(Class'NWFlameController', c,, c.Location);
}

defaultproperties
{
	CarcassRadiusCheck=700.000000
	ValidCarcassTypes(0)="CreatureChunks"
	ValidCarcassTypes(1)="UTCreatureChunks"
	bSplashEffected=True
	SplashType=SPLX_Splash
}
