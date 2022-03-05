//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCTurret expands IRPRCTurretBase;

#exec MESH IMPORT MESH=IRPRCTurret ANIVFILE=MODELS\IRPRCTurret_a.3d DATAFILE=MODELS\IRPRCTurret_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRCTurret STRENGTH=0.0
#exec MESH ORIGIN MESH=IRPRCTurret X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=IRPRCTurret SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCTurret SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IRPRCTurret MESH=IRPRCTurret
#exec MESHMAP SCALE MESHMAP=IRPRCTurret X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_IRPRCTurret01 FILE=SKINS\Sk_IRPRCTurret01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCTurret NUM=1 TEXTURE=Sk_IRPRCTurret01

#exec TEXTURE IMPORT NAME=Sk_IRPRCTurret02 FILE=SKINS\Sk_IRPRCTurret02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCTurret NUM=2 TEXTURE=Sk_IRPRCTurret02


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRCTurret
}
