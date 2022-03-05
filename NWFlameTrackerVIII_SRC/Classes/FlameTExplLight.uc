//////////////////////////////////////////////////////////////
//				Feralidragon (24-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTExplLight expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=FlameTFireGlow FILE=CORONAS\FlameTFireGlow.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=5000.000000
	FadeInTime=0.000000
	FadeOutTime=0.450000
	CoronaSprite=FlameTFireGlow
	MaxCoronaSize=1.500000
	MinCoronaSize=1.000000
	CGlow=2.000000
	EndScaleTime=0.450000
	EndScaleCoef=1.000000
	LifeSpan=0.500000
}
