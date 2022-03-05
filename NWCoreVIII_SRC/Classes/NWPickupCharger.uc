//////////////////////////////////////////////////////////////
//				Feralidragon (04-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWPickupCharger expands NWCharger;

#exec MESH IMPORT MESH=NWPickupCharger ANIVFILE=MODELS\NWPickupCharger_a.3d DATAFILE=MODELS\NWPickupCharger_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWPickupCharger STRENGTH=0.25
#exec MESH ORIGIN MESH=NWPickupCharger X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWPickupCharger SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWPickupCharger SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWPickupCharger MESH=NWPickupCharger
#exec MESHMAP SCALE MESHMAP=NWPickupCharger X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=NWPickupCharger_Sk FILE=SKINS\NWPickupCharger_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWPickupCharger NUM=1 TEXTURE=NWPickupCharger_Sk


function float getScaleByInv(Inventory Inv)
{
	if (NaliPickups(Inv) != None)
		return NaliPickups(Inv).ChargerScale;
	return 1.0;
}

defaultproperties
{
	Mesh=NWPickupCharger
	Texture=NWChargerMetal
	
	InvSpawnHeight=12.000000
	OVClass=Class'NWPickupChargerOV'
}
