//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////
class RTServerSettingsMenuPageInfo expands NWMenuPageInfo;

var() localized string TType[3], TSndType[7], TFXEffectType[4];


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 1)
		return String(Class'RT'.default.enableTransRazorHeadshot);
	if (i == 2)
		return String(Class'RT'.default.enableRazorTeleport);
	if (i == 3)
		return String(Class'RT'.default.canDropTranslocator);
	if (i == 4)
		return String(Class'RT'.default.canDisruptNormalTrans);
	if (i == 5)
		return String(Class'RT'.default.canDisruptRazorTrans);
	if (i == 6)
		return String(Class'RT'.default.canDisruptNormalByInstigator);
	if (i == 7)
		return String(Class'RT'.default.canDisruptRazorByInstigator);
	if (i == 8)
		return String(Class'RT'.default.TransNormalDisruptDmg);
	if (i == 9)
		return String(Class'RT'.default.TransRazorDisruptDmg);
	if (i == 10)
		return String(Class'RT'.default.TransRazorDamage);
	if (i == 11)
		return String(Class'RT'.default.TransRazorHeadshotDamage);
	if (i == 12)
		return String(Class'RT'.default.TranslocatorNormalSpeed);
	if (i == 13)
		return String(Class'RT'.default.TranslocatorRazorSpeed);
	if (i == 14)
		return String(Class'RT'.default.RelaunchDelayNormal);
	if (i == 15)
		return String(Class'RT'.default.RelaunchDelayRazor);
	if (i == 16)
		return String(Class'RT'.default.enableNormalHitSound);
	if (i == 17)
		return String(Class'RT'.default.enableRazorHitSound);
	if (i == 18)
		return String(Class'RT'.default.enableNormalAmbSound);
	if (i == 19)
		return String(Class'RT'.default.enableRazorAmbSound);
	if (i == 20)
		return String(Class'RT'.default.enableNormalTelefrag);
	if (i == 21)
		return String(Class'RT'.default.enableRazorTelefrag);
	if (i == 22)
		return String(Class'RT'.default.enableNormalTeleportShake);
	if (i == 23)
		return String(Class'RT'.default.enableRazorTeleportShake);
	if (i == 24)
		return String(Class'RT'.default.enableNormalAffectFOV);
	if (i == 25)
		return String(Class'RT'.default.enableRazorAffectFOV);
	if (i == 26)
		return String(Class'RT'.default.TeleFOVNormal);
	if (i == 27)
		return String(Class'RT'.default.TeleFOVRazor);
	if (i == 33)
		return String(Class'RT'.default.enableOversurrection);
	if (i == 34)
		return String(Class'RT'.default.OversurrectionLifeTime);
	if (i == 35)
		return String(Class'RT'.default.OversurrectionNormalDmg);
	if (i == 36)
		return String(Class'RT'.default.OversurrectionHeadshotDmg);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 1)
		Class'RT'.default.enableTransRazorHeadshot = Bool(val);
	else if (i == 2)
		Class'RT'.default.enableRazorTeleport = Bool(val);
	else if (i == 3)
		Class'RT'.default.canDropTranslocator = Bool(val);
	else if (i == 4)
		Class'RT'.default.canDisruptNormalTrans = Bool(val);
	else if (i == 5)
		Class'RT'.default.canDisruptRazorTrans = Bool(val);
	else if (i == 6)
		Class'RT'.default.canDisruptNormalByInstigator = Bool(val);
	else if (i == 7)
		Class'RT'.default.canDisruptRazorByInstigator = Bool(val);
	else if (i == 8)
		Class'RT'.default.TransNormalDisruptDmg = Int(val);
	else if (i == 9)
		Class'RT'.default.TransRazorDisruptDmg = Int(val);
	else if (i == 10)
		Class'RT'.default.TransRazorDamage = Int(val);
	else if (i == 11)
		Class'RT'.default.TransRazorHeadshotDamage = Int(val);
	else if (i == 12)
		Class'RT'.default.TranslocatorNormalSpeed = Float(val);
	else if (i == 13)
		Class'RT'.default.TranslocatorRazorSpeed = Float(val);
	else if (i == 14)
		Class'RT'.default.RelaunchDelayNormal = Float(val);
	else if (i == 15)
		Class'RT'.default.RelaunchDelayRazor = Float(val);
	else if (i == 16)
		Class'RT'.default.enableNormalHitSound = Bool(val);
	else if (i == 17)
		Class'RT'.default.enableRazorHitSound = Bool(val);
	else if (i == 18)
		Class'RT'.default.enableNormalAmbSound = Bool(val);
	else if (i == 19)
		Class'RT'.default.enableRazorAmbSound = Bool(val);
	else if (i == 20)
		Class'RT'.default.enableNormalTelefrag = Bool(val);
	else if (i == 21)
		Class'RT'.default.enableRazorTelefrag = Bool(val);
	else if (i == 22)
		Class'RT'.default.enableNormalTeleportShake = Bool(val);
	else if (i == 23)
		Class'RT'.default.enableRazorTeleportShake = Bool(val);
	else if (i == 24)
		Class'RT'.default.enableNormalAffectFOV = Bool(val);
	else if (i == 25)
		Class'RT'.default.enableRazorAffectFOV = Bool(val);
	else if (i == 26 || i == 27)
	{
		if (Byte(val) < 10)
			val = String(10);
		else if (Byte(val) > 170)
			val = String(170);
		
		if (i == 26)
			Class'RT'.default.TeleFOVNormal = Byte(val);
		else if (i == 27)
			Class'RT'.default.TeleFOVRazor = Byte(val);
	}
	else if (i == 33)
		Class'RT'.default.enableOversurrection = Bool(val);
	else if (i == 34)
		Class'RT'.default.OversurrectionLifeTime = Float(val);
	else if (i == 35)
		Class'RT'.default.OversurrectionNormalDmg = Int(val);
	else if (i == 36)
		Class'RT'.default.OversurrectionHeadshotDmg = Int(val);
	
	Class'RT'.static.StaticSaveConfig();
	return val;
}


//Combo
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
local byte n;

	if (i == 0)
	{
		n = Class'RT'.default.TranslocatorType;
		if (n < ArrayCount(default.TType))
		{
			val1 = default.TType[n];
			val2 = String(n);
			return;
		}
	}
	else if (i == 28 || i == 29)
	{
		if (i == 28)
			n = Class'RT'.default.TeleportSoundNormal;
		else if (i == 29)
			n = Class'RT'.default.TeleportSoundRazor;
			
		if (n < ArrayCount(default.TSndType))
		{
			val1 = default.TSndType[n];
			val2 = String(n);
			return;
		}
	}
	else if (i == 30 || i == 31)
	{
		if (i == 30)
			n = Class'RT'.default.TeleportFXNormal;
		else if (i == 31)
			n = Class'RT'.default.TeleportFXRazor;
			
		if (n < ArrayCount(default.TFXEffectType))
		{
			val1 = default.TFXEffectType[n];
			val2 = String(n);
			return;
		}
	}
	
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if (i == 0 && listIndex < ArrayCount(default.TType))
	{
		val1 = default.TType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	else if ((i == 28 || i == 29) && listIndex < ArrayCount(default.TSndType))
	{
		val1 = default.TSndType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	else if ((i == 30 || i == 31) && listIndex < ArrayCount(default.TFXEffectType))
	{
		val1 = default.TFXEffectType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	if (i == 0)
		Class'RT'.default.TranslocatorType = Class'RT'.static.GetTTypeFromByte(Byte(val2));
	else if (i == 28)
		Class'RT'.default.TeleportSoundNormal = Class'RT'.static.GetTSndEffectFromByte(Byte(val2));
	else if (i == 29)
		Class'RT'.default.TeleportSoundRazor = Class'RT'.static.GetTSndEffectFromByte(Byte(val2));
	else if (i == 30)
		Class'RT'.default.TeleportFXNormal = Class'RT'.static.GetTFXEffectFromByte(Byte(val2));
	else if (i == 31)
		Class'RT'.default.TeleportFXRazor = Class'RT'.static.GetTFXEffectFromByte(Byte(val2));

	Class'RT'.static.StaticSaveConfig();
	return val2;
}



defaultproperties
{
	ModMenuInfoClass=Class'RTAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Translocator type")
	SettingsList(0)=(HelpTip="Translocator type to use:%n%     - Normal: normal translocator device only%n%     - Razor: razor translocator device only%n%     - Both: both translocator devices")
	SettingsList(0)=(Type=ST_Combo)
	TType(0)="Normal"
	TType(1)="Razor"
	TType(2)="Both"
	
	SettingsList(1)=(Description="Enable razor headshots")
	SettingsList(1)=(HelpTip="Enable headshots using the razor mode")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Enable razor teleport")
	SettingsList(2)=(HelpTip="Enable teleporting using the razor mode")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Drop on death")
	SettingsList(3)=(HelpTip="Drop the translocator on death, like a normal weapon")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Disruptable normal")
	SettingsList(4)=(HelpTip="Enable the possibility to disrupt the normal translocator device")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Disruptable razor")
	SettingsList(5)=(HelpTip="Enable the possibility to disrupt the razor translocator device")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Disruptable normal by owner")
	SettingsList(6)=(HelpTip="Enable the possibility for a player to disrupt his own normal translocator device")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="Disruptable razor by owner")
	SettingsList(7)=(HelpTip="Enable the possibility for a player to disrupt his own razor translocator device")
	SettingsList(7)=(Type=ST_Checkbox)
	
	SettingsList(8)=(Description="Normal armor")
	SettingsList(8)=(HelpTip="Min amount of damage needed to disrupt a normal translocator device")
	SettingsList(8)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(9)=(Description="Razor armor")
	SettingsList(9)=(HelpTip="Min amount of damage needed to disrupt a razor translocator device")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(10)=(Description="Razor damage")
	SettingsList(10)=(HelpTip="Amount of damage made by a razor translocator device")
	SettingsList(10)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(11)=(Description="Razor headshot damage")
	SettingsList(11)=(HelpTip="Amount of headshot damage made by a razor translocator device")
	SettingsList(11)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(12)=(Description="Normal translocator speed")
	SettingsList(12)=(HelpTip="Normal translocator device speed")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(13)=(Description="Razor translocator speed")
	SettingsList(13)=(HelpTip="Razor translocator device speed")
	SettingsList(13)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(14)=(Description="Normal translocator relaunch delay")
	SettingsList(14)=(HelpTip="Normal translocator device relaunch delay (in seconds)")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(15)=(Description="Razor translocator relaunch delay")
	SettingsList(15)=(HelpTip="Razor translocator device relaunch delay (in seconds)")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(15)=(BottomMargin=20.000000)
	
	SettingsList(16)=(Description="Normal translocator hit sound")
	SettingsList(16)=(HelpTip="Enable normal translocator device hit sound")
	SettingsList(16)=(Type=ST_Checkbox)
	
	SettingsList(17)=(Description="Razor translocator hit sound")
	SettingsList(17)=(HelpTip="Enable razor translocator device hit sound")
	SettingsList(17)=(Type=ST_Checkbox)
	
	SettingsList(18)=(Description="Normal translocator ambient sound")
	SettingsList(18)=(HelpTip="Enable normal translocator device ambient sound")
	SettingsList(18)=(Type=ST_Checkbox)
	
	SettingsList(19)=(Description="Razor translocator ambient sound")
	SettingsList(19)=(HelpTip="Enable razor translocator device ambient sound")
	SettingsList(19)=(Type=ST_Checkbox)
	
	SettingsList(20)=(Description="Normal translocator telefrag")
	SettingsList(20)=(HelpTip="Enable normal translocator device telefrag ability")
	SettingsList(20)=(Type=ST_Checkbox)
	
	SettingsList(21)=(Description="Razor translocator telefrag")
	SettingsList(21)=(HelpTip="Enable razor translocator device telefrag ability")
	SettingsList(21)=(Type=ST_Checkbox)
	
	SettingsList(22)=(Description="Normal translocator teleport shake")
	SettingsList(22)=(HelpTip="Enable normal translocator device teleport shake effect")
	SettingsList(22)=(Type=ST_Checkbox)
	
	SettingsList(23)=(Description="Razor translocator teleport shake")
	SettingsList(23)=(HelpTip="Enable razor translocator device teleport shake effect")
	SettingsList(23)=(Type=ST_Checkbox)
	
	SettingsList(24)=(Description="Normal translocator teleport FOV")
	SettingsList(24)=(HelpTip="Enable normal translocator device teleport FOV change effect")
	SettingsList(24)=(Type=ST_Checkbox)
	
	SettingsList(25)=(Description="Razor translocator teleport FOV")
	SettingsList(25)=(HelpTip="Enable razor translocator device teleport FOV change effect")
	SettingsList(25)=(Type=ST_Checkbox)
	
	SettingsList(26)=(Description="Normal translocator FOV value")
	SettingsList(26)=(HelpTip="Normal translocator device teleport FOV change effect value")
	SettingsList(26)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(27)=(Description="Razor translocator FOV value")
	SettingsList(27)=(HelpTip="Razor translocator device teleport FOV change effect value")
	SettingsList(27)=(Type=ST_IntegerInput,MaxChars=3)
	SettingsList(27)=(BottomMargin=20.000000)
	
	SettingsList(28)=(Description="Normal translocator teleport sound")
	SettingsList(28)=(HelpTip="Normal translocator device teleport sound type")
	SettingsList(28)=(Type=ST_Combo)
	TSndType(0)="Discrete"
	TSndType(1)="Electric"
	TSndType(2)="Normal"
	TSndType(3)="UT2k4"
	TSndType(4)="UT3"
	TSndType(5)="Overload"
	TSndType(6)="Silent"
	
	SettingsList(29)=(Description="Razor translocator teleport sound")
	SettingsList(29)=(HelpTip="Razor translocator device teleport sound type")
	SettingsList(29)=(Type=ST_Combo)
	
	SettingsList(30)=(Description="Normal translocator teleport effect")
	SettingsList(30)=(HelpTip="Normal translocator device teleport effect type:%n%   - None: no effect%n%   - Standard: original teleport effect%n%   - Effect 1: translucent new effect%n%   - Effect 2: modulated new effect")
	SettingsList(30)=(Type=ST_Combo)
	TFXEffectType(0)="None"
	TFXEffectType(1)="Standard"
	TFXEffectType(2)="Effect 1"
	TFXEffectType(3)="Effect 2"
	
	SettingsList(31)=(Description="Razor translocator teleport effect")
	SettingsList(31)=(HelpTip="Razor translocator device teleport effect type:%n%   - None: no effect%n%   - Standard: original teleport effect%n%   - Effect 1: translucent new effect%n%   - Effect 2: modulated new effect")
	SettingsList(31)=(Type=ST_Combo)
	SettingsList(31)=(BottomMargin=20.000000)
	
	SettingsList(32)=(Description="Oversurrection:")
	SettingsList(32)=(HelpTip="Oversurrection settings")
	SettingsList(32)=(Type=ST_Label)
	
	SettingsList(33)=(Description="    Enable Oversurrection")
	SettingsList(33)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(33)=(Type=ST_Checkbox)
	
	SettingsList(34)=(Description="    Life time")
	SettingsList(34)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(34)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(35)=(Description="    Damage")
	SettingsList(35)=(HelpTip="Oversurrection normal damage")
	SettingsList(35)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(36)=(Description="    Headshot damage")
	SettingsList(36)=(HelpTip="Oversurrection headshot damage")
	SettingsList(36)=(Type=ST_IntegerInput,MaxChars=6)
	SettingsList(36)=(BottomMargin=20.000000)
}
