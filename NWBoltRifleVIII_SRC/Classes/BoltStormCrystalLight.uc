//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormCrystalLight expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=BoltLittleLightBlue FILE=Coronas\BoltLittleLightBlue.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=30000.000000
	FadeInTime=0.100000
	FadeOutTime=0.000000
	CoronaSprite=BoltLittleLightBlue
	MaxCoronaSize=12.50000
	MinCoronaSize=7.500000
	StartScaleTime=0.100000
	EndScaleTime=0.000000
	CGlow=2.000000
	LifeSpan=0.000000
	
	CGlowMax=2.000000
	CGlowMin=1.000000
	DScaleCoefMax=1.100000
	DScaleCoefMin=0.900000
}
