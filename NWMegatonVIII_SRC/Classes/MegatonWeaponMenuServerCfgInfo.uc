//////////////////////////////////////////////////////////////
//				Feralidragon (26-09-2012)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////
class MegatonWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Megaton")
	SettingsList(0)=(HelpTip="Enable and setup Megaton")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'MegatonAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWMegatonVIII_SRC.Megaton",ExtraInfo2="Botpack.WarHeadLauncher",ExtraInfo3="True",ExtraInfo4="minH=3000;minS=4000;")
	
	SettingsList(1)=(Description="Megaton Decoder")
	SettingsList(1)=(HelpTip="Enable and setup Megaton Decoder")
	SettingsList(1)=(Type=ST_Checkbox)
	SettingsList(1)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'MegatonDecoderAdvancedMainModMenuInfo')
	SettingsList(1)=(ExtraInfo1="NWMegatonVIII_SRC.MegatonDecoder",ExtraInfo2="",ExtraInfo3="",ExtraInfo4="minH=3000;minS=4000;",ExtraInfo8="True")
}