//////////////////////////////////////////////////////////////
//				Feralidragon (04-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWAmmoCharger expands NWCharger;

#exec MESH IMPORT MESH=NWAmmoCharger ANIVFILE=MODELS\NWAmmoCharger_a.3d DATAFILE=MODELS\NWAmmoCharger_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWAmmoCharger STRENGTH=0.35
#exec MESH ORIGIN MESH=NWAmmoCharger X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NWAmmoCharger SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWAmmoCharger SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWAmmoCharger MESH=NWAmmoCharger
#exec MESHMAP SCALE MESHMAP=NWAmmoCharger X=0.075 Y=0.075 Z=0.15

#exec TEXTURE IMPORT NAME=NWAmmoCharger_Sk FILE=SKINS\NWAmmoCharger_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWAmmoCharger NUM=1 TEXTURE=NWAmmoCharger_Sk


var() float RadScaleDiv;

function float getScaleByInv(Inventory Inv)
{
	return (Inv.CollisionRadius / RadScaleDiv);
}

defaultproperties
{
	Mesh=NWAmmoCharger
	Texture=NWChargerMetal
	
	InvSpawnHeight=8.000000
	OVClass=Class'NWAmmoChargerOV'
	RadScaleDiv=18.000000
}
