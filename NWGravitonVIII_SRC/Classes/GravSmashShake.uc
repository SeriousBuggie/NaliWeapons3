//////////////////////////////////////////////////////////////
//				Feralidragon (21-01-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravSmashShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.500000
	FullSize=340.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.400000)
	NukeFX(0)=(BlurNoise=(Y=12.500000,Z=12.500000),Shake=(Y=100.000000,Z=100.000000),ShakeRate=0.100000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=420.000000)
}
