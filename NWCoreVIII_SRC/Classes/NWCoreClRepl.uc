//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWCoreClRepl expands NWClRepl;

struct NWCoronaFX_Client
{
	var bool bCoronasCollisionDetail;
};
var NWCoronaFX_Client NWCoronaFX_Settings;

struct NWMainReplacer_Client
{
	var bool enableWeaponPrioritiesProcessor;
};
var NWMainReplacer_Client NWMainReplacer_Settings;

struct NWInfo_Client
{
	var bool bWeaponsDynLight, bAmmoDynLight, bPickupsDynLight, bEffectsDynLight;
	var byte CarcassFX;
	var byte WeaponDistDetail, AmmoDistDetail, PickupsDistDetail, ChargersDistDetail;
	var bool bEnhancedWaterSplashes, enableDebris, enableGlobalSmartPerformance;
	var byte WaterSplashDetail, smartPerformanceMinFPS;
	var bool enableSmartPerformanceWeapon, enableSmartPerformanceAmmo, enableSmartPerformancePickup, enableSmartPerformanceCharger;
	var float MinLODBias, MaxLODBias;
	var float DecalsLifespan, PickupsGlowScale;
	var bool enableClientNukeCrashFix;
};
var NWInfo_Client NWInfo_Settings;

struct NaliWeapons_Client
{
	var byte RenderZHackManager, CrosshairColorType;
	var bool bSeeWeaponHand, bWeaponFX, bCustomCrosshair, bOpaqueCrosshair, bAlphaCrosshair;
	var color CrosshairColor;
	var float ModifierIconsScale, ModifierIconsYPosSingle, ModifierIconsYPosTriple, ViewBobMult;
	var bool enableNoAmmoMsg;
};
var NaliWeapons_Client NaliWeapons_Settings;

struct KeyedNaliWeapon_Client
{
	var bool displayKeysHelp;
};
var KeyedNaliWeapon_Client KeyedNaliWeapon_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		NWCoronaFX_Settings, NWMainReplacer_Settings, NWInfo_Settings, NaliWeapons_Settings, KeyedNaliWeapon_Settings;
}


function SetServerReplVars()
{
	NWCoronaFX_Settings.bCoronasCollisionDetail = Class'NWCoronaFX'.default.bCoronasCollisionDetail;
	NWMainReplacer_Settings.enableWeaponPrioritiesProcessor = Class'NWMainReplacer'.default.enableWeaponPrioritiesProcessor;
	KeyedNaliWeapon_Settings.displayKeysHelp = Class'KeyedNaliWeapon'.default.displayKeysHelp;
	
	NWInfo_Settings.bWeaponsDynLight = Class'NWInfo'.default.bWeaponsDynLight;
	NWInfo_Settings.bAmmoDynLight = Class'NWInfo'.default.bAmmoDynLight;
	NWInfo_Settings.bPickupsDynLight = Class'NWInfo'.default.bPickupsDynLight;
	NWInfo_Settings.bEffectsDynLight = Class'NWInfo'.default.bEffectsDynLight;
	NWInfo_Settings.CarcassFX = Class'NWInfo'.static.getCarcassFXSettings();
	NWInfo_Settings.WeaponDistDetail = Class'NWInfo'.default.WeaponDistDetail;
	NWInfo_Settings.AmmoDistDetail = Class'NWInfo'.default.AmmoDistDetail;
	NWInfo_Settings.PickupsDistDetail = Class'NWInfo'.default.PickupsDistDetail;
	NWInfo_Settings.ChargersDistDetail = Class'NWInfo'.default.ChargersDistDetail;
	NWInfo_Settings.bEnhancedWaterSplashes = Class'NWInfo'.default.bEnhancedWaterSplashes;
	NWInfo_Settings.enableDebris = Class'NWInfo'.default.enableDebris;
	NWInfo_Settings.enableGlobalSmartPerformance = Class'NWInfo'.default.enableGlobalSmartPerformance;
	NWInfo_Settings.WaterSplashDetail = Class'NWInfo'.default.WaterSplashDetail;
	NWInfo_Settings.smartPerformanceMinFPS = Class'NWInfo'.default.smartPerformanceMinFPS;
	NWInfo_Settings.enableSmartPerformanceWeapon = Class'NWInfo'.default.enableSmartPerformanceWeapon;
	NWInfo_Settings.enableSmartPerformanceAmmo = Class'NWInfo'.default.enableSmartPerformanceAmmo;
	NWInfo_Settings.enableSmartPerformancePickup = Class'NWInfo'.default.enableSmartPerformancePickup;
	NWInfo_Settings.enableSmartPerformanceCharger = Class'NWInfo'.default.enableSmartPerformanceCharger;
	NWInfo_Settings.MinLODBias = Class'NWInfo'.default.MinLODBias;
	NWInfo_Settings.MaxLODBias = Class'NWInfo'.default.MaxLODBias;
	NWInfo_Settings.DecalsLifespan = Class'NWInfo'.default.DecalsLifespan;
	NWInfo_Settings.enableClientNukeCrashFix = Class'NWInfo'.default.enableClientNukeCrashFix;
	NWInfo_Settings.PickupsGlowScale = Class'NWInfo'.default.PickupsGlowScale;
	
	NaliWeapons_Settings.RenderZHackManager = Class'NaliWeapons'.default.RenderZHackManager;
	NaliWeapons_Settings.CrosshairColorType = Class'NaliWeapons'.default.CrosshairColorType;
	NaliWeapons_Settings.bSeeWeaponHand = Class'NaliWeapons'.default.bSeeWeaponHand;
	NaliWeapons_Settings.bWeaponFX = Class'NaliWeapons'.default.bWeaponFX;
	NaliWeapons_Settings.bCustomCrosshair = Class'NaliWeapons'.default.bCustomCrosshair;
	NaliWeapons_Settings.bOpaqueCrosshair = Class'NaliWeapons'.default.bOpaqueCrosshair;
	NaliWeapons_Settings.bAlphaCrosshair = Class'NaliWeapons'.default.bAlphaCrosshair;
	NaliWeapons_Settings.CrosshairColor = Class'NaliWeapons'.default.CrosshairColor;
	NaliWeapons_Settings.ModifierIconsScale = Class'NaliWeapons'.default.ModifierIconsScale;
	NaliWeapons_Settings.ModifierIconsYPosSingle = Class'NaliWeapons'.default.ModifierIconsYPosSingle;
	NaliWeapons_Settings.ModifierIconsYPosTriple = Class'NaliWeapons'.default.ModifierIconsYPosTriple;
	NaliWeapons_Settings.ViewBobMult = Class'NaliWeapons'.default.ViewBobMult;
	NaliWeapons_Settings.enableNoAmmoMsg = Class'NaliWeapons'.default.enableNoAmmoMsg;	
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local NWCoronaFX NWCFX;
local NWMainReplacer NWMR;
local KeyedNaliWeapon KNW;
local NaliWeapons NW;
	
	Class'NWCoronaFX'.default.bCoronasCollisionDetail = NWCoronaFX_Settings.bCoronasCollisionDetail;
	foreach AllActors(Class'NWCoronaFX', NWCFX)
	{
		NWCFX.default.bCoronasCollisionDetail = NWCoronaFX_Settings.bCoronasCollisionDetail;
		NWCFX.bCoronasCollisionDetail = NWCoronaFX_Settings.bCoronasCollisionDetail;
	}
	
	Class'NWMainReplacer'.default.enableWeaponPrioritiesProcessor = NWMainReplacer_Settings.enableWeaponPrioritiesProcessor;
	foreach AllActors(Class'NWMainReplacer', NWMR)
	{
		NWMR.default.enableWeaponPrioritiesProcessor = NWMainReplacer_Settings.enableWeaponPrioritiesProcessor;
		NWMR.enableWeaponPrioritiesProcessor = NWMainReplacer_Settings.enableWeaponPrioritiesProcessor;
	}
	
	Class'KeyedNaliWeapon'.default.displayKeysHelp = KeyedNaliWeapon_Settings.displayKeysHelp;
	foreach AllActors(Class'KeyedNaliWeapon', KNW)
	{
		KNW.default.displayKeysHelp = KeyedNaliWeapon_Settings.displayKeysHelp;
		KNW.displayKeysHelp = KeyedNaliWeapon_Settings.displayKeysHelp;
	}
	
	Class'NaliWeapons'.default.RenderZHackManager = Class'NaliWeapons'.static.GetZHackManagerTypeFromByte(NaliWeapons_Settings.RenderZHackManager);
	Class'NaliWeapons'.default.CrosshairColorType = Class'NaliWeapons'.static.GetCrossColorTypeFromByte(NaliWeapons_Settings.CrosshairColorType);
	Class'NaliWeapons'.default.bSeeWeaponHand = NaliWeapons_Settings.bSeeWeaponHand;
	Class'NaliWeapons'.default.bWeaponFX = NaliWeapons_Settings.bWeaponFX;
	Class'NaliWeapons'.default.bCustomCrosshair = NaliWeapons_Settings.bCustomCrosshair;
	Class'NaliWeapons'.default.bOpaqueCrosshair = NaliWeapons_Settings.bOpaqueCrosshair;
	Class'NaliWeapons'.default.bAlphaCrosshair = NaliWeapons_Settings.bAlphaCrosshair;
	Class'NaliWeapons'.default.CrosshairColor = NaliWeapons_Settings.CrosshairColor;
	Class'NaliWeapons'.default.ModifierIconsScale = NaliWeapons_Settings.ModifierIconsScale;
	Class'NaliWeapons'.default.ModifierIconsYPosSingle = NaliWeapons_Settings.ModifierIconsYPosSingle;
	Class'NaliWeapons'.default.ModifierIconsYPosTriple = NaliWeapons_Settings.ModifierIconsYPosTriple;
	Class'NaliWeapons'.default.ViewBobMult = NaliWeapons_Settings.ViewBobMult;
	Class'NaliWeapons'.default.enableNoAmmoMsg = NaliWeapons_Settings.enableNoAmmoMsg;
	foreach AllActors(Class'NaliWeapons', NW)
	{
		NW.default.RenderZHackManager = Class'NaliWeapons'.static.GetZHackManagerTypeFromByte(NaliWeapons_Settings.RenderZHackManager);
		NW.RenderZHackManager = Class'NaliWeapons'.static.GetZHackManagerTypeFromByte(NaliWeapons_Settings.RenderZHackManager);
		NW.default.CrosshairColorType = Class'NaliWeapons'.static.GetCrossColorTypeFromByte(NaliWeapons_Settings.CrosshairColorType);
		NW.CrosshairColorType = Class'NaliWeapons'.static.GetCrossColorTypeFromByte(NaliWeapons_Settings.CrosshairColorType);
		NW.default.bSeeWeaponHand = NaliWeapons_Settings.bSeeWeaponHand;
		NW.bSeeWeaponHand = NaliWeapons_Settings.bSeeWeaponHand;
		NW.default.bWeaponFX = NaliWeapons_Settings.bWeaponFX;
		NW.bWeaponFX = NaliWeapons_Settings.bWeaponFX;
		NW.default.bCustomCrosshair = NaliWeapons_Settings.bCustomCrosshair;
		NW.bCustomCrosshair = NaliWeapons_Settings.bCustomCrosshair;
		NW.default.bOpaqueCrosshair = NaliWeapons_Settings.bOpaqueCrosshair;
		NW.bOpaqueCrosshair = NaliWeapons_Settings.bOpaqueCrosshair;
		NW.default.bAlphaCrosshair = NaliWeapons_Settings.bAlphaCrosshair;
		NW.bAlphaCrosshair = NaliWeapons_Settings.bAlphaCrosshair;
		NW.default.CrosshairColor = NaliWeapons_Settings.CrosshairColor;
		NW.CrosshairColor = NaliWeapons_Settings.CrosshairColor;
		NW.default.ModifierIconsScale = NaliWeapons_Settings.ModifierIconsScale;
		NW.ModifierIconsScale = NaliWeapons_Settings.ModifierIconsScale;
		NW.default.ModifierIconsYPosSingle = NaliWeapons_Settings.ModifierIconsYPosSingle;
		NW.ModifierIconsYPosSingle = NaliWeapons_Settings.ModifierIconsYPosSingle;
		NW.default.ModifierIconsYPosTriple = NaliWeapons_Settings.ModifierIconsYPosTriple;
		NW.ModifierIconsYPosTriple = NaliWeapons_Settings.ModifierIconsYPosTriple;
		NW.default.ViewBobMult = NaliWeapons_Settings.ViewBobMult;
		NW.ViewBobMult = NaliWeapons_Settings.ViewBobMult;
		NW.default.enableNoAmmoMsg = NaliWeapons_Settings.enableNoAmmoMsg;
		NW.enableNoAmmoMsg = NaliWeapons_Settings.enableNoAmmoMsg;
	}
	
	Class'NWInfo'.default.bWeaponsDynLight = NWInfo_Settings.bWeaponsDynLight;
	Class'NWInfo'.default.bAmmoDynLight = NWInfo_Settings.bAmmoDynLight;
	Class'NWInfo'.default.bPickupsDynLight = NWInfo_Settings.bPickupsDynLight;
	Class'NWInfo'.default.bEffectsDynLight = NWInfo_Settings.bEffectsDynLight;
	Class'NWInfo'.default.CarcassFX = Class'NWInfo'.static.GetCarcassFXFromByte(NWInfo_Settings.CarcassFX);
	Class'NWInfo'.default.WeaponDistDetail = NWInfo_Settings.WeaponDistDetail;
	Class'NWInfo'.default.AmmoDistDetail = NWInfo_Settings.AmmoDistDetail;
	Class'NWInfo'.default.PickupsDistDetail = NWInfo_Settings.PickupsDistDetail;
	Class'NWInfo'.default.ChargersDistDetail = NWInfo_Settings.ChargersDistDetail;
	Class'NWInfo'.default.bEnhancedWaterSplashes = NWInfo_Settings.bEnhancedWaterSplashes;
	Class'NWInfo'.default.enableDebris = NWInfo_Settings.enableDebris;
	Class'NWInfo'.default.enableGlobalSmartPerformance = NWInfo_Settings.enableGlobalSmartPerformance;
	Class'NWInfo'.default.WaterSplashDetail = NWInfo_Settings.WaterSplashDetail;
	Class'NWInfo'.default.smartPerformanceMinFPS = NWInfo_Settings.smartPerformanceMinFPS;
	Class'NWInfo'.default.enableSmartPerformanceWeapon = NWInfo_Settings.enableSmartPerformanceWeapon;
	Class'NWInfo'.default.enableSmartPerformanceAmmo = NWInfo_Settings.enableSmartPerformanceAmmo;
	Class'NWInfo'.default.enableSmartPerformancePickup = NWInfo_Settings.enableSmartPerformancePickup;
	Class'NWInfo'.default.enableSmartPerformanceCharger = NWInfo_Settings.enableSmartPerformanceCharger;
	Class'NWInfo'.default.MinLODBias = NWInfo_Settings.MinLODBias;
	Class'NWInfo'.default.MaxLODBias = NWInfo_Settings.MaxLODBias;
	Class'NWInfo'.default.DecalsLifespan = NWInfo_Settings.DecalsLifespan;
	Class'NWInfo'.default.enableClientNukeCrashFix = NWInfo_Settings.enableClientNukeCrashFix;
	Class'NWInfo'.default.PickupsGlowScale = NWInfo_Settings.PickupsGlowScale;
}


defaultproperties
{
}