//////////////////////////////////////////////////////////////
//				Feralidragon (20-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonRocketTakeoffShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=6.000000
	FullSize=2000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=6.000000)
	NukeFX(0)=(BlurNoise=(Y=5.000000,Z=10.000000),Shake=(Y=15.000000,Z=30.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=3000.000000)
}
