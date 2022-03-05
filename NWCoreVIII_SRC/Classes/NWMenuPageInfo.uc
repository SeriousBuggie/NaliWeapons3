//////////////////////////////////////////////////////////////
//	Nali Weapons III Page Menu info
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWMenuPageInfo expands Info
abstract;

var() class<NWMainModMenuInfo> ModMenuInfoClass;
var() localized string PageTitle;


enum ESettingType
{
	ST_None,
	ST_Checkbox,
	ST_Input,
	ST_IntegerInput,
	ST_FloatInput,
	ST_Slider,
	ST_Combo,
	ST_Color,
	ST_Profile,
	ST_Label
};

struct NPageSettings
{
	var() localized string Description, HelpTip;
	var() ESettingType Type;
	var() int MaxChars; 
	var() float BottomMargin;
	var() int MinSliderVal, MaxSliderVal, SliderStep, SliderSize, SliderTrackSize;
	var() texture ColorTex;
	var() class<NWProfile> ProfileClass;
	var() bool hasAdvanced;
	var() localized string AdvancedText;
	var() class<NWMainModMenuInfo> AdvancedMenuInfoClass;
	var() string ExtraInfo1, ExtraInfo2, ExtraInfo3, ExtraInfo4;
	var() string ExtraInfo5, ExtraInfo6, ExtraInfo7, ExtraInfo8;
	var class<NWMenuPageInfo> ExtendedInfoClass;
	var byte RealID;
};

var() localized NPageSettings SettingsList[256];

var bool bStaticInitialized;



//Start up
static function InitMenuPageInfo(PlayerPawn P)
{
local int i, j, listEnd;
local class<NWMenuPageInfo> PInfoClass;
local string PInfoClassStr;

	if (P == None || default.bStaticInitialized)
		return;

	//Load extra settings from int files
	for (i = ArrayCount(default.SettingsList) - 1; i >= 0; i--)
	{
		if (default.SettingsList[i].Type > ST_None)
		{
			listEnd = i + 1;
			break;
		}
	}
	
	i = 0;
	while (i < ArrayCount(default.SettingsList) && listEnd < ArrayCount(default.SettingsList))
	{
		PInfoClassStr = P.GetNextInt(String(default.Class), i++);
		if (PInfoClassStr == "")
			break;
		PInfoClass = Class<NWMenuPageInfo>(DynamicLoadObject(PInfoClassStr, class'Class'));
		if (PInfoClass != None)
		{
			for (j = 0; j < ArrayCount(default.SettingsList); j++)
			{
				if ((listEnd + j) >= ArrayCount(default.SettingsList))
					break;
				
				if (PInfoClass.static.GetSettingsRealType(j) > ST_None)
				{
					default.SettingsList[listEnd + j] = PInfoClass.static.GetPageSettings(j);
					default.SettingsList[listEnd + j].ExtendedInfoClass = PInfoClass;
					default.SettingsList[listEnd + j].RealID = j;
				}
				else
				{
					listEnd += j;
					break;
				}
			}
		}
	}
	
	default.bStaticInitialized = True;
}

static function NPageSettings GetPageSettings(byte i)
{
local NPageSettings NPage;

	if (i >= ArrayCount(default.SettingsList))
		return NPage;
	return default.SettingsList[i];
}


static function GetSettingsFull(byte i, optional out string Description, optional out byte Type, optional out string HelpTip, 
optional out int MaxChars, optional out float BottomMargin, optional out int MinSliderVal,
optional out int MaxSliderVal, optional out int SliderStep, optional out int SliderSize, optional out int SliderTrackSize,
optional out texture ColorTex)
{
	if (i >= ArrayCount(default.SettingsList))
	{
		Description = "";
		HelpTip = "";
		Type = 0;
		MaxChars = 0;
		BottomMargin = 0.0;
		MinSliderVal = 0;
		MaxSliderVal = 0;
		SliderStep = 0;
		SliderSize = 0;
		SliderTrackSize = 0;
		ColorTex = None;
		return;
	}
	
	Description = default.SettingsList[i].Description;
	HelpTip = default.SettingsList[i].HelpTip;
	Type = default.SettingsList[i].Type;
	MaxChars = default.SettingsList[i].MaxChars;
	BottomMargin = default.SettingsList[i].BottomMargin;
	MinSliderVal = default.SettingsList[i].MinSliderVal;
	MaxSliderVal = default.SettingsList[i].MaxSliderVal;
	SliderStep = default.SettingsList[i].SliderStep;
	SliderSize = default.SettingsList[i].SliderSize;
	SliderTrackSize = default.SettingsList[i].SliderTrackSize;
	ColorTex = default.SettingsList[i].ColorTex;
}


static function bool hasAdvancedSettings(byte i, optional out string advText, optional out class<NWMainModMenuInfo> advMenuInfoClass)
{
	if (i >= ArrayCount(default.SettingsList) || default.SettingsList[i].AdvancedMenuInfoClass == None)
	{
		advText = "";
		advMenuInfoClass = None;
		return False;
	}
	advMenuInfoClass = default.SettingsList[i].AdvancedMenuInfoClass;
	advText = default.SettingsList[i].AdvancedText;
	return default.SettingsList[i].hasAdvanced;
}

static function class<NWProfile> GetProfileClass(byte i)
{
	if (i >= ArrayCount(default.SettingsList))
		return None;
	return default.SettingsList[i].ProfileClass;
}

static function texture GetSettingsColorTex(byte i)
{
	if (i >= ArrayCount(default.SettingsList))
		return None;
	return default.SettingsList[i].ColorTex;
}

static function GetSettingsSlider(byte i, out int MinSliderVal, out int MaxSliderVal, out int SliderStep, out int SliderSize, out int SliderTrackSize)
{
	if (i >= ArrayCount(default.SettingsList))
	{
		MinSliderVal = 0;
		MaxSliderVal = 0;
		SliderStep = 0;
		SliderSize = 0;
		SliderTrackSize = 0;
		return;
	}
	
	MinSliderVal = default.SettingsList[i].MinSliderVal;
	MaxSliderVal = default.SettingsList[i].MaxSliderVal;
	SliderStep = default.SettingsList[i].SliderStep;
	SliderSize = default.SettingsList[i].SliderSize;
	SliderTrackSize = default.SettingsList[i].SliderTrackSize;
}

static function string GetSettingsDescription(byte i)
{
	if (i >= ArrayCount(default.SettingsList))
		return "";
	return default.SettingsList[i].Description;
}

static function string GetSettingsHelpingTip(byte i)
{
	if (i >= ArrayCount(default.SettingsList))
		return "";
	return default.SettingsList[i].HelpTip;
}

static function byte GetSettingsType(byte i)
{
	if (i >= ArrayCount(default.SettingsList))
		return 0;
	return default.SettingsList[i].Type;
}

static function ESettingType GetSettingsRealType(byte i)
{
	if (i >= ArrayCount(default.SettingsList))
		return ESettingType.ST_None;
	return default.SettingsList[i].Type;
}

static function int GetSettingsMaxCharacters(byte i)
{
	if (i >= ArrayCount(default.SettingsList))
		return 0;
	return default.SettingsList[i].MaxChars;
}

static function float GetSettingsBottomMargin(byte i)
{
	if (i >= ArrayCount(default.SettingsList))
		return 0.0;
	return default.SettingsList[i].BottomMargin;
}

//-----------------------------------------------------------------------------------------------
//  Internally handled events
//-----------------------------------------------------------------------------------------------
static function string GetFullDefaultValue(byte i, optional byte advIndex)
{
	if (default.SettingsList[i].ExtendedInfoClass != None)
		return default.SettingsList[i].ExtendedInfoClass.static.GetDefaultValue(default.SettingsList[i].RealID, advIndex);
	return GetDefaultValue(i, advIndex);
}

static function string ProcessFullSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (default.SettingsList[i].ExtendedInfoClass != None)
		return default.SettingsList[i].ExtendedInfoClass.static.ProcessSettingsChange(P, default.SettingsList[i].RealID, val, advIndex);
	return ProcessSettingsChange(P, i, val, advIndex);
}

static function color GetFullDefaultColor(byte i, optional byte advIndex)
{
	if (default.SettingsList[i].ExtendedInfoClass != None)
		return default.SettingsList[i].ExtendedInfoClass.static.GetDefaultColor(default.SettingsList[i].RealID, advIndex);
	return GetDefaultColor(i, advIndex);
}

static function color ProcessFullSettingsChangeColor(PlayerPawn P, byte i, color C, optional byte advIndex)
{
	if (default.SettingsList[i].ExtendedInfoClass != None)
		return default.SettingsList[i].ExtendedInfoClass.static.ProcessSettingsChangeColor(P, default.SettingsList[i].RealID, C, advIndex);
	return ProcessSettingsChangeColor(P, i, C, advIndex);
}

static function GetFullComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
	if (default.SettingsList[i].ExtendedInfoClass != None)
		default.SettingsList[i].ExtendedInfoClass.static.GetComboDefaultValues(default.SettingsList[i].RealID, val1,  val2, advIndex);
	else
		GetComboDefaultValues(i, val1,  val2, advIndex);
}

static function bool LoadFullComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if (default.SettingsList[i].ExtendedInfoClass != None)
		return default.SettingsList[i].ExtendedInfoClass.static.LoadComboList(default.SettingsList[i].RealID, listIndex, val1, val2, advIndex);
	return LoadComboList(i, listIndex, val1, val2, advIndex);
}

static function string ProcessFullSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	if (default.SettingsList[i].ExtendedInfoClass != None)
		return default.SettingsList[i].ExtendedInfoClass.static.ProcessSettingsChangeCombo(P, default.SettingsList[i].RealID, val2, advIndex);
	return ProcessSettingsChangeCombo(P, i, val2, advIndex);
}


//-----------------------------------------------------------------------------------------------
//  To implement on subclasses
//-----------------------------------------------------------------------------------------------

//Normal controls
static function string GetDefaultValue(byte i, optional byte advIndex)
{
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	return val;
}

//Color control
static function color GetDefaultColor(byte i, optional byte advIndex)
{
local color C;

	return C;
}

static function color ProcessSettingsChangeColor(PlayerPawn P, byte i, color C, optional byte advIndex)
{
	return C;
}

//Combo control
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	return val2;
}



defaultproperties
{

}
