//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class NukeLvlCClientSettingsMenuPageInfo expands NukesClientSettingsMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i <= 1)
		return Super.GetDefaultValue(i, advIndex);
	
	if (i == 2)
		return String(Class'NuclearExplosionLevelC'.default.debrisAmountPerUpdate);
	if (i == 3)
		return String(Class'NuclearExplosionLevelC'.default.debrisRate);
	if (i == 4)
		return String(Class'NuclearExplosionLevelC'.default.lightningsAmountPerUpdate);
	if (i == 5)
		return String(Class'NuclearExplosionLevelC'.default.lightningsRate);
	if (i == 6)
		return String(Class'NuclearExplosionLevelC'.default.FinalExplFXAmountPerUpdate);
	if (i == 7)
		return String(Class'NuclearExplosionLevelC'.default.FinalExplFXRate);
	if (i == 8)
		return String(Class'NuclearExplosionLevelC'.default.FinalSmokeFXAmountPerUpdate);
	if (i == 9)
		return String(Class'NuclearExplosionLevelC'.default.FinalSmokeFXRate);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i <= 1)
		return Super.ProcessSettingsChange(P, i, val, advIndex);

	if (i == 2 || i == 4)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		
		if (i == 2)
			Class'NuclearExplosionLevelC'.default.debrisAmountPerUpdate = Byte(val);
		else if (i == 4)
			Class'NuclearExplosionLevelC'.default.lightningsAmountPerUpdate = Byte(val);
	}
	else if (i == 3)
		Class'NuclearExplosionLevelC'.default.debrisRate = Float(val);
	else if (i == 5)
		Class'NuclearExplosionLevelC'.default.lightningsRate = Float(val);
	else if (i == 6)
		Class'NuclearExplosionLevelC'.default.FinalExplFXAmountPerUpdate = Int(val);
	else if (i == 7)
		Class'NuclearExplosionLevelC'.default.FinalExplFXRate = Float(val);
	else if (i == 8)
		Class'NuclearExplosionLevelC'.default.FinalSmokeFXAmountPerUpdate = Int(val);
	else if (i == 9)
		Class'NuclearExplosionLevelC'.default.FinalSmokeFXRate = Float(val);
	
	Class'NuclearExplosionLevelC'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NukeLvlCAdvancedMainModMenuInfoClient'
	PageTitle="Settings"
	
	NukeExplClass=Class'NuclearExplosionLevelC'
	
	SettingsList(2)=(Description="Debris generation amount")
	SettingsList(2)=(HelpTip="Amount of debris generated during the blast")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(3)=(Description="Debris generation rate")
	SettingsList(3)=(HelpTip="Rate on the generation of debris during the blast%n%(in times per second)")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(4)=(Description="Lightnings FX amount")
	SettingsList(4)=(HelpTip="Amount of lightning effects during the blast")
	SettingsList(4)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(5)=(Description="Lightnings FX rate")
	SettingsList(5)=(HelpTip="Rate on the generation of lightning effects during the blast%n%(in times per second)")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(6)=(Description="Explosive FX amount")
	SettingsList(6)=(HelpTip="Amount of explosive effects during the blast")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(7)=(Description="Explosive FX rate")
	SettingsList(7)=(HelpTip="Rate on the generation of explosive effects during the blast%n%(in times per second)")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(8)=(Description="Ending smoke FX amount")
	SettingsList(8)=(HelpTip="Amount of ending smoke effects during the blast")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(9)=(Description="Ending smoke FX rate")
	SettingsList(9)=(HelpTip="Rate on the generation of ending smoke effects during the blast%n%(in times per second)")
	SettingsList(9)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(9)=(BottomMargin=20.000000)
}
