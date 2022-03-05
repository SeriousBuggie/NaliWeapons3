//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher ammo
//				Feralidragon (01-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMAmmo expands NaliAmmo;

#exec OBJ LOAD FILE=Textures\MissileFX.utx PACKAGE=NWMultiMissileVIII_SRC.FX

#exec MESH IMPORT MESH=MultiMAmmo ANIVFILE=MODELS\MultiMAmmo_a.3d DATAFILE=MODELS\MultiMAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=MultiMAmmo STRENGTH=0
#exec MESH ORIGIN MESH=MultiMAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMAmmo SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=MultiMAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMAmmo SEQ=Openning STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MultiMAmmo SEQ=Closing STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MultiMAmmo SEQ=Opened STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMAmmo SEQ=Closed STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMAmmo MESH=MultiMAmmo
#exec MESHMAP SCALE MESHMAP=MultiMAmmo X=0.04 Y=0.04 Z=0.08

#exec TEXTURE IMPORT NAME=MissileSk01 FILE=SKINS\MissileSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMAmmo NUM=1 TEXTURE=MissileSk01

#exec TEXTURE IMPORT NAME=MissileSk02 FILE=SKINS\MissileSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMAmmo NUM=2 TEXTURE=MissileSk02

#exec TEXTURE IMPORT NAME=MMAmmo_Sk01 FILE=SKINS\MMAmmo_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMAmmo NUM=3 TEXTURE=MMAmmo_Sk01

#exec TEXTURE IMPORT NAME=MMAmmo_Sk02 FILE=SKINS\MMAmmo_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMAmmo NUM=4 TEXTURE=MMAmmo_Sk02

#exec MESHMAP SETTEXTURE MESHMAP=MultiMAmmo NUM=5 TEXTURE=MBlueFX
#exec MESHMAP SETTEXTURE MESHMAP=MultiMAmmo NUM=6 TEXTURE=MRedFX
#exec MESHMAP SETTEXTURE MESHMAP=MultiMAmmo NUM=7 TEXTURE=MGreenFX

#exec AUDIO IMPORT NAME="MultiMLAmmo" FILE=SOUNDS\MultiMLAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="MMAmmoOpen" FILE=SOUNDS\MMAmmoOpen.wav GROUP="Ammo"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMAmmo
	AmmoAmount=20
	MaxAmmo=100
	bCollideActors=True
	CollisionRadius=18.000000
	CollisionHeight=25.600000
	ItemName="MultiMissile Launcher Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up some Missiles"
	PickupSound=MultiMLAmmo
	PickupViewMesh=MultiMAmmo
	AmmoAnimRate=0.250000
	AmmoAnimTime=4.000000
	Texture=ShinyMetal01
	AmmoAnimSound=MMAmmoOpen
}
