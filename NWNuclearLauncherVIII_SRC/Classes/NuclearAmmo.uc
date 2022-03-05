//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuclear Launcher ammo
//				Feralidragon (04-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearAmmo expands NaliAmmo;

#exec MESH IMPORT MESH=NuclearAmmo ANIVFILE=MODELS\NuclearAmmo_a.3d DATAFILE=MODELS\NuclearAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=NuclearAmmo STRENGTH=0
#exec MESH ORIGIN MESH=NuclearAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NuclearAmmo SEQ=All STARTFRAME=0 NUMFRAMES=9
#exec MESH SEQUENCE MESH=NuclearAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearAmmo SEQ=Openning STARTFRAME=0 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=NuclearAmmo SEQ=Closing STARTFRAME=4 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=NuclearAmmo SEQ=Opened STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearAmmo SEQ=Closed STARTFRAME=8 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NuclearAmmo MESH=NuclearAmmo
#exec MESHMAP SCALE MESHMAP=NuclearAmmo X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NuclearMissileSk FILE=SKINS\NuclearMissileSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearAmmo NUM=1 TEXTURE=NuclearMissileSk

#exec TEXTURE IMPORT NAME=NuclearLauncherAmmoSk FILE=SKINS\NuclearLauncherAmmoSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearAmmo NUM=2 TEXTURE=NuclearLauncherAmmoSk

#exec TEXTURE IMPORT NAME=NukeMetal FILE=SKINS\NukeMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="NuclearAmmo" FILE=SOUNDS\NuclearAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="NuclearAmmoOpen" FILE=SOUNDS\NuclearAmmoOpen.wav GROUP="Ammo"

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearAmmo
	Texture=NukeMetal
	
	AmmoAmount=1
	MaxAmmo=2
	bCollideActors=True
	CollisionRadius=20.000000
	CollisionHeight=40.000000
	ItemName="Nuclear Warhead Level 0"
	MaxDesireability=2.500000
	PickupMessage="You picked up a Nuclear Warhead Level 0"
	PickupSound=NuclearAmmo
	PickupViewMesh=NuclearAmmo
	AmmoAnimRate=0.750000
	AmmoAnimTime=1.340000
	RespawnTime=60.000000
	AmmoAnimSound=NuclearAmmoOpen
	
	bMegaAmmo=True
}
