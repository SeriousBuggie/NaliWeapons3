//////////////////////////////////////////////////////////////
//				Feralidragon (14-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanBulletExpl expands NaliZPEffects;

#exec OBJ LOAD FILE=Textures\BulletsExpl.utx PACKAGE=NWVulcanVIII_SRC.BulletsExpl
#exec AUDIO IMPORT NAME="VulcanHit1" FILE=SOUNDS\VulcanHit1.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanHit2" FILE=SOUNDS\VulcanHit2.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanHit3" FILE=SOUNDS\VulcanHit3.wav GROUP="Vulcan"

var() texture RndExplTex1, RndExplTex2;
var() texture RndExplTex3, RndExplTex4;
var() sound RndSound[3];

simulated function PostBeginPlay()
{
local float f;

	EffectSound1 = RndSound[Rand(ArrayCount(RndSound))];
	Super.PostBeginPlay();
	
	f = FRand();
	if (f > 0.75)
		Texture = RndExplTex1;
	else if (f > 0.5)
		Texture = RndExplTex2;
	else if (f > 0.25)
		Texture = RndExplTex3;
	else
		Texture = RndExplTex4;
}

defaultproperties
{
	EffectSound1=VulcanHit1
	SndVol=12.000000
	SndRadius=280.000000
	
	LifeSpan=0.600000
	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=BltExplA01
	Skin=Texture'UnrealShare.Effects.ExplosionPal'
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightBrightness=25
	LightHue=0
	LightSaturation=32
	LightRadius=1
	bUnlit=True
	ScaleGlow=1.500000
	
	RndSound(0)=VulcanHit1
	RndSound(1)=VulcanHit2
	RndSound(2)=VulcanHit3
	RndExplTex1=BltExplA01
	RndExplTex2=BltExplB01
	RndExplTex3=BltExplC01
	RndExplTex4=BltExplD01
	DrawScale=0.400000
	
	enableMakeSound=True
}
