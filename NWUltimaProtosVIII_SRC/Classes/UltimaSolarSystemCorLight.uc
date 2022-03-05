//////////////////////////////////////////////////////////////
//				Feralidragon (19-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarSystemCorLight expands UltimaSolarBirthCorLight;

#exec TEXTURE IMPORT NAME=UltimaSystemLight FILE=Coronas\UltimaSystemLight.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	FadeInTime=5.000000
	FadeOutTime=3.000000
	CoronaSprite=UltimaSystemLight
	MaxCoronaSize=210.000000
	MinCoronaSize=200.000000
	CGlow=1.000000
	StartScaleTime=0.000000
	EndScaleTime=0.000000
	LifeSpan=20.000000
	
	CGlowMax=1.200000
	CGlowMin=0.800000
	DScaleCoefMax=1.350000
	DScaleCoefMin=0.700000
}
