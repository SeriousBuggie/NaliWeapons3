//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWServerGenericSettingsMenuPageInfo expands NWMenuPageInfo;

var() localized string AmmoBehType[3], ResFXColor[5], ChargerTypes[4], MultiTypes[5], TeamTypes[3];


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NaliWeapons'.default.MaxTraceRange);
	if (i == 1)
		return String(Class'NaliPickups'.default.enableTeamBasedEffect);
	if (i == 2)
		return String(Class'NWInfo'.default.bTeleProjectiles);
	if (i == 3)
		return String(Class'NWInfo'.default.MaxHealth);
	if (i == 5)
		return String(Class'NWInfo'.default.enable_WeaponRessurectFX);
	if (i == 6)
		return String(Class'NWInfo'.default.enable_WeaponResTeamBasedColor);
	if (i == 8)
		return String(Class'NWInfo'.default.enable_AmmoRessurectFX);
	if (i == 9)
		return String(Class'NWInfo'.default.enable_AmmoResTeamBasedColor);
	if (i == 11)
		return String(Class'NWInfo'.default.enable_PickupRessurectFX);
	if (i == 12)
		return String(Class'NWInfo'.default.enable_PickupResTeamBasedColor);
	if (i == 14)
		return String(Class'NaliWeapons'.default.enableZPServer);
	if (i == 15)
		return String(Class'NWMainReplacer'.default.enableOldWeaponsReplace);
	if (i == 16)
		return String(Class'NWInfo'.default.enableServerNukeCrashFix);
	if (i == 17)
		return String(Class'NWInfo'.default.enableShakeFX);
	if (i == 18)
		return String(Class'NWInfo'.default.enableKillMsgManager);
	if (i == 28)
		return String(Class'NWInfo'.default.enableFriendlyFire);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'NaliWeapons'.default.MaxTraceRange = Int(val);
	else if (i == 1)
		Class'NaliPickups'.default.enableTeamBasedEffect = Bool(val);
	else if (i == 2)
		Class'NWInfo'.default.bTeleProjectiles = Bool(val);
	else if (i == 3)
		Class'NWInfo'.default.MaxHealth = Int(val);
	else if (i == 5)
		Class'NWInfo'.default.enable_WeaponRessurectFX = Bool(val);
	else if (i == 6)
		Class'NWInfo'.default.enable_WeaponResTeamBasedColor = Bool(val);
	else if (i == 8)
		Class'NWInfo'.default.enable_AmmoRessurectFX = Bool(val);
	else if (i == 9)
		Class'NWInfo'.default.enable_AmmoResTeamBasedColor = Bool(val);
	else if (i == 11)
		Class'NWInfo'.default.enable_PickupRessurectFX = Bool(val);
	else if (i == 12)
		Class'NWInfo'.default.enable_PickupResTeamBasedColor = Bool(val);
	else if (i == 14)
		Class'NaliWeapons'.default.enableZPServer = Bool(val);
	else if (i == 15)
		Class'NWMainReplacer'.default.enableOldWeaponsReplace = Bool(val);
	else if (i == 16)
		Class'NWInfo'.default.enableServerNukeCrashFix = Bool(val);
	else if (i == 17)
		Class'NWInfo'.default.enableShakeFX = Bool(val);
	else if (i == 18)
		Class'NWInfo'.default.enableKillMsgManager = Bool(val);
	else if (i == 28)
		Class'NWInfo'.default.enableFriendlyFire = Bool(val);
		
	if (i == 0 || i == 14)
		Class'NaliWeapons'.static.StaticSaveConfig();
	else if (i == 1)
		Class'NaliPickups'.static.StaticSaveConfig();
	else if (i == 15 || i == 19 || i == 20 || i == 21)
		Class'NWMainReplacer'.static.StaticSaveConfig();
	else if (i >= 2)
		Class'NWInfo'.static.StaticSaveConfig();
		
	return val;
}


//Combo
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
local byte n;

	if (i == 4)
	{
		n = Class'NWInfo'.default.AmmoBehaviour;
		if (n < ArrayCount(default.AmmoBehType))
		{
			val1 = default.AmmoBehType[n];
			val2 = String(n);
			return;
		}
	}
	else if (i == 7 || i == 10 || i == 13)
	{
		if (i == 7)
			n = Class'NWInfo'.default.WeaponResFXColor;
		else if (i == 10)
			n = Class'NWInfo'.default.AmmoResFXColor;
		else if (i == 13)
			n = Class'NWInfo'.default.PickupResFXColor;
		
		if (n < ArrayCount(default.ResFXColor))
		{
			val1 = default.ResFXColor[n];
			val2 = String(n);
			return;
		}
	}
	else if (i >= 19 && i <= 21)
	{
		if (i == 19)
			n = Class'NWMainReplacer'.default.GlobalWeaponChargerType;
		else if (i == 20)
			n = Class'NWMainReplacer'.default.GlobalAmmoChargerType;
		else if (i == 21)
			n = Class'NWMainReplacer'.default.GlobalPickupChargerType;
		
		if (n < ArrayCount(default.ChargerTypes))
		{
			val1 = default.ChargerTypes[n];
			val2 = String(n);
			return;
		}
	}
	else if (i >= 22 && i <= 24)
	{
		if (i == 22)
			n = Class'NWMainReplacer'.default.GlobalWeaponMultiReplacementType;
		else if (i == 23)
			n = Class'NWMainReplacer'.default.GlobalAmmoMultiReplacementType;
		else if (i == 24)
			n = Class'NWMainReplacer'.default.GlobalPickupMultiReplacementType;
		
		if (n < ArrayCount(default.MultiTypes))
		{
			val1 = default.MultiTypes[n];
			val2 = String(n);
			return;
		}
	}
	else if (i >= 25 && i <= 27)
	{
		if (i == 25)
			n = Class'NWMainReplacer'.default.GlobalWeaponTeamChargerSett;
		else if (i == 26)
			n = Class'NWMainReplacer'.default.GlobalAmmoTeamChargerSett;
		else if (i == 27)
			n = Class'NWMainReplacer'.default.GlobalPickupTeamChargerSett;
		
		if (n < ArrayCount(default.TeamTypes))
		{
			val1 = default.TeamTypes[n];
			val2 = String(n);
			return;
		}
	}
	
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if (i == 4 && listIndex < ArrayCount(default.AmmoBehType))
	{
		val1 = default.AmmoBehType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	if ((i == 7 || i == 10 || i == 13) && listIndex < ArrayCount(default.ResFXColor))
	{
		val1 = default.ResFXColor[listIndex];
		val2 = String(listIndex);
		return True;
	}
	if (i >= 19 && i <= 21 && listIndex < ArrayCount(default.ChargerTypes))
	{
		val1 = default.ChargerTypes[listIndex];
		val2 = String(listIndex);
		return True;
	}
	if (i >= 22 && i <= 24 && listIndex < ArrayCount(default.MultiTypes))
	{
		val1 = default.MultiTypes[listIndex];
		val2 = String(listIndex);
		return True;
	}
	if (i >= 25 && i <= 27 && listIndex < ArrayCount(default.TeamTypes))
	{
		val1 = default.TeamTypes[listIndex];
		val2 = String(listIndex);
		return True;
	}
	
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	if (i == 4)
		Class'NWInfo'.default.AmmoBehaviour = Class'NWInfo'.static.GetAmmoBehaviourFromByte(Byte(val2));
	if (i == 7)
		Class'NWInfo'.default.WeaponResFXColor = Class'NWInfo'.static.GetRessurectColorFromByte(Byte(val2));
	if (i == 10)
		Class'NWInfo'.default.AmmoResFXColor = Class'NWInfo'.static.GetRessurectColorFromByte(Byte(val2));
	if (i == 13)
		Class'NWInfo'.default.PickupResFXColor = Class'NWInfo'.static.GetRessurectColorFromByte(Byte(val2));
	if (i == 4 || i == 7 || i == 10 || i == 13)
		Class'NWInfo'.static.StaticSaveConfig();
		
	if (i == 19)
		Class'NWMainReplacer'.default.GlobalWeaponChargerType = Class'NWReplacer'.static.GetChargerTypeFromByte(Byte(val2));
	if (i == 20)
		Class'NWMainReplacer'.default.GlobalAmmoChargerType = Class'NWReplacer'.static.GetChargerTypeFromByte(Byte(val2));
	if (i == 21)
		Class'NWMainReplacer'.default.GlobalPickupChargerType = Class'NWReplacer'.static.GetChargerTypeFromByte(Byte(val2));
	if (i == 22)
		Class'NWMainReplacer'.default.GlobalWeaponMultiReplacementType = Class'NWReplacer'.static.GetMultiTypeFromByte(Byte(val2));
	if (i == 23)
		Class'NWMainReplacer'.default.GlobalAmmoMultiReplacementType = Class'NWReplacer'.static.GetMultiTypeFromByte(Byte(val2));
	if (i == 24)
		Class'NWMainReplacer'.default.GlobalPickupMultiReplacementType = Class'NWReplacer'.static.GetMultiTypeFromByte(Byte(val2));
	if (i == 25)
		Class'NWMainReplacer'.default.GlobalWeaponTeamChargerSett = Class'NWReplacer'.static.GetTeamChargerSettFromByte(Byte(val2));
	if (i == 26)
		Class'NWMainReplacer'.default.GlobalAmmoTeamChargerSett = Class'NWReplacer'.static.GetTeamChargerSettFromByte(Byte(val2));
	if (i == 27)
		Class'NWMainReplacer'.default.GlobalPickupTeamChargerSett = Class'NWReplacer'.static.GetTeamChargerSettFromByte(Byte(val2));
	if (i >= 19 && i <= 27)
		Class'NWMainReplacer'.static.StaticSaveConfig();
	
	return val2;
}


defaultproperties
{
	ModMenuInfoClass=Class'NWServerSettingsMainModMenuInfo'
	PageTitle="Generic"
	
	SettingsList(0)=(Description="Hitscan max range")
	SettingsList(0)=(HelpTip="Max range of a hitscan weapon")
	SettingsList(0)=(Type=ST_IntegerInput)
	SettingsList(0)=(MaxChars=6)
	
	SettingsList(1)=(Description="Enable pickups team GFX")
	SettingsList(1)=(HelpTip="Enable team colored pickup effects")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Enable projectile teleportation")
	SettingsList(2)=(HelpTip="Enable projectiles to be affect by teleporters%n%NOTE: This feature only works offline or practise sessions. Due to the current %n%Unreal Engine limitations this feature is not supported on online play.")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Player max health")
	SettingsList(3)=(HelpTip="Max cumulated health amount a player can have through extra health pickups, like:%n%health vials, big keg'o health, etc")
	SettingsList(3)=(Type=ST_IntegerInput)
	SettingsList(3)=(MaxChars=6)
	
	SettingsList(4)=(Description="Ammo behavior")
	SettingsList(4)=(HelpTip="Ammo behavior on (re)spawn:%n%    Animated: Execute opening animation%n%    Always opened: Remain always opened%n%    Always closed: Remain always closed")
	SettingsList(4)=(Type=ST_Combo)
	SettingsList(4)=(BottomMargin=20.000000)
	AmmoBehType(0)="Animated"
	AmmoBehType(1)="Always opened"
	AmmoBehType(2)="Always closed"
	
	ResFXColor(0)="White"
	ResFXColor(1)="Red"
	ResFXColor(2)="Blue"
	ResFXColor(3)="Green"
	ResFXColor(4)="Yellow"
	
	SettingsList(5)=(Description="Enable weapons respawn GFX")
	SettingsList(5)=(HelpTip="Enable new weapons respawn effect")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Use team color on weapons respawn GFX")
	SettingsList(6)=(HelpTip="Use team colors in the new weapons respawn effect")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="Weapons respawn GFX default color")
	SettingsList(7)=(HelpTip="Weapons new respawn effect default color")
	SettingsList(7)=(Type=ST_Combo)
	SettingsList(7)=(BottomMargin=10.000000)
	
	SettingsList(8)=(Description="Enable ammo respawn GFX")
	SettingsList(8)=(HelpTip="Enable new ammo respawn effect")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="Use team color on ammo respawn GFX")
	SettingsList(9)=(HelpTip="Use team colors in the new ammo respawn effect")
	SettingsList(9)=(Type=ST_Checkbox)
	
	SettingsList(10)=(Description="Ammo respawn GFX default color")
	SettingsList(10)=(HelpTip="Ammo new respawn effect default color")
	SettingsList(10)=(Type=ST_Combo)
	SettingsList(10)=(BottomMargin=10.000000)
	
	SettingsList(11)=(Description="Enable pickups respawn GFX")
	SettingsList(11)=(HelpTip="Enable new pickups respawn effect")
	SettingsList(11)=(Type=ST_Checkbox)
	
	SettingsList(12)=(Description="Use team color on pickups respawn GFX")
	SettingsList(12)=(HelpTip="Use team colors in the new pickups respawn effect")
	SettingsList(12)=(Type=ST_Checkbox)
	
	SettingsList(13)=(Description="Pickups respawn GFX default color")
	SettingsList(13)=(HelpTip="Pickups new respawn effect default color")
	SettingsList(13)=(Type=ST_Combo)
	SettingsList(13)=(BottomMargin=20.000000)
	
	SettingsList(14)=(Description="Enable ZP Server")
	SettingsList(14)=(HelpTip="Enable ZeroPing Server for all applicable hitscan weapons")
	SettingsList(14)=(Type=ST_Checkbox)
	
	SettingsList(15)=(Description="Replace old Unreal weapons")
	SettingsList(15)=(HelpTip="Enable replacement of old Unreal weapons such as Stinger, Automag, etc")
	SettingsList(15)=(Type=ST_Checkbox)
	
	SettingsList(16)=(Description="Enable nuclear crash fix (server)")
	SettingsList(16)=(HelpTip="Enable fix for the nuclear explosions from the server.%n%  NOTE: A consequence of this fix is the temporary disappearance of decals during the blast.")
	SettingsList(16)=(Type=ST_Checkbox)
	
	SettingsList(17)=(Description="Enable shake FX")
	SettingsList(17)=(HelpTip="Enable shaking screen effect from blasts and other applicable phenomena")
	SettingsList(17)=(Type=ST_Checkbox)
	
	SettingsList(18)=(Description="Enable kill messages manager")
	SettingsList(18)=(HelpTip="Enable the kill messages manager so the correct death messages appear")
	SettingsList(18)=(Type=ST_Checkbox)
	SettingsList(18)=(BottomMargin=20.000000)
	
	SettingsList(19)=(Description="Weapons charger type")
	SettingsList(19)=(HelpTip="Weapons global charger type:%n%    None: No chargers at all%n%    Item defined: Use configuration per weapon%n%    Charger 1: Use charger 1 for all weapons%n%    Charger 2: Use charger 2 for all weapons")
	SettingsList(19)=(Type=ST_Combo)
	ChargerTypes(0)="None"
	ChargerTypes(1)="Item defined"
	ChargerTypes(2)="Charger A"
	ChargerTypes(3)="Charger B"
	
	SettingsList(20)=(Description="Ammo charger type")
	SettingsList(20)=(HelpTip="Ammo global charger type:%n%    None: No chargers at all%n%    Item defined: Use configuration per ammo%n%    Charger 1: Use charger 1 for all ammo%n%    Charger 2: Use charger 2 for all ammo")
	SettingsList(20)=(Type=ST_Combo)
	
	SettingsList(21)=(Description="Pickups charger type")
	SettingsList(21)=(HelpTip="Pickups global charger type:%n%    None: No chargers at all%n%    Item defined: Use configuration per pickup%n%    Charger 1: Use chargers 1 for all pickups%n%    Charger 2: Use charger 2 for all pickups")
	SettingsList(21)=(Type=ST_Combo)
	SettingsList(21)=(BottomMargin=20.000000)
	
	SettingsList(22)=(Description="Weapons multi type")
	SettingsList(22)=(HelpTip="Weapons global multi-replacement type:%n%    Item defined: Use configuration per weapon%n%    Sequential: Different weapons appear over time by their order in WeaponItems%n%    Random Static: The weapon is replaced by 1 single random weapon from the multiple set%n%    Random Timed: Different weapons appear over time in a random fashion%n%    Locker: All the weapons appear at the same time in a locker")
	SettingsList(22)=(Type=ST_Combo)
	MultiTypes(0)="Item defined"
	MultiTypes(1)="Sequential"
	MultiTypes(2)="Random Static"
	MultiTypes(3)="Random Timed"
	MultiTypes(4)="Locker"
	
	SettingsList(23)=(Description="Ammo multi type")
	SettingsList(23)=(HelpTip="Ammo global multi-replacement type:%n%    Item defined: Use configuration per ammo%n%    Sequential: Different ammo appear over time by their order in AmmoItems%n%    Random Static: The ammo is replaced by 1 single random ammo from the multiple set%n%    Random Timed: Different ammo appear over time in a random fashion%n%    Locker: All the ammo appear at the same time in a locker")
	SettingsList(23)=(Type=ST_Combo)
	
	SettingsList(24)=(Description="Pickups multi type")
	SettingsList(24)=(HelpTip="Pickups global multi-replacement type:%n%    Item defined: Use configuration per pickup%n%    Sequential: Different pickups appear over time by their order in PickupItems%n%    Random Static: The pickup is replaced by 1 single random pickup from the multiple set%n%    Random Timed: Different pickups appear over time in a random fashion%n%    Locker: All the pickups appear at the same time in a locker")
	SettingsList(24)=(Type=ST_Combo)
	SettingsList(24)=(BottomMargin=20.000000)
	
	SettingsList(25)=(Description="Weapons team FX")
	SettingsList(25)=(HelpTip="Weapons global team chargers glowing effect:%n%    Item defined: Use configuration per weapon%n%    Enable team FX: Enable team glowing FX for all weapon chargers%n%    Disable team FX: Disable team glowing FX for all weapon chargers")
	SettingsList(25)=(Type=ST_Combo)
	TeamTypes(0)="Item defined"
	TeamTypes(1)="Enable team FX"
	TeamTypes(2)="Disable team FX"
	
	SettingsList(26)=(Description="Ammo team FX")
	SettingsList(26)=(HelpTip="Ammo global team chargers glowing effect:%n%    Item defined: Use configuration per ammo%n%    Enable team FX: Enable team glowing FX for all ammo chargers%n%    Disable team FX: Disable team glowing FX for all ammo chargers")
	SettingsList(26)=(Type=ST_Combo)
	
	SettingsList(27)=(Description="Pickups team FX")
	SettingsList(27)=(HelpTip="Pickups global team chargers glowing effect:%n%    Item defined: Use configuration per pickup%n%    Enable team FX: Enable team glowing FX for all pickup chargers%n%    Disable team FX: Disable team glowing FX for all pickup chargers")
	SettingsList(27)=(Type=ST_Combo)
	SettingsList(27)=(BottomMargin=20.000000)
	
	SettingsList(28)=(Description="Enable friendly fire")
	SettingsList(28)=(HelpTip="Enable friendly fire (note: some situations may get 'awkward', like cybots attacking teammates)")
	SettingsList(28)=(Type=ST_Checkbox)
	SettingsList(28)=(BottomMargin=20.000000)
}
