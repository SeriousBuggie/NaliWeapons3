//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWClientDetailSettingsMenuPageInfo expands NWMenuPageInfo;

var() localized string CarcassFXLevel[4];


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NWInfo'.default.enableDebris);
	if (i == 1)
		return String(Class'NWInfo'.default.bEnhancedWaterSplashes);
	if (i == 2)
		return String(Class'NWInfo'.default.WaterSplashDetail);
	if (i == 3)
		return String(Class'NWCoronaFX'.default.bCoronasCollisionDetail);
	if (i == 5)
		return String(Class'NWInfo'.default.bWeaponsDynLight);
	if (i == 6)
		return String(Class'NWInfo'.default.bAmmoDynLight);
	if (i == 7)
		return String(Class'NWInfo'.default.bPickupsDynLight);
	if (i == 8)
		return String(Class'NWInfo'.default.bEffectsDynLight);
	if (i == 9)
		return String(Class'NWInfo'.default.WeaponDistDetail);
	if (i == 10)
		return String(Class'NWInfo'.default.AmmoDistDetail);
	if (i == 11)
		return String(Class'NWInfo'.default.PickupsDistDetail);
	if (i == 12)
		return String(Class'NWInfo'.default.ChargersDistDetail);
	if (i == 13)
		return String(Class'NWInfo'.default.enableGlobalSmartPerformance);
	if (i == 14)
		return String(Class'NWInfo'.default.smartPerformanceMinFPS);
	if (i == 15)
		return String(Class'NWInfo'.default.enableSmartPerformanceWeapon);
	if (i == 16)
		return String(Class'NWInfo'.default.enableSmartPerformanceAmmo);
	if (i == 17)
		return String(Class'NWInfo'.default.enableSmartPerformancePickup);
	if (i == 18)
		return String(Class'NWInfo'.default.enableSmartPerformanceCharger);
	if (i == 19)
		return String(Class'NWInfo'.default.MaxLODBias);
	if (i == 20)
		return String(Class'NWInfo'.default.MinLODBias);
	if (i == 21)
		return String(Class'NWInfo'.default.DecalsLifespan);
	if (i == 22)
		return String(Class'NWInfo'.default.PickupsGlowScale);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'NWInfo'.default.enableDebris = Bool(val);
	else if (i == 1)
		Class'NWInfo'.default.bEnhancedWaterSplashes = Bool(val);
	else if (i == 2)
		Class'NWInfo'.default.WaterSplashDetail = Byte(val);
	else if (i == 3)
		Class'NWCoronaFX'.default.bCoronasCollisionDetail = Bool(val);
	else if (i == 5)
		Class'NWInfo'.default.bWeaponsDynLight = Bool(val);
	else if (i == 6)
		Class'NWInfo'.default.bAmmoDynLight = Bool(val);
	else if (i == 7)
		Class'NWInfo'.default.bPickupsDynLight = Bool(val);
	else if (i == 8)
		Class'NWInfo'.default.bEffectsDynLight = Bool(val);
	else if (i == 9)
		Class'NWInfo'.default.WeaponDistDetail = Byte(val);
	else if (i == 10)
		Class'NWInfo'.default.AmmoDistDetail = Byte(val);
	else if (i == 11)
		Class'NWInfo'.default.PickupsDistDetail = Byte(val);
	else if (i == 12)
		Class'NWInfo'.default.ChargersDistDetail = Byte(val);
	else if (i == 13)
		Class'NWInfo'.default.enableGlobalSmartPerformance = Bool(val);
	else if (i == 14)
		Class'NWInfo'.default.smartPerformanceMinFPS = Byte(val);
	else if (i == 15)
		Class'NWInfo'.default.enableSmartPerformanceWeapon = Bool(val);
	else if (i == 16)
		Class'NWInfo'.default.enableSmartPerformanceAmmo = Bool(val);
	else if (i == 17)
		Class'NWInfo'.default.enableSmartPerformancePickup = Bool(val);
	else if (i == 18)
		Class'NWInfo'.default.enableSmartPerformanceCharger = Bool(val);
	else if (i == 19)
		Class'NWInfo'.default.MaxLODBias = Float(val);
	else if (i == 20)
		Class'NWInfo'.default.MinLODBias = Float(val);
	else if (i == 21)
		Class'NWInfo'.default.DecalsLifespan = Float(val);
	else if (i == 22)
		Class'NWInfo'.default.PickupsGlowScale = Float(val);

	if (i <= 2 || i >= 5)
		Class'NWInfo'.static.StaticSaveConfig();
	else
		Class'NWCoronaFX'.static.StaticSaveConfig();
		
	return val;
}


//Combo
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
local byte n;

	if (i == 4)
	{
		n = Class'NWInfo'.default.CarcassFX;
		if (n < ArrayCount(default.CarcassFXLevel))
		{
			val1 = default.CarcassFXLevel[n];
			val2 = String(n);
			return;
		}
	}
	
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if (i == 4 && listIndex < ArrayCount(default.CarcassFXLevel))
	{
		val1 = default.CarcassFXLevel[listIndex];
		val2 = String(listIndex);
		return True;
	}
	
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	if (i == 4)
	{
		Class'NWInfo'.default.CarcassFX = Class'NWInfo'.static.GetCarcassFXFromByte(Byte(val2));
		Class'NWInfo'.static.StaticSaveConfig();
	}
	
	return val2;
}



defaultproperties
{
	ModMenuInfoClass=Class'NWClientSettingsMainModMenuInfo'
	PageTitle="Detail"
	
	SettingsList(0)=(Description="Debris GFX")
	SettingsList(0)=(HelpTip="Enable broken BSP debris effects%n%NOTE: Decals must be enabled in order for this feature to work")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Water GFX")
	SettingsList(1)=(HelpTip="Enable water splash effects")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Water GFX detail")
	SettingsList(2)=(HelpTip="Water splash effect amount of detail")
	SettingsList(2)=(Type=ST_Slider)
	SettingsList(2)=(MinSliderVal=1,MaxSliderVal=9,SliderStep=1,SliderSize=80,SliderTrackSize=5)
	
	SettingsList(3)=(Description="Dynamic coronas full occlusion")
	SettingsList(3)=(HelpTip="Enable dynamic coronas occlusion for normal objects too%n%and not only map geometry")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Carcass GFX level")
	SettingsList(4)=(HelpTip="Carcass visual post-effects level:%n%     None - No carcass effects%n%     Precise - Carcass effects only in precision shots%n%     Moderate - Carcass effects only up to small explosions%n%     Splash - Carcass effects in every appliable situation")
	SettingsList(4)=(Type=ST_Combo)
	SettingsList(4)=(BottomMargin=20.000000)
	CarcassFXLevel(0)="None"
	CarcassFXLevel(1)="Precise"
	CarcassFXLevel(2)="Moderate"
	CarcassFXLevel(3)="Splash"
	
	SettingsList(5)=(Description="Weapons dynamic light")
	SettingsList(5)=(HelpTip="Enable dynamic lighting from weapons")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Ammo dynamic light")
	SettingsList(6)=(HelpTip="Enable dynamic lighting from ammo")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="Pickups dynamic light")
	SettingsList(7)=(HelpTip="Enable dynamic lighting from pickups")
	SettingsList(7)=(Type=ST_Checkbox)
	
	SettingsList(8)=(Description="Effects dynamic light")
	SettingsList(8)=(HelpTip="Enable dynamic lighting from effects")
	SettingsList(8)=(Type=ST_Checkbox)
	SettingsList(8)=(BottomMargin=20.000000)
	
	SettingsList(9)=(Description="Weapons distance detail")
	SettingsList(9)=(HelpTip="Amount of detail relative the distance from weapons")
	SettingsList(9)=(Type=ST_Slider)
	SettingsList(9)=(MinSliderVal=0,MaxSliderVal=255,SliderStep=16,SliderSize=100,SliderTrackSize=7)
	
	SettingsList(10)=(Description="Ammo distance detail")
	SettingsList(10)=(HelpTip="Amount of detail relative the distance from ammo")
	SettingsList(10)=(Type=ST_Slider)
	SettingsList(10)=(MinSliderVal=0,MaxSliderVal=255,SliderStep=16,SliderSize=100,SliderTrackSize=7)
	
	SettingsList(11)=(Description="Pickups distance detail")
	SettingsList(11)=(HelpTip="Amount of detail relative the distance from pickups")
	SettingsList(11)=(Type=ST_Slider)
	SettingsList(11)=(MinSliderVal=0,MaxSliderVal=255,SliderStep=16,SliderSize=100,SliderTrackSize=7)
	
	SettingsList(12)=(Description="Chargers distance detail")
	SettingsList(12)=(HelpTip="Amount of detail relative the distance from inventory chargers")
	SettingsList(12)=(Type=ST_Slider)
	SettingsList(12)=(MinSliderVal=0,MaxSliderVal=255,SliderStep=16,SliderSize=100,SliderTrackSize=7)
	SettingsList(12)=(BottomMargin=20.000000)
	
	SettingsList(13)=(Description="Global smart performance")
	SettingsList(13)=(HelpTip="Enable automatic tweaks in runtime for best performance-quality during a game")
	SettingsList(13)=(Type=ST_Checkbox)
	
	SettingsList(14)=(Description="Smart performance min framerate")
	SettingsList(14)=(HelpTip="Smart performance minimum allowed framerate where it starts to turn detail off")
	SettingsList(14)=(Type=ST_IntegerInput)
	SettingsList(14)=(MaxChars=3)
	
	SettingsList(15)=(Description="Weapons smart performance")
	SettingsList(15)=(HelpTip="Enable smart performance for weapons")
	SettingsList(15)=(Type=ST_Checkbox)
	
	SettingsList(16)=(Description="Ammo smart performance")
	SettingsList(16)=(HelpTip="Enable smart performance for ammo")
	SettingsList(16)=(Type=ST_Checkbox)
	
	SettingsList(17)=(Description="Pickups smart performance")
	SettingsList(17)=(HelpTip="Enable smart performance for pickups")
	SettingsList(17)=(Type=ST_Checkbox)
	
	SettingsList(18)=(Description="Chargers smart performance")
	SettingsList(18)=(HelpTip="Enable smart performance for inventory chargers")
	SettingsList(18)=(Type=ST_Checkbox)
	SettingsList(18)=(BottomMargin=20.000000)
	
	SettingsList(19)=(Description="Max LODBias")
	SettingsList(19)=(HelpTip="Max level of detail")
	SettingsList(19)=(Type=ST_FloatInput)
	SettingsList(19)=(MaxChars=5)
	
	SettingsList(20)=(Description="Min LODBias")
	SettingsList(20)=(HelpTip="Min level of detail")
	SettingsList(20)=(Type=ST_FloatInput)
	SettingsList(20)=(MaxChars=5)
	SettingsList(20)=(BottomMargin=20.000000)
	
	SettingsList(21)=(Description="Decals lifetime")
	SettingsList(21)=(HelpTip="Weapon decals lifetime:%n%   Below zero: decals stay forever%n%   Equals zero: decals stay as long as the player sees them%n%   Above zero: decals stay during the time set in seconds")
	SettingsList(21)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(21)=(BottomMargin=10.000000)
	
	SettingsList(22)=(Description="Pickups glow scale")
	SettingsList(22)=(HelpTip="Bright pickups glowing scale (0.0 - invisible; 1.0 - full brightness)")
	SettingsList(22)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(22)=(BottomMargin=20.000000)
}
