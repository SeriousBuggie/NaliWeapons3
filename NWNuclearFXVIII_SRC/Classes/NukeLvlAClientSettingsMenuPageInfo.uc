//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class NukeLvlAClientSettingsMenuPageInfo expands NukesClientSettingsMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i <= 1)
		return Super.GetDefaultValue(i, advIndex);
	
	if (i == 2)
		return String(Class'NuclearExplosionLevelA'.default.ExplFXAmountPerUpdate);
	if (i == 3)
		return String(Class'NuclearExplosionLevelA'.default.ExplFXRate);
	if (i == 4)
		return String(Class'NuclearExplosionLevelA'.default.SmokeFXAmountPerUpdate);
	if (i == 5)
		return String(Class'NuclearExplosionLevelA'.default.SmokeFXRate);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i <= 1)
		return Super.ProcessSettingsChange(P, i, val, advIndex);

	if (i == 2)
		Class'NuclearExplosionLevelA'.default.ExplFXAmountPerUpdate = Int(val);
	else if (i == 3)
		Class'NuclearExplosionLevelA'.default.ExplFXRate = Float(val);
	else if (i == 4)
		Class'NuclearExplosionLevelA'.default.SmokeFXAmountPerUpdate = Int(val);
	else if (i == 5)
		Class'NuclearExplosionLevelA'.default.SmokeFXRate = Float(val);
	
	Class'NuclearExplosionLevelA'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NukeLvlAAdvancedMainModMenuInfoClient'
	PageTitle="Settings"
	
	NukeExplClass=Class'NuclearExplosionLevelA'
	
	SettingsList(2)=(Description="Explosive FX amount")
	SettingsList(2)=(HelpTip="Amount of explosive effects during the blast")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(3)=(Description="Explosive FX rate")
	SettingsList(3)=(HelpTip="Rate on the appearance of explosive effects during the blast%n%(in times per second)")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(4)=(Description="Smoke FX amount")
	SettingsList(4)=(HelpTip="Amount of smoke effects during the blast")
	SettingsList(4)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(5)=(Description="Smoke FX rate")
	SettingsList(5)=(HelpTip="Rate on the appearance of smoke effects during the blast%n%(in times per second)")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(5)=(BottomMargin=20.000000)
}
