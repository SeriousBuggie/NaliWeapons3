//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerGndIceAgeSideOV expands NaliWEffects;

#exec MESH IMPORT MESH=FreezerGndIceAgeSideOV ANIVFILE=MODELS\FreezerGndIceAgeSideOV_a.3d DATAFILE=MODELS\FreezerGndIceAgeSideOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerGndIceAgeSideOV STRENGTH=0
#exec MESH ORIGIN MESH=FreezerGndIceAgeSideOV X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FreezerGndIceAgeSideOV SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FreezerGndIceAgeSideOV SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerGndIceAgeSideOV SEQ=Pressurize STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=FreezerGndIceAgeSideOV SEQ=BreakThrough STARTFRAME=9 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FreezerGndIceAgeSideOV SEQ=Explode STARTFRAME=19 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FreezerGndIceAgeSideOV SEQ=Crater STARTFRAME=31 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerGndIceAgeSideOV MESH=FreezerGndIceAgeSideOV
#exec MESHMAP SCALE MESHMAP=FreezerGndIceAgeSideOV X=0.4 Y=0.4 Z=0.8

#exec TEXTURE IMPORT NAME=FreezerGndIceSidesOV FILE=EFFECTS\FreezerGndIceSidesOV.bmp GROUP=Effects LODSET=2 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=FreezerGndIceAgeSideOV NUM=1 TEXTURE=FreezerGndIceSidesOV

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FreezerGndIceAgeSideOV
	bAnimByOwner=True
	bUnlit=True
	ScaleGlow=2.000000
	Style=STY_Translucent
}
