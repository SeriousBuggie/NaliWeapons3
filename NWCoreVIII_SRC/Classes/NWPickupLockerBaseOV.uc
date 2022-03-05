//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWPickupLockerBaseOV expands NWColoredOV;

#exec MESH IMPORT MESH=NWPickupLockerBaseOV ANIVFILE=MODELS\NWPickupLockerBaseOV_a.3d DATAFILE=MODELS\NWPickupLockerBaseOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWPickupLockerBaseOV STRENGTH=0.25
#exec MESH ORIGIN MESH=NWPickupLockerBaseOV X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWPickupLockerBaseOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWPickupLockerBaseOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWPickupLockerBaseOV MESH=NWPickupLockerBaseOV
#exec MESHMAP SCALE MESHMAP=NWPickupLockerBaseOV X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NWPickupLockerBase_OVR FILE=OVERLAYERS\NWPickupLockerBase_OVR.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWPickupLockerBase_OVG FILE=OVERLAYERS\NWPickupLockerBase_OVG.bmp GROUP=Overlayers LODSET=2
#exec TEXTURE IMPORT NAME=NWPickupLockerBase_OVB FILE=OVERLAYERS\NWPickupLockerBase_OVB.bmp GROUP=Overlayers LODSET=2


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWPickupLockerBaseOV
	
	RGB(0)=NWPickupLockerBase_OVR
	RGB(1)=NWPickupLockerBase_OVG
	RGB(2)=NWPickupLockerBase_OVB
}
