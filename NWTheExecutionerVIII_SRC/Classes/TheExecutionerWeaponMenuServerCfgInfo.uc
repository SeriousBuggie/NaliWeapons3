//////////////////////////////////////////////////////////////
//				Feralidragon (25-09-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////
class TheExecutionerWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="The Executioner")
	SettingsList(0)=(HelpTip="Enable and setup The Executioner")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'TheExecutionerAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWTheExecutionerVIII_SRC.TheExecutioner",ExtraInfo2="BotPack.ImpactHammer",ExtraInfo3="True",ExtraInfo4="",ExtraInfo5="BotPack.ChainSaw")
}