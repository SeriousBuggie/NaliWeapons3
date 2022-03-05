//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerQuakeShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=4.000000
	FullSize=10000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=3.500000)
	NukeFX(0)=(BlurNoise=(Y=15.000000,Z=40.000000),Shake=(Y=50.000000,Z=100.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=True,bMuffledShake=False,bFadeShakeOnDistance=True,ShakeDistance=10000.000000)
}
