//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLvlADetailProfile expands NukesDetailProfile config(NWProfilesCfg);

struct NukeLvlAClientStructA
{
	var() int ExplFXAmountPerUpdate, SmokeFXAmountPerUpdate;
	var() float ExplFXRate, SmokeFXRate;
};
var() config NukeLvlAClientStructA NukeLvlAClientProfileA[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NuclearExplosionLevelA'.default.ExplFXAmountPerUpdate = default.NukeLvlAClientProfileA[i].ExplFXAmountPerUpdate;
	Class'NuclearExplosionLevelA'.default.ExplFXRate = default.NukeLvlAClientProfileA[i].ExplFXRate;
	Class'NuclearExplosionLevelA'.default.SmokeFXAmountPerUpdate = default.NukeLvlAClientProfileA[i].SmokeFXAmountPerUpdate;
	Class'NuclearExplosionLevelA'.default.SmokeFXRate = default.NukeLvlAClientProfileA[i].SmokeFXRate;
	
	Super.ProcessProfileChange(i, Lvl);
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukeLvlAClientProfileA[i].ExplFXAmountPerUpdate = Class'NuclearExplosionLevelA'.default.ExplFXAmountPerUpdate;
	default.NukeLvlAClientProfileA[i].ExplFXRate = Class'NuclearExplosionLevelA'.default.ExplFXRate;
	default.NukeLvlAClientProfileA[i].SmokeFXAmountPerUpdate = Class'NuclearExplosionLevelA'.default.SmokeFXAmountPerUpdate;
	default.NukeLvlAClientProfileA[i].SmokeFXRate = Class'NuclearExplosionLevelA'.default.SmokeFXRate;
	
	Super.ProcessProfileSave(i);
}


defaultproperties
{
	NukeExplClass=Class'NuclearExplosionLevelA'
	
	
	NukesClientProfile(0)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(1)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(2)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(3)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(4)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(5)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(6)=(DynamicLightOn=True,enableNukeDebrisWaterFX=True)
	NukesClientProfile(7)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	

	NukeLvlAClientProfileA(0)=(ExplFXAmountPerUpdate=5,ExplFXRate=8.000000,SmokeFXAmountPerUpdate=0,SmokeFXRate=3.000000)
	NukeLvlAClientProfileA(1)=(ExplFXAmountPerUpdate=8,ExplFXRate=12.000000,SmokeFXAmountPerUpdate=1,SmokeFXRate=5.000000)
	NukeLvlAClientProfileA(2)=(ExplFXAmountPerUpdate=10,ExplFXRate=15.000000,SmokeFXAmountPerUpdate=2,SmokeFXRate=6.000000)
	NukeLvlAClientProfileA(3)=(ExplFXAmountPerUpdate=12,ExplFXRate=15.000000,SmokeFXAmountPerUpdate=2,SmokeFXRate=7.000000)
	NukeLvlAClientProfileA(4)=(ExplFXAmountPerUpdate=15,ExplFXRate=15.000000,SmokeFXAmountPerUpdate=3,SmokeFXRate=7.000000)
	NukeLvlAClientProfileA(5)=(ExplFXAmountPerUpdate=18,ExplFXRate=17.500000,SmokeFXAmountPerUpdate=5,SmokeFXRate=7.000000)
	NukeLvlAClientProfileA(6)=(ExplFXAmountPerUpdate=24,ExplFXRate=20.000000,SmokeFXAmountPerUpdate=7,SmokeFXRate=10.000000)
	NukeLvlAClientProfileA(7)=(ExplFXAmountPerUpdate=12,ExplFXRate=15.000000,SmokeFXAmountPerUpdate=2,SmokeFXRate=7.000000)
}