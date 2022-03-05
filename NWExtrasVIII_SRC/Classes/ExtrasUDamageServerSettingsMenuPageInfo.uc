//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class ExtrasUDamageServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NWUDamage'.default.ActiveTime);
	if (i == 1)
		return String(Class'NWUDamage'.default.MaxActiveTime);
	if (i == 2)
		return String(Class'NWUDamage'.default.DamageMultiplier);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'NWUDamage'.default.ActiveTime = Int(val);
	else if (i == 1)
		Class'NWUDamage'.default.MaxActiveTime = Int(val);
	else if (i == 2)
		Class'NWUDamage'.default.DamageMultiplier = Float(val);
	
	Class'NWUDamage'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'ExtrasUDamageAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Active time")
	SettingsList(0)=(HelpTip="Time during which the U-Damage is active (in seconds)")
	SettingsList(0)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(1)=(Description="Max active time")
	SettingsList(1)=(HelpTip="Max accumulated time during which the U-Damage is active (in seconds)")
	SettingsList(1)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(2)=(Description="Damage multiplier")
	SettingsList(2)=(HelpTip="Damage multiplier amount")
	SettingsList(2)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(2)=(BottomMargin=20.000000)
}
