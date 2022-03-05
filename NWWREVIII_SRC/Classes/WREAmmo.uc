//////////////////////////////////////////////////////////////
//	Nali Weapons III War Ready Enforcer (W.R.E.) ammo
//				Feralidragon (10-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREAmmo expands NaliAmmo;

#exec OBJ LOAD FILE=Textures\WREFX.utx PACKAGE=NWWREVIII_SRC.FX

#exec MESH IMPORT MESH=WREAmmo ANIVFILE=MODELS\WREAmmo_a.3d DATAFILE=MODELS\WREAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=WREAmmo STRENGTH=0
#exec MESH ORIGIN MESH=WREAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WREAmmo SEQ=All STARTFRAME=0 NUMFRAMES=17
#exec MESH SEQUENCE MESH=WREAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREAmmo SEQ=Openning STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=WREAmmo SEQ=Closing STARTFRAME=8 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=WREAmmo SEQ=Opened STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREAmmo SEQ=Closed STARTFRAME=16 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WREAmmo MESH=WREAmmo
#exec MESHMAP SCALE MESHMAP=WREAmmo X=0.078 Y=0.078 Z=0.156

#exec TEXTURE IMPORT NAME=Sk_WREAmmo FILE=SKINS\Sk_WREAmmo.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WREAmmo NUM=1 TEXTURE=Sk_WREAmmo

#exec TEXTURE IMPORT NAME=Sk_WREGrenade FILE=SKINS\Sk_WREGrenade.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WREAmmo NUM=2 TEXTURE=Sk_WREGrenade

#exec TEXTURE IMPORT NAME=Sk_WREBulletCase FILE=SKINS\Sk_WREBulletCase.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WREAmmo NUM=3 TEXTURE=Sk_WREBulletCase

#exec TEXTURE IMPORT NAME=WREMetal FILE=SKINS\WREMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="WRE_Ammo" FILE=SOUNDS\WRE_Ammo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="WREAmmoOpen" FILE=SOUNDS\WREAmmoOpen.wav GROUP="Ammo"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WREAmmo
	AmmoAmount=55
	MaxAmmo=200
	bCollideActors=True
	CollisionRadius=12.000000
	CollisionHeight=6.500000
	ItemName="War Ready Enforcer Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up some Bullets and Ion Grenades"
	PickupSound=WRE_Ammo
	PickupViewMesh=WREAmmo
	AmmoAnimRate=0.500000
	AmmoAnimTime=2.000000
	Texture=WREMetal
	AmmoAnimSound=WREAmmoOpen
	MultiSkins(4)=IonChargeOffFX
}
