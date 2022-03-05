//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////
class SuperBoltRifleWeaponMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'SuperBoltRifle'.default.bFirstPersonShotFX);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local SuperBoltRifle SBR;

	if (i == 0)
		Class'SuperBoltRifle'.default.bFirstPersonShotFX = Bool(val);
		
	if (P != None)
	{
		ForEach P.AllActors(Class'SuperBoltRifle', SBR)
		{
			SBR.default.bFirstPersonShotFX = Class'SuperBoltRifle'.default.bFirstPersonShotFX;
			SBR.bFirstPersonShotFX = Class'SuperBoltRifle'.default.bFirstPersonShotFX;
		}
	}

	Class'SuperBoltRifle'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Enable Super Bolt Rifle shot light GFX")
	SettingsList(0)=(HelpTip="Enable Super Bolt Rifle first person shooting light effect")
	SettingsList(0)=(Type=ST_Checkbox)
}