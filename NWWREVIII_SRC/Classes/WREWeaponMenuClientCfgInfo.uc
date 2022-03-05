//////////////////////////////////////////////////////////////
//				Feralidragon (11-09-2012)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////
class WREWeaponMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'WRE'.default.FireMuzzleFlashScale);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local WRE W;

	if (i == 0)
		Class'WRE'.default.FireMuzzleFlashScale = Float(val);
		
	if (P != None)
	{
		ForEach P.AllActors(Class'WRE', W)
		{
			W.default.FireMuzzleFlashScale = Class'WRE'.default.FireMuzzleFlashScale;
			W.FireMuzzleFlashScale = Class'WRE'.default.FireMuzzleFlashScale;
		}
	}

	Class'WRE'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="W.R.E. muzzle flash scale")
	SettingsList(0)=(HelpTip="War Ready Enforcer (W.R.E.) fire muzzle flash scaling")
	SettingsList(0)=(Type=ST_FloatInput,MaxChars=4)
}