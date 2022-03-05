//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Launcher weapon
//				Feralidragon (09-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybotLauncher expands NaliWeapons config(NWeaponsCfg);


//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=CybotLauncher ANIVFILE=MODELS\CybotLauncher_a.3d DATAFILE=MODELS\CybotLauncher_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybotLauncher STRENGTH=0
#exec MESH ORIGIN MESH=CybotLauncher X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=CybotLauncherR ANIVFILE=MODELS\CybotLauncher_a.3d DATAFILE=MODELS\CybotLauncher_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=5
#exec MESH LODPARAMS MESH=CybotLauncherR STRENGTH=0
#exec MESH ORIGIN MESH=CybotLauncherR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=CybotLauncherPick ANIVFILE=MODELS\CybotLauncher_a.3d DATAFILE=MODELS\CybotLauncher_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=CybotLauncherPick STRENGTH=0
#exec MESH ORIGIN MESH=CybotLauncherPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=CybotLauncherM ANIVFILE=MODELS\CybotLauncher_a.3d DATAFILE=MODELS\CybotLauncher_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybotLauncherM STRENGTH=0.45
#exec MESH ORIGIN MESH=CybotLauncherM X=450 Y=0 Z=-60 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=CybotLauncher SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=CybotLauncher SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotLauncher SEQ=AltFire STARTFRAME=12 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=CybotLauncher SEQ=Fire STARTFRAME=0 NUMFRAMES=14 RATE=14.0
#exec MESH SEQUENCE MESH=CybotLauncher SEQ=Select STARTFRAME=19 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=CybotLauncher SEQ=Down STARTFRAME=13 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=CybotLauncherR SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=CybotLauncherR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotLauncherR SEQ=AltFire STARTFRAME=12 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=CybotLauncherR SEQ=Fire STARTFRAME=0 NUMFRAMES=14 RATE=14.0
#exec MESH SEQUENCE MESH=CybotLauncherR SEQ=Select STARTFRAME=19 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=CybotLauncherR SEQ=Down STARTFRAME=13 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=CybotLauncherPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=CybotLauncherM SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=CybotLauncherM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotLauncherM SEQ=AltFire STARTFRAME=12 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=CybotLauncherM SEQ=Fire STARTFRAME=0 NUMFRAMES=14 RATE=14.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=CybotLauncher MESH=CybotLauncher
#exec MESHMAP SCALE MESHMAP=CybotLauncher X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=CybotLauncherR MESH=CybotLauncherR
#exec MESHMAP SCALE MESHMAP=CybotLauncherR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=CybotLauncherPick MESH=CybotLauncherPick
#exec MESHMAP SCALE MESHMAP=CybotLauncherPick X=0.095 Y=0.095 Z=0.19

#exec MESHMAP NEW MESHMAP=CybotLauncherM MESH=CybotLauncherM
#exec MESHMAP SCALE MESHMAP=CybotLauncherM X=0.075 Y=0.075 Z=0.15

//-----------------------------------------------------------------------------------

//Screens
#exec TEXTURE IMPORT NAME=CybotScreen01 FILE=SCREENS\CybotScreen01.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen02 FILE=SCREENS\CybotScreen02.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen03 FILE=SCREENS\CybotScreen03.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen04 FILE=SCREENS\CybotScreen04.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen05 FILE=SCREENS\CybotScreen05.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen06 FILE=SCREENS\CybotScreen06.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen07 FILE=SCREENS\CybotScreen07.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen08 FILE=SCREENS\CybotScreen08.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen09 FILE=SCREENS\CybotScreen09.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen10 FILE=SCREENS\CybotScreen10.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=CybotScreen11 FILE=SCREENS\CybotScreen11.bmp GROUP=Screens LODSET=0 MIPS=OFF

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=CybotLauncher_Sk01 FILE=SKINS\CybotLauncher_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncher NUM=1 TEXTURE=CybotLauncher_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherR NUM=1 TEXTURE=CybotLauncher_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherPick NUM=1 TEXTURE=CybotLauncher_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherM NUM=1 TEXTURE=CybotLauncher_Sk01

#exec TEXTURE IMPORT NAME=CybotLauncher_Sk02 FILE=SKINS\CybotLauncher_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncher NUM=2 TEXTURE=CybotLauncher_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherR NUM=2 TEXTURE=CybotLauncher_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherPick NUM=2 TEXTURE=CybotLauncher_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherM NUM=2 TEXTURE=CybotLauncher_Sk02

#exec TEXTURE IMPORT NAME=CybotLauncher_Sk03 FILE=SKINS\CybotLauncher_Sk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncher NUM=3 TEXTURE=CybotLauncher_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherR NUM=3 TEXTURE=CybotLauncher_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherPick NUM=3 TEXTURE=CybotLauncher_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherM NUM=3 TEXTURE=CybotLauncher_Sk03

#exec TEXTURE IMPORT NAME=CybotLauncher_Sk04 FILE=SKINS\CybotLauncher_Sk04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncher NUM=4 TEXTURE=CybotLauncher_Sk04
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherR NUM=4 TEXTURE=CybotLauncher_Sk04
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherPick NUM=4 TEXTURE=CybotLauncher_Sk04
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherM NUM=4 TEXTURE=CybotLauncher_Sk04

#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncher NUM=5 TEXTURE=CybotScreen01
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherR NUM=5 TEXTURE=CybotScreen01
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherPick NUM=5 TEXTURE=CybotScreen01
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherM NUM=5 TEXTURE=CybotScreen01

#exec TEXTURE IMPORT NAME=CybotMetal FILE=SKINS\CybotMetal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=CybotLauncherIcon FILE=ICONS\CybotLauncherIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=CybotLauncherCrossAlpha FILE=ICONS\CybotLauncherCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\CybotLauncherIcons.utx PACKAGE=NWCybotLauncherVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="CybotPickup" FILE=SOUNDS\CybotPickup.wav GROUP="CybotLauncher"
#exec AUDIO IMPORT NAME="CybotSelect" FILE=SOUNDS\CybotSelect.wav GROUP="CybotLauncher"
#exec AUDIO IMPORT NAME="CybotFire" FILE=SOUNDS\CybotFire.wav GROUP="CybotLauncher"
#exec AUDIO IMPORT NAME="CybotAltFire" FILE=SOUNDS\CybotAltFire.wav GROUP="CybotLauncher"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=CybotLauncherHandL ANIVFILE=MODELS\CybotLauncherHand_a.3d DATAFILE=MODELS\CybotLauncherHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybotLauncherHandL STRENGTH=0
#exec MESH ORIGIN MESH=CybotLauncherHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=CybotLauncherHandR ANIVFILE=MODELS\CybotLauncherHand_a.3d DATAFILE=MODELS\CybotLauncherHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybotLauncherHandR STRENGTH=0
#exec MESH ORIGIN MESH=CybotLauncherHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=CybotLauncherHandL SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=CybotLauncherHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotLauncherHandL SEQ=AltFire STARTFRAME=12 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=CybotLauncherHandL SEQ=Fire STARTFRAME=0 NUMFRAMES=14 RATE=14.0
#exec MESH SEQUENCE MESH=CybotLauncherHandL SEQ=Select STARTFRAME=19 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=CybotLauncherHandL SEQ=Down STARTFRAME=13 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=CybotLauncherHandR SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=CybotLauncherHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotLauncherHandR SEQ=AltFire STARTFRAME=12 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=CybotLauncherHandR SEQ=Fire STARTFRAME=0 NUMFRAMES=14 RATE=14.0
#exec MESH SEQUENCE MESH=CybotLauncherHandR SEQ=Select STARTFRAME=19 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=CybotLauncherHandR SEQ=Down STARTFRAME=13 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=CybotLauncherHandL MESH=CybotLauncherHandL
#exec MESHMAP SCALE MESHMAP=CybotLauncherHandL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=CybotLauncherHandR MESH=CybotLauncherHandR
#exec MESHMAP SCALE MESHMAP=CybotLauncherHandR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=CybotLauncherHandR NUM=1 TEXTURE=HumanHand


//===========================================================================

//OVERLAYER MESHES
//*******************************************************
#exec MESH IMPORT MESH=CybotScreenOvFL ANIVFILE=MODELS\CybotScreenOv_a.3d DATAFILE=MODELS\CybotScreenOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=CybotScreenOvFL STRENGTH=0
#exec MESH ORIGIN MESH=CybotScreenOvFL X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=CybotScreenOvFR ANIVFILE=MODELS\CybotScreenOv_a.3d DATAFILE=MODELS\CybotScreenOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=1
//#exec MESH LODPARAMS MESH=CybotScreenOvFR STRENGTH=0
#exec MESH ORIGIN MESH=CybotScreenOvFR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=CybotScreenOvP ANIVFILE=MODELS\CybotScreenOv_a.3d DATAFILE=MODELS\CybotScreenOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=CybotScreenOvP STRENGTH=0
#exec MESH ORIGIN MESH=CybotScreenOvP X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=CybotScreenOvFL SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=CybotScreenOvFL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotScreenOvFL SEQ=AltFire STARTFRAME=12 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=CybotScreenOvFL SEQ=Fire STARTFRAME=0 NUMFRAMES=14 RATE=14.0
#exec MESH SEQUENCE MESH=CybotScreenOvFL SEQ=Select STARTFRAME=19 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=CybotScreenOvFL SEQ=Down STARTFRAME=13 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=CybotScreenOvFR SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=CybotScreenOvFR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybotScreenOvFR SEQ=AltFire STARTFRAME=12 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=CybotScreenOvFR SEQ=Fire STARTFRAME=0 NUMFRAMES=14 RATE=14.0
#exec MESH SEQUENCE MESH=CybotScreenOvFR SEQ=Select STARTFRAME=19 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=CybotScreenOvFR SEQ=Down STARTFRAME=13 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=CybotScreenOvP SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=CybotScreenOvFL MESH=CybotScreenOvFL
#exec MESHMAP SCALE MESHMAP=CybotScreenOvFL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=CybotScreenOvFR MESH=CybotScreenOvFR
#exec MESHMAP SCALE MESHMAP=CybotScreenOvFR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=CybotScreenOvP MESH=CybotScreenOvP
#exec MESHMAP SCALE MESHMAP=CybotScreenOvP X=0.095 Y=0.095 Z=0.19


#exec OBJ LOAD FILE=Textures\CybotStaticFX.utx PACKAGE=NWCybotLauncherVIII_SRC.CybotStaticFX

//===========================================================================


var(ServerConfig) config bool bFriendlyFire;
var(ServerConfig) config bool bGuardianReturnToOrigin;
var(ServerConfig) config byte AITrackingMaxSteps;
var(ServerConfig) config name ElectricDamageTypes[8];
var(ServerConfig) config float CybotProjDmgMultiplier;
var(ServerConfig) config float CybotHealthMultiplier;
var(ServerConfig) config float CybotProjSpeedMultiplier;
var(ServerConfig) config int FieldHealth;
var(ServerConfig) config int FieldDamage;
var(ServerConfig) config bool bFieldKillPawns;
var(ServerConfig) config int KamiBaseDamage, VortexBaseDamage;
var(ServerConfig) config int VortexHealth;
var(ServerConfig) config bool bCanBeTelefragged, bCanBeTelefraggedByOwner, bCanBeTelefraggedByTeam;
var(ServerConfig) config bool enableCybotBeacons, enableCybotDeathAknMessages;
var(ServerConfig) config float CybotBeaconsMaxDistance, CybotBeaconsTextDist;
var(ServerConfig) config bool ReduceCybotBeaconsOnDistance, enableCybotBeaconsText;
var(ServerConfig) config bool bAlwaysSeeCybotBeacons;
var(ServerConfig) config float ElectricalDamageScale;
var(ServerConfig) config int MaxCybotsPerPlayer;
var(ServerConfig) config float CybotsMaxLifeSpan, FieldMaxLifeSpan, VortexMaxLifeSpan;
var(ServerConfig) config int CybotSentinelHealth, CybotDualSentinelHealth, CybotAndroidHealth, CybotHeliHealth, CybotDroneHealth;

var(ServerConfig) config bool enableCybot01, enableCybot02, enableCybot03, 
enableCybot04, enableCybot05, enableCybot06, enableCybot07, enableCybot08, enableCybot09, enableCybot10;

var(ServerConfig) config name CybotFriends[32];
var(ServerConfig) config string CybotNames[32];

var(ServerConfig) config name FFieldBounceList[32];


var() texture ScreenCybot[11];
var() class<Projectile> CybotProjClass[11];
var() int AmmoUsage[11];

var byte SelectedM;
var bool enCybot01, enCybot02, enCybot03, enCybot04, enCybot05, enCybot06, enCybot07, enCybot08, enCybot09, enCybot10;

var float globalDelta;
var float CountM;
var float CountBot;

var texture CurrentCybotScreen;

//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime;
var(Oversurrection) config int OversurrectionHealth, OversurrectionChildrenHealth;
var(Oversurrection) config float OversurrectionChildrenInnerMaxRadius, OversurrectionChildrenOuterMaxRadius;
var(Oversurrection) config int OversurrectionChildrenMax, OversurrectionChildrenDefenseMin;
var(Oversurrection) config float OversurrectionChildrenMoveTimeInterval, OversurrectionChildrenAutoAttackOdds;
var(Oversurrection) config float OversurrectionZapAttackOdds, OversurrectionZapAttackCooldown;
var(Oversurrection) config int OversurrectionZapAttackDmg;
var(Oversurrection) config float OversurrectionProjAttackOdds, OversurrectionProjAttackCooldown;
var(Oversurrection) config int OversurrectionProjAttackDmg;
var(Oversurrection) config float OversurrectionHomingAttackOdds, OversurrectionHomingAttackCooldown;
var(Oversurrection) config int OversurrectionHomingAttackDmg;


replication
{
	reliable if (ROLE == Role_Authority && bNetOwner)
		SelectedM;
	reliable if (ROLE == Role_Authority)
		CurrentCybotScreen, enCybot01, enCybot02, enCybot03, enCybot04, enCybot05, enCybot06, enCybot07, enCybot08, enCybot09, enCybot10;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();

	CurrentCybotScreen = ScreenCybot[0];
	MultiSkins[5] = CurrentCybotScreen;
	enCybot01 = default.enableCybot01;
	enCybot02 = default.enableCybot02;
	enCybot03 = default.enableCybot03;
	enCybot04 = default.enableCybot04;
	enCybot05 = default.enableCybot05;
	enCybot06 = default.enableCybot06;
	enCybot07 = default.enableCybot07;
	enCybot08 = default.enableCybot08;
	enCybot09 = default.enableCybot09;
	enCybot10 = default.enableCybot10;
	
	if (default.enableCybotBeacons && default.CybotBeaconsMaxDistance > 0.0)
		AddAuxMutator(Class'CybRadarMut');
}

static function string getRandomCybotName()
{
	return default.CybotNames[Rand(ArrayCount(default.CybotNames))];
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
	//Screen flickering and update
	if (FirstOverFXActor[0] != None)
	{
		FirstOverFXActor[0].Multiskins[1] = CurrentCybotScreen;
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
}

simulated function Tick(float Delta)
{
	globalDelta = Delta;
	BotCybotDeployement(Delta);
	Super.Tick(Delta);
	
	if (Pawn(Owner) == None || Pawn(Owner).Weapon != Self)
		return;
	
	if (Pawn(Owner) != None && AmmoType != None)
	{
		CountM += Delta;
		if (CountM >= 0.2)
		{
			checkCybot();
			CurrentCybotScreen = ScreenCybot[SelectedM];
			UpdateScreen();
			CountM = 0;
		}
	}
}

simulated function SetDefaultDisplay()
{
	Super.SetDefaultDisplay();
	MultiSkins[5] = CurrentCybotScreen;
}

simulated function bool isCybotScreenTexture(texture Tex, optional bool bTrueIfDefault, optional byte DefSkinN)
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
	
	for (i = 0; i < ArrayCount(ScreenCybot); i++)
	{
		if (Tex == ScreenCybot[i])
			return True;
	}
	
	return False;
}

simulated function UpdateScreen()
{
	if (isCybotScreenTexture(MultiSkins[5], True, 5))
		MultiSkins[5] = CurrentCybotScreen;
}

simulated function byte getRenderOptionIndex()
{
	return SelectedM;
}

function AltFire( float Value )
{
	changeCybot();
    GotoState('AltFiring');
    bPointing=True;
    bCanClientFire = true;
    ClientAltFire(Value);
}

function changeCybot()
{
local bool canUseCybot01, canUseCybot02, canUseCybot03, 
canUseCybot04, canUseCybot05, canUseCybot06, canUseCybot07, canUseCybot08, canUseCybot09, canUseCybot10;

	SelectedM++;
	
	canUseCybot01 = (AmmoUsage[1] <= AmmoType.AmmoAmount && enCybot01);
	canUseCybot02 = (AmmoUsage[2] <= AmmoType.AmmoAmount && enCybot02);
	canUseCybot03 = (AmmoUsage[3] <= AmmoType.AmmoAmount && enCybot03);
	canUseCybot04 = (AmmoUsage[4] <= AmmoType.AmmoAmount && enCybot04);
	canUseCybot05 = (AmmoUsage[5] <= AmmoType.AmmoAmount && enCybot05);
	canUseCybot06 = (AmmoUsage[6] <= AmmoType.AmmoAmount && enCybot06);
	canUseCybot07 = (AmmoUsage[7] <= AmmoType.AmmoAmount && enCybot07);
	canUseCybot08 = (AmmoUsage[8] <= AmmoType.AmmoAmount && enCybot08);
	canUseCybot09 = (AmmoUsage[9] <= AmmoType.AmmoAmount && enCybot09);
	canUseCybot10 = (AmmoUsage[10] <= AmmoType.AmmoAmount && enCybot10);

	if (SelectedM == 1 && !canUseCybot01)
		SelectedM++;
	if (SelectedM == 2 && !canUseCybot02)
		SelectedM++;
	if (SelectedM == 3 && !canUseCybot03)
		SelectedM++;
	if (SelectedM == 4 && !canUseCybot04)
		SelectedM++;
	if (SelectedM == 5 && !canUseCybot05)
		SelectedM++;
	if (SelectedM == 6 && !canUseCybot06)
		SelectedM++;
	if (SelectedM == 7 && !canUseCybot07)
		SelectedM++;
	if (SelectedM == 8 && !canUseCybot08)
		SelectedM++;
	if (SelectedM == 9 && !canUseCybot09)
		SelectedM++;
	
	if (SelectedM > 10 || (SelectedM == 10 && !canUseCybot10))
		SelectedM = 0;
}

function checkCybot()
{
local bool canUseCybot01, canUseCybot02, canUseCybot03, 
canUseCybot04, canUseCybot05, canUseCybot06, canUseCybot07, canUseCybot08, canUseCybot09, canUseCybot10;

	canUseCybot01 = (AmmoUsage[1] <= AmmoType.AmmoAmount && enCybot01);
	canUseCybot02 = (AmmoUsage[2] <= AmmoType.AmmoAmount && enCybot02);
	canUseCybot03 = (AmmoUsage[3] <= AmmoType.AmmoAmount && enCybot03);
	canUseCybot04 = (AmmoUsage[4] <= AmmoType.AmmoAmount && enCybot04);
	canUseCybot05 = (AmmoUsage[5] <= AmmoType.AmmoAmount && enCybot05);
	canUseCybot06 = (AmmoUsage[6] <= AmmoType.AmmoAmount && enCybot06);
	canUseCybot07 = (AmmoUsage[7] <= AmmoType.AmmoAmount && enCybot07);
	canUseCybot08 = (AmmoUsage[8] <= AmmoType.AmmoAmount && enCybot08);
	canUseCybot09 = (AmmoUsage[9] <= AmmoType.AmmoAmount && enCybot09);
	canUseCybot10 = (AmmoUsage[10] <= AmmoType.AmmoAmount && enCybot10);

	while (AmmoUsage[SelectedM] > AmmoType.AmmoAmount && SelectedM > 0)
		SelectedM--;
		
	if (SelectedM >= 10 && !canUseCybot10)
		SelectedM = 9;
	if (SelectedM == 9 && !canUseCybot09)
		SelectedM--;
	if (SelectedM == 8 && !canUseCybot08)
		SelectedM--;
	if (SelectedM == 7 && !canUseCybot07)
		SelectedM--;
	if (SelectedM == 6 && !canUseCybot06)
		SelectedM--;
	if (SelectedM == 5 && !canUseCybot05)
		SelectedM--;
	if (SelectedM == 4 && !canUseCybot04)
		SelectedM--;
	if (SelectedM == 3 && !canUseCybot03)
		SelectedM--;
	if (SelectedM == 2 && !canUseCybot02)
		SelectedM--;	
	if (SelectedM == 1 && !canUseCybot01)
		SelectedM--;
}

simulated function PlayAltFiring()
{
	PlayAnim('AltFire', 2.0, 0.0);
	CurrentCybotScreen = ScreenCybot[SelectedM];
	UpdateScreen();
	
	if (FirstOverFXActor[1] != None)
		FirstOverFXActor[1].ScaleGlow = 1.0;

	PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*3.0);
}

function Fire( float Value )
{
    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));
	
	if (AmmoType.UseAmmo(AmmoUsage[SelectedM]))
	{
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
        ClientFire(Value);
		ProjectileFire(CybotProjClass[SelectedM], ProjectileSpeed, bWarnTarget);
		checkCybot();
	}
	
	PlayFiring();
}

simulated function PlayFiring()
{
	PlayAnim('Fire', 1.0, 0.0);
	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*5.0);
	CurrentCybotScreen = ScreenCybot[SelectedM];
	UpdateScreen();
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

function float RateSelf( out int bUseAltMode )
{
	local float Rating;
	local Pawn P;

	P = Pawn(Owner);

	//No enemy, ready to fire
	if ( P.Enemy == None )
        	return AIRating;

	//Don't recommend self if out of ammo
	if ( AmmoType.AmmoAmount <=0 )
        	return -2;
	if (P.Region.Zone.bWaterZone)
			return -2;

	bUseAltMode = int(FRand() + 0.5);
	return (AIRating + FRand() * 0.05);
}

function BotCybotDeployement(float Delta)
{
local Pawn P;
local byte selectTriesCount;
local vector vView;

	P = Pawn(Owner);
	if (!Class'NWUtils'.static.isElegibleBotAI(P, True, FRand()*4.0) || P.Region.Zone.bWaterZone || !checkDeployPriority(P))
		return;
	
	CountBot += Delta;
	if (CountBot >= 1.5)
	{
		CountBot = 0;
		
		if (P.Enemy != None && P.LineOfSightTo(P.Enemy))
			return;
		
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
		
		selectTriesCount = 0;
		while (selectTriesCount < 10 && FRand() > 0.35)
		{
			changeCybot();
			selectTriesCount++;
		}
			
		if (SelectedM == 3)
			changeCybot();
		
		vView = VRand();
		if (vView.Z > 0)
			vView.Z /= 10;
		
		P.ViewRotation = rotator(vView);
		P.bAltFire = 0;
		P.bFire = 1;
		P.Weapon.Fire(1.0);
	}
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local CyMaster CyM;
local rotator R;

	if (ref == None)
		return;
	if (ref.Instigator != None)
		R = rotator(ref.Location - HitLocation);
	else
		R.Yaw = int(FRand() * 65536 - 32768);
	CyM = ref.Spawn(Class'CyMaster',,, HitLocation, R);
	CyM.SetMaster(ref.Instigator);
}

static function OversurrectorExplodeClient(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local CyMBaseCloudMaster master;
local rotator R;

	if (ref == None)
		return;
	ref.Spawn(Class'CyMInitShake',,, HitLocation);
	ref.Spawn(Class'CyMInitLight',,, HitLocation);
	ref.Spawn(Class'CyMInitLine',,, HitLocation);
	
	R.Yaw = int(FRand() * 65536 - 32768);
	master = ref.Spawn(Class'CyMBaseCloudMaster',,, HitLocation, R);
	ref.Spawn(Class'CyMBaseCloud', master,, HitLocation, R);
	ref.Spawn(Class'CyMBaseCloudB', master,, HitLocation, R);
	ref.Spawn(Class'CyMBaseCloudElectric', master,, HitLocation, R);
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	if (i == 0)
		CFXClass = Class'CyOversFXA';
	else if (i == 1)
		CFXClass = Class'CyOversFXB';
	else if (i == 2)
		CFXClass = Class'CyOversFXC';
	else
		CFXClass = Class'CyOversFXD';
	return (i <= 22);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CybotLauncherPick
	CollisionHeight=22.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=10
	Icon=CybotLauncherIcon
	InventoryGroup=10
	ItemArticle="a"
	ItemName="Cybot Launcher"
	MaxDesireability=1.100000
	PickupMessage="You got the Cybot Launcher."
	PickupSound=CybotPickup
	PickupViewMesh=CybotLauncherPick
	PickupViewScale=1.000000
	PlayerViewMesh=CybotLauncherR
	PlayerViewOffset=(X=14.00000,Y=-6.500000,Z=-5.500000)
	WidePlayerViewOffset=(X=14.00000,Y=-6.500000,Z=-5.500000)
	PlayerViewScale=1.000000
	RespawnTime=90.000000
	StatusIcon=CybotLauncherIcon
	ThirdPersonMesh=CybotLauncherM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=CybotAltFire
	AltProjectileClass=None
	AmmoName=Class'CybotAmmo'
	bInstantHit=False
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was assassinated by one of %k's cybots."
	FireOffset=(X=0.000000,Y=0.000000,Z=-2.000000)
	FireSound=CybotFire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Cybotized
	NameColor=(R=0,G=255,B=0)
	PickupAmmoCount=5
	ProjectileClass=None
	SelectSound=CybotSelect
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.750000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=True
	bSplashDamage=True
	bWarnTarget=False
	RefireRate=0.500000
	Mass=50.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=CybotLauncherCross
	CustomCrossAlpha=CybotLauncherCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Portable cybots deployment device.\n\nPrimary Fire: Deployment of cybots.\n\nSecondary Fire: Selection of the cybot kind the player wants to deploy."
	
	Texture=CybotMetal
	
	PlayerViewMeshLeft=CybotLauncher
	PlayerViewMeshRight=CybotLauncherR
	HandPartMeshL(0)=CybotLauncherHandL
	HandPartMeshR(0)=CybotLauncherHandR
	BobDamping=1.075000
	
	RenderOffsetSelect=(Y=-1.500000,Z=2.000000)
	AnimMaxFrame=0.857129
	CenterPlayerViewOffset=(X=12.000000,Y=1.300000,Z=-6.000000)
	WideCenterPlayerViewOffset=(X=14.000000,Y=1.300000,Z=-7.500000)
	
	FireOffsetZAdjustHidden=-8.000000
	
	FirstPersonOverFX(0)=(bLit=True)
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.75000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'CybotScreenOvFL',CustomMesh=Mesh'CybotScreenOvFR')
	
	FirstPersonOverFX(1)=(bLit=True,OverTex1=StaticC0)
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=0.275000,bCustomMesh=True)
	FirstPersonOverFX(1)=(CustomMeshLeft=Mesh'CybotScreenOvFL',CustomMesh=Mesh'CybotScreenOvFR')
	
	PickupOverFX(0)=(bLit=True,OverTex1=StaticC0)
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=0.275000,bCustomMesh=True)
	PickupOverFX(0)=(CustomMesh=Mesh'CybotScreenOvP')
	
	AmmoUsage(0)=1
	AmmoUsage(1)=2
	AmmoUsage(2)=3
	AmmoUsage(3)=3
	AmmoUsage(4)=5
	AmmoUsage(5)=5
	AmmoUsage(6)=8
	AmmoUsage(7)=8
	AmmoUsage(8)=8
	AmmoUsage(9)=8
	AmmoUsage(10)=12
	ScreenCybot(0)=CybotScreen01
	ScreenCybot(1)=CybotScreen02
	ScreenCybot(2)=CybotScreen03
	ScreenCybot(3)=CybotScreen04
	ScreenCybot(4)=CybotScreen05
	ScreenCybot(5)=CybotScreen06
	ScreenCybot(6)=CybotScreen07
	ScreenCybot(7)=CybotScreen08
	ScreenCybot(8)=CybotScreen09
	ScreenCybot(9)=CybotScreen10
	ScreenCybot(10)=CybotScreen11
	CybotProjClass(0)=Class'CybotDeploySentinel'
	CybotProjClass(1)=Class'CybotDeployDualSentinel'
	CybotProjClass(2)=Class'CybotDeployAndroidF'
	CybotProjClass(3)=Class'CybotDeployAndroidG'
	CybotProjClass(4)=Class'CybotDeployHeliF'
	CybotProjClass(5)=Class'CybotDeployHeliG'
	CybotProjClass(6)=Class'CybotDeployDroneF'
	CybotProjClass(7)=Class'CybotDeployDroneG'
	CybotProjClass(8)=Class'CybotDeployKamikaze'
	CybotProjClass(9)=Class'CybotDeployFField'
	CybotProjClass(10)=Class'CybotDeployVortex'
	
	bMegaWeapon=True
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Sentinel (1)",optionColor=(R=0,G=255,B=255))
	renderOptions(1)=(optionText="Dual Sentinel (2)",optionColor=(R=0,G=255,B=255))
	renderOptions(2)=(optionText="Android F (3)",optionColor=(R=0,G=255,B=255))
	renderOptions(3)=(optionText="Android G (3)",optionColor=(R=0,G=255,B=255))
	renderOptions(4)=(optionText="Heli F (5)",optionColor=(R=0,G=255,B=255))
	renderOptions(5)=(optionText="Heli G (5)",optionColor=(R=0,G=255,B=255))
	renderOptions(6)=(optionText="Drone F (8)",optionColor=(R=0,G=255,B=255))
	renderOptions(7)=(optionText="Drone G (8)",optionColor=(R=0,G=255,B=255))
	renderOptions(8)=(optionText="Kamikaze (8)",optionColor=(R=0,G=255,B=255))
	renderOptions(9)=(optionText="F-Field (8)",optionColor=(R=0,G=255,B=255))
	renderOptions(10)=(optionText="Vortex (12)",optionColor=(R=0,G=255,B=255))
	
	
	bFriendlyFire=False
	bGuardianReturnToOrigin=True
	AITrackingMaxSteps=32
	bCanBeTelefragged=True
	bCanBeTelefraggedByOwner=False
	bCanBeTelefraggedByTeam=False
	enableCybotBeacons=True
	CybotBeaconsTextDist=1000.000000
	ReduceCybotBeaconsOnDistance=True
	enableCybotBeaconsText=True
	enableCybotDeathAknMessages=True
	CybotBeaconsMaxDistance=5000.000000
	bAlwaysSeeCybotBeacons=False
	CybotProjDmgMultiplier=1.000000
	CybotHealthMultiplier=1.000000
	CybotProjSpeedMultiplier=1.000000
	FieldHealth=1500
	FieldDamage=1000
	bFieldKillPawns=False
	KamiBaseDamage=1000
	VortexBaseDamage=1000
	VortexHealth=1500
	ElectricalDamageScale=1.000000
	ElectricDamageTypes(0)=Electrified
	ElectricDamageTypes(1)=ElectricCombo
	enableCybot01=True
	enableCybot02=True
	enableCybot03=True
	enableCybot04=True
	enableCybot05=True
	enableCybot06=True
	enableCybot07=True
	enableCybot08=True
	enableCybot09=True
	enableCybot10=True
	MaxCybotsPerPlayer=0
	
	CybotSentinelHealth=250
	CybotDualSentinelHealth=300
	CybotAndroidHealth=350
	CybotHeliHealth=500
	CybotDroneHealth=850
	CybotsMaxLifeSpan=0.000000
	FieldMaxLifeSpan=0.000000
	VortexMaxLifeSpan=0.000000
	
	CybotFriends(0)=FortStandard
	CybotFriends(1)=FlockPawn
	CybotFriends(2)=FlockMasterPawn
	CybotFriends(3)=Cow
	CybotFriends(4)=Nali
	
	DeployAIPriority=16
	
	CybotNames(0)="X-01"
	CybotNames(1)="X-02"
	CybotNames(2)="X-03"
	CybotNames(3)="X-04"
	CybotNames(4)="X-05"
	CybotNames(5)="X-06"
	CybotNames(6)="X-07"
	CybotNames(7)="X-08"
	CybotNames(8)="X-09"
	CybotNames(9)="X-10"
	CybotNames(10)="X-11"
	CybotNames(11)="X-12"
	CybotNames(12)="X-13"
	CybotNames(13)="X-14"
	CybotNames(14)="X-15"
	CybotNames(15)="X-16"
	CybotNames(16)="X-17"
	CybotNames(17)="X-18"
	CybotNames(18)="X-19"
	CybotNames(19)="X-20"
	CybotNames(20)="X-21"
	CybotNames(21)="X-22"
	CybotNames(22)="X-23"
	CybotNames(23)="X-24"
	CybotNames(24)="X-25"
	CybotNames(25)="X-26"
	CybotNames(26)="X-27"
	CybotNames(27)="X-28"
	CybotNames(28)="X-29"
	CybotNames(29)="X-30"
	CybotNames(30)="X-31"
	CybotNames(31)="X-32"
	
	FFieldBounceList(0)=TranslocatorTarget
	FFieldBounceList(1)=CybotDeployProj
	FFieldBounceList(2)=RTTrans
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=255,G=0,B=0)
	OversurrectorFXColors(0)=(R=192,G=0,B=0)
	OversurrectorFXColors(1)=(R=255,G=0,B=0)
	OversurrectorFXColors(2)=(R=96,G=0,B=8)
	OversurrectorFXColors(3)=(R=255,G=0,B=8)
	OversurrectorFXColors(4)=(R=64,G=64,B=64)
	OversurrectorFXColors(5)=(R=32,G=32,B=32)
	OversurrectorFXColors(6)=(R=192,G=0,B=4)
	OversurrectorFXColors(7)=(R=255,G=0,B=0)
	OversurrectorFXColors(8)=(R=255,G=0,B=0)
	OversurrectorFXColors(9)=(R=64,G=64,B=64)
	OversurrectorFXColors(10)=(R=64,G=64,B=64)
	OversurrectorFXColors(11)=(R=255,G=0,B=0)
	OversurrectorFXColors(12)=(R=128,G=0,B=0)
	OversurrectorFXColors(13)=(R=255,G=0,B=0)
	OversurrectorFXColors(14)=(R=192,G=16,B=16)
	OversurrectorFXColors(15)=(R=128,G=32,B=32)
	OversurrectorFXColors(16)=(R=64,G=64,B=64)
	OversurrectorFXColors(17)=(R=32,G=32,B=32)
	OversurrectorFXColors(18)=(R=192,G=0,B=0)
	OversurrectorFXColors(19)=(R=128,G=0,B=0)
	OversurrectorFXColors(20)=(R=255,G=0,B=0)
	OversurrectorFXColors(21)=(R=255,G=16,B=16)
	OversurrectorFXColors(22)=(R=255,G=8,B=8)
	OversurrectorFXColors(23)=(R=255,G=0,B=0)
	
	OversurrectorLightHue(0)=0
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=0
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=0
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'CybotLOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=80.000000
	OversurrectionHealth=50000
	OversurrectionChildrenHealth=5000
	OversurrectionChildrenInnerMaxRadius=140.000000
	OversurrectionChildrenOuterMaxRadius=1000.000000
	OversurrectionChildrenMax=75
	OversurrectionChildrenDefenseMin=10
	OversurrectionChildrenMoveTimeInterval=2.000000
	OversurrectionChildrenAutoAttackOdds=0.300000
	OversurrectionZapAttackOdds=0.350000
	OversurrectionZapAttackCooldown=1.250000
	OversurrectionZapAttackDmg=500
	OversurrectionProjAttackOdds=0.650000
	OversurrectionProjAttackCooldown=0.500000
	OversurrectionProjAttackDmg=300
	OversurrectionHomingAttackOdds=0.150000
	OversurrectionHomingAttackCooldown=2.500000
	OversurrectionHomingAttackDmg=750
}
