//////////////////////////////////////////////////////////////
//	Nali Weapons III No Ammo message class
//				Feralidragon (17-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NoAmmoStringPlus expands CriticalStringPlus;

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
	DrawColor=(R=255,G=64,B=0)
	bCenter=True
}

