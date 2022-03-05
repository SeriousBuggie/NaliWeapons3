//////////////////////////////////////////////////////////////
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWHeadshotShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.500000
	FullSize=320.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.400000)
	NukeFX(0)=(BlurNoise=(Y=10.000000,Z=10.000000),Shake=(Y=70.000000,Z=70.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=320.000000)
}
