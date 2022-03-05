//////////////////////////////////////////////////////////////
//				Feralidragon (14-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatDmgExplShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.000000
	FullSize=3000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=1.000000)
	NukeFX(0)=(BlurNoise=(Y=20.000000,Z=40.000000),Shake=(Y=45.000000,Z=120.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=3000.000000)
}
