//////////////////////////////////////////////////////////////
//	Nali Weapons III TheMiner weapon
//				Feralidragon (10-10-2010)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////

class TheMiner expands NaliWeapons config(NWeaponsCfg);


//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=TheMiner ANIVFILE=MODELS\TheMiner_a.3d DATAFILE=MODELS\TheMiner_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheMiner STRENGTH=0
#exec MESH ORIGIN MESH=TheMiner X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=TheMinerR ANIVFILE=MODELS\TheMiner_a.3d DATAFILE=MODELS\TheMiner_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=TheMinerR STRENGTH=0
#exec MESH ORIGIN MESH=TheMinerR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=TheMinerPick ANIVFILE=MODELS\TheMiner_a.3d DATAFILE=MODELS\TheMiner_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=TheMinerPick STRENGTH=0
#exec MESH ORIGIN MESH=TheMinerPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=TheMinerM ANIVFILE=MODELS\TheMiner_a.3d DATAFILE=MODELS\TheMiner_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheMinerM STRENGTH=0.45
#exec MESH ORIGIN MESH=TheMinerM X=340 Y=0 Z=-20 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=TheMiner SEQ=All STARTFRAME=0 NUMFRAMES=23
#exec MESH SEQUENCE MESH=TheMiner SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMiner SEQ=AltFire STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=TheMiner SEQ=Fire STARTFRAME=1 NUMFRAMES=10 RATE=10.0
#exec MESH SEQUENCE MESH=TheMiner SEQ=Select STARTFRAME=16 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheMiner SEQ=Down STARTFRAME=10 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=TheMinerR SEQ=All STARTFRAME=0 NUMFRAMES=23
#exec MESH SEQUENCE MESH=TheMinerR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerR SEQ=AltFire STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=TheMinerR SEQ=Fire STARTFRAME=1 NUMFRAMES=10 RATE=10.0
#exec MESH SEQUENCE MESH=TheMinerR SEQ=Select STARTFRAME=16 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheMinerR SEQ=Down STARTFRAME=10 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=TheMinerPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=TheMinerM SEQ=All STARTFRAME=0 NUMFRAMES=23
#exec MESH SEQUENCE MESH=TheMinerM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerM SEQ=AltFire STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=TheMinerM SEQ=Fire STARTFRAME=1 NUMFRAMES=10 RATE=10.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=TheMiner MESH=TheMiner
#exec MESHMAP SCALE MESHMAP=TheMiner X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheMinerR MESH=TheMinerR
#exec MESHMAP SCALE MESHMAP=TheMinerR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheMinerPick MESH=TheMinerPick
#exec MESHMAP SCALE MESHMAP=TheMinerPick X=0.095 Y=0.095 Z=0.19

#exec MESHMAP NEW MESHMAP=TheMinerM MESH=TheMinerM
#exec MESHMAP SCALE MESHMAP=TheMinerM X=0.075 Y=0.075 Z=0.15

//-----------------------------------------------------------------------------------

//Screens
#exec TEXTURE IMPORT NAME=MineScreen01 FILE=SCREENS\MineScreen01.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MineScreen02 FILE=SCREENS\MineScreen02.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MineScreen03 FILE=SCREENS\MineScreen03.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MineScreen04 FILE=SCREENS\MineScreen04.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MineScreen05 FILE=SCREENS\MineScreen05.bmp GROUP=Screens LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MineScreen06 FILE=SCREENS\MineScreen06.bmp GROUP=Screens LODSET=0 MIPS=OFF

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=TheMiner_Sk01 FILE=SKINS\TheMiner_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheMiner NUM=1 TEXTURE=TheMiner_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerR NUM=1 TEXTURE=TheMiner_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerPick NUM=1 TEXTURE=TheMiner_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerM NUM=1 TEXTURE=TheMiner_Sk01

#exec TEXTURE IMPORT NAME=TheMiner_Sk02 FILE=SKINS\TheMiner_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheMiner NUM=2 TEXTURE=TheMiner_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerR NUM=2 TEXTURE=TheMiner_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerPick NUM=2 TEXTURE=TheMiner_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerM NUM=2 TEXTURE=TheMiner_Sk02

#exec TEXTURE IMPORT NAME=TheMiner_Sk03 FILE=SKINS\TheMiner_Sk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheMiner NUM=3 TEXTURE=TheMiner_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerR NUM=3 TEXTURE=TheMiner_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerPick NUM=3 TEXTURE=TheMiner_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerM NUM=3 TEXTURE=TheMiner_Sk03

#exec MESHMAP SETTEXTURE MESHMAP=TheMiner NUM=4 TEXTURE=MineScreen01
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerR NUM=4 TEXTURE=MineScreen01
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerPick NUM=4 TEXTURE=MineScreen01
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerM NUM=4 TEXTURE=MineScreen01

#exec TEXTURE IMPORT NAME=TheMinerMetal FILE=SKINS\TheMinerMetal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=TheMinerIcon FILE=ICONS\TheMinerIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=TheMinerCrossAlpha FILE=ICONS\TheMinerCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\TheMinerIcons.utx PACKAGE=NWTheMinerVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="TheMinerPick" FILE=SOUNDS\TheMinerPick.wav GROUP="TheMiner"
#exec AUDIO IMPORT NAME="TheMinerSelect" FILE=SOUNDS\TheMinerSelect.wav GROUP="TheMiner"
#exec AUDIO IMPORT NAME="TheMinerFire" FILE=SOUNDS\TheMinerFire.wav GROUP="TheMiner"
#exec AUDIO IMPORT NAME="TheMinerAltFire" FILE=SOUNDS\TheMinerAltFire.wav GROUP="TheMiner"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=TheMinerHandL ANIVFILE=MODELS\TheMinerHand_a.3d DATAFILE=MODELS\TheMinerHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheMinerHandL STRENGTH=0
#exec MESH ORIGIN MESH=TheMinerHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=TheMinerHandR ANIVFILE=MODELS\TheMinerHand_a.3d DATAFILE=MODELS\TheMinerHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=TheMinerHandR STRENGTH=0
#exec MESH ORIGIN MESH=TheMinerHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=TheMinerHandL SEQ=All STARTFRAME=0 NUMFRAMES=23
#exec MESH SEQUENCE MESH=TheMinerHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerHandL SEQ=AltFire STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=TheMinerHandL SEQ=Fire STARTFRAME=1 NUMFRAMES=10 RATE=10.0
#exec MESH SEQUENCE MESH=TheMinerHandL SEQ=Select STARTFRAME=16 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheMinerHandL SEQ=Down STARTFRAME=10 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=TheMinerHandR SEQ=All STARTFRAME=0 NUMFRAMES=23
#exec MESH SEQUENCE MESH=TheMinerHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerHandR SEQ=AltFire STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=TheMinerHandR SEQ=Fire STARTFRAME=1 NUMFRAMES=10 RATE=10.0
#exec MESH SEQUENCE MESH=TheMinerHandR SEQ=Select STARTFRAME=16 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheMinerHandR SEQ=Down STARTFRAME=10 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=TheMinerHandL MESH=TheMinerHandL
#exec MESHMAP SCALE MESHMAP=TheMinerHandL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheMinerHandR MESH=TheMinerHandR
#exec MESHMAP SCALE MESHMAP=TheMinerHandR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//OVERLAYER MESHES
//*******************************************************
#exec MESH IMPORT MESH=TheMinerScreenOvFL ANIVFILE=MODELS\TheMinerScreenOv_a.3d DATAFILE=MODELS\TheMinerScreenOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=TheMinerScreenOvFL STRENGTH=0
#exec MESH ORIGIN MESH=TheMinerScreenOvFL X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=TheMinerScreenOvFR ANIVFILE=MODELS\TheMinerScreenOv_a.3d DATAFILE=MODELS\TheMinerScreenOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=1
//#exec MESH LODPARAMS MESH=TheMinerScreenOvFR STRENGTH=0
#exec MESH ORIGIN MESH=TheMinerScreenOvFR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=TheMinerScreenOvP ANIVFILE=MODELS\TheMinerScreenOv_a.3d DATAFILE=MODELS\TheMinerScreenOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=TheMinerScreenOvP STRENGTH=0
#exec MESH ORIGIN MESH=TheMinerScreenOvP X=0 Y=0 Z=0 Yaw=128

//Animations
#exec MESH SEQUENCE MESH=TheMinerScreenOvFL SEQ=All STARTFRAME=0 NUMFRAMES=23
#exec MESH SEQUENCE MESH=TheMinerScreenOvFL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerScreenOvFL SEQ=AltFire STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=TheMinerScreenOvFL SEQ=Fire STARTFRAME=1 NUMFRAMES=10 RATE=10.0
#exec MESH SEQUENCE MESH=TheMinerScreenOvFL SEQ=Select STARTFRAME=16 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheMinerScreenOvFL SEQ=Down STARTFRAME=10 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=TheMinerScreenOvFR SEQ=All STARTFRAME=0 NUMFRAMES=23
#exec MESH SEQUENCE MESH=TheMinerScreenOvFR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerScreenOvFR SEQ=AltFire STARTFRAME=0 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=TheMinerScreenOvFR SEQ=Fire STARTFRAME=1 NUMFRAMES=10 RATE=10.0
#exec MESH SEQUENCE MESH=TheMinerScreenOvFR SEQ=Select STARTFRAME=16 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheMinerScreenOvFR SEQ=Down STARTFRAME=10 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=TheMinerScreenOvP SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=TheMinerScreenOvFL MESH=TheMinerScreenOvFL
#exec MESHMAP SCALE MESHMAP=TheMinerScreenOvFL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheMinerScreenOvFR MESH=TheMinerScreenOvFR
#exec MESHMAP SCALE MESHMAP=TheMinerScreenOvFR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheMinerScreenOvP MESH=TheMinerScreenOvP
#exec MESHMAP SCALE MESHMAP=TheMinerScreenOvP X=0.095 Y=0.095 Z=0.19


#exec OBJ LOAD FILE=Textures\MineStaticFX.utx PACKAGE=NWTheMinerVIII_SRC.MineStaticFX

//===========================================================================

var() texture ScreenMine[6];
var() class<Projectile> MineProj[6];
var() int AmmoUsage[6];

var(ServerConfig) config bool bUseAmmoSea, bUseAmmoVeh, bUseAmmoAir;
var(ServerConfig) config bool enableJump, enableSea, enableLand, enableVeh, enableAir;
var(ServerConfig) config int armorAttach, armorJump, armorSea, armorLand, armorVeh, armorAir;
var(ServerConfig) config float MinesLifeSpan;
var(ServerConfig) config bool bDetectableMinesByAI;
var(ServerConfig) config bool enableFriendlyDamage;
var(ServerConfig) config bool bMineChainReaction;
var(ServerConfig) config name SensedMachines[32];
var(ServerConfig) config bool enableMineBeacons;
var(ServerConfig) config bool ReduceMineBeaconsOnDistance;
var(ServerConfig) config float MineBeaconsMaxDistance;
var(ServerConfig) config int MaxMinesPerPlayer;

var byte SelectedM;
var bool bAmmoSea, bAmmoVeh, bAmmoAir;
var bool enJump, enSea, enLand, enVeh, enAir;

var float globalDelta;
var float CountM;
var float CountBot;
var texture CurrentMineScreen;

//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime;
var(Oversurrection) config float OversurrectionSpreadRate, OversurrectionSpreadEvalMaxH, OversurrectionSpreadMaxRadius, OversurrectionSpreadMinRadius;
var(Oversurrection) config int OversurrectionSpreadMax;
var(Oversurrection) config float OversurrectionMinesMinLifespan, OversurrectionMinesMaxLifespan, OversurrectionMinesDmgRadius;
var(Oversurrection) config int OversurrectionMinesHealth, OversurrectionMinesDamage;


replication
{
	reliable if (ROLE == Role_Authority && bNetOwner)
		SelectedM;
		
	reliable if (ROLE == Role_Authority)
		CurrentMineScreen, enJump, enSea, enLand, enVeh, enAir, bAmmoSea, bAmmoVeh, bAmmoAir;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();

	CurrentMineScreen = ScreenMine[0];
	MultiSkins[4] = CurrentMineScreen;
	bAmmoSea = default.bUseAmmoSea;
	bAmmoVeh = default.bUseAmmoVeh;
	bAmmoAir = default.bUseAmmoAir;
	enJump = default.enableJump;
	enLand = default.enableLand;
	enSea = default.enableSea;
	enVeh = default.enableVeh;
	enAir = default.enableAir;
	
	if (default.enableMineBeacons && default.MineBeaconsMaxDistance > 0.0)
		AddAuxMutator(Class'MinesRadarMut');
}

simulated function SetDefaultDisplay()
{
	Super.SetDefaultDisplay();
	MultiSkins[4] = CurrentMineScreen;
}

simulated function bool isMineScreenTexture(texture Tex, optional bool bTrueIfDefault, optional byte DefSkinN)
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
	
	for (i = 0; i < ArrayCount(ScreenMine); i++)
	{
		if (Tex == ScreenMine[i])
			return True;
	}
	
	return False;
}

simulated function UpdateScreen()
{
	if (isMineScreenTexture(MultiSkins[4], True, 4))
		MultiSkins[4] = CurrentMineScreen;
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
	//Screen flickering and update
	if (FirstOverFXActor[0] != None)
	{
		FirstOverFXActor[0].Multiskins[1] = CurrentMineScreen;
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
	BotMineDeployement(Delta);
	Super.Tick(Delta);
	
	if (Pawn(Owner) == None || Pawn(Owner).Weapon != Self)
		return;
	
	if (Pawn(Owner) != None && AmmoType != None)
	{
		CountM += Delta;
		
		if (CountM >= 0.5)
		{
			checkMine();
			CurrentMineScreen = ScreenMine[SelectedM];
			UpdateScreen();
			CountM = 0;
		}
	}
}

simulated function byte getRenderOptionIndex()
{
	return SelectedM;
}

function AltFire( float Value )
{
	changeMine();
    GotoState('AltFiring');
    bPointing=True;
    bCanClientFire = true;
    ClientAltFire(Value);
}

function changeMine()
{
local bool canUseJump, canUseLand, canUseSea, canUseVeh, canUseAir;

	SelectedM++;
	
	canUseJump = (AmmoUsage[1] <= AmmoType.AmmoAmount || bInfinity) && enJump;
	canUseLand = (AmmoUsage[2] <= AmmoType.AmmoAmount || bInfinity) && enLand;
	canUseSea = (AmmoUsage[3] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoSea)) && enSea;
	canUseVeh = (AmmoUsage[4] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoVeh)) && enVeh;
	canUseAir = (AmmoUsage[5] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoAir)) && enAir;

	if (SelectedM == 1 && !canUseJump)
		SelectedM++;
	
	if (SelectedM == 2 && !canUseLand)
		SelectedM++;
	
	if (SelectedM == 3 && !canUseSea)
		SelectedM++;
	
	if (SelectedM == 4 && !canUseVeh)
		SelectedM++;
	
	if (SelectedM > 5 || (SelectedM == 5 && !canUseAir))
		SelectedM = 0;
}

function checkMine()
{
local bool canUseJump, canUseLand, canUseSea, canUseVeh, canUseAir;

	canUseJump = (AmmoUsage[1] <= AmmoType.AmmoAmount || bInfinity) && enJump;
	canUseLand = (AmmoUsage[2] <= AmmoType.AmmoAmount || bInfinity) && enLand;
	canUseSea = (AmmoUsage[3] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoSea)) && enSea;
	canUseVeh = (AmmoUsage[4] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoVeh)) && enVeh;
	canUseAir = (AmmoUsage[5] <= AmmoType.AmmoAmount || (bInfinity && !bAmmoAir)) && enAir;

	if (!bInfinity)
	{
		while (AmmoUsage[SelectedM] > AmmoType.AmmoAmount && SelectedM > 0)
			SelectedM--;
		
		if (SelectedM >= 5 && !canUseAir)
			SelectedM = 4;
		
		if (SelectedM == 4 && !canUseVeh)
			SelectedM--;
		
		if (SelectedM == 3 && !canUseSea)
			SelectedM--;
		
		if (SelectedM == 2 && !canUseLand)
			SelectedM--;
		
		if (SelectedM == 1 && !canUseJump)
			SelectedM--;
	}
	else
	{
		while ((SelectedM == 1 && !canUseJump) || (SelectedM == 2 && !canUseLand) || (SelectedM == 3 && !canUseSea) || (SelectedM == 4 && !canUseVeh) || (SelectedM == 5 && !canUseAir))
			SelectedM--;
	}
}

function bool checkInfAmmoUsage()
{
	return (SelectedM < 3 || (SelectedM == 3 && !bAmmoSea) || (SelectedM == 4 && !bAmmoVeh) || (SelectedM == 5 && !bAmmoAir));
}

simulated function PlayAltFiring()
{
	PlayAnim('AltFire', 2.0, 0.0);
	CurrentMineScreen = ScreenMine[SelectedM];
	UpdateScreen();
	
	if (FirstOverFXActor[1] != None)
		FirstOverFXActor[1].ScaleGlow = 1.0;

	PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*3.0);
}

function Fire( float Value )
{
    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));
	
	if ((bInfinity && checkInfAmmoUsage()) || AmmoType.UseAmmo(AmmoUsage[SelectedM]))
	{
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
        ClientFire(Value);
		ProjectileFire(MineProj[SelectedM], ProjectileSpeed, bWarnTarget);
		if (default.MaxMinesPerPlayer > 0)
			checkMaxMines();
		checkMine();
	}
	
	PlayFiring();
}

function checkMaxMines()
{
local NWMine NWM;
local int nMines;

	if (Pawn(Owner) == None)
		return;
	foreach AllActors(Class'NWMine', NWM)
	{
		if (NWM.Instigator == Pawn(Owner))
			nMines++;
	}
	
	if (nMines > default.MaxMinesPerPlayer)
	{
		nMines -= default.MaxMinesPerPlayer;
		foreach AllActors(Class'NWMine', NWM)
		{
			if (NWM.Instigator == Pawn(Owner))
			{
				NWM.ExplodeX(NWM.Location, vector(NWM.Rotation));
				nMines--;
				if (nMines <= 0)
					return;
			}
		}
	}
}

simulated function PlayFiring()
{
	PlayAnim('Fire', 1.0 * GetFirerateMult(), 0.0);
	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*5.0);
	CurrentMineScreen = ScreenMine[SelectedM];
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
	if (P.Region.Zone.IsA('LavaZone') || P.Region.Zone.DamageType == 'Burned')
		return -2;

	EnemyDir = P.Enemy.Location - Owner.Location; 
	EnemyDist = VSize(EnemyDir);
	
	//Choose mine
	if (!bInfinity && AmmoType.AmmoAmount < AmmoUsage[SelectedM])
		bUseAltMode = 1;
	else if (SelectedM == 5 && EnemyDist > 300*FMax(1.0, Splasher))
		bUseAltMode = 0;
	else if (SelectedM == 4 && EnemyDist > 150*FMax(1.0, Splasher))
		bUseAltMode = int(FRand() + 0.5);
	else if (SelectedM == 3 && EnemyDist > 100*FMax(1.0, Splasher))
		bUseAltMode = int(FRand() + 0.5);
	else
		bUseAltMode = int(FRand() + 0.5);

	return (AIRating + FRand() * 0.05);
}

function BotMineDeployement(float Delta)
{
local Pawn P;
local byte selectTriesCount;
local vector vView;

	P = Pawn(Owner);
	if (!Class'NWUtils'.static.isElegibleBotAI(P, True, FRand()*3.0) || P.Region.Zone.IsA('LavaZone') || P.Region.Zone.DamageType == 'Burned' || !checkDeployPriority(P))
		return;
	
	CountBot += Delta;
	if (CountBot >= 1.0)
	{
		CountBot = 0;
		if ((P.Enemy != None && P.LineOfSightTo(P.Enemy)) || NWMine(P.Target) != None)
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
		if (!P.Region.Zone.bWaterZone)
		{
			while (selectTriesCount < 6 && FRand() > 0.35)
			{
				changeMine();
				selectTriesCount++;
			}
			
			if (SelectedM == 3)
				changeMine();
		}
		else
		{
			SelectedM = 3;
			checkMine();
		}
		
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
	if (ref == None)
		return;
	ref.Spawn(Class'TheMinerGndMineField',,, HitLocation + HitNormal);
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'TheMinerOversFXA';		break;
		case 1:	CFXClass = Class'TheMinerOversFXB';		break;
		case 2:	CFXClass = Class'TheMinerOversFXAOV';	break;
		case 3:	CFXClass = Class'TheMinerOversFXBOV';	break;
	}
	return (i <= 3);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheMinerPick
	CollisionHeight=15.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=8
	Icon=TheMinerIcon
	InventoryGroup=8
	ItemArticle="a"
	ItemName="The Miner"
	MaxDesireability=0.900000
	PickupMessage="You got The Miner."
	PickupSound=TheMinerPick
	PickupViewMesh=TheMinerPick
	PickupViewScale=1.000000
	PlayerViewMesh=TheMinerR
	PlayerViewOffset=(X=14.00000,Y=-6.000000,Z=-5.500000)
	WidePlayerViewOffset=(X=14.00000,Y=-6.000000,Z=-5.500000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=TheMinerIcon
	ThirdPersonMesh=TheMinerM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=TheMinerAltFire
	AltProjectileClass=None
	AmmoName=Class'TheMinerAmmo'
	bInstantHit=False
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was exploded to bits by one of %k's mines."
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=TheMinerFire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=MineExplosion
	NameColor=(R=255,G=255,B=255)
	PickupAmmoCount=5
	ProjectileClass=None
	SelectSound=TheMinerSelect
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
	CustomCross=TheMinerCross
	CustomCrossAlpha=TheMinerCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Mine deployment device.\n\nPrimary Fire: Mine deployment.\n\nSecondary Fire: Selection of the mine the player wants to deploy."
	
	Texture=TheMinerMetal
	
	PlayerViewMeshLeft=TheMiner
	PlayerViewMeshRight=TheMinerR
	HandPartMeshL(0)=TheMinerHandL
	HandPartMeshR(0)=TheMinerHandR
	BobDamping=1.075000
	
	RenderOffsetSelect=(Y=-1.500000,Z=2.000000)
	AnimMaxFrame=0.857129
	
	
	FirstPersonOverFX(0)=(bLit=True)
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.50000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'TheMinerScreenOvFL',CustomMesh=Mesh'TheMinerScreenOvFR')
	
	FirstPersonOverFX(1)=(bLit=True,OverTex1=StaticB0)
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=0.275000,bCustomMesh=True)
	FirstPersonOverFX(1)=(CustomMeshLeft=Mesh'TheMinerScreenOvFL',CustomMesh=Mesh'TheMinerScreenOvFR')
	
	PickupOverFX(0)=(bLit=True,OverTex1=StaticB0)
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=0.275000,bCustomMesh=True)
	PickupOverFX(0)=(CustomMesh=Mesh'TheMinerScreenOvP')
	
	AmmoUsage(0)=1
	AmmoUsage(1)=2
	AmmoUsage(2)=5
	AmmoUsage(3)=6
	AmmoUsage(4)=10
	AmmoUsage(5)=25
	ScreenMine(0)=MineScreen01
	ScreenMine(1)=MineScreen02
	ScreenMine(2)=MineScreen03
	ScreenMine(3)=MineScreen04
	ScreenMine(4)=MineScreen05
	ScreenMine(5)=MineScreen06
	MineProj(0)=Class'AttachMine'
	MineProj(1)=Class'JumpMine'
	MineProj(2)=Class'LandMine'
	MineProj(3)=Class'SeaMine'
	MineProj(4)=Class'VehMine'
	MineProj(5)=Class'AirMine'
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Attach (1)",optionColor=(R=0,G=255,B=0))
	renderOptions(1)=(optionText="Jump (2)",optionColor=(R=0,G=255,B=0))
	renderOptions(2)=(optionText="Land (5)",optionColor=(R=0,G=255,B=0))
	renderOptions(3)=(optionText="Sea (6)",optionColor=(R=0,G=255,B=0))
	renderOptions(4)=(optionText="Vehicle (10)",optionColor=(R=0,G=255,B=0))
	renderOptions(5)=(optionText="Air (25)",optionColor=(R=0,G=255,B=0))
	
	
	enableJump=True
	enableLand=True
	enableSea=True
	enableVeh=True
	enableAir=True
	armorAttach=40
	armorJump=80
	armorLand=125
	armorSea=150
	armorVeh=250
	armorAir=275
	bDetectableMinesByAI=True
	MinesLifeSpan=180.000000
	enableMineBeacons=True
	ReduceMineBeaconsOnDistance=True
	MineBeaconsMaxDistance=1024.000000
	MaxMinesPerPlayer=0
	
	SensedMachines(0)=NuclearMissile
	SensedMachines(1)=StrangeShell
	SensedMachines(2)=WarShell
	SensedMachines(3)=DumbRocket
	SensedMachines(4)=TranslocatorTarget
	SensedMachines(5)=RTTrans
	
	DeployAIPriority=8
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=0,G=255,B=0)
	OversurrectorFXColors(0)=(R=0,G=192,B=0)
	OversurrectorFXColors(1)=(R=0,G=255,B=128)
	OversurrectorFXColors(2)=(R=0,G=64,B=16)
	OversurrectorFXColors(3)=(R=64,G=128,B=64)
	OversurrectorFXColors(4)=(R=0,G=64,B=0)
	OversurrectorFXColors(5)=(R=48,G=128,B=96)
	OversurrectorFXColors(6)=(R=96,G=96,B=96)
	OversurrectorFXColors(7)=(R=0,G=64,B=0)
	OversurrectorFXColors(8)=(R=0,G=64,B=0)
	OversurrectorFXColors(9)=(R=0,G=128,B=0)
	OversurrectorFXColors(10)=(R=0,G=128,B=0)
	OversurrectorFXColors(11)=(R=0,G=192,B=96)
	OversurrectorFXColors(12)=(R=0,G=32,B=0)
	OversurrectorFXColors(13)=(R=96,G=128,B=128)
	OversurrectorFXColors(14)=(R=64,G=128,B=96)
	OversurrectorFXColors(15)=(R=32,G=128,B=64)
	OversurrectorFXColors(16)=(R=16,G=128,B=32)
	OversurrectorFXColors(17)=(R=0,G=128,B=16)
	OversurrectorFXColors(18)=(R=0,G=96,B=0)
	OversurrectorFXColors(19)=(R=0,G=16,B=0)
	OversurrectorFXColors(20)=(R=0,G=96,B=48)
	OversurrectorFXColors(21)=(R=64,G=128,B=64)
	OversurrectorFXColors(22)=(R=32,G=64,B=32)
	OversurrectorFXColors(23)=(R=0,G=32,B=0)
	
	OversurrectorLightHue(0)=85
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=106
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=85
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'TheMinerOversProj'
	
	enableOversurrection=True
	OversurrectionLifeTime=25.000000
	OversurrectionSpreadRate=10.000000
	OversurrectionSpreadMax=6
	OversurrectionSpreadEvalMaxH=384.000000
	OversurrectionSpreadMaxRadius=2048.000000
	OversurrectionSpreadMinRadius=384.000000
	OversurrectionMinesMinLifespan=15.000000
	OversurrectionMinesMaxLifespan=45.000000
	OversurrectionMinesDmgRadius=384.000000
	OversurrectionMinesHealth=200
	OversurrectionMinesDamage=500
}
