//////////////////////////////////////////////////////////////
//				Feralidragon (05-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWAmmoLockerArm expands NWLockerArm;

#exec MESH IMPORT MESH=NWAmmoLockerArm ANIVFILE=MODELS\NWAmmoLockerArm_a.3d DATAFILE=MODELS\NWAmmoLockerArm_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=NWAmmoLockerArm STRENGTH=0.25 //Not enough polys for strength param
#exec MESH ORIGIN MESH=NWAmmoLockerArm X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWAmmoLockerArm SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWAmmoLockerArm SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWAmmoLockerArm MESH=NWAmmoLockerArm
#exec MESHMAP SCALE MESHMAP=NWAmmoLockerArm X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=NWAmmoLockerArm_Sk FILE=SKINS\NWAmmoLockerArm_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWAmmoLockerArm NUM=1 TEXTURE=NWAmmoLockerArm_Sk

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWAmmoLockerArm
}
