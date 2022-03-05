//////////////////////////////////////////////////////////////
//				Feralidragon (12-09-2012)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybotLauncherGameplayProfile expands NWProfile config(NWProfilesCfg);

struct CybotLauncherStructA
{
	var() bool bFriendlyFire, bCanBeTelefragged, bCanBeTelefraggedByOwner, bCanBeTelefraggedByTeam, bGuardianReturnToOrigin;
};
var() config CybotLauncherStructA CybotLauncherProfileA[8];

struct CybotLauncherStructB
{
	var() bool bFieldKillPawns;
	var() int FieldHealth, FieldDamage, VortexHealth, KamiBaseDamage, VortexBaseDamage;
};
var() config CybotLauncherStructB CybotLauncherProfileB[8];

struct CybotLauncherStructC
{
	var() float ElectricalDamageScale, CybotProjDmgMultiplier, CybotHealthMultiplier, CybotProjSpeedMultiplier;
};
var() config CybotLauncherStructC CybotLauncherProfileC[8];

struct CybotLauncherStructD
{
	var() bool enableCybotDeathAknMessages, enableCybotBeacons, bAlwaysSeeCybotBeacons, ReduceCybotBeaconsOnDistance, enableCybotBeaconsText;
	var() float CybotBeaconsMaxDistance, CybotBeaconsTextDist;
};
var() config CybotLauncherStructD CybotLauncherProfileD[8];


struct CybotLauncherStructE
{
	var() bool enableCybot01, enableCybot02, enableCybot03, enableCybot04, enableCybot05;
	var() bool enableCybot06, enableCybot07, enableCybot08, enableCybot09, enableCybot10;
};
var() config CybotLauncherStructE CybotLauncherProfileE[8];

struct CybotLauncherStructF
{
	var() int CybotSentinelHealth, CybotDualSentinelHealth, CybotAndroidHealth, CybotHeliHealth, CybotDroneHealth;
};
var() config CybotLauncherStructF CybotLauncherProfileF[8];

struct CybotLauncherStructG
{
	var() int MaxCybotsPerPlayer;
	var() float CybotsMaxLifeSpan, FieldMaxLifeSpan, VortexMaxLifeSpan;
};
var() config CybotLauncherStructG CybotLauncherProfileG[8];

struct CybotLOversStructA
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime, OversurrectionHealth, OversurrectionChildrenHealth;
};
var() config CybotLOversStructA CybotLOversProfileA[8];

struct CybotLOversStructB
{
	var() float OversurrectionChildrenInnerMaxRadius, OversurrectionChildrenOuterMaxRadius;
	var() int OversurrectionChildrenMax, OversurrectionChildrenDefenseMin;
};
var() config CybotLOversStructB CybotLOversProfileB[8];

struct CybotLOversStructC
{
	var() float OversurrectionChildrenMoveTimeInterval, OversurrectionChildrenAutoAttackOdds;
};
var() config CybotLOversStructC CybotLOversProfileC[8];

struct CybotLOversStructD
{
	var() float OversurrectionZapAttackOdds, OversurrectionZapAttackCooldown;
	var() int OversurrectionZapAttackDmg;
};
var() config CybotLOversStructD CybotLOversProfileD[8];

struct CybotLOversStructE
{
	var() float OversurrectionProjAttackOdds, OversurrectionProjAttackCooldown;
	var() int OversurrectionProjAttackDmg;
};
var() config CybotLOversStructE CybotLOversProfileE[8];

struct CybotLOversStructF
{
	var() float OversurrectionHomingAttackOdds, OversurrectionHomingAttackCooldown;
	var() int OversurrectionHomingAttackDmg;
};
var() config CybotLOversStructF CybotLOversProfileF[8];



static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local CybotLauncher CL;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'CybotLauncher'.default.bFriendlyFire = default.CybotLauncherProfileA[i].bFriendlyFire;
	Class'CybotLauncher'.default.bCanBeTelefragged = default.CybotLauncherProfileA[i].bCanBeTelefragged;
	Class'CybotLauncher'.default.bCanBeTelefraggedByOwner = default.CybotLauncherProfileA[i].bCanBeTelefraggedByOwner;
	Class'CybotLauncher'.default.bCanBeTelefraggedByTeam = default.CybotLauncherProfileA[i].bCanBeTelefraggedByTeam;
	Class'CybotLauncher'.default.bGuardianReturnToOrigin = default.CybotLauncherProfileA[i].bGuardianReturnToOrigin;
	
	Class'CybotLauncher'.default.bFieldKillPawns = default.CybotLauncherProfileB[i].bFieldKillPawns;
	Class'CybotLauncher'.default.FieldHealth = default.CybotLauncherProfileB[i].FieldHealth;
	Class'CybotLauncher'.default.FieldDamage = default.CybotLauncherProfileB[i].FieldDamage;
	Class'CybotLauncher'.default.VortexHealth = default.CybotLauncherProfileB[i].VortexHealth;
	Class'CybotLauncher'.default.KamiBaseDamage = default.CybotLauncherProfileB[i].KamiBaseDamage;
	Class'CybotLauncher'.default.VortexBaseDamage = default.CybotLauncherProfileB[i].VortexBaseDamage;
	
	Class'CybotLauncher'.default.ElectricalDamageScale = default.CybotLauncherProfileC[i].ElectricalDamageScale;
	Class'CybotLauncher'.default.CybotProjDmgMultiplier = default.CybotLauncherProfileC[i].CybotProjDmgMultiplier;
	Class'CybotLauncher'.default.CybotHealthMultiplier = default.CybotLauncherProfileC[i].CybotHealthMultiplier;
	Class'CybotLauncher'.default.CybotProjSpeedMultiplier = default.CybotLauncherProfileC[i].CybotProjSpeedMultiplier;
	
	Class'CybotLauncher'.default.enableCybotDeathAknMessages = default.CybotLauncherProfileD[i].enableCybotDeathAknMessages;
	Class'CybotLauncher'.default.enableCybotBeacons = default.CybotLauncherProfileD[i].enableCybotBeacons;
	Class'CybotLauncher'.default.bAlwaysSeeCybotBeacons = default.CybotLauncherProfileD[i].bAlwaysSeeCybotBeacons;
	Class'CybotLauncher'.default.ReduceCybotBeaconsOnDistance = default.CybotLauncherProfileD[i].ReduceCybotBeaconsOnDistance;
	Class'CybotLauncher'.default.enableCybotBeaconsText = default.CybotLauncherProfileD[i].enableCybotBeaconsText;
	Class'CybotLauncher'.default.CybotBeaconsMaxDistance = default.CybotLauncherProfileD[i].CybotBeaconsMaxDistance;
	Class'CybotLauncher'.default.CybotBeaconsTextDist = default.CybotLauncherProfileD[i].CybotBeaconsTextDist;
	
	Class'CybotLauncher'.default.enableCybot01 = default.CybotLauncherProfileE[i].enableCybot01;
	Class'CybotLauncher'.default.enableCybot02 = default.CybotLauncherProfileE[i].enableCybot02;
	Class'CybotLauncher'.default.enableCybot03 = default.CybotLauncherProfileE[i].enableCybot03;
	Class'CybotLauncher'.default.enableCybot04 = default.CybotLauncherProfileE[i].enableCybot04;
	Class'CybotLauncher'.default.enableCybot05 = default.CybotLauncherProfileE[i].enableCybot05;
	Class'CybotLauncher'.default.enableCybot06 = default.CybotLauncherProfileE[i].enableCybot06;
	Class'CybotLauncher'.default.enableCybot07 = default.CybotLauncherProfileE[i].enableCybot07;
	Class'CybotLauncher'.default.enableCybot08 = default.CybotLauncherProfileE[i].enableCybot08;
	Class'CybotLauncher'.default.enableCybot09 = default.CybotLauncherProfileE[i].enableCybot09;
	Class'CybotLauncher'.default.enableCybot10 = default.CybotLauncherProfileE[i].enableCybot10;
	
	Class'CybotLauncher'.default.CybotSentinelHealth = default.CybotLauncherProfileF[i].CybotSentinelHealth;
	Class'CybotLauncher'.default.CybotDualSentinelHealth = default.CybotLauncherProfileF[i].CybotDualSentinelHealth;
	Class'CybotLauncher'.default.CybotAndroidHealth = default.CybotLauncherProfileF[i].CybotAndroidHealth;
	Class'CybotLauncher'.default.CybotHeliHealth = default.CybotLauncherProfileF[i].CybotHeliHealth;
	Class'CybotLauncher'.default.CybotDroneHealth = default.CybotLauncherProfileF[i].CybotDroneHealth;
	
	Class'CybotLauncher'.default.MaxCybotsPerPlayer = default.CybotLauncherProfileG[i].MaxCybotsPerPlayer;
	Class'CybotLauncher'.default.CybotsMaxLifeSpan = default.CybotLauncherProfileG[i].CybotsMaxLifeSpan;
	Class'CybotLauncher'.default.FieldMaxLifeSpan = default.CybotLauncherProfileG[i].FieldMaxLifeSpan;
	Class'CybotLauncher'.default.VortexMaxLifeSpan = default.CybotLauncherProfileG[i].VortexMaxLifeSpan;
	
	Class'CybotLauncher'.default.enableOversurrection = default.CybotLOversProfileA[i].enableOversurrection;
	Class'CybotLauncher'.default.OversurrectionLifeTime = default.CybotLOversProfileA[i].OversurrectionLifeTime;
	Class'CybotLauncher'.default.OversurrectionHealth = default.CybotLOversProfileA[i].OversurrectionHealth;
	Class'CybotLauncher'.default.OversurrectionChildrenHealth = default.CybotLOversProfileA[i].OversurrectionChildrenHealth;
	
	Class'CybotLauncher'.default.OversurrectionChildrenInnerMaxRadius = default.CybotLOversProfileB[i].OversurrectionChildrenInnerMaxRadius;
	Class'CybotLauncher'.default.OversurrectionChildrenOuterMaxRadius = default.CybotLOversProfileB[i].OversurrectionChildrenOuterMaxRadius;
	Class'CybotLauncher'.default.OversurrectionChildrenMax = default.CybotLOversProfileB[i].OversurrectionChildrenMax;
	Class'CybotLauncher'.default.OversurrectionChildrenDefenseMin = default.CybotLOversProfileB[i].OversurrectionChildrenDefenseMin;
	
	Class'CybotLauncher'.default.OversurrectionChildrenMoveTimeInterval = default.CybotLOversProfileC[i].OversurrectionChildrenMoveTimeInterval;
	Class'CybotLauncher'.default.OversurrectionChildrenAutoAttackOdds = default.CybotLOversProfileC[i].OversurrectionChildrenAutoAttackOdds;
	
	Class'CybotLauncher'.default.OversurrectionZapAttackOdds = default.CybotLOversProfileD[i].OversurrectionZapAttackOdds;
	Class'CybotLauncher'.default.OversurrectionZapAttackCooldown = default.CybotLOversProfileD[i].OversurrectionZapAttackCooldown;
	Class'CybotLauncher'.default.OversurrectionZapAttackDmg = default.CybotLOversProfileD[i].OversurrectionZapAttackDmg;
	
	Class'CybotLauncher'.default.OversurrectionProjAttackOdds = default.CybotLOversProfileE[i].OversurrectionProjAttackOdds;
	Class'CybotLauncher'.default.OversurrectionProjAttackCooldown = default.CybotLOversProfileE[i].OversurrectionProjAttackCooldown;
	Class'CybotLauncher'.default.OversurrectionProjAttackDmg = default.CybotLOversProfileE[i].OversurrectionProjAttackDmg;
	
	Class'CybotLauncher'.default.OversurrectionHomingAttackOdds = default.CybotLOversProfileF[i].OversurrectionHomingAttackOdds;
	Class'CybotLauncher'.default.OversurrectionHomingAttackCooldown = default.CybotLOversProfileF[i].OversurrectionHomingAttackCooldown;
	Class'CybotLauncher'.default.OversurrectionHomingAttackDmg = default.CybotLOversProfileF[i].OversurrectionHomingAttackDmg;
	
	if (Lvl == None)
		Class'CybotLauncher'.static.StaticSaveConfig();
	
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'CybotLauncher', CL)
		{
			CL.default.bFriendlyFire = Class'CybotLauncher'.default.bFriendlyFire;
			CL.bFriendlyFire = Class'CybotLauncher'.default.bFriendlyFire;
			CL.default.bCanBeTelefragged = Class'CybotLauncher'.default.bCanBeTelefragged;
			CL.bCanBeTelefragged = Class'CybotLauncher'.default.bCanBeTelefragged;
			CL.default.bCanBeTelefraggedByOwner = Class'CybotLauncher'.default.bCanBeTelefraggedByOwner;
			CL.bCanBeTelefraggedByOwner = Class'CybotLauncher'.default.bCanBeTelefraggedByOwner;
			CL.default.bCanBeTelefraggedByTeam = Class'CybotLauncher'.default.bCanBeTelefraggedByTeam;
			CL.bCanBeTelefraggedByTeam = Class'CybotLauncher'.default.bCanBeTelefraggedByTeam;
			CL.default.bGuardianReturnToOrigin = Class'CybotLauncher'.default.bGuardianReturnToOrigin;
			CL.bGuardianReturnToOrigin = Class'CybotLauncher'.default.bGuardianReturnToOrigin;

			CL.default.bFieldKillPawns = Class'CybotLauncher'.default.bFieldKillPawns;
			CL.bFieldKillPawns = Class'CybotLauncher'.default.bFieldKillPawns;
			CL.default.FieldHealth = Class'CybotLauncher'.default.FieldHealth;
			CL.FieldHealth = Class'CybotLauncher'.default.FieldHealth;
			CL.default.FieldDamage = Class'CybotLauncher'.default.FieldDamage;
			CL.FieldDamage = Class'CybotLauncher'.default.FieldDamage;
			CL.default.VortexHealth = Class'CybotLauncher'.default.VortexHealth;
			CL.VortexHealth = Class'CybotLauncher'.default.VortexHealth;
			CL.default.KamiBaseDamage = Class'CybotLauncher'.default.KamiBaseDamage;
			CL.KamiBaseDamage = Class'CybotLauncher'.default.KamiBaseDamage;
			CL.default.VortexBaseDamage = Class'CybotLauncher'.default.VortexBaseDamage;
			CL.VortexBaseDamage = Class'CybotLauncher'.default.VortexBaseDamage;

			CL.default.ElectricalDamageScale = Class'CybotLauncher'.default.ElectricalDamageScale;
			CL.ElectricalDamageScale = Class'CybotLauncher'.default.ElectricalDamageScale;
			CL.default.CybotProjDmgMultiplier = Class'CybotLauncher'.default.CybotProjDmgMultiplier;
			CL.CybotProjDmgMultiplier = Class'CybotLauncher'.default.CybotProjDmgMultiplier;
			CL.default.CybotHealthMultiplier = Class'CybotLauncher'.default.CybotHealthMultiplier;
			CL.CybotHealthMultiplier = Class'CybotLauncher'.default.CybotHealthMultiplier;
			CL.default.CybotProjSpeedMultiplier = Class'CybotLauncher'.default.CybotProjSpeedMultiplier;
			CL.CybotProjSpeedMultiplier = Class'CybotLauncher'.default.CybotProjSpeedMultiplier;

			CL.default.enableCybotDeathAknMessages = Class'CybotLauncher'.default.enableCybotDeathAknMessages;
			CL.enableCybotDeathAknMessages = Class'CybotLauncher'.default.enableCybotDeathAknMessages;
			CL.default.enableCybotBeacons = Class'CybotLauncher'.default.enableCybotBeacons;
			CL.enableCybotBeacons = Class'CybotLauncher'.default.enableCybotBeacons;
			CL.default.bAlwaysSeeCybotBeacons = Class'CybotLauncher'.default.bAlwaysSeeCybotBeacons;
			CL.bAlwaysSeeCybotBeacons = Class'CybotLauncher'.default.bAlwaysSeeCybotBeacons;
			CL.default.ReduceCybotBeaconsOnDistance = Class'CybotLauncher'.default.ReduceCybotBeaconsOnDistance;
			CL.ReduceCybotBeaconsOnDistance = Class'CybotLauncher'.default.ReduceCybotBeaconsOnDistance;
			CL.default.enableCybotBeaconsText = Class'CybotLauncher'.default.enableCybotBeaconsText;
			CL.enableCybotBeaconsText = Class'CybotLauncher'.default.enableCybotBeaconsText;
			CL.default.CybotBeaconsMaxDistance = Class'CybotLauncher'.default.CybotBeaconsMaxDistance;
			CL.CybotBeaconsMaxDistance = Class'CybotLauncher'.default.CybotBeaconsMaxDistance;
			CL.default.CybotBeaconsTextDist = Class'CybotLauncher'.default.CybotBeaconsTextDist;
			CL.CybotBeaconsTextDist = Class'CybotLauncher'.default.CybotBeaconsTextDist;

			CL.default.enableCybot01 = Class'CybotLauncher'.default.enableCybot01;
			CL.enableCybot01 = Class'CybotLauncher'.default.enableCybot01;
			CL.default.enableCybot02 = Class'CybotLauncher'.default.enableCybot02;
			CL.enableCybot02 = Class'CybotLauncher'.default.enableCybot02;
			CL.default.enableCybot03 = Class'CybotLauncher'.default.enableCybot03;
			CL.enableCybot03 = Class'CybotLauncher'.default.enableCybot03;
			CL.default.enableCybot04 = Class'CybotLauncher'.default.enableCybot04;
			CL.enableCybot04 = Class'CybotLauncher'.default.enableCybot04;
			CL.default.enableCybot05 = Class'CybotLauncher'.default.enableCybot05;
			CL.enableCybot05 = Class'CybotLauncher'.default.enableCybot05;
			CL.default.enableCybot06 = Class'CybotLauncher'.default.enableCybot06;
			CL.enableCybot06 = Class'CybotLauncher'.default.enableCybot06;
			CL.default.enableCybot07 = Class'CybotLauncher'.default.enableCybot07;
			CL.enableCybot07 = Class'CybotLauncher'.default.enableCybot07;
			CL.default.enableCybot08 = Class'CybotLauncher'.default.enableCybot08;
			CL.enableCybot08 = Class'CybotLauncher'.default.enableCybot08;
			CL.default.enableCybot09 = Class'CybotLauncher'.default.enableCybot09;
			CL.enableCybot09 = Class'CybotLauncher'.default.enableCybot09;
			CL.default.enableCybot10 = Class'CybotLauncher'.default.enableCybot10;
			CL.enableCybot10 = Class'CybotLauncher'.default.enableCybot10;
			
			CL.default.CybotSentinelHealth = Class'CybotLauncher'.default.CybotSentinelHealth;
			CL.CybotSentinelHealth = Class'CybotLauncher'.default.CybotSentinelHealth;
			CL.default.CybotDualSentinelHealth = Class'CybotLauncher'.default.CybotDualSentinelHealth;
			CL.CybotDualSentinelHealth = Class'CybotLauncher'.default.CybotDualSentinelHealth;
			CL.default.CybotAndroidHealth = Class'CybotLauncher'.default.CybotAndroidHealth;
			CL.CybotAndroidHealth = Class'CybotLauncher'.default.CybotAndroidHealth;
			CL.default.CybotHeliHealth = Class'CybotLauncher'.default.CybotHeliHealth;
			CL.CybotHeliHealth = Class'CybotLauncher'.default.CybotHeliHealth;
			CL.default.CybotDroneHealth = Class'CybotLauncher'.default.CybotDroneHealth;
			CL.CybotDroneHealth = Class'CybotLauncher'.default.CybotDroneHealth;
			
			CL.default.MaxCybotsPerPlayer = Class'CybotLauncher'.default.MaxCybotsPerPlayer;
			CL.MaxCybotsPerPlayer = Class'CybotLauncher'.default.MaxCybotsPerPlayer;
			CL.default.CybotsMaxLifeSpan = Class'CybotLauncher'.default.CybotsMaxLifeSpan;
			CL.CybotsMaxLifeSpan = Class'CybotLauncher'.default.CybotsMaxLifeSpan;
			CL.default.FieldMaxLifeSpan = Class'CybotLauncher'.default.FieldMaxLifeSpan;
			CL.FieldMaxLifeSpan = Class'CybotLauncher'.default.FieldMaxLifeSpan;
			CL.default.VortexMaxLifeSpan = Class'CybotLauncher'.default.VortexMaxLifeSpan;
			CL.VortexMaxLifeSpan = Class'CybotLauncher'.default.VortexMaxLifeSpan;
			
			CL.default.enableOversurrection = Class'CybotLauncher'.default.enableOversurrection;
			CL.enableOversurrection = Class'CybotLauncher'.default.enableOversurrection;
			CL.default.OversurrectionLifeTime = Class'CybotLauncher'.default.OversurrectionLifeTime;
			CL.OversurrectionLifeTime = Class'CybotLauncher'.default.OversurrectionLifeTime;
			CL.default.OversurrectionHealth = Class'CybotLauncher'.default.OversurrectionHealth;
			CL.OversurrectionHealth = Class'CybotLauncher'.default.OversurrectionHealth;
			CL.default.OversurrectionChildrenHealth = Class'CybotLauncher'.default.OversurrectionChildrenHealth;
			CL.OversurrectionChildrenHealth = Class'CybotLauncher'.default.OversurrectionChildrenHealth;

			CL.default.OversurrectionChildrenInnerMaxRadius = Class'CybotLauncher'.default.OversurrectionChildrenInnerMaxRadius;
			CL.OversurrectionChildrenInnerMaxRadius = Class'CybotLauncher'.default.OversurrectionChildrenInnerMaxRadius;
			CL.default.OversurrectionChildrenOuterMaxRadius = Class'CybotLauncher'.default.OversurrectionChildrenOuterMaxRadius;
			CL.OversurrectionChildrenOuterMaxRadius = Class'CybotLauncher'.default.OversurrectionChildrenOuterMaxRadius;
			CL.default.OversurrectionChildrenMax = Class'CybotLauncher'.default.OversurrectionChildrenMax;
			CL.OversurrectionChildrenMax = Class'CybotLauncher'.default.OversurrectionChildrenMax;
			CL.default.OversurrectionChildrenDefenseMin = Class'CybotLauncher'.default.OversurrectionChildrenDefenseMin;
			CL.OversurrectionChildrenDefenseMin = Class'CybotLauncher'.default.OversurrectionChildrenDefenseMin;
			
			CL.default.OversurrectionChildrenMoveTimeInterval = Class'CybotLauncher'.default.OversurrectionChildrenMoveTimeInterval;
			CL.OversurrectionChildrenMoveTimeInterval = Class'CybotLauncher'.default.OversurrectionChildrenMoveTimeInterval;
			CL.default.OversurrectionChildrenAutoAttackOdds = Class'CybotLauncher'.default.OversurrectionChildrenAutoAttackOdds;
			CL.OversurrectionChildrenAutoAttackOdds = Class'CybotLauncher'.default.OversurrectionChildrenAutoAttackOdds;
			
			CL.default.OversurrectionZapAttackOdds = Class'CybotLauncher'.default.OversurrectionZapAttackOdds;
			CL.OversurrectionZapAttackOdds = Class'CybotLauncher'.default.OversurrectionZapAttackOdds;
			CL.default.OversurrectionZapAttackCooldown = Class'CybotLauncher'.default.OversurrectionZapAttackCooldown;
			CL.OversurrectionZapAttackCooldown = Class'CybotLauncher'.default.OversurrectionZapAttackCooldown;
			CL.default.OversurrectionZapAttackDmg = Class'CybotLauncher'.default.OversurrectionZapAttackDmg;
			CL.OversurrectionZapAttackDmg = Class'CybotLauncher'.default.OversurrectionZapAttackDmg;
			
			CL.default.OversurrectionProjAttackOdds = Class'CybotLauncher'.default.OversurrectionProjAttackOdds;
			CL.OversurrectionProjAttackOdds = Class'CybotLauncher'.default.OversurrectionProjAttackOdds;
			CL.default.OversurrectionProjAttackCooldown = Class'CybotLauncher'.default.OversurrectionProjAttackCooldown;
			CL.OversurrectionProjAttackCooldown = Class'CybotLauncher'.default.OversurrectionProjAttackCooldown;
			CL.default.OversurrectionProjAttackDmg = Class'CybotLauncher'.default.OversurrectionProjAttackDmg;
			CL.OversurrectionProjAttackDmg = Class'CybotLauncher'.default.OversurrectionProjAttackDmg;
			
			CL.default.OversurrectionHomingAttackOdds = Class'CybotLauncher'.default.OversurrectionHomingAttackOdds;
			CL.OversurrectionHomingAttackOdds = Class'CybotLauncher'.default.OversurrectionHomingAttackOdds;
			CL.default.OversurrectionHomingAttackCooldown = Class'CybotLauncher'.default.OversurrectionHomingAttackCooldown;
			CL.OversurrectionHomingAttackCooldown = Class'CybotLauncher'.default.OversurrectionHomingAttackCooldown;
			CL.default.OversurrectionHomingAttackDmg = Class'CybotLauncher'.default.OversurrectionHomingAttackDmg;
			CL.OversurrectionHomingAttackDmg = Class'CybotLauncher'.default.OversurrectionHomingAttackDmg;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.CybotLauncherProfileA[i].bFriendlyFire = Class'CybotLauncher'.default.bFriendlyFire;
	default.CybotLauncherProfileA[i].bCanBeTelefragged = Class'CybotLauncher'.default.bCanBeTelefragged;
	default.CybotLauncherProfileA[i].bCanBeTelefraggedByOwner = Class'CybotLauncher'.default.bCanBeTelefraggedByOwner;
	default.CybotLauncherProfileA[i].bCanBeTelefraggedByTeam = Class'CybotLauncher'.default.bCanBeTelefraggedByTeam;
	default.CybotLauncherProfileA[i].bGuardianReturnToOrigin = Class'CybotLauncher'.default.bGuardianReturnToOrigin;
	
	default.CybotLauncherProfileB[i].bFieldKillPawns = Class'CybotLauncher'.default.bFieldKillPawns;
	default.CybotLauncherProfileB[i].FieldHealth = Class'CybotLauncher'.default.FieldHealth;
	default.CybotLauncherProfileB[i].FieldDamage = Class'CybotLauncher'.default.FieldDamage;
	default.CybotLauncherProfileB[i].VortexHealth = Class'CybotLauncher'.default.VortexHealth;
	default.CybotLauncherProfileB[i].KamiBaseDamage = Class'CybotLauncher'.default.KamiBaseDamage;
	default.CybotLauncherProfileB[i].VortexBaseDamage = Class'CybotLauncher'.default.VortexBaseDamage;
	
	default.CybotLauncherProfileC[i].ElectricalDamageScale = Class'CybotLauncher'.default.ElectricalDamageScale;
	default.CybotLauncherProfileC[i].CybotProjDmgMultiplier = Class'CybotLauncher'.default.CybotProjDmgMultiplier;
	default.CybotLauncherProfileC[i].CybotHealthMultiplier = Class'CybotLauncher'.default.CybotHealthMultiplier;
	default.CybotLauncherProfileC[i].CybotProjSpeedMultiplier = Class'CybotLauncher'.default.CybotProjSpeedMultiplier;
	
	default.CybotLauncherProfileD[i].enableCybotDeathAknMessages = Class'CybotLauncher'.default.enableCybotDeathAknMessages;
	default.CybotLauncherProfileD[i].enableCybotBeacons = Class'CybotLauncher'.default.enableCybotBeacons;
	default.CybotLauncherProfileD[i].bAlwaysSeeCybotBeacons = Class'CybotLauncher'.default.bAlwaysSeeCybotBeacons;
	default.CybotLauncherProfileD[i].ReduceCybotBeaconsOnDistance = Class'CybotLauncher'.default.ReduceCybotBeaconsOnDistance;
	default.CybotLauncherProfileD[i].enableCybotBeaconsText = Class'CybotLauncher'.default.enableCybotBeaconsText;
	default.CybotLauncherProfileD[i].CybotBeaconsMaxDistance = Class'CybotLauncher'.default.CybotBeaconsMaxDistance;
	default.CybotLauncherProfileD[i].CybotBeaconsTextDist = Class'CybotLauncher'.default.CybotBeaconsTextDist;
	
	default.CybotLauncherProfileE[i].enableCybot01 = Class'CybotLauncher'.default.enableCybot01;
	default.CybotLauncherProfileE[i].enableCybot02 = Class'CybotLauncher'.default.enableCybot02;
	default.CybotLauncherProfileE[i].enableCybot03 = Class'CybotLauncher'.default.enableCybot03;
	default.CybotLauncherProfileE[i].enableCybot04 = Class'CybotLauncher'.default.enableCybot04;
	default.CybotLauncherProfileE[i].enableCybot05 = Class'CybotLauncher'.default.enableCybot05;
	default.CybotLauncherProfileE[i].enableCybot06 = Class'CybotLauncher'.default.enableCybot06;
	default.CybotLauncherProfileE[i].enableCybot07 = Class'CybotLauncher'.default.enableCybot07;
	default.CybotLauncherProfileE[i].enableCybot08 = Class'CybotLauncher'.default.enableCybot08;
	default.CybotLauncherProfileE[i].enableCybot09 = Class'CybotLauncher'.default.enableCybot09;
	default.CybotLauncherProfileE[i].enableCybot10 = Class'CybotLauncher'.default.enableCybot10;
	
	default.CybotLauncherProfileF[i].CybotSentinelHealth = Class'CybotLauncher'.default.CybotSentinelHealth;
	default.CybotLauncherProfileF[i].CybotDualSentinelHealth = Class'CybotLauncher'.default.CybotDualSentinelHealth;
	default.CybotLauncherProfileF[i].CybotAndroidHealth = Class'CybotLauncher'.default.CybotAndroidHealth;
	default.CybotLauncherProfileF[i].CybotHeliHealth = Class'CybotLauncher'.default.CybotHeliHealth;
	default.CybotLauncherProfileF[i].CybotDroneHealth = Class'CybotLauncher'.default.CybotDroneHealth;
	
	default.CybotLauncherProfileG[i].MaxCybotsPerPlayer = Class'CybotLauncher'.default.MaxCybotsPerPlayer;
	default.CybotLauncherProfileG[i].CybotsMaxLifeSpan = Class'CybotLauncher'.default.CybotsMaxLifeSpan;
	default.CybotLauncherProfileG[i].FieldMaxLifeSpan = Class'CybotLauncher'.default.FieldMaxLifeSpan;
	default.CybotLauncherProfileG[i].VortexMaxLifeSpan = Class'CybotLauncher'.default.VortexMaxLifeSpan;
	
	default.CybotLOversProfileA[i].enableOversurrection = Class'CybotLauncher'.default.enableOversurrection;
	default.CybotLOversProfileA[i].OversurrectionLifeTime = Class'CybotLauncher'.default.OversurrectionLifeTime;
	default.CybotLOversProfileA[i].OversurrectionHealth = Class'CybotLauncher'.default.OversurrectionHealth;
	default.CybotLOversProfileA[i].OversurrectionChildrenHealth = Class'CybotLauncher'.default.OversurrectionChildrenHealth;
	
	default.CybotLOversProfileB[i].OversurrectionChildrenInnerMaxRadius = Class'CybotLauncher'.default.OversurrectionChildrenInnerMaxRadius;
	default.CybotLOversProfileB[i].OversurrectionChildrenOuterMaxRadius = Class'CybotLauncher'.default.OversurrectionChildrenOuterMaxRadius;
	default.CybotLOversProfileB[i].OversurrectionChildrenMax = Class'CybotLauncher'.default.OversurrectionChildrenMax;
	default.CybotLOversProfileB[i].OversurrectionChildrenDefenseMin = Class'CybotLauncher'.default.OversurrectionChildrenDefenseMin;
	
	default.CybotLOversProfileC[i].OversurrectionChildrenMoveTimeInterval = Class'CybotLauncher'.default.OversurrectionChildrenMoveTimeInterval;
	default.CybotLOversProfileC[i].OversurrectionChildrenAutoAttackOdds = Class'CybotLauncher'.default.OversurrectionChildrenAutoAttackOdds;
	
	default.CybotLOversProfileD[i].OversurrectionZapAttackOdds = Class'CybotLauncher'.default.OversurrectionZapAttackOdds;
	default.CybotLOversProfileD[i].OversurrectionZapAttackCooldown = Class'CybotLauncher'.default.OversurrectionZapAttackCooldown;
	default.CybotLOversProfileD[i].OversurrectionZapAttackDmg = Class'CybotLauncher'.default.OversurrectionZapAttackDmg;
	
	default.CybotLOversProfileE[i].OversurrectionProjAttackOdds = Class'CybotLauncher'.default.OversurrectionProjAttackOdds;
	default.CybotLOversProfileE[i].OversurrectionProjAttackCooldown = Class'CybotLauncher'.default.OversurrectionProjAttackCooldown;
	default.CybotLOversProfileE[i].OversurrectionProjAttackDmg = Class'CybotLauncher'.default.OversurrectionProjAttackDmg;
	
	default.CybotLOversProfileF[i].OversurrectionHomingAttackOdds = Class'CybotLauncher'.default.OversurrectionHomingAttackOdds;
	default.CybotLOversProfileF[i].OversurrectionHomingAttackCooldown = Class'CybotLauncher'.default.OversurrectionHomingAttackCooldown;
	default.CybotLOversProfileF[i].OversurrectionHomingAttackDmg = Class'CybotLauncher'.default.OversurrectionHomingAttackDmg;

	StaticSaveConfig();
}


defaultproperties
{
	CybotLauncherProfileA(0)=(bFriendlyFire=False,bCanBeTelefragged=True,bCanBeTelefraggedByOwner=False,bCanBeTelefraggedByTeam=False,bGuardianReturnToOrigin=True)
	CybotLauncherProfileB(0)=(bFieldKillPawns=False,FieldHealth=400,FieldDamage=50,KamiBaseDamage=650,VortexBaseDamage=80,VortexHealth=200)
	CybotLauncherProfileC(0)=(ElectricalDamageScale=1.100000,CybotProjDmgMultiplier=0.750000,CybotHealthMultiplier=0.500000,CybotProjSpeedMultiplier=0.750000)
	CybotLauncherProfileD(0)=(enableCybotDeathAknMessages=True,enableCybotBeacons=True,enableCybotBeaconsText=True,bAlwaysSeeCybotBeacons=False,ReduceCybotBeaconsOnDistance=True)
	CybotLauncherProfileD(0)=(CybotBeaconsMaxDistance=5000.000000,CybotBeaconsTextDist=1000.000000)
	CybotLauncherProfileE(0)=(enableCybot01=True,enableCybot02=True,enableCybot03=True,enableCybot04=True,enableCybot05=True)
	CybotLauncherProfileE(0)=(enableCybot06=False,enableCybot07=False,enableCybot08=False,enableCybot09=False,enableCybot10=False)
	CybotLauncherProfileF(0)=(CybotSentinelHealth=150,CybotDualSentinelHealth=150,CybotAndroidHealth=150,CybotHeliHealth=150,CybotDroneHealth=200)
	CybotLauncherProfileG(0)=(MaxCybotsPerPlayer=2,CybotsMaxLifeSpan=30.000000,FieldMaxLifeSpan=25.000000,VortexMaxLifeSpan=10.000000)
	CybotLOversProfileA(0)=(enableOversurrection=True,OversurrectionLifeTime=40.000000,OversurrectionHealth=5000,OversurrectionChildrenHealth=200)
	CybotLOversProfileB(0)=(OversurrectionChildrenInnerMaxRadius=140.000000,OversurrectionChildrenOuterMaxRadius=700.000000,OversurrectionChildrenMax=35,OversurrectionChildrenDefenseMin=5)
	CybotLOversProfileC(0)=(OversurrectionChildrenMoveTimeInterval=3.000000,OversurrectionChildrenAutoAttackOdds=0.150000)
	CybotLOversProfileD(0)=(OversurrectionZapAttackOdds=0.050000,OversurrectionZapAttackCooldown=1.750000,OversurrectionZapAttackDmg=150)
	CybotLOversProfileE(0)=(OversurrectionProjAttackOdds=0.850000,OversurrectionProjAttackCooldown=0.600000,OversurrectionProjAttackDmg=75)
	CybotLOversProfileF(0)=(OversurrectionHomingAttackOdds=0.150000,OversurrectionHomingAttackCooldown=3.000000,OversurrectionHomingAttackDmg=250)
	
	CybotLauncherProfileA(1)=(bFriendlyFire=False,bCanBeTelefragged=True,bCanBeTelefraggedByOwner=False,bCanBeTelefraggedByTeam=False,bGuardianReturnToOrigin=True)
	CybotLauncherProfileB(1)=(bFieldKillPawns=False,FieldHealth=500,FieldDamage=50,KamiBaseDamage=800,VortexBaseDamage=100,VortexHealth=400)
	CybotLauncherProfileC(1)=(ElectricalDamageScale=1.000000,CybotProjDmgMultiplier=1.000000,CybotHealthMultiplier=0.800000,CybotProjSpeedMultiplier=0.900000)
	CybotLauncherProfileD(1)=(enableCybotDeathAknMessages=True,enableCybotBeacons=True,enableCybotBeaconsText=True,bAlwaysSeeCybotBeacons=False,ReduceCybotBeaconsOnDistance=True)
	CybotLauncherProfileD(1)=(CybotBeaconsMaxDistance=5000.000000,CybotBeaconsTextDist=1000.000000)
	CybotLauncherProfileE(1)=(enableCybot01=True,enableCybot02=True,enableCybot03=True,enableCybot04=True,enableCybot05=True)
	CybotLauncherProfileE(1)=(enableCybot06=True,enableCybot07=True,enableCybot08=True,enableCybot09=False,enableCybot10=False)
	CybotLauncherProfileF(1)=(CybotSentinelHealth=150,CybotDualSentinelHealth=200,CybotAndroidHealth=250,CybotHeliHealth=300,CybotDroneHealth=350)
	CybotLauncherProfileG(1)=(MaxCybotsPerPlayer=3,CybotsMaxLifeSpan=75.000000,FieldMaxLifeSpan=30.000000,VortexMaxLifeSpan=25.000000)
	CybotLOversProfileA(1)=(enableOversurrection=True,OversurrectionLifeTime=60.000000,OversurrectionHealth=10000,OversurrectionChildrenHealth=750)
	CybotLOversProfileB(1)=(OversurrectionChildrenInnerMaxRadius=140.000000,OversurrectionChildrenOuterMaxRadius=1000.000000,OversurrectionChildrenMax=60,OversurrectionChildrenDefenseMin=10)
	CybotLOversProfileC(1)=(OversurrectionChildrenMoveTimeInterval=2.500000,OversurrectionChildrenAutoAttackOdds=0.250000)
	CybotLOversProfileD(1)=(OversurrectionZapAttackOdds=0.200000,OversurrectionZapAttackCooldown=1.500000,OversurrectionZapAttackDmg=200)
	CybotLOversProfileE(1)=(OversurrectionProjAttackOdds=0.650000,OversurrectionProjAttackCooldown=0.500000,OversurrectionProjAttackDmg=100)
	CybotLOversProfileF(1)=(OversurrectionHomingAttackOdds=0.150000,OversurrectionHomingAttackCooldown=2.500000,OversurrectionHomingAttackDmg=450)
	
	CybotLauncherProfileA(2)=(bFriendlyFire=False,bCanBeTelefragged=True,bCanBeTelefraggedByOwner=False,bCanBeTelefraggedByTeam=False,bGuardianReturnToOrigin=True)
	CybotLauncherProfileB(2)=(bFieldKillPawns=False,FieldHealth=1500,FieldDamage=1000,KamiBaseDamage=1000,VortexBaseDamage=1000,VortexHealth=1500)
	CybotLauncherProfileC(2)=(ElectricalDamageScale=1.000000,CybotProjDmgMultiplier=1.000000,CybotHealthMultiplier=1.000000,CybotProjSpeedMultiplier=1.000000)
	CybotLauncherProfileD(2)=(enableCybotDeathAknMessages=True,enableCybotBeacons=True,enableCybotBeaconsText=True,bAlwaysSeeCybotBeacons=False,ReduceCybotBeaconsOnDistance=True)
	CybotLauncherProfileD(2)=(CybotBeaconsMaxDistance=5000.000000,CybotBeaconsTextDist=1000.000000)
	CybotLauncherProfileE(2)=(enableCybot01=True,enableCybot02=True,enableCybot03=True,enableCybot04=True,enableCybot05=True)
	CybotLauncherProfileE(2)=(enableCybot06=True,enableCybot07=True,enableCybot08=True,enableCybot09=True,enableCybot10=True)
	CybotLauncherProfileF(2)=(CybotSentinelHealth=250,CybotDualSentinelHealth=300,CybotAndroidHealth=350,CybotHeliHealth=500,CybotDroneHealth=850)
	CybotLauncherProfileG(2)=(MaxCybotsPerPlayer=0,CybotsMaxLifeSpan=0.000000,FieldMaxLifeSpan=0.000000,VortexMaxLifeSpan=0.000000)
	CybotLOversProfileA(2)=(enableOversurrection=True,OversurrectionLifeTime=80.000000,OversurrectionHealth=50000,OversurrectionChildrenHealth=5000)
	CybotLOversProfileB(2)=(OversurrectionChildrenInnerMaxRadius=140.000000,OversurrectionChildrenOuterMaxRadius=1000.000000,OversurrectionChildrenMax=75,OversurrectionChildrenDefenseMin=10)
	CybotLOversProfileC(2)=(OversurrectionChildrenMoveTimeInterval=2.000000,OversurrectionChildrenAutoAttackOdds=0.300000)
	CybotLOversProfileD(2)=(OversurrectionZapAttackOdds=0.350000,OversurrectionZapAttackCooldown=1.250000,OversurrectionZapAttackDmg=500)
	CybotLOversProfileE(2)=(OversurrectionProjAttackOdds=0.650000,OversurrectionProjAttackCooldown=0.500000,OversurrectionProjAttackDmg=300)
	CybotLOversProfileF(2)=(OversurrectionHomingAttackOdds=0.150000,OversurrectionHomingAttackCooldown=2.500000,OversurrectionHomingAttackDmg=750)
	
	CybotLauncherProfileA(3)=(bFriendlyFire=False,bCanBeTelefragged=True,bCanBeTelefraggedByOwner=False,bCanBeTelefraggedByTeam=False,bGuardianReturnToOrigin=True)
	CybotLauncherProfileB(3)=(bFieldKillPawns=False,FieldHealth=750,FieldDamage=500,KamiBaseDamage=10000,VortexBaseDamage=2000,VortexHealth=1000)
	CybotLauncherProfileC(3)=(ElectricalDamageScale=1.250000,CybotProjDmgMultiplier=1.000000,CybotHealthMultiplier=1.000000,CybotProjSpeedMultiplier=1.000000)
	CybotLauncherProfileD(3)=(enableCybotDeathAknMessages=True,enableCybotBeacons=True,enableCybotBeaconsText=True,bAlwaysSeeCybotBeacons=False,ReduceCybotBeaconsOnDistance=True)
	CybotLauncherProfileD(3)=(CybotBeaconsMaxDistance=5000.000000,CybotBeaconsTextDist=1000.000000)
	CybotLauncherProfileE(3)=(enableCybot01=True,enableCybot02=True,enableCybot03=True,enableCybot04=True,enableCybot05=True)
	CybotLauncherProfileE(3)=(enableCybot06=True,enableCybot07=True,enableCybot08=True,enableCybot09=True,enableCybot10=True)
	CybotLauncherProfileF(3)=(CybotSentinelHealth=250,CybotDualSentinelHealth=300,CybotAndroidHealth=350,CybotHeliHealth=500,CybotDroneHealth=850)
	CybotLauncherProfileG(3)=(MaxCybotsPerPlayer=5,CybotsMaxLifeSpan=0.000000,FieldMaxLifeSpan=400.000000,VortexMaxLifeSpan=400.000000)
	CybotLOversProfileA(3)=(enableOversurrection=True,OversurrectionLifeTime=120.000000,OversurrectionHealth=70000,OversurrectionChildrenHealth=10000)
	CybotLOversProfileB(3)=(OversurrectionChildrenInnerMaxRadius=140.000000,OversurrectionChildrenOuterMaxRadius=1250.000000,OversurrectionChildrenMax=75,OversurrectionChildrenDefenseMin=10)
	CybotLOversProfileC(3)=(OversurrectionChildrenMoveTimeInterval=2.000000,OversurrectionChildrenAutoAttackOdds=0.400000)
	CybotLOversProfileD(3)=(OversurrectionZapAttackOdds=0.400000,OversurrectionZapAttackCooldown=1.250000,OversurrectionZapAttackDmg=1000)
	CybotLOversProfileE(3)=(OversurrectionProjAttackOdds=0.550000,OversurrectionProjAttackCooldown=0.500000,OversurrectionProjAttackDmg=600)
	CybotLOversProfileF(3)=(OversurrectionHomingAttackOdds=0.250000,OversurrectionHomingAttackCooldown=2.500000,OversurrectionHomingAttackDmg=1500)
	
	CybotLauncherProfileA(4)=(bFriendlyFire=False,bCanBeTelefragged=True,bCanBeTelefraggedByOwner=False,bCanBeTelefraggedByTeam=False,bGuardianReturnToOrigin=True)
	CybotLauncherProfileB(4)=(bFieldKillPawns=False,FieldHealth=2500,FieldDamage=100000,KamiBaseDamage=100000,VortexBaseDamage=10000,VortexHealth=2000)
	CybotLauncherProfileC(4)=(ElectricalDamageScale=1.000000,CybotProjDmgMultiplier=1.250000,CybotHealthMultiplier=1.350000,CybotProjSpeedMultiplier=1.250000)
	CybotLauncherProfileD(4)=(enableCybotDeathAknMessages=True,enableCybotBeacons=True,enableCybotBeaconsText=True,bAlwaysSeeCybotBeacons=False,ReduceCybotBeaconsOnDistance=True)
	CybotLauncherProfileD(4)=(CybotBeaconsMaxDistance=5000.000000,CybotBeaconsTextDist=1000.000000)
	CybotLauncherProfileE(4)=(enableCybot01=True,enableCybot02=True,enableCybot03=True,enableCybot04=True,enableCybot05=True)
	CybotLauncherProfileE(4)=(enableCybot06=True,enableCybot07=True,enableCybot08=True,enableCybot09=True,enableCybot10=True)
	CybotLauncherProfileF(4)=(CybotSentinelHealth=450,CybotDualSentinelHealth=500,CybotAndroidHealth=650,CybotHeliHealth=1000,CybotDroneHealth=1550)
	CybotLauncherProfileG(4)=(MaxCybotsPerPlayer=0,CybotsMaxLifeSpan=0.000000,FieldMaxLifeSpan=0.000000,VortexMaxLifeSpan=0.000000)
	CybotLOversProfileA(4)=(enableOversurrection=True,OversurrectionLifeTime=160.000000,OversurrectionHealth=200000,OversurrectionChildrenHealth=15000)
	CybotLOversProfileB(4)=(OversurrectionChildrenInnerMaxRadius=140.000000,OversurrectionChildrenOuterMaxRadius=1600.000000,OversurrectionChildrenMax=75,OversurrectionChildrenDefenseMin=10)
	CybotLOversProfileC(4)=(OversurrectionChildrenMoveTimeInterval=1.500000,OversurrectionChildrenAutoAttackOdds=0.700000)
	CybotLOversProfileD(4)=(OversurrectionZapAttackOdds=0.750000,OversurrectionZapAttackCooldown=1.000000,OversurrectionZapAttackDmg=5000)
	CybotLOversProfileE(4)=(OversurrectionProjAttackOdds=0.550000,OversurrectionProjAttackCooldown=0.500000,OversurrectionProjAttackDmg=3000)
	CybotLOversProfileF(4)=(OversurrectionHomingAttackOdds=0.550000,OversurrectionHomingAttackCooldown=2.000000,OversurrectionHomingAttackDmg=7500)
	
	CybotLauncherProfileA(5)=(bFriendlyFire=False,bCanBeTelefragged=True,bCanBeTelefraggedByOwner=False,bCanBeTelefraggedByTeam=False,bGuardianReturnToOrigin=True)
	CybotLauncherProfileB(5)=(bFieldKillPawns=False,FieldHealth=1500,FieldDamage=1000,KamiBaseDamage=1000,VortexBaseDamage=1000,VortexHealth=1500)
	CybotLauncherProfileC(5)=(ElectricalDamageScale=1.000000,CybotProjDmgMultiplier=1.000000,CybotHealthMultiplier=1.000000,CybotProjSpeedMultiplier=1.000000)
	CybotLauncherProfileD(5)=(enableCybotDeathAknMessages=True,enableCybotBeacons=True,enableCybotBeaconsText=True,bAlwaysSeeCybotBeacons=False,ReduceCybotBeaconsOnDistance=True)
	CybotLauncherProfileD(5)=(CybotBeaconsMaxDistance=5000.000000,CybotBeaconsTextDist=1000.000000)
	CybotLauncherProfileE(5)=(enableCybot01=True,enableCybot02=True,enableCybot03=True,enableCybot04=True,enableCybot05=True)
	CybotLauncherProfileE(5)=(enableCybot06=True,enableCybot07=True,enableCybot08=True,enableCybot09=True,enableCybot10=True)
	CybotLauncherProfileF(5)=(CybotSentinelHealth=250,CybotDualSentinelHealth=300,CybotAndroidHealth=350,CybotHeliHealth=500,CybotDroneHealth=850)
	CybotLauncherProfileG(5)=(MaxCybotsPerPlayer=0,CybotsMaxLifeSpan=0.000000,FieldMaxLifeSpan=0.000000,VortexMaxLifeSpan=0.000000)
	CybotLOversProfileA(5)=(enableOversurrection=True,OversurrectionLifeTime=80.000000,OversurrectionHealth=50000,OversurrectionChildrenHealth=5000)
	CybotLOversProfileB(5)=(OversurrectionChildrenInnerMaxRadius=140.000000,OversurrectionChildrenOuterMaxRadius=1000.000000,OversurrectionChildrenMax=75,OversurrectionChildrenDefenseMin=10)
	CybotLOversProfileC(5)=(OversurrectionChildrenMoveTimeInterval=2.000000,OversurrectionChildrenAutoAttackOdds=0.300000)
	CybotLOversProfileD(5)=(OversurrectionZapAttackOdds=0.350000,OversurrectionZapAttackCooldown=1.250000,OversurrectionZapAttackDmg=500)
	CybotLOversProfileE(5)=(OversurrectionProjAttackOdds=0.650000,OversurrectionProjAttackCooldown=0.500000,OversurrectionProjAttackDmg=300)
	CybotLOversProfileF(5)=(OversurrectionHomingAttackOdds=0.150000,OversurrectionHomingAttackCooldown=2.500000,OversurrectionHomingAttackDmg=750)
	
	CybotLauncherProfileA(6)=(bFriendlyFire=False,bCanBeTelefragged=True,bCanBeTelefraggedByOwner=False,bCanBeTelefraggedByTeam=False,bGuardianReturnToOrigin=True)
	CybotLauncherProfileB(6)=(bFieldKillPawns=False,FieldHealth=1500,FieldDamage=1000,KamiBaseDamage=1000,VortexBaseDamage=1000,VortexHealth=1500)
	CybotLauncherProfileC(6)=(ElectricalDamageScale=1.000000,CybotProjDmgMultiplier=1.000000,CybotHealthMultiplier=1.000000,CybotProjSpeedMultiplier=1.000000)
	CybotLauncherProfileD(6)=(enableCybotDeathAknMessages=True,enableCybotBeacons=True,enableCybotBeaconsText=True,bAlwaysSeeCybotBeacons=False,ReduceCybotBeaconsOnDistance=True)
	CybotLauncherProfileD(6)=(CybotBeaconsMaxDistance=5000.000000,CybotBeaconsTextDist=1000.000000)
	CybotLauncherProfileE(6)=(enableCybot01=True,enableCybot02=True,enableCybot03=True,enableCybot04=True,enableCybot05=True)
	CybotLauncherProfileE(6)=(enableCybot06=True,enableCybot07=True,enableCybot08=True,enableCybot09=True,enableCybot10=True)
	CybotLauncherProfileF(6)=(CybotSentinelHealth=250,CybotDualSentinelHealth=300,CybotAndroidHealth=350,CybotHeliHealth=500,CybotDroneHealth=850)
	CybotLauncherProfileG(6)=(MaxCybotsPerPlayer=0,CybotsMaxLifeSpan=0.000000,FieldMaxLifeSpan=0.000000,VortexMaxLifeSpan=0.000000)
	CybotLOversProfileA(6)=(enableOversurrection=True,OversurrectionLifeTime=80.000000,OversurrectionHealth=50000,OversurrectionChildrenHealth=5000)
	CybotLOversProfileB(6)=(OversurrectionChildrenInnerMaxRadius=140.000000,OversurrectionChildrenOuterMaxRadius=1000.000000,OversurrectionChildrenMax=75,OversurrectionChildrenDefenseMin=10)
	CybotLOversProfileC(6)=(OversurrectionChildrenMoveTimeInterval=2.000000,OversurrectionChildrenAutoAttackOdds=0.300000)
	CybotLOversProfileD(6)=(OversurrectionZapAttackOdds=0.350000,OversurrectionZapAttackCooldown=1.250000,OversurrectionZapAttackDmg=500)
	CybotLOversProfileE(6)=(OversurrectionProjAttackOdds=0.650000,OversurrectionProjAttackCooldown=0.500000,OversurrectionProjAttackDmg=300)
	CybotLOversProfileF(6)=(OversurrectionHomingAttackOdds=0.150000,OversurrectionHomingAttackCooldown=2.500000,OversurrectionHomingAttackDmg=750)
	
	CybotLauncherProfileA(7)=(bFriendlyFire=False,bCanBeTelefragged=True,bCanBeTelefraggedByOwner=False,bCanBeTelefraggedByTeam=False,bGuardianReturnToOrigin=True)
	CybotLauncherProfileB(7)=(bFieldKillPawns=False,FieldHealth=1500,FieldDamage=1000,KamiBaseDamage=1000,VortexBaseDamage=1000,VortexHealth=1500)
	CybotLauncherProfileC(7)=(ElectricalDamageScale=1.000000,CybotProjDmgMultiplier=1.000000,CybotHealthMultiplier=1.000000,CybotProjSpeedMultiplier=1.000000)
	CybotLauncherProfileD(7)=(enableCybotDeathAknMessages=True,enableCybotBeacons=True,enableCybotBeaconsText=True,bAlwaysSeeCybotBeacons=False,ReduceCybotBeaconsOnDistance=True)
	CybotLauncherProfileD(7)=(CybotBeaconsMaxDistance=5000.000000,CybotBeaconsTextDist=1000.000000)
	CybotLauncherProfileE(7)=(enableCybot01=True,enableCybot02=True,enableCybot03=True,enableCybot04=True,enableCybot05=True)
	CybotLauncherProfileE(7)=(enableCybot06=True,enableCybot07=True,enableCybot08=True,enableCybot09=True,enableCybot10=True)
	CybotLauncherProfileF(7)=(CybotSentinelHealth=250,CybotDualSentinelHealth=300,CybotAndroidHealth=350,CybotHeliHealth=500,CybotDroneHealth=850)
	CybotLauncherProfileG(7)=(MaxCybotsPerPlayer=0,CybotsMaxLifeSpan=0.000000,FieldMaxLifeSpan=0.000000,VortexMaxLifeSpan=0.000000)
	CybotLOversProfileA(7)=(enableOversurrection=True,OversurrectionLifeTime=80.000000,OversurrectionHealth=50000,OversurrectionChildrenHealth=5000)
	CybotLOversProfileB(7)=(OversurrectionChildrenInnerMaxRadius=140.000000,OversurrectionChildrenOuterMaxRadius=1000.000000,OversurrectionChildrenMax=75,OversurrectionChildrenDefenseMin=10)
	CybotLOversProfileC(7)=(OversurrectionChildrenMoveTimeInterval=2.000000,OversurrectionChildrenAutoAttackOdds=0.300000)
	CybotLOversProfileD(7)=(OversurrectionZapAttackOdds=0.350000,OversurrectionZapAttackCooldown=1.250000,OversurrectionZapAttackDmg=500)
	CybotLOversProfileE(7)=(OversurrectionProjAttackOdds=0.650000,OversurrectionProjAttackCooldown=0.500000,OversurrectionProjAttackDmg=300)
	CybotLOversProfileF(7)=(OversurrectionHomingAttackOdds=0.150000,OversurrectionHomingAttackCooldown=2.500000,OversurrectionHomingAttackDmg=750)
}