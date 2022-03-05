//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLensA expands NuclearCoronaA;

#exec TEXTURE IMPORT NAME=NuclearLensflare FILE=Coronas\NuclearLensflare.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.250000
	FadeOutTime=1.350000
	CoronaSprite=NuclearLensflare
	MaxCoronaSize=250.000000
	MinCoronaSize=100.000000
	CGlow=2.000000
	StartScaleTime=0.000000
	StartScaleCoef=1.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000

	LifeSpan=6.350000
}
