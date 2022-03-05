//////////////////////////////////////////////////////////////
//				Feralidragon (24-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTLavaExplosion expands UT_FlameExplosion;

#exec TEXTURE IMPORT NAME=RedPallete FILE=PALLETES\RedPallete.bmp GROUP=Palletes

#exec OBJ LOAD FILE=Textures\FExplosions1.utx PACKAGE=NWFlameTrackerVIII_SRC.FExplosions1


var() bool bSpawnExplLight;

simulated function PostBeginPlay();

simulated function SpawnLight()
{
local FlameTExplLight l;
	
	if (!bSpawnExplLight)
		return;
	l = Spawn(Class'FlameTExplLight');
	l.MinCoronaSize = 5.0 * DrawScale;
	l.MaxCoronaSize = 10.0 * DrawScale;
}

simulated function PostNetBeginPlay()
{
	if (Role < ROLE_Authority)
		SpawnLight();
}

defaultproperties
{
	Skin=RedPallete
	LightRadius=6
	Texture=FExpl01
	LightBrightness=75
	DrawScale=1.000000
	ScaleGlow=1.650000
	SpriteProjForward=32.000000
	bSpawnExplLight=True
}