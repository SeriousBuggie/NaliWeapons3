//////////////////////////////////////////////////////////////
//				Feralidragon (24-06-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDeathMsg expands LocalMessagePlus;

var() localized string CybotDeathMsg;

static function float GetOffset(int Switch, float YL, float ClipY )
{
    return (Default.YPos/768.0) * ClipY + 5*YL;
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2,
optional Object OptionalObject)
{
	if (Cybot(OptionalObject) != None)
		return Cybot(OptionalObject).MyName $ Default.CybotDeathMsg;
	else
		return "One of your Cybots was destroyed";
}

defaultproperties
{
	FontSize=1
	bIsSpecial=True
	bIsUnique=True
	bFadeMessage=True
	DrawColor=(R=255,G=128,B=0)
	YPos=128.000000
	bCenter=True
	
	CybotDeathMsg=" was destroyed"
}
