//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWProfileMenuPageInfo expands NWMenuPageInfo;


defaultproperties
{
	ModMenuInfoClass=Class'NWProfileMainModMenuInfo'
	PageTitle="Profile"
	
	SettingsList(0)=(Description="Detail settings:")
	SettingsList(0)=(HelpTip="Detail and performance profile%n%NOTE: Saving will overwrite the selected profile with a new one")
	SettingsList(0)=(Type=ST_Profile,ProfileClass=Class'NWDetailProfile')
	SettingsList(0)=(BottomMargin=30.000000)
	
	SettingsList(1)=(Description="Gameplay settings:")
	SettingsList(1)=(HelpTip="Gameplay and server profile%n%NOTE: Saving will overwrite the selected profile with a new one.%n%Changes require server restart")
	SettingsList(1)=(Type=ST_Profile,ProfileClass=Class'NWGameplayProfile')
	SettingsList(1)=(BottomMargin=30.000000)
}
