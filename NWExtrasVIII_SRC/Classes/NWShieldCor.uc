//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWShieldCor expands NWUDamCor;

#exec TEXTURE IMPORT NAME=NWShieldCor FILE=Coronas\NWShieldCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=8000.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=NWShieldCor
	MaxCoronaSize=0.350000
	MinCoronaSize=0.150000
	CGlow=2.000000
	StartScaleTime=0.000000
	StartScaleCoef=2.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	CGlowMax=2.000000
	CGlowMin=1.500000
	DScaleCoefMax=1.150000
	DScaleCoefMin=0.850000
	
	LocOffset=(X=15.000000,Y=0.000000,Z=0.000000)
}
