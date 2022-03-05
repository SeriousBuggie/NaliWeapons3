//////////////////////////////////////////////////////////////
//				Feralidragon (17-09-2012)
//
// NW3 INFRARED PRECISION RIFLE 1.00
//////////////////////////////////////////////////////////////
class IRPRWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="I.R.P.R.")
	SettingsList(0)=(HelpTip="Enable and setup InfraRed Precision Rifle (I.R.P.R.)")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'IRPRAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWIRPRVIII_SRC.IRPR",ExtraInfo2="Botpack.SniperRifle",ExtraInfo3="False",ExtraInfo4="")
}