//////////////////////////////////////////////////////////////
//				Feralidragon (25-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////
class IonizerServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'Ionizer'.default.enableSatLights);
	if (i == 1)
		return String(Class'Ionizer'.default.SatelliteIsInvincible);
	if (i == 2)
		return String(Class'Ionizer'.default.SatelliteAIAwareness);
	if (i == 3)
		return String(Class'Ionizer'.default.SatelliteArmor);
	if (i == 4)
		return String(Class'Ionizer'.default.SatelliteLaunchSeconds);
	if (i == 5)
		return String(Class'Ionizer'.default.RocketTakeoffIgnitionDamage);
	if (i == 6)
		return String(Class'Ionizer'.default.PaintTime);
	if (i == 7)
		return String(Class'Ionizer'.default.MaxAttackDistance);
	if (i == 8)
		return String(Class'Ionizer'.default.ZoomScanRadius);
	if (i == 9)
		return String(Class'Ionizer'.default.MinSatelliteHeight);
	if (i == 10)
		return String(Class'Ionizer'.default.MaxSatelliteHeight);
	if (i == 11)
		return String(Class'Ionizer'.default.MaxSatelliteDeployDist);
	if (i == 12)
		return String(Class'Ionizer'.default.LauncherLifespan);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'Ionizer'.default.enableSatLights = Bool(val);
	else if (i == 1)
		Class'Ionizer'.default.SatelliteIsInvincible = Bool(val);
	else if (i == 2)
		Class'Ionizer'.default.SatelliteAIAwareness = Bool(val);
	else if (i == 3)
		Class'Ionizer'.default.SatelliteArmor = Int(val);
	else if (i == 4)
		Class'Ionizer'.default.SatelliteLaunchSeconds = Int(val);
	else if (i == 5)
		Class'Ionizer'.default.RocketTakeoffIgnitionDamage = Int(val);
	else if (i == 6)
		Class'Ionizer'.default.PaintTime = Float(val);
	else if (i == 7)
		Class'Ionizer'.default.MaxAttackDistance = Float(val);
	else if (i == 8)
		Class'Ionizer'.default.ZoomScanRadius = Float(val);
	else if (i == 9)
		Class'Ionizer'.default.MinSatelliteHeight = Float(val);
	else if (i == 10)
		Class'Ionizer'.default.MaxSatelliteHeight = Float(val);
	else if (i == 11)
		Class'Ionizer'.default.MaxSatelliteDeployDist = Float(val);
	else if (i == 12)
		Class'Ionizer'.default.LauncherLifespan = Float(val);
	
	Class'Ionizer'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'IonizerAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Enable satellite lights")
	SettingsList(0)=(HelpTip="Enable signaling team colored lights on satellites")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Enable satellite invicibility")
	SettingsList(1)=(HelpTip="Make satellite immune to any sort of damage")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Enable satellite AI awareness")
	SettingsList(2)=(HelpTip="Enable ability for bots and monsters to spot a satellite and attempt to attack it if possible at all")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Satellite armor")
	SettingsList(3)=(HelpTip="Amount of damage a satellite has to receive in order to be destroyed")
	SettingsList(3)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(4)=(Description="Satellite launch countdown")
	SettingsList(4)=(HelpTip="Satellite launch countdown after station deployment (in seconds)")
	SettingsList(4)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(5)=(Description="Satellite rocket ignition damage")
	SettingsList(5)=(HelpTip="Max amount of damage given near by the satellite rocket on take-off")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(5)=(BottomMargin=20.000000)

	SettingsList(6)=(Description="Paint time")
	SettingsList(6)=(HelpTip="Time needed to mark the point the satellite will attack (in seconds)")
	SettingsList(6)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(7)=(Description="Max attack distance")
	SettingsList(7)=(HelpTip="Max distance from the owner and marked attack point")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(8)=(Description="Zoom scan range")
	SettingsList(8)=(HelpTip="Max radius from the owner in which the zoom is able to identify targets")
	SettingsList(8)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(9)=(Description="Min satellite launch height")
	SettingsList(9)=(HelpTip="Min allowed height from the floor to be able to launch and deploy the satellite")
	SettingsList(9)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(10)=(Description="Max satellite launch distance")
	SettingsList(10)=(HelpTip="Max allowed distance the rocket may travel to deploy the satellite")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(11)=(Description="Max station deploy distance")
	SettingsList(11)=(HelpTip="Max allowed distance to deploy the launch station")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(12)=(Description="Launch station lifespan")
	SettingsList(12)=(HelpTip="Time until the launch station disappears after satellite deployment")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(12)=(BottomMargin=20.000000)
}
