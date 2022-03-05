//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////
class NuclearLauncherWeaponMenuClientCfgInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NuclearLauncher'.default.CrossSidesTransparency);
	if (i == 1)
		return String(Class'NuclearLauncher'.default.CrossCenterTransparency);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local NuclearLauncher NL;

	if (i == 0 || i == 1)
	{
		if (Float(val) < 0.0)
			val = String(0.0);
		else if (Float(val) > 1.0)
			val = String(1.0);
		
		if (i == 0)
			Class'NuclearLauncher'.default.CrossSidesTransparency = Float(val);
		else if (i == 1)
			Class'NuclearLauncher'.default.CrossCenterTransparency = Float(val);
	}
		
	if (P != None)
	{
		ForEach P.AllActors(Class'NuclearLauncher', NL)
		{
			NL.default.CrossSidesTransparency = Class'NuclearLauncher'.default.CrossSidesTransparency;
			NL.CrossSidesTransparency = Class'NuclearLauncher'.default.CrossSidesTransparency;
			NL.default.CrossCenterTransparency = Class'NuclearLauncher'.default.CrossCenterTransparency;
			NL.CrossCenterTransparency = Class'NuclearLauncher'.default.CrossCenterTransparency;
		}
	}

	Class'NuclearLauncher'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	SettingsList(0)=(Description="Nuclear Launcher crosshair sides opacity")
	SettingsList(0)=(HelpTip="Nuclear Launcher guided warhead crosshair sides opacity%n%   0.0 - Fully transparent%n%   1.0 - Fully opaque")
	SettingsList(0)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(1)=(Description="Nuclear Launcher crosshair center opacity")
	SettingsList(1)=(HelpTip="Nuclear Launcher guided warhead crosshair center opacity%n%   0.0 - Fully transparent%n%   1.0 - Fully opaque")
	SettingsList(1)=(Type=ST_FloatInput,MaxChars=4)
}