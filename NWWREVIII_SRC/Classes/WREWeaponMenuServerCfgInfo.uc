//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////
class WREWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="W.R.E.")
	SettingsList(0)=(HelpTip="Enable and setup War Ready Enforcer (W.R.E.)")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'WREAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWWREVIII_SRC.WRE",ExtraInfo2="Botpack.Enforcer",ExtraInfo3="True",ExtraInfo4="")
}