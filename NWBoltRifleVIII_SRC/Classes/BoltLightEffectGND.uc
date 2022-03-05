//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltLightEffectGND expands BoltLightEffect;

#exec AUDIO IMPORT NAME="BoltRHitSound" FILE=SOUNDS\BoltRHitSound.wav GROUP="Hit"

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	MakeNoise(1.0);
}

function MakeSound()
{
	if (EffectSound1 != None)
		PlaySound(EffectSound1,,80.0,,800);
}

defaultproperties
{
    Texture=BoltLight
	EffectSound1=BoltRHitSound
	
	DrawScale=2.000000
	LifeSpan=0.400000
	ScaleGlow=5.500000
	
	SpriteProjForward=48.000000
	
	enableMakeSound=True
}