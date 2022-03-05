//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMainReplacer expands NWReplacer config(NWConfig);

var() config bool enableOldWeaponsReplace;

function PreBeginPlay()
{
	if (default.enableOldWeaponsReplace)
		Level.Game.BaseMutator.AddMutator(Spawn(Class'NWMHOldReplacer'));
	Super.PreBeginPlay();
}


defaultproperties
{
	ReplacerLogName=NWMainReplacer
	
	enableWeaponPrioritiesProcessor=True
	
	bMHPawnWeaponsFix=True
	bKeepTriggerChainOnReplace=False
	GlobalWeaponChargerType=GCT_Config
	GlobalAmmoChargerType=GCT_Config
	GlobalPickupChargerType=GCT_Config
	GlobalWeaponMultiReplacementType=GRMT_Config
	GlobalAmmoMultiReplacementType=GRMT_Config
	GlobalPickupMultiReplacementType=GRMT_Config
	GlobalWeaponTeamChargerSett=GTCS_Config
	GlobalAmmoTeamChargerSett=GTCS_Config
	GlobalPickupTeamChargerSett=GTCS_Config
	
	enableOldWeaponsReplace=False

	DefaultWeaponItems(0)=(bAdd=True,Item="NWMegatonVIII_SRC.MegatonDecoder",AmmoAmount=0,Filters="minH=3000;minS=4000;",Options="")
	
	StartingWeaponClassNames(0)=WRE

	WeaponItems(0)=(bSwap=True,ItemToReplace="BotPack.Translocator",NewItem="NWRTVIII_SRC.RT",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(1)=(bSwap=True,ItemToReplace="BotPack.ImpactHammer",NewItem="NWTheExecutionerVIII_SRC.TheExecutioner",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(2)=(bSwap=True,ItemToReplace="BotPack.ChainSaw",NewItem="NWTheExecutionerVIII_SRC.TheExecutioner",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(3)=(bSwap=True,ItemToReplace="BotPack.Enforcer",NewItem="NWWREVIII_SRC.WRE",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(4)=(bSwap=True,ItemToReplace="BotPack.UT_Biorifle",NewItem="NWFlameTrackerVIII_SRC.FlameTracker",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(5)=(bSwap=True,ItemToReplace="BotPack.SuperShockRifle",NewItem="NWSuperBoltRifleVIII_SRC.SuperBoltRifle",ReplaceSubClasses=True,Filters="",Options="bGameWeaponStay=True;")
	WeaponItems(6)=(bSwap=True,ItemToReplace="BotPack.ShockRifle",NewItem="NWBoltRifleVIII_SRC.BoltRifle",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(7)=(bSwap=True,ItemToReplace="BotPack.PulseGun",NewItem="NWGravitonVIII_SRC.Graviton",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(8)=(bSwap=True,ItemToReplace="BotPack.Ripper",NewItem="NWFreezerVIII_SRC.Freezer",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(9)=(bSwap=True,ItemToReplace="BotPack.Minigun2",NewItem="NWVulcanVIII_SRC.Vulcan",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(10)=(bSwap=True,ItemToReplace="BotPack.UT_FlakCannon",NewItem="NWTheMinerVIII_SRC.TheMiner",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(11)=(bSwap=True,ItemToReplace="BotPack.UT_Eightball",NewItem="NWMultiMissileVIII_SRC.MultiMissile",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(12)=(bSwap=True,ItemToReplace="BotPack.SniperRifle",NewItem="NWIRPRVIII_SRC.IRPR",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(13)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWSuperBoltRifleVIII_SRC.SuperBoltRifle",ReplaceSubClasses=True,Filters="",Options="bInfiniteAmmo=False;")
	WeaponItems(14)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWCybotLauncherVIII_SRC.CybotLauncher",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(15)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelA",ReplaceSubClasses=True,Filters="",Options="")
	WeaponItems(16)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelB",ReplaceSubClasses=True,Filters="minS=1500;",Options="")
	WeaponItems(17)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelC",ReplaceSubClasses=True,Filters="minS=3000;",Options="")
	WeaponItems(18)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelD",ReplaceSubClasses=True,Filters="minH=3000;minS=4000;",Options="")
	WeaponItems(19)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelE",ReplaceSubClasses=True,Filters="minH=4500;minS=7000;",Options="")
	WeaponItems(20)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWMegatonVIII_SRC.Megaton",ReplaceSubClasses=True,Filters="minH=3000;minS=4000;",Options="")
	WeaponItems(21)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWIonizerVIII_SRC.Ionizer",ReplaceSubClasses=True,Filters="minH=3000;minS=4500;",Options="")
	WeaponItems(22)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWUltimaProtosVIII_SRC.UltimaProtos",ReplaceSubClasses=True,Filters="minH=4500;minS=7000;",Options="")
	WeaponItems(23)=(bSwap=True,ItemToReplace="BotPack.WarHeadLauncher",NewItem="NWTheOversurrectorVIII_SRC.TheOversurrector",ReplaceSubClasses=True,Filters="minH=2500;minS=1500;",Options="")
	
	AmmoItems(0)=(bSwap=True,ItemToReplace="BotPack.EClip",NewItem="NWWREVIII_SRC.WREAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(1)=(bSwap=True,ItemToReplace="BotPack.BioAmmo",NewItem="NWFlameTrackerVIII_SRC.FlameTAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(2)=(bSwap=True,ItemToReplace="BotPack.SuperShockCore",NewItem="NWSuperBoltRifleVIII_SRC.SuperBoltAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(3)=(bSwap=True,ItemToReplace="BotPack.ShockCore",NewItem="NWBoltRifleVIII_SRC.BoltAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(4)=(bSwap=True,ItemToReplace="BotPack.PAmmo",NewItem="NWGravitonVIII_SRC.GravitonAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(5)=(bSwap=True,ItemToReplace="BotPack.BladeHopper",NewItem="NWFreezerVIII_SRC.FreezerAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(6)=(bSwap=True,ItemToReplace="BotPack.MiniAmmo",NewItem="NWVulcanVIII_SRC.VulcanAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(7)=(bSwap=True,ItemToReplace="BotPack.FlakAmmo",NewItem="NWTheMinerVIII_SRC.TheMinerAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(8)=(bSwap=True,ItemToReplace="BotPack.RocketPack",NewItem="NWMultiMissileVIII_SRC.MultiMAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(9)=(bSwap=True,ItemToReplace="BotPack.BulletBox",NewItem="NWIRPRVIII_SRC.IRPRAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(10)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="NWSuperBoltRifleVIII_SRC.SuperBoltAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(11)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="NWCybotLauncherVIII_SRC.CybotAmmo",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(12)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="NWNuclearLauncherVIII_SRC.NuclearAmmoLevelA",ReplaceSubClasses=True,Filters="",Options="")
	AmmoItems(13)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="NWNuclearLauncherVIII_SRC.NuclearAmmoLevelB",ReplaceSubClasses=True,Filters="minS=1500;",Options="")
	AmmoItems(14)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="NWNuclearLauncherVIII_SRC.NuclearAmmoLevelC",ReplaceSubClasses=True,Filters="minS=3000;",Options="")
	AmmoItems(15)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="NWNuclearLauncherVIII_SRC.NuclearAmmoLevelD",ReplaceSubClasses=True,Filters="minH=3000;minS=4000;",Options="")
	AmmoItems(16)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="NWNuclearLauncherVIII_SRC.NuclearAmmoLevelE",ReplaceSubClasses=True,Filters="minH=4500;minS=7000;",Options="")
	AmmoItems(17)=(bSwap=True,ItemToReplace="BotPack.WarHeadAmmo",NewItem="NWIonizerVIII_SRC.IonizerAmmo",ReplaceSubClasses=True,Filters="minH=3000;minS=4500;",Options="")
	
	PickupItems(0)=(bSwap=True,ItemToReplace="BotPack.UDamage",NewItem="NWExtrasVIII_SRC.NWUDamage",ReplaceSubClasses=True,Filters="",Options="")
	PickupItems(1)=(bSwap=True,ItemToReplace="BotPack.UT_Invisibility",NewItem="NWExtrasVIII_SRC.NWInvisibility",ReplaceSubClasses=True,Filters="",Options="")
	PickupItems(2)=(bSwap=True,ItemToReplace="BotPack.MedBox",NewItem="NWExtrasVIII_SRC.NWMedPickup",ReplaceSubClasses=True,Filters="",Options="")
	PickupItems(3)=(bSwap=True,ItemToReplace="BotPack.HealthVial",NewItem="NWExtrasVIII_SRC.NWVial",ReplaceSubClasses=True,Filters="",Options="")
	PickupItems(4)=(bSwap=True,ItemToReplace="BotPack.HealthPack",NewItem="NWExtrasVIII_SRC.NWSuperHealth",ReplaceSubClasses=True,Filters="",Options="")
	PickupItems(5)=(bSwap=True,ItemToReplace="BotPack.UT_ShieldBelt",NewItem="NWExtrasVIII_SRC.NWShieldBelt",ReplaceSubClasses=True,Filters="",Options="")
	PickupItems(6)=(bSwap=True,ItemToReplace="BotPack.Armor2",NewItem="NWExtrasVIII_SRC.NWArmor",ReplaceSubClasses=True,Filters="",Options="")
	PickupItems(7)=(bSwap=True,ItemToReplace="BotPack.ThighPads",NewItem="NWExtrasVIII_SRC.NWThighPads",ReplaceSubClasses=True,Filters="",Options="")
	PickupItems(8)=(bSwap=True,ItemToReplace="BotPack.UT_JumpBoots",NewItem="NWExtrasVIII_SRC.NWJumpBoots",ReplaceSubClasses=True,Filters="",Options="")
	
	
	WeaponItemSettings(0)=(Item="BotPack.Translocator",MultiBehaviour=RMT_Sequencial,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=128),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(1)=(Item="BotPack.ImpactHammer",MultiBehaviour=RMT_Sequencial,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(2)=(Item="BotPack.ChainSaw",MultiBehaviour=RMT_Sequencial,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(3)=(Item="BotPack.Enforcer",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=64,G=0,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(4)=(Item="BotPack.UT_Biorifle",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=32,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(5)=(Item="BotPack.ShockRifle",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(6)=(Item="BotPack.SuperShockRifle",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=0,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=False)
	WeaponItemSettings(7)=(Item="BotPack.PulseGun",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=0,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(8)=(Item="BotPack.Ripper",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(9)=(Item="BotPack.Minigun2",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=64),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(10)=(Item="BotPack.UT_FlakCannon",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=128,B=255),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(11)=(Item="BotPack.UT_Eightball",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(12)=(Item="BotPack.SniperRifle",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponItemSettings(13)=(Item="BotPack.WarHeadLauncher",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=0,B=0),bTeamFX=True,FXStyle=RCFX_FadeMedium_25_75,bKeepItem=False,bGiveAllToPawn=False)
	
	AmmoItemSettings(0)=(Item="BotPack.EClip",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=64,G=0,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(1)=(Item="BotPack.BioAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=32,B=0),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(2)=(Item="BotPack.ShockCore",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(3)=(Item="BotPack.SuperShockCore",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=0,B=0),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(4)=(Item="BotPack.PAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=0,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(5)=(Item="BotPack.BladeHopper",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(6)=(Item="BotPack.MiniAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=64),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(7)=(Item="BotPack.FlakAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=128,B=255),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(8)=(Item="BotPack.RocketPack",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=255,B=0),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(9)=(Item="BotPack.BulletBox",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=True,FXStyle=RCFX_Constant_100,bKeepItem=False)
	AmmoItemSettings(10)=(Item="BotPack.WarHeadAmmo",MultiBehaviour=RMT_Locker,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=0,B=0),bTeamFX=True,FXStyle=RCFX_FadeFast_25_75,bKeepItem=False)

	PickupItemSettings(0)=(Item="BotPack.UDamage",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=192,G=0,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(1)=(Item="BotPack.UT_Invisibility",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=128,G=255,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(2)=(Item="BotPack.MedBox",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=0,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(3)=(Item="BotPack.HealthVial",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_None,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(4)=(Item="BotPack.HealthPack",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(5)=(Item="BotPack.UT_ShieldBelt",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=255,B=0),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(6)=(Item="BotPack.Armor2",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=128),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(7)=(Item="BotPack.ThighPads",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=242,G=216,B=255),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	PickupItemSettings(8)=(Item="BotPack.UT_JumpBoots",MultiBehaviour=RMT_RandomTimed,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=0,G=255,B=0),bTeamFX=False,FXStyle=RCFX_FlickerWeak,bKeepItem=False)
	
	
	WeaponItemsLockerSettings(0)=(Item="BotPack.Translocator",RotationType=LIR_Normal,ZOffset=0.000000)
	WeaponItemsLockerSettings(1)=(Item="BotPack.ImpactHammer",RotationType=LIR_SpecialTopDown,ZOffset=0.000000)
	WeaponItemsLockerSettings(2)=(Item="BotPack.PulseGun",RotationType=LIR_SpecialTopDown,ZOffset=0.000000)
	WeaponItemsLockerSettings(3)=(Item="BotPack.Ripper",RotationType=LIR_SpecialTopDown,ZOffset=0.000000)
	WeaponItemsLockerSettings(4)=(Item="NWIRPRVIII_SRC.IRPR",RotationType=LIR_Auto,ZOffset=22.000000)
	WeaponItemsLockerSettings(5)=(Item="NWMegatonVIII_SRC.Megaton",RotationType=LIR_Normal,ZOffset=0.000000)
	WeaponItemsLockerSettings(6)=(Item="NWIonizerVIII_SRC.Ionizer",RotationType=LIR_Normal,ZOffset=12.000000)
	WeaponItemsLockerSettings(7)=(Item="NWNuclearLauncherVIII_SRC.NuclearLauncher",RotationType=LIR_Auto,ZOffset=22.000000)
	WeaponItemsLockerSettings(8)=(Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelA",RotationType=LIR_Auto,ZOffset=22.000000)
	WeaponItemsLockerSettings(9)=(Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelB",RotationType=LIR_Auto,ZOffset=22.000000)
	WeaponItemsLockerSettings(10)=(Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelC",RotationType=LIR_Auto,ZOffset=22.000000)
	WeaponItemsLockerSettings(11)=(Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelD",RotationType=LIR_Auto,ZOffset=22.000000)
	WeaponItemsLockerSettings(12)=(Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelE",RotationType=LIR_Auto,ZOffset=22.000000)
	WeaponItemsLockerSettings(13)=(Item="NWUltimaProtosVIII_SRC.UltimaProtos",RotationType=LIR_Auto,ZOffset=38.000000)
	
	WeaponCustomChargers(0)=(Item="BotPack.Translocator",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(1)=(Item="BotPack.ImpactHammer",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(2)=(Item="BotPack.ChainSaw",Tex="NWCoreVIII_SRC.CC06",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(3)=(Item="BotPack.Enforcer",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(4)=(Item="BotPack.UT_Biorifle",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(5)=(Item="BotPack.ShockRifle",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(6)=(Item="BotPack.SuperShockRifle",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(7)=(Item="BotPack.PulseGun",Tex="NWCoreVIII_SRC.CC04",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(8)=(Item="BotPack.Ripper",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(9)=(Item="BotPack.Minigun2",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(10)=(Item="BotPack.UT_FlakCannon",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(11)=(Item="BotPack.UT_Eightball",Tex="NWCoreVIII_SRC.CC09",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(12)=(Item="BotPack.SniperRifle",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000,RotRate=0)
	WeaponCustomChargers(13)=(Item="BotPack.WarHeadLauncher",Tex="NWCoreVIII_SRC.CC03",Scale=1.000000,RotRate=0)
	
	AmmoCustomChargers(0)=(Item="BotPack.EClip",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(1)=(Item="BotPack.BioAmmo",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(2)=(Item="BotPack.ShockCore",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(3)=(Item="BotPack.SuperShockCore",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(4)=(Item="BotPack.PAmmo",Tex="NWCoreVIII_SRC.CC04",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(5)=(Item="BotPack.BladeHopper",Tex="NWCoreVIII_SRC.CC08",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(6)=(Item="BotPack.MiniAmmo",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(7)=(Item="BotPack.FlakAmmo",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(8)=(Item="BotPack.RocketPack",Tex="NWCoreVIII_SRC.CC09",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(9)=(Item="BotPack.BulletBox",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000,RotRate=0)
	AmmoCustomChargers(10)=(Item="BotPack.WarHeadAmmo",Tex="NWCoreVIII_SRC.CC03",Scale=1.000000,RotRate=0)
	
	PickupCustomChargers(0)=(Item="BotPack.UDamage",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000,RotRate=0)
	PickupCustomChargers(1)=(Item="BotPack.UT_Invisibility",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000,RotRate=0)
	PickupCustomChargers(2)=(Item="BotPack.MedBox",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000,RotRate=0)
	PickupCustomChargers(3)=(Item="BotPack.HealthVial",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000,RotRate=0)
	PickupCustomChargers(4)=(Item="BotPack.HealthPack",Tex="NWCoreVIII_SRC.CC05",Scale=1.000000,RotRate=0)
	PickupCustomChargers(5)=(Item="BotPack.UT_ShieldBelt",Tex="NWCoreVIII_SRC.CC06",Scale=1.000000,RotRate=0)
	PickupCustomChargers(6)=(Item="BotPack.Armor2",Tex="NWCoreVIII_SRC.CC09",Scale=1.000000,RotRate=0)
	PickupCustomChargers(7)=(Item="BotPack.ThighPads",Tex="NWCoreVIII_SRC.CC10",Scale=1.000000,RotRate=0)
	PickupCustomChargers(8)=(Item="BotPack.UT_JumpBoots",Tex="NWCoreVIII_SRC.CC02",Scale=1.000000,RotRate=0)
	
	
	UTWeaponPriorities(0)=(ItemName="Translocator",Priority=0)
	UTWeaponPriorities(1)=(ItemName="ChainSaw",Priority=1)
	UTWeaponPriorities(2)=(ItemName="ImpactHammer",Priority=1)
	UTWeaponPriorities(3)=(ItemName="Enforcer",Priority=2)
	UTWeaponPriorities(4)=(ItemName="UT_BioRifle",Priority=3)
	UTWeaponPriorities(5)=(ItemName="ShockRifle",Priority=4)
	UTWeaponPriorities(6)=(ItemName="SuperShockRifle",Priority=4)
	UTWeaponPriorities(7)=(ItemName="PulseGun",Priority=5)
	UTWeaponPriorities(8)=(ItemName="Ripper",Priority=6)
	UTWeaponPriorities(9)=(ItemName="Minigun2",Priority=7)
	UTWeaponPriorities(10)=(ItemName="UT_FlakCannon",Priority=8)
	UTWeaponPriorities(11)=(ItemName="UT_Eightball",Priority=9)
	UTWeaponPriorities(12)=(ItemName="SniperRifle",Priority=5)
	UTWeaponPriorities(13)=(ItemName="WarHeadLauncher",Priority=10)
}