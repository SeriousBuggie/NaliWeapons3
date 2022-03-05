//////////////////////////////////////////////////////////////
//	Nali Weapons III dynamic replacer base class
//				Feralidragon (17-08-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWReplacer expands Mutator config(NWConfig);


var() name ReplacerLogName;
var() name ReplacedInventoryTag, DefaultInventoryTag;
var() class<NWUtils> UtilsClass;
var() bool bArena;
var bool isActive;

var(Server) config bool bMHPawnWeaponsFix;
var(Server) config bool bKeepTriggerChainOnReplace;

enum EGlobalChargerType
{
	GCT_None,
	GCT_Config,
	GCT_Charger1,
	GCT_Charger2
};
var(Server) config EGlobalChargerType GlobalWeaponChargerType;
var(Server) config EGlobalChargerType GlobalAmmoChargerType;
var(Server) config EGlobalChargerType GlobalPickupChargerType;

enum EGlobalMultiType
{
	GRMT_Config,
	GRMT_Sequencial,
	GRMT_RandomStatic,
	GRMT_RandomTimed,
	GRMT_Locker
};
var(Server) config EGlobalMultiType GlobalWeaponMultiReplacementType;
var(Server) config EGlobalMultiType GlobalAmmoMultiReplacementType;
var(Server) config EGlobalMultiType GlobalPickupMultiReplacementType;

enum EGlobalTeamChargerSett
{
	GTCS_Config,
	GTCS_EnableTeam,
	GTCS_DisableTeam
};
var(Server) config EGlobalTeamChargerSett GlobalWeaponTeamChargerSett;
var(Server) config EGlobalTeamChargerSett GlobalAmmoTeamChargerSett;
var(Server) config EGlobalTeamChargerSett GlobalPickupTeamChargerSett;

struct RItem
{
	var() bool bSwap;
	var() string ItemToReplace;
	var() string NewItem;
	var() bool ReplaceSubClasses;
	var() string Filters;
	var() string Options;
};

var(Server) config RItem WeaponItems[64];
var(Server) config RItem AmmoItems[64];
var(Server) config RItem PickupItems[64];
var string TempItem[64];
var int TempIndex[64];

struct DefWeapItem
{
	var() bool bAdd;
	var() string Item;
	var() int AmmoAmount;
	var() string Filters;
	var() string Options;
};
var(Server) config DefWeapItem DefaultWeaponItems[64];
var(Server) config name StartingWeaponClassNames[48];
var name StartingWeaponCNames[48];
var byte StartingWeaponCNamesSize;

struct DefPickItem
{
	var() bool bAdd;
	var() string Item;
	var() string Filters;
	var() string Options;
};
var(Server) config DefPickItem DefaultPickupItems[64];

enum EMultiType
{
	RMT_Sequencial,
	RMT_RandomStatic,
	RMT_RandomTimed,
	RMT_Locker
};

enum EChargerType
{
	RCT_None,
	RCT_Charger1,
	RCT_Charger2
};

enum EChargerFXStyle
{
	RCFX_None,
	RCFX_Constant_100,
	RCFX_Constant_75,
	RCFX_Constant_50,
	RCFX_Constant_25,
	RCFX_FlickerWeak,
	RCFX_FlickerMedium,
	RCFX_FlickerIntense,
	RCFX_FadeSlow_50_50,
	RCFX_FadeMedium_50_50,
	RCFX_FadeFast_50_50,
	RCFX_FadeSlow_25_75,
	RCFX_FadeMedium_25_75,
	RCFX_FadeFast_25_75,
	RCFX_FadeSlow_75_25,
	RCFX_FadeMedium_75_25,
	RCFX_FadeFast_75_25,
	RCFX_FadeSlow_10_90,
	RCFX_FadeMedium_10_90,
	RCFX_FadeFast_10_90,
	RCFX_FadeSlow_90_10,
	RCFX_FadeMedium_90_10,
	RCFX_FadeFast_90_10,
	RCFX_FadeSlow_0_100,
	RCFX_FadeMedium_0_100,
	RCFX_FadeFast_0_100,
	RCFX_FadeSlow_100_0,
	RCFX_FadeMedium_100_0,
	RCFX_FadeFast_100_0
};

struct ItemSettings
{
	var() string Item;
	var() EMultiType MultiBehaviour;
	var() EChargerType ChargerType;
	var() float RespawnTime;
	var() color FXDefaultColor;
	var() bool bTeamFX;
	var() EChargerFXStyle FXStyle;
	var() bool bKeepItem;
	var() bool bGiveAllToPawn;
};

var(Server) config ItemSettings WeaponItemSettings[64];
var(Server) config ItemSettings AmmoItemSettings[64];
var(Server) config ItemSettings PickupItemSettings[64];

enum ELockerItemRot
{
	LIR_Auto,
	LIR_Normal,
	LIR_TopDown,
	LIR_SpecialTopDown,
};

struct LockerPos
{
	var() string Item;
	var() ELockerItemRot RotationType;
	var() float ZOffset;
};

var(Server) config LockerPos WeaponItemsLockerSettings[64];
var(Server) config LockerPos AmmoItemsLockerSettings[64];
var(Server) config LockerPos PickupItemsLockerSettings[64];

var float maxMapHeight, maxMapSize;
var int numPlayerStarts, numLiquidZones, numWaterZones;
var int numLavaZones, numSlimeZones, numDamageZones;

struct WeapPrioInfo
{
	var() name ItemName;
	var() byte Priority;
};
var(Server) config WeapPrioInfo UTWeaponPriorities[50];
var(Client) config bool enableWeaponPrioritiesProcessor;
var bool bProcessedWPriorities;

var WeapPrioInfo WPInfo[50];
var PlayerPawn ClientPP;
var float playerPawnInitRenderTimeout;
var bool bWPInfoProcessed;

struct ChargerCustomInfo
{
	var() string Item;
	var() string Tex;
	var() float Scale;
	var() int RotRate;
};
var(Server) config ChargerCustomInfo WeaponCustomChargers[64];
var(Server) config ChargerCustomInfo AmmoCustomChargers[64];
var(Server) config ChargerCustomInfo PickupCustomChargers[64];


var int WeaponItemsSize, AmmoItemsSize, PickupItemsSize, DefaultWeaponItemsSize, DefaultPickupItemsSize;
var int WeaponItemSettingsSize, AmmoItemSettingsSize, PickupItemSettingsSize;
var int WeaponItemsLockerSettingsSize, AmmoItemsLockerSettingsSize, PickupItemsLockerSettingsSize;
var int WeaponCustomChargersSize, AmmoCustomChargersSize, PickupCustomChargersSize;
var int UTWeaponPrioritiesSize;

var(Server) globalconfig float ClientPrecacheWaitTime;
var() localized string LoadingMsgStr, LoadedMsgStr;
var string PrecacheItemsA[64], PrecacheItemsB[64], PrecacheItemsC[64], PrecacheItemsD[64], PrecacheItemsE[64];
var bool bProcessedPrecache, bPrecached, justPrecached;
var float clientPrecacheWaitCount, replPrecacheWaitTime;

var name tempName;


replication
{
	reliable if (Role == ROLE_Authority)
		WPInfo, PrecacheItemsA, PrecacheItemsB, PrecacheItemsC, PrecacheItemsD, PrecacheItemsE, 
		bProcessedPrecache, replPrecacheWaitTime, isActive;
}

function PreBeginPlay()
{
	isActive = (!bArena || !hasOtherReplacer());
	if (isActive)
	{
		InitLists();
		LoadFilterData();
		ProcessPrecache();
		ExecutePrecache();
		if (Level.NetMode != NM_StandAlone)
			replPrecacheWaitTime = default.ClientPrecacheWaitTime;
	}
}

function name getNameFromString(string str)
{
	SetPropertyText("tempName", str);
	return tempName;
}

function name getReplacedItemTagName(int index)
{
	return getNameFromString(String(ReplacedInventoryTag)$"_"$index);
}

function name getDefaultItemTagName(int index)
{
	return getNameFromString(String(ReplacedInventoryTag)$"_"$index);
}

function bool isReplacedOrDefaultItem(name replTag)
{
	return (isReplacedItem(replTag) || isDefaultItem(replTag));
}

function bool isReplacedItem(name replTag)
{
	return (InStr(Caps(String(replTag)), Caps(String(ReplacedInventoryTag))) == 0);
}

function bool isDefaultItem(name defTag)
{
	return (InStr(Caps(String(defTag)), Caps(String(DefaultInventoryTag))) == 0);
}

function int getReplacedItemIndex(name replTag)
{
local string s;
	
	s = Mid(String(replTag), Len(String(ReplacedInventoryTag)$"_"));
	if (s == "")
		return -1;
	return Int(s);
}

function int getDefaultItemIndex(name defTag)
{
local string s;
	
	s = Mid(String(defTag), Len(String(DefaultInventoryTag)$"_"));
	if (s == "")
		return -1;
	return Int(s);
}

function bool hasOtherReplacer()
{
local Mutator M;
local int i;

	for (M = Level.Game.BaseMutator; M != None; M = M.NextMutator)
	{
		if (i > 1000)
			return False;
		if (NWReplacer(M) != None && M != Self)
			return True;
		i++;
	}
	return False;
}

function ProcessPrecache()
{
local byte i;

	for (i = 0; i < ArrayCount(WeaponItems); i++)
	{
		if (WeaponItems[i].bSwap && WeaponItems[i].ItemToReplace != "" && Caps(WeaponItems[i].NewItem) != "X" &&
		DynamicLoadObject(WeaponItems[i].ItemToReplace, class'Class', True) != None)
			PrecacheItemsA[i] = WeaponItems[i].NewItem;
	}
	
	for (i = 0; i < ArrayCount(AmmoItems); i++)
	{
		if (AmmoItems[i].bSwap && AmmoItems[i].ItemToReplace != "" && Caps(AmmoItems[i].NewItem) != "X" &&
		DynamicLoadObject(AmmoItems[i].ItemToReplace, class'Class', True) != None)
			PrecacheItemsB[i] = AmmoItems[i].NewItem;
	}
	
	for (i = 0; i < ArrayCount(PickupItems); i++)
	{
		if (PickupItems[i].bSwap && PickupItems[i].ItemToReplace != "" && Caps(PickupItems[i].NewItem) != "X" &&
		DynamicLoadObject(PickupItems[i].ItemToReplace, class'Class', True) != None)
			PrecacheItemsC[i] = PickupItems[i].NewItem;
	}
	
	for (i = 0; i < ArrayCount(DefaultWeaponItems); i++)
	{
		if (DefaultWeaponItems[i].bAdd && DefaultWeaponItems[i].Item != "" && DynamicLoadObject(DefaultWeaponItems[i].Item, class'Class', True) != None)
			PrecacheItemsD[i] = DefaultWeaponItems[i].Item;
	}
	
	for (i = 0; i < ArrayCount(DefaultPickupItems); i++)
	{
		if (DefaultPickupItems[i].bAdd && DefaultPickupItems[i].Item != "" && DynamicLoadObject(DefaultPickupItems[i].Item, class'Class', True) != None)
			PrecacheItemsE[i] = DefaultPickupItems[i].Item;
	}
	
	for (i = 0; i < ArrayCount(StartingWeaponClassNames); i++)
	{
		if (StartingWeaponClassNames[i] != '')
			StartingWeaponCNames[StartingWeaponCNamesSize++] = StartingWeaponClassNames[i];
	}
	
	bProcessedPrecache = True;
}

simulated function ExecutePrecache()
{
local byte i;

	if (bPrecached || !bProcessedPrecache)
		return;

	for (i = 0; i < ArrayCount(PrecacheItemsA); i++)
	{
		if (PrecacheItemsA[i] != "")
			DynamicLoadObject(PrecacheItemsA[i], class'Class');
		if (PrecacheItemsB[i] != "")
			DynamicLoadObject(PrecacheItemsB[i], class'Class');
		if (PrecacheItemsC[i] != "")
			DynamicLoadObject(PrecacheItemsC[i], class'Class');
		if (PrecacheItemsD[i] != "")
			DynamicLoadObject(PrecacheItemsD[i], class'Class');
		if (PrecacheItemsE[i] != "")
			DynamicLoadObject(PrecacheItemsE[i], class'Class');
	}
	
	bPrecached = True;
	justPrecached = True;
}

simulated function SendLoadingMsg(PlayerPawn PP, optional bool bLoaded)
{
	if (PP != None && PP.myHUD != None)
	{
		if (bLoaded)
			PP.myHUD.LocalizedMessage(Class'NWLoadingStringPlus', 0, None, None, None, LoadedMsgStr);
		else
			PP.myHUD.LocalizedMessage(Class'NWLoadingStringPlus', 0, None, None, None, LoadingMsgStr);
	}
}

function class<Weapon> GetWeaponItemClass(byte i)
{
	if (i >= ArrayCount(WeaponItems) || !WeaponItems[i].bSwap || WeaponItems[i].NewItem == "" || WeaponItems[i].NewItem ~= "X")
		return None;
	return class<Weapon>(DynamicLoadObject(WeaponItems[i].NewItem, class'Class'));
}

function class<Ammo> GetAmmoItemClass(byte i)
{
	if (i >= ArrayCount(AmmoItems) || !AmmoItems[i].bSwap || AmmoItems[i].NewItem == "" || AmmoItems[i].NewItem ~= "X")
		return None;
	return class<Ammo>(DynamicLoadObject(AmmoItems[i].NewItem, class'Class'));
}

function class<Inventory> GetPickupItemClass(byte i)
{
	if (i >= ArrayCount(PickupItems) || !PickupItems[i].bSwap || PickupItems[i].NewItem == "" || PickupItems[i].NewItem ~= "X")
		return None;
	return class<Inventory>(DynamicLoadObject(PickupItems[i].NewItem, class'Class'));
}

function int GetWeaponItemsArraySize()
{
	return ArrayCount(WeaponItems);
}

function int GetAmmoItemsArraySize()
{
	return ArrayCount(AmmoItems);
}

function int GetPickupItemsArraySize()
{
	return ArrayCount(PickupItems);
}

function InitLists()
{
local int i;

	for (i = ArrayCount(WeaponItems) - 1; i >= 0; i--)
	{
		if (WeaponItems[i].bSwap && WeaponItems[i].ItemToReplace != "" && WeaponItems[i].NewItem != "")
		{
			WeaponItemsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(AmmoItems) - 1; i >= 0; i--)
	{
		if (AmmoItems[i].bSwap && AmmoItems[i].ItemToReplace != "" && AmmoItems[i].NewItem != "")
		{
			AmmoItemsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(PickupItems) - 1; i >= 0; i--)
	{
		if (PickupItems[i].bSwap && PickupItems[i].ItemToReplace != "" && PickupItems[i].NewItem != "")
		{
			PickupItemsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(DefaultWeaponItems) - 1; i >= 0; i--)
	{
		if (DefaultWeaponItems[i].bAdd && DefaultWeaponItems[i].Item != "")
		{
			DefaultWeaponItemsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(DefaultPickupItems) - 1; i >= 0; i--)
	{
		if (DefaultPickupItems[i].bAdd && DefaultPickupItems[i].Item != "")
		{
			DefaultPickupItemsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(WeaponItemSettings) - 1; i >= 0; i--)
	{
		if (WeaponItemSettings[i].Item != "")
		{
			WeaponItemSettingsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(AmmoItemSettings) - 1; i >= 0; i--)
	{
		if (AmmoItemSettings[i].Item != "")
		{
			AmmoItemSettingsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(PickupItemSettings) - 1; i >= 0; i--)
	{
		if (PickupItemSettings[i].Item != "")
		{
			PickupItemSettingsSize = i + 1;
			break;
		}
	}

	for (i = ArrayCount(WeaponItemsLockerSettings) - 1; i >= 0; i--)
	{
		if (WeaponItemsLockerSettings[i].Item != "")
		{
			WeaponItemsLockerSettingsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(AmmoItemsLockerSettings) - 1; i >= 0; i--)
	{
		if (AmmoItemsLockerSettings[i].Item != "")
		{
			AmmoItemsLockerSettingsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(PickupItemsLockerSettings) - 1; i >= 0; i--)
	{
		if (PickupItemsLockerSettings[i].Item != "")
		{
			PickupItemsLockerSettingsSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(UTWeaponPriorities) - 1; i >= 0; i--)
	{
		if (UTWeaponPriorities[i].ItemName != '')
		{
			UTWeaponPrioritiesSize = i + 1;
			break;
		}
	}

	for (i = ArrayCount(WeaponCustomChargers) - 1; i >= 0; i--)
	{
		if (WeaponCustomChargers[i].Item != "")
		{
			WeaponCustomChargersSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(AmmoCustomChargers) - 1; i >= 0; i--)
	{
		if (AmmoCustomChargers[i].Item != "")
		{
			AmmoCustomChargersSize = i + 1;
			break;
		}
	}
	
	for (i = ArrayCount(PickupCustomChargers) - 1; i >= 0; i--)
	{
		if (PickupCustomChargers[i].Item != "")
		{
			PickupCustomChargersSize = i + 1;
			break;
		}
	}
}

function LoadFilterData()
{
local Actor A, B;
local vector HitLocation, HitNormal, TraceEnd, TraceStart;
local vector v1, v2;
local float XMax, XMin, YMax, YMin;

	log("Loading level filtering data...", ReplacerLogName);
	ForEach AllActors(Class'Actor', A)
	{
		if ((NavigationPoint(A) != None && SpawnPoint(A) == None) || Inventory(A) != None)
		{
			//Get max height
			TraceStart = A.Location;
			TraceEnd = TraceStart + vect(0,0,65535);
			B = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, False);
			if (B == None)
				HitLocation = TraceEnd;
			maxMapHeight = FMax(maxMapHeight, VSize(HitLocation - TraceStart));
			
			//Get max size (step 1/2)
			XMax = FMax(XMax, A.Location.X);
			XMin = FMin(XMin, A.Location.X);
			YMax = FMax(YMax, A.Location.Y);
			YMin = FMin(YMin, A.Location.Y);
		}
		
		//Get number of playerstarts
		if (PlayerStart(A) != None)
			numPlayerStarts++;
			
		//Get number of liquid zones
		if (ZoneInfo(A) != None && ZoneInfo(A).bWaterZone)
			numLiquidZones++;
			
		//Get number of water zones
		if (WaterZone(A) != None)
			numWaterZones++;
			
		//Get number of lava zones
		if (LavaZone(A) != None)
			numLavaZones++;
		
		//Get number of slime zones
		if (SlimeZone(A) != None)
			numSlimeZones++;
			
		//Get number of damage zones
		if (ZoneInfo(A) != None && (ZoneInfo(A).DamagePerSec > 0 || ZoneInfo(A).bKillZone))
			numDamageZones++;
	}
	
	//Get max size (step 2/2)
	v1.X = XMax;
	v1.Y = YMax;
	v2.X = XMin;
	v2.Y = YMin;
	maxMapSize = VSize(v1 - v2);
	
	//Logs
	log("Max height: "$maxMapHeight, ReplacerLogName);
	log("Max size: "$maxMapSize, ReplacerLogName);
	log("Player starts/spawns: "$numPlayerStarts, ReplacerLogName);
	log("Total liquid zones: "$numLiquidZones, ReplacerLogName);
	log("Total water zones: "$numWaterZones, ReplacerLogName);
	log("Total lava zones: "$numLavaZones, ReplacerLogName);
	log("Total slime zones: "$numSlimeZones, ReplacerLogName);
	log("Total damage zones: "$numDamageZones, ReplacerLogName);
	log("Finishing...", ReplacerLogName);
}

function ModifyPlayer(Pawn Other)
{
local int i;
local class<Weapon> wClass;
local class<Inventory> iClass;
local Weapon W;

	if (isActive)
	{
		for (i = 0; i < DefaultWeaponItemsSize; i++)
		{
			if (DefaultWeaponItems[i].bAdd && DefaultWeaponItems[i].Item != "" && checkFilters(DefaultWeaponItems[i].Filters, Other))
			{
				wClass = class<Weapon>(DynamicLoadObject(DefaultWeaponItems[i].Item, class'Class'));
				if (wClass != None)
				{
					W = GiveWeaponByClass(i, Other, wClass, False, True);
					if (W != None && DefaultWeaponItems[i].AmmoAmount > 0 && W.AmmoType != None)
						W.AmmoType.AmmoAmount = Min(DefaultWeaponItems[i].AmmoAmount, W.AmmoType.MaxAmmo);
				}
			}
		}
		
		for (i = 0; i < DefaultPickupItemsSize; i++)
		{
			if (DefaultPickupItems[i].bAdd && DefaultPickupItems[i].Item != "" && checkFilters(DefaultPickupItems[i].Filters, Other))
			{
				iClass = class<Inventory>(DynamicLoadObject(DefaultPickupItems[i].Item, class'Class'));
				if (iClass != None)
					GivePickupByClass(i, Other, iClass);
			}
		}
	}
	
	if (NextMutator != None)
		NextMutator.ModifyPlayer(Other);
}

function class<Weapon> GetDefaultWeaponClass(byte i)
{
	if (i >= ArrayCount(DefaultWeaponItems) || !DefaultWeaponItems[i].bAdd || DefaultWeaponItems[i].Item == "")
		return None;
	return class<Weapon>(DynamicLoadObject(DefaultWeaponItems[i].Item, class'Class'));
}

function int GetDefaultWeaponsArraySize()
{
	return ArrayCount(DefaultWeaponItems);
}

function SetOptions(Actor Other)
{
	if (Other == None)
		return;
	SetPropertiesOptions(Other, getOptions(Other, getReplacedItemIndex(Other.Tag)));
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
local int i;
local bool hasReplacement;
local NWRepObj m;

	bSuperRelevant = 0;
	if (!isActive || Inventory(Other) == None)
		return True;
	if (isReplacedItem(Other.Tag))
	{
		SetOptions(Other);
		return True;
	}
	if (isDefaultItem(Other.Tag))
		return True;
	if (NaliWeapons(Other) != None && NaliWeapons(Other).denyReplacement)
		return True;
	if (NaliAmmo(Other) != None && NaliAmmo(Other).denyReplacement)
		return True;
	if (NaliPickups(Other) != None && NaliPickups(Other).denyReplacement)
		return True;

    if (Weapon(Other) != None)
	{
		CheckTrooper(Other.Instigator, Weapon(Other));
		for (i = 0; i < WeaponItemsSize; i++)
		{
			if (CheckListReplacement(Other, WeaponItems[i], i))
				return True;
			else if (isPotentiallyReplaced(Other, WeaponItems[i]))
				hasReplacement = True;
		}
	}
	else if (Ammo(Other) != None)
	{
		for (i = 0; i < AmmoItemsSize; i++)
		{
			if (CheckListReplacement(Other, AmmoItems[i], i))
				return True;
			else if (isPotentiallyReplaced(Other, AmmoItems[i]))
				hasReplacement = True;
		}
	}
	else if (Inventory(Other) != None)
	{
		for (i = 0; i < PickupItemsSize; i++)
		{
			if (CheckListReplacement(Other, PickupItems[i], i))
				return True;
			else if (isPotentiallyReplaced(Other, PickupItems[i]))
				hasReplacement = True;
		}
	}
	
	if (hasReplacement)
	{
		m = Spawn(Class'NWRepObj',,, Other.Location);
		m.SetEvalReplOnly(Inventory(Other), Self);
	}
	
    return True;
}

function bool isPotentiallyReplaced(Actor Other, RItem Item)
{
	return (Item.bSwap && Item.ItemToReplace != "" && Item.NewItem != "" && Item.NewItem ~= String(Other.Class));
}

function bool CheckListReplacement(Actor Other, RItem Item, int itemIndex)
{
local bool isMarkedToReplace;
local class cClass;
local NWRepObj m;

	if (Item.bSwap && Item.ItemToReplace != "" && Item.NewItem != "")
	{
		cClass = class<Actor>(DynamicLoadObject(Item.ItemToReplace, class'Class'));
		if (cClass != None && (Other.Class == cClass || (ClassIsChildOf(Other.Class, cClass) && Item.ReplaceSubClasses)))
		{
			if (Item.NewItem ~= Item.ItemToReplace)
			{
				Other.Tag = getReplacedItemTagName(itemIndex);
				return True;
			}
			
			if (Item.NewItem ~= "X")
			{
				if (Inventory(Other) != None)
				{
					m = Spawn(Class'NWRepObj',,, Other.Location);
					m.SetToDestroy(Inventory(Other), Self);
				}
				else
				{
					Other.Destroy();
					Other = None;
				}
			}
			else
			{
				if (!checkFilters(Item.Filters))
					return False;
				isMarkedToReplace = ReplaceWithX(itemIndex, Other, Item.NewItem, (Other.Class != cClass && ClassIsChildOf(Other.Class, cClass)), Item.ItemToReplace);
				if (isMarkedToReplace) 
				{
					Other.Destroy();
					Other = None;
				}
			}
			return True;
		}
	}
	return False;
}

function bool checkFilters(string Filters, optional Pawn Other)
{
local string data, iData;
local int i;
local bool isValidGM, isValidTeam;
local NWMutator NWM;
local int NWMOut;

	if (Filters == "")
		return True;
	
	//Custom filters
	NWM = Class'NWUtils'.static.getNWMutator(Level);
	if (NWM != None)
	{
		data = UtilsClass.static.getValueFromSettingsString("C", Filters);
		i = 0;
		while (data != "" && UtilsClass.static.hasValueFromStringList(data, i, iData))
		{
			NWMOut = NWM.checkFilters(iData, Filters, Other);
			if (NWMOut >= 0)
				return Bool(NWMOut);
			i++;
		}
	}
	iData = "";
	data = "";
	
	
	//Team filters
	if (Other != None && Other.PlayerReplicationInfo != None)
	{
		data = UtilsClass.static.getValueFromSettingsString("team", Filters);
		isValidTeam = (data == "");
		i = 0;
		while (data != "" && UtilsClass.static.hasValueFromStringList(data, i, iData))
		{
			if (UtilsClass.static.isInTeam(iData, Other))
			{
				isValidTeam = True;
				break;
			}
			i++;
		}
		if (!isValidTeam)
			return False;
		iData = "";
		data = "";
			
		data = UtilsClass.static.getValueFromSettingsString("noteam", Filters);
		i = 0;
		while (data != "" && UtilsClass.static.hasValueFromStringList(data, i, iData))
		{
			if (UtilsClass.static.isInTeam(iData, Other))
				return False;
			i++;
		}
		iData = "";
		data = "";
	}
	
	//Gametype filters
	data = UtilsClass.static.getValueFromSettingsString("game", Filters);
	isValidGM = (data == "");
	i = 0;
	while (data != "" && UtilsClass.static.hasValueFromStringList(data, i, iData))
	{
		if (UtilsClass.static.isLevelGametype(iData, Level))
		{
			isValidGM = True;
			break;
		}
		i++;
	}
	if (!isValidGM)
		return False;
	iData = "";
	data = "";
		
	data = UtilsClass.static.getValueFromSettingsString("nogame", Filters);
	i = 0;
	while (data != "" && UtilsClass.static.hasValueFromStringList(data, i, iData))
	{
		if (UtilsClass.static.isLevelGametype(iData, Level))
			return False;
		i++;
	}
	iData = "";
	data = "";
		
	
	//Map height filters
	data = UtilsClass.static.getValueFromSettingsString("minH", Filters);
	if (data != "" && maxMapHeight < Float(data))
		return False;
	data = UtilsClass.static.getValueFromSettingsString("maxH", Filters);
	if (data != "" && maxMapHeight > Float(data))
		return False;
		
	//Map size filters
	data = UtilsClass.static.getValueFromSettingsString("minS", Filters);
	if (data != "" && maxMapSize < Float(data))
		return False;
	data = UtilsClass.static.getValueFromSettingsString("maxS", Filters);
	if (data != "" && maxMapSize > Float(data))
		return False;
		
	//Playerstarts filters
	data = UtilsClass.static.getValueFromSettingsString("minP", Filters);
	if (data != "" && numPlayerStarts < Int(data))
		return False;
	data = UtilsClass.static.getValueFromSettingsString("maxP", Filters);
	if (data != "" && numPlayerStarts > Int(data))
		return False;
		
	//Liquid zones filters
	data = UtilsClass.static.getValueFromSettingsString("minLqZ", Filters);
	if (data != "" && numLiquidZones < Int(data))
		return False;
	data = UtilsClass.static.getValueFromSettingsString("maxLqZ", Filters);
	if (data != "" && numLiquidZones > Int(data))
		return False;
		
	//Damage zones filters
	data = UtilsClass.static.getValueFromSettingsString("minDmgZ", Filters);
	if (data != "" && numDamageZones < Int(data))
		return False;
	data = UtilsClass.static.getValueFromSettingsString("maxDmgZ", Filters);
	if (data != "" && numDamageZones > Int(data))
		return False;
	
	//Water zones filters
	data = UtilsClass.static.getValueFromSettingsString("minWtZ", Filters);
	if (data != "" && numWaterZones < Int(data))
		return False;
	data = UtilsClass.static.getValueFromSettingsString("maxWtZ", Filters);
	if (data != "" && numWaterZones > Int(data))
		return False;
		
	//Lava zones filters
	data = UtilsClass.static.getValueFromSettingsString("minLvZ", Filters);
	if (data != "" && numLavaZones < Int(data))
		return False;
	data = UtilsClass.static.getValueFromSettingsString("maxLvZ", Filters);
	if (data != "" && numLavaZones > Int(data))
		return False;
		
	//Slime zones filters
	data = UtilsClass.static.getValueFromSettingsString("minSlmZ", Filters);
	if (data != "" && numSlimeZones < Int(data))
		return False;
	data = UtilsClass.static.getValueFromSettingsString("maxSlmZ", Filters);
	if (data != "" && numSlimeZones > Int(data))
		return False;
		
	return True;
}



function bool ReplaceWithX(int itemIndex, actor Other, string aClassName, optional bool isSubClass, optional string theOriginalClass)
{
local NWRepObj m;
local class<NWRepObj> ReplClass;
local byte NOfRepeats;
local ItemSettings MSettings;
local byte i, lType;
local texture Tr, Tg, Tb;
local float dScale;
local int rRate;
local EChargerType CType;
local EMultiType MType;
local EGlobalChargerType GlobalCType;
local EGlobalMultiType GlobalMType;
local EGlobalTeamChargerSett GlobalTSett;
local bool hasCCustomInfo, bTeamFX;



	
	//Check if this actor is inventory and to be used right away
    if (Inventory(Other) != None && theOriginalClass != "")
	{
		//List type
		if (Weapon(Other) != None)
		{
			lType = 0;
			GlobalCType = GlobalWeaponChargerType;
			GlobalMType = GlobalWeaponMultiReplacementType;
			GlobalTSett = GlobalWeaponTeamChargerSett;
		}
		else if (Ammo(Other) != None)
		{
			lType = 1;
			GlobalCType = GlobalAmmoChargerType;
			GlobalMType = GlobalAmmoMultiReplacementType;
			GlobalTSett = GlobalAmmoTeamChargerSett;
		}
		else
		{
			lType = 2;
			GlobalCType = GlobalPickupChargerType;
			GlobalMType = GlobalPickupMultiReplacementType;
			GlobalTSett = GlobalPickupTeamChargerSett;
		}
		
		NOfRepeats = CountAndSort(lType, theOriginalClass, isSubClass);
		MSettings = getItemSettings(theOriginalClass, lType);
		if (NOfRepeats > 1 || MSettings.bKeepItem)
			ReplClass = Class'NWRepMulti';
		else
			ReplClass = Class'NWRepObj';
		
		if (GlobalCType == GCT_None)
			CType = RCT_None;
		else if (GlobalCType == GCT_Config)
			CType = MSettings.ChargerType;
		else if (GlobalCType == GCT_Charger1)
			CType = RCT_Charger1;
		else if (GlobalCType == GCT_Charger2)
			CType = RCT_Charger2;
			
		if (GlobalMType == GRMT_Config)
			MType = MSettings.MultiBehaviour;
		else if (GlobalMType == GRMT_Sequencial)
			MType = RMT_Sequencial;
		else if (GlobalMType == GRMT_RandomStatic)
			MType = RMT_RandomStatic;
		else if (GlobalMType == GRMT_RandomTimed)
			MType = RMT_RandomTimed;
		else if (GlobalMType == GRMT_Locker)
			MType = RMT_Locker;
			
		if (GlobalTSett == GTCS_Config)
			bTeamFX = MSettings.bTeamFX;
		else
			bTeamFX = (GlobalTSett == GTCS_EnableTeam);			
		
		hasCCustomInfo = (CType != RCT_None && getChargerCustomInfoDetails(theOriginalClass, Tr, Tg, Tb, dScale, rRate));
		if (!hasCCustomInfo)
			dScale = 1.0;
		m = Spawn(ReplClass,,, Other.Location);
		m.SetInitial(itemIndex, Inventory(Other), aClassName, Self, CType, MSettings.RespawnTime, MSettings.FXDefaultColor, bTeamFX, 
			MSettings.FXStyle, dScale, rRate);
		if (CType == RCT_Charger1 && hasCCustomInfo)
			m.SetCustomCharger(Tr, Tg, Tb);	
		if (NWRepMulti(m) != None)
		{
			if (NOfRepeats > 1)
			{
				for (i = 0; i < NOfRepeats; i++)
					NWRepMulti(m).SetListItem(class<Inventory>(DynamicLoadObject(TempItem[i], class'Class')), i, TempIndex[i]);
			}
			else
				NWRepMulti(m).SetListItem(class<Inventory>(DynamicLoadObject(aClassName, class'Class')), 0, TempIndex[0]);
			NWRepMulti(m).SetMultiInitial(NOfRepeats, MType, MSettings.bGiveAllToPawn, MSettings.bKeepItem);
		}
		return False;
	}
		
	//Make the actual replace
	return doReplace(itemIndex, Other, aClassName);
}

function SetPropertiesOptions(Actor A, string propertiesList)
{
local int i, j;
local string strProp, strVal;
local string jData;
local NWMutator NWM;

	if (A == None || propertiesList == "")
		return;
	
	i = 0;
	while (UtilsClass.static.hasPropertyFromStringList(propertiesList, i, strProp, strVal))
	{
		if (strProp ~= "C")
		{
			if (NWM == None)
				NWM = Class'NWUtils'.static.getNWMutator(Level);
			if (NWM != None)
			{
				j = 0;
				while (UtilsClass.static.hasValueFromStringList(strVal, j, jData))
				{
					NWM.SetPropertiesOptions(jData, A);
					j++;
				}
			}
		}
		else
			A.SetPropertyText(strProp, strVal);
		i++;
	}
	
	if (Weapon(A) != None)
		Weapon(A).SetWeaponStay();
}

function bool doReplace(int itemIndex, actor Other, string aClassName, optional out actor A)
{
local class<Actor> aClass;
local SkaarjTrooper st;
local NWTagActor NWT;

	//Check class
	if (Other == None || aClassName == "")
		return False;
    aClass = class<Actor>(DynamicLoadObject(aClassName, class'Class'));
    if (aClass == None)
		return False;
	A = Spawn(aClass, Other.Owner, getReplacedItemTagName(itemIndex), Other.Location, Other.Rotation);
	if (A != None)
    {
		SetPropertiesOptions(A, getOptions(A, itemIndex));
        A.Event = Other.Event;
		if (default.bKeepTriggerChainOnReplace)
		{
			NWT = Spawn(Class'NWTagActor',, Other.Tag, A.Location);
			NWT.TaggedActor = A;
		}
    }
	
	//Check inventory actors
    if (Inventory(Other) != None)
    {
        if (Inventory(Other).MyMarker != None)
        {
            Inventory(Other).MyMarker.markedItem = Inventory(A);
            if (Inventory(A) != None)
                Inventory(A).MyMarker = Inventory(Other).MyMarker;
            Inventory(Other).MyMarker = None;
        }
		A.SetLocation(A.Location + (A.CollisionHeight - Other.CollisionHeight) * vect(0,0,1));
		if (NaliPickups(A) != None)
			A.Move(NaliPickups(A).PlacementZOffset*vect(0,0,1));
		
		//Setup inventory
		if (Inventory(A) != None)
		{
			Inventory(A).bRotatingPickup = (Inventory(Other).bRotatingPickup || Inventory(Other).Physics == PHYS_Rotating);
			if (Inventory(A).bRotatingPickup || (NaliPickups(A) != None && NaliPickups(A).bForceRotatingPickupOnReplace))
			{
				Inventory(A).bFixedRotationDir = True;
				Inventory(A).RotationRate = Inventory(Other).RotationRate;
				Inventory(A).SetPhysics(PHYS_Rotating);
			}
			else
			{
				Inventory(A).bFixedRotationDir = Inventory(Other).bFixedRotationDir;
				Inventory(A).RotationRate = Inventory(Other).RotationRate;
				Inventory(A).SetPhysics(Inventory(Other).Physics);
			}
			A.bAlwaysRelevant = True;
			A.NetUpdateFrequency = 8;
		}
    }
	
	return True;
}

function string getOptions(Actor A, int i, optional bool bDefault)
{
	if (i < 0)
		return "";
	
	if (Weapon(A) != None)
	{
		if (bDefault)
		{
			if (i >= ArrayCount(DefaultWeaponItems))
				return "";
			return DefaultWeaponItems[i].Options;
		}
		
		if (i >= ArrayCount(WeaponItems))
			return "";
		return WeaponItems[i].Options;
	}
	else if (Ammo(A) != None)
	{
		if (i >= ArrayCount(AmmoItems))
			return "";
		return AmmoItems[i].Options;
	}
	else if (Inventory(A) != None)
	{
		if (bDefault)
		{
			if (i >= ArrayCount(DefaultPickupItems))
				return "";
			return DefaultPickupItems[i].Options;
		}
		
		if (i >= ArrayCount(PickupItems))
			return "";
		return PickupItems[i].Options;
	}
	return "";
}

function Weapon GiveWeaponByClass(int itemIndex, Pawn P, class<Weapon> WeaponClass, optional bool bMaxAmmo, optional bool bDefault)
{
local Weapon newWeapon, otherW;
local name wTag;
local byte evalStartW;
local bool bNeverSwitch;

	if (P == None || P.bDeleteMe || P.bHidden || P.Health <= 0)
		return None;
	if (WeaponClass == None)
		return None;
	newWeapon = Weapon(P.FindInventoryType(WeaponClass));
	if (newWeapon != None)
		return newWeapon;
		
	if (bDefault)
		wTag = getDefaultItemTagName(itemIndex);
	else
		wTag = getReplacedItemTagName(itemIndex);
	
	newWeapon = Spawn(WeaponClass,, wTag, P.Location);
	if (newWeapon != None)
	{
		bNeverSwitch = P.bNeverSwitchOnPickup;
		P.bNeverSwitchOnPickup = True;
		SetPropertiesOptions(newWeapon, getOptions(newWeapon, itemIndex, bDefault));
		newWeapon.RespawnTime = 0.0;
		newWeapon.GiveTo(P);
		newWeapon.bHeldItem = true;
		newWeapon.GiveAmmo(P);
		newWeapon.SetSwitchPriority(P);
		newWeapon.AmbientGlow = 0;
		
		evalStartW = evalStartingWeapon(newWeapon);
		if (evalStartW == 1 || ((evalStartW == 0 || PlayerPawn(P) == None) && (P.Weapon == None || isBestWeapon(P, newWeapon))))
		{
			newWeapon.GotoState('Idle');
			P.PendingWeapon = newWeapon;
			P.ChangedWeapon();
			if (P.Weapon != None)
				P.Weapon.PutDown();
		}

		if (bMaxAmmo && newWeapon.AmmoType != None)
			newWeapon.AmmoType.AmmoAmount = newWeapon.AmmoType.MaxAmmo;
		if (NaliWeapons(newWeapon) != None && NaliWeapons(newWeapon).enableModifiers)
			NaliWeapons(newWeapon).GiveModifier(NaliWeapons(newWeapon));
		ReorderPawnWeaponToLast(P, newWeapon);
		P.bNeverSwitchOnPickup = bNeverSwitch;
	}
	return newWeapon;
}

function byte evalStartingWeapon(Weapon W)
{
local byte i;

	if (W == None || StartingWeaponCNamesSize == 0)
		return 0;
	for (i = 0; i < StartingWeaponCNamesSize; i++)
	{
		if (W.IsA(StartingWeaponCNames[i]))
			return 1;
	}
	return 2;
}

function Inventory GivePickupByClass(int itemIndex, Pawn P, class<Inventory> InvClass)
{
local Inventory newInv, nInv;

	if (P == None || P.bDeleteMe || P.bHidden || P.Health <= 0)
		return None;
	if (InvClass == None)
		return None;

	newInv = P.FindInventoryType(InvClass);
	if (newInv != None)
		return newInv;
	
	newInv = Spawn(InvClass,, getDefaultItemTagName(itemIndex), P.Location);
	if (newInv != None)
	{
		newInv.Touch(P);
		if (!newInv.bDeleteMe && newInv.Owner != P)
		{
			newInv.Destroy();
			newInv = None;
		}
		
		nInv = P.FindInventoryType(InvClass);
		if (nInv != None)
			SetPropertiesOptions(nInv, getOptions(nInv, itemIndex, True));
		newInv = nInv;
	}
	return newInv;
}

function ReorderPawnWeaponToLast(Pawn P, Weapon W)
{
local Inventory Inv;
local Inventory InvWBefore, InvWLast;

	if (P == None || W == None || P.Inventory == None || P.Inventory.Inventory == None)
		return;

	for (Inv = P.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (InvWBefore == None && Inv.Inventory == W)
			InvWBefore = Inv;
		else if (Inv.Inventory == None)
			InvWLast = Inv;
	}
	
	if (InvWBefore != None)
		InvWBefore.Inventory = W.Inventory;
	else if (W.Inventory != None)
		P.Inventory = W.Inventory;
	else
		P.Inventory = W;
	W.Inventory = None;
	if (InvWLast != None && InvWLast != W)
		InvWLast.Inventory = W;
}

function bool isBestWeapon(Actor A, Weapon W)
{
local Inventory Inv;

	if (A == None || W == None)
		return False;
	
	for (Inv = A.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (Weapon(Inv) != None && Weapon(Inv).AutoSwitchPriority > W.AutoSwitchPriority)
			return False;
	}
	return True;
}

function CheckTrooper(Pawn P, Weapon W, optional class<Weapon> OriginalClass)
{
	if (SkaarjTrooper(P) == None || W == None || !default.bMHPawnWeaponsFix)
		return;
	W.bCanThrow = False;
	if (P.DropWhenKilled == None || P.DropWhenKilled == OriginalClass)
		P.DropWhenKilled = W.Class;
}

function byte CountAndSort(byte ItemType, string aItem, optional bool isSubClass)
{
local byte n, i;

	if (ItemType == 0)
	{
		for (i = 0; i < WeaponItemsSize; i++)
		{
			if (CheckCountAndSortItem(WeaponItems[i], aItem, isSubClass))
			{
				TempItem[n] = WeaponItems[i].NewItem;
				TempIndex[n] = i;
				n++;
			}
		}
	}
	else if (ItemType == 1)
	{
		for (i = 0; i < AmmoItemsSize; i++)
		{
			if (CheckCountAndSortItem(AmmoItems[i], aItem, isSubClass))
			{
				TempItem[n] = AmmoItems[i].NewItem;
				TempIndex[n] = i;
				n++;
			}
		}
	}
	else if (ItemType == 2)
	{
		for (i = 0; i < PickupItemsSize; i++)
		{
			if (CheckCountAndSortItem(PickupItems[i], aItem, isSubClass))
			{
				TempItem[n] = PickupItems[i].NewItem;
				TempIndex[n] = i;
				n++;
			}
		}
	}
	
	return n;
}

function bool CheckCountAndSortItem(RItem Item, string aItem, optional bool isSubClass)
{
	return (Item.bSwap && Item.ItemToReplace != "" && Item.NewItem != "" && Caps(Item.NewItem) != "X"
			&& Item.ItemToReplace ~= aItem && Caps(Item.ItemToReplace) != Caps(Item.NewItem)
			&& (!isSubClass || Item.ReplaceSubClasses) && class<Actor>(DynamicLoadObject(Item.NewItem, class'Class')) != None
			&& checkFilters(Item.Filters));
}

function ItemSettings getItemSettings(string ItemName, byte ItemType)
{
local byte i;
local ItemSettings M;

	if (ItemName == "")
		return M;
		
	if (ItemType == 0)
	{
		for (i = 0; i < WeaponItemSettingsSize; i++)
		{
			if (WeaponItemSettings[i].Item ~= ItemName)
				return WeaponItemSettings[i];
		}
	}
	else if (ItemType == 1)
	{
		for (i = 0; i < AmmoItemSettingsSize; i++)
		{
			if (AmmoItemSettings[i].Item ~= ItemName)
				return AmmoItemSettings[i];
		}
	}
	else if (ItemType == 2)
	{
		for (i = 0; i < PickupItemSettingsSize; i++)
		{
			if (PickupItemSettings[i].Item ~= ItemName)
				return PickupItemSettings[i];
		}
	}
	
	return M;
}

function getLockerItemPosSettings(string ItemName, byte ItemType, out byte RotationType, out float ZOffset)
{
local LockerPos LPos;

	LPos = getLockerSettings(ItemName, ItemType);
	RotationType = LPos.RotationType;
	ZOffset = LPos.ZOffset;
}

function LockerPos getLockerSettings(string ItemName, byte ItemType)
{
local LockerPos LPos;
local byte i;

	if (ItemName == "")
		return LPos;

	if (ItemType == 0)
	{
		for (i = 0; i < WeaponItemsLockerSettingsSize; i++)
		{
			if (WeaponItemsLockerSettings[i].Item ~= ItemName)
				return WeaponItemsLockerSettings[i];
		}
	}
	else if (ItemType == 1)
	{
		for (i = 0; i < AmmoItemsLockerSettingsSize; i++)
		{
			if (AmmoItemsLockerSettings[i].Item ~= ItemName)
				return AmmoItemsLockerSettings[i];
		}
	}
	else if (ItemType == 2)
	{
		for (i = 0; i < PickupItemsLockerSettingsSize; i++)
		{
			if (PickupItemsLockerSettings[i].Item ~= ItemName)
				return PickupItemsLockerSettings[i];
		}
	}
	
	return LPos;
}


function bool getChargerCustomInfoDetails(string ItemName, out texture TRed, out texture TGreen, out texture TBlue, out float DScale, out int RRate)
{
local ChargerCustomInfo CCInfo;
local byte LType, i;
local class<Actor> cClassInfo;
local texture T[3];
local string texStr[3];

	if (ItemName == "")
		return False;
	cClassInfo = class<Actor>(DynamicLoadObject(ItemName, class'Class'));
	if (cClassInfo == None)
		return False;
	else if (class<Weapon>(cClassInfo) != None)
		LType = 0;
	else if (class<Ammo>(cClassInfo) != None)
		LType = 1;
	else
		LType = 2;

	CCInfo = getChargerCustomInfo(ItemName, LType);
	if (CCInfo.Scale <= 0.0)
		return False;
	
	texStr[0] = CCInfo.Tex$"_R";
	texStr[1] = CCInfo.Tex$"_G";
	texStr[2] = CCInfo.Tex$"_B";
	for (i = 0; i < ArrayCount(texStr); i++)
	{
		T[i] = UtilsClass.static.loadTexture(texStr[i]);
		if (T[i] == None)
		{
			log("Failed to load custom charger texture "$texStr[i], ReplacerLogName);
			return False;
		}
	}
	
	TRed = T[0];
	TGreen = T[1];
	TBlue = T[2];
	DScale = CCInfo.Scale;
	RRate = CCInfo.RotRate;
	return True;
}

function ChargerCustomInfo getChargerCustomInfo(string ItemName, byte ItemType)
{
local ChargerCustomInfo CCInfo;
local int i;

	if (ItemName == "")
		return CCInfo;

	if (ItemType == 0)
	{
		for (i = 0; i < WeaponCustomChargersSize; i++)
		{
			if (WeaponCustomChargers[i].Item ~= ItemName)
				return WeaponCustomChargers[i];
		}
	}
	else if (ItemType == 1)
	{
		for (i = 0; i < AmmoCustomChargersSize; i++)
		{
			if (AmmoCustomChargers[i].Item ~= ItemName)
				return AmmoCustomChargers[i];
		}
	}
	else if (ItemType == 2)
	{
		for (i = 0; i < PickupCustomChargersSize; i++)
		{
			if (PickupCustomChargers[i].Item ~= ItemName)
				return PickupCustomChargers[i];
		}
	}
	
	return CCInfo;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Weapon priorities stuff (client and server)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
simulated function Tick(float Delta)
{
local PlayerPawn PP;

	if (!isActive)
		return;

	if (Role == ROLE_Authority && !bProcessedWPriorities)
	{
		ProcessWeaponPriorities();
		bProcessedWPriorities = True;
	}
	
	if (!bPrecached && Level.NetMode != NM_DedicatedServer && replPrecacheWaitTime > 0.0)
	{
		clientPrecacheWaitCount += Delta;
		if (clientPrecacheWaitCount >= replPrecacheWaitTime)
			ExecutePrecache();
		else if ((clientPrecacheWaitCount + Delta*3) >= replPrecacheWaitTime)
		{
			if (ClientPP == None)
			{
				Foreach AllActors(Class'PlayerPawn', PP)
				{
					if (Viewport(PP.Player) != None)
					{
						ClientPP = PP;
						break;
					}
				}
			}
			SendLoadingMsg(ClientPP);
		}
	}
	else if (justPrecached)
	{
		SendLoadingMsg(ClientPP, True);
		justPrecached = False;
	}
	
	if (Level.NetMode != NM_DedicatedServer && default.enableWeaponPrioritiesProcessor && !bWPInfoProcessed)
	{
		if (!bHUDMutator)
			RegisterHUDMutator();

		if (playerPawnInitRenderTimeout > 0 && ClientPP == None)
		{
			playerPawnInitRenderTimeout -= Delta;
			if (playerPawnInitRenderTimeout <= 0.0)
			{
				log("Unable to initialize"@Self@"through PostRender, please check if none of your UT currently installed mods, mutators or admin managers are breaking the HUD mutator chain", ReplacerLogName);
				log("Passing to alternate check...", ReplacerLogName);
				Foreach AllActors(Class'PlayerPawn', PP)
				{
					if (Viewport(PP.Player) != None)
					{
						ClientPP = PP;
						break;
					}
				}
				
				if (ClientPP != None)
					log("Client found successfully (alternate), processing...", ReplacerLogName);
				else
					log("WTF? Client NOT found!", ReplacerLogName);
			}
		}
		
		ManageWeaponPriorities(ClientPP);
	}
}

simulated function PostRender(canvas Canvas)
{
	if (isActive && ClientPP == None)
	{
		ClientPP = Canvas.Viewport.Actor;
		playerPawnInitRenderTimeout = 0.0;
		if (ClientPP != None)
			log("Client found successfully, processing...", ReplacerLogName);
	}

	if (NextHUDMutator != None)
		NextHUDMutator.PostRender(Canvas);
}

simulated function ManageWeaponPriorities(PlayerPawn POwner)
{
local int i, leftOversMax, WPInfoSize;
local name leftOvers[50];

	if (POwner != None && WPInfo[0].ItemName != '')
	{
		leftOversMax = -1;
		for (i = 0; i < ArrayCount(POwner.WeaponPriority); i++)
		{
			if (!isInWPList(POwner.WeaponPriority[i]))
			{
				leftOversMax++;
				if (leftOversMax >= ArrayCount(leftOvers))
				{
					leftOversMax = ArrayCount(leftOvers) - 1;
					break;
				}
				leftOvers[leftOversMax] = POwner.WeaponPriority[i];
			}
		}
		
		WPInfoSize = ArrayCount(WPInfo);
		for (i = 0; i < ArrayCount(WPInfo); i++)
		{
			if (WPInfo[i].ItemName == '')
			{
				WPInfoSize = i;
				break;
			}
		}
		
		for (i = 0; i < ArrayCount(POwner.WeaponPriority); i++)
		{
			if (i < WPInfoSize)
				POwner.WeaponPriority[i] = WPInfo[i].ItemName;
			else if ((i - WPInfoSize) <= leftOversMax)
				POwner.WeaponPriority[i] = leftOvers[i-WPInfoSize];
			else
				POwner.WeaponPriority[i] = '';
			POwner.default.WeaponPriority[i] = POwner.WeaponPriority[i];
		}
		
		POwner.SaveConfig();
		bWPInfoProcessed = True;
		
		log("Client weapon priority list setup OK", ReplacerLogName);
	}
}

function ProcessWeaponPriorities()
{
local byte i;
local class<Weapon> wClass;

	for (i = 0; i < UTWeaponPrioritiesSize; i++)
	{
		if (UTWeaponPriorities[i].ItemName != '')
			AddToWPList(UTWeaponPriorities[i].ItemName, UTWeaponPriorities[i].Priority);
	}
	
	for (i = 0; i < DefaultWeaponItemsSize; i++)
	{
		if (DefaultWeaponItems[i].bAdd && DefaultWeaponItems[i].Item != "" && checkFilters(DefaultWeaponItems[i].Filters))
		{
			wClass = class<Weapon>(DynamicLoadObject(DefaultWeaponItems[i].Item, class'Class'));
			if (wClass != None)
				AddToWPList(wClass.Name, wClass.default.AutoSwitchPriority);
		}
	}

	for (i = 0; i < WeaponItemsSize; i++)
	{
		if (WeaponItems[i].bSwap && WeaponItems[i].ItemToReplace != "" && WeaponItems[i].NewItem != "" && Caps(WeaponItems[i].NewItem) != "X" && checkFilters(WeaponItems[i].Filters))
		{
			wClass = class<Weapon>(DynamicLoadObject(WeaponItems[i].ItemToReplace, class'Class'));
			if (wClass != None)
				AddToWPList(wClass.Name, wClass.default.AutoSwitchPriority);
			wClass = class<Weapon>(DynamicLoadObject(WeaponItems[i].NewItem, class'Class'));
			if (wClass != None)
				AddToWPList(wClass.Name, wClass.default.AutoSwitchPriority);
		}
	}
}

simulated function AddToWPList(name newItem, byte newPriority, optional bool bFirst)
{
local int i, j, insertIndex, WPListSize;
local bool canInsert;

	if (newItem == '' || isInWPList(newItem))
		return;
		
	WPListSize = ArrayCount(WPInfo);
	for (i = 0; i < ArrayCount(WPInfo); i++)
	{
		if (WPInfo[i].ItemName == '')
		{
			WPListSize = i + 1;
			break;
		}
	}

	for (i = 0; i < WPListSize; i++)
	{
		if (WPInfo[i].Priority >= newPriority || WPInfo[i].ItemName == '')
		{
			if (bFirst || WPInfo[i].ItemName == '')
			{
				insertIndex = i;
				canInsert = True;
			}
			else
			{
				for (j = i; j < WPListSize; j++)
				{
					if (WPInfo[j].Priority > newPriority || WPInfo[j].ItemName == '')
					{
						insertIndex = j;
						canInsert = True;
						break;
					}
				}
			}
			
			if (!canInsert)
				return;
				
			if (WPInfo[insertIndex].ItemName != '')
			{
				for (j = WPListSize - 1; j >= insertIndex; j--)
				{
					if (j + 1 < ArrayCount(WPInfo))
						WPInfo[j+1] = WPInfo[j];
				}
			}

			WPInfo[insertIndex].ItemName = newItem;
			WPInfo[insertIndex].Priority = newPriority;
			return;
		}
	}
}

simulated function bool isInWPList(name Item)
{
local byte i;

	for (i = 0; i < ArrayCount(WPInfo); i++)
	{
		if (Item == WPInfo[i].ItemName)
			return True;
		else if (WPInfo[i].ItemName == '')
			return False;
	}
	return False;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Static functions
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static function bool StaticIsSwapWeapon(string classStr, optional out int foundIndex)
{
local byte i;

	foundIndex = -1;
	for (i = 0; i < ArrayCount(default.WeaponItems); i++)
	{
		if (default.WeaponItems[i].NewItem ~= classStr && default.WeaponItems[i].ItemToReplace != "")
		{
			foundIndex = i;
			return default.WeaponItems[i].bSwap;
		}
	}
	return False;
}

static function bool StaticIsSwapPickup(string classStr, optional out int foundIndex)
{
local byte i;

	foundIndex = -1;
	for (i = 0; i < ArrayCount(default.PickupItems); i++)
	{
		if (default.PickupItems[i].NewItem ~= classStr && default.PickupItems[i].ItemToReplace != "")
		{
			foundIndex = i;
			return default.PickupItems[i].bSwap;
		}
	}
	return False;
}

static function bool StaticIsDefaultWeapon(string classStr, optional out int foundIndex)
{
local byte i;

	foundIndex = -1;
	for (i = 0; i < ArrayCount(default.DefaultWeaponItems); i++)
	{
		if (default.DefaultWeaponItems[i].Item ~= classStr)
		{
			foundIndex = i;
			return default.DefaultWeaponItems[i].bAdd;
		}
	}
	return False;
}


static function bool StaticProcessWeaponReplacementAdd(string toClassStr, string fromClassStr, optional bool bReplSubclasses, optional string Filters,
optional string fromClassStr2, optional string fromClassStr3, optional string fromClassStr4, optional string isDefaultStr)
{
local byte i, j, k, processedN, extraIndex;
local class<Weapon> WClass, WReplClass, ExtraReplWClass[3], CurWReplClass;
local string ExtraReplClassStr[3];
local bool hasExtra;
local int foundIndex;

	WClass = class<Weapon>(DynamicLoadObject(toClassStr, class'Class', True));
	WReplClass = class<Weapon>(DynamicLoadObject(fromClassStr, class'Class', True));
	if (WClass == None || WReplClass == None)
		return False;
		
	ExtraReplClassStr[0] = fromClassStr2;
	ExtraReplClassStr[1] = fromClassStr3;
	ExtraReplClassStr[2] = fromClassStr4;
	hasExtra = False;
	for (i = 0; i < ArrayCount(ExtraReplWClass); i++)
	{
		if (ExtraReplClassStr[i] != "")
		{
			ExtraReplWClass[i] = class<Weapon>(DynamicLoadObject(ExtraReplClassStr[i], class'Class', True));
			hasExtra = (ExtraReplWClass[i] != None || hasExtra);
		}
	}
	
	if (Bool(isDefaultStr))
	{
		StaticIsDefaultWeapon(toClassStr, foundIndex);
		if (foundIndex < 0)
			StaticProcessWeaponDefaultAdd(toClassStr, Filters);
	}
		
	for (i = 0; i < ArrayCount(default.WeaponItems); i++)
	{
		if (default.WeaponItems[i].ItemToReplace == "")
		{
			CurWReplClass = None;
			default.WeaponItems[i].bSwap = True;
			default.WeaponItems[i].NewItem = toClassStr;
			default.WeaponItems[i].ReplaceSubClasses = bReplSubclasses;
			default.WeaponItems[i].Filters = Filters;
			if (processedN > 0)
			{
				hasExtra = False;
				for (j = extraIndex; j < ArrayCount(ExtraReplWClass); j++)
				{
					extraIndex++;
					if (ExtraReplWClass[j] != None)
					{
						default.WeaponItems[i].ItemToReplace = ExtraReplClassStr[j];
						CurWReplClass = ExtraReplWClass[j];
						for (k = extraIndex; k < ArrayCount(ExtraReplWClass); k++)
						{
							hasExtra = (ExtraReplWClass[k] != None);
							if (hasExtra)
								break;
						}
						break;
					}
				}
			}
			else
			{
				default.WeaponItems[i].ItemToReplace = fromClassStr;
				CurWReplClass = WReplClass;
			}
			
			if (CurWReplClass != None && WClass.default.AmmoName != None && CurWReplClass.default.AmmoName != None)
			{
				for (j = 0; j < ArrayCount(default.AmmoItems); j++)
				{
					if (default.AmmoItems[j].NewItem == String(WClass.default.AmmoName) && default.AmmoItems[j].ItemToReplace == String(CurWReplClass.default.AmmoName))
						break;
					else if (default.AmmoItems[j].ItemToReplace == "")
					{
						default.AmmoItems[j].bSwap = True;
						default.AmmoItems[j].NewItem = String(WClass.default.AmmoName);
						default.AmmoItems[j].ItemToReplace = String(CurWReplClass.default.AmmoName);
						default.AmmoItems[j].ReplaceSubClasses = False;
						default.AmmoItems[j].Filters = Filters;
						break;
					}
				}
			}
			
			processedN++;
			if (!hasExtra || processedN > (ArrayCount(ExtraReplWClass)+1) || extraIndex > ArrayCount(ExtraReplWClass))
				break;
		}
	}
	
	if (processedN > 0)
	{
		StaticSaveConfig();
		return True;
	}
	return False;
}

static function bool StaticProcessWeaponDefaultAdd(string weapClassStr, optional string Filters)
{
local byte i;
local class<Weapon> WClass;

	WClass = class<Weapon>(DynamicLoadObject(weapClassStr, class'Class', True));
	if (WClass == None)
		return False;
		
	for (i = 0; i < ArrayCount(default.DefaultWeaponItems); i++)
	{
		if (default.DefaultWeaponItems[i].Item == "")
		{
			default.DefaultWeaponItems[i].bAdd = True;
			default.DefaultWeaponItems[i].Item = String(WClass);
			default.DefaultWeaponItems[i].Filters = Filters;
			default.DefaultWeaponItems[i].AmmoAmount = 0;
			StaticSaveConfig();
			return True;
		}
	}
	return False;
}

static function bool StaticProcessPickupReplacementAdd(string toClassStr, string fromClassStr, optional bool bReplSubclasses, optional string Filters,
optional string fromClassStr2, optional string fromClassStr3, optional string fromClassStr4, optional string fromClassStr5)
{
local byte i, j, k, processedN, extraIndex;
local class<Inventory> IClass, IReplClass, ExtraReplIClass[4];
local string ExtraReplClassStr[4];
local bool hasExtra;
local int foundIndex;

	IClass = class<Inventory>(DynamicLoadObject(toClassStr, class'Class', True));
	IReplClass = class<Inventory>(DynamicLoadObject(fromClassStr, class'Class', True));
	if (IClass == None || IReplClass == None)
		return False;
		
	ExtraReplClassStr[0] = fromClassStr2;
	ExtraReplClassStr[1] = fromClassStr3;
	ExtraReplClassStr[2] = fromClassStr4;
	ExtraReplClassStr[3] = fromClassStr5;
	hasExtra = False;
	for (i = 0; i < ArrayCount(ExtraReplIClass); i++)
	{
		if (ExtraReplClassStr[i] != "")
		{
			ExtraReplIClass[i] = class<Inventory>(DynamicLoadObject(ExtraReplClassStr[i], class'Class', True));
			hasExtra = (ExtraReplIClass[i] != None || hasExtra);
		}
	}
		
	for (i = 0; i < ArrayCount(default.PickupItems); i++)
	{
		if (default.PickupItems[i].ItemToReplace == "")
		{
			default.PickupItems[i].bSwap = True;
			default.PickupItems[i].NewItem = toClassStr;
			default.PickupItems[i].ReplaceSubClasses = bReplSubclasses;
			default.PickupItems[i].Filters = Filters;
			if (processedN > 0)
			{
				hasExtra = False;
				for (j = extraIndex; j < ArrayCount(ExtraReplIClass); j++)
				{
					extraIndex++;
					if (ExtraReplIClass[j] != None)
					{
						default.PickupItems[i].ItemToReplace = ExtraReplClassStr[j];
						for (k = extraIndex; k < ArrayCount(ExtraReplIClass); k++)
						{
							hasExtra = (ExtraReplIClass[k] != None);
							if (hasExtra)
								break;
						}
						break;
					}
				}
			}
			else
				default.PickupItems[i].ItemToReplace = fromClassStr;
			
			processedN++;
			if (!hasExtra || processedN > (ArrayCount(ExtraReplIClass)+1) || extraIndex > ArrayCount(ExtraReplIClass))
				break;
		}
	}
	
	if (processedN > 0)
	{
		StaticSaveConfig();
		return True;
	}
	return False;
}


static function bool StaticProcessWeaponSwap(string classSwap, bool bSwap)
{
local byte i;
local class<Weapon> WClass;
local bool foundSwap;

	WClass = class<Weapon>(DynamicLoadObject(classSwap, class'Class', True));
	if (WClass == None)
		return False;

	for (i = 0; i < ArrayCount(default.WeaponItems); i++)
	{
		if (default.WeaponItems[i].NewItem ~= classSwap)
		{
			default.WeaponItems[i].bSwap = bSwap;
			foundSwap = True;
		}
	}
	
	if (foundSwap && WClass.default.AmmoName != None)
	{
		for (i = 0; i < ArrayCount(default.AmmoItems); i++)
		{
			if (default.AmmoItems[i].NewItem ~= String(WClass.default.AmmoName))
				default.AmmoItems[i].bSwap = bSwap;
		}
	}
	
	if (foundSwap)
		StaticSaveConfig();
	return foundSwap;
}

static function bool StaticProcessPickupSwap(string classSwap, bool bSwap)
{
local byte i;
local class<Inventory> IClass;
local bool foundSwap;

	IClass = class<Inventory>(DynamicLoadObject(classSwap, class'Class', True));
	if (IClass == None)
		return False;

	for (i = 0; i < ArrayCount(default.PickupItems); i++)
	{
		if (default.PickupItems[i].NewItem ~= classSwap)
		{
			default.PickupItems[i].bSwap = bSwap;
			foundSwap = True;
		}
	}
	
	if (foundSwap)
		StaticSaveConfig();
	return foundSwap;
}

static function bool StaticProcessDefaultWeaponToggle(string classDef, bool bAdd)
{
local byte i;
local class<Weapon> WClass;
local bool foundSwap;

	WClass = class<Weapon>(DynamicLoadObject(classDef, class'Class', True));
	if (WClass == None)
		return False;

	for (i = 0; i < ArrayCount(default.DefaultWeaponItems); i++)
	{
		if (default.DefaultWeaponItems[i].Item ~= classDef)
		{
			default.DefaultWeaponItems[i].bAdd = bAdd;
			foundSwap = True;
		}
	}
	
	if (foundSwap)
		StaticSaveConfig();
	return foundSwap;
}

static function EGlobalChargerType GetChargerTypeFromByte(byte n)
{
	if (n == 0)		return EGlobalChargerType.GCT_None;
	if (n == 1)		return EGlobalChargerType.GCT_Config;
	if (n == 2)		return EGlobalChargerType.GCT_Charger1;
	if (n == 3)		return EGlobalChargerType.GCT_Charger2;
	return EGlobalChargerType.GCT_None;
}

static function EGlobalMultiType GetMultiTypeFromByte(byte n)
{
	if (n == 0)		return EGlobalMultiType.GRMT_Config;
	if (n == 1)		return EGlobalMultiType.GRMT_Sequencial;
	if (n == 2)		return EGlobalMultiType.GRMT_RandomStatic;
	if (n == 3)		return EGlobalMultiType.GRMT_RandomTimed;
	if (n == 4)		return EGlobalMultiType.GRMT_Locker;
	return EGlobalMultiType.GRMT_Config;
}

static function EGlobalTeamChargerSett GetTeamChargerSettFromByte(byte n)
{
	if (n == 0)		return EGlobalTeamChargerSett.GTCS_Config;
	if (n == 1)		return EGlobalTeamChargerSett.GTCS_EnableTeam;
	if (n == 2)		return EGlobalTeamChargerSett.GTCS_DisableTeam;
	return EGlobalTeamChargerSett.GTCS_Config;
}


defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	bAlwaysTick=True
	playerPawnInitRenderTimeout=2.000000
	ReplacerLogName=NWReplacer
	ReplacedInventoryTag=NW_REPLACED_INVENTORY
	DefaultInventoryTag=NW_DEFAULT_INVENTORY
	UtilsClass=Class'NWUtils'
	LoadingMsgStr="Loading remaining assets, please wait..."
	LoadedMsgStr="All assets loaded successfully!"
	isActive=True
	
	ClientPrecacheWaitTime=3.000000
}