//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarWhiteDwarfCorWaveShock expands UltimaSolarBirthCorWaveShock;

#exec TEXTURE IMPORT NAME=WhiteDwarfShock01 FILE=Coronas\WhiteDwarfShock01.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=WhiteDwarfShock02 FILE=Coronas\WhiteDwarfShock02.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=WhiteDwarfShock03 FILE=Coronas\WhiteDwarfShock03.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=WhiteDwarfShock04 FILE=Coronas\WhiteDwarfShock04.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	FadeInTime=7.000000
	FadeOutTime=8.000000
	CoronaSprite=WhiteDwarfShock01
	MaxCoronaSize=1100.000000
	MinCoronaSize=1000.000000
	CGlow=0.200000
	StartScaleTime=0.000000
	EndScaleTime=15.000000
	LifeSpan=15.000000

	WaveTex(0)=WhiteDwarfShock01
	WaveTex(1)=WhiteDwarfShock02
	WaveTex(2)=WhiteDwarfShock03
	WaveTex(3)=WhiteDwarfShock04
}
