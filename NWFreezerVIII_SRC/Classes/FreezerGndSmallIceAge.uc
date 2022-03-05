//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////

class FreezerGndSmallIceAge expands NaliWActor;

#exec MESH IMPORT MESH=FreezerGndIceAge ANIVFILE=MODELS\FreezerGndIceAge_a.3d DATAFILE=MODELS\FreezerGndIceAge_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerGndIceAge STRENGTH=0
#exec MESH ORIGIN MESH=FreezerGndIceAge X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FreezerGndIceAge SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FreezerGndIceAge SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerGndIceAge SEQ=Pressurize STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=FreezerGndIceAge SEQ=BreakThrough STARTFRAME=9 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FreezerGndIceAge SEQ=Explode STARTFRAME=19 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FreezerGndIceAge SEQ=Crater STARTFRAME=31 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerGndIceAge MESH=FreezerGndIceAge
#exec MESHMAP SCALE MESHMAP=FreezerGndIceAge X=0.4 Y=0.4 Z=0.8

#exec TEXTURE IMPORT NAME=FreezerTGndDefTex FILE=SKINS\FreezerTGndDefTex.bmp GROUP=Skins LODSET=1
#exec MESHMAP SETTEXTURE MESHMAP=FreezerGndIceAge NUM=1 TEXTURE=FreezerTGndDefTex
#exec MESHMAP SETTEXTURE MESHMAP=FreezerGndIceAge NUM=2 TEXTURE=FreezerTGndDefTex

#exec AUDIO IMPORT NAME="FreezerGndEnter" FILE=SOUNDS\FreezerGndEnter.wav GROUP="IceAge"
#exec AUDIO IMPORT NAME="FreezerTQuake" FILE=SOUNDS\FreezerTQuake.wav GROUP="IceAge"
#exec AUDIO IMPORT NAME="FreezerGndExplode" FILE=SOUNDS\FreezerGndExplode.wav GROUP="IceAge"


var() float IdleTime, PressureTime, BreakThroughTime, ExplodeTime;
var() float IceAgeTime, DyingTime;
var() sound ExplodeSnd, QuakeAmbSound;

enum IceState
{
	ISS_Idle,
	ISS_Pressurizing,
	ISS_BreakingThrough,
	ISS_Exploding,
	ISS_IceAging,
	ISS_Dying
};
var IceState IceAgeState;

var() float IceGroundTime, IceGroundPrepTime, IceGroundFadeOutTime;

var() int FreezingDmg;
var() float FreezingDmgRate, FreezingDmgRadius;
var() name FreezingDmgType;
var float dmgFreezeCount;

var() float IceImpaleOdds, IceImpaleMaxCol, IceImpaleMaxHeight;
var() int IceImpaleDmg;
var() float RIImpaleOdds, RIImpaleMinHeight, RIImpaleMaxHeight, RIImpaleRate, RIImpaleH;
var() int RIImpaleMinAmount, RIImpaleMaxAmount;
var float riiCount;

var FreezerGndIceAgeIce FrGndIce, FrGndIceGlow;
var FreezerGndIceAgeSideOV FrGndSideOV;
var FreezerIceCrystal FrIceCryst;
var FreezerIceGround FrIceGnd;
var float tCount;
var int realPitch, realYaw;
var bool isDScaleChange;
var int maxNonFreezablePClasses;


replication
{
	reliable if (Role == ROLE_Authority)
		IceAgeTime, realPitch, realYaw;
	reliable if (Role == ROLE_Authority && isDScaleChange)
		isDScaleChange;
}

function PreBeginPlay()
{
	if (Class'Freezer'.default.OversurrectionIceSpreadLifeTime > 0.0)
		IceAgeTime = Class'Freezer'.default.OversurrectionIceSpreadLifeTime;
	if (Class'Freezer'.default.OversurrectionFreezingDmg > 0.0)
		FreezingDmg = Class'Freezer'.default.OversurrectionFreezingDmg;
	if (Class'Freezer'.default.OversurrectionFreezingDmgRate > 0.0)
		FreezingDmgRate = Class'Freezer'.default.OversurrectionFreezingDmgRate;
	if (Class'Freezer'.default.OversurrectionFreezingDmgRadius > 0.0)
		FreezingDmgRadius = Class'Freezer'.default.OversurrectionFreezingDmgRadius;

	if (Class'Freezer'.default.OversurrectionImpaleOdds > 0.0)
		IceImpaleOdds = Class'Freezer'.default.OversurrectionImpaleOdds;
	if (Class'Freezer'.default.OversurrectionImpaleMaxHeight > 0.0)
		IceImpaleMaxHeight = Class'Freezer'.default.OversurrectionImpaleMaxHeight;
	if (Class'Freezer'.default.OversurrectionImpaleDmg > 0.0)
		IceImpaleDmg = Class'Freezer'.default.OversurrectionImpaleDmg;
		
	if (Class'Freezer'.default.OversurrectionRIImpaleOdds > 0.0)
		RIImpaleOdds = Class'Freezer'.default.OversurrectionRIImpaleOdds;
	if (Class'Freezer'.default.OversurrectionRIImpaleMinHeight > 0.0)
		RIImpaleMinHeight = Class'Freezer'.default.OversurrectionRIImpaleMinHeight;
	if (Class'Freezer'.default.OversurrectionRIImpaleMaxHeight > 0.0)
		RIImpaleMaxHeight = Class'Freezer'.default.OversurrectionRIImpaleMaxHeight;
	if (Class'Freezer'.default.OversurrectionRIImpaleRate > 0.0)
		RIImpaleRate = Class'Freezer'.default.OversurrectionRIImpaleRate;
	if (Class'Freezer'.default.OversurrectionRIImpaleMinAmount > 0.0)
		RIImpaleMinAmount = Class'Freezer'.default.OversurrectionRIImpaleMinAmount;
	if (Class'Freezer'.default.OversurrectionRIImpaleMaxAmount > 0.0)
		RIImpaleMaxAmount = Class'Freezer'.default.OversurrectionRIImpaleMaxAmount;
	
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	if (Role == ROLE_Authority)
	{
		realPitch = Rotation.Pitch;
		realYaw = Rotation.Yaw;
		LoadLists();
		InitIceAge();
	}
	Super.PostBeginPlay();
}

function LoadLists()
{
local int i;

	maxNonFreezablePClasses = ArrayCount(class'Freezer'.default.NonFreezablePawns);
	if (Class'Freezer'.default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(class'Freezer'.default.NonFreezablePawns); i++)
		{
			if (class'Freezer'.default.NonFreezablePawns[i] == '')
			{
				maxNonFreezablePClasses = i;
				break;
			}
		}
	}
}

simulated function PostNetBeginPlay()
{
local rotator R;

	R.Pitch = realPitch;
	R.Yaw = realYaw;
	R.Roll = Rotation.Roll;
	SetRotation(R);
	InitIceAge();
}

simulated function InitIceAge()
{
local NWWallTexDetector NWDec;
local texture WallTex;

	if (Level.NetMode != NM_DedicatedServer && !bHidden)
	{
		NWDec = Spawn(Class'NWWallTexDetector');
		WallTex = NWDec.AttachDecal(200);
		NWDec.Destroy();
		NWDec = None;
		if (WallTex != None)
		{
			MultiSkins[1] = WallTex;
			MultiSkins[2] = WallTex;
		}
	
		FrGndIce = Spawn(Class'FreezerGndIceAgeIce', Self);
		FrGndSideOV = Spawn(Class'FreezerGndIceAgeSideOV', Self);
		SetupScaling();
	}
	
	SetTimer(IdleTime, False);
	AmbientSound = QuakeAmbSound;
	SoundVolume = 0;
}

function SetScale(float dScale)
{
local float f;

	DrawScale = dScale;
	isDScaleChange = True;
	f = dScale / default.DrawScale;
	FreezingDmg = f * default.FreezingDmg;
	FreezingDmgRadius = f * default.FreezingDmgRadius;
}

simulated function SetupScaling()
{
	if (FrGndIce != None)
		FrGndIce.DrawScale = DrawScale;
	if (FrGndSideOV != None)
		FrGndSideOV.DrawScale = DrawScale;
}

function DoSound(sound Snd)
{
local float f;

	f = DrawScale / Class'FreezerGndIceAge'.default.DrawScale;
	if (Snd != None)
		PlaySound(Snd,, int(200*f),, int(6000*f));
}

simulated function Tick(float Delta)
{
	if (isDScaleChange)
	{
		isDScaleChange = False;
		if (Level.NetMode != NM_DedicatedServer)
			SetupScaling();
	}

	tCount += Delta;
	if (IceAgeState == ISS_Idle && tCount <= IdleTime)
		SoundVolume = Byte((tCount/IdleTime) * default.SoundVolume);
	else if (IceAgeState == ISS_Pressurizing && FrGndIceGlow != None && tCount <= PressureTime && Level.NetMode != NM_DedicatedServer)
		FrGndIceGlow.ScaleGlow = (tCount/PressureTime) * FrGndIceGlow.default.ScaleGlow;
	else if (IceAgeState == ISS_IceAging)
	{
		if (Role == ROLE_Authority)
		{
			if (FreezingDmgRate > 0.0)
			{
				dmgFreezeCount -= Delta;
				if (dmgFreezeCount <= 0.0)
				{
					dmgFreezeCount = 1/FreezingDmgRate;
					ProcessFreezingDmgRadius();
				}
			}
			
			if (RIImpaleRate > 0.0)
			{
				riiCount += Delta;
				if (riiCount >= 1/RIImpaleRate)
				{
					riiCount = 0.0;
					ProcessImpalementRadius();
				}
			}
		}
	
		if (tCount >= IceAgeTime)
		{
			IceAgeState = ISS_Dying;
			TweenAnim('Still', DyingTime);
			AmbientSound = None;
			if (FrGndIce != None)
				FrGndIce.AmbientSound = None;
			if (FrIceCryst != None)
				FrIceCryst.FadeOut(DyingTime/3*2);
			if (FrIceGnd != None)
			{
				FrIceGnd.PrepareToFadeOut(IceGroundPrepTime, IceGroundFadeOutTime, True);
				FrIceGnd = None;
			}
			tCount = 0.0;
		}
	}
	else if (IceAgeState == ISS_Dying)
		PrePivot = -16.f*vector(Rotation)*DrawScale * (tCount/DyingTime);
}

simulated function Timer()
{
	if (IceAgeState == ISS_Idle)
	{
		IceAgeState = ISS_Pressurizing;
		PlayAnim('Pressurize', 1/PressureTime, 0.0);
		SoundVolume = default.SoundVolume;
		if (Level.NetMode != NM_DedicatedServer)
		{
			Spawn(Class'FreezerQuakeShake');
			if (!bHidden)
			{
				FrGndIceGlow = Spawn(Class'FreezerGndIceAgeIceGlow', Self);
				FrGndIceGlow.DrawScale = DrawScale;
				FrGndIceGlow.ScaleGlow = 0.0;
			}
		}
		tCount = 0.0;
	}
}

simulated function AnimEnd()
{
local rotator R;
local FreezerIceAgeCloudMaster master;
local FreezerIceAgeCloud slave;
local FreezerBreakShake fbs;
local FreezeIceAgeWallParts fiawp;
local NWCoronaFX nwCor;
local float f;
local vector V;


	f = DrawScale / default.DrawScale;
	if (IceAgeState == ISS_Pressurizing)
	{
		IceAgeState = ISS_BreakingThrough;
		PlayAnim('BreakThrough', 1/BreakThroughTime, 0.0);
		if (Level.NetMode != NM_DedicatedServer)
		{
			fbs = Spawn(Class'FreezerBreakShake');
			fbs.SetShake(f * 0.35);
		}
	}
	else if (IceAgeState == ISS_BreakingThrough)
	{
		IceAgeState = ISS_Exploding;
		PlayAnim('Explode', 1/ExplodeTime, 0.0);
		DoSound(ExplodeSnd);
		AmbientSound = None;
		if (Level.NetMode != NM_DedicatedServer)
		{
			nwCor = Spawn(Class'FreezerGndExplSmallCor');
			nwCor.MaxCoronaSize *= f;
			nwCor.MinCoronaSize *= f;
			FrIceCryst = Spawn(Class'FreezerIceSmallCrystal');
			FrIceCryst.Rise(ExplodeTime);
			FreezerIceSmallCrystal(FrIceCryst).SetScale(f);
			fiawp = Spawn(Class'FreezeIceAgeWallParts');
			fiawp.SetScale(f/4);
			
			V = vector(Rotation);
			if (V.Z > 0.85)
			{
				FrIceGnd = Spawn(Class'FreezerIceGround');
				FrIceGnd.SetScale(f);
				FrIceGnd.Rise(IceGroundTime);
			}
		}
	}
	else if (IceAgeState == ISS_Exploding)
	{
		IceAgeState = ISS_IceAging;
		TweenAnim('Crater', 0.01);
		
		if (FrGndIce != None)
		{
			FrGndIce.MultiSkins[1] = MultiSkins[1];
			FrGndIce.Style = Style;
			FrGndIce.bUnlit = bUnlit;
			FrGndIce.ScaleGlow = ScaleGlow;
		}
		
		if (FrGndIceGlow != None)
			FrGndIceGlow.Destroy();
		if (FrGndSideOV != None)
			FrGndSideOV.Destroy();
		FrGndSideOV = None;
		FrGndIceGlow = None;

		if (Level.NetMode != NM_DedicatedServer)
		{
			R = Rotation;
			R.Roll = Rand(16384)*4;
			master = Spawn(Class'FreezerIceAgeCloudMaster',,,, R);
			slave = Spawn(Class'FreezerSmallIceAgeCloud', master,,, R);
			slave.DrawScale *= f;
			slave.MaxDrawScale *= f;
			slave.MinDrawScale *= f;
		}
	}
	else if (IceAgeState == ISS_Dying)
	{
		Destroy();
		return;
	}
	tCount = 0.0;
}

function ProcessFreezingDmgRadius()
{
local Pawn P;
local float f, colTg;
local vector HitLoc, HitNorm;

	if (FreezingDmgRadius <= 0.0 || FreezingDmg <= 0.0)
		return;
	for (P = Level.PawnList; P != None; P = P.NextPawn)
	{
		if (VSize(P.Location - Location) <= FreezingDmgRadius && isValidPawn(P) && FastTrace(P.Location, Location) && !isFriendlyPawn(P))
		{
			colTg = Sqrt((P.CollisionRadius**2) + (P.CollisionHeight**2));
			if (FRand() <= IceImpaleOdds && colTg <= IceImpaleMaxCol && Trace(HitLoc, HitNorm, P.Location - vector(Rotation)*IceImpaleMaxHeight, P.Location, False) != None)
			{
				P.TakeDamage(IceImpaleDmg, Instigator, P.Location, vect(0,0,0), FreezingDmgType);
				ImpalePawn(P, HitLoc + HitNorm, colTg);
			}
			else
			{
				f = (FreezingDmgRadius-VSize(P.Location - Location))/FreezingDmgRadius;
				P.TakeDamage(Int(f*FreezingDmg), Instigator, P.Location, vect(0,0,0), FreezingDmgType);
				FreezePawn(P);
			}
		}
	}
}

function ProcessImpalementRadius()
{
local vector HitLoc, HitNorm, STrace, ETrace;
local vector hL, hN;
local rotator R;
local int i, implAmount;
local actor A;
local Pawn P;
local IceImpale imp;
local float h;

	implAmount = Rand(RIImpaleMaxAmount - RIImpaleMinAmount) + RIImpaleMinAmount;
	for (i = 0; i < implAmount; i++)
	{
		if (FRand() <= RIImpaleOdds)
		{
			STrace = Location;
			ETrace = STrace + vector(Rotation)*RIImpaleH*(DrawScale/default.DrawScale);
			A = Trace(HitLoc, HitNorm, ETrace, STrace, False);
			if (A != None)
				ETrace = HitLoc + HitNorm;
			
			STrace = ETrace;
			ETrace += getRandomRadialPosOffset(0.85*FreezingDmgRadius, Rotation, 0.15*FreezingDmgRadius);
			A = Trace(HitLoc, HitNorm, ETrace, STrace, False);
			if (A != None)
				ETrace = HitLoc + HitNorm;
				
			STrace = ETrace;
			ETrace -= (vector(Rotation)*RIImpaleH*(DrawScale/default.DrawScale)*2);
			A = Trace(HitLoc, HitNorm, ETrace, STrace, False);
			if (A == None)
				continue;
			
			R = getIceImpalerRot(rotator(HitNorm));
			h = RandRange(RIImpaleMinHeight, RIImpaleMaxHeight);
			STrace = HitLoc + HitNorm;
			imp = Spawn(Class'IceImpale',,, STrace, R);
			imp.SetHeight(h);
			ForEach TraceActors(Class'Pawn', P, hL, hN, STrace + vector(R)*h, STrace)
			{
				if (isValidPawn(P) && !isFriendlyPawn(P))
				{
					P.TakeDamage(IceImpaleDmg, Instigator, P.Location, vect(0,0,0), FreezingDmgType);
					if (P != None && (P.Health <= 0 && (!P.bHidden || PlayerPawn(P) != None)) && CheckFreezablePawn(P))
					{
						ProcessImpaledBody(P, R, h, STrace, imp);
						break;
					}
				}
			}
		}
	}
}

simulated function vector getRandomRadialPosOffset(float maxRadius, rotator Rot, optional float minRadius)
{
local rotator R;
local vector V;
	
	R.Roll = int(FRand()*65536 - 32768);
	V.Z = (FRand()*(maxRadius - minRadius) + minRadius);
	return ((V >> R) >> Rot);
}

function ImpalePawn(Pawn P, vector loc, float colTg)
{
local IceImpale imp;
local rotator R;
local float h;

	if (P != None && (P.Health <= 0 && (!P.bHidden || PlayerPawn(P) != None)) && CheckFreezablePawn(P))
	{
		R = getIceImpalerRot(Rotation);
		h = colTg * RandRange(15, 30);
		imp = Spawn(Class'IceImpale',,, loc, R);
		imp.SetServerRot(R);
		imp.SetHeight(h);
		ProcessImpaledBody(P, R, h, loc, imp);
	}
}

function ProcessImpaledBody(Pawn P, rotator R, float h, vector implLoc, IceImpale imp)
{
local FrozenImpaledBody fib;

	fib = Spawn(Class'FrozenImpaledBody',,, P.Location, P.Rotation);
	fib.SetFrozenBody(P);
	fib.SetTravel(implLoc + VSize(P.Location - implLoc)*vector(R), implLoc + vector(R)*h*RandRange(0.65, 0.9), imp.GrowTime);
	FlashPlayer(PlayerPawn(P));
	if (P.bIsPlayer)
		P.HidePlayer();
	else if (ScriptedPawn(P) != None)
		ScriptedPawn(P).CarcassType = None;
}

function rotator getIceImpalerRot(rotator R)
{
	R.Roll = int(RandRange(-32768, 32768));
	R.Pitch += int(RandRange(-6500, 6500));
	R.Yaw += int(RandRange(-6500, 6500));
	return Normalize(R);
}

function FreezePawn(Pawn P)
{
local FrozenBody fb;
	
	if (P != None && (P.Health <= 0 && (!P.bHidden || PlayerPawn(P) != None)) && CheckFreezablePawn(P))
	{
		fb = Spawn(Class'FrozenBody',,, P.Location, P.Rotation);
		fb.SetFrozenBody(P);
		FlashPlayer(PlayerPawn(P));
		if (P.bIsPlayer)
			P.HidePlayer();
		else if (ScriptedPawn(P) != None)
			ScriptedPawn(P).CarcassType = None;	
	}
}

simulated function FlashPlayer(PlayerPawn PP)
{
	if (PP != None)
		PP.ClientFlash(2, 500 * vect(1,1,1));
}

function bool CheckFreezablePawn(Pawn P)
{
local int i;

	if (class'Freezer'.default.bInvertListsProcessing)
	{
		for (i = maxNonFreezablePClasses-1; i >= 0; i--)
		{
			if (class'Freezer'.default.NonFreezablePawns[i] != '' && P.IsA(class'Freezer'.default.NonFreezablePawns[i]))
				return False;
		}
	}
	else
	{
		for (i = 0; i < maxNonFreezablePClasses; i++)
		{
			if (class'Freezer'.default.NonFreezablePawns[i] != '' && P.IsA(class'Freezer'.default.NonFreezablePawns[i]))
				return False;
		}
	}
	return True;
}

function bool isValidPawn(Pawn P)
{
	return (P != None && !P.bDeleteMe && P.Health > 0 && !P.bHidden && P.bCollideActors && P.bBlockActors);
}

function bool isFriendlyPawn(Pawn P)
{
	return Class'NWUtils'.static.isFriend(P, Level, Instigator,, True, True);
}

simulated function Destroyed()
{
	if (FrGndIce != None)
		FrGndIce.Destroy();
	if (FrGndIceGlow != None)
		FrGndIceGlow.Destroy();
	if (FrGndSideOV != None)
		FrGndSideOV.Destroy();
	if (FrIceCryst != None)
		FrIceCryst.Destroy();
	if (FrIceGnd != None)
		FrIceGnd.Destroy();

	FrGndIce = None;
	FrGndIceGlow = None;
	FrGndSideOV = None;
	FrIceCryst = None;
	FrIceGnd = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FreezerGndIceAge
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	SoundVolume=192
	SoundRadius=128
	SoundPitch=48
	MultiSkins(1)=FreezerTGndDefTex
	
	IdleTime=2.000000
	DrawScale=2.500000
	PressureTime=1.000000
	BreakThroughTime=0.250000
	ExplodeTime=0.150000
	IceAgeTime=15.000000
	DyingTime=5.000000
	
	ExplodeSnd=FreezerGndExplode
	QuakeAmbSound=FreezerTQuake
	
	IceGroundTime=6.000000
	IceGroundPrepTime=5.000000
	IceGroundFadeOutTime=3.500000
	
	FreezingDmg=1000
	FreezingDmgRate=2.000000
	FreezingDmgRadius=1000.000000
	FreezingDmgType=Frozen
	
	IceImpaleOdds=0.350000
	IceImpaleMaxCol=300.000000
	IceImpaleMaxHeight=1750.000000
	IceImpaleDmg=2000
	
	RIImpaleOdds=0.100000
	RIImpaleMinHeight=250.000000
	RIImpaleMaxHeight=1750.000000
	RIImpaleRate=0.500000
	RIImpaleMinAmount=1
	RIImpaleMaxAmount=4
	RIImpaleH=350.000000
}
