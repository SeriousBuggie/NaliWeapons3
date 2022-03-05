//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexCorBlue expands CybVortexCorRed;

#exec TEXTURE IMPORT NAME=CybLensABlue FILE=Coronas\CybLensABlue.bmp GROUP=LensFlare FLAGS=2
#exec TEXTURE IMPORT NAME=CybLensBBlue FILE=Coronas\CybLensBBlue.bmp GROUP=LensFlare FLAGS=2
#exec TEXTURE IMPORT NAME=CybLensCBlue FILE=Coronas\CybLensCBlue.bmp GROUP=LensFlare FLAGS=2

defaultproperties
{
	CoronaSprite=CybKamikazeChargeCorBlue
	
	LensFlareParts(0)=(LensSprite=Texture'CybLensCBlue')
	LensFlareParts(1)=(LensSprite=Texture'CybLensABlue')
	LensFlareParts(2)=(LensSprite=Texture'CybLensBBlue')
	LensFlareParts(3)=(LensSprite=Texture'CybProjCorBlue')
	LensFlareParts(4)=(LensSprite=Texture'CybProjCorBlue')
	LensFlareParts(5)=(LensSprite=Texture'CybLensABlue')
	LensFlareParts(6)=(LensSprite=Texture'CybProjCorBlue')
	LensFlareParts(7)=(LensSprite=Texture'CybLensBBlue')
	LensFlareParts(8)=(LensSprite=Texture'CybProjCorBlue')
}
