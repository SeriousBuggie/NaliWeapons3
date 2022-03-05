//////////////////////////////////////////////////////////////
//				Feralidragon (15-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolRedLightningLight expands UltimaSolLightningLight;

#exec TEXTURE IMPORT NAME=UltimaCorRedLight FILE=CORONAS\UltimaCorRedLight.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=30000.000000
	FadeInTime=0.100000
	FadeOutTime=0.350000
	CoronaSprite=UltimaCorRedLight
	MaxCoronaSize=35.00000
	MinCoronaSize=25.000000
	StartScaleTime=0.100000
	EndScaleTime=0.350000
	CGlow=2.000000
	LifeSpan=0.450000
	
	CGlowMax=2.000000
	CGlowMin=1.000000
	DScaleCoefMax=1.200000
	DScaleCoefMin=0.800000
}
