//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////
class NuclearLauncherWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Nuclear Launcher Level 1")
	SettingsList(0)=(HelpTip="Enable and setup Nuclear Launcher Level 1")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'NuclearLauncherAdvancedMainModMenuInfoA')
	SettingsList(0)=(ExtraInfo1="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelA",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="")
	
	SettingsList(1)=(Description="Nuclear Launcher Level 2")
	SettingsList(1)=(HelpTip="Enable and setup Nuclear Launcher Level 2")
	SettingsList(1)=(Type=ST_Checkbox)
	SettingsList(1)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'NuclearLauncherAdvancedMainModMenuInfoB')
	SettingsList(1)=(ExtraInfo1="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelB",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="minS=1500;")
	
	SettingsList(2)=(Description="Nuclear Launcher Level 3")
	SettingsList(2)=(HelpTip="Enable and setup Nuclear Launcher Level 3")
	SettingsList(2)=(Type=ST_Checkbox)
	SettingsList(2)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'NuclearLauncherAdvancedMainModMenuInfoC')
	SettingsList(2)=(ExtraInfo1="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelC",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="minS=30200;")
	
	SettingsList(3)=(Description="Nuclear Launcher Level 4")
	SettingsList(3)=(HelpTip="Enable and setup Nuclear Launcher Level 4")
	SettingsList(3)=(Type=ST_Checkbox)
	SettingsList(3)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'NuclearLauncherAdvancedMainModMenuInfoD')
	SettingsList(3)=(ExtraInfo1="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelD",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="minH=3000;minS=4000;")
	
	SettingsList(4)=(Description="Nuclear Launcher Level 5")
	SettingsList(4)=(HelpTip="Enable and setup Nuclear Launcher Level 5")
	SettingsList(4)=(Type=ST_Checkbox)
	SettingsList(4)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'NuclearLauncherAdvancedMainModMenuInfoE')
	SettingsList(4)=(ExtraInfo1="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelE",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="minH=4500;minS=7000;")
}