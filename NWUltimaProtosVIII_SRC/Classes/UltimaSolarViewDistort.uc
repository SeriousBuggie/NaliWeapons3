//////////////////////////////////////////////////////////////
//				Feralidragon (25-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarViewDistort expands NWNukeShockFX;

var UltimaSolar SolarOwner;

simulated function float getFOVFactor(byte i)
{
local vector camLoc;
local rotator camRot;
local Actor camActor;

	if (localPlayer == None || SolarOwner == None)
		return Super.getFOVFactor(i);
	localPlayer.PlayerCalcView(camActor, camLoc, camRot);
	return FMax(0.0, (vector(camRot) dot Normal(SolarOwner.Location - camLoc)));
}

defaultproperties
{
	FullTime=120.000000
	FullSize=60000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=4.500000,TimeDuration=2.500000)
	NukeFX(0)=(bAffectFOV=True,FOVDistortion=35,FOVDistortionType=FOVC_Gaussian,FOVRiseFactor=1.000000,bMuffledFOV=True)
	
	NukeFX(1)=(bActive=True,bDistanceBased=False,TimeDelay=7.000000,TimeDuration=0.500000)
	NukeFX(1)=(bAffectFOV=True,FOVDistortion=0,FOVDistortionType=FOVC_Gaussian,FOVRiseFactor=1.000000,bMuffledFOV=True)
	
	NukeFX(2)=(bActive=True,bDistanceBased=False,TimeDelay=8.000000,TimeDuration=0.850000)
	NukeFX(2)=(bAffectFOV=True,FOVDistortion=60,FOVDistortionType=FOVC_Gaussian,FOVRiseFactor=0.350000,bMuffledFOV=True)
	NukeFX(2)=(FlashAmount=(1.000000,1.000000,1.000000),bMuffledFlash=True,FlashScale=1.500000)
}
