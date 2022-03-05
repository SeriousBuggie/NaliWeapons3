//////////////////////////////////////////////////////////////
//				Feralidragon (14-07-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonCorFog expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=IonCorFog FILE=Coronas\IonCorFog.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.250000
	FadeOutTime=5.500000
	MaxCoronaSize=2000.000000
	MinCoronaSize=1800.000000
	CGlow=1.000000
	StartScaleTime=0.000000
	StartScaleCoef=1.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	CoronaSprite=IonCorFog
	
	LifeSpan=8.000000
}
