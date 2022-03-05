//////////////////////////////////////////////////////////////
//				Feralidragon (19-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWSuperHealth expands NWExtrasHealth config(NWExtrasCfg);

#exec MESH IMPORT MESH=NWSuperHealth ANIVFILE=MODELS\NWSuperHealth_a.3d DATAFILE=MODELS\NWSuperHealth_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWSuperHealth STRENGTH=0.2
#exec MESH ORIGIN MESH=NWSuperHealth X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=NWSuperHealth SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWSuperHealth SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWSuperHealth MESH=NWSuperHealth
#exec MESHMAP SCALE MESHMAP=NWSuperHealth X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NWSuperHealth_Sk FILE=SKINS\NWSuperHealth_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWSuperHealth NUM=1 TEXTURE=NWSuperHealth_Sk

#exec TEXTURE IMPORT NAME=NWSuperHealthCrystal FILE=SKINS\NWSuperHealthCrystal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="NWSuperHealthPickup" FILE=SOUNDS\NWSuperHealthPickup.wav GROUP="NWSuperHealth"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWSuperHealth
	CollisionRadius=24.000000
	CollisionHeight=16.000000
	Texture=NWSuperHealthCrystal
	
	LightHue=120
	LightSaturation=128
	LightBrightness=255
	LightRadius=5
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=0
	bForceRotatingPickupOnReplace=False
	PlacementZOffset=0.000000
	ChargerScale=1.000000
	
	PickupMessage="You picked up the Super Health"
	ItemName="Super Health"
	RespawnTime=100.000000
	PickupViewMesh=NWSuperHealth
	MaxDesireability=2.000000
	PickupSound=NWSuperHealthPickup
	
	bRotatingPickup=True
	PickupType=PCK_Health
	bSuperHealth=True
	HealthAmount=125
	
	PickupFXClasses(0)=Class'NWSuperHealthCor'
	PickupFXClasses(1)=Class'NWSuperHealthCorL'
	PickupFXClasses(2)=Class'NWSuperHealthCorR'
	PickupFXClasses(3)=Class'NWSuperHealthFog'
	PickupFXClasses(4)=Class'NWSuperHealthOV'
	PickupFXClasses(5)=Class'NWSuperHealthOV'
	
	HealthPoints=125
}
