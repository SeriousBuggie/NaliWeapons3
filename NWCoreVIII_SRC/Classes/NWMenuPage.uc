//////////////////////////////////////////////////////////////
//	Nali Weapons III Menu page window
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWMenuPage expands UMenuPageWindow;

var(ClientConfig) globalconfig bool bContextHelp;

var() float HelpDelay;

var UWindowDialogControl WControls[64];
var class<NWMenuPageInfo> NWMenuPageInfoClass;
var bool bIgnoreNotifications;
var NWUWindowHelpTip HelpArea;
var UWindowDialogControl CurHelpControl;
var float HelpDelayCount;
var float HelpX, HelpY;

struct advStruct
{
	var NWUWindowButton AdvButton;
	var class<NWMainModMenuInfo> MainMenuInfoClass;
	var NWAdvancedFramedWindow AdvWindow;
	var byte Index;
};

var advStruct AdvOptions[64];
var byte advancedGlobalIndex;


function InitPage(class<NWMenuPageInfo> NWMInfoClass, optional byte advIndex)
{
	NWMenuPageInfoClass = NWMInfoClass;
	if (NWMenuPageInfoClass != None)
	{
		if (!NWMenuPageInfoClass.default.bStaticInitialized)
			NWMenuPageInfoClass.static.InitMenuPageInfo(GetPlayerOwner());
		NWMenuPageInfoClass.default.bStaticInitialized = True;
		advancedGlobalIndex = advIndex;
		SetupFields();
	}
}


function AfterCreate()
{
    Super.AfterCreate();
	WinWidth -= GetFramesTotalWidth(Self);
	WinHeight -= GetFramesTotalHeight(Self);
    DesiredWidth = WinWidth;
    DesiredHeight = WinHeight;
}

function SetupFields()
{
local byte i, SType;
local string SDesc, SHelp;
local int SMaxChars;
local float SBMargin, TotalMargin;
local float X, Y, W, H, advBtnWidth;
local int SldMinVal, SldMaxVal, SldStep, SldSize, SldTrckSize;
local string ComboVal1, ComboVal2;
local byte listIndex, oldIndex;
local int MaxLen;
local bool hasAdvanced;
local string advText;
local class<NWMainModMenuInfo> advMenuInfoClass;

	X = 30;
	H = 16;
	bIgnoreNotifications = True;
	
	if (bContextHelp)
	{
		HelpArea = NWUWindowHelpTip(Root.CreateWindow(Class'NWUWindowHelpTip', 80, 20, 500, 20, Self));
		HelpArea.HideWindow();
	}
	
	for (i = 0; i < ArrayCount(WControls); i++)
	{
		NWMenuPageInfoClass.static.GetSettingsFull(i, SDesc, SType, SHelp, SMaxChars, SBMargin);
		if (SDesc == "" || SType == 0)
			continue;
		
		W = WinWidth - 50;
		Y = 20 + i*20 + TotalMargin;
		hasAdvanced = NWMenuPageInfoClass.static.hasAdvancedSettings(i, advText, advMenuInfoClass);
		advBtnWidth = Len(advText) * 8;
		if (hasAdvanced && (SType <= 6 || SType == 9))
		{
			AdvOptions[i].AdvButton = NWUWindowButton(CreateControl(Class'NWUWindowButton', X + W - advBtnWidth, Y - 2, advBtnWidth, H));
			W -= (advBtnWidth + 10);
		}

		if (SType == 1)
		{
			WControls[i] = CreateControl(Class'NWUWindowCheckBox', X, Y, W, H);
			NWUWindowCheckBox(WControls[i]).bChecked = Bool(NWMenuPageInfoClass.static.GetFullDefaultValue(i, advancedGlobalIndex));
			NWUWindowCheckBox(WControls[i]).PageNotifier = Self;
		}
		else if (SType <= 4)
		{
			WControls[i] = CreateControl(Class'NWUWindowEditControl', X, Y, W, H);
			NWUWindowEditControl(WControls[i]).SetNumericOnly(SType == 3 || SType == 4);
			NWUWindowEditControl(WControls[i]).SetNumericFloat(SType == 4);
			NWUWindowEditControl(WControls[i]).SetMaxLength(SMaxChars);
			if (SType == 3 || SType == 4)
				NWUWindowEditControl(WControls[i]).EditBoxWidth = Max(2, Min(SMaxChars, 18))*7;
			else
				NWUWindowEditControl(WControls[i]).EditBoxWidth = Max(2, Min(SMaxChars, 18))*8;
			NWUWindowEditControl(WControls[i]).SetValue(NWMenuPageInfoClass.static.GetFullDefaultValue(i, advancedGlobalIndex));
			NWUWindowEditControl(WControls[i]).PageNotifier = Self;
		}
		else if (SType == 5)
		{
			NWMenuPageInfoClass.static.GetSettingsSlider(i, SldMinVal, SldMaxVal, SldStep, SldSize, SldTrckSize);
			WControls[i] = CreateControl(Class'NWUWindowHSliderControl', X, Y, W, H);
			NWUWindowHSliderControl(WControls[i]).bNoSlidingNotify = True;
			NWUWindowHSliderControl(WControls[i]).SliderWidth = Max(20, SldSize);
			NWUWindowHSliderControl(WControls[i]).TrackWidth = Max(1, SldTrckSize);
			NWUWindowHSliderControl(WControls[i]).SetRange(SldMinVal, SldMaxVal, SldStep);
			NWUWindowHSliderControl(WControls[i]).SetValue(Int(NWMenuPageInfoClass.static.GetFullDefaultValue(i, advancedGlobalIndex)));
			NWUWindowHSliderControl(WControls[i]).PageNotifier = Self;
		}
		else if (SType == 6)
		{
			WControls[i] = CreateControl(Class'NWUWindowComboControl', X, Y, W, H);
			NWUWindowComboControl(WControls[i]).SetEditable(False);

			listIndex = 0;
			oldIndex = listIndex;
			MaxLen = 0;
			while (NWMenuPageInfoClass.static.LoadFullComboList(i, listIndex, ComboVal1, ComboVal2, advancedGlobalIndex) && listIndex >= oldIndex)
			{
				MaxLen = Max(MaxLen, Len(ComboVal1));
				NWUWindowComboControl(WControls[i]).AddItem(" "$ComboVal1, ComboVal2);
				oldIndex = listIndex++;
			}
			NWMenuPageInfoClass.static.GetFullComboDefaultValues(i, ComboVal1, ComboVal2, advancedGlobalIndex);
			NWUWindowComboControl(WControls[i]).SetValue(" "$ComboVal1, ComboVal2);
			NWUWindowComboControl(WControls[i]).EditBoxWidth = Max(5, Min(MaxLen, 15))*8;
			NWUWindowComboControl(WControls[i]).PageNotifier = Self;
		}
		else if (SType == 7)
		{
			WControls[i] = CreateControl(Class'NWMenuColorControl', X, Y, W, H);
			NWMenuColorControl(WControls[i]).SetColorSampleTexture(NWMenuPageInfoClass.static.GetSettingsColorTex(i));
			NWMenuColorControl(WControls[i]).SetColor(NWMenuPageInfoClass.static.GetFullDefaultColor(i, advancedGlobalIndex), True);
			NWMenuColorControl(WControls[i]).PageNotifier = Self;
			SBMargin += (WControls[i].WinHeight - 20);
			if (hasAdvanced)
			{
				AdvOptions[i].AdvButton = NWUWindowButton(CreateControl(Class'NWUWindowButton', X + W - advBtnWidth, Y + WControls[i].WinHeight, advBtnWidth, H));
				SBMargin += 20;
			}
		}
		else if (SType == 8)
		{
			WControls[i] = CreateControl(Class'NWMenuProfileControl', X, Y, W, H);
			NWMenuProfileControl(WControls[i]).ProfileClass = NWMenuPageInfoClass.static.GetProfileClass(i);
			NWMenuProfileControl(WControls[i]).InitProfile();
			NWMenuProfileControl(WControls[i]).PageNotifier = Self;
			SBMargin += (WControls[i].WinHeight - 20);
			if (hasAdvanced)
			{
				AdvOptions[i].AdvButton = NWUWindowButton(CreateControl(Class'NWUWindowButton', X + W - advBtnWidth, Y + WControls[i].WinHeight, advBtnWidth, H));
				SBMargin += 20;
			}
		}
		else if (SType == 9)
		{
			WControls[i] = CreateControl(Class'NWMenuLabelControl', X, Y, W, H);
			NWMenuLabelControl(WControls[i]).PageNotifier = Self;
		}
		
		if (hasAdvanced)
		{
			if (AdvOptions[i].AdvButton != None)
				AdvOptions[i].AdvButton.Text = advText;
			AdvOptions[i].MainMenuInfoClass = advMenuInfoClass;
			AdvOptions[i].Index = i;
		}
		
		TotalMargin += SBMargin;
		WinHeight = Y + SBMargin + 30;
		DesiredHeight = WinHeight;
		WControls[i].SetText(SDesc);
		WControls[i].SetHelpText(SHelp);
	}
	
	bIgnoreNotifications = False;
}

function float GetFramesTotalWidth(UWindowWindow BaseW)
{
local float f;

	if (BaseW == None)
		return 0;
	if (BaseW.LookAndFeel != None)
		f = BaseW.LookAndFeel.FrameL.W + BaseW.LookAndFeel.FrameR.W;
	if (BaseW.ParentWindow != None)
		return f + GetFramesTotalWidth(BaseW.ParentWindow);
	return f;
}

function float GetFramesTotalHeight(UWindowWindow BaseW)
{
local float f;

	if (BaseW == None)
		return 0;
	if (BaseW.LookAndFeel != None)
		f = BaseW.LookAndFeel.FrameT.H + BaseW.LookAndFeel.FrameB.H;
	if (BaseW.ParentWindow != None)
		return f + GetFramesTotalHeight(BaseW.ParentWindow);
	return f;
}

function Notify(UWindowDialogControl C, byte E)
{
local string cVal, cVal2, cNewVal;
local color oldColor, newColor;
local advStruct advOpt;
local float X, Y, W, H;

	if (NWMenuPageInfoClass == None || bIgnoreNotifications)
		return;
	
	if (E == DE_Change)
	{
		bIgnoreNotifications = True;
		if (NWMenuColorControl(C) != None)
		{
			oldColor = NWMenuColorControl(C).GetColor();
			newColor = NWMenuPageInfoClass.static.ProcessFullSettingsChangeColor(GetPlayerOwner(), getControlIndex(C), oldColor);
			if (newColor != oldColor)
				NWMenuColorControl(C).SetColor(newColor);
		}
		else if (NWUWindowComboControl(C) != None)
		{
			cVAl = NWUWindowComboControl(C).GetValue();
			cVAl2 = NWUWindowComboControl(C).GetValue2();
			cNewVal = NWMenuPageInfoClass.static.ProcessFullSettingsChangeCombo(GetPlayerOwner(), getControlIndex(C), cVAl2);
			if (cNewVal != cVal2)
				NWUWindowComboControl(C).SetValue(cVAl, cNewVal);
		}
		else
		{
			if (NWUWindowCheckBox(C) != None)
				cVal = String(NWUWindowCheckBox(C).bChecked);
			else if (NWUWindowEditControl(C) != None)
				cVal = NWUWindowEditControl(C).GetValue();
			else if (NWUWindowHSliderControl(C) != None)
				cVal = String(Int(NWUWindowHSliderControl(C).GetValue()));
			
			cNewVal = NWMenuPageInfoClass.static.ProcessFullSettingsChange(GetPlayerOwner(), getControlIndex(C), cVal);
			
			if (cNewVal != cVal)
			{
				if (NWUWindowCheckBox(C) != None)
					NWUWindowCheckBox(C).bChecked = Bool(cNewVal);
				else if (NWUWindowEditControl(C) != None)
					NWUWindowEditControl(C).SetValue(cNewVal);
				else if (NWUWindowHSliderControl(C) != None)
					NWUWindowHSliderControl(C).SetValue(Int(cNewVal));
			}
		}
		bIgnoreNotifications = False;
	}
	else if (E == DE_MouseEnter)
		SetupHelpControl(C);
	else if (E == DE_MouseLeave)
		ResetHelpControl(C);
	else if (E == DE_MouseMove || E == DE_Click || E == DE_LMouseDown)
	{
		if (NWUWindowButton(C) != None && E == DE_Click)
		{
			advOpt = getAdvancedOption(NWUWindowButton(C));
			if (advOpt.AdvWindow == None)
			{
				Class'NWAdvancedFramedWindow'.static.getSizeAndPos(advOpt.MainMenuInfoClass, Root.WinWidth, Root.WinHeight, X, Y, W, H);
				advOpt.AdvWindow = NWAdvancedFramedWindow(Root.CreateWindow(Class'NWAdvancedFramedWindow', X, Y, W, H, Self, advOpt.MainMenuInfoClass.default.bUniqueMainMenu));
				if (advOpt.AdvWindow != None)
				{
					advOpt.AdvWindow.InitWindow(advOpt.MainMenuInfoClass, advOpt.Index);
					if (!advOpt.MainMenuInfoClass.default.bCenterMainMenu)
					{
						WindowToGlobal(C.WinLeft, C.WinTop, X, Y);
						advOpt.AdvWindow.WinLeft = X + advOpt.MainMenuInfoClass.default.MainMenuPosX;
						advOpt.AdvWindow.WinTop = Y - advOpt.AdvWindow.WinHeight + advOpt.MainMenuInfoClass.default.MainMenuPosY;
						if (advOpt.AdvWindow.WinTop < 30)
							advOpt.AdvWindow.WinTop = 30;
						else if ((advOpt.AdvWindow.WinTop + advOpt.AdvWindow.WinHeight) > Root.WinHeight)
							advOpt.AdvWindow.WinTop = Root.WinHeight - advOpt.AdvWindow.WinHeight;
							
						if (advOpt.AdvWindow.WinLeft < 0)
							advOpt.AdvWindow.WinLeft = 0;
						else if ((advOpt.AdvWindow.WinLeft + advOpt.AdvWindow.WinWidth) > Root.WinWidth)
							advOpt.AdvWindow.WinLeft = Root.WinWidth - advOpt.AdvWindow.WinWidth;
					}
				}
			}
			if (advOpt.AdvWindow != None)
				ShowModal(advOpt.AdvWindow);
		}
		HideHelp();
	}
}

function SetupHelpControl(UWindowDialogControl C)
{
	CurHelpControl = C;
	HelpDelayCount = 0.0;
}

function ResetHelpControl(UWindowDialogControl C)
{
	HelpDelayCount = 0.0;
	if (CurHelpControl != C)
		return;
	CurHelpControl = None;
}

function byte getControlIndex(UWindowDialogControl C)
{
local byte i;

	if (C == None)
		return ArrayCount(WControls);

	for (i = 0; i < ArrayCount(WControls); i++)
	{
		if (WControls[i] == C)
			return i;
	}
	return ArrayCount(WControls);
}

function advStruct getAdvancedOption(NWUWindowButton WB)
{
local byte i;
local advStruct advOpt;

	if (WB == None)
		return advOpt;
		
	for (i = 0; i < ArrayCount(AdvOptions); i++)
	{
		if (WB == AdvOptions[i].AdvButton)
			return AdvOptions[i];
	}
	return advOpt;
}  

function ResetHelp(optional bool bRemoveHelpControl)
{
	HelpDelayCount = 0.0;
	if (bRemoveHelpControl)
		CurHelpControl = None;
}

function Tick(float Delta)
{
local float X, Y;
 
	Super.Tick(Delta);
	if (HelpArea != None)
	{
		if (CurHelpControl != None)
		{
			HelpDelayCount += Delta;
			if (HelpDelayCount >= HelpDelay && !HelpArea.bWindowVisible)
			{
				HelpArea.ShowWindow();
				HelpArea.SetHelpText(CurHelpControl.HelpText);
				WindowToGlobal(HelpX, HelpY, X, Y);
				HelpArea.SetupPos(X, Y);
				HelpArea.CancelAcceptsFocus();
				FocusWindow();
			}
		}
		else
			HideHelp();
	}
}

function HideHelp()
{
	if (HelpArea != None && HelpArea.bWindowVisible)
		HelpArea.HideWindow();
	HelpDelayCount = 0.0;
}

function MouseMove(float X, float Y)
{
	HelpX = X;
	HelpY = Y;
}

function Close(optional bool bByParent)
{
	Super.Close(bByParent);
	if (HelpArea != None)
		HelpArea.HideWindow();
}


defaultproperties
{
	bContextHelp=True
	HelpDelay=0.700000
}
