//////////////////////////////////////////////////////////////
//	Nali Weapons III Menu Scroll page window
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWMenuPageScroll expands UWindowScrollingDialogClient;

function InitPageScroll(class<NWMenuPageInfo> NWMInfoClass, optional byte advIndex)
{
	if (NWMenuPage(ClientArea) != None)
		NWMenuPage(ClientArea).InitPage(NWMInfoClass, advIndex);
}

defaultproperties
{
	ClientClass=Class'NWMenuPage'
	FixedAreaClass=None
}