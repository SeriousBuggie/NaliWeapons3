//////////////////////////////////////////////////////////////
//	Nali Weapons III Super Bolt Rifle ammo
//				Feralidragon (21-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SuperBoltAmmo expands NaliAmmo;

#exec OBJ LOAD FILE=Textures\SBoltIceFX.utx PACKAGE=NWSuperBoltRifleVIII_SRC.IceFX

#exec MESH IMPORT MESH=SBoltAmmo ANIVFILE=MODELS\SBoltAmmo_a.3d DATAFILE=MODELS\SBoltAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=SBoltAmmo STRENGTH=0
#exec MESH ORIGIN MESH=SBoltAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=SBoltAmmo SEQ=All STARTFRAME=0 NUMFRAMES=5
#exec MESH SEQUENCE MESH=SBoltAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltAmmo SEQ=Openning STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=SBoltAmmo SEQ=Closing STARTFRAME=2 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=SBoltAmmo SEQ=Opened STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltAmmo SEQ=Closed STARTFRAME=4 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=SBoltAmmo MESH=SBoltAmmo
#exec MESHMAP SCALE MESHMAP=SBoltAmmo X=0.12 Y=0.12 Z=0.24

#exec TEXTURE IMPORT NAME=Sk_SBoltAmmo FILE=SKINS\Sk_SBoltAmmo.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=SBoltAmmo NUM=1 TEXTURE=Sk_SBoltAmmo

#exec TEXTURE IMPORT NAME=SGlassCrystDrk FILE=SKINS\SGlassCrystDrk.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="SBoltAmmo" FILE=SOUNDS\SBoltAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="SBoltOpen" FILE=SOUNDS\SBoltOpen.wav GROUP="Ammo"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=SBoltAmmo
	AmmoAmount=5
	MaxAmmo=25
	bCollideActors=True
	CollisionRadius=12.000000
	CollisionHeight=15.500000
	ItemName="Super Bolt Rifle Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up a Super Bolt Core"
	PickupSound=SBoltAmmo
	PickupViewMesh=SBoltAmmo
	AmmoAnimRate=0.750000
	AmmoAnimTime=1.340000
	Texture=SGlassCrystDrk
	AmmoAnimSound=SBoltOpen
	MultiSkins(2)=AmmoCoreFX
	
	LightBrightness=50
	LightHue=0
	LightSaturation=0
	LightRadius=1
	LightType=LT_Steady
	
	bMegaAmmo=True
}
