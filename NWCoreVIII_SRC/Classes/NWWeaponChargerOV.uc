//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWeaponChargerOV expands NWColoredOV;

#exec MESH IMPORT MESH=NWWeaponChargerOV ANIVFILE=MODELS\NWWeaponChargerOV_a.3d DATAFILE=MODELS\NWWeaponChargerOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWeaponChargerOV STRENGTH=0.25
#exec MESH ORIGIN MESH=NWWeaponChargerOV X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWWeaponChargerOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWeaponChargerOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWWeaponChargerOV MESH=NWWeaponChargerOV
#exec MESHMAP SCALE MESHMAP=NWWeaponChargerOV X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NWWeaponCharger_OVR FILE=OVERLAYERS\NWWeaponCharger_OVR.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWWeaponCharger_OVG FILE=OVERLAYERS\NWWeaponCharger_OVG.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWWeaponCharger_OVB FILE=OVERLAYERS\NWWeaponCharger_OVB.bmp GROUP=Overlayers LODSET=2


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWWeaponChargerOV
	
	RGB(0)=NWWeaponCharger_OVR
	RGB(1)=NWWeaponCharger_OVG
	RGB(2)=NWWeaponCharger_OVB
}
