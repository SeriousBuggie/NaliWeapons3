//////////////////////////////////////////////////////////////
//				Feralidragon (29-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class MineExplosionA expands NaliWEffects;

#exec AUDIO IMPORT NAME="MineExplosion1" FILE=SOUNDS\MineExplosion1.wav GROUP="Explosions"
#exec OBJ LOAD FILE=Textures\NWMineExplosions.utx PACKAGE=NWTheMinerVIII_SRC.Explosions

var() texture RndExplTex[3];

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Texture = RndExplTex[Rand(3)];
}

defaultproperties
{
	EffectSound1=MineExplosion1
	SndVol=12.000000
	SndRadius=2200.000000
	
	LifeSpan=0.800000
	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=MineExplA01
	Skin=Texture'UnrealShare.Effects.ExplosionPal'
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightBrightness=65
	LightHue=27
	LightSaturation=71
	LightRadius=7
	bUnlit=True
	
	DrawScale=1.600000
	ScaleGlow=1.500000
	 
	RndExplTex(0)=MineExplA01
	RndExplTex(1)=MineExplB01
	RndExplTex(2)=MineExplC01
}
