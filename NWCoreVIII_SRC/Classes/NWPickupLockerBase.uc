//////////////////////////////////////////////////////////////
//				Feralidragon (05-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWPickupLockerBase expands NWLockerBase;

#exec MESH IMPORT MESH=NWPickupLockerBase ANIVFILE=MODELS\NWPickupLockerBase_a.3d DATAFILE=MODELS\NWPickupLockerBase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWPickupLockerBase STRENGTH=0.25
#exec MESH ORIGIN MESH=NWPickupLockerBase X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWPickupLockerBase SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWPickupLockerBase SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWPickupLockerBase MESH=NWPickupLockerBase
#exec MESHMAP SCALE MESHMAP=NWPickupLockerBase X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NWPickupLockerBase_Sk FILE=SKINS\NWPickupLockerBase_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWPickupLockerBase NUM=1 TEXTURE=NWPickupLockerBase_Sk

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWPickupLockerBase
	
	SpawnRadius=30.000000
	SpawnHeight=52.000000
	ArmClass=Class'NWPickupLockerArm'
	bAddInventoryRadius=True
	bTopDown=False
	OVClass=Class'NWPickupLockerBaseOV'
}
