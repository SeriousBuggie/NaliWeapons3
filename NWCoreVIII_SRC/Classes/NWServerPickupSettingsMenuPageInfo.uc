//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWServerPickupSettingsMenuPageInfo expands NWMenuPageInfo;

var() config class<NWReplacer> ReplClass;


static function string GetFullDefaultValue(byte i, optional byte advIndex)
{
local bool bSwap, bAdd;
local int foundIndex;
local class<Inventory> IClass;

	if (default.SettingsList[i].ExtraInfo1 != "")
		IClass = class<Inventory>(DynamicLoadObject(default.SettingsList[i].ExtraInfo1, class'Class', True));
	if (IClass != None)
	{
		bSwap = default.ReplClass.static.StaticIsSwapPickup(default.SettingsList[i].ExtraInfo1, foundIndex);
		if (foundIndex >= 0)
			return String(bSwap);
		
		if (default.SettingsList[i].ExtraInfo2 != "")
			return String(default.ReplClass.static.StaticProcessPickupReplacementAdd(default.SettingsList[i].ExtraInfo1, default.SettingsList[i].ExtraInfo2, 
				Bool(default.SettingsList[i].ExtraInfo3), default.SettingsList[i].ExtraInfo4, default.SettingsList[i].ExtraInfo5, 
				default.SettingsList[i].ExtraInfo6, default.SettingsList[i].ExtraInfo7, default.SettingsList[i].ExtraInfo8));
	}
	return "";
}


static function string ProcessFullSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local byte j;

	if (default.SettingsList[i].ExtraInfo1 == "")
		return String(False);
	return String(default.ReplClass.static.StaticProcessPickupSwap(default.SettingsList[i].ExtraInfo1, Bool(val)) && Bool(val));
}


defaultproperties
{
	ModMenuInfoClass=Class'NWServerSettingsMainModMenuInfo'
	PageTitle="Pickups"
	
	ReplClass=Class'NWMainReplacer'
}
