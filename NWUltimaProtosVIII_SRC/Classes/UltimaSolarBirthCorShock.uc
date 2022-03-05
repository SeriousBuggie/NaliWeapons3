//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarBirthCorShock expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=BirthShock FILE=Coronas\BirthShock.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.000000
	FadeOutTime=6.750000
	CoronaSprite=BirthShock
	MaxCoronaSize=300.000000
	MinCoronaSize=250.000000
	CGlow=0.350000
	StartScaleTime=6.750000
	EndScaleTime=0.000000
	LifeSpan=6.750000
}
