//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerProjTrail expands NaliTrail;

#exec TEXTURE IMPORT NAME=FreezerProjCor FILE=Coronas\FreezerProjCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
    DrawType=DT_Sprite
    Texture=FreezerProjCor
	DrawScale=0.350000
	ScaleGlow=1.650000
	Style=STY_Translucent
	SpriteProjForward=16.000000
}
