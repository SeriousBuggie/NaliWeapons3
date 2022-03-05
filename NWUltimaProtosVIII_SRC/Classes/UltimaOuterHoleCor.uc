//////////////////////////////////////////////////////////////
//				Feralidragon (25-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaOuterHoleCor expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=UltimaDarkOuter FILE=Coronas\UltimaDarkOuter.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	Style=STY_Modulated
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=UltimaDarkOuter
	MaxCoronaSize=100.00000
	MinCoronaSize=85.000000
	StartScaleTime=0.200000
	EndScaleTime=0.000000
	CGlow=1.000000
	LifeSpan=17.000000
}
