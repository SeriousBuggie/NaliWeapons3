//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWUDamVertTrace expands NWUDamCor;

#exec TEXTURE IMPORT NAME=NWUDamVertTrace FILE=Coronas\NWUDamVertTrace.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=8000.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=NWUDamVertTrace
	MaxCoronaSize=3.250000
	MinCoronaSize=0.850000
	CGlow=2.000000
	StartScaleTime=0.000000
	StartScaleCoef=2.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	Mass=0.000000
	LifeSpan=0.000000
	bNetTemporary=False
	
	CGlowMax=2.000000
	CGlowMin=1.500000
	DScaleCoefMax=1.050000
	DScaleCoefMin=0.950000
	
	LocOffset=(Z=4.000000)
}
