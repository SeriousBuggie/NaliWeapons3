//////////////////////////////////////////////////////////////
//				Feralidragon (12-09-2012)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////
class WREServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'WRE'.default.GrenadeAmmoConsumption);
	if (i == 1)
		return String(Class'WRE'.default.HeadShotDmg);
	if (i == 2)
		return String(Class'WRE'.default.RunningAimError);
	if (i == 3)
		return String(Class'WRE'.default.WalkingAimError);
	if (i == 4)
		return String(Class'WRE'.default.CrouchingAimError);
	if (i == 6)
		return String(Class'WRE'.default.enableOversurrection);
	if (i == 7)
		return String(Class'WRE'.default.OversurrectionLifeTime);
	if (i == 8)
		return String(Class'WRE'.default.OversurrectiveHealth);
	if (i == 9)
		return String(Class'WRE'.default.OversurrectiveAttackDmg);
	if (i == 10)
		return String(Class'WRE'.default.OversurrectiveAttackHSDmg);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'WRE'.default.GrenadeAmmoConsumption = Int(val);
	else if (i == 1)
		Class'WRE'.default.HeadShotDmg = Int(val);
	else if (i == 2)
		Class'WRE'.default.RunningAimError = Float(val);
	else if (i == 3)
		Class'WRE'.default.WalkingAimError = Float(val);
	else if (i == 4)
		Class'WRE'.default.CrouchingAimError = Float(val);
	else if (i == 6)
		Class'WRE'.default.enableOversurrection = Bool(val);
	else if (i == 7)
		Class'WRE'.default.OversurrectionLifeTime = Float(val);
	else if (i == 8)
		Class'WRE'.default.OversurrectiveHealth = Int(val);
	else if (i == 9)
		Class'WRE'.default.OversurrectiveAttackDmg = Int(val);
	else if (i == 10)
		Class'WRE'.default.OversurrectiveAttackHSDmg = Int(val);

	Class'WRE'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'WREAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Grenade ammo usage")
	SettingsList(0)=(HelpTip="Amount of minimum ammo needed to fire an ion grenade")
	SettingsList(0)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(1)=(Description="Headshot damage")
	SettingsList(1)=(HelpTip="Amount of damage given from a headshot")
	SettingsList(1)=(Type=ST_IntegerInput,MaxChars=4)

	SettingsList(2)=(Description="Aim error (running)")
	SettingsList(2)=(HelpTip="Fire aim max error margin while running")
	SettingsList(2)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(3)=(Description="Aim error (walking)")
	SettingsList(3)=(HelpTip="Fire aim max error margin while walking")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(4)=(Description="Aim error (crouching)")
	SettingsList(4)=(HelpTip="Fire aim max error margin while crouching")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(4)=(BottomMargin=20.000000)
	
	SettingsList(5)=(Description="Oversurrection:")
	SettingsList(5)=(HelpTip="Oversurrection settings")
	SettingsList(5)=(Type=ST_Label)
	
	SettingsList(6)=(Description="    Enable Oversurrection")
	SettingsList(6)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="    Life time")
	SettingsList(7)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(8)=(Description="    Armor")
	SettingsList(8)=(HelpTip="Oversurrection armor amount")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(9)=(Description="    Normal damage")
	SettingsList(9)=(HelpTip="Oversurrection normal shooting damage")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(10)=(Description="    Headshot damage")
	SettingsList(10)=(HelpTip="Oversurrection headshot damage")
	SettingsList(10)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(10)=(BottomMargin=20.000000)
}
