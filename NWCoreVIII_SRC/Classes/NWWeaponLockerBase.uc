//////////////////////////////////////////////////////////////
//				Feralidragon (05-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWeaponLockerBase expands NWLockerBase;

#exec MESH IMPORT MESH=NWWeaponLockerBase ANIVFILE=MODELS\NWWeaponLockerBase_a.3d DATAFILE=MODELS\NWWeaponLockerBase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWeaponLockerBase STRENGTH=0.25
#exec MESH ORIGIN MESH=NWWeaponLockerBase X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWWeaponLockerBase SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWeaponLockerBase SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWWeaponLockerBase MESH=NWWeaponLockerBase
#exec MESHMAP SCALE MESHMAP=NWWeaponLockerBase X=0.15 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=NWWeaponLockerBase_Sk FILE=SKINS\NWWeaponLockerBase_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWWeaponLockerBase NUM=1 TEXTURE=NWWeaponLockerBase_Sk

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWWeaponLockerBase
	
	SpawnRadius=40.000000
	SpawnHeight=50.000000
	ArmClass=Class'NWWeaponLockerArm'
	bAddInventoryRadius=False
	bTopDown=True
	OVClass=Class'NWWeaponLockerBaseOV'
}
