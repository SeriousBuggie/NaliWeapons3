//////////////////////////////////////////////////////////////
//				Feralidragon (25-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class IonizerWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Ionizer")
	SettingsList(0)=(HelpTip="Enable and setup Ionizer")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'IonizerAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWIonizerVIII_SRC.Ionizer",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="minH=3000;minS=4500;")
}