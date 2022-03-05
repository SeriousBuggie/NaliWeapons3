//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTBreakShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=3.000000
	FullSize=10000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=2.500000)
	NukeFX(0)=(BlurNoise=(Y=200.000000,Z=235.000000),Shake=(Y=1300.000000,Z=1000.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=False,bFadeShakeOnDistance=True,ShakeDistance=10000.000000)
}
