//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerBreakShake expands NWNukeShockFX;

simulated function SetShake(float mult)
{
	NukeFX[0].BlurNoise *= mult;
	NukeFX[0].Shake *= mult;
	NukeFX[0].ShakeDistance *= mult;
}

defaultproperties
{
	FullTime=3.000000
	FullSize=10000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=0.00000,TimeDuration=2.500000)
	NukeFX(0)=(BlurNoise=(Y=100.000000,Z=135.000000),Shake=(Y=1000.000000,Z=700.000000),ShakeRate=0.050000)
	NukeFX(0)=(bRisingShake=False,bMuffledShake=False,bFadeShakeOnDistance=True,ShakeDistance=10000.000000)
}
