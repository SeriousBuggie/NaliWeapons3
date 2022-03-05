//////////////////////////////////////////////////////////////
//	Nali Weapons III Menu Framed window
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWFramedWindow expands UWindowFramedWindow;

var class<NWMainModMenuInfo> ModMenuInfoClass;

function InitWindow(class<NWMainModMenuInfo> NWmiClass, optional byte advIndex)
{
	if (NWmiClass == None || Root == None)
		return;
	
	ModMenuInfoClass = NWmiClass;
	bSizable = (ModMenuInfoClass.default.bSizableMainMenuW || ModMenuInfoClass.default.bSizableMainMenuH);
	WindowTitle = ModMenuInfoClass.default.MainMenuTitle;
	SetMinDimensions();
	if (NWDialogClientWindow(ClientArea) != None)
		NWDialogClientWindow(ClientArea).InitClientWindow(ModMenuInfoClass, WinWidth, advIndex);
}

function SetMinDimensions()
{
	if (ModMenuInfoClass.default.bSizableMainMenuW)
	{
		MinWinWidth = ModMenuInfoClass.default.MainMenuMinSizeW;
		if (ModMenuInfoClass.default.bMainMenuSizePercentageW)
			MinWinWidth *= Root.WinWidth;
	}
	else
		MinWinWidth = WinWidth;
		
	if (ModMenuInfoClass.default.bSizableMainMenuH)
	{
		MinWinHeight = ModMenuInfoClass.default.MainMenuMinSizeH;
		if (ModMenuInfoClass.default.bMainMenuSizePercentageH)
			MinWinHeight *= Root.WinHeight;
	}
	else
		MinWinHeight = WinHeight;
}

static function getSizeAndPos(class<NWMainModMenuInfo> NWmi, float rootW, float rootH, out float X, out float Y, out float W, out float H)
{
	if (NWmi == None)
		return;
	
	X = NWmi.default.MainMenuPosX;
	Y = NWmi.default.MainMenuPosY;
	W = NWmi.default.MainMenuSizeW;
	H = NWmi.default.MainMenuSizeH;

	if (NWmi.default.bMainMenuPosPercentageX)
		X *= rootW;
	if (NWmi.default.bMainMenuPosPercentageY)
		Y *= rootH;

	if (NWmi.default.bMainMenuSizePercentageW)
		W *= rootW;
	if (NWmi.default.bMainMenuSizePercentageH)
		H *= rootH;
	
	if (NWmi.default.bCenterMainMenu)
	{
		X += ((rootW - W) / 2);
		Y += ((rootH - H) / 2);
	}
}

function SetSizePos()
{
local float X, Y, W, H;

	if (ModMenuInfoClass == None || Root == None)
		return;

	getSizeAndPos(ModMenuInfoClass, Root.WinWidth, Root.WinHeight, X, Y, W, H);
	WinLeft = X;
	WinTop = Y;
	SetSize(FMax(MinWinWidth, W), FMax(MinWinHeight, H));
}


function ResolutionChanged(float W, float H)
{
    SetSizePos();
	SetMinDimensions();
    Super.ResolutionChanged(W, H);
}

function Resized()
{
	Super.Resized();
	if (!ModMenuInfoClass.default.bSizableMainMenuW || WinWidth < MinWinWidth)
		WinWidth = MinWinWidth;
	if (!ModMenuInfoClass.default.bSizableMainMenuH || WinHeight < MinWinHeight)
		WinHeight = MinWinHeight;
}


defaultproperties
{
	bStatusBar=False
	StatusBarText=""
    ClientClass=class'NWDialogClientWindow'
}

