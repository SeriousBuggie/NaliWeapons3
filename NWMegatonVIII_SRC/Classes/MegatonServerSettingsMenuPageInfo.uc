//////////////////////////////////////////////////////////////
//				Feralidragon (26-09-2012)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////
class MegatonServerSettingsMenuPageInfo expands NWMenuPageInfo;

static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'Megaton'.default.bRealSeconds);
	if (i == 1)
		return String(Class'Megaton'.default.bEnablePasswordCard);
	if (i == 2)
		return String(Class'Megaton'.default.generateRandPasswordWhenNotSet);
	if (i == 3)
		return String(Class'Megaton'.default.BroadcastDisarmMsg);
	if (i == 4)
		return Class'Megaton'.default.CountdownTime;
	if (i == 5)
		return Class'Megaton'.default.MinCountdownTime;
	if (i == 6)
		return Class'Megaton'.default.MaxCountdownTime;
	if (i == 7)
		return Class'Megaton'.default.DisarmPassword;
	if (i == 8)
		return String(Class'MegatonPassCard'.default.bReturnToOwner);
	if (i == 9)
		return String(Class'MegatonPassCard'.default.bRenderLocationWhenDropped);
	if (i == 10)
		return String(Class'MegatonPassCard'.default.DroppedTime);
	if (i == 11)
		return String(Class'MegatonPassCard'.default.allowedDroppedDistFromMegaton);
	if (i == 12)
		return String(Class'MegatonPassCard'.default.renderLocationMaxDist);
	if (i == 13)
		return String(Class'MegatonPassCard'.default.BroadcastPickupMsg);
	if (i == 14)
		return String(Class'MegatonPassCard'.default.BroadcastReturnToOriginMsg);
	if (i == 15)
		return String(Class'MegatonPassCard'.default.BroadcastReturnToOwnerMsg);
	if (i == 16)
		return String(Class'MegatonPassCard'.default.BroadcastDroppedMsg);

	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'Megaton'.default.bRealSeconds = Bool(val);
	else if (i == 1)
		Class'Megaton'.default.bEnablePasswordCard = Bool(val);
	else if (i == 2)
		Class'Megaton'.default.generateRandPasswordWhenNotSet = Bool(val);
	else if (i == 3)
		Class'Megaton'.default.BroadcastDisarmMsg = Bool(val);
	else if (i >= 4 && i <= 7)
	{
		if (!ValidateCodeVal(val))
			val = "030";
		
		if (i == 4)
			Class'Megaton'.default.CountdownTime = val;
		else if (i == 5)
			Class'Megaton'.default.MinCountdownTime = val;
		else if (i == 6)
			Class'Megaton'.default.MaxCountdownTime = val;
		else if (i == 7)
			Class'Megaton'.default.DisarmPassword = val;
	}
	else if (i == 8)
		Class'MegatonPassCard'.default.bReturnToOwner = Bool(val);
	else if (i == 9)
		Class'MegatonPassCard'.default.bRenderLocationWhenDropped = Bool(val);
	else if (i == 10)
		Class'MegatonPassCard'.default.DroppedTime = Float(val);
	else if (i == 11)
		Class'MegatonPassCard'.default.allowedDroppedDistFromMegaton = Float(val);
	else if (i == 12)
		Class'MegatonPassCard'.default.renderLocationMaxDist = Float(val);
	else if (i == 13)
		Class'MegatonPassCard'.default.BroadcastPickupMsg = Bool(val);
	else if (i == 14)
		Class'MegatonPassCard'.default.BroadcastReturnToOriginMsg = Bool(val);
	else if (i == 15)
		Class'MegatonPassCard'.default.BroadcastReturnToOwnerMsg = Bool(val);
	else if (i == 16)
		Class'MegatonPassCard'.default.BroadcastDroppedMsg = Bool(val);
	
	if (i <= 7)
		Class'Megaton'.static.StaticSaveConfig();
	else
		Class'MegatonPassCard'.static.StaticSaveConfig();
	return val;
}

static function bool ValidateCodeVal(string val)
{
local int i;

	if (Len(val) > 3)
		return False;

	for (i = 0; i < Len(val); i++)
	{
		switch (Mid(val, i, 1))
		{
			case "0": case "1": case "2": case "3": case "4": case "5": case "6": case "7": case "8": case "9":
				break;
			default:
				return False;
		}
	}
	return True;
}



defaultproperties
{
	ModMenuInfoClass=Class'MegatonAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Use real seconds")
	SettingsList(0)=(HelpTip="Use real world seconds on countdown rather than in-game seconds, which vary with game speed")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Enable password card")
	SettingsList(1)=(HelpTip="Enable generation of a password card when a Megaton is armed")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Generate random password")
	SettingsList(2)=(HelpTip="Generate random password for Megaton when a custom one is not set")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Broadcast disarm message")
	SettingsList(3)=(HelpTip="Broadcast message when the Megaton is disarmed")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Countdown starting time")
	SettingsList(4)=(HelpTip="Megaton default countdown starting time%n%Example:  246 = 2 minutes and 46 seconds")
	SettingsList(4)=(Type=ST_Input,MaxChars=3)
	
	SettingsList(5)=(Description="Min countdown starting time")
	SettingsList(5)=(HelpTip="Megaton min allowed countdown starting time%n%Example:  246 = 2 minutes and 46 seconds")
	SettingsList(5)=(Type=ST_Input,MaxChars=3)
	
	SettingsList(6)=(Description="Max countdown starting time")
	SettingsList(6)=(HelpTip="Megaton max allowed countdown starting time%n%Example:  246 = 2 minutes and 46 seconds")
	SettingsList(6)=(Type=ST_Input,MaxChars=3)
	
	SettingsList(7)=(Description="Disarm password")
	SettingsList(7)=(HelpTip="Megaton default disarm password (3 digits numeric code)")
	SettingsList(7)=(Type=ST_Input,MaxChars=3)
	SettingsList(7)=(BottomMargin=20.000000)
	
	SettingsList(8)=(Description="Return card to owner")
	SettingsList(8)=(HelpTip="Return password card to owner on respawn as long the card is not owned by someone else by then")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="Render card dropped location")
	SettingsList(9)=(HelpTip="Show a dropped password card location in the HUD (if directly visible)")
	SettingsList(9)=(Type=ST_Checkbox)
	
	SettingsList(10)=(Description="Max card dropped time")
	SettingsList(10)=(HelpTip="Max amount of time until a dropped password card returns to its Megaton or owner (in seconds)")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(11)=(Description="Max Megaton dropped distance")
	SettingsList(11)=(HelpTip="Max distance allowed from the password card to the actual Megaton")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(12)=(Description="Max password card render distance")
	SettingsList(12)=(HelpTip="Max distance allowed to render the password location in the HUD")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(13)=(Description="Broadcast card pickup message")
	SettingsList(13)=(HelpTip="Broadcast message when the password card is picked up")
	SettingsList(13)=(Type=ST_Checkbox)
	
	SettingsList(14)=(Description="Broadcast card return to origin message")
	SettingsList(14)=(HelpTip="Broadcast message when the password card returns to its Megaton position")
	SettingsList(14)=(Type=ST_Checkbox)
	
	SettingsList(15)=(Description="Broadcast card return to owner message")
	SettingsList(15)=(HelpTip="Broadcast message when the password card returns to its owner")
	SettingsList(15)=(Type=ST_Checkbox)
	
	SettingsList(16)=(Description="Broadcast dropped card message")
	SettingsList(16)=(HelpTip="Broadcast message when the password card is dropped")
	SettingsList(16)=(Type=ST_Checkbox)
	SettingsList(16)=(BottomMargin=20.000000)
}
