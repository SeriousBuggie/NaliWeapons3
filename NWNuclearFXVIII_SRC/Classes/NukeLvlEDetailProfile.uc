//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLvlEDetailProfile expands NukesDetailProfile config(NWProfilesCfg);

struct NukeLvlEClientStructA
{
	var() byte debrisAmountPerUpdate, sphericElectricAmountPerUpdate;
	var() float debrisRate, sphericElectricRate;
};
var() config NukeLvlEClientStructA NukeLvlEClientProfileA[8];

struct NukeLvlEClientStructB
{
	var() byte sphericFinalElectricMinAmountPerUpdate, sphericFinalElectricMaxAmountPerUpdate;
	var() float sphericFinalElectricRate;
};
var() config NukeLvlEClientStructB NukeLvlEClientProfileB[8];

struct NukeLvlEClientStructC
{
	var() bool enableDebrisExplFX;
	var() float debrisExplRate, debrisExplTime;
};
var() config NukeLvlEClientStructC NukeLvlEClientProfileC[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NuclearExplosionLevelE'.default.debrisAmountPerUpdate = default.NukeLvlEClientProfileA[i].debrisAmountPerUpdate;
	Class'NuclearExplosionLevelE'.default.debrisRate = default.NukeLvlEClientProfileA[i].debrisRate;
	Class'NuclearExplosionLevelE'.default.sphericElectricAmountPerUpdate = default.NukeLvlEClientProfileA[i].sphericElectricAmountPerUpdate;
	Class'NuclearExplosionLevelE'.default.sphericElectricRate = default.NukeLvlEClientProfileA[i].sphericElectricRate;
	
	Class'NuclearExplosionLevelE'.default.sphericFinalElectricMinAmountPerUpdate = default.NukeLvlEClientProfileB[i].sphericFinalElectricMinAmountPerUpdate;
	Class'NuclearExplosionLevelE'.default.sphericFinalElectricMaxAmountPerUpdate = default.NukeLvlEClientProfileB[i].sphericFinalElectricMaxAmountPerUpdate;
	Class'NuclearExplosionLevelE'.default.sphericFinalElectricRate = default.NukeLvlEClientProfileB[i].sphericFinalElectricRate;
	
	Class'NuclearExplosionLevelE'.default.enableDebrisExplFX = default.NukeLvlEClientProfileC[i].enableDebrisExplFX;
	Class'NuclearExplosionLevelE'.default.debrisExplRate = default.NukeLvlEClientProfileC[i].debrisExplRate;
	Class'NuclearExplosionLevelE'.default.debrisExplTime = default.NukeLvlEClientProfileC[i].debrisExplTime;
	
	Super.ProcessProfileChange(i, Lvl);
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukeLvlEClientProfileA[i].debrisAmountPerUpdate = Class'NuclearExplosionLevelE'.default.debrisAmountPerUpdate;
	default.NukeLvlEClientProfileA[i].debrisRate = Class'NuclearExplosionLevelE'.default.debrisRate;
	default.NukeLvlEClientProfileA[i].sphericElectricAmountPerUpdate = Class'NuclearExplosionLevelE'.default.sphericElectricAmountPerUpdate;
	default.NukeLvlEClientProfileA[i].sphericElectricRate = Class'NuclearExplosionLevelE'.default.sphericElectricRate;
	
	default.NukeLvlEClientProfileB[i].sphericFinalElectricMinAmountPerUpdate = Class'NuclearExplosionLevelE'.default.sphericFinalElectricMinAmountPerUpdate;
	default.NukeLvlEClientProfileB[i].sphericFinalElectricMaxAmountPerUpdate = Class'NuclearExplosionLevelE'.default.sphericFinalElectricMaxAmountPerUpdate;
	default.NukeLvlEClientProfileB[i].sphericFinalElectricRate = Class'NuclearExplosionLevelE'.default.sphericFinalElectricRate;
	
	default.NukeLvlEClientProfileC[i].enableDebrisExplFX = Class'NuclearExplosionLevelE'.default.enableDebrisExplFX;
	default.NukeLvlEClientProfileC[i].debrisExplRate = Class'NuclearExplosionLevelE'.default.debrisExplRate;
	default.NukeLvlEClientProfileC[i].debrisExplTime = Class'NuclearExplosionLevelE'.default.debrisExplTime;
	
	Super.ProcessProfileSave(i);
}


defaultproperties
{
	NukeExplClass=Class'NuclearExplosionLevelE'
	
	
	NukesClientProfile(0)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(1)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(2)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(3)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(4)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(5)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(6)=(DynamicLightOn=True,enableNukeDebrisWaterFX=True)
	NukesClientProfile(7)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)

	
	NukeLvlEClientProfileA(0)=(debrisAmountPerUpdate=5,debrisRate=2.000000,sphericElectricAmountPerUpdate=3,sphericElectricRate=3.000000)
	NukeLvlEClientProfileB(0)=(sphericFinalElectricMinAmountPerUpdate=0,sphericFinalElectricMaxAmountPerUpdate=4,sphericFinalElectricRate=8.000000)
	NukeLvlEClientProfileC(0)=(enableDebrisExplFX=False,debrisExplRate=4.000000,debrisExplTime=0.350000)
	
	NukeLvlEClientProfileA(1)=(debrisAmountPerUpdate=5,debrisRate=4.000000,sphericElectricAmountPerUpdate=3,sphericElectricRate=4.000000)
	NukeLvlEClientProfileB(1)=(sphericFinalElectricMinAmountPerUpdate=1,sphericFinalElectricMaxAmountPerUpdate=4,sphericFinalElectricRate=10.000000)
	NukeLvlEClientProfileC(1)=(enableDebrisExplFX=True,debrisExplRate=4.000000,debrisExplTime=0.500000)
	
	NukeLvlEClientProfileA(2)=(debrisAmountPerUpdate=8,debrisRate=4.000000,sphericElectricAmountPerUpdate=4,sphericElectricRate=4.000000)
	NukeLvlEClientProfileB(2)=(sphericFinalElectricMinAmountPerUpdate=1,sphericFinalElectricMaxAmountPerUpdate=8,sphericFinalElectricRate=10.000000)
	NukeLvlEClientProfileC(2)=(enableDebrisExplFX=True,debrisExplRate=4.000000,debrisExplTime=0.850000)
	
	NukeLvlEClientProfileA(3)=(debrisAmountPerUpdate=10,debrisRate=4.000000,sphericElectricAmountPerUpdate=5,sphericElectricRate=4.000000)
	NukeLvlEClientProfileB(3)=(sphericFinalElectricMinAmountPerUpdate=1,sphericFinalElectricMaxAmountPerUpdate=8,sphericFinalElectricRate=10.000000)
	NukeLvlEClientProfileC(3)=(enableDebrisExplFX=True,debrisExplRate=4.000000,debrisExplTime=1.000000)
	
	NukeLvlEClientProfileA(4)=(debrisAmountPerUpdate=12,debrisRate=5.000000,sphericElectricAmountPerUpdate=6,sphericElectricRate=4.000000)
	NukeLvlEClientProfileB(4)=(sphericFinalElectricMinAmountPerUpdate=2,sphericFinalElectricMaxAmountPerUpdate=8,sphericFinalElectricRate=10.000000)
	NukeLvlEClientProfileC(4)=(enableDebrisExplFX=True,debrisExplRate=4.000000,debrisExplTime=1.000000)
	
	NukeLvlEClientProfileA(5)=(debrisAmountPerUpdate=16,debrisRate=5.000000,sphericElectricAmountPerUpdate=8,sphericElectricRate=5.000000)
	NukeLvlEClientProfileB(5)=(sphericFinalElectricMinAmountPerUpdate=4,sphericFinalElectricMaxAmountPerUpdate=12,sphericFinalElectricRate=10.000000)
	NukeLvlEClientProfileC(5)=(enableDebrisExplFX=True,debrisExplRate=5.000000,debrisExplTime=1.350000)
	
	NukeLvlEClientProfileA(6)=(debrisAmountPerUpdate=20,debrisRate=7.500000,sphericElectricAmountPerUpdate=12,sphericElectricRate=5.000000)
	NukeLvlEClientProfileB(6)=(sphericFinalElectricMinAmountPerUpdate=6,sphericFinalElectricMaxAmountPerUpdate=12,sphericFinalElectricRate=12.500000)
	NukeLvlEClientProfileC(6)=(enableDebrisExplFX=True,debrisExplRate=6.000000,debrisExplTime=2.000000)
	
	NukeLvlEClientProfileA(7)=(debrisAmountPerUpdate=10,debrisRate=4.000000,sphericElectricAmountPerUpdate=5,sphericElectricRate=4.000000)
	NukeLvlEClientProfileB(7)=(sphericFinalElectricMinAmountPerUpdate=1,sphericFinalElectricMaxAmountPerUpdate=8,sphericFinalElectricRate=10.000000)
	NukeLvlEClientProfileC(7)=(enableDebrisExplFX=True,debrisExplRate=4.000000,debrisExplTime=1.000000)
}