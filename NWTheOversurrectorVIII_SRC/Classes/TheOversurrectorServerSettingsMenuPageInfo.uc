//////////////////////////////////////////////////////////////
//				Feralidragon (07-02-2014)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////
class TheOversurrectorServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'TheOversurrector'.default.bSacrificeWeapon);
	if (i == 1)
		return String(Class'TheOversurrector'.default.bSacrificeAmmo);
	if (i == 2)
		return String(Class'TheOversurrector'.default.bAmmoNeededToSacrifice);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'TheOversurrector'.default.bSacrificeWeapon = Bool(val);
	else if (i == 1)
		Class'TheOversurrector'.default.bSacrificeAmmo = Bool(val);
	else if (i == 2)
		Class'TheOversurrector'.default.bAmmoNeededToSacrifice = Bool(val);
	Class'TheOversurrector'.static.StaticSaveConfig();
	return val;
}

defaultproperties
{
	ModMenuInfoClass=Class'TheOversurrectorAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Sacrifice weapon")
	SettingsList(0)=(HelpTip="Destroy oversurrected weapon")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Sacrifice ammo")
	SettingsList(1)=(HelpTip="Remove all ammo from oversurrected weapon")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Require ammo")
	SettingsList(2)=(HelpTip="Require ammo to be present in the weapon so it can be oversurrected")
	SettingsList(2)=(Type=ST_Checkbox)
	SettingsList(2)=(BottomMargin=20.000000)
}
