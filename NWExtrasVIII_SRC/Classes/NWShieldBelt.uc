//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWShieldBelt expands NWExtrasArmor config(NWExtrasCfg);

#exec MESH IMPORT MESH=NWShieldBelt ANIVFILE=MODELS\NWShieldBelt_a.3d DATAFILE=MODELS\NWShieldBelt_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWShieldBelt STRENGTH=0.25
#exec MESH ORIGIN MESH=NWShieldBelt X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=NWShieldBelt SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWShieldBelt SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWShieldBelt MESH=NWShieldBelt
#exec MESHMAP SCALE MESHMAP=NWShieldBelt X=0.065 Y=0.065 Z=0.13

#exec TEXTURE IMPORT NAME=NWShieldBelt_Sk FILE=SKINS\NWShieldBelt_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWShieldBelt NUM=1 TEXTURE=NWShieldBelt_Sk

#exec TEXTURE IMPORT NAME=NWShieldCrystal FILE=SKINS\NWShieldCrystal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="NWShieldBeltHit" FILE=SOUNDS\NWShieldBeltHit.wav GROUP="NWShieldBelt"
#exec AUDIO IMPORT NAME="NWShieldBeltPickup" FILE=SOUNDS\NWShieldBeltPickup.wav GROUP="NWShieldBelt"


function ArmorImpactEffect(vector HitLocation)
{
    if (PlayerPawn(Owner) != None)
    {
		PlayerPawn(Owner).ClientFlash(-0.05,vect(400,400,400));
		PlayerPawn(Owner).PlaySound(DeActivateSound, SLOT_None, 2.7*PlayerPawn(Owner).SoundDampening);
    }
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWShieldBelt
	
	CollisionRadius=16.000000
	CollisionHeight=5.000000
	Texture=NWShieldCrystal
	AmbientGlow=64
	
	LightHue=40
	LightSaturation=128
	LightBrightness=255
	LightRadius=5
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=75
	bForceRotatingPickupOnReplace=False
	PlacementZOffset=0.000000
	ChargerScale=0.650000
	
	PickupMessage="You picked up the Shield Belt"
	ItemName="Shield Belt"
	RespawnTime=60.000000
	PickupViewMesh=NWShieldBelt
	MaxDesireability=3.000000
	PickupSound=NWShieldBeltPickup
	DeActivateSound=NWShieldBeltHit
	
	bRotatingPickup=False
	PickupType=PCK_Armor
	Charge=150
	MaxCharge=150
	bSuperArmor=True
	bConsumeOtherArmors=False
	bShield=True
	bThighs=False
	ProtectionType1=ProtectNone
	ProtectionType2=ProtectNone
	ArmorAbsorption=100
	AbsorptionPriority=10
	
	PickupFXClasses(0)=Class'NWShieldCor'
	PickupFXClasses(1)=Class'NWShieldVertTrace'
	PickupFXClasses(2)=Class'NWShieldFog'
	PickupFXClasses(3)=Class'NWShieldCorB'
	PickupFXClasses(4)=Class'NWShieldCorBL'
	PickupFXClasses(5)=Class'NWShieldCorBR'
	PickupFXClasses(6)=Class'NWShieldCorBLF'
	PickupFXClasses(7)=Class'NWShieldCorBLB'
	PickupFXClasses(8)=Class'NWShieldCorBRF'
	PickupFXClasses(9)=Class'NWShieldCorBRB'
	
	
	bHandsOverlayFX=True
	bTeamBasedHandsFX=True
	HandsFXOverlayStyle=STY_Translucent
	HandsFXOverlayTex(0)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.RedShield'
	HandsFXOverlayTex(1)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.BlueShield'
	HandsFXOverlayTex(2)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.Greenshield'
	HandsFXOverlayTex(3)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.N_Shield'
	HandsFXOverlayTex(4)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.N_Shield'
	bHandsFXOverlayEnviroMap=True
	HandsFXOverlayExtraFatness=2
	bHandsFXOverlayUnlit=True
	HandsFXOverlayGlow=1.000000

	bPawnOverlayerFX=True
	bTeamBasedPawnFX=True
	PawnFXOverlayStyle=STY_Translucent
	PawnFXOverlayTex(0)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.RedShield'
	PawnFXOverlayTex(1)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.BlueShield'
	PawnFXOverlayTex(2)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.Greenshield'
	PawnFXOverlayTex(3)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.N_Shield'
	PawnFXOverlayTex(4)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.N_Shield'
	bPawnFXOverlayEnviroMap=True
	PawnFXOverlayExtraFatness=20
	bPawnFXOverlayUnlit=True
	PawnFXOverlayGlow=1.000000
	
	
	ArmorPoints=150
	AbsorptionPercentage=100
}
