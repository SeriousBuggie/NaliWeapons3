//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////
class ExtrasHealthServerSettingsMenuPageInfo expands NWMenuPageInfo;

var() class<NWExtrasHealth> ExtrasHealthClass;

static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(default.ExtrasHealthClass.default.HealthPoints);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		default.ExtrasHealthClass.default.HealthPoints = Int(val);
	
	default.ExtrasHealthClass.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'ExtrasHealthAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	ExtrasHealthClass=Class'NWExtrasHealth'
	
	SettingsList(0)=(Description="Health amount")
	SettingsList(0)=(HelpTip="Amount of health")
	SettingsList(0)=(Type=ST_IntegerInput,MaxChars=5)
	SettingsList(0)=(BottomMargin=20.000000)
}
