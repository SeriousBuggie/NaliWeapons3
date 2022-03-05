//////////////////////////////////////////////////////////////
//				Feralidragon (07-02-2014)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////
class TheOversurrectorWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="The Oversurrector")
	SettingsList(0)=(HelpTip="Enable and setup The Oversurrector")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'TheOversurrectorAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWTheOversurrectorVIII_SRC.TheOversurrector",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="minH=4500;minS=7000;")
}