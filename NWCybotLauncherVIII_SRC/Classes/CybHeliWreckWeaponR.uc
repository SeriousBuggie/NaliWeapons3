//////////////////////////////////////////////////////////////
//				Feralidragon (12-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeliWreckWeaponR expands CybHeliWreckWeaponL;

#exec MESH IMPORT MESH=CybHeliWreckWeaponR ANIVFILE=MODELS\CybHeliWreckWeapon_a.3d DATAFILE=MODELS\CybHeliWreckWeapon_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybHeliWreckWeaponR STRENGTH=0.2
#exec MESH ORIGIN MESH=CybHeliWreckWeaponR X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CybHeliWreckWeaponR SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybHeliWreckWeaponR SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybHeliWreckWeaponR MESH=CybHeliWreckWeaponR
#exec MESHMAP SCALE MESHMAP=CybHeliWreckWeaponR X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHeliWreckWeaponR
}
