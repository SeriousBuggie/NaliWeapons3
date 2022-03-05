//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class TMissileExplFX expands UT_FlameExplosion;

#exec OBJ LOAD FILE=Textures\ThermicExplosions.utx PACKAGE=NWMultiMissileVIII_SRC.ThermicExplosions

simulated function PostBeginPlay()
{
	if (Rand(100) < 50)
		Texture = Texture'ExplB05';
	else if (Rand(100) < 50)
		Texture = Texture'ExplE05';
		
	Super(AnimSpriteEffect).PostBeginPlay();
}

defaultproperties
{
	EffectSound1=None
	Texture=Texture'ExplF05'
	DrawScale=1.500000
	LightType=LT_None
	ScaleGlow=1.350000
}

