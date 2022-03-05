//////////////////////////////////////////////////////////////
//				Feralidragon (05-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWAmmoLockerBase expands NWLockerBase;

#exec MESH IMPORT MESH=NWAmmoLockerBase ANIVFILE=MODELS\NWAmmoLockerBase_a.3d DATAFILE=MODELS\NWAmmoLockerBase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWAmmoLockerBase STRENGTH=0.25
#exec MESH ORIGIN MESH=NWAmmoLockerBase X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWAmmoLockerBase SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWAmmoLockerBase SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWAmmoLockerBase MESH=NWAmmoLockerBase
#exec MESHMAP SCALE MESHMAP=NWAmmoLockerBase X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=NWAmmoLockerBase_Sk FILE=SKINS\NWAmmoLockerBase_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWAmmoLockerBase NUM=1 TEXTURE=NWAmmoLockerBase_Sk

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWAmmoLockerBase
	
	SpawnRadius=24.000000
	SpawnHeight=0.000000
	ArmClass=Class'NWAmmoLockerArm'
	bAddInventoryRadius=True
	bTopDown=False
	OVClass=Class'NWAmmoLockerBaseOV'
}
