//////////////////////////////////////////////////////////////
//				Feralidragon (12-09-2012)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltRifleGameplayProfile expands NWProfile config(NWProfilesCfg);

struct BoltRifleStruct
{
	var() bool bWaterConductive;
	var() int HeadShotDmg, WaterElectrocutionDamage, ComboDamage;
	var() byte ComboExtraAmmo;
	var() float WaterElectrocutionRadius;
};
var() config BoltRifleStruct BoltRifleProfile[8];

struct BoltOversStructA
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime, OversurrectiveHLRate, OversurrectiveHLOdds;
	var() float OversurrectiveCloudHLOdds, OversurrectiveDryHLOdds, OversurrectiveEnemyHLOdds;
};
var() config BoltOversStructA BoltOversProfileA[8];

struct BoltOversStructB
{
	var() int OversurrectiveMaxHL, OversurrectiveHLDirectDmg, OversurrectiveHLSplashDmg;
	var() float OversurrectiveHLMaxDist, OversurrectiveHLDmgRadius;
};
var() config BoltOversStructB BoltOversProfileB[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local BoltRifle BT;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'BoltRifle'.default.bWaterConductive = default.BoltRifleProfile[i].bWaterConductive;
	Class'BoltRifle'.default.WaterElectrocutionRadius = default.BoltRifleProfile[i].WaterElectrocutionRadius;
	Class'BoltRifle'.default.WaterElectrocutionDamage = default.BoltRifleProfile[i].WaterElectrocutionDamage;
	Class'BoltRifle'.default.HeadShotDmg = default.BoltRifleProfile[i].HeadShotDmg;
	Class'BoltRifle'.default.ComboExtraAmmo = default.BoltRifleProfile[i].ComboExtraAmmo;
	Class'BoltRifle'.default.ComboDamage = default.BoltRifleProfile[i].ComboDamage;
	
	Class'BoltRifle'.default.enableOversurrection = default.BoltOversProfileA[i].enableOversurrection;
	Class'BoltRifle'.default.OversurrectionLifeTime = default.BoltOversProfileA[i].OversurrectionLifeTime;
	Class'BoltRifle'.default.OversurrectiveHLRate = default.BoltOversProfileA[i].OversurrectiveHLRate;
	Class'BoltRifle'.default.OversurrectiveHLOdds = default.BoltOversProfileA[i].OversurrectiveHLOdds;
	Class'BoltRifle'.default.OversurrectiveCloudHLOdds = default.BoltOversProfileA[i].OversurrectiveCloudHLOdds;
	Class'BoltRifle'.default.OversurrectiveDryHLOdds = default.BoltOversProfileA[i].OversurrectiveDryHLOdds;
	Class'BoltRifle'.default.OversurrectiveEnemyHLOdds = default.BoltOversProfileA[i].OversurrectiveEnemyHLOdds;
	
	Class'BoltRifle'.default.OversurrectiveMaxHL = default.BoltOversProfileB[i].OversurrectiveMaxHL;
	Class'BoltRifle'.default.OversurrectiveHLDirectDmg = default.BoltOversProfileB[i].OversurrectiveHLDirectDmg;
	Class'BoltRifle'.default.OversurrectiveHLSplashDmg = default.BoltOversProfileB[i].OversurrectiveHLSplashDmg;
	Class'BoltRifle'.default.OversurrectiveHLMaxDist = default.BoltOversProfileB[i].OversurrectiveHLMaxDist;
	Class'BoltRifle'.default.OversurrectiveHLDmgRadius = default.BoltOversProfileB[i].OversurrectiveHLDmgRadius;
	
	if (Lvl == None)
		Class'BoltRifle'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'BoltRifle', BT)
		{
			BT.default.bWaterConductive = Class'BoltRifle'.default.bWaterConductive;
			BT.bWaterConductive = Class'BoltRifle'.default.bWaterConductive;
			BT.default.WaterElectrocutionRadius = Class'BoltRifle'.default.WaterElectrocutionRadius;
			BT.WaterElectrocutionRadius = Class'BoltRifle'.default.WaterElectrocutionRadius;
			BT.default.WaterElectrocutionDamage = Class'BoltRifle'.default.WaterElectrocutionDamage;
			BT.WaterElectrocutionDamage = Class'BoltRifle'.default.WaterElectrocutionDamage;
			BT.default.HeadShotDmg = Class'BoltRifle'.default.HeadShotDmg;
			BT.HeadShotDmg = Class'BoltRifle'.default.HeadShotDmg;
			BT.default.ComboExtraAmmo = Class'BoltRifle'.default.ComboExtraAmmo;
			BT.ComboExtraAmmo = Class'BoltRifle'.default.ComboExtraAmmo;
			BT.default.ComboDamage = Class'BoltRifle'.default.ComboDamage;
			BT.ComboDamage = Class'BoltRifle'.default.ComboDamage;
			
			BT.default.enableOversurrection = Class'BoltRifle'.default.enableOversurrection;
			BT.enableOversurrection = Class'BoltRifle'.default.enableOversurrection;
			BT.default.OversurrectionLifeTime = Class'BoltRifle'.default.OversurrectionLifeTime;
			BT.OversurrectionLifeTime = Class'BoltRifle'.default.OversurrectionLifeTime;
			BT.default.OversurrectiveHLRate = Class'BoltRifle'.default.OversurrectiveHLRate;
			BT.OversurrectiveHLRate = Class'BoltRifle'.default.OversurrectiveHLRate;
			BT.default.OversurrectiveHLOdds = Class'BoltRifle'.default.OversurrectiveHLOdds;
			BT.OversurrectiveHLOdds = Class'BoltRifle'.default.OversurrectiveHLOdds;
			BT.default.OversurrectiveCloudHLOdds = Class'BoltRifle'.default.OversurrectiveCloudHLOdds;
			BT.OversurrectiveCloudHLOdds = Class'BoltRifle'.default.OversurrectiveCloudHLOdds;
			BT.default.OversurrectiveDryHLOdds = Class'BoltRifle'.default.OversurrectiveDryHLOdds;
			BT.OversurrectiveDryHLOdds = Class'BoltRifle'.default.OversurrectiveDryHLOdds;
			BT.default.OversurrectiveEnemyHLOdds = Class'BoltRifle'.default.OversurrectiveEnemyHLOdds;
			BT.OversurrectiveEnemyHLOdds = Class'BoltRifle'.default.OversurrectiveEnemyHLOdds;
			
			BT.default.OversurrectiveMaxHL = Class'BoltRifle'.default.OversurrectiveMaxHL;
			BT.OversurrectiveMaxHL = Class'BoltRifle'.default.OversurrectiveMaxHL;
			BT.default.OversurrectiveHLDirectDmg = Class'BoltRifle'.default.OversurrectiveHLDirectDmg;
			BT.OversurrectiveHLDirectDmg = Class'BoltRifle'.default.OversurrectiveHLDirectDmg;
			BT.default.OversurrectiveHLSplashDmg = Class'BoltRifle'.default.OversurrectiveHLSplashDmg;
			BT.OversurrectiveHLSplashDmg = Class'BoltRifle'.default.OversurrectiveHLSplashDmg;
			BT.default.OversurrectiveHLMaxDist = Class'BoltRifle'.default.OversurrectiveHLMaxDist;
			BT.OversurrectiveHLMaxDist = Class'BoltRifle'.default.OversurrectiveHLMaxDist;
			BT.default.OversurrectiveHLDmgRadius = Class'BoltRifle'.default.OversurrectiveHLDmgRadius;
			BT.OversurrectiveHLDmgRadius = Class'BoltRifle'.default.OversurrectiveHLDmgRadius;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.BoltRifleProfile[i].bWaterConductive = Class'BoltRifle'.default.bWaterConductive;
	default.BoltRifleProfile[i].WaterElectrocutionRadius = Class'BoltRifle'.default.WaterElectrocutionRadius;
	default.BoltRifleProfile[i].WaterElectrocutionDamage = Class'BoltRifle'.default.WaterElectrocutionDamage;
	default.BoltRifleProfile[i].HeadShotDmg = Class'BoltRifle'.default.HeadShotDmg;
	default.BoltRifleProfile[i].ComboExtraAmmo = Class'BoltRifle'.default.ComboExtraAmmo;
	default.BoltRifleProfile[i].ComboDamage = Class'BoltRifle'.default.ComboDamage;
	
	default.BoltOversProfileA[i].enableOversurrection = Class'BoltRifle'.default.enableOversurrection;
	default.BoltOversProfileA[i].OversurrectionLifeTime = Class'BoltRifle'.default.OversurrectionLifeTime;
	default.BoltOversProfileA[i].OversurrectiveHLRate = Class'BoltRifle'.default.OversurrectiveHLRate;
	default.BoltOversProfileA[i].OversurrectiveHLOdds = Class'BoltRifle'.default.OversurrectiveHLOdds;
	default.BoltOversProfileA[i].OversurrectiveCloudHLOdds = Class'BoltRifle'.default.OversurrectiveCloudHLOdds;
	default.BoltOversProfileA[i].OversurrectiveDryHLOdds = Class'BoltRifle'.default.OversurrectiveDryHLOdds;
	default.BoltOversProfileA[i].OversurrectiveEnemyHLOdds = Class'BoltRifle'.default.OversurrectiveEnemyHLOdds;
	
	default.BoltOversProfileB[i].OversurrectiveMaxHL = Class'BoltRifle'.default.OversurrectiveMaxHL;
	default.BoltOversProfileB[i].OversurrectiveHLDirectDmg = Class'BoltRifle'.default.OversurrectiveHLDirectDmg;
	default.BoltOversProfileB[i].OversurrectiveHLSplashDmg = Class'BoltRifle'.default.OversurrectiveHLSplashDmg;
	default.BoltOversProfileB[i].OversurrectiveHLMaxDist = Class'BoltRifle'.default.OversurrectiveHLMaxDist;
	default.BoltOversProfileB[i].OversurrectiveHLDmgRadius = Class'BoltRifle'.default.OversurrectiveHLDmgRadius;
	
	StaticSaveConfig();
}


defaultproperties
{
	BoltRifleProfile(0)=(bWaterConductive=False,WaterElectrocutionRadius=250.000000,WaterElectrocutionDamage=400,HeadShotDmg=150,ComboExtraAmmo=1,ComboDamage=100)
	BoltOversProfileA(0)=(enableOversurrection=True,OversurrectionLifeTime=15.000000,OversurrectiveHLRate=0.750000,OversurrectiveHLOdds=0.550000,OversurrectiveCloudHLOdds=0.400000,OversurrectiveDryHLOdds=0.100000,OversurrectiveEnemyHLOdds=0.350000)
	BoltOversProfileB(0)=(OversurrectiveMaxHL=5,OversurrectiveHLMaxDist=7500.000000,OversurrectiveHLDirectDmg=500,OversurrectiveHLSplashDmg=100,OversurrectiveHLDmgRadius=350.000000)
	
	BoltRifleProfile(1)=(bWaterConductive=True,WaterElectrocutionRadius=420.000000,WaterElectrocutionDamage=400,HeadShotDmg=200,ComboExtraAmmo=1,ComboDamage=180)
	BoltOversProfileA(1)=(enableOversurrection=True,OversurrectionLifeTime=20.000000,OversurrectiveHLRate=1.000000,OversurrectiveHLOdds=0.650000,OversurrectiveCloudHLOdds=0.400000,OversurrectiveDryHLOdds=0.100000,OversurrectiveEnemyHLOdds=0.350000)
	BoltOversProfileB(1)=(OversurrectiveMaxHL=7,OversurrectiveHLMaxDist=10000.000000,OversurrectiveHLDirectDmg=2000,OversurrectiveHLSplashDmg=500,OversurrectiveHLDmgRadius=500.000000)
	
	BoltRifleProfile(2)=(bWaterConductive=True,WaterElectrocutionRadius=420.000000,WaterElectrocutionDamage=800,HeadShotDmg=350,ComboExtraAmmo=0,ComboDamage=180)
	BoltOversProfileA(2)=(enableOversurrection=True,OversurrectionLifeTime=30.000000,OversurrectiveHLRate=1.000000,OversurrectiveHLOdds=0.650000,OversurrectiveCloudHLOdds=0.400000,OversurrectiveDryHLOdds=0.100000,OversurrectiveEnemyHLOdds=0.350000)
	BoltOversProfileB(2)=(OversurrectiveMaxHL=9,OversurrectiveHLMaxDist=10000.000000,OversurrectiveHLDirectDmg=5000,OversurrectiveHLSplashDmg=1000,OversurrectiveHLDmgRadius=750.000000)
	
	BoltRifleProfile(3)=(bWaterConductive=True,WaterElectrocutionRadius=640.000000,WaterElectrocutionDamage=1200,HeadShotDmg=250,ComboExtraAmmo=1,ComboDamage=200)
	BoltOversProfileA(3)=(enableOversurrection=True,OversurrectionLifeTime=40.000000,OversurrectiveHLRate=1.000000,OversurrectiveHLOdds=0.650000,OversurrectiveCloudHLOdds=0.400000,OversurrectiveDryHLOdds=0.100000,OversurrectiveEnemyHLOdds=0.350000)
	BoltOversProfileB(3)=(OversurrectiveMaxHL=10,OversurrectiveHLMaxDist=10000.000000,OversurrectiveHLDirectDmg=10000,OversurrectiveHLSplashDmg=1500,OversurrectiveHLDmgRadius=1000.000000)
	
	BoltRifleProfile(4)=(bWaterConductive=True,WaterElectrocutionRadius=2000.000000,WaterElectrocutionDamage=2000,HeadShotDmg=500,ComboExtraAmmo=0,ComboDamage=350)
	BoltOversProfileA(4)=(enableOversurrection=True,OversurrectionLifeTime=60.000000,OversurrectiveHLRate=1.000000,OversurrectiveHLOdds=0.750000,OversurrectiveCloudHLOdds=0.400000,OversurrectiveDryHLOdds=0.100000,OversurrectiveEnemyHLOdds=0.550000)
	BoltOversProfileB(4)=(OversurrectiveMaxHL=12,OversurrectiveHLMaxDist=12500.000000,OversurrectiveHLDirectDmg=30000,OversurrectiveHLSplashDmg=10000,OversurrectiveHLDmgRadius=1250.000000)
	
	BoltRifleProfile(5)=(bWaterConductive=True,WaterElectrocutionRadius=420.000000,WaterElectrocutionDamage=800,HeadShotDmg=350,ComboExtraAmmo=0,ComboDamage=180)
	BoltOversProfileA(5)=(enableOversurrection=True,OversurrectionLifeTime=30.000000,OversurrectiveHLRate=1.000000,OversurrectiveHLOdds=0.650000,OversurrectiveCloudHLOdds=0.400000,OversurrectiveDryHLOdds=0.100000,OversurrectiveEnemyHLOdds=0.350000)
	BoltOversProfileB(5)=(OversurrectiveMaxHL=9,OversurrectiveHLMaxDist=10000.000000,OversurrectiveHLDirectDmg=5000,OversurrectiveHLSplashDmg=1000,OversurrectiveHLDmgRadius=750.000000)
	
	BoltRifleProfile(6)=(bWaterConductive=True,WaterElectrocutionRadius=420.000000,WaterElectrocutionDamage=800,HeadShotDmg=350,ComboExtraAmmo=0,ComboDamage=180)
	BoltOversProfileA(6)=(enableOversurrection=True,OversurrectionLifeTime=30.000000,OversurrectiveHLRate=1.000000,OversurrectiveHLOdds=0.650000,OversurrectiveCloudHLOdds=0.400000,OversurrectiveDryHLOdds=0.100000,OversurrectiveEnemyHLOdds=0.350000)
	BoltOversProfileB(6)=(OversurrectiveMaxHL=9,OversurrectiveHLMaxDist=10000.000000,OversurrectiveHLDirectDmg=5000,OversurrectiveHLSplashDmg=1000,OversurrectiveHLDmgRadius=750.000000)
	
	BoltRifleProfile(7)=(bWaterConductive=True,WaterElectrocutionRadius=420.000000,WaterElectrocutionDamage=800,HeadShotDmg=350,ComboExtraAmmo=0,ComboDamage=180)
	BoltOversProfileA(7)=(enableOversurrection=True,OversurrectionLifeTime=30.000000,OversurrectiveHLRate=1.000000,OversurrectiveHLOdds=0.650000,OversurrectiveCloudHLOdds=0.400000,OversurrectiveDryHLOdds=0.100000,OversurrectiveEnemyHLOdds=0.350000)
	BoltOversProfileB(7)=(OversurrectiveMaxHL=9,OversurrectiveHLMaxDist=10000.000000,OversurrectiveHLDirectDmg=5000,OversurrectiveHLSplashDmg=1000,OversurrectiveHLDmgRadius=750.000000)
}