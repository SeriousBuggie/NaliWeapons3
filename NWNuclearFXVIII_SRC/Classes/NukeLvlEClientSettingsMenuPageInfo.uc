//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class NukeLvlEClientSettingsMenuPageInfo expands NukesClientSettingsMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i <= 1)
		return Super.GetDefaultValue(i, advIndex);
	
	if (i == 2)
		return String(Class'NuclearExplosionLevelE'.default.debrisAmountPerUpdate);
	if (i == 3)
		return String(Class'NuclearExplosionLevelE'.default.debrisRate);
	if (i == 4)
		return String(Class'NuclearExplosionLevelE'.default.sphericElectricAmountPerUpdate);
	if (i == 5)
		return String(Class'NuclearExplosionLevelE'.default.sphericElectricRate);
	if (i == 6)
		return String(Class'NuclearExplosionLevelE'.default.sphericFinalElectricMinAmountPerUpdate);
	if (i == 7)
		return String(Class'NuclearExplosionLevelE'.default.sphericFinalElectricMaxAmountPerUpdate);
	if (i == 8)
		return String(Class'NuclearExplosionLevelE'.default.sphericFinalElectricRate);
	if (i == 9)
		return String(Class'NuclearExplosionLevelE'.default.enableDebrisExplFX);
	if (i == 10)
		return String(Class'NuclearExplosionLevelE'.default.debrisExplRate);
	if (i == 11)
		return String(Class'NuclearExplosionLevelE'.default.debrisExplTime);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i <= 1)
		return Super.ProcessSettingsChange(P, i, val, advIndex);

	if (i == 2 || i == 4 || i == 6 || i == 7)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		
		if (i == 2)
			Class'NuclearExplosionLevelE'.default.debrisAmountPerUpdate = Byte(val);
		else if (i == 4)
			Class'NuclearExplosionLevelE'.default.sphericElectricAmountPerUpdate = Byte(val);
		else if (i == 6)
			Class'NuclearExplosionLevelE'.default.sphericFinalElectricMinAmountPerUpdate = Byte(val);
		else if (i == 7)
			Class'NuclearExplosionLevelE'.default.sphericFinalElectricMaxAmountPerUpdate = Byte(val);
	}
	else if (i == 3)
		Class'NuclearExplosionLevelE'.default.debrisRate = Float(val);
	else if (i == 5)
		Class'NuclearExplosionLevelE'.default.sphericElectricRate = Float(val);
	else if (i == 8)
		Class'NuclearExplosionLevelE'.default.sphericFinalElectricRate = Float(val);
	else if (i == 9)
		Class'NuclearExplosionLevelE'.default.enableDebrisExplFX = Bool(val);
	else if (i == 10)
		Class'NuclearExplosionLevelE'.default.debrisExplRate = Float(val);
	else if (i == 11)
		Class'NuclearExplosionLevelE'.default.debrisExplTime = Float(val);
	
	Class'NuclearExplosionLevelE'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NukeLvlEAdvancedMainModMenuInfoClient'
	PageTitle="Settings"
	
	NukeExplClass=Class'NuclearExplosionLevelE'
	
	SettingsList(2)=(Description="Debris generation amount")
	SettingsList(2)=(HelpTip="Amount of debris generated during the blast")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(3)=(Description="Debris generation rate")
	SettingsList(3)=(HelpTip="Rate on the generation of debris during the blast%n%(in times per second)")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(4)=(Description="Spherical electric FX generation amount")
	SettingsList(4)=(HelpTip="Amount of spherical electric effects generated during the blast")
	SettingsList(4)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(5)=(Description="Spherical electric FX generation rate")
	SettingsList(5)=(HelpTip="Rate on the generation of spherical electric effects during the blast%n%(in times per second)")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(6)=(Description="Final spherical electric FX generation min amount")
	SettingsList(6)=(HelpTip="Min amount of spherical electric effects generated in the end of the blast")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(7)=(Description="Final spherical electric FX generation max amount")
	SettingsList(7)=(HelpTip="Max amount of spherical electric effects generated in the end of the blast")
	SettingsList(7)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(8)=(Description="Final spherical electric FX generation rate")
	SettingsList(8)=(HelpTip="Rate on the generation of spherical electric effects in the end of the blast%n%(in times per second)")
	SettingsList(8)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(8)=(BottomMargin=20.000000)
	
	SettingsList(9)=(Description="Enable explosive debris FX")
	SettingsList(9)=(HelpTip="Enable explosive effects on the blast generated debris")
	SettingsList(9)=(Type=ST_Checkbox)
	
	SettingsList(10)=(Description="Explosive debris FX generation rate")
	SettingsList(10)=(HelpTip="Rate on the generation of explosive effects on the blast generated debris%n%(in times per second)")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(11)=(Description="Explosive debris FX generation time")
	SettingsList(11)=(HelpTip="Time on how long the explosive effects on a single debris may last (in seconds)")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(11)=(BottomMargin=20.000000)
}
