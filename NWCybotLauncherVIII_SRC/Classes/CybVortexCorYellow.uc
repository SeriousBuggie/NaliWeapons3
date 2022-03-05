//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexCorYellow expands CybVortexCorRed;

#exec TEXTURE IMPORT NAME=CybLensAYellow FILE=Coronas\CybLensAYellow.bmp GROUP=LensFlare FLAGS=2
#exec TEXTURE IMPORT NAME=CybLensBYellow FILE=Coronas\CybLensBYellow.bmp GROUP=LensFlare FLAGS=2
#exec TEXTURE IMPORT NAME=CybLensCYellow FILE=Coronas\CybLensCYellow.bmp GROUP=LensFlare FLAGS=2

defaultproperties
{
	CoronaSprite=CybKamikazeChargeCorYellow
	
	LensFlareParts(0)=(LensSprite=Texture'CybLensCYellow')
	LensFlareParts(1)=(LensSprite=Texture'CybLensAYellow')
	LensFlareParts(2)=(LensSprite=Texture'CybLensBYellow')
	LensFlareParts(3)=(LensSprite=Texture'CybProjCorYellow')
	LensFlareParts(4)=(LensSprite=Texture'CybProjCorYellow')
	LensFlareParts(5)=(LensSprite=Texture'CybLensAYellow')
	LensFlareParts(6)=(LensSprite=Texture'CybProjCorYellow')
	LensFlareParts(7)=(LensSprite=Texture'CybLensBYellow')
	LensFlareParts(8)=(LensSprite=Texture'CybProjCorYellow')
}
