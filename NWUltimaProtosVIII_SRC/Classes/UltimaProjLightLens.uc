//////////////////////////////////////////////////////////////
//				Feralidragon (01-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjLightLens expands UltimaProjLightStart;

#exec TEXTURE IMPORT NAME=UltimaProjLightLens FILE=Coronas\UltimaProjLightLens.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
    Texture=UltimaProjLightLens
	
	LifeSpan=4.000000
	DrawScale=1.000000
	ScaleGlow=0.250000
	
	enableScaling=False
	FlickerFactorMax=1.150000
	FlickerFactorMin=0.850000
	fadeInTime=0.800000
	fadeOutTime=0.600000
}
