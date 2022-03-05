//////////////////////////////////////////////////////////////
//	Nali Weapons III Control
//				Feralidragon (26-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWMenuControl expands UWindowDialogControl
abstract;

var NWControlNotifier ControlNotifier;
var bool bIgnoreNotfications;
var UWindowWindow PageNotifier;

function Created()
{
	Super.Created();
	ControlNotifier = NWControlNotifier(CreateWindow(Class'NWControlNotifier', 0, 0, 0, 0));
	ControlNotifier.ControlNotify = Self;
}

function Paint(Canvas C, float X, float Y)
{
	if (Text != "")
	{
		C.DrawColor = TextColor;
		C.Font = Root.Fonts[Font];
		ClipText(C, TextX, TextY, Text);
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
	}
	
	Super.Paint(C, X, Y);
}

function NotifyControl(UWindowDialogControl C, byte E);

function MouseMove(float X, float Y)
{
	Super.MouseMove(X, Y);
	if (PageNotifier != None)
		PageNotifier.MouseMove(WinLeft + X, WinTop + Y);
}


defaultproperties
{
}
