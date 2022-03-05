//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLvlDDetailProfile expands NukesDetailProfile config(NWProfilesCfg);

struct NukeLvlDClientStructA
{
	var() bool enableFXSmartPerformance;
	var() byte FlyingDebrisAmount;
};
var() config NukeLvlDClientStructA NukeLvlDClientProfileA[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NuclearExplosionLevelD'.default.enableFXSmartPerformance = default.NukeLvlDClientProfileA[i].enableFXSmartPerformance;
	Class'NuclearExplosionLevelD'.default.FlyingDebrisAmount = default.NukeLvlDClientProfileA[i].FlyingDebrisAmount;
	
	Super.ProcessProfileChange(i, Lvl);
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukeLvlDClientProfileA[i].enableFXSmartPerformance = Class'NuclearExplosionLevelD'.default.enableFXSmartPerformance;
	default.NukeLvlDClientProfileA[i].FlyingDebrisAmount = Class'NuclearExplosionLevelD'.default.FlyingDebrisAmount;
	
	Super.ProcessProfileSave(i);
}


defaultproperties
{
	NukeExplClass=Class'NuclearExplosionLevelD'
	
	
	NukesClientProfile(0)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(1)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(2)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(3)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(4)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(5)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(6)=(DynamicLightOn=True,enableNukeDebrisWaterFX=True)
	NukesClientProfile(7)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)

	
	NukeLvlDClientProfileA(0)=(enableFXSmartPerformance=True,FlyingDebrisAmount=0)
	NukeLvlDClientProfileA(1)=(enableFXSmartPerformance=True,FlyingDebrisAmount=10)
	NukeLvlDClientProfileA(2)=(enableFXSmartPerformance=True,FlyingDebrisAmount=20)
	NukeLvlDClientProfileA(3)=(enableFXSmartPerformance=True,FlyingDebrisAmount=28)
	NukeLvlDClientProfileA(4)=(enableFXSmartPerformance=True,FlyingDebrisAmount=34)
	NukeLvlDClientProfileA(5)=(enableFXSmartPerformance=False,FlyingDebrisAmount=40)
	NukeLvlDClientProfileA(6)=(enableFXSmartPerformance=False,FlyingDebrisAmount=54)
	NukeLvlDClientProfileA(7)=(enableFXSmartPerformance=True,FlyingDebrisAmount=28)
}