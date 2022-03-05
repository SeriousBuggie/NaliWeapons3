//////////////////////////////////////////////////////////////
//				Feralidragon (20-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonRocketTakeoffCor expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=IonRocketTrailCor FILE=Coronas\IonRocketTrailCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.250000
	FadeOutTime=2.000000
	CoronaSprite=IonRocketTrailCor
	MaxCoronaSize=60.000000
	MinCoronaSize=45.000000
	CGlow=2.000000
	StartScaleTime=0.250000
	StartScaleCoef=1.000000
	EndScaleTime=2.000000
	EndScaleCoef=1.000000
	LifeSpan=2.250000
}
