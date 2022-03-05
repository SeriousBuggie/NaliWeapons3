//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWAmmoCustomCharger expands NWChargerCustom;

#exec MESH IMPORT MESH=NWAmmoCustomCharger ANIVFILE=MODELS\NWAmmoCustomCharger_a.3d DATAFILE=MODELS\NWAmmoCustomCharger_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=NWAmmoCustomCharger X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWAmmoCustomCharger SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWAmmoCustomCharger SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWAmmoCustomCharger MESH=NWAmmoCustomCharger
#exec MESHMAP SCALE MESHMAP=NWAmmoCustomCharger X=0.075 Y=0.075 Z=0.15

var() float RadScaleDiv;

function float getScaleByInv(Inventory Inv)
{
	return (Inv.CollisionRadius / RadScaleDiv);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWAmmoCustomCharger
	
	InvSpawnHeight=0.000000
	RadScaleDiv=18.000000
}
