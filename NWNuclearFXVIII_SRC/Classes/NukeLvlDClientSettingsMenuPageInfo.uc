//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class NukeLvlDClientSettingsMenuPageInfo expands NukesClientSettingsMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i <= 1)
		return Super.GetDefaultValue(i, advIndex);
	
	if (i == 2)
		return String(Class'NuclearExplosionLevelD'.default.enableFXSmartPerformance);
	if (i == 3)
		return String(Class'NuclearExplosionLevelD'.default.FlyingDebrisAmount);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i <= 1)
		return Super.ProcessSettingsChange(P, i, val, advIndex);

	if (i == 2)
		Class'NuclearExplosionLevelD'.default.enableFXSmartPerformance = Bool(val);
	else if (i == 3)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		
		Class'NuclearExplosionLevelD'.default.FlyingDebrisAmount = Byte(val);
	}
	
	Class'NuclearExplosionLevelD'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NukeLvlDAdvancedMainModMenuInfoClient'
	PageTitle="Settings"
	
	NukeExplClass=Class'NuclearExplosionLevelD'
	
	SettingsList(2)=(Description="Enable smart performance")
	SettingsList(2)=(HelpTip="Enable smart performance system for heavy explosion effects")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Flying debris generation amount")
	SettingsList(3)=(HelpTip="Amount of flying debris generated during the blast")
	SettingsList(3)=(Type=ST_IntegerInput,MaxChars=3)
	SettingsList(3)=(BottomMargin=20.000000)
}
