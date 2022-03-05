//////////////////////////////////////////////////////////////
//				Feralidragon (30-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearShockC expands NWNukeShockFX;

#exec AUDIO IMPORT NAME="NukeShockWaveAmb" FILE=SOUNDS\NukeShockWaveAmb.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="Nuke03Blast" FILE=SOUNDS\Nuke03Blast.wav GROUP="NuclearBlasts"
#exec AUDIO IMPORT NAME="Nuke03BlastMuffled" FILE=SOUNDS\Nuke03BlastMuffled.wav GROUP="NuclearBlasts"
#exec AUDIO IMPORT NAME="Nuke03Final" FILE=SOUNDS\Nuke03Final.wav GROUP="NuclearBlasts"
#exec AUDIO IMPORT NAME="Nuke03FinalMuffled" FILE=SOUNDS\Nuke03FinalMuffled.wav GROUP="NuclearBlasts"

defaultproperties
{
	bAlwaysRelevant=True
	
	FullTime=3.750000
	FullSize=14400.000000
	
	bAutoLifeSpan=False
	LifeSpan=10.000000
	
	NukeFX(0)=(bActive=True)
	NukeFX(0)=(TimeDuration=0.300000)
	NukeFX(0)=(FlashAmount=(X=5.000000,Y=0.000000,Z=0.000000),bMuffledFlash=True,FlashScale=2.000000)
	
	NukeFX(1)=(bActive=True,MinMufflingDist=3750.000000)
	NukeFX(1)=(bDistanceBased=True,DistOffsetMin=-8640.000000,DistOffsetMax=128.000000)
	NukeFX(1)=(BlurNoise=(Y=7.500000,Z=7.500000),Shake=(Y=60.000000,Z=60.000000),ShakeRate=0.100000)
	NukeFX(1)=(bRisingShake=True,bMuffledShake=True)
	NukeFX(1)=(AmbSound=Sound'NukeShockWaveAmb',StartVolume=0,EndVolume=255,StartPitch=80,EndPitch=32,bMuffledAmb=True,NegMinTimeDelay=1.000000)
	
	NukeFX(2)=(bActive=True,MinMufflingDist=3750.000000)
	NukeFX(2)=(bDistanceBased=True,DistOffsetMin=128.000000,DistOffsetMax=15000.000000)
	NukeFX(2)=(BlurNoise=(Y=40.000000,Z=40.000000),Shake=(Y=600.000000,Z=600.000000),ShakeRate=0.100000)
	NukeFX(2)=(bRisingShake=False,bMuffledShake=True)
	NukeFX(2)=(HitSound=Sound'Nuke03Blast',MufHitSound=Sound'Nuke03BlastMuffled',bMuffledHit=True,bInterruptOtherSnd=True)
	NukeFX(2)=(FlashAmount=(X=0.600000,Y=0.600000,Z=0.600000),bMuffledFlash=True,FlashScale=2.000000)
	
	NukeFX(3)=(bActive=True)
	NukeFX(3)=(bDistanceBased=True,DistOffsetMin=-500.000000,DistOffsetMax=250.000000)
	NukeFX(3)=(bAffectFOV=True,FOVDistortion=35,FOVDistortionType=FOVC_Gaussian,FOVRiseFactor=0.900000,bMuffledFOV=True)
	
	NukeFX(4)=(bActive=True,bDistanceBased=False,TimeDelay=3.250000,TimeDuration=1.500000,MinMufflingDist=3750.000000)
	NukeFX(4)=(BlurNoise=(Y=25.000000,Z=25.000000),Shake=(Y=200.000000,Z=200.000000),ShakeRate=0.100000)
	NukeFX(4)=(bRisingShake=False,bMuffledShake=True)
	NukeFX(4)=(HitSound=Sound'Nuke03Final',MufHitSound=Sound'Nuke03FinalMuffled',bMuffledHit=True,bInterruptOtherSnd=True)
	
	NukeFX(5)=(bActive=True)
	NukeFX(5)=(bDistanceBased=False,TimeDelay=3.150000,TimeDuration=0.450000)
	NukeFX(5)=(bAffectFOV=True,FOVDistortion=25,FOVDistortionType=FOVC_Gaussian,FOVRiseFactor=0.900000,bMuffledFOV=True)
}
