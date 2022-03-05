//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWeaponLockerBaseOV expands NWColoredOV;

#exec MESH IMPORT MESH=NWWeaponLockerBaseOV ANIVFILE=MODELS\NWWeaponLockerBaseOV_a.3d DATAFILE=MODELS\NWWeaponLockerBaseOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWeaponLockerBaseOV STRENGTH=0.25
#exec MESH ORIGIN MESH=NWWeaponLockerBaseOV X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWWeaponLockerBaseOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWeaponLockerBaseOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWWeaponLockerBaseOV MESH=NWWeaponLockerBaseOV
#exec MESHMAP SCALE MESHMAP=NWWeaponLockerBaseOV X=0.15 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=NWWeaponLockerBase_OVR FILE=OVERLAYERS\NWWeaponLockerBase_OVR.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWWeaponLockerBase_OVG FILE=OVERLAYERS\NWWeaponLockerBase_OVG.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWWeaponLockerBase_OVB FILE=OVERLAYERS\NWWeaponLockerBase_OVB.bmp GROUP=Overlayers LODSET=2


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWWeaponLockerBaseOV
	
	RGB(0)=NWWeaponLockerBase_OVR
	RGB(1)=NWWeaponLockerBase_OVG
	RGB(2)=NWWeaponLockerBase_OVB
}
