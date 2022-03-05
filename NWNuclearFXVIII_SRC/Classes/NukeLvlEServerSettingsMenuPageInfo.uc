//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////
class NukeLvlEServerSettingsMenuPageInfo expands NukesServerSettingsMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i <= 19)
		return Super.GetDefaultValue(i, advIndex);
	
	if (i == 20)
		return String(Class'NuclearExplosionLevelE'.default.LightningsAmountPerUpdate);
	if (i == 21)
		return String(Class'NuclearExplosionLevelE'.default.LightningDamage);
	if (i == 22)
		return String(Class'NuclearExplosionLevelE'.default.LightningsRate);
	if (i == 23)
		return String(Class'NuclearExplosionLevelE'.default.LightningDmgRadius);
	if (i == 24)
		return String(Class'NuclearExplosionLevelE'.default.LightningMaxDistance);
	if (i == 25)
		return String(Class'NuclearExplosionLevelE'.default.finalBoltAmountPerUpdate);
	if (i == 26)
		return String(Class'NuclearExplosionLevelE'.default.finalBoltRate);
	if (i == 27)
		return String(Class'NuclearExplosionLevelE'.default.finalBoltMinDistance);
	if (i == 28)
		return String(Class'NuclearExplosionLevelE'.default.finalBoltMaxDistance);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i <= 19)
		return Super.ProcessSettingsChange(P, i, val, advIndex);

	if (i == 20 || i == 25)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		
		if (i == 20)
			Class'NuclearExplosionLevelE'.default.LightningsAmountPerUpdate = Byte(val);
		else if (i == 25)
			Class'NuclearExplosionLevelE'.default.finalBoltAmountPerUpdate = Byte(val);
	}
	else if (i == 21)
		Class'NuclearExplosionLevelE'.default.LightningDamage = Int(val);
	else if (i == 22)
		Class'NuclearExplosionLevelE'.default.LightningsRate = Float(val);
	else if (i == 23)
		Class'NuclearExplosionLevelE'.default.LightningDmgRadius = Float(val);
	else if (i == 24)
		Class'NuclearExplosionLevelE'.default.LightningMaxDistance = Float(val);
	else if (i == 26)
		Class'NuclearExplosionLevelE'.default.finalBoltRate = Float(val);
	else if (i == 27)
		Class'NuclearExplosionLevelE'.default.finalBoltMinDistance = Float(val);
	else if (i == 28)
		Class'NuclearExplosionLevelE'.default.finalBoltMaxDistance = Float(val);
	
	Class'NuclearExplosionLevelE'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NukeLvlEAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	NukeExplClass=Class'NuclearExplosionLevelE'
	
	
	SettingsList(20)=(Description="Lightnings generation amount")
	SettingsList(20)=(HelpTip="Amount of lightnings generated during the blast")
	SettingsList(20)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(21)=(Description="Lightnings damage amount")
	SettingsList(21)=(HelpTip="Lightnings damage amount on direct hit")
	SettingsList(21)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(22)=(Description="Lightnings generation rate")
	SettingsList(22)=(HelpTip="Rate on the generation of lightnings during the blast%n%(in times per second)")
	SettingsList(22)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(23)=(Description="Lightnings damage radius")
	SettingsList(23)=(HelpTip="Lightnings damage affecting radius from hit point")
	SettingsList(23)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(24)=(Description="Lightnings max distance")
	SettingsList(24)=(HelpTip="Lightnings generation max distance")
	SettingsList(24)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(24)=(BottomMargin=20.000000)
	
	SettingsList(25)=(Description="Final lightnings generation amount")
	SettingsList(25)=(HelpTip="Amount of lightnings generated in the end of the blast")
	SettingsList(25)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(26)=(Description="Final lightnings generation rate")
	SettingsList(26)=(HelpTip="Rate on the generation of lightnings in the end of the blast%n%(in times per second)")
	SettingsList(26)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(27)=(Description="Final lightnings min distance")
	SettingsList(27)=(HelpTip="Final lightnings generation min distance")
	SettingsList(27)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(28)=(Description="Final lightnings max distance")
	SettingsList(28)=(HelpTip="Final lightnings generation max distance")
	SettingsList(28)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(28)=(BottomMargin=20.000000)
}
