//////////////////////////////////////////////////////////////
//				Feralidragon (04-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMBaseFireShake expands NWNukeShockFX;

defaultproperties
{
	FullTime=1.000000
	FullSize=1500.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=1.000000)
	NukeFX(0)=(BlurNoise=(Y=25.000000,Z=25.000000),Shake=(Y=60.000000,Z=60.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=1500.000000)
}
