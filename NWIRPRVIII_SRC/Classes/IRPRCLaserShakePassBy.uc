//////////////////////////////////////////////////////////////
//				Feralidragon (13-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCLaserShakePassBy expands IRPRCLaserShake;

defaultproperties
{
	FullTime=10.000000
	FullSize=2000.000000
	ShakeSetExtraTime=0.500000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=10.000000)
	NukeFX(0)=(BlurNoise=(Y=15.000000,Z=15.000000),Shake=(Y=50.000000,Z=50.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=2000.000000)
}
