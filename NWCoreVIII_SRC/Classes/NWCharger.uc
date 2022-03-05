//////////////////////////////////////////////////////////////
//	Nali Weapons III Inventory Charger
//				Feralidragon (04-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWCharger expands NWInvPods;

#exec TEXTURE IMPORT NAME=NWChargerMetal FILE=SKINS\NWChargerMetal.bmp GROUP=Skins LODSET=2


var() float InvSpawnHeight;
var() bool bAlwaysRotatingInv;

function float getInvSpawnHeight(Inventory Inv)
{
	return (InvSpawnHeight * DrawScale);
}

function float getScaleByInv(Inventory Inv)
{
	return 1.0;
}

defaultproperties
{
}