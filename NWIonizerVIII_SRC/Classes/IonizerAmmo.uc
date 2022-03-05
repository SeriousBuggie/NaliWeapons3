//////////////////////////////////////////////////////////////
//	Nali Weapons III Ionizer ammo
//				Feralidragon (12-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerAmmo expands NaliAmmo;

#exec MESH IMPORT MESH=IonizerAmmo ANIVFILE=MODELS\IonizerAmmo_a.3d DATAFILE=MODELS\IonizerAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IonizerAmmo STRENGTH=0
#exec MESH ORIGIN MESH=IonizerAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonizerAmmo SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IonizerAmmo SEQ=Still STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerAmmo SEQ=Openning STARTFRAME=1 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=IonizerAmmo SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=IonizerAmmo SEQ=Opened STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerAmmo SEQ=Closed STARTFRAME=1 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonizerAmmo MESH=IonizerAmmo
#exec MESHMAP SCALE MESHMAP=IonizerAmmo X=0.075 Y=0.075 Z=0.15

#exec TEXTURE IMPORT NAME=Sk_IonizerPainterAmmo FILE=SKINS\Sk_IonizerPainterAmmo.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerAmmo NUM=1 TEXTURE=Sk_IonizerPainterAmmo

#exec TEXTURE IMPORT NAME=IonizerMetal FILE=SKINS\IonizerMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="IonizerAmmo" FILE=SOUNDS\IonizerAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="IonizerAmmoOpen" FILE=SOUNDS\IonizerAmmoOpen.wav GROUP="Ammo"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerAmmo
	AmmoAmount=1
	MaxAmmo=4
	bCollideActors=True
	CollisionRadius=14.000000
	CollisionHeight=10.000000
	ItemName="Ionizer Ammo"
	MaxDesireability=0.500000
	PickupMessage="You picked an Ion-Uranium Battery"
	PickupSound=IonizerAmmo
	PickupViewMesh=IonizerAmmo
	AmmoAnimRate=0.500000
	AmmoAnimTime=2.000000
	Texture=IonizerMetal
	AmmoAnimSound=IonizerAmmoOpen
	RespawnTime=60.000000
	
	bMegaAmmo=True
}
