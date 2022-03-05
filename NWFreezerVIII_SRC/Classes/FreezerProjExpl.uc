//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerProjExpl expands NaliWEffects;

#exec OBJ LOAD FILE=Textures\IceExplosions.utx PACKAGE=NWFreezerVIII_SRC.IceExplosions

var() texture RndExplTex1, RndExplTex2;
var() float MaxDrawScale;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	DrawScale = FRand() * (MaxDrawScale - Default.DrawScale) + Default.DrawScale;
	
	if (FRand() > 0.5)
		Texture = RndExplTex1;
	else
		Texture = RndExplTex2;
}

defaultproperties
{
	EffectSound1=None
	LifeSpan=0.800000
	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=ExplA01
	Skin=Texture'UnrealShare.Effects.BluePal'
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightBrightness=25
	LightHue=0
	LightSaturation=71
	LightRadius=3
	bUnlit=True
	ScaleGlow=1.500000
	 
	RndExplTex1=ExplD01
	RndExplTex2=ExplE01
	DrawScale=0.250000
	MaxDrawScale=0.950000
}
