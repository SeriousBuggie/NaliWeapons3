//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////
class TheMinerWeaponMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="The Miner")
	SettingsList(0)=(HelpTip="Enable and setup The Miner")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'TheMinerAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWTheMinerVIII_SRC.TheMiner",ExtraInfo2="Botpack.UT_FlakCannon",ExtraInfo3="False",ExtraInfo4="")
}