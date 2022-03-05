//////////////////////////////////////////////////////////////
//				Feralidragon (31-12-2012)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltRifleArena expands NWReplacer config(NWConfig);

defaultproperties
{
	ReplacerLogName=BoltRifleArena
	bArena=True
	
	enableWeaponPrioritiesProcessor=False
	
	bMHPawnWeaponsFix=True
	bKeepTriggerChainOnReplace=False
	GlobalWeaponChargerType=GCT_Config
	GlobalAmmoChargerType=GCT_Config
	GlobalPickupChargerType=GCT_Config

	StartingWeaponClassNames(0)=BoltRifle
	
	DefaultWeaponItems(0)=(bAdd=True,Item="NWBoltRifleVIII_SRC.BoltRifle",AmmoAmount=60,Filters="")

	WeaponItems(0)=(bSwap=True,ItemToReplace="BotPack.Translocator",NewItem="NWRTVIII_SRC.RT",ReplaceSubClasses=True,Filters="")
	WeaponItems(1)=(bSwap=True,ItemToReplace="BotPack.ImpactHammer",NewItem="X",ReplaceSubClasses=True,Filters="")
	WeaponItems(2)=(bSwap=True,ItemToReplace="BotPack.ChainSaw",NewItem="X",ReplaceSubClasses=True,Filters="")
	WeaponItems(3)=(bSwap=True,ItemToReplace="BotPack.Enforcer",NewItem="X",ReplaceSubClasses=True,Filters="")
	WeaponItems(4)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="X",ReplaceSubClasses=True,Filters="")
	WeaponItems(5)=(bSwap=True,ItemToReplace="Engine.Weapon",NewItem="NWBoltRifleVIII_SRC.BoltRifle",ReplaceSubClasses=True,Filters="")
	
	AmmoItems(0)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="X",ReplaceSubClasses=True,Filters="")
	AmmoItems(1)=(bSwap=True,ItemToReplace="Engine.Ammo",NewItem="NWBoltRifleVIII_SRC.BoltAmmo",ReplaceSubClasses=True,Filters="")
	
	PickupItems(0)=(bSwap=True,ItemToReplace="BotPack.UDamage",NewItem="NWExtrasVIII_SRC.NWUDamage",ReplaceSubClasses=True,Filters="")
	PickupItems(1)=(bSwap=True,ItemToReplace="BotPack.UT_Invisibility",NewItem="NWExtrasVIII_SRC.NWInvisibility",ReplaceSubClasses=True,Filters="")
	PickupItems(2)=(bSwap=True,ItemToReplace="BotPack.MedBox",NewItem="NWExtrasVIII_SRC.NWMedPickup",ReplaceSubClasses=True,Filters="")
	PickupItems(3)=(bSwap=True,ItemToReplace="BotPack.HealthVial",NewItem="NWExtrasVIII_SRC.NWVial",ReplaceSubClasses=True,Filters="")
	PickupItems(4)=(bSwap=True,ItemToReplace="BotPack.HealthPack",NewItem="NWExtrasVIII_SRC.NWSuperHealth",ReplaceSubClasses=True,Filters="")
	PickupItems(5)=(bSwap=True,ItemToReplace="BotPack.UT_ShieldBelt",NewItem="NWExtrasVIII_SRC.NWShieldBelt",ReplaceSubClasses=True,Filters="")
	PickupItems(6)=(bSwap=True,ItemToReplace="BotPack.Armor2",NewItem="NWExtrasVIII_SRC.NWArmor",ReplaceSubClasses=True,Filters="")
	PickupItems(7)=(bSwap=True,ItemToReplace="BotPack.ThighPads",NewItem="NWExtrasVIII_SRC.NWThighPads",ReplaceSubClasses=True,Filters="")
	PickupItems(8)=(bSwap=True,ItemToReplace="BotPack.UT_JumpBoots",NewItem="NWExtrasVIII_SRC.NWJumpBoots",ReplaceSubClasses=True,Filters="")
	
	
	WeaponItemSettings(0)=(Item="BotPack.Translocator",MultiBehaviour=RMT_Sequencial,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=128),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(1)=(Item="Engine.Weapon",MultiBehaviour=RMT_Sequencial,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	
	AmmoItemSettings(0)=(Item="Engine.Ammo",MultiBehaviour=RMT_Sequencial,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)

	PickupItemSettings(0)=(Item="BotPack.UDamage",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=192,G=0,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(1)=(Item="BotPack.UT_Invisibility",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=255,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(2)=(Item="BotPack.MedBox",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=0,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(3)=(Item="BotPack.HealthVial",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_None,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(4)=(Item="BotPack.HealthPack",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(5)=(Item="BotPack.UT_ShieldBelt",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=0),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(6)=(Item="BotPack.Armor2",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=128),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(7)=(Item="BotPack.ThighPads",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=242,G=216,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(8)=(Item="BotPack.UT_JumpBoots",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	
	
	WeaponCustomChargers(0)=(Item="BotPack.Translocator",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
	WeaponCustomChargers(1)=(Item="Engine.Weapon",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	
	AmmoCustomChargers(0)=(Item="Engine.Ammo",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	
	PickupCustomChargers(0)=(Item="BotPack.UDamage",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
	PickupCustomChargers(1)=(Item="BotPack.UT_Invisibility",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
	PickupCustomChargers(2)=(Item="BotPack.MedBox",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000)
	PickupCustomChargers(3)=(Item="BotPack.HealthVial",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000)
	PickupCustomChargers(4)=(Item="BotPack.HealthPack",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000)
	PickupCustomChargers(5)=(Item="BotPack.UT_ShieldBelt",Tex="NWCoreVIII_SRC.CC06",Scale=1.000000)
	PickupCustomChargers(6)=(Item="BotPack.Armor2",Tex="NWCoreVIII_SRC.CC09",Scale=1.000000)
	PickupCustomChargers(7)=(Item="BotPack.ThighPads",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000)
	PickupCustomChargers(8)=(Item="BotPack.UT_JumpBoots",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000)
}