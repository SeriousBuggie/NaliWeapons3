//////////////////////////////////////////////////////////////
//	Nali Weapons III Ionizer weapon
//				Feralidragon (12-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class Ionizer expands NaliWeapons config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=Ionizer ANIVFILE=MODELS\Ionizer_a.3d DATAFILE=MODELS\Ionizer_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=Ionizer STRENGTH=0
#exec MESH ORIGIN MESH=Ionizer X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=IonizerR ANIVFILE=MODELS\Ionizer_a.3d DATAFILE=MODELS\Ionizer_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=IonizerR STRENGTH=0
#exec MESH ORIGIN MESH=IonizerR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=IonizerPick ANIVFILE=MODELS\Ionizer_a.3d DATAFILE=MODELS\Ionizer_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IonizerPick STRENGTH=0
#exec MESH ORIGIN MESH=IonizerPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=IonizerM ANIVFILE=MODELS\Ionizer_a.3d DATAFILE=MODELS\Ionizer_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerM STRENGTH=0.45
#exec MESH ORIGIN MESH=IonizerM X=290 Y=0 Z=-100 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=Ionizer SEQ=All STARTFRAME=0 NUMFRAMES=33
#exec MESH SEQUENCE MESH=Ionizer SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Ionizer SEQ=Paint STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Ionizer SEQ=Fire STARTFRAME=1 NUMFRAMES=6 RATE=6.0
#exec MESH SEQUENCE MESH=Ionizer SEQ=AltFire STARTFRAME=6 NUMFRAMES=15 RATE=15.0
#exec MESH SEQUENCE MESH=Ionizer SEQ=Select STARTFRAME=26 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=Ionizer SEQ=Down STARTFRAME=20 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IonizerR SEQ=All STARTFRAME=0 NUMFRAMES=33
#exec MESH SEQUENCE MESH=IonizerR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerR SEQ=Paint STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonizerR SEQ=Fire STARTFRAME=1 NUMFRAMES=6 RATE=6.0
#exec MESH SEQUENCE MESH=IonizerR SEQ=AltFire STARTFRAME=6 NUMFRAMES=15 RATE=15.0
#exec MESH SEQUENCE MESH=IonizerR SEQ=Select STARTFRAME=26 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IonizerR SEQ=Down STARTFRAME=20 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IonizerPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=IonizerM SEQ=All STARTFRAME=0 NUMFRAMES=33
#exec MESH SEQUENCE MESH=IonizerM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerM SEQ=Paint STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonizerM SEQ=Fire STARTFRAME=1 NUMFRAMES=6 RATE=6.0
#exec MESH SEQUENCE MESH=IonizerM SEQ=AltFire STARTFRAME=6 NUMFRAMES=15 RATE=15.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=Ionizer MESH=Ionizer
#exec MESHMAP SCALE MESHMAP=Ionizer X=0.0225 Y=0.0225 Z=0.045

#exec MESHMAP NEW MESHMAP=IonizerR MESH=IonizerR
#exec MESHMAP SCALE MESHMAP=IonizerR X=0.0225 Y=0.0225 Z=0.045

#exec MESHMAP NEW MESHMAP=IonizerPick MESH=IonizerPick
#exec MESHMAP SCALE MESHMAP=IonizerPick X=0.072 Y=0.072 Z=0.144

#exec MESHMAP NEW MESHMAP=IonizerM MESH=IonizerM
#exec MESHMAP SCALE MESHMAP=IonizerM X=0.056 Y=0.056 Z=0.112

//-----------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_IonizerPainter01 FILE=SKINS\Sk_IonizerPainter01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Ionizer NUM=1 TEXTURE=Sk_IonizerPainter01
#exec MESHMAP SETTEXTURE MESHMAP=IonizerR NUM=1 TEXTURE=Sk_IonizerPainter01
#exec MESHMAP SETTEXTURE MESHMAP=IonizerPick NUM=1 TEXTURE=Sk_IonizerPainter01
#exec MESHMAP SETTEXTURE MESHMAP=IonizerM NUM=1 TEXTURE=Sk_IonizerPainter01

#exec TEXTURE IMPORT NAME=Sk_IonizerPainter02 FILE=SKINS\Sk_IonizerPainter02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Ionizer NUM=2 TEXTURE=Sk_IonizerPainter02
#exec MESHMAP SETTEXTURE MESHMAP=IonizerR NUM=2 TEXTURE=Sk_IonizerPainter02
#exec MESHMAP SETTEXTURE MESHMAP=IonizerPick NUM=2 TEXTURE=Sk_IonizerPainter02
#exec MESHMAP SETTEXTURE MESHMAP=IonizerM NUM=2 TEXTURE=Sk_IonizerPainter02

#exec TEXTURE IMPORT NAME=Sk_IonizerPainter03 FILE=SKINS\Sk_IonizerPainter03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Ionizer NUM=3 TEXTURE=Sk_IonizerPainter03
#exec MESHMAP SETTEXTURE MESHMAP=IonizerR NUM=3 TEXTURE=Sk_IonizerPainter03
#exec MESHMAP SETTEXTURE MESHMAP=IonizerPick NUM=3 TEXTURE=Sk_IonizerPainter03
#exec MESHMAP SETTEXTURE MESHMAP=IonizerM NUM=3 TEXTURE=Sk_IonizerPainter03

#exec TEXTURE IMPORT NAME=Sk_IonizerPainter04 FILE=SKINS\Sk_IonizerPainter04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Ionizer NUM=4 TEXTURE=Sk_IonizerPainter04
#exec MESHMAP SETTEXTURE MESHMAP=IonizerR NUM=4 TEXTURE=Sk_IonizerPainter04
#exec MESHMAP SETTEXTURE MESHMAP=IonizerPick NUM=4 TEXTURE=Sk_IonizerPainter04
#exec MESHMAP SETTEXTURE MESHMAP=IonizerM NUM=4 TEXTURE=Sk_IonizerPainter04

#exec TEXTURE IMPORT NAME=Sk_IonizerPainter05 FILE=SKINS\Sk_IonizerPainter05.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Ionizer NUM=5 TEXTURE=Sk_IonizerPainter05
#exec MESHMAP SETTEXTURE MESHMAP=IonizerR NUM=5 TEXTURE=Sk_IonizerPainter05
#exec MESHMAP SETTEXTURE MESHMAP=IonizerPick NUM=5 TEXTURE=Sk_IonizerPainter05
#exec MESHMAP SETTEXTURE MESHMAP=IonizerM NUM=5 TEXTURE=Sk_IonizerPainter05

#exec TEXTURE IMPORT NAME=IonizerMetal FILE=SKINS\IonizerMetal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=IonizerIcon FILE=ICONS\IonizerIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerCrossAlpha FILE=ICONS\IonizerCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\IonizerIcons.utx PACKAGE=NWIonizerVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="IonizerPickup" FILE=SOUNDS\IonizerPickup.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonizerSelect" FILE=SOUNDS\IonizerSelect.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonizerZoomIn" FILE=SOUNDS\IonizerZoomIn.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonizerZoomOut" FILE=SOUNDS\IonizerZoomOut.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonizerFire" FILE=SOUNDS\IonizerFire.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonPainterDeploy" FILE=SOUNDS\IonPainterDeploy.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonPainterNoDeploy" FILE=SOUNDS\IonPainterNoDeploy.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonSecond" FILE=SOUNDS\IonSecond.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonFunctDenied" FILE=SOUNDS\IonFunctDenied.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="SatOnline" FILE=SOUNDS\SatOnline.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="SatPaintFire" FILE=SOUNDS\SatPaintFire.wav GROUP="Ionizer"
#exec AUDIO IMPORT NAME="IonizerPainting" FILE=SOUNDS\IonizerPainting.wav GROUP="Ionizer"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=IonizerHandL ANIVFILE=MODELS\IonizerHand_a.3d DATAFILE=MODELS\IonizerHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerHandL STRENGTH=0
#exec MESH ORIGIN MESH=IonizerHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=IonizerHandR ANIVFILE=MODELS\IonizerHand_a.3d DATAFILE=MODELS\IonizerHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=IonizerHandR STRENGTH=0
#exec MESH ORIGIN MESH=IonizerHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=IonizerHandL SEQ=All STARTFRAME=0 NUMFRAMES=33
#exec MESH SEQUENCE MESH=IonizerHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerHandL SEQ=Paint STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonizerHandL SEQ=Fire STARTFRAME=1 NUMFRAMES=6 RATE=6.0
#exec MESH SEQUENCE MESH=IonizerHandL SEQ=AltFire STARTFRAME=6 NUMFRAMES=15 RATE=15.0
#exec MESH SEQUENCE MESH=IonizerHandL SEQ=Select STARTFRAME=26 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IonizerHandL SEQ=Down STARTFRAME=20 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IonizerHandR SEQ=All STARTFRAME=0 NUMFRAMES=33
#exec MESH SEQUENCE MESH=IonizerHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerHandR SEQ=Paint STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonizerHandR SEQ=Fire STARTFRAME=1 NUMFRAMES=6 RATE=6.0
#exec MESH SEQUENCE MESH=IonizerHandR SEQ=AltFire STARTFRAME=6 NUMFRAMES=15 RATE=15.0
#exec MESH SEQUENCE MESH=IonizerHandR SEQ=Select STARTFRAME=26 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IonizerHandR SEQ=Down STARTFRAME=20 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=IonizerHandL MESH=IonizerHandL
#exec MESHMAP SCALE MESHMAP=IonizerHandL X=0.0225 Y=0.0225 Z=0.045

#exec MESHMAP NEW MESHMAP=IonizerHandR MESH=IonizerHandR
#exec MESHMAP SCALE MESHMAP=IonizerHandR X=0.0225 Y=0.0225 Z=0.045

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=IonizerHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=IonizerHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//SCOPE OVERLAYER MESHES
//*******************************************************
#exec MESH IMPORT MESH=IonizerScopeOVL ANIVFILE=MODELS\IonizerScopeOV_a.3d DATAFILE=MODELS\IonizerScopeOV_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IonizerScopeOVL STRENGTH=0
#exec MESH ORIGIN MESH=IonizerScopeOVL X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=IonizerScopeOVR ANIVFILE=MODELS\IonizerScopeOV_a.3d DATAFILE=MODELS\IonizerScopeOV_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=IonizerScopeOVR STRENGTH=0
#exec MESH ORIGIN MESH=IonizerScopeOVR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=IonizerScopeOVP ANIVFILE=MODELS\IonizerScopeOV_a.3d DATAFILE=MODELS\IonizerScopeOV_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IonizerScopeOVP STRENGTH=0
#exec MESH ORIGIN MESH=IonizerScopeOVP X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=IonizerScopeOVL SEQ=All STARTFRAME=0 NUMFRAMES=33
#exec MESH SEQUENCE MESH=IonizerScopeOVL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerScopeOVL SEQ=Paint STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonizerScopeOVL SEQ=Fire STARTFRAME=1 NUMFRAMES=6 RATE=6.0
#exec MESH SEQUENCE MESH=IonizerScopeOVL SEQ=AltFire STARTFRAME=6 NUMFRAMES=15 RATE=15.0
#exec MESH SEQUENCE MESH=IonizerScopeOVL SEQ=Select STARTFRAME=26 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IonizerScopeOVL SEQ=Down STARTFRAME=20 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IonizerScopeOVR SEQ=All STARTFRAME=0 NUMFRAMES=33
#exec MESH SEQUENCE MESH=IonizerScopeOVR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerScopeOVR SEQ=Paint STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonizerScopeOVR SEQ=Fire STARTFRAME=1 NUMFRAMES=6 RATE=6.0
#exec MESH SEQUENCE MESH=IonizerScopeOVR SEQ=AltFire STARTFRAME=6 NUMFRAMES=15 RATE=15.0
#exec MESH SEQUENCE MESH=IonizerScopeOVR SEQ=Select STARTFRAME=26 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IonizerScopeOVR SEQ=Down STARTFRAME=20 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IonizerScopeOVP SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=IonizerScopeOVL MESH=IonizerScopeOVL
#exec MESHMAP SCALE MESHMAP=IonizerScopeOVL X=0.0225 Y=0.0225 Z=0.045

#exec MESHMAP NEW MESHMAP=IonizerScopeOVR MESH=IonizerScopeOVR
#exec MESHMAP SCALE MESHMAP=IonizerScopeOVR X=0.0225 Y=0.0225 Z=0.045

#exec MESHMAP NEW MESHMAP=IonizerScopeOVP MESH=IonizerScopeOVP
#exec MESHMAP SCALE MESHMAP=IonizerScopeOVP X=0.072 Y=0.072 Z=0.144

#exec TEXTURE IMPORT NAME=IonScopeGlass FILE=SKINS\IonScopeGlass.bmp GROUP=Skins LODSET=2

//===========================================================================

//Zoom stuff
#exec TEXTURE IMPORT NAME=IonizerXTrace FILE=ICONS\IonizerXTrace.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerYTrace FILE=ICONS\IonizerYTrace.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonScopeBack FILE=ICONS\IonScopeBack.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerScope01 FILE=ICONS\IonizerScope01.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerScope02 FILE=ICONS\IonizerScope02.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerScope03 FILE=ICONS\IonizerScope03.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerScope04 FILE=ICONS\IonizerScope04.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerScopeCross01 FILE=ICONS\IonizerScopeCross01.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerScopeCross02 FILE=ICONS\IonizerScopeCross02.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerScopeCross03 FILE=ICONS\IonizerScopeCross03.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerScopeCross04 FILE=ICONS\IonizerScopeCross04.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=SatIcon FILE=ICONS\SatIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=RedScope FILE=ICONS\RedScope.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern01 FILE=ICONS\IonizerTriCirclePattern01.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern02 FILE=ICONS\IonizerTriCirclePattern02.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern03 FILE=ICONS\IonizerTriCirclePattern03.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern04 FILE=ICONS\IonizerTriCirclePattern04.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern05 FILE=ICONS\IonizerTriCirclePattern05.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern01Final FILE=ICONS\IonizerTriCirclePattern01Final.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern02Final FILE=ICONS\IonizerTriCirclePattern02Final.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern03Final FILE=ICONS\IonizerTriCirclePattern03Final.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern04Final FILE=ICONS\IonizerTriCirclePattern04Final.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IonizerTriCirclePattern05Final FILE=ICONS\IonizerTriCirclePattern05Final.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\IonizerStatic.utx PACKAGE=NWIonizerVIII_SRC.StaticScope
#exec OBJ LOAD FILE=Textures\IonStaticLasers.utx PACKAGE=NWIonizerVIII_SRC.IonStaticLasers

//Fonts
#exec new TRUETYPEFONTFACTORY Name=SatFontA FONTNAME="SquareFont" HEIGHT=10 ANTIAlIAS=TRUE
#exec new TRUETYPEFONTFACTORY Name=SatFontB FONTNAME="SquareFont" HEIGHT=14 ANTIAlIAS=TRUE
#exec new TRUETYPEFONTFACTORY Name=SatFontC FONTNAME="SquareFont" HEIGHT=18 ANTIAlIAS=TRUE
#exec new TRUETYPEFONTFACTORY Name=SatFontD FONTNAME="SquareFont" HEIGHT=22 ANTIAlIAS=TRUE
#exec new TRUETYPEFONTFACTORY Name=SatFontE FONTNAME="SquareFont" HEIGHT=26 ANTIAlIAS=TRUE
#exec new TRUETYPEFONTFACTORY Name=SatFontF FONTNAME="SquareFont" HEIGHT=30 ANTIAlIAS=TRUE

#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalA FONTNAME="DS-Digital" HEIGHT=18 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalB FONTNAME="DS-Digital" HEIGHT=22 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalC FONTNAME="DS-Digital" HEIGHT=26 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalD FONTNAME="DS-Digital" HEIGHT=30 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalE FONTNAME="DS-Digital" HEIGHT=34 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalF FONTNAME="DS-Digital" HEIGHT=38 ANTIAlIAS=TRUE

#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalSmallA FONTNAME="DS-Digital" HEIGHT=10 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalSmallB FONTNAME="DS-Digital" HEIGHT=14 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalSmallC FONTNAME="DS-Digital" HEIGHT=18 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalSmallD FONTNAME="DS-Digital" HEIGHT=22 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalSmallE FONTNAME="DS-Digital" HEIGHT=26 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=IonizerDSDigitalSmallF FONTNAME="DS-Digital" HEIGHT=30 ANTIAlIAS=TRUE

//===========================================================================


var(ServerConfig) config float ZoomScanRadius;
var(ServerConfig) config float MinSatelliteHeight, MaxSatelliteHeight;
var(ServerConfig) config float MaxSatelliteDeployDist;
var(ServerConfig) config float LauncherLifespan;
var(ServerConfig) config int SatelliteLaunchSeconds;
var(ServerConfig) config bool enableSatLights;
var(ServerConfig) config float PaintTime;
var(ServerConfig) config float MaxAttackDistance;
var(ClientConfig) config float IonDebrisRate, IonLightningsRate;
var(ClientConfig) config byte IonDebrisAmountPerUpdate, IonLightingsAmountPerUpdate;
var(ServerConfig) config int SatelliteArmor;
var(ServerConfig) config bool SatelliteIsInvincible;
var(ServerConfig) config bool SatelliteAIAwareness;
var(ServerConfig) config int RocketTakeoffIgnitionDamage;

struct ZBoxActors
{
	var() name ObjectType;
	var() color ObjectBoxColor;
};

var(ServerConfig) config ZBoxActors ZoomObjectsList[32];
var ZBoxActors zObjectsList[32];
var(ServerConfig) config name ZoomListExceptions[32];
var name zListExceptions[32];
var int maxZoomItems, maxZoomExceptClasses;
var bool bInvertLists;

var() Font ZSatFont[6], CountDownFont[6];
var() texture ZSatIcon;
var() float ZSatScale;
var() localized string SatOfflineStr, SatOnlineStr, SatRequestStr, SatLaunchCountdownStr, SatLaunchedStr;
var() color SatOfflineColor, SatOnlineColor, SatRequestColor, SatLaunchCountdownColor, SatLaunchedColor;
var() color CountDownColor, CountDownEndingColor, ActiveSatelliteColor;
var() sound DeployAcceptedSnd, DeployDeniedSnd, GenericDeniedSnd;
var() sound IonSecondSnd, SatOnlineSnd, SatPaintFireSnd, SatPaintingSnd;

var() localized string NoZoomMessageStr, CannotFireMessageStr, CannotAttackMessageStr;
var() localized string DeploymentTooCloseStr, DeploymentBadAngleStr, DeploymentBadHeight, DeploymentDeniedStr, DeploymentTooFarStr;
var() localized string ActiveSatelliteMoveStr, ActiveSatelliteFireStr;

var() texture LaserRedTex, DotRedTex;
var() texture LaserGreenTex, DotGreenTex;

var() color ScopeMsgColor;
var() int ScopeMsgOffsetX, ScopeMsgOffsetY;
var() Font ScopeMsgFont[6];


var vector OwnerLocation;
var float zScanRadius, zMinSatHeight, zMaxDeployDist;
var IonizerLauncherCanvas IonLauncherCnvs;
var byte satStatus;
var IonizerLauncher IonLauncher;
var IonizerSatellite IonSat;
var IonizerLauncherInFX IonLauncherINFX;

var actor LTrace, LDot;
var actor LDotTrail[7];
var vector LDotTrailLoc[7];
var float DotCount;
var float globalDelta;
var float satCanvasFadeFlickCount;
var int lastSecond;
var float IonPaintTime, ClientMaxPaintTime;
var bool bPaintingTarget;
var rotator OwnerOldRot, OwnerNewRot;
var vector AttackPoint, AttackNormal;
var string ScopeMsgStr;
var float ScopeMsgLifetime, ScopeMsgLifetimeMax;

//Zoom stuff
var(Zoom) Font ZoomFont[6];
var(Zoom) texture ZoomTexParts[4], ZoomCrossParts[4];
var(Zoom) texture GlassScopeTex;
var(Zoom) texture DarkBackground;
var(Zoom) texture StaticBackground;
var(Zoom) texture XBoxLine, YBoxLine;
var(Zoom) sound ZoomInSnd, ZoomOutSnd;
var bool bZoomIn;
var float StillTime, StillStart;

struct ITriC
{
	var() texture Tex, TexFinal;
	var() float DScale;
	var() float SGlow;
	var() float InCoef, OutCoef;
	var IonizerPaintTriCircle Part[3];
};
var(Zoom) ITriC ChargingTriCircles[5];
var(Zoom) int TriCirclesRollRate;


//AI
var float CountBot;

replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		zScanRadius, zMinSatHeight, zMaxDeployDist, zObjectsList, zListExceptions, satStatus, IonLauncher, IonSat, ClientMaxPaintTime,
		bInvertLists, maxZoomItems, maxZoomExceptClasses;
	reliable if (Role == ROLE_Authority)
		bPaintingTarget, AttackPoint, AttackNormal;
	reliable if (Role == ROLE_Authority)
		PlayStatusChange, CannotAttackNotifier;
}

function PreBeginPlay()
{
local byte i;

	Super.PreBeginPlay();
	zScanRadius = default.ZoomScanRadius;
	zMinSatHeight = FMax(Class'IonizerSatellite'.default.CollisionHeight*4, default.MinSatelliteHeight);
	zMaxDeployDist = default.MaxSatelliteDeployDist;
	ClientMaxPaintTime = default.PaintTime;
	bInvertLists = default.bInvertListsProcessing;
	
	for (i = 0; i < ArrayCount(ZoomObjectsList); i++)
		zObjectsList[i] = ZoomObjectsList[i];
	for (i = 0; i < ArrayCount(ZoomListExceptions); i++)
		zListExceptions[i] = ZoomListExceptions[i];
	
	LoadLists();
}

function LoadLists()
{
local int i;

	maxZoomItems = ArrayCount(zObjectsList);
	maxZoomExceptClasses = ArrayCount(zListExceptions);

	if (default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(zObjectsList); i++)
		{
			if (zObjectsList[i].ObjectType == '')
			{
				maxZoomItems = i;
				break;
			}
		}
		
		for (i = 0; i < ArrayCount(zListExceptions); i++)
		{
			if (zListExceptions[i] == '')
			{
				maxZoomExceptClasses = i;
				break;
			}
		}
	}
}

function SetStatus(byte newStatus)
{
	PlayStatusChange(newStatus);
	satStatus = newStatus;
}

simulated function PlayStatusChange(byte newStatus)
{
	if (newStatus == 0 && PlayerPawn(Owner) != None && (PlayerPawn(Owner).DesiredFOV != PlayerPawn(Owner).DefaultFOV || PlayerPawn(Owner).bZooming))
		GoToState('Zooming');

	if (satStatus < 4 && newStatus == 4)
		PlayOwnedSound(SatOnlineSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
	else if (satStatus >= 4 && newStatus < 4)
		PlayOwnedSound(GenericDeniedSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
	else if (satStatus == 4 && newStatus == 5)
		PlayOwnedSound(SatPaintFireSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
}

function Fire(float Value)
{
	if (Class'NWUtils'.static.isValidBot(Pawn(Owner)) && Value != 5.0)
		return;
	
    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));
	
	ClientFire(Value);
	
	if (satStatus == 0)
	{
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
		if (deployLauncher())
			satStatus = 1;
	}
	else if (satStatus == 4 && AmmoType.AmmoAmount > 0 && checkAttackPoint())
	{
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
		IonPaintTime = 0.0;
		bPaintingTarget = True;
	}
}

function bool checkAttackPoint(optional rotator customRot)
{
local actor A;
local vector HitLocation, HitNormal, EndTrace, StartTrace;
local byte b;
local bool bSniping;
local rotator R;
	
	if (Pawn(Owner) == None || IonSat == None)
		return False;
	
	if (customRot == rot(0,0,0))
		R = Pawn(Owner).ViewRotation;
	else
		R = customRot;
		
	bSniping = (Pawn(Owner).bZoom != 0 || (PlayerPawn(Owner) != None && (PlayerPawn(Owner).DesiredFOV != PlayerPawn(Owner).DefaultFOV || PlayerPawn(Owner).bZooming)) || (Bot(Owner) != None && Bot(Owner).bSniping));	
	StartTrace = Owner.Location;
	if (bSniping)
		StartTrace += (Pawn(Owner).Eyeheight*vect(0,0,1));
	else
		StartTrace += (CalcNewDrawOffset() + (FireOffset >> R));
	
	EndTrace = StartTrace + vector(R)*default.MaxAttackDistance;
	A = Trace(HitLocation, HitNormal, EndTrace, StartTrace, False);
	if (A != None && IonSat.CanAttackPoint(HitLocation + HitNormal, HitNormal, b, True))
	{
		AttackPoint = HitLocation + HitNormal;
		AttackNormal = HitNormal * 1000;		//Multiply by 1000 for good replication value accuracy
		return True;
	}
	CannotAttackNotifier();
	return False;
}

simulated function CannotAttackNotifier()
{
	SendStatusWarningMessage(CannotAttackMessageStr);
	PlayOwnedSound(GenericDeniedSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
}

simulated function bool isOwnerMoving()
{
	return (Pawn(Owner) != None && (Pawn(Owner).OldLocation != Pawn(Owner).Location || OwnerOldRot != OwnerNewRot));
}

simulated function bool ClientFire(float Value)
{
	if (satStatus > 0 && satStatus < 4)
	{
		SendStatusWarningMessage(CannotFireMessageStr);
		PlayOwnedSound(GenericDeniedSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
		PlayAltFiring();
		return False;
	}
	return Super.ClientFire(Value);
}

simulated function PlayFiring()
{
	if (satStatus == 0)
	{
		if (deployLauncher(True, True))
			PlayOwnedSound(DeployAcceptedSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
		else
			PlayOwnedSound(DeployDeniedSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
	}
	
	//PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*4.5);
	PlayAnim('Paint', 1.0, 0.0);
}


simulated function bool deployLauncher(optional bool bCheckOnly, optional bool sendMsg, optional rotator customRot)
{
local actor A;
local vector HitLocation, HitNormal, EndTrace, StartTrace;
local rotator R;
local float h;

	if (Pawn(Owner) == None)
		return False;

	if (customRot == rot(0,0,0))
		R = Pawn(Owner).ViewRotation;
	else
		R = customRot;
	
	StartTrace = Owner.Location + CalcNewDrawOffset() + (FireOffset >> R);
	EndTrace = StartTrace + vector(R)*zMaxDeployDist;
	A = Trace(HitLocation, HitNormal, EndTrace, StartTrace, False);	
	
	if (A != None && isDeployable(HitNormal.Z, VSize(HitLocation - StartTrace), HitLocation + HitNormal, sendMsg))
	{
		if (bCheckOnly)
			return True;
		
		if (Role == ROLE_Authority)
		{
			h = getRadialNormalizedHeight(Class'IonizerLauncher'.default.LauncherRadius, HitNormal.Z);
			IonLauncherINFX =  Spawn(Class'IonizerLauncherInFX', Owner,, HitLocation + HitNormal + h*vect(0,0,1), rot(0,0,0));
			if (IonLauncherINFX != None && Pawn(Owner).PlayerReplicationInfo != None)
				IonLauncherINFX.SetTeam(Pawn(Owner).PlayerReplicationInfo.Team, Self);
		}
	}
	else if (A == None && sendMsg)
		SendStatusWarningMessage(DeploymentDeniedStr$":"@DeploymentTooFarStr);
	
	return (IonLauncherINFX != None);
}

simulated function bool isDeployable(float Z, float dist, vector loc, optional bool sendMsg)
{
local bool a, b, c, d;

	a = (Z > 0.5);
	b = checkMinLaunchHeight(loc);
	c = (dist <= zMaxDeployDist);
	d = (Pawn(Owner)==None || !isWithinDeployRange(Owner, loc));
	
	if (sendMsg)
	{
		if (!a) SendStatusWarningMessage(DeploymentDeniedStr$":"@DeploymentBadAngleStr);
		else if (!b) SendStatusWarningMessage(DeploymentDeniedStr$":"@DeploymentBadHeight);
		else if (!c) SendStatusWarningMessage(DeploymentDeniedStr$":"@DeploymentTooFarStr);
		else if (!d) SendStatusWarningMessage(DeploymentDeniedStr$":"@DeploymentTooCloseStr);
	}
	
	return (a && b && c && d);
}

simulated function bool isWithinDeployRange(actor A, vector loc)
{
	return ((FMax(A.CollisionRadius, A.CollisionHeight) + Class'IonizerLauncher'.default.LauncherRadius) > VSize(A.Location - loc));
}

simulated function bool ClientAltFire(float Value)
{
	if (satStatus >= 4)
	{
		if (!bZoomIn)
			PlayOwnedSound(ZoomInSnd, SLOT_None, Pawn(Owner).SoundDampening*5.0);
		else
			PlayOwnedSound(ZoomOutSnd, SLOT_None, Pawn(Owner).SoundDampening*5.0);

		GotoState('Zooming');
		return True;
	}
	else
	{
		PlayAltFiring();
		PlayOwnedSound(GenericDeniedSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
		SendStatusWarningMessage(NoZoomMessageStr);
	}
	
	return False;
}

simulated function SendStatusWarningMessage(coerce string msg)
{
	if (PlayerPawn(Owner) != None && PlayerPawn(Owner).myHUD != None)
	{
		if (PlayerPawn(Owner).DesiredFOV != PlayerPawn(Owner).DefaultFOV || PlayerPawn(Owner).bZooming)
		{
			ScopeMsgStr = msg;
			ScopeMsgLifetimeMax = 2.0;
			ScopeMsgLifetime = ScopeMsgLifetimeMax;
		}
		else
			PlayerPawn(Owner).myHUD.LocalizedMessage(Class'IonSatMsgPlus', 0, None, None, None, msg);
	}
}

function AltFire( float Value )
{
	ClientAltFire(Value);
}

simulated function PlayAltFiring()
{
	PlayAnim('Paint', 5.0, 0.0);
}

function Timer()
{
    local actor targ;
    local float bestAim, bestDist;
    local vector FireDir;
    local Pawn P;

    bestAim = 0.95;
    P = Pawn(Owner);
    if ( P == None )
    {
        GotoState('');
        return;
    }
    if ( VSize(P.Location - OwnerLocation) < 6 )
        StillTime += FMin(2.0, Level.TimeSeconds - StillStart);
    else
        StillTime = 0;
    StillStart = Level.TimeSeconds;
    OwnerLocation = P.Location;
    FireDir = vector(P.ViewRotation);
    targ = P.PickTarget(bestAim, bestDist, FireDir, Owner.Location);
    if ( Pawn(targ) != None )
    {
        SetTimer(1 + 4 * FRand(), false);
        bPointing = true;
        Pawn(targ).WarnTarget(P, 200, FireDir);
    }
    else 
    {
        SetTimer(0.4 + 1.6 * FRand(), false);
        if ( (P.bFire == 0) && (P.bAltFire == 0) )
            bPointing = false;
    }
}

function Finish()
{
	if (Pawn(Owner) != None && Pawn(Owner).bFire!=0 && FRand() < 0.6)
		Timer();
	bPaintingTarget = False;
	AmbientSound = None;
	SoundVolume = 0;
	SoundPitch = 32;
	Super.Finish();
}

simulated function Tick(float Delta)
{
	globalDelta = Delta;
	BotIonPainting(Delta);
	
	if (Pawn(Owner) != None && Pawn(Owner).bAltFire == 0 )
	{
		if ( PlayerPawn(Owner) != None && PlayerPawn(Owner).Player != None && PlayerPawn(Owner).Player.IsA('ViewPort'))
			PlayerPawn(Owner).StopZoom();
		SetTimer(0.0,False);
	}
	
	if (!bPaintingTarget && IonPaintTime > 0.0)
		IonPaintTime = FMax(0.0, IonPaintTime - Delta*5);
	
	if (Pawn(Owner) != None)
	{
		OwnerOldRot = OwnerNewRot;
		OwnerNewRot = Pawn(Owner).ViewRotation;
	}
	
	Super.Tick(Delta);
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
local vector laserOffset;
local vector HitLocation, HitNormal, EndTrace;
local float h;
local actor A;
local byte i;
local float laserDist;
local bool canDeploy;
local float minLaserGlowFactor, maxLaserScaleFactor;

	minLaserGlowFactor = 0.15;
	maxLaserScaleFactor = 0.8;
	if (!bHideWeapon)
		laserOffset.X = 16;
	else
		laserOffset.X = -4;
	
	if ((!IsAnimating() || AnimSequence == 'Still' || AnimSequence == 'Paint') && (satStatus == 0 || satStatus > 3))
	{
		if (LTrace == None)
			LTrace = Spawn(Class'IonPainterLaserTrace',,, Loc + (laserOffset >> Rot), Rot);
		else
		{	
			EndTrace = Loc + vector(Rot) * 30000;
			A = Trace(HitLocation, HitNormal, EndTrace, Loc, False);
			
			if (LDot == None)
				LDot = Spawn(Class'IonPainterLaserDot',,, Loc);
			else if (A != None)
			{
				laserDist = VSize(HitLocation-Loc);
				canDeploy = (satStatus == 0 && isDeployable(HitNormal.Z, laserDist, HitLocation + HitNormal));
			
				if (canDeploy)
					LDot.Texture = DotGreenTex;
				else
					LDot.Texture = DotRedTex;
				
				if (satStatus > 3)
				{
					LDot.ScaleGlow = LDot.default.ScaleGlow * FMax(IonPaintTime/ClientMaxPaintTime,  minLaserGlowFactor);
					LDot.DrawScale = LDot.default.DrawScale * (maxLaserScaleFactor * IonPaintTime/ClientMaxPaintTime) + LDot.default.DrawScale;
				}
				else
				{
					LDot.ScaleGlow = LDot.default.ScaleGlow;
					LDot.DrawScale = LDot.default.DrawScale;
				}
				LDot.SetLocation(HitLocation + HitNormal);
				Canvas.DrawActor(LDot, False, False);
				
				//Launcher placement
				if (satStatus == 0 && laserDist <= zMaxDeployDist)
				{
					if (IonLauncherCnvs == None)
						IonLauncherCnvs = Spawn(Class'IonizerLauncherCanvas',,, HitLocation + HitNormal, rot(0,0,0));
					
					if (canDeploy)
						h = getRadialNormalizedHeight(IonLauncherCnvs.LauncherRadius, HitNormal.Z);
					
					IonLauncherCnvs.SetLocation(HitLocation + HitNormal + h*vect(0,0,1));
					IonLauncherCnvs.MaxGlow = (zMaxDeployDist-laserDist) * IonLauncherCnvs.default.MaxGlow / zMaxDeployDist;
					IonLauncherCnvs.MinGlow = (zMaxDeployDist-laserDist) * IonLauncherCnvs.default.MinGlow / zMaxDeployDist;
					IonLauncherCnvs.SetIndicativeColor(canDeploy);
					Canvas.DrawActor(IonLauncherCnvs, False, False);
				}
			}
			
			for (i = 0; i < ArrayCount(LDotTrail); i++)
			{
				if (LDotTrail[i] == None && A != None)
					LDotTrail[i] = Spawn(Class'IonPainterLaserDot',,, A.Location);
				else if (A != None)
				{
					if (canDeploy)
						LDotTrail[i].Texture = DotGreenTex;
					else
						LDotTrail[i].Texture = DotRedTex;
						
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
						
					if (satStatus > 3)
						LDotTrail[i].ScaleGlow = LDotTrail[i].default.ScaleGlow * FMax(IonPaintTime/ClientMaxPaintTime,  minLaserGlowFactor);
					LDotTrail[i].DrawScale = LDot.DrawScale * FRand() * 1.5;
					Canvas.DrawActor(LDotTrail[i], False, False);
				}
			}
			
			if (canDeploy)
				LTrace.MultiSkins[1] = LaserGreenTex;
			else
				LTrace.MultiSkins[1] = LaserRedTex;
				
			if (satStatus > 3)
			{
				LTrace.ScaleGlow = LTrace.default.ScaleGlow * FMax(IonPaintTime/ClientMaxPaintTime,  minLaserGlowFactor);
				LTrace.DrawScale = LTrace.default.DrawScale * (maxLaserScaleFactor * IonPaintTime/ClientMaxPaintTime) + LTrace.default.DrawScale;
			}
			else
			{
				LTrace.ScaleGlow = LTrace.default.ScaleGlow;
				LTrace.DrawScale = LTrace.default.DrawScale;
			}
			
			LTrace.SetLocation(Loc + (laserOffset >> Rot));
			LTrace.SetRotation(Rot);
			Canvas.DrawActor(LTrace, False, False);
		}
	}
}

simulated function float getRadialNormalizedHeight(float radius, float sinAngle)
{
local float c1, c2, angleBeta, angleAlpha;

	c1 = radius * sinAngle;
	c2 = sqrt((radius**2) - (c1**2));
	angleBeta = atan(c1/c2);
	angleAlpha = PI/2 - angleBeta;
	return (c1 * sin(angleAlpha));
}

//ZOOM and other rendering ---------------------------------------
simulated function PostRender( canvas Canvas )
{
local PlayerPawn P;
local float Scale, ZoomS, SatRenderOffsetCoef;
local float ScopeScale, StartScopeX, StartScopeY, EndScopeX, EndScopeY;
local float CntX, CntY, TxtLenX, TxtLenY, oldTxtLenY;
local float canvasIonScale;
local int i, j;
local Actor A;
local vector PEyeOrigin;
local color CColor, CColorB;
local string statusStr, otherStr;
local string n, ns, nms;
local int m, s, ms, curSecond;
local float f, progress;
local rotator R;
local texture tex;
local bool justSpawned;

	P = PlayerPawn(Owner);
	Scale = Canvas.ClipX/640;
	CntX = Canvas.ClipX/2;
	CntY = Canvas.ClipY/2;
	PEyeOrigin = P.Location + P.EyeHeight*vect(0,0,1) + P.WalkBob;
	
	if (satStatus == 4)
		canvasIonScale = IonPaintTime/ClientMaxPaintTime;
	else if (satStatus > 4)
		canvasIonScale = 1.0;

	if ( (P != None) && (P.DesiredFOV != P.DefaultFOV) ) 
	{
		bOwnsCrossHair = True;
		ScopeScale = Canvas.ClipY/512;
		StartScopeX = (Canvas.ClipX - 512*ScopeScale)/2;
		StartScopeY = 0;
		EndScopeX = (Canvas.ClipX + 512*ScopeScale)/2;
		EndScopeY = Canvas.ClipY;
		
		//Scope Glass Render
		Canvas.bNoSmooth = True;
		Canvas.Style = ERenderStyle.STY_Modulated;
		Canvas.SetPos(0, 0);
		Canvas.DrawRect(GlassScopeTex, Canvas.ClipX, Canvas.ClipY);
		
		
		//Zoom scan
		if (zScanRadius > 0)
		{
			Canvas.Style = ERenderStyle.STY_Translucent;
			ForEach RadiusActors(Class'Actor', A, zScanRadius, P.Location)
			{
				if (!A.bHidden && A.CollisionHeight>0 && A.CollisionRadius>0 && A != P && 
				isValidZoomObject(A, CColor) && FastTrace(PEyeOrigin, A.Location))
					DrawCollisionBox(PEyeOrigin, P.ViewRotation, A, Canvas, CColor*((zScanRadius-VSize(P.Location-A.Location))/zScanRadius));
			}
		}
		
		
		//Static Render
		Canvas.bNoSmooth = True;
		Canvas.Style = ERenderStyle.STY_Translucent;
		Canvas.SetPos(0,0);
		Canvas.DrawColor.R = 16;
		Canvas.DrawColor.G = 16;
		Canvas.DrawColor.B = 16;
		Canvas.DrawPattern(StaticBackground, Canvas.ClipX, Canvas.ClipY, 0.5);
		//Canvas.DrawRect(StaticBackground, Canvas.ClipX, Canvas.ClipY);
		
		
		//Scope Render
		Canvas.bNoSmooth = True;
		Canvas.Style = ERenderStyle.STY_Modulated;
		
		Canvas.SetPos(StartScopeX, StartScopeY);
		Canvas.DrawIcon(ZoomTexParts[0], ScopeScale);
		Canvas.SetPos(CntX, StartScopeY);
		Canvas.DrawIcon(ZoomTexParts[1], ScopeScale);
		Canvas.SetPos(StartScopeX, CntY);
		Canvas.DrawIcon(ZoomTexParts[2], ScopeScale);
		Canvas.SetPos(CntX, CntY);
		Canvas.DrawIcon(ZoomTexParts[3], ScopeScale);
		
		
		//Scope Crosshair Render
		Canvas.bNoSmooth = True;
		Canvas.Style = ERenderStyle.STY_Translucent;
		Canvas.DrawColor.R = 255;
		Canvas.DrawColor.G = 0;
		Canvas.DrawColor.B = 0;
		
		Canvas.SetPos(StartScopeX, StartScopeY);
		Canvas.DrawIcon(ZoomCrossParts[0], ScopeScale);
		Canvas.SetPos(CntX, StartScopeY);
		Canvas.DrawIcon(ZoomCrossParts[1], ScopeScale);
		Canvas.SetPos(StartScopeX, CntY);
		Canvas.DrawIcon(ZoomCrossParts[2], ScopeScale);
		Canvas.SetPos(CntX, CntY);
		Canvas.DrawIcon(ZoomCrossParts[3], ScopeScale);

		
		//Charging render
		if ((satStatus == 4 && bPaintingTarget) || satStatus > 4)
		{			
			for (i = 0; i < ArrayCount(ChargingTriCircles); i++)
			{
				if (canvasIonScale >= ChargingTriCircles[i].InCoef)
				{
					if (ChargingTriCircles[i].OutCoef > 0.0)
						progress = (canvasIonScale-ChargingTriCircles[i].InCoef) / (ChargingTriCircles[i].OutCoef-ChargingTriCircles[i].InCoef);
					else
						progress = canvasIonScale;
					
					if (progress >= 1.0)
						tex = ChargingTriCircles[i].TexFinal;
					else
						tex = ChargingTriCircles[i].Tex;
					
					for (j = 0; j < ArrayCount(ChargingTriCircles[i].Part); j++)
					{
						justSpawned = False;
						if (ChargingTriCircles[i].Part[j] == None || ChargingTriCircles[i].Part[j].bDeleteMe)
						{
							ChargingTriCircles[i].Part[j] = Spawn(Class'IonizerPaintTriCircle');
							justSpawned = True;
						}
						
						R = rotator(AttackNormal);
						if (!justSpawned && progress >= 1.0)
							R.Roll = ChargingTriCircles[i].Part[j].Rotation.Roll + Int(((i%2)*2-1)*TriCirclesRollRate*globalDelta);
						else
							R.Roll = j * 21845;
						ChargingTriCircles[i].Part[j].SetRotation(R);
						ChargingTriCircles[i].Part[j].SetLocation(AttackPoint);
						ChargingTriCircles[i].Part[j].SetDisplay(tex, ChargingTriCircles[i].DScale, ChargingTriCircles[i].SGlow);
						ChargingTriCircles[i].Part[j].SetProgress(True, FMin(1.0, progress));
						Canvas.DrawActor(ChargingTriCircles[i].Part[j], False, True);
					}
				}
			}
		}
		
		//Check if it's firing or not
		if ((ScopeMsgLifetime-globalDelta) <= 0 && (satStatus == 5 || satStatus == 6))
		{
			if (satStatus == 5)
			{
				ScopeMsgStr = ActiveSatelliteMoveStr;
				ScopeMsgLifetimeMax = 0.75;
			}
			else
			{
				ScopeMsgStr = ActiveSatelliteFireStr;
				ScopeMsgLifetimeMax = 0.35;
			}
			ScopeMsgLifetime = ScopeMsgLifetimeMax;
		}
		
		//Render error and aknowledge messages
		if (Len(ScopeMsgStr) > 0 && (ScopeMsgLifetime-globalDelta) > 0 && ScopeMsgLifetimeMax > 0)
		{
			ScopeMsgLifetime -= globalDelta;
			Canvas.bNoSmooth = False;
			Canvas.Style = ERenderStyle.STY_Translucent;
			Canvas.DrawColor = ScopeMsgColor * (ScopeMsgLifetime/ScopeMsgLifetimeMax);
			Canvas.Font = ScopeMsgFont[Class'NWUtils'.static.getResolutionFontCoef(Canvas)];
			Canvas.SetPos(StartScopeX + ScopeMsgOffsetX*ScopeScale, StartScopeY + ScopeMsgOffsetY*ScopeScale);
			Canvas.DrawText(ScopeMsgStr);
		}
		
		
		//Screen sides occusion render
		Canvas.bNoSmooth = True;
		Canvas.Style = ERenderStyle.STY_Normal;
		Canvas.DrawColor.R = 255;
		Canvas.DrawColor.G = 255;
		Canvas.DrawColor.B = 255;
		
		Canvas.SetPos(0, 0);
		Canvas.DrawRect(DarkBackground, StartScopeX, EndScopeY);
		Canvas.SetPos( EndScopeX, 0);
		Canvas.DrawRect(DarkBackground, StartScopeX, EndScopeY);
		
		
		//Zoom Numeral Amount Text
		Canvas.Style = ERenderStyle.STY_Translucent;
		Canvas.DrawColor.R = 192;
		Canvas.DrawColor.G = 192;
		Canvas.DrawColor.B = 192;
		Canvas.bNoSmooth = False;
		Canvas.Font = ZoomFont[Class'NWUtils'.static.getResolutionFontCoef(Canvas)];
		ZoomS = P.DefaultFOV/P.DesiredFOV;
		
		Canvas.SetPos(0.5 * Canvas.ClipX + 128*ScopeScale, 0.5 * Canvas.ClipY + 128*ScopeScale);
		Canvas.DrawText(int(ZoomS) $ "." $ int(10 * ZoomS - 10 * int(ZoomS)) $ "X");
		
		bZoomIn = True;
		Super(TournamentWeapon).PostRender(Canvas);
	}
	else
	{
		bZoomIn = False;
		bOwnsCrosshair = class'NaliWeapons'.default.bCustomCrosshair;
		
		Canvas.Style = ERenderStyle.STY_Translucent;
		Canvas.bNoSmooth = False;
		
		if (satStatus == 0)
		{
			CColor = SatOfflineColor;
			statusStr = SatOfflineStr;
		}
		else if (satStatus == 1)
		{
			CColor = SatRequestColor;
			statusStr = SatRequestStr;
		}
		else if (satStatus == 2)
		{
			CColor = SatLaunchCountdownColor;
			if (IonLauncher != None)
			{
				if (IonLauncher.countDown < 0)
					n = "0:00:00";
				else
				{
					f = IonLauncher.countDown;
					m = Int(f/60);
					f -= (m*60);
					s = Int(f);
					ms = Int((f-s)*100);
					if (s < 10) ns = "0"$s; else ns = String(s);
					if (ms < 10) nms = "0"$ms; else nms = String(ms);
					n = m $ ":" $ ns $ ":" $ nms;
				}
			}
			
			curSecond = Int(IonLauncher.countDown);
			if (curSecond != lastSecond)
				PlayOwnedSound(IonSecondSnd, SLOT_None, Pawn(Owner).SoundDampening*4.5);
			lastSecond = Int(IonLauncher.countDown);
			
			if (f > 3.0)
				CColorB = CountDownColor;
			else
				CColorB = CountDownEndingColor;
			statusStr = SatLaunchCountdownStr$" ";
		}
		else if (satStatus == 3)
		{
			CColor = SatLaunchedColor;
			statusStr = SatLaunchedStr;
		}
		else
		{
			CColor = SatOnlineColor;
			statusStr = SatOnlineStr;
		}
		
		SatRenderOffsetCoef = 0.05;
		Canvas.DrawColor = CColor;
		Canvas.SetPos(CntX - ZSatIcon.USize*ZSatScale*Scale/2, SatRenderOffsetCoef*Canvas.ClipY);
		Canvas.DrawIcon(ZSatIcon, ZSatScale*Scale);
		
		if (Len(n) > 0)
		{
			DrawMultipleCenterText(Canvas, SatRenderOffsetCoef*Canvas.ClipY + ZSatIcon.VSize*ZSatScale*Scale, 
				statusStr, n, CColor, CColorB, ZSatFont[Class'NWUtils'.static.getResolutionFontCoef(Canvas)], CountDownFont[Class'NWUtils'.static.getResolutionFontCoef(Canvas)]);
		}
		else
		{
			Canvas.DrawColor = CColor;
			Canvas.Font = ZSatFont[Class'NWUtils'.static.getResolutionFontCoef(Canvas)];
			Canvas.StrLen(statusStr, TxtLenX, TxtLenY);
			Canvas.SetPos(CntX - TxtLenX/2, SatRenderOffsetCoef*Canvas.ClipY + ZSatIcon.VSize*ZSatScale*Scale);
			Canvas.DrawText(statusStr);
		}
		
		
		//Firing and moving status
		if (satStatus == 5 || satStatus == 6)
		{	
			if (satStatus == 5)
			{
				otherStr = ActiveSatelliteMoveStr;
				satCanvasFadeFlickCount += globalDelta;
			}
			else
			{
				otherStr = ActiveSatelliteFireStr;
				satCanvasFadeFlickCount += (globalDelta*2);
			}
			
			if (satCanvasFadeFlickCount >= 1.0)
				satCanvasFadeFlickCount = 0.0;
			
			oldTxtLenY = TxtLenY;
			Canvas.DrawColor = ((Sin(satCanvasFadeFlickCount*2*PI)+1)/2) * ActiveSatelliteColor;
			Canvas.Font = ZSatFont[Class'NWUtils'.static.getResolutionFontCoef(Canvas)];
			Canvas.StrLen(otherStr, TxtLenX, TxtLenY);
			Canvas.SetPos(CntX - TxtLenX/2, SatRenderOffsetCoef*Canvas.ClipY + ZSatIcon.VSize*ZSatScale*Scale + oldTxtLenY + 4*Scale);
			Canvas.DrawText(otherStr);
		}
			
		Super.PostRender(Canvas);
	}
}

simulated event RenderOverlays(canvas Canvas)
{
local PlayerPawn PlayerOwner;
local rotator R;
local vector Loc;

	PlayerOwner = PlayerPawn(Owner);
    if (PlayerOwner != None && bHideWeapon && PlayerOwner.DesiredFOV == PlayerOwner.DefaultFOV)
    {
		PlayerViewOffset.Z = Default.PlayerViewOffset.Z * 100;
		WidePlayerViewOffset.Z = Default.WidePlayerViewOffset.Z * 100;
		Super.RenderOverlays(Canvas);
		PlayerViewOffset.Z -= 800;
		WidePlayerViewOffset.Z -= 800;
        Loc = Owner.Location + CalcNewDrawOffset();
		R = Pawn(Owner).ViewRotation;
		R.Roll = -2 * Default.Rotation.Roll;
		RenderOther(Canvas, Loc, R);
    }
	else
		Super.RenderOverlays(Canvas);
}

simulated function DrawMultipleCenterText(canvas Canvas, float Y, coerce string txt1, coerce string txt2, 
color DColor1, color DColor2, Font F1, optional Font F2)
{
local float TxtLenX1, TxtLenY1, TxtLenX2, TxtLenY2;
local float CntX, CntY;

	CntX = Canvas.ClipX/2;
	CntY = Canvas.ClipY/2;
	if (F2 == None)
		F2 = F1;

	Canvas.Font = F1;
	Canvas.StrLen(txt1, TxtLenX1, TxtLenY1);
	Canvas.Font = F2;
	Canvas.StrLen(txt2, TxtLenX2, TxtLenY2);
	
	Canvas.Font = F1;
	Canvas.DrawColor = DColor1;
	Canvas.SetPos(CntX - (TxtLenX1+TxtLenX2)/2, Y);
	Canvas.DrawText(txt1);
	
	Canvas.Font = F2;
	Canvas.DrawColor = DColor2;
	Canvas.SetPos(CntX - (TxtLenX1+TxtLenX2)/2 + TxtLenX1, Y + (TxtLenY1-TxtLenY2)/2);
	Canvas.DrawText(txt2);
}

simulated function bool checkMinLaunchHeight(vector Loc)
{
local actor H;
local vector HitLoc, HitNorm;

	if (zMinSatHeight <= 0)
		return True;

	H = Trace(HitLoc, HitNorm, Loc + zMinSatHeight*vect(0,0,1), Loc, False);
	return (H == None);
}

simulated function bool isValidZoomObject(actor A, out color ZColor)
{
local int i;

	if (A == None || A.bDeleteMe)
		return False;
		
	maxZoomItems = ArrayCount(zObjectsList);
	maxZoomExceptClasses = ArrayCount(zListExceptions);
		
	if (bInvertLists)
	{
		for (i = maxZoomExceptClasses-1; i >= 0; i--)
		{
			if (zListExceptions[i] != '' && A.IsA(zListExceptions[i]))
				return False;
		}
		
		for (i = maxZoomItems-1; i >= 0; i--)
		{
			if (zObjectsList[i].ObjectType != '' && A.IsA(zObjectsList[i].ObjectType))
			{
				ZColor = zObjectsList[i].ObjectBoxColor;
				return True;
			}
		}
	}
	else
	{
		for (i = 0; i < maxZoomExceptClasses; i++)
		{
			if (zListExceptions[i] != '' && A.IsA(zListExceptions[i]))
				return False;
		}
		
		for (i = 0; i < maxZoomItems; i++)
		{
			if (zObjectsList[i].ObjectType != '' && A.IsA(zObjectsList[i].ObjectType))
			{
				ZColor = zObjectsList[i].ObjectBoxColor;
				return True;
			}
		}
	}
	
	return False;
}

simulated function DrawCollisionBox(vector Origin, rotator ViewRot, actor A, canvas Canvas, color DColor)
{
local vector POffset, PCentral;
local rotator ROr;
local vector BoxCanvasXY;
local int X1, Y1, X2, Y2;

	if (A != None && A.CollisionRadius > 0 && A.CollisionHeight > 0 && Class'NWUtils'.static.LocToCanvas(BoxCanvasXY, A.Location, Origin, ViewRot, Canvas))
	{
		//Get collision plane point
		if (Origin.Z > A.Location.Z)
			POffset = getVector(-A.CollisionRadius, A.CollisionRadius, A.CollisionHeight);
		else
			POffset = getVector(A.CollisionRadius, A.CollisionRadius, A.CollisionHeight);
		
		//Rotate points towards orientation
		PCentral = A.Location;
		ROr = rotator(-vector(ViewRot)*vect(1,1,0));
		
		//Calculate box vertexes to draw in canvas
		Class'NWUtils'.static.LocToCanvas(BoxCanvasXY, (POffset >> ROr) + PCentral, Origin, ViewRot, Canvas);
		X1 = BoxCanvasXY.X;
		Y1 = BoxCanvasXY.Y;
		Class'NWUtils'.static.LocToCanvas(BoxCanvasXY, ((-1*POffset) >> ROr) + PCentral, Origin, ViewRot, Canvas);;
		X2 = BoxCanvasXY.X;
		Y2 = BoxCanvasXY.Y;
		
		//Draw box
		Canvas.bNoSmooth = False;
		Canvas.DrawColor = DColor;
		
		if (X1 > X2)
			switchInt(X1, X2);
		if (Y1 > Y2)
			switchInt(Y1, Y2);
		
		Canvas.SetPos(X1, Y1);
		Canvas.DrawRect(XBoxLine, Abs(X2 - X1), 8.0);
		Canvas.SetPos(X1, Y2);
		Canvas.DrawRect(XBoxLine, Abs(X2 - X1)+1, 8.0);
		Canvas.SetPos(X2, Y1);
		Canvas.DrawRect(YBoxLine, 8.0, Abs(Y2 - Y1));
		Canvas.SetPos(X1, Y1);
		Canvas.DrawRect(YBoxLine, 8.0, Abs(Y2 - Y1));
	}
}

simulated function switchInt(out int A, out int B)
{
local int n;

	n = A;
	A = B;
	B = n;
}

simulated function vector getVector(float X, float Y, float Z)
{
local vector V;

	V.X = X;
	V.Y = Y;
	V.Z = Z;
	return V;
}

simulated function Destroyed()
{
local byte i, j;

	if (IonLauncherCnvs != None)
		IonLauncherCnvs.Destroy();
	if (IonLauncher != None)
	{
		if (IonLauncher.IonEngFX != None)
		{
			IonLauncher.IonEngFX.Destroy();
			IonLauncher.IonEngFX = None;
		}
		if (IonLauncher.LaunchedRocket != None)
		{
			IonLauncher.LaunchedRocket.Abort();
			IonLauncher.LaunchedRocket = None;
		}
		IonLauncher.Abort();
		IonLauncher = None;
	}
	if (IonLauncherINFX != None)
		IonLauncherINFX.Destroy();
	if (IonSat != None && Role == ROLE_Authority)
		IonSat.ExplodeToBits();
		
	IonLauncherCnvs = None;
	IonLauncherINFX = None;
	IonSat = None;
		
	for (i = 0; i < ArrayCount(ChargingTriCircles); i++)
	{
		for (j = 0; j < ArrayCount(ChargingTriCircles[i].Part); j++)
		{
			if (ChargingTriCircles[i].Part[j] != None)
				ChargingTriCircles[i].Part[j].Destroy();
			ChargingTriCircles[i].Part[j] = None;
		}
	}
	
	Super.Destroyed();
}

//////////////////////////////////////////////////////////////////////////////////////////////////
state Zooming
{
	simulated function Tick(float DeltaTime)
	{
		if ( Pawn(Owner).bAltFire == 0 )
		{
			if ( (PlayerPawn(Owner) != None) && PlayerPawn(Owner).Player != None && PlayerPawn(Owner).Player.IsA('ViewPort') )
				PlayerPawn(Owner).StopZoom();
			SetTimer(0.0,False);
			GoToState('Idle');
		}
	}

	simulated function BeginState()
	{
		if ( PlayerPawn(Owner) != None)
		{
			if ( PlayerPawn(Owner).Player != None && PlayerPawn(Owner).Player.IsA('ViewPort') )
				PlayerPawn(Owner).ToggleZoom();
			SetTimer(0.2,True);
		}
		else
		{
			if (Pawn(Owner) != None)
			{
				Pawn(Owner).bFire = 1;
				Pawn(Owner).bAltFire = 0;
			}
			Global.Fire(0);
		}
	}
}

function float RateSelf(out int bUseAltMode)
{
local float dist;

    if (AmmoType.AmmoAmount <=0 || (satStatus != 0 && satStatus != 4))
        return -2;

    bUseAltMode = 0;
    if (Bot(Owner) != None && Bot(Owner).bSniping)
        return AIRating + 1.15;
    return AIRating;
}

function BotIonPainting(float Delta)
{
local Pawn P;
local rotator R;
local float minD;

	P = Pawn(Owner);
	if (!Class'NWUtils'.static.isElegibleBotAI(P, True) || (satStatus != 0 && satStatus != 4) || !checkDeployPriority(P))
		return;
		
	CountBot += Delta;
	if (CountBot >= 1.0)
	{
		CountBot = 0;
		R.Yaw = P.ViewRotation.Yaw;
		if (satStatus == 0)
		{
			minD = FMax(P.CollisionRadius, P.CollisionHeight) + Class'IonizerLauncher'.default.LauncherRadius;
			R = rotator(vector(R)*((zMaxDeployDist - minD)*FRand() + minD) - getVector(0,0, P.CollisionHeight + P.EyeHeight));
			if (!deployLauncher(True, False, R))
			{
				R = rot(0,0,0);
				R.Yaw = P.ViewRotation.Yaw;
				R = rotator(vector(R)*((zMaxDeployDist - minD)*0.25 + minD) - getVector(0,0, P.CollisionHeight + P.EyeHeight));
				if (!deployLauncher(True, False, R))
					return;
			}
		}
		else if (satStatus == 4 && AmmoType.AmmoAmount > 0)
		{
			R = rotator(vector(R)*(MaxAttackDistance*FRand()*FMin(1.0, 0.3 * P.Skill)) - getVector(0,0, P.CollisionHeight + P.EyeHeight));
			if (!checkAttackPoint(R))
			{
				R = rot(0,0,0);
				R.Yaw = P.ViewRotation.Yaw;
				R = rotator(vector(R)*500 - getVector(0,0, P.CollisionHeight + P.EyeHeight));
				if (!checkAttackPoint(R))
					return;
			}
		}
		
		if (P.Weapon != Self)
		{
			P.PendingWeapon = Self;
			P.ChangedWeapon();
			return;
		}
		
		if (IsInState('Active'))
		{
			bChangeWeapon = False;
			bWeaponUp = True;
			Finish();
		}

		P.ViewRotation = R;
		P.bAltFire = 0;
		P.bFire = 1;
		P.Weapon.Fire(5.0);
	}
}


state ClientFiring
{
	simulated function Tick(float Delta)
	{
	local float f;
	
		Global.Tick(Delta);
		if (!bPaintingTarget)
			return;
		
		if (AmbientSound != None)
		{
			f = IonPaintTime / ClientMaxPaintTime;
			if (f < 0.5)
				SoundVolume = Byte(128 * f * 2);
			else
				SoundVolume = Byte(128 * (1-f) * 2);
			SoundPitch = 32 + Byte(32 * f);
		}
		else
			AmbientSound = SatPaintingSnd;
			
		if (bPaintingTarget && (!bCanClientFire || Pawn(Owner) == None || Pawn(Owner).bFire == 0 || satStatus < 4))
			GotoState('');
		else if (isOwnerMoving())
		{
			IonPaintTime = 0.0;
			return;
		}
		else if (IonPaintTime < ClientMaxPaintTime)
		{
			IonPaintTime += Delta;
			if (IonPaintTime > ClientMaxPaintTime)
				IonPaintTime = ClientMaxPaintTime;
		}
	}

	simulated function AnimEnd()
	{
		if (bPaintingTarget)
			PlayAnim('Paint', 1.0, 0.0);
		else
			Super.AnimEnd();
	}
	
	simulated function BeginState()
	{
		SoundPitch = 32;
		if (bPaintingTarget)
			IonPaintTime = 0.0;
	}
	
	simulated function EndState()
	{
		SoundVolume = 0;
		SoundPitch = 32;
		AmbientSound = None;
	}
}

state NormalFire
{
	function Tick(float Delta)
	{
	local float f;
	
		Global.Tick(Delta);
		if (!bPaintingTarget)
			return;
		
		if (AmbientSound != None)
		{
			f = IonPaintTime / PaintTime;
			if (f < 0.5)
				SoundVolume = Byte(128 * f * 2);
			else
				SoundVolume = Byte(128 * (1-f) * 2);
			SoundPitch = 32 + Byte(32 * f);
		}
		else
			AmbientSound = SatPaintingSnd;
			
		if (Pawn(Owner) == None || satStatus < 4 || Pawn(Owner).bFire == 0 || (!Class'NWUtils'.static.isValidBot(Pawn(Owner)) && isOwnerMoving()))
		{
			Finish();
			return;
		}
		
		if (Class'NWUtils'.static.isValidBot(Pawn(Owner)))
			Pawn(Owner).ViewRotation = rotator(AttackPoint - (Owner.Location + getVector(0,0,Pawn(Owner).EyeHeight)));
		
		if (IonPaintTime < PaintTime)
		{
			IonPaintTime += Delta;
			if (IonPaintTime >= PaintTime)
			{
				SetStatus(5);
				AmmoType.UseAmmo(1);
				if (IonSat != None)
					IonSat.AttackSpot(AttackPoint);
				Finish();
			}
		}
	}

	function BeginState()
	{
		SoundPitch = 32;
		if (bPaintingTarget)
			IonPaintTime = 0.0;
	}

	function EndState()
	{
		bPaintingTarget = False;
		AmbientSound = None;
		SoundVolume = 0;
		SoundPitch = 32;
	}
	
	function AnimEnd()
	{
		if (!bPaintingTarget)
			Super.AnimEnd();
	}
}

auto state Pickup
{
ignores AnimEnd;

	function bool ValidTouch(Actor Other)
	{
	local bool isValid;
	local Pawn P;

		isValid = Super.ValidTouch(Other);
		P = Pawn(Other);
		if (isValid && P != None)
		{
			if (IonSat != None)
				IonSat.ChangeSatMaster(P);
			if (IonLauncher != None)
			{
				IonLauncher.Instigator = P;
				if (P.PlayerReplicationInfo != None)
					IonLauncher.SetTeamLights(P.PlayerReplicationInfo.Team);
			}
		}
		return isValid;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerPick
	CollisionHeight=20.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=10
	Icon=IonizerIcon
	InventoryGroup=10
	ItemArticle="an"
	ItemName="Ionizer"
	MaxDesireability=1.600000
	PickupMessage="You got the Ionizer"
	PickupSound=IonizerPickup
	PickupViewMesh=IonizerPick
	PickupViewScale=1.000000
	PlayerViewMesh=IonizerR
	PlayerViewOffset=(X=13.20000,Y=-4.200000,Z=-4.000000)
	WidePlayerViewOffset=(X=14.20000,Y=-4.200000,Z=-4.000000)
	CenterPlayerViewOffset=(X=12.50000,Y=0.840000,Z=-6.000000)
	WideCenterPlayerViewOffset=(X=13.50000,Y=0.840000,Z=-6.000000)
	PlayerViewScale=1.000000
	RespawnTime=90.000000
	StatusIcon=IonizerIcon
	ThirdPersonMesh=IonizerM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=None
	AltProjectileClass=None
	AmmoName=Class'IonizerAmmo'
	bInstantHit=True
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was ionized by %k's %w."
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	//FireSound=IonizerFire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Ionized
	NameColor=(R=128,G=0,B=255)
	PickupAmmoCount=1
	ProjectileClass=None
	SelectSound=IonizerSelect
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
	RefireRate=0.500000
	Mass=50.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=IonizerCross
	CustomCrossAlpha=IonizerCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Portable ion-satellite target painter.\n\nPrimary Fire: It does different things depending on the status of the satellite:\n- if not online: casts a launcher to send a new satellite up to the sky;\n- if online: paints the target the satellite should attack.\n\nSecondary Fire: Works as a zoom once the satellite is online."
	
	Texture=IonizerMetal
	
	PlayerViewMeshLeft=Ionizer
	PlayerViewMeshRight=IonizerR
	HandPartMeshL(0)=IonizerHandL
	HandPartMeshR(0)=IonizerHandR
	BobDamping=1.075000
	
	RenderOffsetSelect=(Y=-1.500000,Z=-2.000000)
	AnimMaxFrame=0.857129
	
	bMegaWeapon=True
	
	
	FirstPersonOverFX(0)=(bLit=True,OverTex1=Texture'Sk_IonizerPainter05')
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.550000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'IonizerScopeOVL',CustomMesh=Mesh'IonizerScopeOVR')
	
	FirstPersonOverFX(1)=(bLit=True,bEnviromentMode=True,OverMainTex=Texture'IonScopeGlass')
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=0.100000,bCustomMesh=True)
	FirstPersonOverFX(1)=(CustomMeshLeft=Mesh'IonizerScopeOVL',CustomMesh=Mesh'IonizerScopeOVR')
	
	PickupOverFX(0)=(bLit=True,OverTex1=Texture'Sk_IonizerPainter05')
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.550000,bCustomMesh=True)
	PickupOverFX(0)=(CustomMesh=Mesh'IonizerScopeOVP')
	
	PickupOverFX(1)=(bLit=True,bEnviromentMode=True,OverMainTex=Texture'IonScopeGlass')
	PickupOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=0.100000,bCustomMesh=True)
	PickupOverFX(1)=(CustomMesh=Mesh'IonizerScopeOVP')
	
	SoundRadius=32
	
	
	ZSatFont(0)=SatFontA
	ZSatFont(1)=SatFontB
	ZSatFont(2)=SatFontC
	ZSatFont(3)=SatFontD
	ZSatFont(4)=SatFontE
	ZSatFont(5)=SatFontF
	ZSatIcon=SatIcon
	ZSatScale=0.500000
	SatOfflineStr="No Signal"
	SatOnlineStr="Online"
	SatRequestStr="Building Ionizer Launch Station"
	SatLaunchCountdownStr="Launch in"
	SatLaunchedStr="Launch successful"
	ActiveSatelliteMoveStr="Moving to Objective"
	ActiveSatelliteFireStr="Charging"
	SatOfflineColor=(R=255,G=0,B=0)
	SatOnlineColor=(R=0,G=255,B=0)
	SatRequestColor=(R=255,G=128,B=0)
	SatLaunchCountdownColor=(R=255,G=128,B=0)
	SatLaunchedColor=(R=255,G=128,B=0)
	CountDownColor=(R=255,G=255,B=255)
	CountDownEndingColor=(R=255,G=0,B=0)
	ActiveSatelliteColor=(R=128,G=0,B=255)
	CountDownFont(0)=IonizerDSDigitalSmallA
	CountDownFont(1)=IonizerDSDigitalSmallB
	CountDownFont(2)=IonizerDSDigitalSmallC
	CountDownFont(3)=IonizerDSDigitalSmallD
	CountDownFont(4)=IonizerDSDigitalSmallE
	CountDownFont(5)=IonizerDSDigitalSmallF
	DeployAcceptedSnd=IonPainterDeploy
	DeployDeniedSnd=IonPainterNoDeploy
	IonSecondSnd=IonSecond
	SatPaintingSnd=IonizerPainting
	
	LaserRedTex=IonLaserTraceRed01
	DotRedTex=IonLaserDotRed01
	LaserGreenTex=IonLaserTraceGreen01
	DotGreenTex=IonLaserDotGreen01
	
	ZoomFont(0)=IonizerDSDigitalA
	ZoomFont(1)=IonizerDSDigitalB
	ZoomFont(2)=IonizerDSDigitalC
	ZoomFont(3)=IonizerDSDigitalD
	ZoomFont(4)=IonizerDSDigitalE
	ZoomFont(5)=IonizerDSDigitalF
	XBoxLine=IonizerXTrace
	YBoxLine=IonizerYTrace
	ZoomTexParts(0)=IonizerScope01
	ZoomTexParts(1)=IonizerScope02
	ZoomTexParts(2)=IonizerScope03
	ZoomTexParts(3)=IonizerScope04
	ZoomCrossParts(0)=IonizerScopeCross01
	ZoomCrossParts(1)=IonizerScopeCross02
	ZoomCrossParts(2)=IonizerScopeCross03
	ZoomCrossParts(3)=IonizerScopeCross04
	GlassScopeTex=RedScope
	DarkBackground=IonScopeBack
	StaticBackground=IonizerStatic01
	ZoomInSnd=IonizerZoomIn
	ZoomOutSnd=IonizerZoomOut
	GenericDeniedSnd=IonFunctDenied
	SatOnlineSnd=SatOnline
	SatPaintFireSnd=SatPaintFire
	
	ScopeMsgColor=(R=192,G=192,B=192)
	ScopeMsgOffsetX=80
	ScopeMsgOffsetY=96
	ScopeMsgFont(0)=IonizerDSDigitalA
	ScopeMsgFont(1)=IonizerDSDigitalB
	ScopeMsgFont(2)=IonizerDSDigitalC
	ScopeMsgFont(3)=IonizerDSDigitalD
	ScopeMsgFont(4)=IonizerDSDigitalE
	ScopeMsgFont(5)=IonizerDSDigitalF
	
	TriCirclesRollRate=5000
	ChargingTriCircles(0)=(Tex=Texture'IonizerTriCirclePattern01',TexFinal=Texture'IonizerTriCirclePattern01Final',DScale=2.000000,SGlow=1.000000,InCoef=0.000000,OutCoef=0.200000)
	ChargingTriCircles(1)=(Tex=Texture'IonizerTriCirclePattern02',TexFinal=Texture'IonizerTriCirclePattern02Final',DScale=4.000000,SGlow=1.000000,InCoef=0.200000,OutCoef=0.600000)
	ChargingTriCircles(2)=(Tex=Texture'IonizerTriCirclePattern03',TexFinal=Texture'IonizerTriCirclePattern03Final',DScale=10.000000,SGlow=1.000000,InCoef=0.450000,OutCoef=0.800000)
	ChargingTriCircles(3)=(Tex=Texture'IonizerTriCirclePattern04',TexFinal=Texture'IonizerTriCirclePattern04Final',DScale=20.000000,SGlow=1.000000,InCoef=0.60000,OutCoef=1.000000)
	ChargingTriCircles(4)=(Tex=Texture'IonizerTriCirclePattern05',TexFinal=Texture'IonizerTriCirclePattern05Final',DScale=30.000000,SGlow=1.000000,InCoef=0.00000,OutCoef=1.000000)
	
	NoZoomMessageStr="The Ionizer satellite must be online to be able to use zoom"
	CannotFireMessageStr="The Ionizer satellite must be online to be able the painter function"
	CannotAttackMessageStr="Invalid attack point"
	DeploymentDeniedStr="Cannot deploy station"
	DeploymentBadAngleStr="Bad surface angle"
	DeploymentBadHeight="Launch height too short"
	DeploymentTooCloseStr="Too close"
	DeploymentTooFarStr="Too far"
	
	DeployAIPriority=25
	
	
	ZoomScanRadius=25000.000000
	MinSatelliteHeight=3000.000000
	MaxSatelliteHeight=40000.000000
	MaxSatelliteDeployDist=1024.000000
	SatelliteLaunchSeconds=5
	LauncherLifespan=5.000000
	enableSatLights=True
	PaintTime=1.000000
	MaxAttackDistance=50000.000000
	IonDebrisRate=25.000000
	IonDebrisAmountPerUpdate=8
	IonLightningsRate=5.000000
	IonLightingsAmountPerUpdate=5
	SatelliteArmor=850
	SatelliteIsInvincible=False
	SatelliteAIAwareness=True
	RocketTakeoffIgnitionDamage=0
	
	ZoomObjectsList(0)=(ObjectType="Pawn",ObjectBoxColor=(R=0,G=255,B=255))
	ZoomObjectsList(1)=(ObjectType="Bot",ObjectBoxColor=(R=255,G=255,B=255))
	ZoomObjectsList(2)=(ObjectType="ScriptedPawn",ObjectBoxColor=(R=128,G=0,B=255))
	ZoomObjectsList(3)=(ObjectType="PlayerPawn",ObjectBoxColor=(R=255,G=255,B=255))
	ZoomObjectsList(4)=(ObjectType="WarShell",ObjectBoxColor=(R=255,G=0,B=0))
	ZoomObjectsList(5)=(ObjectType="DumbRocket",ObjectBoxColor=(R=255,G=0,B=0))
	ZoomObjectsList(6)=(ObjectType="StrangeShell",ObjectBoxColor=(R=255,G=0,B=0))
	ZoomObjectsList(7)=(ObjectType="NuclearMissile",ObjectBoxColor=(R=255,G=0,B=0))
	ZoomObjectsList(8)=(ObjectType="TranslocatorTarget",ObjectBoxColor=(R=0,G=255,B=0))
	ZoomObjectsList(9)=(ObjectType="RTTrans",ObjectBoxColor=(R=0,G=255,B=0))
	
	ZoomListExceptions(0)=FortStandard
	ZoomListExceptions(1)=FlockPawn
	ZoomListExceptions(2)=FlockMasterPawn
}
