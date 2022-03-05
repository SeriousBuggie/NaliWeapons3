//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////
class BoltRifleWeaponMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'BoltRifle'.default.bFirstPersonShotFX);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local BoltRifle BR;

	if (i == 0)
		Class'BoltRifle'.default.bFirstPersonShotFX = Bool(val);
		
	if (P != None)
	{
		ForEach P.AllActors(Class'BoltRifle', BR)
		{
			BR.default.bFirstPersonShotFX = Class'BoltRifle'.default.bFirstPersonShotFX;
			BR.bFirstPersonShotFX = Class'BoltRifle'.default.bFirstPersonShotFX;
		}
	}

	Class'BoltRifle'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Enable Bolt Rifle shot light GFX")
	SettingsList(0)=(HelpTip="Enable Bolt Rifle first person shooting light effect")
	SettingsList(0)=(Type=ST_Checkbox)
}