//////////////////////////////////////////////////////////////
//				Feralidragon (25-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class IonizerDetailMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'Ionizer'.default.IonDebrisRate);
	if (i == 1)
		return String(Class'Ionizer'.default.IonLightningsRate);
	if (i == 2)
		return String(Class'Ionizer'.default.IonDebrisAmountPerUpdate);
	if (i == 3)
		return String(Class'Ionizer'.default.IonLightingsAmountPerUpdate);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'Ionizer'.default.IonDebrisRate = Float(val);
	else if (i == 1)
		Class'Ionizer'.default.IonLightningsRate = Float(val);
	else if (i == 2 || i == 3)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
			
		if (i == 2)
			Class'Ionizer'.default.IonDebrisAmountPerUpdate = Byte(val);
		else if (i == 3)
			Class'Ionizer'.default.IonLightingsAmountPerUpdate = Byte(val);
	}

	Class'Ionizer'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Ionizer charging debris rate")
	SettingsList(0)=(HelpTip="Ionizer debris generation rate while charging the beam to fire")
	SettingsList(0)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(1)=(Description="Ionizer charging lightnings rate")
	SettingsList(1)=(HelpTip="Ionizer lightnings generation rate while charging the beam to fire")
	SettingsList(1)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(2)=(Description="Ionizer number of debris")
	SettingsList(2)=(HelpTip="Ionizer debris amount in each new generation update")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(3)=(Description="Ionizer number of lightnings")
	SettingsList(3)=(HelpTip="Ionizer lightnings amount in each new generation update")
	SettingsList(3)=(Type=ST_IntegerInput,MaxChars=3)
}