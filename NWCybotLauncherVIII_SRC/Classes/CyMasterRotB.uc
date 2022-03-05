//////////////////////////////////////////////////////////////
//				Feralidragon (07-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMasterRotB expands CyMasterRotA;

#exec MESH IMPORT MESH=CyMasterRotB ANIVFILE=MODELS\CyMasterRotB_a.3d DATAFILE=MODELS\CyMasterRotB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMasterRotB STRENGTH=0
#exec MESH ORIGIN MESH=CyMasterRotB X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMasterRotB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMasterRotB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMasterRotB MESH=CyMasterRotB
#exec MESHMAP SCALE MESHMAP=CyMasterRotB X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=CyMasterRot_OV FILE=SKINS\CyMasterRot_OV.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CyMasterRotB NUM=1 TEXTURE=CyMasterRot_OV

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMasterRotB
	
	CyMasterRotOVClass=Class'CyMasterRotOVB'
	RotRate=35000.000000
	RotRate2=0.000000
	UsedRotComponent=ROTC_Yaw
	bDependOnCyConRot=True
}
