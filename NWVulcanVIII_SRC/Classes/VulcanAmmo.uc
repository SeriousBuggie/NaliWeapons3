//////////////////////////////////////////////////////////////
//	Nali Weapons III Vulcan ammo
//				Feralidragon (10-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanAmmo expands NaliAmmo;

#exec MESH IMPORT MESH=VulcanAmmo ANIVFILE=MODELS\VulcanAmmo_a.3d DATAFILE=MODELS\VulcanAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=VulcanAmmo STRENGTH=0
#exec MESH ORIGIN MESH=VulcanAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=VulcanAmmo SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=VulcanAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanAmmo SEQ=Openning STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=VulcanAmmo SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=VulcanAmmo SEQ=Opened STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanAmmo SEQ=Closed STARTFRAME=1 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=VulcanAmmo MESH=VulcanAmmo
#exec MESHMAP SCALE MESHMAP=VulcanAmmo X=0.078 Y=0.078 Z=0.156

#exec TEXTURE IMPORT NAME=VulcanAmmoSk FILE=SKINS\VulcanAmmoSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanAmmo NUM=1 TEXTURE=VulcanAmmoSk

#exec TEXTURE IMPORT NAME=VulcanBulletCaseSk FILE=SKINS\VulcanBulletCaseSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanAmmo NUM=2 TEXTURE=VulcanBulletCaseSk

#exec TEXTURE IMPORT NAME=VulcanMetal FILE=SKINS\VulcanMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="VulcanAmmo" FILE=SOUNDS\VulcanAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="VulcanAmmoOpen" FILE=SOUNDS\VulcanAmmoOpen.wav GROUP="Ammo"

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=VulcanAmmo
	AmmoAmount=100
	MaxAmmo=220
	bCollideActors=True
	CollisionRadius=12.500000
	CollisionHeight=7.500000
	ItemName="Vulcan Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up a Vulcan Bullets-Set Round"
	PickupSound=VulcanAmmo
	PickupViewMesh=VulcanAmmo
	AmmoAnimRate=0.500000
	AmmoAnimTime=2.000000
	Texture=VulcanMetal
	AmmoAnimSound=VulcanAmmoOpen
}
