//////////////////////////////////////////////////////////////
//				Feralidragon (15-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjPassShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.800000
	FullSize=1500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.500000)
	NukeFX(0)=(BlurNoise=(Y=20.000000,Z=20.000000),Shake=(Y=300.000000,Z=300.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=1500.000000)
}
