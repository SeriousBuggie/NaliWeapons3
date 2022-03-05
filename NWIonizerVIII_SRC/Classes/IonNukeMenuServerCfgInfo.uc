//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class IonNukeMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Ion Nuclear Explosion")
	SettingsList(0)=(HelpTip="Ion Nuclear Explosion configuration")
	SettingsList(0)=(Type=ST_Label)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'IonNukeAdvancedMainModMenuInfo')
}