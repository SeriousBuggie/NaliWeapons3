//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWInvisCor expands NWUDamCor;

#exec TEXTURE IMPORT NAME=NWInvisCor FILE=Coronas\NWInvisCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=8000.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=NWInvisCor
	MaxCoronaSize=0.200000
	MinCoronaSize=0.300000
	CGlow=2.000000
	StartScaleTime=0.000000
	StartScaleCoef=2.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	CGlowMax=2.000000
	CGlowMin=1.500000
	DScaleCoefMax=1.150000
	DScaleCoefMin=0.850000
	
	LocOffset=(Z=0.000000)
}
