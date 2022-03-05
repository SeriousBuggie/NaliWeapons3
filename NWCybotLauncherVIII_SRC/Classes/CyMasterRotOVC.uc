//////////////////////////////////////////////////////////////
//				Feralidragon (07-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMasterRotOVC expands CyMasterRotOVA;

#exec MESH IMPORT MESH=CyMasterRotOVC ANIVFILE=MODELS\CyMasterRotOVC_a.3d DATAFILE=MODELS\CyMasterRotOVC_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMasterRotOVC STRENGTH=0
#exec MESH ORIGIN MESH=CyMasterRotOVC X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMasterRotOVC SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMasterRotOVC SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMasterRotOVC MESH=CyMasterRotOVC
#exec MESHMAP SCALE MESHMAP=CyMasterRotOVC X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=CyMasterRot_Sk FILE=SKINS\CyMasterRot_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CyMasterRotOVC NUM=1 TEXTURE=CyMasterRot_Sk

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMasterRotOVC
}
