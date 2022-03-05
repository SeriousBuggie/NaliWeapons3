//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireInitLine expands VulcanSkyFireInitLight;

#exec TEXTURE IMPORT NAME=VulcanLightLine FILE=Coronas\VulcanLightLine.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=30000.000000
	CoronaSprite=VulcanLightLine
	MaxCoronaSize=100.00000
	MinCoronaSize=90.000000
	CGlow=2.000000
}
