//////////////////////////////////////////////////////////////
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWMeatGlobPieceAlt expands NWMeatGlobPiece;


simulated function SetGoreType(class<NWGoreCBoard> newGoreBoardClass)
{
	Super(NWBodyPiece).SetGoreType(newGoreBoardClass);
	if (newGoreBoardClass != None)
		MultiSkins[1] = newGoreBoardClass.static.GetMeatTextureAlt();
}


defaultproperties
{
	MinDrawScale=1.5000000
	MaxDrawScale=3.5000000
	
	SlideAnim=Flying
	DropAnim=Flying
	SlideDecalXOffset=-8.000000
}