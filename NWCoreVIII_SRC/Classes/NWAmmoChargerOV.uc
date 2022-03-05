//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWAmmoChargerOV expands NWColoredOV;

#exec MESH IMPORT MESH=NWAmmoChargerOV ANIVFILE=MODELS\NWAmmoChargerOV_a.3d DATAFILE=MODELS\NWAmmoChargerOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWAmmoChargerOV STRENGTH=0.25
#exec MESH ORIGIN MESH=NWAmmoChargerOV X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWAmmoChargerOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWAmmoChargerOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWAmmoChargerOV MESH=NWAmmoChargerOV
#exec MESHMAP SCALE MESHMAP=NWAmmoChargerOV X=0.075 Y=0.075 Z=0.15

#exec TEXTURE IMPORT NAME=NWAmmoCharger_OVR FILE=OVERLAYERS\NWAmmoCharger_OVR.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWAmmoCharger_OVG FILE=OVERLAYERS\NWAmmoCharger_OVG.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWAmmoCharger_OVB FILE=OVERLAYERS\NWAmmoCharger_OVB.bmp GROUP=Overlayers LODSET=2


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWAmmoChargerOV
	
	RGB(0)=NWAmmoCharger_OVR
	RGB(1)=NWAmmoCharger_OVG
	RGB(2)=NWAmmoCharger_OVB
}
