//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltBlackSmoke expands UT_SpriteSmokePuff;

#exec OBJ LOAD FILE=Textures\BlackSmoke.utx PACKAGE=NWSuperBoltRifleVIII_SRC.BlackSmoke

defaultproperties
{
	SSprites(0)=BlackCloud_A01
    SSprites(1)=BlackCloud_A05
    SSprites(2)=BlackCloud_A10
    SSprites(3)=BlackCloud_A15
	NumSets=4
	Texture=BlackCloud_A01
	Style=STY_Modulated
	SpriteProjForward=8.000000
}