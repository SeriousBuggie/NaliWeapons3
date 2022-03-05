//////////////////////////////////////////////////////////////
//	Nali Weapons III Mod Menu item
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWModMenuItem expands UMenuModMenuItem;

var() class<NWMainModMenuInfo> ModMenuInfoClass;

function Setup()
{
	if (ModMenuInfoClass == None)
		return;

	MenuCaption = ModMenuInfoClass.default.MainMenuCaption;
	MenuHelp = ModMenuInfoClass.default.MainMenuHelp;
}

function Execute()
{
local float X, Y, W, H;
local NWFramedWindow NWfw;

	if (ModMenuInfoClass == None || MenuItem == None || MenuItem.Owner == None || MenuItem.Owner.Root == None)
		return;

	Class'NWFramedWindow'.static.getSizeAndPos(ModMenuInfoClass, MenuItem.Owner.Root.WinWidth, MenuItem.Owner.Root.WinHeight, X, Y, W, H);
	NWfw = NWFramedWindow(MenuItem.Owner.Root.CreateWindow(Class'NWFramedWindow', X, Y, W, H,, ModMenuInfoClass.default.bUniqueMainMenu));
	if (NWfw != None)
		NWfw.InitWindow(ModMenuInfoClass);
}

defaultproperties
{
}
