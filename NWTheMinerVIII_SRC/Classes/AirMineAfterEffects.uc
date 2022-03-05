//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class AirMineAfterEffects expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.500000
	FullSize=2500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.350000)
	NukeFX(0)=(BlurNoise=(Y=75.000000,Z=75.000000),Shake=(Y=2000.000000,Z=2000.000000),ShakeRate=0.100000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=2500.000000)
}
