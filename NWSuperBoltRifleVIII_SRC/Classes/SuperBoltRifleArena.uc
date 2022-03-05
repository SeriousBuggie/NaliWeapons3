//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2012)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SuperBoltRifleArena expands NWReplacer config(NWConfig);

defaultproperties
{
	ReplacerLogName=SuperBoltRifleArena
	bArena=True
	
	enableWeaponPrioritiesProcessor=False
	
	bMHPawnWeaponsFix=True
	bKeepTriggerChainOnReplace=False
	GlobalWeaponChargerType=GCT_Config
	GlobalAmmoChargerType=GCT_Config
	GlobalPickupChargerType=GCT_Config
	
	StartingWeaponClassNames(0)=SuperBoltRifle
	DefaultWeaponItems(0)=(bAdd=True,Item="NWSuperBoltRifleVIII_SRC.SuperBoltRifle",AmmoAmount=25,Filters="")

	WeaponItems(0)=(bSwap=True,ItemToReplace="BotPack.Translocator",NewItem="NWRTVIII_SRC.RT",ReplaceSubClasses=True,Filters="")
	WeaponItems(1)=(bSwap=True,ItemToReplace="Engine.Weapon",NewItem="X",ReplaceSubClasses=True,Filters="")
	
	AmmoItems(0)=(bSwap=True,ItemToReplace="Engine.Ammo",NewItem="X",ReplaceSubClasses=True,Filters="")
	
	PickupItems(0)=(bSwap=True,ItemToReplace="BotPack.TournamentPickup",NewItem="X",ReplaceSubClasses=True,Filters="")
	PickupItems(1)=(bSwap=True,ItemToReplace="BotPack.TournamentHealth",NewItem="X",ReplaceSubClasses=True,Filters="")
	
	WeaponItemSettings(0)=(Item="BotPack.Translocator",MultiBehaviour=RMT_Sequencial,ChargerType=RCT_Charger2,RespawnTime=0.000000,FXDefaultColor=(R=255,G=128,B=128),bTeamFX=True,FXStyle=RCFX_FlickerWeak,bKeepItem=False,bGiveAllToPawn=True)
	WeaponCustomChargers(0)=(Item="BotPack.Translocator",Tex="NWCoreVIII_SRC.CC07",Scale=1.000000)
}