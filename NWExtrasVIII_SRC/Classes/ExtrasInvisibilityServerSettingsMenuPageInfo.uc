//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class ExtrasInvisibilityServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NWInvisibility'.default.ActiveTime);
	if (i == 1)
		return String(Class'NWInvisibility'.default.MaxActiveTime);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'NWInvisibility'.default.ActiveTime = Int(val);
	else if (i == 1)
		Class'NWInvisibility'.default.MaxActiveTime = Int(val);
	
	Class'NWInvisibility'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'ExtrasInvisibilityAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Active time")
	SettingsList(0)=(HelpTip="Time during which Invisibility is active (in seconds)")
	SettingsList(0)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(1)=(Description="Max active time")
	SettingsList(1)=(HelpTip="Max accumulated time during which Invisibility is active (in seconds)")
	SettingsList(1)=(Type=ST_IntegerInput,MaxChars=4)
	SettingsList(1)=(BottomMargin=20.000000)
}
