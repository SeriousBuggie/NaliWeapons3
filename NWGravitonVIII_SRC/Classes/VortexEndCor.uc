//////////////////////////////////////////////////////////////
//				Feralidragon (08-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class VortexEndCor expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=VortexEndCor FILE=CORONAS\VortexEndCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=20000.000000
	FadeInTime=0.200000
	FadeOutTime=0.100000
	CoronaSprite=VortexEndCor
	MaxCoronaSize=4.500000
	MinCoronaSize=3.000000
	CGlow=2.000000
	StartScaleTime=0.200000
	StartScaleCoef=1.000000
	EndScaleTime=0.100000
	EndScaleCoef=1.000000
	LifeSpan=0.300000
}
