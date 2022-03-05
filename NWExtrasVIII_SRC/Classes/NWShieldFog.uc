//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWShieldFog expands NWUDamFog;

#exec TEXTURE IMPORT NAME=NWShieldFog FILE=Coronas\NWShieldFog.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=12000.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=NWShieldFog
	MaxCoronaSize=3.350000
	MinCoronaSize=2.250000
	CGlow=0.080000
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
