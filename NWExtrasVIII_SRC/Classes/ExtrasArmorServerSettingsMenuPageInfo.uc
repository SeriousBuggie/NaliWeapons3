//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class ExtrasArmorServerSettingsMenuPageInfo expands NWMenuPageInfo;

var() class<NWExtrasArmor> ExtrasArmorClass;

static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(default.ExtrasArmorClass.default.ArmorPoints);
	if (i == 1)
		return String(default.ExtrasArmorClass.default.AbsorptionPercentage);
	
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		default.ExtrasArmorClass.default.ArmorPoints = Int(val);
	else if (i == 1)
		default.ExtrasArmorClass.default.AbsorptionPercentage = Int(val);
	
	default.ExtrasArmorClass.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'ExtrasArmorAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	ExtrasArmorClass=Class'NWExtrasArmor'
	
	SettingsList(0)=(Description="Armor amount")
	SettingsList(0)=(HelpTip="Amount of armor")
	SettingsList(0)=(Type=ST_IntegerInput,MaxChars=5)
	
	SettingsList(1)=(Description="Absorption percentage")
	SettingsList(1)=(HelpTip="Armor damage absorption percentage (0 to 100)")
	SettingsList(1)=(Type=ST_IntegerInput,MaxChars=3)
	SettingsList(1)=(BottomMargin=20.000000)
}
