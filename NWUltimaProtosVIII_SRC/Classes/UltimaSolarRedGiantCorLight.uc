//////////////////////////////////////////////////////////////
//				Feralidragon (19-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarRedGiantCorLight expands UltimaSolarBirthCorLight;

#exec TEXTURE IMPORT NAME=UltimaRedGiantLight FILE=Coronas\UltimaRedGiantLight.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	FadeInTime=5.000000
	FadeOutTime=1.000000
	CoronaSprite=UltimaRedGiantLight
	MaxCoronaSize=610.000000
	MinCoronaSize=600.000000
	CGlow=1.500000
	StartScaleTime=0.000000
	EndScaleTime=0.000000
	LifeSpan=26.000000
	
	CGlowMax=2.000000
	CGlowMin=1.500000
	DScaleCoefMax=1.350000
	DScaleCoefMin=0.700000
}
