//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////
class FlameTrackerWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Flame Tracker")
	SettingsList(0)=(HelpTip="Enable and setup Flame Tracker")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'FlameTrackerAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWFlameTrackerVIII_SRC.FlameTracker",ExtraInfo2="Botpack.UT_Biorifle",ExtraInfo3="False",ExtraInfo4="")
}