//////////////////////////////////////////////////////////////
//				Feralidragon (15-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolWFOV expands NaliTrail;

#exec TEXTURE IMPORT NAME=UltimaSolWFOVTex FILE=SKINS\UltimaSolWFOVTex.bmp GROUP=Skins LODSET=1

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WallFrag01
	MultiSkins(1)=UltimaSolWFOVTex
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=2.000000
}
