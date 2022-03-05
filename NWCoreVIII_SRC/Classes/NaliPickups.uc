//////////////////////////////////////////////////////////////
//	Nali Weapons III Pickup core
//				Feralidragon (15-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliPickups expands TournamentPickup config(NWExtrasCfg)
abstract;

var() globalconfig bool enableTeamBasedEffect;
var bool bTeamEnabled;

var() bool denyReplacement;

var() byte PickupPriority;

enum EPickupType
{
	PCK_Health,
	PCK_Armor,
	PCK_ExtraDamage,
	PCK_Invisibility,
	PCK_Other
};

var() EPickupType PickupType;
var() bool bTemporaryPickup;
var() bool bCumulativeCharge;
var() int MaxCharge;
var() float ChargeDecreaseRate;
var() bool bBoots;

//Health pickup
var(Health) bool bSuperHealth;
var(Health) int HealthAmount;

//Extras
var() float DamageMult;
var() byte PawnVisibility;

//Super armor
var(Armor) bool bSuperArmor, bConsumeOtherArmors;
var(Armor) bool bShield, bThighs;
var bool bIsArmor;

//Pickup fx
var(FXPickup) class<Actor> PickupFXClasses[16];
var Actor PickupFX[16];
var bool SpawnedPickupFX;

//Weapon fx
var(FXWeapon) bool bWeaponFX, bOverlayWeaponFX, bThirdPersonWeaponFX, bWeaponAffector, bNullifyOtherWeaponOverlayerFX;
var(FXWeapon) ERenderStyle WeaponFXStyle, WeaponFXOverlayStyle, WeaponFXThirdPersonStyle;
var(FXWeapon) bool bTeamBasedWeaponFX;
var(FXWeapon) texture WeaponFXTex[5], WeaponFXOverlayTex[5], WeaponFXThirdPersonTex[5];
var(FXWeapon) bool bWeaponFXEnviroMap, bWeaponFXOverlayEnviroMap, bWeaponFXThirdPersonEnviroMap;
var(FXWeapon) byte WeaponFXOverlayExtraFatness;
var(FXWeapon) bool bWeaponFXUnlit, bWeaponFXOverlayUnlit, bWeaponFXThirdPersonUnlit;
var(FXWeapon) float WeaponFXGlow, WeaponFXOverlayGlow, WeaponFXThirdPersonGlow;
var(FXWeapon) class<NWeaponOverFX> WeaponFXOverlayClass;
var Weapon CurrentWeapon;
var bool bActiveForWeapon, bActiveForWeaponOV;

//Hands fx
var(FXHands) bool bHandsFX, bHandsOverlayFX, bNullifyOtherHandsOverlayerFX;
var(FXHands) ERenderStyle HandsFXStyle, HandsFXOverlayStyle;
var(FXHands) bool bTeamBasedHandsFX;
var(FXHands) texture HandsFXTex[5], HandsFXOverlayTex[5];
var(FXHands) bool bHandsFXEnviroMap, bHandsFXOverlayEnviroMap;
var(FXHands) byte HandsFXOverlayExtraFatness;
var(FXHands) bool bHandsFXUnlit, bHandsFXOverlayUnlit;
var(FXHands) float HandsFXGlow, HandsFXOverlayGlow;
var(FXHands) class<NWeaponOverFX> HandsFXOverlayClass;
var bool bActiveForHands, bActiveForHandsOV;

//Pawn fx
var(FXPawn) bool bPawnFX, bPawnOverlayerFX, bNullifyOtherPawnOverlayerFX;
var(FXPawn) class<NaliPickupPawnOV> FXPawnOVClass;
var(FXPawn) ERenderStyle PawnFXStyle, PawnFXOverlayStyle;
var(FXPawn) bool bTeamBasedPawnFX;
var(FXPawn) texture PawnFXTex[5], PawnFXOverlayTex[5];
var(FXPawn) bool bPawnFXEnviroMap, bPawnFXOverlayEnviroMap;
var(FXPawn) byte PawnFXOverlayExtraFatness;
var(FXPawn) bool bPawnFXUnlit, bPawnFXOverlayUnlit;
var(FXPawn) float PawnFXGlow, PawnFXOverlayGlow;
var(FXPawn) byte PawnFXAmbientGlow;
var(FXPawn) bool bPawnFXLight;
var(FXPawn) byte PawnFXLightHue, PawnFXLightSaturation, PawnFXLightBrightness;
var(FXPawn) byte PawnFXLightRadius;
var(FXPawn) ELightType PawnFXLightType;
var(FXPawn) ELightEffect PawnFXLightEffect;
var(FXPawn) byte PawnFXLightPeriod, PawnFXLightPhase, PawnFXLightCone;
var NaliPickupPawnOV FXPawnOV;


//Misc
var(Misc) bool bForceRotatingPickupOnReplace;
var(Misc) float ChargerScale, PlacementZOffset;


//Ressurection fx
var(FXRessurection) float RessurectionTime;
var(FXRessurection) sound RessurectSound1, RessurectSound2;
var NRessurectFX ResFX;
var WResReplace WRes;

//Team variables
//******************************
var byte PTeam;
var ControlPoint CPTeam;
var PlayerStart PSTeam;
var FortStandard FSTeam;
var byte bHaveFort;
//******************************

//Others
var bool pawnHasFlag;
var NWInvLightFX NWLightFX;
var UT_ShieldBelt UT_ShieldSaved;
var bool bTrackShield, bAcquiredShield;
var Pickup Dummy;


replication
{
	reliable if (Role == ROLE_Authority)
		bTeamEnabled;
	reliable if (Role == ROLE_Authority && bNetOwner)
		PickupType, MaxCharge, PickupPriority, bIsArmor, 
		bActiveForWeapon, bActiveForWeaponOV, bActiveForHands, bActiveForHandsOV;
}

function PreBeginPlay()
{
	bIsArmor = (PickupType == PCK_Armor);
	bIsAnArmor = bIsArmor;
	bConsumeOtherArmors = (bConsumeOtherArmors && bIsArmor);
	bTeamEnabled = (default.enableTeamBasedEffect && Level.Game.bTeamGame);
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	if (Role == ROLE_Authority)
	{
		if (Class'NWInfo'.default.enable_PickupRessurectFX)
			ReSpawnTime = FMax(0.1, ReSpawnTime - RessurectionTime);
		PTeam = Class'NWUtils'.static.IdentifyTeam(Level, Self, CPTeam, PSTeam, FSTeam, bHaveFort);
	}

	setDetail();
}

simulated function setDetail()
{
	Class'NWUtils'.static.processActorDetail(Level, Self, Class'NWInfo'.default.bPickupsDynLight, Class'NWInfo'.default.PickupsDistDetail);
}

simulated function Tick(float Delta)
{
local byte i;
local Inventory Inv;
local UT_ShieldBelt UTShield;

	if (Class'NWInfo'.default.enableSmartPerformancePickup && Level.NetMode != NM_DedicatedServer)
		LODBias = Class'NWUtils'.static.getFrameRateBasedLODBias(Level, Delta, LODBias);
		
	if (bPawnFXLight && Pawn(Owner) != None && Role == ROLE_Authority && Pawn(Owner).PlayerReplicationInfo != None && pawnHasFlag != (Pawn(Owner).PlayerReplicationInfo.hasFlag != None))
	{
		pawnHasFlag = (Pawn(Owner).PlayerReplicationInfo.hasFlag != None);
		SetupPawnLightFX();
	}
	
	if (!SpawnedPickupFX)
	{
		SpawnedPickupFX = True;
		if (Role == ROLE_Authority && Pawn(Owner) == None)
		{
			for (i = 0; i < ArrayCount(PickupFXClasses); i++)
			{
				if (PickupFXClasses[i] != None)
					PickupFX[i] = Spawn(PickupFXClasses[i], Self);
			}
		}
	}
	
	if (bAcquiredShield && Role == ROLE_Authority && Pawn(Owner) != None)
	{
		for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (UT_ShieldBelt(Inv) != None && NWUT_ShieldDummy(Inv) == None && UT_ShieldBelt(Inv).MyEffect != None)
			{
				UTShield = UT_ShieldBelt(Inv);
				break;
			}
		}
		
		if (UTShield != None)
		{
			SetupPawnFX();
			SetupPawnLightFX();
			SetupPawnOverlayerFX();
			UT_ShieldSaved = UTShield;
			bAcquiredShield = False;
			bTrackShield = True;
		}
	}
	else if (bTrackShield && Role == ROLE_Authority && (UT_ShieldSaved == None || UT_ShieldSaved.bDeleteMe || UT_ShieldSaved.Charge <= 0))
	{
		SetupPawnFX();
		SetupPawnLightFX();
		SetupPawnOverlayerFX(, True);
		UT_ShieldSaved = None;
		bTrackShield = False;
	}
}

function PickupFunction(Pawn Other)
{
local Inventory Inv;

	PrePickupInit();
	
	if (bConsumeOtherArmors)
		ConsumeArmor(Other);
		
	if (Pawn(Owner) != None)
	{
		for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (NaliPickups(Inv) != None && Inv != Self)
			{
				NaliPickups(Inv).ResetAll(True);
				NaliPickups(Inv).SetupAll();
			}
		}
	}
	SetupAll();
	
	if (bTemporaryPickup && Charge > 0 && ChargeDecreaseRate > 0)
		SetTimer(1/ChargeDecreaseRate, True);
	LightType = LT_None;
	
	if (bIsArmor)
	{
		if (bShield)
		{
			Dummy = Spawn(Class'NWUT_ShieldDummy');
			NWUT_ShieldDummy(Dummy).InitDummy(Self);
			bIsAnArmor = False;
		}
		else if (bThighs)
		{
			Dummy = Spawn(Class'NWUT_ThighsDummy');
			NWUT_ThighsDummy(Dummy).InitDummy(Self);
			bIsAnArmor = False;
		}
	}
	else if (bBoots)
	{
		Dummy = Spawn(Class'NWUT_BootsDummy');
		NWUT_BootsDummy(Dummy).InitDummy(Self);
		bIsAnArmor = False;
	}
	
	PostPickupInit();
}

function SetupAll()
{
	SetupPawnFX();
	SetupPawnLightFX();
	SetupPawnOverlayerFX();
	SetupWeaponFX();
	SetupHandsFX();
	SetupExtras();
}

function Timer()
{
	Charge--;
	ChargeDecreaseEvent();
	if (Charge <= 0 && PickupExpired())
	{
		SetTimer(0.0, False);
		Destroy();
	}
}

function PrePickupInit();
function PostPickupInit();

function ChargeDecreaseEvent()
{
	UpdateDummyCharge();
	if (Pawn(Owner) != None && PickupType == PCK_Invisibility)
		Pawn(Owner).Visibility = PawnVisibility;
}

function int ArmorAbsorbDamage(int Damage, name DamageType, vector HitLocation)
{
local int n;

	n = Super.ArmorAbsorbDamage(Damage, DamageType, HitLocation);
	UpdateDummyCharge();
	return n;
}

function UpdateDummyCharge()
{
	if (Dummy != None)
		Dummy.Charge = Charge;
}

function bool PickupExpired()
{
	if (Pawn(Owner) != None && ExpireMessage != "")
		Pawn(Owner).ClientMessage(ExpireMessage);
	return True;
}

function float BotDesireability(Pawn Bot)
{
local float desire;
local int maxHealth;
local inventory Inv;

	if (PickupType == PCK_Health)
	{
		maxHealth = Bot.default.Health;
		if (bSuperHealth)
			maxHealth = Class'NWInfo'.default.MaxHealth;
		desire = Min(HealthAmount, maxHealth - Bot.Health);

		if (Bot.Weapon != None && Bot.Weapon.AIRating > 0.5)
			desire *= 1.7;
		if (Bot.Health < 45)
			return (FMin(0.03 * desire, 2.2));
		if (desire > 6)
			desire = FMax(desire, 25);
		return (FMin(0.017 * desire, 2.0)); 
	}
	else if (bSuperArmor)
	{
		for (Inv = Bot.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (Inv.IsA('RelicDefenseInventory'))
				return -1;
		}
	}
	
	return Super.BotDesireability(Bot);
}

function bool HandlePickupQuery(Inventory Item)
{
local Inventory A;
local bool hasInv, isConsumableArmor;

    if (Item.Class == Class || CanConsumeArmor(Item))
    {
		if (bCumulativeCharge)
			Charge = Min(Charge + Item.Charge, MaxCharge);
		else if (Charge < Item.Charge)
			Charge = Item.Charge;
		UpdateDummyCharge();
			
		if (Level.Game.LocalLog != None)
			Level.Game.LocalLog.LogPickup(Item, Pawn(Owner));
		if (Level.Game.WorldLog != None)
			Level.Game.WorldLog.LogPickup(Item, Pawn(Owner));
		if (PickupMessageClass == None)
			Pawn(Owner).ClientMessage(PickupMessage, 'Pickup');
		else
			Pawn(Owner).ReceiveLocalizedMessage(PickupMessageClass, 0, None, None, Self.Class);
		Item.PlaySound(PickupSound,, 2.0);
		Item.SetReSpawn();
		return True;
    }
		
	hasInv = (Inventory != None && Inventory.HandlePickupQuery(Item));
	if (UT_ShieldBelt(Item) != None && NWUT_ShieldDummy(Item) == None && bNullifyOtherPawnOverlayerFX)
		bAcquiredShield = !hasInv;
	return hasInv;
}

function bool CanConsumeArmor(Inventory A)
{
	if (!bIsArmor || !bConsumeOtherArmors)
		return False;
	if (NaliPickups(A) != None && (!NaliPickups(A).bIsArmor || NaliPickups(A).PickupPriority > PickupPriority))
		return False;
	if (UT_ShieldBelt(A) != None && NWUT_ShieldDummy(A) == None)
		return False;
	if (NaliPickups(A) == None && !A.bIsAnArmor)
		return False;
	return True;
}

function ConsumeArmor(Pawn P)
{
local Inventory Inv;

	if (P == None)
		return;

	for (Inv = P.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (Inv == Self)
			continue;
		
		if (NaliPickups(Inv) == None && Inv.bIsAnArmor)
			Inv.Destroy();
		else if (NaliPickups(Inv) != None && NaliPickups(Inv).bIsArmor && NaliPickups(Inv).PickupPriority < PickupPriority)
			Inv.Destroy();
	}
}

function SetupExtras()
{
	if (Pawn(Owner) == None)
		return;
	
	if (PickupType == PCK_ExtraDamage && DamageMult > 0.0)
		Pawn(Owner).DamageScaling = DamageMult;
	else if (PickupType == PCK_Invisibility)
		Pawn(Owner).Visibility = PawnVisibility;
}

function ResetExtras(optional bool bResetOnly)
{
	if (Pawn(Owner) == None)
		return;
	
	if (PickupType == PCK_ExtraDamage)
		Pawn(Owner).DamageScaling = Pawn(Owner).default.DamageScaling;
	else if (PickupType == PCK_Invisibility)
		Pawn(Owner).Visibility = Pawn(Owner).default.Visibility;
}

function SetupPawnOverlayerFX(optional Pickup ignorePickup, optional bool ignoreShield)
{
local texture T;
local byte i;
local Pickup HighestNullOVPickup;
local bool isVisibleOV;
local Inventory Inv;

	HighestNullOVPickup = getHighestPriorityPickup("bNullifyOtherPawnOverlayerFX", ignorePickup);
	if (!ignoreShield && HighestNullOVPickup == Self && Pawn(Owner) != None)
	{
		for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (UT_ShieldBelt(Inv) != None && NWUT_ShieldDummy(Inv) == None && UT_ShieldBelt(Inv).MyEffect != None)
			{
				UT_ShieldBelt(Inv).MyEffect.bHidden = True;
				UT_ShieldSaved = UT_ShieldBelt(Inv);
				bTrackShield = True;
			}
		}
	}

	if (!bPawnOverlayerFX || Pawn(Owner) == None || FXPawnOVClass == None)
		return;
	
	isVisibleOV = ((!bNullifyOtherPawnOverlayerFX && HighestNullOVPickup == None) || (bNullifyOtherPawnOverlayerFX && HighestNullOVPickup == Self));
	if (FXPawnOV != None)
	{
		FXPawnOV.bHidden = !isVisibleOV;
		return;
	}
	else if (!isVisibleOV)
		return;
		
	FXPawnOV = Spawn(FXPawnOVClass, Owner,, Owner.Location, Owner.Rotation);
	FXPawnOV.Mesh = Owner.Mesh;
	FXPawnOV.DrawScale = Owner.DrawScale;
	FXPawnOV.Style = PawnFXOverlayStyle;
	FXPawnOV.bUnlit = bPawnFXOverlayUnlit;
	FXPawnOV.ScaleGlow = PawnFXOverlayGlow;
	FXPawnOV.bMeshEnviroMap = bPawnFXOverlayEnviroMap;
	FXPawnOV.Fatness = Byte(FMin(Owner.Fatness + PawnFXOverlayExtraFatness, 255));
	
	if (bTeamBasedPawnFX)
	{
		if (bTeamEnabled && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Team < 4)
			T = PawnFXOverlayTex[Pawn(Owner).PlayerReplicationInfo.Team];
		else
			T = PawnFXOverlayTex[4];
	}
	else
		T = PawnFXOverlayTex[0];
		
	if (T != None)
	{
		FXPawnOV.Texture = T;
		if (!bPawnFXOverlayEnviroMap)
		{
			FXPawnOV.MultiSkins[0] = Class'NWUtils'.static.getInvisibleTexture(FXPawnOV.Style);
			for (i = 1; i < ArrayCount(FXPawnOV.MultiSkins); i++)
				FXPawnOV.MultiSkins[i] = T;
		}
	}
}

function SetupPawnFX(optional Pickup ignorePickup)
{
local texture T;
local byte i;

	if (!bPawnFX || Pawn(Owner) == None || getHighestPriorityPickup("bPawnFX", ignorePickup) != Self)
		return;

	Owner.Style = PawnFXStyle;
	Owner.bUnlit = bPawnFXUnlit;
	Owner.ScaleGlow = PawnFXGlow;
	Owner.bMeshEnviroMap = bPawnFXEnviroMap;
	Owner.AmbientGlow = PawnFXAmbientGlow;
	if (bTeamBasedPawnFX)
	{
		if (bTeamEnabled && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Team < 4)
			T = PawnFXTex[Pawn(Owner).PlayerReplicationInfo.Team];
		else
			T = PawnFXTex[4];
	}
	else
		T = PawnFXTex[0];
	if (T != None)
		Owner.Texture = T;
}

function ResetPawnFX(optional bool bResetOnly)
{
local Pickup NP;
local Inventory Inv;
local UT_ShieldBelt UTSB;
	
	if (!bPawnFX || Pawn(Owner) == None)
		return;
		
	Owner.Style = Owner.default.Style;
	Owner.bUnlit = Owner.default.bUnlit;
	Owner.ScaleGlow = Owner.default.ScaleGlow;
	Owner.bMeshEnviroMap = Owner.default.bMeshEnviroMap;
	Owner.AmbientGlow = Owner.default.AmbientGlow;
	Owner.Texture = Owner.default.Texture;
	
	for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (UT_ShieldBelt(Inv) != None && NWUT_ShieldDummy(Inv) == None)
		{
			UTSB = UT_ShieldBelt(Inv);
			if (UTSB.MyEffect != None)
			{
				UTSB.MyEffect.bHidden = False;
				UT_ShieldSaved = UTSB;
				bTrackShield = True;
			}
			break;
		}
	}
	
	if (!bResetOnly)
	{
		for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (NaliPickups(Inv) != None && Inv != Self)
			{
				NaliPickups(Inv).SetupPawnFX(Self);
				NaliPickups(Inv).SetupPawnOverlayerFX(Self);
			}
			else if (UT_Invisibility(Inv) != None)
				NP = UT_Invisibility(Inv);
		}
	}
	
	if (UT_Invisibility(NP) != None)
	{
		UT_Invisibility(NP).SetOwnerDisplay();
		if (UTSB != None && UTSB.MyEffect != None)
		{
			UTSB.MyEffect.bHidden = True;
			UT_ShieldSaved = UTSB;
			bTrackShield = True;
		}
	}
}

function SetupPawnLightFX(optional Pickup ignorePickup)
{
	if (!bPawnFXLight || Pawn(Owner) == None || getHighestPriorityPickup("bPawnFXLight", ignorePickup) != Self)
		return;
	if (Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.HasFlag != None)
	{
		pawnHasFlag = True;
		return;
	}
	
	Owner.LightHue = PawnFXLightHue;
	Owner.LightSaturation = PawnFXLightSaturation;
	Owner.LightBrightness = PawnFXLightBrightness;
	Owner.LightRadius = PawnFXLightRadius;
	Owner.LightType = PawnFXLightType;
	Owner.LightEffect = PawnFXLightEffect;
	Owner.LightPeriod = PawnFXLightPeriod;
	Owner.LightPhase = PawnFXLightPhase;
	Owner.LightCone = PawnFXLightCone;
}

function ResetPawnLightFX(optional bool bResetOnly)
{
local Pickup NP;
local Inventory Inv;

	if (!bPawnFXLight || Pawn(Owner) == None)
		return;
	if (Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.HasFlag != None)
	{
		pawnHasFlag = True;
		return;
	}
	
	Owner.LightHue = Owner.default.LightHue;
	Owner.LightSaturation = Owner.default.LightSaturation;
	Owner.LightBrightness = Owner.default.LightBrightness;
	Owner.LightRadius = Owner.default.LightRadius;
	Owner.LightType = Owner.default.LightType;
	Owner.LightEffect = Owner.default.LightEffect;
	Owner.LightPeriod = Owner.default.LightPeriod;
	Owner.LightPhase = Owner.default.LightPhase;
	Owner.LightCone = Owner.default.LightCone;
	
	if (!bResetOnly)
	{
		for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (NaliPickups(Inv) != None && Inv != Self)
				NaliPickups(Inv).SetupPawnLightFX(Self);
			else if (UDamage(Inv) != None)
				NP = UDamage(Inv);
		}
	}

	if (UDamage(NP) != None)
		UDamage(NP).SetOwnerLighting();
}

function SetupWeaponFX(optional Pickup ignorePickup)
{
local Weapon W;
local texture T;
local Pickup HighestNullOVPickup, HWFXPickup;

	if (bOverlayWeaponFX)
	{
		HighestNullOVPickup = getHighestPriorityPickup("bNullifyOtherWeaponOverlayerFX", ignorePickup);
		bActiveForWeaponOV = ((!bNullifyOtherWeaponOverlayerFX && HighestNullOVPickup == None) || (bNullifyOtherWeaponOverlayerFX && HighestNullOVPickup == Self));
	}
	
	if ((!bWeaponFX && !bWeaponAffector && !bOverlayWeaponFX) || Pawn(Owner) == None || Pawn(Owner).Weapon == None)
		return;
	W = Pawn(Owner).Weapon;
	bActiveForWeapon = False;
	HWFXPickup = getHighestPriorityPickup("bWeaponFX", ignorePickup);
	
	if (bWeaponFX && HWFXPickup == Self)
	{
		bActiveForWeapon = True;
		if (CurrentWeapon != None && NaliWeapons(CurrentWeapon) == None && Pawn(Owner).Weapon != CurrentWeapon)
			ResetWeaponFX(True);
		if (NaliWeapons(W) != None)
			NaliWeapons(W).SetNormalViewWeapon();
		else
			ProcessWeaponFX(W);
	}
		
	if (!bWeaponFX && bOverlayWeaponFX && (getHighestPriorityPickup("bOverlayWeaponFX", ignorePickup) == Self && 
	(HWFXPickup == None || (NaliPickups(HWFXPickup) != None && NaliPickups(HWFXPickup).PickupPriority < PickupPriority))))
	{
		bActiveForWeapon = True;
		if (CurrentWeapon != None && NaliWeapons(CurrentWeapon) == None && Pawn(Owner).Weapon != CurrentWeapon)
			ResetWeaponFX(True);
		if (NaliWeapons(W) != None)
			NaliWeapons(W).SetNormalViewWeapon();
		else
			ProcessWeaponOverlayFX(W);
	}
	
	if (bWeaponAffector && getHighestPriorityPickup("bWeaponAffector", ignorePickup) == Self)
	{
		if (TournamentWeapon(CurrentWeapon) != None)
			TournamentWeapon(CurrentWeapon).Affector = None;
		if (TournamentWeapon(W) != None)
			TournamentWeapon(W).Affector = Self;
	}
		
	CurrentWeapon = W;
}

simulated function ProcessWeaponFX(Actor W)
{
local texture T;

	if (W == None)
		return;

	W.Style = WeaponFXStyle;
	W.bUnlit = bWeaponFXUnlit;
	W.ScaleGlow = WeaponFXGlow;
	W.bMeshEnviroMap = bWeaponFXEnviroMap;
	if (bTeamBasedWeaponFX)
	{
		if (bTeamEnabled && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Team < 4)
			T = WeaponFXTex[Pawn(Owner).PlayerReplicationInfo.Team];
		else
			T = WeaponFXTex[4];
	}
	else
		T = WeaponFXTex[0];
	SetupActorSkins(W, T);
}

simulated function ProcessThirdWeaponFX(Actor W)
{
local texture T;

	if (W == None)
		return;

	W.Style = WeaponFXThirdPersonStyle;
	W.bUnlit = bWeaponFXThirdPersonUnlit;
	W.ScaleGlow = WeaponFXThirdPersonGlow;
	W.bMeshEnviroMap = bWeaponFXThirdPersonEnviroMap;
	if (bTeamBasedWeaponFX)
	{
		if (bTeamEnabled && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Team < 4)
			T = WeaponFXThirdPersonTex[Pawn(Owner).PlayerReplicationInfo.Team];
		else
			T = WeaponFXThirdPersonTex[4];
	}
	else
		T = WeaponFXThirdPersonTex[0];
	SetupActorSkins(W, T);
}

simulated function ProcessWeaponOverlayFX(Actor W)
{
local texture T;

	if (W == None)
		return;

	W.Style = WeaponFXOverlayStyle;
	W.bUnlit = bWeaponFXOverlayUnlit;
	W.ScaleGlow = WeaponFXOverlayGlow;
	W.bMeshEnviroMap = bWeaponFXOverlayEnviroMap;
	if (bTeamBasedWeaponFX)
	{
		if (bTeamEnabled && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Team < 4)
			T = WeaponFXOverlayTex[Pawn(Owner).PlayerReplicationInfo.Team];
		else
			T = WeaponFXOverlayTex[4];
	}
	else
		T = WeaponFXOverlayTex[0];
	SetupActorSkins(W, T);
}

simulated function SetupActorSkins(Actor W, texture T)
{
local byte i;

	if (W == None || T == None)
		return;
	
	W.Texture = T;
	if (!W.bMeshEnviroMap)
	{
		W.MultiSkins[0] = Class'NWUtils'.static.getInvisibleTexture(W.Style);
		for (i = 1; i < ArrayCount(W.MultiSkins); i++)
			W.MultiSkins[i] = T;
	}
}

function ResetWeaponFX(optional bool bResetOnly)
{
local byte i;
local Inventory Inv;
local Pickup NP;

	if (!bResetOnly)
	{
		bActiveForWeaponOV = False;
		bActiveForWeapon = False;
	}
	
	if (TournamentWeapon(CurrentWeapon) != None && TournamentWeapon(CurrentWeapon).Affector == Self)
		TournamentWeapon(CurrentWeapon).Affector = None;

	if ((!bWeaponFX && !bOverlayWeaponFX) || Pawn(Owner) == None || CurrentWeapon == None)
		return;
		
	if (NaliWeapons(CurrentWeapon) != None)
		NaliWeapons(CurrentWeapon).SetDefaultDisplay();
	else
	{
		CurrentWeapon.Texture = CurrentWeapon.default.Texture;
		if (!CurrentWeapon.bMeshEnviroMap && CurrentWeapon.MultiSkins[0] != CurrentWeapon.default.MultiSkins[0])
		{
			for (i = 0; i < ArrayCount(CurrentWeapon.MultiSkins); i++)
				CurrentWeapon.MultiSkins[i] = CurrentWeapon.default.MultiSkins[i];
		}
		CurrentWeapon.Style = CurrentWeapon.default.Style;
		CurrentWeapon.bUnlit = CurrentWeapon.default.bUnlit;
		CurrentWeapon.ScaleGlow = CurrentWeapon.default.ScaleGlow;
		CurrentWeapon.bMeshEnviroMap = CurrentWeapon.default.bMeshEnviroMap;
	}
	
	if (!bResetOnly)
	{
		for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (NaliPickups(Inv) != None && Inv != Self)
				NaliPickups(Inv).SetupWeaponFX(Self);
			else if (UT_Invisibility(Inv) != None)
				NP = UT_Invisibility(Inv);
			else if (UDamage(Inv) != None && NP == None)
				NP = UDamage(Inv);
		}
	}
		
	if (UT_Invisibility(NP) != None)
		UT_Invisibility(NP).SetOwnerDisplay();
	else if (UDamage(NP) != None)
		UDamage(NP).SetUDamageWeapon();
}

function SetupHandsFX(optional Pickup ignorePickup)
{
local Pickup HighestNullOVPickup;

	if ((!bHandsFX && !bHandsOverlayFX) || Pawn(Owner) == None)
		return;
	
	if (bHandsOverlayFX)
	{
		HighestNullOVPickup = getHighestPriorityPickup("bNullifyOtherHandsOverlayerFX", ignorePickup);
		bActiveForHandsOV = ((!bNullifyOtherHandsOverlayerFX && HighestNullOVPickup == None) || (bNullifyOtherHandsOverlayerFX && HighestNullOVPickup == Self));
	}
	bActiveForHands = (bHandsFX && getHighestPriorityPickup("bHandsFX", ignorePickup) == Self);
}

simulated function ProcessHandsFX(Actor H)
{
local texture T;

	if (H == None)
		return;

	H.Style = HandsFXStyle;
	H.bUnlit = bHandsFXUnlit;
	H.ScaleGlow = HandsFXGlow;
	H.bMeshEnviroMap = bHandsFXEnviroMap;
	if (bTeamBasedHandsFX)
	{
		if (bTeamEnabled && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Team < 4)
			T = HandsFXTex[Pawn(Owner).PlayerReplicationInfo.Team];
		else
			T = HandsFXTex[4];
	}
	else
		T = HandsFXTex[0];
		
	if (T != None)
	{
		H.Texture = T;
		if (!H.bMeshEnviroMap)
			H.MultiSkins[1] = T;
	}
}

simulated function ProcessHandsFXOverlay(Actor H)
{
local texture T;

	if (H == None)
		return;

	H.Style = HandsFXOverlayStyle;
	H.bUnlit = bHandsFXOverlayUnlit;
	H.ScaleGlow = HandsFXOverlayGlow;
	H.bMeshEnviroMap = bHandsFXOverlayEnviroMap;
	if (bTeamBasedHandsFX)
	{
		if (bTeamEnabled && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Team < 4)
			T = HandsFXOverlayTex[Pawn(Owner).PlayerReplicationInfo.Team];
		else
			T = HandsFXOverlayTex[4];
	}
	else
		T = HandsFXOverlayTex[0];
	
	if (T != None)
	{
		H.Texture = T;
		if (!H.bMeshEnviroMap)
			H.MultiSkins[1] = T;
	}
}

function ResetHandsFX(optional bool bResetOnly)
{
local Inventory Inv;

	bActiveForHandsOV = False;
	bActiveForHands = False;
	
	if ((!bHandsFX && !bHandsOverlayFX) || Pawn(Owner) == None)
		return;
	
	if (!bResetOnly)
	{
		for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (NaliPickups(Inv) != None && Inv != Self)
				NaliPickups(Inv).SetupHandsFX(Self);
		}
	}
}

function Pickup getHighestPriorityPickup(optional string exclusiveProperty, optional Pickup excludePickup, optional bool excludeSelf)
{
local Inventory Inv;
local NaliPickups HighestPickup;
local Pickup HigherPickup;

	if (Owner == None)
		return None;
	if (!excludeSelf)
		HighestPickup = Self;
	if (exclusiveProperty ~= "bPawnFX" && !bPawnFX)
		HighestPickup = None;
	if (exclusiveProperty ~= "bPawnOverlayerFX" && !bPawnOverlayerFX)
		HighestPickup = None;
	if (exclusiveProperty ~= "bNullifyOtherPawnOverlayerFX" && !bNullifyOtherPawnOverlayerFX)
		HighestPickup = None;
	if (exclusiveProperty ~= "bPawnFXLight" && !bPawnFXLight)
		HighestPickup = None;
	if (exclusiveProperty ~= "bWeaponFX" && !bWeaponFX)
		HighestPickup = None;
	if (exclusiveProperty ~= "bOverlayWeaponFX" && !bOverlayWeaponFX)
		HighestPickup = None;
	if (exclusiveProperty ~= "bNullifyOtherWeaponOverlayerFX" && !bNullifyOtherWeaponOverlayerFX)
		HighestPickup = None;
	if (exclusiveProperty ~= "bWeaponAffector" && !bWeaponAffector)
		HighestPickup = None;
	if (exclusiveProperty ~= "bHandsFX" && !bHandsFX)
		HighestPickup = None;
	if (exclusiveProperty ~= "bHandsOverlayFX" && !bHandsOverlayFX)
		HighestPickup = None;
	if (exclusiveProperty ~= "bNullifyOtherHandsOverlayerFX" && !bNullifyOtherHandsOverlayerFX)
		HighestPickup = None;
	
	for (Inv = Owner.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (Inv != Self && Inv != excludePickup)
		{
			if (UT_Invisibility(Inv) != None && (exclusiveProperty == "" || exclusiveProperty ~= "bPawnFX" || 
			exclusiveProperty ~= "bPawnOverlayerFX" || exclusiveProperty ~= "bNullifyOtherPawnOverlayerFX" ||
			exclusiveProperty ~= "bNullifyOtherWeaponOverlayerFX" || exclusiveProperty ~= "bHandsFX" ||
			exclusiveProperty ~= "bNullifyOtherHandsOverlayerFX" || exclusiveProperty ~= "bHandsOverlayFX" ||
			exclusiveProperty ~= "bPawnFXLight"))
				HigherPickup = UT_Invisibility(Inv);
			else if (UDamage(Inv) != None && UT_Invisibility(HigherPickup) == None && (exclusiveProperty == "" || 
			exclusiveProperty ~= "bPawnFXLight" || exclusiveProperty ~= "bWeaponFX" || exclusiveProperty ~= "bWeaponAffector" || 
			exclusiveProperty ~= "bOverlayWeaponFX" || exclusiveProperty ~= "bNullifyOtherWeaponOverlayerFX"))
				HigherPickup = UDamage(Inv);
			else if (NaliPickups(Inv) != None && (HighestPickup == None || NaliPickups(Inv).PickupPriority > HighestPickup.PickupPriority))
			{
				if (exclusiveProperty != "")
				{
					if (exclusiveProperty ~= "bPawnFX" && !NaliPickups(Inv).bPawnFX)
						continue;
					if (exclusiveProperty ~= "bPawnOverlayerFX" && !NaliPickups(Inv).bPawnOverlayerFX)
						continue;
					if (exclusiveProperty ~= "bNullifyOtherPawnOverlayerFX" && !NaliPickups(Inv).bNullifyOtherPawnOverlayerFX)
						continue;
					if (exclusiveProperty ~= "bPawnFXLight" && !NaliPickups(Inv).bPawnFXLight)
						continue;
					if (exclusiveProperty ~= "bWeaponFX" && !NaliPickups(Inv).bWeaponFX)
						continue;
					if (exclusiveProperty ~= "bOverlayWeaponFX" && !NaliPickups(Inv).bOverlayWeaponFX)
						continue;
					if (exclusiveProperty ~= "bNullifyOtherWeaponOverlayerFX" && !NaliPickups(Inv).bNullifyOtherWeaponOverlayerFX)
						continue;
					if (exclusiveProperty ~= "bWeaponAffector" && !NaliPickups(Inv).bWeaponAffector)
						continue;
					if (exclusiveProperty ~= "bHandsFX" && !NaliPickups(Inv).bHandsFX)
						continue;
					if (exclusiveProperty ~= "bHandsOverlayFX" && !NaliPickups(Inv).bHandsOverlayFX)
						continue;
					if (exclusiveProperty ~= "bNullifyOtherHandsOverlayerFX" && !NaliPickups(Inv).bNullifyOtherHandsOverlayerFX)
						continue;
				}
				
				HighestPickup = NaliPickups(Inv);
			}
		}
	}
	
	if (HigherPickup != None)
		return HigherPickup;
	return HighestPickup;
}

function Inventory SpawnCopy(pawn Other)
{
local Inventory Copy, A;

	Copy = Super.SpawnCopy(Other);
	if (bIsArmor)
	{
		A = Class'NWUtils'.static.getInventory(Other, 'UT_ShieldBelt');
		if (A != None && NWUT_ShieldDummy(A) == None)
		{
			Copy.Charge = Min(Copy.Charge, A.default.Charge - A.Charge);
			if (Copy.Charge <= 0)
			{
				A.Charge -= 1;
				Copy.Charge = 1;
			}
		}
	}
	return Copy;
}

function ChangedWeapon()
{
	if (Inventory != None)
		Inventory.ChangedWeapon();
	SetupWeaponFX();
}

function PlayHealthMessage(Pawn Other)
{
	Other.ReceiveLocalizedMessage(Class'PickupMessageHealthPlus', 0, None, None, Self.Class);
}

simulated function ResetPickupFX(optional bool bResetOnly)
{
local byte i;

	for (i = 0; i < ArrayCount(PickupFX); i++)
	{
		if (PickupFX[i] != None)
			PickupFX[i].Destroy();
		PickupFX[i] = None;
	}
}

simulated function Destroyed()
{
	if (ResFX != None)
		ResFX.Destroy();
	if (WRes != None)
		WRes.Destroy();
	if (FXPawnOV != None)
		FXPawnOV.Destroy();
	if (NWLightFX != None)
		NWLightFX.Destroy();
	if (Dummy != None)
		Dummy.Destroy();
		
	ResFX = None;
	WRes = None;
	FXPawnOV = None;
	NWLightFX = None;
	Dummy = None;
	
	PickupExpired();
	ResetAll();
		
	Super.Destroyed();
}

function ResetAll(optional bool bResetOnly)
{
	ResetPawnFX(bResetOnly);
	ResetPawnLightFX(bResetOnly);
	ResetWeaponFX(bResetOnly);
	ResetHandsFX(bResetOnly);
	ResetExtras(bResetOnly);
	ResetPickupFX(bResetOnly);
}

function PlayResSound(bool bBirth)
{
	if (bBirth)
		PlaySound(RessurectSound1);
	else
		PlaySound(RessurectSound2);
}

simulated function float PlayRessurection()
{
local byte i;

	bHidden = False;
	WRes = Spawn(Class'PickupResReplace', Self);
	WRes.Mesh = Mesh;
	WRes.AmbientGlow = AmbientGlow;
	WRes.DrawScale = DrawScale;
	for (i = 0; i < 8; i++)
		WRes.MultiSkins[i] = MultiSkins[i];
	
	WRes.ScaleGlow = 0.0;
	WRes.bMeshEnviroMap = True;
	WRes.Texture = Class'NRessurectFX'.default.InvisTex;
	WRes.Style = STY_Masked;
	WRes.SetLifeSpan(RessurectionTime + 0.25);
	if (HasAnim(AnimSequence))
		WRes.PlayAnim(AnimSequence, 10.0, 0.0);
	
	ResFX = Spawn(Class'NRessurectFX', WRes);
	ResFX.Mesh = Mesh;
	if (Level.NetMode != NM_DedicatedServer)
		ResFX.LODBias = LODBias;
	ResFX.DrawScale = DrawScale;
	ResFX.SetLifeTime(RessurectionTime);
	ResFX.LifeCount = RessurectionTime;
	ResFX.StartFraming(RessurectionTime/3*2);
	Class'NWUtils'.static.InitializeRes(ResFX, Self, Level, Class'NWInfo'.default.enable_AmmoResTeamBasedColor, 
		Class'NWInfo'.default.AmmoResFXColor, PTeam, CPTeam, PSTeam, FSTeam, bHaveFort);
	
	PlayResSound(True);
	bHidden = True;
	return RessurectionTime/3*2;
}


auto state Pickup
{
	function Touch(actor Other)
	{
	local int maxHealth;
	local Pawn P;
	local bool bCallSuper;

		bCallSuper = (PickupType != PCK_Health);
		if (ValidTouch(Other)) 
		{
			P = Pawn(Other); 
			if (PickupType == PCK_Health)
			{
				maxHealth = P.default.Health;
				if (bSuperHealth) 
					maxHealth = Class'NWInfo'.default.MaxHealth;
				if (P.Health < maxHealth) 
				{
					if (Level.Game.LocalLog != None)
						Level.Game.LocalLog.LogPickup(Self, P);
					if (Level.Game.WorldLog != None)
						Level.Game.WorldLog.LogPickup(Self, P);
					P.Health += HealthAmount;
					if (P.Health > maxHealth) 
						P.Health = maxHealth;
					PlayHealthMessage(P);
					PlaySound(PickupSound,,2.5);
					Other.MakeNoise(0.2);       
					SetRespawn();
				}
			}
		}
		
		if (bCallSuper)
			Super.Touch(Other);
	}
}


State Sleeping
{
ignores Touch;

    function BeginState()
    {
		BecomePickup();
		bHidden = True;
		if (Level.NetMode == NM_StandAlone)
			LightType = LT_None;
    }

    function EndState()
    {
	local int i;

		bSleepTouch = false;
		if (Level.NetMode == NM_StandAlone && Class'NWInfo'.default.bPickupsDynLight)
			LightType = Default.LightType;
		for (i = 0; i < ArrayCount(Touching); i++)
		{
			if (Pawn(Touching[i]) != None)
				bSleepTouch = true;
		}
    }    
       
Begin:
	if (Class'NWInfo'.default.enable_PickupRessurectFX)
	{
		Sleep(ReSpawnTime);
		Sleep(PlayRessurection());
		PlayResSound(False);
		Sleep(RessurectionTime/3);
	}
	else
	{
		Sleep(ReSpawnTime);
		PlaySound(RespawnSound);
		Sleep(Level.Game.PlaySpawnEffect(Self));
	}
    GoToState('Pickup');
}

defaultproperties
{
	LODBias=8.000000
	bRotatingPickup=True
	RemoteRole=ROLE_SimulatedProxy
	bDisplayableInv=True
	AnimSequence=Still
	
	ChargerScale=1.000000
	ChargeDecreaseRate=1.000000
	FXPawnOVClass=Class'NaliPickupPawnOV'
	WeaponFXOverlayClass=Class'NWeaponOverFX'
	HandsFXOverlayClass=Class'NWeaponOverFX'
	
	RessurectSound1=RessurectSnd
	RessurectSound2=RessurectFinSnd
	RessurectionTime=3.000000
	
	
	enableTeamBasedEffect=True
}