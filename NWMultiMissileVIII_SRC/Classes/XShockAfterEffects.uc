//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XShockAfterEffects expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.500000
	FullSize=2500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=1.000000)
	NukeFX(0)=(BlurNoise=(Y=100.000000,Z=100.000000),Shake=(Y=2000.000000,Z=2000.000000),ShakeRate=0.500000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=2500.000000)
}
