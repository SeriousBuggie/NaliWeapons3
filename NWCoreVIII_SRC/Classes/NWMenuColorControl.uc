//////////////////////////////////////////////////////////////
//	Nali Weapons III Color Dialog Control
//				Feralidragon (26-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWMenuColorControl expands NWMenuControl;

#exec TEXTURE IMPORT NAME=ColorSampleTex FILE=ICONS\ColorSampleTex.bmp GROUP=Icons MIPS=OFF LODSET=0

var() localized string RGBControlsCaption[3], RGBListCaption;
var() texture RGBDefaultTex;
var() color RGB;

struct ComboVal
{
	var() localized string ItemName;
	var() string Value;
	var() color ValColor;
};
var() localized ComboVal RGBListValues[16];

var NWColorBitmap RGBSample;
var NWUWindowHSliderControl RGBControl[3];
var NWUWindowComboControl RGBList;

function Created()
{
local byte i;
local float X, Y, W, H;

	Super.Created();

	//Init
	WinHeight = 100;
	X = 10;
	Y = 20;
	W = WinWidth*0.65 - 20;
	H = 1;
	
	//List
	RGBList = NWUWindowComboControl(CreateWindow(Class'NWUWindowComboControl', X, Y, W, H));
	RGBList.SetText(RGBListCaption);
	RGBList.SetEditable(False);
	RGBList.EditBoxWidth = Int(W * 0.75);
	RGBList.PageNotifier = Self;
	for (i = 0; i < ArrayCount(RGBListValues); i++)
	{
		if (RGBListValues[i].ItemName != "" && RGBListValues[i].Value != "")
			RGBList.AddItem(" "$RGBListValues[i].ItemName, RGBListValues[i].Value);
	}
	RGBList.NotifyWindow = ControlNotifier;
	
	//Color sliders
	for (i = 0; i < ArrayCount(RGBControl); i++)
	{
		Y = 40 + i*20;
		RGBControl[i] = NWUWindowHSliderControl(CreateWindow(Class'NWUWindowHSliderControl', X, Y, W, H));
		RGBControl[i].SetText(RGBControlsCaption[i]);
		RGBControl[i].bNoSlidingNotify = False;
		RGBControl[i].SetRange(0, 255, 16);
		RGBControl[i].SliderWidth = Int(W * 0.75);
		RGBControl[i].TrackWidth = 8;
		RGBControl[i].NotifyWindow = ControlNotifier;
		RGBControl[i].PageNotifier = Self;
	}
	
	//Bitmap sample
	W = 64;
	H = 64;
	X = WinWidth - W - Class'NWColorBitmap'.default.FrameSize*2;
	Y = 20 + (80 - H)/2 - Class'NWColorBitmap'.default.FrameSize*2;
	RGBSample = NWColorBitmap(CreateWindow(Class'NWColorBitmap', X, Y, W, H));
	RGBSample.T = RGBDefaultTex;
	RGBSample.bDrawFrame = True;
	RGBSample.Notifier = Self;
	RGBSample.PageNotifier = Self;
}

function SetColorSampleTexture(texture T)
{
	if (T != None && RGBSample != None)
		RGBSample.T = T;
}

function SetColorSampleColor(color C)
{
	if (RGBSample != None)
		RGBSample.TexColor = C;
}

function NotifyControl(UWindowDialogControl C, byte E)
{
local color RGBCtrl;

	if (!bIgnoreNotfications && E == DE_Change)
	{
		if (C == RGBList)
		{
			SetupColorByVal(RGBList.GetValue2());
			Notify(DE_Change);
		}
		else if (C == RGBControl[0] || C == RGBControl[1] || C == RGBControl[2])
		{
			RGBCtrl.R = RGBControl[0].GetValue();
			RGBCtrl.G = RGBControl[1].GetValue();
			RGBCtrl.B = RGBControl[2].GetValue();
			SetColor(RGBCtrl);
		}
	}
	else if (E != DE_Change)
		Notify(E);
}

function color GetColor()
{
	return RGB;
}

function SetColor(color C, optional bool bSetDefault)
{
	SetupColor(C);
	if (bSetDefault && RGBList != None)
		SetupColorByVal(RGBList.GetValue2());
	Notify(DE_Change);
}

function SetupColor(color C)
{
local byte i;
local bool bSetValue;

	RGB = C;
	SetColorSampleColor(RGB);
	
	bIgnoreNotfications = True;
	for (i = 0; i < ArrayCount(RGBListValues); i++)
	{
		if (RGBListValues[i].ValColor == RGB)
		{
			RGBList.SetValue(" "$RGBListValues[i].ItemName, RGBListValues[i].Value);
			bSetValue = True;
			break;
		}
	}
	if (!bSetValue)
		RGBList.SetValue(" "$RGBListValues[ArrayCount(RGBListValues)-1].ItemName, RGBListValues[ArrayCount(RGBListValues)-1].Value);
	bIgnoreNotfications = False;
}

function SetupColorByVal(string val)
{
local byte i;

	if (val == "")
		return;
	if (Caps(val) != Caps(RGBListValues[ArrayCount(RGBListValues)-1].Value))
	{
		for (i = 0; i < ArrayCount(RGBListValues); i++)
		{
			if (RGBListValues[i].Value ~= val)
			{
				RGB = RGBListValues[i].ValColor;
				break;
			}
		}
	}

	bIgnoreNotfications = True;
	RGBControl[0].SetValue(RGB.R);
	RGBControl[1].SetValue(RGB.G);
	RGBControl[2].SetValue(RGB.B);
	bIgnoreNotfications = False;
	SetColorSampleColor(RGB);
}


defaultproperties
{
	RGBDefaultTex=ColorSampleTex
	
	RGBControlsCaption(0)="Red"
	RGBControlsCaption(1)="Green"
	RGBControlsCaption(2)="Blue"
	RGBListCaption="Color"
	
	RGBListValues(0)=(ItemName="Red",Value="red",ValColor=(R=255,G=0,B=0))
	RGBListValues(1)=(ItemName="Blue",Value="blue",ValColor=(R=0,G=0,B=255))
	RGBListValues(2)=(ItemName="Green",Value="green",ValColor=(R=0,G=255,B=0))
	RGBListValues(3)=(ItemName="Yellow",Value="yellow",ValColor=(R=255,G=255,B=0))
	RGBListValues(4)=(ItemName="Cyan",Value="cyan",ValColor=(R=0,G=255,B=255))
	RGBListValues(5)=(ItemName="Pink",Value="pink",ValColor=(R=255,G=0,B=255))
	RGBListValues(6)=(ItemName="Purple",Value="purple",ValColor=(R=128,G=0,B=255))
	RGBListValues(7)=(ItemName="Orange",Value="orange",ValColor=(R=255,G=64,B=0))
	RGBListValues(8)=(ItemName="Brown",Value="brown",ValColor=(R=128,G=64,B=0))
	RGBListValues(9)=(ItemName="White",Value="white",ValColor=(R=255,G=255,B=255))
	RGBListValues(10)=(ItemName="Grey",Value="grey",ValColor=(R=128,G=128,B=128))
	RGBListValues(11)=(ItemName="Black",Value="black",ValColor=(R=0,G=0,B=0))
	RGBListValues(15)=(ItemName="Custom",Value="custom")
}
