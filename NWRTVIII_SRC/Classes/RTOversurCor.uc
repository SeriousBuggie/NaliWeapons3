//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTOversurCor expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=RTOversurCor FILE=CORONAS\RTOversurCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=50000.000000
	FadeInTime=0.000000
	FadeOutTime=1.000000
	StartScaleTime=0.100000
	EndScaleTime=1.400000
	
	CoronaSprite=RTOversurCor
	CGlowMax=2.000000
	CGlowMin=1.500000
	MaxCoronaSize=60.000000
	MinCoronaSize=45.500000
	CGlow=1.500000
	LifeSpan=1.500000
	
	bForceNoColDetail=True
}
