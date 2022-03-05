//////////////////////////////////////////////////////////////
//				Feralidragon (27-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatMsgPlus expands CriticalStringPlus;

static function float GetOffset(int Switch, float YL, float ClipY )
{
    return 0.35 * ClipY;
}

defaultproperties
{
	FontSize=1
	bIsSpecial=True
	bIsUnique=True
	bFadeMessage=True
	bBeep=False
	DrawColor=(R=255,G=0,B=0)
	bCenter=True
}

