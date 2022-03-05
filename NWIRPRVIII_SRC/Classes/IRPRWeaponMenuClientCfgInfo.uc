//////////////////////////////////////////////////////////////
//				Feralidragon (17-09-2012)
//
// NW3 INFRARED PRECISION RIFLE 1.00
//////////////////////////////////////////////////////////////
class IRPRWeaponMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'IRPR'.default.bFirstPersonShotFX);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local IRPR IR;

	if (i == 0)
		Class'IRPR'.default.bFirstPersonShotFX = Bool(val);
		
	if (P != None)
	{
		ForEach P.AllActors(Class'IRPR', IR)
		{
			IR.default.bFirstPersonShotFX = Class'IRPR'.default.bFirstPersonShotFX;
			IR.bFirstPersonShotFX = Class'IRPR'.default.bFirstPersonShotFX;
		}
	}

	Class'IRPR'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Enable I.R.P.R. shot light GFX")
	SettingsList(0)=(HelpTip="Enable InfraRed Precision Rifle first person shooting light effect")
	SettingsList(0)=(Type=ST_Checkbox)
}