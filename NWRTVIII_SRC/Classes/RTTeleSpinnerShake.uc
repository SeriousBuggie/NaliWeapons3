//////////////////////////////////////////////////////////////
//				Feralidragon (09-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTeleSpinnerShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.000000
	FullSize=500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.750000)
	NukeFX(0)=(BlurNoise=(Y=6.750000,Z=10.500000),Shake=(Y=30.000000,Z=30.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=550.000000)
}