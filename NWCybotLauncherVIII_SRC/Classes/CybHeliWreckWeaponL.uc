//////////////////////////////////////////////////////////////
//				Feralidragon (12-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeliWreckWeaponL expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybHeliWreckWeaponL ANIVFILE=MODELS\CybHeliWreckWeapon_a.3d DATAFILE=MODELS\CybHeliWreckWeapon_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybHeliWreckWeaponL STRENGTH=0.2
#exec MESH ORIGIN MESH=CybHeliWreckWeaponL X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybHeliWreckWeaponL SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybHeliWreckWeaponL SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybHeliWreckWeaponL MESH=CybHeliWreckWeaponL
#exec MESHMAP SCALE MESHMAP=CybHeliWreckWeaponL X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHeliWreckWeaponL
}
