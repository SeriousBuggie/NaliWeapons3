//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWServerModifiersSettingsMenuPageInfo expands NWMenuPageInfo;

var() localized string ResFXColor[5];


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NaliWeapons'.default.enableModifiers);
	if (i == 1)
		return String(Class'NaliWeapons'.default.FireRateChangeMax);
	if (i == 2)
		return String(Class'NaliWeapons'.default.FireRateChangeMin);
	if (i == 3)
		return String(Class'NaliWeapons'.default.MoreDamageMax);
	if (i == 4)
		return String(Class'NaliWeapons'.default.MoreDamageMin);
	if (i == 5)
		return String(Class'NaliWeapons'.default.SplasherMax);
	if (i == 6)
		return String(Class'NaliWeapons'.default.SplasherMin);
	if (i == 7)
		return String(Class'NaliWeapons'.default.KickBackMax);
	if (i == 8)
		return String(Class'NaliWeapons'.default.KickBackMin);
	if (i == 9)
		return String(Class'NaliWeapons'.default.bKickAffectTeammates);
	if (i == 10)
		return String(Class'NaliWeapons'.default.bKickAffectInstigator);
	if (i == 11)
		return String(Class'NaliWeapons'.default.canHealOwner);
	if (i == 12)
		return String(Class'NaliWeapons'.default.healMultiplier);
	if (i == 13)
		return String(Class'NaliWeapons'.default.healFixedValue);
	if (i == 14)
		return String(Class'NaliWeapons'.default.enableTheOneModif);
	if (i == 15)
		return String(Class'NaliWeapons'.default.bAlwaysTheOne);
	if (i == 16)
		return String(Class'NaliWeapons'.default.bTheOneUnlockLast);
	if (i == 17)
		return String(Class'NWInfo'.default.bModifChargers);
	if (i == 18)
		return String(Class'NWInfo'.default.ModifiersRespawnTimeSec);
	if (i == 19)
		return String(Class'NWInfo'.default.enable_ModRessurectFX);
	if (i == 20)
		return String(Class'NWInfo'.default.enable_ModResTeamBasedColor);
	if (i == 22)
		return String(Class'NaliWeapons'.default.ModifFireRateOdds);
	if (i == 23)
		return String(Class'NaliWeapons'.default.ModifDmgOdds);
	if (i == 24)
		return String(Class'NaliWeapons'.default.ModifKickOdds);
	if (i == 25)
		return String(Class'NaliWeapons'.default.ModifSplashOdds);
	if (i == 26)
		return String(Class'NaliWeapons'.default.ModifHealOdds);
	if (i == 27)
		return String(Class'NaliWeapons'.default.ModifInfOdds);
	if (i == 28)
		return String(Class'NaliWeapons'.default.ModifOneOdds);
	if (i == 29)
		return String(Class'NaliWeapons'.default.ModifNoneOdds);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'NaliWeapons'.default.enableModifiers = Bool(val);
	else if (i == 1)
		Class'NaliWeapons'.default.FireRateChangeMax = Float(val);
	else if (i == 2)
		Class'NaliWeapons'.default.FireRateChangeMin = Float(val);
	else if (i == 3)
		Class'NaliWeapons'.default.MoreDamageMax = Float(val);
	else if (i == 4)
		Class'NaliWeapons'.default.MoreDamageMin = Float(val);
	else if (i == 5)
		Class'NaliWeapons'.default.SplasherMax = Float(val);
	else if (i == 6)
		Class'NaliWeapons'.default.SplasherMin = Float(val);
	else if (i == 7)
		Class'NaliWeapons'.default.KickBackMax = Int(val);
	else if (i == 8)
		Class'NaliWeapons'.default.KickBackMin = Int(val);
	else if (i == 9)
		Class'NaliWeapons'.default.bKickAffectTeammates = Bool(val);
	else if (i == 10)
		Class'NaliWeapons'.default.bKickAffectInstigator = Bool(val);
	else if (i == 11)
		Class'NaliWeapons'.default.canHealOwner = Bool(val);
	else if (i == 12)
		Class'NaliWeapons'.default.healMultiplier = Float(val);
	else if (i == 13)
		Class'NaliWeapons'.default.healFixedValue = Int(val);
	else if (i == 14)
		Class'NaliWeapons'.default.enableTheOneModif = Bool(val);
	else if (i == 14)
		Class'NaliWeapons'.default.enableTheOneModif = Bool(val);
	else if (i == 15)
		Class'NaliWeapons'.default.bAlwaysTheOne = Bool(val);
	else if (i == 16)
		Class'NaliWeapons'.default.bTheOneUnlockLast = Bool(val);
	else if (i == 17)
		Class'NWInfo'.default.bModifChargers = Bool(val);
	else if (i == 18)
		Class'NWInfo'.default.ModifiersRespawnTimeSec = Int(val);
	else if (i == 19)
		Class'NWInfo'.default.enable_ModRessurectFX = Bool(val);
	else if (i == 20)
		Class'NWInfo'.default.enable_ModResTeamBasedColor = Bool(val);
	else if (i == 22)
		Class'NaliWeapons'.default.ModifFireRateOdds = Float(val);
	else if (i == 23)
		Class'NaliWeapons'.default.ModifDmgOdds = Float(val);
	else if (i == 24)
		Class'NaliWeapons'.default.ModifKickOdds = Float(val);
	else if (i == 25)
		Class'NaliWeapons'.default.ModifSplashOdds = Float(val);
	else if (i == 26)
		Class'NaliWeapons'.default.ModifHealOdds = Float(val);
	else if (i == 27)
		Class'NaliWeapons'.default.ModifInfOdds = Float(val);
	else if (i == 28)
		Class'NaliWeapons'.default.ModifOneOdds = Float(val);
	else if (i == 29)
		Class'NaliWeapons'.default.ModifNoneOdds = Float(val);
		
	if ((i >= 0 && i <= 16) || (i >= 22 && i <= 29))
		Class'NaliWeapons'.static.StaticSaveConfig();
	else if (i >= 17)
		Class'NWInfo'.static.StaticSaveConfig();
	return val;
}


//Combo
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
local byte n;

	if (i == 21)
	{
		n = Class'NWInfo'.default.ModResFXColor;
		if (n < ArrayCount(default.ResFXColor))
		{
			val1 = default.ResFXColor[n];
			val2 = String(n);
			return;
		}
	}
	
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if (i == 21 && listIndex < ArrayCount(default.ResFXColor))
	{
		val1 = default.ResFXColor[listIndex];
		val2 = String(listIndex);
		return True;
	}
	
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	if (i == 21)
	{
		Class'NWInfo'.default.ModResFXColor = Class'NWInfo'.static.GetRessurectColorFromByte(Byte(val2));
		Class'NWInfo'.static.StaticSaveConfig();
	}

	return val2;
}


defaultproperties
{
	ModMenuInfoClass=Class'NWServerSettingsMainModMenuInfo'
	PageTitle="Modifiers"
	
	SettingsList(0)=(Description="Enable weapon modifiers")
	SettingsList(0)=(HelpTip="Enable random modifier on weapon pick up")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(BottomMargin=20.000000)
	
	SettingsList(1)=(Description="Firerate max multiplier")
	SettingsList(1)=(HelpTip="Max firerate multiplier using the Fast modifier")
	SettingsList(1)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(2)=(Description="Firerate min multiplier")
	SettingsList(2)=(HelpTip="Min firerate multiplier using the Fast modifier")
	SettingsList(2)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(3)=(Description="Damage max multiplier")
	SettingsList(3)=(HelpTip="Max damage multiplier using the Damage modifier")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(4)=(Description="Damage min multiplier")
	SettingsList(4)=(HelpTip="Min damage multiplier using the Damage modifier")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(5)=(Description="Range max multiplier")
	SettingsList(5)=(HelpTip="Max range multiplier using the Splasher modifier")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(6)=(Description="Range min multiplier")
	SettingsList(6)=(HelpTip="Min range multiplier using the Splasher modifier")
	SettingsList(6)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(7)=(Description="Max force increase")
	SettingsList(7)=(HelpTip="Max force increase using the Kickback modifier")
	SettingsList(7)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(8)=(Description="Min force increase")
	SettingsList(8)=(HelpTip="Min force increase using the Kickback modifier")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(9)=(Description="Affect teammates with Kickback")
	SettingsList(9)=(HelpTip="Affect teammates when using the Kickback modifier")
	SettingsList(9)=(Type=ST_Checkbox)
	
	SettingsList(10)=(Description="Affect self with Kickback")
	SettingsList(10)=(HelpTip="Affect self when using the Kickback modifier")
	SettingsList(10)=(Type=ST_Checkbox)
	
	SettingsList(11)=(Description="Can heal self with Health")
	SettingsList(11)=(HelpTip="Enable the ability to heal self with Health modifier")
	SettingsList(11)=(Type=ST_Checkbox)
	
	SettingsList(12)=(Description="Health multiplier")
	SettingsList(12)=(HelpTip="Health through damage multiplier")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(13)=(Description="Health value")
	SettingsList(13)=(HelpTip="Health fixed value, if 0 the weapon damage value is used")
	SettingsList(13)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(14)=(Description="Enable The One")
	SettingsList(14)=(HelpTip="Enable 'The One' random modifier")
	SettingsList(14)=(Type=ST_Checkbox)
	
	SettingsList(15)=(Description="Enable The One always")
	SettingsList(15)=(HelpTip="Enable weapons to always start off with the 'The One' modifier")
	SettingsList(15)=(Type=ST_Checkbox)
	
	SettingsList(16)=(Description="Unlock The One last item")
	SettingsList(16)=(HelpTip="Unlock the last The One slot for modifiers")
	SettingsList(16)=(Type=ST_Checkbox)
	SettingsList(16)=(BottomMargin=20.000000)
	
	SettingsList(17)=(Description="Enable modifier chargers")
	SettingsList(17)=(HelpTip="Enable modifier charger platforms")
	SettingsList(17)=(Type=ST_Checkbox)
	
	SettingsList(18)=(Description="Modifiers respawn time")
	SettingsList(18)=(HelpTip="Time taken for a modifier to respawn")
	SettingsList(18)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(19)=(Description="Enable modifiers respawn GFX")
	SettingsList(19)=(HelpTip="Enable new modifiers respawn effect")
	SettingsList(19)=(Type=ST_Checkbox)
	
	SettingsList(20)=(Description="Use team color on modifiers respawn GFX")
	SettingsList(20)=(HelpTip="Use team colors in the new modifiers respawn effect")
	SettingsList(20)=(Type=ST_Checkbox)
	
	SettingsList(21)=(Description="Modifiers respawn GFX default color")
	SettingsList(21)=(HelpTip="Modifiers new respawn effect default color")
	SettingsList(21)=(Type=ST_Combo)
	SettingsList(21)=(BottomMargin=20.000000)
	ResFXColor(0)="White"
	ResFXColor(1)="Red"
	ResFXColor(2)="Blue"
	ResFXColor(3)="Green"
	ResFXColor(4)="Yellow"
	
	SettingsList(22)=(Description="Firerate odds")
	SettingsList(22)=(HelpTip="Firerate modifier activation odds")
	SettingsList(22)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(23)=(Description="Damage odds")
	SettingsList(23)=(HelpTip="Damage modifier activation odds")
	SettingsList(23)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(24)=(Description="Kick odds")
	SettingsList(24)=(HelpTip="Kick modifier activation odds")
	SettingsList(24)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(25)=(Description="Splasher odds")
	SettingsList(25)=(HelpTip="Splasher modifier activation odds")
	SettingsList(25)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(26)=(Description="Health odds")
	SettingsList(26)=(HelpTip="Health modifier activation odds")
	SettingsList(26)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(27)=(Description="Infinity odds")
	SettingsList(27)=(HelpTip="Infinity modifier activation odds")
	SettingsList(27)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(28)=(Description="The One odds")
	SettingsList(28)=(HelpTip="The One modifier activation odds")
	SettingsList(28)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(29)=(Description="No modifier odds")
	SettingsList(29)=(HelpTip="No modifier activation odds")
	SettingsList(29)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(29)=(BottomMargin=20.000000)
}
