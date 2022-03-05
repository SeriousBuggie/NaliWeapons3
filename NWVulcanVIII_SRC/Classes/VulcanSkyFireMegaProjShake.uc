//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireMegaProjShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=4.500000
	FullSize=2500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=4.500000)
	NukeFX(0)=(BlurNoise=(Y=55.000000,Z=70.000000),Shake=(Y=600.000000,Z=850.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=2500.000000)
}
