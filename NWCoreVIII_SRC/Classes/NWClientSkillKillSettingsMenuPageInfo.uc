//////////////////////////////////////////////////////////////
//				Feralidragon (27-03-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWClientSkillKillsSettingsMenuPageInfo expands NWMenuPageInfo;

#exec TEXTURE IMPORT NAME=MsgColorSampleTex FILE=ICONS\MsgColorSampleTex.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=PntsColorSampleTex FILE=ICONS\PntsColorSampleTex.bmp GROUP=Icons MIPS=OFF LODSET=0

static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NWSkillKillsManager'.default.bUseClientColorSettings);
	if (i == 3)
		return String(Class'NWSkillKillsManager'.default.bUseClientHeightSettings);
	if (i == 4)
		return String(Class'NWSkillKillsManager'.default.MsgHeight);
	if (i == 5)
		return String(Class'NWSkillKillsManager'.default.MsgPointsHeight);
	if (i == 6)
		return String(Class'NWSkillKillsManager'.default.bUseClientSoundSettings);
	if (i == 7)
		return String(Class'NWSkillKillsManager'.default.enableMsgSound);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local NWSkillKillsManager NW;

	if (i == 0)
		Class'NWSkillKillsManager'.default.bUseClientColorSettings = Bool(val);
	else if (i == 3)
		Class'NWSkillKillsManager'.default.bUseClientHeightSettings = Bool(val);
	else if (i == 4)
		Class'NWSkillKillsManager'.default.MsgHeight = Float(val);
	else if (i == 5)
		Class'NWSkillKillsManager'.default.MsgPointsHeight = Float(val);
	else if (i == 6)
		Class'NWSkillKillsManager'.default.bUseClientSoundSettings = Bool(val);
	else if (i == 7)
		Class'NWSkillKillsManager'.default.enableMsgSound = Bool(val);

	if (P != None)
	{
		ForEach P.AllActors(Class'NWSkillKillsManager', NW)
		{
			NW.bUseClientColorSettings = Class'NWSkillKillsManager'.default.bUseClientColorSettings;
			NW.default.bUseClientColorSettings = Class'NWSkillKillsManager'.default.bUseClientColorSettings;
			NW.bUseClientHeightSettings = Class'NWSkillKillsManager'.default.bUseClientHeightSettings;
			NW.default.bUseClientHeightSettings = Class'NWSkillKillsManager'.default.bUseClientHeightSettings;
			NW.MsgHeight = Class'NWSkillKillsManager'.default.MsgHeight;
			NW.default.MsgHeight = Class'NWSkillKillsManager'.default.MsgHeight;
			NW.MsgPointsHeight = Class'NWSkillKillsManager'.default.MsgPointsHeight;
			NW.default.MsgPointsHeight = Class'NWSkillKillsManager'.default.MsgPointsHeight;
			NW.bUseClientSoundSettings = Class'NWSkillKillsManager'.default.bUseClientSoundSettings;
			NW.default.bUseClientSoundSettings = Class'NWSkillKillsManager'.default.bUseClientSoundSettings;
			NW.enableMsgSound = Class'NWSkillKillsManager'.default.enableMsgSound;
			NW.default.enableMsgSound = Class'NWSkillKillsManager'.default.enableMsgSound;
		}
	}

	Class'NWSkillKillsManager'.static.StaticSaveConfig();
	return val;
}


//Color
static function color GetDefaultColor(byte i, optional byte advIndex)
{
local color C;

	if (i == 1)
		return Class'NWSkillKillsManager'.default.MsgColor;
	if (i == 2)
		return Class'NWSkillKillsManager'.default.MsgPointsColor;
	return C;
}

static function color ProcessSettingsChangeColor(PlayerPawn P, byte i, color C, optional byte advIndex)
{
local NWSkillKillsManager NW;

	if (i == 1)
		Class'NWSkillKillsManager'.default.MsgColor = C;
	if (i == 2)
		Class'NWSkillKillsManager'.default.MsgPointsColor = C;
	Class'NWSkillKillsManager'.static.StaticSaveConfig();
	
	if (P != None)
	{
		ForEach P.AllActors(Class'NWSkillKillsManager', NW)
		{
			NW.default.MsgColor = Class'NWSkillKillsManager'.default.MsgColor;
			NW.MsgColor = Class'NWSkillKillsManager'.default.MsgColor;
			NW.default.MsgPointsColor = Class'NWSkillKillsManager'.default.MsgPointsColor;
			NW.MsgPointsColor = Class'NWSkillKillsManager'.default.MsgPointsColor;
		}
	}
	
	return C;
}


defaultproperties
{
	ModMenuInfoClass=Class'NWClientSettingsMainModMenuInfo'
	PageTitle="Skill Kills"
	
	SettingsList(0)=(Description="Overwrite server message color")
	SettingsList(0)=(HelpTip="Overwrite server skill messages color settings")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Messages color")
	SettingsList(1)=(HelpTip="Skill normal messages color")
	SettingsList(1)=(Type=ST_Color,ColorTex=Texture'MsgColorSampleTex')
	
	SettingsList(2)=(Description="Points color")
	SettingsList(2)=(HelpTip="Skill points messages color")
	SettingsList(2)=(Type=ST_Color,ColorTex=Texture'PntsColorSampleTex')
	SettingsList(2)=(BottomMargin=20.000000)
	
	SettingsList(3)=(Description="Overwrite server message height")
	SettingsList(3)=(HelpTip="Overwrite server skill messages height settings")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Messages height")
	SettingsList(4)=(HelpTip="Skill normal messages height (0.0 - bottom; 1.0 - top)")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(5)=(Description="Points height")
	SettingsList(5)=(HelpTip="Skill points messages height (0.0 - bottom; 1.0 - top)")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(5)=(BottomMargin=20.000000)
	
	SettingsList(6)=(Description="Overwrite server message sound")
	SettingsList(6)=(HelpTip="Overwrite server skill messages sound settings")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="Enable message sound")
	SettingsList(7)=(HelpTip="Enable skill messages sound")
	SettingsList(7)=(Type=ST_Checkbox)
	SettingsList(7)=(BottomMargin=20.000000)
}
