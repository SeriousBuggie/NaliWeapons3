//////////////////////////////////////////////////////////////
//				Feralidragon (14-05-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class TheOversProjCorB expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=TheOversProjCorBR FILE=Coronas\TheOversProjCorBR.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=TheOversProjCorBG FILE=Coronas\TheOversProjCorBG.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=TheOversProjCorBB FILE=Coronas\TheOversProjCorBB.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=40000.000000
	FadeInTime=0.100000
	FadeOutTime=0.000000
	CoronaSprite=TheOversProjCorBR
	MaxCoronaSize=14.000000
	MinCoronaSize=2.000000
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
	
	CTGreen=TheOversProjCorBG
	CTBlue=TheOversProjCorBB
}
