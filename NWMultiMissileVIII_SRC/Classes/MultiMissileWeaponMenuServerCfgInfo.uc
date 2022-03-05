//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////
class MultiMissileWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="MultiMissile Launcher")
	SettingsList(0)=(HelpTip="Enable and setup MultiMissile Launcher")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'MultiMissileAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWMultiMissileVIII_SRC.MultiMissile",ExtraInfo2="Botpack.UT_Eightball",ExtraInfo3="False",ExtraInfo4="")
}