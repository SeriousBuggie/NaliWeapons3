//////////////////////////////////////////////////////////////
//				Feralidragon (14-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCLaserFogLight expands IRPRCLaserLight;

#exec TEXTURE IMPORT NAME=IRPRCLaserFogLight FILE=Coronas\IRPRCLaserFogLight.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=40000.000000
	FadeInTime=0.100000
	FadeOutTime=0.250000
	CoronaSprite=IRPRCLaserFogLight
	MaxCoronaSize=10.50000
	MinCoronaSize=6.000000
	StartScaleTime=0.000000
	EndScaleTime=0.000000
	CGlow=0.500000
	LifeSpan=4.000000
	
	CGlowMax=1.100000
	CGlowMin=0.800000
	DScaleCoefMax=1.100000
	DScaleCoefMin=0.800000
}
