//////////////////////////////////////////////////////////////
//				Feralidragon (27-03-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWServerSkillKillsSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NWSkillKillsManager'.default.enableSkillKills);
	if (i == 1)
		return String(Class'NWSkillKillsManager'.default.PointsMultiplier);
	if (i == 2)
		return String(Class'NWSkillKillsManager'.default.TimeBetweenMsgs);
	if (i == 3)
		return Class'NWSkillKillsManager'.default.PointsMessage;
	if (i == 4)
		return String(Class'NWSkillKillsManager'.default.disableExtraPointsOnDMGames);
	if (i == 5)
		return String(Class'NWSkillKillsManager'.default.MaxMsgsMerging);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local int t;

	if (i == 0)
		Class'NWSkillKillsManager'.default.enableSkillKills = Bool(val);
	else if (i == 1)
		Class'NWSkillKillsManager'.default.PointsMultiplier = Float(val);
	else if (i == 2)
		Class'NWSkillKillsManager'.default.TimeBetweenMsgs = Float(val);
	else if (i == 3)
		Class'NWSkillKillsManager'.default.PointsMessage = val;
	else if (i == 4)
		Class'NWSkillKillsManager'.default.disableExtraPointsOnDMGames = Bool(val);
	else if (i == 5)
	{
		t = Int(val);
		if (t < 0)
			t = 0;
		else if (t > 255)
			t = 255;
		Class'NWSkillKillsManager'.default.MaxMsgsMerging = Byte(t);
	}
		
	Class'NWSkillKillsManager'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NWServerSettingsMainModMenuInfo'
	PageTitle="Skill Kills"
	
	SettingsList(0)=(Description="Enable skill kills")
	SettingsList(0)=(HelpTip="Enable skill kills system")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Points multiplier")
	SettingsList(1)=(HelpTip="Skill points multiplier")
	SettingsList(1)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(2)=(Description="Time between messages")
	SettingsList(2)=(HelpTip="Time between skill notifications (in seconds)")
	SettingsList(2)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(3)=(Description="Points message format")
	SettingsList(3)=(HelpTip="Message format to appear on points (%n is replaced by the amount of points)")
	SettingsList(3)=(Type=ST_Input,MaxChars=15)
	
	SettingsList(4)=(Description="Disable points in DM")
	SettingsList(4)=(HelpTip="Disable extra skill points in Death Match games")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Max messages merging")
	SettingsList(5)=(HelpTip="Max amount of skill messages to be merged into a single one")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=3)
	SettingsList(5)=(BottomMargin=20.000000)
}
