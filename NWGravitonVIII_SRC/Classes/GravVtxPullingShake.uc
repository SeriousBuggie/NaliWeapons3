//////////////////////////////////////////////////////////////
//				Feralidragon (25-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVtxPullingShake expands NWNukeShockFX;

simulated function SetShakeDuration(float t)
{
	NukeFX[0].TimeDuration = t + 1.0;
	FullTime = t + 2.0;
	if (bAutoLifeSpan)
		LifeSpan = FullTime;
	else
		LifeCount = FullTime;
}

defaultproperties
{
	FullTime=11.000000
	FullSize=10000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=10.000000)
	NukeFX(0)=(BlurNoise=(Y=10.000000,Z=35.000000),Shake=(Y=35.000000,Z=150.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=True,bFadeShakeOnDistance=True,ShakeDistance=10000.000000)
}
