//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeDetailProfile expands NukesDetailProfile config(NWProfilesCfg);

struct IonNukeClientStructA
{
	var() byte SmkLightningsAmountPerUpdateMin, SmkLightningsAmountPerUpdateMax;
	var() float SmkLightningsRateMin, SmkLightningsRateMax;
};
var() config IonNukeClientStructA IonNukeClientProfileA[8];

struct IonNukeClientStructB
{
	var() byte SphereLightningsAmountPerUpdateMin, SphereLightningsAmountPerUpdateMax;
	var() float SphereLightningsRateMin, SphereLightningsRateMax;
};
var() config IonNukeClientStructB IonNukeClientProfileB[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'IonNuclearExplosion'.default.SmkLightningsAmountPerUpdateMin = default.IonNukeClientProfileA[i].SmkLightningsAmountPerUpdateMin;
	Class'IonNuclearExplosion'.default.SmkLightningsAmountPerUpdateMax = default.IonNukeClientProfileA[i].SmkLightningsAmountPerUpdateMax;
	Class'IonNuclearExplosion'.default.SmkLightningsRateMin = default.IonNukeClientProfileA[i].SmkLightningsRateMin;
	Class'IonNuclearExplosion'.default.SmkLightningsRateMax = default.IonNukeClientProfileA[i].SmkLightningsRateMax;
	
	Class'IonNuclearExplosion'.default.SphereLightningsAmountPerUpdateMin = default.IonNukeClientProfileB[i].SphereLightningsAmountPerUpdateMin;
	Class'IonNuclearExplosion'.default.SphereLightningsAmountPerUpdateMax = default.IonNukeClientProfileB[i].SphereLightningsAmountPerUpdateMax;
	Class'IonNuclearExplosion'.default.SphereLightningsRateMin = default.IonNukeClientProfileB[i].SphereLightningsRateMin;
	Class'IonNuclearExplosion'.default.SphereLightningsRateMax = default.IonNukeClientProfileB[i].SphereLightningsRateMax;
	
	Super.ProcessProfileChange(i);
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.IonNukeClientProfileA[i].SmkLightningsAmountPerUpdateMin = Class'IonNuclearExplosion'.default.SmkLightningsAmountPerUpdateMin;
	default.IonNukeClientProfileA[i].SmkLightningsAmountPerUpdateMax = Class'IonNuclearExplosion'.default.SmkLightningsAmountPerUpdateMax;
	default.IonNukeClientProfileA[i].SmkLightningsRateMin = Class'IonNuclearExplosion'.default.SmkLightningsRateMin;
	default.IonNukeClientProfileA[i].SmkLightningsRateMax = Class'IonNuclearExplosion'.default.SmkLightningsRateMax;
	
	default.IonNukeClientProfileB[i].SphereLightningsAmountPerUpdateMin = Class'IonNuclearExplosion'.default.SphereLightningsAmountPerUpdateMin;
	default.IonNukeClientProfileB[i].SphereLightningsAmountPerUpdateMax = Class'IonNuclearExplosion'.default.SphereLightningsAmountPerUpdateMax;
	default.IonNukeClientProfileB[i].SphereLightningsRateMin = Class'IonNuclearExplosion'.default.SphereLightningsRateMin;
	default.IonNukeClientProfileB[i].SphereLightningsRateMax = Class'IonNuclearExplosion'.default.SphereLightningsRateMax;
	
	Super.ProcessProfileSave(i);
}


defaultproperties
{
	NukeExplClass=Class'IonNuclearExplosion'
	
	
	NukesClientProfile(0)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(1)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(2)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(3)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	NukesClientProfile(4)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(5)=(DynamicLightOn=True,enableNukeDebrisWaterFX=False)
	NukesClientProfile(6)=(DynamicLightOn=True,enableNukeDebrisWaterFX=True)
	NukesClientProfile(7)=(DynamicLightOn=False,enableNukeDebrisWaterFX=False)
	
	
	IonNukeClientProfileA(0)=(SmkLightningsAmountPerUpdateMin=0,SmkLightningsAmountPerUpdateMax=2,SmkLightningsRateMin=1.000000,SmkLightningsRateMax=5.000000)
	IonNukeClientProfileB(0)=(SphereLightningsAmountPerUpdateMin=3,SphereLightningsAmountPerUpdateMax=7,SphereLightningsRateMin=2.000000,SphereLightningsRateMax=10.000000)
	
	IonNukeClientProfileA(1)=(SmkLightningsAmountPerUpdateMin=0,SmkLightningsAmountPerUpdateMax=3,SmkLightningsRateMin=1.000000,SmkLightningsRateMax=5.000000)
	IonNukeClientProfileB(1)=(SphereLightningsAmountPerUpdateMin=6,SphereLightningsAmountPerUpdateMax=12,SphereLightningsRateMin=2.000000,SphereLightningsRateMax=20.000000)
	
	IonNukeClientProfileA(2)=(SmkLightningsAmountPerUpdateMin=1,SmkLightningsAmountPerUpdateMax=4,SmkLightningsRateMin=2.000000,SmkLightningsRateMax=10.000000)
	IonNukeClientProfileB(2)=(SphereLightningsAmountPerUpdateMin=8,SphereLightningsAmountPerUpdateMax=16,SphereLightningsRateMin=5.000000,SphereLightningsRateMax=25.000000)
	
	IonNukeClientProfileA(3)=(SmkLightningsAmountPerUpdateMin=1,SmkLightningsAmountPerUpdateMax=5,SmkLightningsRateMin=2.000000,SmkLightningsRateMax=10.000000)
	IonNukeClientProfileB(3)=(SphereLightningsAmountPerUpdateMin=10,SphereLightningsAmountPerUpdateMax=20,SphereLightningsRateMin=5.000000,SphereLightningsRateMax=25.000000)
	
	IonNukeClientProfileA(4)=(SmkLightningsAmountPerUpdateMin=2,SmkLightningsAmountPerUpdateMax=6,SmkLightningsRateMin=2.000000,SmkLightningsRateMax=11.000000)
	IonNukeClientProfileB(4)=(SphereLightningsAmountPerUpdateMin=12,SphereLightningsAmountPerUpdateMax=25,SphereLightningsRateMin=6.000000,SphereLightningsRateMax=30.000000)
	
	IonNukeClientProfileA(5)=(SmkLightningsAmountPerUpdateMin=4,SmkLightningsAmountPerUpdateMax=8,SmkLightningsRateMin=2.000000,SmkLightningsRateMax=14.000000)
	IonNukeClientProfileB(5)=(SphereLightningsAmountPerUpdateMin=15,SphereLightningsAmountPerUpdateMax=30,SphereLightningsRateMin=10.000000,SphereLightningsRateMax=30.000000)
	
	IonNukeClientProfileA(6)=(SmkLightningsAmountPerUpdateMin=10,SmkLightningsAmountPerUpdateMax=15,SmkLightningsRateMin=3.000000,SmkLightningsRateMax=17.500000)
	IonNukeClientProfileB(6)=(SphereLightningsAmountPerUpdateMin=20,SphereLightningsAmountPerUpdateMax=40,SphereLightningsRateMin=15.000000,SphereLightningsRateMax=35.000000)
	
	IonNukeClientProfileA(7)=(SmkLightningsAmountPerUpdateMin=1,SmkLightningsAmountPerUpdateMax=5,SmkLightningsRateMin=2.000000,SmkLightningsRateMax=10.000000)
	IonNukeClientProfileB(7)=(SphereLightningsAmountPerUpdateMin=10,SphereLightningsAmountPerUpdateMax=20,SphereLightningsRateMin=5.000000,SphereLightningsRateMax=25.000000)
}