//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMiscExplB expands NukeMiscExpl;

simulated function SetScale(float Scale)
{
	DrawScale *= Scale;
}

defaultproperties
{
	ScaleGlow=1.500000
	DrawScale=1.000000
}
