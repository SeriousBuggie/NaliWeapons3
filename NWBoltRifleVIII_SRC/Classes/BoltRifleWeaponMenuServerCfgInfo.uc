//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////
class BoltRifleWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Bolt Rifle")
	SettingsList(0)=(HelpTip="Enable and setup Bolt Rifle")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'BoltRifleAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWBoltRifleVIII_SRC.BoltRifle",ExtraInfo2="Botpack.ShockRifle",ExtraInfo3="False",ExtraInfo4="")
}