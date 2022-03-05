//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormHLightEffectGND expands BoltLightEffect;

#exec AUDIO IMPORT NAME="BoltStormHRHitSound" FILE=SOUNDS\BoltStormHRHitSound.wav GROUP="Storm"

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	MakeNoise(5.0);
}

function MakeSound()
{
	if (EffectSound1 != None)
		PlaySound(EffectSound1,,80.0,,600);
}

defaultproperties
{
    Texture=BoltLight
	EffectSound1=BoltStormHRHitSound
	DrawScale=4.000000
	LifeSpan=0.400000
	ScaleGlow=1.500000
	SpriteProjForward=96.000000
	enableMakeSound=True
}
