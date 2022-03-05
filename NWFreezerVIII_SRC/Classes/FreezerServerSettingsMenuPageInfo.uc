//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////
class FreezerServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'Freezer'.default.bSinkIceBase);
	if (i == 1)
		return String(Class'Freezer'.default.bStaticIceBase);
	if (i == 2)
		return String(Class'Freezer'.default.IceBaseStrength);
	if (i == 4)
		return String(Class'Freezer'.default.enableOversurrection);
	if (i == 5)
		return String(Class'Freezer'.default.OversurrectionLifeTime);
	if (i == 6)
		return String(Class'Freezer'.default.OversurrectionCrystRate);
	if (i == 7)
		return String(Class'Freezer'.default.OversurrectionCrystMinDist);
	if (i == 8)
		return String(Class'Freezer'.default.OversurrectionCrystMaxDist);
	if (i == 9)
		return String(Class'Freezer'.default.OversurrectionCrystMaxAmount);
	if (i == 10)
		return String(Class'Freezer'.default.OversurrectionIceSpreadLifeTime);
	if (i == 11)
		return String(Class'Freezer'.default.OversurrectionFreezingDmg);
	if (i == 12)
		return String(Class'Freezer'.default.OversurrectionFreezingDmgRate);
	if (i == 13)
		return String(Class'Freezer'.default.OversurrectionFreezingDmgRadius);
	if (i == 14)
		return String(Class'Freezer'.default.OversurrectionImpaleOdds);
	if (i == 15)
		return String(Class'Freezer'.default.OversurrectionImpaleMaxHeight);
	if (i == 16)
		return String(Class'Freezer'.default.OversurrectionImpaleDmg);
	if (i == 17)
		return String(Class'Freezer'.default.OversurrectionRIImpaleOdds);
	if (i == 18)
		return String(Class'Freezer'.default.OversurrectionRIImpaleRate);
	if (i == 19)
		return String(Class'Freezer'.default.OversurrectionRIImpaleMinHeight);
	if (i == 20)
		return String(Class'Freezer'.default.OversurrectionRIImpaleMaxHeight);
	if (i == 21)
		return String(Class'Freezer'.default.OversurrectionRIImpaleMinAmount);
	if (i == 22)
		return String(Class'Freezer'.default.OversurrectionRIImpaleMaxAmount);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'Freezer'.default.bSinkIceBase = Bool(val);
	else if (i == 1)
		Class'Freezer'.default.bStaticIceBase = Bool(val);
	else if (i == 2)
		Class'Freezer'.default.IceBaseStrength = Int(val);
	else if (i == 4)
		Class'Freezer'.default.enableOversurrection = Bool(val);
	else if (i == 5)
		Class'Freezer'.default.OversurrectionLifeTime = Float(val);
	else if (i == 6)
		Class'Freezer'.default.OversurrectionCrystRate = Float(val);
	else if (i == 7)
		Class'Freezer'.default.OversurrectionCrystMinDist = Float(val);
	else if (i == 8)
		Class'Freezer'.default.OversurrectionCrystMaxDist = Float(val);
	else if (i == 9)
		Class'Freezer'.default.OversurrectionCrystMaxAmount = Int(val);
	else if (i == 10)
		Class'Freezer'.default.OversurrectionIceSpreadLifeTime = Float(val);
	else if (i == 11)
		Class'Freezer'.default.OversurrectionFreezingDmg = Int(val);
	else if (i == 12)
		Class'Freezer'.default.OversurrectionFreezingDmgRate = Float(val);
	else if (i == 13)
		Class'Freezer'.default.OversurrectionFreezingDmgRadius = Float(val);
	else if (i == 14)
		Class'Freezer'.default.OversurrectionImpaleOdds = Float(val);
	else if (i == 15)
		Class'Freezer'.default.OversurrectionImpaleMaxHeight = Float(val);
	else if (i == 16)
		Class'Freezer'.default.OversurrectionImpaleDmg = Int(val);
	else if (i == 17)
		Class'Freezer'.default.OversurrectionRIImpaleOdds = Float(val);
	else if (i == 18)
		Class'Freezer'.default.OversurrectionRIImpaleRate = Float(val);
	else if (i == 19)
		Class'Freezer'.default.OversurrectionRIImpaleMinHeight = Float(val);
	else if (i == 20)
		Class'Freezer'.default.OversurrectionRIImpaleMaxHeight = Float(val);
	else if (i == 21)
		Class'Freezer'.default.OversurrectionRIImpaleMinAmount = Int(val);
	else if (i == 22)
		Class'Freezer'.default.OversurrectionRIImpaleMaxAmount = Int(val);
	
	Class'Freezer'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'FreezerAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Sinkable ice base")
	SettingsList(0)=(HelpTip="Make the ice base sink when having extra weight on top of it, like a player or other")
	SettingsList(0)=(Type=ST_Checkbox)

	SettingsList(1)=(Description="Static ice base")
	SettingsList(1)=(HelpTip="Fully static, stopped and unmovable ice base")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Ice base strength")
	SettingsList(2)=(HelpTip="Amount of damage needed to destroy an ice base")
	SettingsList(2)=(Type=ST_IntegerInput,MaxChars=5)
	SettingsList(2)=(BottomMargin=20.000000)
	
	SettingsList(3)=(Description="Oversurrection:")
	SettingsList(3)=(HelpTip="Oversurrection settings")
	SettingsList(3)=(Type=ST_Label)
	
	SettingsList(4)=(Description="    Enable Oversurrection")
	SettingsList(4)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="    Life time")
	SettingsList(5)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(6)=(Description="    Crystallization rate")
	SettingsList(6)=(HelpTip="Oversurrection crystallization rate (in times per second)")
	SettingsList(6)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(7)=(Description="    Crystallization min distance")
	SettingsList(7)=(HelpTip="Oversurrection crystallization min distance")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(8)=(Description="    Crystallization max distance")
	SettingsList(8)=(HelpTip="Oversurrection crystallization max distance")
	SettingsList(8)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(9)=(Description="    Crystallization max amount")
	SettingsList(9)=(HelpTip="Oversurrection max amount of generated crystals per update")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(10)=(Description="    Crystals life time")
	SettingsList(10)=(HelpTip="Oversurrection crystals max life time (in seconds)")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(11)=(Description="    Crystal freezing damage")
	SettingsList(11)=(HelpTip="Oversurrection crystals freezing damage")
	SettingsList(11)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(12)=(Description="    Crystal freezing damage rate")
	SettingsList(12)=(HelpTip="Oversurrection crystals freezing damage rate (in times per second)")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(13)=(Description="    Crystalization freezing damage radius")
	SettingsList(13)=(HelpTip="Oversurrection freezing damage radius")
	SettingsList(13)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(14)=(Description="    Precise impalement odds")
	SettingsList(14)=(HelpTip="Oversurrection precise pawn impalement odds (0.0 to 1.0)")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(15)=(Description="    Precise impalement max height")
	SettingsList(15)=(HelpTip="Oversurrection precise pawn impalement max height")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(16)=(Description="    Impalement damage")
	SettingsList(16)=(HelpTip="Oversurrection impalement damage")
	SettingsList(16)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(17)=(Description="    Random impalement odds")
	SettingsList(17)=(HelpTip="Oversurrection random impalement odds (0.0 to 1.0)")
	SettingsList(17)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(18)=(Description="    Random impalement rate")
	SettingsList(18)=(HelpTip="Oversurrection random impalement rate (in times per second)")
	SettingsList(18)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(19)=(Description="    Random impalement min height")
	SettingsList(19)=(HelpTip="Oversurrection random impalement min height")
	SettingsList(19)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(20)=(Description="    Random impalement max height")
	SettingsList(20)=(HelpTip="Oversurrection random impalement max height")
	SettingsList(20)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(21)=(Description="    Random impalement min amount")
	SettingsList(21)=(HelpTip="Oversurrection min amount of randomly generated impalements")
	SettingsList(21)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(22)=(Description="    Random impalement max amount")
	SettingsList(22)=(HelpTip="Oversurrection max amount of randomly generated impalements")
	SettingsList(22)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(22)=(BottomMargin=20.000000)
}
