//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPGlowTrail expands NaliTrail;

#exec TEXTURE IMPORT NAME=EMPGlow FILE=Coronas\EMPGlow.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
    DrawType=DT_Sprite
    Texture=EMPGlow
	Style=STY_Translucent
	bUnlit=True
	
	//DrawScale=0.375000
	DrawScale=0.275000
	ScaleGlow=2.000000
	SpriteProjForward=0.000000
}
