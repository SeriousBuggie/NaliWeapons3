//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecSkelShakeStrong expands NWNukeShockFX;

defaultproperties
{
	FullTime=2.200000
	FullSize=10000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=2.200000)
	NukeFX(0)=(BlurNoise=(Y=15.000000,Z=30.000000),Shake=(Y=65.000000,Z=100.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=10000.000000)
}
