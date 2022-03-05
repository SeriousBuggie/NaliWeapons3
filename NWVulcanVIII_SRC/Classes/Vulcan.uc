//////////////////////////////////////////////////////////////
//	Nali Weapons III Vulcan weapon
//				Feralidragon (10-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class Vulcan expands NaliWeapons config(NWeaponsCfg);


//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=Vulcan ANIVFILE=MODELS\Vulcan_a.3d DATAFILE=MODELS\Vulcan_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=Vulcan STRENGTH=0
#exec MESH ORIGIN MESH=Vulcan X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=VulcanR ANIVFILE=MODELS\Vulcan_a.3d DATAFILE=MODELS\Vulcan_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=VulcanR STRENGTH=0
#exec MESH ORIGIN MESH=VulcanR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=VulcanPick ANIVFILE=MODELS\Vulcan_a.3d DATAFILE=MODELS\Vulcan_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
//#exec MESH LODPARAMS MESH=VulcanPick STRENGTH=0
#exec MESH ORIGIN MESH=VulcanPick X=0 Y=0 Z=0

//3rd person
#exec MESH IMPORT MESH=VulcanM ANIVFILE=MODELS\Vulcan_a.3d DATAFILE=MODELS\Vulcan_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=VulcanM STRENGTH=0.45
#exec MESH ORIGIN MESH=VulcanM X=-220 Y=0 Z=10

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=Vulcan SEQ=All STARTFRAME=0 NUMFRAMES=95
#exec MESH SEQUENCE MESH=Vulcan SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Vulcan SEQ=Fire1 STARTFRAME=0 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=Fire2 STARTFRAME=4 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=Fire3 STARTFRAME=8 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=Fire4 STARTFRAME=12 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=Fire5 STARTFRAME=16 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=Fire6 STARTFRAME=20 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=Fire7 STARTFRAME=24 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=AltFire STARTFRAME=29 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=EndFire STARTFRAME=52 NUMFRAMES=43 RATE=5.0
#exec MESH SEQUENCE MESH=Vulcan SEQ=Select STARTFRAME=45 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=Vulcan SEQ=Down STARTFRAME=39 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=VulcanR SEQ=All STARTFRAME=0 NUMFRAMES=95
#exec MESH SEQUENCE MESH=VulcanR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanR SEQ=Fire1 STARTFRAME=0 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=Fire2 STARTFRAME=4 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=Fire3 STARTFRAME=8 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=Fire4 STARTFRAME=12 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=Fire5 STARTFRAME=16 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=Fire6 STARTFRAME=20 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=Fire7 STARTFRAME=24 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=AltFire STARTFRAME=29 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=EndFire STARTFRAME=52 NUMFRAMES=43 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanR SEQ=Select STARTFRAME=45 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=VulcanR SEQ=Down STARTFRAME=39 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=VulcanPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=VulcanM SEQ=All STARTFRAME=0 NUMFRAMES=95
#exec MESH SEQUENCE MESH=VulcanM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanM SEQ=Fire1 STARTFRAME=0 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanM SEQ=Fire2 STARTFRAME=4 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanM SEQ=Fire3 STARTFRAME=8 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanM SEQ=Fire4 STARTFRAME=12 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanM SEQ=Fire5 STARTFRAME=16 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanM SEQ=Fire6 STARTFRAME=20 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanM SEQ=Fire7 STARTFRAME=24 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanM SEQ=AltFire STARTFRAME=29 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=VulcanM SEQ=EndFire STARTFRAME=52 NUMFRAMES=43 RATE=5.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=Vulcan MESH=Vulcan
#exec MESHMAP SCALE MESHMAP=Vulcan X=0.06 Y=0.06 Z=0.12

#exec MESHMAP NEW MESHMAP=VulcanR MESH=VulcanR
#exec MESHMAP SCALE MESHMAP=VulcanR X=0.06 Y=0.06 Z=0.12

#exec MESHMAP NEW MESHMAP=VulcanPick MESH=VulcanPick
#exec MESHMAP SCALE MESHMAP=VulcanPick X=0.19 Y=0.19 Z=0.38

#exec MESHMAP NEW MESHMAP=VulcanM MESH=VulcanM
#exec MESHMAP SCALE MESHMAP=VulcanM X=0.15 Y=0.15 Z=0.30

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Vulcan_Sk01 FILE=SKINS\Vulcan_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Vulcan NUM=1 TEXTURE=Vulcan_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=VulcanR NUM=1 TEXTURE=Vulcan_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=VulcanPick NUM=1 TEXTURE=Vulcan_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=VulcanM NUM=1 TEXTURE=Vulcan_Sk01

#exec TEXTURE IMPORT NAME=Vulcan_Sk02 FILE=SKINS\Vulcan_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Vulcan NUM=2 TEXTURE=Vulcan_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=VulcanR NUM=2 TEXTURE=Vulcan_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=VulcanPick NUM=2 TEXTURE=Vulcan_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=VulcanM NUM=2 TEXTURE=Vulcan_Sk02

#exec TEXTURE IMPORT NAME=Vulcan_Sk03 FILE=SKINS\Vulcan_Sk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Vulcan NUM=3 TEXTURE=Vulcan_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=VulcanR NUM=3 TEXTURE=Vulcan_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=VulcanPick NUM=3 TEXTURE=Vulcan_Sk03
#exec MESHMAP SETTEXTURE MESHMAP=VulcanM NUM=3 TEXTURE=Vulcan_Sk03

#exec TEXTURE IMPORT NAME=VulcanMetal FILE=SKINS\VulcanMetal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=VulcanIcon FILE=ICONS\VulcanIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=VulcanCrossAlpha FILE=ICONS\VulcanCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\VulcanIcons.utx PACKAGE=NWVulcanVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="VulcanPick" FILE=SOUNDS\VulcanPick.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanSelect" FILE=SOUNDS\VulcanSelect.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanFire" FILE=SOUNDS\VulcanFire.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanEndSpin" FILE=SOUNDS\VulcanEndSpin.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanLoopSpin" FILE=SOUNDS\VulcanLoopSpin.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="VulcanAltFire" FILE=SOUNDS\VulcanAltFire.wav GROUP="Vulcan"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=VulcanHandL ANIVFILE=MODELS\VulcanHand_a.3d DATAFILE=MODELS\VulcanHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=VulcanHandL STRENGTH=0
#exec MESH ORIGIN MESH=VulcanHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=VulcanHandR ANIVFILE=MODELS\VulcanHand_a.3d DATAFILE=MODELS\VulcanHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=VulcanHandR STRENGTH=0
#exec MESH ORIGIN MESH=VulcanHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=All STARTFRAME=0 NUMFRAMES=79
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Fire1 STARTFRAME=0 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Fire2 STARTFRAME=4 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Fire3 STARTFRAME=8 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Fire4 STARTFRAME=12 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Fire5 STARTFRAME=16 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Fire6 STARTFRAME=20 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Fire7 STARTFRAME=24 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=AltFire STARTFRAME=29 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=EndFire STARTFRAME=52 NUMFRAMES=27 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Select STARTFRAME=45 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=VulcanHandL SEQ=Down STARTFRAME=39 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=VulcanHandR SEQ=All STARTFRAME=0 NUMFRAMES=79
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Fire1 STARTFRAME=0 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Fire2 STARTFRAME=4 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Fire3 STARTFRAME=8 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Fire4 STARTFRAME=12 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Fire5 STARTFRAME=16 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Fire6 STARTFRAME=20 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Fire7 STARTFRAME=24 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=AltFire STARTFRAME=29 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=EndFire STARTFRAME=52 NUMFRAMES=27 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Select STARTFRAME=45 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=VulcanHandR SEQ=Down STARTFRAME=39 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=VulcanHandL MESH=VulcanHandL
#exec MESHMAP SCALE MESHMAP=VulcanHandL X=0.06 Y=0.06 Z=0.12

#exec MESHMAP NEW MESHMAP=VulcanHandR MESH=VulcanHandR
#exec MESHMAP SCALE MESHMAP=VulcanHandR X=0.06 Y=0.06 Z=0.12

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=VulcanHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=VulcanHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//MUZZLE 3RD PERSON
//*******************************************************

//3rd person
#exec MESH IMPORT MESH=VulcanThirdMuz ANIVFILE=MODELS\VulcanThirdMuz_a.3d DATAFILE=MODELS\VulcanThirdMuz_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=VulcanThirdMuz STRENGTH=0
#exec MESH ORIGIN MESH=VulcanThirdMuz X=-110 Y=0 Z=5

#exec MESH SEQUENCE MESH=VulcanThirdMuz SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanThirdMuz SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=VulcanThirdMuz MESH=VulcanThirdMuz
#exec MESHMAP SCALE MESHMAP=VulcanThirdMuz X=0.225 Y=0.225 Z=0.45

#exec TEXTURE IMPORT NAME=VulcanMuz01 FILE=Coronas\VulcanMuz01.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanThirdMuz NUM=1 TEXTURE=VulcanMuz01

#exec TEXTURE IMPORT NAME=VulcanMuz03 FILE=Coronas\VulcanMuz03.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanThirdMuz NUM=2 TEXTURE=VulcanMuz03

//===========================================================================

var(ServerConfig) config float DrillHeatUpRate, DrillHeatDownRate;
var(ServerConfig) config float DrillHeatRework;
var(ServerConfig) config bool bAffectedByHeat;
var(ServerConfig) config float RunningAimError, WalkingAimError, CrouchingAimError;

var() name FireAnims[7];
var() float MaxShakeDist;
var() float MaxFireAnim, MaxEndAnim;
var byte CurFireAnim;

var() int ShotBaseDamage, ShotIncreasedDamage;

var vector oldVector, newVector;

var VulcanMuz muzz, muzzCor;
var float MuzzCount;
var byte TracerCount;
var float CScale;
var VulcanIncandesDrill incanDrill;
var float drillHeat;
var float drillHUpRate, drillHDownRate, drillHRework;
var bool affectedByHeat, isTooHot;

var(ClientConfig) config bool enableOverheatMsg;
var() localized string OverheatMsg;

//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime;
var(Oversurrection) config float OversurrectionProjSkyFireRate, OversurrectionProjSkyFireOdds, OversurrectionProjSkyFireRadius;
var(Oversurrection) config int OversurrectionProjSkyFireMax, OversurrectionProjSkyFireDmg;
var(Oversurrection) config float OversurrectionHProjSkyFireRate, OversurrectionHProjSkyFireOdds, OversurrectionHProjSkyFireRadius;
var(Oversurrection) config int OversurrectionHProjSkyFireMax, OversurrectionHProjSkyFireDmg;


replication
{
	reliable if (Role == ROLE_Authority)
		affectedByHeat, drillHRework, drillHUpRate, drillHDownRate;
}

function PreBeginPlay()
{
	AccuracyPattern[0] = default.RunningAimError;
	AccuracyPattern[1] = default.WalkingAimError;
	AccuracyPattern[2] = default.CrouchingAimError;

	Super.PreBeginPlay();
	
	drillHUpRate = default.DrillHeatUpRate;
	drillHDownRate = default.DrillHeatDownRate;
	affectedByHeat = default.bAffectedByHeat;
	drillHRework = FMin(1.0, FMax(0.0, default.DrillHeatRework));
}

simulated function float GetAccuracy(optional bool bAltFire)
{
	if (Pawn(Owner).bDuck != 0)
		return AccuracyPattern[2];
	else if (Pawn(Owner).bRun != 0 || Pawn(Owner).OldLocation == Pawn(Owner).Location)
		return AccuracyPattern[1];
	return AccuracyPattern[0];
}

simulated function vector getShakeVect()
{
local vector v;
local rotator r;

	v.z = FRand() * MaxShakeDist;
	r.Roll = Rand(16384) * 4;
	v = (v >> r);
	
	return v;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && muzz != None || muzzCor != None)
	{
		MuzzCount += Delta;
		if (MuzzCount >= 0.1)
		{
			MuzzCount = 0;
			if (muzz != None)
				muzz.Destroy();
			muzz = None;
			if (muzzCor != None)
				muzzCor.Destroy();
			muzzCor = None;
		}
	}
	
	Super.Tick(Delta);
	
	if (Pawn(Owner) != None)
	{
		if (isFiringSequence(AnimSequence) && Pawn(Owner).bFire != 0 && !Pawn(Owner).Region.Zone.bWaterZone)
			drillHeat += (drillHUpRate * Delta);
		else if (Pawn(Owner).Region.Zone.bWaterZone)
			drillHeat -= (drillHDownRate * Delta * 5);
		else
			drillHeat -= (drillHDownRate * Delta);
		
		if (affectedByHeat)
		{
			if (!isTooHot && drillHeat >= 1.0)
				isTooHot = True;
			else if (isTooHot && drillHeat <= drillHRework)
				isTooHot = False;
		}
		drillHeat = FClamp(drillHeat, 0.0, 1.0);
	}
	
	if (Level.NetMode != NM_DedicatedServer && Pawn(Owner) != None)
	{
		if (Pawn(Owner).bDuck != 0)
			CScale = 0.5;
		else if (Pawn(Owner).bRun != 0 || Pawn(Owner).OldLocation == Pawn(Owner).Location)
			CScale = 0.75;
		else
			CScale = 1.00;
		
		if (CrossHairScale > CScale)
		{
			CrossHairScale -= (0.7*Delta);
			if (CrossHairScale < CScale)
				CrossHairScale = CScale;
		}
		else if (CrossHairScale < CScale)
		{
			CrossHairScale += (0.7*Delta);
			if (CrossHairScale > CScale)
				CrossHairScale = CScale;
		}
	}
}


function Fire(float Value)
{
    if (AmmoType == None && AmmoName != None)
        GiveAmmo(Pawn(Owner));
	if (AmmoType != None)
		oldZPAmmoAmount = AmmoType.AmmoAmount;

    if (bInfinity || isTooHot || AmmoType.UseAmmo(1))
    {
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
        ClientFire(Value);
		
		if (bInfinity || !isTooHot)
		{
			if (bRapidFire || FiringSpeed > 0)
				Pawn(Owner).PlayRecoil(FiringSpeed);
			TraceFire(GetAccuracy());
		}
		else
			CheckClientOverheat();
    }
}

simulated function CheckClientOverheat()
{
	if (default.enableOverheatMsg && Level.NetMode != NM_DedicatedServer && PlayerPawn(Owner) != None && PlayerPawn(Owner).myHUD != None)
		PlayerPawn(Owner).myHUD.LocalizedMessage(Class'NoAmmoStringPlus', 0, None, None, None, OverheatMsg);
}

function bool checkZPPreValidity(private bool isAltFire, private Actor Other, private vector HitLoc, private vector Start, private vector OtherClientLoc, private vector OwnerClientLoc, 
private rotator OwnerClientVRot, private float Accuracy, private float AccY, private float AccZ, optional private out byte useStandardShot)
{
	return (bInfinity || !isTooHot);
}

simulated function bool ClientFire(float Value)
{
	if (!bInfinity && isTooHot && bCanClientFire && (Role == ROLE_Authority || AmmoType == None || AmmoType.AmmoAmount > 0))
	{
		PlayRotating();
		CheckClientOverheat();
		if (Role < ROLE_Authority)
            GotoState('ClientFiring');
		return True;
	}
	return Super.ClientFire(Value);
}

simulated function PlayFiring()
{
	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*3.0);
	PlayAnim(FireAnims[CurFireAnim], 10.0, 0.0);
	
	CurFireAnim++;
	if (CurFireAnim >= ArrayCount(FireAnims))
		CurFireAnim = 0;
	
	if (muzz != None)
		muzz.Destroy();
	muzz = None;
	
	if (muzzCor != None)
		muzzCor.Destroy();
	muzzCor = None;
	
	if (Level.NetMode != NM_DedicatedServer && PlayerPawn(Owner) != None)
	{
		muzz = Spawn(Class'VulcanMuz');
		muzz.RandomizeMesh(PlayerPawn(Owner).Handedness != 1);
		
		muzzCor = Spawn(Class'VulcanMuzCor');
		muzzCor.RandomizeMesh(PlayerPawn(Owner).Handedness != 1);
	}
	
	FiringAmbSound = Default.FiringAmbSound;
	bMuzzleFlash++;
}

simulated function PlayRotating()
{
	PlayAnim(FireAnims[CurFireAnim], 10.0, 0.0);
	CurFireAnim++;
	if (CurFireAnim >= ArrayCount(FireAnims))
		CurFireAnim = 0;
	FiringAmbSound = Default.FiringAmbSound;
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
		AltProjectileFire(AltProjectileClass, AltProjectileSpeed, bAltWarnTarget);
	}
}

simulated function PlayAltFiring()
{
	PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*1.5);
	PlayAnim('AltFire', 2.0 * GetFirerateMult(True), 0.0);
}

simulated function vector CalcNewDrawOffset()
{
    local vector DrawOffset, WeaponBob, CurrentPlayerView, ROffset;
	local vector ShakeOffset;
    local Pawn PawnOwner;

    PawnOwner = Pawn(Owner);
	if (PlayerPawn(PawnOwner) != None && PlayerPawn(PawnOwner).DefaultFOV >= 100)
		CurrentPlayerView = WidePlayerViewOffset;
	else
		CurrentPlayerView = PlayerViewOffset;
	ROffset = RenderOffsetSelect * 100;
	
	if (VSize(ROffset) > 0 && AnimMaxFrame > 0 && (AnimSequence == 'Select' || AnimSequence == 'Down'))
	{
		if (PlayerViewOffset.Y < 0)
			ROffset.Y = -ROffset.Y;
		
		if (AnimFrame < AnimMaxFrame / 2)
			CurrentPlayerView = CurrentPlayerView + (AnimFrame * ROffset / (AnimMaxFrame / 2));
		else
			CurrentPlayerView = CurrentPlayerView + ((AnimMaxFrame - AnimFrame) * ROffset / (AnimMaxFrame/2));
	}
	
	if (isFiringSequence(AnimSequence))
		ShakeOffset = ((newVector - oldVector) * AnimFrame/MaxFireAnim) * 100;
	else if (AnimSequence == 'EndFire')
		ShakeOffset = ((newVector - oldVector) * AnimFrame/MaxEndAnim) * 100;
	else
		ShakeOffset = newVector * 100;
	
	CurrentPlayerView += ShakeOffset;
    DrawOffset = ((0.9/PawnOwner.FOVAngle * CurrentPlayerView) >> PawnOwner.ViewRotation);

    if ( (Level.NetMode == NM_DedicatedServer) 
        || ((Level.NetMode == NM_ListenServer) && (Owner.RemoteRole == ROLE_AutonomousProxy)) )
        DrawOffset += (PawnOwner.BaseEyeHeight * vect(0,0,1));
    else
    {   
        DrawOffset += (PawnOwner.EyeHeight * vect(0,0,1));
        WeaponBob = BobDamping * PawnOwner.WalkBob;
        WeaponBob.Z = (0.45 + 0.55 * BobDamping) * PawnOwner.WalkBob.Z;
        DrawOffset += WeaponBob;
    }
    return DrawOffset;
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
	if (PlayerPawn(Owner) == None)
		return;
	
	if (incanDrill != None && drillHeat > 0)
	{
		incanDrill.HandleMesh(PlayerPawn(Owner).Handedness != 1);
		incanDrill.SetLocation(Loc);
		incanDrill.SetRotation(Rot);
		incanDrill.AnimSequence = AnimSequence;
		incanDrill.AnimFrame = AnimFrame;
		incanDrill.ScaleGlow = drillHeat * incanDrill.default.ScaleGlow;
		Canvas.DrawActor(incanDrill, False, False);
	}
	else if (incanDrill == None || incanDrill.bDeleteMe)
		incanDrill = Spawn(Class'VulcanIncandesDrill');

	if (muzz != None)
	{
		muzz.SetLocation(Loc);
		muzz.SetRotation(Rot);
		Canvas.DrawActor(muzz, False, False);
	}
}

simulated function PrePostRenderOther( canvas Canvas, float Scale)
{
local Rotator newRot;

	if (muzzCor != None && PlayerPawn(Owner) != None && PlayerPawn(Owner).Handedness < 2)
	{
		muzzCor.SetLocation(Owner.Location + CalcNewDrawOffset());
		newRot = Pawn(Owner).ViewRotation;

		if (PlayerPawn(Owner).Handedness == 0)
			newRot.Roll = -2 * Default.Rotation.Roll;
		else
			newRot.Roll = Default.Rotation.Roll * PlayerPawn(Owner).Handedness;

		muzzCor.SetRotation(newRot);
		Canvas.DrawActor(muzzCor, False, True);
	}
}

simulated function ProcessTraceHit(Actor Other, Vector HitLocation, Vector HitNormal, Vector X, Vector Y, Vector Z)
{
	local VulcanShellCase s;
	local vector L;
	local byte rndDmg;
	local int tempKick;
	
	L = Owner.Location + CalcDrawOffset();
	tempKick = KickBack;
	
	if (TracerCount > 5)
	{
		TracerCount = 0;
		if (Pawn(Owner) != None && !Pawn(Owner).HeadRegion.Zone.bWaterZone || Pawn(Owner).HeadRegion.Zone.IsA('LavaZone') || Pawn(Owner).HeadRegion.Zone.DamageType == 'Burned')
			Spawn(Class'VulcanTracer', ZPOwner,, L + (vect(200,0,0) >> Pawn(Owner).ViewRotation), rotator(HitLocation - L));
	}
	TracerCount++;

	s = Spawn(class'VulcanShellCase', ZPOwner,, L + (2.8 * FireOffset.Y+5.0) * Y - Z);
	if ( s != None ) 
		s.Eject(((FRand()*0.3+0.4)*X + (FRand()*0.2+0.2)*Y + (FRand()*0.3+1.0) * Z)*160);
	
	if (Other == Level)
	{
		Spawn(Class'VulcanBDecalFX', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
		if (FRand() < 0.35)
			Spawn(Class'VulcanBWallParts', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	}
	else if (Role == ROLE_Authority && Other != Self && Other != Owner && Other != None) 
	{
		rndDmg = ShotBaseDamage + Rand(ShotIncreasedDamage);
		if (Other.bIsPawn || Carcass(Other) != None)
		{
			Other.PlaySound(Sound 'ChunkHit',, 16.0,,100);
			if (!isAllowedToKick(Pawn(Owner), Pawn(Other)))
				tempKick = 0;
		}

		if (!giveFiredHealth(Other, rndDmg))
			Other.TakeDamage(rndDmg * GetDamageMult() * GetFirerateMult(),  Pawn(Owner), HitLocation, rndDmg * 750.0*X * (tempKick * 1000 + 1), MyDamageType);	
	}
	
	if (Other != None)
		Spawn(class'VulcanBulletExpl', ZPOwner,,HitLocation + HitNormal);
}

simulated function PlaySelect()
{
	CurFireAnim = 0;
	Super.PlaySelect();
}

simulated function PlayEndRoll()
{
	FiringAmbSound = None;
	PlayOwnedSound(Sound'VulcanEndSpin', SLOT_None, Pawn(Owner).SoundDampening*3.0);
	PlayAnim('EndFire', 5.0, 0.0);
}

simulated function bool isFiringSequence(name Seq)
{
local byte i;
	
	for (i = 0; i < ArrayCount(FireAnims); i++)
	{
		if (Seq == FireAnims[i])
			return True;
	}
	
	return False;
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

	if (EnemyDist < 220)
		bUseAltMode = 0;
	else if (EnemyDist > 2000)
		bUseAltMode = 1;
	else
		bUseAltMode = int(FRand() + 0.15);

	return (AIRating + FRand() * 0.05);
}

function Finish()
{
    local Pawn PawnOwner;
    local bool bForce, bForceAlt;

    bForce = bForceFire;
    bForceAlt = bForceAltFire;
    bForceFire = false;
    bForceAltFire = false;

    if (bChangeWeapon && (isFiringSequence(AnimSequence) || AnimSequence == 'EndFire'))
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
        else if ( (PawnOwner.bAltFire != 0) && (FRand() < AltRefireRate) )
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
    else if ( (PawnOwner.bAltFire!=0) || bForceAlt )
        Global.AltFire(0);
    else 
        GotoState('Idle');
}

simulated function AnimEnd()
{
	ManageAnimEnd();
	Super.AnimEnd();
}

state ClientFiring
{
    simulated function AnimEnd()
    {	
		if (AnimSequence != 'EndFire')
			ManageAnimEnd();
		
		if (Pawn(Owner) != None && (Pawn(Owner).bFire == 0 || AmmoType == None || AmmoType.AmmoAmount<=0) && isFiringSequence(AnimSequence))
		{
			PlayEndRoll();
			newVector = vect(0,0,0);
		}
		else
			Super.AnimEnd();
    }
}

state NormalFire
{
    function AnimEnd()
    {
		if (AnimSequence != 'EndFire')
			ManageAnimEnd();
		
		if (Pawn(Owner) != None && (Pawn(Owner).bFire == 0 || AmmoType == None || AmmoType.AmmoAmount<=0) && isFiringSequence(AnimSequence))
		{
			PlayEndRoll();
			newVector = vect(0,0,0);
		}
		else
			Super.AnimEnd();
    }
	
	function EndState()
	{
		Super.EndState();
		OldFlashCount = FlashCount;
	}
		
Begin:
	FlashCount++;
}


simulated function ManageAnimEnd()
{	
	oldVector = newVector;
		
	if ((bInfinity || !isTooHot) && Pawn(Owner) != None && isFiringSequence(AnimSequence))
	{
		if (Pawn(Owner).bDuck != 0)
			newVector = vect(0,0,0);
		else if (Pawn(Owner).bRun != 0 || Pawn(Owner).OldLocation == Pawn(Owner).Location)
			newVector = getShakeVect();
		else
			newVector = getShakeVect() * 2.65;
	}
	else
		newVector = vect(0,0,0);
}

simulated function Destroyed()
{
	if (muzz != None)
		muzz.Destroy();
	if (muzzCor != None)
		muzzCor.Destroy();
		
	muzz = None;
	muzzCor = None;
	
	Super.Destroyed();
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
	if (ref == None)
		return;
	ref.Spawn(Class'VulcanSkyFire',,, HitLocation + HitNormal, rot(0,0,0));
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	if (i == 0)
		CFXClass = Class'VulcanOversFXA';
	else
		CFXClass = Class'VulcanOversFXB';
	return (i <= 20);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=VulcanPick
	CollisionHeight=15.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=7
	Icon=VulcanIcon
	InventoryGroup=7
	ItemArticle="a"
	ItemName="Vulcan"
	MaxDesireability=0.900000
	PickupMessage="You got the Vulcan."
	PickupSound=VulcanPick
	PickupViewMesh=VulcanPick
	PickupViewScale=1.000000
	PlayerViewMesh=VulcanR
	PlayerViewOffset=(X=14.00000,Y=-6.000000,Z=-5.500000)
	WidePlayerViewOffset=(X=14.00000,Y=-6.000000,Z=-5.500000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=VulcanIcon
	ThirdPersonMesh=VulcanM
	ThirdPersonScale=0.750000
	AltDamageType=Vulcanized
	AltFireSound=VulcanAltFire
	AltProjectileClass=Class'VulcanProj'
	AmmoName=Class'VulcanAmmo'
	bInstantHit=True
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was perforated by %k's %w."
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=VulcanFire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Vulcanized
	NameColor=(R=255,G=128,B=0)
	PickupAmmoCount=75
	ProjectileClass=None
	SelectSound=VulcanSelect
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.750000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=True
	bRecommendSplashDamage=False
	bSplashDamage=False
	bWarnTarget=True
	RefireRate=0.500000
	Mass=50.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=VulcanCross
	CustomCrossAlpha=VulcanCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Medium caliber minigun.\n\nPrimary Fire: High firerate of medium caliber explosive bullets.\n\nSecondary Fire: Incandescent curvy rock, lightened up by an internally fired explosive bullet."
	
	Texture=VulcanMetal
	
	PlayerViewMeshLeft=Vulcan
	PlayerViewMeshRight=VulcanR
	HandPartMeshL(0)=VulcanHandL
	HandPartMeshR(0)=VulcanHandR
	BobDamping=1.075000
	
	RenderOffsetSelect=(Y=-1.500000,Z=2.000000)
	AnimMaxFrame=0.857129
	
	FireOffsetZAdjustHidden=-2.000000
	AltFireOffsetZAdjustHidden=-3.000000
	
	FiringSndVol=250
	FiringSndPitch=64
	FiringSndRadius=64
	FiringAmbSound=VulcanLoopSpin
	
	bDrawMuzzleFlash=False
	bMuzzleFlashParticles=False
	FlashC=0.031000
	FlashLength=0.0400000
	FlashO=0.014000
	FlashS=128
	FlashY=0.100000
	
	MuzzleFlashMesh=VulcanThirdMuz
	MuzzleFlashScale=1.000000
	MuzzleFlashStyle=STY_Translucent
	MuzzleFlashTexture=None
	MuzzleScale=1.000000
	WaterSplashType=1
	
	FireAnims(0)=Fire1
	FireAnims(1)=Fire2
	FireAnims(2)=Fire3
	FireAnims(3)=Fire4
	FireAnims(4)=Fire5
	FireAnims(5)=Fire6
	FireAnims(6)=Fire7
	MaxFireAnim=0.833333
	MaxEndAnim=0.977273
	MaxShakeDist=0.150000
	
	ShotBaseDamage=15
	ShotIncreasedDamage=7
	
	isZPWeapon=True
	bFireHitScan=True
	ZPMaxFirerate=10.000000
	
	bForceHands=True
	
	bAffectedByHeat=False
	DrillHeatRework=0.400000
	DrillHeatUpRate=0.350000
	DrillHeatDownRate=0.275000
	RunningAimError=4.000000 
	WalkingAimError=2.250000
	CrouchingAimError=1.500000
	
	OverheatMsg="OVERHEAT!"
	enableOverheatMsg=True
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=255,G=192,B=0)
	OversurrectorFXColors(0)=(R=128,G=128,B=0)
	OversurrectorFXColors(1)=(R=128,G=64,B=0)
	OversurrectorFXColors(2)=(R=32,G=32,B=0)
	OversurrectorFXColors(3)=(R=128,G=128,B=0)
	OversurrectorFXColors(4)=(R=128,G=64,B=0)
	OversurrectorFXColors(5)=(R=192,G=64,B=0)
	OversurrectorFXColors(6)=(R=64,G=64,B=0)
	OversurrectorFXColors(7)=(R=64,G=64,B=0)
	OversurrectorFXColors(8)=(R=64,G=64,B=0)
	OversurrectorFXColors(9)=(R=128,G=64,B=0)
	OversurrectorFXColors(10)=(R=128,G=64,B=0)
	OversurrectorFXColors(11)=(R=128,G=48,B=0)
	OversurrectorFXColors(12)=(R=32,G=20,B=0)
	OversurrectorFXColors(13)=(R=128,G=128,B=0)
	OversurrectorFXColors(14)=(R=128,G=64,B=0)
	OversurrectorFXColors(15)=(R=96,G=32,B=0)
	OversurrectorFXColors(16)=(R=64,G=32,B=0)
	OversurrectorFXColors(17)=(R=32,G=0,B=0)
	OversurrectorFXColors(18)=(R=96,G=48,B=0)
	OversurrectorFXColors(19)=(R=48,G=48,B=0)
	OversurrectorFXColors(20)=(R=255,G=0,B=0)
	OversurrectorFXColors(21)=(R=128,G=128,B=0)
	OversurrectorFXColors(22)=(R=128,G=64,B=0)
	OversurrectorFXColors(23)=(R=96,G=32,B=0)
	
	OversurrectorLightHue(0)=42
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=42
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=42
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'VulcanOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=25.000000
	OversurrectionProjSkyFireRate=7.500000
	OversurrectionProjSkyFireOdds=0.900000
	OversurrectionProjSkyFireMax=15
	OversurrectionProjSkyFireDmg=500
	OversurrectionProjSkyFireRadius=350.000000
	OversurrectionHProjSkyFireRate=2.500000
	OversurrectionHProjSkyFireOdds=0.350000
	OversurrectionHProjSkyFireMax=5
	OversurrectionHProjSkyFireDmg=2000
	OversurrectionHProjSkyFireRadius=600.000000
}
