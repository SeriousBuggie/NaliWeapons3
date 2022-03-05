//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////
class FreezerWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Freezer")
	SettingsList(0)=(HelpTip="Enable and setup Freezer")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'FreezerAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWFreezerVIII_SRC.Freezer",ExtraInfo2="Botpack.Ripper",ExtraInfo3="False",ExtraInfo4="")
}