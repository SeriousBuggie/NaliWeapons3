//////////////////////////////////////////////////////////////
//				Feralidragon (17-09-2012)
//
// NW3 INFRARED PRECISION RIFLE 1.00
//////////////////////////////////////////////////////////////
class IRPRServerSettingsMenuPageInfo expands NWMenuPageInfo;

var() localized string LaserColorType[4];


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'IRPR'.default.enableWallThroughZoom);
	if (i == 1)
		return String(Class'IRPR'.default.enableScopeTeamMarkers);
	if (i == 2)
		return String(Class'IRPR'.default.enableScopeEnemyMarkers);
	if (i == 3)
		return String(Class'IRPR'.default.enableScopeFriendlyMarkers);
	if (i == 4)
		return String(Class'IRPR'.default.bPlayersAlwaysRelevant);
	if (i == 5)
		return String(Class'IRPR'.default.bReduceDamageByWallthrough);
	if (i == 6)
		return String(Class'IRPR'.default.MaxWallthroughPrecision);
	if (i == 7)
		return String(Class'IRPR'.default.MaxWallthroughDepth);
	if (i == 8)
		return String(Class'IRPR'.default.MaxWallthroughShots);
	if (i == 9)
		return String(Class'IRPR'.default.HeadShotDmg);
	if (i == 10)
		return String(Class'IRPR'.default.ZoomInViewRange);
	if (i == 11)
		return String(Class'IRPR'.default.ZoomOutViewRange);
	if (i == 12)
		return String(Class'IRPR'.default.enableTeamColoredLaser);
	if (i == 13)
		return String(Class'IRPR'.default.bAlwaysTeamColoredLaser);
	if (i == 15)
		return String(Class'IRPR'.default.enableZoomIR);
	if (i == 16)
		return String(Class'IRPR'.default.enableZoomGreenIRGlass);
	if (i == 17)
		return String(Class'IRPR'.default.enableTraceBeam);
	if (i == 19)
		return String(Class'IRPR'.default.enableOversurrection);
	if (i == 20)
		return String(Class'IRPR'.default.OversurrectionLifeTime);
	if (i == 21)
		return String(Class'IRPR'.default.OversurrectionTurretRotRate);
	if (i == 22)
		return String(Class'IRPR'.default.OversurrectionFireCycleRate);
	if (i == 23)
		return String(Class'IRPR'.default.OversurrectionLaserPrepareTime);
	if (i == 24)
		return String(Class'IRPR'.default.OversurrectionLaserCooldownTime);
	if (i == 25)
		return String(Class'IRPR'.default.OversurrectionLaserFireMaxTime);
	if (i == 26)
		return String(Class'IRPR'.default.OversurrectionScanEnemiesRadius);
	if (i == 27)
		return String(Class'IRPR'.default.OversurrectionRangedEnemiesPeriph);
	if (i == 28)
		return String(Class'IRPR'.default.OversurrectionAttackMinPeriph);
	if (i == 29)
		return String(Class'IRPR'.default.OversurrectionLaserDamage);
	if (i == 30)
		return String(Class'IRPR'.default.OversurrectionMaxWTTraces);
	if (i == 31)
		return String(Class'IRPR'.default.OversurrectionMaxWTTracePrecision);
	if (i == 32)
		return String(Class'IRPR'.default.OversurrectionMaxTraceRange);
	if (i == 33)
		return String(Class'IRPR'.default.OversurrectionMaxWTTraceDepth);
	if (i == 34)
		return String(Class'IRPR'.default.OversurrectionStopFireOdds);		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'IRPR'.default.enableWallThroughZoom = Bool(val);
	else if (i == 1)
		Class'IRPR'.default.enableScopeTeamMarkers = Bool(val);
	else if (i == 2)
		Class'IRPR'.default.enableScopeEnemyMarkers = Bool(val);
	else if (i == 3)
		Class'IRPR'.default.enableScopeFriendlyMarkers = Bool(val);
	else if (i == 4)
		Class'IRPR'.default.bPlayersAlwaysRelevant = Bool(val);
	else if (i == 5)
		Class'IRPR'.default.bReduceDamageByWallthrough = Bool(val);
	else if (i == 6)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		Class'IRPR'.default.MaxWallthroughPrecision = Byte(val);
	}
	else if (i == 7)
		Class'IRPR'.default.MaxWallthroughDepth = Float(val);
	else if (i == 8)
		Class'IRPR'.default.MaxWallthroughShots = Int(val);
	else if (i == 9)
		Class'IRPR'.default.HeadShotDmg = Int(val);
	else if (i == 10)
		Class'IRPR'.default.ZoomInViewRange = Float(val);
	else if (i == 11)
		Class'IRPR'.default.ZoomOutViewRange = Float(val);
	else if (i == 12)
		Class'IRPR'.default.enableTeamColoredLaser = Bool(val);
	else if (i == 13)
		Class'IRPR'.default.bAlwaysTeamColoredLaser = Bool(val);
	else if (i == 15)
		Class'IRPR'.default.enableZoomIR = Bool(val);
	else if (i == 16)
		Class'IRPR'.default.enableZoomGreenIRGlass = Bool(val);
	else if (i == 17)
		Class'IRPR'.default.enableTraceBeam = Bool(val);
	else if (i == 19)
		Class'IRPR'.default.enableOversurrection = Bool(val);
	else if (i == 20)
		Class'IRPR'.default.OversurrectionLifeTime = Float(val);
	else if (i == 21)
		Class'IRPR'.default.OversurrectionTurretRotRate = Float(val);
	else if (i == 22)
		Class'IRPR'.default.OversurrectionFireCycleRate = Float(val);
	else if (i == 23)
		Class'IRPR'.default.OversurrectionLaserPrepareTime = Float(val);
	else if (i == 24)
		Class'IRPR'.default.OversurrectionLaserCooldownTime = Float(val);
	else if (i == 25)
		Class'IRPR'.default.OversurrectionLaserFireMaxTime = Float(val);
	else if (i == 26)
		Class'IRPR'.default.OversurrectionScanEnemiesRadius = Float(val);
	else if (i == 27)
		Class'IRPR'.default.OversurrectionRangedEnemiesPeriph = Float(val);
	else if (i == 28)
		Class'IRPR'.default.OversurrectionAttackMinPeriph = Float(val);
	else if (i == 29)
		Class'IRPR'.default.OversurrectionLaserDamage = Int(val);
	else if (i == 30)
		Class'IRPR'.default.OversurrectionMaxWTTraces = Int(val);
	else if (i == 31)
		Class'IRPR'.default.OversurrectionMaxWTTracePrecision = Int(val);
	else if (i == 32)
		Class'IRPR'.default.OversurrectionMaxTraceRange = Float(val);
	else if (i == 33)
		Class'IRPR'.default.OversurrectionMaxWTTraceDepth = Float(val);
	else if (i == 34)
		Class'IRPR'.default.OversurrectionStopFireOdds = Float(val);

	Class'IRPR'.static.StaticSaveConfig();
	return val;
}


//Combo
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
local byte n;

	if (i == 14)
	{
		n = Class'IRPR'.default.defaultLaserColor;
		if (n < ArrayCount(default.LaserColorType))
		{
			val1 = default.LaserColorType[n];
			val2 = String(n);
			return;
		}
	}
	
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if (i == 14 && listIndex < ArrayCount(default.LaserColorType))
	{
		val1 = default.LaserColorType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	if (i == 14)
		Class'IRPR'.default.defaultLaserColor = Class'IRPR'.static.GetELaserColorFromByte(Byte(val2));

	Class'IRPR'.static.StaticSaveConfig();
	return val2;
}



defaultproperties
{
	ModMenuInfoClass=Class'IRPRAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Enable wall through zoom")
	SettingsList(0)=(HelpTip="Enable ability to see players through walls using zoom")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Add markers on teammates on zoom")
	SettingsList(1)=(HelpTip="Enable HUD markers rendering on teammates while using zoom")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Add markers on enemies on zoom")
	SettingsList(2)=(HelpTip="Enable HUD markers rendering on enemies while using zoom")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Add markers on friends on zoom")
	SettingsList(3)=(HelpTip="Enable HUD markers rendering on friends while using zoom")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Enable players full online relevancy")
	SettingsList(4)=(HelpTip="Set bAlwaysRelevant=True in all players.%n%This works as a fix to see through walls with zoom properly during online play,%n%but may increase server bandwidth usage. Enable at your own risk.")
	SettingsList(4)=(Type=ST_Checkbox)
	SettingsList(4)=(BottomMargin=20.000000)
	
	SettingsList(5)=(Description="Reduce damage by wall perforation")
	SettingsList(5)=(HelpTip="Reduce shot damage by the amount of wall mass the laser had to pass through")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Wall perforation precision")
	SettingsList(6)=(HelpTip="Max wall perforation precision through multiple seperate walls")
	SettingsList(6)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(7)=(Description="Wall perforation max depth")
	SettingsList(7)=(HelpTip="Max wall thickness to fully perforate through")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(8)=(Description="Max number of perforated walls")
	SettingsList(8)=(HelpTip="Max amount of single walls to perforate through")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=5)
	
	SettingsList(9)=(Description="Headshot damage")
	SettingsList(9)=(HelpTip="Headshot max damage")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(10)=(Description="Zoom heat max range (through walls)")
	SettingsList(10)=(HelpTip="Zoom heat rendering max radius through walls")
	SettingsList(10)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(11)=(Description="Zoom heat max range (direct view)")
	SettingsList(11)=(HelpTip="Zoom heat rendering max radius in direct view")
	SettingsList(11)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(11)=(BottomMargin=20.000000)
	
	SettingsList(12)=(Description="Enable laser team based color")
	SettingsList(12)=(HelpTip="Enable laser to assume the color of its shooter team")
	SettingsList(12)=(Type=ST_Checkbox)
	
	SettingsList(13)=(Description="Always enable laser team based color")
	SettingsList(13)=(HelpTip="Enable laser to assume the color of its shooter team, even in non team games")
	SettingsList(13)=(Type=ST_Checkbox)
	
	SettingsList(14)=(Description="Laser default color")
	SettingsList(14)=(HelpTip="Laser default color when team colors are not enabled")
	SettingsList(14)=(Type=ST_Combo)
	SettingsList(14)=(BottomMargin=20.000000)
	LaserColorType(0)="Red"
	LaserColorType(1)="Blue"
	LaserColorType(2)="Green"
	LaserColorType(3)="Yellow"
	
	SettingsList(15)=(Description="Enable IR zoom")
	SettingsList(15)=(HelpTip="Enable infrared zoom")
	SettingsList(15)=(Type=ST_Checkbox)
	
	SettingsList(16)=(Description="Enable zoom green scope")
	SettingsList(16)=(HelpTip="Enable zoom green colored scope overlay")
	SettingsList(16)=(Type=ST_Checkbox)
	
	SettingsList(17)=(Description="Enable trace beam")
	SettingsList(17)=(HelpTip="Enable the firing trace laser beam")
	SettingsList(17)=(Type=ST_Checkbox)
	SettingsList(17)=(BottomMargin=20.000000)
	
	SettingsList(18)=(Description="Oversurrection:")
	SettingsList(18)=(HelpTip="Oversurrection settings")
	SettingsList(18)=(Type=ST_Label)
	
	SettingsList(19)=(Description="    Enable Oversurrection")
	SettingsList(19)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(19)=(Type=ST_Checkbox)
	
	SettingsList(20)=(Description="    Life time")
	SettingsList(20)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(20)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(21)=(Description="    Turret rotation rate")
	SettingsList(21)=(HelpTip="Oversurrection turret rotation rate (in rotation units per second)")
	SettingsList(21)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(22)=(Description="    Fire cycle rate")
	SettingsList(22)=(HelpTip="Oversurrection batch firing rate (in times per second)")
	SettingsList(22)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(23)=(Description="    Laser load up time")
	SettingsList(23)=(HelpTip="Oversurrection laser load up time before fire (in seconds)")
	SettingsList(23)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(24)=(Description="    Laser cool down time")
	SettingsList(24)=(HelpTip="Oversurrection laser cool down time after fire (in seconds)")
	SettingsList(24)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(25)=(Description="    Laser firing max time")
	SettingsList(25)=(HelpTip="Oversurrection laser max continuous firing time (in seconds)")
	SettingsList(25)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(26)=(Description="    Enemies scan radius")
	SettingsList(26)=(HelpTip="Oversurrection scan for enemies max radius")
	SettingsList(26)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(27)=(Description="    Enemies detecting peripheral range")
	SettingsList(27)=(HelpTip="Oversurrection min peripheral range to detect enemies (from 0.0 to 1.0)")
	SettingsList(27)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(28)=(Description="    Enemies attack peripheral range")
	SettingsList(28)=(HelpTip="Oversurrection min peripheral range to attack enemies (from 0.0 to 1.0)")
	SettingsList(28)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(29)=(Description="    Laser damage")
	SettingsList(29)=(HelpTip="Oversurrection laser damage")
	SettingsList(29)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(30)=(Description="    Max number of perforated walls")
	SettingsList(30)=(HelpTip="Oversurrection laser max amount of single walls to perforate through")
	SettingsList(30)=(Type=ST_IntegerInput,MaxChars=5)
	
	SettingsList(31)=(Description="    Wall perforation precision")
	SettingsList(31)=(HelpTip="Oversurrection laser max wall perforation precision through multiple separate walls")
	SettingsList(31)=(Type=ST_IntegerInput,MaxChars=3)

	SettingsList(32)=(Description="    Laser max range")
	SettingsList(32)=(HelpTip="Oversurrection laser trace max distance")
	SettingsList(32)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(33)=(Description="    Wall perforation max depth")
	SettingsList(33)=(HelpTip="Oversurrection laser max wall thickness to fully perforate through")
	SettingsList(33)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(34)=(Description="    Laser stop fire odds")
	SettingsList(34)=(HelpTip="Oversurrection odds to stop firing the laser when there are no more enemies left (from 0.0 to 1.0)")
	SettingsList(34)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(34)=(BottomMargin=20.000000)
}
