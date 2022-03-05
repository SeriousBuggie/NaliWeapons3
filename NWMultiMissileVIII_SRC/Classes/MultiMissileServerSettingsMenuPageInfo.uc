//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////
class MultiMissileServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'MultiMissile'.default.canPlayerHoldLock);
	if (i == 1)
		return String(Class'MultiMissile'.default.bUseAmmoT);
	if (i == 2)
		return String(Class'MultiMissile'.default.bUseAmmoX);
	if (i == 3)
		return String(Class'MultiMissile'.default.XMissileBaseDamage);
	if (i == 4)
		return String(Class'MultiMissile'.default.LockingRate);
	if (i == 5)
		return String(Class'MultiMissile'.default.LockingStayTime);
	if (i == 6)
		return String(Class'MultiMissile'.default.enableA);
	if (i == 7)
		return String(Class'MultiMissile'.default.enableH);
	if (i == 8)
		return String(Class'MultiMissile'.default.enableT);
	if (i == 9)
		return String(Class'MultiMissile'.default.enableX);
	if (i == 11)
		return String(Class'MultiMissile'.default.enableOversurrection);
	if (i == 12)
		return String(Class'MultiMissile'.default.OversurrectionLifeTime);
	if (i == 13)
		return String(Class'MultiMissile'.default.OversurrectionTurretRotRate);
	if (i == 14)
		return String(Class'MultiMissile'.default.OversurrectionFireCycleRate);
	if (i == 15)
		return String(Class'MultiMissile'.default.OversurrectionReloadPauseTime);
	if (i == 16)
		return String(Class'MultiMissile'.default.OversurrectionReloadTime);
	if (i == 17)
		return String(Class'MultiMissile'.default.OversurrectionScanEnemiesRadius);
	if (i == 18)
		return String(Class'MultiMissile'.default.OversurrectionRangedEnemiesPeriph);
	if (i == 19)
		return String(Class'MultiMissile'.default.OversurrectionAttackMinPeriph);
	if (i == 20)
		return String(Class'MultiMissile'.default.OversurrectionHexaAtkOdds);
	if (i == 21)
		return String(Class'MultiMissile'.default.OversurrectionQuadAtkOdds);
	if (i == 22)
		return String(Class'MultiMissile'.default.OversurrectionDualAtkOdds);
	if (i == 23)
		return String(Class'MultiMissile'.default.OversurrectionMissileDamage);
	if (i == 24)
		return String(Class'MultiMissile'.default.OversurrectionMissileDamageRadius);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'MultiMissile'.default.canPlayerHoldLock = Bool(val);
	else if (i == 1)
		Class'MultiMissile'.default.bUseAmmoT = Bool(val);
	else if (i == 2)
		Class'MultiMissile'.default.bUseAmmoX = Bool(val);
	else if (i == 3)
		Class'MultiMissile'.default.XMissileBaseDamage = Int(val);
	else if (i == 4)
		Class'MultiMissile'.default.LockingRate = Float(val);
	else if (i == 5)
		Class'MultiMissile'.default.LockingStayTime = Float(val);
	else if (i == 6)
		Class'MultiMissile'.default.enableA = Bool(val);
	else if (i == 7)
		Class'MultiMissile'.default.enableH = Bool(val);
	else if (i == 8)
		Class'MultiMissile'.default.enableT = Bool(val);
	else if (i == 9)
		Class'MultiMissile'.default.enableX = Bool(val);
	else if (i == 11)
		Class'MultiMissile'.default.enableOversurrection = Bool(val);
	else if (i == 12)
		Class'MultiMissile'.default.OversurrectionLifeTime = Float(val);
	else if (i == 13)
		Class'MultiMissile'.default.OversurrectionTurretRotRate = Float(val);
	else if (i == 14)
		Class'MultiMissile'.default.OversurrectionFireCycleRate = Float(val);
	else if (i == 15)
		Class'MultiMissile'.default.OversurrectionReloadPauseTime = Float(val);
	else if (i == 16)
		Class'MultiMissile'.default.OversurrectionReloadTime = Float(val);
	else if (i == 17)
		Class'MultiMissile'.default.OversurrectionScanEnemiesRadius = Float(val);
	else if (i == 18)
		Class'MultiMissile'.default.OversurrectionRangedEnemiesPeriph = Float(val);
	else if (i == 19)
		Class'MultiMissile'.default.OversurrectionAttackMinPeriph = Float(val);
	else if (i == 20)
		Class'MultiMissile'.default.OversurrectionHexaAtkOdds = Float(val);
	else if (i == 21)
		Class'MultiMissile'.default.OversurrectionQuadAtkOdds = Float(val);
	else if (i == 22)
		Class'MultiMissile'.default.OversurrectionDualAtkOdds = Float(val);
	else if (i == 23)
		Class'MultiMissile'.default.OversurrectionMissileDamage = Int(val);
	else if (i == 24)
		Class'MultiMissile'.default.OversurrectionMissileDamageRadius = Float(val);
	
	Class'MultiMissile'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'MultiMissileAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Enable hold lock")
	SettingsList(0)=(HelpTip="Enable the ability for the player to hold lock over a player by pressing alt fire key")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Force T-Missile ammo usage")
	SettingsList(1)=(HelpTip="Force T-Missiles to always need ammo even with Infinity on")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Force X-Missile ammo usage")
	SettingsList(2)=(HelpTip="Force X-Missiles to always need ammo even with Infinity on")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="X-Missile base damage")
	SettingsList(3)=(HelpTip="Max amount of damage given by an X-Missile explosion")
	SettingsList(3)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(4)=(Description="Locking rate")
	SettingsList(4)=(HelpTip="Locking on speed")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(5)=(Description="Locking stay time")
	SettingsList(5)=(HelpTip="Max allowed time (in seconds) to stay locked onto a target without pointing at it")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(5)=(BottomMargin=20.000000)
	
	SettingsList(6)=(Description="A-Missile")
	SettingsList(6)=(HelpTip="Enable A-Missiles")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="H-Missile")
	SettingsList(7)=(HelpTip="Enable H-Missiles")
	SettingsList(7)=(Type=ST_Checkbox)
	
	SettingsList(8)=(Description="T-Missile")
	SettingsList(8)=(HelpTip="Enable T-Missiles")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="X-Missile")
	SettingsList(9)=(HelpTip="Enable X-Missiles")
	SettingsList(9)=(Type=ST_Checkbox)
	SettingsList(9)=(BottomMargin=20.000000)
	
	SettingsList(10)=(Description="Oversurrection:")
	SettingsList(10)=(HelpTip="Oversurrection settings")
	SettingsList(10)=(Type=ST_Label)
	
	SettingsList(11)=(Description="    Enable Oversurrection")
	SettingsList(11)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(11)=(Type=ST_Checkbox)
	
	SettingsList(12)=(Description="    Life time")
	SettingsList(12)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(13)=(Description="    Turret rotation rate")
	SettingsList(13)=(HelpTip="Oversurrection turret rotation rate (in rotation units per second)")
	SettingsList(13)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(14)=(Description="    Fire cycle rate")
	SettingsList(14)=(HelpTip="Oversurrection batch firing rate (in times per second)")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(15)=(Description="    Reload pause time")
	SettingsList(15)=(HelpTip="Oversurrection missile slot reload wait total time (in seconds)")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(16)=(Description="    Reload time")
	SettingsList(16)=(HelpTip="Oversurrection missile slot reload time (in seconds)")
	SettingsList(16)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(17)=(Description="    Enemies scan radius")
	SettingsList(17)=(HelpTip="Oversurrection scan for enemies max radius")
	SettingsList(17)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(18)=(Description="    Enemies detecting peripheral range")
	SettingsList(18)=(HelpTip="Oversurrection min peripheral range to detect enemies (from 0.0 to 1.0)")
	SettingsList(18)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(19)=(Description="    Enemies attack peripheral range")
	SettingsList(19)=(HelpTip="Oversurrection min peripheral range to attack enemies (from 0.0 to 1.0)")
	SettingsList(19)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(20)=(Description="    Hex attack odds")
	SettingsList(20)=(HelpTip="Oversurrection odds to use an hex sized attack (from 0.0 to 1.0)")
	SettingsList(20)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(21)=(Description="    Quad attack odds")
	SettingsList(21)=(HelpTip="Oversurrection odds to use a quad sized attack (from 0.0 to 1.0)")
	SettingsList(21)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(22)=(Description="    Dual attack odds")
	SettingsList(22)=(HelpTip="Oversurrection odds to use an dual sized attack (from 0.0 to 1.0)")
	SettingsList(22)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(23)=(Description="    Missile damage")
	SettingsList(23)=(HelpTip="Oversurrection missiles damage amount")
	SettingsList(23)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(24)=(Description="    Missile damage radius")
	SettingsList(24)=(HelpTip="Oversurrection missiles damage max radius")
	SettingsList(24)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(25)=(BottomMargin=20.000000)
}
