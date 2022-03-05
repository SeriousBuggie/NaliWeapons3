//////////////////////////////////////////////////////////////
//				Feralidragon (27-10-2012)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////
class FlameTrackerWeaponMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'FlameTracker'.default.enableOverheatMsg);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local FlameTracker FT;

	if (i == 0)
		Class'FlameTracker'.default.enableOverheatMsg = Bool(val);
		
	if (P != None)
	{
		ForEach P.AllActors(Class'FlameTracker', FT)
		{
			FT.default.enableOverheatMsg = Class'FlameTracker'.default.enableOverheatMsg;
			FT.enableOverheatMsg = Class'FlameTracker'.default.enableOverheatMsg;
		}
	}

	Class'FlameTracker'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Enable Flame Tracker overheat message")
	SettingsList(0)=(HelpTip="Enable Flame Tracker message when overheating")
	SettingsList(0)=(Type=ST_Checkbox)
}