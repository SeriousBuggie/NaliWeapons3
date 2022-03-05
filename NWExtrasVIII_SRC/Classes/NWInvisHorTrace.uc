//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWInvisHorTrace expands NWUDamVertTrace;

#exec TEXTURE IMPORT NAME=NWInvisHorTrace FILE=Coronas\NWInvisHorTrace.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=8000.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=NWInvisHorTrace
	MaxCoronaSize=2.250000
	MinCoronaSize=0.850000
	CGlow=2.000000
	StartScaleTime=0.000000
	StartScaleCoef=2.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	CGlowMax=2.000000
	CGlowMin=1.500000
	DScaleCoefMax=1.050000
	DScaleCoefMin=0.950000
	
	LocOffset=(Z=0.000000)
}
