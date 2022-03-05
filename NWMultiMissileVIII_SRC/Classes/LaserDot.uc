//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher Laser dot
//				Feralidragon (10-06-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class LaserDot expands NaliWEffects;

#exec OBJ LOAD FILE=Textures\StaticLasers.utx PACKAGE=NWMultiMissileVIII_SRC.StaticLasers

defaultproperties
{
	DrawType=DT_Sprite
	bHidden=True
	bUnlit=True
	ScaleGlow=0.500000
	Style=STY_Translucent
	bNetTemporary=False
	
	SpriteProjForward=4.000000
	Texture=LaserDotRed01
	DrawScale=0.075000
}
