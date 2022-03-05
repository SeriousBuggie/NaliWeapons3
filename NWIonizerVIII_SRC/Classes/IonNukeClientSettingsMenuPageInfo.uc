//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class IonNukeClientSettingsMenuPageInfo expands NukesClientSettingsMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i <= 1)
		return Super.GetDefaultValue(i, advIndex);
	
	if (i == 2)
		return String(Class'IonNuclearExplosion'.default.SmkLightningsAmountPerUpdateMin);
	if (i == 3)
		return String(Class'IonNuclearExplosion'.default.SmkLightningsAmountPerUpdateMax);
	if (i == 4)
		return String(Class'IonNuclearExplosion'.default.SmkLightningsRateMin);
	if (i == 5)
		return String(Class'IonNuclearExplosion'.default.SmkLightningsRateMax);
	if (i == 6)
		return String(Class'IonNuclearExplosion'.default.SphereLightningsAmountPerUpdateMin);
	if (i == 7)
		return String(Class'IonNuclearExplosion'.default.SphereLightningsAmountPerUpdateMax);
	if (i == 8)
		return String(Class'IonNuclearExplosion'.default.SphereLightningsRateMin);
	if (i == 9)
		return String(Class'IonNuclearExplosion'.default.SphereLightningsRateMax);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i <= 1)
		return Super.ProcessSettingsChange(P, i, val, advIndex);

	if (i == 2 || i == 3 || i == 6 || i == 7)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		
		if (i == 2)
			Class'IonNuclearExplosion'.default.SmkLightningsAmountPerUpdateMin = Byte(val);
		else if (i == 3)
			Class'IonNuclearExplosion'.default.SmkLightningsAmountPerUpdateMax = Byte(val);
		else if (i == 6)
			Class'IonNuclearExplosion'.default.SphereLightningsAmountPerUpdateMin = Byte(val);
		else if (i == 7)
			Class'IonNuclearExplosion'.default.SphereLightningsAmountPerUpdateMax = Byte(val);
	}
	else if (i == 4)
		Class'IonNuclearExplosion'.default.SmkLightningsRateMin = Float(val);
	else if (i == 5)
		Class'IonNuclearExplosion'.default.SmkLightningsRateMax = Float(val);
	else if (i == 8)
		Class'IonNuclearExplosion'.default.SphereLightningsRateMin = Float(val);
	else if (i == 9)
		Class'IonNuclearExplosion'.default.SphereLightningsRateMax = Float(val);
	
	Class'IonNuclearExplosion'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'IonNukeAdvancedMainModMenuInfoClient'
	PageTitle="Settings"
	
	NukeExplClass=Class'IonNuclearExplosion'
	
	SettingsList(2)=(Description="Explosion clouds min lightnings amount")
	SettingsList(2)=(HelpTip="Min amount of lightnings in the explosion resultant clouds/smoke")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(3)=(Description="Explosion clouds max lightnings amount")
	SettingsList(3)=(HelpTip="Max amount of lightnings in the explosion resultant clouds/smoke")
	SettingsList(3)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(4)=(Description="Explosion clouds min lightnings rate")
	SettingsList(4)=(HelpTip="Min rate on the appearance of lightnings in the explosion resultant clouds/smoke%n%(in times per second)")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(5)=(Description="Explosion clouds max lightnings rate")
	SettingsList(5)=(HelpTip="Max rate on the appearance of lightnings in the explosion resultant clouds/smoke%n%(in times per second)")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(5)=(BottomMargin=20.000000)
	
	SettingsList(6)=(Description="Ion sphere min lightnings amount")
	SettingsList(6)=(HelpTip="Min amount of lightnings in the explosion ion sphere")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(7)=(Description="Ion sphere max lightnings amount")
	SettingsList(7)=(HelpTip="Max amount of lightnings in the explosion ion sphere")
	SettingsList(7)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(8)=(Description="Ion sphere min lightnings rate")
	SettingsList(8)=(HelpTip="Min rate on the appearance of lightnings in the explosion ion sphere%n%(in times per second)")
	SettingsList(8)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(9)=(Description="Ion sphere max lightnings rate")
	SettingsList(9)=(HelpTip="Max rate on the appearance of lightnings in the explosion ion sphere%n%(in times per second)")
	SettingsList(9)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(9)=(BottomMargin=20.000000)
}
