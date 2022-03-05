//////////////////////////////////////////////////////////////
//	Nali Weapons III MH mutator class
//				Feralidragon (14-10-2012)
//
// NW3 MONSTERHUNT EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMHMut expands Mutator config(NWExtrasCfg);

#exec AUDIO IMPORT NAME="Rwrd1" FILE=SOUNDS\Rwrd1.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="Rwrd2" FILE=SOUNDS\Rwrd2.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="Rwrd3" FILE=SOUNDS\Rwrd3.wav GROUP="MHRewards"

#exec AUDIO IMPORT NAME="RwrdRand01" FILE=SOUNDS\RwrdRand01.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand02" FILE=SOUNDS\RwrdRand02.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand03" FILE=SOUNDS\RwrdRand03.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand04" FILE=SOUNDS\RwrdRand04.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand05" FILE=SOUNDS\RwrdRand05.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand06" FILE=SOUNDS\RwrdRand06.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand07" FILE=SOUNDS\RwrdRand07.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand08" FILE=SOUNDS\RwrdRand08.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand09" FILE=SOUNDS\RwrdRand09.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand10" FILE=SOUNDS\RwrdRand10.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand11" FILE=SOUNDS\RwrdRand11.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand12" FILE=SOUNDS\RwrdRand12.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand13" FILE=SOUNDS\RwrdRand13.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand14" FILE=SOUNDS\RwrdRand14.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand15" FILE=SOUNDS\RwrdRand15.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand16" FILE=SOUNDS\RwrdRand16.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand17" FILE=SOUNDS\RwrdRand17.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand18" FILE=SOUNDS\RwrdRand18.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand19" FILE=SOUNDS\RwrdRand19.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand20" FILE=SOUNDS\RwrdRand20.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand21" FILE=SOUNDS\RwrdRand21.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand22" FILE=SOUNDS\RwrdRand22.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand23" FILE=SOUNDS\RwrdRand23.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand24" FILE=SOUNDS\RwrdRand24.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand25" FILE=SOUNDS\RwrdRand25.wav GROUP="MHRewards"
#exec AUDIO IMPORT NAME="RwrdRand26" FILE=SOUNDS\RwrdRand26.wav GROUP="MHRewards"



var() config int StartingHealth;
var() config int HealthRegenPerSec, MaxRegenHealth;
var() config bool bRegenHealthUnderwater;

var() config int AmmoRegenPerSec;
var() config float AmmoRegenMaxPercentage;
var() config float StartingAmmoMultiplier, PickupAmmoMultiplier, MaxAmmoMultiplier;

var() config bool enableRandomRewards;
var() config int RandomRewardsTimeIntervalSeconds;
var() config float FullAmmoRewardWeight, AllWeaponsRewardWeight;
var() config string AllWeapons[64];
var class<Weapon> AllWeaponsClass[64];

var() config name SuperAmmoClasses[16];
var() config name SuperWeaponClasses[16];

struct AmmoRegen
{
	var() name AmmoClass;
	var() float PickupAmmoMultiplier;
	var() float MaxAmmoMultiplier;
	var() int AmmoRegenPerSec;
	var() float AmmoRegenMaxPercentage;
};
var() config AmmoRegen AmmoRegenSettings[64];

struct WeaponRegen
{
	var() name WeaponClass;
	var() float StartingAmmoMultiplier;
};
var() config WeaponRegen WeaponRegenSettings[64];

struct Reward
{
	var() float Weight;
	var() string Item;
	var() bool bAllPlayers;
	var class<Inventory> ItemClass;
};
var() config Reward RewardsList[64];
var() config string RewardSounds[32], RewardCountdownSounds[3];
var sound RwSounds[32], RwCountdownSnds[3];
var float RandomRewardsMaxWeight, TotalRandomRewardsMaxWeight;
var byte MaxRewardSounds, MaxWeapons;
var int RewardSecCountdown;

var() config byte RandomWeaponsOnStartup;

var() globalconfig float ClientPrecacheWaitTime;
var() localized string LoadingMsgStr, LoadedMsgStr;
var string PrecacheItems[64], PrecacheSounds[32];
var bool bProcessedPrecache, bPrecached, justPrecached;
var float clientPrecacheWaitCount, replPrecacheWaitTime;
var PlayerPawn ClientPP;

var NWReplacer ReplacerMut;


replication
{
	reliable if (Role == ROLE_Authority)
		PrecacheItems, PrecacheSounds, bProcessedPrecache, replPrecacheWaitTime;
}

function BeginPlay()
{
local byte i, j;
local sound S;
local class<Weapon> WClass;

	if (AmmoRegenMaxPercentage > 1.0)
		AmmoRegenMaxPercentage /= 100;
	for (i = 0; i < ArrayCount(AmmoRegenSettings); i++)
	{
		if (AmmoRegenSettings[i].AmmoRegenMaxPercentage > 1.0)
			AmmoRegenSettings[i].AmmoRegenMaxPercentage /= 100;
	}
		
	if (enableRandomRewards)
	{
		if (RandomRewardsTimeIntervalSeconds < 10)
			RandomRewardsTimeIntervalSeconds = 10;
		RewardSecCountdown = RandomRewardsTimeIntervalSeconds;
	
		j = 0;
		for (i = 0; i < ArrayCount(RewardSounds); i++)
		{
			if (RewardSounds[i] != "")
			{
				S = Sound(DynamicLoadObject(RewardSounds[i], class'Sound'));
				if (S != None)
					RwSounds[j++] = S;
			}
		}
		MaxRewardSounds = j;
		
		for (i = 0; i < ArrayCount(RewardCountdownSounds); i++)
		{
			if (RewardCountdownSounds[i] != "")
				RwCountdownSnds[i] = Sound(DynamicLoadObject(RewardCountdownSounds[i], class'Sound'));
		}
		
		for (i = 0; i < ArrayCount(RewardsList); i++)
		{
			if (RewardsList[i].Item != "")
				RewardsList[i].ItemClass = class<Inventory>(DynamicLoadObject(RewardsList[i].Item, class'Class'));
			if (RewardsList[i].ItemClass == None)
				RewardsList[i].Weight = 0.0;
			RandomRewardsMaxWeight += RewardsList[i].Weight;
			RewardsList[i].Weight = RandomRewardsMaxWeight;
		}
		
		j = 0;
		if (AllWeaponsRewardWeight > 0.0)
		{
			for (i = 0; i < ArrayCount(AllWeapons); i++)
			{
				if (AllWeapons[i] != "")
				{
					WClass = class<Weapon>(DynamicLoadObject(AllWeapons[i], class'Class'));
					if (WClass != None)
						AllWeaponsClass[j++] = WClass;
				}
			}
		}
		MaxWeapons = j;
		TotalRandomRewardsMaxWeight = RandomRewardsMaxWeight + FullAmmoRewardWeight + AllWeaponsRewardWeight;
	}

	ProcessPrecache();
	ExecutePrecache();
	if (Level.NetMode != NM_StandAlone)
		replPrecacheWaitTime = default.ClientPrecacheWaitTime;
	SetTimer(1.0, True);
}

function ProcessPrecache()
{
local byte i;

	for (i = 0; i < ArrayCount(RewardsList); i++)
	{
		if (RewardsList[i].Item != "" && DynamicLoadObject(RewardsList[i].Item, class'Class', True) != None)
			PrecacheItems[i] = RewardsList[i].Item;
	}
	
	for (i = 0; i < ArrayCount(RewardSounds); i++)
	{
		if (RewardSounds[i] != "" && DynamicLoadObject(RewardSounds[i], class'Sound', True) != None)
			PrecacheSounds[i] = RewardSounds[i];
	}
	
	bProcessedPrecache = True;
}

simulated function ExecutePrecache()
{
local byte i;

	if (bPrecached || !bProcessedPrecache)
		return;
		
	for (i = 0; i < ArrayCount(PrecacheItems); i++)
	{
		if (PrecacheItems[i] != "")
			DynamicLoadObject(PrecacheItems[i], class'Class');
	}
	
	for (i = 0; i < ArrayCount(PrecacheSounds); i++)
	{
		if (PrecacheSounds[i] != "")
			DynamicLoadObject(PrecacheSounds[i], class'Sound');
	}
	
	bPrecached = True;
	justPrecached = True;
}

simulated function Tick(float Delta)
{
local PlayerPawn PP;
	
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

function Timer()
{
local PlayerPawn PP;
local Bot B;
local Mutator M;

	if (ReplacerMut == None)
	{
		for (M = Level.Game.BaseMutator; M != None; M = M.NextMutator)
		{
			if (NWReplacer(M) != None)
			{
				ReplacerMut = NWReplacer(M);
				break;
			}
		}
	}

	ForEach AllActors(Class'PlayerPawn', PP)
		ManagePlayer(PP);
	ForEach AllActors(Class'Bot', B)
		ManagePlayer(B);
		
	if (enableRandomRewards)
	{
		RewardSecCountdown--;
		if (RewardSecCountdown > 0 && RewardSecCountdown <= ArrayCount(RwCountdownSnds))
		{
			if (GetRandomPlayer() != None)
			{
				BroadcastSound(RwCountdownSnds[RewardSecCountdown-1]);
				BroadcastMessage(RewardSecCountdown, False, 'CriticalEvent');
			}
			else
				RewardSecCountdown = RandomRewardsTimeIntervalSeconds;
		}
		else if (RewardSecCountdown <= 0)
		{
			RewardSecCountdown = RandomRewardsTimeIntervalSeconds;
			ProcessRandomReward();
		}
	}
}

function BroadcastSound(sound S)
{
local PlayerPawn PP;

	if (S == None)
		return;
	ForEach AllActors(Class'PlayerPawn', PP)
		PP.ClientPlaySound(S);
}

function ProcessRandomReward()
{
local float RndRw;
local Inventory Inv;
local Pawn P;
local PlayerPawn PP;
local Bot B;
local byte i;

	BroadcastSound(RwSounds[Rand(MaxRewardSounds)]);

	RndRw = FRand()*TotalRandomRewardsMaxWeight;
	if (RndRw < RandomRewardsMaxWeight)
	{
		for (i = 0; i < ArrayCount(RewardsList); i++)
		{
			if (RndRw < RewardsList[i].Weight && RewardsList[i].ItemClass != None)
			{
				if (RewardsList[i].bAllPlayers)
				{
					ForEach AllActors(Class'PlayerPawn', PP)
						GiveReward(PP, RewardsList[i].ItemClass);
					ForEach AllActors(Class'Bot', B)
						GiveReward(B, RewardsList[i].ItemClass);
					BroadcastMessage(RewardsList[i].ItemClass.default.ItemName$" for EVERYONE!", False, 'CriticalEvent');
				}
				else
				{
					P = GetRandomPlayer();
					if (P != None)
					{
						GiveReward(P, RewardsList[i].ItemClass);
						if (P.PlayerReplicationInfo != None)
							BroadcastMessage(P.PlayerReplicationInfo.PlayerName$" got "$RewardsList[i].ItemClass.default.ItemArticle@RewardsList[i].ItemClass.default.ItemName$"!", False, 'CriticalEvent');
					}
				}
				
				break;
			}
		}
	}
	else if (FullAmmoRewardWeight > 0.0 && RndRw < (RandomRewardsMaxWeight+FullAmmoRewardWeight))
	{
		P = GetRandomPlayer();
		if (P != None)
		{
			GiveFullAmmo(P);
			if (P.PlayerReplicationInfo != None)
				BroadcastMessage(P.PlayerReplicationInfo.PlayerName$" got FULL AMMO!", False, 'CriticalEvent');
		}
	}
	else if (AllWeaponsRewardWeight > 0.0)
	{
		P = GetRandomPlayer();
		if (P != None)
		{
			GiveAllWeapons(P);
			if (P.PlayerReplicationInfo != None)
				BroadcastMessage(P.PlayerReplicationInfo.PlayerName$" got ALL WEAPONS!", False, 'CriticalEvent');
		}
	}
}

function Pawn GetRandomPlayer()
{
local Pawn P[32];
local byte i, maxPlayers;
local PlayerPawn PP;
local Bot B;

	ForEach AllActors(Class'PlayerPawn', PP)
	{
		if (PP.Health > 0 && !PP.bHidden && PP.Weapon != None && Spectator(PP) == None)
		{
			P[i++] = PP;
			maxPlayers = i;
			if (maxPlayers >= ArrayCount(P))
				break;
		}
	}
	
	if (maxPlayers < ArrayCount(P))
	{
		ForEach AllActors(Class'Bot', B)
		{
			if (B.Health > 0 && !B.bHidden && B.Weapon != None )
			{
				P[i++] = B;
				maxPlayers = i;
				if (maxPlayers >= ArrayCount(P))
					break;
			}
		}
	}
	
	if (maxPlayers == 0)
		return None;
	return P[Rand(maxPlayers)];
}

function GiveReward(Pawn P, class<Inventory> InvClass)
{
local Inventory Inv;

	if (P == None || InvClass == None || P.Health <= 0 || P.bHidden)
		return;

	if (class<Weapon>(InvClass) != None)
		GiveWeaponReward(P, class<Weapon>(InvClass));
	else
	{
		Inv = Spawn(InvClass,,, P.Location);
		if (Inv != None)
		{
			Inv.Touch(P);
			if (!Inv.bDeleteMe && Inv.Owner != P)
				Inv.Destroy();
		}
	}
}

function GiveFullAmmo(Pawn P)
{
local Inventory Inv;

	if (P == None || P.Health <= 0 || P.bHidden)
		return;

	for (Inv = P.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (Ammo(Inv) != None && (NaliAmmo(Inv) == None || !NaliAmmo(Inv).bMegaAmmo) && !isSuperAmmo(Ammo(Inv)))
			Ammo(Inv).AmmoAmount = Ammo(Inv).MaxAmmo;
	}
}

function bool isSuperAmmo(Ammo Am)
{
local byte i;

	if (Am == None)
		return False;
		
	for (i = 0; i < ArrayCount(SuperAmmoClasses); i++)
	{
		if (SuperAmmoClasses[i] == '')
			return False;
		if (Am.IsA(SuperAmmoClasses[i]))
			return True;
	}
	return False;
}

function bool isSuperWeapon(Weapon W)
{
local byte i;

	if (W == None)
		return False;
		
	for (i = 0; i < ArrayCount(SuperWeaponClasses); i++)
	{
		if (SuperWeaponClasses[i] == '')
			return False;
		if (W.IsA(SuperWeaponClasses[i]))
			return True;
	}
	return False;
}

function GiveAllWeapons(Pawn P)
{
local byte i;

	for (i = 0; i < MaxWeapons; i++)
		GiveWeaponReward(P, AllWeaponsClass[i]);
}

function GiveWeaponReward(Pawn P, class<Weapon> WClass)
{
local Weapon W;
local float pkAmmoMult;

	if (P == None || WClass == None || P.bDeleteMe || P.bHidden || P.Health <= 0)
		return;

	W = Weapon(P.FindInventoryType(WClass));
	if (W != None && W.AmmoType != None)
	{
		pkAmmoMult = getPickupAmmoMult(W.AmmoType);
		if (pkAmmoMult > 0.0 && (NaliAmmo(W.AmmoType) == None || !NaliAmmo(W.AmmoType).bMegaAmmo) && !isSuperAmmo(W.AmmoType))
			W.AmmoType.AmmoAmount = Min(W.AmmoType.MaxAmmo, Int(W.AmmoType.AmmoAmount + W.AmmoType.default.AmmoAmount*pkAmmoMult));
		else
			W.AmmoType.AmmoAmount = Min(W.AmmoType.MaxAmmo, W.AmmoType.AmmoAmount + W.AmmoType.default.AmmoAmount);
	}
	else
	{
		W = Spawn(WClass,,, P.Location);
		if (W != None)
		{
			if (ReplacerMut != None)
				W.Tag = ReplacerMut.ReplacedInventoryTag;
			W.RespawnTime = 0.0;
			W.GiveTo(P);
			W.bHeldItem = true;
			W.GiveAmmo(P);
			W.SetSwitchPriority(P);
			W.AmbientGlow = 0;
			if (PlayerPawn(P) != None)
			{
				W.GotoState('');
				W.SetHand(PlayerPawn(P).Handedness);
			}
			else
				W.GotoState('Idle');

			if (NaliWeapons(W) != None && NaliWeapons(W).enableModifiers)
				NaliWeapons(W).GiveModifier(NaliWeapons(W));
			if (ReplacerMut != None)
				ReplacerMut.ReorderPawnWeaponToLast(P, W);
		}
	}
}

function ManagePlayer(Pawn P)
{
local Inventory Inv;
local int AmmoRegSec;
local float AmmoRegMaxPercent;

	if (HealthRegenPerSec > 0 && P.Health < MaxRegenHealth && (bRegenHealthUnderwater || !P.Region.Zone.bWaterZone))
		P.Health = Min(MaxRegenHealth, P.Health + HealthRegenPerSec);
		
	for (Inv = P.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (Weapon(Inv) != None && Weapon(Inv).AmmoType != None && Weapon(Inv).AmmoType.MaxAmmo > 0 &&
		(NaliWeapons(Inv) == None || !NaliWeapons(Inv).bMegaWeapon) && !isSuperAmmo(Weapon(Inv).AmmoType))
		{
			getAmmoRegenFullInfo(Weapon(Inv).AmmoType,,, AmmoRegSec, AmmoRegMaxPercent);
			if (AmmoRegSec > 0 && AmmoRegMaxPercent > 0 && Weapon(Inv).AmmoType.AmmoAmount < Int(Weapon(Inv).AmmoType.MaxAmmo*AmmoRegMaxPercent))
				Weapon(Inv).AmmoType.AmmoAmount = Min(Int(Weapon(Inv).AmmoType.MaxAmmo*AmmoRegMaxPercent), Weapon(Inv).AmmoType.AmmoAmount + AmmoRegSec);
		}
	}
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
local float stAmmoMult, pkAmmoMult, mxAmmoMult;

	if (Ammo(Other) != None && Ammo(Other).AmmoAmount > 0 && (NaliAmmo(Other) == None || !NaliAmmo(Other).bMegaAmmo) && !isSuperAmmo(Ammo(Other)))
	{
		pkAmmoMult = getPickupAmmoMult(Ammo(Other));
		if (pkAmmoMult > 0.0)
			Ammo(Other).AmmoAmount *= pkAmmoMult;
		mxAmmoMult = getMaxAmmoMult(Ammo(Other));
		if (mxAmmoMult > 0.0)
			Ammo(Other).MaxAmmo *= mxAmmoMult;
	}
	
	if (Weapon(Other) != None)
	{
		stAmmoMult = getStartingAmmoMult(Weapon(Other));
		if (stAmmoMult > 0.0 && Weapon(Other).PickUpAmmoCount > 0 && (NaliWeapons(Other) == None || !NaliWeapons(Other).bMegaWeapon) && !isSuperWeapon(Weapon(Other)))
			Weapon(Other).PickUpAmmoCount *= stAmmoMult;
	}

	return True;
}

function float getStartingAmmoMult(Weapon W)
{
local byte i;

	if (W == None)
		return StartingAmmoMultiplier;

	for (i = 0; i < ArrayCount(WeaponRegenSettings); i++)
	{
		if (WeaponRegenSettings[i].WeaponClass == '')
			return StartingAmmoMultiplier;
		if (W.IsA(WeaponRegenSettings[i].WeaponClass))
			return WeaponRegenSettings[i].StartingAmmoMultiplier;
	}
	return StartingAmmoMultiplier;
}

function AmmoRegen getAmmoRegenSetting(Ammo Am)
{
local byte i;
local AmmoRegen AR;

	if (Am == None)
		return AR;

	for (i = 0; i < ArrayCount(AmmoRegenSettings); i++)
	{
		if (AmmoRegenSettings[i].AmmoClass == '')
			return AR;
		if (Am.IsA(AmmoRegenSettings[i].AmmoClass))
			return AmmoRegenSettings[i];
	}
	return AR;
}

function float getPickupAmmoMult(Ammo Am)
{
local AmmoRegen AR;

	AR = getAmmoRegenSetting(Am);
	if (AR.AmmoClass != '')
		return AR.PickupAmmoMultiplier;
	return PickupAmmoMultiplier;
}

function float getMaxAmmoMult(Ammo Am)
{
local AmmoRegen AR;

	AR = getAmmoRegenSetting(Am);
	if (AR.AmmoClass != '')
		return AR.MaxAmmoMultiplier;
	return MaxAmmoMultiplier;
}

function int getAmmoRegenPerSec(Ammo Am)
{
local AmmoRegen AR;

	AR = getAmmoRegenSetting(Am);
	if (AR.AmmoClass != '')
		return AR.AmmoRegenPerSec;
	return AmmoRegenPerSec;
}

function float getAmmoRegenMaxPercent(Ammo Am)
{
local AmmoRegen AR;

	AR = getAmmoRegenSetting(Am);
	if (AR.AmmoClass != '')
		return AR.AmmoRegenMaxPercentage;
	return AmmoRegenMaxPercentage;
}

function getAmmoRegenFullInfo(Ammo Am, optional out float PickupAmmoMult, optional out float MaxAmmoMult, optional out int AmmoReg, optional out float AmmoRegenPercent)
{
local AmmoRegen AR;

	AR = getAmmoRegenSetting(Am);
	if (AR.AmmoClass != '')
	{
		PickupAmmoMult = AR.PickupAmmoMultiplier;
		MaxAmmoMult = AR.MaxAmmoMultiplier;
		AmmoReg = AR.AmmoRegenPerSec;
		AmmoRegenPercent = AR.AmmoRegenMaxPercentage;
	}
	else
	{
		PickupAmmoMult = PickupAmmoMultiplier;
		MaxAmmoMult = MaxAmmoMultiplier;
		AmmoReg = AmmoRegenPerSec;
		AmmoRegenPercent = AmmoRegenMaxPercentage;
	}
}

function ModifyPlayer(Pawn Other)
{
local byte i, j, maxW, rndW;
local class<Weapon> WClass[64];

	if (PlayerPawn(Other) != None || Bot(Other) != None)
	{
		if (StartingHealth > 0)
			Other.Health = StartingHealth;
		
		maxW = MaxWeapons;
		for (i = 0; i < maxW; i++)
			WClass[i] = AllWeaponsClass[i];
		for (i = 0; i < RandomWeaponsOnStartup && maxW > 0; i++)
		{
			rndW = Rand(maxW);
			GiveWeaponReward(Other, WClass[rndW]);
			for (j = rndW; j < maxW; j++)
			{
				if (j < (maxW-1))
					WClass[j] = WClass[j+1];
				else
					WClass[j] = None;
			}
			maxW--;
		}
	}
		
	if (NextMutator != None)
		NextMutator.ModifyPlayer(Other);
}

 
defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	bAlwaysTick=True
	
	
	StartingHealth=500
	HealthRegenPerSec=5
	MaxRegenHealth=1500
	bRegenHealthUnderwater=True
	AmmoRegenPerSec=3
	AmmoRegenMaxPercentage=1.000000
	StartingAmmoMultiplier=2.000000
	PickupAmmoMultiplier=3.000000
	MaxAmmoMultiplier=5.000000
	
	RandomWeaponsOnStartup=2
	
	enableRandomRewards=True
	RandomRewardsTimeIntervalSeconds=60
	FullAmmoRewardWeight=3.000000
	AllWeaponsRewardWeight=5.500000
	
	SuperAmmoClasses(0)=WarheadAmmo
	
	SuperWeaponClasses(0)=WarHeadLauncher
	
	AllWeapons(0)="NWFlameTrackerVIII_SRC.FlameTracker"
	AllWeapons(1)="NWBoltRifleVIII_SRC.BoltRifle"
	AllWeapons(2)="NWGravitonVIII_SRC.Graviton"
	AllWeapons(3)="NWFreezerVIII_SRC.Freezer"
	AllWeapons(4)="NWVulcanVIII_SRC.Vulcan"
	AllWeapons(5)="NWTheMinerVIII_SRC.TheMiner"
	AllWeapons(6)="NWMultiMissileVIII_SRC.MultiMissile"
	AllWeapons(7)="NWIRPRVIII_SRC.IRPR"
	
	RewardsList(0)=(Weight=1.000000,Item="NWSuperBoltRifleVIII_SRC.SuperBoltRifle",bAllPlayers=False)
	RewardsList(1)=(Weight=1.000000,Item="NWCybotLauncherVIII_SRC.CybotLauncher",bAllPlayers=False)
	RewardsList(2)=(Weight=1.000000,Item="NWNuclearLauncherVIII_SRC.NuclearLauncher",bAllPlayers=False)
	RewardsList(3)=(Weight=1.000000,Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelA",bAllPlayers=False)
	RewardsList(4)=(Weight=1.000000,Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelB",bAllPlayers=False)
	RewardsList(5)=(Weight=1.000000,Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelC",bAllPlayers=False)
	RewardsList(6)=(Weight=1.000000,Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelD",bAllPlayers=False)
	RewardsList(7)=(Weight=1.000000,Item="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelE",bAllPlayers=False)
	RewardsList(8)=(Weight=1.000000,Item="NWMegatonVIII_SRC.Megaton",bAllPlayers=False)
	RewardsList(9)=(Weight=1.000000,Item="NWIonizerVIII_SRC.Ionizer",bAllPlayers=False)
	RewardsList(10)=(Weight=1.000000,Item="NWUltimaProtosVIII_SRC.UltimaProtos",bAllPlayers=False)
	RewardsList(11)=(Weight=5.000000,Item="NWExtrasVIII_SRC.NWUDamage",bAllPlayers=True)
	RewardsList(12)=(Weight=2.500000,Item="NWExtrasVIII_SRC.NWShieldBelt",bAllPlayers=True)
	RewardsList(13)=(Weight=2.500000,Item="NWExtrasVIII_SRC.NWJumpBoots",bAllPlayers=True)
	
	RewardCountdownSounds(0)="NWMHExtrasVIII_SRC.Rwrd1"
	RewardCountdownSounds(1)="NWMHExtrasVIII_SRC.Rwrd2"
	RewardCountdownSounds(2)="NWMHExtrasVIII_SRC.Rwrd3"
	
	RewardSounds(0)="NWMHExtrasVIII_SRC.RwrdRand01"
	RewardSounds(1)="NWMHExtrasVIII_SRC.RwrdRand02"
	RewardSounds(2)="NWMHExtrasVIII_SRC.RwrdRand03"
	RewardSounds(3)="NWMHExtrasVIII_SRC.RwrdRand04"
	RewardSounds(4)="NWMHExtrasVIII_SRC.RwrdRand05"
	RewardSounds(5)="NWMHExtrasVIII_SRC.RwrdRand06"
	RewardSounds(6)="NWMHExtrasVIII_SRC.RwrdRand07"
	RewardSounds(7)="NWMHExtrasVIII_SRC.RwrdRand08"
	RewardSounds(8)="NWMHExtrasVIII_SRC.RwrdRand09"
	RewardSounds(9)="NWMHExtrasVIII_SRC.RwrdRand10"
	RewardSounds(10)="NWMHExtrasVIII_SRC.RwrdRand11"
	RewardSounds(11)="NWMHExtrasVIII_SRC.RwrdRand12"
	RewardSounds(12)="NWMHExtrasVIII_SRC.RwrdRand13"
	RewardSounds(13)="NWMHExtrasVIII_SRC.RwrdRand14"
	RewardSounds(14)="NWMHExtrasVIII_SRC.RwrdRand15"
	RewardSounds(15)="NWMHExtrasVIII_SRC.RwrdRand16"
	RewardSounds(16)="NWMHExtrasVIII_SRC.RwrdRand17"
	RewardSounds(17)="NWMHExtrasVIII_SRC.RwrdRand18"
	RewardSounds(18)="NWMHExtrasVIII_SRC.RwrdRand19"
	RewardSounds(19)="NWMHExtrasVIII_SRC.RwrdRand20"
	RewardSounds(20)="NWMHExtrasVIII_SRC.RwrdRand21"
	RewardSounds(21)="NWMHExtrasVIII_SRC.RwrdRand22"
	RewardSounds(22)="NWMHExtrasVIII_SRC.RwrdRand23"
	RewardSounds(23)="NWMHExtrasVIII_SRC.RwrdRand24"
	RewardSounds(24)="NWMHExtrasVIII_SRC.RwrdRand25"
	RewardSounds(25)="NWMHExtrasVIII_SRC.RwrdRand26"
	
	LoadingMsgStr="Loading remaining assets, please wait..."
	LoadedMsgStr="All assets loaded successfully!"
	
	ClientPrecacheWaitTime=3.000000
}