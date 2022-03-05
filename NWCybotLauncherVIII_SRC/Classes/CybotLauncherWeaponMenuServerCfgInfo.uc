//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////
class CybotLauncherWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Cybot Launcher")
	SettingsList(0)=(HelpTip="Enable and setup Cybot Launcher")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'CybotLauncherAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWCybotLauncherVIII_SRC.CybotLauncher",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="")
}