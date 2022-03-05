//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltLightEffectGND expands SBoltLightEffect;

#exec AUDIO IMPORT NAME="SBoltRHitSound" FILE=SOUNDS\SBoltRHitSound.wav GROUP="Hit"

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	MakeNoise(1.0);
}

simulated function MakeSound()
{
	if (EffectSound1 != None)
		PlaySound(EffectSound1,,80.0,,800);
}

defaultproperties
{
    Texture=SBoltLight
	EffectSound1=SBoltRHitSound
	
	DrawScale=2.000000
	LifeSpan=0.400000
	ScaleGlow=5.500000
	
	SpriteProjForward=48.000000
	
	enableMakeSound=True
}
