//////////////////////////////////////////////////////////////
//				Feralidragon (28-10-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class NWNuclearWarnMutMenuServerCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 1)
		return String(Class'NWNuclearWarningMut'.default.bWarnTeamMates);
	if (i == 2)
		return String(Class'NWNuclearWarningMut'.default.bWarnInstigator);
	if (i == 3)
		return String(Class'NWNuclearWarningMut'.default.enableWarnBacksound);
	if (i == 4)
		return String(Class'NWNuclearWarningMut'.default.enableWarningDetails);
	if (i == 5)
		return String(Class'NWNuclearWarningMut'.default.enableWarningPlayerName);
	if (i == 6)
		return String(Class'NWNuclearWarningMut'.default.WarningUpdateTime);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 1)
		Class'NWNuclearWarningMut'.default.bWarnTeamMates = Bool(val);
	else if (i == 2)
		Class'NWNuclearWarningMut'.default.bWarnInstigator = Bool(val);
	else if (i == 3)
		Class'NWNuclearWarningMut'.default.enableWarnBacksound = Bool(val);
	else if (i == 4)
		Class'NWNuclearWarningMut'.default.enableWarningDetails = Bool(val);
	else if (i == 5)
		Class'NWNuclearWarningMut'.default.enableWarningPlayerName = Bool(val);
	else if (i == 6)
		Class'NWNuclearWarningMut'.default.WarningUpdateTime = Float(val);

	Class'NWNuclearWarningMut'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	SettingsList(0)=(Description="Nuclear Warning Mutator")
	SettingsList(0)=(Type=ST_Label)

	SettingsList(1)=(Description="    Warn teammates")
	SettingsList(1)=(HelpTip="Enable warning display for teammates")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="    Warn owner")
	SettingsList(2)=(HelpTip="Enable warning display for nuke owner")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="    Enable warning sound")
	SettingsList(3)=(HelpTip="Enable warning background sound")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="    Enable warning details")
	SettingsList(4)=(HelpTip="Enable warning details such as the countdown or distance from impact")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="    Enable warning player name")
	SettingsList(5)=(HelpTip="Enable warning nuker player name")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="    Warning update time")
	SettingsList(6)=(HelpTip="Time interval between nuke checks")
	SettingsList(6)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(6)=(BottomMargin=20.000000)
}