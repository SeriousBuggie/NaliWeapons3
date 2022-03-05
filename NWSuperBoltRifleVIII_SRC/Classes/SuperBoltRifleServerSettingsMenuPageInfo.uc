//////////////////////////////////////////////////////////////
//				Feralidragon (12-09-2012)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////
class SuperBoltRifleServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'SuperBoltRifle'.default.bInfiniteAmmo);
	if (i == 1)
		return String(Class'SuperBoltRifle'.default.RefireDelay);
	if (i == 2)
		return String(Class'SuperBoltRifle'.default.SuperDamage);
	if (i == 3)
		return String(Class'SuperBoltRifle'.default.canDropWeapon);
	if (i == 4)
		return String(Class'SuperBoltRifle'.default.enableCombo);
	if (i == 5)
		return String(Class'SuperBoltRifle'.default.ProjectileDamage);
	if (i == 6)
		return String(Class'SuperBoltRifle'.default.ComboDamage);
	if (i == 7)
		return String(Class'SuperBoltRifle'.default.RefireDelayAlt);
	if (i == 8)
		return String(Class'SuperBoltRifle'.default.MaxProjectiles);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'SuperBoltRifle'.default.bInfiniteAmmo = Bool(val);
	else if (i == 1)
		Class'SuperBoltRifle'.default.RefireDelay = Float(val);
	else if (i == 2)
		Class'SuperBoltRifle'.default.SuperDamage = Int(val);
	else if (i == 3)
		Class'SuperBoltRifle'.default.canDropWeapon = Bool(val);
	else if (i == 4)
		Class'SuperBoltRifle'.default.enableCombo = Bool(val);
	else if (i == 5)
		Class'SuperBoltRifle'.default.ProjectileDamage = Int(val);
	else if (i == 6)
		Class'SuperBoltRifle'.default.ComboDamage = Int(val);
	else if (i == 7)
		Class'SuperBoltRifle'.default.RefireDelayAlt = Float(val);
	else if (i == 8)
		Class'SuperBoltRifle'.default.MaxProjectiles = Int(val);
	
	Class'SuperBoltRifle'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'SuperBoltRifleAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Infinite ammo")
	SettingsList(0)=(HelpTip="No ammo limit")
	SettingsList(0)=(Type=ST_Checkbox)

	SettingsList(1)=(Description="Re-fire delay time")
	SettingsList(1)=(HelpTip="Delay between shots (in seconds)")
	SettingsList(1)=(Type=ST_FloatInput,MaxChars=4)

	SettingsList(2)=(Description="Shot damage")
	SettingsList(2)=(HelpTip="Damage amount per shot")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(3)=(Description="Drop on death")
	SettingsList(3)=(HelpTip="Drop the weapon on death")
	SettingsList(3)=(Type=ST_Checkbox)
	SettingsList(3)=(BottomMargin=20.000000)
	
	SettingsList(4)=(Description="Enable combo")
	SettingsList(4)=(HelpTip="Enable alternate projectile for combo ability")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Projectile damage")
	SettingsList(5)=(HelpTip="Damage amount given by the alternate projectile")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(6)=(Description="Combo damage")
	SettingsList(6)=(HelpTip="Damage amount given by the combo")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(7)=(Description="Alt-fire delay time")
	SettingsList(7)=(HelpTip="Delay between alternates shots when the combo is enabled (in seconds)")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(8)=(Description="Max projectiles")
	SettingsList(8)=(HelpTip="Max amount of alternate projectiles in play from a player. If set to zero, the max becomes unlimited.")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=2)
	SettingsList(8)=(BottomMargin=20.000000)
}
