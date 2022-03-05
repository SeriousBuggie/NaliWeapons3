//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireLightFog expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=VulcanLightLight FILE=Coronas\VulcanLightLight.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=30000.000000
	FadeInTime=0.100000
	FadeOutTime=0.350000
	CoronaSprite=VulcanLightLight
	MaxCoronaSize=150.00000
	MinCoronaSize=110.000000
	StartScaleTime=0.000000
	EndScaleTime=0.000000
	CGlow=0.750000
	LifeSpan=0.450000
	
	CGlowMax=0.750000
	CGlowMin=0.500000
	DScaleCoefMax=1.100000
	DScaleCoefMin=0.900000
}
