//////////////////////////////////////////////////////////////
//				Feralidragon (13-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCLaserShake expands NWNukeShockFX;

var() float ShakeSetExtraTime;

simulated function SetShakeDuration(float t)
{
	NukeFX[0].TimeDuration = t + ShakeSetExtraTime;
	FullTime = t + ShakeSetExtraTime*2;
	if (bAutoLifeSpan)
		LifeSpan = FullTime;
	else
		LifeCount = FullTime;
}

defaultproperties
{
	FullTime=11.000000
	FullSize=4000.000000
	ShakeSetExtraTime=1.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=10.000000)
	NukeFX(0)=(BlurNoise=(Y=15.000000,Z=15.000000),Shake=(Y=60.000000,Z=60.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=4000.000000)
}
