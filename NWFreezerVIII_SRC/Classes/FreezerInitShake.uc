//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerInitShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.000000
	FullSize=10000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=1.000000)
	NukeFX(0)=(BlurNoise=(Y=35.000000,Z=70.000000),Shake=(Y=150.000000,Z=350.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=10000.000000)
}
