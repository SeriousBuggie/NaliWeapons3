//////////////////////////////////////////////////////////////
//				Feralidragon (07-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMasterRotOVB expands CyMasterRotOVA;

#exec MESH IMPORT MESH=CyMasterRotOVB ANIVFILE=MODELS\CyMasterRotOVB_a.3d DATAFILE=MODELS\CyMasterRotOVB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMasterRotOVB STRENGTH=0
#exec MESH ORIGIN MESH=CyMasterRotOVB X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMasterRotOVB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMasterRotOVB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMasterRotOVB MESH=CyMasterRotOVB
#exec MESHMAP SCALE MESHMAP=CyMasterRotOVB X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=CyMasterRot_Sk FILE=SKINS\CyMasterRot_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CyMasterRotOVB NUM=1 TEXTURE=CyMasterRot_Sk

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMasterRotOVB
}
