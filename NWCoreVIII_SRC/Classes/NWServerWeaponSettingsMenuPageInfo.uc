//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWServerWeaponSettingsMenuPageInfo expands NWMenuPageInfo;

var() config class<NWReplacer> ReplClass;


static function string GetFullDefaultValue(byte i, optional byte advIndex)
{
local bool bSwap, bAdd;
local int foundIndex;
local class<Weapon> WClass;

	if (default.SettingsList[i].ExtraInfo1 != "")
		WClass = class<Weapon>(DynamicLoadObject(default.SettingsList[i].ExtraInfo1, class'Class', True));
	if (WClass != None)
	{
		bSwap = default.ReplClass.static.StaticIsSwapWeapon(default.SettingsList[i].ExtraInfo1, foundIndex);
		if (foundIndex >= 0)
			return String(bSwap);
		
		if (default.SettingsList[i].ExtraInfo2 != "")
			return String(default.ReplClass.static.StaticProcessWeaponReplacementAdd(default.SettingsList[i].ExtraInfo1, default.SettingsList[i].ExtraInfo2, 
				Bool(default.SettingsList[i].ExtraInfo3), default.SettingsList[i].ExtraInfo4, default.SettingsList[i].ExtraInfo5, 
				default.SettingsList[i].ExtraInfo6, default.SettingsList[i].ExtraInfo7, default.SettingsList[i].ExtraInfo8));
		
		if (Bool(default.SettingsList[i].ExtraInfo8))
		{
			bAdd = default.ReplClass.static.StaticIsDefaultWeapon(default.SettingsList[i].ExtraInfo1, foundIndex);
			if (foundIndex >= 0)
				return String(bAdd);
			return String(default.ReplClass.static.StaticProcessWeaponDefaultAdd(default.SettingsList[i].ExtraInfo1, default.SettingsList[i].ExtraInfo4));
		}
	}
	return "";
}


static function string ProcessFullSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local byte j;

	if (default.SettingsList[i].ExtraInfo1 == "")
		return String(False);
	if (Bool(default.SettingsList[i].ExtraInfo8))
		return String(default.ReplClass.static.StaticProcessDefaultWeaponToggle(default.SettingsList[i].ExtraInfo1, Bool(val)) && Bool(val));
	return String(default.ReplClass.static.StaticProcessWeaponSwap(default.SettingsList[i].ExtraInfo1, Bool(val)) && Bool(val));
}


defaultproperties
{
	ModMenuInfoClass=Class'NWServerSettingsMainModMenuInfo'
	PageTitle="Weapons"
	
	ReplClass=Class'NWMainReplacer'
}
