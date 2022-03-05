//////////////////////////////////////////////////////////////
//	Nali Weapons III Super Bolt Rifle weapon
//				Feralidragon (21-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SuperBoltRifle expands NaliWeapons config(NWeaponsCfg);


//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=SBoltRifle ANIVFILE=MODELS\SBoltRifle_a.3d DATAFILE=MODELS\SBoltRifle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SBoltRifle STRENGTH=0
#exec MESH ORIGIN MESH=SBoltRifle X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=SBoltRifleR ANIVFILE=MODELS\SBoltRifle_a.3d DATAFILE=MODELS\SBoltRifle_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=SBoltRifleR STRENGTH=0
#exec MESH ORIGIN MESH=SBoltRifleR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=SBoltRiflePick ANIVFILE=MODELS\SBoltRifle_a.3d DATAFILE=MODELS\SBoltRifle_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=SBoltRiflePick STRENGTH=0
#exec MESH ORIGIN MESH=SBoltRiflePick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=SBoltRifleM ANIVFILE=MODELS\SBoltRifle_a.3d DATAFILE=MODELS\SBoltRifle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SBoltRifleM STRENGTH=0.45
#exec MESH ORIGIN MESH=SBoltRifleM X=320 Y=0 Z=-20 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=SBoltRifle SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltRifle SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltRifle SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltRifle SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltRifle SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltRifle SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltRifle SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltRifleR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltRifleR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltRifleR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltRifleR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltRifleR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltRifleR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltRifleR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltRiflePick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=SBoltRifleM SEQ=All STARTFRAME=0 NUMFRAMES=22
#exec MESH SEQUENCE MESH=SBoltRifleM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltRifleM SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltRifleM SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltRifleM SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=SBoltRifle MESH=SBoltRifle
#exec MESHMAP SCALE MESHMAP=SBoltRifle X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltRifleR MESH=SBoltRifleR
#exec MESHMAP SCALE MESHMAP=SBoltRifleR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltRiflePick MESH=SBoltRiflePick
#exec MESHMAP SCALE MESHMAP=SBoltRiflePick X=0.125 Y=0.125 Z=0.25

#exec MESHMAP NEW MESHMAP=SBoltRifleM MESH=SBoltRifleM
#exec MESHMAP SCALE MESHMAP=SBoltRifleM X=0.1 Y=0.1 Z=0.2

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_SBoltR_01 FILE=SKINS\Sk_SBoltR_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifle NUM=1 TEXTURE=Sk_SBoltR_01
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifleR NUM=1 TEXTURE=Sk_SBoltR_01
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRiflePick NUM=1 TEXTURE=Sk_SBoltR_01
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifleM NUM=1 TEXTURE=Sk_SBoltR_01

#exec TEXTURE IMPORT NAME=Sk_SBoltR_02 FILE=SKINS\Sk_SBoltR_02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifle NUM=2 TEXTURE=Sk_SBoltR_02
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifleR NUM=2 TEXTURE=Sk_SBoltR_02
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRiflePick NUM=2 TEXTURE=Sk_SBoltR_02
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifleM NUM=2 TEXTURE=Sk_SBoltR_02

#exec TEXTURE IMPORT NAME=Sk_SBoltR_03 FILE=SKINS\Sk_SBoltR_03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifle NUM=3 TEXTURE=Sk_SBoltR_03
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifleR NUM=3 TEXTURE=Sk_SBoltR_03
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRiflePick NUM=3 TEXTURE=Sk_SBoltR_03
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifleM NUM=3 TEXTURE=Sk_SBoltR_03

#exec TEXTURE IMPORT NAME=Sk_SBoltAmmo FILE=SKINS\Sk_SBoltAmmo.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifle NUM=4 TEXTURE=Sk_SBoltAmmo
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifleR NUM=4 TEXTURE=Sk_SBoltAmmo
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRiflePick NUM=4 TEXTURE=Sk_SBoltAmmo
#exec MESHMAP SETTEXTURE MESHMAP=SBoltRifleM NUM=4 TEXTURE=Sk_SBoltAmmo

#exec TEXTURE IMPORT NAME=SGlassCryst FILE=SKINS\SGlassCryst.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=SBoltIcon FILE=ICONS\SBoltIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=SBoltCrossAlpha FILE=ICONS\SBoltCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\SBoltIcons.utx PACKAGE=NWSuperBoltRifleVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="SBoltRPickup" FILE=SOUNDS\SBoltRPickup.wav GROUP="SBoltRifle"
#exec AUDIO IMPORT NAME="SBoltRSelect" FILE=SOUNDS\SBoltRSelect.wav GROUP="SBoltRifle"
#exec AUDIO IMPORT NAME="SBoltRFire" FILE=SOUNDS\SBoltRFire.wav GROUP="SBoltRifle"
#exec AUDIO IMPORT NAME="SBoltRAltFire" FILE=SOUNDS\SBoltRAltFire.wav GROUP="SBoltRifle"


//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=SBoltHandL ANIVFILE=MODELS\SBoltHand_a.3d DATAFILE=MODELS\SBoltHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SBoltHandL STRENGTH=0
#exec MESH ORIGIN MESH=SBoltHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=SBoltHandR ANIVFILE=MODELS\SBoltHand_a.3d DATAFILE=MODELS\SBoltHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=SBoltHandR STRENGTH=0
#exec MESH ORIGIN MESH=SBoltHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=SBoltHandL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltHandL SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltHandL SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltHandL SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltHandL SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltHandL SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltHandR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltHandR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltHandR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltHandR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltHandR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltHandR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

//Scale
#exec MESHMAP NEW MESHMAP=SBoltHandL MESH=SBoltHandL
#exec MESHMAP SCALE MESHMAP=SBoltHandL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltHandR MESH=SBoltHandR
#exec MESHMAP SCALE MESHMAP=SBoltHandR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=SBoltHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=SBoltHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//OVERLAYER SKINS
//*******************************************************
#exec TEXTURE IMPORT NAME=Ov_SBoltAmmo FILE=OVERLAYERS\Ov_SBoltAmmo.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=Ov_SBoltR_01 FILE=OVERLAYERS\Ov_SBoltR_01.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=Ov_SBoltR_02 FILE=OVERLAYERS\Ov_SBoltR_02.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=Ov_SBoltR_03 FILE=OVERLAYERS\Ov_SBoltR_03.bmp GROUP=Skins LODSET=2

//Front Overlayers
//*******************************************************
//1st person
#exec MESH IMPORT MESH=SBoltFrontOvL ANIVFILE=MODELS\SBoltFrontOv_a.3d DATAFILE=MODELS\SBoltFrontOv_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SBoltFrontOvL STRENGTH=0
#exec MESH ORIGIN MESH=SBoltFrontOvL X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=SBoltFrontOvR ANIVFILE=MODELS\SBoltFrontOv_a.3d DATAFILE=MODELS\SBoltFrontOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=SBoltFrontOvR STRENGTH=0
#exec MESH ORIGIN MESH=SBoltFrontOvR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=SBoltFrontOvPick ANIVFILE=MODELS\SBoltFrontOv_a.3d DATAFILE=MODELS\SBoltFrontOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=SBoltFrontOvPick STRENGTH=0
#exec MESH ORIGIN MESH=SBoltFrontOvPick X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=SBoltFrontOvL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltFrontOvL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltFrontOvL SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltFrontOvL SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltFrontOvL SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltFrontOvL SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltFrontOvL SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltFrontOvR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltFrontOvR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltFrontOvR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltFrontOvR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltFrontOvR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltFrontOvR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltFrontOvR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltFrontOvPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=SBoltFrontOvL MESH=SBoltFrontOvL
#exec MESHMAP SCALE MESHMAP=SBoltFrontOvL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltFrontOvR MESH=SBoltFrontOvR
#exec MESHMAP SCALE MESHMAP=SBoltFrontOvR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltFrontOvPick MESH=SBoltFrontOvPick
#exec MESHMAP SCALE MESHMAP=SBoltFrontOvPick X=0.125 Y=0.125 Z=0.25


//===========================================================================

//CORONA LIGHTS
//*******************************************************

//Particle Model 1
//*******************************************************
//1st person
#exec MESH IMPORT MESH=SBoltLLightsL ANIVFILE=MODELS\SBoltLLights_a.3d DATAFILE=MODELS\SBoltLLights_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=SBoltLLightsL STRENGTH=0
#exec MESH ORIGIN MESH=SBoltLLightsL X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=SBoltLLightsR ANIVFILE=MODELS\SBoltLLights_a.3d DATAFILE=MODELS\SBoltLLights_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
//#exec MESH LODPARAMS MESH=SBoltLLightsR STRENGTH=0
#exec MESH ORIGIN MESH=SBoltLLightsR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=SBoltLLightsPick ANIVFILE=MODELS\SBoltLLights_a.3d DATAFILE=MODELS\SBoltLLights_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=SBoltLLightsPick STRENGTH=0
#exec MESH ORIGIN MESH=SBoltLLightsPick X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=SBoltLLightsL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltLLightsL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltLLightsL SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltLLightsL SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltLLightsL SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltLLightsL SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltLLightsL SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltLLightsR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltLLightsR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltLLightsR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltLLightsR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltLLightsR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltLLightsR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltLLightsR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltLLightsPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=SBoltLLightsL MESH=SBoltLLightsL
#exec MESHMAP SCALE MESHMAP=SBoltLLightsL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltLLightsR MESH=SBoltLLightsR
#exec MESHMAP SCALE MESHMAP=SBoltLLightsR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltLLightsPick MESH=SBoltLLightsPick
#exec MESHMAP SCALE MESHMAP=SBoltLLightsPick X=0.125 Y=0.125 Z=0.25



//Particle Model 2
//*******************************************************
//1st person
#exec MESH IMPORT MESH=SBoltFrontLhtL ANIVFILE=MODELS\SBoltFrontLht_a.3d DATAFILE=MODELS\SBoltFrontLht_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=SBoltFrontLhtL STRENGTH=0
#exec MESH ORIGIN MESH=SBoltFrontLhtL X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=SBoltFrontLhtR ANIVFILE=MODELS\SBoltFrontLht_a.3d DATAFILE=MODELS\SBoltFrontLht_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
//#exec MESH LODPARAMS MESH=SBoltFrontLhtR STRENGTH=0
#exec MESH ORIGIN MESH=SBoltFrontLhtR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=SBoltFrontLhtPick ANIVFILE=MODELS\SBoltFrontLht_a.3d DATAFILE=MODELS\SBoltFrontLht_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=SBoltFrontLhtPick STRENGTH=0
#exec MESH ORIGIN MESH=SBoltFrontLhtPick X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=SBoltFrontLhtL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltFrontLhtL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltFrontLhtL SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltFrontLhtL SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltFrontLhtL SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltFrontLhtL SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltFrontLhtL SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltFrontLhtR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=SBoltFrontLhtR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltFrontLhtR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=SBoltFrontLhtR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=SBoltFrontLhtR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=SBoltFrontLhtR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=SBoltFrontLhtR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=SBoltFrontLhtPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=SBoltFrontLhtL MESH=SBoltFrontLhtL
#exec MESHMAP SCALE MESHMAP=SBoltFrontLhtL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltFrontLhtR MESH=SBoltFrontLhtR
#exec MESHMAP SCALE MESHMAP=SBoltFrontLhtR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=SBoltFrontLhtPick MESH=SBoltFrontLhtPick
#exec MESHMAP SCALE MESHMAP=SBoltFrontLhtPick X=0.125 Y=0.125 Z=0.25



//Coronas
#exec TEXTURE IMPORT NAME=SBoltLittleLight FILE=Coronas\SBoltLittleLight.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=SBoltFrontLight FILE=Coronas\SBoltFrontLight.bmp GROUP=Coronas FLAGS=2

//===========================================================================

#exec OBJ LOAD FILE=Textures\SBoltIceFX.utx PACKAGE=NWSuperBoltRifleVIII_SRC.IceFX

//===========================================================================


var float BaseGlow;
var float BaseScale;
var SBoltLightEffectCor SBoltLCor;

var(ServerConfig) config bool bInfiniteAmmo;
var(ServerConfig) config float RefireDelay;
var(ServerConfig) config int SuperDamage;
var(ServerConfig) config bool canDropWeapon;

var(ServerConfig) config bool enableCombo;
var(ServerConfig) config float RefireDelayAlt;
var(ServerConfig) config byte MaxProjectiles;
var(ServerConfig) config int ProjectileDamage;
var(ServerConfig) config int ComboDamage;

var(ClientConfig) config bool bFirstPersonShotFX;

var float RefireD, RefireDAlt;
var byte finishingFiringStatus;
var float MinCoronaHiddenRenderDist;
var bool bCombo;
var Projectile ComboFocus, ComboPoint[16];
var byte CLastFired;

replication
{
	reliable if (Role == ROLE_Authority)
		RefireD, RefireDAlt, bCombo;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	
	RefireD = default.RefireDelay;
	RefireDAlt = default.RefireDelayAlt;
	ZPMaxFirerate = 1/(1/3.0 + 1/RefireD);
	ZPMaxFirerateAlt = ZPMaxFirerate;
	bCanThrow = default.canDropWeapon;
	bCombo = default.enableCombo;
	bAltInstantHit = !bCombo;
	bAltFireHitScan = bAltInstantHit;
}

simulated function PlayNoAmmoFiring();
simulated function PlayNoAmmoAltFiring();

simulated function Tick(float Delta)
{
local float newGlow;
local byte i;

	Super.Tick(Delta);
	
	if (Pawn(Owner) == None || Pawn(Owner).Weapon != Self)
		return;

	if (Level.NetMode != NM_DedicatedServer && PlayerPawn(Owner) != None)
	{
		newGlow = 1.0 + FRand();
		
		if (BaseGlow < 1.0)
			BaseGlow += Delta;
		else if (BaseGlow > 1.0)
			BaseGlow = 1.0;
			
		if (BaseScale < 1.0)
			BaseScale += Delta;
		else if (BaseScale > 1.0)
			BaseScale = 1.0;
			
		if (FirstGlowFXActor[0] != None)
			FirstGlowFXActor[0].ScaleGlow = newGlow;
			
		if (FirstGlowFXActor[1] != None)
		{
			FirstGlowFXActor[1].ScaleGlow = BaseGlow * newGlow;
			FirstGlowFXActor[1].DrawScale = FirstPersonGlowFX[1].GlowTexScale * BaseScale;
		}
			
		if (FirstOverFXActor[1] != None)
			FirstOverFXActor[1].ScaleGlow = FirstPersonOverFX[1].GlowAmount * BaseGlow;
	}
}

function bool useAmmoToFire(optional bool bAltFire)
{
	return (bInfiniteAmmo || AmmoType.UseAmmo(1));
}

function HandleCopy(Pawn Other, NaliWeapons Copy)
{
	Super.HandleCopy(Other, Copy);
	if (SuperBoltRifle(Copy) != None)
	{
		SuperBoltRifle(Copy).bInfiniteAmmo = bInfiniteAmmo;
		SuperBoltRifle(Copy).MaxProjectiles = MaxProjectiles;
	}
}

simulated function PlayFiring()
{
	PlayFire();
}

function AltFire(float Value)
{
local Actor AltProj;
local int altProjCount, projToRemove;

	if (!bCombo)
	{
		Super.AltFire(Value);
		return;
	}
	
    if (AmmoType == None && AmmoName != None)
        GiveAmmo(Pawn(Owner));

    if (useAmmoToFire(True))
    {
		GotoState('AltFiring');
        bPointing = True;
        bCanClientFire = true;
        ClientAltFire(Value);
        if (bRapidFire || FiringSpeed > 0)
            Pawn(Owner).PlayRecoil(FiringSpeed);

		if (Class'NWUtils'.static.isElegibleBotAI(Pawn(Owner)))
		{
			ComboPoint[CLastFired] = AltProjectileFire(AltProjectileClass, AltProjectileSpeed, bAltWarnTarget);
			CLastFired++;
			if (CLastFired >= ArrayCount(ComboPoint))
				CLastFired = 0;
		}
		else
			AltProjectileFire(AltProjectileClass, AltProjectileSpeed, bAltWarnTarget);
			
		if (MaxProjectiles > 0)
		{
			foreach AllActors(AltProjectileClass, AltProj)
			{
				if (AltProj.Class == AltProjectileClass && AltProj.Instigator == Pawn(Owner))
					altProjCount++;
			}
			
			if (altProjCount > MaxProjectiles)
			{
				projToRemove = altProjCount - MaxProjectiles;
				foreach AllActors(AltProjectileClass, AltProj)
				{
					if (AltProj.Class == AltProjectileClass && AltProj.Instigator == Pawn(Owner) && projToRemove > 0)
					{
						AltProj.Destroy();
						projToRemove--;
						if (projToRemove <= 0)
							break;
					}
				}
			}
		}
	}
}

simulated function PlayAltFiring()
{
	if (!bCombo)
		PlayFire();
	else
	{
		PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*1.5);
		PlayAnim('AltFire', GetFirerateMult(True) * 3.0, 0.0);
		BaseGlow = 0.0;
		BaseScale = 0.0;
	}
}

simulated function PlayFire()
{
local vector X, Y, Z, Loc;

	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*3.0);
	PlayAnim('Fire', GetFirerateMult() * 3.0, 0.0);
	BaseGlow = 0.0;
	
	if (default.bFirstPersonShotFX)
	{
		if (SBoltLCor != None)
			SBoltLCor.Destroy();
		SBoltLCor = None;
		
		if (PlayerPawn(Owner) != None && Level.NetMode != NM_DedicatedServer)
		{
			GetAxes(Pawn(Owner).ViewRotation,X,Y,Z);
			Loc = Owner.Location + CalcNewDrawOffset() + (FireOffset >> Pawn(Owner).ViewRotation);
			Loc += ((vect(-96,0,0) >> Pawn(Owner).ViewRotation) + ((vect(1,0,0)*class'SBoltTrace'.default.TraceLength/2) >> Pawn(Owner).ViewRotation));
			SBoltLCor = Spawn(Class'SBoltLightEffectCor',,, Loc);
		}
	}
}

simulated function Destroyed()
{
	if (SBoltLCor != None)
		SBoltLCor.Destroy();
	SBoltLCor = None;
	
	Super.Destroyed();
}

simulated function PrePostRenderOther( canvas Canvas, float Scale)
{
	if (SBoltLCor != None && SBoltLCor.LifeSpan > 0 && PlayerPawn(Owner) != None && (PlayerPawn(Owner).Handedness < 2 || VSize(PlayerPawn(Owner).Location - Location) >= MinCoronaHiddenRenderDist))		
		Canvas.DrawActor(SBoltLCor, False, True);
}

simulated function ProcessOther(Actor Other, Vector HitLocation, Vector HitNormal, Vector StartTrace)
{
local SBoltTracerGuide btg;

	Spawn(Class'SBoltLightEffectGND', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	
	btg = Spawn(Class'SBoltTracerGuide', ZPOwner,, StartTrace, rotator(HitLocation - StartTrace));
	btg.MakeTracing(VSize(HitLocation - StartTrace));
}

simulated function ProcessTraceHit(Actor Other, Vector HitLocation, Vector HitNormal, Vector X, Vector Y, Vector Z)
{
local byte j, Sparks;
local SBoltLightEffectGND bleg;

	if (SEMPSphere(Other) != None)
	{
		if (Role == ROLE_Authority)
		{
			SEMPSphere(Other).Instigator = Pawn(Owner);
			SEMPSphere(Other).Combo();
		}
		return;
	}
	
	if (Other == Level)
	{
		Spawn(Class'SBoltDecalFX', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
		Spawn(class'SBoltSmokeGen', ZPOwner,, HitLocation + HitNormal);
		Spawn(Class'SBoltWallParts', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	}
	else if (Other != Self && Other != Owner && Other != None) 
	{
		if ((Other.bIsPawn || Other.IsA('Carcass')) && Role == ROLE_Authority)
			Other.PlaySound(Sound 'ChunkHit',, 16.0,,100);
		else if (!Other.bIsPawn && !Other.IsA('Carcass'))
		{
			Spawn(class'NWZPUT_SmokePuff', ZPOwner,,HitLocation+HitNormal*9);
			Sparks = 6 + Rand(16);
			for (j = 0; j <= Sparks; j++) 
				Spawn(class'SBoltSpark', ZPOwner,, HitLocation + 8 * HitNormal, rotator(HitNormal));
		}
		
		if (Role == ROLE_Authority)
		{
			Other.TakeDamage(SuperDamage,  Pawn(Owner), HitLocation, 85000.0 * X, MyDamageType);
			if ((Other.bIsPawn || Carcass(Other) != None) && !Other.Region.Zone.bWaterZone)
				Spawn(Class'SBoltFlamesCarcasses',,, HitLocation);
		}
	}
}


function float RateSelf( out int bUseAltMode )
{
local float EnemyDist, Rating;
local bool bRetreating;
local vector EnemyDir;
local Pawn P;
local byte i, min;
local float minDist;

	P = Pawn(Owner);

	//No enemy, no need to fire
	if (P.Enemy == None)
        return AIRating;

	//Don't recommend self if out of ammo
	if (AmmoType.AmmoAmount <= 0)
        return -2;
	else
		return 3.0;
		
	//Don't recommend second mode if too close and is combo-able
	if (!bCombo && EnemyDist < 360)
		bUseAltMode = 0;
	else
		bUseAltMode = int(FRand() + 0.5);
		
	//Make the combo
	if (Class'NWUtils'.static.isElegibleBotAI(P, True, FRand()*6.0) && P.Enemy != None)
	{
		minDist = 65535;
		for (i = 0; i < ArrayCount(ComboPoint); i++)
		{
			if (ComboPoint[i] != None && !ComboPoint[i].bDeleteMe && VSize(ComboPoint[i].Velocity) > 0 && VSize(ComboPoint[i].Location - P.Enemy.Location) < minDist)
			{
				min = i;
				minDist = VSize(ComboPoint[i].Location - P.Enemy.Location);
			}
		}
		
		if (minDist <= 300 && (vector(P.ViewRotation) Dot Normal(ComboPoint[min].Location - P.Location)) > 0.5)
		{
			ComboFocus = ComboPoint[min];
			bUseAltMode = 0;
			return 3.0;
		}
	}	
	
	return (AIRating + FRand() * 0.05);
}

state NormalFire
{
	function AnimEnd()
    {
		if (finishingFiringStatus == 0)
		{
			finishingFiringStatus = 1;
			TweenAnim('StillAlt', FMax(RefireD,0.1)/2);
		}
		else if (finishingFiringStatus == 1)
		{
			finishingFiringStatus = 2;
			TweenAnim('Still', FMax(RefireD,0.1)/2);
		}
		else
		{
			finishingFiringStatus = 0;
			Super.AnimEnd();
		}
	}
	
	function EndState()
	{
		finishingFiringStatus = 0;
		Super.EndState();
	}
}

state ClientFiring
{
    simulated function AnimEnd()
    {
		if (finishingFiringStatus == 0)
		{
			finishingFiringStatus = 1;
			TweenAnim('StillAlt', FMax(RefireD,0.1)/2);
		}
		else if (finishingFiringStatus == 1)
		{
			finishingFiringStatus = 2;
			TweenAnim('Still', FMax(RefireD,0.1)/2);
		}
		else
		{
			finishingFiringStatus = 0;
			Super.AnimEnd();
		}
	}
	
	simulated function EndState()
	{
		finishingFiringStatus = 0;
		Super.EndState();
	}
}

state AltFiring
{	
	function AnimEnd()
    {
	local float refRate;
	
		if (bCombo)
			refRate = FMax(RefireDAlt,0.1);
		else
			refRate = FMax(RefireD,0.1);
			
		if (finishingFiringStatus == 0)
		{
			finishingFiringStatus = 1;
			TweenAnim('StillAlt', refRate/2);
		}
		else if (finishingFiringStatus == 1)
		{
			finishingFiringStatus = 2;
			TweenAnim('Still', refRate/2);
		}
		else
		{
			finishingFiringStatus = 0;
			Super.AnimEnd();
		}
	}
	
	function EndState()
	{
		finishingFiringStatus = 0;
		Super.EndState();
	}
}

state ClientAltFiring
{
    simulated function AnimEnd()
    {
	local float refRate;
	
		if (bCombo)
			refRate = FMax(RefireDAlt,0.1);
		else
			refRate = FMax(RefireD,0.1);
			
		if (finishingFiringStatus == 0)
		{
			finishingFiringStatus = 1;
			TweenAnim('StillAlt', refRate/2);
		}
		else if (finishingFiringStatus == 1)
		{
			finishingFiringStatus = 2;
			TweenAnim('Still', refRate/2);
		}
		else
		{
			finishingFiringStatus = 0;
			Super.AnimEnd();
		}
	}
	
	simulated function EndState()
	{
		finishingFiringStatus = 0;
		Super.EndState();
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=SBoltRiflePick
	CollisionHeight=10.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=10
	Icon=SBoltIcon
	InventoryGroup=4
	ItemArticle="a"
	ItemName="Super Bolt Rifle"
	MaxDesireability=0.900000
	PickupMessage="You got the Super Bolt Rifle."
	PickupSound=SBoltRPickup
	PickupViewMesh=SBoltRiflePick
	PickupViewScale=1.000000
	PlayerViewMesh=SBoltRifleR
	PlayerViewOffset=(X=10.50000,Y=-4.200000,Z=-4.000000)
	WidePlayerViewOffset=(X=10.50000,Y=-4.200000,Z=-4.000000)
	PlayerViewScale=1.000000
	RespawnTime=60.000000
	StatusIcon=SBoltIcon
	ThirdPersonMesh=SBoltRifleM
	ThirdPersonScale=0.750000
	AltDamageType=Electrified
	AltFireSound=SBoltRAltFire
	AltProjectileClass=Class'SEMPSphere'
	AmmoName=Class'SuperBoltAmmo'
	bInstantHit=True
    bAltInstantHit=True
	bRapidFire=False
	DeathMessage="%o was obliterated to bits by %k's %w."
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=SBoltRFire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Electrified
	NameColor=(R=255,G=0,B=0)
	PickupAmmoCount=10
	ProjectileClass=None
	SelectSound=SBoltRSelect
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.750000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=False
	bSplashDamage=False
	bWarnTarget=False
	RefireRate=1.000000
	Mass=50.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=SBoltCross
	CustomCrossAlpha=SBoltCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Electrical rifle of hyper-high voltage and concentrated precision.\n\nPrimary and Secondary Fire: Very brief yet extremely powerful controlled hyper-heated and super-concentrated lightning."
	
	LightBrightness=100
	LightHue=0
	LightSaturation=0
	LightRadius=4
	LightType=LT_Steady
	
	MultiSkins(5)=AmmoCoreFX
	MultiSkins(6)=WireFX
	Texture=SGlassCryst
	
	PlayerViewMeshLeft=SBoltRifle
	PlayerViewMeshRight=SBoltRifleR
	HandPartMeshL(0)=SBoltHandL
	HandPartMeshR(0)=SBoltHandR
	BobDamping=1.075000
	
	RenderOffsetSelect=(Y=-1.000000,Z=-2.000000)
	AnimMaxFrame=0.857129
	RenderOffsetFire=(X=-1.500000)
	AnimMaxFrameFire=0.857143
	
	FireOffsetZAdjustHidden=-6.000000
	AltFireOffsetZAdjustHidden=-6.000000
	
	FirstPersonOverFX(0)=(bLit=True,OverMainTex=Texture'SGlassCryst',OverTex1=Texture'Ov_SBoltR_01')
	FirstPersonOverFX(0)=(OverTex2=Texture'Ov_SBoltR_02',OverTex3=Texture'Ov_SBoltR_03',OverTex4=Texture'Ov_SBoltAmmo')
	FirstPersonOverFX(0)=(OverTex5=Texture'AmmoCoreFX',OverTex6=Texture'WireFX')
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	
	FirstPersonOverFX(1)=(bLit=True,OverTex1=FrontEnergyFX)
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=2.000000,bCustomMesh=True)
	FirstPersonOverFX(1)=(CustomMeshLeft=Mesh'SBoltFrontOvL',CustomMesh=Mesh'SBoltFrontOvR')
	
	PickupOverFX(0)=(bLit=True,OverMainTex=Texture'SGlassCryst',OverTex1=Texture'Ov_SBoltR_01')
	PickupOverFX(0)=(OverTex2=Texture'Ov_SBoltR_02',OverTex3=Texture'Ov_SBoltR_03',OverTex4=Texture'Ov_SBoltAmmo')
	PickupOverFX(0)=(OverTex5=Texture'AmmoCoreFX',OverTex6=Texture'WireFX')
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	
	PickupOverFX(1)=(bLit=True,OverTex1=FrontEnergyFX)
	PickupOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=2.000000,bCustomMesh=True)
	PickupOverFX(1)=(CustomMesh=Mesh'SBoltFrontOvPick')
	
	
	FirstPersonGlowFX(0)=(bLit=True,GlowModel=Mesh'SBoltLLightsR',GlowModelLeft=Mesh'SBoltLLightsL')
	FirstPersonGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.010000)
	FirstPersonGlowFX(0)=(GlowTex1=Texture'SBoltLittleLight')
	
	FirstPersonGlowFX(1)=(bLit=True,bRandFrame=True,GlowModel=Mesh'SBoltFrontLhtR',GlowModelLeft=Mesh'SBoltFrontLhtL')
	FirstPersonGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.048000)
	FirstPersonGlowFX(1)=(GlowTex3=Texture'SBoltFrontLight')
	
	PickupGlowFX(0)=(bLit=True,GlowModel=Mesh'SBoltLLightsPick')
	PickupGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.041670)
	PickupGlowFX(0)=(GlowTex1=Texture'SBoltLittleLight',GlowSetClass=Class'SuperBoltOverPickupFX')
	
	PickupGlowFX(1)=(bLit=True,bRandFrame=True,GlowModel=Mesh'SBoltFrontLhtPick')
	PickupGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.200000)
	PickupGlowFX(1)=(GlowTex3=Texture'SBoltFrontLight',GlowSetClass=Class'SuperBoltOverPickupFX')
	
	MinCoronaHiddenRenderDist=64.000000
	
	BaseGlow=1.000000
	BaseScale=1.000000
	
	RefireDelay=1.000000
	SuperDamage=500000
	bInfiniteAmmo=True
	canDropWeapon=True
	RefireD=1.000000
	bMegaWeapon=True
	
	bInstantHitWaterFX=True
	bBallisticWaterFX=False
	WaterSplashType=2
	
	bFirstPersonShotFX=True
	
	isZPWeapon=True
	bFireHitScan=True
	bAltFireHitScan=True
	AccuracyPattern(0)=0.000000
	AccuracyPatternAlt(0)=0.000000
	
	enableCombo=False
	RefireDelayAlt=0.350000
	MaxProjectiles=2
	ProjectileDamage=2000
	ComboDamage=100000
}
