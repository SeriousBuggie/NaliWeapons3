//////////////////////////////////////////////////////////////
//	Nali Weapons III general Info class
//				Feralidragon (17-08-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWInfo expands Info config(NWConfig);

//Detail Settings
//******************************************************************************
var(Detail) globalconfig bool bWeaponsDynLight;
var(Detail) globalconfig bool bAmmoDynLight;
var(Detail) globalconfig bool bPickupsDynLight;
var(Detail) globalconfig bool bEffectsDynLight;

enum ECarcassFX
{
	CSFX_None,
    CSFX_Precise,
    CSFX_Moderate,
	CSFX_Splash
};

var(Detail) globalconfig ECarcassFX CarcassFX;		

var(Detail) globalconfig byte WeaponDistDetail;	
var(Detail) globalconfig byte AmmoDistDetail;		
var(Detail) globalconfig byte PickupsDistDetail;	
var(Detail) globalconfig byte ChargersDistDetail;

var(Detail) globalconfig bool bEnhancedWaterSplashes;
var(Detail) globalconfig byte WaterSplashDetail;
var(Detail) globalconfig bool enableDebris;

var(Detail) globalconfig bool enableGlobalSmartPerformance;
var(Detail) globalconfig byte smartPerformanceMinFPS;

var(Detail) globalconfig bool enableSmartPerformanceWeapon;	
var(Detail) globalconfig bool enableSmartPerformanceAmmo;
var(Detail) globalconfig bool enableSmartPerformancePickup;
var(Detail) globalconfig bool enableSmartPerformanceCharger;

var(Detail) globalconfig float MaxLODBias;
var(Detail) globalconfig float MinLODBias;

var(Detail) globalconfig float DecalsLifespan;
//******************************************************************************


//Pickups Settings
//******************************************************************************
enum ERessurectColor
{
    RSXC_Neutral,
    RSXC_Red,
	RSXC_Blue,
	RSXC_Green,
	RSXC_Yellow
};

var(Pickups) globalconfig bool enable_ModRessurectFX;
var(Pickups) globalconfig ERessurectColor ModResFXColor;
var(Pickups) globalconfig bool enable_ModResTeamBasedColor;

var(Pickups) globalconfig bool enable_WeaponRessurectFX;
var(Pickups) globalconfig ERessurectColor WeaponResFXColor;
var(Pickups) globalconfig bool enable_WeaponResTeamBasedColor;

var(Pickups) globalconfig bool enable_AmmoRessurectFX;
var(Pickups) globalconfig ERessurectColor AmmoResFXColor;
var(Pickups) globalconfig bool enable_AmmoResTeamBasedColor;

var(Pickups) globalconfig bool enable_PickupRessurectFX;
var(Pickups) globalconfig ERessurectColor PickupResFXColor;
var(Pickups) globalconfig bool enable_PickupResTeamBasedColor;

enum EAmmoBehaviour
{
	AMOB_Animated,
	AMOB_AlwaysOpened,
	AMOB_AlwaysClosed
};

var(Pickups) globalconfig EAmmoBehaviour AmmoBehaviour;
//******************************************************************************


//Server Settings
//******************************************************************************
var(Server) globalconfig float MaxTeamCenterAbsTolerance;
var(Server) globalconfig byte RessurectSkip;
//******************************************************************************


//Misc Settings
//******************************************************************************
var(Misc) globalconfig bool bModifChargers;				
var(Misc) globalconfig bool bTeleProjectiles;
var(Misc) globalconfig int MaxHealth;		
var(Misc) globalconfig int ModifiersRespawnTimeSec;
var(Misc) globalconfig name MonsterGametypes[4];
var(Misc) globalconfig bool enableServerNukeCrashFix, enableClientNukeCrashFix;
var(Misc) globalconfig bool enableShakeFX;
var(Misc) globalconfig bool enableKillMsgManager;
var(Misc) globalconfig float PickupsGlowScale;
var(Misc) globalconfig bool enableFriendlyFire;
//******************************************************************************

//Keybind Settings
//******************************************************************************
enum EKeyBAct
{
	EKBA_PreBind,
	EKBA_PostBind,
	EKBA_NoBind
};

struct KeyOpts
{
	var() string KeyBindCommand;
	var() EKeyBAct KeyBindAction;
};

var() config KeyOpts ZHackBindOptions[32];
//******************************************************************************

static function bool hasModInstalled()
{
	return (static.Localize("NW3", "hasNW3", "NW3") ~= "TRUE");
}

static function string getZHackBindOptCommand(byte i)
{
	if (i < ArrayCount(default.ZHackBindOptions))
		return default.ZHackBindOptions[i].KeyBindCommand;
	return "";
}

static function byte getZHackBindOptAction(byte i)
{
	if (i < ArrayCount(default.ZHackBindOptions))
		return default.ZHackBindOptions[i].KeyBindAction;
	return 0;
}

static function byte getCarcassFXSettings(){	return default.CarcassFX;}

static function ECarcassFX GetCarcassFXFromByte(byte n)
{
	if (n == 0)		return ECarcassFX.CSFX_None;
	if (n == 1)		return ECarcassFX.CSFX_Precise;
	if (n == 2)		return ECarcassFX.CSFX_Moderate;
	if (n == 3)		return ECarcassFX.CSFX_Splash;
	return ECarcassFX.CSFX_None;
}

static function EAmmoBehaviour GetAmmoBehaviourFromByte(byte n)
{
	if (n == 0)		return EAmmoBehaviour.AMOB_Animated;
	if (n == 1)		return EAmmoBehaviour.AMOB_AlwaysOpened;
	if (n == 2)		return EAmmoBehaviour.AMOB_AlwaysClosed;
	return EAmmoBehaviour.AMOB_Animated;
}

static function ERessurectColor GetRessurectColorFromByte(byte n)
{
	if (n == 0)		return ERessurectColor.RSXC_Neutral;
	if (n == 1)		return ERessurectColor.RSXC_Red;
	if (n == 2)		return ERessurectColor.RSXC_Blue;
	if (n == 3)		return ERessurectColor.RSXC_Green;
	if (n == 4)		return ERessurectColor.RSXC_Yellow;
	return ERessurectColor.RSXC_Neutral;
}

defaultproperties
{
	bWeaponsDynLight=True
	bAmmoDynLight=True
	bPickupsDynLight=True
	bEffectsDynLight=True
	CarcassFX=CSFX_Moderate
	WeaponDistDetail=64
	AmmoDistDetail=64
	PickupsDistDetail=64
	ChargersDistDetail=64
	bEnhancedWaterSplashes=True
	WaterSplashDetail=6
	enableDebris=True
	enableGlobalSmartPerformance=True
	smartPerformanceMinFPS=35
	enableSmartPerformanceWeapon=True
	enableSmartPerformanceAmmo=True
	enableSmartPerformancePickup=False
	enableSmartPerformanceCharger=True
	MaxLODBias=16.000000
	MinLODBias=1.000000
	DecalsLifespan=0.000000
	
	AmmoBehaviour=AMOB_Animated
	
	enable_ModRessurectFX=True
	ModResFXColor=RSXC_Red
	enable_ModResTeamBasedColor=True
	enable_WeaponRessurectFX=True
	WeaponResFXColor=RSXC_Red
	enable_WeaponResTeamBasedColor=True
	enable_AmmoRessurectFX=True
	AmmoResFXColor=RSXC_Red
	enable_AmmoResTeamBasedColor=True
	enable_PickupRessurectFX=True
	PickupResFXColor=RSXC_Red
	enable_PickupResTeamBasedColor=True
	
	MaxTeamCenterAbsTolerance=256.000000
	RessurectSkip=0
	
	bModifChargers=True
	bTeleProjectiles=False
	MaxHealth=225
	ModifiersRespawnTimeSec=15
	MonsterGametypes(0)=MonsterHunt
	
	enableServerNukeCrashFix=False
	enableClientNukeCrashFix=False
	enableShakeFX=True
	enableKillMsgManager=True
	PickupsGlowScale=1.000000
	enableFriendlyFire=False
	
	ZHackBindOptions(0)=(KeyBindCommand="MUTATE BDBMAPVOTE VOTEMENU",KeyBindAction=EKBA_NoBind)
}