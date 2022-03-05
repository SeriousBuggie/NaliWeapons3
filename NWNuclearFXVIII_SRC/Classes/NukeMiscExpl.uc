//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMiscExpl expands NukeElectricExpl;

simulated function SetScale(float Scale)
{
	DrawScale = Scale * 15.0;
}

defaultproperties
{
	Skin=None
	LightType=LT_None
	LightEffect=LE_None
	LightBrightness=0
	LightHue=0
	LightSaturation=30
	LightRadius=0

	ScaleGlow=1.500000
	DrawScale=1.000000
}
