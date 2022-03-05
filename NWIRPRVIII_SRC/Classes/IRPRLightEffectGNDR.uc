//////////////////////////////////////////////////////////////
//				Feralidragon (14-11-2010)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRLightEffectGNDR expands IRPRLightEffectR;

#exec AUDIO IMPORT NAME="IRPRHitSnd1" FILE=SOUNDS\IRPRHitSnd1.wav GROUP="Hit"
#exec AUDIO IMPORT NAME="IRPRHitSnd2" FILE=SOUNDS\IRPRHitSnd2.wav GROUP="Hit"

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	MakeNoise(1.0);
}

simulated function MakeSound()
{
	if (FRand() > 0.5)
		EffectSound1 = EffectSound2;
	
	if (EffectSound1 != None)
		PlaySound(EffectSound1,,80.0,,800);
}

defaultproperties
{
    Texture=IRPRTraceCorRed
	EffectSound1=IRPRHitSnd1
	EffectSound2=IRPRHitSnd2
	
	DrawScale=0.350000
	LifeSpan=0.400000
	ScaleGlow=5.500000
	
	SpriteProjForward=32.000000
	
	enableMakeSound=True
}
