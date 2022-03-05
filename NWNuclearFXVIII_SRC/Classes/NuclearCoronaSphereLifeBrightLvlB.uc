//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearCoronaSphereLifeBrightLvlB expands NuclearCoronaB;

#exec TEXTURE IMPORT NAME=NuclearCoronaLvlB FILE=CORONAS\NuclearCoronaLvlB.bmp GROUP=Coronas

defaultproperties
{
	FadeInTime=0.37500
	FadeOutTime=1.200000
	MaxCoronaSize=25.500000
	MinCoronaSize=15.500000
	CGlow=2.000000
	StartScaleTime=1.500000
	StartScaleCoef=1.000000
	EndScaleTime=0.500000
	EndScaleCoef=1.000000
	CoronaSprite=NuclearCoronaLvlB

	LifeSpan=2.000000
}
