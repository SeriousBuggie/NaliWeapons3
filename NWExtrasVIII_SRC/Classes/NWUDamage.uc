//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWUDamage expands NaliPickups config(NWExtrasCfg);

#exec OBJ LOAD FILE=Textures\NWExtrasFX.utx PACKAGE=NWExtrasVIII_SRC.ExtrasFX

#exec MESH IMPORT MESH=NWUDamage ANIVFILE=MODELS\NWUDamage_a.3d DATAFILE=MODELS\NWUDamage_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWUDamage STRENGTH=0.15
#exec MESH ORIGIN MESH=NWUDamage X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWUDamage SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWUDamage SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWUDamage MESH=NWUDamage
#exec MESHMAP SCALE MESHMAP=NWUDamage X=0.07 Y=0.07 Z=0.14

#exec TEXTURE IMPORT NAME=NWUDamage_Sk FILE=SKINS\NWUDamage_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWUDamage NUM=1 TEXTURE=NWUDamage_Sk
#exec MESHMAP SETTEXTURE MESHMAP=NWUDamage NUM=2 TEXTURE=NormalBlack
#exec MESHMAP SETTEXTURE MESHMAP=NWUDamage NUM=3 TEXTURE=NWUDamage_Sk

#exec TEXTURE IMPORT NAME=NWUDamageCrystal FILE=SKINS\NWUDamageCrystal.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NWUDamage NUM=4 TEXTURE=NWUDamageCrystal

#exec AUDIO IMPORT NAME="NWUDamFire1" FILE=SOUNDS\NWUDamFire1.wav GROUP="NWUDamage"
#exec AUDIO IMPORT NAME="NWUDamFire2" FILE=SOUNDS\NWUDamFire2.wav GROUP="NWUDamage"
#exec AUDIO IMPORT NAME="NWUDamPickup" FILE=SOUNDS\NWUDamPickup.wav GROUP="NWUDamage"
#exec AUDIO IMPORT NAME="NWUDamExpire" FILE=SOUNDS\NWUDamExpire.wav GROUP="NWUDamage"


var() sound ExtraFireSound;
var() sound EndFireSound;
var() int FinalCount;

var(ServerConfig) config int ActiveTime, MaxActiveTime;
var(ServerConfig) config float DamageMultiplier;

function PreBeginPlay()
{
	Charge = default.ActiveTime;
	default.Charge = default.ActiveTime;
	Class.default.Charge = default.ActiveTime;
	
	MaxCharge = default.MaxActiveTime;
	default.MaxCharge = default.MaxActiveTime;
	Class.default.MaxCharge = default.MaxActiveTime;
	
	DamageMult = default.DamageMultiplier;
	default.DamageMult = default.DamageMultiplier;
	Class.default.DamageMult = default.DamageMultiplier;
	
	Super.PreBeginPlay();
}

simulated function FireEffect()
{
	if (Charge < FinalCount*2 && Level.NetMode != NM_Client)
		Pawn(Owner).Weapon.PlayOwnedSound(EndFireSound, SLOT_Interact, 8);
	else 
		Pawn(Owner).Weapon.PlayOwnedSound(ExtraFireSound, SLOT_Interact, 8);
}

function ChargeDecreaseEvent()
{
	if (Charge > 0 && Charge < FinalCount && Pawn(Owner) != None)
		Owner.PlaySound(DeActivateSound,, 8);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWUDamage
	CollisionRadius=24.000000
	CollisionHeight=48.000000
	Texture=NWUDamageCrystal
	MultiSkins(2)=Texture'UDamFX01'
	
	LightHue=210
	LightSaturation=0
	LightBrightness=255
	LightRadius=5
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=100
	bForceRotatingPickupOnReplace=True
	PlacementZOffset=0.000000
	ChargerScale=1.000000
	
	ExtraFireSound=NWUDamFire1
	EndFireSound=NWUDamFire2
	FinalCount=5
	ExpireMessage="U-Damage has been exhausted."
	PickupMessage="You got the U-Damage!"
	ItemName="U-Damage"
	RespawnTime=120.000000
	PickupViewMesh=NWUDamage
	MaxDesireability=2.500000
	PickupSound=NWUDamPickup
	DeActivateSound=NWUDamExpire
	
	bRotatingPickup=True
	PickupType=PCK_ExtraDamage
	bTemporaryPickup=True
	bCumulativeCharge=True
	Charge=30
	MaxCharge=90
	ChargeDecreaseRate=1.000000
	DamageMult=3.000000
	
	PickupFXClasses(0)=Class'NWUDamCor'
	PickupFXClasses(1)=Class'NWUDamVertTrace'
	PickupFXClasses(2)=Class'NWUDamFog'
	PickupFXClasses(3)=Class'NWUDamOV'
	
	bOverlayWeaponFX=True
	bThirdPersonWeaponFX=True
	bWeaponAffector=True
	WeaponFXOverlayStyle=STY_Translucent
	WeaponFXThirdPersonStyle=STY_Translucent
	bTeamBasedWeaponFX=False
	WeaponFXOverlayTex(0)=Texture'NeoXUDamFluid'
	WeaponFXThirdPersonTex(0)=Texture'NeoXUDamFluid'
	bWeaponFXOverlayEnviroMap=True
	bWeaponFXThirdPersonEnviroMap=True
	WeaponFXOverlayExtraFatness=0
	bWeaponFXOverlayUnlit=True
	bWeaponFXThirdPersonUnlit=True
	WeaponFXOverlayGlow=1.500000
	WeaponFXThirdPersonGlow=1.000000
	
	bPawnFX=True
	PawnFXStyle=STY_Normal
	PawnFXAmbientGlow=254
	
	bPawnFXLight=True
	PawnFXLightHue=210
	PawnFXLightSaturation=0
	PawnFXLightBrightness=255
	PawnFXLightRadius=10
	PawnFXLightType=LT_Steady
	PawnFXLightEffect=LE_NonIncidence
	
	
	ActiveTime=30
	MaxActiveTime=90
	DamageMultiplier=3.000000
}
