//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLvlCDetailProfile expands NukesDetailProfile config(NWProfilesCfg);

struct NukeLvlCClientStructA
{
	var() byte debrisAmountPerUpdate, lightningsAmountPerUpdate;
	var() float debrisRate, lightningsRate;
};
var() config NukeLvlCClientStructA NukeLvlCClientProfileA[8];

struct NukeLvlCClientStructB
{
	var() int FinalExplFXAmountPerUpdate, FinalSmokeFXAmountPerUpdate;
	var() float FinalExplFXRate, FinalSmokeFXRate;
};
var() config NukeLvlCClientStructB NukeLvlCClientProfileB[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NuclearExplosionLevelC'.default.debrisAmountPerUpdate = default.NukeLvlCClientProfileA[i].debrisAmountPerUpdate;
	Class'NuclearExplosionLevelC'.default.debrisRate = default.NukeLvlCClientProfileA[i].debrisRate;
	Class'NuclearExplosionLevelC'.default.lightningsAmountPerUpdate = default.NukeLvlCClientProfileA[i].lightningsAmountPerUpdate;
	Class'NuclearExplosionLevelC'.default.lightningsRate = default.NukeLvlCClientProfileA[i].lightningsRate;
	
	Class'NuclearExplosionLevelC'.default.FinalExplFXAmountPerUpdate = default.NukeLvlCClientProfileB[i].FinalExplFXAmountPerUpdate;
	Class'NuclearExplosionLevelC'.default.FinalExplFXRate = default.NukeLvlCClientProfileB[i].FinalExplFXRate;
	Class'NuclearExplosionLevelC'.default.FinalSmokeFXAmountPerUpdate = default.NukeLvlCClientProfileB[i].FinalSmokeFXAmountPerUpdate;
	Class'NuclearExplosionLevelC'.default.FinalSmokeFXRate = default.NukeLvlCClientProfileB[i].FinalSmokeFXRate;
	
	Super.ProcessProfileChange(i, Lvl);
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukeLvlCClientProfileA[i].debrisAmountPerUpdate = Class'NuclearExplosionLevelC'.default.debrisAmountPerUpdate;
	default.NukeLvlCClientProfileA[i].debrisRate = Class'NuclearExplosionLevelC'.default.debrisRate;
	default.NukeLvlCClientProfileA[i].lightningsAmountPerUpdate = Class'NuclearExplosionLevelC'.default.lightningsAmountPerUpdate;
	default.NukeLvlCClientProfileA[i].lightningsRate = Class'NuclearExplosionLevelC'.default.lightningsRate;
	
	default.NukeLvlCClientProfileB[i].FinalExplFXAmountPerUpdate = Class'NuclearExplosionLevelC'.default.FinalExplFXAmountPerUpdate;
	default.NukeLvlCClientProfileB[i].FinalExplFXRate = Class'NuclearExplosionLevelC'.default.FinalExplFXRate;
	default.NukeLvlCClientProfileB[i].FinalSmokeFXAmountPerUpdate = Class'NuclearExplosionLevelC'.default.FinalSmokeFXAmountPerUpdate;
	default.NukeLvlCClientProfileB[i].FinalSmokeFXRate = Class'NuclearExplosionLevelC'.default.FinalSmokeFXRate;
	
	Super.ProcessProfileSave(i);
}


defaultproperties
{
	NukeExplClass=Class'NuclearExplosionLevelC'
	
	
	NukesClientProfile(0)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(1)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(2)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(3)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(4)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(5)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(6)=(DynamicLightOn=True,enableNukeDebrisWaterFX=True)
	NukesClientProfile(7)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)

	
	NukeLvlCClientProfileA(0)=(debrisAmountPerUpdate=3,debrisRate=3.500000,lightningsAmountPerUpdate=4,lightningsRate=6.500000)
	NukeLvlCClientProfileB(0)=(FinalExplFXAmountPerUpdate=2,FinalExplFXRate=4.000000,FinalSmokeFXAmountPerUpdate=0,FinalSmokeFXRate=4.000000)
	
	NukeLvlCClientProfileA(1)=(debrisAmountPerUpdate=4,debrisRate=5.000000,lightningsAmountPerUpdate=8,lightningsRate=7.500000)
	NukeLvlCClientProfileB(1)=(FinalExplFXAmountPerUpdate=4,FinalExplFXRate=4.000000,FinalSmokeFXAmountPerUpdate=1,FinalSmokeFXRate=5.000000)
	
	NukeLvlCClientProfileA(2)=(debrisAmountPerUpdate=6,debrisRate=5.000000,lightningsAmountPerUpdate=12,lightningsRate=10.000000)
	NukeLvlCClientProfileB(2)=(FinalExplFXAmountPerUpdate=5,FinalExplFXRate=5.000000,FinalSmokeFXAmountPerUpdate=2,FinalSmokeFXRate=5.000000)
	
	NukeLvlCClientProfileA(3)=(debrisAmountPerUpdate=8,debrisRate=5.000000,lightningsAmountPerUpdate=16,lightningsRate=10.000000)
	NukeLvlCClientProfileB(3)=(FinalExplFXAmountPerUpdate=6,FinalExplFXRate=5.000000,FinalSmokeFXAmountPerUpdate=2,FinalSmokeFXRate=7.000000)
	
	NukeLvlCClientProfileA(4)=(debrisAmountPerUpdate=10,debrisRate=5.000000,lightningsAmountPerUpdate=20,lightningsRate=10.000000)
	NukeLvlCClientProfileB(4)=(FinalExplFXAmountPerUpdate=6,FinalExplFXRate=6.000000,FinalSmokeFXAmountPerUpdate=2,FinalSmokeFXRate=7.000000)
	
	NukeLvlCClientProfileA(5)=(debrisAmountPerUpdate=12,debrisRate=6.500000,lightningsAmountPerUpdate=22,lightningsRate=12.000000)
	NukeLvlCClientProfileB(5)=(FinalExplFXAmountPerUpdate=7,FinalExplFXRate=6.000000,FinalSmokeFXAmountPerUpdate=3,FinalSmokeFXRate=9.000000)
	
	NukeLvlCClientProfileA(6)=(debrisAmountPerUpdate=16,debrisRate=7.500000,lightningsAmountPerUpdate=26,lightningsRate=14.000000)
	NukeLvlCClientProfileB(6)=(FinalExplFXAmountPerUpdate=9,FinalExplFXRate=6.500000,FinalSmokeFXAmountPerUpdate=5,FinalSmokeFXRate=10.000000)
	
	NukeLvlCClientProfileA(7)=(debrisAmountPerUpdate=6,debrisRate=5.000000,lightningsAmountPerUpdate=12,lightningsRate=10.000000)
	NukeLvlCClientProfileB(7)=(FinalExplFXAmountPerUpdate=5,FinalExplFXRate=5.000000,FinalSmokeFXAmountPerUpdate=2,FinalSmokeFXRate=5.000000)
}