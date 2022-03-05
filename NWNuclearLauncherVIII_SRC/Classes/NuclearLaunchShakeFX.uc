//////////////////////////////////////////////////////////////
//				Feralidragon (10-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLaunchShakeFX expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.500000
	FullSize=500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=1.450000)
	NukeFX(0)=(BlurNoise=(Y=4.750000,Z=9.500000),Shake=(Y=15.000000,Z=45.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=350.000000)
}