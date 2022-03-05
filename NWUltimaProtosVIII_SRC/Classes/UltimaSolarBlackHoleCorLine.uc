//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarBlackHoleCorLine expands UltimaSolarBlackHoleCorLight;

#exec TEXTURE IMPORT NAME=UltimaCorLine FILE=Coronas\UltimaCorLine.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	CoronaSprite=UltimaCorLine
	MaxCoronaSize=75.000000
	MinCoronaSize=70.000000
}
