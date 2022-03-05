//////////////////////////////////////////////////////////////
//				Feralidragon (28-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NukesClientSettingsMenuPageInfo expands NWMenuPageInfo;

var() class<NuclearExplosions> NukeExplClass;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(default.NukeExplClass.default.DynamicLightOn);
	else if (i == 1)
		return String(default.NukeExplClass.default.enableNukeDebrisWaterFX);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		default.NukeExplClass.default.DynamicLightOn = Bool(val);
	else if (i == 1)
		default.NukeExplClass.default.enableNukeDebrisWaterFX = Bool(val);
	
	default.NukeExplClass.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NukesAdvancedMainModMenuInfoClient'
	PageTitle="Settings"
	
	NukeExplClass=Class'NuclearExplosions'
	
	SettingsList(0)=(Description="Enable dynamic light")
	SettingsList(0)=(HelpTip="Enable dynamic lighting during the nuclear explosion")
	SettingsList(0)=(Type=ST_Checkbox)

	SettingsList(1)=(Description="Nuclear debris water GFX")
	SettingsList(1)=(HelpTip="Enable splash effect when nuclear debris hit the water")
	SettingsList(1)=(Type=ST_Checkbox)
	SettingsList(1)=(BottomMargin=20.000000)
}
