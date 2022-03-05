//////////////////////////////////////////////////////////////
//	Nali Weapons III Loading message class
//				Feralidragon (17-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWLoadingStringPlus expands CriticalStringPlus;

static function float GetOffset(int Switch, float YL, float ClipY )
{
    return 0.45 * ClipY;
}

defaultproperties
{
	FontSize=1
	bIsSpecial=True
	bIsUnique=True
	bFadeMessage=True
	bBeep=False
	DrawColor=(R=255,G=255,B=255)
	bCenter=True
}

