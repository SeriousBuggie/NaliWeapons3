//////////////////////////////////////////////////////////////
//				Feralidragon (15-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybProjExplRed expands UT_FlameExplosion;

#exec TEXTURE IMPORT NAME=RedCybPallete FILE=PALLETES\RedCybPallete.bmp GROUP=Palletes
#exec TEXTURE IMPORT NAME=BlueCybPallete FILE=PALLETES\BlueCybPallete.bmp GROUP=Palletes
#exec TEXTURE IMPORT NAME=GreenCybPallete FILE=PALLETES\GreenCybPallete.bmp GROUP=Palletes
#exec TEXTURE IMPORT NAME=YellowCybPallete FILE=PALLETES\YellowCybPallete.bmp GROUP=Palletes

#exec OBJ LOAD FILE=Textures\CybProjExplosions.utx PACKAGE=NWCybotLauncherVIII_SRC.CybProjExplosions

#exec AUDIO IMPORT NAME="CybProjExplSnd" FILE=SOUNDS\CybProjExplSnd.wav GROUP="Explosion"

simulated function PostBeginPlay()
{
	MakeSound();
}

function MakeSound()
{
	if (EffectSound1 != None)
		PlaySound(EffectSound1,,8.0,,1200.0);
}

defaultproperties
{
	Skin=RedCybPallete
	LightRadius=3
	Texture=CybRExpl01
	LightBrightness=35
	DrawScale=1.000000
	ScaleGlow=1.650000
	SpriteProjForward=32.000000
	EffectSound1=CybProjExplSnd
}