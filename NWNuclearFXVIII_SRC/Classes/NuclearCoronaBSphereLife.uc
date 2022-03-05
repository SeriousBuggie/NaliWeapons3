//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearCoronaBSphereLife expands NuclearCoronaB;

#exec TEXTURE IMPORT NAME=NuclearCoronaBLife FILE=Coronas\NuclearCoronaBLife.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	FadeInTime=3.00000
	FadeOutTime=1.000000
	MaxCoronaSize=100.000000
	MinCoronaSize=75.000000
	CGlow=1.750000
	StartScaleTime=15.00000
	StartScaleCoef=1.000000
	EndScaleTime=1.000000
	EndScaleCoef=1.000000
	CoronaSprite=NuclearCoronaBLife

	LifeSpan=16.000000
}
