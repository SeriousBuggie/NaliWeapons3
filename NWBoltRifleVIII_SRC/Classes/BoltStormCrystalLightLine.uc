//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormCrystalLightLine expands BoltStormCrystalLight;

#exec TEXTURE IMPORT NAME=BoltLittleLightLine FILE=Coronas\BoltLittleLightLine.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	CoronaSprite=BoltLittleLightLine
	MaxCoronaSize=25.00000
	MinCoronaSize=15.000000
	CGlow=1.000000
	
	CGlowMax=1.200000
	CGlowMin=0.800000
	DScaleCoefMax=1.100000
	DScaleCoefMin=0.900000
}
