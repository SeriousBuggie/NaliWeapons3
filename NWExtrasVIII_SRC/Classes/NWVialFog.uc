//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWVialFog expands NWUDamFog;

#exec TEXTURE IMPORT NAME=NWVialFog FILE=Coronas\NWVialFog.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=12000.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=NWVialFog
	MaxCoronaSize=0.850000
	MinCoronaSize=0.650000
	CGlow=0.070000
	StartScaleTime=0.000000
	StartScaleCoef=1.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	CGlowMax=0.000000
	CGlowMin=0.000000
	DScaleCoefMax=1.000000
	DScaleCoefMin=1.000000
	
	LocOffset=(Z=-17.000000)
}
