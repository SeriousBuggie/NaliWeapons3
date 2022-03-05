//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearCoronaLvlA expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=NuclearCoronaLvlA FILE=Coronas\NuclearCoronaLvlA.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.100000
	FadeOutTime=0.500000
	CoronaSprite=NuclearCoronaLvlA
	MaxCoronaSize=50.000000
	MinCoronaSize=35.000000
	CGlow=2.000000
	StartScaleTime=0.050000
	StartScaleCoef=1.000000
	EndScaleTime=0.500000
	EndScaleCoef=1.000000
	
	Mass=0.000000
	LifeSpan=0.750000
	bNetTemporary=False
}
