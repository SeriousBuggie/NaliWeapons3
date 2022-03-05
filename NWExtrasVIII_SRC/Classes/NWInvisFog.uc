//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWInvisFog expands NWUDamFog;

#exec TEXTURE IMPORT NAME=NWInvisFog FILE=Coronas\NWInvisFog.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=12000.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=NWInvisFog
	MaxCoronaSize=3.500000
	MinCoronaSize=2.000000
	CGlow=0.150000
	StartScaleTime=0.000000
	StartScaleCoef=1.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	CGlowMax=0.000000
	CGlowMin=0.000000
	DScaleCoefMax=1.000000
	DScaleCoefMin=1.000000
	
	LocOffset=(Z=0.000000)
}
