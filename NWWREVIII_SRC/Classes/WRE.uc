//////////////////////////////////////////////////////////////
//	Nali Weapons III War Ready Enforcer (W.R.E.) weapon
//				Feralidragon (10-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRE expands NaliWeapons config(NWeaponsCfg);


//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=WRE ANIVFILE=MODELS\WRE_a.3d DATAFILE=MODELS\WRE_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WRE STRENGTH=0
#exec MESH ORIGIN MESH=WRE X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=WRER ANIVFILE=MODELS\WRE_a.3d DATAFILE=MODELS\WRE_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=WRER STRENGTH=0
#exec MESH ORIGIN MESH=WRER X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=WREPick ANIVFILE=MODELS\WREPickup_a.3d DATAFILE=MODELS\WREPickup_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=WREPick STRENGTH=0
#exec MESH ORIGIN MESH=WREPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=WREM ANIVFILE=MODELS\WRE_a.3d DATAFILE=MODELS\WRE_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WREM STRENGTH=0.45
#exec MESH ORIGIN MESH=WREM X=260 Y=0 Z=-20 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=WRE SEQ=All STARTFRAME=0 NUMFRAMES=22
#exec MESH SEQUENCE MESH=WRE SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRE SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=WRE SEQ=AltFire STARTFRAME=3 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=WRE SEQ=Select STARTFRAME=15 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=WRE SEQ=Down STARTFRAME=9 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=WRER SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=WRER SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRER SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=WRER SEQ=AltFire STARTFRAME=3 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=WRER SEQ=Select STARTFRAME=15 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=WRER SEQ=Down STARTFRAME=9 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=WREPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=WREM SEQ=All STARTFRAME=0 NUMFRAMES=22
#exec MESH SEQUENCE MESH=WREM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREM SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=WREM SEQ=AltFire STARTFRAME=3 NUMFRAMES=7 RATE=7.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=WRE MESH=WRE
#exec MESHMAP SCALE MESHMAP=WRE X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=WRER MESH=WRER
#exec MESHMAP SCALE MESHMAP=WRER X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=WREPick MESH=WREPick
#exec MESHMAP SCALE MESHMAP=WREPick X=0.095 Y=0.095 Z=0.19

#exec MESHMAP NEW MESHMAP=WREM MESH=WREM
#exec MESHMAP SCALE MESHMAP=WREM X=0.075 Y=0.075 Z=0.15

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_WRE_01 FILE=SKINS\Sk_WRE_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WRE NUM=1 TEXTURE=Sk_WRE_01
#exec MESHMAP SETTEXTURE MESHMAP=WRER NUM=1 TEXTURE=Sk_WRE_01
#exec MESHMAP SETTEXTURE MESHMAP=WREPick NUM=1 TEXTURE=Sk_WRE_01
#exec MESHMAP SETTEXTURE MESHMAP=WREM NUM=1 TEXTURE=Sk_WRE_01

#exec TEXTURE IMPORT NAME=Sk_WRE_02 FILE=SKINS\Sk_WRE_02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WRE NUM=2 TEXTURE=Sk_WRE_02
#exec MESHMAP SETTEXTURE MESHMAP=WRER NUM=2 TEXTURE=Sk_WRE_02
#exec MESHMAP SETTEXTURE MESHMAP=WREPick NUM=2 TEXTURE=Sk_WRE_02
#exec MESHMAP SETTEXTURE MESHMAP=WREM NUM=2 TEXTURE=Sk_WRE_02

#exec TEXTURE IMPORT NAME=Sk_WRE_03 FILE=SKINS\Sk_WRE_03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WRE NUM=3 TEXTURE=Sk_WRE_03
#exec MESHMAP SETTEXTURE MESHMAP=WRER NUM=3 TEXTURE=Sk_WRE_03
#exec MESHMAP SETTEXTURE MESHMAP=WREPick NUM=3 TEXTURE=Sk_WRE_03
#exec MESHMAP SETTEXTURE MESHMAP=WREM NUM=3 TEXTURE=Sk_WRE_03

#exec TEXTURE IMPORT NAME=WREMetal FILE=SKINS\WREMetal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=WREIcon FILE=ICONS\WREIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=WRECrossAlpha FILE=ICONS\WRECrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\WREIcons.utx PACKAGE=NWWREVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="WRE_Pickup" FILE=SOUNDS\WRE_Pickup.wav GROUP="WRE"
#exec AUDIO IMPORT NAME="WRE_Select" FILE=SOUNDS\WRE_Select.wav GROUP="WRE"
#exec AUDIO IMPORT NAME="WRE_Fire" FILE=SOUNDS\WRE_Fire.wav GROUP="WRE"
#exec AUDIO IMPORT NAME="WRE_AltFire" FILE=SOUNDS\WRE_AltFire.wav GROUP="WRE"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=WREHandL ANIVFILE=MODELS\WREHand_a.3d DATAFILE=MODELS\WREHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WREHandL STRENGTH=0
#exec MESH ORIGIN MESH=WREHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=WREHandR ANIVFILE=MODELS\WREHand_a.3d DATAFILE=MODELS\WREHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=WREHandR STRENGTH=0
#exec MESH ORIGIN MESH=WREHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=WREHandL SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=WREHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREHandL SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=WREHandL SEQ=AltFire STARTFRAME=3 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=WREHandL SEQ=Select STARTFRAME=15 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=WREHandL SEQ=Down STARTFRAME=9 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=WREHandR SEQ=All STARTFRAME=0 NUMFRAMES=34
#exec MESH SEQUENCE MESH=WREHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREHandR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=WREHandR SEQ=AltFire STARTFRAME=3 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=WREHandR SEQ=Select STARTFRAME=15 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=WREHandR SEQ=Down STARTFRAME=9 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=WREHandL MESH=WREHandL
#exec MESHMAP SCALE MESHMAP=WREHandL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=WREHandR MESH=WREHandR
#exec MESHMAP SCALE MESHMAP=WREHandR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=WREHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=WREHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//MUZZLE 3RD PERSON
//*******************************************************

//3rd person
#exec MESH IMPORT MESH=WREMuzzleM ANIVFILE=MODELS\WREMuzzle_a.3d DATAFILE=MODELS\WREMuzzle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WREMuzzleM STRENGTH=0
#exec MESH ORIGIN MESH=WREMuzzleM X=52 Y=0 Z=-4 Yaw=128

#exec MESH SEQUENCE MESH=WREMuzzleM SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREMuzzleM SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WREMuzzleM MESH=WREMuzzleM
#exec MESHMAP SCALE MESHMAP=WREMuzzleM X=0.375 Y=0.375 Z=0.750

#exec TEXTURE IMPORT NAME=WREMuzzle01 FILE=Effects\WREMuzzle01.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=WREMuzzleM NUM=1 TEXTURE=WREMuzzle01

#exec TEXTURE IMPORT NAME=WREMuzzle02 FILE=Effects\WREMuzzle02.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=WREMuzzleM NUM=2 TEXTURE=WREMuzzle02

#exec TEXTURE IMPORT NAME=WREMuzzle03 FILE=Effects\WREMuzzle03.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=WREMuzzleM NUM=3 TEXTURE=WREMuzzle03

//===========================================================================


var WREMuzzle muzz, muzzCor, muzzF;
var float MuzzCount;
var float CScale;

var(ServerConfig) config int GrenadeAmmoConsumption;
var(ServerConfig) config int HeadShotDmg;
var(ServerConfig) config float RunningAimError, WalkingAimError, CrouchingAimError;
var(ClientConfig) config float FireMuzzleFlashScale;

var() int ShotDamage;


//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime;
var(Oversurrection) config int OversurrectiveAttackDmg, OversurrectiveAttackHSDmg, OversurrectiveHealth;


function PreBeginPlay()
{
	AccuracyPattern[0] = default.RunningAimError;
	AccuracyPattern[1] = default.WalkingAimError;
	AccuracyPattern[2] = default.CrouchingAimError;
	
	Super.PreBeginPlay();
}

simulated function float GetAccuracy(optional bool bAltFire)
{
	if (Pawn(Owner).bDuck != 0)
		return AccuracyPattern[2];
	else if (Pawn(Owner).bRun != 0 || Pawn(Owner).OldLocation == Pawn(Owner).Location)
		return AccuracyPattern[1];
	return AccuracyPattern[0];
}

simulated function PlayFiring()
{
	PlayOwnedSound(FireSound, SLOT_None, Pawn(Owner).SoundDampening*3.0);
	PlayAnim('Fire', GetFirerateMult() * 2.0, 0.0);
	
	if (muzz != None)
		muzz.Destroy();
	if (muzzCor != None)
		muzzCor.Destroy();
	if (muzzF != None)
		muzzF.Destroy();
		
	muzz = None;
	muzzCor = None;
	muzzF = None;
	
	if (PlayerPawn(Owner) != None)
	{
		muzz = Spawn(Class'WREMuzzle');
		muzz.RandomizeMesh(PlayerPawn(Owner).Handedness != 1);
		
		muzzCor = Spawn(Class'WREMuzzleCor');
		muzzCor.RandomizeMesh(PlayerPawn(Owner).Handedness != 1);
		
		muzzF = Spawn(Class'WREMuzzleFade');
		muzzF.RandomizeMesh(PlayerPawn(Owner).Handedness != 1);
	}
	
	bMuzzleFlash++;
}

function AltFire( float Value )
{
    if ((AmmoType == None) && (AmmoName != None))
        GiveAmmo(Pawn(Owner));

    if (bInfinity || AmmoType.AmmoAmount >= Default.GrenadeAmmoConsumption)
    {
		GotoState('AltFiring');
        bPointing=True;
        bCanClientFire = true;
        ClientAltFire(Value);
		if (!bInfinity)
			AmmoType.UseAmmo(Default.GrenadeAmmoConsumption);

        if ( bRapidFire || (FiringSpeed > 0) )
            Pawn(Owner).PlayRecoil(FiringSpeed);

        AltProjectileFire(AltProjectileClass, AltProjectileSpeed, bAltWarnTarget);
	}
	else
		PlayNoAmmoAltFiring();
}

simulated function bool CheckAmmo( bool bAltFire)
{
local ZoneInfo ZInfo;

	if (bAltFire)
		return (bInfinity || (AmmoType != None && AmmoType.AmmoAmount >= Default.GrenadeAmmoConsumption));
	else if (Pawn(Owner) != None)
		return True;
	return False;
}

simulated function PlayAltFiring()
{
	PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*1.5);
	PlayAnim('AltFire', GetFirerateMult(True) * 1.0, 0.0);
}

simulated function PlayNoAmmoAltFiring()
{
	Super.PlayNoAmmoAltFiring();
	PlayAltFiring();
}

simulated function Tick(float Delta)
{
	if (muzz != None || muzzCor != None || muzzF != None)
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
			if (muzzF != None)
				muzzF.Destroy();
			muzzF = None;
		}
	}
	
	Super.Tick(Delta);
	
	if (Pawn(Owner) != None && Level.NetMode != NM_DedicatedServer)
	{
		if (Pawn(Owner).bDuck != 0)
			CScale = 0.35;
		else if (Pawn(Owner).bRun != 0 || Pawn(Owner).OldLocation == Pawn(Owner).Location)
			CScale = 0.5;
		else
			CScale = 0.75;
		
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

simulated function Destroyed()
{
	if (muzz != None)
		muzz.Destroy();
	if (muzzCor != None)
		muzzCor.Destroy();
	if (muzzF != None)
		muzzF.Destroy();
		
	muzz = None;
	muzzCor = None;
	muzzF = None;
	
	Super.Destroyed();
}

simulated function RenderOther(canvas Canvas, vector Loc, rotator Rot)
{
	if (muzz != None)
	{
		muzz.SetLocation(Loc + vector(Rot)*(11 - 11*default.FireMuzzleFlashScale));
		muzz.SetRotation(Rot);
		muzz.AnimSequence = AnimSequence;
		muzz.AnimFrame = AnimFrame;
		muzz.DrawScale = muzz.default.DrawScale * default.FireMuzzleFlashScale;
		Canvas.DrawActor(muzz, False, False);
	}
	
	if (muzzF != None)
	{
		muzzF.SetLocation(Loc + vector(Rot)*(11 - 11*default.FireMuzzleFlashScale));
		muzzF.SetRotation(Rot);
		muzzF.AnimSequence = AnimSequence;
		muzzF.AnimFrame = AnimFrame;
		muzzF.DrawScale = muzzF.default.DrawScale * default.FireMuzzleFlashScale;
		Canvas.DrawActor(muzzF, False, False);
	}
}

simulated function PrePostRenderOther( canvas Canvas, float Scale)
{
local Rotator newRot;

	if (muzzCor != None && PlayerPawn(Owner) != None && PlayerPawn(Owner).Handedness < 2)
	{
		muzzCor.SetLocation(Owner.Location + CalcNewDrawOffset());
		muzzCor.AnimSequence = AnimSequence;
		muzzCor.AnimFrame = AnimFrame;
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
local WREShellCase s;
local int tempKick;

	s = Spawn(class'WREShellCase', ZPOwner,, Owner.Location + CalcDrawOffset() + (2.8 * FireOffset.Y+5.0) * Y - Z);
	if ( s != None ) 
		s.Eject(((FRand()*0.3+0.4)*X + (FRand()*0.2+0.2)*Y + (FRand()*0.3+1.0) * Z)*160);
	tempKick = KickBack;
	
	if (Other == Level)
	{
		Spawn(class'WREHitEffect', ZPOwner,, HitLocation + HitNormal, Rotator(HitNormal));
		if (GetFirerateMult() <= 1.5 || FRand() < 0.5)
			Spawn(Class'WREWallParts', ZPOwner,, HitLocation + HitNormal, rotator(HitNormal));
	}
	else if (Other != Self && Other != Owner && Other != None) 
	{
		if ((Other.bIsPawn || Carcass(Owner) != None) && Role == ROLE_Authority)
		{
			Other.PlaySound(Sound 'ChunkHit',, 16.0,,100);
			if (!isAllowedToKick(Pawn(Owner), Pawn(Other)))
				tempKick = 0;
		}
		else if (!Other.bIsPawn && Carcass(Owner) == None)
			Spawn(class'NWZPUT_SmokePuff', ZPOwner,,HitLocation+HitNormal*9);

		if (Role == ROLE_Authority)
		{
			if (isHeadShotDmg(Other, HitLocation))
			{
				if (giveFiredHealth(Other, HeadShotDmg))
					return;
				Other.TakeDamage(HeadShotDmg * GetDamageMult(), Pawn(Owner), HitLocation, 10000.0 * X + (MirrorVectorByNormal(HitNormal, HitNormal) * (tempKick * 1000 + 1)), 'Decapitated');
			}
			else
			{
				if (giveFiredHealth(Other, ShotDamage))
					return;
				Other.TakeDamage(ShotDamage * GetDamageMult(),  Pawn(Owner), HitLocation, 5000.0 * X + (MirrorVectorByNormal(HitNormal, HitNormal) * (tempKick * 1000 + 1)), MyDamageType);	
			}
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

	EnemyDir = P.Enemy.Location - Owner.Location; 
	EnemyDist = VSize(EnemyDir);

	//Don't recommend second mode if it hasn't ammo for it and other conditions
	if ((!bInfinity && AmmoType.AmmoAmount < default.GrenadeAmmoConsumption) || EnemyDist < 360*FMax(1.0, Splasher) || P.Enemy.Region.Zone.bWaterZone || P.Region.Zone.bWaterZone)
		bUseAltMode = 0;
	else
		bUseAltMode = int(FRand() + 0.15);

	return (AIRating + FRand() * 0.05);
}

state NormalFire
{
	function EndState()
	{
		Super.EndState();
		OldFlashCount = FlashCount;
	}
		
Begin:
	FlashCount++;
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local rotator R;
local WRESoldier wreS;

	if (ref == None)
		return;
	if (ref.Instigator != None)
		R = rotator(ref.Instigator.Location - ref.Location);
	R.Pitch = 0;
	R.Roll = 0;
	wreS = ref.Spawn(Class'WRESoldier',,, HitLocation + HitNormal, R);
	if (wreS != None)
		wreS.setMaster(ref.Instigator);
}

static simulated function OversurrectorExplodeClient(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local WRESoldBaseCloudMaster master;
local rotator R;
local vector Loc;

	Loc = HitLocation + HitNormal;
	if (ref == None)
		return;
	ref.Spawn(Class'WRESoldInitExpl',,, Loc);
	ref.Spawn(Class'WRESoldInitExplCor',,, Loc);
	ref.Spawn(Class'WRESoldInitShake',,, Loc);
	
	R.Yaw = Rand(16384);
	master = ref.Spawn(Class'WRESoldBaseCloudMaster',,, Loc, R);
	ref.Spawn(Class'WRESoldBaseCloud', master,, Loc, R);
	ref.Spawn(Class'WRESoldBaseCloudB', master,, Loc, R);
	
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'WRESoldOversFXA';		break;
		case 1:	CFXClass = Class'WRESoldOversFXB';		break;
	}
	return (i <= 1);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WREPick
	CollisionHeight=12.500000
	CollisionRadius=24.000000
	AutoSwitchPriority=2
	Icon=WREIcon
	InventoryGroup=2
	ItemArticle="a"
	ItemName="War Ready Enforcer (W.R.E.)"
	MaxDesireability=0.900000
	PickupMessage="You got the War Ready Enforcer (W.R.E.)."
	PickupSound=WRE_Pickup
	PickupViewMesh=WREPick
	PickupViewScale=1.000000
	PlayerViewMesh=WRER
	PlayerViewOffset=(X=12.00000,Y=-6.200000,Z=-5.350000)
	WidePlayerViewOffset=(X=12.00000,Y=-6.200000,Z=-5.350000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=WREIcon
	ThirdPersonMesh=WREM
	ThirdPersonScale=0.750000
	AltDamageType=Ionized
	AltFireSound=WRE_AltFire
	AltProjectileClass=Class'WREGrenade'
	AmmoName=Class'WREAmmo'
	bInstantHit=True
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was silenced by %k's %w."
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=WRE_Fire
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Shot
	NameColor=(R=128,G=0,B=255)
	PickupAmmoCount=45
	ProjectileClass=None
	SelectSound=WRE_Select
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.750000
	AltRefireRate=1.000000
	bAltWarnTarget=True
	bRecommendAltSplashDamage=True
	bRecommendSplashDamage=False
	bSplashDamage=True
	bWarnTarget=False
	RefireRate=0.500000
	Mass=50.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=WRECross
	CustomCrossAlpha=WRECrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Heavy pistol and assault rifle hybrid.\n\nPrimary Fire: Low caliber titanium bullets.\n\nSecondary Fire: Launch of powerful ionic grenades."
	
	Texture=WREMetal
	
	AltFireOffSet=(X=5.000000)
	AltFireOffsetZAdjustHidden=-3.000000
	
	PlayerViewMeshLeft=WRE
	PlayerViewMeshRight=WRER
	HandPartMeshL(0)=WREHandL
	HandPartMeshR(0)=WREHandR
	BobDamping=1.075000
	
	RenderOffsetSelect=(Y=-8.000000,Z=0.000000)
	AnimMaxFrame=0.857129
	RenderOffsetAltFire=(X=-1.000000)
	AnimMaxFrameAltFire=0.857143
	
	bDrawMuzzleFlash=False
	bMuzzleFlashParticles=False
	FlashC=0.031000
	FlashLength=0.0400000
	FlashO=0.014000
	FlashS=128
	FlashY=0.100000
	
	MuzzleFlashMesh=WREMuzzleM
	MuzzleFlashScale=0.750000
	MuzzleFlashStyle=STY_Translucent
	MuzzleFlashTexture=None
	MuzzleScale=0.750000
	
	WaterSplashType=0
	ShotDamage=19
	NoAltAmmoMsgString="NO grenades left !"
	
	isZPWeapon=True
	bFireHitScan=True
	ZPMaxFirerate=2.000000
	
	GrenadeAmmoConsumption=5
	HeadShotDmg=75
	RunningAimError=1.000000
	WalkingAimError=0.500000
	CrouchingAimError=0.000000
	
	FireMuzzleFlashScale=1.000000
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=32,G=0,B=255)
	OversurrectorFXColors(0)=(R=0,G=0,B=255)
	OversurrectorFXColors(1)=(R=32,G=0,B=255)
	OversurrectorFXColors(2)=(R=0,G=0,B=96)
	OversurrectorFXColors(3)=(R=32,G=0,B=255)
	OversurrectorFXColors(4)=(R=32,G=0,B=255)
	OversurrectorFXColors(5)=(R=0,G=0,B=255)
	OversurrectorFXColors(6)=(R=32,G=0,B=255)
	OversurrectorFXColors(7)=(R=128,G=128,B=255)
	OversurrectorFXColors(8)=(R=128,G=128,B=255)
	OversurrectorFXColors(9)=(R=192,G=192,B=255)
	OversurrectorFXColors(10)=(R=192,G=192,B=255)
	OversurrectorFXColors(11)=(R=192,G=0,B=255)
	OversurrectorFXColors(12)=(R=32,G=0,B=128)
	OversurrectorFXColors(13)=(R=0,G=0,B=255)
	OversurrectorFXColors(14)=(R=64,G=64,B=255)
	OversurrectorFXColors(15)=(R=128,G=64,B=255)
	OversurrectorFXColors(16)=(R=128,G=0,B=255)
	OversurrectorFXColors(17)=(R=192,G=128,B=255)
	OversurrectorFXColors(18)=(R=128,G=0,B=255)
	OversurrectorFXColors(19)=(R=32,G=0,B=128)
	OversurrectorFXColors(20)=(R=0,G=0,B=255)
	OversurrectorFXColors(21)=(R=128,G=0,B=255)
	OversurrectorFXColors(22)=(R=64,G=0,B=255)
	OversurrectorFXColors(23)=(R=0,G=0,B=255)
	
	OversurrectorLightHue(0)=170
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=190
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=170
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'WREOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=40.000000
	OversurrectiveAttackDmg=100
	OversurrectiveAttackHSDmg=1000
	OversurrectiveHealth=1200
}
