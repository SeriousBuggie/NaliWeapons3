//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWInvisibility expands NaliPickups config(NWExtrasCfg);

#exec MESH IMPORT MESH=NWInvisibility ANIVFILE=MODELS\NWInvisibility_a.3d DATAFILE=MODELS\NWInvisibility_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWInvisibility STRENGTH=0.15
#exec MESH ORIGIN MESH=NWInvisibility X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWInvisibility SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWInvisibility SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWInvisibility MESH=NWInvisibility
#exec MESHMAP SCALE MESHMAP=NWInvisibility X=0.04 Y=0.04 Z=0.08

#exec TEXTURE IMPORT NAME=NWInvisibility_Sk FILE=SKINS\NWInvisibility_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWInvisibility NUM=1 TEXTURE=NWInvisibility_Sk

#exec TEXTURE IMPORT NAME=NWInvisibilityCrystal FILE=SKINS\NWInvisibilityCrystal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="NWInvisPickup" FILE=SOUNDS\NWInvisPickup.wav GROUP="NWInvisibility"
#exec AUDIO IMPORT NAME="NWInvisExpire" FILE=SOUNDS\NWInvisExpire.wav GROUP="NWInvisibility"


var() int FinalCount;

var(ServerConfig) config int ActiveTime, MaxActiveTime;

function PreBeginPlay()
{
	Charge = default.ActiveTime;
	default.Charge = default.ActiveTime;
	Class.default.Charge = default.ActiveTime;
	
	MaxCharge = default.MaxActiveTime;
	default.MaxCharge = default.MaxActiveTime;
	Class.default.MaxCharge = default.MaxActiveTime;
	
	Super.PreBeginPlay();
}


function ChargeDecreaseEvent()
{
	if (Charge > 0 && Charge < FinalCount && Pawn(Owner) != None)
		Owner.PlaySound(DeActivateSound,, 8);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWInvisibility
	CollisionRadius=24.000000
	CollisionHeight=32.000000
	Texture=NWInvisibilityCrystal
	MultiSkins(2)=Texture'ForceFieldFX'
	
	LightHue=128
	LightSaturation=190
	LightBrightness=255
	LightRadius=5
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=180
	bForceRotatingPickupOnReplace=True
	PlacementZOffset=10.000000
	ChargerScale=1.000000
	
	ExpireMessage="Invisibility has worn off."
	PickupMessage="You got Invisibility!"
	ItemName="Invisibility"
	RespawnTime=120.000000
	PickupViewMesh=NWInvisibility
	MaxDesireability=1.200000
	PickupSound=NWInvisPickup
	DeActivateSound=NWInvisExpire
	FinalCount=5
	
	bRotatingPickup=True
	PickupType=PCK_Invisibility
	bTemporaryPickup=True
	bCumulativeCharge=True
	Charge=40
	MaxCharge=120
	ChargeDecreaseRate=1.000000
	PawnVisibility=10
	
	PickupFXClasses(0)=Class'NWInvisCor'
	PickupFXClasses(1)=Class'NWInvisHorTrace'
	PickupFXClasses(2)=Class'NWInvisFog'
	PickupFXClasses(3)=Class'NWInvisRotParticles'
	PickupFXClasses(4)=Class'NWInvisRotPartA'
	PickupFXClasses(5)=Class'NWInvisRotPartB'
	PickupFXClasses(6)=Class'NWInvisRotPartC'
	PickupFXClasses(7)=Class'NWInvisRotPartD'
	PickupFXClasses(8)=Class'NWInvisRotPartE'
	PickupFXClasses(9)=Class'NWInvisRotPartF'
	PickupFXClasses(10)=Class'NWInvisRotPartG'
	
	bWeaponFX=True
	bThirdPersonWeaponFX=True
	bNullifyOtherWeaponOverlayerFX=True
	WeaponFXStyle=STY_Translucent
	WeaponFXThirdPersonStyle=STY_Translucent
	bTeamBasedWeaponFX=False
	WeaponFXTex(0)=FireTexture'UnrealShare.Belt_fx.Invis'
	WeaponFXThirdPersonTex(0)=FireTexture'UnrealShare.Belt_fx.Invis'
	bWeaponFXEnviroMap=True
	bWeaponFXThirdPersonEnviroMap=True
	bWeaponFXUnlit=True
	bWeaponFXThirdPersonUnlit=True
	WeaponFXGlow=2.500000
	WeaponFXThirdPersonGlow=1.000000
	WeaponFXOverlayClass=None
	
	bHandsFX=True
	HandsFXStyle=STY_Translucent
	bNullifyOtherHandsOverlayerFX=True
	bTeamBasedHandsFX=False
	HandsFXTex(0)=FireTexture'UnrealShare.Belt_fx.Invis'
	bHandsFXEnviroMap=True
	bHandsFXUnlit=True
	HandsFXGlow=2.500000
	
	bPawnFX=True
	bNullifyOtherPawnOverlayerFX=True
	PawnFXStyle=STY_Translucent
	bTeamBasedPawnFX=False
	PawnFXTex(0)=FireTexture'UnrealShare.Belt_fx.Invis'
	bPawnFXEnviroMap=True
	bPawnFXUnlit=True
	PawnFXGlow=1.000000
	PawnFXAmbientGlow=0

	bPawnFXLight=True
	
	
	ActiveTime=40
	MaxActiveTime=120
}
