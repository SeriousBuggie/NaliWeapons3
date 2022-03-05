//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWeaponCustomCharger expands NWChargerCustom;

#exec MESH IMPORT MESH=NWWeaponCustomCharger ANIVFILE=MODELS\NWWeaponCustomCharger_a.3d DATAFILE=MODELS\NWWeaponCustomCharger_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=NWWeaponCustomCharger X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWWeaponCustomCharger SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWeaponCustomCharger SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWWeaponCustomCharger MESH=NWWeaponCustomCharger
#exec MESHMAP SCALE MESHMAP=NWWeaponCustomCharger X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWWeaponCustomCharger
	
	InvSpawnHeight=24.000000
}
