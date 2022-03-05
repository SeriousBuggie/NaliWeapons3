//////////////////////////////////////////////////////////////
//				Feralidragon (19-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMedPickup expands NWExtrasHealth config(NWExtrasCfg);

#exec MESH IMPORT MESH=NWMedPickup ANIVFILE=MODELS\NWMedPickup_a.3d DATAFILE=MODELS\NWMedPickup_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWMedPickup STRENGTH=0.2
#exec MESH ORIGIN MESH=NWMedPickup X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWMedPickup SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWMedPickup SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWMedPickup MESH=NWMedPickup
#exec MESHMAP SCALE MESHMAP=NWMedPickup X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NWMedPickup_Sk FILE=SKINS\NWMedPickup_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWMedPickup NUM=1 TEXTURE=NWMedPickup_Sk

#exec TEXTURE IMPORT NAME=NWMedPickupCrystal FILE=SKINS\NWMedPickupCrystal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="NWMedPickup" FILE=SOUNDS\NWMedPickup.wav GROUP="NWMedPickup"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWMedPickup
	CollisionRadius=24.000000
	CollisionHeight=28.000000
	Texture=NWMedPickupCrystal
	
	LightHue=170
	LightSaturation=128
	LightBrightness=128
	LightRadius=2
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=0
	bForceRotatingPickupOnReplace=True
	PlacementZOffset=20.000000
	ChargerScale=0.750000
	
	PickupMessage="You picked up a Health Pack"
	ItemName="Health Pack"
	RespawnTime=20.000000
	PickupViewMesh=NWMedPickup
	MaxDesireability=0.500000
	PickupSound=NWMedPickup
	
	bRotatingPickup=True
	PickupType=PCK_Health
	bSuperHealth=False
	HealthAmount=22
	
	PickupFXClasses(0)=Class'NWMedCor'
	PickupFXClasses(1)=Class'NWMedFog'
	PickupFXClasses(2)=Class'NWMedOV'
	
	
	HealthPoints=22
}
