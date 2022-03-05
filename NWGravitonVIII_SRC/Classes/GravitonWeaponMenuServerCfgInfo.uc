//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////
class GravitonWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Graviton")
	SettingsList(0)=(HelpTip="Enable and setup Graviton")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'GravitonAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWGravitonVIII_SRC.Graviton",ExtraInfo2="Botpack.PulseGun",ExtraInfo3="False",ExtraInfo4="")
}