//////////////////////////////////////////////////////////////
//				Feralidragon (28-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldInitExpl expands UT_FlameExplosion;

#exec AUDIO IMPORT NAME="WRESoldInit" FILE=SOUNDS\WRESoldInit.wav GROUP="WRESoldier"


function MakeSound()
{
	PlaySound(EffectSound1,,18.0,,7500);
}

simulated function PostBeginPlay()
{
	MakeSound();
}

defaultproperties
{
	EffectSound1=WRESoldInit
	Skin=PurplePallete
	LightRadius=150
	Texture=WREIonExpl01
	LightBrightness=100
	DrawScale=30.000000
	ScaleGlow=1.650000
	SpriteProjForward=180.000000
}