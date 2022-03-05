//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////
class TheMinerServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'TheMiner'.default.enableFriendlyDamage);
	if (i == 1)
		return String(Class'TheMiner'.default.bMineChainReaction);
	if (i == 2)
		return String(Class'TheMiner'.default.bUseAmmoSea);
	if (i == 3)
		return String(Class'TheMiner'.default.bUseAmmoVeh);
	if (i == 4)
		return String(Class'TheMiner'.default.bUseAmmoAir);
	if (i == 5)
		return String(Class'TheMiner'.default.MinesLifeSpan);
	if (i == 6)
		return String(Class'TheMiner'.default.MaxMinesPerPlayer);
	if (i == 7)
		return String(Class'TheMiner'.default.enableMineBeacons);
	if (i == 8)
		return String(Class'TheMiner'.default.ReduceMineBeaconsOnDistance);
	if (i == 9)
		return String(Class'TheMiner'.default.MineBeaconsMaxDistance);
	if (i == 10)
		return String(Class'TheMiner'.default.enableJump);
	if (i == 11)
		return String(Class'TheMiner'.default.enableLand);
	if (i == 12)
		return String(Class'TheMiner'.default.enableSea);
	if (i == 13)
		return String(Class'TheMiner'.default.enableVeh);
	if (i == 14)
		return String(Class'TheMiner'.default.enableAir);
	if (i == 15)
		return String(Class'TheMiner'.default.armorAttach);
	if (i == 16)
		return String(Class'TheMiner'.default.armorJump);
	if (i == 17)
		return String(Class'TheMiner'.default.armorLand);
	if (i == 18)
		return String(Class'TheMiner'.default.armorSea);
	if (i == 19)
		return String(Class'TheMiner'.default.armorVeh);
	if (i == 20)
		return String(Class'TheMiner'.default.armorAir);
	if (i == 22)
		return String(Class'TheMiner'.default.enableOversurrection);
	if (i == 23)
		return String(Class'TheMiner'.default.OversurrectionLifeTime);
	if (i == 24)
		return String(Class'TheMiner'.default.OversurrectionSpreadRate);
	if (i == 25)
		return String(Class'TheMiner'.default.OversurrectionSpreadMax);
	if (i == 26)
		return String(Class'TheMiner'.default.OversurrectionSpreadEvalMaxH);
	if (i == 27)
		return String(Class'TheMiner'.default.OversurrectionSpreadMaxRadius);
	if (i == 28)
		return String(Class'TheMiner'.default.OversurrectionSpreadMinRadius);
	if (i == 29)
		return String(Class'TheMiner'.default.OversurrectionMinesMinLifespan);
	if (i == 30)
		return String(Class'TheMiner'.default.OversurrectionMinesMaxLifespan);
	if (i == 31)
		return String(Class'TheMiner'.default.OversurrectionMinesDmgRadius);
	if (i == 32)
		return String(Class'TheMiner'.default.OversurrectionMinesHealth);
	if (i == 33)
		return String(Class'TheMiner'.default.OversurrectionMinesDamage);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'TheMiner'.default.enableFriendlyDamage = Bool(val);
	else if (i == 1)
		Class'TheMiner'.default.bMineChainReaction = Bool(val);
	else if (i == 2)
		Class'TheMiner'.default.bUseAmmoSea = Bool(val);
	else if (i == 3)
		Class'TheMiner'.default.bUseAmmoVeh = Bool(val);
	else if (i == 4)
		Class'TheMiner'.default.bUseAmmoAir = Bool(val);
	else if (i == 5)
		Class'TheMiner'.default.MinesLifeSpan = Float(val);
	else if (i == 6)
		Class'TheMiner'.default.MaxMinesPerPlayer = Int(val);
	else if (i == 7)
		Class'TheMiner'.default.enableMineBeacons = Bool(val);
	else if (i == 8)
		Class'TheMiner'.default.ReduceMineBeaconsOnDistance = Bool(val);
	else if (i == 9)
		Class'TheMiner'.default.MineBeaconsMaxDistance = Float(val);
	else if (i == 10)
		Class'TheMiner'.default.enableJump = Bool(val);
	else if (i == 11)
		Class'TheMiner'.default.enableLand = Bool(val);
	else if (i == 12)
		Class'TheMiner'.default.enableSea = Bool(val);
	else if (i == 13)
		Class'TheMiner'.default.enableVeh = Bool(val);
	else if (i == 14)
		Class'TheMiner'.default.enableAir = Bool(val);
	else if (i == 15)
		Class'TheMiner'.default.armorAttach = Int(val);
	else if (i == 16)
		Class'TheMiner'.default.armorJump = Int(val);
	else if (i == 17)
		Class'TheMiner'.default.armorLand = Int(val);
	else if (i == 18)
		Class'TheMiner'.default.armorSea = Int(val);
	else if (i == 19)
		Class'TheMiner'.default.armorVeh = Int(val);
	else if (i == 20)
		Class'TheMiner'.default.armorAir = Int(val);
	else if (i == 22)
		Class'TheMiner'.default.enableOversurrection = Bool(val);
	else if (i == 23)
		Class'TheMiner'.default.OversurrectionLifeTime = Float(val);
	else if (i == 24)
		Class'TheMiner'.default.OversurrectionSpreadRate = Float(val);
	else if (i == 25)
		Class'TheMiner'.default.OversurrectionSpreadMax = Int(val);
	else if (i == 26)
		Class'TheMiner'.default.OversurrectionSpreadEvalMaxH = Float(val);
	else if (i == 27)
		Class'TheMiner'.default.OversurrectionSpreadMaxRadius = Float(val);
	else if (i == 28)
		Class'TheMiner'.default.OversurrectionSpreadMinRadius = Float(val);
	else if (i == 29)
		Class'TheMiner'.default.OversurrectionMinesMinLifespan = Float(val);
	else if (i == 30)
		Class'TheMiner'.default.OversurrectionMinesMaxLifespan = Float(val);
	else if (i == 31)
		Class'TheMiner'.default.OversurrectionMinesDmgRadius = Float(val);
	else if (i == 32)
		Class'TheMiner'.default.OversurrectionMinesHealth = Int(val);
	else if (i == 33)
		Class'TheMiner'.default.OversurrectionMinesDamage = Int(val);
	
	Class'TheMiner'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'TheMinerAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Mines damageable by teammates")
	SettingsList(0)=(HelpTip="Mines can be damaged and triggered by teammates")
	SettingsList(0)=(Type=ST_Checkbox)

	SettingsList(1)=(Description="Mines chain reaction")
	SettingsList(1)=(HelpTip="Enable ability for mines to damage other near by mines thus making them explode as well")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Force Sea mines ammo usage")
	SettingsList(2)=(HelpTip="Force Sea mines to always need ammo even with Infinity on")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Force Vehicular mines ammo usage")
	SettingsList(3)=(HelpTip="Force Vehicular mines to always need ammo even with Infinity on")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Force Air mines ammo usage")
	SettingsList(4)=(HelpTip="Force Air mines to always need ammo even with Infinity on")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Mines lifespan")
	SettingsList(5)=(HelpTip="Mines auto explosion time delay, in seconds (0.0 = never auto explode)")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(6)=(Description="Max mines per player")
	SettingsList(6)=(HelpTip="Max amount of mines the player is allowed to deploy (0 or below means unlimited)")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=4)
	SettingsList(6)=(BottomMargin=20.000000)
	
	SettingsList(7)=(Description="Enable mine HUD beacons")
	SettingsList(7)=(HelpTip="Render beacons in owned mines")
	SettingsList(7)=(Type=ST_Checkbox)
	
	SettingsList(8)=(Description="Reduce mine HUD beacons on distance")
	SettingsList(8)=(HelpTip="Reduce the rendering scale of beacons in owned mines on distance")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="Mine HUD beacons max distance")
	SettingsList(9)=(HelpTip="Max distance where mine HUD beacons stop being rendered")
	SettingsList(9)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(9)=(BottomMargin=20.000000)
	
	SettingsList(10)=(Description="Jump mines")
	SettingsList(10)=(HelpTip="Enable deployment of Jump mines")
	SettingsList(10)=(Type=ST_Checkbox)
	
	SettingsList(11)=(Description="Land mines")
	SettingsList(11)=(HelpTip="Enable deployment of Land mines")
	SettingsList(11)=(Type=ST_Checkbox)
	
	SettingsList(12)=(Description="Sea mines")
	SettingsList(12)=(HelpTip="Enable deployment of Sea mines")
	SettingsList(12)=(Type=ST_Checkbox)
	
	SettingsList(13)=(Description="Vehicular mines")
	SettingsList(13)=(HelpTip="Enable deployment of Vehicular mines")
	SettingsList(13)=(Type=ST_Checkbox)
	
	SettingsList(14)=(Description="Air mines")
	SettingsList(14)=(HelpTip="Enable deployment of Air mines")
	SettingsList(14)=(Type=ST_Checkbox)
	SettingsList(14)=(BottomMargin=20.000000)
	
	SettingsList(15)=(Description="Attach mine armor")
	SettingsList(15)=(HelpTip="Attach mines armor amount")
	SettingsList(15)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(16)=(Description="Jump mine armor")
	SettingsList(16)=(HelpTip="Jump mines armor amount")
	SettingsList(16)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(17)=(Description="Land mine armor")
	SettingsList(17)=(HelpTip="Land mines armor amount")
	SettingsList(17)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(18)=(Description="Sea mine armor")
	SettingsList(18)=(HelpTip="Sea mines armor amount")
	SettingsList(18)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(19)=(Description="Vehicular mine armor")
	SettingsList(19)=(HelpTip="Vehicular mines armor amount")
	SettingsList(19)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(20)=(Description="Air mine armor")
	SettingsList(20)=(HelpTip="Air mines armor amount")
	SettingsList(20)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(20)=(BottomMargin=20.000000)
	
	SettingsList(21)=(Description="Oversurrection:")
	SettingsList(21)=(HelpTip="Oversurrection settings")
	SettingsList(21)=(Type=ST_Label)
	
	SettingsList(22)=(Description="    Enable Oversurrection")
	SettingsList(22)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(22)=(Type=ST_Checkbox)
	
	SettingsList(23)=(Description="    Life time")
	SettingsList(23)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(23)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(24)=(Description="    Mines spread rate")
	SettingsList(24)=(HelpTip="Oversurrection mines spreading rate (in times per second)")
	SettingsList(24)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(25)=(Description="    Mines spread max")
	SettingsList(25)=(HelpTip="Oversurrection max amount of mines per update cycle")
	SettingsList(25)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(26)=(Description="    Mines spread max evaluation height")
	SettingsList(26)=(HelpTip="Oversurrection max height from ground to find potential mine spots")
	SettingsList(26)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(27)=(Description="    Mines spread max radius")
	SettingsList(27)=(HelpTip="Oversurrection max mine spreading radius")
	SettingsList(27)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(28)=(Description="    Mines spread min radius")
	SettingsList(28)=(HelpTip="Oversurrection min mine spreading radius")
	SettingsList(28)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(29)=(Description="    Mines min lifespan")
	SettingsList(29)=(HelpTip="Oversurrection mines min lifespan (in seconds)")
	SettingsList(29)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(30)=(Description="    Mines max lifespan")
	SettingsList(30)=(HelpTip="Oversurrection mines max lifespan (in seconds)")
	SettingsList(30)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(31)=(Description="    Mines damage radius")
	SettingsList(31)=(HelpTip="Oversurrection mines damage max radius")
	SettingsList(31)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(32)=(Description="    Mines health")
	SettingsList(32)=(HelpTip="Oversurrection mines health")
	SettingsList(32)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(33)=(Description="    Mines damage")
	SettingsList(33)=(HelpTip="Oversurrection mines damage")
	SettingsList(33)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(33)=(BottomMargin=20.000000)
}
