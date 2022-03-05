//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearCoronaB expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=NuclearCoronaB FILE=Coronas\NuclearCoronaB.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.250000
	FadeOutTime=1.000000
	CoronaSprite=NuclearCoronaB
	MaxCoronaSize=800.000000
	MinCoronaSize=700.000000
	CGlow=2.000000
	StartScaleTime=0.250000
	StartScaleCoef=1.000000
	EndScaleTime=4.500000
	EndScaleCoef=1.000000
	
	Mass=0.000000
	LifeSpan=5.000000
	bNetTemporary=False
}
