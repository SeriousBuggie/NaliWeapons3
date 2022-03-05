//////////////////////////////////////////////////////////////
//	Nali Weapons III Graviton ammo
//				Feralidragon (22-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravitonAmmo expands NaliAmmo;

#exec OBJ LOAD FILE=Textures\GravGFX.utx PACKAGE=NWGravitonVIII_SRC.FX

#exec MESH IMPORT MESH=GravitonAmmo ANIVFILE=MODELS\GravitonAmmo_a.3d DATAFILE=MODELS\GravitonAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=GravitonAmmo STRENGTH=0
#exec MESH ORIGIN MESH=GravitonAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravitonAmmo SEQ=All STARTFRAME=0 NUMFRAMES=11
#exec MESH SEQUENCE MESH=GravitonAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravitonAmmo SEQ=Openning STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=GravitonAmmo SEQ=Closing STARTFRAME=5 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=GravitonAmmo SEQ=Opened STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravitonAmmo SEQ=Closed STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GravitonAmmo MESH=GravitonAmmo
#exec MESHMAP SCALE MESHMAP=GravitonAmmo X=0.03 Y=0.03 Z=0.06

#exec TEXTURE IMPORT NAME=Sk_GravitonAmmo FILE=SKINS\Sk_GravitonAmmo.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=GravitonAmmo NUM=1 TEXTURE=Sk_GravitonAmmo

#exec TEXTURE IMPORT NAME=GravitonMetal FILE=SKINS\GravitonMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="GravAmmoPick" FILE=SOUNDS\GravAmmoPick.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="GravAmmoOpen" FILE=SOUNDS\GravAmmoOpen.wav GROUP="Ammo"

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=GravitonAmmo
	
	AmmoAmount=40
	MaxAmmo=100
	bCollideActors=True
	CollisionRadius=10.000000
	CollisionHeight=14.500000
	ItemName="Graviton Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up a Gravitational Sphere"
	PickupSound=GravAmmoPick
	PickupViewMesh=GravitonAmmo
	AmmoAnimRate=0.750000
	AmmoAnimTime=1.340000
	Texture=GravitonMetal
	AmmoAnimSound=GravAmmoOpen
	MultiSkins(2)=GravFX
	
	LightBrightness=50
	LightHue=192
	LightSaturation=40
	LightRadius=5
	LightType=LT_Steady
}
