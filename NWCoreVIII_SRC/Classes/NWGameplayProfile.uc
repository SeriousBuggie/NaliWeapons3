//////////////////////////////////////////////////////////////
//	Nali Weapons III gameplay profile info
//				Feralidragon (09-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGameplayProfile expands NWProfile config(NWProfilesCfg);

struct GenStructA
{
	var() int MaxTraceRange, MaxHealth;
	var() bool enableTeamBasedEffect, bTeleProjectiles, enableZPServer;
	var() byte AmmoBehaviour;
};
var() config GenStructA GenProfileA[8];

struct GenStructB
{
	var() bool enableServerNukeCrashFix, enableShakeFX, enableKillMsgManager;
};
var() config GenStructB GenProfileB[8];

struct ResFXStruct
{
	var() bool enable_RessurectFX, enable_ResTeamBasedColor;
	var() byte ResFXColor;
};
var() config ResFXStruct WeaponResFXProfile[8], AmmoResFXProfile[8], PickupResFXProfile[8];

struct ModifStructA
{
	var() bool enableModifiers, bKickAffectTeammates, bKickAffectInstigator, bModifChargers;
	var() int ModifiersRespawnTimeSec;
};
var() config ModifStructA ModifProfileA[8];

struct ModifStructB
{
	var() float FireRateChangeMax, FireRateChangeMin, MoreDamageMax, MoreDamageMin, SplasherMax, SplasherMin;
	var() int KickBackMax, KickBackMin;
};
var() config ModifStructB ModifProfileB[8];

struct ModifStructC
{
	var() bool canHealOwner, enableTheOneModif, bAlwaysTheOne, bTheOneUnlockLast;
	var() float healMultiplier;
	var() int healFixedValue;
};
var() config ModifStructC ModifProfileC[8];

struct ModifStructD
{
	var() float ModifFireRateOdds, ModifDmgOdds, ModifKickOdds, ModifSplashOdds;
};
var() config ModifStructD ModifProfileD[8];

struct ModifStructE
{
	var() float ModifHealOdds, ModifInfOdds, ModifOneOdds, ModifNoneOdds;
};
var() config ModifStructE ModifProfileE[8];


var() config ResFXStruct ModifResFXProfile[8];

struct GoreStruct
{
	var() bool enableHeadshotFX, enableHeadshotShake, enableBodyshotFX, enableBodyshotShake;
};
var() config GoreStruct GoreProfile[8];

struct GoreStructB
{
	var() bool enableBodyCarcassDetection, enableBodySkeleton, enableFullNetworkRelevancy;
	var() float BloodFogLifespanMultiplier;
};
var() config GoreStructB GoreProfileB[8];

struct SkillsStruct
{
	var() bool enableSkillKills, disableExtraPointsOnDMGames;
	var() float PointsMultiplier, TimeBetweenMsgs;
	var() byte MaxMsgsMerging;
};
var() config SkillsStruct SkillsProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local NaliWeapons NW;
local NaliPickups NP;
local Mutator M;
local byte j;


	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NaliWeapons'.default.MaxTraceRange = default.GenProfileA[i].MaxTraceRange;
	Class'NaliWeapons'.default.enableZPServer = default.GenProfileA[i].enableZPServer;
	
	Class'NaliWeapons'.default.enableModifiers = default.ModifProfileA[i].enableModifiers;
	Class'NaliWeapons'.default.bKickAffectTeammates = default.ModifProfileA[i].bKickAffectTeammates;
	Class'NaliWeapons'.default.bKickAffectInstigator = default.ModifProfileA[i].bKickAffectInstigator;
	
	Class'NaliWeapons'.default.FireRateChangeMax = default.ModifProfileB[i].FireRateChangeMax;
	Class'NaliWeapons'.default.FireRateChangeMin = default.ModifProfileB[i].FireRateChangeMin;
	Class'NaliWeapons'.default.MoreDamageMax = default.ModifProfileB[i].MoreDamageMax;
	Class'NaliWeapons'.default.MoreDamageMin = default.ModifProfileB[i].MoreDamageMin;
	Class'NaliWeapons'.default.SplasherMax = default.ModifProfileB[i].SplasherMax;
	Class'NaliWeapons'.default.SplasherMin = default.ModifProfileB[i].SplasherMin;
	Class'NaliWeapons'.default.KickBackMax = default.ModifProfileB[i].KickBackMax;
	Class'NaliWeapons'.default.KickBackMin = default.ModifProfileB[i].KickBackMin;
	
	Class'NaliWeapons'.default.canHealOwner = default.ModifProfileC[i].canHealOwner;
	Class'NaliWeapons'.default.enableTheOneModif = default.ModifProfileC[i].enableTheOneModif;
	Class'NaliWeapons'.default.bAlwaysTheOne = default.ModifProfileC[i].bAlwaysTheOne;
	Class'NaliWeapons'.default.healMultiplier = default.ModifProfileC[i].healMultiplier;
	Class'NaliWeapons'.default.healFixedValue = default.ModifProfileC[i].healFixedValue;
	Class'NaliWeapons'.default.bTheOneUnlockLast = default.ModifProfileC[i].bTheOneUnlockLast;
	
	Class'NaliWeapons'.default.ModifFireRateOdds = default.ModifProfileD[i].ModifFireRateOdds;
	Class'NaliWeapons'.default.ModifDmgOdds = default.ModifProfileD[i].ModifDmgOdds;
	Class'NaliWeapons'.default.ModifKickOdds = default.ModifProfileD[i].ModifKickOdds;
	Class'NaliWeapons'.default.ModifSplashOdds = default.ModifProfileD[i].ModifSplashOdds;
	
	Class'NaliWeapons'.default.ModifHealOdds = default.ModifProfileE[i].ModifHealOdds;
	Class'NaliWeapons'.default.ModifInfOdds = default.ModifProfileE[i].ModifInfOdds;
	Class'NaliWeapons'.default.ModifOneOdds = default.ModifProfileE[i].ModifOneOdds;
	Class'NaliWeapons'.default.ModifNoneOdds = default.ModifProfileE[i].ModifNoneOdds;

	
	if (Lvl == None)
		Class'NaliWeapons'.static.StaticSaveConfig();
	
	Class'NWInfo'.default.MaxHealth = default.GenProfileA[i].MaxHealth;
	Class'NWInfo'.default.bTeleProjectiles = default.GenProfileA[i].bTeleProjectiles;
	Class'NWInfo'.default.AmmoBehaviour = Class'NWInfo'.static.GetAmmoBehaviourFromByte(default.GenProfileA[i].AmmoBehaviour);
	
	Class'NWInfo'.default.enableServerNukeCrashFix = default.GenProfileB[i].enableServerNukeCrashFix;
	Class'NWInfo'.default.enableShakeFX = default.GenProfileB[i].enableShakeFX;
	Class'NWInfo'.default.enableKillMsgManager = default.GenProfileB[i].enableKillMsgManager;
	
	Class'NWInfo'.default.enable_WeaponRessurectFX = default.WeaponResFXProfile[i].enable_RessurectFX;
	Class'NWInfo'.default.enable_WeaponResTeamBasedColor = default.WeaponResFXProfile[i].enable_ResTeamBasedColor;
	Class'NWInfo'.default.WeaponResFXColor = Class'NWInfo'.static.GetRessurectColorFromByte(default.WeaponResFXProfile[i].ResFXColor);
	
	Class'NWInfo'.default.enable_AmmoRessurectFX = default.AmmoResFXProfile[i].enable_RessurectFX;
	Class'NWInfo'.default.enable_AmmoResTeamBasedColor = default.AmmoResFXProfile[i].enable_ResTeamBasedColor;
	Class'NWInfo'.default.AmmoResFXColor = Class'NWInfo'.static.GetRessurectColorFromByte(default.AmmoResFXProfile[i].ResFXColor);
	
	Class'NWInfo'.default.enable_PickupRessurectFX = default.PickupResFXProfile[i].enable_RessurectFX;
	Class'NWInfo'.default.enable_PickupResTeamBasedColor = default.PickupResFXProfile[i].enable_ResTeamBasedColor;
	Class'NWInfo'.default.PickupResFXColor = Class'NWInfo'.static.GetRessurectColorFromByte(default.PickupResFXProfile[i].ResFXColor);
	
	Class'NWInfo'.default.bModifChargers = default.ModifProfileA[i].bModifChargers;
	Class'NWInfo'.default.ModifiersRespawnTimeSec = default.ModifProfileA[i].ModifiersRespawnTimeSec;
	
	Class'NWInfo'.default.enable_ModRessurectFX = default.ModifResFXProfile[i].enable_RessurectFX;
	Class'NWInfo'.default.enable_ModResTeamBasedColor = default.ModifResFXProfile[i].enable_ResTeamBasedColor;
	Class'NWInfo'.default.ModResFXColor = Class'NWInfo'.static.GetRessurectColorFromByte(default.ModifResFXProfile[i].ResFXColor);
	
	if (Lvl == None)
		Class'NWInfo'.static.StaticSaveConfig();
	
	Class'NaliPickups'.default.enableTeamBasedEffect = default.GenProfileA[i].enableTeamBasedEffect;
	if (Lvl == None)
		Class'NaliPickups'.static.StaticSaveConfig();
		
	Class'NWBloodyMess'.default.enableHeadshotFX = default.GoreProfile[i].enableHeadshotFX;
	Class'NWBloodyMess'.default.enableHeadshotShake = default.GoreProfile[i].enableHeadshotShake;
	Class'NWBloodyMess'.default.enableBodyshotFX = default.GoreProfile[i].enableBodyshotFX;
	Class'NWBloodyMess'.default.enableBodyshotShake = default.GoreProfile[i].enableBodyshotShake;
	
	Class'NWBloodyMess'.default.enableBodyCarcassDetection = default.GoreProfileB[i].enableBodyCarcassDetection;
	Class'NWBloodyMess'.default.enableBodySkeleton = default.GoreProfileB[i].enableBodySkeleton;
	Class'NWBloodyMess'.default.enableFullNetworkRelevancy = default.GoreProfileB[i].enableFullNetworkRelevancy;
	Class'NWBloodyMess'.default.BloodFogLifespanMultiplier = default.GoreProfileB[i].BloodFogLifespanMultiplier;
	if (Lvl == None)
		Class'NWBloodyMess'.static.StaticSaveConfig();
		
	Class'NWSkillKillsManager'.default.enableSkillKills = default.SkillsProfile[i].enableSkillKills;
	Class'NWSkillKillsManager'.default.disableExtraPointsOnDMGames = default.SkillsProfile[i].disableExtraPointsOnDMGames;
	Class'NWSkillKillsManager'.default.PointsMultiplier = default.SkillsProfile[i].PointsMultiplier;
	Class'NWSkillKillsManager'.default.TimeBetweenMsgs = default.SkillsProfile[i].TimeBetweenMsgs;
	Class'NWSkillKillsManager'.default.MaxMsgsMerging = default.SkillsProfile[i].MaxMsgsMerging;
	if (Lvl == None)
		Class'NWSkillKillsManager'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'NaliWeapons', NW)
		{
			NW.default.MaxTraceRange = Class'NaliWeapons'.default.MaxTraceRange;
			NW.MaxTraceRange = Class'NaliWeapons'.default.MaxTraceRange;
			NW.default.enableZPServer = Class'NaliWeapons'.default.enableZPServer;
			NW.enableZPServer = Class'NaliWeapons'.default.enableZPServer;
			NW.default.enableModifiers = Class'NaliWeapons'.default.enableModifiers;
			NW.enableModifiers = Class'NaliWeapons'.default.enableModifiers;
			NW.default.bKickAffectTeammates = Class'NaliWeapons'.default.bKickAffectTeammates;
			NW.bKickAffectTeammates = Class'NaliWeapons'.default.bKickAffectTeammates;
			NW.default.bKickAffectInstigator = Class'NaliWeapons'.default.bKickAffectInstigator;
			NW.bKickAffectInstigator = Class'NaliWeapons'.default.bKickAffectInstigator;
			NW.default.FireRateChangeMax = Class'NaliWeapons'.default.FireRateChangeMax;
			NW.FireRateChangeMax = Class'NaliWeapons'.default.FireRateChangeMax;
			NW.default.FireRateChangeMin = Class'NaliWeapons'.default.FireRateChangeMin;
			NW.FireRateChangeMin = Class'NaliWeapons'.default.FireRateChangeMin;
			NW.default.MoreDamageMax = Class'NaliWeapons'.default.MoreDamageMax;
			NW.MoreDamageMax = Class'NaliWeapons'.default.MoreDamageMax;
			NW.default.MoreDamageMin = Class'NaliWeapons'.default.MoreDamageMin;
			NW.MoreDamageMin = Class'NaliWeapons'.default.MoreDamageMin;
			NW.default.SplasherMax = Class'NaliWeapons'.default.SplasherMax;
			NW.SplasherMax = Class'NaliWeapons'.default.SplasherMax;
			NW.default.SplasherMin = Class'NaliWeapons'.default.SplasherMin;
			NW.SplasherMin = Class'NaliWeapons'.default.SplasherMin;
			NW.default.KickBackMax = Class'NaliWeapons'.default.KickBackMax;
			NW.KickBackMax = Class'NaliWeapons'.default.KickBackMax;
			NW.default.KickBackMin = Class'NaliWeapons'.default.KickBackMin;
			NW.KickBackMin = Class'NaliWeapons'.default.KickBackMin;
			NW.default.canHealOwner = Class'NaliWeapons'.default.canHealOwner;
			NW.canHealOwner = Class'NaliWeapons'.default.canHealOwner;
			NW.default.enableTheOneModif = Class'NaliWeapons'.default.enableTheOneModif;
			NW.enableTheOneModif = Class'NaliWeapons'.default.enableTheOneModif;
			NW.default.bAlwaysTheOne = Class'NaliWeapons'.default.bAlwaysTheOne;
			NW.bAlwaysTheOne = Class'NaliWeapons'.default.bAlwaysTheOne;
			NW.default.healMultiplier = Class'NaliWeapons'.default.healMultiplier;
			NW.healMultiplier = Class'NaliWeapons'.default.healMultiplier;
			NW.default.healFixedValue = Class'NaliWeapons'.default.healFixedValue;
			NW.healFixedValue = Class'NaliWeapons'.default.healFixedValue;
			NW.default.bTheOneUnlockLast = Class'NaliWeapons'.default.bTheOneUnlockLast;
			NW.bTheOneUnlockLast = Class'NaliWeapons'.default.bTheOneUnlockLast;
			
			NW.default.ModifFireRateOdds = Class'NaliWeapons'.default.ModifFireRateOdds;
			NW.ModifFireRateOdds = Class'NaliWeapons'.default.ModifFireRateOdds;
			NW.default.ModifDmgOdds = Class'NaliWeapons'.default.ModifDmgOdds;
			NW.ModifDmgOdds = Class'NaliWeapons'.default.ModifDmgOdds;
			NW.default.ModifKickOdds = Class'NaliWeapons'.default.ModifKickOdds;
			NW.ModifKickOdds = Class'NaliWeapons'.default.ModifKickOdds;
			NW.default.ModifSplashOdds = Class'NaliWeapons'.default.ModifSplashOdds;
			NW.ModifSplashOdds = Class'NaliWeapons'.default.ModifSplashOdds;
			NW.default.ModifHealOdds = Class'NaliWeapons'.default.ModifHealOdds;
			NW.ModifHealOdds = Class'NaliWeapons'.default.ModifHealOdds;
			NW.default.ModifInfOdds = Class'NaliWeapons'.default.ModifInfOdds;
			NW.ModifInfOdds = Class'NaliWeapons'.default.ModifInfOdds;
			NW.default.ModifOneOdds = Class'NaliWeapons'.default.ModifOneOdds;
			NW.ModifOneOdds = Class'NaliWeapons'.default.ModifOneOdds;
			NW.default.ModifNoneOdds = Class'NaliWeapons'.default.ModifNoneOdds;
			NW.ModifNoneOdds = Class'NaliWeapons'.default.ModifNoneOdds;
			
			LoadProfileForNWClass(NW.Class);
		}
		
		ForEach Lvl.AllActors(Class'NaliPickups', NP)
		{
			NP.default.enableTeamBasedEffect = Class'NaliPickups'.default.enableTeamBasedEffect;
			NP.enableTeamBasedEffect = Class'NaliPickups'.default.enableTeamBasedEffect;
			LoadProfileForNPClass(NP.Class);
		}
		
		for (M = Lvl.Game.BaseMutator; M != None; M = M.NextMutator)
		{
			if (NWReplacer(M) != None)
			{
				for (j = 0; j < NWReplacer(M).GetDefaultWeaponsArraySize(); j++)
					LoadProfileForNWClass(class<NaliWeapons>(NWReplacer(M).GetDefaultWeaponClass(j)));
				for (j = 0; j < NWReplacer(M).GetWeaponItemsArraySize(); j++)
					LoadProfileForNWClass(class<NaliWeapons>(NWReplacer(M).GetWeaponItemClass(j)));
				for (j = 0; j < NWReplacer(M).GetPickupItemsArraySize(); j++)
					LoadProfileForNPClass(class<NaliPickups>(NWReplacer(M).GetPickupItemClass(j)));
			}
		}
	}
}

static function LoadProfileForNWClass(class<NaliWeapons> NWClass)
{
	if (NWClass == None)
		return;
	
	NWClass.default.MaxTraceRange = Class'NaliWeapons'.default.MaxTraceRange;
	NWClass.default.enableZPServer = Class'NaliWeapons'.default.enableZPServer;
	NWClass.default.enableModifiers = Class'NaliWeapons'.default.enableModifiers;
	NWClass.default.bKickAffectTeammates = Class'NaliWeapons'.default.bKickAffectTeammates;
	NWClass.default.bKickAffectInstigator = Class'NaliWeapons'.default.bKickAffectInstigator;
	NWClass.default.FireRateChangeMax = Class'NaliWeapons'.default.FireRateChangeMax;
	NWClass.default.FireRateChangeMin = Class'NaliWeapons'.default.FireRateChangeMin;
	NWClass.default.MoreDamageMax = Class'NaliWeapons'.default.MoreDamageMax;
	NWClass.default.MoreDamageMin = Class'NaliWeapons'.default.MoreDamageMin;
	NWClass.default.SplasherMax = Class'NaliWeapons'.default.SplasherMax;
	NWClass.default.SplasherMin = Class'NaliWeapons'.default.SplasherMin;
	NWClass.default.KickBackMax = Class'NaliWeapons'.default.KickBackMax;
	NWClass.default.KickBackMin = Class'NaliWeapons'.default.KickBackMin;
	NWClass.default.canHealOwner = Class'NaliWeapons'.default.canHealOwner;
	NWClass.default.enableTheOneModif = Class'NaliWeapons'.default.enableTheOneModif;
	NWClass.default.bAlwaysTheOne = Class'NaliWeapons'.default.bAlwaysTheOne;
	NWClass.default.healMultiplier = Class'NaliWeapons'.default.healMultiplier;
	NWClass.default.healFixedValue = Class'NaliWeapons'.default.healFixedValue;
	NWClass.default.bTheOneUnlockLast = Class'NaliWeapons'.default.bTheOneUnlockLast;
	NWClass.default.ModifFireRateOdds = Class'NaliWeapons'.default.ModifFireRateOdds;
	NWClass.default.ModifDmgOdds = Class'NaliWeapons'.default.ModifDmgOdds;
	NWClass.default.ModifKickOdds = Class'NaliWeapons'.default.ModifKickOdds;
	NWClass.default.ModifSplashOdds = Class'NaliWeapons'.default.ModifSplashOdds;
	NWClass.default.ModifHealOdds = Class'NaliWeapons'.default.ModifHealOdds;
	NWClass.default.ModifInfOdds = Class'NaliWeapons'.default.ModifInfOdds;
	NWClass.default.ModifOneOdds = Class'NaliWeapons'.default.ModifOneOdds;
	NWClass.default.ModifNoneOdds = Class'NaliWeapons'.default.ModifNoneOdds;
}

static function LoadProfileForNPClass(class<NaliPickups> NPClass)
{
	if (NPClass == None)
		return;
	NPClass.default.enableTeamBasedEffect = Class'NaliPickups'.default.enableTeamBasedEffect;
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.GenProfileA[i].MaxTraceRange = Class'NaliWeapons'.default.MaxTraceRange;
	default.GenProfileA[i].enableZPServer = Class'NaliWeapons'.default.enableZPServer;
	default.GenProfileA[i].enableTeamBasedEffect = Class'NaliPickups'.default.enableTeamBasedEffect;
	default.GenProfileA[i].MaxHealth = Class'NWInfo'.default.MaxHealth;
	default.GenProfileA[i].bTeleProjectiles = Class'NWInfo'.default.bTeleProjectiles;
	default.GenProfileA[i].AmmoBehaviour = Class'NWInfo'.default.AmmoBehaviour;
	
	default.GenProfileB[i].enableServerNukeCrashFix = Class'NWInfo'.default.enableServerNukeCrashFix;
	default.GenProfileB[i].enableShakeFX = Class'NWInfo'.default.enableShakeFX;
	default.GenProfileB[i].enableKillMsgManager = Class'NWInfo'.default.enableKillMsgManager;
	
	default.WeaponResFXProfile[i].enable_RessurectFX = Class'NWInfo'.default.enable_WeaponRessurectFX;
	default.WeaponResFXProfile[i].enable_ResTeamBasedColor = Class'NWInfo'.default.enable_WeaponResTeamBasedColor;
	default.WeaponResFXProfile[i].ResFXColor = Class'NWInfo'.default.WeaponResFXColor;
	
	default.AmmoResFXProfile[i].enable_RessurectFX = Class'NWInfo'.default.enable_AmmoRessurectFX;
	default.AmmoResFXProfile[i].enable_ResTeamBasedColor = Class'NWInfo'.default.enable_AmmoResTeamBasedColor;
	default.AmmoResFXProfile[i].ResFXColor = Class'NWInfo'.default.AmmoResFXColor;
	
	default.PickupResFXProfile[i].enable_RessurectFX = Class'NWInfo'.default.enable_PickupRessurectFX;
	default.PickupResFXProfile[i].enable_ResTeamBasedColor = Class'NWInfo'.default.enable_PickupResTeamBasedColor;
	default.PickupResFXProfile[i].ResFXColor = Class'NWInfo'.default.PickupResFXColor;
	
	default.ModifProfileA[i].enableModifiers = Class'NaliWeapons'.default.enableModifiers;
	default.ModifProfileA[i].bKickAffectTeammates = Class'NaliWeapons'.default.bKickAffectTeammates;
	default.ModifProfileA[i].bKickAffectInstigator = Class'NaliWeapons'.default.bKickAffectInstigator;
	default.ModifProfileA[i].bModifChargers = Class'NWInfo'.default.bModifChargers;
	default.ModifProfileA[i].ModifiersRespawnTimeSec = Class'NWInfo'.default.ModifiersRespawnTimeSec;
	
	default.ModifProfileB[i].FireRateChangeMax = Class'NaliWeapons'.default.FireRateChangeMax;
	default.ModifProfileB[i].FireRateChangeMin = Class'NaliWeapons'.default.FireRateChangeMin;
	default.ModifProfileB[i].MoreDamageMax = Class'NaliWeapons'.default.MoreDamageMax;
	default.ModifProfileB[i].MoreDamageMin = Class'NaliWeapons'.default.MoreDamageMin;
	default.ModifProfileB[i].SplasherMax = Class'NaliWeapons'.default.SplasherMax;
	default.ModifProfileB[i].SplasherMin = Class'NaliWeapons'.default.SplasherMin;
	default.ModifProfileB[i].KickBackMax = Class'NaliWeapons'.default.KickBackMax;
	default.ModifProfileB[i].KickBackMin = Class'NaliWeapons'.default.KickBackMin;
	
	default.ModifProfileC[i].canHealOwner = Class'NaliWeapons'.default.canHealOwner;
	default.ModifProfileC[i].enableTheOneModif = Class'NaliWeapons'.default.enableTheOneModif;
	default.ModifProfileC[i].bAlwaysTheOne = Class'NaliWeapons'.default.bAlwaysTheOne;
	default.ModifProfileC[i].healMultiplier = Class'NaliWeapons'.default.healMultiplier;
	default.ModifProfileC[i].healFixedValue = Class'NaliWeapons'.default.healFixedValue;
	default.ModifProfileC[i].bTheOneUnlockLast = Class'NaliWeapons'.default.bTheOneUnlockLast;
	
	default.ModifProfileD[i].ModifFireRateOdds = Class'NaliWeapons'.default.ModifFireRateOdds;
	default.ModifProfileD[i].ModifDmgOdds = Class'NaliWeapons'.default.ModifDmgOdds;
	default.ModifProfileD[i].ModifKickOdds = Class'NaliWeapons'.default.ModifKickOdds;
	default.ModifProfileD[i].ModifSplashOdds = Class'NaliWeapons'.default.ModifSplashOdds;
	
	default.ModifProfileE[i].ModifHealOdds = Class'NaliWeapons'.default.ModifHealOdds;
	default.ModifProfileE[i].ModifInfOdds = Class'NaliWeapons'.default.ModifInfOdds;
	default.ModifProfileE[i].ModifOneOdds = Class'NaliWeapons'.default.ModifOneOdds;
	default.ModifProfileE[i].ModifNoneOdds = Class'NaliWeapons'.default.ModifNoneOdds;
	
	default.ModifResFXProfile[i].enable_RessurectFX = Class'NWInfo'.default.enable_ModRessurectFX;
	default.ModifResFXProfile[i].enable_ResTeamBasedColor = Class'NWInfo'.default.enable_ModResTeamBasedColor;
	default.ModifResFXProfile[i].ResFXColor = Class'NWInfo'.default.ModResFXColor;
	
	default.GoreProfile[i].enableHeadshotFX = Class'NWBloodyMess'.default.enableHeadshotFX;
	default.GoreProfile[i].enableHeadshotShake = Class'NWBloodyMess'.default.enableHeadshotShake;
	default.GoreProfile[i].enableBodyshotFX = Class'NWBloodyMess'.default.enableBodyshotFX;
	default.GoreProfile[i].enableBodyshotShake = Class'NWBloodyMess'.default.enableBodyshotShake;
	
	default.GoreProfileB[i].enableBodyCarcassDetection = Class'NWBloodyMess'.default.enableBodyCarcassDetection;
	default.GoreProfileB[i].enableBodySkeleton = Class'NWBloodyMess'.default.enableBodySkeleton;
	default.GoreProfileB[i].enableFullNetworkRelevancy = Class'NWBloodyMess'.default.enableFullNetworkRelevancy;
	default.GoreProfileB[i].BloodFogLifespanMultiplier = Class'NWBloodyMess'.default.BloodFogLifespanMultiplier;
	
	default.SkillsProfile[i].enableSkillKills = Class'NWSkillKillsManager'.default.enableSkillKills;
	default.SkillsProfile[i].disableExtraPointsOnDMGames = Class'NWSkillKillsManager'.default.disableExtraPointsOnDMGames;
	default.SkillsProfile[i].PointsMultiplier = Class'NWSkillKillsManager'.default.PointsMultiplier;
	default.SkillsProfile[i].TimeBetweenMsgs = Class'NWSkillKillsManager'.default.TimeBetweenMsgs;
	default.SkillsProfile[i].MaxMsgsMerging = Class'NWSkillKillsManager'.default.MaxMsgsMerging;
	
	StaticSaveConfig();
}


defaultproperties
{
	SelectedProfile=2
	ProfileNames(0)="Weak weapons"
	ProfileNames(1)="Normal weapons"
	ProfileNames(2)="Strong weapons"
	ProfileNames(3)="Monster Hunt Challenge"
	ProfileNames(4)="Monster Hunt Party"
	ProfileNames(5)="Custom Profile 1"
	ProfileNames(6)="Custom Profile 2"
	ProfileNames(7)="Custom Profile 3"
	
	
	GenProfileA(0)=(MaxTraceRange=30000,MaxHealth=199,enableTeamBasedEffect=True,bTeleProjectiles=False,AmmoBehaviour=0,enableZPServer=True)
	GenProfileB(0)=(enableServerNukeCrashFix=False,enableShakeFX=True,enableKillMsgManager=True)
	WeaponResFXProfile(0)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	AmmoResFXProfile(0)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	PickupResFXProfile(0)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	ModifProfileA(0)=(enableModifiers=False,bKickAffectTeammates=False,bKickAffectInstigator=True,bModifChargers=True,ModifiersRespawnTimeSec=60)
	ModifProfileB(0)=(FireRateChangeMax=2.000000,FireRateChangeMin=1.200000,MoreDamageMax=2.000000,MoreDamageMin=1.100000,SplasherMax=1.500000,SplasherMin=1.100000,KickBackMax=30,KickBackMin=5)
	ModifProfileC(0)=(canHealOwner=False,enableTheOneModif=False,bAlwaysTheOne=False,bTheOneUnlockLast=False,healMultiplier=0.250000,healFixedValue=5)
	ModifResFXProfile(0)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	GoreProfile(0)=(enableHeadshotFX=True,enableHeadshotShake=True,enableBodyshotFX=True,enableBodyshotShake=True)
	GoreProfileB(0)=(enableBodyCarcassDetection=True,enableBodySkeleton=True,enableFullNetworkRelevancy=False,BloodFogLifespanMultiplier=0.500000)
	SkillsProfile(0)=(enableSkillKills=True,disableExtraPointsOnDMGames=True,PointsMultiplier=1.000000,TimeBetweenMsgs=2.500000,MaxMsgsMerging=3)
	ModifProfileD(0)=(ModifFireRateOdds=5.000000,ModifDmgOdds=5.000000,ModifKickOdds=7.000000,ModifSplashOdds=7.000000)
	ModifProfileE(0)=(ModifHealOdds=20.000000,ModifInfOdds=5.000000,ModifOneOdds=2.000000,ModifNoneOdds=49.000000)
	
	GenProfileA(1)=(MaxTraceRange=30000,MaxHealth=199,enableTeamBasedEffect=True,bTeleProjectiles=False,AmmoBehaviour=0,enableZPServer=True)
	GenProfileB(1)=(enableServerNukeCrashFix=False,enableShakeFX=True,enableKillMsgManager=True)
	WeaponResFXProfile(1)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	AmmoResFXProfile(1)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	PickupResFXProfile(1)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	ModifProfileA(1)=(enableModifiers=False,bKickAffectTeammates=False,bKickAffectInstigator=True,bModifChargers=True,ModifiersRespawnTimeSec=30)
	ModifProfileB(1)=(FireRateChangeMax=3.000000,FireRateChangeMin=2.000000,MoreDamageMax=3.000000,MoreDamageMin=1.750000,SplasherMax=2.000000,SplasherMin=1.250000,KickBackMax=55,KickBackMin=10)
	ModifProfileC(1)=(canHealOwner=False,enableTheOneModif=False,bAlwaysTheOne=False,bTheOneUnlockLast=False,healMultiplier=0.500000,healFixedValue=0)
	ModifResFXProfile(1)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	GoreProfile(1)=(enableHeadshotFX=True,enableHeadshotShake=True,enableBodyshotFX=True,enableBodyshotShake=True)
	GoreProfileB(1)=(enableBodyCarcassDetection=True,enableBodySkeleton=True,enableFullNetworkRelevancy=False,BloodFogLifespanMultiplier=1.000000)
	SkillsProfile(1)=(enableSkillKills=True,disableExtraPointsOnDMGames=True,PointsMultiplier=1.000000,TimeBetweenMsgs=2.500000,MaxMsgsMerging=3)
	ModifProfileD(1)=(ModifFireRateOdds=7.000000,ModifDmgOdds=7.000000,ModifKickOdds=10.000000,ModifSplashOdds=10.000000)
	ModifProfileE(1)=(ModifHealOdds=15.000000,ModifInfOdds=7.000000,ModifOneOdds=5.000000,ModifNoneOdds=39.000000)
	
	GenProfileA(2)=(MaxTraceRange=30000,MaxHealth=225,enableTeamBasedEffect=True,bTeleProjectiles=False,AmmoBehaviour=0,enableZPServer=True)
	GenProfileB(2)=(enableServerNukeCrashFix=False,enableShakeFX=True,enableKillMsgManager=True)
	WeaponResFXProfile(2)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	AmmoResFXProfile(2)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	PickupResFXProfile(2)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	ModifProfileA(2)=(enableModifiers=False,bKickAffectTeammates=False,bKickAffectInstigator=True,bModifChargers=True,ModifiersRespawnTimeSec=15)
	ModifProfileB(2)=(FireRateChangeMax=4.000000,FireRateChangeMin=2.000000,MoreDamageMax=6.000000,MoreDamageMin=2.000000,SplasherMax=3.000000,SplasherMin=1.250000,KickBackMax=110,KickBackMin=10)
	ModifProfileC(2)=(canHealOwner=True,enableTheOneModif=True,bAlwaysTheOne=False,bTheOneUnlockLast=True,healMultiplier=0.750000,healFixedValue=0)
	ModifResFXProfile(2)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	GoreProfile(2)=(enableHeadshotFX=True,enableHeadshotShake=True,enableBodyshotFX=True,enableBodyshotShake=True)
	GoreProfileB(2)=(enableBodyCarcassDetection=True,enableBodySkeleton=True,enableFullNetworkRelevancy=False,BloodFogLifespanMultiplier=1.000000)
	SkillsProfile(2)=(enableSkillKills=True,disableExtraPointsOnDMGames=True,PointsMultiplier=1.000000,TimeBetweenMsgs=2.500000,MaxMsgsMerging=3)
	ModifProfileD(2)=(ModifFireRateOdds=10.000000,ModifDmgOdds=10.000000,ModifKickOdds=10.000000,ModifSplashOdds=10.000000)
	ModifProfileE(2)=(ModifHealOdds=10.000000,ModifInfOdds=10.000000,ModifOneOdds=10.000000,ModifNoneOdds=30.000000)
	
	GenProfileA(3)=(MaxTraceRange=30000,MaxHealth=500,enableTeamBasedEffect=True,bTeleProjectiles=False,AmmoBehaviour=0,enableZPServer=True)
	GenProfileB(3)=(enableServerNukeCrashFix=False,enableShakeFX=True,enableKillMsgManager=True)
	WeaponResFXProfile(3)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	AmmoResFXProfile(3)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	PickupResFXProfile(3)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	ModifProfileA(3)=(enableModifiers=True,bKickAffectTeammates=False,bKickAffectInstigator=True,bModifChargers=True,ModifiersRespawnTimeSec=45)
	ModifProfileB(3)=(FireRateChangeMax=2.000000,FireRateChangeMin=1.200000,MoreDamageMax=2.000000,MoreDamageMin=1.100000,SplasherMax=1.500000,SplasherMin=1.100000,KickBackMax=30,KickBackMin=5)
	ModifProfileC(3)=(canHealOwner=False,enableTheOneModif=False,bAlwaysTheOne=False,bTheOneUnlockLast=True,healMultiplier=0.650000,healFixedValue=10)
	ModifResFXProfile(3)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	GoreProfile(3)=(enableHeadshotFX=True,enableHeadshotShake=True,enableBodyshotFX=True,enableBodyshotShake=True)
	GoreProfileB(3)=(enableBodyCarcassDetection=True,enableBodySkeleton=True,enableFullNetworkRelevancy=False,BloodFogLifespanMultiplier=1.000000)
	SkillsProfile(3)=(enableSkillKills=True,disableExtraPointsOnDMGames=True,PointsMultiplier=1.000000,TimeBetweenMsgs=2.500000,MaxMsgsMerging=3)
	ModifProfileD(3)=(ModifFireRateOdds=10.000000,ModifDmgOdds=10.000000,ModifKickOdds=10.000000,ModifSplashOdds=10.000000)
	ModifProfileE(3)=(ModifHealOdds=10.000000,ModifInfOdds=10.000000,ModifOneOdds=10.000000,ModifNoneOdds=30.000000)
	
	GenProfileA(4)=(MaxTraceRange=30000,MaxHealth=2500,enableTeamBasedEffect=True,bTeleProjectiles=False,AmmoBehaviour=0,enableZPServer=True)
	GenProfileB(4)=(enableServerNukeCrashFix=False,enableShakeFX=True,enableKillMsgManager=True)
	WeaponResFXProfile(4)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	AmmoResFXProfile(4)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	PickupResFXProfile(4)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	ModifProfileA(4)=(enableModifiers=True,bKickAffectTeammates=False,bKickAffectInstigator=True,bModifChargers=True,ModifiersRespawnTimeSec=15)
	ModifProfileB(4)=(FireRateChangeMax=4.000000,FireRateChangeMin=2.000000,MoreDamageMax=6.000000,MoreDamageMin=2.000000,SplasherMax=3.000000,SplasherMin=1.250000,KickBackMax=110,KickBackMin=10)
	ModifProfileC(4)=(canHealOwner=True,enableTheOneModif=True,bAlwaysTheOne=False,bTheOneUnlockLast=True,healMultiplier=1.000000,healFixedValue=0)
	ModifResFXProfile(4)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	GoreProfile(4)=(enableHeadshotFX=True,enableHeadshotShake=True,enableBodyshotFX=True,enableBodyshotShake=True)
	GoreProfileB(4)=(enableBodyCarcassDetection=True,enableBodySkeleton=True,enableFullNetworkRelevancy=False,BloodFogLifespanMultiplier=1.000000)
	SkillsProfile(4)=(enableSkillKills=True,disableExtraPointsOnDMGames=True,PointsMultiplier=3.000000,TimeBetweenMsgs=2.500000,MaxMsgsMerging=3)
	ModifProfileD(4)=(ModifFireRateOdds=15.000000,ModifDmgOdds=15.000000,ModifKickOdds=7.000000,ModifSplashOdds=7.000000)
	ModifProfileE(4)=(ModifHealOdds=12.000000,ModifInfOdds=15.000000,ModifOneOdds=12.000000,ModifNoneOdds=17.000000)
	
	GenProfileA(5)=(MaxTraceRange=30000,MaxHealth=225,enableTeamBasedEffect=True,bTeleProjectiles=False,AmmoBehaviour=0,enableZPServer=True)
	GenProfileB(5)=(enableServerNukeCrashFix=False,enableShakeFX=True,enableKillMsgManager=True)
	WeaponResFXProfile(5)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	AmmoResFXProfile(5)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	PickupResFXProfile(5)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	ModifProfileA(5)=(enableModifiers=False,bKickAffectTeammates=False,bKickAffectInstigator=True,bModifChargers=True,ModifiersRespawnTimeSec=15)
	ModifProfileB(5)=(FireRateChangeMax=4.000000,FireRateChangeMin=2.000000,MoreDamageMax=6.000000,MoreDamageMin=2.000000,SplasherMax=3.000000,SplasherMin=1.250000,KickBackMax=110,KickBackMin=10)
	ModifProfileC(5)=(canHealOwner=True,enableTheOneModif=True,bAlwaysTheOne=False,bTheOneUnlockLast=True,healMultiplier=0.750000,healFixedValue=0)
	ModifResFXProfile(5)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	GoreProfile(5)=(enableHeadshotFX=True,enableHeadshotShake=True,enableBodyshotFX=True,enableBodyshotShake=True)
	GoreProfileB(5)=(enableBodyCarcassDetection=True,enableBodySkeleton=True,enableFullNetworkRelevancy=False,BloodFogLifespanMultiplier=1.000000)
	SkillsProfile(5)=(enableSkillKills=True,disableExtraPointsOnDMGames=True,PointsMultiplier=1.000000,TimeBetweenMsgs=2.500000,MaxMsgsMerging=3)
	ModifProfileD(5)=(ModifFireRateOdds=10.000000,ModifDmgOdds=10.000000,ModifKickOdds=10.000000,ModifSplashOdds=10.000000)
	ModifProfileE(5)=(ModifHealOdds=10.000000,ModifInfOdds=10.000000,ModifOneOdds=10.000000,ModifNoneOdds=30.000000)
	
	GenProfileA(6)=(MaxTraceRange=30000,MaxHealth=225,enableTeamBasedEffect=True,bTeleProjectiles=False,AmmoBehaviour=0,enableZPServer=True)
	GenProfileB(6)=(enableServerNukeCrashFix=False,enableShakeFX=True,enableKillMsgManager=True)
	WeaponResFXProfile(6)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	AmmoResFXProfile(6)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	PickupResFXProfile(6)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	ModifProfileA(6)=(enableModifiers=False,bKickAffectTeammates=False,bKickAffectInstigator=True,bModifChargers=True,ModifiersRespawnTimeSec=15)
	ModifProfileB(6)=(FireRateChangeMax=4.000000,FireRateChangeMin=2.000000,MoreDamageMax=6.000000,MoreDamageMin=2.000000,SplasherMax=3.000000,SplasherMin=1.250000,KickBackMax=110,KickBackMin=10)
	ModifProfileC(6)=(canHealOwner=True,enableTheOneModif=True,bAlwaysTheOne=False,bTheOneUnlockLast=True,healMultiplier=0.750000,healFixedValue=0)
	ModifResFXProfile(6)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	GoreProfile(6)=(enableHeadshotFX=True,enableHeadshotShake=True,enableBodyshotFX=True,enableBodyshotShake=True)
	GoreProfileB(6)=(enableBodyCarcassDetection=True,enableBodySkeleton=True,enableFullNetworkRelevancy=False,BloodFogLifespanMultiplier=1.000000)
	SkillsProfile(6)=(enableSkillKills=True,disableExtraPointsOnDMGames=True,PointsMultiplier=1.000000,TimeBetweenMsgs=2.500000,MaxMsgsMerging=3)
	ModifProfileD(6)=(ModifFireRateOdds=10.000000,ModifDmgOdds=10.000000,ModifKickOdds=10.000000,ModifSplashOdds=10.000000)
	ModifProfileE(6)=(ModifHealOdds=10.000000,ModifInfOdds=10.000000,ModifOneOdds=10.000000,ModifNoneOdds=30.000000)
	
	GenProfileA(7)=(MaxTraceRange=30000,MaxHealth=225,enableTeamBasedEffect=True,bTeleProjectiles=False,AmmoBehaviour=0,enableZPServer=True)
	GenProfileB(7)=(enableServerNukeCrashFix=False,enableShakeFX=True,enableKillMsgManager=True)
	WeaponResFXProfile(7)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	AmmoResFXProfile(7)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	PickupResFXProfile(7)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	ModifProfileA(7)=(enableModifiers=False,bKickAffectTeammates=False,bKickAffectInstigator=True,bModifChargers=True,ModifiersRespawnTimeSec=15)
	ModifProfileB(7)=(FireRateChangeMax=4.000000,FireRateChangeMin=2.000000,MoreDamageMax=6.000000,MoreDamageMin=2.000000,SplasherMax=3.000000,SplasherMin=1.250000,KickBackMax=110,KickBackMin=10)
	ModifProfileC(7)=(canHealOwner=True,enableTheOneModif=True,bAlwaysTheOne=False,bTheOneUnlockLast=True,healMultiplier=0.750000,healFixedValue=0)
	ModifResFXProfile(7)=(enable_RessurectFX=True,enable_ResTeamBasedColor=True,ResFXColor=1)
	GoreProfile(7)=(enableHeadshotFX=True,enableHeadshotShake=True,enableBodyshotFX=True,enableBodyshotShake=True)
	GoreProfileB(7)=(enableBodyCarcassDetection=True,enableBodySkeleton=True,enableFullNetworkRelevancy=False,BloodFogLifespanMultiplier=1.000000)
	SkillsProfile(7)=(enableSkillKills=True,disableExtraPointsOnDMGames=True,PointsMultiplier=1.000000,TimeBetweenMsgs=2.500000,MaxMsgsMerging=3)
	ModifProfileD(7)=(ModifFireRateOdds=10.000000,ModifDmgOdds=10.000000,ModifKickOdds=10.000000,ModifSplashOdds=10.000000)
	ModifProfileE(7)=(ModifHealOdds=10.000000,ModifInfOdds=10.000000,ModifOneOdds=10.000000,ModifNoneOdds=30.000000)
}