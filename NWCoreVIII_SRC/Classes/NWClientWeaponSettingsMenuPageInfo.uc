//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWClientWeaponSettingsMenuPageInfo expands NWMenuPageInfo;

#exec TEXTURE IMPORT NAME=CrosshairSampleTex FILE=ICONS\CrosshairSampleTex.bmp GROUP=Icons MIPS=OFF LODSET=0


var() localized string CHCType[3], ZHackType[3];


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NaliWeapons'.default.bCustomCrosshair);
	if (i == 1)
		return String(Class'NaliWeapons'.default.bOpaqueCrosshair);
	if (i == 2)
		return String(Class'NaliWeapons'.default.bAlphaCrosshair);
	if (i == 5)
		return String(Class'KeyedNaliWeapon'.default.displayKeysHelp);
	if (i == 6)
		return String(Class'NaliWeapons'.default.enableNoAmmoMsg);
	if (i == 7)
		return String(Class'NaliWeapons'.default.bSeeWeaponHand);
	if (i == 8)
		return String(Class'NWHandsInfo'.default.bUseClientConfig);
	if (i == 9)
		return String(Class'NaliWeapons'.default.bWeaponFX);
	if (i == 10)
		return String(Class'NaliWeapons'.default.ViewBobMult);
	if (i == 12)
		return String(Class'NaliWeapons'.default.ModifierIconsScale);
	if (i == 13)
		return String(Class'NaliWeapons'.default.ModifierIconsYPosSingle);
	if (i == 14)
		return String(Class'NaliWeapons'.default.ModifierIconsYPosTriple);
	if (i == 15)
		return String(Class'NWMainReplacer'.default.enableWeaponPrioritiesProcessor);
	if (i == 16)
		return String(Class'NaliWeapons'.default.enableZPClient);
	if (i == 17)
		return String(Class'NWInfo'.default.enableClientNukeCrashFix);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local NaliWeapons NW;

	if (i == 0)
		Class'NaliWeapons'.default.bCustomCrosshair = Bool(val);
	else if (i == 1)
		Class'NaliWeapons'.default.bOpaqueCrosshair = Bool(val);
	else if (i == 2)
		Class'NaliWeapons'.default.bAlphaCrosshair = Bool(val);
	else if (i == 5)
		Class'KeyedNaliWeapon'.default.displayKeysHelp = Bool(val);
	else if (i == 6)
		Class'NaliWeapons'.default.enableNoAmmoMsg = Bool(val);
	else if (i == 7)
		Class'NaliWeapons'.default.bSeeWeaponHand = Bool(val);
	else if (i == 8)
		Class'NWHandsInfo'.default.bUseClientConfig = Bool(val);
	else if (i == 9)
		Class'NaliWeapons'.default.bWeaponFX = Bool(val);
	else if (i == 10)
		Class'NaliWeapons'.default.ViewBobMult = Float(val);
	else if (i == 12)
		Class'NaliWeapons'.default.ModifierIconsScale = Float(val);
	else if (i == 13)
		Class'NaliWeapons'.default.ModifierIconsYPosSingle = Float(val);
	else if (i == 14)
		Class'NaliWeapons'.default.ModifierIconsYPosTriple = Float(val);
	else if (i == 15)
		Class'NWMainReplacer'.default.enableWeaponPrioritiesProcessor = Bool(val);
	else if (i == 16)
		Class'NaliWeapons'.default.enableZPClient = Bool(val);
	else if (i == 17)
		Class'NWInfo'.default.enableClientNukeCrashFix = Bool(val);

	if (P != None)
	{
		ForEach P.AllActors(Class'NaliWeapons', NW)
		{
			NW.default.bCustomCrosshair = Class'NaliWeapons'.default.bCustomCrosshair;
			NW.bCustomCrosshair = Class'NaliWeapons'.default.bCustomCrosshair;
			NW.bOwnsCrosshair = Class'NaliWeapons'.default.bCustomCrosshair;
			NW.default.bOpaqueCrosshair = Class'NaliWeapons'.default.bOpaqueCrosshair;
			NW.bOpaqueCrosshair = Class'NaliWeapons'.default.bOpaqueCrosshair;
			NW.default.bAlphaCrosshair = Class'NaliWeapons'.default.bAlphaCrosshair;
			NW.bAlphaCrosshair = Class'NaliWeapons'.default.bAlphaCrosshair;
			NW.default.bSeeWeaponHand = Class'NaliWeapons'.default.bSeeWeaponHand;
			NW.bSeeWeaponHand = Class'NaliWeapons'.default.bSeeWeaponHand;
			NW.default.bWeaponFX = Class'NaliWeapons'.default.bWeaponFX;
			NW.bWeaponFX = Class'NaliWeapons'.default.bWeaponFX;
			NW.default.enableNoAmmoMsg = Class'NaliWeapons'.default.enableNoAmmoMsg;
			NW.enableNoAmmoMsg = Class'NaliWeapons'.default.enableNoAmmoMsg;
			NW.default.ViewBobMult = Class'NaliWeapons'.default.ViewBobMult;
			NW.ViewBobMult = Class'NaliWeapons'.default.ViewBobMult;
			NW.BobDamping = NW.default.BobDamping * Class'NaliWeapons'.default.ViewBobMult;
			NW.default.ModifierIconsScale = Class'NaliWeapons'.default.ModifierIconsScale;
			NW.ModifierIconsScale = Class'NaliWeapons'.default.ModifierIconsScale;
			NW.default.ModifierIconsYPosSingle = Class'NaliWeapons'.default.ModifierIconsYPosSingle;
			NW.ModifierIconsYPosSingle = Class'NaliWeapons'.default.ModifierIconsYPosSingle;
			NW.default.ModifierIconsYPosTriple = Class'NaliWeapons'.default.ModifierIconsYPosTriple;
			NW.ModifierIconsYPosTriple = Class'NaliWeapons'.default.ModifierIconsYPosTriple;
			if (KeyedNaliWeapon(NW) != None)
			{
				KeyedNaliWeapon(NW).default.displayKeysHelp = Class'KeyedNaliWeapon'.default.displayKeysHelp;
				KeyedNaliWeapon(NW).displayKeysHelp = Class'KeyedNaliWeapon'.default.displayKeysHelp;
			}
			
			if (NW.Owner == P)
				NW.ZP(String(Class'NaliWeapons'.default.enableZPClient), True);
		}
	}
	
	if (i == 0 || i == 1 || i == 2 || i == 6 || i == 7 || i == 9 || i == 10 || i == 12 || i == 13 || i == 14 || i == 16)
		Class'NaliWeapons'.static.StaticSaveConfig();
	else if (i == 5)
		Class'KeyedNaliWeapon'.static.StaticSaveConfig();
	else if (i == 8)
		Class'NWHandsInfo'.static.StaticSaveConfig();
	else if (i == 15)
		Class'NWMainReplacer'.static.StaticSaveConfig();
	else if (i == 17)
		Class'NWInfo'.static.StaticSaveConfig();
		
	return val;
}


//Color
static function color GetDefaultColor(byte i, optional byte advIndex)
{
local color C;

	if (i == 4)
		return Class'NaliWeapons'.default.CrosshairColor;
	return C;
}

static function color ProcessSettingsChangeColor(PlayerPawn P, byte i, color C, optional byte advIndex)
{
local NaliWeapons NW;

	if (i == 4)
	{
		Class'NaliWeapons'.default.CrosshairColor = C;
		Class'NaliWeapons'.static.StaticSaveConfig();
	}
	
	if (P != None)
	{
		ForEach P.AllActors(Class'NaliWeapons', NW)
		{
			NW.default.CrosshairColor = Class'NaliWeapons'.default.CrosshairColor;
			NW.CrosshairColor = Class'NaliWeapons'.default.CrosshairColor;
		}
	}
	
	return C;
}


//Combo
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
local byte n;

	if (i == 3)
	{
		n = Class'NaliWeapons'.default.CrosshairColorType;
		if (n < ArrayCount(default.CHCType))
		{
			val1 = default.CHCType[n];
			val2 = String(n);
			return;
		}
	}
	else if (i == 11)
	{
		n = Class'NaliWeapons'.default.RenderZHackManager;
		if (n < ArrayCount(default.ZHackType))
		{
			val1 = default.ZHackType[n];
			val2 = String(n);
			return;
		}
	}
	
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if (i == 3 && listIndex < ArrayCount(default.CHCType))
	{
		val1 = default.CHCType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	else if (i == 11 && listIndex < ArrayCount(default.ZHackType))
	{
		val1 = default.ZHackType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
local NaliWeapons NW;

	if (i == 3)
		Class'NaliWeapons'.default.CrosshairColorType = Class'NaliWeapons'.static.GetCrossColorTypeFromByte(Byte(val2));
	else if (i == 11)
		Class'NaliWeapons'.default.RenderZHackManager = Class'NaliWeapons'.static.GetZHackManagerTypeFromByte(Byte(val2));
	if (i == 3 || i == 11)
		Class'NaliWeapons'.static.StaticSaveConfig();
	
	if (P != None)
	{
		ForEach P.AllActors(Class'NaliWeapons', NW)
		{
			NW.default.CrosshairColorType = Class'NaliWeapons'.default.CrosshairColorType;
			NW.CrosshairColorType = Class'NaliWeapons'.default.CrosshairColorType;
			NW.default.RenderZHackManager = Class'NaliWeapons'.default.RenderZHackManager;
			NW.RenderZHackManager = Class'NaliWeapons'.default.RenderZHackManager;
		}
	}

	return val2;
}



defaultproperties
{
	ModMenuInfoClass=Class'NWClientSettingsMainModMenuInfo'
	PageTitle="Weapons"
	
	SettingsList(0)=(Description="Custom crosshair")
	SettingsList(0)=(HelpTip="Enable weapons custom crosshair")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Masked crosshair")
	SettingsList(1)=(HelpTip="Render crosshair with no transparency")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Alpha crosshair")
	SettingsList(2)=(HelpTip="Render crosshair with alpha (works only with translucent crosshair rendering)")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Crosshair color setting")
	SettingsList(3)=(HelpTip="Color setting which the crosshair should be rendered with:%n%    Default: Uses weapon default crosshair color%n%    HUD: Uses color set in Preferences > HUD%n%    Custom: Uses custom color below")
	SettingsList(3)=(Type=ST_Combo)
	CHCType(0)="Default"
	CHCType(1)="HUD"
	CHCType(2)="Custom"

	SettingsList(4)=(Description="Crosshair color")
	SettingsList(4)=(HelpTip="Crosshair color for 'Custom' in 'Crosshair color settings' above")
	SettingsList(4)=(Type=ST_Color,ColorTex=Texture'CrosshairSampleTex')
	SettingsList(4)=(BottomMargin=20.000000)
	
	SettingsList(5)=(Description="Display keys help")
	SettingsList(5)=(HelpTip="Show help for weapons which use 0-9 keys%n%  Examples: Megaton, Megaton Decoder")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Display no ammo messages")
	SettingsList(6)=(HelpTip="Show message when attempting to fire weapon with no ammo left")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="Display hands")
	SettingsList(7)=(HelpTip="Render player hands on weapon first person view")
	SettingsList(7)=(Type=ST_Checkbox)
	
	SettingsList(8)=(Description="Use custom hands")
	SettingsList(8)=(HelpTip="Render your own installed hand skins as set in NWHandsInfo configuration online%n%(check documentation)")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="Weapon GFX")
	SettingsList(9)=(HelpTip="Render first person weapon graphical effects (overlayers, glows, etc)")
	SettingsList(9)=(Type=ST_Checkbox)
	
	SettingsList(10)=(Description="View bob multiplier")
	SettingsList(10)=(HelpTip="Multiplier relative the value set in Preferences > Game > View bob")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(11)=(Description="Z-Buffer manager")
	SettingsList(11)=(HelpTip="Manager to fix Z-Buffer issues in Direct3D and OpenGL renderers:%n%    None: Renderer Z-Buffer is never managed%n%    Auto: Renderer Z-Buffer automatically managed%n%    Constant: Renderer Z-Buffer with constant fixed value")
	SettingsList(11)=(Type=ST_Combo)
	SettingsList(11)=(BottomMargin=20.000000)
	ZHackType(0)="None"
	ZHackType(1)="Auto"
	ZHackType(2)="Constant"
	
	SettingsList(12)=(Description="Modifier icons scale")
	SettingsList(12)=(HelpTip="Modifier icons rendering size")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(13)=(Description="Single modifier HUD Y position")
	SettingsList(13)=(HelpTip="Single modifier HUD vertical position on the screen%n%    0.0 - Top of the screen%n%    1.0 - Bottom of the screen")
	SettingsList(13)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(14)=(Description="Triple modifier HUD Y position")
	SettingsList(14)=(HelpTip="Triple modifier HUD vertical position on the screen%n%    0.0 - Top of the screen%n%    1.0 - Bottom of the screen")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(14)=(BottomMargin=20.000000)
	
	SettingsList(15)=(Description="Weapon priority processor")
	SettingsList(15)=(HelpTip="Enable automatic weapon priority list setup when using the Nali Weapons 3 mutator")
	SettingsList(15)=(Type=ST_Checkbox)
	
	SettingsList(16)=(Description="Enable ZP")
	SettingsList(16)=(HelpTip="Enable ZeroPing for all applicable hitscan weapons")
	SettingsList(16)=(Type=ST_Checkbox)
	
	SettingsList(17)=(Description="Enable nuclear crash fix (client)")
	SettingsList(17)=(HelpTip="Enable fix for the nuclear explosions from the client.%n%  NOTE: A consequence of this fix is the temporary disappearance of decals during the blast.")
	SettingsList(17)=(Type=ST_Checkbox)
	SettingsList(17)=(BottomMargin=20.000000)
}
