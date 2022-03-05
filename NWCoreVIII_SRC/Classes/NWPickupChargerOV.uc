//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWPickupChargerOV expands NWColoredOV;

#exec MESH IMPORT MESH=NWPickupChargerOV ANIVFILE=MODELS\NWPickupChargerOV_a.3d DATAFILE=MODELS\NWPickupChargerOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWPickupChargerOV STRENGTH=0.25
#exec MESH ORIGIN MESH=NWPickupChargerOV X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWPickupChargerOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWPickupChargerOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWPickupChargerOV MESH=NWPickupChargerOV
#exec MESHMAP SCALE MESHMAP=NWPickupChargerOV X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=NWPickupCharger_OVR FILE=OVERLAYERS\NWPickupCharger_OVR.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWPickupCharger_OVG FILE=OVERLAYERS\NWPickupCharger_OVG.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWPickupCharger_OVB FILE=OVERLAYERS\NWPickupCharger_OVB.bmp GROUP=Overlayers LODSET=2


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWPickupChargerOV
	
	RGB(0)=NWPickupCharger_OVR
	RGB(1)=NWPickupCharger_OVG
	RGB(2)=NWPickupCharger_OVB
}
