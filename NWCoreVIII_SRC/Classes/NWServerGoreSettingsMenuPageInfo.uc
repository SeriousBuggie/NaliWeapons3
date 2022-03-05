//////////////////////////////////////////////////////////////
//				Feralidragon (25-03-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWServerGoreSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NWBloodyMess'.default.enableHeadshotFX);
	if (i == 1)
		return String(Class'NWBloodyMess'.default.enableBodyshotFX);
	if (i == 2)
		return String(Class'NWBloodyMess'.default.enableHeadshotShake);
	if (i == 3)
		return String(Class'NWBloodyMess'.default.enableBodyshotShake);
	if (i == 4)
		return String(Class'NWBloodyMess'.default.enableBodyCarcassDetection);
	if (i == 5)
		return String(Class'NWBloodyMess'.default.enableBodySkeleton);
	if (i == 6)
		return String(Class'NWBloodyMess'.default.enableFullNetworkRelevancy);
	if (i == 7)
		return String(Class'NWBloodyMess'.default.BloodFogLifespanMultiplier);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'NWBloodyMess'.default.enableHeadshotFX = Bool(val);
	else if (i == 1)
		Class'NWBloodyMess'.default.enableBodyshotFX = Bool(val);
	else if (i == 2)
		Class'NWBloodyMess'.default.enableHeadshotShake = Bool(val);
	else if (i == 3)
		Class'NWBloodyMess'.default.enableBodyshotShake = Bool(val);
	else if (i == 4)
		Class'NWBloodyMess'.default.enableBodyCarcassDetection = Bool(val);
	else if (i == 5)
		Class'NWBloodyMess'.default.enableBodySkeleton = Bool(val);
	else if (i == 6)
		Class'NWBloodyMess'.default.enableFullNetworkRelevancy = Bool(val);
	else if (i == 7)
		Class'NWBloodyMess'.default.BloodFogLifespanMultiplier = Float(val);
		
	Class'NWBloodyMess'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NWServerSettingsMainModMenuInfo'
	PageTitle="Gore"
	
	SettingsList(0)=(Description="Enable headshot FX")
	SettingsList(0)=(HelpTip="Enable head gore effects")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Enable bodyshot FX")
	SettingsList(1)=(HelpTip="Enable body gore effects")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Enable headshot shake FX")
	SettingsList(2)=(HelpTip="Enable head gore shake effects")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Enable bodyshot shake FX")
	SettingsList(3)=(HelpTip="Enable body gore shake effects")
	SettingsList(3)=(Type=ST_Checkbox)
	SettingsList(3)=(BottomMargin=20.000000)
	
	SettingsList(4)=(Description="Enable body carcass detection")
	SettingsList(4)=(HelpTip="Enable body carcass detection for gore effects")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Enable body skeleton")
	SettingsList(5)=(HelpTip="Enable body skeleton for some damage types")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Enable full network relevancy")
	SettingsList(6)=(HelpTip="Enable network bAwaysRelevant flag, so players can see all past gore effects")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="Blood fog lifespan multiplier")
	SettingsList(7)=(HelpTip="Gore blood fog stay time multiplier")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=5)
	SettingsList(7)=(BottomMargin=20.000000)
}
