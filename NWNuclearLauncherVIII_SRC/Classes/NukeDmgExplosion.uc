//////////////////////////////////////////////////////////////
//				Feralidragon (18-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeDmgExplosion expands NaliWEffects;

#exec AUDIO IMPORT NAME="NukeDmgExplB" FILE=SOUNDS\NukeDmgExplB.wav GROUP="Explosions"
#exec OBJ LOAD FILE=Textures\NukeDmgExpl.utx PACKAGE=NWNuclearLauncherVIII_SRC.DmgExplosions

var() texture RndExplTex[3];

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Texture = RndExplTex[Rand(3)];
}

defaultproperties
{
	EffectSound1=NukeDmgExplB
	SndVol=34.000000
	SndRadius=3200.000000
	
	LifeSpan=0.800000
	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=NukeDmgExplA01
	Skin=Texture'UnrealShare.Effects.ExplosionPal'
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightBrightness=65
	LightHue=27
	LightSaturation=71
	LightRadius=7
	bUnlit=True
	
	DrawScale=3.600000
	ScaleGlow=1.500000
	 
	RndExplTex(0)=NukeDmgExplA01
	RndExplTex(1)=NukeDmgExplB01
	RndExplTex(2)=NukeDmgExplC01
}
