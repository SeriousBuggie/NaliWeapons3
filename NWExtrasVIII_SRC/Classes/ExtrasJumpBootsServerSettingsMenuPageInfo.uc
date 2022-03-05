//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class ExtrasJumpBootsServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NWJumpBoots'.default.Jumps);
	if (i == 1)
		return String(Class'NWJumpBoots'.default.MaxJumps);
	if (i == 2)
		return String(Class'NWJumpBoots'.default.JumpMultiplier);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'NWJumpBoots'.default.Jumps = Int(val);
	else if (i == 1)
		Class'NWJumpBoots'.default.MaxJumps = Int(val);
	else if (i == 2)
		Class'NWJumpBoots'.default.JumpMultiplier = Float(val);
	
	Class'NWJumpBoots'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'ExtrasJumpBootsAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Jumps")
	SettingsList(0)=(HelpTip="Amount of possible jumps")
	SettingsList(0)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(1)=(Description="Max jumps")
	SettingsList(1)=(HelpTip="Max accumulated amount of possible jumps")
	SettingsList(1)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(2)=(Description="Jump multiplier")
	SettingsList(2)=(HelpTip="Jump height multiplier")
	SettingsList(2)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(2)=(BottomMargin=20.000000)
}
