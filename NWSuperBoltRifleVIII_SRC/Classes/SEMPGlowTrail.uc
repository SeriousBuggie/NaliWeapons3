//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPGlowTrail expands NaliTrail;

#exec TEXTURE IMPORT NAME=SEMPGlow FILE=Coronas\SEMPGlow.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
    DrawType=DT_Sprite
    Texture=SEMPGlow
	Style=STY_Translucent
	bUnlit=True
	
	//DrawScale=0.375000
	DrawScale=0.275000
	ScaleGlow=2.000000
	SpriteProjForward=0.000000
}
