//////////////////////////////////////////////////////////////
//	Nali Weapons III Bolt Rifle ammo
//				Feralidragon (21-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltAmmo expands NaliAmmo;

#exec OBJ LOAD FILE=Textures\BoltIceFX.utx PACKAGE=NWBoltRifleVIII_SRC.IceFX

#exec MESH IMPORT MESH=BoltAmmo ANIVFILE=MODELS\BoltAmmo_a.3d DATAFILE=MODELS\BoltAmmo_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=BoltAmmo STRENGTH=0
#exec MESH ORIGIN MESH=BoltAmmo X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltAmmo SEQ=All STARTFRAME=0 NUMFRAMES=5
#exec MESH SEQUENCE MESH=BoltAmmo SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltAmmo SEQ=Openning STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=BoltAmmo SEQ=Closing STARTFRAME=2 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=BoltAmmo SEQ=Opened STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltAmmo SEQ=Closed STARTFRAME=4 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=BoltAmmo MESH=BoltAmmo
#exec MESHMAP SCALE MESHMAP=BoltAmmo X=0.12 Y=0.12 Z=0.24

#exec TEXTURE IMPORT NAME=Sk_BoltAmmo FILE=SKINS\Sk_BoltAmmo.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=BoltAmmo NUM=1 TEXTURE=Sk_BoltAmmo

#exec TEXTURE IMPORT NAME=GlassCrystDrk FILE=SKINS\GlassCrystDrk.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="BoltAmmo" FILE=SOUNDS\BoltAmmo.wav GROUP="Ammo"
#exec AUDIO IMPORT NAME="BoltOpen" FILE=SOUNDS\BoltOpen.wav GROUP="Ammo"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltAmmo
	AmmoAmount=15
	MaxAmmo=60
	bCollideActors=True
	CollisionRadius=12.000000
	CollisionHeight=15.500000
	ItemName="Bolt Rifle Ammo"
	MaxDesireability=0.220000
	PickupMessage="You picked up a Bolt Core"
	PickupSound=BoltAmmo
	PickupViewMesh=BoltAmmo
	AmmoAnimRate=0.750000
	AmmoAnimTime=1.340000
	Texture=GlassCrystDrk
	AmmoAnimSound=BoltOpen
	MultiSkins(2)=AmmoCoreFX
	
	LightBrightness=50
	LightHue=168
	LightSaturation=68
	LightRadius=1
	LightType=LT_Steady
}
