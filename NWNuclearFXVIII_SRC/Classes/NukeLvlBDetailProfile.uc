//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLvlBDetailProfile expands NukesDetailProfile config(NWProfilesCfg);

struct NukeLvlBClientStructA
{
	var() byte ExplosionFXDensity;
};
var() config NukeLvlBClientStructA NukeLvlBClientProfileA[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NuclearExplosionLevelB'.default.ExplosionFXDensity = default.NukeLvlBClientProfileA[i].ExplosionFXDensity;
	
	Super.ProcessProfileChange(i, Lvl);
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukeLvlBClientProfileA[i].ExplosionFXDensity = Class'NuclearExplosionLevelB'.default.ExplosionFXDensity;
	
	Super.ProcessProfileSave(i);
}


defaultproperties
{
	NukeExplClass=Class'NuclearExplosionLevelB'
	
	
	NukesClientProfile(0)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(1)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(2)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(3)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(4)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(5)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(6)=(DynamicLightOn=True,enableNukeDebrisWaterFX=True)
	NukesClientProfile(7)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	


	NukeLvlBClientProfileA(0)=(ExplosionFXDensity=1)
	NukeLvlBClientProfileA(1)=(ExplosionFXDensity=3)
	NukeLvlBClientProfileA(2)=(ExplosionFXDensity=4)
	NukeLvlBClientProfileA(3)=(ExplosionFXDensity=5)
	NukeLvlBClientProfileA(4)=(ExplosionFXDensity=5)
	NukeLvlBClientProfileA(5)=(ExplosionFXDensity=6)
	NukeLvlBClientProfileA(6)=(ExplosionFXDensity=8)
	NukeLvlBClientProfileA(7)=(ExplosionFXDensity=5)
}