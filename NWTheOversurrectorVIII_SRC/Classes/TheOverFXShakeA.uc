//////////////////////////////////////////////////////////////
//				Feralidragon (05-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOverFXShakeA expands NWNukeShockFX;

defaultproperties
{
	FullTime=2.500000
	FullSize=850.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.850000,TimeDuration=2.000000)
	NukeFX(0)=(BlurNoise=(Y=3.500000,Z=5.000000),Shake=(Y=10.000000,Z=20.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=850.000000)
}
