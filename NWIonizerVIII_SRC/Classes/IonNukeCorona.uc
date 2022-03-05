//////////////////////////////////////////////////////////////
//				Feralidragon (08-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeCorona expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=IonNukeCorona FILE=Coronas\IonNukeCorona.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.250000
	FadeOutTime=1.000000
	CoronaSprite=IonNukeCorona
	MaxCoronaSize=800.000000
	MinCoronaSize=700.000000
	CGlow=2.000000
	StartScaleTime=0.250000
	StartScaleCoef=1.000000
	EndScaleTime=4.500000
	EndScaleCoef=1.000000
	
	Mass=0.000000
	LifeSpan=3.500000
	bNetTemporary=False
}
