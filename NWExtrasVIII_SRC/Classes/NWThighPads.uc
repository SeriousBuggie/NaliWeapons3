//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWThighPads expands NWExtrasArmor config(NWExtrasCfg);

#exec TEXTURE IMPORT NAME=NWThighPads_Sk FILE=SKINS\NWThighPads_Sk.bmp GROUP=Skins LODSET=2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.ThighPads'
	CollisionRadius=15.000000
	CollisionHeight=18.000000
	MultiSkins(1)=NWThighPads_Sk
	MultiSkins(2)=NWThighPads_Sk
	AmbientGlow=64
	
	LightHue=175
	LightSaturation=200
	LightBrightness=128
	LightRadius=3
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=15
	bForceRotatingPickupOnReplace=False
	PlacementZOffset=0.000000
	ChargerScale=0.350000
	
	PickupMessage="You picked up the Thigh Pads"
	ItemName="Thigh Pads"
	RespawnTime=30.000000
	PickupViewMesh=LodMesh'Botpack.ThighPads'
	MaxDesireability=1.800000
	PickupSound=NWArmorPickup
	
	bRotatingPickup=True
	PickupType=PCK_Armor
	Charge=50
	MaxCharge=50
	bSuperArmor=False
	bConsumeOtherArmors=False
	bShield=False
	bThighs=True
	ArmorAbsorption=50
	AbsorptionPriority=6
	
	PickupFXClasses(0)=Class'NWThighPadsFog'
	
	
	ArmorPoints=50
	AbsorptionPercentage=50
}
