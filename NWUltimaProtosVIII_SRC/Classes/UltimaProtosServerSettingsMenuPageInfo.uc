//////////////////////////////////////////////////////////////
//				Feralidragon (26-09-2012)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////
class UltimaProtosServerSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'UltimaProtos'.default.LightningsDamage);
	if (i == 1)
		return String(Class'UltimaProtos'.default.PassthroughDamage);
	if (i == 3)
		return String(Class'UltimaProtos'.default.enableOversurrection);
	if (i == 4)
		return String(Class'UltimaProtos'.default.OversurrectionGameFinisher);
	if (i == 5)
		return String(Class'UltimaProtos'.default.OversurrectionSolarBirthCoreDmg);
	if (i == 6)
		return String(Class'UltimaProtos'.default.OversurrectionSolarMatureCoreDmg);
	if (i == 7)
		return String(Class'UltimaProtos'.default.OversurrectionSolarSystemCoreDmg);
	if (i == 8)
		return String(Class'UltimaProtos'.default.OversurrectionSolarRedGiantCoreDmg);
	if (i == 9)
		return String(Class'UltimaProtos'.default.OversurrectionSolarWhiteDwarfCoreDmg);
	if (i == 10)
		return String(Class'UltimaProtos'.default.OversurrectionSolarMatureRadialMaxDmg);
	if (i == 11)
		return String(Class'UltimaProtos'.default.OversurrectionSolarSystemRadialMaxDmg);
	if (i == 12)
		return String(Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialMaxDmg);
	if (i == 13)
		return String(Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmg);
	if (i == 14)
		return String(Class'UltimaProtos'.default.OversurrectionSolarMatureRadialDmgRadius);
	if (i == 15)
		return String(Class'UltimaProtos'.default.OversurrectionSolarSystemRadialDmgRadius);
	if (i == 16)
		return String(Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialDmgRadius);
	if (i == 17)
		return String(Class'UltimaProtos'.default.OversurrectionSolarCoreDmgRate);
	if (i == 18)
		return String(Class'UltimaProtos'.default.OversurrectionSolarRadialDmgRate);
	if (i == 19)
		return String(Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmgRate);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'UltimaProtos'.default.LightningsDamage = Int(val);
	else if (i == 1)
		Class'UltimaProtos'.default.PassthroughDamage = Int(val);
	else if (i == 3)
		Class'UltimaProtos'.default.enableOversurrection = Bool(val);
	else if (i == 4)
		Class'UltimaProtos'.default.OversurrectionGameFinisher = Bool(val);
	else if (i == 5)
		Class'UltimaProtos'.default.OversurrectionSolarBirthCoreDmg = Int(val);
	else if (i == 6)
		Class'UltimaProtos'.default.OversurrectionSolarMatureCoreDmg = Int(val);
	else if (i == 7)
		Class'UltimaProtos'.default.OversurrectionSolarSystemCoreDmg = Int(val);
	else if (i == 8)
		Class'UltimaProtos'.default.OversurrectionSolarRedGiantCoreDmg = Int(val);
	else if (i == 9)
		Class'UltimaProtos'.default.OversurrectionSolarWhiteDwarfCoreDmg = Int(val);
	else if (i == 10)
		Class'UltimaProtos'.default.OversurrectionSolarMatureRadialMaxDmg = Int(val);
	else if (i == 11)
		Class'UltimaProtos'.default.OversurrectionSolarSystemRadialMaxDmg = Int(val);
	else if (i == 12)
		Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialMaxDmg = Int(val);
	else if (i == 13)
		Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmg = Int(val);
	else if (i == 14)
		Class'UltimaProtos'.default.OversurrectionSolarMatureRadialDmgRadius = Float(val);
	else if (i == 15)
		Class'UltimaProtos'.default.OversurrectionSolarSystemRadialDmgRadius = Float(val);
	else if (i == 16)
		Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialDmgRadius = Float(val);
	else if (i == 17)
		Class'UltimaProtos'.default.OversurrectionSolarCoreDmgRate = Float(val);
	else if (i == 18)
		Class'UltimaProtos'.default.OversurrectionSolarRadialDmgRate = Float(val);
	else if (i == 19)
		Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmgRate = Float(val);
	Class'UltimaProtos'.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'UltimaProtosAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Lightnings damage")
	SettingsList(0)=(HelpTip="Projectile lightnings hit damage")
	SettingsList(0)=(Type=ST_IntegerInput,MaxChars=6)

	SettingsList(1)=(Description="Passthrough damage")
	SettingsList(1)=(HelpTip="Projectile passthrough max damage")
	SettingsList(1)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(1)=(BottomMargin=20.000000)
	
	SettingsList(2)=(Description="Oversurrection:")
	SettingsList(2)=(HelpTip="Oversurrection settings")
	SettingsList(2)=(Type=ST_Label)
	
	SettingsList(3)=(Description="    Enable Oversurrection")
	SettingsList(3)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="    Game finisher")
	SettingsList(4)=(HelpTip="Treat this oversurrection as a game finisher (whoever uses it, wins the match)")
	SettingsList(4)=(Type=ST_Checkbox)
	SettingsList(4)=(BottomMargin=10.000000)
	
	SettingsList(5)=(Description="    Solar Birth core damage")
	SettingsList(5)=(HelpTip="Solar core damage during its birth phase")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(6)=(Description="    Solar Mature core damage")
	SettingsList(6)=(HelpTip="Solar core damage during its mature phase")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(7)=(Description="    Solar System core damage")
	SettingsList(7)=(HelpTip="Solar core damage during its system phase")
	SettingsList(7)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(8)=(Description="    Solar Red Giant core damage")
	SettingsList(8)=(HelpTip="Solar core damage during its red giant phase")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(9)=(Description="    Solar White Dwarf core damage")
	SettingsList(9)=(HelpTip="Solar core damage during its white dwarf phase")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=8)
	SettingsList(9)=(BottomMargin=10.000000)
	
	SettingsList(10)=(Description="    Solar Mature radial damage")
	SettingsList(10)=(HelpTip="Solar radial max damage during its mature phase")
	SettingsList(10)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(11)=(Description="    Solar System radial damage")
	SettingsList(11)=(HelpTip="Solar radial max damage during its system phase")
	SettingsList(11)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(12)=(Description="    Solar Red Giant radial damage")
	SettingsList(12)=(HelpTip="Solar radial max damage during its red giant phase")
	SettingsList(12)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(13)=(Description="    Solar Supernova damage")
	SettingsList(13)=(HelpTip="Solar full scale damage during its supernova phase")
	SettingsList(13)=(Type=ST_IntegerInput,MaxChars=8)
	SettingsList(13)=(BottomMargin=10.000000)
	
	SettingsList(14)=(Description="    Solar Mature radial damage radius")
	SettingsList(14)=(HelpTip="Solar radial max damage radius during its mature phase")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(15)=(Description="    Solar System radial damage radius")
	SettingsList(15)=(HelpTip="Solar radial max damage radius during its system phase")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(16)=(Description="    Solar Red Giant radial damage radius")
	SettingsList(16)=(HelpTip="Solar radial max damage radius during its red giant phase")
	SettingsList(16)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(17)=(Description="    Solar core damage rate")
	SettingsList(17)=(HelpTip="Solar core damage rate (in times per second)")
	SettingsList(17)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(18)=(Description="    Solar radial damage rate")
	SettingsList(18)=(HelpTip="Solar radial damage rate (in times per second)")
	SettingsList(18)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(19)=(Description="    Solar Supernova damage rate")
	SettingsList(19)=(HelpTip="Solar supernova damage rate (in times per second)")
	SettingsList(19)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(19)=(BottomMargin=20.000000)
}
