//////////////////////////////////////////////////////////////
//				Feralidragon (09-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTOversShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.000000
	FullSize=2000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.950000)
	NukeFX(0)=(BlurNoise=(Y=15.000000,Z=25.000000),Shake=(Y=75.000000,Z=100.000000),ShakeRate=0.100000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=3500.000000)
}