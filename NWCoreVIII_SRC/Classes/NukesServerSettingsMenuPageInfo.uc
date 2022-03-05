//////////////////////////////////////////////////////////////
//				Feralidragon (28-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NukesServerSettingsMenuPageInfo expands NWMenuPageInfo;

var() class<NuclearExplosions> NukeExplClass;
var() localized string RadialDmgType[4];


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(default.NukeExplClass.default.enableVisibleShockwave);
	if (i == 1)
		return String(default.NukeExplClass.default.bSpawnExtraShockFX);
	if (i == 2)
		return String(default.NukeExplClass.default.bUseIndexedOptimization);
	if (i == 3)
		return String(default.NukeExplClass.default.ignoreStaticObjects);
	if (i == 4)
		return String(default.NukeExplClass.default.ignoreFriends);
	if (i == 5)
		return String(default.NukeExplClass.default.ignoreInstigator);
	if (i == 6)
		return String(default.NukeExplClass.default.ignoreDecoration);
	if (i == 7)
		return String(default.NukeExplClass.default.ignoreProjectiles);
	if (i == 8)
		return String(default.NukeExplClass.default.ignoreTriggers);
	if (i == 9)
		return String(default.NukeExplClass.default.ExtraShockFXAmount);
	if (i == 12)
		return String(default.NukeExplClass.default.ShockwaveBaseDamage);
	if (i == 13)
		return String(default.NukeExplClass.default.NucleusBaseDamage);
	if (i == 14)
		return String(default.NukeExplClass.default.ShockwaveDmgUpdateTime);
	if (i == 15)
		return String(default.NukeExplClass.default.NucleusDmgUpdateTime);
	if (i == 16)
		return String(default.NukeExplClass.default.ShockwaveDmgTransparencyDist);
	if (i == 17)
		return String(default.NukeExplClass.default.NucleusDmgTransparencyDist);
	if (i == 18)
		return String(default.NukeExplClass.default.ShockwaveMufflingFactor);
	if (i == 19)
		return String(default.NukeExplClass.default.NucleusMufflingFactor);
	if (i == 20)
		return String(default.NukeExplClass.default.bDamageActors);
		
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		default.NukeExplClass.default.enableVisibleShockwave = Bool(val);
	else if (i == 1)
		default.NukeExplClass.default.bSpawnExtraShockFX = Bool(val);
	else if (i == 2)
		default.NukeExplClass.default.bUseIndexedOptimization = Bool(val);
	else if (i == 3)
		default.NukeExplClass.default.ignoreStaticObjects = Bool(val);
	else if (i == 4)
		default.NukeExplClass.default.ignoreFriends = Bool(val);
	else if (i == 5)
		default.NukeExplClass.default.ignoreInstigator = Bool(val);
	else if (i == 6)
		default.NukeExplClass.default.ignoreDecoration = Bool(val);
	else if (i == 7)
		default.NukeExplClass.default.ignoreProjectiles = Bool(val);
	else if (i == 8)
		default.NukeExplClass.default.ignoreTriggers = Bool(val);
	else if (i == 9)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		default.NukeExplClass.default.ExtraShockFXAmount = Byte(val);
	}
	else if (i == 12)
		default.NukeExplClass.default.ShockwaveBaseDamage = Int(val);
	else if (i == 13)
		default.NukeExplClass.default.NucleusBaseDamage = Int(val);
	else if (i == 14)
		default.NukeExplClass.default.ShockwaveDmgUpdateTime = Float(val);
	else if (i == 15)
		default.NukeExplClass.default.NucleusDmgUpdateTime = Float(val);
	else if (i == 16)
		default.NukeExplClass.default.ShockwaveDmgTransparencyDist = Float(val);
	else if (i == 17)
		default.NukeExplClass.default.NucleusDmgTransparencyDist = Float(val);
	else if (i == 18)
		default.NukeExplClass.default.ShockwaveMufflingFactor = Float(val);
	else if (i == 19)
		default.NukeExplClass.default.NucleusMufflingFactor = Float(val);
	else if (i == 20)
		default.NukeExplClass.default.bDamageActors = Bool(val);
	
	default.NukeExplClass.static.StaticSaveConfig();
	return val;
}


//Combo
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
local byte n;

	if (i == 10 || i == 11)
	{
		if (i == 10)
			n = default.NukeExplClass.default.ShockRadialDmgType;
		else if (i == 11)
			n = default.NukeExplClass.default.NucleusRadialDmgType;
		
		if (n < ArrayCount(default.RadialDmgType))
		{
			val1 = default.RadialDmgType[n];
			val2 = String(n);
			return;
		}
	}
	
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if ((i == 10 || i == 11) && listIndex < ArrayCount(default.RadialDmgType))
	{
		val1 = default.RadialDmgType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	if (i == 10)
		default.NukeExplClass.default.ShockRadialDmgType = default.NukeExplClass.static.GetERadialDmgFromByte(Byte(val2));
	else if (i == 11)
		default.NukeExplClass.default.NucleusRadialDmgType = default.NukeExplClass.static.GetERadialDmgFromByte(Byte(val2));

	default.NukeExplClass.static.StaticSaveConfig();
	return val2;
}


defaultproperties
{
	ModMenuInfoClass=Class'NukesAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	NukeExplClass=Class'NuclearExplosions'
	
	SettingsList(0)=(Description="Enable visible shockwave")
	SettingsList(0)=(HelpTip="Enable a visible shockwave effect")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Enable extra shockwave GFX")
	SettingsList(1)=(HelpTip="Enable extra shockwave smoke effects")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Enable indexer limiter")
	SettingsList(2)=(HelpTip="Use indexer for affected actors (limits damaged actors to 128 per frame)")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Ignore static objects")
	SettingsList(3)=(HelpTip="Ignore static objects during the shockwave processing")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Ignore teammates")
	SettingsList(4)=(HelpTip="Ignore teammates during the shockwave processing")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Ignore owner")
	SettingsList(5)=(HelpTip="Ignore owner during the shockwave processing")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Ignore decoration objects")
	SettingsList(6)=(HelpTip="Ignore decoration objects during the shockwave processing")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="Ignore projectiles")
	SettingsList(7)=(HelpTip="Ignore projectiles during the shockwave processing")
	SettingsList(7)=(Type=ST_Checkbox)
	
	SettingsList(8)=(Description="Ignore triggers")
	SettingsList(8)=(HelpTip="Ignore triggers during the shockwave processing")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="Extra shockwave GFX amount")
	SettingsList(9)=(HelpTip="Amount of extra shockwave smoke effects per hit object")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=3)
	SettingsList(9)=(BottomMargin=20.000000)
	
	SettingsList(10)=(Description="Shockwave damage type")
	SettingsList(10)=(HelpTip="Shockwave damage processing type:%n%    - Standard: uses normal damage algorithm%n%    - Auto: automatically adjusts the damage algorithm for best performance%n%    - Semi-through: gives damage through walls up to a specified wall thickness%n%    - Through: gives damage through walls")
	SettingsList(10)=(Type=ST_Combo)
	RadialDmgType(0)="Standard"
	RadialDmgType(1)="Auto"
	RadialDmgType(2)="Semi-through"
	RadialDmgType(3)="Through"
	
	SettingsList(11)=(Description="Nucleus damage type")
	SettingsList(11)=(HelpTip="Nucleus damage processing type:%n%    - Standard: uses normal damage algorithm%n%    - Auto: automatically adjusts the damage algorithm for best performance%n%    - Semi-through: gives damage through walls up to a specified wall thickness%n%    - Through: gives damage through walls")
	SettingsList(11)=(Type=ST_Combo)
	
	SettingsList(12)=(Description="Shockwave max damage")
	SettingsList(12)=(HelpTip="Shockwave max damage amount")
	SettingsList(12)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(13)=(Description="Nucleus max damage")
	SettingsList(13)=(HelpTip="Nucleus max damage amount")
	SettingsList(13)=(Type=ST_IntegerInput,MaxChars=8)
	
	SettingsList(14)=(Description="Shockwave update time interval")
	SettingsList(14)=(HelpTip="Shockwave damage processing time interval (in seconds)")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(15)=(Description="Nucleus update time interval")
	SettingsList(15)=(HelpTip="Nucleus damage processing time interval (in seconds)")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(16)=(Description="Shockwave transparency thickness")
	SettingsList(16)=(HelpTip="Shockwave max wall thickness for semi-through damage type")
	SettingsList(16)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(17)=(Description="Nucleus transparency thickness")
	SettingsList(17)=(HelpTip="Nucleus max wall thickness for semi-through damage type")
	SettingsList(17)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(18)=(Description="Shockwave muffling factor")
	SettingsList(18)=(HelpTip="Shockwave damage multiplier when passed through a wall")
	SettingsList(18)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(19)=(Description="Nucleus muffling factor")
	SettingsList(19)=(HelpTip="Nucleus damage multiplier when passed through a wall")
	SettingsList(19)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(19)=(BottomMargin=20.000000)
	
	SettingsList(20)=(Description="Damage actors")
	SettingsList(20)=(HelpTip="Damage other actors during the shockwave processing")
	SettingsList(20)=(Type=ST_Checkbox)
	SettingsList(20)=(BottomMargin=20.000000)
}
