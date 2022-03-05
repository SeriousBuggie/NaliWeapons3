//////////////////////////////////////////////////////////////
//				Feralidragon (30-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearShockA expands NWNukeShockFX;

#exec AUDIO IMPORT NAME="NukeShockWaveAmb" FILE=SOUNDS\NukeShockWaveAmb.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="Nuke01Blast" FILE=SOUNDS\Nuke01Blast.wav GROUP="NuclearBlasts"
#exec AUDIO IMPORT NAME="Nuke01BlastMuffled" FILE=SOUNDS\Nuke01BlastMuffled.wav GROUP="NuclearBlasts"

defaultproperties
{
	bAlwaysRelevant=True
	
	FullTime=0.937500
	FullSize=3600.000000
	
	bAutoLifeSpan=False
	LifeSpan=2.500000
	
	NukeFX(0)=(bActive=True)
	NukeFX(0)=(TimeDuration=0.600000)
	NukeFX(0)=(FlashAmount=(X=0.800000,Y=0.800000,Z=0.000000),bMuffledFlash=True,FlashScale=0.500000)
	
	NukeFX(1)=(bActive=True,MinMufflingDist=925.000000)
	NukeFX(1)=(bDistanceBased=True,DistOffsetMin=-4320.000000,DistOffsetMax=128.000000)
	NukeFX(1)=(BlurNoise=(Y=2.500000,Z=2.500000),Shake=(Y=20.000000,Z=20.000000),ShakeRate=0.100000)
	NukeFX(1)=(bRisingShake=True,bMuffledShake=True)
	NukeFX(1)=(AmbSound=Sound'NukeShockWaveAmb',StartVolume=0,EndVolume=255,StartPitch=80,EndPitch=32,bMuffledAmb=True,NegMinTimeDelay=1.000000)
	
	NukeFX(2)=(bActive=True,MinMufflingDist=925.000000)
	NukeFX(2)=(bDistanceBased=True,DistOffsetMin=128.000000,DistOffsetMax=3750.000000)
	NukeFX(2)=(BlurNoise=(Y=15.000000,Z=15.000000),Shake=(Y=200.000000,Z=200.000000),ShakeRate=0.100000)
	NukeFX(2)=(bRisingShake=False,bMuffledShake=True)
	NukeFX(2)=(HitSound=Sound'Nuke01Blast',MufHitSound=Sound'Nuke01BlastMuffled',bMuffledHit=True,bInterruptOtherSnd=True)
	NukeFX(2)=(FlashAmount=(X=0.500000,Y=0.500000,Z=0.500000),bMuffledFlash=True,FlashScale=1.000000)
	
	NukeFX(3)=(bActive=True)
	NukeFX(3)=(bDistanceBased=True,DistOffsetMin=-500.000000,DistOffsetMax=250.000000)
	NukeFX(3)=(bAffectFOV=True,FOVDistortion=35,FOVDistortionType=FOVC_Gaussian,FOVRiseFactor=0.900000,bMuffledFOV=True)
}
