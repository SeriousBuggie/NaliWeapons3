//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////
class RTDetailMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'RT'.default.enableTeleportFXSmartPerformance);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'RT'.default.enableTeleportFXSmartPerformance = Bool(val);

	Class'RT'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Enable R.T. smart performance")
	SettingsList(0)=(HelpTip="Enable Razored Translocator teleport effect smart performance system")
	SettingsList(0)=(Type=ST_Checkbox)
}