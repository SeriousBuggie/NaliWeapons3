//////////////////////////////////////////////////////////////
//	Nali Weapons III Freezer ammo
//				Feralidragon (02-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerAmmo expands NaliAmmo;

#exec MESH IMPORT MESH=FreezerAmmo ANIVFILE=MODELS\FreezerAmmo_a.3d DATAFILE=MODELS\FreezerAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=FreezerAmmo STRENGTH=0
#exec MESH ORIGIN MESH=FreezerAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=FreezerAmmo SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=FreezerAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerAmmo SEQ=Openning STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=FreezerAmmo SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=FreezerAmmo SEQ=Opened STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerAmmo SEQ=Closed STARTFRAME=1 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerAmmo MESH=FreezerAmmo
#exec MESHMAP SCALE MESHMAP=FreezerAmmo X=0.06 Y=0.06 Z=0.12

#exec TEXTURE IMPORT NAME=FreezerAmmoSk FILE=SKINS\FreezerAmmoSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FreezerAmmo NUM=1 TEXTURE=FreezerAmmoSk

#exec MESHMAP SETTEXTURE MESHMAP=FreezerAmmo NUM=2 TEXTURE=UnrealShare.Belt_fx.Testing.Effect_1

#exec TEXTURE IMPORT NAME=FreezerMetal FILE=SKINS\FreezerMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="FreezerAmmo" FILE=SOUNDS\FreezerAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="FreezerAmmoOpen" FILE=SOUNDS\FreezerAmmoOpen.wav GROUP="Ammo"

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FreezerAmmo
	
	AmmoAmount=50
	MaxAmmo=135
	bCollideActors=True
	CollisionRadius=8.000000
	CollisionHeight=12.000000
	ItemName="Freezer Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up a Cryogenic Fluid Container"
	PickupSound=FreezerAmmo
	PickupViewMesh=FreezerAmmo
	AmmoAnimRate=0.750000
	AmmoAnimTime=1.340000
	Texture=FreezerMetal
	AmmoAnimSound=FreezerAmmoOpen
	
	LightBrightness=50
	LightHue=140
	LightSaturation=255
	LightRadius=5
	LightType=LT_Steady
}
