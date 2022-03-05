//////////////////////////////////////////////////////////////
//				Feralidragon (19-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonPainterLaserDot expands NaliWEffects;

#exec OBJ LOAD FILE=Textures\IonStaticLasers.utx PACKAGE=NWIonizerVIII_SRC.IonStaticLasers

defaultproperties
{
	DrawType=DT_Sprite
	bHidden=True
	bUnlit=True
	ScaleGlow=0.500000
	Style=STY_Translucent
	bNetTemporary=False
	
	SpriteProjForward=4.000000
	Texture=IonLaserDotRed01
	DrawScale=0.075000
}
