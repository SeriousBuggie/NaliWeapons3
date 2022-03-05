//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearCoronaLvlB expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=NuclearCoronaLvlB FILE=Coronas\NuclearCoronaLvlB.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.100000
	FadeOutTime=0.800000
	CoronaSprite=NuclearCoronaLvlB
	MaxCoronaSize=100.000000
	MinCoronaSize=75.000000
	CGlow=2.000000
	StartScaleTime=0.050000
	StartScaleCoef=1.000000
	EndScaleTime=1.000000
	EndScaleCoef=1.000000
	
	Mass=0.000000
	LifeSpan=1.000000
	bNetTemporary=False
}
