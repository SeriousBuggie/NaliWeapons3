//////////////////////////////////////////////////////////////
//				Feralidragon (04-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MBoxMissileExplAfterEffects expands NWNukeShockFX;

defaultproperties
{
	FullTime=0.750000
	FullSize=7500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=0.750000)
	NukeFX(0)=(BlurNoise=(Y=95.000000,Z=95.000000),Shake=(Y=2050.000000,Z=2050.000000),ShakeRate=0.100000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=7500.000000)
}
