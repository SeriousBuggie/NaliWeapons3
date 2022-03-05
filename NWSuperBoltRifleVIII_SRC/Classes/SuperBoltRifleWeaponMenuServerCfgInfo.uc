//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////
class SuperBoltRifleWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Super Bolt Rifle")
	SettingsList(0)=(HelpTip="Enable and setup Super Bolt Rifle")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'SuperBoltRifleAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWSuperBoltRifleVIII_SRC.SuperBoltRifle",ExtraInfo2="Botpack.ShockRifle",ExtraInfo3="False",ExtraInfo4="",ExtraInfo5="Botpack.WarHeadLauncher")
}