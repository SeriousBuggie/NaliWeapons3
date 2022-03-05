//////////////////////////////////////////////////////////////
//				Feralidragon (25-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaBlackHoleCor expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=UltimaBlackHole FILE=Coronas\UltimaBlackHole.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	Style=STY_Modulated
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=UltimaBlackHole
	MaxCoronaSize=250.00000
	MinCoronaSize=225.000000
	StartScaleTime=7.500000
	EndScaleTime=0.000000
	CGlow=1.000000
	LifeSpan=7.500000

	DScaleCoefMax=1.100000
	DScaleCoefMin=0.900000
}
