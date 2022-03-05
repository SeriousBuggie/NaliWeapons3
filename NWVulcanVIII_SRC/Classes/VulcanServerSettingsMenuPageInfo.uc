//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////
class VulcanServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'Vulcan'.default.bAffectedByHeat);
	if (i == 1)
		return String(Class'Vulcan'.default.DrillHeatRework);
	if (i == 2)
		return String(Class'Vulcan'.default.DrillHeatUpRate);
	if (i == 3)
		return String(Class'Vulcan'.default.DrillHeatDownRate);
	if (i == 4)
		return String(Class'Vulcan'.default.RunningAimError);
	if (i == 5)
		return String(Class'Vulcan'.default.WalkingAimError);
	if (i == 6)
		return String(Class'Vulcan'.default.CrouchingAimError);
	if (i == 8)
		return String(Class'Vulcan'.default.enableOversurrection);
	if (i == 9)
		return String(Class'Vulcan'.default.OversurrectionLifeTime);
	if (i == 10)
		return String(Class'Vulcan'.default.OversurrectionProjSkyFireRate);
	if (i == 11)
		return String(Class'Vulcan'.default.OversurrectionProjSkyFireOdds);
	if (i == 12)
		return String(Class'Vulcan'.default.OversurrectionProjSkyFireMax);
	if (i == 13)
		return String(Class'Vulcan'.default.OversurrectionProjSkyFireDmg);
	if (i == 14)
		return String(Class'Vulcan'.default.OversurrectionProjSkyFireRadius);
	if (i == 15)
		return String(Class'Vulcan'.default.OversurrectionHProjSkyFireRate);
	if (i == 16)
		return String(Class'Vulcan'.default.OversurrectionHProjSkyFireOdds);
	if (i == 17)
		return String(Class'Vulcan'.default.OversurrectionHProjSkyFireMax);
	if (i == 18)
		return String(Class'Vulcan'.default.OversurrectionHProjSkyFireDmg);
	if (i == 19)
		return String(Class'Vulcan'.default.OversurrectionHProjSkyFireRadius);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'Vulcan'.default.bAffectedByHeat = Bool(val);
	else if (i == 1)
		Class'Vulcan'.default.DrillHeatRework = FMin(1.0, FMax(0.0, Float(val)));
	else if (i == 2)
		Class'Vulcan'.default.DrillHeatUpRate = Float(val);
	else if (i == 3)
		Class'Vulcan'.default.DrillHeatDownRate = Float(val);
	else if (i == 4)
		Class'Vulcan'.default.RunningAimError = Float(val);
	else if (i == 5)
		Class'Vulcan'.default.WalkingAimError = Float(val);
	else if (i == 6)
		Class'Vulcan'.default.CrouchingAimError = Float(val);
	else if (i == 8)
		Class'Vulcan'.default.enableOversurrection = Bool(val);
	else if (i == 9)
		Class'Vulcan'.default.OversurrectionLifeTime = Float(val);
	else if (i == 10)
		Class'Vulcan'.default.OversurrectionProjSkyFireRate = Float(val);
	else if (i == 11)
		Class'Vulcan'.default.OversurrectionProjSkyFireOdds = Float(val);
	else if (i == 12)
		Class'Vulcan'.default.OversurrectionProjSkyFireMax = Int(val);
	else if (i == 13)
		Class'Vulcan'.default.OversurrectionProjSkyFireDmg = Int(val);
	else if (i == 14)
		Class'Vulcan'.default.OversurrectionProjSkyFireRadius = Float(val);
	else if (i == 15)
		Class'Vulcan'.default.OversurrectionHProjSkyFireRate = Float(val);
	else if (i == 16)
		Class'Vulcan'.default.OversurrectionHProjSkyFireOdds = Float(val);
	else if (i == 17)
		Class'Vulcan'.default.OversurrectionHProjSkyFireMax = Int(val);
	else if (i == 18)
		Class'Vulcan'.default.OversurrectionHProjSkyFireDmg = Int(val);
	else if (i == 19)
		Class'Vulcan'.default.OversurrectionHProjSkyFireRadius = Float(val);
	
	Class'Vulcan'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'VulcanAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Enable overheating")
	SettingsList(0)=(HelpTip="Enable the need to cool down when using the primary fire for too long")
	SettingsList(0)=(Type=ST_Checkbox)

	SettingsList(1)=(Description="Re-usability temperature level")
	SettingsList(1)=(HelpTip="Max temperature level the weapon can be used again after overheating (from 0.0 to 1.0)")
	SettingsList(1)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(2)=(Description="Heat up rate")
	SettingsList(2)=(HelpTip="Heating up rate while the primary mode is being used")
	SettingsList(2)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(3)=(Description="Cool down rate")
	SettingsList(3)=(HelpTip="Cool down rate when the primary mode is not being used")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(4)=(Description="Aim error (running)")
	SettingsList(4)=(HelpTip="Fire aim max error margin while running")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(5)=(Description="Aim error (walking)")
	SettingsList(5)=(HelpTip="Fire aim max error margin while walking")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(6)=(Description="Aim error (crouching)")
	SettingsList(6)=(HelpTip="Fire aim max error margin while crouching")
	SettingsList(6)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(6)=(BottomMargin=20.000000)
	
	SettingsList(7)=(Description="Oversurrection:")
	SettingsList(7)=(HelpTip="Oversurrection settings")
	SettingsList(7)=(Type=ST_Label)
	
	SettingsList(8)=(Description="    Enable Oversurrection")
	SettingsList(8)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="    Life time")
	SettingsList(9)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(9)=(Type=ST_FloatInput,MaxChars=4)

	SettingsList(10)=(Description="    Flaming bullets rate")
	SettingsList(10)=(HelpTip="Oversurrection flaming bullets rate (in times per second)")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(11)=(Description="    Flaming bullets odds")
	SettingsList(11)=(HelpTip="Oversurrection flaming bullets odds (from 0.0 to 1.0)")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(12)=(Description="    Max flaming bullets per cycle")
	SettingsList(12)=(HelpTip="Oversurrection max flaming bullets per cycle")
	SettingsList(12)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(13)=(Description="    Flaming bullets damage")
	SettingsList(13)=(HelpTip="Oversurrection flaming bullets max damage")
	SettingsList(13)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(14)=(Description="    Flaming bullets damage radius")
	SettingsList(14)=(HelpTip="Oversurrection flaming bullets damage max radius")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(15)=(Description="    Heavy flaming rocks rate")
	SettingsList(15)=(HelpTip="Oversurrection heavy flaming rocks rate (in times per second)")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(16)=(Description="    Heavy flaming rocks odds")
	SettingsList(16)=(HelpTip="Oversurrection heavy flaming rocks odds (from 0.0 to 1.0)")
	SettingsList(16)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(17)=(Description="    Max heavy flaming rocks per cycle")
	SettingsList(17)=(HelpTip="Oversurrection max heavy flaming rocks per cycle")
	SettingsList(17)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(18)=(Description="    Heavy flaming rocks damage")
	SettingsList(18)=(HelpTip="Oversurrection heavy flaming rocks max damage")
	SettingsList(18)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(19)=(Description="    Heavy flaming rocks damage radius")
	SettingsList(19)=(HelpTip="Oversurrection heavy flaming rocks damage max radius")
	SettingsList(19)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(19)=(BottomMargin=20.000000)
}
