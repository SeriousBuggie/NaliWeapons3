//////////////////////////////////////////////////////////////
//	Nali Weapons III detail profile info
//				Feralidragon (09-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWDetailProfile expands NWProfile config(NWProfilesCfg);

struct DebrisWaterStruct
{
	var() bool enableDebris, bEnhancedWaterSplashes, bCoronasCollisionDetail;
	var() byte WaterSplashDetail;
};
var() config DebrisWaterStruct DebrisWaterProfile[8];

struct DynLightStruct
{
	var() bool bWeaponsDynLight, bAmmoDynLight, bPickupsDynLight, bEffectsDynLight;
	var() float PickupsGlowScale;
};
var() config DynLightStruct DynLightProfile[8];

struct DistDetailStruct
{
	var() byte WeaponDistDetail, AmmoDistDetail, PickupsDistDetail, ChargersDistDetail;
};
var() config DistDetailStruct DistDetailProfile[8];

struct SmartPerfoStruct
{
	var() bool enableGlobalSmartPerformance;
	var() byte smartPerformanceMinFPS;
	var() bool enableSmartPerformanceWeapon, enableSmartPerformanceAmmo, enableSmartPerformancePickup, enableSmartPerformanceCharger;
};
var() config SmartPerfoStruct SmartPerfoProfile[8];

struct LODBiasStruct
{
	var() float MaxLODBias, MinLODBias;
	var() bool enableClientNukeCrashFix;
	var() float DecalsLifespan;
};
var() config LODBiasStruct LODBiasProfile[8];

struct GoreStructA
{
	var() bool enableSlideBloodDecals;
	var() float BloodDecalsMinLifespan, BloodDecalsMaxLifespan;
};
var() config GoreStructA GoreProfileA[8];

struct GoreStructB
{
	var() float GoreLifeSpanMultiplier, GorePartsMultiplier, GoreScaleMultiplier;
	var() bool bCordCollideWithActors;
	var() int MaxCordIterations;
};
var() config GoreStructB GoreProfileB[8];

var() config byte CarcassFX[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local NaliWeapons NW;
local NaliAmmo NA;
local NaliPickups NP;
local NWBloodyMess NBM;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NWInfo'.default.enableDebris = default.DebrisWaterProfile[i].enableDebris;
	Class'NWInfo'.default.bEnhancedWaterSplashes = default.DebrisWaterProfile[i].bEnhancedWaterSplashes;
	
	Class'NWInfo'.default.WaterSplashDetail = default.DebrisWaterProfile[i].WaterSplashDetail;
	
	Class'NWInfo'.default.bWeaponsDynLight = default.DynLightProfile[i].bWeaponsDynLight;
	Class'NWInfo'.default.bAmmoDynLight = default.DynLightProfile[i].bAmmoDynLight;
	Class'NWInfo'.default.bPickupsDynLight = default.DynLightProfile[i].bPickupsDynLight;
	Class'NWInfo'.default.bEffectsDynLight = default.DynLightProfile[i].bEffectsDynLight;
	Class'NWInfo'.default.PickupsGlowScale = default.DynLightProfile[i].PickupsGlowScale;
	
	Class'NWInfo'.default.WeaponDistDetail = default.DistDetailProfile[i].WeaponDistDetail;
	Class'NWInfo'.default.AmmoDistDetail = default.DistDetailProfile[i].AmmoDistDetail;
	Class'NWInfo'.default.PickupsDistDetail = default.DistDetailProfile[i].PickupsDistDetail;
	Class'NWInfo'.default.ChargersDistDetail = default.DistDetailProfile[i].ChargersDistDetail;
	
	Class'NWInfo'.default.enableGlobalSmartPerformance = default.SmartPerfoProfile[i].enableGlobalSmartPerformance;
	Class'NWInfo'.default.smartPerformanceMinFPS = default.SmartPerfoProfile[i].smartPerformanceMinFPS;
	Class'NWInfo'.default.enableSmartPerformanceWeapon = default.SmartPerfoProfile[i].enableSmartPerformanceWeapon;
	Class'NWInfo'.default.enableSmartPerformanceAmmo = default.SmartPerfoProfile[i].enableSmartPerformanceAmmo;
	Class'NWInfo'.default.enableSmartPerformancePickup = default.SmartPerfoProfile[i].enableSmartPerformancePickup;
	Class'NWInfo'.default.enableSmartPerformanceCharger = default.SmartPerfoProfile[i].enableSmartPerformanceCharger;
	
	Class'NWInfo'.default.MaxLODBias = default.LODBiasProfile[i].MaxLODBias;
	Class'NWInfo'.default.MinLODBias = default.LODBiasProfile[i].MinLODBias;
	Class'NWInfo'.default.enableClientNukeCrashFix = default.LODBiasProfile[i].enableClientNukeCrashFix;
	Class'NWInfo'.default.DecalsLifespan = default.LODBiasProfile[i].DecalsLifespan;
	
	Class'NWInfo'.default.CarcassFX = Class'NWInfo'.static.GetCarcassFXFromByte(default.CarcassFX[i]);
	if (Lvl == None)
		Class'NWInfo'.static.StaticSaveConfig();
	
	Class'NWCoronaFX'.default.bCoronasCollisionDetail = default.DebrisWaterProfile[i].bCoronasCollisionDetail;
	if (Lvl == None)
		Class'NWCoronaFX'.static.StaticSaveConfig();
		
	Class'NWBloodyMess'.default.enableSlideBloodDecals = default.GoreProfileA[i].enableSlideBloodDecals;
	Class'NWBloodyMess'.default.BloodDecalsMinLifespan = default.GoreProfileA[i].BloodDecalsMinLifespan;
	Class'NWBloodyMess'.default.BloodDecalsMaxLifespan = default.GoreProfileA[i].BloodDecalsMaxLifespan;
	
	Class'NWBloodyMess'.default.GoreLifeSpanMultiplier = default.GoreProfileB[i].GoreLifeSpanMultiplier;
	Class'NWBloodyMess'.default.GorePartsMultiplier = default.GoreProfileB[i].GorePartsMultiplier;
	Class'NWBloodyMess'.default.GoreScaleMultiplier = default.GoreProfileB[i].GoreScaleMultiplier;
	Class'NWBloodyMess'.default.bCordCollideWithActors = default.GoreProfileB[i].bCordCollideWithActors;
	Class'NWBloodyMess'.default.MaxCordIterations = default.GoreProfileB[i].MaxCordIterations;
	if (Lvl == None)
		Class'NWBloodyMess'.static.StaticSaveConfig();
		
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'NaliWeapons', NW)
			NW.setDetail();
		ForEach Lvl.AllActors(Class'NaliAmmo', NA)
			NA.setDetail();
		ForEach Lvl.AllActors(Class'NaliPickups', NP)
			NP.setDetail();
			
		ForEach Lvl.AllActors(Class'NWBloodyMess', NBM)
		{
			NBM.default.enableSlideBloodDecals = Class'NWBloodyMess'.default.enableSlideBloodDecals;
			NBM.enableSlideBloodDecals = Class'NWBloodyMess'.default.enableSlideBloodDecals;
			NBM.default.BloodDecalsMinLifespan = Class'NWBloodyMess'.default.BloodDecalsMinLifespan;
			NBM.BloodDecalsMinLifespan = Class'NWBloodyMess'.default.BloodDecalsMinLifespan;
			NBM.default.BloodDecalsMaxLifespan = Class'NWBloodyMess'.default.BloodDecalsMaxLifespan;
			NBM.BloodDecalsMaxLifespan = Class'NWBloodyMess'.default.BloodDecalsMaxLifespan;
			
			NBM.default.GoreLifeSpanMultiplier = Class'NWBloodyMess'.default.GoreLifeSpanMultiplier;
			NBM.GoreLifeSpanMultiplier = Class'NWBloodyMess'.default.GoreLifeSpanMultiplier;
			NBM.default.GorePartsMultiplier = Class'NWBloodyMess'.default.GorePartsMultiplier;
			NBM.GorePartsMultiplier = Class'NWBloodyMess'.default.GorePartsMultiplier;
			NBM.default.GoreScaleMultiplier = Class'NWBloodyMess'.default.GoreScaleMultiplier;
			NBM.GoreScaleMultiplier = Class'NWBloodyMess'.default.GoreScaleMultiplier;
			NBM.default.bCordCollideWithActors = Class'NWBloodyMess'.default.bCordCollideWithActors;
			NBM.bCordCollideWithActors = Class'NWBloodyMess'.default.bCordCollideWithActors;
			NBM.default.MaxCordIterations = Class'NWBloodyMess'.default.MaxCordIterations;
			NBM.MaxCordIterations = Class'NWBloodyMess'.default.MaxCordIterations;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
		
	default.DebrisWaterProfile[i].enableDebris = Class'NWInfo'.default.enableDebris;
	default.DebrisWaterProfile[i].bEnhancedWaterSplashes = Class'NWInfo'.default.bEnhancedWaterSplashes;
	default.DebrisWaterProfile[i].bCoronasCollisionDetail = Class'NWCoronaFX'.default.bCoronasCollisionDetail;
	default.DebrisWaterProfile[i].WaterSplashDetail = Class'NWInfo'.default.WaterSplashDetail;
	
	default.DynLightProfile[i].bWeaponsDynLight = Class'NWInfo'.default.bWeaponsDynLight;
	default.DynLightProfile[i].bAmmoDynLight = Class'NWInfo'.default.bAmmoDynLight;
	default.DynLightProfile[i].bPickupsDynLight = Class'NWInfo'.default.bPickupsDynLight;
	default.DynLightProfile[i].bEffectsDynLight = Class'NWInfo'.default.bEffectsDynLight;
	default.DynLightProfile[i].PickupsGlowScale = Class'NWInfo'.default.PickupsGlowScale;
	
	default.DistDetailProfile[i].WeaponDistDetail = Class'NWInfo'.default.WeaponDistDetail;
	default.DistDetailProfile[i].AmmoDistDetail = Class'NWInfo'.default.AmmoDistDetail;
	default.DistDetailProfile[i].PickupsDistDetail = Class'NWInfo'.default.PickupsDistDetail;
	default.DistDetailProfile[i].ChargersDistDetail = Class'NWInfo'.default.ChargersDistDetail;
	
	default.SmartPerfoProfile[i].enableGlobalSmartPerformance = Class'NWInfo'.default.enableGlobalSmartPerformance;
	default.SmartPerfoProfile[i].smartPerformanceMinFPS = Class'NWInfo'.default.smartPerformanceMinFPS;
	default.SmartPerfoProfile[i].enableSmartPerformanceWeapon = Class'NWInfo'.default.enableSmartPerformanceWeapon;
	default.SmartPerfoProfile[i].enableSmartPerformanceAmmo = Class'NWInfo'.default.enableSmartPerformanceAmmo;
	default.SmartPerfoProfile[i].enableSmartPerformancePickup = Class'NWInfo'.default.enableSmartPerformancePickup;
	default.SmartPerfoProfile[i].enableSmartPerformanceCharger = Class'NWInfo'.default.enableSmartPerformanceCharger;
	
	default.LODBiasProfile[i].MaxLODBias = Class'NWInfo'.default.MaxLODBias;
	default.LODBiasProfile[i].MinLODBias = Class'NWInfo'.default.MinLODBias;
	default.LODBiasProfile[i].enableClientNukeCrashFix = Class'NWInfo'.default.enableClientNukeCrashFix;
	default.LODBiasProfile[i].DecalsLifespan = Class'NWInfo'.default.DecalsLifespan;
	
	default.CarcassFX[i] = Class'NWInfo'.default.CarcassFX;
	
	default.GoreProfileA[i].enableSlideBloodDecals = Class'NWBloodyMess'.default.enableSlideBloodDecals;
	default.GoreProfileA[i].BloodDecalsMinLifespan = Class'NWBloodyMess'.default.BloodDecalsMinLifespan;
	default.GoreProfileA[i].BloodDecalsMaxLifespan = Class'NWBloodyMess'.default.BloodDecalsMaxLifespan;
	
	default.GoreProfileB[i].GoreLifeSpanMultiplier = Class'NWBloodyMess'.default.GoreLifeSpanMultiplier;
	default.GoreProfileB[i].GorePartsMultiplier = Class'NWBloodyMess'.default.GorePartsMultiplier;
	default.GoreProfileB[i].GoreScaleMultiplier = Class'NWBloodyMess'.default.GoreScaleMultiplier;
	default.GoreProfileB[i].bCordCollideWithActors = Class'NWBloodyMess'.default.bCordCollideWithActors;
	default.GoreProfileB[i].MaxCordIterations = Class'NWBloodyMess'.default.MaxCordIterations;
	
	StaticSaveConfig();
}


defaultproperties
{
	SelectedProfile=3
	ProfileNames(0)="Please Have Mercy"
	ProfileNames(1)="Very Low"
	ProfileNames(2)="Low"
	ProfileNames(3)="Medium"
	ProfileNames(4)="High"
	ProfileNames(5)="Very High"
	ProfileNames(6)="I Haz NASA PC!"
	ProfileNames(7)="Custom"
	
	
	DebrisWaterProfile(0)=(enableDebris=False,bEnhancedWaterSplashes=False,bCoronasCollisionDetail=False,WaterSplashDetail=1)
	DynLightProfile(0)=(bWeaponsDynLight=False,bAmmoDynLight=False,bPickupsDynLight=False,bEffectsDynLight=False,PickupsGlowScale=0.000000)
	DistDetailProfile(0)=(WeaponDistDetail=8,AmmoDistDetail=8,PickupsDistDetail=8,ChargersDistDetail=8)
	SmartPerfoProfile(0)=(enableGlobalSmartPerformance=False,smartPerformanceMinFPS=50)
	SmartPerfoProfile(0)=(enableSmartPerformanceWeapon=False,enableSmartPerformanceAmmo=False,enableSmartPerformancePickup=False,enableSmartPerformanceCharger=False)
	LODBiasProfile(0)=(MaxLODBias=8.000000,MinLODBias=1.000000,enableClientNukeCrashFix=False,DecalsLifespan=15.000000)
	GoreProfileA(0)=(enableSlideBloodDecals=False,BloodDecalsMinLifespan=8.000000,BloodDecalsMaxLifespan=8.000000)
	GoreProfileB(0)=(GoreLifeSpanMultiplier=0.200000,GorePartsMultiplier=0.200000,GoreScaleMultiplier=1.000000,bCordCollideWithActors=False,MaxCordIterations=1)
	CarcassFX(0)=0
	
	DebrisWaterProfile(1)=(enableDebris=True,bEnhancedWaterSplashes=True,bCoronasCollisionDetail=False,WaterSplashDetail=2)
	DynLightProfile(1)=(bWeaponsDynLight=False,bAmmoDynLight=False,bPickupsDynLight=False,bEffectsDynLight=False,PickupsGlowScale=0.000000)
	DistDetailProfile(1)=(WeaponDistDetail=48,AmmoDistDetail=48,PickupsDistDetail=48,ChargersDistDetail=48)
	SmartPerfoProfile(1)=(enableGlobalSmartPerformance=True,smartPerformanceMinFPS=40)
	SmartPerfoProfile(1)=(enableSmartPerformanceWeapon=True,enableSmartPerformanceAmmo=False,enableSmartPerformancePickup=True,enableSmartPerformanceCharger=True)
	LODBiasProfile(1)=(MaxLODBias=8.000000,MinLODBias=1.000000,enableClientNukeCrashFix=False,DecalsLifespan=30.000000)
	GoreProfileA(1)=(enableSlideBloodDecals=False,BloodDecalsMinLifespan=30.000000,BloodDecalsMaxLifespan=30.000000)
	GoreProfileB(1)=(GoreLifeSpanMultiplier=0.500000,GorePartsMultiplier=0.500000,GoreScaleMultiplier=1.000000,bCordCollideWithActors=False,MaxCordIterations=1)
	CarcassFX(1)=1
	
	DebrisWaterProfile(2)=(enableDebris=True,bEnhancedWaterSplashes=True,bCoronasCollisionDetail=False,WaterSplashDetail=3)
	DynLightProfile(2)=(bWeaponsDynLight=False,bAmmoDynLight=False,bPickupsDynLight=False,bEffectsDynLight=False,PickupsGlowScale=0.500000)
	DistDetailProfile(2)=(WeaponDistDetail=96,AmmoDistDetail=96,PickupsDistDetail=96,ChargersDistDetail=96)
	SmartPerfoProfile(2)=(enableGlobalSmartPerformance=True,smartPerformanceMinFPS=35)
	SmartPerfoProfile(2)=(enableSmartPerformanceWeapon=True,enableSmartPerformanceAmmo=True,enableSmartPerformancePickup=False,enableSmartPerformanceCharger=True)
	LODBiasProfile(2)=(MaxLODBias=16.000000,MinLODBias=1.000000,enableClientNukeCrashFix=False,DecalsLifespan=60.000000)
	GoreProfileA(2)=(enableSlideBloodDecals=True,BloodDecalsMinLifespan=60.000000,BloodDecalsMaxLifespan=60.000000)
	GoreProfileB(2)=(GoreLifeSpanMultiplier=0.750000,GorePartsMultiplier=0.750000,GoreScaleMultiplier=1.000000,bCordCollideWithActors=False,MaxCordIterations=3)
	CarcassFX(2)=2
	
	DebrisWaterProfile(3)=(enableDebris=True,bEnhancedWaterSplashes=True,bCoronasCollisionDetail=False,WaterSplashDetail=6)
	DynLightProfile(3)=(bWeaponsDynLight=True,bAmmoDynLight=True,bPickupsDynLight=True,bEffectsDynLight=True,PickupsGlowScale=1.000000)
	DistDetailProfile(3)=(WeaponDistDetail=128,AmmoDistDetail=128,PickupsDistDetail=128,ChargersDistDetail=128)
	SmartPerfoProfile(3)=(enableGlobalSmartPerformance=True,smartPerformanceMinFPS=35)
	SmartPerfoProfile(3)=(enableSmartPerformanceWeapon=True,enableSmartPerformanceAmmo=True,enableSmartPerformancePickup=False,enableSmartPerformanceCharger=True)
	LODBiasProfile(3)=(MaxLODBias=16.000000,MinLODBias=1.000000,enableClientNukeCrashFix=False,DecalsLifespan=0.000000)
	GoreProfileA(3)=(enableSlideBloodDecals=True,BloodDecalsMinLifespan=0.000000,BloodDecalsMaxLifespan=0.000000)
	GoreProfileB(3)=(GoreLifeSpanMultiplier=1.000000,GorePartsMultiplier=1.000000,GoreScaleMultiplier=1.000000,bCordCollideWithActors=True,MaxCordIterations=3)
	CarcassFX(3)=2
	
	DebrisWaterProfile(4)=(enableDebris=True,bEnhancedWaterSplashes=True,bCoronasCollisionDetail=True,WaterSplashDetail=7)
	DynLightProfile(4)=(bWeaponsDynLight=True,bAmmoDynLight=True,bPickupsDynLight=True,bEffectsDynLight=True,PickupsGlowScale=1.000000)
	DistDetailProfile(4)=(WeaponDistDetail=192,AmmoDistDetail=192,PickupsDistDetail=192,ChargersDistDetail=192)
	SmartPerfoProfile(4)=(enableGlobalSmartPerformance=True,smartPerformanceMinFPS=40)
	SmartPerfoProfile(4)=(enableSmartPerformanceWeapon=True,enableSmartPerformanceAmmo=True,enableSmartPerformancePickup=False,enableSmartPerformanceCharger=True)
	LODBiasProfile(4)=(MaxLODBias=16.000000,MinLODBias=1.000000,enableClientNukeCrashFix=False,DecalsLifespan=0.000000)
	GoreProfileA(4)=(enableSlideBloodDecals=True,BloodDecalsMinLifespan=0.000000,BloodDecalsMaxLifespan=0.000000)
	GoreProfileB(4)=(GoreLifeSpanMultiplier=1.250000,GorePartsMultiplier=1.250000,GoreScaleMultiplier=1.000000,bCordCollideWithActors=True,MaxCordIterations=4)
	CarcassFX(4)=2
	
	DebrisWaterProfile(5)=(enableDebris=True,bEnhancedWaterSplashes=True,bCoronasCollisionDetail=True,WaterSplashDetail=8)
	DynLightProfile(5)=(bWeaponsDynLight=True,bAmmoDynLight=True,bPickupsDynLight=True,bEffectsDynLight=True,PickupsGlowScale=1.000000)
	DistDetailProfile(5)=(WeaponDistDetail=255,AmmoDistDetail=255,PickupsDistDetail=255,ChargersDistDetail=255)
	SmartPerfoProfile(5)=(enableGlobalSmartPerformance=True,smartPerformanceMinFPS=50)
	SmartPerfoProfile(5)=(enableSmartPerformanceWeapon=True,enableSmartPerformanceAmmo=True,enableSmartPerformancePickup=True,enableSmartPerformanceCharger=True)
	LODBiasProfile(5)=(MaxLODBias=16.000000,MinLODBias=1.000000,enableClientNukeCrashFix=False,DecalsLifespan=0.000000)
	GoreProfileA(5)=(enableSlideBloodDecals=True,BloodDecalsMinLifespan=0.000000,BloodDecalsMaxLifespan=0.000000)
	GoreProfileB(5)=(GoreLifeSpanMultiplier=1.650000,GorePartsMultiplier=1.650000,GoreScaleMultiplier=1.000000,bCordCollideWithActors=True,MaxCordIterations=5)
	CarcassFX(5)=3
	
	DebrisWaterProfile(6)=(enableDebris=True,bEnhancedWaterSplashes=True,bCoronasCollisionDetail=True,WaterSplashDetail=8)
	DynLightProfile(6)=(bWeaponsDynLight=True,bAmmoDynLight=True,bPickupsDynLight=True,bEffectsDynLight=True,PickupsGlowScale=1.000000)
	DistDetailProfile(6)=(WeaponDistDetail=255,AmmoDistDetail=255,PickupsDistDetail=255,ChargersDistDetail=255)
	SmartPerfoProfile(6)=(enableGlobalSmartPerformance=False,smartPerformanceMinFPS=60)
	SmartPerfoProfile(6)=(enableSmartPerformanceWeapon=False,enableSmartPerformanceAmmo=False,enableSmartPerformancePickup=False,enableSmartPerformanceCharger=False)
	LODBiasProfile(6)=(MaxLODBias=16.000000,MinLODBias=1.000000,enableClientNukeCrashFix=False,DecalsLifespan=0.000000)
	GoreProfileA(6)=(enableSlideBloodDecals=True,BloodDecalsMinLifespan=0.000000,BloodDecalsMaxLifespan=0.000000)
	GoreProfileB(6)=(GoreLifeSpanMultiplier=2.500000,GorePartsMultiplier=2.500000,GoreScaleMultiplier=1.000000,bCordCollideWithActors=True,MaxCordIterations=8)
	CarcassFX(6)=3
	
	DebrisWaterProfile(7)=(enableDebris=True,bEnhancedWaterSplashes=True,bCoronasCollisionDetail=False,WaterSplashDetail=6)
	DynLightProfile(7)=(bWeaponsDynLight=True,bAmmoDynLight=True,bPickupsDynLight=True,bEffectsDynLight=True,PickupsGlowScale=1.000000)
	DistDetailProfile(7)=(WeaponDistDetail=128,AmmoDistDetail=128,PickupsDistDetail=128,ChargersDistDetail=128)
	SmartPerfoProfile(7)=(enableGlobalSmartPerformance=True,smartPerformanceMinFPS=40)
	SmartPerfoProfile(7)=(enableSmartPerformanceWeapon=True,enableSmartPerformanceAmmo=True,enableSmartPerformancePickup=False,enableSmartPerformanceCharger=True)
	LODBiasProfile(7)=(MaxLODBias=16.000000,MinLODBias=1.000000,enableClientNukeCrashFix=False,DecalsLifespan=-1.000000)
	GoreProfileA(7)=(enableSlideBloodDecals=True,BloodDecalsMinLifespan=0.000000,BloodDecalsMaxLifespan=0.000000)
	GoreProfileB(7)=(GoreLifeSpanMultiplier=1.000000,GorePartsMultiplier=1.000000,GoreScaleMultiplier=1.000000,bCordCollideWithActors=True,MaxCordIterations=3)
	CarcassFX(7)=2
}