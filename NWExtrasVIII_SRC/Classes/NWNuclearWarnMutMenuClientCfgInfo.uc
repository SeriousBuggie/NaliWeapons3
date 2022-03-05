//////////////////////////////////////////////////////////////
//				Feralidragon (28-10-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class NWNuclearWarnMutMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 1)
		return String(Class'NWNuclearWarningMut'.default.letClientDecideListStart);
	if (i == 2)
		return String(Class'NWNuclearWarningMut'.default.bHorizontalListing);
	if (i == 3)
		return String(Class'NWNuclearWarningMut'.default.ListStartPosX);
	if (i == 4)
		return String(Class'NWNuclearWarningMut'.default.ListStartPosY);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local NWNuclearWarningMut NWNM;

	if (i == 1)
		Class'NWNuclearWarningMut'.default.letClientDecideListStart = Bool(val);
	else if (i == 2)
		Class'NWNuclearWarningMut'.default.bHorizontalListing = Bool(val);
	else if (i == 3)
		Class'NWNuclearWarningMut'.default.ListStartPosX = Float(val);
	else if (i == 4)
		Class'NWNuclearWarningMut'.default.ListStartPosY = Float(val);
		
	if (P != None)
	{
		ForEach P.AllActors(Class'NWNuclearWarningMut', NWNM)
		{
			NWNM.default.letClientDecideListStart = Class'NWNuclearWarningMut'.default.letClientDecideListStart;
			NWNM.letClientDecideListStart = Class'NWNuclearWarningMut'.default.letClientDecideListStart;
			NWNM.default.bHorizontalListing = Class'NWNuclearWarningMut'.default.bHorizontalListing;
			NWNM.bHorizontalListing = Class'NWNuclearWarningMut'.default.bHorizontalListing;
			NWNM.default.ListStartPosX = Class'NWNuclearWarningMut'.default.ListStartPosX;
			NWNM.ListStartPosX = Class'NWNuclearWarningMut'.default.ListStartPosX;
			NWNM.default.ListStartPosY = Class'NWNuclearWarningMut'.default.ListStartPosY;
			NWNM.ListStartPosY = Class'NWNuclearWarningMut'.default.ListStartPosY;
		}
	}

	Class'NWNuclearWarningMut'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Nuclear Warning Mutator")
	SettingsList(0)=(Type=ST_Label)

	SettingsList(1)=(Description="    Override server list settings")
	SettingsList(1)=(HelpTip="Enable override of server list rendering settings")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="    Horizontal list")
	SettingsList(2)=(HelpTip="Enable horizontal rendering of the list instead of vertically")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="    List start X")
	SettingsList(3)=(HelpTip="List starting X position percentage (between 0.0 [top] and 1.0 [bottom])")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(4)=(Description="    List start Y")
	SettingsList(4)=(HelpTip="List starting Y position percentage (between 0.0 [left] and 1.0 [right])")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(4)=(BottomMargin=20.000000)
}