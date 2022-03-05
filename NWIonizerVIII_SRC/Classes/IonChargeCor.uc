//////////////////////////////////////////////////////////////
//				Feralidragon (23-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonChargeCor expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=IonChargeCor FILE=Coronas\IonChargeCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=5.000000
	FadeOutTime=2.000000
	CoronaSprite=IonChargeCor
	MaxCoronaSize=5.000000
	MinCoronaSize=3.000000
	CGlow=3.500000
	StartScaleTime=10.000000
	StartScaleCoef=1.000000
	EndScaleTime=2.000000
	EndScaleCoef=1.000000
	LifeSpan=12.000000
	bNetTemporary=False
}
