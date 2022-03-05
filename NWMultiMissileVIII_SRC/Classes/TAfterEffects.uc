//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class TAfterEffects expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.500000
	FullSize=1500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.350000)
	NukeFX(0)=(BlurNoise=(Y=50.000000,Z=50.000000),Shake=(Y=1000.000000,Z=1000.000000),ShakeRate=0.100000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=1500.000000)
}
