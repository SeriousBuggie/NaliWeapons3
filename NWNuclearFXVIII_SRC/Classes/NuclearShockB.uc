//////////////////////////////////////////////////////////////
//				Feralidragon (30-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearShockB expands NWNukeShockFX;

#exec AUDIO IMPORT NAME="NukeShockWaveAmb" FILE=SOUNDS\NukeShockWaveAmb.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="Nuke02Blast" FILE=SOUNDS\Nuke02Blast.wav GROUP="NuclearBlasts"
#exec AUDIO IMPORT NAME="Nuke02BlastMuffled" FILE=SOUNDS\Nuke02BlastMuffled.wav GROUP="NuclearBlasts"

defaultproperties
{
	bAlwaysRelevant=True
	
	FullTime=1.875000
	FullSize=7200.000000
	
	bAutoLifeSpan=False
	LifeSpan=5.000000
	
	NukeFX(0)=(bActive=True)
	NukeFX(0)=(TimeDuration=0.300000)
	NukeFX(0)=(FlashAmount=(X=5.000000,Y=1.000000,Z=0.000000),bMuffledFlash=True,FlashScale=2.000000)
	
	NukeFX(1)=(bActive=True,MinMufflingDist=1850.000000)
	NukeFX(1)=(bDistanceBased=True,DistOffsetMin=-4320.000000,DistOffsetMax=128.000000)
	NukeFX(1)=(BlurNoise=(Y=5.000000,Z=5.000000),Shake=(Y=40.000000,Z=40.000000),ShakeRate=0.100000)
	NukeFX(1)=(bRisingShake=True,bMuffledShake=True)
	NukeFX(1)=(AmbSound=Sound'NukeShockWaveAmb',StartVolume=0,EndVolume=255,StartPitch=80,EndPitch=32,bMuffledAmb=True,NegMinTimeDelay=1.000000)
	
	NukeFX(2)=(bActive=True,MinMufflingDist=1850.000000)
	NukeFX(2)=(bDistanceBased=True,DistOffsetMin=128.000000,DistOffsetMax=7500.000000)
	NukeFX(2)=(BlurNoise=(Y=30.000000,Z=30.000000),Shake=(Y=400.000000,Z=400.000000),ShakeRate=0.100000)
	NukeFX(2)=(bRisingShake=False,bMuffledShake=True)
	NukeFX(2)=(HitSound=Sound'Nuke02Blast',MufHitSound=Sound'Nuke02BlastMuffled',bMuffledHit=True,bInterruptOtherSnd=True)
	NukeFX(2)=(FlashAmount=(X=0.500000,Y=0.500000,Z=0.500000),bMuffledFlash=True,FlashScale=1.000000)
	
	NukeFX(3)=(bActive=True)
	NukeFX(3)=(bDistanceBased=True,DistOffsetMin=-500.000000,DistOffsetMax=250.000000)
	NukeFX(3)=(bAffectFOV=True,FOVDistortion=35,FOVDistortionType=FOVC_Gaussian,FOVRiseFactor=0.900000,bMuffledFOV=True)
}
