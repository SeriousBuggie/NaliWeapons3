//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Launcher ammo
//				Feralidragon (19-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybotAmmo expands NaliAmmo;

#exec MESH IMPORT MESH=CybotAmmo ANIVFILE=MODELS\CybotAmmo_a.3d DATAFILE=MODELS\CybotAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=CybotAmmo STRENGTH=0
#exec MESH ORIGIN MESH=CybotAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybotAmmo SEQ=All STARTFRAME=0 NUMFRAMES=9
#exec MESH SEQUENCE MESH=CybotAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotAmmo SEQ=Openning STARTFRAME=0 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybotAmmo SEQ=Closing STARTFRAME=4 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybotAmmo SEQ=Opened STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotAmmo SEQ=Closed STARTFRAME=8 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybotAmmo MESH=CybotAmmo
#exec MESHMAP SCALE MESHMAP=CybotAmmo X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=CybotSk FILE=SKINS\CybotSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybotAmmo NUM=1 TEXTURE=CybotSk

#exec TEXTURE IMPORT NAME=CybotAmmoSk FILE=SKINS\CybotAmmoSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybotAmmo NUM=2 TEXTURE=CybotAmmoSk

#exec AUDIO IMPORT NAME="CybotAmmo" FILE=SOUNDS\CybotAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="CybotAmmoOpen" FILE=SOUNDS\CybotAmmoOpen.wav GROUP="Ammo"

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybotAmmo
	
	AmmoAmount=5
	MaxAmmo=15
	bCollideActors=True
	CollisionRadius=16.000000
	CollisionHeight=20.000000
	ItemName="Cybot Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up a Cybot Shell"
	PickupSound=CybotAmmo
	PickupViewMesh=CybotAmmo
	AmmoAnimRate=0.750000
	AmmoAnimTime=1.340000
	AmmoAnimSound=CybotAmmoOpen
	
	bMegaAmmo=True
}
