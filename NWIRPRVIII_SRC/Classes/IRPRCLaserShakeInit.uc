//////////////////////////////////////////////////////////////
//				Feralidragon (13-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCLaserShakeInit expands IRPRCLaserShake;

defaultproperties
{
	FullTime=3.000000
	FullSize=6000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=2.000000)
	NukeFX(0)=(BlurNoise=(Y=35.000000,Z=35.000000),Shake=(Y=120.000000,Z=120.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=6000.000000)
}
