//////////////////////////////////////////////////////////////
//	Nali Weapons III InfraRed Precision Rifle (I.R.P.R.) ammo
//				Feralidragon (07-11-2010)
//
// NW3 INFRARED PRECISION RIFLE 1.00
//////////////////////////////////////////////////////////////

class IRPRAmmo expands NaliAmmo;

#exec MESH IMPORT MESH=IRPRAmmo ANIVFILE=MODELS\IRPRAmmo_a.3d DATAFILE=MODELS\IRPRAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IRPRAmmo STRENGTH=0
#exec MESH ORIGIN MESH=IRPRAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IRPRAmmo SEQ=All STARTFRAME=0 NUMFRAMES=5
#exec MESH SEQUENCE MESH=IRPRAmmo SEQ=Still STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRAmmo SEQ=Openning STARTFRAME=2 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=IRPRAmmo SEQ=Closing STARTFRAME=0 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=IRPRAmmo SEQ=Opened STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRAmmo SEQ=Closed STARTFRAME=2 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IRPRAmmo MESH=IRPRAmmo
#exec MESHMAP SCALE MESHMAP=IRPRAmmo X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=IRPRAmmoSk01 FILE=SKINS\IRPRAmmoSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRAmmo NUM=1 TEXTURE=IRPRAmmoSk01

#exec TEXTURE IMPORT NAME=IRPRAmmoSk02 FILE=SKINS\IRPRAmmoSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRAmmo NUM=2 TEXTURE=IRPRAmmoSk02

#exec TEXTURE IMPORT NAME=IRPRMetal FILE=SKINS\IRPRMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="IRPRAmmo" FILE=SOUNDS\IRPRAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="IRPRAmmoOpen" FILE=SOUNDS\IRPRAmmoOpen.wav GROUP="Ammo"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRAmmo
	AmmoAmount=9
	MaxAmmo=42
	bCollideActors=True
	CollisionRadius=12.000000
	CollisionHeight=8.000000
	ItemName="InfraRed Precision Rifle Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked a Laser Battery Pack"
	PickupSound=IRPRAmmo
	PickupViewMesh=IRPRAmmo
	AmmoAnimRate=0.500000
	AmmoAnimTime=2.000000
	Texture=IRPRMetal
	AmmoAnimSound=IRPRAmmoOpen
}
