//////////////////////////////////////////////////////////////
//				Feralidragon (07-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMasterRotC expands CyMasterRotA;

#exec MESH IMPORT MESH=CyMasterRotC ANIVFILE=MODELS\CyMasterRotC_a.3d DATAFILE=MODELS\CyMasterRotC_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMasterRotC STRENGTH=0
#exec MESH ORIGIN MESH=CyMasterRotC X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMasterRotC SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMasterRotC SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMasterRotC MESH=CyMasterRotC
#exec MESHMAP SCALE MESHMAP=CyMasterRotC X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=CyMasterRot_OV FILE=SKINS\CyMasterRot_OV.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CyMasterRotC NUM=1 TEXTURE=CyMasterRot_OV

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMasterRotC
	
	CyMasterRotOVClass=Class'CyMasterRotOVC'
	RotRate=30000.000000
	RotRate2=0.000000
	UsedRotComponent=ROTC_Pitch
	bDependOnCyConRot=True
}
