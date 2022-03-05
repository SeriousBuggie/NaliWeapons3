//////////////////////////////////////////////////////////////
//				Feralidragon (05-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWeaponLockerArm expands NWLockerArm;

#exec MESH IMPORT MESH=NWWeaponLockerArm ANIVFILE=MODELS\NWWeaponLockerArm_a.3d DATAFILE=MODELS\NWWeaponLockerArm_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWeaponLockerArm STRENGTH=0.25
#exec MESH ORIGIN MESH=NWWeaponLockerArm X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWWeaponLockerArm SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWeaponLockerArm SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWWeaponLockerArm MESH=NWWeaponLockerArm
#exec MESHMAP SCALE MESHMAP=NWWeaponLockerArm X=0.15 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=NWWeaponLockerArm_Sk FILE=SKINS\NWWeaponLockerArm_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWWeaponLockerArm NUM=1 TEXTURE=NWWeaponLockerArm_Sk

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWWeaponLockerArm
}
