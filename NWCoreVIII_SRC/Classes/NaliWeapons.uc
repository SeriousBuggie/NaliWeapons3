//////////////////////////////////////////////////////////////
//	Nali Weapons III weapons base class
//				Feralidragon (21-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliWeapons expands TournamentWeapon config(NWeaponsCfg)
abstract;

#exec OBJ LOAD FILE=Textures\NaliHUD.utx PACKAGE=NWCoreVIII_SRC.HUD
#exec OBJ LOAD FILE=Textures\NaliEffects.utx PACKAGE=NWCoreVIII_SRC.GFX
#exec OBJ LOAD FILE=Textures\ModifOvFX.utx PACKAGE=NWCoreVIII_SRC.ModOverlayers
#exec OBJ LOAD FILE=Textures\XUTExplosions.utx PACKAGE=NWCoreVIII_SRC.XUTExplosions

#exec AUDIO IMPORT NAME="RessurectSnd" FILE=SOUNDS\RessurectSnd.wav GROUP="Pickups"
#exec AUDIO IMPORT NAME="RessurectFinSnd" FILE=SOUNDS\RessurectFinSnd.wav GROUP="Pickups"
#exec AUDIO IMPORT NAME="ModifLockSound" FILE=SOUNDS\ModifLockSound.wav GROUP="Modifiers"
#exec AUDIO IMPORT NAME="ModifUnlockSound" FILE=SOUNDS\ModifUnlockSound.wav GROUP="Modifiers"

#exec TEXTURE IMPORT NAME=HumanHand FILE=SKINS\HumanHand.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=NormalBlack FILE=SKINS\NormalBlack.bmp GROUP=Skins LODSET=2

#exec new TrueTypeFontFactory Name=NaliFontA FontName="Low Gun Screen" Height=12 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NaliFontB FontName="Low Gun Screen" Height=16 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NaliFontC FontName="Low Gun Screen" Height=20 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NaliFontD FontName="Low Gun Screen Bold" Height=34 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NaliFontE FontName="Low Gun Screen Bold" Height=38 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NaliFontF FontName="Low Gun Screen Bold" Height=42 AntiAlias=TRUE


var() bool denyReplacement;

var(Performance) globalconfig bool bOptimizeLists;
var(Performance) globalconfig bool bInvertListsProcessing;

var texture Overlayer;
var NWeaponOverFX OV, PickupOv, UTShieldOV[2];
var texture UTShieldFXTex;
var() texture StockOverlayers[7];

var() float FireRateChange;
var() bool bInfinity;
var() int KickBack;
var() float MoreDamage;
var() bool HealthGiver;
var() float Splasher;
var() bool bTheOne;

var float FireRateMult1, FireRateMult2;
var float DamageMult1, DamageMult2;

var(Inventory) vector WidePlayerViewOffset;

var(Modifiers) globalconfig bool enableModifiers;
var(Modifiers) globalconfig float FireRateChangeMax;
var(Modifiers) globalconfig float FireRateChangeMin;
var(Modifiers) globalconfig int KickBackMax;
var(Modifiers) globalconfig int KickBackMin;
var(Modifiers) globalconfig bool bKickAffectTeammates;
var(Modifiers) globalconfig bool bKickAffectInstigator;
var(Modifiers) globalconfig float MoreDamageMax;
var(Modifiers) globalconfig float MoreDamageMin;
var(Modifiers) globalconfig float SplasherMax;
var(Modifiers) globalconfig float SplasherMin;
var(Modifiers) globalconfig bool canHealOwner;
var(Modifiers) globalconfig float healMultiplier;
var(Modifiers) globalconfig int healFixedValue;
var(Modifiers) globalconfig bool enableTheOneModif;
var(Modifiers) globalconfig bool bAlwaysTheOne;
var(Modifiers) globalconfig bool bTheOneUnlockLast;
var(Modifiers) globalconfig float ModifFireRateOdds, ModifDmgOdds, ModifKickOdds, ModifSplashOdds;
var(Modifiers) globalconfig float ModifHealOdds, ModifInfOdds, ModifOneOdds, ModifNoneOdds;

var color FColor;
var byte CurrentHand;

var texture SpecialHUD[3];
var string SpecialInfo[3];

var() bool bMegaWeapon;
var() bool bForceWeaponStay, bNeverWeaponStay, bGameWeaponStay;
var() bool bForceTranslucentCrossHair;

var texture CurrentPickFX;
var bool bModified;

var(Weapon) vector AltFireOffset;
var(Weapon) float FireOffsetZAdjustHidden, AltFireOffsetZAdjustHidden;
var(Weapon) float FireOffsetXAdjustHidden, AltFireOffsetXAdjustHidden;
var(Weapon) sound FiringAmbSound, AltFiringAmbSound;
var(Weapon) byte FiringSndVol, AltFiringSndVol;
var(Weapon) byte FiringSndPitch, AltFiringSndPitch;
var(Weapon) byte FiringSndRadius, AltFiringSndRadius;
var NaliAmbWeapSnd NAmbWeapSnd;
var(Weapon) bool bHighFireRate, bAltHighFireRate;
var(Weapon) globalconfig int MaxTraceRange;
var int ClientMaxTraceRange;

enum ECrosshairColorType
{
	CC_Default,
	CC_ChallengeHUD,
	CC_Custom
};

var(Crosshair) globalconfig bool bCustomCrosshair;
var(Crosshair) globalconfig ECrosshairColorType CrosshairColorType;
var(Crosshair) globalconfig bool bOpaqueCrosshair, bAlphaCrosshair;
var(Crosshair) globalconfig color CrosshairColor;
var(Crosshair) texture CustomCross, CustomCrossAlpha;
var(Crosshair) float CrossHairScale;

var bool bNoRenderCross;

var() mesh PlayerViewMeshLeft, PlayerViewMeshRight;

enum zHackManagerType
{
	ZRH_None,
	ZRH_Auto,
	ZRH_Force,
};

var(RenderOverlays) globalconfig zHackManagerType RenderZHackManager;

//New Overlay stuff
var(RenderOverlays) globalconfig bool bSeeWeaponHand, bWeaponFX;
var(RenderOverlays) Mesh HandPartMeshL[2], HandPartMeshR[2];
var NWeaponOverFX HandPart[2];
var(RenderOverlays) bool bForceHands;
var(RenderOverlays) bool bAlwaysRender;
var(RenderOverlays) byte HandsBaseFatness;

var(RenderOverlays) vector RenderOffsetSelect;
var(RenderOverlays) vector CenterPlayerViewOffset, WideCenterPlayerViewOffset;
var(RenderOverlays) float AnimMaxFrame;
var(RenderOverlays) vector RenderOffsetFire, RenderOffsetAltFire;
var(RenderOverlays) float AnimMaxFrameFire, AnimMaxFrameAltFire;

//Water FX for instant hit
var(WaterFX) bool bInstantHitWaterFX;
var(WaterFX) bool bBallisticWaterFX;
var(WaterFX) byte WaterSplashType;
var NWPoint pnt1, pnt2;


var bool bTournamentNaliGame;

struct GlowSet
{
	var() bool bLit, bRandFrame;
	var() Mesh GlowModel, GlowModelLeft;
	var() ERenderStyle GlowStyle;
	var() float GlowAmount, GlowTexScale;
	var() byte PulsingGlow;
	var() texture GlowTex1, GlowTex2, GlowTex3, GlowTex4, GlowTex5, GlowTex6, GlowTex7, GlowTex8;
	var() bool bRenderOnTop;
	var() class<NWeaponOverFX> GlowSetClass;
};

var(RenderOverlays) GlowSet FirstPersonGlowFX[8], PickupGlowFX[8];
var NWeaponOverFX FirstGlowFXActor[8], PickGlowFXActor[8];

struct OverlModel
{
	var() bool bLit, bEnviromentMode;
	var() texture OverTex0, OverTex1, OverTex2, OverTex3, OverTex4, OverTex5, OverTex6, OverTex7, OverMainTex;
	var() ERenderStyle GlowStyle;
	var() float GlowAmount;
	var() byte PulsingGlow;
	var() bool bCustomMesh;
	var() mesh CustomMesh, CustomMeshLeft;
	var() class<NWeaponOverFX> OverlModelClass;
};

var(RenderOverlays) OverlModel FirstPersonOverFX[3], PickupOverFX[3];
var NWeaponOverFX FirstOverFXActor[3], PickOverFXActor[3];
var(RenderOverlays) texture HandSkin;
var(RenderOverlays) globalconfig float ViewBobMult;
var NWHandsInfo HandsInfoObj;

//New Icons Stuff
var HUDSymb HUDAct[3];
var(ModifierIcons) texture TheOneGrid[3], SingleGrid;
var(ModifierIcons) globalconfig float ModifierIconsScale;
var(ModifierIcons) globalconfig float ModifierIconsYPosSingle, ModifierIconsYPosTriple;
var(ModifierIcons) texture ModifTexIcons[6];
var(ModifierIcons) Font ModifTextFont[6];
var color BWhite;

var() float RessurectionTime;
var() sound RessurectSound1, RessurectSound2;
var NRessurectFX ResFX;
var WResReplace WRes;

var(RenderOverlays) localized string NoAmmoMsgString, NoAltAmmoMsgString;
var(RenderOverlays) globalconfig bool enableNoAmmoMsg;

var(RenderOverlays) bool bRenderOptionsOnHiddenWeapon, bRenderCustomOnHiddenWeapon;
struct NROptions
{
	var() localized string optionText;
	var() color optionColor;
};
var(RenderOverlays) NROptions renderOptions[16];

var bool bLockedModifier;
var(ModifierIcons) sound ModifLockSnd, ModifUnLockSnd;
var(ModifierIcons) texture ModifLockTex;

var(AI) byte DeployAIPriority;

var() bool cannotRespawn;

//Team variables
//******************************
var byte PTeam;
var ControlPoint CPTeam;
var PlayerStart PSTeam;
var FortStandard FSTeam;
var byte bHaveFort;
//******************************

//Subclass coding flags
var bool bRenderHandsOnly;

//Extra pickups rendering lists
struct NaliPickupsFX
{
	var NaliPickups Pickup;
	var byte Priority;
	var bool bHandsFX, bHandsOVFX;
	var bool bWeaponFX, bWeaponOVFX;
	var NWeaponOverFX OVHands[2];
	var NWeaponOverFX OVWeapon;
};
var NaliPickupsFX NaliPickupsFXList[16];

struct NaliPickupsOVFX
{
	var NaliPickups Pickup;
	var NWeaponOverFX OVHands[2];
	var NWeaponOverFX OVWeapon;
};
var NaliPickupsOVFX NaliPickupsOVFXList[16];

var float TickControl;
var NWInvLightFX NWLightFX;

//Zero Ping (ZP)
var(HitScan) globalconfig bool enableZPDebug;
var(HitScan) globalconfig bool enableZPServer;
var(HitScan) globalconfig bool enableZPClient;
var(HitScan) config bool enableZPWeaponServer, enableZPWeaponClient;
var(HitScan) globalconfig bool enableZPAccuracyValidation, enableZPLevelBlockValidation;
var(HitScan) globalconfig float ZPMinViewPrecision, ZPMinShotPrecision;
var(HitScan) globalconfig float ZPMinOwnerViewPrecision, ZPMinFireTimeErrorMargin;
var(HitScan) globalconfig float ZPHitColHeighMaxMargin, ZPHitColRadiusMaxMargin, ZPHitStartMaxMargin;
var(HitScan) globalconfig float ZPOwnerLocationMaxMargin, ZPOtherLocationMaxMargin;
var(HitScan) globalconfig int ZPMaxPing;
var(HitScan) globalconfig byte ZPAccuracySyncMaxError;

var(HitScan) localized string ZPGlobalOnMsg, ZPGlobalOffMsg, ZPLocalOnMsg, ZPLocalOffMsg;
var(HitScan) bool isZPWeapon;

var(HitScan) float ZPMaxFirerate, ZPMaxFirerateAlt;
var bool enableZP, forceServerHitscan, bAltHitscan;
var float lastZPShotTime;

struct HAccuracy 
{
	var float Accur[48];
};
var(HitScan) bool bFireHitScan, bAltFireHitScan;
var(HitScan) float AccuracyPattern[4], AccuracyPatternAlt[4];
var HAccuracy HAccuracyList[4], HAccuracyListAlt[4];
var byte CurAccuracySelector, CurAccuracySelectorAlt;
var NaliWeapons ZPOwner;
var int zpAccServerSyncID, zpAccClientSyncID, zpAccServerSyncIDAlt, zpAccClientSyncIDAlt, maxZPPing;
var byte zpAccServerSyncVal, zpAccServerSyncValAlt;
var int oldZPAmmoAmount;
var int lastZPSetTime;
var pawn oldPZPOwner;

var bool bEnhancedWaterSplashes;


//Oversurrection
var(Oversurrector) config bool enableOversurrection;
var(Oversurrector) bool bOversurrective;
var(Oversurrector) color OversurrectorShellColor;
var(Oversurrector) color OversurrectorFXColors[24];
var(Oversurrector) byte OversurrectorLightHue[3], OversurrectorLightSaturation[3], OversurrectorLightBrightness[3];
var(Oversurrector) class<TheOversProj> OversurrectorProjClass;


replication
{
	// Things the server should send to the client.
	reliable if(bNetOwner && Role == ROLE_Authority)
		UTShieldFXTex, Overlayer, FireRateChange, bInfinity, KickBack, MoreDamage, 
		HealthGiver, Splasher, bTheOne, SpecialHUD, SpecialInfo, CurrentHand, bTournamentNaliGame, bLockedModifier,
		WidePlayerViewOffset, CenterPlayerViewOffset, WideCenterPlayerViewOffset, HandsInfoObj, 
		zpAccServerSyncID, zpAccServerSyncIDAlt, zpAccServerSyncVal, zpAccServerSyncValAlt;
	reliable if(Role == ROLE_Authority)
		bModified, CurrentPickFX, PickupOv, HandPart, enableZP, maxZPPing, ClientMaxTraceRange, HAccuracyList, 
		AccuracyPattern, AccuracyPatternAlt, bEnhancedWaterSplashes, FireRateMult1, FireRateMult2, bFireHitScan, bAltFireHitScan,
		bOversurrective;
	unreliable if(bNetOwner && Role == ROLE_Authority)
		FirstGlowFXActor, FirstOverFXActor, HUDAct;
	unreliable if(Role == ROLE_Authority)
		PickGlowFXActor, PickOverFXActor;
	reliable if (Role < ROLE_Authority)
		ToggleModifierLock, SetupHitScan, ServerProcessTrace;
}

//HitScan functions
function SetupHitScan(bool bZP, optional byte msgType)
{
local string msg;

	if (!isZPWeapon)
		return;
		
	if (oldPZPOwner == None || oldPZPOwner.bDeleteMe || oldPZPOwner != Pawn(Owner) || (Level.TimeSeconds - lastZPSetTime) >= 2.5)
	{
		CurAccuracySelector = 0;
		CurAccuracySelectorAlt = 0;
		oldPZPOwner = Pawn(Owner);
		lastZPSetTime = Level.TimeSeconds;
	}
	enableZP = (bZP && Level.NetMode != NM_StandAlone && enableZPServer && enableZPWeaponServer && (bFireHitScan || bAltFireHitScan));
	
	if (enableZPServer && enableZPWeaponServer && msgType >= 1 && msgType <= 4)
	{
		if (msgType == 1)
			msg = ZPGlobalOnMsg;
		else if (msgType == 2)
			msg = ZPGlobalOffMsg;
		else if (msgType == 3)
			msg = ZPLocalOnMsg;
		else if (msgType == 4)
			msg = ZPLocalOffMsg;
		Pawn(Owner).ClientMessage(msg);
	}
}

exec function ToggleModifierLock()
{
local NaliWeapons nww;

	if (Pawn(Owner) == None)
		return;

	nww = NaliWeapons(Pawn(Owner).Weapon);
	if (nww != None && !nww.bMegaWeapon && nww.bModified)
	{
		nww.bLockedModifier = !nww.bLockedModifier;
		if (PlayerPawn(Owner) != None)
		{
			if (nww.bLockedModifier && ModifLockSnd != None)
				PlayerPawn(Owner).ClientPlaySound(ModifLockSnd);
			else if (!nww.bLockedModifier && ModifUnLockSnd != None)
				PlayerPawn(Owner).ClientPlaySound(ModifUnLockSnd);
		}
	}
}

exec simulated function ZP(string opt, optional bool suppressMsg)
{
local NaliWeapons nww;
local byte msgType;

	if (Pawn(Owner) == None || (Level.NetMode != NM_StandAlone && Role == ROLE_Authority))
		return;
	
	if (opt ~= "on" || opt ~= "1" || opt ~= "t" || opt ~= "true")
	{
		Class'NaliWeapons'.default.enableZPClient = True;
		Class'NaliWeapons'.static.StaticSaveConfig();
		ForEach AllActors (Class'NaliWeapons', nww)
		{
			nww.enableZPClient = True;
			nww.default.enableZPClient = True;
			nww.class.default.enableZPClient = True;
		}
		
		nww = NaliWeapons(Pawn(Owner).Weapon);
		if (nww != None)
		{
			if (!suppressMsg)
				msgType = 1;
			nww.SetupHitScan(enableZPWeaponClient, msgType);
		}
	}
	else if (opt ~= "off" || opt ~= "0" || opt ~= "f" || opt ~= "false")
	{
		Class'NaliWeapons'.default.enableZPClient = False;
		Class'NaliWeapons'.static.StaticSaveConfig();
		ForEach AllActors (Class'NaliWeapons', nww)
		{
			nww.enableZPClient = False;
			nww.default.enableZPClient = False;
			nww.class.default.enableZPClient = False;
		}
		
		nww = NaliWeapons(Pawn(Owner).Weapon);
		if (nww != None)
		{
			if (!suppressMsg)
				msgType = 2;
			nww.SetupHitScan(False, msgType);
		}
	}
	else if (opt ~= "local on" || opt ~= "local 1" || opt ~= "local t" || opt ~= "local true" || 
	opt ~= "weapon on" || opt ~= "weapon 1" || opt ~= "weapon t" || opt ~= "weapon true")
	{
		nww = NaliWeapons(Pawn(Owner).Weapon);
		if (nww != None)
		{
			nww.enableZPWeaponClient = True;
			nww.default.enableZPWeaponClient = True;
			nww.class.default.enableZPWeaponClient = True;
			nww.SaveConfig();
			if (!suppressMsg)
				msgType = 3;
			nww.SetupHitScan(enableZPClient, msgType);
		}
	}
	else if (opt ~= "local off" || opt ~= "local 0" || opt ~= "local f" || opt ~= "local false" || 
	opt ~= "weapon off" || opt ~= "weapon 0" || opt ~= "weapon f" || opt ~= "weapon false")
	{
		nww = NaliWeapons(Pawn(Owner).Weapon);
		if (nww != None)
		{
			nww.enableZPWeaponClient = False;
			nww.default.enableZPWeaponClient = False;
			nww.class.default.enableZPWeaponClient = False;
			nww.SaveConfig();
			if (!suppressMsg)
				msgType = 4;
			nww.SetupHitScan(False, msgType);
		}
	}
}

exec simulated function NWClientExit()
{
local PlayerPawn PP;
local NWClientAuto NWClient;
local bool hasNWClientOn;

	PP = PlayerPawn(Owner);
	if (Level.NetMode == NM_DedicatedServer || PP == None)	
		return;
	
	Foreach AllActors(Class'NWClientAuto', NWClient)
	{
		hasNWClientOn = True;
		NWClient.ResetZHack(PP);
	}
	
	if (!hasNWClientOn)
		Class'NWClientAuto'.static.StaticResetZHack(PP);
}

exec simulated function NWDetail(byte n)
{
	if (PlayerPawn(Owner) == None)
		return;
	
	if (n >= 8)
	{
		PlayerPawn(Owner).ClientMessage("Cannot load detail setting "$n$"; the value must be within 0 and 7.");
		return;
	}
	
	Class'NWDetailProfile'.static.InitProfileInfo(Level);
	Class'NWDetailProfile'.static.ProcessFullProfileChange(n);
	Class'NWDetailProfile'.static.ProcessFullProfileChange(n, Level);
	Class'NWDetailProfile'.default.SelectedProfile = n;
	Class'NWDetailProfile'.static.StaticSaveConfig();
	Class'NWDetailProfile'.default.SelectedProfile = n;
	PlayerPawn(Owner).ClientMessage("Detail setting "$n$" ('"$Class'NWDetailProfile'.default.ProfileNames[n]$"') loaded successfully.");
}

function ResetModifiers(NaliWeapons Copy)
{
local byte i;

	if (Copy != None)
	{
		Copy.FireRateChange = 1.0;
		Copy.bInfinity = False;
		Copy.KickBack = 0;
		Copy.MoreDamage = 0;
		Copy.HealthGiver = False;
		Copy.Splasher = 0;
		Copy.bTheOne = False;
		Copy.bModified = False;

		Copy.Overlayer = None;
		for (i = 0; i < 3; i++)
		{
			Copy.SpecialHUD[i] = None;
			Copy.SpecialInfo[i] = "";
		}
		
		if (Copy.PickupOv != None)
		{
			Copy.PickupOv.Destroy();
			Copy.PickupOv = None;
		}
	}
}

function PreBeginPlay()
{
local NWHandsInfo HInfoObj;
local byte i, j;

	Super.PreBeginPlay();
	AddAuxMutator(Class'NWClientAuto');
	
	if (Class'NWInfo'.default.enableKillMsgManager)
		AddAuxMutator(Class'NWKillMsgManager');
	if (Class'NWBloodyMess'.static.isEnabled())
		AddAuxMutator(Class'NWBloodyMess');
	if (Class'NWSkillKillsManager'.default.enableSkillKills)
		AddAuxMutator(Class'NWSkillKillsManager');
	
	if (HandsInfoObj == None)
	{
		ForEach AllActors(Class'NWHandsInfo', HInfoObj)
		{
			HandsInfoObj = HInfoObj;
			break;
		}
		
		if (HandsInfoObj == None)
		{
			log("Spawning NWHandsInfo...");
			HandsInfoObj = Spawn(Class'NWHandsInfo');
		}
	}

	if (Level.NetMode != NM_StandAlone && (bFireHitScan || bAltFireHitScan))
	{
		if (bFireHitScan)
		{
			for (i = 0; i < ArrayCount(AccuracyPattern); i++)
			{
				if (AccuracyPattern[i] > 0.0)
				{
					for (j = 0; j < ArrayCount(HAccuracyList[i].Accur); j++)
						HAccuracyList[i].Accur[j] = FRand();
				}
			}
		}
		
		if (bAltFireHitScan)
		{
			for (i = 0; i < ArrayCount(AccuracyPatternAlt); i++)
			{
				if (AccuracyPatternAlt[i] > 0.0)
				{
					for (j = 0; j < ArrayCount(HAccuracyListAlt[i].Accur); j++)
						HAccuracyListAlt[i].Accur[j] = FRand();
				}
			}
		}
	}
	
	ClientMaxTraceRange = MaxTraceRange;
	bEnhancedWaterSplashes = Class'NWInfo'.default.bEnhancedWaterSplashes;
	ZPOwner = Self;
	maxZPPing = default.ZPMaxPing;
	bOversurrective = (bOversurrective && default.enableOversurrection);
}

//Rest of the code
simulated function BeginPlay()
{
	Super.BeginPlay();
	
	if (Role == ROLE_Authority && Class'NWInfo'.default.enable_WeaponRessurectFX)
		ReSpawnTime = FMax(0.1, ReSpawnTime - RessurectionTime);
	setDetail();
	bOwnsCrosshair = class'NaliWeapons'.default.bCustomCrosshair;
	
	SetWeaponGameType();
	SetPickupFX();
	BobDamping *= ViewBobMult;
	if (bTheOne)
		ActivateTheOne();
	SpawnAmbObj();
	PTeam = Class'NWUtils'.static.IdentifyTeam(Level, Self, CPTeam, PSTeam, FSTeam, bHaveFort);
}

simulated function setDetail()
{
	Class'NWUtils'.static.processActorDetail(Level, Self, Class'NWInfo'.default.bWeaponsDynLight, Class'NWInfo'.default.WeaponDistDetail);
}

function SpawnAmbObj()
{
	if (FiringAmbSound != None || AltFiringAmbSound != None)
		NAmbWeapSnd = Spawn(Class'NaliAmbWeapSnd', Self);
}

function AddAuxMutator(Class<Mutator> MutClass)
{
local Mutator M;
local int i;

	for (M = Level.Game.BaseMutator; M != None; M = M.NextMutator)
	{
		if (M.Class == MutClass || i > 1000)
			return;
		i++;
	}
	Level.Game.BaseMutator.AddMutator(Spawn(MutClass));
}

simulated function bool ClientFire(float Value)
{
    if (bCanClientFire && (Role == ROLE_Authority || AmmoType == None || AmmoType.AmmoAmount > 0))
    {
		if (CheckAmmo(False))
		{
			if (PlayerPawn(Owner) != None && (Level.NetMode == NM_Standalone || PlayerPawn(Owner).Player.IsA('ViewPort')))
			{
				if (InstFlash != 0.0)
					PlayerPawn(Owner).ClientInstantFlash(InstFlash, InstFog);
				PlayerPawn(Owner).ShakeView(ShakeTime, ShakeMag, ShakeVert);
			}
			if (Affector != None)
				Affector.FireEffect();
			PlayFiring();
		}
		else
			PlayNoAmmoFiring();
			
        if (Role < ROLE_Authority)
		{
			if (bFireHitScan && enableZP && PlayerPawn(Owner) != None && ViewPort(PlayerPawn(Owner).Player) != None)
			{
				bAltHitscan = False;
				TraceFire(GetAccuracy());
			}
            GotoState('ClientFiring');
		}
        return true;
    }
    return false;
}

simulated function PlayNoAmmoFiring()
{
	if (Class'NaliWeapons'.default.enableNoAmmoMsg && PlayerPawn(Owner) != None && PlayerPawn(Owner).myHUD != None && AmmoType != None)
		PlayerPawn(Owner).myHUD.LocalizedMessage(Class'NoAmmoStringPlus', 0, None, None, None, NoAmmoMsgString);
}

simulated function bool ClientAltFire( float Value )
{
    if (bCanClientFire && (Role == ROLE_Authority || AmmoType == None || AmmoType.AmmoAmount > 0))
    {
		if (CheckAmmo(True))
		{
			if (PlayerPawn(Owner) != None && (Level.NetMode == NM_Standalone || PlayerPawn(Owner).Player.IsA('ViewPort')))
			{
				if (InstFlash != 0.0)
					PlayerPawn(Owner).ClientInstantFlash( InstFlash, InstFog);
				PlayerPawn(Owner).ShakeView(ShakeTime, ShakeMag, ShakeVert);
			}
			if (Affector != None)
				Affector.FireEffect();
			PlayAltFiring();
		}
		else
			PlayNoAmmoAltFiring();
		
        if (Role < ROLE_Authority)
		{
			if (bAltFireHitScan && enableZP && PlayerPawn(Owner) != None && ViewPort(PlayerPawn(Owner).Player) != None)
			{
				bAltHitscan = True;
				TraceFire(GetAccuracy(True));
			}
            GotoState('ClientAltFiring');
		}
        return true;
    }
    return false;
}

simulated function PlayNoAmmoAltFiring()
{
	if (Class'NaliWeapons'.default.enableNoAmmoMsg && PlayerPawn(Owner) != None && PlayerPawn(Owner).myHUD != None && AmmoType != None)
		PlayerPawn(Owner).myHUD.LocalizedMessage(Class'NoAmmoStringPlus', 0, None, None, None, NoAltAmmoMsgString );
}

simulated function bool CheckAmmo(bool bAltFire)
{
	return True;
}

function SetWeaponGameType()
{
	bTournamentNaliGame = Level.Game.IsA('DeathMatchPlus');
}

simulated function SetOwnerDisplay()
{
	Super.SetOwnerDisplay();
	SetNormalViewWeapon();
}

function SetWeaponStay()
{
	if (bForceWeaponStay)
		bWeaponStay = True;
	else if (!bGameWeaponStay && (bNeverWeaponStay || bMegaWeapon))
		bWeaponStay = False;
	else
		Super.SetWeaponStay();
}

simulated function setHand(float Hand)
{
	setServerHand(Hand);
	SetNormalViewWeapon();
	if (Hand == 1)
		Mesh = PlayerViewMeshLeft;
	else
		Mesh = PlayerViewMeshRight;
}

// set which hand is holding weapon
function setServerHand(float Hand)
{
	if (bAlwaysRender && Hand == 2)
		Hand = 0;
	
    if (Hand == 2)
    {
        PlayerViewOffset.Y = 0;
		WidePlayerViewOffset.Y = 0;
		FireOffset.X = Default.FireOffset.X + FireOffsetXAdjustHidden;
		AltFireOffset.X = Default.AltFireOffset.X + AltFireOffsetXAdjustHidden;
        FireOffset.Y = 0;
		AltFireOffset.Y = 0;
		FireOffset.Z = Default.FireOffset.Z + FireOffsetZAdjustHidden;
		AltFireOffset.Z = Default.AltFireOffset.Z + AltFireOffsetZAdjustHidden;
        bHideWeapon = true;
        return;
    }
    else
        bHideWeapon = false;

    if (Hand == 0)
    {
		if (VSize(CenterPlayerViewOffset) > 0)
			PlayerViewOffset = CenterPlayerViewOffset;
		else
		{
			PlayerViewOffset.X = Default.PlayerViewOffset.X * 0.88;
			PlayerViewOffset.Y = -0.2 * Default.PlayerViewOffset.Y;
			PlayerViewOffset.Z = Default.PlayerViewOffset.Z * 1.12;
		}
		
		if (VSize(WideCenterPlayerViewOffset) > 0)
			WidePlayerViewOffset = WideCenterPlayerViewOffset;
		else
		{
			WidePlayerViewOffset.X = Default.WidePlayerViewOffset.X * 0.88;
			WidePlayerViewOffset.Y = -0.2 * Default.WidePlayerViewOffset.Y;
			WidePlayerViewOffset.Z = Default.WidePlayerViewOffset.Z * 1.12;
		}
    }
    else
    {
        PlayerViewOffset.X = Default.PlayerViewOffset.X;
        WidePlayerViewOffset.X = Default.WidePlayerViewOffset.X;
        PlayerViewOffset.Y = Default.PlayerViewOffset.Y * Hand;
        WidePlayerViewOffset.Y = Default.WidePlayerViewOffset.Y * Hand;
        PlayerViewOffset.Z = Default.PlayerViewOffset.Z;
        WidePlayerViewOffset.Z = Default.WidePlayerViewOffset.Z;
    }
	
    PlayerViewOffset *= 100; //scale since network passes vector components as ints
    WidePlayerViewOffset *= 100; //scale since network passes vector components as ints
    FireOffset.Y = Default.FireOffset.Y * Hand;
    AltFireOffset.Y = Default.AltFireOffset.Y * Hand;
}

function BecomeItem()
{
	Super.BecomeItem();
	SetHiddenOverlayers(True);
	SetNormalViewWeapon();
	setNetUpdateFrequency();
}

simulated function GiveOvProperties(NWeaponOverFX NwFx, bool bGlowOv, byte i)
{
	if (NwFx == None)
		return;
	
	if (bGlowOv)
	{
		NwFx.PrePivot = PrePivot;
		NwFx.bUnLit = default.PickupGlowFX[i].bLit;
		NwFx.bRandomFrame = default.PickupGlowFX[i].bRandFrame;
		NwFx.Mesh = default.PickupGlowFX[i].GlowModel;
		NwFx.Style = default.PickupGlowFX[i].GlowStyle;
		NwFx.ScaleGlow = default.PickupGlowFX[i].GlowAmount;
		NwFx.DrawScale = default.PickupGlowFX[i].GlowTexScale;
		NwFx.AmbientGlow = default.PickupGlowFX[i].PulsingGlow;
		if (default.PickupGlowFX[i].GlowTex1 != None && !default.PickupGlowFX[i].bRandFrame)
			NwFx.Texture = default.PickupGlowFX[i].GlowTex1;
		else
			NwFx.Texture = Texture'TranslucInvis';
		NwFx.bAnimByOwner = False;
		
		if (default.PickupGlowFX[i].bRandFrame)
		{
			NwFx.MultiSkins[0] = default.PickupGlowFX[i].GlowTex1;
			NwFx.MultiSkins[1] = default.PickupGlowFX[i].GlowTex2;
			NwFx.MultiSkins[2] = default.PickupGlowFX[i].GlowTex3;
			NwFx.MultiSkins[3] = default.PickupGlowFX[i].GlowTex4;
			NwFx.MultiSkins[4] = default.PickupGlowFX[i].GlowTex5;
			NwFx.MultiSkins[5] = default.PickupGlowFX[i].GlowTex6;
			NwFx.MultiSkins[6] = default.PickupGlowFX[i].GlowTex7;
			NwFx.MultiSkins[7] = default.PickupGlowFX[i].GlowTex8;
		}
		
		if (NwFx.Texture == None)
		{
			NwFx.Texture = Texture'TranslucInvis';
			NwFx.MultiSkins[1] = Texture'TranslucInvis';
		}
				
		NwFx.Fatness = default.Fatness;
		NwFx.bParticles = True;
	}
	else
	{
		NwFx.PrePivot = PrePivot;
		NwFx.bUnLit = default.PickupOverFX[i].bLit;
		NwFx.bMeshEnviroMap = default.PickupOverFX[i].bEnviromentMode;
				
		if (!default.PickupOverFX[i].bCustomMesh)
			NwFx.Mesh = PickupViewMesh;
		else
			NwFx.Mesh = default.PickupOverFX[i].CustomMesh;
		
		NwFx.Style = default.PickupOverFX[i].GlowStyle;
		NwFx.ScaleGlow = default.PickupOverFX[i].GlowAmount;
		NwFx.DrawScale = default.PickupViewScale;
		NwFx.AmbientGlow = default.PickupOverFX[i].PulsingGlow;
		NwFx.Texture = default.PickupOverFX[i].OverMainTex;
		
		NwFx.MultiSkins[0] = Texture'TranslucInvis';
		NwFx.MultiSkins[1] = default.PickupOverFX[i].OverTex1;
		NwFx.MultiSkins[2] = default.PickupOverFX[i].OverTex2;
		NwFx.MultiSkins[3] = default.PickupOverFX[i].OverTex3;
		NwFx.MultiSkins[4] = default.PickupOverFX[i].OverTex4;
		NwFx.MultiSkins[5] = default.PickupOverFX[i].OverTex5;
		NwFx.MultiSkins[6] = default.PickupOverFX[i].OverTex6;
		NwFx.MultiSkins[7] = default.PickupOverFX[i].OverTex7;
		NwFx.Fatness = default.Fatness;
	}
	
	NwFx.SetHiddenessUpdating();
}

//Set pickup overlayers/effects
simulated function SetPickupFX()
{
local byte i;
	
	if (default.bWeaponFX)
	{
		while (i < ArrayCount(PickupGlowFX) && PickupGlowFX[i].GlowModel != None)
		{
			if (PickGlowFXActor[i] == None)
			{
				if (PickupGlowFX[i].GlowSetClass == None)
					PickGlowFXActor[i] = Spawn(Class'NWOverPickupFX', Self);
				else
					PickGlowFXActor[i] = Spawn(PickupGlowFX[i].GlowSetClass, Self);
					
				GiveOvProperties(PickGlowFXActor[i], True, i);
				PickGlowFXActor[i].SetLODBias();
			}
			
			if (PickGlowFXActor[i] != None)
				PickGlowFXActor[i].bHidden = False;
			
			i++;
		}
		
		i = 0;
		
		while (i < ArrayCount(PickupOverFX) && PickupOverFX[i].GlowStyle != STY_None)
		{
			if (PickOverFXActor[i] == None)
			{
				if (PickupOverFX[i].OverlModelClass == None)
					PickOverFXActor[i] = Spawn(Class'NWOverPickupFX', Self);
				else	
					PickOverFXActor[i] = Spawn(PickupOverFX[i].OverlModelClass, Self);
				
				GiveOvProperties( PickOverFXActor[i], False, i);
				PickOverFXActor[i].SetLODBias();
			}
			
			if (PickOverFXActor[i] != None)
				PickOverFXActor[i].bHidden = False;
			
			i++;
		}
	}
}

function SetPickupOvFX()
{
local byte i;

	if (bModified && Overlayer != None)
	{
		if (PickupOv == None)
		{
			PickupOv = Spawn(Class'NWOverPickupFX', Self);
			PickupOv.bUnLit = True;
			PickupOv.Mesh = PickupViewMesh;
			PickupOv.Style = STY_Translucent;
			PickupOv.ScaleGlow = 1.8;
			PickupOv.DrawScale = PickupViewScale;
			
			PickupOv.SetLODBias();
			PickupOv.SetHiddenessUpdating();
		}
		else
			PickupOv.Mesh = PickupViewMesh;
		
		for (i = 1; i < 8; i++)
			PickupOv.MultiSkins[i] = Overlayer;
		PickupOv.MultiSkins[0] = Texture'TranslucInvis';
		PickupOv.Texture = Overlayer;
		
		PickupOv.bHidden = bHidden;
	}
}

function SetHiddenOverlayers(bool bHide)
{
local byte i;

	if (Level.NetMode == NM_StandAlone)
	{
		if (bHide)
		{
			if (PickupOv != None)
				PickupOv.HideOv();
			
			for (i = 0; i < ArrayCount(PickupGlowFX); i++)
			{
				if (PickGlowFXActor[i] != None)
					PickGlowFXActor[i].HideOv();
			}
				
			for (i = 0; i < ArrayCount(PickupOverFX); i++)
			{
				if (PickOverFXActor[i] != None)
					PickOverFXActor[i].HideOv();
			}
		}
		else
		{
			if (PickupOv != None)
				PickupOv.UnHideOv();
			
			for (i = 0; i < ArrayCount(PickupGlowFX); i++)
			{
				if (PickGlowFXActor[i] != None)
					PickGlowFXActor[i].UnHideOv();
			}
				
			for (i = 0; i < ArrayCount(PickupOverFX); i++)
			{
				if (PickOverFXActor[i] != None)
					PickOverFXActor[i].UnHideOv();
			}
		}
	}
}

function BecomePickup()
{
	Super.BecomePickup();
	SetHiddenOverlayers(False);
	SetNormalViewWeapon();
	setNetUpdateFrequency();
}

//Set first person overlayers/effects
simulated function SetFirstPersonFX()
{
	local byte i;

	if (default.bWeaponFX)
	{
		while (i < ArrayCount(FirstPersonGlowFX) && FirstPersonGlowFX[i].GlowModel != None)
		{
			if (FirstGlowFXActor[i] == None)
			{
				FirstGlowFXActor[i] = Spawn(Class'NWeaponOverFX', Self);
				FirstGlowFXActor[i].PrePivot = PrePivot;
				FirstGlowFXActor[i].bUnLit = FirstPersonGlowFX[i].bLit;
				FirstGlowFXActor[i].bRandomFrame = FirstPersonGlowFX[i].bRandFrame;
				FirstGlowFXActor[i].Mesh = FirstPersonGlowFX[i].GlowModel;
				FirstGlowFXActor[i].Style = FirstPersonGlowFX[i].GlowStyle;
				FirstGlowFXActor[i].ScaleGlow = FirstPersonGlowFX[i].GlowAmount;
				FirstGlowFXActor[i].DrawScale = FirstPersonGlowFX[i].GlowTexScale;
				FirstGlowFXActor[i].AmbientGlow = FirstPersonGlowFX[i].PulsingGlow;
				if (FirstPersonGlowFX[i].GlowTex1 != None && !FirstPersonGlowFX[i].bRandFrame)
					FirstGlowFXActor[i].Texture = FirstPersonGlowFX[i].GlowTex1;
				else
					FirstGlowFXActor[i].Texture = Texture'TranslucInvis';
				FirstGlowFXActor[i].LodBIAS = default.LodBIAS;
				FirstGlowFXActor[i].bAnimByOwner = False;
				
				if (FirstPersonGlowFX[i].bRandFrame)
				{
					FirstGlowFXActor[i].MultiSkins[0] = FirstPersonGlowFX[i].GlowTex1;
					FirstGlowFXActor[i].MultiSkins[1] = FirstPersonGlowFX[i].GlowTex2;
					FirstGlowFXActor[i].MultiSkins[2] = FirstPersonGlowFX[i].GlowTex3;
					FirstGlowFXActor[i].MultiSkins[3] = FirstPersonGlowFX[i].GlowTex4;
					FirstGlowFXActor[i].MultiSkins[4] = FirstPersonGlowFX[i].GlowTex5;
					FirstGlowFXActor[i].MultiSkins[5] = FirstPersonGlowFX[i].GlowTex6;
					FirstGlowFXActor[i].MultiSkins[6] = FirstPersonGlowFX[i].GlowTex7;
					FirstGlowFXActor[i].MultiSkins[7] = FirstPersonGlowFX[i].GlowTex8;
				}
				
				if (FirstGlowFXActor[i].Texture == None)
				{
					FirstGlowFXActor[i].Texture = Texture'TranslucInvis';
					FirstGlowFXActor[i].MultiSkins[1] = Texture'TranslucInvis';
				}
				
				FirstGlowFXActor[i].Fatness = Fatness;
				FirstGlowFXActor[i].bParticles = True;
				FirstGlowFXActor[i].bHidden = True;
			}
			
			i++;
		}
		
		i = 0;
		
		while (i < ArrayCount(FirstPersonOverFX) && FirstPersonOverFX[i].GlowStyle != STY_None)
		{
			if (FirstOverFXActor[i] == None)
			{
				FirstOverFXActor[i] = Spawn(Class'NWeaponOverFX', Self);
				FirstOverFXActor[i].bUnLit = FirstPersonOverFX[i].bLit;
				FirstOverFXActor[i].bMeshEnviroMap = FirstPersonOverFX[i].bEnviromentMode;
				
				if (!FirstPersonOverFX[i].bCustomMesh)
					FirstOverFXActor[i].Mesh = PlayerViewMesh;
				else
					FirstOverFXActor[i].Mesh = FirstPersonOverFX[i].CustomMesh;
					
				FirstOverFXActor[i].Style = FirstPersonOverFX[i].GlowStyle;
				FirstOverFXActor[i].ScaleGlow = FirstPersonOverFX[i].GlowAmount;
				FirstOverFXActor[i].DrawScale = PlayerViewScale;
				FirstOverFXActor[i].AmbientGlow = FirstPersonOverFX[i].PulsingGlow;
				FirstOverFXActor[i].Texture = FirstPersonOverFX[i].OverMainTex;
				FirstOverFXActor[i].LodBIAS = default.LodBIAS;
				FirstOverFXActor[i].MultiSkins[0] = Texture'TranslucInvis';
				FirstOverFXActor[i].MultiSkins[1] = FirstPersonOverFX[i].OverTex1;
				FirstOverFXActor[i].MultiSkins[2] = FirstPersonOverFX[i].OverTex2;
				FirstOverFXActor[i].MultiSkins[3] = FirstPersonOverFX[i].OverTex3;
				FirstOverFXActor[i].MultiSkins[4] = FirstPersonOverFX[i].OverTex4;
				FirstOverFXActor[i].MultiSkins[5] = FirstPersonOverFX[i].OverTex5;
				FirstOverFXActor[i].MultiSkins[6] = FirstPersonOverFX[i].OverTex6;
				FirstOverFXActor[i].MultiSkins[7] = FirstPersonOverFX[i].OverTex7;
				FirstOverFXActor[i].Fatness = Fatness;
				FirstOverFXActor[i].bHidden = True;
			}
			
			i++;
		}
	}
}

simulated function Tick(float Delta)
{
local Inventory Inv;

	if (Class'NWInfo'.default.enableSmartPerformanceWeapon && Level.NetMode != NM_DedicatedServer)
		LODBias = Class'NWUtils'.static.getFrameRateBasedLODBias(Level, Delta, LODBias);
	
	if (NAmbWeapSnd != None)
	{
		if (Pawn(Owner) == None && NAmbWeapSnd.AmbientSound != None)
			NAmbWeapSnd.AmbientSound = None;
		else if (Pawn(Owner) != None)
		{
			if (NAmbWeapSnd.Owner != Pawn(Owner))
				NAmbWeapSnd.SetOwner(Pawn(Owner));
			
			if (Pawn(Owner).Weapon == Self)
			{
				if (isInFireState())
				{
					if (NAmbWeapSnd.AmbientSound != FiringAmbSound)
						NAmbWeapSnd.AmbientSound = FiringAmbSound;
					NAmbWeapSnd.SoundVolume = FiringSndVol;
					NAmbWeapSnd.SoundPitch = FiringSndPitch;
					NAmbWeapSnd.SoundRadius = FiringSndRadius;
				}
				else if (isInFireState(True))
				{
					if (NAmbWeapSnd.AmbientSound != AltFiringAmbSound)
						NAmbWeapSnd.AmbientSound = AltFiringAmbSound;
					NAmbWeapSnd.SoundVolume = AltFiringSndVol;
					NAmbWeapSnd.SoundPitch = AltFiringSndPitch;
					NAmbWeapSnd.SoundRadius = AltFiringSndRadius;
				}
				else if (NAmbWeapSnd.AmbientSound != None)
					NAmbWeapSnd.AmbientSound = None;
			}
			else if (NAmbWeapSnd.AmbientSound != None)
				NAmbWeapSnd.AmbientSound = None;
		}
	}
	
	if (Role == ROLE_Authority && enableZP)
		lastZPShotTime += Delta;
	
	TickControl += Delta;
	if (TickControl > 0.2)
	{
		TickControl = 0.0;
		
		if (Role == ROLE_Authority && Pawn(Owner) != None)
		{
			Inv = Class'NWUtils'.static.getInventory(Pawn(Owner), 'UT_ShieldBelt');
			if (UT_ShieldBelt(Inv) != None && UT_ShieldBelt(Inv).MyEffect != None)
				UTShieldFXTex = UT_ShieldBelt(Inv).MyEffect.Texture;
			else
				UTShieldFXTex = None;
		}
	}
}

simulated function bool isInFireState(optional bool bAltFire)
{
	if (!bAltFire)
		return ((Pawn(Owner).bFire != 0 || IsInState('ClientFiring') || IsInState('NormalFire')) && 
		!IsInState('DownWeapon') && !IsInState('ClientAltFiring') && !IsInState('AltFiring'));
	return ((Pawn(Owner).bAltFire != 0 || IsInState('ClientAltFiring') || IsInState('AltFiring')) && 
	!IsInState('DownWeapon') && !IsInState('ClientFiring') && !IsInState('NormalFire'));
}

simulated function Destroyed()
{
local byte i, j;

	if (OV != None)
		OV.Destroy();
	if (PickupOv != None)
		PickupOv.Destroy();
	if (ResFX != None)
		ResFX.Destroy();
	if (WRes != None)
		WRes.Destroy();
	if (NAmbWeapSnd != None)
		NAmbWeapSnd.Destroy();
	if (pnt1 != None)
		pnt1.Destroy();
	if (pnt2 != None)
		pnt2.Destroy();
	if (NWLightFX != None)
		NWLightFX.Destroy();
		
	OV = None;
	PickupOv = None;
	ResFX = None;
	WRes = None;
	NAmbWeapSnd = None;
	pnt1 = None;
	pnt2 = None;
	NWLightFX = None;
	
	for (i = 0; i < ArrayCount(UTShieldOV); i++)
	{
		if (UTShieldOV[i] != None)
			UTShieldOV[i].Destroy();
		UTShieldOV[i] = None;
	}
		
	for (i = 0; i < ArrayCount(PickupGlowFX); i++)
	{
		if (PickGlowFXActor[i] != None)
			PickGlowFXActor[i].Destroy();
		PickGlowFXActor[i] = None;
	}
		
	for (i = 0; i < ArrayCount(PickupOverFX); i++)
	{
		if (PickOverFXActor[i] != None)
			PickOverFXActor[i].Destroy();
		PickOverFXActor[i] = None;
	}
	
	for (i = 0; i < ArrayCount(FirstPersonGlowFX); i++)
	{
		if (FirstGlowFXActor[i] != None)
			FirstGlowFXActor[i].Destroy();
		FirstGlowFXActor[i] = None;
	}
		
	for (i = 0; i < ArrayCount(FirstPersonOverFX); i++)
	{
		if (FirstOverFXActor[i] != None)
			FirstOverFXActor[i].Destroy();
		FirstOverFXActor[i] = None;
	}
	
	for (i = 0; i < ArrayCount(NaliPickupsFXList); i++)
	{	
		for (j = 0; j < ArrayCount(NaliPickupsFXList[i].OVHands); j++)
		{
			if (NaliPickupsFXList[i].OVHands[j] != None)
				NaliPickupsFXList[i].OVHands[j].Destroy();
			NaliPickupsFXList[i].OVHands[j] = None;
		}
		if (NaliPickupsFXList[i].OVWeapon != None)
			NaliPickupsFXList[i].OVWeapon.Destroy();
		NaliPickupsFXList[i].OVWeapon = None;
	}
	
	for (i = 0; i < ArrayCount(NaliPickupsOVFXList); i++)
	{
		for (j = 0; j < ArrayCount(NaliPickupsOVFXList[i].OVHands); j++)
		{
			if (NaliPickupsOVFXList[i].OVHands[j] != None)
				NaliPickupsOVFXList[i].OVHands[j].Destroy();
			NaliPickupsOVFXList[i].OVHands[j] = None;
		}
		if (NaliPickupsOVFXList[i].OVWeapon != None)
			NaliPickupsOVFXList[i].OVWeapon.Destroy();
		NaliPickupsOVFXList[i].OVWeapon = None;
	}

	Super.Destroyed();
}

simulated function TweenDown()
{
	Super.TweenDown();
	LightType = LT_None;
	setNetUpdateFrequency();
}

simulated function PlaySelect()
{
	bForceFire = false;
    bForceAltFire = false;
    bCanClientFire = false;
    if ((!IsAnimating() || (AnimSequence != 'Select')) && Mesh != PickupViewMesh && Mesh != ThirdPersonMesh)
        PlayAnim('Select',1.0,0.0);
	if (Owner != None)
		Owner.PlaySound(SelectSound, SLOT_Misc, Pawn(Owner).SoundDampening);  
	if (Level.NetMode != NM_DedicatedServer && Class'NWInfo'.default.bWeaponsDynLight)
		LightType = Default.LightType;
	
	setNetUpdateFrequency();
	CurAccuracySelector = 0;
	CurAccuracySelectorAlt = 0;
	if (Role < ROLE_Authority)
		SetupHitScan(default.enableZPClient && default.enableZPWeaponClient);
	else if (bAltHitscan)
		lastZPShotTime = 1/FMax(0.001, ZPMaxFirerateAlt);
	else
		lastZPShotTime = 1/FMax(0.001, ZPMaxFirerate);
}

simulated function setNetUpdateFrequency()
{
	NetUpdateFrequency = default.NetUpdateFrequency;
	if (Pawn(Owner) != None && Pawn(Owner).Weapon == Self)
		NetUpdateFrequency *= 10.0;
}

function DropFrom(vector StartLocation)
{
	CurrentPickFX = None;
	bLockedModifier = False;
	SetPickupOvFX();
	setNetUpdateFrequency();
	Super.DropFrom(StartLocation);
}

function SetRespawn()
{
	if (Level.Game.ShouldRespawn(self) && !cannotRespawn)
		GotoState('Sleeping');
	else
		Destroy();
}

function Inventory SpawnCopy(Pawn Other)
{
local NaliWeapons Copy;

    if (Level.Game.ShouldRespawn(self) && !cannotRespawn)
    {
        Copy = Spawn(Class, Other,,, rot(0,0,0));
        if (!bWeaponStay)
            GotoState('Sleeping');
    }
    else
        Copy = Self;
	HandleCopy(Other, Copy);
    return Copy;
}

function HandleCopy(Pawn Other, NaliWeapons Copy)
{
	Copy.Tag = Tag;
	Copy.Event = Event;
	Copy.RespawnTime = 0.0;
    Copy.bHeldItem = true;
    Copy.bTossedOut = false;
    Copy.GiveTo(Other);
	if (!bTheOne)
		GiveModifier(Copy);
    Copy.Instigator = Other;
    Copy.GiveAmmo(Other);
    Copy.SetSwitchPriority(Other);
    if ( !Other.bNeverSwitchOnPickup)
        Copy.WeaponSet(Other);
	if (bTheOne)
		Copy.ActivateTheOne();
    Copy.AmbientGlow = 0;
}

function ActivateTheOne()
{
	if (bMegaWeapon)
		return;
	bModified = True;
	bTheOne = True;
	Overlayer = StockOverlayers[6];
	SetPickupOvFX();
}

function GiveSpecificModifier( NaliWeapons Copy, byte type)
{
	if (Copy != None && !Copy.bMegaWeapon)
		GiveModifierType(Copy, type);
}

function GiveModifier( NaliWeapons Copy)
{
local float curOdds, f;

	if (bLockedModifier || Copy == None || Copy.bMegaWeapon || Copy.bModified || !default.enableModifiers)
		return;
	
	f = FRand() * (ModifFireRateOdds + ModifDmgOdds + ModifKickOdds + ModifSplashOdds + ModifHealOdds + ModifInfOdds + ModifOneOdds + ModifNoneOdds);
	curOdds = ModifInfOdds;
	if (f < curOdds)
	{
		GiveModifierType(Copy, 1);
		return;
	}
		
	curOdds += ModifKickOdds;
	if (f < curOdds)
	{
		GiveModifierType(Copy, 2);
		return;
	}
		
	curOdds += ModifDmgOdds;
	if (f < curOdds)
	{
		GiveModifierType(Copy, 3);
		return;
	}
		
	curOdds += ModifHealOdds;
	if (f < curOdds)
	{
		GiveModifierType(Copy, 4);
		return;
	}
		
	curOdds += ModifSplashOdds;
	if (f < curOdds)
	{
		GiveModifierType(Copy, 5);
		return;
	}
		
	curOdds += ModifFireRateOdds;
	if (f < curOdds)
	{
		GiveModifierType(Copy, 6);
		return;
	}
		
	curOdds += ModifOneOdds;
	if (f < curOdds)
	{
		GiveModifierType(Copy, 7);
		return;
	}
}

function GiveModifierType(NaliWeapons Copy, int type)
{
local float N, M;
local byte i;

	if (type <= 0 || type >= 8 || bLockedModifier || Copy == None)
		return;
	if (default.bAlwaysTheOne)
		type = 7;
	
	Copy.bModified = True;
	if (!Copy.bTheOne || type == 7)
		Copy.Overlayer = StockOverlayers[type - 1];
	
	i = 0;
	if (Copy.bTheOne)
	{
		if (Copy.SpecialHUD[i] != None)	i++;
		if (Copy.SpecialHUD[i] != None)	i++;
		if (i == 2 && Copy.SpecialHUD[i] != None)	return;
	}

	switch (type)
	{
		case 1:
			Copy.bInfinity = True;
			Copy.SpecialHUD[i] = ModifTexIcons[0];
			Copy.SpecialInfo[i] = "Infinity";
			break;
		case 2:
			N = FRand()*(KickBackMax - KickBackMin) + KickBackMin;		
			Copy.KickBack = Int(N);
			Copy.SpecialHUD[i] = ModifTexIcons[1];
			Copy.SpecialInfo[i] = Int(N) $ " K";
			break;
		case 3:
			M = FRand()*(MoreDamageMax - MoreDamageMin) + MoreDamageMin;
			M = Int(M*10.f)/10.f;
			N = (M - Int(M)) * 10;
			Copy.MoreDamage = M;
			Copy.SpecialHUD[i] = ModifTexIcons[2];
			Copy.SpecialInfo[i] = Int(M) $ "." $ Int(N) $ "X";
			break;
		case 4:
			Copy.HealthGiver = True;
			Copy.SpecialHUD[i] = ModifTexIcons[3];
			Copy.SpecialInfo[i] = "Health";
			break;
		case 5:
			M = FRand()*(SplasherMax - SplasherMin) + SplasherMin;
			M = Int(M*10.f)/10.f;
			N = (M - Int(M)) * 10;
			Copy.Splasher = M;
			Copy.SpecialHUD[i] = ModifTexIcons[4];
			Copy.SpecialInfo[i] = Int(M) $ "." $ Int(N) $ "X";
			break;
		case 6:
			M = FRand()*(FireRateChangeMax - FireRateChangeMin) + FireRateChangeMin;
			M = Int(M*10.f)/10.f;
			N = (M - Int(M)) * 10;
			Copy.FireRateChange = M;
			Copy.SpecialHUD[i] = ModifTexIcons[5];
			Copy.SpecialInfo[i] = Int(M) $ "." $ Int(N) $ "X";
			break;
		case 7:
			Copy.ActivateTheOne();
			break;
	}
	
	if (!Copy.bTheOne || type == 7)
		Copy.SetPickupOvFX();
}

simulated function GetCrosshairCoords(out float posX, out float posY, canvas Canvas, texture Icon, float Scale)
{
local PlayerPawn P;

	P = PlayerPawn(Owner);
	if (P == None)
		return;
		
	if (bTournamentNaliGame)
	{
		if (P.Handedness == -1)
		{
			posX = 0.503 * Canvas.ClipX - (Icon.USize/2) * Scale;
			posY = 0.504 * Canvas.ClipY - (Icon.VSize/2) * Scale;
		}
		else if (P.Handedness == 1)
		{
			posX = 0.497 * Canvas.ClipX - (Icon.USize/2) * Scale;
			posY = 0.497 * Canvas.ClipY - (Icon.VSize/2) * Scale;
		}
		else
		{
			posX = 0.5 * Canvas.ClipX - (Icon.USize/2) * Scale;
			posY = 0.5 * Canvas.ClipY - (Icon.VSize/2) * Scale;
		}
	}
	else
	{
		posX = 0.5 * Canvas.ClipX - (Icon.USize/2) * Scale;
		posY = 0.5 * Canvas.ClipY - (Icon.VSize/2) * Scale;
	}
}

simulated function color GetCrosshairColor(PlayerPawn P)
{
local color defColor;

	if (CrosshairColorType == CC_Default)
		return NameColor;
	if (CrosshairColorType == CC_ChallengeHUD)
		return (ChallengeHUD(P.myHUD).CrosshairColor * 15);
	if (CrosshairColorType == CC_Custom)
		return default.CrosshairColor;
	defColor.G = 255;
	return defColor;
}

simulated function PostRender(canvas Canvas)
{
local PlayerPawn P;
local float Scale;
local int i, j;
local float TX, TY;
local float posX, posY;
local rotator newRot;
local float HUDStartPnt;
local byte resFont;
local bool bTranslucentIcon;

	HUDStartPnt = 56.0;
	Super.PostRender(Canvas);

	PrePostRenderOther(Canvas, Canvas.ClipX/640);
	
	P = PlayerPawn(Owner);
	Scale = Canvas.ClipX/640;
	Canvas.bNoSmooth = False;
	if (ModifierIconsScale <= 0)
		ModifierIconsScale = 1.0;
	resFont = Byte(FMax(0, Class'NWUtils'.static.getResolutionFontCoef(Canvas) + Int(ModifierIconsScale-0.5)));

	if (P != None)
	{
		//-------- Crosshair rendering ---------
		//********************************************************************
		if (bOwnsCrossHair && CustomCross != None && !bNoRenderCross)
		{
			GetCrosshairCoords(posX, posY, Canvas, CustomCross, Scale * CrossHairScale);
			bTranslucentIcon = (!class'NaliWeapons'.default.bOpaqueCrosshair || bForceTranslucentCrossHair);
			if (bTranslucentIcon && class'NaliWeapons'.default.bAlphaCrosshair && CustomCrossAlpha != None)
			{
				Canvas.SetPos(posX, posY);
				Canvas.Style = ERenderStyle.STY_Modulated;
				Canvas.DrawIcon(CustomCrossAlpha, Scale * CrossHairScale);
			}
			
			Canvas.SetPos(posX, posY);
			if (bTranslucentIcon)
				Canvas.Style = ERenderStyle.STY_Translucent;
			Canvas.DrawColor = GetCrosshairColor(P);
			Canvas.DrawIcon(CustomCross, Scale * CrossHairScale);
		}
		
		//-------- Modifiers HUD icons rendering ---------
		//********************************************************************
		if (!Level.bHighDetailMode)
			Canvas.Style = ERenderStyle.STY_Normal;
		else
			Canvas.Style = ERenderStyle.STY_Translucent;

		if (bTheOne)
		{
			if (P.myHUD.IsA('ChallengeHUD'))
				Canvas.DrawColor = ChallengeHUD(P.myHUD).SolidHUDColor;
			else
				Canvas.DrawColor = BWhite;
			
			if (bLockedModifier && ModifLockTex != None)
			{
				Canvas.SetPos(0, ModifierIconsYPosTriple * Canvas.ClipY + 192*ModifierIconsScale * Scale);
				Canvas.DrawIcon(ModifLockTex, Scale/2*ModifierIconsScale);
			}
					
			for (i=0; i<3; i++)
			{
				if (P.myHUD.IsA('ChallengeHUD'))
					Canvas.DrawColor = ChallengeHUD(P.myHUD).SolidHUDColor;
				else
					Canvas.DrawColor = BWhite;
				
				Canvas.SetPos(0, ModifierIconsYPosTriple * Canvas.ClipY + (64*ModifierIconsScale*(2-i)) * Scale);
				Canvas.DrawIcon(TheOneGrid[i], Scale/2*ModifierIconsScale);
				
				if (SpecialHUD[i] != None)
				{
					if (HUDAct[i] == None)
					{
						HUDAct[i] = Spawn(Class'HUDSymb');
						for (j=0; j<3; j++)
						{
							if (HUDAct[j] != None)
								HUDAct[j].ResetRot();
						}
					}
			
					if (HUDAct[i].Texture != SpecialHUD[i])
						HUDAct[i].Texture = SpecialHUD[i];
					
					Canvas.SetPos(0, 0);
					HUDAct[i].SetLocation(Class'NWUtils'.static.HUDObjectToWorld( HUDAct[i], P, 32*ModifierIconsScale * Scale, ModifierIconsYPosTriple * Canvas.ClipY + ((HUDStartPnt + 64*(2-i) - 32)*ModifierIconsScale) * Scale, Canvas.ClipX, Canvas.ClipY, 15.0));
					HUDAct[i].DrawScale = HUDAct[i].Default.DrawScale * ModifierIconsScale;
					HUDAct[i].SetRotation(Class'NWUtils'.static.rTurn(P.ViewRotation, HUDAct[i].CurRot));
					Canvas.DrawActor(HUDAct[i], False, True);
					
					if (SpecialInfo[i] != "")
					{
						Canvas.DrawColor = FColor;
						Canvas.Font = ModifTextFont[resFont];
						Canvas.StrLen(SpecialInfo[i], TX, TY);
						Canvas.SetPos(32*ModifierIconsScale * Scale - TX/2, ModifierIconsYPosTriple * Canvas.ClipY + ((HUDStartPnt + 64*(2-i))*ModifierIconsScale) * Scale - TY + resFont);
						Canvas.DrawText(SpecialInfo[i]);
					}
				}
			}
		}
		else if (SpecialHUD[0] != None)
		{
			if (P.myHUD.IsA('ChallengeHUD'))
				Canvas.DrawColor = ChallengeHUD(P.myHUD).SolidHUDColor;
			else
				Canvas.DrawColor = BWhite;
			
			Canvas.SetPos(0, ModifierIconsYPosSingle * Canvas.ClipY + 64*ModifierIconsScale * Scale);
			Canvas.DrawIcon(SingleGrid, Scale/2*ModifierIconsScale);
			
			if (bLockedModifier && ModifLockTex != None)
			{
				Canvas.SetPos(0, ModifierIconsYPosSingle * Canvas.ClipY + 128*ModifierIconsScale * Scale);
				Canvas.DrawIcon(ModifLockTex, Scale/2*ModifierIconsScale);
			}
			
			if (HUDAct[0] == None)
				HUDAct[0] = Spawn(Class'HUDSymb');
			
			if (HUDAct[0].Texture != SpecialHUD[0])
			{
				HUDAct[0].Texture = SpecialHUD[0];
				HUDAct[0].ResetRot();
			}
			
			Canvas.SetPos(0, 0);
			HUDAct[0].SetLocation(Class'NWUtils'.static.HUDObjectToWorld(HUDAct[0], P, 32*ModifierIconsScale * Scale, ModifierIconsYPosSingle * Canvas.ClipY + ((HUDStartPnt + 32)*ModifierIconsScale) * Scale, Canvas.ClipX, Canvas.ClipY, 15.0));
			HUDAct[0].DrawScale = HUDAct[0].Default.DrawScale * ModifierIconsScale;
			HUDAct[0].SetRotation(Class'NWUtils'.static.rTurn(P.ViewRotation, HUDAct[0].CurRot));
			Canvas.DrawActor(HUDAct[0], False, True);
			
			Canvas.DrawColor = FColor;
			Canvas.Font = ModifTextFont[resFont];
			Canvas.StrLen(SpecialInfo[0], TX, TY);
			Canvas.SetPos(32*ModifierIconsScale * Scale - TX/2, ModifierIconsYPosSingle * Canvas.ClipY + (HUDStartPnt + 64)*ModifierIconsScale * Scale - TY + resFont);
			Canvas.DrawText(SpecialInfo[0]);
		}
	}
	
	if (default.bWeaponFX && P != None && !bHideWeapon)
	{
		SetFirstPersonFX();
		newRot = P.ViewRotation;
		if (P.Handedness == 0)
			newRot.Roll = -2 * Default.Rotation.Roll;
		else
			newRot.Roll = Default.Rotation.Roll * P.Handedness;
		
		for (i = 0; i < ArrayCount(FirstPersonGlowFX); i++)
		{
			if (FirstGlowFXActor[i] != None && FirstPersonGlowFX[i].bRenderOnTop)
			{
				FirstGlowFXActor[i].SetLocation(Owner.Location + CalcNewDrawOffset());
				FirstGlowFXActor[i].SetRotation(newRot);
				FirstGlowFXActor[i].Fatness = Fatness;
				FirstGlowFXActor[i].AnimSequence = AnimSequence;
				FirstGlowFXActor[i].AnimFrame = AnimFrame;
				
				if (P.Handedness == 1)
					FirstGlowFXActor[i].Mesh = FirstPersonGlowFX[i].GlowModelLeft;
				else
					FirstGlowFXActor[i].Mesh = FirstPersonGlowFX[i].GlowModel;
					
				Canvas.DrawActor(FirstGlowFXActor[i], False, True);
			}
		}
	}
	
	PostPostRenderOther(Canvas, Canvas.ClipX/640);
}

simulated function PrePostRenderOther(canvas Canvas, float Scale);		//Post rendering for subclasses
simulated function PostPostRenderOther(canvas Canvas, float Scale);		//Post rendering for subclasses

function Projectile ProjectileFire(class<projectile> ProjClass, float ProjSpeed, bool bWarn)
{
local Vector Start, X,Y,Z;
local Pawn PawnOwner;
local Projectile projT;

    PawnOwner = Pawn(Owner);
    Owner.MakeNoise(PawnOwner.SoundDampening);
    GetAxes(PawnOwner.ViewRotation,X,Y,Z);
    Start = Owner.Location + CalcNewDrawOffset() + FireOffset.X * X + FireOffset.Y * Y + FireOffset.Z * Z; 
    AdjustedAim = PawnOwner.AdjustAim(ProjSpeed, Start, AimError, True, bWarn);
	
	projT = Spawn(ProjClass,,, Start,AdjustedAim);
	if (NaliProjectile(projT) != None)
	{
		NaliProjectile(projT).Kickback = Kickback;
		NaliProjectile(projT).HealthGiver = HealthGiver;
		NaliProjectile(projT).Splasher = Splasher;
		if (bHighFireRate)
			NaliProjectile(projT).MoreDamage = GetDamageMult() * GetFirerateMult();
		else
			NaliProjectile(projT).MoreDamage = GetDamageMult();
	}
	
    return projT;
}

function Projectile AltProjectileFire(class<projectile> ProjClass, float ProjSpeed, bool bWarn)
{
    local Vector Start, X,Y,Z;
    local Pawn PawnOwner;
	local Projectile projT;

    PawnOwner = Pawn(Owner);
    Owner.MakeNoise(PawnOwner.SoundDampening);
    GetAxes(PawnOwner.ViewRotation,X,Y,Z);
    Start = Owner.Location + CalcNewDrawOffset() + AltFireOffset.X * X + AltFireOffset.Y * Y + AltFireOffset.Z * Z; 
    AdjustedAim = PawnOwner.AdjustAim(ProjSpeed, Start, AimError, True, bWarn);
	
	projT = Spawn(ProjClass,,, Start,AdjustedAim);
	if (NaliProjectile(projT) != None)
	{
		NaliProjectile(projT).Kickback = Kickback;
		NaliProjectile(projT).HealthGiver = HealthGiver;
		NaliProjectile(projT).Splasher = Splasher;
		
		if (bAltHighFireRate)
			NaliProjectile(projT).MoreDamage = GetDamageMult(True) * GetFirerateMult(True);
		else
			NaliProjectile(projT).MoreDamage = GetDamageMult(True);
	}
	
    return projT;   
}

function float GetDamageMult(optional bool bAlt)
{
local float dmg;

	dmg = FMax(MoreDamage, 1.0);
	if (bAlt)
		return (DamageMult2 * dmg);
	return (DamageMult1 * dmg);
}

simulated function float GetFirerateMult(optional bool bAlt)
{
local float frc;

	frc = FireRateChange;
	if (bAlt)
		return (FireRateMult2 * frc);
	return (FireRateMult1 * frc);
}

function Fire(float Value)
{
    if (AmmoType == None && AmmoName != None)
        GiveAmmo(Pawn(Owner));
	if (AmmoType != None)
		oldZPAmmoAmount = AmmoType.AmmoAmount;

    if (useAmmoToFire())
    {
		GotoState('NormalFire');
        bPointing = True;
        bCanClientFire = True;
        ClientFire(Value);
        if (bRapidFire || FiringSpeed > 0)
            Pawn(Owner).PlayRecoil(FiringSpeed);
			
		if (bFireHitScan)
		{
			bAltHitscan = False;
			TraceFire(GetAccuracy());
		}
		else
			ProjectileFire(ProjectileClass, ProjectileSpeed, bWarnTarget);
    }
}

function AltFire(float Value)
{
    if (AmmoType == None && AmmoName != None)
        GiveAmmo(Pawn(Owner));
	if (AmmoType != None)
		oldZPAmmoAmount = AmmoType.AmmoAmount;
	
    if (useAmmoToFire(True))
    {
		GotoState('AltFiring');
        bPointing = True;
        bCanClientFire = True;
        ClientAltFire(Value);
        if (bRapidFire || FiringSpeed > 0)
            Pawn(Owner).PlayRecoil(FiringSpeed);
		
		if (bAltFireHitScan)
		{
			bAltHitscan = True;
			TraceFire(GetAccuracy(True));
		}
		else
			AltProjectileFire(AltProjectileClass, AltProjectileSpeed, bAltWarnTarget);
	}
}

function bool useAmmoToFire(optional bool bAltFire)
{
	return (bInfinity || AmmoType.UseAmmo(1));
}

simulated function TraceFire(float Accuracy)
{
local vector HitLocation, HitNormal, StartTrace, EndTrace, X, Y, Z;
local actor Other;
local Pawn PawnOwner;
local bool bClientZPFire;
local float AccY, AccZ;
local vector fOffset;
	
	bClientZPFire = (Level.NetMode != NM_StandAlone && enableZP && !forceServerHitscan && PlayerPawn(Owner) != None &&
		Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Ping < maxZPPing);
	if ((Role < ROLE_Authority && (!bClientZPFire || PlayerPawn(Owner) == None || Viewport(PlayerPawn(Owner).Player) == None)) 
	|| (Role == ROLE_Authority && bClientZPFire))
		return;
		
	if (bClientZPFire && Role < ROLE_Authority)
	{
		if (!bAltHitscan && zpAccServerSyncID != zpAccClientSyncID)
		{
			zpAccClientSyncID = zpAccServerSyncID;
			CurAccuracySelector = zpAccServerSyncVal;
		}
		else if (bAltHitscan && zpAccServerSyncIDAlt != zpAccClientSyncIDAlt)
		{
			zpAccClientSyncIDAlt = zpAccServerSyncIDAlt;
			CurAccuracySelectorAlt = zpAccServerSyncValAlt;
		}
	}
	
	if (bAltHitscan)
		fOffset = AltFireOffset;
	else
		fOffset = FireOffset;

	PawnOwner = Pawn(Owner);
	Owner.MakeNoise(PawnOwner.SoundDampening);
	GetAxes(PawnOwner.ViewRotation, X, Y, Z);
	ProcessAccuracyYZ(bAltHitscan, Accuracy, AccY, AccZ);
	StartTrace = Owner.Location + CalcNewDrawOffset() + (fOffset >> PawnOwner.ViewRotation);
	if (Role == ROLE_Authority && PlayerPawn(Owner) == None)
		AdjustedAim = PawnOwner.AdjustAim(1000000, StartTrace, 2*AimError, False, False);
	else
		AdjustedAim = PawnOwner.ViewRotation;
	EndTrace = StartTrace + GetVectorialAccuracy(Accuracy, Y, Z, AccY, AccZ);
	X = vector(AdjustedAim);
	if (Role == ROLE_Authority)
		EndTrace += (MaxTraceRange * X);
	else
		EndTrace += (ClientMaxTraceRange * X);
	
	if (PlayerPawn(Owner) != None)
		Other = PlayerTraceShot(PawnOwner, HitLocation, HitNormal, EndTrace, StartTrace);
	else
		Other = PawnOwner.TraceShot(HitLocation, HitNormal, EndTrace, StartTrace);
	if (Other == None)
	{
		HitLocation = EndTrace;
		HitNormal = Normal(StartTrace - EndTrace);
	}
	
	ProcessWaterFX(Other, HitLocation, StartTrace);
	ProcessTraceHit(Other, HitLocation, HitNormal, X, Y, Z);
	ProcessOther(Other, HitLocation, HitNormal, StartTrace);
	if (Role < ROLE_Authority && bClientZPFire)
		ServerProcessTrace(bAltHitscan, Other, HitLocation, HitNormal, StartTrace, Other.Location, Owner.Location, Pawn(Owner).ViewRotation, Accuracy, AccY, AccZ);
}

final function ServerProcessTrace(private bool isAltFire, private actor Other, private vector HitLocation, private vector HitNormal, private vector StartTrace, 
private vector OtherClientLoc, private vector OwnerClientLoc, private rotator OwnerClientVRot, private float Accuracy, private float AccY, private float AccZ)
{
local private vector X, Y, Z;
local private bool useZP;
local private byte useStandard;

	bAltHitscan = isAltFire;
	useZP = isValidZPShot(isAltFire, Other, HitLocation, StartTrace, OtherClientLoc, OwnerClientLoc, OwnerClientVRot, Accuracy, AccY, AccZ, useStandard);
	if (!useZP)
	{
		if (useStandard == 1)
		{
			forceServerHitscan = True;
			TraceFire(Accuracy);
			forceServerHitscan = False;
			lastZPShotTime = 0.0;
		}
		return;
	}
	lastZPShotTime = 0.0;
	
	if (Other != None)
	{
		StartTrace += (Owner.Location - OwnerClientLoc);
		HitLocation += (Other.Location - OtherClientLoc);
	}
	
	GetAxes(rotator(HitLocation - StartTrace), X, Y, Z);
	ProcessWaterFX(Other, HitLocation, StartTrace);
	ProcessTraceHit(Other, HitLocation, HitNormal, X, Y, Z);
	ProcessOther(Other, HitLocation, HitNormal, StartTrace);
}

//Some security validations before accepting the ZP shot
final function bool isValidZPShot(private bool isAltFire, private Actor Other, private vector HitLoc, private vector Start, private vector OtherClientLoc, private vector OwnerClientLoc, 
private rotator OwnerClientVRot, private float Accuracy, private float AccY, private float AccZ, optional private out byte useStandardShot, optional int ignoreFlags)
{
local private float fRT, a, b;
local private float RealAccY, RealAccZ, zpFRate;
local private vector X, Y, Z, STrace, ETrace, SVectOwner;
local private int accMargin;
local private name zpLogTag;
local private string extraZPlogInfo;
local NWMutator NWM;
local private vector fOffset;

	useStandardShot = 0;
	if (PlayerPawn(Owner) == None || PlayerPawn(Owner).PlayerReplicationInfo == None)
		return False;

	zpLogTag = 'NW3ZP';
	if (enableZPDebug)
	{
		log("_______________________________________________________________________________", zpLogTag);
		log("Validating ZP hitscan...", zpLogTag);
		log("Player: "$Pawn(Owner).PlayerReplicationInfo.PlayerName, zpLogTag);
		log("Alt-fire: "$isAltFire, zpLogTag);
		if (Pawn(Other) != None && Pawn(Other).PlayerReplicationInfo != None)
			extraZPlogInfo = " => "$Pawn(Other).PlayerReplicationInfo.PlayerName;
		log("Target: "$Other$extraZPlogInfo, zpLogTag);
	}
	
	NWM = Class'NWUtils'.static.getNWMutator(Level);
	if (NWM != None && !NWM.isValidZeroPingPreCheck(isAltFire, Self, Other, HitLoc, Start, OtherClientLoc, OwnerClientLoc, 
	OwnerClientVRot, Accuracy, AccY, AccZ, useStandardShot, ignoreFlags))
	{
		if (enableZPDebug)
			log("ZP Pre validity mutator check FAILED", zpLogTag);
		return False;
	}
	else if (enableZPDebug)
		log("ZP Pre validity mutator check OK", zpLogTag);
	
	if (!checkZPPreValidity(isAltFire, Other, HitLoc, Start, OtherClientLoc, OwnerClientLoc, OwnerClientVRot, Accuracy, AccY, AccZ, useStandardShot))
	{
		if (enableZPDebug)
			log("ZP Pre validity check FAILED", zpLogTag);
		return False;
	}
	else if (enableZPDebug)
		log("ZP Pre validity check OK", zpLogTag);
		
	if ((ignoreFlags & 0x0008) != 0x0008 && !enableZP)
	{
		if (enableZPDebug)
			log("Server ZP is OFF -> using standard hitscan", zpLogTag);
		useStandardShot = 1;
		return False;
	}
	
	if ((ignoreFlags & 0x8000) != 0x8000 && ((!isAltFire && !bFireHitScan) || (isAltFire && !bAltFireHitScan)))
	{
		if (enableZPDebug)
			log("Hitscan on fire mode "$(int(isAltFire)+1)$" is OFF -> shot rejected", zpLogTag);
		return False;
	}
	
	if ((ignoreFlags & 0x0001) != 0x0001)
	{
		if (Pawn(Owner).Weapon != Self)
		{
			if (enableZPDebug)
				log("Weapon FAILED -> expected "$Pawn(Owner).Weapon$", detected "$Self, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Weapon OK -> "$Pawn(Owner).Weapon, zpLogTag);
	}
	
	if ((ignoreFlags & 0x0002) != 0x0002)
	{
		if (isAltFire)
			zpFRate = ZPMaxFirerateAlt;
		else
			zpFRate = ZPMaxFirerate;
		
		if (GetFirerateMult(isAltFire) > 0.0 && zpFRate > 0.0)
		{
			a = 1/(zpFRate * GetFirerateMult(isAltFire));
			b = ZPMinFireTimeErrorMargin;
			fRT = a - b;
		}
		if (lastZPShotTime < fRT)
		{
			if (enableZPDebug)
				log("Firerate FAILED -> expected min time of "$a$" [-"$b$"], detected "$lastZPShotTime, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Firerate OK -> "$lastZPShotTime$" (min allowed: "$a$" [-"$b$"])", zpLogTag);
	}
		
	if ((ignoreFlags & 0x0004) != 0x0004)
	{
		if (AmmoType != None && Max(oldZPAmmoAmount, AmmoType.AmmoAmount) <= 0)
		{
			if (enableZPDebug)
				log("Ammo amount FAILED", zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Ammo amount OK", zpLogTag);
	}
	
	if ((ignoreFlags & 0x000f) != 0x000f)
		ProcessAccuracyYZ(isAltFire, Accuracy, RealAccY, RealAccZ);
	
	if ((ignoreFlags & 0x0010) != 0x0010 && (Other == None || Other == Level || Mover(Other) != None))
	{
		if (enableZPDebug)
		{
			log("Level hit detected, accepting hitscan", zpLogTag);
			log("- - - ------- ~~~~ [ OK ] ~~~~ ------- - - -", zpLogTag);
			log("_______________________________________________________________________________", zpLogTag);
		}
		return True;
	}
		
	useStandardShot = 1;
	if ((ignoreFlags & 0x0020) != 0x0020)
	{
		if ((!Other.bProjTarget && !Other.bCollideWorld) || (Other.CollisionRadius <= 0.0 && Other.CollisionRadius <= 0.0))
		{
			if (enableZPDebug)
				log("Target FAILED -> no viable collision detected on target", zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Target OK", zpLogTag);
	}
	
	if ((ignoreFlags & 0x0040) != 0x0040)
	{
		a = VSize(HitLoc-Start);
		if (a > MaxTraceRange)
		{
			if (enableZPDebug)
				log("Max hit distance FAILED -> expected max "$MaxTraceRange$", detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Max hit distance OK -> "$a$" (max allowed: "$MaxTraceRange$")", zpLogTag);
	}

	if ((ignoreFlags & 0x0080) != 0x0080)
	{
		a = (vector(OwnerClientVRot) dot vector(Pawn(Owner).ViewRotation));
		b = ZPMinOwnerViewPrecision;
		if (a < b)
		{
			if (enableZPDebug)
				log("Owner view direction FAILED -> expected min "$b$", detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Owner view direction OK -> "$a$" (min allowed: "$b$")", zpLogTag);
	}
	
	if ((ignoreFlags & 0x00f0) != 0x00f0)
	{
		if (Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Ping > maxZPPing)
		{
			if (enableZPDebug)
				log("Owner ping FAILED -> expected max "$maxZPPing$"ms, detected "$Pawn(Owner).PlayerReplicationInfo.Ping$"ms", zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Owner ping OK -> "$Pawn(Owner).PlayerReplicationInfo.Ping$"ms (max allowed: "$maxZPPing$"ms)", zpLogTag);
	}
	
	if (enableZPLevelBlockValidation && (ignoreFlags & 0x0100) != 0x0100)
	{
		if (!FastTrace(HitLoc, Start))
		{
			if (enableZPDebug)
				log("Hitscan trace FAILED -> BSP detected during the shot", zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Hitscan trace OK", zpLogTag);
	}
	
	if ((ignoreFlags & 0x0200) != 0x0200)
	{
		a = Abs(HitLoc.Z - OtherClientLoc.Z);
		b = ZPHitColHeighMaxMargin;
		if (a > (Other.CollisionHeight + ZPHitColHeighMaxMargin))
		{
			if (enableZPDebug)
				log("Hit location Z FAILED -> expected max "$Other.CollisionHeight$" [+"$b$"], detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Hit location Z OK -> "$a$" (max allowed: "$Other.CollisionHeight$" [+"$b$"])", zpLogTag);
	}

	if ((ignoreFlags & 0x0400) != 0x0400)
	{
		a = VSize(vect(1,1,0)*(HitLoc - OtherClientLoc));
		b = ZPHitColRadiusMaxMargin;
		if (a > (Other.CollisionRadius + ZPHitColRadiusMaxMargin))
		{
			if (enableZPDebug)
				log("Hit location XY FAILED -> expected max "$Other.CollisionRadius$" [+"$b$"], detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Hit location XY OK -> "$a$" (max allowed: "$Other.CollisionRadius$" [+"$b$"])", zpLogTag);
	}
	
	if ((ignoreFlags & 0x0800) != 0x0800)
	{
		SVectOwner = GetZPValidityStartTrace(isAltFire, OwnerClientLoc, OwnerClientVRot);
		a = VSize(SVectOwner - Start);
		b = ZPHitStartMaxMargin;
		if (a > b)
		{
			if (enableZPDebug)
				log("Hitscan start location FAILED -> expected max "$b$", detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Hitscan start location OK -> "$a$" (max allowed: "$b$")", zpLogTag);
	}
	
	if ((ignoreFlags & 0x0f00) != 0x0f00)
	{
		a = VSize(OwnerClientLoc - Owner.Location);
		b = ZPOwnerLocationMaxMargin;
		if (a > b)
		{
			if (enableZPDebug)
				log("Owner location FAILED -> expected max "$b$", detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Owner location OK -> "$a$" (max allowed: "$b$")", zpLogTag);
	}
	
	if ((ignoreFlags & 0x1000) != 0x1000)
	{
		a = VSize(OtherClientLoc - Other.Location);
		b = ZPOtherLocationMaxMargin;
		if (a > b)
		{
			if (enableZPDebug)
				log("Target location FAILED -> expected max "$b$", detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Target location OK -> "$a$" (max allowed: "$b$")", zpLogTag);
	}
	
	if (enableZPAccuracyValidation && (ignoreFlags & 0x2000) != 0x2000)
	{
		if (RealAccY != AccY || RealAccZ != AccZ)
		{
			if (ZPAccuracySyncMaxError > 0)
			{
				accMargin = GetZPAccuracyErrorMargin(isAltFire, Accuracy, AccY, AccZ, RealAccY, RealAccZ);
				if (accMargin < 0 || accMargin > ZPAccuracySyncMaxError)
				{
					if (accMargin != -2)
					{
						if (!isAltFire)
						{
							zpAccServerSyncID++;
							zpAccServerSyncVal = CurAccuracySelector;
						}
						else
						{
							zpAccServerSyncIDAlt++;
							zpAccServerSyncValAlt = CurAccuracySelectorAlt;
						}
					}
					if (enableZPDebug)
						log("Accuracy step 1/2 FAILED -> expected max "$ZPAccuracySyncMaxError$", detected "$accMargin, zpLogTag);
					return False;
				}
				else
				{
					if (accMargin > 0)
					{
						if (!isAltFire)
						{
							zpAccServerSyncID++;
							zpAccServerSyncVal = CurAccuracySelector;
						}
						else
						{
							zpAccServerSyncIDAlt++;
							zpAccServerSyncValAlt = CurAccuracySelectorAlt;
						}
					}
					RealAccY = AccY;
					RealAccZ = AccZ;
				}
			}
			else
			{
				if (enableZPDebug)
					log("Accuracy step 1/2 FAILED -> inaccurate shot", zpLogTag);
				return False;
			}
		}
		if (enableZPDebug)
			log("Accuracy step 1/2 OK -> "$accMargin$" (max allowed: "$ZPAccuracySyncMaxError$")", zpLogTag);
		
		if (isAltFire)
			fOffset = AltFireOffset;
		else
			fOffset = FireOffset;
		
		GetAxes(Pawn(Owner).ViewRotation, X, Y, Z);
		X = vector(Pawn(Owner).ViewRotation);
		STrace = Owner.Location + CalcNewDrawOffset() + (fOffset >> Pawn(Owner).ViewRotation);
		ETrace = STrace + GetVectorialAccuracy(Accuracy, Y, Z, RealAccY, RealAccZ) + MaxTraceRange*X;
		a = (Normal(ETrace-STrace) dot Normal(HitLoc-Start));
		b = ZPMinShotPrecision;
		if (a < b)
		{
			if (enableZPDebug)
				log("Accuracy step 2/2 FAILED -> expected min "$b$", detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Accuracy step 2/2 OK -> "$a$" (min allowed: "$b$")", zpLogTag);
	}
	
	if ((ignoreFlags & 0x4000) != 0x4000)
	{
		a = (Normal(Other.Location-Owner.Location) dot Normal(HitLoc-Start));
		b = ZPMinViewPrecision;
		if (a < b)
		{
			if (enableZPDebug)
				log("Hitscan trace paralelism FAILED -> expected min "$b$", detected "$a, zpLogTag);
			return False;
		}
		else if (enableZPDebug)
			log("Hitscan trace paralelism OK -> "$a$" (min allowed: "$b$")", zpLogTag);
	}
	
	useStandardShot = 0;
	if (!checkZPPostValidity(isAltFire, Other, HitLoc, Start, OtherClientLoc, OwnerClientLoc, OwnerClientVRot, Accuracy, AccY, AccZ, useStandardShot))
	{
		if (enableZPDebug)
			log("ZP Post validity check FAILED", zpLogTag);
		return False;
	}
	else if (enableZPDebug)
		log("ZP Post validity check OK", zpLogTag);
		
	if (NWM != None && !NWM.isValidZeroPingPostCheck(isAltFire, Self, Other, HitLoc, Start, OtherClientLoc, OwnerClientLoc, 
	OwnerClientVRot, Accuracy, AccY, AccZ, useStandardShot))
	{
		if (enableZPDebug)
			log("ZP Post validity mutator check FAILED", zpLogTag);
		return False;
	}
	else if (enableZPDebug)
		log("ZP Post validity mutator check OK", zpLogTag);
	
	if (enableZPDebug)
	{
		log("- - - ------- ~~~~ [ OK ] ~~~~ ------- - - -", zpLogTag);
		log("_______________________________________________________________________________", zpLogTag);
	}
	return True;
}

function vector GetZPValidityStartTrace(bool isAltFire, vector OwnerClientLoc, rotator OwnerClientVRot)
{
local vector fOffset;

	if (isAltFire)
		fOffset = AltFireOffset;
	else
		fOffset = FireOffset;
	
	return (OwnerClientLoc + CalcNewDrawOffset() + (fOffset >> OwnerClientVRot));
}

function bool checkZPPreValidity(private bool isAltFire, private Actor Other, private vector HitLoc, private vector Start, private vector OtherClientLoc, private vector OwnerClientLoc, 
private rotator OwnerClientVRot, private float Accuracy, private float AccY, private float AccZ, optional private out byte useStandardShot)
{
	return True;
}

function bool checkZPPostValidity(private bool isAltFire, private Actor Other, private vector HitLoc, private vector Start, private vector OtherClientLoc, private vector OwnerClientLoc, 
private rotator OwnerClientVRot, private float Accuracy, private float AccY, private float AccZ, optional private out byte useStandardShot)
{
	return True;
}


final function int GetZPAccuracyErrorMargin(private bool isAltFire, private float Accuracy, private float AccY, private float AccZ, 
private float RealAccY, private float RealAccZ)
{
local int i, j, clientS, realS, dif;
local float acPattern[4];
local HAccuracy hAccList[4];

	clientS = -1;
	realS = -1;
	if (isAltFire)
	{
		for (i = 0; i < ArrayCount(acPattern); i++)
			acPattern[i] = AccuracyPatternAlt[i];
		for (i = 0; i < ArrayCount(hAccList); i++)
			hAccList[i] = HAccuracyListAlt[i];
	}
	else
	{
		for (i = 0; i < ArrayCount(acPattern); i++)
			acPattern[i] = AccuracyPattern[i];
		for (i = 0; i < ArrayCount(hAccList); i++)
			hAccList[i] = HAccuracyList[i];
	}
	
	for (i = 0; i < ArrayCount(acPattern); i++)
	{
		if (acPattern[i] == Accuracy)
		{
			for (j = 0; j < ArrayCount(hAccList[i].Accur); j++)
			{
				if (j < (ArrayCount(hAccList[i].Accur)-1))
				{
					if (AccY == hAccList[i].Accur[j] && AccZ == hAccList[i].Accur[j+1])
						clientS = j;
					else if (RealAccY == hAccList[i].Accur[j] && RealAccZ == hAccList[i].Accur[j+1])
						realS = j;
				}
				else
				{
					if (AccY == hAccList[i].Accur[j] && AccZ == hAccList[i].Accur[0])
						clientS = j;
					else if (RealAccY == hAccList[i].Accur[j] && RealAccZ == hAccList[i].Accur[0])
						realS = j;
				}
			}
			
			if (realS < 0 || clientS < 0)
				return -2;
			if (clientS < 0)
				return -1;
			if ((realS%2) == (clientS%2))
				return (Abs(clientS - realS)/2);
			return Abs((Abs(clientS - realS) - ArrayCount(hAccList[i].Accur))/2);
		}
	}
	return -1;
}

final simulated function Actor PlayerTraceShot(private Pawn PPawn, private out vector HitLoc, private out vector HitNorm, private vector End, private vector Start)
{
local private vector realHit;
local private actor Other;

	Other = PPawn.Trace(HitLoc, HitNorm, End, Start, True);
	if (Pawn(Other) != None)
	{
		realHit = HitLoc;
		if (!Pawn(Other).AdjustHitLocation(HitLoc, End - Start))
			Other = PlayerTraceShot(Pawn(Other), HitLoc, HitNorm, End, realHit);
	}
	return Other;
}

simulated function float GetAccuracy(optional bool bAltFire)
{
	if (bAltFire)
		return AccuracyPatternAlt[0];
	return AccuracyPattern[0];
}

simulated function vector GetVectorialAccuracy(float Accuracy, vector Y, vector Z, float AccY, float AccZ)
{
	return Accuracy*(AccY - 0.5 )*Y*1000 + Accuracy*(AccZ - 0.5 )*Z*1000;
}

simulated function ProcessAccuracyYZ(bool isAltFire, float Accuracy, out float AccY, out float AccZ)
{
local byte i;

	if (Accuracy == 0.0)
	{
		AccY = 0;
		AccZ = 0;
		return;
	}

	if (Level.NetMode == NM_StandAlone || !enableZP)
	{
		AccY = FRand();
		AccZ = FRand();
		return;
	}

	if (!isAltFire)
	{
		for (i = 0; i < ArrayCount(AccuracyPattern); i++)
		{
			if (AccuracyPattern[i] == Accuracy)
			{
				if (CurAccuracySelector >= (ArrayCount(HAccuracyList[i].Accur) - 1))
					CurAccuracySelector = 0;
				AccY = HAccuracyList[i].Accur[CurAccuracySelector++];
				if (CurAccuracySelector >= (ArrayCount(HAccuracyList[i].Accur) - 1))
					CurAccuracySelector = 0;
				AccZ = HAccuracyList[i].Accur[CurAccuracySelector++];
				return;
			}
		}
	}
	else
	{
		for (i = 0; i < ArrayCount(AccuracyPatternAlt); i++)
		{
			if (AccuracyPatternAlt[i] == Accuracy)
			{
				if (CurAccuracySelectorAlt >= (ArrayCount(HAccuracyListAlt[i].Accur) - 1))
					CurAccuracySelectorAlt = 0;
				AccY = HAccuracyListAlt[i].Accur[CurAccuracySelectorAlt++];
				if (CurAccuracySelectorAlt >= (ArrayCount(HAccuracyListAlt[i].Accur) - 1))
					CurAccuracySelectorAlt = 0;
				AccZ = HAccuracyListAlt[i].Accur[CurAccuracySelectorAlt++];
				return;
			}
		}
	}
}

simulated function ProcessOther(Actor Other, Vector HitLocation, Vector HitNormal, Vector StartTrace);

simulated function ProcessWaterFX(Actor Other, vector HitLoc, vector StartLoc)
{
local byte typeToUse;
local bool enteredOnWater;
local vector RealLoc;
local float TraceSize;
local ZoneInfo WZone;
local int n, div;
	
	if (!bInstantHitWaterFX || !bEnhancedWaterSplashes)
		return;
	
	if (pnt1 != None && !pnt1.bDeleteMe)
		pnt1.SetLocation(StartLoc);
	else
		pnt1 = Spawn(Class'NWPoint',,, StartLoc);
		
	if (pnt2 != None && !pnt2.bDeleteMe)
		pnt2.SetLocation(HitLoc);
	else
		pnt2 = Spawn(Class'NWPoint',,, HitLoc);
	
	if (pnt1 == None || pnt2 == None || pnt1.bDeleteMe || pnt2.bDeleteMe || VSize(pnt1.Region.Zone.ZoneVelocity) > 0.0 || 
	VSize(pnt2.Region.Zone.ZoneVelocity) > 0.0 || pnt1.Region.Zone.bWaterZone == pnt2.Region.Zone.bWaterZone)
		return;
	
	enteredOnWater = pnt2.Region.Zone.bWaterZone;
	TraceSize = VSize(HitLoc - StartLoc);
	typeToUse = WaterSplashType;
	if (!enteredOnWater && typeToUse > 0 && typeToUse < 100)
		typeToUse--;
	
	//Water zone surface detecting
	if (enteredOnWater)
	{
		n = 0;
		while(n < 20 && pnt2.Region.Zone.bWaterZone)
		{
			pnt2.Move((TraceSize/20) * Normal(StartLoc - HitLoc));
			n++;
		}
		
		n = 0;
		while(n < 20 && !pnt2.Region.Zone.bWaterZone)
		{
			RealLoc = pnt2.Location;
			pnt2.Move((TraceSize/400) * Normal(HitLoc - StartLoc));
			WZone = pnt2.Region.Zone;
			n++;
		}
	}
	else
	{
		n = 0;
		while(n < 20 && !pnt2.Region.Zone.bWaterZone)
		{
			pnt2.Move((TraceSize/20) * Normal(StartLoc - HitLoc));
			n++;
		}
		
		n = 0;
		while(n < 20 && pnt2.Region.Zone.bWaterZone)
		{
			WZone = pnt2.Region.Zone;
			pnt2.Move((TraceSize/400) * Normal(HitLoc - StartLoc));
			RealLoc = pnt2.Location;
			n++;
		}
	}
	
	//FX Spawning
	Class'NWUtils'.static.SpawnHitscanWaterSplash(Self, typeToUse, WZone, bBallisticWaterFX, RealLoc, ZPOwner);
}

simulated function vector CalcNewDrawOffset()
{
local vector DrawOffset, WeaponBob, CurrentPlayerView, ROffset;
local Pawn PawnOwner;

    PawnOwner = Pawn(Owner);
	if (PlayerPawn(PawnOwner) != None && PlayerPawn(PawnOwner).DefaultFOV >= 100)
		CurrentPlayerView = WidePlayerViewOffset;
	else
		CurrentPlayerView = PlayerViewOffset;
	
	//Select Render Offset
	ROffset = RenderOffsetSelect * 100;
	if (VSize(ROffset) > 0 && AnimMaxFrame > 0 && (AnimSequence == 'Select' || AnimSequence == 'Down'))
	{
		if (PlayerViewOffset.Y < 0)
			ROffset.Y = -ROffset.Y;
		
		if (AnimFrame < AnimMaxFrame / 2)
			CurrentPlayerView = CurrentPlayerView + (AnimFrame * ROffset / (AnimMaxFrame / 2));
		else
			CurrentPlayerView = CurrentPlayerView + ((AnimMaxFrame - AnimFrame) * ROffset / (AnimMaxFrame/2));
	}
	
	//Fire Render Offset
	ROffset = RenderOffsetFire * 100;
	if (VSize(ROffset) > 0 && AnimMaxFrameFire > 0 && AnimSequence == 'Fire')
	{
		if (PlayerViewOffset.Y < 0)
			ROffset.Y = -ROffset.Y;
		
		if (AnimFrame < AnimMaxFrameFire / 2)
			CurrentPlayerView = CurrentPlayerView + (AnimFrame * ROffset / (AnimMaxFrameFire / 2));
		else
			CurrentPlayerView = CurrentPlayerView + ((AnimMaxFrameFire - AnimFrame) * ROffset / (AnimMaxFrameFire/2));
	}
	
	//AltFire Render Offset
	ROffset = RenderOffsetAltFire * 100;
	if (VSize(ROffset) > 0 && AnimMaxFrameAltFire > 0 && AnimSequence == 'AltFire')
	{
		if (PlayerViewOffset.Y < 0)
			ROffset.Y = -ROffset.Y;
		
		if (AnimFrame < AnimMaxFrameAltFire / 2)
			CurrentPlayerView = CurrentPlayerView + (AnimFrame * ROffset / (AnimMaxFrameAltFire / 2));
		else
			CurrentPlayerView = CurrentPlayerView + ((AnimMaxFrameAltFire - AnimFrame) * ROffset / (AnimMaxFrameAltFire/2));
	}
	
    DrawOffset = ((0.9/PawnOwner.FOVAngle * CurrentPlayerView) >> PawnOwner.ViewRotation);

    if (Level.NetMode == NM_DedicatedServer || (Level.NetMode == NM_ListenServer && Owner.RemoteRole == ROLE_AutonomousProxy))
        DrawOffset += (PawnOwner.BaseEyeHeight * vect(0,0,1));
    else
    {   
        DrawOffset += (PawnOwner.EyeHeight * vect(0,0,1));
        WeaponBob = BobDamping * PawnOwner.WalkBob;
        WeaponBob.Z = (0.45 + 0.55 * BobDamping) * PawnOwner.WalkBob.Z;
        DrawOffset += WeaponBob;
    }
    return DrawOffset;
}

simulated function RenderNWOptions(canvas Canvas)
{
local string optionTxt;
local float Scale, XTxtOffset, YTxtOffset;
local byte i;

	Canvas.Reset();
	Scale = Canvas.ClipY/480;
	Canvas.bNoSmooth = False;
	Canvas.Style = ERenderStyle.STY_Translucent;
	
	Canvas.Font = Class'FontInfo'.static.GetStaticBigFont(Canvas.ClipX);
	
	if (!bRenderCustomOnHiddenWeapon)
	{
		i = getRenderOptionIndex();
		Canvas.DrawColor = renderOptions[i].optionColor;
		optionTxt = renderOptions[i].optionText;
	}
	else
	{
		Canvas.DrawColor = getRenderCustomCanvasColor();
		optionTxt = getRenderCustomCanvasText();
	}
	
	if (Len(optionTxt) <= 0)
		return;
	
	Canvas.TextSize(optionTxt, XTxtOffset, YTxtOffset);
	XTxtOffset = (Canvas.ClipX - XTxtOffset - 16*Scale);
	
	Canvas.SetPos(XTxtOffset, Canvas.ClipY*0.85);
	Canvas.DrawText(optionTxt);
}

simulated function string getRenderCustomCanvasText()
{
	return "";
}

simulated function color getRenderCustomCanvasColor()
{
local color c;

	c.R = 255;
	c.G = 255;
	c.B = 255;
	
	return c;
}

simulated function byte getRenderOptionIndex()
{
	return 0;
}

simulated event RenderOverlays(canvas Canvas)
{
local rotator NewRot;
local bool bPlayerOwner;
local int Hand;
local PlayerPawn PlayerOwner;
local byte i, j;
local byte HandsFatness;
local bool hasShieldbelt, hasUDamage, hasInvisibility;
local NaliPickupsFX NPFX;

    if (bHideWeapon || Owner == None)
	{
		if (bRenderOptionsOnHiddenWeapon || bRenderCustomOnHiddenWeapon)
			RenderNWOptions(Canvas);
		SetNormalViewWeapon();
        return;
	}

    PlayerOwner = PlayerPawn(Owner);
    if (PlayerOwner != None)
    {
        if (PlayerOwner.DesiredFOV != PlayerOwner.DefaultFOV)
		{
			SetNormalViewWeapon();
            return;
		}
		
        bPlayerOwner = true;
        Hand = PlayerOwner.Handedness;
		if (bAlwaysRender && Hand == 2)
			Hand = 0;
        if (Level.NetMode == NM_Client && Hand == 2)
        {
            bHideWeapon = true;
			SetNormalViewWeapon();
            return;
        }
    }
	else
		return;

    if (!bPlayerOwner || PlayerOwner.Player == None)
        PlayerOwner.WalkBob = vect(0,0,0);

    if (bMuzzleFlash > 0 && bDrawMuzzleFlash && Level.bHighDetailMode && MFTexture != None)
    {
        MuzzleScale = Default.MuzzleScale * Canvas.ClipX/640.0;
        if (!bSetFlashTime)
        {
            bSetFlashTime = true;
            FlashTime = Level.TimeSeconds + FlashLength;
        }
        else if (FlashTime < Level.TimeSeconds)
            bMuzzleFlash = 0;
        if (bMuzzleFlash > 0)
        {
            if ( Hand == 0 )
                Canvas.SetPos(Canvas.ClipX/2 - 0.5 * MuzzleScale * FlashS + Canvas.ClipX * (-0.2 * Default.FireOffset.Y * FlashO), Canvas.ClipY/2 - 0.5 * MuzzleScale * FlashS + Canvas.ClipY * (FlashY + FlashC));
            else
                Canvas.SetPos(Canvas.ClipX/2 - 0.5 * MuzzleScale * FlashS + Canvas.ClipX * (Hand * Default.FireOffset.Y * FlashO), Canvas.ClipY/2 - 0.5 * MuzzleScale * FlashS + Canvas.ClipY * FlashY);

            Canvas.Style = 3;
            Canvas.DrawIcon(MFTexture, MuzzleScale);
            Canvas.Style = 1;
        }
    }
    else
        bSetFlashTime = false;

    SetLocation(PlayerOwner.Location + CalcNewDrawOffset());
    NewRot = PlayerOwner.ViewRotation;
    if (Hand == 0)
        newRot.Roll = -2 * Default.Rotation.Roll;
    else
        newRot.Roll = Default.Rotation.Roll * Hand;
    setRotation(newRot);
	
	//Nali Pickups rendering init
	hasInvisibility = Class'NWUtils'.static.hasInventory(PlayerOwner, 'UT_Invisibility', Role < ROLE_Authority);
	hasUDamage = Class'NWUtils'.static.hasInventory(PlayerOwner, 'UDamage', Role < ROLE_Authority);
	hasShieldbelt = Class'NWUtils'.static.hasInventory(PlayerOwner, 'UT_ShieldBelt', Role < ROLE_Authority);
	PrepareNaliPickupsFX(True);
	
	if (hasInvisibility)
		SetInvisibilityDisplay();
	else if (hasUDamage)
		SetUDamageDisplay();
	else
	{
		NPFX = GetNaliPickupsFXInnerEffect();
		if (NPFX.Pickup != None)
			NPFX.Pickup.ProcessWeaponFX(Self);
		else
			SetDefaultDisplay();
	}
	
	if (!bRenderHandsOnly)
		Canvas.DrawActor(Self, False, False);	//Weapon rendering
	
	RenderOther(Canvas, Location, Rotation);
	
	//Inner overlayers rendering
	//***************************************
	if (!bRenderHandsOnly && default.bWeaponFX)
	{
		SetFirstPersonFX();
		
		for (i = 0; i < ArrayCount(FirstPersonGlowFX); i++)
		{
			if (FirstGlowFXActor[i] != None && !FirstPersonGlowFX[i].bRenderOnTop)
			{
				FirstGlowFXActor[i].SetLocation(Location);
				FirstGlowFXActor[i].SetRotation(newRot);
				FirstGlowFXActor[i].Fatness = Fatness;
				FirstGlowFXActor[i].AnimSequence = AnimSequence;
				FirstGlowFXActor[i].AnimFrame = AnimFrame;
				
				if (PlayerOwner.Handedness == 1)
					FirstGlowFXActor[i].Mesh = FirstPersonGlowFX[i].GlowModelLeft;
				else
					FirstGlowFXActor[i].Mesh = FirstPersonGlowFX[i].GlowModel;
					
				Canvas.DrawActor(FirstGlowFXActor[i], False, False);
			}
		}
			
		for (i = 0; i < ArrayCount(FirstPersonOverFX); i++)
		{
			if (FirstOverFXActor[i] != None)
			{
				FirstOverFXActor[i].SetLocation(Location);
				FirstOverFXActor[i].SetRotation(newRot);
				FirstOverFXActor[i].Fatness = Fatness;
				
				if (!FirstPersonOverFX[i].bCustomMesh)
					FirstOverFXActor[i].Mesh = Mesh;
				else if (PlayerOwner.Handedness == 1)
					FirstOverFXActor[i].Mesh = FirstPersonOverFX[i].CustomMeshLeft;
				else
					FirstOverFXActor[i].Mesh = FirstPersonOverFX[i].CustomMesh;
				
				Canvas.DrawActor(FirstOverFXActor[i], False, False);
			}
		}
	}
	
	//Modifier overlayers rendering
	//***************************************
	if (!bRenderHandsOnly && OV != None)
	{
		if (PlayerOwner == None || OV.Texture != Overlayer)
		{
			OV.Destroy();
			OV = None;
		}
		else
		{
			OV.SetLocation(Location);
			OV.SetRotation(newRot);
			OV.Fatness = Fatness;
			OV.Mesh = Mesh;
			Canvas.DrawActor(OV, False, False);
			if (CurrentHand != Hand)
				CurrentHand = Hand;
		}
	}
	else if (Overlayer != None && OV == None && PlayerOwner != None)
	{
		OV = Spawn(Class'NWeaponOverFX', Self);
		OV.bUnLit = True;
		OV.Mesh = PlayerViewMesh;
		OV.Style = STY_Translucent;
		OV.ScaleGlow = 1.8;
		OV.DrawScale = PlayerViewScale;
		OV.Texture = Overlayer;
		for (i = 0; i < 8; i++)
			OV.MultiSkins[i] = Overlayer;
		OV.MultiSkins[0] = Texture'TranslucInvis';
		OV.bHidden = True;
	}

	//Effective inventory fx (Udamage, invis, etc) [WEAPON SIDE]
	if (!bRenderHandsOnly && PlayerOwner != None && !hasInvisibility && !hasUDamage)
	{
		for (i = 0; i < ArrayCount(NaliPickupsFXList); i++)
		{
			if (NaliPickupsFXList[i].Pickup != None && NaliPickupsFXList[i].OVWeapon != None)
			{
				NaliPickupsFXList[i].OVWeapon.SetLocation(Location);
				NaliPickupsFXList[i].OVWeapon.SetRotation(newRot);
				NaliPickupsFXList[i].OVWeapon.Mesh = Mesh;
				NaliPickupsFXList[i].Pickup.ProcessWeaponOverlayFX(NaliPickupsFXList[i].OVWeapon);
				NaliPickupsFXList[i].OVWeapon.Fatness = Byte(FMin(Fatness + NaliPickupsFXList[i].Pickup.WeaponFXOverlayExtraFatness, 255));
				Canvas.DrawActor(NaliPickupsFXList[i].OVWeapon, False, False);
			}
		}
	}
	
	//Hands rendering
	if (default.bSeeWeaponHand || bForceHands)
	{
		NPFX = GetNaliPickupsFXInnerEffect(True);		
		for (i = 0; i < ArrayCount(HandPart); i++)
		{
			if (HandPart[i] != None)
			{
				if (HandsInfoObj != None)
				{
					HandPart[i].MultiSkins[1] = HandsInfoObj.GetHandTexture(PlayerOwner, HandsFatness);
					if (HandPart[i].MultiSkins[1] == None)
						HandPart[i].MultiSkins[1] = HandSkin;
				}
				else
					HandsFatness = 128;
				
				if (PlayerOwner.Handedness == 1)
					HandPart[i].Mesh = HandPartMeshL[i];
				else
					HandPart[i].Mesh = HandPartMeshR[i];
				HandPart[i].SetLocation(Location);
				HandPart[i].SetRotation(newRot);
				HandPart[i].Fatness = Byte(FClamp(HandsFatness + (PlayerOwner.Fatness - 128.f)/12.f + (HandsBaseFatness - 128.f), 0, 255));
				
				if (hasInvisibility)
				{
					HandPart[i].Style = STY_Translucent;
					HandPart[i].bMeshEnviroMap = True;
					HandPart[i].bUnlit = True;
					HandPart[i].Texture = FireTexture'UnrealShare.Belt_fx.Invis';
				}
				else if (NPFX.Pickup != None)
					NPFX.Pickup.ProcessHandsFX(HandPart[i]);
				else
				{
					HandPart[i].Style = STY_Normal;
					HandPart[i].bMeshEnviroMap = False;
					HandPart[i].bUnlit = False;
					HandPart[i].Texture = None;
				}
				
				Canvas.DrawActor(HandPart[i], False, False);
				
				//UT Shieldbelt fx
				if (hasShieldbelt && UTShieldFXTex != None && !hasInvisibility && !hasNullifyHandsOVPickup())
				{
					if (UTShieldOV[i] == None)
					{
						UTShieldOV[i] = Spawn(Class'NWeaponOverFX', Self);
						UTShieldOV[i].bMeshEnviroMap = True;
						UTShieldOV[i].bUnlit = True;
						UTShieldOV[i].Style = STY_Translucent;
						UTShieldOV[i].ScaleGlow = 0.500000;
						UTShieldOV[i].DrawScale = PlayerViewScale;
						UTShieldOV[i].bHidden = True;
					}
					
					UTShieldOV[i].SetLocation(HandPart[i].Location);
					UTShieldOV[i].SetRotation(HandPart[i].Rotation);
					UTShieldOV[i].Mesh = HandPart[i].Mesh;
					UTShieldOV[i].Fatness = Byte(FMin(HandPart[i].Fatness + 2.f, 255));
					UTShieldOV[i].Texture = UTShieldFXTex;
					Canvas.DrawActor(UTShieldOV[i], False, False);
				}
				
				//Effective inventory fx (Udamage, invis, etc) [HAND SIDE]
				for (j = 0; j < ArrayCount(NaliPickupsFXList); j++)
				{
					if (NaliPickupsFXList[j].Pickup != None && NaliPickupsFXList[j].OVHands[i] != None)
					{
						NaliPickupsFXList[j].OVHands[i].SetLocation(HandPart[i].Location);
						NaliPickupsFXList[j].OVHands[i].SetRotation(HandPart[i].Rotation);
						NaliPickupsFXList[j].OVHands[i].Mesh = HandPart[i].Mesh;
						NaliPickupsFXList[j].Pickup.ProcessHandsFXOverlay(NaliPickupsFXList[j].OVHands[i]);
						NaliPickupsFXList[j].OVHands[i].Fatness = Byte(FMin(HandPart[i].Fatness + NaliPickupsFXList[j].Pickup.HandsFXOverlayExtraFatness, 255));
						Canvas.DrawActor(NaliPickupsFXList[j].OVHands[i], False, False);
					}
				}
			}
			else if (HandPartMeshL[i] != None && HandPartMeshR[i] != None)
			{
				HandPart[i] = Spawn(Class'NWeaponOverFX', Self);
				if (PlayerOwner.Handedness == -1)
					HandPart[i].Mesh = HandPartMeshL[i];
				else
					HandPart[i].Mesh = HandPartMeshR[i];
				HandPart[i].DrawScale = PlayerViewScale;
				HandPart[i].bHidden = True;
				HandPart[i].MultiSkins[1] = HandSkin;
			}
		}
	}

	SetNormalViewWeapon(True);
}

simulated function RenderOther(canvas Canvas, vector Loc, rotator Rot);	//Function to render further parts without replace the entire renderoverlays

simulated function SetNormalViewWeapon(optional bool bPreparedFX)
{
local NaliPickupsFX NPFX;

	if (Pawn(Owner) != None)
	{
		if (Class'NWUtils'.static.hasInventory(Pawn(Owner), 'UT_Invisibility', Role < ROLE_Authority))
			SetInvisibilityDisplay();
		else if (Class'NWUtils'.static.hasInventory(Pawn(Owner), 'UDamage', Role < ROLE_Authority))
			SetUDamageDisplay();
		else
		{
			if (!bPreparedFX)
				PrepareNaliPickupsFX();
			NPFX = GetNaliPickupsFXInnerEffect(False, True);
			if (NPFX.Pickup != None)
				NPFX.Pickup.ProcessThirdWeaponFX(Self);
			else
				SetDefaultDisplay();
		}
	}
	else
		SetDefaultDisplay();
}

simulated function SetUDamageDisplay()
{
	Texture = FireTexture'UnrealShare.Belt_fx.UDamageFX';
	bMeshEnviroMap = True;
	bUnlit = True;
	Style = STY_Translucent;
}

simulated function SetInvisibilityDisplay()
{
	Texture = FireTexture'UnrealShare.Belt_fx.Invis';
	bMeshEnviroMap = True;
	bUnlit = True;
	Style = STY_Translucent;
}

simulated function SetDefaultDisplay()
{
local byte i;

	Texture = default.Texture;
	if (bMeshEnviroMap && MultiSkins[0] != default.MultiSkins[0])
	{
		for (i = 0; i < ArrayCount(MultiSkins); i++)
			MultiSkins[i] = default.MultiSkins[i];
	}
	Style = default.Style;
	bMeshEnviroMap = default.bMeshEnviroMap;
	bUnlit = default.bUnlit;
}

simulated function bool hasNullifyHandsOVPickup()
{
local byte i;

	for (i = 0; i < ArrayCount(NaliPickupsFXList); i++)
	{
		if (NaliPickupsFXList[i].Pickup != None && NaliPickupsFXList[i].Pickup.bNullifyOtherHandsOverlayerFX)
			return True;
	}
	return False;
}

simulated function PrepareNaliPickupsFX(optional bool bRenderOverlays)
{
local Inventory Inv;
local bool bClient;
local int i, j;
local byte npIndex;
local NaliPickups NP;

	if (Pawn(Owner) == None)
		return;
		
	bClient = (Level.NetMode != NM_StandAlone && Role < ROLE_Authority);
	ResetNaliPickupsFXList();
	for (Inv = Pawn(Owner).Inventory; Inv != None; Inv = Inv.Inventory)
	{
		NP = NaliPickups(Inv);
		if (NP != None && (NP.bActiveForWeapon || NP.bActiveForWeaponOV || NP.bActiveForHands || NP.bActiveForHandsOV))
			AddToNaliPickupsFXList(NP);
		
		if (bClient)
		{
			i++;
			if (i > 1000)
				break;	//Epic notes that in the client this list may temporarily loop forever
		}
	}
	
	if (bRenderOverlays)
	{
		for (i = 0; i < ArrayCount(NaliPickupsOVFXList); i++)
		{
			if (NaliPickupsOVFXList[i].Pickup != None)
			{
				if (((NaliPickupsOVFXList[i].OVHands[0] == None || NaliPickupsOVFXList[i].OVHands[0].bDeleteMe) &&
				(NaliPickupsOVFXList[i].OVHands[1] == None || NaliPickupsOVFXList[i].OVHands[1].bDeleteMe) &&
				(NaliPickupsOVFXList[i].OVWeapon == None || NaliPickupsOVFXList[i].OVWeapon.bDeleteMe)) || 
				!ExistsInNaliPickupsFXList(NaliPickupsOVFXList[i].Pickup, npIndex))
				{
					for (j = 0; j < ArrayCount(NaliPickupsOVFXList[i].OVHands); j++)
					{
						if (NaliPickupsOVFXList[i].OVHands[j] != None)
							NaliPickupsOVFXList[i].OVHands[j].Destroy();
						NaliPickupsOVFXList[i].OVHands[j] = None;
					}
					NaliPickupsOVFXList[i].Pickup = None;
					if (NaliPickupsOVFXList[i].OVWeapon != None)
						NaliPickupsOVFXList[i].OVWeapon.Destroy();
					NaliPickupsOVFXList[i].OVWeapon = None;
				}
				else
				{
					for (j = 0; j < ArrayCount(NaliPickupsFXList[i].OVHands); j++)
						NaliPickupsFXList[npIndex].OVHands[j] = NaliPickupsOVFXList[i].OVHands[j];
					NaliPickupsFXList[npIndex].OVWeapon = NaliPickupsOVFXList[i].OVWeapon;
				}
			}
		}
		
		for (i = 0; i < ArrayCount(NaliPickupsFXList); i++)
		{
			if (NaliPickupsFXList[i].Pickup != None && (NaliPickupsFXList[i].OVHands[0] == None || NaliPickupsFXList[i].OVHands[1] == None || NaliPickupsFXList[i].OVWeapon == None))
			{
				for (j = 0; j < ArrayCount(NaliPickupsFXList[i].OVHands); j++)
				{
					if (HandPart[j] != None && NaliPickupsFXList[i].bHandsOVFX && NaliPickupsFXList[i].OVHands[j] == None && NaliPickupsFXList[i].Pickup.HandsFXOverlayClass != None)
					{
						NaliPickupsFXList[i].OVHands[j] = Spawn(NaliPickupsFXList[i].Pickup.HandsFXOverlayClass, Self);
						NaliPickupsFXList[i].OVHands[j].DrawScale = PlayerViewScale;
						NaliPickupsFXList[i].OVHands[j].bHidden = True;
					}
				}
				
				if (NaliPickupsFXList[i].bWeaponOVFX && NaliPickupsFXList[i].OVWeapon == None && NaliPickupsFXList[i].Pickup.WeaponFXOverlayClass != None)
				{
					NaliPickupsFXList[i].OVWeapon = Spawn(NaliPickupsFXList[i].Pickup.WeaponFXOverlayClass, Self);
					NaliPickupsFXList[i].OVWeapon.DrawScale = PlayerViewScale;
					NaliPickupsFXList[i].OVWeapon.bHidden = True;
				}
				AddToNaliPickupsOverlayList(NaliPickupsFXList[i].Pickup, NaliPickupsFXList[i].OVHands[0], NaliPickupsFXList[i].OVHands[1], NaliPickupsFXList[i].OVWeapon);
			}
		}
	}
}

simulated function AddToNaliPickupsOverlayList(NaliPickups NP, NWeaponOverFX HandsOV1, NWeaponOverFX HandsOV2, NWeaponOverFX WeaponOV)
{
local byte i;

	if (NP == None || (HandsOV1 == None && HandsOV2 == None && WeaponOV == None))
		return;
	
	for (i = 0; i < ArrayCount(NaliPickupsOVFXList); i++)
	{
		if (NaliPickupsOVFXList[i].Pickup == NP)
		{
			NaliPickupsOVFXList[i].OVHands[0] = HandsOV1;
			NaliPickupsOVFXList[i].OVHands[1] = HandsOV2;
			NaliPickupsOVFXList[i].OVWeapon = WeaponOV;
			return;
		}
	}
	
	for (i = 0; i < ArrayCount(NaliPickupsOVFXList); i++)
	{
		if (NaliPickupsOVFXList[i].Pickup == None)
		{
			NaliPickupsOVFXList[i].Pickup = NP;
			NaliPickupsOVFXList[i].OVHands[0] = HandsOV1;
			NaliPickupsOVFXList[i].OVHands[1] = HandsOV2;
			NaliPickupsOVFXList[i].OVWeapon = WeaponOV;
			return;
		}
	}
}

simulated function ResetNaliPickupsFXList()
{
local byte i, j;

	for (i = 0; i < ArrayCount(NaliPickupsFXList); i++)
	{
		NaliPickupsFXList[i].Pickup = None;
		for (j = 0; j < ArrayCount(NaliPickupsFXList[i].OVHands); j++)
			NaliPickupsFXList[i].OVHands[j] = None;
		NaliPickupsFXList[i].OVWeapon = None;
	}
}

simulated function NaliPickupsFX GetNaliPickupsFXInnerEffect(optional bool bHands, optional bool bThirdPerson)
{
local byte i;
local NaliPickupsFX NPfx;

	for (i = 0; i < ArrayCount(NaliPickupsFXList); i++)
	{
		if (NaliPickupsFXList[i].Pickup != None && ((NaliPickupsFXList[i].bHandsFX && bHands) || (NaliPickupsFXList[i].bWeaponFX && !bHands && 
		((NaliPickupsFXList[i].Pickup.bThirdPersonWeaponFX && bThirdPerson) || (NaliPickupsFXList[i].Pickup.bWeaponFX && !bThirdPerson)))))
			return NaliPickupsFXList[i];
	}
	return NPfx;
}

simulated function bool ExistsInNaliPickupsFXList(NaliPickups NP, out byte index)
{
local byte i;

	if (NP == None)
		return False;

	for (i = 0; i < ArrayCount(NaliPickupsFXList); i++)
	{
		if (NaliPickupsFXList[i].Pickup == NP)
		{
			index = i;
			return True;
		}
		if (NaliPickupsFXList[i].Pickup == None)
			return False;
	}
	return False;
}

simulated function AddToNaliPickupsFXList(NaliPickups NP)
{
local int i, j, lSize;

	if (NP == None)
		return;
	
	lSize = ArrayCount(NaliPickupsFXList);
	for (i = 0; i < ArrayCount(NaliPickupsFXList); i++)
	{
		if (NaliPickupsFXList[i].Pickup == None)
		{
			lSize = i + 1;
			break;
		}
	}

	for (i = 0; i < lSize; i++)
	{
		if (NaliPickupsFXList[i].Pickup == None)
		{
			AddToNaliPickupsFXListByIndex(NP, i);
			return;
		}
		else if (NP.PickupPriority < NaliPickupsFXList[i].Priority)
		{
			for (j = lSize - 1; j >= i && j > 0; j--)
				NaliPickupsFXList[j] = NaliPickupsFXList[j-1];
			AddToNaliPickupsFXListByIndex(NP, i);
			return;
		}
	}
}

simulated function AddToNaliPickupsFXListByIndex(NaliPickups NP, byte i)
{
	if (NP == None || i >= ArrayCount(NaliPickupsFXList))
		return;
	
	NaliPickupsFXList[i].Pickup = NP;
	NaliPickupsFXList[i].Priority = NP.PickupPriority;
	NaliPickupsFXList[i].bHandsFX = NP.bActiveForHands;
	NaliPickupsFXList[i].bHandsOVFX = NP.bActiveForHandsOV;
	NaliPickupsFXList[i].bWeaponFX = NP.bActiveForWeapon;
	NaliPickupsFXList[i].bWeaponOVFX = NP.bActiveForWeaponOV;
}



auto state Pickup
{
ignores AnimEnd;

	simulated function BeginState()
	{
		Super.BeginState();
		SetNormalViewWeapon();
	}
}

function PlayResSound(bool bBirth)
{
	if (bBirth)
		PlaySound( RessurectSound1);
	else
		PlaySound( RessurectSound2);
}

simulated function float PlayRessurection()
{
local byte i;

	bHidden = false;
	WRes = Spawn(Class'WResReplace', Self);
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
	
	ResFX = Spawn(Class'NRessurectFX', WRes);
	ResFX.Mesh = Mesh;
	if (Level.NetMode != NM_DedicatedServer)
		ResFX.LODBias = LODBias;
	ResFX.DrawScale = DrawScale;
	ResFX.SetLifeTime(RessurectionTime);
	ResFX.LifeCount = RessurectionTime;
	ResFX.StartFraming(RessurectionTime/3*2);
	Class'NWUtils'.static.InitializeRes(ResFX, Self, Level, Class'NWInfo'.default.enable_WeaponResTeamBasedColor, 
		Class'NWInfo'.default.WeaponResFXColor, PTeam, CPTeam, PSTeam, FSTeam, bHaveFort);
	
	PlayResSound(True);
	bHidden = true;
	return RessurectionTime/3*2;
}


State Sleeping
{
ignores Touch;

    function BeginState()
    {
        BecomePickup();
		SetHiddenOverlayers(True);
        bHidden = True;
		if (Level.NetMode == NM_StandAlone)
			LightType = LT_None;
    }

    function EndState()
    {
	local byte i;

		bSleepTouch = false;
		SetHiddenOverlayers(False);
		if (Level.NetMode == NM_StandAlone && Class'NWInfo'.default.bWeaponsDynLight)
			LightType = Default.LightType;
		for (i = 0; i < ArrayCount(Touching); i++)
		{
			if (Pawn(Touching[i]) != None)
				bSleepTouch = true;
		}
    }    
       
Begin:
	if (Class'NWInfo'.default.enable_WeaponRessurectFX)
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

function bool isHeadShotDmg(Actor Other, vector HitLocation)
{
	return static.isStaticHeadShotDmg(Other, HitLocation, Instigator);
}

static function bool isStaticHeadShotDmg(Actor Other, vector HitLocation, optional Pawn Instig)
{
	if (Pawn(Other) == None)
		return False;
	if ((HitLocation.Z - Other.Location.Z > 0.62 * Other.CollisionHeight)
	&& (Instig == None || !Class'NWUtils'.static.isValidBot(Instig) || Class'NWUtils'.static.isElegibleBotAI(Instig, True)))
		return True;
	return False;
}

function bool giveFiredHealth(Actor Other, float dmg)
{
	if (Pawn(Other) == None || Instigator == None || Pawn(Other).PlayerReplicationInfo == None || Instigator.PlayerReplicationInfo == None)
		return False;
	if (HealthGiver && (Pawn(Other) == Instigator || Class'NWUtils'.static.isFriend(Pawn(Other), Level, Instigator,, True)))
		return Class'NWUtils'.static.processFiredHealth(Int(dmg * FMax(1.0, MoreDamage)), Pawn(Other), Instigator);
	return False;
}

function bool checkDeployPriority(Actor A)
{
local Inventory Inv;

	if (A == None || A.Inventory == None)	
		return False;

	for(Inv = A.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (NaliWeapons(Inv) != None && Inv != Self && NaliWeapons(Inv).DeployAIPriority > DeployAIPriority)
			return False;
	}
	return True;
}

function bool isAllowedToKick(Pawn Inst, Pawn P)
{
	return Class'NWUtils'.static.isAllowedToKick(Inst, P, Level, Kickback);
}

simulated function bool isTeamMember(Actor A)
{
	return Class'NWUtils'.static.isTeamMember(Pawn(Owner), A);
}

static function ECrosshairColorType GetCrossColorTypeFromByte(byte n)
{
	if (n == 0)		return ECrosshairColorType.CC_Default;
	if (n == 1)		return ECrosshairColorType.CC_ChallengeHUD;
	if (n == 2)		return ECrosshairColorType.CC_Custom;
	return ECrosshairColorType.CC_Default;
}

static function zHackManagerType GetZHackManagerTypeFromByte(byte n)
{
	if (n == 0)		return zHackManagerType.ZRH_None;
	if (n == 1)		return zHackManagerType.ZRH_Auto;
	if (n == 2)		return zHackManagerType.ZRH_Force;
	return zHackManagerType.ZRH_None;
}



//Oversurrection functions
//----------------------------------------------------------------------------------

static function color getOversurrectorFXColor(byte n)
{
local color c;

	if (n >= ArrayCount(default.OversurrectorFXColors))
		return c;
	return default.OversurrectorFXColors[n];
}

static function byte getOversurrectorFXLight(byte n, name type)
{
	if (n >= ArrayCount(default.OversurrectorLightHue))
		return 0;
	if (type == 'Hue')
		return default.OversurrectorLightHue[n];
	if (type == 'Sat')
		return default.OversurrectorLightSaturation[n];
	if (type == 'Bright')
		return default.OversurrectorLightBrightness[n];
	return 0;
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	return False;
}

static function bool hasOversurrectorFXProduction(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	return False;
}

static function bool hasOversurrectorFXPrepareFire(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	return False;
}

static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal);
static simulated function OversurrectorExplodeClient(TheOversProj ref, vector HitLocation, vector HitNormal);



defaultproperties
{
	FireRateChange=1.000000
	LODBias=8.000000
	StockOverlayers(0)=InfOvFX
	StockOverlayers(1)=KickOvFX
	StockOverlayers(2)=DmgOvFX
	StockOverlayers(3)=HealthOvFX
	StockOverlayers(4)=SplashOvFX
	StockOverlayers(5)=FastOvFX
	StockOverlayers(6)=TheOneOvFX
	FColor=(R=128,G=128,B=128)
	CrossHairScale=1.000000
	bCustomCrosshair=True
	CrosshairColorType=CC_Default
	CrosshairColor=(R=0,G=255,B=0)
	bOpaqueCrosshair=False
	bAlphaCrosshair=True
	bSeeWeaponHand=True
	bWeaponFX=True
	HandSkin=HumanHand
	HandsBaseFatness=128
	ViewBobMult=1.000000
	ModifierIconsScale=0.850000
	ModifierIconsYPosSingle=0.250000
	ModifierIconsYPosTriple=0.250000
	ModifTexIcons(0)=InfSymbol1
	ModifTexIcons(1)=KickSymbol1
	ModifTexIcons(2)=DmgSymbol1
	ModifTexIcons(3)=HealthSymbol1
	ModifTexIcons(4)=SplashSymbol1
	ModifTexIcons(5)=FastSymbol1
	TheOneGrid(0)=ModifIconLower
	TheOneGrid(1)=ModifIconMiddle
	TheOneGrid(2)=ModifIconUpper
	SingleGrid=ModifIconShort
	ModifLockTex=ModifIconLock
	ModifLockSnd=ModifLockSound
	ModifUnLockSnd=ModifUnlockSound
	ModifTextFont(0)=Font'NaliFontA'
	ModifTextFont(1)=Font'NaliFontB'
	ModifTextFont(2)=Font'NaliFontC'
	ModifTextFont(3)=Font'NaliFontD'
	ModifTextFont(4)=Font'NaliFontE'
	ModifTextFont(5)=Font'NaliFontF'
	BWhite=(R=255,G=255,B=255)
	RessurectSound1=RessurectSnd
	RessurectSound2=RessurectFinSnd
	RessurectionTime=3.000000
	AnimSequence=Still
	
	bInstantHitWaterFX=True
	bBallisticWaterFX=True
	WaterSplashType=1
	
	FiringSndPitch=64
	AltFiringSndPitch=64
	
	FireRateMult1=1.000000
	FireRateMult2=1.000000
	DamageMult1=1.000000
	DamageMult2=1.000000
	
	bOptimizeLists=True
	bInvertListsProcessing=True
	
	enableNoAmmoMsg=True
	NoAltAmmoMsgString="No ammo left for this mode!"
	NoAmmoMsgString="No ammo left for this mode!"
	
	enableModifiers=False
	FireRateChangeMax=4.000000
	FireRateChangeMin=2.000000
	KickBackMax=110
	KickBackMin=10
	bKickAffectTeammates=False
	bKickAffectInstigator=True
	MoreDamageMax=6.000000
	MoreDamageMin=2.000000
	SplasherMax=3.000000
	SplasherMin=1.250000
	canHealOwner=True
	healMultiplier=0.750000
	healFixedValue=0
	enableTheOneModif=True
	bTheOneUnlockLast=True
	ModifFireRateOdds=10.000000
	ModifDmgOdds=10.000000
	ModifKickOdds=10.000000
	ModifSplashOdds=10.000000
	ModifHealOdds=10.000000
	ModifInfOdds=10.000000
	ModifOneOdds=10.000000
	ModifNoneOdds=30.000000
	
	ZPGlobalOnMsg="ZP is now enabled"
	ZPGlobalOffMsg="ZP is now disabled"
	ZPLocalOnMsg="ZP is now enabled for your current weapon"
	ZPLocalOffMsg="ZP is now disabled for your current weapon"
	
	MaxTraceRange=30000
	
	RenderZHackManager=ZRH_Auto
	
	enableZPDebug=False
	enableZPServer=True
	enableZPClient=True
	enableZPWeaponServer=True
	enableZPWeaponClient=True
	enableZPAccuracyValidation=True
	enableZPLevelBlockValidation=True
	ZPMinShotPrecision=0.965000
	ZPMinViewPrecision=0.500000
	ZPMinOwnerViewPrecision=0.950000
	ZPMinFireTimeErrorMargin=0.150000
	ZPHitColHeighMaxMargin=8.000000
	ZPHitColRadiusMaxMargin=8.000000
	ZPHitStartMaxMargin=24.000000
	ZPOwnerLocationMaxMargin=400.000000
	ZPOtherLocationMaxMargin=400.000000
	ZPAccuracySyncMaxError=7
	ZPMaxPing=450
	
	ZPMaxFirerate=0.250000
	
	enableOversurrection=False
	bOversurrective=False
	OversurrectorShellColor=(R=0,G=255,B=0)
	OversurrectorFXColors(0)=(R=0,G=255,B=0)
	OversurrectorFXColors(1)=(R=0,G=255,B=0)
	OversurrectorFXColors(2)=(R=0,G=255,B=0)
	OversurrectorFXColors(3)=(R=0,G=255,B=0)
	OversurrectorFXColors(4)=(R=0,G=255,B=0)
	OversurrectorFXColors(5)=(R=0,G=255,B=0)
	OversurrectorFXColors(6)=(R=0,G=255,B=0)
	OversurrectorFXColors(7)=(R=0,G=255,B=0)
	OversurrectorFXColors(8)=(R=0,G=255,B=0)
	OversurrectorFXColors(9)=(R=0,G=255,B=0)
	OversurrectorFXColors(10)=(R=0,G=255,B=0)
	OversurrectorFXColors(11)=(R=0,G=255,B=0)
	OversurrectorFXColors(12)=(R=0,G=255,B=0)
	OversurrectorFXColors(13)=(R=0,G=255,B=0)
	OversurrectorFXColors(14)=(R=0,G=255,B=0)
	OversurrectorFXColors(15)=(R=0,G=255,B=0)
	OversurrectorFXColors(16)=(R=0,G=255,B=0)
	OversurrectorFXColors(17)=(R=0,G=255,B=0)
	OversurrectorFXColors(18)=(R=0,G=255,B=0)
	OversurrectorFXColors(19)=(R=0,G=255,B=0)
	OversurrectorFXColors(20)=(R=0,G=255,B=0)
	OversurrectorFXColors(21)=(R=0,G=255,B=0)
	OversurrectorFXColors(22)=(R=0,G=255,B=0)
	OversurrectorFXColors(23)=(R=0,G=255,B=0)
	
	OversurrectorLightHue(0)=0
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=85
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=0
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
}
