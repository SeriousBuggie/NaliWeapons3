//////////////////////////////////////////////////////////////
//				Feralidragon (04-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWeaponCharger expands NWCharger;

#exec MESH IMPORT MESH=NWWeaponCharger ANIVFILE=MODELS\NWWeaponCharger_a.3d DATAFILE=MODELS\NWWeaponCharger_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWeaponCharger STRENGTH=0.25
#exec MESH ORIGIN MESH=NWWeaponCharger X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWWeaponCharger SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWeaponCharger SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWWeaponCharger MESH=NWWeaponCharger
#exec MESHMAP SCALE MESHMAP=NWWeaponCharger X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NWWeaponCharger_Sk FILE=SKINS\NWWeaponCharger_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWWeaponCharger NUM=1 TEXTURE=NWWeaponCharger_Sk


defaultproperties
{
	Mesh=NWWeaponCharger
	Texture=NWChargerMetal
	
	InvSpawnHeight=24.000000
	bAlwaysRotatingInv=True
	OVClass=Class'NWWeaponChargerOV'
}
