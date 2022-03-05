//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarBirthCorLight expands UltimaSolarBlackHoleCorLight;

#exec TEXTURE IMPORT NAME=UltimaBirthLight FILE=Coronas\UltimaBirthLight.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.200000
	FadeOutTime=2.000000
	CoronaSprite=UltimaBirthLight
	MaxCoronaSize=90.000000
	MinCoronaSize=85.000000
	CGlow=1.000000
	StartScaleTime=0.100000
	EndScaleTime=0.000000
	LifeSpan=17.000000
	
	CGlowMax=1.100000
	CGlowMin=0.700000
	DScaleCoefMax=1.350000
	DScaleCoefMin=0.700000
}
