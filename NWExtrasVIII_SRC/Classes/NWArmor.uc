//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWArmor expands NWExtrasArmor config(NWExtrasCfg);

#exec TEXTURE IMPORT NAME=NWArmor_Sk FILE=SKINS\NWArmor_Sk.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="NWArmorPickup" FILE=SOUNDS\NWArmorPickup.wav GROUP="NWArmor"

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.Armor2M'
	CollisionRadius=24.000000
	CollisionHeight=18.000000
	MultiSkins(1)=NWArmor_Sk
	AmbientGlow=64
	
	LightHue=85
	LightSaturation=128
	LightBrightness=128
	LightRadius=3
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=20
	bForceRotatingPickupOnReplace=False
	PlacementZOffset=0.000000
	ChargerScale=0.500000
	
	PickupMessage="You picked up the Body Armor"
	ItemName="Body Armor"
	RespawnTime=30.000000
	PickupViewMesh=LodMesh'Botpack.Armor2M'
	MaxDesireability=2.000000
	PickupSound=NWArmorPickup
	
	bRotatingPickup=False
	PickupType=PCK_Armor
	Charge=100
	MaxCharge=100
	bSuperArmor=False
	bConsumeOtherArmors=False
	bShield=False
	bThighs=False
	ArmorAbsorption=75
	AbsorptionPriority=7
	
	PickupFXClasses(0)=Class'NWArmorFog'
	
	
	ArmorPoints=100
	AbsorptionPercentage=75
}
