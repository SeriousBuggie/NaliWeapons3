//////////////////////////////////////////////////////////////
//				Feralidragon (01-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjBurstShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.400000
	FullSize=1500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.200000)
	NukeFX(0)=(BlurNoise=(Y=2.500000,Z=5.000000),Shake=(Y=7.500000,Z=15.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=1500.000000)
}
