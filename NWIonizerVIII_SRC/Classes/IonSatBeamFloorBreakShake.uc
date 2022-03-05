//////////////////////////////////////////////////////////////
//				Feralidragon (01-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatBeamFloorBreakShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.000000
	FullSize=10000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=1.000000)
	NukeFX(0)=(BlurNoise=(Y=30.000000,Z=90.000000),Shake=(Y=90.000000,Z=180.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=10000.000000)
}
