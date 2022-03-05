//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWUWindowHelpTip expands UWindowLabelControl;

#exec TEXTURE IMPORT NAME=NWPixel FILE=ICONS\NWPixel.bmp GROUP=Icons MIPS=OFF LODSET=0

var() color BorderColor, BackgroundColor;
var() int Margin;
var() float FixedX, FixedY;
var string TxtLines[16];
var byte TxtLinesMax;
var float TxtHeight;

function SetupPos(float X, float Y)
{
	FixedX = X;
	FixedY = Y;
	WinLeft = FixedX;
	WinTop = 0;
}

function BeforePaint(Canvas C, float X, float Y)
{
local float W, H, WMax;
local byte i;

	Super(UWindowDialogControl).BeforePaint(C, X, Y);

	for (i = 0; i <= TxtLinesMax; i++)
	{
		TextSize(C, TxtLines[i], W, H);
		WMax = FMax(WMax, W);
	}
	TxtHeight = H;
	WinHeight = TxtHeight + TxtLinesMax*TxtHeight + (TxtLinesMax*2 + Margin*2)*Root.GUIScale;
	WinWidth = WMax + Margin*2*Root.GUIScale;
	WinTop = FixedY - WinHeight - 7*Root.GUIScale;
}

function bool CheckMousePassThrough(float X, float Y)
{
	return True;
}

function SetHelpText(string txt)
{
local byte i;
local int tPos;

	for (i = 0; i < ArrayCount(TxtLines); i++)
		TxtLines[i] = "";

	i = 0;
	while (InStr(txt, "%n%") >= 0 && i < ArrayCount(TxtLines))
	{
		tPos = InStr(txt, "%n%");
		TxtLines[i] = Left(txt, tPos);
		txt = Mid(txt, tPos + 3);
		i++;
		TxtLinesMax = i;
	}
	if (i < ArrayCount(TxtLines))
	{
		TxtLines[i] = txt;
		TxtLinesMax = i;
		if (TxtLines[i] == "" && TxtLinesMax > 0)
			TxtLinesMax--;
	}
}

function Paint(Canvas C, float X, float Y)
{
local float curX, curY;
local byte i;

	if (TxtLines[0] != "")
	{
		curX = C.CurX;
		curY = C.CurY;

		//Draw background
		C.DrawColor = BackgroundColor;
		C.SetPos(curX, curY);
		C.DrawPattern(Texture'NWPixel', WinWidth*Root.GUIScale, WinHeight*Root.GUIScale, Root.GUIScale);

		//Draw border
		C.DrawColor = BorderColor;
		C.SetPos(curX, curY);
		C.DrawPattern(Texture'NWPixel', Root.GUIScale, WinHeight*Root.GUIScale, Root.GUIScale);
		C.SetPos(curX, curY);
		C.DrawPattern(Texture'NWPixel', WinWidth*Root.GUIScale, Root.GUIScale, Root.GUIScale);
		C.SetPos(curX + (WinWidth - 1)*Root.GUIScale, curY);
		C.DrawPattern(Texture'NWPixel', Root.GUIScale, WinHeight*Root.GUIScale, Root.GUIScale);
		C.SetPos(curX, curY + (WinHeight - 1)*Root.GUIScale);
		C.DrawPattern(Texture'NWPixel', WinWidth*Root.GUIScale, Root.GUIScale, Root.GUIScale);
	
		//Draw text
		C.DrawColor = TextColor;
		C.Font = Root.Fonts[Font];
		for (i = 0; i <= TxtLinesMax; i++)
			ClipText(C, Margin*Root.GUIScale, i*TxtHeight + (Margin + i*2)*Root.GUIScale, TxtLines[i]);
		
		//Reset color
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
	}
}

defaultproperties
{
	TextColor=(R=0,G=0,B=0)
	BorderColor=(R=0,G=0,B=0)
	BackgroundColor=(R=255,G=255,B=230)
	Margin=3
	bTransient=True
	bAcceptsFocus=False
	bAcceptsHotKeys=False
	bHasKeyboardFocus=False
	bNoKeyboard=True
	bAcceptExternalDragDrop=False
}
