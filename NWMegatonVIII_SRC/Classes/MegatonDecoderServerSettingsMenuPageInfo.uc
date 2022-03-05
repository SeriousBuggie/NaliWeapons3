//////////////////////////////////////////////////////////////
//				Feralidragon (26-09-2012)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////
class MegatonDecoderServerSettingsMenuPageInfo expands NWMenuPageInfo;

static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'MegatonDecoder'.default.bDroppable);
	if (i == 1)
		return String(Class'MegatonDecoder'.default.canDisarmFriendNuke);
	if (i == 2)
		return String(Class'MegatonDecoder'.default.TransmissionTime);
	if (i == 3)
		return String(Class'MegatonDecoder'.default.TransmissionMaxDistance);

	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'MegatonDecoder'.default.bDroppable = Bool(val);
	else if (i == 1)
		Class'MegatonDecoder'.default.canDisarmFriendNuke = Bool(val);
	else if (i == 2)
		Class'MegatonDecoder'.default.TransmissionTime = Float(val);
	else if (i == 3)
		Class'MegatonDecoder'.default.TransmissionMaxDistance = Float(val);
	
	Class'MegatonDecoder'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'MegatonDecoderAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Drop on death")
	SettingsList(0)=(HelpTip="Drop device on death, like a normal weapon")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Disarmable nuke by teammate")
	SettingsList(1)=(HelpTip="Allow teammates to disarm own Megaton")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Transmission time")
	SettingsList(2)=(HelpTip="Decoding data transmission time (in seconds)")
	SettingsList(2)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(3)=(Description="Transmission max distance")
	SettingsList(3)=(HelpTip="Max allowed distance from the Megaton to be able to transmit the decoding data to")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(3)=(BottomMargin=20.000000)
}
