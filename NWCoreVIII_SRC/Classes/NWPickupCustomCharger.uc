//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWPickupCustomCharger expands NWChargerCustom;

#exec MESH IMPORT MESH=NWPickupCustomCharger ANIVFILE=MODELS\NWPickupCustomCharger_a.3d DATAFILE=MODELS\NWPickupCustomCharger_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=NWPickupCustomCharger X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWPickupCustomCharger SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWPickupCustomCharger SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWPickupCustomCharger MESH=NWPickupCustomCharger
#exec MESHMAP SCALE MESHMAP=NWPickupCustomCharger X=0.2 Y=0.2 Z=0.4


function float getScaleByInv(Inventory Inv)
{
	if (NaliPickups(Inv) != None)
		return NaliPickups(Inv).ChargerScale;
	return 1.0;
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWPickupCustomCharger
	
	InvSpawnHeight=32.000000
}
