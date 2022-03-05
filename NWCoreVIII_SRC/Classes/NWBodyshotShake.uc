//////////////////////////////////////////////////////////////
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBodyshotShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.750000
	FullSize=465.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.750000)
	NukeFX(0)=(BlurNoise=(Y=15.000000,Z=15.000000),Shake=(Y=85.000000,Z=85.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=465.000000)
}
