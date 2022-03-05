//////////////////////////////////////////////////////////////
//				Feralidragon (24-06-2011)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeCriticalZoneMsg expands LocalMessagePlus;

var(Messages) localized string ZoneMsg;

static function float GetOffset(int Switch, float YL, float ClipY )
{
    return (Default.YPos/768.0) * ClipY + 2*YL;
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2,
optional Object OptionalObject)
{
	return Default.ZoneMsg;
}

defaultproperties
{
	FontSize=2
	bIsSpecial=True
	bIsUnique=True
	bFadeMessage=True
	DrawColor=(R=255,G=0,B=0)
	YPos=196.000000
	bCenter=True
	
	ZoneMsg="You're in the CRITICAL ZONE!!"
}
