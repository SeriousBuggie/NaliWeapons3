//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecChargeShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.000000
	FullSize=3000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=1.000000)
	NukeFX(0)=(BlurNoise=(Y=5.000000,Z=10.000000),Shake=(Y=15.000000,Z=40.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=500.000000)
}
