//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMiscExplE expands NukeMiscExpl;

simulated function SetScale(float Scale)
{
	DrawScale = Scale * 8.0;
}

defaultproperties
{
	ScaleGlow=2.000000
	DrawScale=1.000000
}
