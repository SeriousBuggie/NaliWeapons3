//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////
class NukeLvlEMenuClientCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Nuclear Explosion Level 5")
	SettingsList(0)=(HelpTip="Nuclear Explosion Level 5 configuration")
	SettingsList(0)=(Type=ST_Label)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'NukeLvlEAdvancedMainModMenuInfoClient')
}