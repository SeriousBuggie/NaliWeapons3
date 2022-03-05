//////////////////////////////////////////////////////////////
//	Nali Weapons III The Miner ammo
//				Feralidragon (24-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheMinerAmmo expands NaliAmmo;

#exec MESH IMPORT MESH=TheMinerAmmo ANIVFILE=MODELS\TheMinerAmmo_a.3d DATAFILE=MODELS\TheMinerAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=TheMinerAmmo STRENGTH=0
#exec MESH ORIGIN MESH=TheMinerAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TheMinerAmmo SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=TheMinerAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerAmmo SEQ=Openning STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=TheMinerAmmo SEQ=Closing STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=TheMinerAmmo SEQ=Opened STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerAmmo SEQ=Closed STARTFRAME=2 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=TheMinerAmmo MESH=TheMinerAmmo
#exec MESHMAP SCALE MESHMAP=TheMinerAmmo X=0.06 Y=0.06 Z=0.12

#exec TEXTURE IMPORT NAME=TheMinerAmmoSk01 FILE=SKINS\TheMinerAmmoSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerAmmo NUM=1 TEXTURE=TheMinerAmmoSk01

#exec TEXTURE IMPORT NAME=TheMinerAmmoSk02 FILE=SKINS\TheMinerAmmoSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerAmmo NUM=2 TEXTURE=TheMinerAmmoSk02

#exec TEXTURE IMPORT NAME=TheMinerMetal FILE=SKINS\TheMinerMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="TheMinerAmmo" FILE=SOUNDS\TheMinerAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="TheMinerAmmoOpen" FILE=SOUNDS\TheMinerAmmoOpen.wav GROUP="Ammo"

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=TheMinerAmmo
	
	AmmoAmount=8
	MaxAmmo=25
	bCollideActors=True
	CollisionRadius=15.000000
	CollisionHeight=16.500000
	ItemName="The Miner Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up a Mine Box"
	PickupSound=TheMinerAmmo
	PickupViewMesh=TheMinerAmmo
	AmmoAnimRate=0.750000
	AmmoAnimTime=1.340000
	Texture=TheMinerMetal
	AmmoAnimSound=TheMinerAmmoOpen
}
