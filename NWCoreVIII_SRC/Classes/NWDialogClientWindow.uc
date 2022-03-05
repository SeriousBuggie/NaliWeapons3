//////////////////////////////////////////////////////////////
//	Nali Weapons III Menu Dialog client window
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWDialogClientWindow expands UWindowDialogClientWindow;

var UWindowSmallCloseButton CloseButton;
var UWindowPageControl WPageControl;
var class<NWMainModMenuInfo> ModMenuInfoClass;

function InitClientWindow(class<NWMainModMenuInfo> NWmiClass, float W, optional byte advIndex)
{
local int i, j;
local string NWMClassStr;
local class<NWMenuPageInfo> NWMClass;
local UWindowPageControlPage NPageControlPage;
local PlayerPawn POwner;

	if (NWmiClass == None)
		return;

	ModMenuInfoClass = NWmiClass;
	WinWidth = W;
	WinHeight += 24;
	CloseButton = UWindowSmallCloseButton(CreateControl(class'UWindowSmallCloseButton', WinWidth-56, WinHeight-24, 48, 16));

	WPageControl = UWindowPageControl(CreateWindow(class'UWindowPageControl', 0, 0, WinWidth, WinHeight-24));
	WPageControl.SetMultiLine(True);
	
	POwner = GetPlayerOwner();
	if (POwner == None)
		return;
	
	//Load up tabs by .int files (24 max, more and it would be overkill for a menu, even 24 is perhaps too much, but well...)
	i = 0;
	while (i < 24)
	{
		NWMClassStr = POwner.GetNextInt(String(Class'NWMenuPageInfo'), j++);
		if (NWMClassStr == "")
			break;
		NWMClass = Class<NWMenuPageInfo>(DynamicLoadObject(NWMClassStr, class'Class'));
		if (NWMClass != None && NWMClass.default.PageTitle != "" && NWMClass.default.ModMenuInfoClass == ModMenuInfoClass)
		{
			NPageControlPage = WPageControl.AddPage(NWMClass.default.PageTitle, Class'NWMenuPageScroll');
			if (NPageControlPage != None && NWMenuPageScroll(NPageControlPage.Page) != None)
				NWMenuPageScroll(NPageControlPage.Page).InitPageScroll(NWMClass, advIndex);
			i++;
		}
	}
	
	Super.Created();
}

function Resized()
{
	if (WPageControl != None)
	{
		WPageControl.WinWidth = WinWidth;
		WPageControl.WinHeight = WinHeight - 24;   // OK, Cancel area
	}
	
	if (CloseButton != None)
	{
		CloseButton.WinLeft = WinWidth - 52;
		CloseButton.WinTop = WinHeight - 20;
	}
}

defaultproperties
{
}
