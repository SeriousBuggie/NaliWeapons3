//////////////////////////////////////////////////////////////
//				Feralidragon (13-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCannonOuterMetal expands IRPRCannonInnerLaser;

#exec MESH IMPORT MESH=IRPRCannonOuterMetal ANIVFILE=MODELS\IRPRCannonOuterMetal_a.3d DATAFILE=MODELS\IRPRCannonOuterMetal_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRCannonOuterMetal STRENGTH=0.0
#exec MESH ORIGIN MESH=IRPRCannonOuterMetal X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=IRPRCannonOuterMetal SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPRCannonOuterMetal SEQ=Opened STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannonOuterMetal SEQ=Closed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannonOuterMetal SEQ=Opening STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCannonOuterMetal SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IRPRCannonOuterMetal MESH=IRPRCannonOuterMetal
#exec MESHMAP SCALE MESHMAP=IRPRCannonOuterMetal X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=IRPRMetalIncand FILE=SKINS\IRPRMetalIncand.bmp GROUP=Skins LODSET=0 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCannonOuterMetal NUM=1 TEXTURE=IRPRMetalIncand

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRCannonOuterMetal
	bMeshEnviroMap=True
	Texture=IRPRMetalIncand
	ScaleGlow=2.000000
}
