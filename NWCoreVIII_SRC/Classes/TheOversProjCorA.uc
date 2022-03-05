//////////////////////////////////////////////////////////////
//				Feralidragon (14-05-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class TheOversProjCorA expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=TheOversProjCorAR FILE=Coronas\TheOversProjCorAR.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=TheOversProjCorAG FILE=Coronas\TheOversProjCorAG.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=TheOversProjCorAB FILE=Coronas\TheOversProjCorAB.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=40000.000000
	FadeInTime=0.100000
	FadeOutTime=0.000000
	CoronaSprite=TheOversProjCorAR
	MaxCoronaSize=2.500000
	MinCoronaSize=0.750000
	CGlow=1.500000
	StartScaleTime=0.100000
	StartScaleCoef=1.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	Mass=0.000000
	LifeSpan=0.000000
	bNetTemporary=False
	
	CGlowMax=1.500000
	CGlowMin=1.000000
	DScaleCoefMax=1.250000
	DScaleCoefMin=0.750000
	
	CTGreen=TheOversProjCorAG
	CTBlue=TheOversProjCorAB
}
