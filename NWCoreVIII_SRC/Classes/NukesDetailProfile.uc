//////////////////////////////////////////////////////////////
//				Feralidragon (28-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NukesDetailProfile expands NWProfile config(NWProfilesCfg);

var() class<NuclearExplosions> NukeExplClass;

struct NukesClientStruct
{
	var() bool DynamicLightOn, enableNukeDebrisWaterFX;
};
var() config NukesClientStruct NukesClientProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukeExplClass.default.DynamicLightOn = default.NukesClientProfile[i].DynamicLightOn;
	default.NukeExplClass.default.enableNukeDebrisWaterFX = default.NukesClientProfile[i].enableNukeDebrisWaterFX;
	
	if (Lvl == None)
		default.NukeExplClass.static.StaticSaveConfig();
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukesClientProfile[i].DynamicLightOn = default.NukeExplClass.default.DynamicLightOn;
	default.NukesClientProfile[i].enableNukeDebrisWaterFX = default.NukeExplClass.default.enableNukeDebrisWaterFX;
	
	StaticSaveConfig();
}


defaultproperties
{
	NukeExplClass=Class'NuclearExplosions'
	
	NukesClientProfile(0)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(1)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(2)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(3)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(4)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(5)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(6)=(DynamicLightOn=True,enableNukeDebrisWaterFX=True)
	NukesClientProfile(7)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
}