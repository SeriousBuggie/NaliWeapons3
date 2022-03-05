//////////////////////////////////////////////////////////////
//	Nali Weapons III Control Notifier
//				Feralidragon (26-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWControlNotifier expands UWindowDialogClientWindow;

var NWMenuControl ControlNotify;

function Notify(UWindowDialogControl C, byte E)
{
	if (ControlNotify != None)
		ControlNotify.NotifyControl(C, E);
}

function Paint(Canvas C, float X, float Y);


defaultproperties
{
}
