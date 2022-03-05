//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuclear Launcher weapon
//				Feralidragon (04-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLauncher expands NaliWeapons config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=NuclearLauncher ANIVFILE=MODELS\NuclearLauncher_a.3d DATAFILE=MODELS\NuclearLauncher_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearLauncher STRENGTH=0
#exec MESH ORIGIN MESH=NuclearLauncher X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=NuclearLauncherR ANIVFILE=MODELS\NuclearLauncher_a.3d DATAFILE=MODELS\NuclearLauncher_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=5
#exec MESH LODPARAMS MESH=NuclearLauncherR STRENGTH=0
#exec MESH ORIGIN MESH=NuclearLauncherR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=NuclearLauncherPick ANIVFILE=MODELS\NuclearLauncher_a.3d DATAFILE=MODELS\NuclearLauncher_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=5
//#exec MESH LODPARAMS MESH=NuclearLauncherPick STRENGTH=0
#exec MESH ORIGIN MESH=NuclearLauncherPick X=0 Y=0 Z=0

//3rd person
#exec MESH IMPORT MESH=NuclearLauncherM ANIVFILE=MODELS\NuclearLauncher_a.3d DATAFILE=MODELS\NuclearLauncher_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=5
#exec MESH LODPARAMS MESH=NuclearLauncherM STRENGTH=0.45
#exec MESH ORIGIN MESH=NuclearLauncherM X=-350 Y=0 Z=-55

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=NuclearLauncher SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearLauncher SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearLauncher SEQ=AltFire STARTFRAME=27 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=NuclearLauncher SEQ=Fire STARTFRAME=0 NUMFRAMES=28 RATE=28.0
#exec MESH SEQUENCE MESH=NuclearLauncher SEQ=Select STARTFRAME=34 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=NuclearLauncher SEQ=Down STARTFRAME=28 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=NuclearLauncherR SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearLauncherR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearLauncherR SEQ=AltFire STARTFRAME=27 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=NuclearLauncherR SEQ=Fire STARTFRAME=0 NUMFRAMES=28 RATE=28.0
#exec MESH SEQUENCE MESH=NuclearLauncherR SEQ=Select STARTFRAME=34 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=NuclearLauncherR SEQ=Down STARTFRAME=28 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=NuclearLauncherPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=NuclearLauncherM SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearLauncherM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearLauncherM SEQ=AltFire STARTFRAME=27 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=NuclearLauncherM SEQ=Fire STARTFRAME=0 NUMFRAMES=28 RATE=28.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=NuclearLauncher MESH=NuclearLauncher
#exec MESHMAP SCALE MESHMAP=NuclearLauncher X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=NuclearLauncherR MESH=NuclearLauncherR
#exec MESHMAP SCALE MESHMAP=NuclearLauncherR X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=NuclearLauncherPick MESH=NuclearLauncherPick
#exec MESHMAP SCALE MESHMAP=NuclearLauncherPick X=0.15 Y=0.15 Z=0.30

#exec MESHMAP NEW MESHMAP=NuclearLauncherM MESH=NuclearLauncherM
#exec MESHMAP SCALE MESHMAP=NuclearLauncherM X=0.10 Y=0.10 Z=0.20

//-----------------------------------------------------------------------------------

//Screens
#exec TEXTURE IMPORT NAME=NuclearScreen00 FILE=SCREENS\NuclearScreen00.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=NuclearScreen01 FILE=SCREENS\NuclearScreen01.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=NuclearScreen02 FILE=SCREENS\NuclearScreen02.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=NuclearScreen03 FILE=SCREENS\NuclearScreen03.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=NuclearScreen04 FILE=SCREENS\NuclearScreen04.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=NuclearScreen05 FILE=SCREENS\NuclearScreen05.bmp GROUP=Screens LODSET=0 MIPS=OFF

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=NuclearLauncherSk01 FILE=SKINS\NuclearLauncherSk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncher NUM=1 TEXTURE=NuclearLauncherSk01
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherR NUM=1 TEXTURE=NuclearLauncherSk01
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherPick NUM=1 TEXTURE=NuclearLauncherSk01
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherM NUM=1 TEXTURE=NuclearLauncherSk01

#exec TEXTURE IMPORT NAME=NuclearLauncherSk02 FILE=SKINS\NuclearLauncherSk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncher NUM=2 TEXTURE=NuclearLauncherSk02
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherR NUM=2 TEXTURE=NuclearLauncherSk02
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherPick NUM=2 TEXTURE=NuclearLauncherSk02
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherM NUM=2 TEXTURE=NuclearLauncherSk02

#exec TEXTURE IMPORT NAME=NuclearLauncherSk03 FILE=SKINS\NuclearLauncherSk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncher NUM=3 TEXTURE=NuclearLauncherSk03
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherR NUM=3 TEXTURE=NuclearLauncherSk03
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherPick NUM=3 TEXTURE=NuclearLauncherSk03
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherM NUM=3 TEXTURE=NuclearLauncherSk03

#exec TEXTURE IMPORT NAME=NuclearLauncherSk04 FILE=SKINS\NuclearLauncherSk04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncher NUM=4 TEXTURE=NuclearLauncherSk04
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherR NUM=4 TEXTURE=NuclearLauncherSk04
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherPick NUM=4 TEXTURE=NuclearLauncherSk04
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherM NUM=4 TEXTURE=NuclearLauncherSk04

#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncher NUM=5 TEXTURE=NuclearScreen00
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherR NUM=5 TEXTURE=NuclearScreen00
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherPick NUM=5 TEXTURE=NuclearScreen00
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherM NUM=5 TEXTURE=NuclearScreen00

#exec TEXTURE IMPORT NAME=NukeMetal FILE=SKINS\NukeMetal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=NuclearLauncherIcon FILE=ICONS\NuclearLauncherIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeCrossAlpha FILE=ICONS\NukeCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\NuclearLauncherIcons.utx PACKAGE=NWNuclearLauncherVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="NuclearPickup" FILE=SOUNDS\NuclearPickup.wav GROUP="NuclearLauncher"
#exec AUDIO IMPORT NAME="NuclearSelect" FILE=SOUNDS\NuclearSelect.wav GROUP="NuclearLauncher"
#exec AUDIO IMPORT NAME="NuclearFire" FILE=SOUNDS\NuclearFire.wav GROUP="NuclearLauncher"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=NuclearLauncherHandL ANIVFILE=MODELS\NuclearLauncherHand_a.3d DATAFILE=MODELS\NuclearLauncherHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearLauncherHandL STRENGTH=0
#exec MESH ORIGIN MESH=NuclearLauncherHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=NuclearLauncherHandR ANIVFILE=MODELS\NuclearLauncherHand_a.3d DATAFILE=MODELS\NuclearLauncherHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=NuclearLauncherHandR STRENGTH=0
#exec MESH ORIGIN MESH=NuclearLauncherHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=NuclearLauncherHandL SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearLauncherHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearLauncherHandL SEQ=AltFire STARTFRAME=27 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=NuclearLauncherHandL SEQ=Fire STARTFRAME=0 NUMFRAMES=28 RATE=28.0
#exec MESH SEQUENCE MESH=NuclearLauncherHandL SEQ=Select STARTFRAME=34 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=NuclearLauncherHandL SEQ=Down STARTFRAME=28 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=NuclearLauncherHandR SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearLauncherHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearLauncherHandR SEQ=AltFire STARTFRAME=27 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=NuclearLauncherHandR SEQ=Fire STARTFRAME=0 NUMFRAMES=28 RATE=28.0
#exec MESH SEQUENCE MESH=NuclearLauncherHandR SEQ=Select STARTFRAME=34 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=NuclearLauncherHandR SEQ=Down STARTFRAME=28 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=NuclearLauncherHandL MESH=NuclearLauncherHandL
#exec MESHMAP SCALE MESHMAP=NuclearLauncherHandL X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=NuclearLauncherHandR MESH=NuclearLauncherHandR
#exec MESHMAP SCALE MESHMAP=NuclearLauncherHandR X=0.045 Y=0.045 Z=0.09

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=NuclearLauncherHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//OVERLAYER MESHES
//*******************************************************
#exec MESH IMPORT MESH=NuclearLauncherScreenOvFL ANIVFILE=MODELS\NuclearLauncherScreenOv_a.3d DATAFILE=MODELS\NuclearLauncherScreenOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=NuclearLauncherScreenOvFL STRENGTH=0
#exec MESH ORIGIN MESH=NuclearLauncherScreenOvFL X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=NuclearLauncherScreenOvFR ANIVFILE=MODELS\NuclearLauncherScreenOv_a.3d DATAFILE=MODELS\NuclearLauncherScreenOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=1
//#exec MESH LODPARAMS MESH=NuclearLauncherScreenOvFR STRENGTH=0
#exec MESH ORIGIN MESH=NuclearLauncherScreenOvFR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=NuclearLauncherScreenOvP ANIVFILE=MODELS\NuclearLauncherScreenOv_a.3d DATAFILE=MODELS\NuclearLauncherScreenOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=1
//#exec MESH LODPARAMS MESH=NuclearLauncherScreenOvP STRENGTH=0
#exec MESH ORIGIN MESH=NuclearLauncherScreenOvP X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFL SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFL SEQ=AltFire STARTFRAME=27 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFL SEQ=Fire STARTFRAME=0 NUMFRAMES=28 RATE=28.0
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFL SEQ=Select STARTFRAME=34 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFL SEQ=Down STARTFRAME=28 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFR SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFR SEQ=AltFire STARTFRAME=27 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFR SEQ=Fire STARTFRAME=0 NUMFRAMES=28 RATE=28.0
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFR SEQ=Select STARTFRAME=34 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvFR SEQ=Down STARTFRAME=28 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=NuclearLauncherScreenOvP SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=NuclearLauncherScreenOvFL MESH=NuclearLauncherScreenOvFL
#exec MESHMAP SCALE MESHMAP=NuclearLauncherScreenOvFL X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=NuclearLauncherScreenOvFR MESH=NuclearLauncherScreenOvFR
#exec MESHMAP SCALE MESHMAP=NuclearLauncherScreenOvFR X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=NuclearLauncherScreenOvP MESH=NuclearLauncherScreenOvP
#exec MESHMAP SCALE MESHMAP=NuclearLauncherScreenOvP X=0.15 Y=0.15 Z=0.30


#exec OBJ LOAD FILE=Textures\NukeStaticFX.utx PACKAGE=NWNuclearLauncherVIII_SRC.NukeStaticFX

//===========================================================================

//Guided screen stuff
#exec TEXTURE IMPORT NAME=NukeCBack FILE=ICONS\NukeCBack.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearWindowView01 FILE=ICONS\NuclearWindowView01.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearWindowView02 FILE=ICONS\NuclearWindowView02.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearWindowView03 FILE=ICONS\NuclearWindowView03.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearWindowView04 FILE=ICONS\NuclearWindowView04.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearWindowView05 FILE=ICONS\NuclearWindowView05.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearWindowView06 FILE=ICONS\NuclearWindowView06.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearCrossView01 FILE=ICONS\NuclearCrossView01.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearCrossView02 FILE=ICONS\NuclearCrossView02.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearCrossView03 FILE=ICONS\NuclearCrossView03.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearCrossView04 FILE=ICONS\NuclearCrossView04.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearCrossViewCenter FILE=ICONS\NuclearCrossViewCenter.bmp GROUP=Icons MIPS=OFF LODSET=0

//===========================================================================


var(ServerConfig) config float NukeSpeed, MaxNukeSpeed, GuidedNukeSpeed;

var(ServerConfig) config bool bDestructableNuke, bNukeWhenDestroyed, CanBeDestroyedByTeam;
var(ServerConfig) config float MissileColRadius, MissileColHeight;
var(ServerConfig) config int DamageToDestroy;

var(ServerConfig) config byte GuidedFOVIncrease;
var(ServerConfig) config bool enableHUDOrientation, enableHUDAltitude, enableHUDPawnTargets, enableHUDMachineTargets;
var(ServerConfig) config float MaxPawnsDetectionRadius, MaxMachinesDetectionRadius;
var(ServerConfig) config bool checkHiddenTargets;
var(ServerConfig) config bool checkTeamTargets;
var(ClientConfig) globalconfig float CrossSidesTransparency, CrossCenterTransparency;

var(ServerConfig) config int DestroyedNukeDamage, ImpactDamage;
var(ServerConfig) config int ImpactMomentum;
var(ServerConfig) config float DestroyedNukeRadius, ImpactRadius;

var(ServerConfig) globalconfig name DetectedMachines[32];
var(ServerConfig) globalconfig name NonDetectedObjects[32];

var(ServerConfig) config bool bCannonsWarheadTrackAI, bBotsWarheadTrackAI;
var(ServerConfig) config bool guidedNukeExplodeOnDeath;
var(ServerConfig) config bool enableDeniedMsg;

var(ServerConfig) config bool bShakeFXOnFire;


var(NukeRender) texture ScreenTex[6];
var(NukeRender) texture CrossTex[4];
var(NukeRender) texture DarkBackground;
var(NukeRender) texture StaticBackground;
var(NukeRender) texture NukeCrossCenterTex;
var(NukeRender) color NukeCrossColor;
var(NukeRender) color NukeCrossCenterColor;

var NuclearGuidedMissile GuidedShell;
var PlayerPawn GuidingPawn;
var bool bGuiding, bCanFire, bShowStatic;
var rotator StartRotation;

replication
{
	// Things the server should send to the client.
	reliable if( bNetOwner && (Role==ROLE_Authority) )
		bGuiding, bShowStatic;
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
	//Screen flickering and update
	if (FirstOverFXActor[0] != None)
		FirstOverFXActor[0].ScaleGlow = 0.75 + FRand() * 0.75 ;
}

function Fire(float Value)
{
    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));
	
	if (AmmoType.UseAmmo(1))
	{
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
        ClientFire(Value);
		ProjectileFire(ProjectileClass, ProjectileSpeed, bWarnTarget);
		if (default.bShakeFXOnFire)
			Spawn(Class'NuclearLaunchShakeFX');
	}
}

simulated function PlayFiring()
{
	PlayAnim('Fire', 1.0, 0.0);
	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*15.0);
}

simulated function PostRender(canvas Canvas)
{
local float CntX, CntY;
local float X1, X2, X3, X4;
local float Y1, Y2;
local float Scale;
local byte staticVal;

	bOwnsCrossHair = (bGuiding || bShowStatic || class'NaliWeapons'.default.bCustomCrosshair);
	
	if (!bGuiding && !bShowStatic)
	{
		Super.PostRender(Canvas);
		return;
	}

	if (GuidedShell != None)
		GuidedShell.PostRender(Canvas);
	
	//Generic properties
	CntX = Canvas.ClipX/2;
	CntY = Canvas.ClipY/2;
	
	//Static Render
	Canvas.bNoSmooth = True;
	if (bShowStatic)
	{
		staticVal = 255;
		Canvas.Style = ERenderStyle.STY_Normal;
		if (PlayerPawn(Owner) != None)
			PlayerPawn(Owner).ViewTarget = None;
	}
	else
	{
		staticVal = 16;
		Canvas.Style = ERenderStyle.STY_Translucent;
	}
	
	Canvas.SetPos(0,0);
	Canvas.DrawColor.R = staticVal;
	Canvas.DrawColor.G = staticVal;
	Canvas.DrawColor.B = staticVal;
	Canvas.DrawPattern(StaticBackground, Canvas.ClipX, Canvas.ClipY, 0.5);
	
	//Screen Crosshair Render
	if (!bShowStatic && (default.CrossSidesTransparency > 0.0 || default.CrossCenterTransparency > 0.0))
	{
		Scale = Canvas.ClipY/512;
		X1 = (Canvas.ClipX - 768*Scale)/2;
		X2 = X1 + 256*Scale;
		X3 = X2 + 256*Scale;
		X4 = X3 + 256*Scale;
		Y1 = 0;
		Y2 = CntY;
		
		Canvas.bNoSmooth = False;
		Canvas.Style = ERenderStyle.STY_Translucent;
		
		if (default.CrossSidesTransparency > 0.0)
		{
			Canvas.DrawColor = default.CrossSidesTransparency*NukeCrossColor;
			Canvas.SetPos(X1, Y1);
			Canvas.DrawIcon(CrossTex[0], Scale);
			Canvas.SetPos(X3, Y1);
			Canvas.DrawIcon(CrossTex[1], Scale);
			Canvas.SetPos(X1, Y2);
			Canvas.DrawIcon(CrossTex[2], Scale);
			Canvas.SetPos(X3, Y2);
			Canvas.DrawIcon(CrossTex[3], Scale);
		}
		
		if (default.CrossCenterTransparency > 0.0)
		{
			Canvas.DrawColor = default.CrossCenterTransparency*NukeCrossCenterColor;
			Canvas.SetPos(X2, CntY - (NukeCrossCenterTex.VSize/2)*Scale);
			Canvas.DrawIcon(NukeCrossCenterTex, Scale);
		}
	}

	//Screen Render
	Scale = Canvas.ClipY/512;
	X1 = (Canvas.ClipX - 768*Scale)/2;
	X2 = X1 + 256*Scale;
	X3 = X2 + 256*Scale;
	X4 = X3 + 256*Scale;
	Y1 = 0;
	Y2 = CntY;
	
	Canvas.bNoSmooth = True;
	Canvas.Style = ERenderStyle.STY_Modulated;
	Canvas.SetPos(X1, Y1);
	Canvas.DrawIcon(ScreenTex[0], Scale);
	Canvas.SetPos(X2, Y1);
	Canvas.DrawIcon(ScreenTex[1], Scale);
	Canvas.SetPos(X3, Y1);
	Canvas.DrawIcon(ScreenTex[2], Scale);
	Canvas.SetPos(X1, Y2);
	Canvas.DrawIcon(ScreenTex[3], Scale);
	Canvas.SetPos(X2, Y2);
	Canvas.DrawIcon(ScreenTex[4], Scale);
	Canvas.SetPos(X3, Y2);
	Canvas.DrawIcon(ScreenTex[5], Scale);
	
	//Screen sides occusion render
	Canvas.bNoSmooth = True;
	Canvas.Style = ERenderStyle.STY_Normal;
	Canvas.DrawColor.R = 255;
	Canvas.DrawColor.G = 255;
	Canvas.DrawColor.B = 255;
	
	Canvas.SetPos(0, 0);
	Canvas.DrawRect(DarkBackground, X1, Canvas.ClipY);
	Canvas.SetPos( X4, 0);
	Canvas.DrawRect(DarkBackground, X1, Canvas.ClipY);
}   

function float RateSelf(out int bUseAltMode)
{
local Pawn P, E;
local float min_dist, max_dist;

	if (AmmoType.AmmoAmount <=0 || Pawn(Owner) == None || Pawn(Owner).Enemy == None)
		return -2;

	bUseAltMode = 0;
	E = Pawn(Owner).Enemy;
	max_dist = 650.0;
	min_dist = 500.0;

	for ( P=Level.PawnList; P!=None; P=P.NextPawn )
	{
		if ( P.bIsPlayer && (P != Owner) && (P != E)
		&& (!Level.Game.bTeamGame || (Pawn(Owner).PlayerReplicationInfo.Team != P.PlayerReplicationInfo.Team))
		&& (VSize(E.Location - P.Location) < max_dist) 
		&& (!Level.Game.IsA('TeamGamePlus') || (Bot(Owner) != None && TeamGamePlus(Level.Game).PriorityObjective(Bot(Owner)) < 2))
		&& FastTrace(P.Location, E.Location) )
		{
			if (VSize(E.Location - Owner.Location) > min_dist)
				return 2.0;
			return 1.0;
		}
	}

	return 0.35;
}

// return delta to combat style
function float SuggestAttackStyle()
{
	return -1.0;
}

function AltFire(float Value)
{
	if (PlayerPawn(Owner) == None)
	{
		Fire(Value);
		return;
	}

	if (AmmoType.UseAmmo(1))
	{
		//PlayerPawn(Owner).ShakeView(ShakeTime, ShakeMag, ShakeVert);
		bPointing=True;
		Pawn(Owner).PlayRecoil(FiringSpeed);
		PlayFiring();
		GuidedShell = NuclearGuidedMissile(AltProjectileFire(AltProjectileClass, ProjectileSpeed, bWarnTarget));
		GuidedShell.SetOwner(Owner);
		GuidedShell.NukeWeapon = Self;
		PlayerPawn(Owner).ViewTarget = GuidedShell;
		GuidedShell.Guider = PlayerPawn(Owner);
		ClientAltFire(0);
		if (default.bShakeFXOnFire)
			Spawn(Class'NuclearLaunchShakeFX');
		GotoState('Guiding');
	}
}

simulated function bool ClientAltFire( float Value )
{
	if (bCanClientFire && ((Role == ROLE_Authority) || (AmmoType == None) || (AmmoType.AmmoAmount > 0)))
	{
		if (Affector != None)
			Affector.FireEffect();
		PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*15.0);
		return True;
	}
	
	return False;
}

state Guiding
{
	function Fire ( float Value )
	{
		if ( !bCanFire )
			return;
		if ( GuidedShell != None )
			GuidedShell.Explode(GuidedShell.Location, vect(0,0,1));
		bCanClientFire = True;
		GotoState('Finishing');
	}

	function AltFire ( float Value )
	{
		Fire(Value);
	}

	function BeginState()
	{
		bGuiding = True;
		bCanFire = False;
		if (PlayerPawn(Owner) != None)
		{
			GuidingPawn = PlayerPawn(Owner);
			StartRotation = PlayerPawn(Owner).ViewRotation;
			PlayerPawn(Owner).ClientAdjustGlow(-0.2,vect(200,0,0));
		}
	}

	function EndState()
	{
		bGuiding = False;
		if (GuidingPawn != None)
		{
			GuidingPawn.ClientAdjustGlow(0.2,vect(-200,0,0));
			GuidingPawn.ClientSetRotation(StartRotation);
			GuidingPawn = None;
		}
	}


Begin:
	Sleep(1.0);
	bCanFire = True;
}

state Finishing
{
ignores Fire, AltFire;

	function BeginState()
	{
		bShowStatic = True;
	}

Begin:
	Sleep(0.3);
	bShowStatic = False;
	Sleep(1.0);
	GotoState('Idle');
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearLauncherPick
	CollisionHeight=26.000000
	CollisionRadius=32.000000
	AutoSwitchPriority=10
	Icon=NuclearLauncherIcon
	InventoryGroup=10
	ItemArticle="a"
	ItemName="Nuclear Launcher"
	MaxDesireability=10.000000
	PickupMessage="You got the Nuclear Launcher."
	PickupSound=NuclearPickup
	PickupViewMesh=NuclearLauncherPick
	PickupViewScale=1.000000
	PlayerViewMesh=NuclearLauncherR
	PlayerViewOffset=(X=16.00000,Y=-6.500000,Z=-6.500000)
	WidePlayerViewOffset=(X=16.00000,Y=-6.500000,Z=-6.500000)
	PlayerViewScale=1.000000
	RespawnTime=90.000000
	StatusIcon=NuclearLauncherIcon
	ThirdPersonMesh=NuclearLauncherM
	ThirdPersonScale=0.700000
	AltDamageType=None
	AltFireSound=NuclearFire
	AltProjectileClass=Class'NuclearGuidedMissile'
	AmmoName=Class'NuclearAmmo'
	bInstantHit=False
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was completelly vaporized by %k's %w blast."
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=NuclearFire
	FiringSpeed=1.000000
	MaxTargetRange=8000.000000
	MyDamageType=Nuclear
	NameColor=(R=192,G=192,B=192)
	PickupAmmoCount=1
	ProjectileClass=NuclearMissile
	SelectSound=NuclearSelect
	shakemag=0.000000
	shaketime=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=10.000000
	AltRefireRate=1.000000
	bAltWarnTarget=True
	bRecommendAltSplashDamage=True
	bRecommendSplashDamage=True
	bSplashDamage=True
	bWarnTarget=True
	RefireRate=0.500000
	Mass=200.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=NukeCross
	CustomCrossAlpha=NukeCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Portable nuclear missile launcher.\n\nPrimary Fire: Launch of a fire-and-forget nuclear missile.\n\nSecondary Fire: Launch of a remotely guided nuclear missile."
	
	Texture=NukeMetal
	bMegaWeapon=True
	bForceHands=True
	
	PlayerViewMeshLeft=NuclearLauncher
	PlayerViewMeshRight=NuclearLauncherR
	HandPartMeshL(0)=NuclearLauncherHandL
	HandPartMeshR(0)=NuclearLauncherHandR
	HandsBaseFatness=130
	BobDamping=1.100000
	
	FireOffsetZAdjustHidden=-12.000000
	
	RenderOffsetSelect=(Y=-1.500000,Z=2.000000)
	AnimMaxFrame=0.857129
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Nuclear Level 0",optionColor=(R=0,G=255,B=255))
	
	MultiSkins(5)=NuclearScreen00
	FirstPersonOverFX(0)=(bLit=True,OverTex1=NuclearScreen00)
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.75000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'NuclearLauncherScreenOvFL',CustomMesh=Mesh'NuclearLauncherScreenOvFR')
	
	FirstPersonOverFX(1)=(bLit=True,OverTex1=StaticD0)
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=0.275000,bCustomMesh=True)
	FirstPersonOverFX(1)=(CustomMeshLeft=Mesh'NuclearLauncherScreenOvFL',CustomMesh=Mesh'NuclearLauncherScreenOvFR')
	
	PickupOverFX(0)=(bLit=True,OverTex1=StaticD0)
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=0.275000,bCustomMesh=True)
	PickupOverFX(0)=(CustomMesh=Mesh'NuclearLauncherScreenOvP')
	
	ScreenTex(0)=NuclearWindowView01
	ScreenTex(1)=NuclearWindowView02
	ScreenTex(2)=NuclearWindowView03
	ScreenTex(3)=NuclearWindowView04
	ScreenTex(4)=NuclearWindowView05
	ScreenTex(5)=NuclearWindowView06
	CrossTex(0)=NuclearCrossView01
	CrossTex(1)=NuclearCrossView02
	CrossTex(2)=NuclearCrossView03
	CrossTex(3)=NuclearCrossView04
	DarkBackground=NukeCBack
	StaticBackground=StaticD0
	NukeCrossCenterTex=NuclearCrossViewCenter
	NukeCrossColor=(R=255,G=255,B=255)
	NukeCrossCenterColor=(R=255,G=255,B=255)
	
	
	NukeSpeed=1500.000000
	MaxNukeSpeed=1800.000000
	GuidedNukeSpeed=750.000000
	bDestructableNuke=True
	bNukeWhenDestroyed=True
	CanBeDestroyedByTeam=False
	bCannonsWarheadTrackAI=True
	bBotsWarheadTrackAI=True
	guidedNukeExplodeOnDeath=True
	MissileColRadius=15.000000
	MissileColHeight=8.000000
	DamageToDestroy=5
	GuidedFOVIncrease=50
	enableHUDOrientation=True
	enableHUDAltitude=True
	enableHUDPawnTargets=True
	enableHUDMachineTargets=True
	enableDeniedMsg=False
	MaxPawnsDetectionRadius=3000.000000
	MaxMachinesDetectionRadius=4000.000000
	CrossSidesTransparency=0.200000
	CrossCenterTransparency=0.500000
	checkHiddenTargets=True
	checkTeamTargets=True
	DestroyedNukeDamage=1000
	DestroyedNukeRadius=450.000000
	ImpactDamage=1000
	ImpactRadius=1000.000000
	ImpactMomentum=80000
	bShakeFXOnFire=True
	
	DetectedMachines(0)=Cybot
	DetectedMachines(1)=NWMine
	DetectedMachines(2)=RTTrans
	DetectedMachines(3)=TranslocatorTarget
	DetectedMachines(4)=StrangeShell
	DetectedMachines(5)=WarShell
	DetectedMachines(6)=DumbRocket
	DetectedMachines(7)=NuclearMissile
	DetectedMachines(8)=FortStandard
	DetectedMachines(9)=TeamCannon
	
	NonDetectedObjects(0)=sgBuilding
}
