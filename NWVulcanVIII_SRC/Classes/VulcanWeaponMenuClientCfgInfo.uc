//////////////////////////////////////////////////////////////
//				Feralidragon (27-10-2012)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////
class VulcanWeaponMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'Vulcan'.default.enableOverheatMsg);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local Vulcan VU;

	if (i == 0)
		Class'Vulcan'.default.enableOverheatMsg = Bool(val);
		
	if (P != None)
	{
		ForEach P.AllActors(Class'Vulcan', VU)
		{
			VU.default.enableOverheatMsg = Class'Vulcan'.default.enableOverheatMsg;
			VU.enableOverheatMsg = Class'Vulcan'.default.enableOverheatMsg;
		}
	}

	Class'Vulcan'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Enable Vulcan overheat message")
	SettingsList(0)=(HelpTip="Enable Vulcan message when overheating")
	SettingsList(0)=(Type=ST_Checkbox)
}