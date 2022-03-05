//////////////////////////////////////////////////////////////
//	Nali Weapons III Flame Tracker ammo
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTAmmo expands NaliAmmo;

#exec OBJ LOAD FILE=Textures\FlameTIceFX.utx PACKAGE=NWFlameTrackerVIII_SRC.IceFX

#exec MESH IMPORT MESH=FlameTAmmo ANIVFILE=MODELS\FlameTAmmo_a.3d DATAFILE=MODELS\FlameTAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=FlameTAmmo STRENGTH=0
#exec MESH ORIGIN MESH=FlameTAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=FlameTAmmo SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=FlameTAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTAmmo SEQ=Openning STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=FlameTAmmo SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=FlameTAmmo SEQ=Opened STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTAmmo SEQ=Closed STARTFRAME=1 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FlameTAmmo MESH=FlameTAmmo
#exec MESHMAP SCALE MESHMAP=FlameTAmmo X=0.03 Y=0.03 Z=0.06

#exec TEXTURE IMPORT NAME=Sk_FlameTAmmo FILE=SKINS\Sk_FlameTAmmo.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTAmmo NUM=1 TEXTURE=Sk_FlameTAmmo

#exec TEXTURE IMPORT NAME=HovenHeat FILE=SKINS\HovenHeat.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTAmmo NUM=2 TEXTURE=HovenHeat

#exec TEXTURE IMPORT NAME=Sk_FlameTAmmoGlass FILE=SKINS\Sk_FlameTAmmoGlass.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTAmmo NUM=3 TEXTURE=Sk_FlameTAmmoGlass

#exec TEXTURE IMPORT NAME=FlameTrackerMetal FILE=SKINS\FlameTrackerMetal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="FlameAmmoPick" FILE=SOUNDS\FlameAmmoPick.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="FlameTAmmoOpen" FILE=SOUNDS\FlameTAmmoOpen.wav GROUP="Ammo"

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FlameTAmmo
	
	AmmoAmount=65
	MaxAmmo=150
	bCollideActors=True
	CollisionRadius=10.000000
	CollisionHeight=15.000000
	ItemName="Flame Tracker Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up a Pressurized X-Fuel Can"
	PickupSound=FlameAmmoPick
	PickupViewMesh=FlameTAmmo
	AmmoAnimRate=0.750000
	AmmoAnimTime=1.340000
	Texture=FlameTrackerMetal
	AmmoAnimSound=FlameTAmmoOpen
	MultiSkins(4)=FlameEnergyFX
	
	LightBrightness=50
	LightHue=0
	LightSaturation=0
	LightRadius=5
	LightType=LT_Steady
}
