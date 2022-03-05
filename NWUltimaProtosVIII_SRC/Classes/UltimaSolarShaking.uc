//////////////////////////////////////////////////////////////
//				Feralidragon (25-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarShaking expands NWNukeShockFX;

defaultproperties
{
	FullTime=120.000000
	FullSize=60000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=2.000000)
	NukeFX(0)=(BlurNoise=(Y=85.000000,Z=85.000000),Shake=(Y=200.000000,Z=250.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=False,bFadeShakeOnDistance=False,ShakeDistance=60000.000000)
	
	NukeFX(1)=(bActive=True,bDistanceBased=False,TimeDelay=1.00000,TimeDuration=7.000000)
	NukeFX(1)=(BlurNoise=(Y=55.000000,Z=55.000000),Shake=(Y=120.000000,Z=120.000000),ShakeRate=0.050000)
	NukeFX(1)=(bRisingShake=True,bMuffledShake=False,bFadeShakeOnDistance=False,ShakeDistance=60000.000000)
	
	NukeFX(2)=(bActive=True,bDistanceBased=False,TimeDelay=8.00000,TimeDuration=3.000000)
	NukeFX(2)=(BlurNoise=(Y=95.000000,Z=95.000000),Shake=(Y=300.000000,Z=350.000000),ShakeRate=0.050000)
	NukeFX(2)=(bRisingShake=False,bMuffledShake=False,bFadeShakeOnDistance=False,ShakeDistance=60000.000000)
	
	NukeFX(3)=(bActive=True,bDistanceBased=False,TimeDelay=9.00000,TimeDuration=82.000000)
	NukeFX(3)=(BlurNoise=(Y=30.000000,Z=30.000000),Shake=(Y=100.000000,Z=100.000000),ShakeRate=0.050000)
	NukeFX(3)=(bRisingShake=False,bMuffledShake=False,bFadeShakeOnDistance=False,ShakeDistance=60000.000000)
	
	NukeFX(4)=(bActive=True,bDistanceBased=False,TimeDelay=91.00000,TimeDuration=5.000000)
	NukeFX(4)=(BlurNoise=(Y=85.000000,Z=85.000000),Shake=(Y=200.000000,Z=250.000000),ShakeRate=0.050000)
	NukeFX(4)=(bRisingShake=False,bMuffledShake=False,bFadeShakeOnDistance=False,ShakeDistance=60000.000000)
	
	NukeFX(5)=(bActive=True,bDistanceBased=False,TimeDelay=69.00000,TimeDuration=20.000000)
	NukeFX(5)=(BlurNoise=(Y=85.000000,Z=85.000000),Shake=(Y=200.000000,Z=250.000000),ShakeRate=0.050000)
	NukeFX(5)=(bRisingShake=False,bMuffledShake=False,bFadeShakeOnDistance=False,ShakeDistance=60000.000000)
}
