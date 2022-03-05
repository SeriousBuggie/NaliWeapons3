//////////////////////////////////////////////////////////////
//				Feralidragon (19-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWVial expands NWExtrasHealth config(NWExtrasCfg);

#exec MESH IMPORT MESH=NWVial ANIVFILE=MODELS\NWVial_a.3d DATAFILE=MODELS\NWVial_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWVial STRENGTH=0.2
#exec MESH ORIGIN MESH=NWVial X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWVial SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWVial SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWVial MESH=NWVial
#exec MESHMAP SCALE MESHMAP=NWVial X=0.04 Y=0.04 Z=0.08

#exec TEXTURE IMPORT NAME=NWVial_Sk FILE=SKINS\NWVial_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWVial NUM=1 TEXTURE=NWVial_Sk

#exec TEXTURE IMPORT NAME=NWVialCrystal FILE=SKINS\NWVialCrystal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="NWVialPickup" FILE=SOUNDS\NWVialPickup.wav GROUP="NWVial"


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWVial
	CollisionRadius=6.000000
	CollisionHeight=24.000000
	Texture=NWVialCrystal
	ScaleGlow=0.750000
	
	LightHue=120
	LightSaturation=128
	LightBrightness=128
	LightRadius=1
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=0
	bForceRotatingPickupOnReplace=False
	PlacementZOffset=0.000000
	ChargerScale=0.250000
	
	PickupMessage="You picked up a Health Ampule"
	ItemName="Health Ampule"
	RespawnTime=30.000000
	PickupViewMesh=NWVial
	MaxDesireability=0.600000
	PickupSound=NWVialPickup
	
	bRotatingPickup=False
	PickupType=PCK_Health
	bSuperHealth=True
	HealthAmount=6
	
	PickupFXClasses(0)=Class'NWVialCor'
	PickupFXClasses(1)=Class'NWVialFog'
	PickupFXClasses(2)=Class'NWVialOV'
	
	HealthPoints=6
}
