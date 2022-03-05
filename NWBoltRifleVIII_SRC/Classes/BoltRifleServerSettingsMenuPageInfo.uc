//////////////////////////////////////////////////////////////
//				Feralidragon (12-09-2012)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////
class BoltRifleServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'BoltRifle'.default.bWaterConductive);
	if (i == 1)
		return String(Class'BoltRifle'.default.WaterElectrocutionRadius);
	if (i == 2)
		return String(Class'BoltRifle'.default.WaterElectrocutionDamage);
	if (i == 3)
		return String(Class'BoltRifle'.default.HeadShotDmg);
	if (i == 4)
		return String(Class'BoltRifle'.default.ComboExtraAmmo);
	if (i == 5)
		return String(Class'BoltRifle'.default.ComboDamage);
	if (i == 7)
		return String(Class'BoltRifle'.default.enableOversurrection);
	if (i == 8)
		return String(Class'BoltRifle'.default.OversurrectionLifeTime);
	if (i == 9)
		return String(Class'BoltRifle'.default.OversurrectiveHLRate);
	if (i == 10)
		return String(Class'BoltRifle'.default.OversurrectiveHLOdds);
	if (i == 11)
		return String(Class'BoltRifle'.default.OversurrectiveCloudHLOdds);
	if (i == 12)
		return String(Class'BoltRifle'.default.OversurrectiveDryHLOdds);
	if (i == 13)
		return String(Class'BoltRifle'.default.OversurrectiveEnemyHLOdds);
	if (i == 14)
		return String(Class'BoltRifle'.default.OversurrectiveMaxHL);
	if (i == 15)
		return String(Class'BoltRifle'.default.OversurrectiveHLMaxDist);
	if (i == 16)
		return String(Class'BoltRifle'.default.OversurrectiveHLDirectDmg);
	if (i == 17)
		return String(Class'BoltRifle'.default.OversurrectiveHLSplashDmg);
	if (i == 18)
		return String(Class'BoltRifle'.default.OversurrectiveHLDmgRadius);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'BoltRifle'.default.bWaterConductive = Bool(val);
	else if (i == 1)
		Class'BoltRifle'.default.WaterElectrocutionRadius = Float(val);
	else if (i == 2)
		Class'BoltRifle'.default.WaterElectrocutionDamage = Int(val);
	else if (i == 3)
		Class'BoltRifle'.default.HeadShotDmg = Int(val);
	else if (i == 4)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		Class'BoltRifle'.default.ComboExtraAmmo = Byte(val);
	}
	else if (i == 5)
		Class'BoltRifle'.default.ComboDamage = Int(val);
	else if (i == 7)
		Class'BoltRifle'.default.enableOversurrection = Bool(val);
	else if (i == 8)
		Class'BoltRifle'.default.OversurrectionLifeTime = Float(val);
	else if (i == 9)
		Class'BoltRifle'.default.OversurrectiveHLRate = Float(val);
	else if (i >= 10 && i <= 13)
	{
		if (Float(val) < 0.0)
			val = String(0.0);
		else if (Float(val) > 1.0)
			val = String(1.0);
			
		if (i == 10)
			Class'BoltRifle'.default.OversurrectiveHLOdds = Float(val);
		if (i == 11)
			Class'BoltRifle'.default.OversurrectiveCloudHLOdds = Float(val);
		if (i == 12)
			Class'BoltRifle'.default.OversurrectiveDryHLOdds = Float(val);
		if (i == 13)
			Class'BoltRifle'.default.OversurrectiveEnemyHLOdds = Float(val);
	}
	else if (i == 14)
		Class'BoltRifle'.default.OversurrectiveMaxHL = Int(val);
	else if (i == 15)
		Class'BoltRifle'.default.OversurrectiveHLMaxDist = Float(val);
	else if (i == 16)
		Class'BoltRifle'.default.OversurrectiveHLDirectDmg = Int(val);
	else if (i == 17)
		Class'BoltRifle'.default.OversurrectiveHLSplashDmg = Int(val);
	else if (i == 18)
		Class'BoltRifle'.default.OversurrectiveHLDmgRadius = Float(val);
	
	Class'BoltRifle'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'BoltRifleAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Enable Water conductivity")
	SettingsList(0)=(HelpTip="Simulate water conductivity for electric shots")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Water electrocution radius")
	SettingsList(1)=(HelpTip="Max radius of electricity spread in water")
	SettingsList(1)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(2)=(Description="Water electrocution damage")
	SettingsList(2)=(HelpTip="Amount of damage given from the electricity spread in water")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=4)

	SettingsList(3)=(Description="Headshot damage")
	SettingsList(3)=(HelpTip="Amount of damage given from a headshot")
	SettingsList(3)=(Type=ST_IntegerInput,MaxChars=4)

	SettingsList(4)=(Description="Extra combo ammo")
	SettingsList(4)=(HelpTip="Amount of additional ammo needed to perform an electric combo")
	SettingsList(4)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(5)=(Description="Combo damage")
	SettingsList(5)=(HelpTip="Max amount of damage given by an electric combo")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=5)
	SettingsList(5)=(BottomMargin=20.000000)
	
	SettingsList(6)=(Description="Oversurrection:")
	SettingsList(6)=(HelpTip="Oversurrection settings")
	SettingsList(6)=(Type=ST_Label)
	
	SettingsList(7)=(Description="    Enable Oversurrection")
	SettingsList(7)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(7)=(Type=ST_Checkbox)
	
	SettingsList(8)=(Description="    Life time")
	SettingsList(8)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(8)=(Type=ST_FloatInput,MaxChars=4)

	SettingsList(9)=(Description="    Lightnings rate")
	SettingsList(9)=(HelpTip="Oversurrection lightnings rate (in times per second)")
	SettingsList(9)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(10)=(Description="    Lightnings odds")
	SettingsList(10)=(HelpTip="Oversurrection odds for lightnings to happen at all (from 0.0 to 1.0)")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(11)=(Description="    Lightnings cloud odds")
	SettingsList(11)=(HelpTip="Oversurrection odds for lightnings to happen within the cloud (from 0.0 to 1.0)")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(12)=(Description="    Lightnings dry odds")
	SettingsList(12)=(HelpTip="Oversurrection odds for non-connecting lightnings to happen (from 0.0 to 1.0)")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(13)=(Description="    Lightnings enemy odds")
	SettingsList(13)=(HelpTip="Oversurrection odds for lightnings to strike down enemies directly (from 0.0 to 1.0)")
	SettingsList(13)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(14)=(Description="    Max lightnings per cycle")
	SettingsList(14)=(HelpTip="Oversurrection max lightnings amount per cycle")
	SettingsList(14)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(15)=(Description="    Lightning max distance")
	SettingsList(15)=(HelpTip="Oversurrection lightning max travel distance")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(16)=(Description="    Lightning direct damage")
	SettingsList(16)=(HelpTip="Oversurrection lightning damage on direct hit")
	SettingsList(16)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(17)=(Description="    Lightning splash damage")
	SettingsList(17)=(HelpTip="Oversurrection lightning damage on splash")
	SettingsList(17)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(18)=(Description="    Lightning max damage radius")
	SettingsList(18)=(HelpTip="Oversurrection lightning max damaging radius from hit point")
	SettingsList(18)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(18)=(BottomMargin=20.000000)
}
