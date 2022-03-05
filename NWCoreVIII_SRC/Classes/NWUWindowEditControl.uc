//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWUWindowEditControl expands UWindowEditControl;

var UWindowWindow PageNotifier;

function Created()
{
local Color C;

	Super(UWindowDialogControl).Created();
	EditBox = NWUWindowEditBox(CreateWindow(class'NWUWindowEditBox', 0, 0, WinWidth, WinHeight)); 
	EditBox.NotifyOwner = Self;
	EditBox.bSelectOnFocus = True;
	EditBoxWidth = WinWidth / 2;
	NWUWindowEditBox(EditBox).PageNotifier = Self;
	SetEditTextColor(LookAndFeel.EditBoxTextColor);
}

function SetValue(string NewValue)
{
	EditBox.SetValue(Left(NewValue, EditBox.MaxLength)); 
}

function MouseMove(float X, float Y)
{
	Super.MouseMove(X, Y);
	if (PageNotifier != None)
		PageNotifier.MouseMove(WinLeft + X, WinTop + Y);
}

defaultproperties
{
}
