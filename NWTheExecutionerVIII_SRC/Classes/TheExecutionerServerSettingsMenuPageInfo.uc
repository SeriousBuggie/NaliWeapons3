//////////////////////////////////////////////////////////////
//				Feralidragon (25-09-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////
class TheExecutionerServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'TheExecutioner'.default.bEnableHeadShot);
	if (i == 1)
		return String(Class'TheExecutioner'.default.bFireMixedMoves);
	if (i == 2)
		return String(Class'TheExecutioner'.default.bChargingAltFire);
	if (i == 3)
		return String(Class'TheExecutioner'.default.bChargingKillMultiple);
	if (i == 4)
		return String(Class'TheExecutioner'.default.bChargeTriggerOnTouch);
	if (i == 5)
		return String(Class'TheExecutioner'.default.HeadShotDamage);
	if (i == 6)
		return String(Class'TheExecutioner'.default.ChargeAttackDamage);
	if (i == 7)
		return String(Class'TheExecutioner'.default.ChargeOwnDamage);
	if (i == 8)
		return String(Class'TheExecutioner'.default.ChargeOwnMaxMomentum);
	if (i == 9)
		return String(Class'TheExecutioner'.default.ChargeTotalTime);
	if (i == 10)
		return String(Class'TheExecutioner'.default.ChargeAttackMaxRange);
	if (i == 11)
		return String(Class'TheExecutioner'.default.ChargeOwnDamageMaxDist);
	if (i == 13)
		return String(Class'TheExecutioner'.default.enableOversurrection);
	if (i == 14)
		return String(Class'TheExecutioner'.default.OversurrectionLifeTime);
	if (i == 15)
		return String(Class'TheExecutioner'.default.OversurrectiveAttackDmgA);
	if (i == 16)
		return String(Class'TheExecutioner'.default.OversurrectiveAttackDmgB);
	if (i == 17)
		return String(Class'TheExecutioner'.default.OversurrectiveAttackDmgC);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'TheExecutioner'.default.bEnableHeadShot = Bool(val);
	else if (i == 1)
		Class'TheExecutioner'.default.bFireMixedMoves = Bool(val);
	else if (i == 2)
		Class'TheExecutioner'.default.bChargingAltFire = Bool(val);
	else if (i == 3)
		Class'TheExecutioner'.default.bChargingKillMultiple = Bool(val);
	else if (i == 4)
		Class'TheExecutioner'.default.bChargeTriggerOnTouch = Bool(val);
	else if (i == 5)
		Class'TheExecutioner'.default.HeadShotDamage = Int(val);
	else if (i == 6)
		Class'TheExecutioner'.default.ChargeAttackDamage = Int(val);
	else if (i == 7)
		Class'TheExecutioner'.default.ChargeOwnDamage = Int(val);
	else if (i == 8)
		Class'TheExecutioner'.default.ChargeOwnMaxMomentum = Int(val);
	else if (i == 9)
		Class'TheExecutioner'.default.ChargeTotalTime = Float(val);
	else if (i == 10)
		Class'TheExecutioner'.default.ChargeAttackMaxRange = Float(val);
	else if (i == 11)
		Class'TheExecutioner'.default.ChargeOwnDamageMaxDist = Float(val);
	else if (i == 13)
		Class'TheExecutioner'.default.enableOversurrection = Bool(val);
	else if (i == 14)
		Class'TheExecutioner'.default.OversurrectionLifeTime = Float(val);
	else if (i == 15)
		Class'TheExecutioner'.default.OversurrectiveAttackDmgA = Int(val);
	else if (i == 16)
		Class'TheExecutioner'.default.OversurrectiveAttackDmgB = Int(val);
	else if (i == 17)
		Class'TheExecutioner'.default.OversurrectiveAttackDmgC = Int(val);
	
	Class'TheExecutioner'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'TheExecutionerAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Enable headshots")
	SettingsList(0)=(HelpTip="Enable ability to cut the enemy's head off")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Primary mixed moves")
	SettingsList(1)=(HelpTip="Make primary mode use both fast single and double slow cuts randomly")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Secondary charged move")
	SettingsList(2)=(HelpTip="Make secondary mode use a charged form of attack")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Enable multiple charged kills")
	SettingsList(3)=(HelpTip="Enable ability to kill multiple players with a single charged attack")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Trigger charged attack on touch")
	SettingsList(4)=(HelpTip="Enable ability automatically release a charged attack by touching an enemy")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Headshot damage")
	SettingsList(5)=(HelpTip="Headshot damage amount")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(6)=(Description="Charged attack damage")
	SettingsList(6)=(HelpTip="Charged attack max damage amount")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(7)=(Description="Charged attack self damage")
	SettingsList(7)=(HelpTip="Charged attack self damage amount when using it against a solid surface (like a wall)")
	SettingsList(7)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(8)=(Description="Charged attack self kickback")
	SettingsList(8)=(HelpTip="Charged attack self kickback amount when using it against a solid surface (like a wall)")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(9)=(Description="Charging time")
	SettingsList(9)=(HelpTip="Time needed to fully charge to do max damage (in seconds)")
	SettingsList(9)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(10)=(Description="Charged attack max range")
	SettingsList(10)=(HelpTip="Charged attack max damaging distance")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(11)=(Description="Charged self damage min range")
	SettingsList(11)=(HelpTip="Min distance from a solid surface required for self damage")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=5)
	SettingsList(11)=(BottomMargin=20.000000)
	
	SettingsList(12)=(Description="Oversurrection:")
	SettingsList(12)=(HelpTip="Oversurrection settings")
	SettingsList(12)=(Type=ST_Label)
	
	SettingsList(13)=(Description="    Enable Oversurrection")
	SettingsList(13)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(13)=(Type=ST_Checkbox)
	
	SettingsList(14)=(Description="    Life time")
	SettingsList(14)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(15)=(Description="    Left attack damage")
	SettingsList(15)=(HelpTip="Oversurrection damage on left handed attack")
	SettingsList(15)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(16)=(Description="    Right attack damage")
	SettingsList(16)=(HelpTip="Oversurrection damage on right handed attack")
	SettingsList(16)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(17)=(Description="    Dual attack damage")
	SettingsList(17)=(HelpTip="Oversurrection damage on dual handed attack")
	SettingsList(17)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(17)=(BottomMargin=20.000000)
}
