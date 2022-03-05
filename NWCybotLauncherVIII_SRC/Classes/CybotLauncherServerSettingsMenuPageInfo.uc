//////////////////////////////////////////////////////////////
//				Feralidragon (12-09-2012)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////
class CybotLauncherServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'CybotLauncher'.default.bFriendlyFire);
	if (i == 1)
		return String(Class'CybotLauncher'.default.bCanBeTelefragged);
	if (i == 2)
		return String(Class'CybotLauncher'.default.bCanBeTelefraggedByOwner);
	if (i == 3)
		return String(Class'CybotLauncher'.default.bCanBeTelefraggedByTeam);
	if (i == 4)
		return String(Class'CybotLauncher'.default.bGuardianReturnToOrigin);
	if (i == 5)
		return String(Class'CybotLauncher'.default.bFieldKillPawns);
	if (i == 6)
		return String(Class'CybotLauncher'.default.FieldHealth);
	if (i == 7)
		return String(Class'CybotLauncher'.default.FieldDamage);
	if (i == 8)
		return String(Class'CybotLauncher'.default.VortexHealth);
	if (i == 9)
		return String(Class'CybotLauncher'.default.KamiBaseDamage);
	if (i == 10)
		return String(Class'CybotLauncher'.default.VortexBaseDamage);
	if (i == 11)
		return String(Class'CybotLauncher'.default.ElectricalDamageScale);
	if (i == 12)
		return String(Class'CybotLauncher'.default.CybotProjDmgMultiplier);
	if (i == 13)
		return String(Class'CybotLauncher'.default.CybotProjSpeedMultiplier);
	if (i == 14)
		return String(Class'CybotLauncher'.default.CybotHealthMultiplier);
	if (i == 15)
		return String(Class'CybotLauncher'.default.enableCybotDeathAknMessages);
	if (i == 16)
		return String(Class'CybotLauncher'.default.enableCybotBeacons);
	if (i == 17)
		return String(Class'CybotLauncher'.default.bAlwaysSeeCybotBeacons);
	if (i == 18)
		return String(Class'CybotLauncher'.default.ReduceCybotBeaconsOnDistance);
	if (i == 19)
		return String(Class'CybotLauncher'.default.enableCybotBeaconsText);
	if (i == 20)
		return String(Class'CybotLauncher'.default.CybotBeaconsMaxDistance);
	if (i == 21)
		return String(Class'CybotLauncher'.default.CybotBeaconsTextDist);
	if (i == 22)
		return String(Class'CybotLauncher'.default.enableCybot01);
	if (i == 23)
		return String(Class'CybotLauncher'.default.enableCybot02);
	if (i == 24)
		return String(Class'CybotLauncher'.default.enableCybot03);
	if (i == 25)
		return String(Class'CybotLauncher'.default.enableCybot04);
	if (i == 26)
		return String(Class'CybotLauncher'.default.enableCybot05);
	if (i == 27)
		return String(Class'CybotLauncher'.default.enableCybot06);
	if (i == 28)
		return String(Class'CybotLauncher'.default.enableCybot07);
	if (i == 29)
		return String(Class'CybotLauncher'.default.enableCybot08);
	if (i == 30)
		return String(Class'CybotLauncher'.default.enableCybot09);
	if (i == 31)
		return String(Class'CybotLauncher'.default.enableCybot10);
	if (i == 32)
		return String(Class'CybotLauncher'.default.MaxCybotsPerPlayer);
	if (i == 33)
		return String(Class'CybotLauncher'.default.CybotSentinelHealth);
	if (i == 34)
		return String(Class'CybotLauncher'.default.CybotDualSentinelHealth);
	if (i == 35)
		return String(Class'CybotLauncher'.default.CybotAndroidHealth);
	if (i == 36)
		return String(Class'CybotLauncher'.default.CybotHeliHealth);
	if (i == 37)
		return String(Class'CybotLauncher'.default.CybotDroneHealth);
	if (i == 38)
		return String(Class'CybotLauncher'.default.CybotsMaxLifeSpan);
	if (i == 39)
		return String(Class'CybotLauncher'.default.FieldMaxLifeSpan);
	if (i == 40)
		return String(Class'CybotLauncher'.default.VortexMaxLifeSpan);
	if (i == 42)
		return String(Class'CybotLauncher'.default.enableOversurrection);
	if (i == 43)
		return String(Class'CybotLauncher'.default.OversurrectionLifeTime);
	if (i == 44)
		return String(Class'CybotLauncher'.default.OversurrectionHealth);
	if (i == 45)
		return String(Class'CybotLauncher'.default.OversurrectionChildrenHealth);
	if (i == 46)
		return String(Class'CybotLauncher'.default.OversurrectionChildrenInnerMaxRadius);
	if (i == 47)
		return String(Class'CybotLauncher'.default.OversurrectionChildrenOuterMaxRadius);
	if (i == 48)
		return String(Class'CybotLauncher'.default.OversurrectionChildrenMax);
	if (i == 49)
		return String(Class'CybotLauncher'.default.OversurrectionChildrenDefenseMin);
	if (i == 50)
		return String(Class'CybotLauncher'.default.OversurrectionChildrenMoveTimeInterval);
	if (i == 51)
		return String(Class'CybotLauncher'.default.OversurrectionChildrenAutoAttackOdds);
	if (i == 52)
		return String(Class'CybotLauncher'.default.OversurrectionZapAttackOdds);
	if (i == 53)
		return String(Class'CybotLauncher'.default.OversurrectionZapAttackCooldown);
	if (i == 54)
		return String(Class'CybotLauncher'.default.OversurrectionZapAttackDmg);
	if (i == 55)
		return String(Class'CybotLauncher'.default.OversurrectionProjAttackOdds);
	if (i == 56)
		return String(Class'CybotLauncher'.default.OversurrectionProjAttackCooldown);
	if (i == 57)
		return String(Class'CybotLauncher'.default.OversurrectionProjAttackDmg);
	if (i == 58)
		return String(Class'CybotLauncher'.default.OversurrectionHomingAttackOdds);
	if (i == 59)
		return String(Class'CybotLauncher'.default.OversurrectionHomingAttackCooldown);
	if (i == 60)
		return String(Class'CybotLauncher'.default.OversurrectionHomingAttackDmg);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'CybotLauncher'.default.bFriendlyFire = Bool(val);
	else if (i == 1)
		Class'CybotLauncher'.default.bCanBeTelefragged = Bool(val);
	else if (i == 2)
		Class'CybotLauncher'.default.bCanBeTelefraggedByOwner = Bool(val);
	else if (i == 3)
		Class'CybotLauncher'.default.bCanBeTelefraggedByTeam = Bool(val);
	else if (i == 4)
		Class'CybotLauncher'.default.bGuardianReturnToOrigin = Bool(val);
	else if (i == 5)
		Class'CybotLauncher'.default.bFieldKillPawns = Bool(val);
	else if (i == 6)
		Class'CybotLauncher'.default.FieldHealth = Int(val);
	else if (i == 7)
		Class'CybotLauncher'.default.FieldDamage = Int(val);
	else if (i == 8)
		Class'CybotLauncher'.default.VortexHealth = Int(val);
	else if (i == 9)
		Class'CybotLauncher'.default.KamiBaseDamage = Int(val);
	else if (i == 10)
		Class'CybotLauncher'.default.VortexBaseDamage = Int(val);
	else if (i == 11)
		Class'CybotLauncher'.default.ElectricalDamageScale = Float(val);
	else if (i == 12)
		Class'CybotLauncher'.default.CybotProjDmgMultiplier = Float(val);
	else if (i == 13)
		Class'CybotLauncher'.default.CybotProjSpeedMultiplier = Float(val);
	else if (i == 14)
		Class'CybotLauncher'.default.CybotHealthMultiplier = Float(val);
	else if (i == 15)
		Class'CybotLauncher'.default.enableCybotDeathAknMessages = Bool(val);
	else if (i == 16)
		Class'CybotLauncher'.default.enableCybotBeacons = Bool(val);
	else if (i == 17)
		Class'CybotLauncher'.default.bAlwaysSeeCybotBeacons = Bool(val);
	else if (i == 18)
		Class'CybotLauncher'.default.ReduceCybotBeaconsOnDistance = Bool(val);
	else if (i == 19)
		Class'CybotLauncher'.default.enableCybotBeaconsText = Bool(val);
	else if (i == 20)
		Class'CybotLauncher'.default.CybotBeaconsMaxDistance = Float(val);
	else if (i == 21)
		Class'CybotLauncher'.default.CybotBeaconsTextDist = Float(val);
	else if (i == 22)
		Class'CybotLauncher'.default.enableCybot01 = Bool(val);
	else if (i == 23)
		Class'CybotLauncher'.default.enableCybot02 = Bool(val);
	else if (i == 24)
		Class'CybotLauncher'.default.enableCybot03 = Bool(val);
	else if (i == 25)
		Class'CybotLauncher'.default.enableCybot04 = Bool(val);
	else if (i == 26)
		Class'CybotLauncher'.default.enableCybot05 = Bool(val);
	else if (i == 27)
		Class'CybotLauncher'.default.enableCybot06 = Bool(val);
	else if (i == 28)
		Class'CybotLauncher'.default.enableCybot07 = Bool(val);
	else if (i == 29)
		Class'CybotLauncher'.default.enableCybot08 = Bool(val);
	else if (i == 30)
		Class'CybotLauncher'.default.enableCybot09 = Bool(val);
	else if (i == 31)
		Class'CybotLauncher'.default.enableCybot10 = Bool(val);
	else if (i == 32)
		Class'CybotLauncher'.default.MaxCybotsPerPlayer = Int(val);
	else if (i == 33)
		Class'CybotLauncher'.default.CybotSentinelHealth = Int(val);
	else if (i == 34)
		Class'CybotLauncher'.default.CybotDualSentinelHealth = Int(val);
	else if (i == 35)
		Class'CybotLauncher'.default.CybotAndroidHealth = Int(val);
	else if (i == 36)
		Class'CybotLauncher'.default.CybotHeliHealth = Int(val);
	else if (i == 37)
		Class'CybotLauncher'.default.CybotDroneHealth = Int(val);
	else if (i == 38)
		Class'CybotLauncher'.default.CybotsMaxLifeSpan = Float(val);
	else if (i == 39)
		Class'CybotLauncher'.default.FieldMaxLifeSpan = Float(val);
	else if (i == 40)
		Class'CybotLauncher'.default.VortexMaxLifeSpan = Float(val);
	else if (i == 42)
		Class'CybotLauncher'.default.enableOversurrection = Bool(val);
	else if (i == 43)
		Class'CybotLauncher'.default.OversurrectionLifeTime = Float(val);
	else if (i == 44)
		Class'CybotLauncher'.default.OversurrectionHealth = Int(val);
	else if (i == 45)
		Class'CybotLauncher'.default.OversurrectionChildrenHealth = Int(val);
	else if (i == 46)
		Class'CybotLauncher'.default.OversurrectionChildrenInnerMaxRadius = Float(val);
	else if (i == 47)
		Class'CybotLauncher'.default.OversurrectionChildrenOuterMaxRadius = Float(val);
	else if (i == 48)
		Class'CybotLauncher'.default.OversurrectionChildrenMax = Int(val);
	else if (i == 49)
		Class'CybotLauncher'.default.OversurrectionChildrenDefenseMin = Int(val);
	else if (i == 50)
		Class'CybotLauncher'.default.OversurrectionChildrenMoveTimeInterval = Float(val);
	else if (i == 51)
		Class'CybotLauncher'.default.OversurrectionChildrenAutoAttackOdds = Float(val);
	else if (i == 52)
		Class'CybotLauncher'.default.OversurrectionZapAttackOdds = Float(val);
	else if (i == 53)
		Class'CybotLauncher'.default.OversurrectionZapAttackCooldown = Float(val);
	else if (i == 54)
		Class'CybotLauncher'.default.OversurrectionZapAttackDmg = Int(val);
	else if (i == 55)
		Class'CybotLauncher'.default.OversurrectionProjAttackOdds = Float(val);
	else if (i == 56)
		Class'CybotLauncher'.default.OversurrectionProjAttackCooldown = Float(val);
	else if (i == 57)
		Class'CybotLauncher'.default.OversurrectionProjAttackDmg = Int(val);
	else if (i == 58)
		Class'CybotLauncher'.default.OversurrectionHomingAttackOdds = Float(val);
	else if (i == 59)
		Class'CybotLauncher'.default.OversurrectionHomingAttackCooldown = Float(val);
	else if (i == 60)
		Class'CybotLauncher'.default.OversurrectionHomingAttackDmg = Int(val);
	
	Class'CybotLauncher'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'CybotLauncherAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Cybots friendly fire")
	SettingsList(0)=(HelpTip="Enable cybots friendly fire relative both cybot teammates and owners")
	SettingsList(0)=(Type=ST_Checkbox)

	SettingsList(1)=(Description="Cybots telefrag")
	SettingsList(1)=(HelpTip="Cybots can be telefragged")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Cybots telefrag by owner")
	SettingsList(2)=(HelpTip="Cybots can be telefragged by their owner toggle")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Cybots telefrag by teammates")
	SettingsList(3)=(HelpTip="Cybots can be telefragged by their teammates")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Cybot guardians return to origin")
	SettingsList(4)=(HelpTip="Cybot guardians try to get back to their original position")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Enable cybot F-Field kill zone")
	SettingsList(5)=(HelpTip="Enable cybot F-Field ability to kill enemies when they enter the field")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Cybot F-Field health")
	SettingsList(6)=(HelpTip="Cybot F-Field max health amount")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(7)=(Description="Cybot F-Field damage")
	SettingsList(7)=(HelpTip="Cybot F-Field damage amount if kill zone is enabled")
	SettingsList(7)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(8)=(Description="Cybot Vortex health")
	SettingsList(8)=(HelpTip="Cybot Vortex health amount")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(9)=(Description="Cybot Kamikaze damage")
	SettingsList(9)=(HelpTip="Cybot Kamikaze damage amount")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(10)=(Description="Cybot Vortex damage")
	SettingsList(10)=(HelpTip="Cybot Vortex damage amount")
	SettingsList(10)=(Type=ST_IntegerInput,MaxChars=7)
	SettingsList(10)=(BottomMargin=20.000000)
	
	SettingsList(11)=(Description="Electric damage scale")
	SettingsList(11)=(HelpTip="Cybots electric damaging scale")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(12)=(Description="Projectiles damage scale")
	SettingsList(12)=(HelpTip="Cybots projectiles damaging scale")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(13)=(Description="Projectiles speed scale")
	SettingsList(13)=(HelpTip="Cybots projectile speed scale")
	SettingsList(13)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(14)=(Description="Health scale")
	SettingsList(14)=(HelpTip="Cybots health scale")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(14)=(BottomMargin=20.000000)
	
	SettingsList(15)=(Description="Enable cybot death messages")
	SettingsList(15)=(HelpTip="Enable owned cybot death notifications")
	SettingsList(15)=(Type=ST_Checkbox)
	
	SettingsList(16)=(Description="Enable cybot HUD beacons")
	SettingsList(16)=(HelpTip="Enable owned cybot HUD beacons rendering")
	SettingsList(16)=(Type=ST_Checkbox)
	
	SettingsList(17)=(Description="Always see cybot HUD beacons")
	SettingsList(17)=(HelpTip="Show cybot HUD beacons even when the cybot is not visible")
	SettingsList(17)=(Type=ST_Checkbox)
	
	SettingsList(18)=(Description="Reduce cybot HUD beacons on distance")
	SettingsList(18)=(HelpTip="Reduce cybot HUD beacons rendering scale on distance")
	SettingsList(18)=(Type=ST_Checkbox)
	
	SettingsList(19)=(Description="Enable cybot HUD beacons text")
	SettingsList(19)=(HelpTip="Enable cybot HUD beacons text rendering providing details such as:%n%     - Health%n%     - Cybot name")
	SettingsList(19)=(Type=ST_Checkbox)
	
	SettingsList(20)=(Description="Cybot HUD beacons max distance")
	SettingsList(20)=(HelpTip="Cybot HUD beacons rendering max distance")
	SettingsList(20)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(21)=(Description="Cybot HUD beacons text max distance")
	SettingsList(21)=(HelpTip="Cybot HUD beacons text rendering max distance")
	SettingsList(21)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(21)=(BottomMargin=20.000000)
	
	SettingsList(22)=(Description="Dual Sentinel")
	SettingsList(22)=(HelpTip="Enable cybot Dual Sentinel")
	SettingsList(22)=(Type=ST_Checkbox)
	
	SettingsList(23)=(Description="Android Follower")
	SettingsList(23)=(HelpTip="Enable cybot Android Follower")
	SettingsList(23)=(Type=ST_Checkbox)
	
	SettingsList(24)=(Description="Android Guardian")
	SettingsList(24)=(HelpTip="Enable cybot Android Guardian")
	SettingsList(24)=(Type=ST_Checkbox)
	
	SettingsList(25)=(Description="Heli Follower")
	SettingsList(25)=(HelpTip="Enable cybot Heli Follower")
	SettingsList(25)=(Type=ST_Checkbox)
	
	SettingsList(26)=(Description="Heli Guardian")
	SettingsList(26)=(HelpTip="Enable cybot Heli Guardian")
	SettingsList(26)=(Type=ST_Checkbox)
	
	SettingsList(27)=(Description="Drone Follower")
	SettingsList(27)=(HelpTip="Enable cybot Drone Follower")
	SettingsList(27)=(Type=ST_Checkbox)
	
	SettingsList(28)=(Description="Drone Guardian")
	SettingsList(28)=(HelpTip="Enable cybot Drone Guardian")
	SettingsList(28)=(Type=ST_Checkbox)
	
	SettingsList(29)=(Description="Kamikaze")
	SettingsList(29)=(HelpTip="Enable cybot Kamikaze")
	SettingsList(29)=(Type=ST_Checkbox)
	
	SettingsList(30)=(Description="F-Field")
	SettingsList(30)=(HelpTip="Enable cybot F-Field")
	SettingsList(30)=(Type=ST_Checkbox)
	
	SettingsList(31)=(Description="Vortex")
	SettingsList(31)=(HelpTip="Enable cybot Vortex")
	SettingsList(31)=(Type=ST_Checkbox)
	SettingsList(31)=(BottomMargin=20.000000)
	
	SettingsList(32)=(Description="Cybots per player")
	SettingsList(32)=(HelpTip="Max amount of cybots per player")
	SettingsList(32)=(Type=ST_IntegerInput,MaxChars=4)
	
	SettingsList(33)=(Description="Cybot Sentinel health")
	SettingsList(33)=(HelpTip="Cybot Sentinel health amount")
	SettingsList(33)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(34)=(Description="Cybot Dual Sentinel health")
	SettingsList(34)=(HelpTip="Cybot Dual Sentinel health amount")
	SettingsList(34)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(35)=(Description="Cybot Android health")
	SettingsList(35)=(HelpTip="Cybot Android health amount")
	SettingsList(35)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(36)=(Description="Cybot Heli health")
	SettingsList(36)=(HelpTip="Cybot Heli health amount")
	SettingsList(36)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(37)=(Description="Cybot Drone health")
	SettingsList(37)=(HelpTip="Cybot Drone health amount")
	SettingsList(37)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(38)=(Description="Cybots life time")
	SettingsList(38)=(HelpTip="Cybots global life time (in seconds), except for the F-Filed and Vortex cybots")
	SettingsList(38)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(39)=(Description="Cybot F-Field life time")
	SettingsList(39)=(HelpTip="Cybot F-Field life time (in seconds)")
	SettingsList(39)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(40)=(Description="Cybot Vortex life time")
	SettingsList(40)=(HelpTip="Cybot Vortex life time (in seconds)")
	SettingsList(40)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(40)=(BottomMargin=20.000000)
	
	SettingsList(41)=(Description="Oversurrection:")
	SettingsList(41)=(HelpTip="Oversurrection settings")
	SettingsList(41)=(Type=ST_Label)
	
	SettingsList(42)=(Description="    Enable Oversurrection")
	SettingsList(42)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(42)=(Type=ST_Checkbox)
	
	SettingsList(43)=(Description="    Life time")
	SettingsList(43)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(43)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(44)=(Description="    Master cybot health")
	SettingsList(44)=(HelpTip="Oversurrection master cybot health")
	SettingsList(44)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(45)=(Description="    Child cybots health")
	SettingsList(45)=(HelpTip="Oversurrection child cybots health")
	SettingsList(45)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(46)=(Description="    Child cybots min radius")
	SettingsList(46)=(HelpTip="Oversurrection child cybots min radius from the master")
	SettingsList(46)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(47)=(Description="    Child cybots max radius")
	SettingsList(47)=(HelpTip="Oversurrection child cybots max radius from the master")
	SettingsList(47)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(48)=(Description="    Child cybots max amount")
	SettingsList(48)=(HelpTip="Oversurrection max amount of child cybots from the master")
	SettingsList(48)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(49)=(Description="    Child cybots min defense amount")
	SettingsList(49)=(HelpTip="Oversurrection min amount of child cybots to always be available to protect the master")
	SettingsList(49)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(50)=(Description="    Child cybots move time interval")
	SettingsList(50)=(HelpTip="Oversurrection child cybots time interval between movements (in seconds)")
	SettingsList(50)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(50)=(BottomMargin=10.000000)
	
	SettingsList(51)=(Description="    Child cybots auto attack odds")
	SettingsList(51)=(HelpTip="Oversurrection child cybots odds to automatically attack on sight (from 0.0 to 1.0)")
	SettingsList(51)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(52)=(Description="    Zap attack odds")
	SettingsList(52)=(HelpTip="Oversurrection child cybots odds to attack with a zap laser (from 0.0 to 1.0)")
	SettingsList(52)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(53)=(Description="    Zap attack cooldown")
	SettingsList(53)=(HelpTip="Oversurrection child cybots zap laser cooldown until the next attack (in seconds)")
	SettingsList(53)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(54)=(Description="    Zap attack damage")
	SettingsList(54)=(HelpTip="Oversurrection child cybots zap attack damage amount")
	SettingsList(54)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(55)=(Description="    Projectile attack odds")
	SettingsList(55)=(HelpTip="Oversurrection child cybots odds to attack with a projectile (from 0.0 to 1.0)")
	SettingsList(55)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(56)=(Description="    Projectile attack cooldown")
	SettingsList(56)=(HelpTip="Oversurrection child cybots projectile cooldown until the next attack (in seconds)")
	SettingsList(56)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(57)=(Description="    Projectile damage")
	SettingsList(57)=(HelpTip="Oversurrection child cybots projectile damage amount")
	SettingsList(57)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(58)=(Description="    Homing projectile attack odds")
	SettingsList(58)=(HelpTip="Oversurrection child cybots odds to attack with a homing projectile (from 0.0 to 1.0)")
	SettingsList(58)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(59)=(Description="    Homing projectile attack cooldown")
	SettingsList(59)=(HelpTip="Oversurrection child cybots homing projectile cooldown until the next attack (in seconds)")
	SettingsList(59)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(60)=(Description="    Homing projectile damage")
	SettingsList(60)=(HelpTip="Oversurrection child cybots homing projectile damage amount")
	SettingsList(60)=(Type=ST_IntegerInput,MaxChars=7)
	SettingsList(60)=(BottomMargin=20.000000)
}
