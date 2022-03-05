//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeElectricExpl expands NaliWEffects;

#exec OBJ LOAD FILE=Textures\NukeElecticExpl.utx PACKAGE=NWNuclearFXVIII_SRC.NukeElecticExpl

var() texture RndExplTex[4];

simulated function PostBeginPlay()
{
	Texture = RndExplTex[Rand(ArrayCount(RndExplTex))];
}

simulated function SetScale(float Scale)
{
	DrawScale = Scale / 64.0;
}

defaultproperties
{
	LifeSpan=0.600000
	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=NkElecExplA01
	bUnlit=True
	ScaleGlow=1.500000
	
	RndExplTex(0)=NkElecExplA01
	RndExplTex(1)=NkElecExplB01
	RndExplTex(2)=NkElecExplC01
	RndExplTex(3)=NkElecExplD01
	DrawScale=1.000000
	
	// Skin=Texture'UnrealShare.Effects.ExplosionPal'
	// LightType=LT_TexturePaletteOnce
	// LightEffect=LE_NonIncidence
	// LightBrightness=50
	// LightHue=0
	// LightSaturation=32
	// LightRadius=8
}
