//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////
class RTWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="R.T.")
	SettingsList(0)=(HelpTip="Enable and setup Razored Translocator")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'RTAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWRTVIII_SRC.RT",ExtraInfo2="Botpack.Translocator",ExtraInfo3="True",ExtraInfo4="")
}