//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MissileTrailA expands NaliTrail;

#exec TEXTURE IMPORT NAME=MissileLensFlare FILE=Coronas\MissileLensFlare.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	DrawType=DT_Sprite
	Style=STY_Translucent
	bUnlit=True
	Texture=MissileLensFlare
	DrawScale=0.385000
	ScaleGlow=1.450000
	SpriteProjForward=10.000000
}
