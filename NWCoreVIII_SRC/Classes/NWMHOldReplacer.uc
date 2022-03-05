//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMHOldReplacer expands NWReplacer config(NWConfig);

function PreBeginPlay()
{
local byte i;
local string LvlGamePkg;

	LvlGamePkg = Left(String(Level.Game.Class), InStr(String(Level.Game.Class), "."));
	for (i = 0; i < ArrayCount(WeaponItems); i++)
		ProcessOLWeaponStr(LvlGamePkg, WeaponItems[i].ItemToReplace);
	for (i = 0; i < ArrayCount(WeaponItemSettings); i++)
		ProcessOLWeaponStr(LvlGamePkg, WeaponItemSettings[i].Item);
	for (i = 0; i < ArrayCount(WeaponCustomChargers); i++)
		ProcessOLWeaponStr(LvlGamePkg, WeaponCustomChargers[i].Item);
		
	Super.PreBeginPlay();
}

function ProcessOLWeaponStr(string lvlPkg, out string str)
{
	if (lvlPkg == "" || InStr(Caps(str), "MHGAME.") != 0)
		return;
	str = lvlPkg$Mid(str, InStr(str, "."));
}

defaultproperties
{
	ReplacerLogName=NWMHOldReplacer
	
	enableWeaponPrioritiesProcessor=False
	
	bMHPawnWeaponsFix=True
	bKeepTriggerChainOnReplace=False
	GlobalWeaponChargerType=GCT_Config
	GlobalAmmoChargerType=GCT_Config
	GlobalPickupChargerType=GCT_Config

	
	WeaponItems(0)=(bSwap=True,ItemToReplace="UnrealShare.AutoMag",NewItem="NWWREVIII_SRC.WRE",ReplaceSubClasses=True,Filters="")
	WeaponItems(1)=(bSwap=True,ItemToReplace="UnrealShare.DispersionPistol",NewItem="NWWREVIII_SRC.WRE",ReplaceSubClasses=True,Filters="")
	WeaponItems(2)=(bSwap=True,ItemToReplace="UnrealI.GESBioRifle",NewItem="NWFlameTrackerVIII_SRC.FlameTracker",ReplaceSubClasses=False,Filters="")
	WeaponItems(3)=(bSwap=True,ItemToReplace="UnrealShare.ASMD",NewItem="NWBoltRifleVIII_SRC.BoltRifle",ReplaceSubClasses=False,Filters="")
	WeaponItems(4)=(bSwap=True,ItemToReplace="UnrealI.RazorJack",NewItem="NWFreezerVIII_SRC.Freezer",ReplaceSubClasses=False,Filters="")
	WeaponItems(5)=(bSwap=True,ItemToReplace="UnrealI.Minigun",NewItem="NWVulcanVIII_SRC.Vulcan",ReplaceSubClasses=False,Filters="")
	WeaponItems(6)=(bSwap=True,ItemToReplace="UnrealShare.Stinger",NewItem="NWVulcanVIII_SRC.Vulcan",ReplaceSubClasses=False,Filters="")
	WeaponItems(7)=(bSwap=True,ItemToReplace="UnrealI.FlakCannon",NewItem="NWTheMinerVIII_SRC.TheMiner",ReplaceSubClasses=False,Filters="")
	WeaponItems(8)=(bSwap=True,ItemToReplace="UnrealShare.Eightball",NewItem="NWMultiMissileVIII_SRC.MultiMissile",ReplaceSubClasses=False,Filters="")
	WeaponItems(9)=(bSwap=True,ItemToReplace="UnrealI.Rifle",NewItem="NWIRPRVIII_SRC.IRPR",ReplaceSubClasses=False,Filters="")
	WeaponItems(10)=(bSwap=True,ItemToReplace="MHGAME.OLautomag",NewItem="NWWREVIII_SRC.WRE",ReplaceSubClasses=True,Filters="")
	WeaponItems(11)=(bSwap=True,ItemToReplace="MHGAME.OLDPistol",NewItem="NWWREVIII_SRC.WRE",ReplaceSubClasses=True,Filters="")
	WeaponItems(12)=(bSwap=True,ItemToReplace="MHGAME.OLGESBioRifle",NewItem="NWFlameTrackerVIII_SRC.FlameTracker",ReplaceSubClasses=False,Filters="")
	WeaponItems(13)=(bSwap=True,ItemToReplace="MHGAME.OLASMD",NewItem="NWBoltRifleVIII_SRC.BoltRifle",ReplaceSubClasses=False,Filters="")
	WeaponItems(14)=(bSwap=True,ItemToReplace="MHGAME.OLRazorJack",NewItem="NWFreezerVIII_SRC.Freezer",ReplaceSubClasses=False,Filters="")
	WeaponItems(15)=(bSwap=True,ItemToReplace="MHGAME.OLMinigun",NewItem="NWVulcanVIII_SRC.Vulcan",ReplaceSubClasses=False,Filters="")
	WeaponItems(16)=(bSwap=True,ItemToReplace="MHGAME.OLStinger",NewItem="NWVulcanVIII_SRC.Vulcan",ReplaceSubClasses=False,Filters="")
	WeaponItems(17)=(bSwap=True,ItemToReplace="MHGAME.OLFlakCannon",NewItem="NWTheMinerVIII_SRC.TheMiner",ReplaceSubClasses=False,Filters="")
	WeaponItems(18)=(bSwap=True,ItemToReplace="MHGAME.OLEightball",NewItem="NWMultiMissileVIII_SRC.MultiMissile",ReplaceSubClasses=False,Filters="")
	WeaponItems(19)=(bSwap=True,ItemToReplace="MHGAME.OLRifle",NewItem="NWIRPRVIII_SRC.IRPR",ReplaceSubClasses=False,Filters="")
	

	AmmoItems(0)=(bSwap=True,ItemToReplace="UnrealShare.Clip",NewItem="NWWREVIII_SRC.WREAmmo",ReplaceSubClasses=False,Filters="")
	AmmoItems(1)=(bSwap=True,ItemToReplace="UnrealI.Sludge",NewItem="NWFlameTrackerVIII_SRC.FlameTAmmo",ReplaceSubClasses=False,Filters="")
	AmmoItems(2)=(bSwap=True,ItemToReplace="UnrealShare.ASMDAmmo",NewItem="NWBoltRifleVIII_SRC.BoltAmmo",ReplaceSubClasses=False,Filters="")
	AmmoItems(3)=(bSwap=True,ItemToReplace="UnrealI.RazorAmmo",NewItem="NWFreezerVIII_SRC.FreezerAmmo",ReplaceSubClasses=False,Filters="")
	AmmoItems(4)=(bSwap=True,ItemToReplace="UnrealShare.Shellbox",NewItem="NWVulcanVIII_SRC.VulcanAmmo",ReplaceSubClasses=False,Filters="")
	AmmoItems(5)=(bSwap=True,ItemToReplace="UnrealShare.StingerAmmo",NewItem="NWVulcanVIII_SRC.VulcanAmmo",ReplaceSubClasses=False,Filters="")
	AmmoItems(6)=(bSwap=True,ItemToReplace="UnrealI.FlakBox",NewItem="NWTheMinerVIII_SRC.TheMinerAmmo",ReplaceSubClasses=True,Filters="")
	AmmoItems(7)=(bSwap=True,ItemToReplace="UnrealShare.RocketCan",NewItem="NWMultiMissileVIII_SRC.MultiMAmmo",ReplaceSubClasses=False,Filters="")
	AmmoItems(8)=(bSwap=True,ItemToReplace="UnrealI.RifleAmmo",NewItem="NWIRPRVIII_SRC.IRPRAmmo",ReplaceSubClasses=True,Filters="")
	
	
	WeaponItemSettings(0)=(Item="UnrealShare.AutoMag",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=64,G=0,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(1)=(Item="UnrealShare.DispersionPistol",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=64,G=0,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(2)=(Item="UnrealI.GESBioRifle",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=32,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(3)=(Item="UnrealShare.ASMD",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(4)=(Item="UnrealI.RazorJack",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(5)=(Item="UnrealI.Minigun",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=64),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(6)=(Item="UnrealShare.Stinger",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=64),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(7)=(Item="UnrealI.FlakCannon",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=128,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(8)=(Item="UnrealShare.Eightball",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(9)=(Item="UnrealI.Rifle",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(10)=(Item="MHGAME.OLautomag",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=64,G=0,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(11)=(Item="MHGAME.OLDPistol",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=64,G=0,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(12)=(Item="MHGAME.OLGESBioRifle",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=32,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(13)=(Item="MHGAME.OLASMD",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(14)=(Item="MHGAME.OLRazorJack",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(15)=(Item="MHGAME.OLMinigun",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=64),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(16)=(Item="MHGAME.OLStinger",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=64),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(17)=(Item="MHGAME.OLFlakCannon",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=128,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(18)=(Item="MHGAME.OLEightball",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(19)=(Item="MHGAME.OLRifle",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	
	AmmoItemSettings(0)=(Item="UnrealShare.Clip",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=64,G=0,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(1)=(Item="UnrealI.Sludge",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=32,B=0),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(2)=(Item="UnrealShare.ASMDAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(3)=(Item="UnrealI.RazorAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(4)=(Item="UnrealShare.Shellbox",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=64),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(5)=(Item="UnrealShare.StingerAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=64),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(6)=(Item="UnrealI.FlakBox",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=128,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(7)=(Item="UnrealShare.RocketCan",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=255,B=0),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(8)=(Item="UnrealI.RifleAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)

	
	WeaponCustomChargers(0)=(Item="UnrealShare.AutoMag",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	WeaponCustomChargers(1)=(Item="UnrealShare.DispersionPistol",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	WeaponCustomChargers(2)=(Item="UnrealI.GESBioRifle",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000)
	WeaponCustomChargers(3)=(Item="UnrealShare.ASMD",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000)
	WeaponCustomChargers(4)=(Item="UnrealI.RazorJack",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000)
	WeaponCustomChargers(5)=(Item="UnrealI.Minigun",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
	WeaponCustomChargers(6)=(Item="UnrealShare.Stinger",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
	WeaponCustomChargers(7)=(Item="UnrealI.FlakCannon",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000)
	WeaponCustomChargers(8)=(Item="UnrealShare.Eightball",Tex="NWCoreVIII_SRC.CC09",Scale=1.000000)
	WeaponCustomChargers(9)=(Item="UnrealI.Rifle",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	WeaponCustomChargers(10)=(Item="MHGAME.OLautomag",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	WeaponCustomChargers(11)=(Item="MHGAME.OLDPistol",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	WeaponCustomChargers(12)=(Item="MHGAME.OLGESBioRifle",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000)
	WeaponCustomChargers(13)=(Item="MHGAME.OLASMD",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000)
	WeaponCustomChargers(14)=(Item="MHGAME.OLRazorJack",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000)
	WeaponCustomChargers(15)=(Item="MHGAME.OLMinigun",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
	WeaponCustomChargers(16)=(Item="MHGAME.OLStinger",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
	WeaponCustomChargers(17)=(Item="MHGAME.OLFlakCannon",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000)
	WeaponCustomChargers(18)=(Item="MHGAME.OLEightball",Tex="NWCoreVIII_SRC.CC09",Scale=1.000000)
	WeaponCustomChargers(19)=(Item="MHGAME.OLRifle",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	
	AmmoCustomChargers(0)=(Item="UnrealShare.Clip",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	AmmoCustomChargers(1)=(Item="UnrealI.Sludge",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000)
	AmmoCustomChargers(2)=(Item="UnrealShare.ASMDAmmo",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000)
	AmmoCustomChargers(3)=(Item="UnrealI.RazorAmmo",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000)
	AmmoCustomChargers(4)=(Item="UnrealShare.Shellbox",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
	AmmoCustomChargers(5)=(Item="UnrealShare.StingerAmmo",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
	AmmoCustomChargers(6)=(Item="UnrealI.FlakBox",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000)
	AmmoCustomChargers(7)=(Item="UnrealShare.RocketCan",Tex="NWCoreVIII_SRC.CC09",Scale=1.000000)
	AmmoCustomChargers(8)=(Item="UnrealI.RifleAmmo",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
}