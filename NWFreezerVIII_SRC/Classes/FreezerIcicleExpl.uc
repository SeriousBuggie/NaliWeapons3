//////////////////////////////////////////////////////////////
//				Feralidragon (06-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerIcicleExpl expands FreezerProjExpl;

#exec OBJ LOAD FILE=Textures\IcicleExplosions.utx PACKAGE=NWFreezerVIII_SRC.IcicleExplosions
#exec AUDIO IMPORT NAME="IcicleHitSnd01" FILE=SOUNDS\IcicleHitSnd01.wav GROUP="Freezer"
#exec AUDIO IMPORT NAME="IcicleHitSnd02" FILE=SOUNDS\IcicleHitSnd02.wav GROUP="Freezer"
#exec AUDIO IMPORT NAME="IcicleHitSnd03" FILE=SOUNDS\IcicleHitSnd03.wav GROUP="Freezer"

var() texture RndExplTex3, RndExplTex4;
var() sound RndSound[3];

simulated function PostBeginPlay()
{
local float f;

	EffectSound1 = RndSound[Rand(ArrayCount(RndSound))];

	Super(NaliWEffects).PostBeginPlay();
	
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
	EffectSound1=IcicleHitSnd01
	LifeSpan=0.300000
	Texture=IcicleExplA01
	LightBrightness=40
	LightHue=140
	LightSaturation=71
	LightRadius=1
	ScaleGlow=1.500000
	
	RndSound(0)=IcicleHitSnd01
	RndSound(1)=IcicleHitSnd02
	RndSound(2)=IcicleHitSnd03
	RndExplTex1=IcicleExplA01
	RndExplTex2=IcicleExplB01
	RndExplTex3=IcicleExplC01
	RndExplTex4=IcicleExplD01
	DrawScale=0.350000
}
