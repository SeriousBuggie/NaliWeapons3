//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexCorGreen expands CybVortexCorRed;

#exec TEXTURE IMPORT NAME=CybLensAGreen FILE=Coronas\CybLensAGreen.bmp GROUP=LensFlare FLAGS=2
#exec TEXTURE IMPORT NAME=CybLensBGreen FILE=Coronas\CybLensBGreen.bmp GROUP=LensFlare FLAGS=2
#exec TEXTURE IMPORT NAME=CybLensCGreen FILE=Coronas\CybLensCGreen.bmp GROUP=LensFlare FLAGS=2

defaultproperties
{
	CoronaSprite=CybKamikazeChargeCorGreen
	
	LensFlareParts(0)=(LensSprite=Texture'CybLensCGreen')
	LensFlareParts(1)=(LensSprite=Texture'CybLensAGreen')
	LensFlareParts(2)=(LensSprite=Texture'CybLensBGreen')
	LensFlareParts(3)=(LensSprite=Texture'CybProjCorGreen')
	LensFlareParts(4)=(LensSprite=Texture'CybProjCorGreen')
	LensFlareParts(5)=(LensSprite=Texture'CybLensAGreen')
	LensFlareParts(6)=(LensSprite=Texture'CybProjCorGreen')
	LensFlareParts(7)=(LensSprite=Texture'CybLensBGreen')
	LensFlareParts(8)=(LensSprite=Texture'CybProjCorGreen')
}
