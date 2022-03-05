//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormCrystal expands NaliWActor;

#exec MESH IMPORT MESH=BoltCrystal ANIVFILE=MODELS\BoltCrystal_a.3d DATAFILE=MODELS\BoltCrystal_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltCrystal STRENGTH=0
#exec MESH ORIGIN MESH=BoltCrystal X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltCrystal SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltCrystal SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=BoltCrystal MESH=BoltCrystal
#exec MESHMAP SCALE MESHMAP=BoltCrystal X=0.4 Y=0.4 Z=0.8

#exec AUDIO IMPORT NAME="BoltCrystalAmb" FILE=SOUNDS\BoltCrystalAmb.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltCrystalSpawnSnd" FILE=SOUNDS\BoltCrystalSpawnSnd.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltStormLoading" FILE=SOUNDS\BoltStormLoading.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltStormCast" FILE=SOUNDS\BoltStormCast.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltStormThunder01" FILE=SOUNDS\BoltStormThunder01.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltStormThunder02" FILE=SOUNDS\BoltStormThunder02.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltStormThunder03" FILE=SOUNDS\BoltStormThunder03.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltStormThunder04" FILE=SOUNDS\BoltStormThunder04.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltStormThunder05" FILE=SOUNDS\BoltStormThunder05.wav GROUP="Storm"

#exec OBJ LOAD FILE=Textures\BoltEnergyFX.utx PACKAGE=NWBoltRifleVIII_SRC.BoltEnergyFX


var() float StartingTime, LoadingTime, StormCastTime, StormTime, StormEndTime;
var() sound InitSound, LoadSound, LoadingSound, StormCastSound, ThunderSnds[5];

var() float ElectricRate, BeamElectricRate, BeamCloudElectricRate;
var() float ElectricMaxDist;
var() float ElectricOdds, ElectricCloudOdds, BeamElectricOdds, BeamCloudElectricOdds;
var() int MaxElectric, BeamMaxElectric, BeamCloudMaxElectric;
var float eRCount, eBeamRCount, eBeamCloudRCount;
var BoltBaseCloud ElectricCloud;

var() float LoadPartTracesRateMax, LoadPartTracesRateMin;
var() int LoadPartTracesPerUpdateMax, LoadPartTracesPerUpdateMin;
var float lPTCount, nextLPTCount;

enum StmState
{
	STM_Starting,
	STM_Loading,
	STM_StormCast,
	STM_StormActive,
	STM_StormEnd
};
var StmState StormState;

var() float StormMaxDistance, BeamRadius, BeamFadeInTime, MinDistToDownStorm;
var float curStormDistUp, curStormDistDown;
var vector stormOrigUp, stormOrigDown;


var() int RotParticInitAngleMax, RotParticInitAngleMin;
var() float RotParticFadeInMax, RotParticFadeInMin;
var() float RotParticRotRateMax, RotParticRotRateMin;
var() float RotParticDScaleMax, RotParticDScaleMin;
var() byte RotParticDensityMax, RotParticDensityMin;
var BoltStormRotParticles RotParticles[24]; 

var BoltStormCrystalLight BStmLight, BStmLightLine;
var BoltCrystalSparks BCrtSparks[4];
var BoltCrystalGlow BGlow;
var BoltStormLightBeam BSLBeam1, BSLBeam2;
var BoltStormCrystalBeamLight BSLBeamLight1, BSLBeamLightLine1, BSLBeamLight2, BSLBeamLightLine2;
var BoltStormCrystalBeamReleaseLight BSBLBeamReleaseLight;
var BoltStormBaseCloudMaster BSBCMaster1, BSBCMaster2;
struct StCloud
{
	var BoltStormBaseCloud WCloud, BCloud, ECloud;
};
var StCloud StormClouds1[7], StormClouds2[7];
var float tCount;
var bool bNoDestroyClouds;

var() float HeavyLightningMaxDist, HeavyLightningRate;
var() float HeavyLightningOdds, HeavyCloudLightningOdds, HeavyDryLightningOdds, HeavyLightningEnemyOdds;
var() int HeavyMaxLightnings;
var() int HeavyLightningDirectDmg, HeavyLightningSplashDmg;
var() name HeavyLightningDmgType;
var() float HeavyLightningDmgMaxRadius;
var float hLCount;


replication
{
	reliable if (Role == ROLE_Authority)
		StormTime;
}

function PreBeginPlay()
{
	if (Class'BoltRifle'.default.OversurrectionLifeTime > 0.0)
		StormTime = Class'BoltRifle'.default.OversurrectionLifeTime;
	if (Class'BoltRifle'.default.OversurrectiveHLRate > 0.0)
		HeavyLightningRate = Class'BoltRifle'.default.OversurrectiveHLRate;
	if (Class'BoltRifle'.default.OversurrectiveHLOdds > 0.0)
		HeavyLightningOdds = Class'BoltRifle'.default.OversurrectiveHLOdds;
	if (Class'BoltRifle'.default.OversurrectiveCloudHLOdds > 0.0)
		HeavyCloudLightningOdds = Class'BoltRifle'.default.OversurrectiveCloudHLOdds;
	if (Class'BoltRifle'.default.OversurrectiveDryHLOdds > 0.0)
		HeavyDryLightningOdds = Class'BoltRifle'.default.OversurrectiveDryHLOdds;
	if (Class'BoltRifle'.default.OversurrectiveEnemyHLOdds > 0.0)
		HeavyLightningEnemyOdds = Class'BoltRifle'.default.OversurrectiveEnemyHLOdds;
	if (Class'BoltRifle'.default.OversurrectiveMaxHL > 0)
		HeavyMaxLightnings = Class'BoltRifle'.default.OversurrectiveMaxHL;
	if (Class'BoltRifle'.default.OversurrectiveHLMaxDist > 0.0)
		HeavyLightningMaxDist = Class'BoltRifle'.default.OversurrectiveHLMaxDist;
	if (Class'BoltRifle'.default.OversurrectiveHLDirectDmg > 0)
		HeavyLightningDirectDmg = Class'BoltRifle'.default.OversurrectiveHLDirectDmg;
	if (Class'BoltRifle'.default.OversurrectiveHLSplashDmg > 0)
		HeavyLightningSplashDmg = Class'BoltRifle'.default.OversurrectiveHLSplashDmg;
	if (Class'BoltRifle'.default.OversurrectiveHLDmgRadius > 0)
		HeavyLightningDmgMaxRadius = Class'BoltRifle'.default.OversurrectiveHLDmgRadius;
	
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	if (Role == ROLE_Authority)
		InitStorm();
	Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
	InitStorm();
}

simulated function InitStorm()
{
local int i;
local BoltBaseCloudMaster master;
local actor A;
local vector HitLoc, HitNorm, ETrace;

	if (Level.NetMode != NM_DedicatedServer)
	{
		Spawn(Class'BoltStormInitShake');
		Spawn(Class'BoltStormCrystalInitLight');
		Spawn(Class'BoltStormCrystalInitLine');
		BStmLight = Spawn(Class'BoltStormCrystalLight');
		BStmLightLine = Spawn(Class'BoltStormCrystalLightLine');
		for (i = 0; i < ArrayCount(BCrtSparks); i++)
		{
			BCrtSparks[i] = Spawn(Class'BoltCrystalSparks',,,, RotRand(True));
			BCrtSparks[i].ChangeMesh(i);
		}
		
		master = Spawn(Class'BoltBaseCloudMaster');
		ElectricCloud = Spawn(Class'BoltBaseCloud', master);
		Spawn(Class'BoltBaseCloudB', master);
		Spawn(Class'BoltBaseCloudElectric', master);
	}
	
	ETrace = Location + StormMaxDistance*vect(0,0,1);
	A = Trace(HitLoc, HitNorm, ETrace, Location, False);
	if (A == None)
	{
		HitLoc = ETrace;
		HitNorm = vect(0,0,-1);
	}
	curStormDistUp = VSize(HitLoc + HitNorm - Location);
	stormOrigUp = HitLoc + HitNorm;
	
	ETrace = Location + StormMaxDistance*vect(0,0,-1);
	A = Trace(HitLoc, HitNorm, ETrace, Location, False);
	if (A == None)
	{
		HitLoc = ETrace;
		HitNorm = vect(0,0,1);
	}
	curStormDistDown = VSize(HitLoc + HitNorm - Location);
	stormOrigDown = HitLoc + HitNorm;
	
	DoSound(InitSound);
	SetTimer(StartingTime, False);
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
		PlaySound(Snd, SLOT_None, 100,, 15000);
		PlaySound(Snd, SLOT_Misc, 100,, 15000);
	}
}

simulated function Timer()
{
local int i;
local rotator R;

	if (StormState == STM_Starting)
	{
		StormState = STM_Loading;
		DoSound(LoadSound);
		SetTimer(LoadingTime, False);
		if (Level.NetMode != NM_DedicatedServer)
		{
			BGlow = Spawn(Class'BoltCrystalGlow', Self);
			BGlow.ScaleGlow = 0.0;
			BGlow.AmbientSound = LoadingSound;
			BGlow.SoundRadius = SoundRadius;
			BGlow.SoundVolume = 0.0;
			
			for (i = 0; i < ArrayCount(RotParticles); i++)
			{
				R = Rotation;
				if (FRand() > 0.5)
					R.Pitch += 32768;
				R.Pitch += int(RandRange(RotParticInitAngleMin, RotParticInitAngleMax));
				R.Roll += int(RandRange(RotParticInitAngleMin, RotParticInitAngleMax));
				R = Normalize(R);
				RotParticles[i] = Spawn(Class'BoltStormRotParticles',,,, R);
				RotParticles[i].InitializeFX(RandRange(RotParticRotRateMin, RotParticRotRateMax), RandRange(RotParticFadeInMin, RotParticFadeInMax), 
					Byte(RandRange(RotParticDensityMin, RotParticDensityMax)), (i%4)+1, RandRange(RotParticDScaleMin, RotParticDScaleMax));
			}
		}
	}
	else if (StormState == STM_Loading)
	{
		StormState = STM_StormCast;
		DoMegaSound(StormCastSound);
		SetTimer(StormCastTime, False);
		ElectricCloud = None;
		if (BGlow != None)
			BGlow.AmbientSound = None;
		if (Level.NetMode != NM_DedicatedServer)
		{
			Spawn(Class'BoltStormCastShake');
			BSBLBeamReleaseLight = Spawn(Class'BoltStormCrystalBeamReleaseLight');
			if (BStmLightLine != None)
			{
				BStmLightLine.DScaleCoefMax += 2.0;
				BStmLightLine.DScaleCoefMin += 2.0;
			}
			
			BSLBeam1 = Spawn(Class'BoltStormLightBeam',,,, rotator(vect(0,0,1)));
			BSLBeam1.setDimensions(BeamRadius, curStormDistUp);
			BSLBeam1.fadeIn(BeamFadeInTime);
			BSLBeam2 = Spawn(Class'BoltStormLightBeam',,,, rotator(vect(0,0,-1)));
			BSLBeam2.setDimensions(BeamRadius, curStormDistDown);
			BSLBeam2.fadeIn(BeamFadeInTime);
			
			BSLBeamLight1 = Spawn(Class'BoltStormCrystalBeamLight',,, stormOrigUp);
			BSLBeamLightLine1 = Spawn(Class'BoltStormCrystalBeamLightLine',,, stormOrigUp);
			BSLBeamLight2 = Spawn(Class'BoltStormCrystalBeamLight',,, stormOrigDown);
			BSLBeamLightLine2 = Spawn(Class'BoltStormCrystalBeamLightLine',,, stormOrigDown);
		}
		
		R = rot(0,0,0);
		R.Yaw = Rand(16384)*4;
		SpawnStormClouds(stormOrigUp, R, True, BSBCMaster1, StormClouds1);
		if (curStormDistDown >= MinDistToDownStorm)
		{
			R.Yaw = Rand(16384)*4;
			SpawnStormClouds(stormOrigDown, R, False, BSBCMaster2, StormClouds2);
		}
	}
	else if (StormState == STM_StormCast)
	{
		StormState = STM_StormActive;
		SetTimer(StormTime, False);
		if (BGlow != None)
			BGlow.Destroy();
		BGlow = None;
		for (i = 0; i < ArrayCount(RotParticles); i++)
		{
			if (RotParticles[i] != None)
				RotParticles[i].Destroy();
			RotParticles[i] = None;
		}
		for (i = 0; i < ArrayCount(BCrtSparks); i++)
		{
			if (BCrtSparks[i] != None)
				BCrtSparks[i].Destroy();
			BCrtSparks[i] = None;
		}
	}
	else if (StormState == STM_StormActive)
	{
		StormState = STM_StormEnd;
		SetTimer(StormEndTime, False);
		bNoDestroyClouds = True;
		bHidden = True;
		if (BSLBeam1 != None)
			BSLBeam1.fadeOut(StormEndTime);
		if (BSLBeam2 != None)
			BSLBeam2.fadeOut(StormEndTime);
	}
	else if (StormState == STM_StormEnd)
		Destroy();
	tCount = 0.0;
}

simulated function SetCoronaSizeFade(NWCoronaFX corFX, float f, optional bool ignoreDScale)
{
	if (corFX == None)
		return;
	corFX.CGlow = corFX.default.CGlow * f;
	corFX.CGlowMax = corFX.default.CGlowMax * f;
	corFX.CGlowMin = corFX.default.CGlowMin * f;
	corFX.MaxCoronaSize = corFX.default.MaxCoronaSize * f;
	corFX.MinCoronaSize = corFX.default.MinCoronaSize * f;
	if (ignoreDScale)
		return;
	corFX.DScaleCoefMax = corFX.default.DScaleCoefMax * f;
	corFX.DScaleCoefMin = corFX.default.DScaleCoefMin * f;
}

simulated function SpawnStormClouds(vector Loc, rotator R, bool isUpper, out BoltStormBaseCloudMaster BSBCMaster, out StCloud StormClouds[7])
{
local int i, rotRate;
local float cloudsLTime, minCloudScale, maxCloudScale, sign;
local vector realCloudLoc;

	sign = float(isUpper)*2 - 1;
	cloudsLTime = Class'BoltStormBaseCloud'.default.fadeOutTime + StormCastTime + StormTime + StormEndTime;
	BSBCMaster = Spawn(Class'BoltStormBaseCloudMaster',,, Loc, R);
	BSBCMaster.LifeSpan = cloudsLTime + 1.f;
	for (i = 0; i < ArrayCount(StormClouds); i++)
	{
		minCloudScale = (2.f**i);
		maxCloudScale = 1.45*(2.f**i);
		rotRate = i*350 + 350;
		realCloudLoc = Loc - sign*minCloudScale*8.f*vect(0,0,1);
		StormClouds[i].WCloud = Spawn(Class'BoltStormBaseCloud', BSBCMaster,, realCloudLoc, R);
		StormClouds[i].WCloud.InitializeLightningClouds(cloudsLTime, minCloudScale, maxCloudScale, rotRate);
		StormClouds[i].BCloud = Spawn(Class'BoltStormBaseCloudB', BSBCMaster,, realCloudLoc, R);
		StormClouds[i].BCloud.InitializeLightningClouds(cloudsLTime, minCloudScale, maxCloudScale, rotRate);
		StormClouds[i].ECloud = Spawn(Class'BoltStormBaseCloudElectric', BSBCMaster,, realCloudLoc, R);
		StormClouds[i].ECloud.InitializeLightningClouds(cloudsLTime, minCloudScale, maxCloudScale, rotRate);
	}
}

function SpawnRandomHLightnings(bool isUpper, StCloud StmClouds[7], optional StCloud AltStmClouds[7])
{
local int i, maxI, cloudLTries;
local float sign;
local bool bSpawnedHLightning;
local BoltStormBaseCloud bSBC;
local BoltStormHeavyLightning bSHL;
local vector HitLoc, HitNorm, STrace, ETrace;
local actor A;
local Pawn Victim;

	if (FRand() <= HeavyLightningOdds)
	{
		maxI = Rand(HeavyMaxLightnings) + 1;
		sign = float(isUpper)*2 - 1;
		for (i = 0; i < maxI; i++)
		{
			bSBC = StmClouds[Rand(ArrayCount(StmClouds))].WCloud;
			if (bSBC == None)
				continue;
			
			STrace = bSBC.getRandomCloudLoc(True);
			Victim = None;
			if (FRand() <= HeavyLightningEnemyOdds)
				Victim = getHLTarget(STrace, isUpper);
			if (Victim != None)
			{
				A = Victim;
				ETrace = Victim.Location + ((FRand()*2-1)*Victim.CollisionHeight*vect(0,0,1));
				HitLoc = ETrace;
				HitNorm = Normal(STrace - ETrace);
			}
			else
			{
				ETrace = STrace - sign*HeavyLightningMaxDist*getRandomInfluencedZDir();
				A = Trace(HitLoc, HitNorm, ETrace, STrace);
			}
			
			if (A != None)
			{
				bSHL = Spawn(Class'BoltStormHeavyLightning',,, STrace, rotator(ETrace - STrace));
				bSHL.SetLength(VSize(STrace - HitLoc));
				bSpawnedHLightning = True;
				if (A == Level)
					SpawnLevelLightningFX(HitLoc, HitNorm);
				if (Pawn(A) != None)
					GiveDirectLightningDmg(A, HitLoc);
				ProcessLightningDmgRadius(VSize(STrace - HitLoc), HitLoc + HitNorm);
			}
			else if (FRand() <= HeavyCloudLightningOdds)
			{
				bSBC = AltStmClouds[Rand(ArrayCount(AltStmClouds))].WCloud;
				if (bSBC == None)
					continue;
				
				cloudLTries = 6;
				do
				{
					HitLoc = bSBC.getRandomCloudLoc(True);
					cloudLTries--;
				}
				until (FastTrace(STrace, HitLoc) || cloudLTries <= 0)
				if (cloudLTries <= 0)
					continue;
				
				bSHL = Spawn(Class'BoltStormHeavyLightning',,, STrace, rotator(HitLoc - STrace));
				bSHL.SetLength(VSize(STrace - HitLoc));
				bSHL.SpawnCoronaFX(HitLoc);
				bSpawnedHLightning = True;
			}
			else if (FRand() <= HeavyDryLightningOdds)
			{
				bSHL = Spawn(Class'BoltStormHeavyLightning',,, STrace, rotator(ETrace - STrace));
				bSHL.SetLength(FRand()*VSize(STrace - ETrace)/2);
				bSpawnedHLightning = True;
			}
		}
	}
	
	if (bSpawnedHLightning)
		DoMegaSound(ThunderSnds[Rand(ArrayCount(ThunderSnds))]);
}

function SpawnLevelLightningFX(vector HitLoc, vector HitNorm)
{
local int sparks, j;
local BoltStormHLightEffectGND bSHLEGnd;

	bSHLEGnd = Spawn(Class'BoltStormHLightEffectGND',,, HitLoc + HitNorm);
	if (!bSHLEGnd.Region.Zone.bWaterZone)
	{
		sparks = 10 + Rand(16);
		for (j = 0; j <= sparks; j++) 
			Spawn(Class'BoltSpark',,, HitLoc + 8 * HitNorm, rotator(HitNorm));
		Spawn(Class'BoltStormHSmokeGen',,, HitLoc + HitNorm);
	}
}

function GiveDirectLightningDmg(actor A, vector HitLoc)
{
	if (A == None)
		return;
	A.PlaySound(Sound'ChunkHit',, 16.0,,100);
	A.TakeDamage(HeavyLightningDirectDmg, Instigator, HitLoc, vect(0,0,0), HeavyLightningDmgType);
}

function ProcessLightningDmgRadius(float LightningSize, vector HitLoc)
{
local Pawn P;
local float maxRadius;

	Spawn(Class'BoltStormHLightningFlamesCarcasses',,, HitLoc);
	maxRadius = HeavyLightningDmgMaxRadius * (LightningSize/HeavyLightningMaxDist);
	for (P = Level.PawnList; P != None; P = P.NextPawn)
	{
		if (VSize(P.Location - Location) <= maxRadius && isValidPawn(P) && FastTrace(P.Location, Location) && !isFriendlyPawn(P))
		{
			P.TakeDamage((VSize(P.Location - Location)/maxRadius) * HeavyLightningSplashDmg, Instigator, 
				P.Location + P.CollisionHeight*vect(0,0,-0.9), vect(0,0,0), HeavyLightningDmgType);
		}
	}
}

function Pawn getHLTarget(vector startPos, bool bUpper)
{
local Pawn P, PList[48];
local int pawnsAmount, i;
local float dist;
	
	for (P = Level.PawnList; P != None; P = P.NextPawn)
	{
		dist = VSize(P.Location - startPos);
		if (dist <= HeavyLightningMaxDist && ((bUpper && P.Location.Z < startPos.Z) || (!bUpper && P.Location.Z > startPos.Z)) 
		&& isValidPawn(P) && FastTrace(P.Location, startPos) && !isFriendlyPawn(P))
		{
			PList[pawnsAmount++] = P;
			if (i >= ArrayCount(PList))
				break;
		}
	}
	
	if (pawnsAmount == 0)
		return None;
	return PList[Rand(pawnsAmount)];
}

function bool isValidPawn(Pawn P)
{
	return (P != None && !P.bDeleteMe && P.Health > 0 && !P.bHidden && P.bCollideActors && P.bBlockActors);
}

function bool isFriendlyPawn(Pawn P)
{
	return Class'NWUtils'.static.isFriend(P, Level, Instigator,, True, True);
}

function vector getRandomInfluencedZDir()
{
	return Normal(vect(0,0,1) + RandRange(-1.f, 1.f)*vect(1,0,0) + RandRange(-1.f, 1.f)*vect(0,1,0));
}

simulated function Tick(float Delta)
{
local int i, maxI;
local vector HitLoc, HitNorm;
local actor A;
local BoltStormLightningA btSLA;
local BoltStormTracedImpl bSTI;
local float f;
	
	if (Level.NetMode != NM_DedicatedServer && StormState <= STM_StormActive)
	{
		eRCount += Delta;
		if (eRCount >= 1/ElectricRate)
		{
			eRCount = 0.0;
			if (FRand() <= ElectricOdds)
			{
				maxI = Rand(MaxElectric) + 1;
				for (i = 0; i < maxI; i++)
				{
					A = Trace(HitLoc, HitNorm, Location + VRand()*ElectricMaxDist, Location, False);
					if (A != None)
					{
						btSLA = Spawn(Class'BoltStormLightningA');
						btSLA.SetLightning(Self, HitLoc);
					}
					else if (ElectricCloud != None && FRand() <= ElectricCloudOdds)
					{
						btSLA = Spawn(Class'BoltStormLightningA');
						btSLA.SetLightning(Self, ElectricCloud.getRandomCloudLoc());
					}
				}
			}
		}
		
		if (BSLBeam1 != None || BSLBeam2 != None)
		{
			eBeamRCount += Delta;
			if (eBeamRCount >= 1/BeamElectricRate)
			{
				eBeamRCount = 0.0;
				ProcessBeamLightning(BSLBeam1, curStormDistUp);
				ProcessBeamLightning(BSLBeam2, -curStormDistDown);
			}
			
			eBeamCloudRCount += Delta;
			if (eBeamCloudRCount >= 1/BeamCloudElectricRate)
			{
				eBeamCloudRCount = 0.0;
				ProcessBeamCloudLightning(BSLBeam1, StormClouds1, stormOrigUp);
				ProcessBeamCloudLightning(BSLBeam2, StormClouds2, stormOrigDown);
			}
		}
	}
	
	tCount += Delta;
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (StormState == STM_Loading)
		{
			if (BGlow != None)
			{
				BGlow.ScaleGlow = BGlow.default.ScaleGlow * (tCount/LoadingTime);
				BGlow.SoundPitch = Byte(BGlow.default.SoundPitch + ((LoadingTime-tCount)/LoadingTime)*128);
				BGlow.SoundVolume = Byte(FMin((tCount*3/LoadingTime)*SoundVolume, SoundVolume));
			}
			
			lPTCount += Delta;
			if (lPTCount >= nextLPTCount && tCount <= (LoadingTime - 1.0))
			{
				lPTCount = 0.0;
				nextLPTCount = 1/((tCount/LoadingTime) * (LoadPartTracesRateMax - LoadPartTracesRateMin) + LoadPartTracesRateMin);
				maxI = int((tCount/LoadingTime) * (LoadPartTracesPerUpdateMax - LoadPartTracesPerUpdateMin) + LoadPartTracesPerUpdateMin);
				for (i = 0; i < maxI; i++)
				{
					bSTI = Spawn(Class'BoltStormTracedImpl',,,, RotRand(True));
					bSTI.SetLifeSpan(FRand()*1.0 + ((LoadingTime-tCount)/LoadingTime)*1.0);
				}
			}
		}
		else if (BSBLBeamReleaseLight != None && StormState == STM_StormCast && tCount <= StormCastTime)
		{
			f = (StormCastTime-tCount) / StormCastTime;
			BSBLBeamReleaseLight.DScaleCoefMax = BSBLBeamReleaseLight.default.DScaleCoefMax + f;
			BSBLBeamReleaseLight.DScaleCoefMin = BSBLBeamReleaseLight.default.DScaleCoefMin + f;
		}
		else if (StormState == STM_StormEnd && tCount <= StormEndTime)
		{
			f = (StormEndTime-tCount) / StormEndTime;
			SoundPitch = Byte(f * default.SoundPitch);
			SoundVolume = Byte(f * default.SoundVolume);
			SetCoronaSizeFade(BSBLBeamReleaseLight, f);
			SetCoronaSizeFade(BSLBeamLight1, f);
			SetCoronaSizeFade(BSLBeamLightLine1, f);
			SetCoronaSizeFade(BSLBeamLight2, f);
			SetCoronaSizeFade(BSLBeamLightLine2, f);
			SetCoronaSizeFade(BStmLight, f, True);
			SetCoronaSizeFade(BStmLightLine, f, True);
		}
	}
	
	if (Role == ROLE_Authority && StormState == STM_StormActive)
	{
		hLCount += Delta;
		if (hLCount >= 1/HeavyLightningRate)
		{
			hLCount = 0.0;
			SpawnRandomHLightnings(True, StormClouds1, StormClouds2);
			SpawnRandomHLightnings(False, StormClouds2, StormClouds1);
		}
	}
}

simulated function ProcessBeamLightning(BoltStormLightBeam bSTLB, float zDist)
{
local int i, maxI;
local vector iLoc;
local rotator R;
local BoltStormLightningA btSLA;

	if (bSTLB != None && FRand() <= BeamElectricOdds)
	{
		maxI = Rand(BeamMaxElectric) + 1;
		for (i = 0; i < maxI; i++)
		{
			R.Yaw = int(FRand()*65536 * 32768);
			iLoc = Location + zDist*vect(0,0,1) + ((FRand()*BeamRadius*vect(0.5,0,0)) >> R);
			btSLA = Spawn(Class'BoltStormLightningB');
			btSLA.SetLightning(Self, iLoc);
		}
	}
}

simulated function ProcessBeamCloudLightning(BoltStormLightBeam bSTLB, StCloud StmClouds[7], vector sLoc)
{
local int i, maxI;
local BoltStormLightningA btSLA;
local BoltStormBaseCloud bSBC;

	if (bSTLB != None && FRand() <= BeamCloudElectricOdds)
	{
		maxI = Rand(BeamCloudMaxElectric) + 1;
		for (i = 0; i < maxI; i++)
		{
			bSBC = StmClouds[Rand(ArrayCount(StmClouds))].WCloud;
			if (bSBC == None)
				continue;
			btSLA = Spawn(Class'BoltStormLightningA');
			btSLA.SetLightningPos(sLoc, bSBC.getRandomCloudLoc());
		}
	}
}

simulated function Destroyed()
{
local int i;

	for (i = 0; i < ArrayCount(BCrtSparks); i++)
	{
		if (BCrtSparks[i] != None)
			BCrtSparks[i].Destroy();
		BCrtSparks[i] = None;
	}
	
	for (i = 0; i < ArrayCount(RotParticles); i++)
	{
		if (RotParticles[i] != None)
			RotParticles[i].Destroy();
		RotParticles[i] = None;
	}
	
	
	for (i = 0; i < ArrayCount(StormClouds1); i++)
	{
		if (!bNoDestroyClouds)
		{
			if (StormClouds1[i].WCloud != None)
				StormClouds1[i].WCloud.Destroy();
			if (StormClouds1[i].BCloud != None)
				StormClouds1[i].BCloud.Destroy();
			if (StormClouds1[i].ECloud != None)
				StormClouds1[i].ECloud.Destroy();
		}
		StormClouds1[i].WCloud = None;
		StormClouds1[i].BCloud = None;
		StormClouds1[i].ECloud = None;
	}
	
	for (i = 0; i < ArrayCount(StormClouds2); i++)
	{
		if (!bNoDestroyClouds)
		{
			if (StormClouds2[i].WCloud != None)
				StormClouds2[i].WCloud.Destroy();
			if (StormClouds2[i].BCloud != None)
				StormClouds2[i].BCloud.Destroy();
			if (StormClouds2[i].ECloud != None)
				StormClouds2[i].ECloud.Destroy();
		}
		StormClouds2[i].WCloud = None;
		StormClouds2[i].BCloud = None;
		StormClouds2[i].ECloud = None;
	}
	
	if (!bNoDestroyClouds)
	{
		if (BSBCMaster1 != None)
			BSBCMaster1.Destroy();
		if (BSBCMaster2 != None)
			BSBCMaster2.Destroy();
	}
	
	if (BStmLight != None)
		BStmLight.Destroy();
	if (BStmLightLine != None)
		BStmLightLine.Destroy();
	if (BGlow != None)
		BGlow.Destroy();
	if (BSLBeam1 != None)
		BSLBeam1.Destroy();
	if (BSLBeam2 != None)
		BSLBeam2.Destroy();
	if (BSLBeamLight1 != None)
		BSLBeamLight1.Destroy();
	if (BSLBeamLightLine1 != None)
		BSLBeamLightLine1.Destroy();
	if (BSLBeamLight2 != None)
		BSLBeamLight2.Destroy();
	if (BSLBeamLightLine2 != None)
		BSLBeamLightLine2.Destroy();
		
	BStmLight = None;
	BStmLightLine = None;
	BGlow = None;
	BSLBeam1 = None;
	BSLBeam2 = None;
	BSLBeamLight1 = None;
	BSLBeamLightLine1 = None;
	BSLBeamLight2 = None;
	BSLBeamLightLine2 = None;
	BSBCMaster1 = None;
	BSBCMaster2 = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltCrystal
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	bMeshEnviroMap=True
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	Texture=GlassCryst
	DrawScale=1.000000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Yaw=-30000)

	AmbientSound=BoltCrystalAmb
	SoundVolume=255
	SoundRadius=255
	SoundPitch=16
	
	InitSound=BoltCrystalSpawnSnd
	LoadSound=BoltStormLoad
	LoadingSound=BoltStormLoading
	StormCastSound=BoltStormCast
	ThunderSnds(0)=BoltStormThunder01
	ThunderSnds(1)=BoltStormThunder02
	ThunderSnds(2)=BoltStormThunder03
	ThunderSnds(3)=BoltStormThunder04
	ThunderSnds(4)=BoltStormThunder05
	
	ElectricRate=10.000000
	ElectricMaxDist=1500.000000
	ElectricOdds=0.350000
	ElectricCloudOdds=0.250000
	MaxElectric=20
	
	BeamElectricRate=5.000000
	BeamElectricOdds=0.5500000
	BeamMaxElectric=5
	BeamCloudElectricRate=15.000000
	BeamCloudElectricOdds=0.350000
	BeamCloudMaxElectric=12
	
	RotParticInitAngleMax=4000
	RotParticInitAngleMin=-4000
	RotParticFadeInMax=5.000000
	RotParticFadeInMin=1.000000
	RotParticRotRateMax=1.000000
	RotParticRotRateMin=0.050000
	RotParticDScaleMax=0.650000
	RotParticDScaleMin=0.100000
	RotParticDensityMax=8
	RotParticDensityMin=1
	
	LoadPartTracesRateMax=10.000000
	LoadPartTracesRateMin=2.500000
	LoadPartTracesPerUpdateMax=3
	LoadPartTracesPerUpdateMin=1
	
	StartingTime=5.000000
	LoadingTime=5.000000
	StormCastTime=6.000000
	StormTime=30.000000
	StormEndTime=3.000000
	
	StormMaxDistance=4000.000000
	BeamRadius=192.000000
	BeamFadeInTime=1.000000
	MinDistToDownStorm=2000.000000
	
	HeavyLightningRate=1.000000
	HeavyLightningOdds=0.650000
	HeavyCloudLightningOdds=0.400000
	HeavyDryLightningOdds=0.100000
	HeavyLightningEnemyOdds=0.350000
	HeavyMaxLightnings=9
	HeavyLightningMaxDist=10000.000000
	HeavyLightningDirectDmg=5000
	HeavyLightningSplashDmg=1000
	HeavyLightningDmgType=Electrified
	HeavyLightningDmgMaxRadius=750.000000
}
