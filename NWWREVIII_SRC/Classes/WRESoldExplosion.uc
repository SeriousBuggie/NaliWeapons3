//////////////////////////////////////////////////////////////
//				Feralidragon (07-08-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldExplosion expands UT_FlameExplosion;

#exec AUDIO IMPORT NAME="WRESold_Explosion" FILE=SOUNDS\WRESold_Explosion.wav GROUP="WRE"

simulated function PostBeginPlay()
{
	MakeSound();
}

function MakeSound()
{
	PlaySound(EffectSound1,,12.0,,2200);
}

defaultproperties
{
	EffectSound1=WRESold_Explosion
	Skin=PurplePallete
	LightRadius=150
	Texture=WREIonExpl01
	LightBrightness=100
	DrawScale=18.000000
	ScaleGlow=2.650000
	SpriteProjForward=96.000000
}