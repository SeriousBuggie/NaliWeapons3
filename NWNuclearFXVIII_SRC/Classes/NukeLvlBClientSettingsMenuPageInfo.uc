//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class NukeLvlBClientSettingsMenuPageInfo expands NukesClientSettingsMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i <= 1)
		return Super.GetDefaultValue(i, advIndex);
	
	if (i == 2)
		return String(Class'NuclearExplosionLevelB'.default.ExplosionFXDensity);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i <= 1)
		return Super.ProcessSettingsChange(P, i, val, advIndex);

	if (i == 2)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		
		Class'NuclearExplosionLevelB'.default.ExplosionFXDensity = Byte(val);
	}
	
	Class'NuclearExplosionLevelB'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NukeLvlBAdvancedMainModMenuInfoClient'
	PageTitle="Settings"
	
	NukeExplClass=Class'NuclearExplosionLevelB'
	
	SettingsList(2)=(Description="GFX density")
	SettingsList(2)=(HelpTip="Explosion effects density")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=3)
	SettingsList(2)=(BottomMargin=20.000000)
}
