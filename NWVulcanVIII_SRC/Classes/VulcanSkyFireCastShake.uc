//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireCastShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=6.500000
	FullSize=20000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=6.000000)
	NukeFX(0)=(BlurNoise=(Y=85.000000,Z=145.000000),Shake=(Y=350.000000,Z=600.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=20000.000000)
}
