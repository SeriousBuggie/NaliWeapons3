//////////////////////////////////////////////////////////////
//				Feralidragon (28-10-2012)
//
// NW3 MONSTERHUNT EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class NWMHMutMenuServerCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 1)
		return String(Class'NWMHMut'.default.bRegenHealthUnderwater);
	if (i == 2)
		return String(Class'NWMHMut'.default.StartingHealth);
	if (i == 3)
		return String(Class'NWMHMut'.default.HealthRegenPerSec);
	if (i == 4)
		return String(Class'NWMHMut'.default.MaxRegenHealth);
	if (i == 5)
		return String(Class'NWMHMut'.default.AmmoRegenPerSec);
	if (i == 6)
		return String(Class'NWMHMut'.default.AmmoRegenMaxPercentage);
	if (i == 7)
		return String(Class'NWMHMut'.default.StartingAmmoMultiplier);
	if (i == 8)
		return String(Class'NWMHMut'.default.PickupAmmoMultiplier);
	if (i == 9)
		return String(Class'NWMHMut'.default.MaxAmmoMultiplier);
	if (i == 10)
		return String(Class'NWMHMut'.default.enableRandomRewards);
	if (i == 11)
		return String(Class'NWMHMut'.default.RandomRewardsTimeIntervalSeconds);
	if (i == 12)
		return String(Class'NWMHMut'.default.RandomWeaponsOnStartup);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 1)
		Class'NWMHMut'.default.bRegenHealthUnderwater = Bool(val);
	else if (i == 2)
		Class'NWMHMut'.default.StartingHealth = Int(val);
	else if (i == 3)
		Class'NWMHMut'.default.HealthRegenPerSec = Int(val);
	else if (i == 4)
		Class'NWMHMut'.default.MaxRegenHealth = Int(val);
	else if (i == 5)
		Class'NWMHMut'.default.AmmoRegenPerSec = Int(val);
	else if (i == 6)
		Class'NWMHMut'.default.AmmoRegenMaxPercentage = Float(val);
	else if (i == 7)
		Class'NWMHMut'.default.StartingAmmoMultiplier = Float(val);
	else if (i == 8)
		Class'NWMHMut'.default.PickupAmmoMultiplier = Float(val);
	else if (i == 9)
		Class'NWMHMut'.default.MaxAmmoMultiplier = Float(val);
	else if (i == 10)
		Class'NWMHMut'.default.enableRandomRewards = Bool(val);
	else if (i == 11)
		Class'NWMHMut'.default.RandomRewardsTimeIntervalSeconds = Int(val);
	else if (i == 12)
	{
		if (Int(val) > 255)
			val = String(255);
		else if (Int(val) < 0)
			val = String(0);
		Class'NWMHMut'.default.RandomWeaponsOnStartup = Byte(val);
	}

	Class'NWMHMut'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	SettingsList(0)=(Description="Monster Hunt Extras Mutator")
	SettingsList(0)=(Type=ST_Label)

	SettingsList(1)=(Description="    Regenerate health underwater")
	SettingsList(1)=(HelpTip="Enable health regeneration when the player is underwater")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="    Initial health")
	SettingsList(2)=(HelpTip="Player initial default health on respawn")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(3)=(Description="    Health regeneration")
	SettingsList(3)=(HelpTip="Health regeneration amount per second")
	SettingsList(3)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(4)=(Description="    Max regeneration health")
	SettingsList(4)=(HelpTip="Max player health during health regeneration")
	SettingsList(4)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(5)=(Description="    Ammo regeneration")
	SettingsList(5)=(HelpTip="Ammo regeneration amount per second")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(6)=(Description="    Max regeneration ammo")
	SettingsList(6)=(HelpTip="Max ammo percentage (0.0 to 1.0 relative weapon max ammo) during ammo regeneration")
	SettingsList(6)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(7)=(Description="    Initial ammo multiplier")
	SettingsList(7)=(HelpTip="Weapon initial ammo multiplier")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(8)=(Description="    Pickup ammo multiplier")
	SettingsList(8)=(HelpTip="Ammo pickup multiplier")
	SettingsList(8)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(9)=(Description="    Max ammo multiplier")
	SettingsList(9)=(HelpTip="Weapon max ammo multiplier")
	SettingsList(9)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(10)=(Description="    Enable random rewards")
	SettingsList(10)=(HelpTip="Enable random rewards system during a game")
	SettingsList(10)=(Type=ST_Checkbox)
	
	SettingsList(11)=(Description="    Random rewards time interval")
	SettingsList(11)=(HelpTip="Time interval between random rewards (in seconds)")
	SettingsList(11)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(12)=(Description="    Random weapons on respawn")
	SettingsList(12)=(HelpTip="Amount of random weapons given on player respawn")
	SettingsList(12)=(Type=ST_IntegerInput,MaxChars=3)
	SettingsList(12)=(BottomMargin=20.000000)
}