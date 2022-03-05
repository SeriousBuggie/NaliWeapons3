//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////

class TheMinerGndMineFieldInitLight expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=TheMinerOversCor FILE=Coronas\TheMinerOversCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=30000.000000
	FadeInTime=0.100000
	FadeOutTime=0.500000
	CoronaSprite=TheMinerOversCor
	MaxCoronaSize=5.00000
	MinCoronaSize=3.000000
	StartScaleTime=0.250000
	EndScaleTime=1.000000
	CGlow=1.500000
	LifeSpan=2.000000
	
	CGlowMax=1.000000
	CGlowMin=0.500000
	DScaleCoefMax=1.100000
	DScaleCoefMin=0.900000
}
