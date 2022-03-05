//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTGndEruptionSideOV expands NaliWEffects;

#exec MESH IMPORT MESH=FlameTGndEruptionSideOV ANIVFILE=MODELS\FlameTGndEruptionSideOV_a.3d DATAFILE=MODELS\FlameTGndEruptionSideOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTGndEruptionSideOV STRENGTH=0
#exec MESH ORIGIN MESH=FlameTGndEruptionSideOV X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FlameTGndEruptionSideOV SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTGndEruptionSideOV SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTGndEruptionSideOV SEQ=Pressurize STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=FlameTGndEruptionSideOV SEQ=BreakThrough STARTFRAME=9 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FlameTGndEruptionSideOV SEQ=Explode STARTFRAME=19 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FlameTGndEruptionSideOV SEQ=Crater STARTFRAME=31 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FlameTGndEruptionSideOV MESH=FlameTGndEruptionSideOV
#exec MESHMAP SCALE MESHMAP=FlameTGndEruptionSideOV X=0.4 Y=0.4 Z=0.8

#exec TEXTURE IMPORT NAME=FlameTGndLavaSidesOV FILE=EFFECTS\FlameTGndLavaSidesOV.bmp GROUP=Effects LODSET=2 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=FlameTGndEruptionSideOV NUM=1 TEXTURE=FlameTGndLavaSidesOV

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FlameTGndEruptionSideOV
	bAnimByOwner=True
	bUnlit=True
	ScaleGlow=2.000000
	Style=STY_Translucent
}
