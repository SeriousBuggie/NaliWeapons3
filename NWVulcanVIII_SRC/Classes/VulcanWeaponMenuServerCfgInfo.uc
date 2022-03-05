//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////
class VulcanWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Vulcan")
	SettingsList(0)=(HelpTip="Enable and setup Vulcan")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'VulcanAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWVulcanVIII_SRC.Vulcan",ExtraInfo2="Botpack.Minigun2",ExtraInfo3="False",ExtraInfo4="")
}