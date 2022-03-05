//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////
class FlameTrackerServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'FlameTracker'.default.bAffectedByTemperature);
	if (i == 1)
		return String(Class'FlameTracker'.default.bBurnInstigator);
	if (i == 2)
		return String(Class'FlameTracker'.default.BurnStaticObjects);
	if (i == 3)
		return String(Class'FlameTracker'.default.FlamesDamageRate);
	if (i == 4)
		return String(Class'FlameTracker'.default.FlamesOutSpeed);
	if (i == 5)
		return String(Class'FlameTracker'.default.LavaAmmoConsumption);
	if (i == 6)
		return String(Class'FlameTracker'.default.LavaBlobsAmount);
	if (i == 7)
		return String(Class'FlameTracker'.default.BodyFlamesDamage);
	if (i == 9)
		return String(Class'FlameTracker'.default.enableOversurrection);
	if (i == 10)
		return String(Class'FlameTracker'.default.OversurrectionLifeTime);
	if (i == 11)
		return String(Class'FlameTracker'.default.OversurrectiveBlobsRate);
	if (i == 12)
		return String(Class'FlameTracker'.default.OversurrectiveBlobsPerUpdate);
	if (i == 13)
		return String(Class'FlameTracker'.default.OversurrectiveBlobsDamage);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'FlameTracker'.default.bAffectedByTemperature = Bool(val);
	else if (i == 1)
		Class'FlameTracker'.default.bBurnInstigator = Bool(val);
	else if (i == 2)
		Class'FlameTracker'.default.BurnStaticObjects = Bool(val);
	else if (i == 3)
		Class'FlameTracker'.default.FlamesDamageRate = Float(val);
	else if (i == 4)
		Class'FlameTracker'.default.FlamesOutSpeed = Float(val);
	else if (i >= 5 && i <= 7)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		
		if (i == 5)
			Class'FlameTracker'.default.LavaAmmoConsumption = Byte(val);
		else if (i == 6)
			Class'FlameTracker'.default.LavaBlobsAmount = Byte(val);
		else if (i == 7)
			Class'FlameTracker'.default.BodyFlamesDamage = Byte(val);
	}
	else if (i == 9)
		Class'FlameTracker'.default.enableOversurrection = Bool(val);
	else if (i == 10)
		Class'FlameTracker'.default.OversurrectionLifeTime = Float(val);
	else if (i == 11)
		Class'FlameTracker'.default.OversurrectiveBlobsRate = Float(val);
	else if (i == 12)
		Class'FlameTracker'.default.OversurrectiveBlobsPerUpdate = Int(val);
	else if (i == 13)
		Class'FlameTracker'.default.OversurrectiveBlobsDamage = Int(val);
	
	Class'FlameTracker'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'FlameTrackerAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Enable overheating")
	SettingsList(0)=(HelpTip="Enable the need to cool down when using the primary fire for too long.%n%Takes around 3.25 seconds to cool down from the max allowed temperature.")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Enable owner self burns")
	SettingsList(1)=(HelpTip="Enable the possibility of the owner of the weapon to get burnt while using flames")
	SettingsList(1)=(Type=ST_Checkbox)

	SettingsList(2)=(Description="Burn static objects")
	SettingsList(2)=(HelpTip="Enable the ability to burn static objects such as decoration, trees, etc")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Flames damage rate")
	SettingsList(3)=(HelpTip="Flames damage frequency (burn damage hits per second)")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(4)=(Description="Flames speed")
	SettingsList(4)=(HelpTip="Flames output speed from the weapon (faster flames will make them go farther)")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(5)=(Description="Lava ammo consumption")
	SettingsList(5)=(HelpTip="Ammo needed to use secondary mode (lava)")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(6)=(Description="Lava blobs amount")
	SettingsList(6)=(HelpTip="Amount of blobs generated once the main lava blob hits a solid surface%n%(like a floor, wall or ceiling)")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(7)=(Description="Body flames damage")
	SettingsList(7)=(HelpTip="Damage instigated by the flames in the players body over the time")
	SettingsList(7)=(Type=ST_IntegerInput,MaxChars=3)
	SettingsList(7)=(BottomMargin=20.000000)
	
	SettingsList(8)=(Description="Oversurrection:")
	SettingsList(8)=(HelpTip="Oversurrection settings")
	SettingsList(8)=(Type=ST_Label)
	
	SettingsList(9)=(Description="    Enable Oversurrection")
	SettingsList(9)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(9)=(Type=ST_Checkbox)
	
	SettingsList(10)=(Description="    Life time")
	SettingsList(10)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(11)=(Description="    Lava burst rate")
	SettingsList(11)=(HelpTip="Oversurrection lava burst rate (in times per second)")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(12)=(Description="    Lava blobs per cycle")
	SettingsList(12)=(HelpTip="Oversurrection lava blobs amount per cycle")
	SettingsList(12)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(13)=(Description="    Lava damage")
	SettingsList(13)=(HelpTip="Oversurrection lava explosion damage")
	SettingsList(13)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(13)=(BottomMargin=20.000000)
}
