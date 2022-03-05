//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class FMineAfterEffects expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.550000
	FullSize=3500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.550000)
	NukeFX(0)=(BlurNoise=(Y=85.000000,Z=85.000000),Shake=(Y=1550.000000,Z=1550.000000),ShakeRate=0.100000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=3500.000000)
}
