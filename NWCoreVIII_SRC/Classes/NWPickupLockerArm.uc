//////////////////////////////////////////////////////////////
//				Feralidragon (05-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWPickupLockerArm expands NWLockerArm;

#exec MESH IMPORT MESH=NWPickupLockerArm ANIVFILE=MODELS\NWPickupLockerArm_a.3d DATAFILE=MODELS\NWPickupLockerArm_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWPickupLockerArm STRENGTH=0.25
#exec MESH ORIGIN MESH=NWPickupLockerArm X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWPickupLockerArm SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWPickupLockerArm SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWPickupLockerArm MESH=NWPickupLockerArm
#exec MESHMAP SCALE MESHMAP=NWPickupLockerArm X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NWPickupLockerArm_Sk FILE=SKINS\NWPickupLockerArm_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWPickupLockerArm NUM=1 TEXTURE=NWPickupLockerArm_Sk

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWPickupLockerArm
}
