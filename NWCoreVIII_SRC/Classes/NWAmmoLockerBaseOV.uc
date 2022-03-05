//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWAmmoLockerBaseOV expands NWColoredOV;

#exec MESH IMPORT MESH=NWAmmoLockerBaseOV ANIVFILE=MODELS\NWAmmoLockerBaseOV_a.3d DATAFILE=MODELS\NWAmmoLockerBaseOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWAmmoLockerBaseOV STRENGTH=0.25
#exec MESH ORIGIN MESH=NWAmmoLockerBaseOV X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWAmmoLockerBaseOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWAmmoLockerBaseOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWAmmoLockerBaseOV MESH=NWAmmoLockerBaseOV
#exec MESHMAP SCALE MESHMAP=NWAmmoLockerBaseOV X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=NWAmmoLockerBase_OVR FILE=OVERLAYERS\NWAmmoLockerBase_OVR.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWAmmoLockerBase_OVG FILE=OVERLAYERS\NWAmmoLockerBase_OVG.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWAmmoLockerBase_OVB FILE=OVERLAYERS\NWAmmoLockerBase_OVB.bmp GROUP=Overlayers LODSET=2


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWAmmoLockerBaseOV
	
	RGB(0)=NWAmmoLockerBase_OVR
	RGB(1)=NWAmmoLockerBase_OVG
	RGB(2)=NWAmmoLockerBase_OVB
}
