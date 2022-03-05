//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTGndEruption expands NaliWActor;

#exec MESH IMPORT MESH=FlameTGndEruption ANIVFILE=MODELS\FlameTGndEruption_a.3d DATAFILE=MODELS\FlameTGndEruption_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTGndEruption STRENGTH=0
#exec MESH ORIGIN MESH=FlameTGndEruption X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FlameTGndEruption SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTGndEruption SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTGndEruption SEQ=Pressurize STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=FlameTGndEruption SEQ=BreakThrough STARTFRAME=9 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FlameTGndEruption SEQ=Explode STARTFRAME=19 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FlameTGndEruption SEQ=Crater STARTFRAME=31 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FlameTGndEruption MESH=FlameTGndEruption
#exec MESHMAP SCALE MESHMAP=FlameTGndEruption X=0.4 Y=0.4 Z=0.8

#exec TEXTURE IMPORT NAME=FlameTGndDefTex FILE=SKINS\FlameTGndDefTex.bmp GROUP=Skins LODSET=1
#exec MESHMAP SETTEXTURE MESHMAP=FlameTGndEruption NUM=1 TEXTURE=FlameTGndDefTex
#exec MESHMAP SETTEXTURE MESHMAP=FlameTGndEruption NUM=2 TEXTURE=FlameTGndDefTex

#exec AUDIO IMPORT NAME="FlameTGndEnter" FILE=SOUNDS\FlameTGndEnter.wav GROUP="Eruption"
#exec AUDIO IMPORT NAME="FlameTQuake" FILE=SOUNDS\FlameTQuake.wav GROUP="Eruption"
#exec AUDIO IMPORT NAME="FlameTGndExplode" FILE=SOUNDS\FlameTGndExplode.wav GROUP="Eruption"
#exec AUDIO IMPORT NAME="FlameTGndEruptingLava" FILE=SOUNDS\FlameTGndEruptingLava.wav GROUP="Eruption"


var() float IdleTime, PressureTime, BreakThroughTime, ExplodeTime;
var() float EruptionTime, HeavySmkTime, LightSmkTime, DyingTime;
var() float EruptionLavaRate;
var() int EruptionLavaPerUpdate;

var() float EruptionFireRate, EruptionWSmokeRate, EruptionBSmokeRate;
var() float HeavyWSmokeRate, HeavyBSmokeRate, LightWSmokeRate;

var() sound AppearSnd, ExplodeSnd;
var() sound QuakeAmbSound, EruptLavaAmbSound;

enum EruptState
{
	ERST_Idle,
	ERST_Pressurizing,
	ERST_BreakingThrough,
	ERST_Exploding,
	ERST_Erupting,
	ERST_HeavySmoking,
	ERST_LightSmoking,
	ERST_Dying
};
var EruptState EruptionState;

var FlameTGndEruptionLava FlGndLava, FlGndLavaGlow;
var FlameTGndEruptionLavaOV FlGndLavaOV;
var FlameTGndEruptionSideOV FlGndSideOV;
var float tCount, sC, smkWC, smkBC, fireC;
var byte smkGenCount;
var int realPitch, realYaw;


replication
{
	reliable if (Role == ROLE_Authority)
		EruptionTime, realPitch, realYaw;
}

function PreBeginPlay()
{
	if (Class'FlameTracker'.default.OversurrectionLifeTime > 0.0)
		EruptionTime = Class'FlameTracker'.default.OversurrectionLifeTime;
	if (Class'FlameTracker'.default.OversurrectiveBlobsRate > 0.0)
		EruptionLavaRate = Class'FlameTracker'.default.OversurrectiveBlobsRate;
	if (Class'FlameTracker'.default.OversurrectiveBlobsPerUpdate > 0)
		EruptionLavaPerUpdate = Class'FlameTracker'.default.OversurrectiveBlobsPerUpdate;
	
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	if (Role == ROLE_Authority)
	{
		realPitch = Rotation.Pitch;
		realYaw = Rotation.Yaw;
		InitEruption();
	}
	Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
local rotator R;

	R.Pitch = realPitch;
	R.Yaw = realYaw;
	R.Roll = Rotation.Roll;
	SetRotation(R);
	InitEruption();
}

simulated function InitEruption()
{
local NWWallTexDetector NWDec;
local texture WallTex;

	if (Level.NetMode != NM_DedicatedServer)
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
	
		FlGndLava = Spawn(Class'FlameTGndEruptionLava', Self);
		FlGndLava.DrawScale = DrawScale;
		FlGndSideOV = Spawn(Class'FlameTGndEruptionSideOV', Self);
		FlGndSideOV.DrawScale = DrawScale;
	}
	
	SetTimer(IdleTime, False);
	AmbientSound = QuakeAmbSound;
	SoundVolume = 0;
	DoSound(AppearSnd);
}

simulated function CloneAmbSoundTo(actor A)
{
	if (A == None)
		return;
	A.AmbientSound = AmbientSound;
	A.SoundVolume = SoundVolume;
	A.SoundRadius = SoundRadius;
	A.SoundPitch = SoundPitch;
}

function DoSound(sound Snd)
{
	if (Snd != None)
		PlaySound(Snd,, 100,, 10000);
}

function DoMegaSound(sound Snd)
{
	if (Snd != None)
	{
		PlaySound(Snd, SLOT_None, 100,, 10000);
		PlaySound(Snd, SLOT_Misc, 100,, 10000);
	}
}

simulated function Tick(float Delta)
{
local rotator R;
local vector V;
local FlameTGndSmokeGen fTGSG;

	tCount += Delta;
	if (EruptionState == ERST_Idle && tCount <= IdleTime)
		SoundVolume = Byte((tCount/IdleTime) * default.SoundVolume);
	else if (EruptionState == ERST_Pressurizing && tCount <= PressureTime && Level.NetMode != NM_DedicatedServer)
	{
		sC += Delta;
		if (sC >= PressureTime / 4)
		{
			R.Roll = Int(FRand()*21845 + smkGenCount*21845 - 32768);
			V.Z = 32*DrawScale + FRand()*48*DrawScale;
			fTGSG = Spawn(Class'FlameTGndSmokeGen',,, Location + ((V >> R) >> Rotation));
			if (fTGSG != None)
				fTGSG.SetLSpan((BreakThroughTime + PressureTime) - tCount);
			sC = 0.0;
			smkGenCount++;
		}
		
		if (FlGndLavaGlow != None)
			FlGndLavaGlow.ScaleGlow = (tCount/PressureTime) * FlGndLavaGlow.default.ScaleGlow;
	}
	else if (EruptionState == ERST_Erupting || EruptionState == ERST_Exploding)
	{
		if (Level.NetMode != NM_DedicatedServer)
		{
			if (EruptionFireRate > 0.0)
			{
				fireC += Delta;
				if (fireC >= 1/EruptionFireRate)
				{
					V = getRandomRadialPosOffset(48.0);
					Spawn(Class'FlameTEruptionFire',,, Location + V, rotator(vector(Rotation) + V/(512*DrawScale)));
					fireC = 0.0;
				}
			}
			
			if (EruptionWSmokeRate > 0.0)
			{
				smkWC += Delta;
				if (smkWC >= 1/EruptionWSmokeRate)
				{
					V = getRandomRadialPosOffset(48.0);
					Spawn(Class'FlameTEruptionWSmoke',,, Location + V, rotator(vector(Rotation) + V/(256*DrawScale)));
					smkWC = 0.0;
				}
			}
			
			if (EruptionBSmokeRate > 0.0)
			{
				smkBC += Delta;
				if (smkBC >= 1/EruptionBSmokeRate)
				{
					V = getRandomRadialPosOffset(48.0);
					Spawn(Class'FlameTEruptionBSmoke',,, Location + V, rotator(vector(Rotation) + V/(256*DrawScale)));
					smkBC = 0.0;
				}
			}
		}
	
		if (EruptionState == ERST_Erupting && tCount >= EruptionTime)
		{
			EruptionState = ERST_HeavySmoking;
			AmbientSound = None;
			if (FlGndLava != None)
				FlGndLava.AmbientSound = None;
			if (FlGndLavaOV != None)
				FlGndLavaOV.AmbientSound = None;
			tCount = 0.0;
			SetTimer(HeavySmkTime, False);
		}
	}
	else if (EruptionState == ERST_HeavySmoking && Level.NetMode != NM_DedicatedServer)
	{
		if (HeavyWSmokeRate > 0.0)
		{
			smkWC += Delta;
			if (smkWC >= 1/HeavyWSmokeRate)
			{
				V = getRandomRadialPosOffset(48.0);
				Spawn(Class'FlameTHeavyWSmoke',,, Location + V, rotator(vect(0,0,1) + V/(256*DrawScale)));
				smkWC = 0.0;
			}
		}
		
		if (HeavyBSmokeRate > 0.0)
		{
			smkBC += Delta;
			if (smkBC >= 1/HeavyBSmokeRate)
			{
				V = getRandomRadialPosOffset(48.0);
				Spawn(Class'FlameTHeavyBSmoke',,, Location + V, rotator(vect(0,0,1) + V/(256*DrawScale)));
				smkBC = 0.0;
			}
		}
	}
	else if (EruptionState == ERST_LightSmoking && Level.NetMode != NM_DedicatedServer)
	{
		if (LightWSmokeRate > 0.0)
		{
			smkWC += Delta;
			if (smkWC >= 1/LightWSmokeRate)
			{
				V = getRandomRadialPosOffset(32.0);
				Spawn(Class'FlameTHeavyWSmoke',,, Location + V, rotator(vect(0,0,1) + V/(128*DrawScale)));
				smkWC = 0.0;
			}
		}
		
		if (FlGndLavaOV != None)
			FlGndLavaOV.BaseScaleGlow = FlGndLavaOV.default.ScaleGlow * ((LightSmkTime - tCount)/LightSmkTime);
	}
	else if (EruptionState == ERST_Dying)
		PrePivot = -16.f*vector(Rotation)*DrawScale * (tCount/DyingTime);
}

simulated function Timer()
{
local vector V;
local FlamesTGndLavaBigProj fTGLBP;
local int i;
local float f;

	if (EruptionState == ERST_Idle)
	{
		EruptionState = ERST_Pressurizing;
		PlayAnim('Pressurize', 1/PressureTime, 0.0);
		SoundVolume = default.SoundVolume;
		if (Level.NetMode != NM_DedicatedServer)
		{
			Spawn(Class'FlameTQuakeShake');
			FlGndLavaGlow = Spawn(Class'FlameTGndEruptionLavaGlow', Self);
			FlGndLavaGlow.DrawScale = DrawScale;
			FlGndLavaGlow.ScaleGlow = 0.0;
		}
		sC = 0.0;
		tCount = 0.0;
	}
	else if (EruptionState == ERST_Erupting || EruptionState == ERST_Exploding)
	{
		if (Role == ROLE_Authority)
		{
			for (i = 0; i < EruptionLavaPerUpdate; i++)
			{
				V = getRandomRadialPosOffset(48.0);
				fTGLBP = Spawn(Class'FlamesTGndLavaBigProj',,, Location + V, rotator(vector(Rotation) + V/(256*DrawScale)));
				f = Class'FlamesTGndLavaBigProj'.default.DrawScale*FRand() + Class'FlamesTGndLavaBigProj'.default.DrawScale;
				if (fTGLBP != None)
				{
					fTGLBP.Move(vector(Rotation)*(f*(Sqrt((Class'FlamesTGndLavaBigProj'.default.CollisionRadius**2)*2) + 1)/Class'FlamesTGndLavaBigProj'.default.DrawScale));
					fTGLBP.SetScale(f);
				}
			}
		}
		
		SetTimer(1/EruptionLavaRate, False);
	}
	else if (EruptionState == ERST_HeavySmoking)
	{
		EruptionState = ERST_LightSmoking;
		tCount = 0.0;
		SetTimer(LightSmkTime, False);
	}
	else if (EruptionState == ERST_LightSmoking)
	{
		EruptionState = ERST_Dying;
		tCount = 0.0;
		TweenAnim('Still', DyingTime);
		if (FlGndLavaOV != None)
			FlGndLavaOV.Destroy();
		FlGndLavaOV = None;
	}
}

simulated function vector getRandomRadialPosOffset(float maxRadius, optional float minRadius)
{
local rotator R;
local vector V;
	
	R.Roll = Rand(16384)*4 - 32768;
	V.Z = (FRand()*(maxRadius - minRadius) + minRadius)*DrawScale;
	return ((V >> R) >> Rotation);
}

simulated function AnimEnd()
{
local FlameTQuakeEruptionShake FlQuake;
local FlameTGndEruptCor FlCor;
local rotator R;
local FlameTEruptCloudMaster master;

	if (EruptionState == ERST_Pressurizing)
	{
		EruptionState = ERST_BreakingThrough;
		PlayAnim('BreakThrough', 1/BreakThroughTime, 0.0);
		if (Level.NetMode != NM_DedicatedServer)
			Spawn(Class'FlameTBreakShake');
	}
	else if (EruptionState == ERST_BreakingThrough)
	{
		EruptionState = ERST_Exploding;
		PlayAnim('Explode', 1/ExplodeTime, 0.0);
		SetTimer(1/EruptionLavaRate, False);
		DoMegaSound(ExplodeSnd);
		AmbientSound = EruptLavaAmbSound;
		if (Level.NetMode != NM_DedicatedServer)
		{
			Spawn(Class'FlameTGndExplCor');
			Spawn(Class'FlameTGndExplCorLine');
			FlCor = Spawn(Class'FlameTGndEruptCor');
			FlCor.LifeSpan = ExplodeTime + EruptionTime + FlCor.FadeOutTime;
			CloneAmbSoundTo(FlCor);
		}
		CloneAmbSoundTo(FlGndLava);
	}
	else if (EruptionState == ERST_Exploding)
	{
		EruptionState = ERST_Erupting;
		TweenAnim('Crater', 0.01);
		SetTimer(1/EruptionLavaRate, False);
		
		if (FlGndLava != None)
		{
			FlGndLava.MultiSkins[1] = MultiSkins[1];
			FlGndLava.Style = Style;
			FlGndLava.bUnlit = bUnlit;
			FlGndLava.ScaleGlow = ScaleGlow;
		}
		
		if (FlGndLavaGlow != None)
			FlGndLavaGlow.Destroy();
		if (FlGndSideOV != None)
			FlGndSideOV.Destroy();
		FlGndSideOV = None;
		FlGndLavaGlow = None;

		if (Level.NetMode != NM_DedicatedServer)
		{
			R = Rotation;
			R.Roll = Rand(16384)*4;
			master = Spawn(Class'FlameTEruptCloudMaster',,,, R);
			Spawn(Class'FlameTEruptCloud', master,,, R);
			Spawn(Class'FlameTEruptCloudB', master,,, R);
			FlQuake = Spawn(Class'FlameTQuakeEruptionShake');
			FlQuake.SetQuakeDuration(EruptionTime);
			CloneAmbSoundTo(FlQuake);
			
			FlGndLavaOV = Spawn(Class'FlameTGndEruptionLavaOV', Self);
			FlGndLavaOV.DrawScale = DrawScale;
			CloneAmbSoundTo(FlGndLavaOV);
		}
	}
	else if (EruptionState == ERST_Dying)
	{
		Destroy();
		return;
	}
	tCount = 0.0;
}

simulated function Destroyed()
{
	if (FlGndLava != None)
		FlGndLava.Destroy();
	if (FlGndLavaOV != None)
		FlGndLavaOV.Destroy();
	if (FlGndLavaGlow != None)
		FlGndLavaGlow.Destroy();
	if (FlGndSideOV != None)
		FlGndSideOV.Destroy();

	FlGndLava = None;
	FlGndLavaOV = None;
	FlGndLavaGlow = None;
	FlGndSideOV = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FlameTGndEruption
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	SoundVolume=255
	SoundRadius=255
	SoundPitch=64
	MultiSkins(1)=FlameTGndDefTex
	
	IdleTime=2.000000
	DrawScale=2.500000
	PressureTime=7.000000
	BreakThroughTime=0.500000
	ExplodeTime=0.500000
	EruptionTime=10.000000
	HeavySmkTime=18.000000
	LightSmkTime=10.000000
	DyingTime=10.000000
	
	EruptionLavaRate=15.000000
	EruptionLavaPerUpdate=3
	
	EruptionFireRate=12.500000
	EruptionWSmokeRate=5.000000
	EruptionBSmokeRate=10.000000
	HeavyWSmokeRate=4.000000
	HeavyBSmokeRate=4.000000
	LightWSmokeRate=2.500000
	
	AppearSnd=FlameTGndEnter
	ExplodeSnd=FlameTGndExplode
	QuakeAmbSound=FlameTQuake
	EruptLavaAmbSound=FlameTGndEruptingLava
}
