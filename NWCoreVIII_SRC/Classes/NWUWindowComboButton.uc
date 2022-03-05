//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWUWindowComboButton expands UWindowComboButton;

var UWindowWindow PageNotifier;

function MouseMove(float X, float Y)
{
	Super.MouseMove(X, Y);
	if (PageNotifier != None)
		PageNotifier.MouseMove(WinLeft + X, WinTop + Y);
}

defaultproperties
{
}
