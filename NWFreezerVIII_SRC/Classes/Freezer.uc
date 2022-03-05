//////////////////////////////////////////////////////////////
//	Nali Weapons III Freezer weapon
//				Feralidragon (02-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class Freezer expands NaliWeapons config(NWeaponsCfg);

#exec OBJ LOAD FILE=Textures\FreezerGFX.utx PACKAGE=NWFreezerVIII_SRC.FreezerGFX

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=Freezer ANIVFILE=MODELS\Freezer_a.3d DATAFILE=MODELS\Freezer_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=Freezer STRENGTH=0
#exec MESH ORIGIN MESH=Freezer X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FreezerR ANIVFILE=MODELS\Freezer_a.3d DATAFILE=MODELS\Freezer_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FreezerR STRENGTH=0
#exec MESH ORIGIN MESH=FreezerR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=FreezerPick ANIVFILE=MODELS\Freezer_a.3d DATAFILE=MODELS\Freezer_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=FreezerPick STRENGTH=0
#exec MESH ORIGIN MESH=FreezerPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=FreezerM ANIVFILE=MODELS\Freezer_a.3d DATAFILE=MODELS\Freezer_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerM STRENGTH=0.45
#exec MESH ORIGIN MESH=FreezerM X=360 Y=0 Z=-20 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=Freezer SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=Freezer SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Freezer SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=Freezer SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=Freezer SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=Freezer SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerR SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerR SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerR SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerR SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerR SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=FreezerM SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerM SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerM SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=Freezer MESH=Freezer
#exec MESHMAP SCALE MESHMAP=Freezer X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerR MESH=FreezerR
#exec MESHMAP SCALE MESHMAP=FreezerR X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerPick MESH=FreezerPick
#exec MESHMAP SCALE MESHMAP=FreezerPick X=0.10625 Y=0.10625 Z=0.2125

#exec MESHMAP NEW MESHMAP=FreezerM MESH=FreezerM
#exec MESHMAP SCALE MESHMAP=FreezerM X=0.085 Y=0.085 Z=0.17

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Freezer_Sk01 FILE=SKINS\Freezer_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Freezer NUM=1 TEXTURE=Freezer_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=FreezerR NUM=1 TEXTURE=Freezer_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=FreezerPick NUM=1 TEXTURE=Freezer_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=FreezerM NUM=1 TEXTURE=Freezer_Sk01

#exec TEXTURE IMPORT NAME=Freezer_Sk02 FILE=SKINS\Freezer_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Freezer NUM=2 TEXTURE=Freezer_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=FreezerR NUM=2 TEXTURE=Freezer_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=FreezerPick NUM=2 TEXTURE=Freezer_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=FreezerM NUM=2 TEXTURE=Freezer_Sk02

#exec TEXTURE IMPORT NAME=Freezer_Sk03 FILE=SKINS\Freezer_Sk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Freezer NUM=3 TEXTURE=Freezer_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=FreezerR NUM=3 TEXTURE=Freezer_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=FreezerPick NUM=3 TEXTURE=Freezer_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=FreezerM NUM=3 TEXTURE=Freezer_Sk03

#exec TEXTURE IMPORT NAME=FreezerMetal FILE=SKINS\FreezerMetal.bmp GROUP=Skins LODSET=2


//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=FreezerIcon FILE=ICONS\FreezerIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=FreezerCrossAlpha FILE=ICONS\FreezerCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\FreezerIcons.utx PACKAGE=NWFreezerVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="Freezer_Select" FILE=SOUNDS\Freezer_Select.wav GROUP="Freezer"
#exec AUDIO IMPORT NAME="Freezer_Pick" FILE=SOUNDS\Freezer_Pick.wav GROUP="Freezer"
#exec AUDIO IMPORT NAME="FreezerFire" FILE=SOUNDS\FreezerFire.wav GROUP="Freezer"
#exec AUDIO IMPORT NAME="FreezerAltFire" FILE=SOUNDS\FreezerAltFire.wav GROUP="Freezer"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=FreezerHandL ANIVFILE=MODELS\FreezerHand_a.3d DATAFILE=MODELS\FreezerHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerHandL STRENGTH=0
#exec MESH ORIGIN MESH=FreezerHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=FreezerHandR ANIVFILE=MODELS\FreezerHand_a.3d DATAFILE=MODELS\FreezerHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FreezerHandR STRENGTH=0
#exec MESH ORIGIN MESH=FreezerHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=FreezerHandL SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerHandL SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerHandL SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerHandL SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerHandL SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerHandR SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerHandR SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerHandR SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerHandR SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerHandR SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=FreezerHandL MESH=FreezerHandL
#exec MESHMAP SCALE MESHMAP=FreezerHandL X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerHandR MESH=FreezerHandR
#exec MESHMAP SCALE MESHMAP=FreezerHandR X=0.0255 Y=0.0255 Z=0.051

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=FreezerHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=FreezerHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//BIG GLOWS
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FreezerBigGlows ANIVFILE=MODELS\FreezerBigGlows_a.3d DATAFILE=MODELS\FreezerBigGlows_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerBigGlows STRENGTH=0
#exec MESH ORIGIN MESH=FreezerBigGlows X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FreezerBigGlowsR ANIVFILE=MODELS\FreezerBigGlows_a.3d DATAFILE=MODELS\FreezerBigGlows_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FreezerBigGlowsR STRENGTH=0
#exec MESH ORIGIN MESH=FreezerBigGlowsR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=FreezerBigGlowsPick ANIVFILE=MODELS\FreezerBigGlows_a.3d DATAFILE=MODELS\FreezerBigGlows_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FreezerBigGlowsPick X=0 Y=0 Z=0 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FreezerBigGlows SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerBigGlows SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerBigGlows SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerBigGlows SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerBigGlows SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerBigGlows SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerBigGlowsR SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerBigGlowsR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerBigGlowsR SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerBigGlowsR SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerBigGlowsR SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerBigGlowsR SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerBigGlowsPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FreezerBigGlows MESH=FreezerBigGlows
#exec MESHMAP SCALE MESHMAP=FreezerBigGlows X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerBigGlowsR MESH=FreezerBigGlowsR
#exec MESHMAP SCALE MESHMAP=FreezerBigGlowsR X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerBigGlowsPick MESH=FreezerBigGlowsPick
#exec MESHMAP SCALE MESHMAP=FreezerBigGlowsPick X=0.10625 Y=0.10625 Z=0.2125

//===========================================================================

//Small GLOWS
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FreezerSmallGlows ANIVFILE=MODELS\FreezerSmallGlows_a.3d DATAFILE=MODELS\FreezerSmallGlows_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FreezerSmallGlows X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FreezerSmallGlowsR ANIVFILE=MODELS\FreezerSmallGlows_a.3d DATAFILE=MODELS\FreezerSmallGlows_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FreezerSmallGlowsR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=FreezerSmallGlowsPick ANIVFILE=MODELS\FreezerSmallGlows_a.3d DATAFILE=MODELS\FreezerSmallGlows_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FreezerSmallGlowsPick X=0 Y=0 Z=0 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FreezerSmallGlows SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerSmallGlows SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerSmallGlows SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerSmallGlows SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerSmallGlows SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerSmallGlows SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerSmallGlowsR SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerSmallGlowsR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerSmallGlowsR SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerSmallGlowsR SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerSmallGlowsR SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerSmallGlowsR SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerSmallGlowsPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FreezerSmallGlows MESH=FreezerSmallGlows
#exec MESHMAP SCALE MESHMAP=FreezerSmallGlows X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerSmallGlowsR MESH=FreezerSmallGlowsR
#exec MESHMAP SCALE MESHMAP=FreezerSmallGlowsR X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerSmallGlowsPick MESH=FreezerSmallGlowsPick
#exec MESHMAP SCALE MESHMAP=FreezerSmallGlowsPick X=0.10625 Y=0.10625 Z=0.2125

//===========================================================================

//Coronas
#exec TEXTURE IMPORT NAME=FreezerLight FILE=Coronas\FreezerLight.bmp GROUP=Coronas FLAGS=2

var float SmkCount, SmkCCanvas;
var float globalDelta;
var vector OldRenderLoc;
var rotator OldRenderRot;
var() float SmkCanvasUpdateFactor;
var() Class<Projectile> UnderwaterProj1;
var() Class<Projectile> UnderwaterProj2;

struct CoolantSmoke
{
	var Effects hSmk;
	var float LifeTime;
};

var CoolantSmoke CoolSmk[24];

var(ServerConfig) config bool bSinkIceBase;
var(ServerConfig) config bool bStaticIceBase;
var(ServerConfig) config int IceBaseStrength;
var(ServerConfig) config name NonFreezablePawns[32];


//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime, OversurrectionCrystRate;
var(Oversurrection) config float OversurrectionCrystMinDist, OversurrectionCrystMaxDist;
var(Oversurrection) config int OversurrectionCrystMaxAmount;
var(Oversurrection) config float OversurrectionIceSpreadLifeTime;
var(Oversurrection) config int OversurrectionFreezingDmg;
var(Oversurrection) config float OversurrectionFreezingDmgRate, OversurrectionFreezingDmgRadius;
var(Oversurrection) config float OversurrectionImpaleOdds, OversurrectionImpaleMaxHeight;
var(Oversurrection) config int OversurrectionImpaleDmg;
var(Oversurrection) config float OversurrectionRIImpaleOdds, OversurrectionRIImpaleRate;
var(Oversurrection) config float OversurrectionRIImpaleMinHeight, OversurrectionRIImpaleMaxHeight;
var(Oversurrection) config int OversurrectionRIImpaleMinAmount, OversurrectionRIImpaleMaxAmount;



function PreBeginPlay()
{
	Super.PreBeginPlay();
	AddAuxMutator(Class'FreezingMut');
}

simulated function Tick(float Delta)
{
local float newGlow;
local FreezerCoolantSmoke efx;

	Super.Tick(Delta);
	globalDelta = Delta;
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		SmkCount += Delta;
		if (SmkCount >= 0.1)
		{
			SmkCount = 0;
			if (Pawn(Owner) == None && !Region.Zone.bWaterZone && !bHidden)
			{
				efx = Spawn(Class'FreezerCoolantSmoke',,, Location, Rotation);
				efx.SetDirection(FRand() > 0.5);
			}
		}
	}
	
	if (Level.NetMode != NM_DedicatedServer && PlayerPawn(Owner) != None)
	{
		newGlow = 0.95 + FRand()*0.95;
			
		if (FirstGlowFXActor[0] != None)
			FirstGlowFXActor[0].ScaleGlow = newGlow;
		if (FirstGlowFXActor[1] != None)
			FirstGlowFXActor[1].ScaleGlow = newGlow;
	}
}


simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
local byte i;
local bool bSpawnedSmk;
local vector LocDelta;
local rotator RotDelta;
local ZoneInfo HeadZone;

	if (PlayerPawn(Owner) == None)
		return;
	
	HeadZone = PlayerPawn(Owner).HeadRegion.Zone;

	//Coolant smoke - Phase 1
	if (!HeadZone.bWaterZone || HeadZone.IsA('NitrogenZone') || HeadZone.DamageType == 'Frozen')
		SmkCCanvas += globalDelta;
	
	if (SmkCCanvas >= 0.1)
	{
		i = 0;
		while (i < ArrayCount(CoolSmk) && !bSpawnedSmk)
		{
			if (CoolSmk[i].hSmk == None || CoolSmk[i].LifeTime <= 0)
			{
				CoolSmk[i].hSmk = Spawn(Class'FreezerFXFirst',,, Loc, Rot);
				FreezerFXFirst(CoolSmk[i].hSmk).setHand(PlayerPawn(Owner).Handedness != 1);
				FreezerFXFirst(CoolSmk[i].hSmk).SetDirection(FRand() > 0.5);
				
				CoolSmk[i].hSmk.AnimFrame = AnimFrame;
				CoolSmk[i].hSmk.AnimSequence = AnimSequence;
				
				CoolSmk[i].LifeTime = Class'FreezerFXFirst'.default.LifeSpan;
				bSpawnedSmk = True;
			}
				
			i++;
		}
		
		SmkCCanvas = 0;
	}
	
	//General update
	LocDelta = Loc - OldRenderLoc;
	RotDelta = Rot - OldRenderRot;
	
	//Coolant smoke - Phase 2
	for (i = 0; i < ArrayCount(CoolSmk); i++)
	{
		if (CoolSmk[i].hSmk != None && CoolSmk[i].LifeTime > 0)
		{
			if (CoolSmk[i].LifeTime < Class'FreezerFXFirst'.default.LifeSpan)
			{
				CoolSmk[i].hSmk.Move(LocDelta*SmkCanvasUpdateFactor);
				CoolSmk[i].hSmk.SetRotation(CoolSmk[i].hSmk.Rotation + (RotDelta*SmkCanvasUpdateFactor));
			}
			
			CoolSmk[i].LifeTime -= globalDelta;
			Canvas.DrawActor(CoolSmk[i].hSmk, False, False);
		}
	}
	
	//Final update
	OldRenderLoc = Loc;
	OldRenderRot = Rot;
}

function Fire( float Value )
{

    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));
	
	if (bInfinity || AmmoType.UseAmmo(1))
	{
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
        ClientFire(Value);
		
		if ( bRapidFire || (FiringSpeed > 0) )
            Pawn(Owner).PlayRecoil(FiringSpeed);

		if (Pawn(Owner).HeadRegion.Zone.bWaterZone)
		{
			if (Pawn(Owner).HeadRegion.Zone.IsA('LavaZone') || Pawn(Owner).HeadRegion.Zone.DamageType == 'Burned')
				ProjectileFire(UnderwaterProj2, ProjectileSpeed, bWarnTarget);
			else
				ProjectileFire(UnderwaterProj1, ProjectileSpeed, bWarnTarget);
		}
		else
			ProjectileFire(ProjectileClass, ProjectileSpeed, bWarnTarget);
	}
}

simulated function PlayFiring()
{
	PlayAnim('Fire', 2.0 * GetFirerateMult(), 0.0);
	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*4.0);
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

		AltProjectileFire(AltProjectileClass, AltProjectileSpeed, bAltWarnTarget);
	}
}

simulated function PlayAltFiring()
{
	PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*1.5);
	PlayAnim('AltFire', 8.0 * GetFirerateMult(True), 0.0);
}


function float RateSelf( out int bUseAltMode )
{
	local float EnemyDist, Rating;
	local bool bRetreating;
	local vector EnemyDir;
	local Pawn P;

	P = Pawn(Owner);

	//No enemy, no need to fire
	if ( P.Enemy == None )
        return AIRating;

	//Don't recommend self if out of ammo or if owner is inside water
	if ( AmmoType.AmmoAmount <=0)
        return -2;
	
	EnemyDir = P.Enemy.Location - Owner.Location; 
	EnemyDist = VSize(EnemyDir);

	//Different zones, different attitudes
	if (P.Enemy.HeadRegion.Zone.bWaterZone && !P.HeadRegion.Zone.bWaterZone)
	{
		if (P.Enemy.HeadRegion.Zone.IsA('LavaZone') || P.Enemy.HeadRegion.Zone.DamageType == 'Burned')
			return -2;
		else
			bUseAltMode = 1;
	}
	else if (P.HeadRegion.Zone.bWaterZone)
	{
		if (P.HeadRegion.Zone.IsA('LavaZone') || P.HeadRegion.Zone.DamageType == 'Burned')
			bUseAltMode = 0;
		else
			bUseAltMode = int(FRand() + 0.25);
	}
	else if (EnemyDist < 275*FMax(1.0, Splasher))
		bUseAltMode = 1;
	else
		bUseAltMode = int(FRand() + 0.65);

	return (AIRating + FRand() * 0.05);
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local rotator R;

	if (ref == None)
		return;
	R = rotator(HitNormal);
	R.Roll = Rand(16384)*4;
	ref.Spawn(Class'FreezerGndIceAge',,, HitLocation + HitNormal/4, R);
}

static simulated function OversurrectorExplodeClient(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local FreezerBaseCloudMaster master;
local rotator R;
local vector Loc;

	Loc = HitLocation + HitNormal;
	if (ref == None)
		return;
	ref.Spawn(Class'FreezerInitShake',,, Loc);
	
	R.Yaw = Rand(16384);
	master = ref.Spawn(Class'FreezerBaseCloudMaster',,, Loc, R);
	ref.Spawn(Class'FreezerBaseCloud', master,, Loc, R);
	
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'IceOversFXA';		break;
		case 1:	CFXClass = Class'IceOversFXB';		break;
		case 2:	CFXClass = Class'IceOversFXC';		break;
		case 3:	CFXClass = Class'IceOversFXD';		break;
	}
	return (i <= 3);
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FreezerPick
	CollisionHeight=12.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=6
	Icon=FreezerIcon
	InventoryGroup=6
	ItemArticle="a"
	ItemName="Freezer"
	MaxDesireability=0.400000
	PickupMessage="You got the Freezer."
	PickupSound=Freezer_Pick
	PickupViewMesh=FreezerPick
	PickupViewScale=1.000000
	PlayerViewMesh=FreezerR
	PlayerViewOffset=(X=12.00000,Y=-6.000000,Z=-4.500000)
	WidePlayerViewOffset=(X=12.00000,Y=-6.000000,Z=-4.500000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=FreezerIcon
	ThirdPersonMesh=FreezerM
	ThirdPersonScale=0.750000
	AltDamageType=Pierced
	AltFireSound=FreezerAltFire
	AltProjectileClass=Class'FreezerIcicle'
	AmmoName=Class'FreezerAmmo'
	bInstantHit=False
	bRapidFire=True
	DeathMessage="%o was frozen to the bones by %k's %w."
	FireSound=FreezerFire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Frozen
	NameColor=(R=0,G=255,B=255)
	PickupAmmoCount=35
	ProjectileClass=Class'FreezerProj'
	UnderwaterProj1=Class'FreezerProjAlt'
	UnderwaterProj2=Class'FreezerProjAltLava'
	SelectSound=Freezer_Select
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.750000
	AltRefireRate=0.500000
	bAltWarnTarget=True
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=True
	bSplashDamage=True
	bWarnTarget=True
	RefireRate=1.000000
	Mass=50.000000
	bNoSmooth=False
	MultiSkins(4)=FreezerCoolFX
	bOwnsCrossHair=True
	CustomCross=FreezerCross
	CustomCrossAlpha=FreezerCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Portable cooling device.\n\nPrimary Fire: Coolant projectile which has an extremely high heat absorption rate, reducing the temperature of any object on contact to extremely low values.\n\nSecondary Fire: High firerate of ice shards made straightly from water vapor."
	
	LightBrightness=100
	LightHue=140
	LightSaturation=255
	LightRadius=5
	LightType=LT_Steady
	
	Texture=FreezerMetal
	
	PlayerViewMeshLeft=Freezer
	PlayerViewMeshRight=FreezerR
	HandPartMeshL(0)=FreezerHandL
	HandPartMeshR(0)=FreezerHandR
	BobDamping=1.075000
	FireOffset=(X=0.000000,Y=0.000000,Z=0.00000)
	
	RenderOffsetSelect=(Y=-2.500000,Z=-2.000000)
	AnimMaxFrame=0.857129
	
	FireOffsetZAdjustHidden=-6.000000
	AltFireOffsetZAdjustHidden=-2.000000
	
	FirstPersonGlowFX(0)=(bLit=True,GlowModel=Mesh'FreezerBigGlowsR',GlowModelLeft=Mesh'FreezerBigGlows')
	FirstPersonGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.047250)
	FirstPersonGlowFX(0)=(GlowTex1=Texture'FreezerLight')
	
	FirstPersonGlowFX(1)=(bLit=True,GlowModel=Mesh'FreezerSmallGlowsR',GlowModelLeft=Mesh'FreezerSmallGlows')
	FirstPersonGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.033750)
	FirstPersonGlowFX(1)=(GlowTex1=Texture'FreezerLight')
	
	PickupGlowFX(0)=(bLit=True,GlowModel=Mesh'FreezerBigGlowsPick')
	PickupGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.196875)
	PickupGlowFX(0)=(GlowTex1=Texture'FreezerLight',GlowSetClass=Class'FreezerOverPickupFX')
	
	PickupGlowFX(1)=(bLit=True,GlowModel=Mesh'FreezerSmallGlowsPick')
	PickupGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.140625)
	PickupGlowFX(1)=(GlowTex1=Texture'FreezerLight',GlowSetClass=Class'FreezerOverPickupFX')
	
	SmkCanvasUpdateFactor=0.995000
	
	bSinkIceBase=False
	bStaticIceBase=False
	IceBaseStrength=30
	
	NonFreezablePawns(0)=FortStandard
	NonFreezablePawns(1)=TeamCannon
	NonFreezablePawns(2)=sgBuilding
	NonFreezablePawns(3)=Cybot
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=255,G=255,B=255)
	OversurrectorFXColors(0)=(R=128,G=128,B=128)
	OversurrectorFXColors(1)=(R=64,G=64,B=128)
	OversurrectorFXColors(2)=(R=64,G=64,B=64)
	OversurrectorFXColors(3)=(R=128,G=128,B=128)
	OversurrectorFXColors(4)=(R=64,G=64,B=128)
	OversurrectorFXColors(5)=(R=32,G=32,B=128)
	OversurrectorFXColors(6)=(R=48,G=48,B=64)
	OversurrectorFXColors(7)=(R=64,G=64,B=128)
	OversurrectorFXColors(8)=(R=64,G=64,B=128)
	OversurrectorFXColors(9)=(R=64,G=64,B=64)
	OversurrectorFXColors(10)=(R=64,G=64,B=64)
	OversurrectorFXColors(11)=(R=64,G=64,B=96)
	OversurrectorFXColors(12)=(R=32,G=32,B=32)
	OversurrectorFXColors(13)=(R=128,G=128,B=128)
	OversurrectorFXColors(14)=(R=96,G=96,B=128)
	OversurrectorFXColors(15)=(R=64,G=64,B=128)
	OversurrectorFXColors(16)=(R=32,G=32,B=128)
	OversurrectorFXColors(17)=(R=16,G=16,B=128)
	OversurrectorFXColors(18)=(R=96,G=96,B=128)
	OversurrectorFXColors(19)=(R=48,G=48,B=48)
	OversurrectorFXColors(20)=(R=128,G=128,B=128)
	OversurrectorFXColors(21)=(R=128,G=128,B=128)
	OversurrectorFXColors(22)=(R=64,G=64,B=128)
	OversurrectorFXColors(23)=(R=32,G=32,B=128)
	
	OversurrectorLightHue(0)=0
	OversurrectorLightSaturation(0)=255
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=0
	OversurrectorLightSaturation(1)=255
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=0
	OversurrectorLightSaturation(2)=255
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'FreezerOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=15.000000
	OversurrectionCrystRate=1.250000
	OversurrectionCrystMinDist=600.000000
	OversurrectionCrystMaxDist=2000.000000
	OversurrectionCrystMaxAmount=4	
	OversurrectionIceSpreadLifeTime=15.000000
	OversurrectionFreezingDmg=1000
	OversurrectionFreezingDmgRate=2.000000
	OversurrectionFreezingDmgRadius=1000.000000
	OversurrectionImpaleOdds=0.350000
	OversurrectionImpaleMaxHeight=1750.000000
	OversurrectionImpaleDmg=2000
	OversurrectionRIImpaleOdds=0.100000
	OversurrectionRIImpaleRate=0.500000
	OversurrectionRIImpaleMinHeight=250.000000
	OversurrectionRIImpaleMaxHeight=1750.000000
	OversurrectionRIImpaleMinAmount=1
	OversurrectionRIImpaleMaxAmount=4
}
