//////////////////////////////////////////////////////////////
//	Nali Weapons III Locker Inventory decoy
//				Feralidragon (06-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWLockerInv expands Inventory;

var NWLockerBase LBase;

event float BotDesireability(Pawn Bot)
{
	if (LBase != None)
		return LBase.getBotDesireability(Bot);
	return -1;
}

function BecomePickup();

auto state Pickup
{
	function Touch(actor Other);

	function BeginState()
	{
		Super.BeginState();
		bCollideWorld = False;
	}

Begin:
	Sleep(0.1);
}

defaultproperties
{
	DrawType=DT_Sprite
	Texture=TranslucInvis
	Style=STY_Translucent
	DrawScale=0.100000
	bHidden=False
	bCollideWorld=False
	bCollideActors=False
}