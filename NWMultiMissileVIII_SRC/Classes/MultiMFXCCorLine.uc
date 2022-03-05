//////////////////////////////////////////////////////////////
//				Feralidragon (05-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMFXCCorLine expands MultiMFXCCor;

#exec TEXTURE IMPORT NAME=MBoxMissileCorLineSmall FILE=Coronas\MBoxMissileCorLineSmall.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	Texture=MBoxMissileCorLineSmall
	MultiSkins(1)=MBoxMissileCorLineSmall
	
	DrawScale=0.110000
	ScaleGlow=1.500000
}
