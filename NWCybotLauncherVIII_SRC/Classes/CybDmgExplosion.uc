//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDmgExplosion expands NaliWEffects;

#exec AUDIO IMPORT NAME="CybExplSndB" FILE=SOUNDS\CybExplSndB.wav GROUP="Explosions"
#exec OBJ LOAD FILE=Textures\CybDmgExpl.utx PACKAGE=NWCybotLauncherVIII_SRC.DmgExplosions

var() texture RndExplTex[3];

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Texture = RndExplTex[Rand(3)];
}

defaultproperties
{
	EffectSound1=CybExplSndB
	SndVol=15.000000
	SndRadius=2200.000000
	
	LifeSpan=0.800000
	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=CybExplA01
	Skin=Texture'UnrealShare.Effects.ExplosionPal'
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightBrightness=65
	LightHue=27
	LightSaturation=71
	LightRadius=7
	bUnlit=True
	
	DrawScale=2.600000
	ScaleGlow=1.500000
	 
	RndExplTex(0)=CybExplA01
	RndExplTex(1)=CybExplB01
	RndExplTex(2)=CybExplC01
}
