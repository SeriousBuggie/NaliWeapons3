//////////////////////////////////////////////////////////////
//	Nali Weapons III InfraRed Precision Rifle (I.R.P.R.) weapon
//				Feralidragon (07-11-2010)
//
// NW3 INFRARED PRECISION RIFLE 1.00
//////////////////////////////////////////////////////////////

class IRPR expands NaliWeapons config(NWeaponsCfg);


//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=IRPR ANIVFILE=MODELS\IRPR_a.3d DATAFILE=MODELS\IRPR_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPR STRENGTH=0
#exec MESH ORIGIN MESH=IRPR X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=IRPRR ANIVFILE=MODELS\IRPR_a.3d DATAFILE=MODELS\IRPR_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=IRPRR STRENGTH=0
#exec MESH ORIGIN MESH=IRPRR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=IRPRPick ANIVFILE=MODELS\IRPR_a.3d DATAFILE=MODELS\IRPR_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IRPRPick STRENGTH=0
#exec MESH ORIGIN MESH=IRPRPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=IRPRM ANIVFILE=MODELS\IRPR_a.3d DATAFILE=MODELS\IRPR_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRM STRENGTH=0.45
#exec MESH ORIGIN MESH=IRPRM X=320 Y=0 Z=-20 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=IRPR SEQ=All STARTFRAME=0 NUMFRAMES=25
#exec MESH SEQUENCE MESH=IRPR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPR SEQ=Fire STARTFRAME=0 NUMFRAMES=12 RATE=12.0
#exec MESH SEQUENCE MESH=IRPR SEQ=AltFire STARTFRAME=11 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=IRPR SEQ=Select STARTFRAME=18 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IRPR SEQ=Down STARTFRAME=12 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IRPRR SEQ=All STARTFRAME=0 NUMFRAMES=25
#exec MESH SEQUENCE MESH=IRPRR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRR SEQ=Fire STARTFRAME=0 NUMFRAMES=12 RATE=12.0
#exec MESH SEQUENCE MESH=IRPRR SEQ=AltFire STARTFRAME=11 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=IRPRR SEQ=Select STARTFRAME=18 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IRPRR SEQ=Down STARTFRAME=12 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IRPRPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=IRPRM SEQ=All STARTFRAME=0 NUMFRAMES=22
#exec MESH SEQUENCE MESH=IRPRM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRM SEQ=Fire STARTFRAME=0 NUMFRAMES=12 RATE=12.0
#exec MESH SEQUENCE MESH=IRPRM SEQ=AltFire STARTFRAME=11 NUMFRAMES=2 RATE=2.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=IRPR MESH=IRPR
#exec MESHMAP SCALE MESHMAP=IRPR X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=IRPRR MESH=IRPRR
#exec MESHMAP SCALE MESHMAP=IRPRR X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=IRPRPick MESH=IRPRPick
#exec MESHMAP SCALE MESHMAP=IRPRPick X=0.1425 Y=0.1425 Z=0.285

#exec MESHMAP NEW MESHMAP=IRPRM MESH=IRPRM
#exec MESHMAP SCALE MESHMAP=IRPRM X=0.1125 Y=0.1125 Z=0.225

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=IRPR_Sk01 FILE=SKINS\IRPR_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPR NUM=1 TEXTURE=IRPR_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=IRPRR NUM=1 TEXTURE=IRPR_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=IRPRPick NUM=1 TEXTURE=IRPR_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=IRPRM NUM=1 TEXTURE=IRPR_Sk01

#exec TEXTURE IMPORT NAME=IRPR_Sk02 FILE=SKINS\IRPR_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPR NUM=2 TEXTURE=IRPR_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=IRPRR NUM=2 TEXTURE=IRPR_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=IRPRPick NUM=2 TEXTURE=IRPR_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=IRPRM NUM=2 TEXTURE=IRPR_Sk02

#exec TEXTURE IMPORT NAME=IRPR_Sk03 FILE=SKINS\IRPR_Sk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPR NUM=3 TEXTURE=IRPR_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=IRPRR NUM=3 TEXTURE=IRPR_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=IRPRPick NUM=3 TEXTURE=IRPR_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=IRPRM NUM=3 TEXTURE=IRPR_Sk03

#exec TEXTURE IMPORT NAME=IRPR_Sk04 FILE=SKINS\IRPR_Sk04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPR NUM=4 TEXTURE=IRPR_Sk04
#exec MESHMAP SETTEXTURE MESHMAP=IRPRR NUM=4 TEXTURE=IRPR_Sk04
#exec MESHMAP SETTEXTURE MESHMAP=IRPRPick NUM=4 TEXTURE=IRPR_Sk04
#exec MESHMAP SETTEXTURE MESHMAP=IRPRM NUM=4 TEXTURE=IRPR_Sk04

#exec TEXTURE IMPORT NAME=IRPRAmmoSk01 FILE=SKINS\IRPRAmmoSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPR NUM=5 TEXTURE=IRPRAmmoSk01
#exec MESHMAP SETTEXTURE MESHMAP=IRPRR NUM=5 TEXTURE=IRPRAmmoSk01
#exec MESHMAP SETTEXTURE MESHMAP=IRPRPick NUM=5 TEXTURE=IRPRAmmoSk01
#exec MESHMAP SETTEXTURE MESHMAP=IRPRM NUM=5 TEXTURE=IRPRAmmoSk01

#exec TEXTURE IMPORT NAME=IRPRMetal FILE=SKINS\IRPRMetal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=IRPRIcon FILE=ICONS\IRPRIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IRPRCrossAlpha FILE=ICONS\IRPRCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\IRPRIcons.utx PACKAGE=NWIRPRVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="IRPRPickup" FILE=SOUNDS\IRPRPickup.wav GROUP="IRPR"
#exec AUDIO IMPORT NAME="IRPRSelect" FILE=SOUNDS\IRPRSelect.wav GROUP="IRPR"
#exec AUDIO IMPORT NAME="IRPRFire" FILE=SOUNDS\IRPRFire.wav GROUP="IRPR"
#exec AUDIO IMPORT NAME="IRPRScopeOn" FILE=SOUNDS\IRPRScopeOn.wav GROUP="IRPR"
#exec AUDIO IMPORT NAME="IRPRScopeOff" FILE=SOUNDS\IRPRScopeOff.wav GROUP="IRPR"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=IRPRHandL ANIVFILE=MODELS\IRPRHand_a.3d DATAFILE=MODELS\IRPRHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRHandL STRENGTH=0
#exec MESH ORIGIN MESH=IRPRHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=IRPRHandR ANIVFILE=MODELS\IRPRHand_a.3d DATAFILE=MODELS\IRPRHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=IRPRHandR STRENGTH=0
#exec MESH ORIGIN MESH=IRPRHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=IRPRHandL SEQ=All STARTFRAME=0 NUMFRAMES=25
#exec MESH SEQUENCE MESH=IRPRHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRHandL SEQ=Fire STARTFRAME=0 NUMFRAMES=12 RATE=12.0
#exec MESH SEQUENCE MESH=IRPRHandL SEQ=AltFire STARTFRAME=11 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=IRPRHandL SEQ=Select STARTFRAME=18 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IRPRHandL SEQ=Down STARTFRAME=12 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IRPRHandR SEQ=All STARTFRAME=0 NUMFRAMES=25
#exec MESH SEQUENCE MESH=IRPRHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRHandR SEQ=Fire STARTFRAME=0 NUMFRAMES=12 RATE=12.0
#exec MESH SEQUENCE MESH=IRPRHandR SEQ=AltFire STARTFRAME=11 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=IRPRHandR SEQ=Select STARTFRAME=18 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IRPRHandR SEQ=Down STARTFRAME=12 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=IRPRHandL MESH=IRPRHandL
#exec MESHMAP SCALE MESHMAP=IRPRHandL X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=IRPRHandR MESH=IRPRHandR
#exec MESHMAP SCALE MESHMAP=IRPRHandR X=0.045 Y=0.045 Z=0.09

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=IRPRHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=IRPRHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//SCOPE OVERLAYER MESHES
//*******************************************************
#exec MESH IMPORT MESH=IRPRScopeOvL ANIVFILE=MODELS\IRPRScopeOv_a.3d DATAFILE=MODELS\IRPRScopeOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IRPRScopeOvL STRENGTH=0
#exec MESH ORIGIN MESH=IRPRScopeOvL X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=IRPRScopeOvR ANIVFILE=MODELS\IRPRScopeOv_a.3d DATAFILE=MODELS\IRPRScopeOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=IRPRScopeOvR STRENGTH=0
#exec MESH ORIGIN MESH=IRPRScopeOvR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=IRPRScopeOvP ANIVFILE=MODELS\IRPRScopeOv_a.3d DATAFILE=MODELS\IRPRScopeOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IRPRScopeOvP STRENGTH=0
#exec MESH ORIGIN MESH=IRPRScopeOvP X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=IRPRScopeOvL SEQ=All STARTFRAME=0 NUMFRAMES=25
#exec MESH SEQUENCE MESH=IRPRScopeOvL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRScopeOvL SEQ=Fire STARTFRAME=0 NUMFRAMES=12 RATE=12.0
#exec MESH SEQUENCE MESH=IRPRScopeOvL SEQ=AltFire STARTFRAME=11 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=IRPRScopeOvL SEQ=Select STARTFRAME=18 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IRPRScopeOvL SEQ=Down STARTFRAME=12 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IRPRScopeOvR SEQ=All STARTFRAME=0 NUMFRAMES=25
#exec MESH SEQUENCE MESH=IRPRScopeOvR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRScopeOvR SEQ=Fire STARTFRAME=0 NUMFRAMES=12 RATE=12.0
#exec MESH SEQUENCE MESH=IRPRScopeOvR SEQ=AltFire STARTFRAME=11 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=IRPRScopeOvR SEQ=Select STARTFRAME=18 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=IRPRScopeOvR SEQ=Down STARTFRAME=12 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=IRPRScopeOvP SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=IRPRScopeOvL MESH=IRPRScopeOvL
#exec MESHMAP SCALE MESHMAP=IRPRScopeOvL X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=IRPRScopeOvR MESH=IRPRScopeOvR
#exec MESHMAP SCALE MESHMAP=IRPRScopeOvR X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=IRPRScopeOvP MESH=IRPRScopeOvP
#exec MESHMAP SCALE MESHMAP=IRPRScopeOvP X=0.1425 Y=0.1425 Z=0.285

#exec TEXTURE IMPORT NAME=ScopeGlass FILE=SKINS\ScopeGlass.bmp GROUP=Skins LODSET=2

//===========================================================================

//Zoom stuff
#exec TEXTURE IMPORT NAME=ScopeBack FILE=ICONS\ScopeBack.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=ScopeN01 FILE=ICONS\ScopeN01.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=ScopeN02 FILE=ICONS\ScopeN02.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=ScopeN03 FILE=ICONS\ScopeN03.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=ScopeN04 FILE=ICONS\ScopeN04.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=GreenScope FILE=ICONS\GreenScope.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IRPR_Beacon_R FILE=ICONS\IRPR_Beacon_R.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IRPR_Beacon_B FILE=ICONS\IRPR_Beacon_B.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IRPR_Beacon_G FILE=ICONS\IRPR_Beacon_G.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IRPR_Beacon_Y FILE=ICONS\IRPR_Beacon_Y.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IRPR_Beacon_F FILE=ICONS\IRPR_Beacon_F.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=IRPR_Beacon_E FILE=ICONS\IRPR_Beacon_E.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\IRPRStatic.utx PACKAGE=NWIRPRVIII_SRC.StaticScope

//Fonts
#exec NEW TRUETYPEFONTFACTORY NAME=DSDigitalA FONTNAME="DS-Digital" HEIGHT=20 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=DSDigitalB FONTNAME="DS-Digital" HEIGHT=24 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=DSDigitalC FONTNAME="DS-Digital" HEIGHT=28 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=DSDigitalD FONTNAME="DS-Digital" HEIGHT=32 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=DSDigitalE FONTNAME="DS-Digital" HEIGHT=36 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=DSDigitalF FONTNAME="DS-Digital" HEIGHT=40 ANTIAlIAS=TRUE

//===========================================================================

#exec TEXTURE IMPORT NAME=BodyHeatTex FILE=Skins\BodyHeatTex.bmp GROUP=Misc FLAGS=2


var(ClientConfig) config bool bFirstPersonShotFX;

var(ServerConfig) config float MaxWallthroughDepth;
var(ServerConfig) config int MaxWallthroughShots;
var(ServerConfig) config byte MaxWallthroughPrecision;
var(ServerConfig) config bool bReduceDamageByWallthrough;
var(ServerConfig) config int HeadShotDmg;
var(ServerConfig) config float ZoomInViewRange, ZoomOutViewRange;
var(ServerConfig) config bool enableServerShotOnZP;
var(ServerConfig) config bool enableZoomGreenIRGlass;
var(ServerConfig) config bool enableZoomIR;
var(ServerConfig) config bool enableTraceBeam;
var float maxWTDepth;
var int maxWTShots;
var byte maxWTPrecision;
var bool bZoomGreenIRGlass, bZoomIR, bTraceBeam;

struct HeatStruct
{
	var() name HeatObjectType;
	var() float AmountOfHeat;
	var() bool bFadingHeat;
};

var(ServerConfig) config HeatStruct SensedHeatObjects[32];
var HeatStruct SensedObjectsSaved[32];
var(ServerConfig) config name NonSensedObjects[32];
var name NonObjectsSaved[32];
var int maxSensedHeatClasses, maxNonSensedHeatClasses;
var bool bInvertLists;

var(ServerConfig) config bool bPlayersAlwaysRelevant;
var(ServerConfig) config bool enableWallThroughZoom;
var bool enWallTZoom;

var(ServerConfig) config bool enableScopeTeamMarkers;
var(ServerConfig) config bool enableScopeEnemyMarkers;
var(ServerConfig) config bool enableScopeFriendlyMarkers;
var bool bScopeTeamMarkers, bScopeEnemyMarkers, bScopeFriendlyMarkers;

var(ServerConfig) config bool enableTeamColoredLaser;
var(ServerConfig) config bool bAlwaysTeamColoredLaser;
enum ELaserColor
{
	LC_Red,
	LC_Blue,
	LC_Green,
	LC_Yellow
};
var(ServerConfig) config ELaserColor defaultLaserColor;
var ELaserColor laserColor;
var bool bTeamColoredL;

var() int ShotDamage;
var() class<IRPRLightEffectGNDR> LightFXGNDClass[4];
var() class<IRPRDecalFXR> DecalFXClass[4];
var() class<IRPRLightEffectCorR> LightFXCorClass[4];
var IRPRLightEffectCorR IRPRCor;
var float IRPRCorCount;
var float actualZoomIn, actualZoomOut;
var vector OwnerLocation;

//Zoom stuff
var(Zoom) Font ZoomFont[6];
var(Zoom) texture ZoomTexParts[4];
var(Zoom) texture GreenScopeTex;
var(Zoom) texture DarkBackground;
var(Zoom) texture StaticBackground;
var(Zoom) sound ZoomInSnd, ZoomOutSnd;
var(Zoom) texture TeamMarkerTex[4], FriendMarkerTex, EnemyMarkerTex;
var(Zoom) color TeamMarkerColor[4], FriendMarkerColor, EnemyMarkerColor;
var bool bZoomIn;
var float StillTime, StillStart;
var bool bGlobalSniping, bMHGame, bTeamGame;
var bool bStartingShot, bEndingShot;
var float remainingDistance, remainingWallThickness;
var NWPoint pnt;

//ZP stuff
struct MShot
{
	var Actor Other;
	var vector Loc, HitLoc, HitNorm;
	var float remWThick;
};

struct MGhost
{
	var Actor Other;
	var bool bBlkActors, bBlkPlayers, bProjTgt;
};

var byte lvlCount;
var float curRemWThick;


//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime;
var(Oversurrection) config float OversurrectionTurretRotRate, OversurrectionFireCycleRate;
var(Oversurrection) config float OversurrectionLaserPrepareTime, OversurrectionLaserCooldownTime, OversurrectionLaserFireMaxTime;
var(Oversurrection) config float OversurrectionScanEnemiesRadius, OversurrectionRangedEnemiesPeriph, OversurrectionAttackMinPeriph;
var(Oversurrection) config int OversurrectionLaserDamage, OversurrectionMaxWTTraces, OversurrectionMaxWTTracePrecision;
var(Oversurrection) config float OversurrectionMaxTraceRange, OversurrectionMaxWTTraceDepth, OversurrectionStopFireOdds;



replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		actualZoomIn, actualZoomOut, SensedObjectsSaved, NonObjectsSaved, enWallTZoom, bScopeTeamMarkers,
		bScopeEnemyMarkers, bScopeFriendlyMarkers, laserColor, bTeamColoredL, bMHGame, bTeamGame,
		maxSensedHeatClasses, maxNonSensedHeatClasses, bInvertLists, bZoomGreenIRGlass, bZoomIR;
	reliable if (Role == ROLE_Authority)
		bGlobalSniping, maxWTDepth, maxWTShots, maxWTPrecision, bTraceBeam;
	reliable if (Role < ROLE_Authority)
		ServerProcessMultiTrace;
}


function PreBeginPlay()
{
local byte i;

	Super.PreBeginPlay();
	actualZoomIn = default.ZoomInViewRange;
	actualZoomOut = default.ZoomOutViewRange;
	enWallTZoom = default.enableWallThroughZoom;
	bMHGame = Class'NWUtils'.static.isMonsterGame(Level);
	bTeamGame = Level.Game.bTeamGame;
	bScopeTeamMarkers = (default.enableScopeTeamMarkers && bTeamGame && !bMHGame);
	bScopeEnemyMarkers = default.enableScopeEnemyMarkers;
	bScopeFriendlyMarkers = default.enableScopeFriendlyMarkers;
	bTeamColoredL = (default.enableTeamColoredLaser && (default.bAlwaysTeamColoredLaser || Level.Game.bTeamGame));
	laserColor = default.defaultLaserColor;
	bInvertLists = default.bInvertListsProcessing;
	
	maxWTDepth = default.MaxWallthroughDepth;
	maxWTShots = default.MaxWallthroughShots;
	maxWTPrecision = default.MaxWallthroughPrecision;
	bZoomGreenIRGlass = default.enableZoomGreenIRGlass;
	bZoomIR = default.enableZoomIR;
	bTraceBeam = default.enableTraceBeam;
	
	for (i = 0; i < ArrayCount(SensedObjectsSaved); i++)
		SensedObjectsSaved[i] = SensedHeatObjects[i];
	for (i = 0; i < ArrayCount(NonObjectsSaved); i++)
		NonObjectsSaved[i] = NonSensedObjects[i];
	
	if (Level.NetMode != NM_StandAlone && default.bPlayersAlwaysRelevant && enWallTZoom)
		AddAuxMutator(Class'IRPRViewMut');
	LoadLists();
}

function LoadLists()
{
local int i;

	maxSensedHeatClasses = ArrayCount(SensedObjectsSaved);
	maxNonSensedHeatClasses = ArrayCount(NonObjectsSaved);
	if (default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(SensedObjectsSaved); i++)
		{
			if (SensedObjectsSaved[i].HeatObjectType == '')
			{
				maxSensedHeatClasses = i;
				break;
			}
		}
		
		for (i = 0; i < ArrayCount(NonObjectsSaved); i++)
		{
			if (NonObjectsSaved[i] == '')
			{
				maxNonSensedHeatClasses = i;
				break;
			}
		}
	}
}

simulated function PlayFiring()
{
local vector X, Y, Z, Loc;

	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*4.5);
	PlayAnim('Fire', GetFirerateMult() * 1.0, 0.0);
	
	if (default.bFirstPersonShotFX)
	{
		if (IRPRCor != None)
			IRPRCor.Destroy();
		IRPRCor = None;
		
		if (PlayerPawn(Owner) != None)
		{
			GetAxes(Pawn(Owner).ViewRotation,X,Y,Z);
			Loc = Owner.Location + CalcNewDrawOffset() + FireOffset.X * X + FireOffset.Y * Y + FireOffset.Z * Z;
			Loc += ((vect(-96,0,0) >> Pawn(Owner).ViewRotation) + ((vect(1,0,0)*class'IRPRTrace'.default.TraceLength/2) >> Pawn(Owner).ViewRotation));
			
			IRPRCor = Spawn(LightFXCorClass[getLaserTeam()],,, Loc);
			IRPRCorCount = Class'IRPRLightEffectCorR'.default.LifeSpan;
		}
	}
}

simulated function TraceFire(float Accuracy)
{
local vector HitLocation, HitNormal, StartTrace, FirstTrace, EndTrace, X,Y,Z;
local vector LastHitLoc, StartExtra;
local actor Other;
local Pawn PawnOwner;
local float precisionDist, precisionComp;
local bool bSniping;
local bool hitSomeone, canWallIn;
local int i, otherIndex;
local bool bClientZPFire;
local float AccY, AccZ;
local MShot Others[48];
local vector fOffset;
	
	bClientZPFire = (Level.NetMode != NM_StandAlone && enableZP && !forceServerHitscan && PlayerPawn(Owner) != None &&
		Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.Ping < maxZPPing);
	if ((Role < ROLE_Authority && (!bClientZPFire || PlayerPawn(Owner) == None || Viewport(PlayerPawn(Owner).Player) == None)) 
	|| (Role == ROLE_Authority && bClientZPFire))
		return;
		
	if (bClientZPFire && Role < ROLE_Authority)
	{
		if (!bAltHitscan && zpAccServerSyncID != zpAccClientSyncID)
		{
			zpAccClientSyncID = zpAccServerSyncID;
			CurAccuracySelector = zpAccServerSyncVal;
		}
		else if (bAltHitscan && zpAccServerSyncIDAlt != zpAccClientSyncIDAlt)
		{
			zpAccClientSyncIDAlt = zpAccServerSyncIDAlt;
			CurAccuracySelectorAlt = zpAccServerSyncValAlt;
		}
	}
	
	if (bAltHitscan)
		fOffset = AltFireOffset;
	else
		fOffset = FireOffset;

    PawnOwner = Pawn(Owner);
    Owner.MakeNoise(PawnOwner.SoundDampening);
    GetAxes(PawnOwner.ViewRotation ,X, Y, Z);
	ProcessAccuracyYZ(bAltHitscan, Accuracy, AccY, AccZ);
	bSniping = (PawnOwner.bZoom != 0 || (PlayerPawn(Owner) != None && (PlayerPawn(Owner).DesiredFOV != PlayerPawn(Owner).DefaultFOV || PlayerPawn(Owner).bZooming)) || (Bot(Owner) != None && Bot(Owner).bSniping));
	bSniping = bSniping || bGlobalSniping;

	//Shot initialization
	i = maxWTShots;
	remainingWallThickness = maxWTDepth;
	if (Role == ROLE_Authority)
		remainingDistance = MaxTraceRange;
	else
		remainingDistance = ClientMaxTraceRange;
	if (remainingDistance <= 0)
		return;
		
	if (pnt == None && maxWTDepth > 0 && maxWTShots > 0)
	{
		pnt = Spawn(Class'NWPoint');
		if (pnt == None || pnt.bDeleteMe)
			return;
		pnt.SetCollisionSize(0,0);
		pnt.bCollideWorld = True;
	}
	
	do
	{
		//Starting position
		if (i == maxWTShots)
		{
			StartTrace = Owner.Location;
			if (bSniping)
				StartTrace += (PawnOwner.Eyeheight * vect(0,0,1));
			else
				StartTrace += (CalcNewDrawOffset() + (fOffset >> PawnOwner.ViewRotation));
			AdjustedAim = PawnOwner.AdjustAim(1000000, StartTrace, 2*AimError, False, False); 
			X = vector(AdjustedAim);
			EndTrace = StartTrace + GetVectorialAccuracy(Accuracy, Y, Z, AccY, AccZ);
			StartExtra = (vect(-96,0,0) >> PawnOwner.ViewRotation) + ((vect(1,0,0)*class'IRPRTrace'.default.TraceLength/2) >> PawnOwner.ViewRotation);
			if (bSniping)
			{
				if (PawnOwner.bDuck != 0)
					StartExtra -= (FMin(PawnOwner.CollisionHeight/2,10) * Z);
				else
					StartExtra -= (PawnOwner.Eyeheight/2 * Z);
			}
			
			EndTrace = StartTrace + (remainingDistance * X);
			FirstTrace = StartTrace;
		}
		else
		{
			StartExtra = vect(0,0,0);
			StartTrace = HitLocation;
			precisionDist = maxWTDepth / (1.f * maxWTPrecision);
			canWallIn = False;
			while (!canWallIn && remainingWallThickness > 0)
			{
				StartTrace += (precisionDist * X);
				remainingWallThickness -= precisionDist;
				remainingDistance -= precisionDist;
				if (pnt.SetLocation(StartTrace))
					canWallIn = True;
			}
			
			if (!canWallIn)
				break;
			
			Other = Trace(HitLocation, HitNormal, StartTrace - maxWTDepth*X, StartTrace, False);
			if (Other == None)
			{
				HitLocation = StartTrace - maxWTDepth*X;
				HitNormal = Normal(X);
			}
			else
				ProcessTraceHit(Other, HitLocation, HitNormal, -X, Y, Z);
			
			precisionComp = VSize(StartTrace - HitLocation + HitNormal*2);
			remainingDistance += precisionComp;
			remainingWallThickness += precisionComp;
			StartTrace = HitLocation + HitNormal*2;
		}
		
		//Shot
		hitSomeone = False;
		ForEach TraceActors(Class'Actor', Other, HitLocation, HitNormal, EndTrace, StartTrace)
		{
			if (Other != Instigator)
			{
				if (Role < ROLE_Authority && otherIndex < ArrayCount(Others) && 
				(Other == Level || Mover(Other) != None || Other.bProjTarget || Other.bBlockActors || Other.bBlockPlayers))
				{
					Others[otherIndex].Other = Other;
					if (Other != Level)
					{
						Others[otherIndex].Loc = Other.Location;
						Others[otherIndex].HitLoc = HitLocation;
						Others[otherIndex].HitNorm = HitNormal;
						Others[otherIndex].remWThick = remainingWallThickness;
					}
					otherIndex++;
				}
				if (Other.bProjTarget || Other.bBlockActors || Other.bBlockPlayers)
					ProcessTraceHit(Other, HitLocation, HitNormal, X,Y,Z);
				hitSomeone = True;
			}
			
			LastHitLoc = HitLocation;
		}
		
		if (!hitSomeone)
		{
			HitLocation = EndTrace;
			LastHitLoc = EndTrace;
			HitNormal = Normal(StartTrace - EndTrace);
		}
		remainingDistance -= VSize(LastHitLoc - StartTrace);
		
		//Process shot
		bStartingShot = (i == maxWTShots);
		bEndingShot = (i <= 0 || remainingWallThickness <= 0 || remainingDistance <= 0);
		ProcessWaterFX(Other, LastHitLoc, StartTrace);
		ProcessOther(Other, LastHitLoc, HitNormal, StartTrace + StartExtra);
		i--;
	}
	until (i < 0 || remainingWallThickness <= 0 || remainingDistance <= 0);
	
	if (Role < ROLE_Authority && bClientZPFire)
		ServerProcessMultiTrace(bAltHitscan, Others, FirstTrace, Owner.Location, Pawn(Owner).ViewRotation, Accuracy, AccY, AccZ);
}

function vector GetZPValidityStartTrace(bool isAltFire, vector OwnerClientLoc, rotator OwnerClientVRot)
{
local vector StartTrace;
local bool bSniping;
local vector fOffset;

	if (PlayerPawn(Owner) == None)
		return vect(0,0,0);
		
	if (isAltFire)
		fOffset = AltFireOffset;
	else
		fOffset = FireOffset;
		
	bSniping = (Pawn(Owner).bZoom != 0 || (PlayerPawn(Owner) != None && (PlayerPawn(Owner).DesiredFOV != PlayerPawn(Owner).DefaultFOV || PlayerPawn(Owner).bZooming)));
	bSniping = bSniping || bGlobalSniping;

	StartTrace = OwnerClientLoc;
	if (bSniping)
		StartTrace += (Pawn(Owner).Eyeheight * vect(0,0,1));
	else
		StartTrace += (CalcNewDrawOffset() + (fOffset >> OwnerClientVRot));
	return StartTrace;
}

final function ServerProcessMultiTrace(private bool isAltFire, private MShot Others[48], private vector StartTrace, private vector OwnerClientLoc, private rotator OwnerClientVRot, 
private float Accuracy, private float AccY, private float AccZ)
{
local private vector X, Y, Z, HitLoc;
local private bool useZP, allowMultiZP;
local private byte useStandard, i, maxOthers;
local private MGhost Ghosts[48];

	bAltHitscan = isAltFire;
	if (Others[0].Other == None)
		return;
	
	curRemWThick = -1;
	allowMultiZP = isValidZPShot(isAltFire, Others[0].Other, Others[0].HitLoc, StartTrace, Others[0].Loc, OwnerClientLoc, OwnerClientVRot, Accuracy, AccY, AccZ, useStandard, 0xfff0);
	if (!allowMultiZP)
		return;
	
	lvlCount = 0;
	for (i = 0; i < ArrayCount(Others) && lvlCount <= maxWTShots; i++)
	{
		maxOthers = i;
		if (Others[i].Other == None)
		{
			maxOthers--;
			break;
		}
		
		curRemWThick = Others[i].remWThick;
		useZP = isValidZPShot(isAltFire, Others[i].Other, Others[i].HitLoc, StartTrace, Others[i].Loc, OwnerClientLoc, OwnerClientVRot, Accuracy, AccY, AccZ, useStandard, 0x010f);
		if (!useZP)
			Others[i].Other = None;
		else if (Others[i].Other == Level || Mover(Others[i].Other) != None)
			lvlCount++;
		else
		{
			Ghosts[i].Other = Others[i].Other;
			if (enableServerShotOnZP)
			{
				Ghosts[i].bBlkActors = Others[i].Other.bBlockActors;
				Ghosts[i].bBlkPlayers = Others[i].Other.bBlockPlayers;
				Ghosts[i].bProjTgt = Others[i].Other.bProjTarget;
				Others[i].Other.bBlockActors = False;
				Others[i].Other.bBlockPlayers = False;
				Others[i].Other.bProjTarget = False;
			}
		}
	}
	
	if (enableServerShotOnZP)
	{
		forceServerHitscan = True;
		TraceFire(Accuracy);
		forceServerHitscan = False;
	}
	lastZPShotTime = 0.0;
	
	StartTrace += (Owner.Location - OwnerClientLoc);
	for (i = 0; i <= maxOthers; i++)
	{
		if (Ghosts[i].Other != None)
		{
			if (enableServerShotOnZP)
			{
				Ghosts[i].Other.bBlockActors = Ghosts[i].bBlkActors;
				Ghosts[i].Other.bBlockPlayers = Ghosts[i].bBlkPlayers;
				Ghosts[i].Other.bProjTarget = Ghosts[i].bProjTgt;
			}
			HitLoc = Others[i].HitLoc + (Others[i].Other.Location - Others[i].Loc);
			GetAxes(rotator(HitLoc - StartTrace), X, Y, Z);
			remainingWallThickness = Others[i].remWThick;
			ProcessTraceHit(Others[i].Other, HitLoc, Others[i].HitNorm, X, Y, Z);
		}
	}
}

function bool checkZPPreValidity(private bool isAltFire, private Actor Other, private vector HitLoc, private vector Start, private vector OtherClientLoc, private vector OwnerClientLoc, 
private rotator OwnerClientVRot, private float Accuracy, private float AccY, private float AccZ, optional private out byte useStandardShot)
{
local private bool isValidRemWThick;
local private name zpLogTag;

	if (curRemWThick < 0)
		return True;

	zpLogTag = 'NW3ZP_IRPR';
	isValidRemWThick = (lvlCount == 0 || curRemWThick < maxWTDepth);
	if (enableZPDebug)
	{
		if (!isValidRemWThick)
			log("Wall through hitscan FAILED -> expected lesser than "$maxWTDepth$", detected "$curRemWThick, zpLogTag);
		else if (lvlCount > 0)
			log("Wall through hitscan OK -> "$curRemWThick$" (max allowed [exclusive]: "$maxWTDepth$")", zpLogTag);
		else
			log("Wall through hitscan OK", zpLogTag);
	}
	return isValidRemWThick;
}

simulated function ProcessOther(Actor Other, Vector HitLocation, Vector HitNormal, Vector StartTrace)
{
local IRPRTracerGuide itg;
local byte myteam;

	myteam = getLaserTeam();

	Spawn(LightFXGNDClass[myteam], ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	Spawn(class'IRPRSmokeGen', ZPOwner,, HitLocation+HitNormal*9);
	Spawn(Class'IRPRWallParts', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	Spawn(DecalFXClass[myteam], ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	
	if (bTraceBeam)
	{
		itg = Spawn(Class'IRPRTracerGuide', ZPOwner,, StartTrace, rotator(HitLocation - StartTrace));
		itg.SetTeam(myteam);
		itg.MakeTracing(VSize(HitLocation - StartTrace), bStartingShot, bEndingShot);
	}
}

simulated function byte getLaserTeam()
{
	if (Pawn(Owner) != None && Pawn(Owner).PlayerReplicationInfo != None && bTeamColoredL)
	{
		if (Pawn(Owner).PlayerReplicationInfo.Team > 3)
			return 0;
		return Pawn(Owner).PlayerReplicationInfo.Team;
	}
	return laserColor;
}

simulated function ProcessTraceHit(Actor Other, Vector HitLocation, Vector HitNormal, Vector X, Vector Y, Vector Z)
{
local int tempKick;
local float dmgRatio;

	tempKick = KickBack;
	
	if (Other == Level)
	{
		Spawn(DecalFXClass[getLaserTeam()], ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
		Spawn(class'IRPRSmokeGen', ZPOwner,,HitLocation+HitNormal*9);
		Spawn(Class'IRPRWallParts', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
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
			Spawn(class'NWZPUT_SmokePuff', ZPOwner,,HitLocation+HitNormal*9);

		if (Role == ROLE_Authority)
		{
			dmgRatio = GetDamageMult();
			if (default.bReduceDamageByWallthrough && maxWTDepth > 0)
				dmgRatio *= (remainingWallThickness / maxWTDepth);
			
			if (isHeadShotDmg(Other, HitLocation))
			{
				if (giveFiredHealth(Other, HeadShotDmg))
					return;
				Other.TakeDamage(HeadShotDmg * dmgRatio, Pawn(Owner), HitLocation, 55000 * X + (MirrorVectorByNormal(HitNormal, HitNormal) * (tempKick * 1000 + 1)), 'Decapitated');
			}
			else
			{
				if (giveFiredHealth(Other, ShotDamage))
					return;
				Other.TakeDamage(ShotDamage * dmgRatio,  Pawn(Owner), HitLocation, 60000.0 * X + (MirrorVectorByNormal(HitNormal, HitNormal) * (tempKick * 1000 + 1)), MyDamageType);	
			}
		}
	}
}

simulated function bool ClientAltFire( float Value )
{
	if (!bZoomIn)
		PlayOwnedSound( ZoomInSnd, SLOT_None, Pawn(Owner).SoundDampening*5.0);
	else
		PlayOwnedSound( ZoomOutSnd, SLOT_None, Pawn(Owner).SoundDampening*5.0);

	GotoState('Zooming');
	return true;
}

function AltFire( float Value )
{
	ClientAltFire(Value);
	bGlobalSniping = !bGlobalSniping;
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
	Super.Finish();
}

simulated function Tick(float DeltaTime)
{
	if (Pawn(Owner) != None && Pawn(Owner).bAltFire == 0 )
	{
		if ( PlayerPawn(Owner) != None && PlayerPawn(Owner).Player != None && PlayerPawn(Owner).Player.IsA('ViewPort'))
			PlayerPawn(Owner).StopZoom();
		SetTimer(0.0,False);
	}
	
	checkGlobalSnipingStatus();
	
	if (IRPRCorCount > 0)
	{
		IRPRCorCount -= DeltaTime;
		if (IRPRCorCount <= 0 && IRPRCor != None)
		{
			IRPRCor.Destroy();
			IRPRCor = None;
		}
	}
	
	Super.Tick(DeltaTime);
}

function checkGlobalSnipingStatus()
{
	if (bGlobalSniping && (Pawn(Owner) == None || Pawn(Owner).Weapon != Self))
		bGlobalSniping = False;
}

simulated function PrePostRenderOther( canvas Canvas, float Scale)
{
	if (IRPRCor != None && PlayerPawn(Owner) != None && PlayerPawn(Owner).Handedness < 2 && PlayerPawn(Owner).DesiredFOV == PlayerPawn(Owner).DefaultFOV)
		Canvas.DrawActor(IRPRCor, False, True);
}

//ZOOM ---------------------------------------
simulated function PostRender( canvas Canvas )
{
local PlayerPawn P;
local float Scale, ZoomS;
local float ScopeScale, StartScopeX, StartScopeY, EndScopeX, EndScopeY;
local float CntX, CntY;
local int i;
local Actor A;
local float newHeat;
local byte isNotVisible;
local vector markerPos;
local vector PEyeOrigin;
local bool isFriendActor, enableBeacon;
local texture EnvTexTemp;
local bool bEnvTemp, bUnlitTemp;
local ERenderStyle styleTemp;
local float glowTemp;
local texture beaconTx;
local color beaconClr;
local byte beaconTeam;

	P = PlayerPawn(Owner);

	if ( (P != None) && (P.DesiredFOV != P.DefaultFOV) ) 
	{
		bOwnsCrossHair = True;
		Scale = Canvas.ClipX/640;
		CntX = Canvas.ClipX/2;
		CntY = Canvas.ClipY/2;
		ScopeScale = Canvas.ClipY/512;
		StartScopeX = (Canvas.ClipX - 512*ScopeScale)/2;
		StartScopeY = 0;
		EndScopeX = (Canvas.ClipX + 512*ScopeScale)/2;
		EndScopeY = Canvas.ClipY;
		
		
		//Scope Glass Render
		if (bZoomGreenIRGlass)
		{
			Canvas.bNoSmooth = True;
			Canvas.Style = ERenderStyle.STY_Modulated;
			Canvas.SetPos(0, 0);
			Canvas.DrawRect(GreenScopeTex, Canvas.ClipX, Canvas.ClipY);
		}
		
		//Bodies sensing
		if (bZoomIR)
		{
			PEyeOrigin = P.Location + P.EyeHeight*vect(0,0,1) + P.WalkBob;
			ForEach RadiusActors(Class'Actor', A, FMax(actualZoomIn, actualZoomOut), P.Location)
			{
				if (!A.bHidden && !A.bStatic && A != P && A.Mesh != None && A.DrawType==DT_Mesh && !A.bParticles && isValidSensedActor(A, P, newHeat, isNotVisible))
				{
					//Save current temp settings
					styleTemp = A.Style;
					bEnvTemp = A.bMeshEnviroMap;
					EnvTexTemp = A.Texture;
					bUnlitTemp = A.bUnlit;
					glowTemp = A.ScaleGlow;
					
					//Render heat
					if (isNotVisible != 0)
					{
						A.Style = STY_Translucent;
						newHeat /= 3;
					}
					else
						A.Style = STY_Normal;
					
					A.bMeshEnviroMap = True;
					A.Texture = Texture'BodyHeatTex';
					A.bUnlit = True;
					A.ScaleGlow = newHeat;
					Canvas.DrawActor(A, False, True);
					
					//Set old settings back
					A.Style = styleTemp;
					A.bMeshEnviroMap = bEnvTemp;
					A.Texture = EnvTexTemp;
					A.bUnlit = bUnlitTemp;
					A.ScaleGlow = glowTemp;
					A.bHidden = False;

					
					//Draw marker if appliable
					isFriendActor = (bTeamGame && !bMHGame && isTeamMember(A)) || (bMHGame && !Class'NWUtils'.static.isMonster(Pawn(A)));
					enableBeacon = ((bScopeFriendlyMarkers && isFriendActor) || (bScopeEnemyMarkers && !isFriendActor));
					beaconTeam = Class'NWUtils'.static.getTeam(A);
					
					if (enableBeacon && Class'NWUtils'.static.isValidTarget(A, True) &&
					Class'NWUtils'.static.LocToCanvas(markerPos, A.Location + (A.CollisionHeight + 16)*vect(0,0,1), PEyeOrigin, 
					Pawn(Owner).ViewRotation, Canvas, True))
					{
						if (bScopeTeamMarkers && beaconTeam < 4)
						{
							beaconTx = TeamMarkerTex[beaconTeam];
							beaconClr = TeamMarkerColor[beaconTeam];
						}
						else if (isFriendActor)
						{
							beaconTx = FriendMarkerTex;
							beaconClr = FriendMarkerColor;
						}
						else
						{
							beaconTx = EnemyMarkerTex;
							beaconClr = EnemyMarkerColor;
						}
						
						Canvas.bNoSmooth = False;
						Canvas.Style = ERenderStyle.STY_Translucent;
						Canvas.SetPos(markerPos.X - ScopeScale*beaconTx.USize/2, markerPos.Y - ScopeScale*beaconTx.VSize);
						Canvas.DrawColor = beaconClr;
						Canvas.DrawIcon(beaconTx, ScopeScale);
					}
				}
			}
			
			
			//Static Render
			Canvas.bNoSmooth = True;
			Canvas.Style = ERenderStyle.STY_Translucent;
			Canvas.SetPos(0,0);
			Canvas.DrawColor.R = 32;
			Canvas.DrawColor.G = 32;
			Canvas.DrawColor.B = 32;
			Canvas.DrawPattern(StaticBackground, Canvas.ClipX, Canvas.ClipY, 0.5);
		}
		
		
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
		Canvas.DrawColor.R = 0;
		Canvas.DrawColor.G = 255;
		Canvas.DrawColor.B = 0;
		Canvas.bNoSmooth = True;
		Canvas.Font = ZoomFont[Class'NWUtils'.static.getResolutionFontCoef(Canvas)];
		ZoomS = P.DefaultFOV/P.DesiredFOV;
		
		Canvas.SetPos(0.5 * Canvas.ClipX + 185*ScopeScale, 0.5 * Canvas.ClipY + 185*ScopeScale);
		Canvas.DrawText(int(ZoomS) $ "." $ int(10 * ZoomS - 10 * int(ZoomS)) $ "X");
		
		bZoomIn = True;
		Super(TournamentWeapon).PostRender(Canvas);
	}
	else
	{
		bZoomIn = False;
		bOwnsCrosshair = class'NaliWeapons'.default.bCustomCrosshair;
		Super.PostRender(Canvas);
	}
}

simulated function bool isValidSensedActor(Actor A, Pawn P, out float newHeat, out byte isNotVisible)
{
local int i;

	if (bInvertLists)
	{
		for (i = maxNonSensedHeatClasses-1; i >= 0; i--)
		{
			if (NonObjectsSaved[i] != '' && A.IsA(NonObjectsSaved[i]))
				return False;
		}
	}
	else
	{
		for (i = 0; i < maxNonSensedHeatClasses; i++)
		{
			if (NonObjectsSaved[i] != '' && A.IsA(NonObjectsSaved[i]))
				return False;
		}
	}
	
	for (SensedObjectsIteratorInit(i); SensedObjectsIteratorCond(i); SensedObjectsIteratorAction(i))
	{
		if (SensedObjectsSaved[i].HeatObjectType != '' && A.IsA(SensedObjectsSaved[i].HeatObjectType))
		{
			if (FastTrace(P.Location + P.EyeHeight*vect(0,0,1), A.Location))
				isNotVisible = 0;
			else
				isNotVisible = 1;

			if (isNotVisible != 0 && (!enWallTZoom || VSize(P.Location - A.Location) > actualZoomOut))
				return False;
			else if (isNotVisible == 0 && VSize(P.Location - A.Location) > actualZoomIn)
				return False;
			
			newHeat = SensedObjectsSaved[i].AmountOfHeat;
			if (SensedObjectsSaved[i].bFadingHeat && A.default.LifeSpan > 0.0)
				newHeat *= (A.LifeSpan/A.default.LifeSpan);
			
			return True;
		}
	}
	
	return False;
}

simulated function SensedObjectsIteratorInit(out int i)
{
	if (bInvertLists)
		i = maxSensedHeatClasses-1;
	else
		i = 0;
}

simulated function bool SensedObjectsIteratorCond(int i)
{
	if (bInvertLists)
		return (i >= 0);
	return (i < maxSensedHeatClasses);
}

simulated function SensedObjectsIteratorAction(out int i)
{
	if (bInvertLists)
		i--;
	else
		i++;
}

simulated function Destroyed()
{
	if (IRPRCor != None)
		IRPRCor.Destroy();
	if (pnt != None)
		pnt.Destroy();
		
	IRPRCor = None;
	pnt = None;
	
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


state Idle
{
    function Fire( float Value )
    {
        if (AmmoType == None)
            GiveAmmo(Pawn(Owner));
		if (AmmoType != None)
			oldZPAmmoAmount = AmmoType.AmmoAmount;
		
		if (bInfinity || AmmoType.UseAmmo(1))
		{
			GotoState('NormalFire');
			bPointing = True;
			bCanClientFire = true;
			if (Owner != None && Owner.IsA('Bot'))
			{
				// simulate bot using zoom
				if (Bot(Owner).bSniping && FRand() < 0.65)
					AimError = AimError/FClamp(StillTime, 1.0, 8.0);
				else if (VSize(Owner.Location - OwnerLocation) < 6)
					AimError = AimError/FClamp(0.5 * StillTime, 1.0, 3.0);
				else
					StillTime = 0;
			}

			if (Pawn(Owner) != None)
				Pawn(Owner).PlayRecoil(FiringSpeed);
			TraceFire(GetAccuracy());
			AimError = Default.AimError;
			ClientFire(Value);
    	}
    }


    function BeginState()
    {
        bPointing = false;
        SetTimer(0.4 + 1.6 * FRand(), false);
        Super.BeginState();
    }

    function EndState()
    {   
        SetTimer(0.0, false);
        Super.EndState();
    }

Begin:
    bPointing=False;
    if ( Pawn(Owner) != None && AmmoType != None && AmmoType.AmmoAmount<=0 )
	{
		if (AmmoType != None && AmmoType.AmmoAmount<=0)
			Pawn(Owner).SwitchToBestWeapon();  //Goto Weapon that has Ammo
		if (Pawn(Owner).bFire!=0 )
			Fire(0.0);
	}
    Disable('AnimEnd');
    PlayIdleAnim();
}

function float RateSelf( out int bUseAltMode )
{
local float dist;

    if ( AmmoType.AmmoAmount <=0 )
        return -2;

    bUseAltMode = 0;
    if (Bot(Owner) != None && Bot(Owner).bSniping )
        return AIRating + 1.15;
    if (Pawn(Owner) != None && Pawn(Owner).Enemy != None )
    {
        dist = VSize(Pawn(Owner).Enemy.Location - Owner.Location);
        if ( dist > 1200 )
        {
            if ( dist > 2000 )
                return (AIRating + 0.75);
            return (AIRating + FMin(0.0001 * dist, 0.45)); 
        }
    }
    return AIRating;
}


static function ELaserColor GetELaserColorFromByte(byte n)
{
	if (n == 0)		return ELaserColor.LC_Red;
	if (n == 1)		return ELaserColor.LC_Blue;
	if (n == 2)		return ELaserColor.LC_Green;
	if (n == 3)		return ELaserColor.LC_Yellow;
	return ELaserColor.LC_Red;
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
	sLoc = HitLocation + HitNormal + Class'IRPRCMegaBase'.static.getMegaBaseOffsetFromGround();
	h = Class'IRPRCMegaBase'.static.getRadialNormalizedHeight(Class'IRPRCMegaBase'.default.BaseRadiusMiddle, HitNormal.Z);
	sLoc += (FMin(h, Class'IRPRCMegaBase'.default.BaseHeightMiddle) * vect(0,0,1));
	
	A = ref.Trace(HL, HN, sLoc, HitLocation + HitNormal, False);
	if (A != None)
		sLoc = HL + HN;
	ref.Spawn(Class'IRPRCMegaBase',,, sLoc, R);
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	if (i == 0)
		CFXClass = Class'IRPROversFXA';
	else
		CFXClass = Class'IRPROversFXB';
	return (i <= 6);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRPick
	CollisionHeight=16.500000
	CollisionRadius=30.000000
	AutoSwitchPriority=9
	Icon=IRPRIcon
	InventoryGroup=10
	ItemArticle="an"
	ItemName="InfraRed Precision Rifle (I.R.P.R.)"
	MaxDesireability=0.900000
	PickupMessage="You got the InfraRed Precision Rifle (I.R.P.R.)."
	PickupSound=IRPRPickup
	PickupViewMesh=IRPRPick
	PickupViewScale=1.000000
	PlayerViewMesh=IRPRR
	PlayerViewOffset=(X=18.75000,Y=-3.300000,Z=-3.750000)
	WidePlayerViewOffset=(X=20.35000,Y=-3.300000,Z=-3.750000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=IRPRIcon
	ThirdPersonMesh=IRPRM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=None
	AltProjectileClass=None
	AmmoName=Class'IRPRAmmo'
	bInstantHit=True
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o got a new hole from %k's %w."
	ShotDamage=48
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=IRPRFire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Shot
	NameColor=(R=0,G=255,B=0)
	PickupAmmoCount=6
	ProjectileClass=None
	SelectSound=IRPRSelect
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
	CustomCross=IRPRCross
	CustomCrossAlpha=IRPRCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Long range laser based sniper rifle.\n\nPrimary Fire: Extremely powerful long range laser shot which can even penetrate walls.\n\nSecondary Fire: Zoom-in for long range precise shots and smart computerized heat-view which can reliably label friends from foes."
	
	Texture=IRPRMetal
	
	PlayerViewMeshLeft=IRPR
	PlayerViewMeshRight=IRPRR
	HandPartMeshL(0)=IRPRHandL
	HandPartMeshR(0)=IRPRHandR
	BobDamping=1.075000
	
	RenderOffsetSelect=(Y=-1.500000,Z=-2.000000)
	AnimMaxFrame=0.857129
	RenderOffsetFire=(X=-1.250000)
	AnimMaxFrameFire=0.916667
	CenterPlayerViewOffset=(X=17.500000,Y=1.000000,Z=-5.000000)
	WideCenterPlayerViewOffset=(X=19.500000,Y=1.000000,Z=-5.500000)
	
	FireOffsetZAdjustHidden=-4.000000
	
	FirstPersonOverFX(0)=(bLit=True,OverTex1=Texture'IRPR_Sk04')
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.550000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'IRPRScopeOvL',CustomMesh=Mesh'IRPRScopeOvR')
	
	FirstPersonOverFX(1)=(bLit=True,bEnviromentMode=True,OverMainTex=Texture'ScopeGlass')
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=0.250000,bCustomMesh=True)
	FirstPersonOverFX(1)=(CustomMeshLeft=Mesh'IRPRScopeOvL',CustomMesh=Mesh'IRPRScopeOvR')
	
	PickupOverFX(0)=(bLit=True,OverTex1=Texture'IRPR_Sk04')
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.550000,bCustomMesh=True)
	PickupOverFX(0)=(CustomMesh=Mesh'IRPRScopeOvP')
	
	PickupOverFX(1)=(bLit=True,bEnviromentMode=True,OverMainTex=Texture'ScopeGlass')
	PickupOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=0.250000,bCustomMesh=True)
	PickupOverFX(1)=(CustomMesh=Mesh'IRPRScopeOvP')
	
	
	TeamMarkerTex(0)=IRPR_Beacon_R
	TeamMarkerTex(1)=IRPR_Beacon_B
	TeamMarkerTex(2)=IRPR_Beacon_G
	TeamMarkerTex(3)=IRPR_Beacon_Y
	TeamMarkerColor(0)=(R=128,G=0,B=0)
	TeamMarkerColor(1)=(R=0,G=0,B=128)
	TeamMarkerColor(2)=(R=0,G=128,B=0)
	TeamMarkerColor(3)=(R=128,G=128,B=0)
	FriendMarkerTex=IRPR_Beacon_F
	FriendMarkerColor=(R=128,G=128,B=128)
	EnemyMarkerTex=IRPR_Beacon_E
	EnemyMarkerColor=(R=128,G=0,B=0)
	
	WaterSplashType=1
	ZoomTexParts(0)=ScopeN01
	ZoomTexParts(1)=ScopeN02
	ZoomTexParts(2)=ScopeN03
	ZoomTexParts(3)=ScopeN04
	GreenScopeTex=GreenScope
	DarkBackground=ScopeBack
	ZoomFont(0)=DSDigitalA
	ZoomFont(1)=DSDigitalB
	ZoomFont(2)=DSDigitalC
	ZoomFont(3)=DSDigitalD
	ZoomFont(4)=DSDigitalE
	ZoomFont(5)=DSDigitalF
	StaticBackground=IRPRStatic01
	ZoomInSnd=IRPRScopeOn
	ZoomOutSnd=IRPRScopeOff
	
	DecalFXClass(0)=Class'IRPRDecalFXR'
	DecalFXClass(1)=Class'IRPRDecalFXB'
	DecalFXClass(2)=Class'IRPRDecalFXG'
	DecalFXClass(3)=Class'IRPRDecalFXY'
	
	LightFXGNDClass(0)=Class'IRPRLightEffectGNDR'
	LightFXGNDClass(1)=Class'IRPRLightEffectGNDB'
	LightFXGNDClass(2)=Class'IRPRLightEffectGNDG'
	LightFXGNDClass(3)=Class'IRPRLightEffectGNDY'
	
	LightFXCorClass(0)=Class'IRPRLightEffectCorR'
	LightFXCorClass(1)=Class'IRPRLightEffectCorB'
	LightFXCorClass(2)=Class'IRPRLightEffectCorG'
	LightFXCorClass(3)=Class'IRPRLightEffectCorY'
	
	isZPWeapon=True
	bFireHitScan=True
	AccuracyPattern(0)=0.000000
	ZPMaxFirerate=1.000000

	
	bFirstPersonShotFX=True
	
	MaxWallthroughDepth=256.000000
	MaxWallthroughShots=5
	MaxWallthroughPrecision=10
	bReduceDamageByWallthrough=True
	ZoomInViewRange=18000.000000
	ZoomOutViewRange=2500.000000
	HeadShotDmg=250
	bPlayersAlwaysRelevant=False
	enableWallThroughZoom=True
	enableScopeTeamMarkers=True
	enableScopeEnemyMarkers=False
	enableScopeFriendlyMarkers=True
	enableTeamColoredLaser=True
	bAlwaysTeamColoredLaser=False
	defaultLaserColor=LC_Red
	enableServerShotOnZP=True
	enableZoomGreenIRGlass=True
	enableZoomIR=True
	enableTraceBeam=True
	
	SensedHeatObjects(0)=(HeatObjectType="Pawn",AmountOfHeat=3.000000,bFadingHeat=False)
	SensedHeatObjects(1)=(HeatObjectType="TeamCannon",AmountOfHeat=0.750000,bFadingHeat=False)
	SensedHeatObjects(2)=(HeatObjectType="sgBuilding",AmountOfHeat=0.750000,bFadingHeat=False)
	SensedHeatObjects(3)=(HeatObjectType="Cybot",AmountOfHeat=0.850000,bFadingHeat=False)
	SensedHeatObjects(4)=(HeatObjectType="CybotPart",AmountOfHeat=0.850000,bFadingHeat=False)
	SensedHeatObjects(5)=(HeatObjectType="CybAttach",AmountOfHeat=0.850000,bFadingHeat=False)
	SensedHeatObjects(6)=(HeatObjectType="Carcass",AmountOfHeat=0.900000,bFadingHeat=True)
	SensedHeatObjects(7)=(HeatObjectType="WarShell",AmountOfHeat=0.750000,bFadingHeat=False)
	SensedHeatObjects(8)=(HeatObjectType="StrangeShell",AmountOfHeat=0.750000,bFadingHeat=False)
	SensedHeatObjects(9)=(HeatObjectType="DumbRocket",AmountOfHeat=0.750000,bFadingHeat=False)
	SensedHeatObjects(10)=(HeatObjectType="NuclearMissile",AmountOfHeat=0.750000,bFadingHeat=False)
	SensedHeatObjects(11)=(HeatObjectType="TranslocatorTarget",AmountOfHeat=0.550000,bFadingHeat=False)
	SensedHeatObjects(12)=(HeatObjectType="RTTrans",AmountOfHeat=0.550000,bFadingHeat=False)
	
	NonSensedObjects(0)=FortStandard
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=224,G=64,B=16)
	OversurrectorFXColors(0)=(R=112,G=64,B=16)
	OversurrectorFXColors(1)=(R=192,G=64,B=24)
	OversurrectorFXColors(2)=(R=32,G=4,B=0)
	OversurrectorFXColors(3)=(R=128,G=32,B=24)
	OversurrectorFXColors(4)=(R=64,G=16,B=8)
	OversurrectorFXColors(5)=(R=128,G=96,B=40)
	OversurrectorFXColors(6)=(R=128,G=96,B=40)
	OversurrectorFXColors(7)=(R=64,G=0,B=8)
	OversurrectorFXColors(8)=(R=64,G=0,B=8)
	OversurrectorFXColors(9)=(R=128,G=64,B=24)
	OversurrectorFXColors(10)=(R=128,G=64,B=24)
	OversurrectorFXColors(11)=(R=96,G=48,B=24)
	OversurrectorFXColors(12)=(R=24,G=8,B=0)
	OversurrectorFXColors(13)=(R=192,G=16,B=32)
	OversurrectorFXColors(14)=(R=128,G=32,B=24)
	OversurrectorFXColors(15)=(R=128,G=0,B=16)
	OversurrectorFXColors(16)=(R=128,G=32,B=24)
	OversurrectorFXColors(17)=(R=192,G=16,B=32)
	OversurrectorFXColors(18)=(R=64,G=16,B=8)
	OversurrectorFXColors(19)=(R=16,G=4,B=0)
	OversurrectorFXColors(20)=(R=64,G=0,B=0)
	OversurrectorFXColors(21)=(R=192,G=32,B=16)
	OversurrectorFXColors(22)=(R=192,G=16,B=8)
	OversurrectorFXColors(23)=(R=255,G=0,B=0)
	
	OversurrectorLightHue(0)=244
	OversurrectorLightSaturation(0)=64
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=244
	OversurrectorLightSaturation(1)=64
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=244
	OversurrectorLightSaturation(2)=64
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'IRPROversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=45.000000
	OversurrectionTurretRotRate=6500.000000
	OversurrectionFireCycleRate=1.000000
	OversurrectionLaserPrepareTime=2.000000
	OversurrectionLaserCooldownTime=3.500000
	OversurrectionLaserFireMaxTime=6.000000
	OversurrectionScanEnemiesRadius=40000.000000
	OversurrectionRangedEnemiesPeriph=0.500000
	OversurrectionAttackMinPeriph=0.900000
	OversurrectionLaserDamage=1000
	OversurrectionMaxWTTraces=5
	OversurrectionMaxWTTracePrecision=16
	OversurrectionMaxTraceRange=40000.000000
	OversurrectionMaxWTTraceDepth=1024.000000
	OversurrectionStopFireOdds=0.250000
}
