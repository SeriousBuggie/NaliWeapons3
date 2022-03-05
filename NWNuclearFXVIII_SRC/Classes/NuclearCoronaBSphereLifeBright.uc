//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearCoronaBSphereLifeBright expands NuclearCoronaB;

#exec TEXTURE IMPORT NAME=NuclearCoronaBLifeBright FILE=Coronas\NuclearCoronaBLifeBright.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	FadeInTime=3.00000
	FadeOutTime=5.000000
	MaxCoronaSize=200.000000
	MinCoronaSize=150.000000
	CGlow=2.000000
	StartScaleTime=10.00000
	StartScaleCoef=1.000000
	EndScaleTime=4.000000
	EndScaleCoef=1.000000
	CoronaSprite=NuclearCoronaBLifeBright

	LifeSpan=14.500000
}
