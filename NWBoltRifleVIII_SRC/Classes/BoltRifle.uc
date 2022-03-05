//////////////////////////////////////////////////////////////
//	Nali Weapons III Bolt Rifle weapon
//				Feralidragon (21-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltRifle expands NaliWeapons config(NWeaponsCfg);


//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=BoltRifle ANIVFILE=MODELS\BoltRifle_a.3d DATAFILE=MODELS\BoltRifle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltRifle STRENGTH=0
#exec MESH ORIGIN MESH=BoltRifle X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=BoltRifleR ANIVFILE=MODELS\BoltRifle_a.3d DATAFILE=MODELS\BoltRifle_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=BoltRifleR STRENGTH=0
#exec MESH ORIGIN MESH=BoltRifleR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=BoltRiflePick ANIVFILE=MODELS\BoltRifle_a.3d DATAFILE=MODELS\BoltRifle_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=BoltRiflePick STRENGTH=0
#exec MESH ORIGIN MESH=BoltRiflePick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=BoltRifleM ANIVFILE=MODELS\BoltRifle_a.3d DATAFILE=MODELS\BoltRifle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltRifleM STRENGTH=0.45
#exec MESH ORIGIN MESH=BoltRifleM X=320 Y=0 Z=-20 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=BoltRifle SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltRifle SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltRifle SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltRifle SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltRifle SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltRifle SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltRifle SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltRifleR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltRifleR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltRifleR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltRifleR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltRifleR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltRifleR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltRifleR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltRiflePick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=BoltRifleM SEQ=All STARTFRAME=0 NUMFRAMES=22
#exec MESH SEQUENCE MESH=BoltRifleM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltRifleM SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltRifleM SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltRifleM SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=BoltRifle MESH=BoltRifle
#exec MESHMAP SCALE MESHMAP=BoltRifle X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltRifleR MESH=BoltRifleR
#exec MESHMAP SCALE MESHMAP=BoltRifleR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltRiflePick MESH=BoltRiflePick
#exec MESHMAP SCALE MESHMAP=BoltRiflePick X=0.125 Y=0.125 Z=0.25

#exec MESHMAP NEW MESHMAP=BoltRifleM MESH=BoltRifleM
#exec MESHMAP SCALE MESHMAP=BoltRifleM X=0.1 Y=0.1 Z=0.2

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_BoltR_01 FILE=SKINS\Sk_BoltR_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifle NUM=1 TEXTURE=Sk_BoltR_01
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifleR NUM=1 TEXTURE=Sk_BoltR_01
#exec MESHMAP SETTEXTURE MESHMAP=BoltRiflePick NUM=1 TEXTURE=Sk_BoltR_01
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifleM NUM=1 TEXTURE=Sk_BoltR_01

#exec TEXTURE IMPORT NAME=Sk_BoltR_02 FILE=SKINS\Sk_BoltR_02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifle NUM=2 TEXTURE=Sk_BoltR_02
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifleR NUM=2 TEXTURE=Sk_BoltR_02
#exec MESHMAP SETTEXTURE MESHMAP=BoltRiflePick NUM=2 TEXTURE=Sk_BoltR_02
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifleM NUM=2 TEXTURE=Sk_BoltR_02

#exec TEXTURE IMPORT NAME=Sk_BoltR_03 FILE=SKINS\Sk_BoltR_03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifle NUM=3 TEXTURE=Sk_BoltR_03
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifleR NUM=3 TEXTURE=Sk_BoltR_03
#exec MESHMAP SETTEXTURE MESHMAP=BoltRiflePick NUM=3 TEXTURE=Sk_BoltR_03
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifleM NUM=3 TEXTURE=Sk_BoltR_03

#exec TEXTURE IMPORT NAME=Sk_BoltAmmo FILE=SKINS\Sk_BoltAmmo.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifle NUM=4 TEXTURE=Sk_BoltAmmo
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifleR NUM=4 TEXTURE=Sk_BoltAmmo
#exec MESHMAP SETTEXTURE MESHMAP=BoltRiflePick NUM=4 TEXTURE=Sk_BoltAmmo
#exec MESHMAP SETTEXTURE MESHMAP=BoltRifleM NUM=4 TEXTURE=Sk_BoltAmmo

#exec TEXTURE IMPORT NAME=GlassCryst FILE=SKINS\GlassCryst.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=BoltIcon FILE=ICONS\BoltIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=BoltCrossAlpha FILE=ICONS\BoltCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\BoltIcons.utx PACKAGE=NWBoltRifleVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="BoltRPickup" FILE=SOUNDS\BoltRPickup.wav GROUP="BoltRifle"
#exec AUDIO IMPORT NAME="BoltRSelect" FILE=SOUNDS\BoltRSelect.wav GROUP="BoltRifle"
#exec AUDIO IMPORT NAME="BoltRAltFire" FILE=SOUNDS\BoltRAltFire.wav GROUP="BoltRifle"
#exec AUDIO IMPORT NAME="BoltRFire" FILE=SOUNDS\BoltRFire.wav GROUP="BoltRifle"


//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=BoltHandL ANIVFILE=MODELS\BoltHand_a.3d DATAFILE=MODELS\BoltHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltHandL STRENGTH=0
#exec MESH ORIGIN MESH=BoltHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=BoltHandR ANIVFILE=MODELS\BoltHand_a.3d DATAFILE=MODELS\BoltHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=BoltHandR STRENGTH=0
#exec MESH ORIGIN MESH=BoltHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=BoltHandL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltHandL SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltHandL SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltHandL SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltHandL SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltHandL SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltHandR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltHandR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltHandR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltHandR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltHandR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltHandR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

//Scale
#exec MESHMAP NEW MESHMAP=BoltHandL MESH=BoltHandL
#exec MESHMAP SCALE MESHMAP=BoltHandL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltHandR MESH=BoltHandR
#exec MESHMAP SCALE MESHMAP=BoltHandR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=BoltHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=BoltHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//OVERLAYER SKINS
//*******************************************************
#exec TEXTURE IMPORT NAME=Ov_BoltAmmo FILE=OVERLAYERS\Ov_BoltAmmo.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=Ov_BoltR_01 FILE=OVERLAYERS\Ov_BoltR_01.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=Ov_BoltR_02 FILE=OVERLAYERS\Ov_BoltR_02.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=Ov_BoltR_03 FILE=OVERLAYERS\Ov_BoltR_03.bmp GROUP=Skins LODSET=2

//Front Overlayers
//*******************************************************
//1st person
#exec MESH IMPORT MESH=BoltFrontOvL ANIVFILE=MODELS\BoltFrontOv_a.3d DATAFILE=MODELS\BoltFrontOv_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltFrontOvL STRENGTH=0
#exec MESH ORIGIN MESH=BoltFrontOvL X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=BoltFrontOvR ANIVFILE=MODELS\BoltFrontOv_a.3d DATAFILE=MODELS\BoltFrontOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=BoltFrontOvR STRENGTH=0
#exec MESH ORIGIN MESH=BoltFrontOvR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=BoltFrontOvPick ANIVFILE=MODELS\BoltFrontOv_a.3d DATAFILE=MODELS\BoltFrontOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=BoltFrontOvPick STRENGTH=0
#exec MESH ORIGIN MESH=BoltFrontOvPick X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=BoltFrontOvL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltFrontOvL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltFrontOvL SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltFrontOvL SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltFrontOvL SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltFrontOvL SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltFrontOvL SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltFrontOvR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltFrontOvR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltFrontOvR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltFrontOvR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltFrontOvR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltFrontOvR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltFrontOvR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltFrontOvPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=BoltFrontOvL MESH=BoltFrontOvL
#exec MESHMAP SCALE MESHMAP=BoltFrontOvL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltFrontOvR MESH=BoltFrontOvR
#exec MESHMAP SCALE MESHMAP=BoltFrontOvR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltFrontOvPick MESH=BoltFrontOvPick
#exec MESHMAP SCALE MESHMAP=BoltFrontOvPick X=0.125 Y=0.125 Z=0.25


//===========================================================================

//CORONA LIGHTS
//*******************************************************

//Particle Model 1
//*******************************************************
//1st person
#exec MESH IMPORT MESH=BoltLLightsL ANIVFILE=MODELS\BoltLLights_a.3d DATAFILE=MODELS\BoltLLights_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=BoltLLightsL STRENGTH=0
#exec MESH ORIGIN MESH=BoltLLightsL X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=BoltLLightsR ANIVFILE=MODELS\BoltLLights_a.3d DATAFILE=MODELS\BoltLLights_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
//#exec MESH LODPARAMS MESH=BoltLLightsR STRENGTH=0
#exec MESH ORIGIN MESH=BoltLLightsR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=BoltLLightsPick ANIVFILE=MODELS\BoltLLights_a.3d DATAFILE=MODELS\BoltLLights_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=BoltLLightsPick STRENGTH=0
#exec MESH ORIGIN MESH=BoltLLightsPick X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=BoltLLightsL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltLLightsL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltLLightsL SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltLLightsL SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltLLightsL SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltLLightsL SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltLLightsL SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltLLightsR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltLLightsR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltLLightsR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltLLightsR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltLLightsR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltLLightsR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltLLightsR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltLLightsPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=BoltLLightsL MESH=BoltLLightsL
#exec MESHMAP SCALE MESHMAP=BoltLLightsL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltLLightsR MESH=BoltLLightsR
#exec MESHMAP SCALE MESHMAP=BoltLLightsR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltLLightsPick MESH=BoltLLightsPick
#exec MESHMAP SCALE MESHMAP=BoltLLightsPick X=0.125 Y=0.125 Z=0.25



//Particle Model 2
//*******************************************************
//1st person
#exec MESH IMPORT MESH=BoltFrontLhtL ANIVFILE=MODELS\BoltFrontLht_a.3d DATAFILE=MODELS\BoltFrontLht_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=BoltFrontLhtL STRENGTH=0
#exec MESH ORIGIN MESH=BoltFrontLhtL X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=BoltFrontLhtR ANIVFILE=MODELS\BoltFrontLht_a.3d DATAFILE=MODELS\BoltFrontLht_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
//#exec MESH LODPARAMS MESH=BoltFrontLhtR STRENGTH=0
#exec MESH ORIGIN MESH=BoltFrontLhtR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=BoltFrontLhtPick ANIVFILE=MODELS\BoltFrontLht_a.3d DATAFILE=MODELS\BoltFrontLht_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=BoltFrontLhtPick STRENGTH=0
#exec MESH ORIGIN MESH=BoltFrontLhtPick X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=BoltFrontLhtL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltFrontLhtL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltFrontLhtL SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltFrontLhtL SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltFrontLhtL SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltFrontLhtL SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltFrontLhtL SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltFrontLhtR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=BoltFrontLhtR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltFrontLhtR SEQ=Fire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=BoltFrontLhtR SEQ=AltFire STARTFRAME=6 NUMFRAMES=16 RATE=12.0
#exec MESH SEQUENCE MESH=BoltFrontLhtR SEQ=Select STARTFRAME=27 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=BoltFrontLhtR SEQ=Down STARTFRAME=21 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=BoltFrontLhtR SEQ=StillAlt STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=BoltFrontLhtPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=BoltFrontLhtL MESH=BoltFrontLhtL
#exec MESHMAP SCALE MESHMAP=BoltFrontLhtL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltFrontLhtR MESH=BoltFrontLhtR
#exec MESHMAP SCALE MESHMAP=BoltFrontLhtR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=BoltFrontLhtPick MESH=BoltFrontLhtPick
#exec MESHMAP SCALE MESHMAP=BoltFrontLhtPick X=0.125 Y=0.125 Z=0.25



//Coronas
#exec TEXTURE IMPORT NAME=BoltLittleLight FILE=Coronas\BoltLittleLight.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=BoltFrontLight FILE=Coronas\BoltFrontLight.bmp GROUP=Coronas FLAGS=2

//===========================================================================

#exec OBJ LOAD FILE=Textures\BoltIceFX.utx PACKAGE=NWBoltRifleVIII_SRC.IceFX

//===========================================================================


var float BaseGlow;
var float BaseScale;

var BoltLightEffectCor BoltLCor;
var Projectile ComboFocus, ComboPoint[16];
var byte CLastFired;

var() int ElectricShotDmg;

var(ServerConfig) config bool bWaterConductive;
var(ServerConfig) config int HeadShotDmg;
var(ServerConfig) config byte ComboExtraAmmo;
var(ServerConfig) config int ComboDamage;
var(ServerConfig) config float WaterElectrocutionRadius;
var(ServerConfig) config int WaterElectrocutionDamage;
var bool isWaterConductive;

var(ClientConfig) config bool bFirstPersonShotFX;

var float MinCoronaHiddenRenderDist;
var byte finishingFiringStatus;

//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime, OversurrectiveHLRate;
var(Oversurrection) config float OversurrectiveHLOdds, OversurrectiveCloudHLOdds, OversurrectiveDryHLOdds, OversurrectiveEnemyHLOdds;
var(Oversurrection) config int OversurrectiveMaxHL, OversurrectiveHLDirectDmg, OversurrectiveHLSplashDmg;
var(Oversurrection) config float OversurrectiveHLMaxDist, OversurrectiveHLDmgRadius;


replication
{
	reliable if (Role == ROLE_Authority)
		isWaterConductive;
}


function PreBeginPlay()
{
	Super.PreBeginPlay();
	isWaterConductive = default.bWaterConductive;
}

simulated function Tick(float Delta)
{
local float newGlow;
local byte i;

	Super.Tick(Delta);

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

simulated function PlayNoAmmoFiring();
simulated function PlayNoAmmoAltFiring();

simulated function PlayFiring()
{
local vector Loc;

	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*3.0);
	PlayAnim('Fire', GetFirerateMult() * 3.0, 0.0);
	BaseGlow = 0.0;
	
	if (default.bFirstPersonShotFX)
	{
		if (BoltLCor != None)
			BoltLCor.Destroy();
		BoltLCor = None;
		
		if (PlayerPawn(Owner) != None && Level.NetMode != NM_DedicatedServer)
		{
			Loc = Owner.Location + CalcNewDrawOffset() + (FireOffset >> Pawn(Owner).ViewRotation);
			Loc += ((vect(-96,0,0) >> Pawn(Owner).ViewRotation) + ((vect(1,0,0)*class'BoltTrace'.default.TraceLength/2) >> Pawn(Owner).ViewRotation));
			BoltLCor = Spawn(Class'BoltLightEffectCor',,, Loc);
		}
	}
}

simulated function Destroyed()
{
	if (BoltLCor != None)
		BoltLCor.Destroy();
	BoltLCor = None;
	
	Super.Destroyed();
}

simulated function PrePostRenderOther( canvas Canvas, float Scale)
{
	if (BoltLCor != None && BoltLCor.LifeSpan > 0 && PlayerPawn(Owner) != None && (PlayerPawn(Owner).Handedness < 2 || VSize(PlayerPawn(Owner).Location - Location) >= MinCoronaHiddenRenderDist))		
		Canvas.DrawActor(BoltLCor, False, True);
}


function AltFire( float Value )
{
    if ((AmmoType == None) && (AmmoName != None))
        GiveAmmo(Pawn(Owner));

    if (bInfinity || AmmoType.UseAmmo(1))
    {
		GotoState('AltFiring');
        bPointing=True;
        bCanClientFire = true;
        ClientAltFire(Value);
        if ( bRapidFire || (FiringSpeed > 0) )
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
	}
}

simulated function PlayAltFiring()
{
	PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*1.5);
	PlayAnim('AltFire', GetFirerateMult(True) * 3.0, 0.0);
	BaseGlow = 0.0;
	BaseScale = 0.0;
}

simulated function ProcessOther(Actor Other, Vector HitLocation, Vector HitNormal, Vector StartTrace)
{
local BoltTracerGuide btg;
local BoltLightEffectGND bleg;
local float TraceSize;
local bool wasInWater;

	btg = Spawn(Class'BoltTracerGuide', ZPOwner,, StartTrace, rotator(HitLocation - StartTrace));
	if (isWaterConductive && btg.Region.Zone.bWaterZone)
	{
		SpawnWaterEletricalFX(btg.Location);
		return;
	}
	
	bleg = Spawn(Class'BoltLightEffectGND', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	TraceSize = VSize(HitLocation - StartTrace);
	
	if (isWaterConductive)
	{
		wasInWater = bleg.Region.Zone.bWaterZone;
		while (bleg.Region.Zone.bWaterZone)
			bleg.Move((TraceSize/20) * Normal(StartTrace - HitLocation));
		
		if (wasInWater)
		{
			while (!bleg.Region.Zone.bWaterZone)
				bleg.Move((TraceSize/400) * Normal(HitLocation - StartTrace));
			TraceSize = VSize(bleg.Location - StartTrace);
			SpawnWaterEletricalFX(bleg.Location);
		}
	}
	
	btg.MakeTracing(TraceSize);
}

simulated function SpawnWaterEletricalFX(vector Loc)
{
local rotator R;
local byte i;
local BoltWaterShock bws;

	for (i = 0; i < 4; i++)
	{
		R.Yaw = Rand(32768) * 2;
		Spawn(Class'BoltWaterSparks', ZPOwner,, Loc, R);
	}
	
	bws = Spawn(Class'BoltWaterShock', ZPOwner,, Loc, rot(16384,0,0));
	bws.Kickback = Kickback;
	bws.Splasher = Splasher;
	bws.MoreDamage = MoreDamage;
	bws.HealthGiver = HealthGiver;
}

simulated function ProcessTraceHit(Actor Other, Vector HitLocation, Vector HitNormal, Vector X, Vector Y, Vector Z)
{
local byte j, Sparks;
local BoltLightEffectGND bleg;
local int tempKick;

	tempKick = KickBack;
	
	bleg = Spawn(Class'BoltLightEffectGND', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	if (bleg != None && bleg.Region.Zone.bWaterZone)
	{
		bleg.Destroy();
		bleg = None;
		return;
	}
	
	if (EMPSphere(Other) != None)
	{
		if (Role == ROLE_Authority)
		{
			if (!bInfinity && AmmoType != None)
				AmmoType.UseAmmo(ComboExtraAmmo);
			EMPSphere(Other).Instigator = Pawn(Owner);
			EMPSphere(Other).Combo();
		}
		return;
	}
	
	if (Other == Level)
	{
		Spawn(Class'BoltDecalFX', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
		Spawn(class'BoltSmokeGen', ZPOwner,, HitLocation + HitNormal);
	}
	else if (Other != Self && Other != Owner && Other != None) 
	{
		if (Other.bIsPawn && Role == ROLE_Authority)
		{
			Other.PlaySound(Sound'ChunkHit',, 16.0,,100);
			if (!isAllowedToKick(Pawn(Owner), Pawn(Other)))
				tempKick = 0;
		}
		else if (!Other.bIsPawn && !Other.IsA('Carcass'))
		{
			Spawn(class'NWZPUT_SmokePuff', ZPOwner,,HitLocation+HitNormal*9);
			Sparks = 3 + Rand(8);
			for (j = 0; j <= Sparks; j++) 
				Spawn(class'BoltSpark', ZPOwner,, HitLocation + 8 * HitNormal, rotator(HitNormal));
		}

		if (Role == ROLE_Authority)
		{
			if (isHeadShotDmg(Other, HitLocation))
			{
				if (giveFiredHealth(Other, HeadShotDmg))
					return;
				Other.TakeDamage(HeadShotDmg * GetDamageMult(), Pawn(Owner), HitLocation, 
					55000 * X + (MirrorVectorByNormal(HitNormal, HitNormal) * (tempKick * 1000 + 1)), 'Decapitated');
			}
			else
			{
				if (giveFiredHealth(Other, ElectricShotDmg))
					return;
				Other.TakeDamage(ElectricShotDmg * GetDamageMult(),  Pawn(Owner), HitLocation, 
					60000.0 * X + (MirrorVectorByNormal(HitNormal, HitNormal) * (tempKick * 1000 + 1)), MyDamageType);	
			}
			
			if (Other.bIsPawn || Carcass(Other) != None)
				Spawn(Class'BoltFlamesCarcasses',,, HitLocation);
		}
	}
}

simulated function TraceFire(float Accuracy)
{
local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
local actor Other;
local Pawn PawnOwner;

    PawnOwner = Pawn(Owner);
	bInstantHitWaterFX = !isWaterConductive;
	if (Role == ROLE_Authority && PlayerPawn(Owner) == None && Class'NWUtils'.static.isElegibleBotAI(PawnOwner) && ComboFocus != None)
	{
		Owner.MakeNoise(PawnOwner.SoundDampening);
		GetAxes(PawnOwner.ViewRotation,X,Y,Z);
		StartTrace = Owner.Location + CalcNewDrawOffset() + FireOffset.X * X + FireOffset.Y * Y + FireOffset.Z * Z;   
		EndTrace = StartTrace + 30000 * Normal(ComboFocus.Location - StartTrace);
		Other = PawnOwner.TraceShot(HitLocation,HitNormal,EndTrace,StartTrace);
		ProcessWaterFX(Other, HitLocation, StartTrace);
		ProcessTraceHit(Other, HitLocation, HitNormal, X,Y,Z);
		ProcessOther(Other, HitLocation, HitNormal, StartTrace);
		ComboFocus = None;
	}
	else
		Super.TraceFire(Accuracy);
}


function float RateSelf(out int bUseAltMode)
{
	local float EnemyDist, Rating;
	local bool bRetreating;
	local vector EnemyDir;
	local Pawn P;
	local byte i, min;
	local float minDist;

	P = Pawn(Owner);

	//No enemy, no need to fire
	if ( P.Enemy == None )
        	return AIRating;

	//Don't recommend self if out of ammo or if owner is inside water
	if ( AmmoType.AmmoAmount <=0 || (P.Region.Zone.bWaterZone && isWaterConductive))
        	return -2;
	
	if (P.Region.Zone.bWaterZone && !isWaterConductive)
	{
		bUseAltMode = 0;
		return (AIRating + FRand() * 0.05);
	}

	EnemyDir = P.Enemy.Location - Owner.Location; 
	EnemyDist = VSize(EnemyDir);

	//Don't recommend second mode if too close
	if (EnemyDist < 360*FMax(1.0, Splasher))
		bUseAltMode = 0;
	else
		bUseAltMode = int(FRand() + 0.5);

	//If enemy is on water, use this weapon on its full glory :D
	if (P.Enemy.Region.Zone.bWaterZone)
	{
		if (isWaterConductive)
			bUseAltMode = 0;
		else
			bUseAltMode = 1;
		
		return 3.0;
	}
	
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
		
		if (minDist <= 300*FMax(1.0, Splasher) && (vector(P.ViewRotation) Dot Normal(ComboPoint[min].Location - P.Location)) > 0.5)
		{
			ComboFocus = ComboPoint[min];
			bUseAltMode = 0;
			return 3.0;
		}
	}

	return AIRating;
}

state NormalFire
{
	function AnimEnd()
    {
		if (finishingFiringStatus == 0)
		{
			finishingFiringStatus = 1;
			TweenAnim('StillAlt', 0.5/GetFirerateMult()/2);
		}
		else if (finishingFiringStatus == 1)
		{
			finishingFiringStatus = 2;
			TweenAnim('Still', 0.5/GetFirerateMult()/2);
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
			TweenAnim('StillAlt', 0.5/GetFirerateMult()/2);
		}
		else if (finishingFiringStatus == 1)
		{
			finishingFiringStatus = 2;
			TweenAnim('Still', 0.5/GetFirerateMult()/2);
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
		if (finishingFiringStatus == 0)
		{
			finishingFiringStatus = 1;
			TweenAnim('StillAlt', 0.35/GetFirerateMult(True)/2);
		}
		else if (finishingFiringStatus == 1)
		{
			finishingFiringStatus = 2;
			TweenAnim('Still', 0.35/GetFirerateMult(True)/2);
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
		if (finishingFiringStatus == 0)
		{
			finishingFiringStatus = 1;
			TweenAnim('StillAlt', 0.35/GetFirerateMult(True)/2);
		}
		else if (finishingFiringStatus == 1)
		{
			finishingFiringStatus = 2;
			TweenAnim('Still', 0.35/GetFirerateMult(True)/2);
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


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
	if (ref == None)
		return;
	ref.Spawn(Class'BoltStormCrystal',,, HitLocation + HitNormal, rot(0,0,0));
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'BoltOversFXA';						break;
		case 1:	CFXClass = Class'BoltOversFXBCloud';				break;
		case 2:	CFXClass = Class'BoltOversFXBCloudB';				break;
		case 3:	CFXClass = Class'BoltOversFXBCloudElectric';		break;
		case 4:	CFXClass = Class'BoltOversFXC';						break;
		case 5:	CFXClass = Class'BoltOversFXCb';					break;
		case 6:	CFXClass = Class'BoltOversFXCc';					break;
		case 7:	CFXClass = Class'BoltOversFXCd';					break;
		case 8:	CFXClass = Class'BoltOversFXD';						break;
	}
	return (i <= 8);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltRiflePick
	CollisionHeight=10.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=4
	Icon=BoltIcon
	InventoryGroup=4
	ItemArticle="a"
	ItemName="Bolt Rifle"
	MaxDesireability=0.400000
	PickupMessage="You got the Bolt Rifle."
	PickupSound=BoltRPickup
	PickupViewMesh=BoltRiflePick
	PickupViewScale=1.000000
	PlayerViewMesh=BoltRifleR
	PlayerViewOffset=(X=10.50000,Y=-4.200000,Z=-4.000000)
	WidePlayerViewOffset=(X=10.50000,Y=-4.200000,Z=-4.000000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=BoltIcon
	ThirdPersonMesh=BoltRifleM
	ThirdPersonScale=0.750000
	AltDamageType=Electrified
	AltFireSound=BoltRAltFire
	AltProjectileClass=Class'EMPSphere'
	AmmoName=Class'BoltAmmo'
	bInstantHit=True
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was electrified by %k's %w."
	ElectricShotDmg=40
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=BoltRFire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Electrified
	NameColor=(R=0,G=192,B=255)
	PickupAmmoCount=20
	ProjectileClass=None
	SelectSound=BoltRSelect
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.750000
	bAltWarnTarget=True
	bRecommendAltSplashDamage=True
	bRecommendSplashDamage=False
	bSplashDamage=True
	bWarnTarget=False
	RefireRate=0.600000
	AltRefireRate=1.000000
	Mass=50.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=BoltCross
	CustomCrossAlpha=BoltCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Electrical rifle of high voltage and precision.\n\nPrimary Fire: Very brief yet extremely powerful controlled lightning.\n\nSecondary Fire: Generation of plasmoid electromagnetic pulse spheres."
	
	LightBrightness=100
	LightHue=168
	LightSaturation=68
	LightRadius=4
	LightType=LT_Steady
	
	MultiSkins(5)=AmmoCoreFX
	MultiSkins(6)=WireFX
	Texture=GlassCryst
	
	PlayerViewMeshLeft=BoltRifle
	PlayerViewMeshRight=BoltRifleR
	HandPartMeshL(0)=BoltHandL
	HandPartMeshR(0)=BoltHandR
	BobDamping=1.075000
	
	RenderOffsetSelect=(Y=-1.000000,Z=-2.000000)
	AnimMaxFrame=0.857129
	RenderOffsetFire=(X=-1.500000)
	AnimMaxFrameFire=0.857143
	RenderOffsetAltFire=(X=-2.250000)
	AnimMaxFrameAltFire=0.937500
	
	FireOffsetZAdjustHidden=-6.000000
	AltFireOffsetZAdjustHidden=-1.000000
	
	FirstPersonOverFX(0)=(bLit=True,OverMainTex=Texture'GlassCryst',OverTex1=Texture'Ov_BoltR_01')
	FirstPersonOverFX(0)=(OverTex2=Texture'Ov_BoltR_02',OverTex3=Texture'Ov_BoltR_03',OverTex4=Texture'Ov_BoltAmmo')
	FirstPersonOverFX(0)=(OverTex5=Texture'AmmoCoreFX',OverTex6=Texture'WireFX')
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	
	FirstPersonOverFX(1)=(bLit=True,OverTex1=FrontEnergyFX)
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=2.000000,bCustomMesh=True)
	FirstPersonOverFX(1)=(CustomMeshLeft=Mesh'BoltFrontOvL',CustomMesh=Mesh'BoltFrontOvR')
	
	PickupOverFX(0)=(bLit=True,OverMainTex=Texture'GlassCryst',OverTex1=Texture'Ov_BoltR_01')
	PickupOverFX(0)=(OverTex2=Texture'Ov_BoltR_02',OverTex3=Texture'Ov_BoltR_03',OverTex4=Texture'Ov_BoltAmmo')
	PickupOverFX(0)=(OverTex5=Texture'AmmoCoreFX',OverTex6=Texture'WireFX')
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	
	PickupOverFX(1)=(bLit=True,OverTex1=FrontEnergyFX)
	PickupOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=2.000000,bCustomMesh=True)
	PickupOverFX(1)=(CustomMesh=Mesh'BoltFrontOvPick')
	
	
	FirstPersonGlowFX(0)=(bLit=True,GlowModel=Mesh'BoltLLightsR',GlowModelLeft=Mesh'BoltLLightsL')
	FirstPersonGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.010000)
	FirstPersonGlowFX(0)=(GlowTex1=Texture'BoltLittleLight')
	
	FirstPersonGlowFX(1)=(bLit=True,bRandFrame=True,GlowModel=Mesh'BoltFrontLhtR',GlowModelLeft=Mesh'BoltFrontLhtL')
	FirstPersonGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.048000)
	FirstPersonGlowFX(1)=(GlowTex3=Texture'BoltFrontLight')
	
	PickupGlowFX(0)=(bLit=True,GlowModel=Mesh'BoltLLightsPick')
	PickupGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.041670)
	PickupGlowFX(0)=(GlowTex1=Texture'BoltLittleLight',GlowSetClass=Class'BoltOverPickupFX')
	
	PickupGlowFX(1)=(bLit=True,bRandFrame=True,GlowModel=Mesh'BoltFrontLhtPick')
	PickupGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.200000)
	PickupGlowFX(1)=(GlowTex3=Texture'BoltFrontLight',GlowSetClass=Class'BoltOverPickupFX')
	
	MinCoronaHiddenRenderDist=64.000000
	
	BaseGlow=1.000000
	BaseScale=1.000000
	
	isZPWeapon=True
	bFireHitScan=True
	AccuracyPattern(0)=0.100000
	ZPMaxFirerate=3.000000
	
	bInstantHitWaterFX=False
	bBallisticWaterFX=False
	WaterSplashType=1
	
	
	bWaterConductive=True
	HeadShotDmg=350
	ComboExtraAmmo=0
	ComboDamage=180
	WaterElectrocutionRadius=420.000000
	WaterElectrocutionDamage=800
	
	bFirstPersonShotFX=True
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=0,G=255,B=255)
	OversurrectorFXColors(0)=(R=0,G=16,B=255)
	OversurrectorFXColors(1)=(R=0,G=64,B=255)
	OversurrectorFXColors(2)=(R=0,G=32,B=128)
	OversurrectorFXColors(3)=(R=0,G=32,B=255)
	OversurrectorFXColors(4)=(R=0,G=48,B=255)
	OversurrectorFXColors(5)=(R=0,G=64,B=255)
	OversurrectorFXColors(6)=(R=0,G=128,B=255)
	OversurrectorFXColors(7)=(R=0,G=255,B=255)
	OversurrectorFXColors(8)=(R=0,G=255,B=255)
	OversurrectorFXColors(9)=(R=0,G=48,B=255)
	OversurrectorFXColors(10)=(R=0,G=48,B=255)
	OversurrectorFXColors(11)=(R=0,G=96,B=192)
	OversurrectorFXColors(12)=(R=0,G=16,B=64)
	OversurrectorFXColors(13)=(R=0,G=0,B=255)
	OversurrectorFXColors(14)=(R=0,G=8,B=255)
	OversurrectorFXColors(15)=(R=0,G=16,B=255)
	OversurrectorFXColors(16)=(R=0,G=32,B=255)
	OversurrectorFXColors(17)=(R=0,G=64,B=255)
	OversurrectorFXColors(18)=(R=0,G=64,B=255)
	OversurrectorFXColors(19)=(R=0,G=16,B=128)
	OversurrectorFXColors(20)=(R=0,G=0,B=255)
	OversurrectorFXColors(21)=(R=0,G=255,B=255)
	OversurrectorFXColors(22)=(R=0,G=96,B=255)
	OversurrectorFXColors(23)=(R=0,G=48,B=255)
	
	OversurrectorLightHue(0)=148
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=128
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=148
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'BoltOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=30.000000
	OversurrectiveHLRate=1.000000
	OversurrectiveHLOdds=0.650000
	OversurrectiveCloudHLOdds=0.400000
	OversurrectiveDryHLOdds=0.100000
	OversurrectiveEnemyHLOdds=0.350000
	OversurrectiveMaxHL=9
	OversurrectiveHLMaxDist=10000.000000
	OversurrectiveHLDirectDmg=5000
	OversurrectiveHLSplashDmg=1000
	OversurrectiveHLDmgRadius=750.000000
}
