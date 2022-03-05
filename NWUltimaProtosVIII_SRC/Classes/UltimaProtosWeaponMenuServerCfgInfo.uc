//////////////////////////////////////////////////////////////
//				Feralidragon (26-09-2012)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////
class UltimaProtosWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="UltimaProtos")
	SettingsList(0)=(HelpTip="Enable and setup UltimaProtos")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'UltimaProtosAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWUltimaProtosVIII_SRC.UltimaProtos",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="minH=4500;minS=7000;")
}