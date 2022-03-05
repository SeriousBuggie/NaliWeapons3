//////////////////////////////////////////////////////////////
//				Feralidragon (30-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearShockE expands NWNukeShockFX;

#exec AUDIO IMPORT NAME="NukeShockWaveAmb" FILE=SOUNDS\NukeShockWaveAmb.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="Nuke05Blast" FILE=SOUNDS\Nuke05Blast.wav GROUP="NuclearBlasts"
#exec AUDIO IMPORT NAME="Nuke05BlastMuffled" FILE=SOUNDS\Nuke05BlastMuffled.wav GROUP="NuclearBlasts"

defaultproperties
{
	bAlwaysRelevant=True
	
	FullTime=15.000000
	FullSize=57600.000000
	
	bAutoLifeSpan=False
	LifeSpan=80.000000
	
	NukeFX(0)=(bActive=True)
	NukeFX(0)=(TimeDuration=0.500000)
	NukeFX(0)=(FlashAmount=(X=10.000000,Y=0.000000,Z=0.000000),bMuffledFlash=True,FlashScale=2.000000)
	
	NukeFX(1)=(bActive=True,MinMufflingDist=15000.000000)
	NukeFX(1)=(bDistanceBased=True,DistOffsetMin=-8640.000000,DistOffsetMax=128.000000)
	NukeFX(1)=(BlurNoise=(Y=15.000000,Z=15.000000),Shake=(Y=125.000000,Z=125.000000),ShakeRate=0.100000)
	NukeFX(1)=(bRisingShake=True,bMuffledShake=True)
	NukeFX(1)=(AmbSound=Sound'NukeShockWaveAmb',StartVolume=0,EndVolume=255,StartPitch=80,EndPitch=32,bMuffledAmb=True,NegMinTimeDelay=1.000000)
	
	NukeFX(2)=(bActive=True,MinMufflingDist=15000.000000)
	NukeFX(2)=(bDistanceBased=True,DistOffsetMin=128.000000,DistOffsetMax=70000.000000)
	NukeFX(2)=(BlurNoise=(Y=40.000000,Z=40.000000),Shake=(Y=600.000000,Z=600.000000),ShakeRate=0.100000)
	NukeFX(2)=(bRisingShake=False,bMuffledShake=True)
	NukeFX(2)=(HitSound=Sound'Nuke05Blast',MufHitSound=Sound'Nuke05BlastMuffled',bMuffledHit=True,bInterruptOtherSnd=True)
	NukeFX(2)=(FlashAmount=(X=0.600000,Y=0.600000,Z=0.600000),bMuffledFlash=True,FlashScale=2.000000)
	
	NukeFX(3)=(bActive=True)
	NukeFX(3)=(bDistanceBased=True,DistOffsetMin=-500.000000,DistOffsetMax=250.000000)
	NukeFX(3)=(bAffectFOV=True,FOVDistortion=35,FOVDistortionType=FOVC_Gaussian,FOVRiseFactor=0.900000,bMuffledFOV=True)
	
	NukeFX(4)=(bActive=True,bDistanceBased=False,TimeDelay=14.000000,TimeDuration=6.000000)
	NukeFX(4)=(BlurNoise=(Y=50.000000,Z=50.000000),Shake=(Y=400.000000,Z=400.000000),ShakeRate=0.100000)
	NukeFX(4)=(bRisingShake=False,bMuffledShake=True)
}
