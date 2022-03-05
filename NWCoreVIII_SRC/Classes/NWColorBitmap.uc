//////////////////////////////////////////////////////////////
//	Nali Weapons III Color bitmap
//				Feralidragon (26-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWColorBitmap expands UWindowWindow;

var texture T;
var color TexColor;
var bool bDrawFrame;
var int FrameSize;

var UWindowWindow PageNotifier;
var NWMenuColorControl Notifier;


function Paint(Canvas C, float X, float Y)
{
local texture tex;

	if (T == None)
		return;

	if (bDrawFrame)
	{
		if (T.USize == WinWidth)
			WinWidth += (FrameSize * 2);
		if (T.VSize == WinHeight)
			WinHeight += (FrameSize * 2);
		
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
		tex = GetLookAndFeelTexture();
		DrawUpBevel(C, 0, 0, WinWidth, WinHeight, tex);
	}
	
	C.DrawColor = TexColor;
	DrawStretchedTexture(C, FrameSize, FrameSize, WinWidth - (FrameSize*2), WinHeight - (FrameSize*2), T);
}

function MouseMove(float X, float Y)
{
	if (Notifier != None)
		Notifier.NotifyControl(None, DE_MouseMove);
	Super.MouseMove(X, Y);
	if (PageNotifier != None)
		PageNotifier.MouseMove(WinLeft + X, WinTop + Y);
}

function MouseLeave()
{
	Super.MouseLeave();
	if (Notifier != None)
		Notifier.NotifyControl(None, DE_MouseLeave);
}

function MouseEnter()
{
	Super.MouseEnter();
	if (Notifier != None)
		Notifier.NotifyControl(None, DE_MouseEnter);
}


defaultproperties
{
	FrameSize=3
}
