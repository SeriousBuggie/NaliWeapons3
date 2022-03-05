//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileTurret expands MultiMissileTurretBase;

#exec MESH IMPORT MESH=MultiMissileTurret ANIVFILE=MODELS\MultiMissileTurret_a.3d DATAFILE=MODELS\MultiMissileTurret_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMissileTurret STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMissileTurret X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=MultiMissileTurret SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissileTurret SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMissileTurret MESH=MultiMissileTurret
#exec MESHMAP SCALE MESHMAP=MultiMissileTurret X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_MultiMTurret01 FILE=SKINS\Sk_MultiMTurret01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileTurret NUM=1 TEXTURE=Sk_MultiMTurret01

#exec TEXTURE IMPORT NAME=Sk_MultiMTurret02 FILE=SKINS\Sk_MultiMTurret02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileTurret NUM=2 TEXTURE=Sk_MultiMTurret02


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMissileTurret
}
