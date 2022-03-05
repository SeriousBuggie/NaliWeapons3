//////////////////////////////////////////////////////////////
//				Feralidragon (09-05-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class TheOversProjShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.000000
	FullSize=2500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=1.000000)
	NukeFX(0)=(BlurNoise=(Y=50.000000,Z=50.000000),Shake=(Y=225.000000,Z=225.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=2500.000000)
}
