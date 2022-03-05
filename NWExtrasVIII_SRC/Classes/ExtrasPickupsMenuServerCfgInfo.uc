//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class ExtrasPickupsMenuServerCfgInfo expands NWMenuPageInfo;


defaultproperties
{
	SettingsList(0)=(Description="Health")
	SettingsList(0)=(HelpTip="Enable Health pickup")
	SettingsList(0)=(Type=ST_Checkbox)
	SettingsList(0)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasHealthMedAdvancedMainModMenuInfo')
	SettingsList(0)=(ExtraInfo1="NWExtrasVIII_SRC.NWMedPickup",ExtraInfo2="BotPack.MedBox",ExtraInfo3="True",ExtraInfo4="")
	
	SettingsList(1)=(Description="Health Vial")
	SettingsList(1)=(HelpTip="Enable Health Vial pickup")
	SettingsList(1)=(Type=ST_Checkbox)
	SettingsList(1)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasHealthVialAdvancedMainModMenuInfo')
	SettingsList(1)=(ExtraInfo1="NWExtrasVIII_SRC.NWVial",ExtraInfo2="BotPack.HealthVial",ExtraInfo3="True",ExtraInfo4="")
	
	SettingsList(2)=(Description="Super Health")
	SettingsList(2)=(HelpTip="Enable Super Health pickup")
	SettingsList(2)=(Type=ST_Checkbox)
	SettingsList(2)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasHealthSuperAdvancedMainModMenuInfo')
	SettingsList(2)=(ExtraInfo1="NWExtrasVIII_SRC.NWSuperHealth",ExtraInfo2="BotPack.HealthPack",ExtraInfo3="True",ExtraInfo4="")
	
	SettingsList(3)=(Description="Thigh Pads")
	SettingsList(3)=(HelpTip="Enable Thigh Pads pickup")
	SettingsList(3)=(Type=ST_Checkbox)
	SettingsList(3)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasThighPadsAdvancedMainModMenuInfo')
	SettingsList(3)=(ExtraInfo1="NWExtrasVIII_SRC.NWThighPads",ExtraInfo2="BotPack.ThighPads",ExtraInfo3="True",ExtraInfo4="")
	
	SettingsList(4)=(Description="Body Armor")
	SettingsList(4)=(HelpTip="Enable Body Armor pickup")
	SettingsList(4)=(Type=ST_Checkbox)
	SettingsList(4)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasBodyArmorAdvancedMainModMenuInfo')
	SettingsList(4)=(ExtraInfo1="NWExtrasVIII_SRC.NWArmor",ExtraInfo2="BotPack.Armor2",ExtraInfo3="True",ExtraInfo4="")
	
	SettingsList(5)=(Description="Shield Belt")
	SettingsList(5)=(HelpTip="Enable Shield Belt pickup")
	SettingsList(5)=(Type=ST_Checkbox)
	SettingsList(5)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasShieldBeltAdvancedMainModMenuInfo')
	SettingsList(5)=(ExtraInfo1="NWExtrasVIII_SRC.NWShieldBelt",ExtraInfo2="BotPack.UT_ShieldBelt",ExtraInfo3="True",ExtraInfo4="")

	SettingsList(6)=(Description="Jump Boots")
	SettingsList(6)=(HelpTip="Enable Jump Boots pickup")
	SettingsList(6)=(Type=ST_Checkbox)
	SettingsList(6)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasJumpBootsAdvancedMainModMenuInfo')
	SettingsList(6)=(ExtraInfo1="NWExtrasVIII_SRC.NWJumpBoots",ExtraInfo2="BotPack.UT_JumpBoots",ExtraInfo3="True",ExtraInfo4="")
	
	SettingsList(7)=(Description="Triple Damage")
	SettingsList(7)=(HelpTip="Enable Triple Damage pickup")
	SettingsList(7)=(Type=ST_Checkbox)
	SettingsList(7)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasUDamageAdvancedMainModMenuInfo')
	SettingsList(7)=(ExtraInfo1="NWExtrasVIII_SRC.NWUDamage",ExtraInfo2="BotPack.UDamage",ExtraInfo3="True",ExtraInfo4="")
	
	SettingsList(8)=(Description="Invisibility")
	SettingsList(8)=(HelpTip="Enable Invisibility pickup")
	SettingsList(8)=(Type=ST_Checkbox)
	SettingsList(8)=(hasAdvanced=True,AdvancedText="Settings",AdvancedMenuInfoClass=Class'ExtrasInvisibilityAdvancedMainModMenuInfo')
	SettingsList(8)=(ExtraInfo1="NWExtrasVIII_SRC.NWInvisibility",ExtraInfo2="BotPack.UT_Invisibility",ExtraInfo3="True",ExtraInfo4="")
}