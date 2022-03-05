//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher weapon
//				Feralidragon (01-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissile expands NaliWeapons config(NWeaponsCfg);


//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=MultiMissile ANIVFILE=MODELS\MultiMissile_a.3d DATAFILE=MODELS\MultiMissile_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMissile STRENGTH=0
#exec MESH ORIGIN MESH=MultiMissile X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=MultiMissileR ANIVFILE=MODELS\MultiMissile_a.3d DATAFILE=MODELS\MultiMissile_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=MultiMissileR STRENGTH=0
#exec MESH ORIGIN MESH=MultiMissileR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=MultiMissilePick ANIVFILE=MODELS\MultiMissile_a.3d DATAFILE=MODELS\MultiMissile_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=MultiMissilePick STRENGTH=0
#exec MESH ORIGIN MESH=MultiMissilePick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=MultiMissileM ANIVFILE=MODELS\MultiMissile_a.3d DATAFILE=MODELS\MultiMissile_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMissileM STRENGTH=0.45
#exec MESH ORIGIN MESH=MultiMissileM X=320 Y=0 Z=-30 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=MultiMissile SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MultiMissile SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissile SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MultiMissile SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MultiMissile SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MultiMissile SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MultiMissileR SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MultiMissileR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissileR SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MultiMissileR SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MultiMissileR SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MultiMissileR SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MultiMissilePick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=MultiMissileM SEQ=All STARTFRAME=19 NUMFRAMES=5
#exec MESH SEQUENCE MESH=MultiMissileM SEQ=Still STARTFRAME=19 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissileM SEQ=Fire STARTFRAME=19 NUMFRAMES=5 RATE=4.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=MultiMissile MESH=MultiMissile
#exec MESHMAP SCALE MESHMAP=MultiMissile X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MultiMissileR MESH=MultiMissileR
#exec MESHMAP SCALE MESHMAP=MultiMissileR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MultiMissilePick MESH=MultiMissilePick
#exec MESHMAP SCALE MESHMAP=MultiMissilePick X=0.125 Y=0.125 Z=0.25

#exec MESHMAP NEW MESHMAP=MultiMissileM MESH=MultiMissileM
#exec MESHMAP SCALE MESHMAP=MultiMissileM X=0.1 Y=0.1 Z=0.2

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_MultiML_01 FILE=SKINS\Sk_MultiML_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissile NUM=1 TEXTURE=Sk_MultiML_01
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileR NUM=1 TEXTURE=Sk_MultiML_01
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissilePick NUM=1 TEXTURE=Sk_MultiML_01
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileM NUM=1 TEXTURE=Sk_MultiML_01

#exec TEXTURE IMPORT NAME=Sk_MultiML_02 FILE=SKINS\Sk_MultiML_02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissile NUM=2 TEXTURE=Sk_MultiML_02
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileR NUM=2 TEXTURE=Sk_MultiML_02
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissilePick NUM=2 TEXTURE=Sk_MultiML_02
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileM NUM=2 TEXTURE=Sk_MultiML_02

#exec TEXTURE IMPORT NAME=Sk_MultiML_03 FILE=SKINS\Sk_MultiML_03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissile NUM=3 TEXTURE=Sk_MultiML_03
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileR NUM=3 TEXTURE=Sk_MultiML_03
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissilePick NUM=3 TEXTURE=Sk_MultiML_03
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileM NUM=3 TEXTURE=Sk_MultiML_03

#exec TEXTURE IMPORT NAME=ShinyMetal01 FILE=SKINS\ShinyMetal01.bmp GROUP=Skins LODSET=2

//-----------------------------------------------------------------------------------

//Screens
#exec TEXTURE IMPORT NAME=MMScreenR FILE=SCREENS\MMScreenR.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MMScreenA FILE=SCREENS\MMScreenA.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MMScreenH FILE=SCREENS\MMScreenH.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MMScreenT FILE=SCREENS\MMScreenT.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MMScreenX FILE=SCREENS\MMScreenX.bmp GROUP=Screens LODSET=0 MIPS=OFF

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=MMLIcon FILE=ICONS\MMLIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=MMissileMainCrossAlpha FILE=ICONS\MMissileMainCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=RedTex FILE=ICONS\RedTex.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\MMissileIcons.utx PACKAGE=NWMultiMissileVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="MultiML_Select" FILE=SOUNDS\MultiML_Select.wav GROUP="MultiML"
#exec AUDIO IMPORT NAME="MultiML_Fire" FILE=SOUNDS\MultiML_Fire.wav GROUP="MultiML"
#exec AUDIO IMPORT NAME="MultiML_Pickup" FILE=SOUNDS\MultiML_Pickup.wav GROUP="MultiML"
#exec AUDIO IMPORT NAME="MultiML_AltFire" FILE=SOUNDS\MultiML_AltFire.wav GROUP="MultiML"
#exec AUDIO IMPORT NAME="MultiML_TargetOn" FILE=SOUNDS\MultiML_TargetOn.wav GROUP="MultiML"
#exec AUDIO IMPORT NAME="MultiML_TargetOff" FILE=SOUNDS\MultiML_TargetOff.wav GROUP="MultiML"
#exec AUDIO IMPORT NAME="SeekingLockAmb" FILE=SOUNDS\SeekingLockAmb.wav GROUP="MultiML"


//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=MMHandL ANIVFILE=MODELS\MMHand_a.3d DATAFILE=MODELS\MMHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MMHandL STRENGTH=0
#exec MESH ORIGIN MESH=MMHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=MMHandR ANIVFILE=MODELS\MMHand_a.3d DATAFILE=MODELS\MMHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=MMHandR STRENGTH=0
#exec MESH ORIGIN MESH=MMHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=MMHandL SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MMHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMHandL SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MMHandL SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMHandL SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MMHandL SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MMHandR SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MMHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMHandR SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MMHandR SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMHandR SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MMHandR SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

//Scale
#exec MESHMAP NEW MESHMAP=MMHandL MESH=MMHandL
#exec MESHMAP SCALE MESHMAP=MMHandL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MMHandR MESH=MMHandR
#exec MESHMAP SCALE MESHMAP=MMHandR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=MMHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=MMHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//CORONA LIGHTS
//*******************************************************

//First person Lights
#exec MESH IMPORT MESH=MMLightsLL ANIVFILE=MODELS\MMLightsL_a.3d DATAFILE=MODELS\MMLightsL_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=MMLightsLL STRENGTH=0
#exec MESH ORIGIN MESH=MMLightsLL X=0 Y=0 Z=-0.5 YAW=128

#exec MESH IMPORT MESH=MMLightsLR ANIVFILE=MODELS\MMLightsL_a.3d DATAFILE=MODELS\MMLightsL_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
//#exec MESH LODPARAMS MESH=MMLightsLR STRENGTH=0
#exec MESH ORIGIN MESH=MMLightsLR X=0 Y=0 Z=-0.5

#exec MESH IMPORT MESH=MMLightsRL ANIVFILE=MODELS\MMLightsR_a.3d DATAFILE=MODELS\MMLightsR_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=MMLightsRL STRENGTH=0
#exec MESH ORIGIN MESH=MMLightsRL X=0 Y=0 Z=-0.5 YAW=128

#exec MESH IMPORT MESH=MMLightsRR ANIVFILE=MODELS\MMLightsR_a.3d DATAFILE=MODELS\MMLightsR_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
//#exec MESH LODPARAMS MESH=MMLightsRR STRENGTH=0
#exec MESH ORIGIN MESH=MMLightsRR X=0 Y=0 Z=-0.5

//Pickup Lights
#exec MESH IMPORT MESH=MMLightsLPick ANIVFILE=MODELS\MMLightsL_a.3d DATAFILE=MODELS\MMLightsL_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=MMLightsLPick STRENGTH=0
#exec MESH ORIGIN MESH=MMLightsLPick X=0 Y=0 Z=-0.5 Yaw=128

#exec MESH IMPORT MESH=MMLightsRPick ANIVFILE=MODELS\MMLightsR_a.3d DATAFILE=MODELS\MMLightsR_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=MMLightsRPick STRENGTH=0
#exec MESH ORIGIN MESH=MMLightsRPick X=0 Y=0 Z=-0.5 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=MMLightsLL SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MMLightsLL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMLightsLL SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MMLightsLL SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMLightsLL SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MMLightsLL SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MMLightsLR SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MMLightsLR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMLightsLR SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MMLightsLR SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMLightsLR SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MMLightsLR SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MMLightsRL SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MMLightsRL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMLightsRL SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MMLightsRL SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMLightsRL SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MMLightsRL SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MMLightsRR SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MMLightsRR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMLightsRR SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MMLightsRR SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMLightsRR SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MMLightsRR SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MMLightsLPick SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMLightsRPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=MMLightsLL MESH=MMLightsLL
#exec MESHMAP SCALE MESHMAP=MMLightsLL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MMLightsLR MESH=MMLightsLR
#exec MESHMAP SCALE MESHMAP=MMLightsLR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MMLightsRL MESH=MMLightsRL
#exec MESHMAP SCALE MESHMAP=MMLightsRL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MMLightsRR MESH=MMLightsRR
#exec MESHMAP SCALE MESHMAP=MMLightsRR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MMLightsLPick MESH=MMLightsLPick
#exec MESHMAP SCALE MESHMAP=MMLightsLPick X=0.125 Y=0.125 Z=0.25

#exec MESHMAP NEW MESHMAP=MMLightsRPick MESH=MMLightsRPick
#exec MESHMAP SCALE MESHMAP=MMLightsRPick X=0.125 Y=0.125 Z=0.25

//Coronas
#exec TEXTURE IMPORT NAME=MMRedLight FILE=Coronas\MMRedLight.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=MMYellowLight FILE=Coronas\MMYellowLight.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=MMBlueLight FILE=Coronas\MMBlueLight.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=MMGreenLight FILE=Coronas\MMGreenLight.bmp GROUP=Coronas FLAGS=2

//===========================================================================

//OVERLAYER MESHES
//*******************************************************
#exec MESH IMPORT MESH=MMScreenStaticFL ANIVFILE=MODELS\MMScreenStatic_a.3d DATAFILE=MODELS\MMScreenStatic_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=MMScreenStaticFL STRENGTH=0
#exec MESH ORIGIN MESH=MMScreenStaticFL X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=MMScreenStaticFR ANIVFILE=MODELS\MMScreenStatic_a.3d DATAFILE=MODELS\MMScreenStatic_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=1
//#exec MESH LODPARAMS MESH=MMScreenStaticFR STRENGTH=0
#exec MESH ORIGIN MESH=MMScreenStaticFR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=MMScreenStaticP ANIVFILE=MODELS\MMScreenStatic_a.3d DATAFILE=MODELS\MMScreenStatic_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=MMScreenStaticP STRENGTH=0
#exec MESH ORIGIN MESH=MMScreenStaticP X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=MMScreenStaticFL SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MMScreenStaticFL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMScreenStaticFL SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MMScreenStaticFL SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMScreenStaticFL SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MMScreenStaticFL SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MMScreenStaticFR SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=MMScreenStaticFR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MMScreenStaticFR SEQ=Fire STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MMScreenStaticFR SEQ=AltFire STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MMScreenStaticFR SEQ=Select STARTFRAME=15 NUMFRAMES=5 RATE=6.5 GROUP=Select
#exec MESH SEQUENCE MESH=MMScreenStaticFR SEQ=Down STARTFRAME=11 NUMFRAMES=5 RATE=13.0

#exec MESH SEQUENCE MESH=MMScreenStaticP SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=MMScreenStaticFL MESH=MMScreenStaticFL
#exec MESHMAP SCALE MESHMAP=MMScreenStaticFL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MMScreenStaticFR MESH=MMScreenStaticFR
#exec MESHMAP SCALE MESHMAP=MMScreenStaticFR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MMScreenStaticP MESH=MMScreenStaticP
#exec MESHMAP SCALE MESHMAP=MMScreenStaticP X=0.125 Y=0.125 Z=0.25


#exec OBJ LOAD FILE=Textures\Static.utx PACKAGE=NWMultiMissileVIII_SRC.StaticScreen

//===========================================================================


var() texture ScreenMissile[5];
var() class<MMissile> MissileProj[5];
var() int AmmoUsage[5];
var byte SelectedM;
var float globalDelta;
var float Count, CountC;

var actor LTarget, OldLTarget;
var actor LocPoint;
var bool bLocked;
var float LockCount;

var actor LTrace, LDot, TgOverlay, TgOvLock;
var actor LDotTrail[7];
var vector LDotTrailLoc[7];
var float DotCount;
var() texture LockingLine;
var() texture LockingGrid[32];
var() sound LockingSound;

var(ServerConfig) config name ThermicLockable[32];
var(ServerConfig) config bool bUseAmmoT, bUseAmmoX;
var(ServerConfig) config bool enableA, enableH, enableT, enableX;
var(ServerConfig) config bool canPlayerHoldLock;
var(ServerConfig) config int XMissileBaseDamage;
var(ServerConfig) config float LockingRate;
var(ServerConfig) config float LockingStayTime;
var bool bAmmoT, bAmmoX;
var bool enA, enH, enT, enX;
var int maxThermicLockableClasses;
var float lockR;

var float CountM;
var texture CurrentMissileScreen;

//Blinking on locking
var float CountFX1;
var bool bFXDown;
var bool bLockHold;


//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime;
var(Oversurrection) config float OversurrectionTurretRotRate, OversurrectionFireCycleRate;
var(Oversurrection) config float OversurrectionReloadPauseTime, OversurrectionReloadTime;
var(Oversurrection) config float OversurrectionScanEnemiesRadius, OversurrectionRangedEnemiesPeriph, OversurrectionAttackMinPeriph;
var(Oversurrection) config float OversurrectionHexaAtkOdds, OversurrectionQuadAtkOdds, OversurrectionDualAtkOdds;
var(Oversurrection) config int OversurrectionMissileDamage;
var(Oversurrection) config float OversurrectionMissileDamageRadius;


replication
{
	reliable if (ROLE == Role_Authority && bNetOwner)
		SelectedM, bLocked;

	reliable if (ROLE == Role_Authority)
		CurrentMissileScreen, LTarget, OldLTarget, LocPoint, bAmmoT, bAmmoX, enA, enH, enT, enX, bLockHold, lockR;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();

	CurrentMissileScreen = ScreenMissile[0];
	MultiSkins[4] = CurrentMissileScreen;
	bAmmoT = default.bUseAmmoT;
	bAmmoX = default.bUseAmmoX;
	enA = default.enableA;
	enH = default.enableH;
	enT = default.enableT;
	enX = default.enableX;
	bLockHold = default.canPlayerHoldLock;
	lockR = default.LockingRate;
	
	LocPoint = Spawn(Class'MLocPoint', Self);
	LoadLists();
}

function LoadLists()
{
local int i;

	maxThermicLockableClasses = ArrayCount(ThermicLockable);
	if (default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(ThermicLockable); i++)
		{
			if (ThermicLockable[i] == '')
			{
				maxThermicLockableClasses = i;
				break;
			}
		}
	}
}

simulated function PostPostRenderOther( canvas Canvas, float Scale)
{
local float posX, posY;
local PlayerPawn P;
local byte i;
local texture curGridTex;

	P = PlayerPawn(Owner);
	if (P == None)
		return;
	
	Canvas.bNoSmooth = False;
	if (LockCount > 0.0)
	{
		bNoRenderCross = True;
		if (!class'NaliWeapons'.default.bOpaqueCrosshair || bForceTranslucentCrossHair)
			Canvas.Style = ERenderStyle.STY_Translucent;

		if (LockCount < 1.0)
		{
			if (AmbientSound == None)
				AmbientSound = LockingSound;
			Canvas.DrawColor = GetCrosshairColor(P);
		}
		else
		{
			Canvas.DrawColor.R = 255;
			Canvas.DrawColor.B = 0;
			Canvas.DrawColor.G = 0;
			AmbientSound = None;
		}
		
		if (bOwnsCrossHair && CustomCross != None)
		{
			GetCrosshairCoords(posX, posY, Canvas, CustomCross, Scale * CrossHairScale);
			Canvas.SetPos(posX, posY);
			Canvas.DrawIcon(CustomCross, Scale * CrossHairScale);
		}
		
		GetCrosshairCoords(posX, posY, Canvas, Texture'MMissileLockedCross', Scale * CrossHairScale * (6 - 5*FMin(LockCount, 1.0)));
		Canvas.SetPos(posX, posY);
		Canvas.DrawColor.R = Byte(LockCount * Canvas.DrawColor.R);
		Canvas.DrawColor.B = Byte(LockCount * Canvas.DrawColor.B);
		Canvas.DrawColor.G = Byte(LockCount * Canvas.DrawColor.G);
		Canvas.DrawIcon(Texture'MMissileLockedCross', Scale * CrossHairScale * (6 - 5*FMin(LockCount, 1.0)));
		
		if (OldLTarget != None)
		{
			if (TgOverlay == None)
				TgOverlay = Spawn(Class'LockingOv',,, OldLTarget.Location, OldLTarget.Rotation);
			else
			{
				curGridTex = LockingGrid[Min(Byte(31 * LockCount), ArrayCount(LockingGrid)-1)];
				TgOverlay.Mesh = OldLTarget.Mesh;
				for (i = 0; i < ArrayCount(MultiSkins); i++)
					TgOverlay.MultiSkins[i] = curGridTex;
				
				TgOverlay.Texture = curGridTex;
				TgOverlay.DrawScale = OldLTarget.DrawScale;
				TgOverlay.Fatness = OldLTarget.Fatness;
				TgOverlay.AnimSequence = OldLTarget.AnimSequence;
				TgOverlay.AnimFrame = OldLTarget.AnimFrame;
				TgOverlay.SetLocation(OldLTarget.Location);
				TgOverlay.SetRotation(OldLTarget.Rotation);
				
				Canvas.DrawActor(TgOverlay, False, True);
			}
		}
	}
	else
	{
		bNoRenderCross = False;
		AmbientSound = None;
	}
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
local vector laserOffset;
local vector HitLocation, HitNormal, EndTrace, StartTrace;
local actor A;
local byte i;

	laserOffset.Z = -1;
	laserOffset.X = -2;
	
	if ((!IsAnimating() || AnimSequence == 'Still') && SelectedM > 0)
	{
		if (LTrace == None)
			LTrace = Spawn(Class'LaserTrace',,, Loc + (laserOffset >> Rot), Rot);
		else
		{
			if (SelectedM == 1 && LTrace.MultiSkins[1] != Texture'LaserTraceBlue01')
				LTrace.MultiSkins[1] = Texture'LaserTraceBlue01';
			else if (SelectedM > 1 && LTrace.MultiSkins[1] != Texture'LaserTraceRed01')
				LTrace.MultiSkins[1] = Texture'LaserTraceRed01';
				
			LTrace.SetLocation(Loc + (laserOffset >> Rot));
			LTrace.SetRotation(Rot);
			
			StartTrace = LTrace.Location;
			EndTrace = StartTrace + vector(Rot) * 30000;
			
			Canvas.DrawActor(LTrace, False, False);
			
			A = Trace( HitLocation, HitNormal, EndTrace, StartTrace, True);
			
			if (LDot == None)
				LDot = Spawn(Class'LaserDot',,, Loc);
			else if (A != None)
			{
				if (SelectedM == 1 && LDot.Texture != Texture'LaserDotBlue01')
					LDot.Texture = Texture'LaserDotBlue01';
				else if (SelectedM > 1 && LDot.Texture != Texture'LaserDotRed01')
					LDot.Texture = Texture'LaserDotRed01';
				
				if (A == Level)
					LDot.SetLocation(HitLocation + HitNormal);
				else
					LDot.SetLocation(HitLocation);
				
				Canvas.DrawActor(LDot, False, False);
			}
			
			for (i = 0; i < ArrayCount(LDotTrail); i++)
			{
				if (LDotTrail[i] == None && A != None)
					LDotTrail[i] = Spawn(Class'LaserDot',,, A.Location);
				else if (A != None)
				{
					if (SelectedM == 1 && LDotTrail[i].Texture != Texture'LaserDotBlue01')
						LDotTrail[i].Texture = Texture'LaserDotBlue01';
					else if (SelectedM > 1 && LDotTrail[i].Texture != Texture'LaserDotRed01')
						LDotTrail[i].Texture = Texture'LaserDotRed01';
					
					if (DotCount >= 0.005)
					{
						DotCount = 0;
						
						if (i == (ArrayCount(LDotTrail) - 1))
							LDotTrail[i].SetLocation(LDot.Location);
						else
							LDotTrail[i].SetLocation(LDotTrail[i+1].Location);
					}
					else
						DotCount += globalDelta;
					
					LDotTrail[i].DrawScale = LDot.DrawScale * FRand() * 1.5;
					
					Canvas.DrawActor(LDotTrail[i], False, False);
				}
			}
		}
	}
	
	//Screen flickering and update
	if (FirstOverFXActor[0] != None)
	{
		FirstOverFXActor[0].Multiskins[1] = CurrentMissileScreen;
		FirstOverFXActor[0].ScaleGlow = 0.75 + FRand() * 0.75 ;
	}
	
	//Screen transition fx
	if (FirstOverFXActor[1] != None)
	{
		if (FirstOverFXActor[1].ScaleGlow > 0.275)
			FirstOverFXActor[1].ScaleGlow -= globalDelta;
		else if (FirstOverFXActor[1].ScaleGlow < 0.275)
			FirstOverFXActor[1].ScaleGlow = 0.275;
	}
	
	//Locking tracing around target
	if (LockCount >= 1 && OldLTarget != None)
	{
		if (TgOvLock == None)
		{
			TgOvLock = Spawn(Class'LockingOv',,, OldLTarget.Location, OldLTarget.Rotation);
			TgOvLock.bMeshEnviroMap = True;
			TgOvLock.Texture = LockingLine;
			TgOvLock.Style = STY_Normal;
		}
		else
		{
			TgOvLock.Mesh = OldLTarget.Mesh;
				
			TgOvLock.DrawScale = OldLTarget.DrawScale;
			TgOvLock.Fatness = Min(OldLTarget.Fatness + 28, 255);
			TgOvLock.AnimSequence = OldLTarget.AnimSequence;
			TgOvLock.AnimFrame = OldLTarget.AnimFrame;
			TgOvLock.SetLocation(OldLTarget.Location + Normal(OldLTarget.Location - Location) * 3);
			TgOvLock.SetRotation(OldLTarget.Rotation);
				
			Canvas.DrawActor(TgOvLock, False, False);
		}
	}
}

simulated function Destroyed()
{
local byte i;

	if (LTrace != None)
		LTrace.Destroy();
	if (LDot != None)
		LDot.Destroy();
	if (TgOverlay != None)
		TgOverlay.Destroy();
	if (TgOvLock != None)
		TgOvLock.Destroy();
	if (LocPoint != None)
		LocPoint.Destroy();
		
	LTrace = None;
	LDot = None;
	TgOverlay = None;
	TgOvLock = None;
	LocPoint = None;
	
	for (i = 0; i < ArrayCount(LDotTrail); i++)
	{
		if (LDotTrail[i] != None)
			LDotTrail[i].Destroy();
		LDotTrail[i] = None;
	}
		
	Super.Destroyed();
}

simulated function byte getRenderOptionIndex()
{
	return SelectedM;
}

simulated function Tick(float Delta)
{
local byte i, j;

	globalDelta = Delta;
	
	Super.Tick(Delta);
	
	if (Pawn(Owner) == None || Pawn(Owner).Weapon != Self)
		return;
	
	if (Pawn(Owner) != None && AmmoType != None)
	{
		CountM += Delta;
		if (CountM >= 0.5)
		{
			checkMissile();
			CurrentMissileScreen = ScreenMissile[SelectedM];
			UpdateScreen();
			CountM = 0;
		}
	}
	
	if (AmmoType != None && Level.NetMode != NM_DedicatedServer)
	{
		for (i = 0; i < 2; i++)
		{
			if (PickGlowFXActor[i] != None)
			{
				for (j = 0; j < 5; j++)
				{
					if (j < 3)
					{
						if (AmmoType.AmmoAmount > AmmoUsage[j] || bInfinity)
							PickGlowFXActor[i].ChangeTex(j + 4, Texture'MMGreenLight');
						else if (AmmoType.AmmoAmount == AmmoUsage[j])
							PickGlowFXActor[i].ChangeTex(j + 4, Texture'MMYellowLight');
						else
							PickGlowFXActor[i].ChangeTex(j + 4, Texture'MMRedLight');
						
						if ((j == 1 && !enA) || (j == 2 && !enH))
							PickGlowFXActor[i].ChangeTex(j + 4, Texture'MMRedLight');
					}
					else
					{
						if (AmmoType.AmmoAmount > AmmoUsage[j] || bInfinity)
							PickGlowFXActor[i].ChangeTex(j - 1, Texture'MMGreenLight');
						else if (AmmoType.AmmoAmount == AmmoUsage[j])
							PickGlowFXActor[i].ChangeTex(j - 1, Texture'MMYellowLight');
						else
							PickGlowFXActor[i].ChangeTex(j - 1, Texture'MMRedLight');
						
						if ((j == 3 && !enT) || (j == 4 && !enX))
							PickGlowFXActor[i].ChangeTex(j - 1, Texture'MMRedLight');
					}
				}
			}
			
			if (FirstGlowFXActor[i] != None)
			{
				for (j = 0; j < 5; j++)
				{
					if (j < 3)
					{
						if (AmmoType.AmmoAmount > AmmoUsage[j] || bInfinity)
							FirstGlowFXActor[i].ChangeTex(j + 4, Texture'MMGreenLight');
						else if (AmmoType.AmmoAmount == AmmoUsage[j])
							FirstGlowFXActor[i].ChangeTex(j + 4, Texture'MMYellowLight');
						else
							FirstGlowFXActor[i].ChangeTex(j + 4, Texture'MMRedLight');
						
						if ((j == 1 && !enA) || (j == 2 && !enH))
							FirstGlowFXActor[i].ChangeTex(j + 4, Texture'MMRedLight');
					}
					else
					{
						if (AmmoType.AmmoAmount > AmmoUsage[j] || bInfinity)
							FirstGlowFXActor[i].ChangeTex(j - 1, Texture'MMGreenLight');
						else if (AmmoType.AmmoAmount == AmmoUsage[j])
							FirstGlowFXActor[i].ChangeTex(j - 1, Texture'MMYellowLight');
						else
							FirstGlowFXActor[i].ChangeTex(j - 1, Texture'MMRedLight');
						
						if ((j == 3 && !enT) || (j == 4 && !enX))
							FirstGlowFXActor[i].ChangeTex(j - 1, Texture'MMRedLight');
					}
				}
			}
		}
	}
	
	//Glowing locking lights
	if (SelectedM > 0 && Level.NetMode != NM_DedicatedServer)
		CountFX1 += Delta;
	
	if (((SelectedM == 1 && ((CountFX1 >= 0.9 && bFXDown) || (CountFX1 >= 0.1 && !bFXDown))) || 
	(SelectedM > 1 && CountFX1 >= 0.5 && LockCount < 1) || (SelectedM > 1 && LockCount == 1 && 
	((CountFX1 >= 0.9 && bFXDown) || (CountFX1 >= 0.1 && !bFXDown)))) && Level.NetMode != NM_DedicatedServer)
	{
		CountFX1 = 0;
		
		if (!bFXDown)
		{
			if (SelectedM == 1 || LockCount == 1)
			{
				for (i = 0; i < 2; i++)
				{
					if (PickGlowFXActor[i] != None)
						PickGlowFXActor[i].ChangeTex(1);
					
					if (FirstGlowFXActor[i] != None)
						FirstGlowFXActor[i].ChangeTex(1);
				}
			}
			else
			{
				if (PickGlowFXActor[0] != None)
					PickGlowFXActor[0].ChangeTex(1);
				if (PickGlowFXActor[1] != None)
					PickGlowFXActor[1].ChangeTex(1, Texture'MMRedLight');
				
				if (FirstGlowFXActor[0] != None)
					FirstGlowFXActor[0].ChangeTex(1);
				if (FirstGlowFXActor[1] != None)
					FirstGlowFXActor[1].ChangeTex(1, Texture'MMRedLight');
			}
		}
		else
		{
			if (SelectedM == 1)
			{
				for (i = 0; i < 2; i++)
				{
					if (PickGlowFXActor[i] != None)
						PickGlowFXActor[i].ChangeTex(1, Texture'MMBlueLight');
					
					if (FirstGlowFXActor[i] != None)
						FirstGlowFXActor[i].ChangeTex(1, Texture'MMBlueLight');
				}
			}
			else if (LockCount == 1)
			{
				for (i = 0; i < 2; i++)
				{
					if (PickGlowFXActor[i] != None)
						PickGlowFXActor[i].ChangeTex(1, Texture'MMRedLight');
					
					if (FirstGlowFXActor[i] != None)
						FirstGlowFXActor[i].ChangeTex(1, Texture'MMRedLight');
				}
			}
			else
			{
				if (PickGlowFXActor[1] != None)
					PickGlowFXActor[1].ChangeTex(1);
				if (PickGlowFXActor[0] != None)
					PickGlowFXActor[0].ChangeTex(1, Texture'MMRedLight');
				
				if (FirstGlowFXActor[1] != None)
					FirstGlowFXActor[1].ChangeTex(1);
				if (FirstGlowFXActor[0] != None)
					FirstGlowFXActor[0].ChangeTex(1, Texture'MMRedLight');
			}
		}
		
		bFXDown = !bFXDown;
	}
	
	GiveLock(Delta);
}


simulated function SetDefaultDisplay()
{
	Super.SetDefaultDisplay();
	MultiSkins[4] = CurrentMissileScreen;
}

simulated function bool isMissileScreenTexture(texture Tex, optional bool bTrueIfDefault, optional byte DefSkinN)
{
local byte i;
local texture DefTex;

	if (bTrueIfDefault)
	{
		if (DefSkinN < 8)
			DefTex = default.MultiSkins[DefSkinN];
		else
			DefTex = default.Texture;
			
		if (Tex == DefTex)
			return True;
	}
	
	for (i = 0; i < ArrayCount(ScreenMissile); i++)
	{
		if (Tex == ScreenMissile[i])
			return True;
	}
	
	return False;
}

simulated function UpdateScreen()
{
	if (isMissileScreenTexture(MultiSkins[4], True, 4))
		MultiSkins[4] = CurrentMissileScreen;
}

simulated function GiveLock(float Delta)
{
local byte i;
local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
local bool bEnemyToLock;


	if (SelectedM > 1 && OldLTarget != None && PlayerPawn(Owner) != None && bLockHold)
	{
		GetAxes(Pawn(Owner).ViewRotation,X,Y,Z);
		if (PlayerPawn(Owner).bAltFire != 0)
			PlayerPawn(Owner).ViewRotation = rotator((OldLTarget.Location - Pawn(Owner).Eyeheight * vect(0,0,1)) - PlayerPawn(Owner).Location);
	}
	
	if (Role == ROLE_Authority)
	{
		Count += Delta;
		if (SelectedM > 1 && bLocked)
		{
			CountC += Delta;
			if (!Class.static.isValidTarget(OldLTarget) || (CountC >= default.LockingStayTime && (LTarget == None || OldLTarget != LTarget)))
			{
				CancelLock();
				playSounds(2);
			}
		}

		if (Pawn(Owner) != None && Pawn(Owner).Weapon == Self && (SelectedM == 1 || !bLocked || CountC >= default.LockingStayTime) && Count >= 0.1)
		{
			Count = 0.0;
			GetAxes(Pawn(Owner).ViewRotation, X, Y, Z);
			StartTrace = Owner.Location + Pawn(Owner).Eyeheight * vect(0,0,1);
			EndTrace = StartTrace + (32000 * X);
			LTarget = Pawn(Owner).Trace(HitLocation, HitNormal, EndTrace, StartTrace, True);
			if (LTarget == None)
				HitLocation = EndTrace;
			if (SelectedM == 1 && LocPoint != None)
			{
				LocPoint.SetLocation(HitLocation + HitNormal);
				return;
			}

			if ((SelectedM == 2 || SelectedM == 4) && Pawn(LTarget) != None && (NaliWPawn(LTarget) == None || !NaliWPawn(LTarget).bMachine))
			{
				if (Pawn(LTarget) != None && !Class'NWUtils'.static.isFriend(Pawn(LTarget), Level, Instigator,, True, True) && 
				!Class'NWUtils'.static.isSameHorde(Pawn(LTarget), Instigator, Level))
					OldLTarget = LTarget;
			} 
			else if ((SelectedM == 3 || SelectedM == 4) && CheckLockableMechanism(LTarget) && !isFriendMechanism(LTarget))
				OldLTarget = LTarget;
		}
		
		if (SelectedM > 1 && OldLTarget != None && !bLocked)
		{
			bLocked = True;
			if (LTarget == OldLTarget)
				CountC = 0.0;
		}
	}
	
	countLock(Delta);
}

function CancelLock()
{
	OldLTarget = None;
	bLocked = False;
	CountC = 0.0;
	AmbientSound = None;
}

function DropFrom(vector StartLocation)
{
	CancelLock();
	Super.DropFrom(StartLocation);
}

simulated static function bool isValidTarget(Actor A)
{
	return (A != None && !A.bDeleteMe && (A.bCollideActors || A.bBlockActors || (MLocPoint(A) != None && MLocPoint(A).bOn)) && 
		(Pawn(A) == None || (Pawn(A).Health > 0 && !Pawn(A).bHidden)));
}

function bool isFriendMechanism(actor A)
{
	if (A == None)
		return False;
	if (Pawn(A) != None)
		return Class'NWUtils'.static.isFriend(Pawn(A), Level, Instigator,, true, false);
	if (A.Instigator != None)
		return Class'NWUtils'.static.isFriend(A.Instigator, Level, Instigator,, true, false);
	return False;
}

function bool CheckLockableMechanism(actor A)
{
local int i;

	if (A == None)
		return false;
	
	if (default.bInvertListsProcessing)
	{
		for (i = maxThermicLockableClasses-1; i >= 0; i--)
		{
			if (ThermicLockable[i] != '' && A.IsA(ThermicLockable[i]))
				return true;
		}
	}
	else
	{
		for (i = 0; i < maxThermicLockableClasses; i++)
		{
			if (ThermicLockable[i] != '' && A.IsA(ThermicLockable[i]))
				return true;
		}
	}
	return false;
}

simulated function countLock(float Delta)
{
	if (bLocked)
	{
		if (LockCount < 1.0)
			LockCount += (Delta * lockR);
		else if (LockCount > 1.0)
		{
			LockCount = 1.0;
			playSounds(1);
		}
	}
	else
		LockCount = 0.0;
}

simulated function playSounds(byte sndToPlay)
{
	if (sndToPlay == 1)
		PlayOwnedSound(Sound'MultiML_TargetOn', SLOT_None, Pawn(Owner).SoundDampening*3.0);
	else if (sndToPlay == 2)
		PlayOwnedSound(Sound'MultiML_TargetOff', SLOT_None, Pawn(Owner).SoundDampening*3.0);
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	AmbientSound = None;
}

function AltFire( float Value )
{
	if (OldLTarget == None || !bLockHold)
	{
		changeMissile();
        GotoState('AltFiring');
        bPointing = True;
        bCanClientFire = True;
        ClientAltFire(Value);
	}
}


simulated function ResetLockLights()
{
local byte i;

	for (i = 0; i < 2; i++)
	{
		if (PickGlowFXActor[i] != None)
			PickGlowFXActor[i].ChangeTex(1);
					
		if (FirstGlowFXActor[i] != None)
			FirstGlowFXActor[i].ChangeTex(1);
	}
}

function changeMissile()
{
local bool canUseA, canUseH, canUseT, canUseX;

	SelectedM++;
	CancelLock();
	
	canUseA = (AmmoUsage[1] <= AmmoType.AmmoAmount || bInfinity) && enA;
	canUseH = (AmmoUsage[2] <= AmmoType.AmmoAmount || bInfinity) && enH;
	canUseT = (AmmoUsage[3] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoT)) && enT;
	canUseX = (AmmoUsage[4] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoX)) && enX;

	if (SelectedM == 1 && !canUseA)
		SelectedM++;
	
	if (SelectedM == 2 && !canUseH)
		SelectedM++;
	
	if (SelectedM == 3 && !canUseT)
		SelectedM++;
	
	if (SelectedM > 4 || (SelectedM == 4 && !canUseX))
		SelectedM = 0;
}

function checkMissile()
{
local bool canUseA, canUseH, canUseT, canUseX;
local byte tempSelM;

	tempSelM = SelectedM;
	canUseA = (AmmoUsage[1] <= AmmoType.AmmoAmount || bInfinity) && enA;
	canUseH = (AmmoUsage[2] <= AmmoType.AmmoAmount || bInfinity) && enH;
	canUseT = (AmmoUsage[3] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoT)) && enT;
	canUseX = (AmmoUsage[4] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoX)) && enX;

	if (!bInfinity)
	{
		while (AmmoUsage[SelectedM] > AmmoType.AmmoAmount && SelectedM > 0)
			SelectedM--;
		
		if (SelectedM >= 4 && !canUseX)
			SelectedM = 3;
		
		if (SelectedM == 3 && !canUseT)
			SelectedM--;
		
		if (SelectedM == 2 && !canUseH)
			SelectedM--;
		
		if (SelectedM == 1 && !canUseA)
			SelectedM--;
	}
	else
	{
		while ((SelectedM == 1 && !canUseA) || (SelectedM == 2 && !canUseH) || (SelectedM == 3 && !canUseT) || (SelectedM == 4 && !canUseX))
			SelectedM--;
	}
	
	if (tempSelM != SelectedM && bLocked)
	{
		CancelLock();
		playSounds(2);
	}
}

function bool checkInfAmmoUsage()
{
	return (SelectedM < 3 || (SelectedM == 3 && !bAmmoT) || (SelectedM == 4 && !bAmmoX));
}

simulated function PlayAltFiring()
{
	if (OldLTarget == None || !bLockHold)
	{
		PlayAnim('AltFire', 4.0, 0.0);
		
		CurrentMissileScreen = ScreenMissile[SelectedM];
		UpdateScreen();
		ResetLockLights();
		if (FirstOverFXActor[1] != None)
			FirstOverFXActor[1].ScaleGlow = 1.0;

		PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*3.0);

		OldLTarget = None;
		bOwnsCrossHair = class'NaliWeapons'.default.bCustomCrosshair;
		CustomCross = Default.CustomCross;
	}
}

function Fire( float Value )
{
local MMissile MMpj;

    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));
	
	if ((bInfinity && checkInfAmmoUsage()) || AmmoType.UseAmmo(AmmoUsage[SelectedM]))
	{
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
        ClientFire(Value);

		MMpj = MMissile(ProjectileFire(MissileProj[SelectedM], ProjectileSpeed, bWarnTarget));
		
		if (SelectedM == 1)
			GiveGuidePoint(MMpj);
		else if (SelectedM > 1)
			GiveTarget(MMpj);
		
		checkMissile();
	}
	
	PlayFiring();
}

function GiveTarget(MMissile ProjT)
{
	if (OldLTarget != None && LockCount >= 1)
		ProjT.LTarget = OldLTarget;
}

function GiveGuidePoint( MMissile AMProj)
{
	AMProj.LTarget = LocPoint;
}

simulated function PlayFiring()
{
	PlayAnim('Fire', 1.2 * GetFirerateMult(), 0.0);
	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*8.0);
	CurrentMissileScreen = ScreenMissile[SelectedM];
	UpdateScreen();
}

simulated function PlaySelect()
{
	Super.PlaySelect();
	CancelLock();
}

simulated function TweenDown()
{
	Super.TweenDown();
	CancelLock();
}


function Finish()
{
    local Pawn PawnOwner;
    local bool bForce, bForceAlt;

    bForce = bForceFire;
    bForceAlt = bForceAltFire;
    bForceFire = false;
    bForceAltFire = false;

    if ( bChangeWeapon )
    {
        GotoState('DownWeapon');
        return;
    }

    PawnOwner = Pawn(Owner);
    if ( PawnOwner == None )
        return;
    if ( PlayerPawn(Owner) == None )
    {
        if ( (AmmoType != None) && (AmmoType.AmmoAmount<=0) )
        {
            PawnOwner.StopFiring();
            PawnOwner.SwitchToBestWeapon();
            if ( bChangeWeapon )
                GotoState('DownWeapon');
        }
        else if ( (PawnOwner.bFire != 0) && (FRand() < RefireRate) )
            Global.Fire(0);
        else if ( (PawnOwner.bAltFire != 0) && (FRand() < AltRefireRate) && (OldLTarget == None || !bLockHold))
            Global.AltFire(0);  
        else 
        {
            PawnOwner.StopFiring();
            GotoState('Idle');
        }
        return;
    }
    if ( ((AmmoType != None) && (AmmoType.AmmoAmount<=0)) || (PawnOwner.Weapon != self) )
        GotoState('Idle');
    else if ( (PawnOwner.bFire!=0) || bForce )
        Global.Fire(0);
    else if ( ((PawnOwner.bAltFire!=0) || bForceAlt) && (OldLTarget == None || !bLockHold))
        Global.AltFire(0);
    else 
        GotoState('Idle');
}


function float RateSelf( out int bUseAltMode )
{
	local float EnemyDist, Rating;
	local bool bRetreating;
	local vector EnemyDir;
	local Pawn P;

	P = Pawn(Owner);

	//No enemy, ready to fire
	if ( P.Enemy == None )
        	return AIRating;

	//Don't recommend self if out of ammo
	if ( AmmoType.AmmoAmount <=0 )
        	return -2;

	EnemyDir = P.Enemy.Location - Owner.Location; 
	EnemyDist = VSize(EnemyDir);
	
	//Choose missile
	if (!bInfinity && AmmoType.AmmoAmount < AmmoUsage[SelectedM])
		bUseAltMode = 1;
	else if (SelectedM == 4 && EnemyDist > 2500*FMax(1.0, Splasher))
		bUseAltMode = 0;
	else if ((SelectedM == 3 && EnemyDist > 700*FMax(1.0, Splasher)) || SelectedM == 2 || SelectedM == 1 || EnemyDist > 360)
		bUseAltMode = int(FRand() + 0.5);

	return (AIRating + FRand() * 0.05);
}

state ClientFiring
{
    simulated function AnimEnd()
    {
        if ( (Pawn(Owner) == None)
            || ((AmmoType != None) && (AmmoType.AmmoAmount <= 0)) )
        {
            PlayIdleAnim();
            GotoState('');
        }
        else if ( !bCanClientFire )
            GotoState('');
        else if ( Pawn(Owner).bFire != 0 )
            Global.ClientFire(0);
        else
        {
            PlayIdleAnim();
            GotoState('');
        }
    }
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local rotator R;
local float h;
local vector sLoc, HL, HN, E, S;
local Actor A;

	if (ref == None)
		return;
	R.Yaw = int((FRand()*2-1) * 32768);
	sLoc = HitLocation + HitNormal + Class'MultiMissileMegaBase'.static.getMegaBaseOffsetFromGround();
	h = Class'MultiMissileMegaBase'.static.getRadialNormalizedHeight(Class'MultiMissileMegaBase'.default.BaseRadiusMiddle, HitNormal.Z);
	sLoc += (FMin(h, Class'MultiMissileMegaBase'.default.BaseHeightMiddle) * vect(0,0,1));
	
	A = ref.Trace(HL, HN, sLoc, HitLocation + HitNormal, False);
	if (A != None)
		sLoc = HL + HN;
	ref.Spawn(Class'MultiMissileMegaBase',,, sLoc, R);
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'MultiMFXAFire';					break;
		case 1:	CFXClass = Class'MultiMFXBCloud';					break;
		case 2:	CFXClass = Class'MultiMFXBCloudB';					break;
		case 3:	CFXClass = Class'MultiMFXCCor';						break;
		case 4:	CFXClass = Class'MultiMFXCCorLine';					break;
		case 5:	CFXClass = Class'MultiMFXAFireb';					break;
		case 6:	CFXClass = Class'MultiMFXBCloudC';					break;
		case 7:	CFXClass = Class'MultiMFXBCloudBC';					break;
		case 8:	CFXClass = Class'MultiMFXCCorb';					break;
		case 9:	CFXClass = Class'MultiMFXCCorLineb';				break;
		case 10:CFXClass = Class'MultiMFXAFirec';					break;
		case 11:CFXClass = Class'MultiMFXBCloudD';					break;
		case 12:CFXClass = Class'MultiMFXBCloudBD';					break;
		case 13:CFXClass = Class'MultiMFXCCorc';					break;
		case 14:CFXClass = Class'MultiMFXCCorLinec';				break;
		case 15:CFXClass = Class'MultiMFXAFired';					break;
		case 16:CFXClass = Class'MultiMFXBCloudE';					break;
		case 17:CFXClass = Class'MultiMFXBCloudBE';					break;
		case 18:CFXClass = Class'MultiMFXCCord';					break;
		case 19:CFXClass = Class'MultiMFXCCorLined';				break;
	}
	return (i <= 19);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMissilePick
	CollisionHeight=17.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=9
	Icon=MMLIcon
	InventoryGroup=9
	ItemArticle="a"
	ItemName="MultiMissile Launcher"
	MaxDesireability=0.800000
	PickupMessage="You got the MultiMissile Launcher."
	PickupSound=MultiML_Pickup
	PickupViewMesh=MultiMissilePick
	PickupViewScale=1.000000
	PlayerViewMesh=MultiMissileR
	PlayerViewOffset=(X=13.00000,Y=-3.500000,Z=-3.500000)
	WidePlayerViewOffset=(X=13.00000,Y=-3.500000,Z=-3.500000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=MMLIcon
	ThirdPersonMesh=MultiMissileM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=MultiML_AltFire
	AltProjectileClass=None
	AmmoName=Class'MultiMAmmo'
	bInstantHit=False
	bRapidFire=False
	DeathMessage="%o was blown up to nothing by %k's %w."
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=MultiML_Fire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=MissileBlast
	NameColor=(R=0,G=255,B=0)
	PickupAmmoCount=10
	ProjectileClass=None
	SelectSound=MultiML_Select
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.900000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=True
	bSplashDamage=True
	bWarnTarget=True
	RefireRate=0.750000
	Mass=50.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=MMissileMainCross
	CustomCrossAlpha=MMissileMainCrossAlpha
	WeaponDescription="Classification: Adaptable and portable missile launcher.\n\nPrimary Fire: Launch of missiles.\n\nSecondary Fire: Selection of the missile kind the player wants to fire."
	CrossHairScale=0.500000
	MissileProj(0)=Class'RegMissile'
	MissileProj(1)=Class'AMissile'
	MissileProj(2)=Class'HMissile'
	MissileProj(3)=Class'TMissile'
	MissileProj(4)=Class'XMissile'
	AmmoUsage(0)=1
	AmmoUsage(1)=3
	AmmoUsage(2)=10
	AmmoUsage(3)=30
	AmmoUsage(4)=100
	ScreenMissile(0)=MMScreenR
	ScreenMissile(1)=MMScreenA
	ScreenMissile(2)=MMScreenH
	ScreenMissile(3)=MMScreenT
	ScreenMissile(4)=MMScreenX
	PlayerViewMeshLeft=MultiMissile
	PlayerViewMeshRight=MultiMissileR
	Texture=ShinyMetal01
	HandPartMeshL(0)=MMHandL
	HandPartMeshR(0)=MMHandR
	BobDamping=1.045000
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Rocket (1)",optionColor=(R=255,G=255,B=0))
	renderOptions(1)=(optionText="A-Missile (3)",optionColor=(R=0,G=255,B=255))
	renderOptions(2)=(optionText="H-Missile (10)",optionColor=(R=0,G=255,B=0))
	renderOptions(3)=(optionText="T-Missile (30)",optionColor=(R=255,G=0,B=0))
	renderOptions(4)=(optionText="X-Missile (100)",optionColor=(R=128,G=0,B=255))
	
	FirstPersonGlowFX(0)=(bLit=True,bRandFrame=True,GlowModel=Mesh'MMLightsLR',GlowModelLeft=Mesh'MMLightsLL')
	FirstPersonGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.006500)
	FirstPersonGlowFX(0)=(GlowTex2=Texture'MMRedLight')
	FirstPersonGlowFX(0)=(GlowTex3=Texture'MMRedLight',GlowTex4=Texture'MMGreenLight')
	FirstPersonGlowFX(0)=(GlowTex5=Texture'MMGreenLight',GlowTex6=Texture'MMYellowLight')
	
	FirstPersonGlowFX(1)=(bLit=True,bRandFrame=True,GlowModel=Mesh'MMLightsRR',GlowModelLeft=Mesh'MMLightsRL')
	FirstPersonGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.006500)
	FirstPersonGlowFX(1)=(GlowTex2=Texture'MMRedLight')
	FirstPersonGlowFX(1)=(GlowTex3=Texture'MMRedLight',GlowTex4=Texture'MMGreenLight')
	FirstPersonGlowFX(1)=(GlowTex5=Texture'MMGreenLight',GlowTex6=Texture'MMYellowLight')
	
	PickupGlowFX(0)=(bLit=True,bRandFrame=True,GlowModel=MMLightsLPick)
	PickupGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.026000)
	PickupGlowFX(0)=(GlowTex1=Texture'MMBlueLight',GlowTex2=Texture'MMRedLight')
	PickupGlowFX(0)=(GlowTex3=Texture'MMRedLight',GlowTex4=Texture'MMGreenLight')
	PickupGlowFX(0)=(GlowTex5=Texture'MMGreenLight',GlowTex6=Texture'MMYellowLight')
	
	PickupGlowFX(1)=(bLit=True,bRandFrame=True,GlowModel=MMLightsRPick)
	PickupGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.026000)
	PickupGlowFX(1)=(GlowTex1=Texture'MMBlueLight',GlowTex2=Texture'MMRedLight')
	PickupGlowFX(1)=(GlowTex3=Texture'MMRedLight',GlowTex4=Texture'MMGreenLight')
	PickupGlowFX(1)=(GlowTex5=Texture'MMGreenLight',GlowTex6=Texture'MMYellowLight')
	
	FirstPersonOverFX(0)=(bLit=True)
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.50000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'MMScreenStaticFL',CustomMesh=Mesh'MMScreenStaticFR')
	
	FirstPersonOverFX(1)=(bLit=True,OverTex1=StaticA0)
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=0.275000,bCustomMesh=True)
	FirstPersonOverFX(1)=(CustomMeshLeft=Mesh'MMScreenStaticFL',CustomMesh=Mesh'MMScreenStaticFR')
	
	PickupOverFX(0)=(bLit=True,OverTex1=StaticA0)
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=0.275000,bCustomMesh=True)
	PickupOverFX(0)=(CustomMesh=Mesh'MMScreenStaticP')
	
	RenderOffsetSelect=(Y=-1.500000,Z=2.000000)
	AnimMaxFrame=0.800000
	RenderOffsetFire=(X=-1.500000)
	AnimMaxFrameFire=0.909100
	CenterPlayerViewOffset=(X=11.000000,Y=0.700000,Z=-4.150000)
	WideCenterPlayerViewOffset=(X=12.000000,Y=0.700000,Z=-4.650000)
	
	FireOffsetZAdjustHidden=-8.000000
	
	LockingLine=RedTex
	LockingSound=SeekingLockAmb
	SoundVolume=192
	
	LockingGrid(0)=LockGridFX01
	LockingGrid(1)=LockGridFX02
	LockingGrid(2)=LockGridFX03
	LockingGrid(3)=LockGridFX04
	LockingGrid(4)=LockGridFX05
	LockingGrid(5)=LockGridFX06
	LockingGrid(6)=LockGridFX07
	LockingGrid(7)=LockGridFX08
	LockingGrid(8)=LockGridFX09
	LockingGrid(9)=LockGridFX10
	LockingGrid(10)=LockGridFX11
	LockingGrid(11)=LockGridFX12
	LockingGrid(12)=LockGridFX13
	LockingGrid(13)=LockGridFX14
	LockingGrid(14)=LockGridFX15
	LockingGrid(15)=LockGridFX16
	LockingGrid(16)=LockGridFX17
	LockingGrid(17)=LockGridFX18
	LockingGrid(18)=LockGridFX19
	LockingGrid(19)=LockGridFX20
	LockingGrid(20)=LockGridFX21
	LockingGrid(21)=LockGridFX22
	LockingGrid(22)=LockGridFX23
	LockingGrid(23)=LockGridFX24
	LockingGrid(24)=LockGridFX25
	LockingGrid(25)=LockGridFX26
	LockingGrid(26)=LockGridFX27
	LockingGrid(27)=LockGridFX28
	LockingGrid(28)=LockGridFX29
	LockingGrid(29)=LockGridFX30
	LockingGrid(30)=LockGridFX31
	LockingGrid(31)=LockGridFX32
	
	canPlayerHoldLock=False
	enableA=True
	enableH=True
	enableT=True
	enableX=True
	XMissileBaseDamage=1000
	LockingRate=1.500000
	LockingStayTime=1.500000
	
	ThermicLockable(0)=NuclearMissile
	ThermicLockable(1)=StrangeShell
	ThermicLockable(2)=WarShell
	ThermicLockable(3)=DumbRocket
	ThermicLockable(4)=Cybot
	ThermicLockable(5)=TranslocatorTarget
	ThermicLockable(6)=RTTrans
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=64,G=128,B=96)
	OversurrectorFXColors(0)=(R=24,G=64,B=48)
	OversurrectorFXColors(1)=(R=48,G=96,B=64)
	OversurrectorFXColors(2)=(R=4,G=32,B=16)
	OversurrectorFXColors(3)=(R=32,G=128,B=64)
	OversurrectorFXColors(4)=(R=16,G=64,B=32)
	OversurrectorFXColors(5)=(R=64,G=64,B=64)
	OversurrectorFXColors(6)=(R=96,G=128,B=96)
	OversurrectorFXColors(7)=(R=0,G=64,B=32)
	OversurrectorFXColors(8)=(R=0,G=64,B=32)
	OversurrectorFXColors(9)=(R=128,G=128,B=64)
	OversurrectorFXColors(10)=(R=128,G=128,B=64)
	OversurrectorFXColors(11)=(R=48,G=96,B=64)
	OversurrectorFXColors(12)=(R=8,G=24,B=16)
	OversurrectorFXColors(13)=(R=96,G=128,B=96)
	OversurrectorFXColors(14)=(R=64,G=128,B=96)
	OversurrectorFXColors(15)=(R=48,G=96,B=48)
	OversurrectorFXColors(16)=(R=16,G=96,B=48)
	OversurrectorFXColors(17)=(R=0,G=64,B=16)
	OversurrectorFXColors(18)=(R=48,G=64,B=48)
	OversurrectorFXColors(19)=(R=4,G=16,B=12)
	OversurrectorFXColors(20)=(R=0,G=64,B=48)
	OversurrectorFXColors(21)=(R=128,G=128,B=128)
	OversurrectorFXColors(22)=(R=64,G=128,B=96)
	OversurrectorFXColors(23)=(R=16,G=64,B=48)
	
	OversurrectorLightHue(0)=122
	OversurrectorLightSaturation(0)=64
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=122
	OversurrectorLightSaturation(1)=64
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=122
	OversurrectorLightSaturation(2)=64
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'MultiMissileOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=45.000000
	OversurrectionTurretRotRate=12000.000000
	OversurrectionFireCycleRate=1.000000
	OversurrectionReloadPauseTime=3.000000
	OversurrectionReloadTime=0.750000
	OversurrectionScanEnemiesRadius=40000.000000
	OversurrectionRangedEnemiesPeriph=0.500000
	OversurrectionAttackMinPeriph=0.900000
	OversurrectionHexaAtkOdds=0.450000
	OversurrectionQuadAtkOdds=0.450000
	OversurrectionDualAtkOdds=0.750000
	OversurrectionMissileDamage=1000
	OversurrectionMissileDamageRadius=1200.000000
}
