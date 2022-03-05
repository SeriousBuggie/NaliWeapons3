//////////////////////////////////////////////////////////////
//				Feralidragon (13-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFire expands NaliWActor;

#exec MESH IMPORT MESH=VulcanSkyFire ANIVFILE=MODELS\VulcanSkyFire_a.3d DATAFILE=MODELS\VulcanSkyFire_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=VulcanSkyFire STRENGTH=0
#exec MESH ORIGIN MESH=VulcanSkyFire X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=VulcanSkyFire SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanSkyFire SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=VulcanSkyFire MESH=VulcanSkyFire
#exec MESHMAP SCALE MESHMAP=VulcanSkyFire X=0.4 Y=0.4 Z=0.8

#exec AUDIO IMPORT NAME="VulcanSkyFireSpawnSnd" FILE=SOUNDS\VulcanSkyFireSpawnSnd.wav GROUP="SkyFire"
#exec AUDIO IMPORT NAME="VulcanSkyFireLoad" FILE=SOUNDS\VulcanSkyFireLoad.wav GROUP="SkyFire"
#exec AUDIO IMPORT NAME="VulcanSkyFireCast" FILE=SOUNDS\VulcanSkyFireCast.wav GROUP="SkyFire"


var() float StartingTime, LoadingTime, SkyFireCastTime, SkyFireTime, SkyFireEndTime;
var() sound InitSound, LoadSound, SkyFireCastSound;
var() float SkyFireMaxDistance, InitFlameCloudsTime;

enum SkyState
{
	SKF_Starting,
	SKF_Loading,
	SKF_SkyFireCast,
	SKF_SkyFireActive,
	SKF_SkyFireEnd
};
var SkyState SkyFireState;

var vector SkyFireUpStart, SkyFireUpDest;

var() float ProjSkyFireRate, ProjSkyFireOdds;
var() int ProjSkyFireMaxProjectiles, ProjSkyFireDmg;
var() float ProjSkyFireMaxRadius;
var float pSFCount;

var() float HeavyProjSkyFireRate, HeavyProjSkyFireOdds;
var() int HeavyProjSkyFireMaxProjectiles, HeavyProjSkyFireDmg;
var() float HeavyProjSkyFireMaxRadius;
var float hpSFCount;

var() float SmkMaxLength, SmkRotPerPart, SmkDistFromCenter, SmkZOffset;
var() byte SmkRadialAmount;
var vector lastSmkLoc;
var float smkNomLength;

var VulcanSkyFireLight VSkFrLight, VSkFrLightLine;
var VulcanSkyFireBaseCloudMaster VSFCMaster;
struct StCloud
{
	var VulcanSkyFireBaseCloud WCloud, BCloud;
};
var StCloud SkyFireClouds[7];
var float tCount;
var bool bNoDestroyClouds;


replication
{
	reliable if (Role == ROLE_Authority)
		SkyFireTime;
}

function PreBeginPlay()
{
	if (Class'Vulcan'.default.OversurrectionLifeTime > 0.0)
		SkyFireTime = Class'Vulcan'.default.OversurrectionLifeTime;
	if (Class'Vulcan'.default.OversurrectionProjSkyFireRate > 0.0)
		ProjSkyFireRate = Class'Vulcan'.default.OversurrectionProjSkyFireRate;
	if (Class'Vulcan'.default.OversurrectionProjSkyFireOdds > 0.0)
		ProjSkyFireOdds = Class'Vulcan'.default.OversurrectionProjSkyFireOdds;
	if (Class'Vulcan'.default.OversurrectionProjSkyFireMax > 0)
		ProjSkyFireMaxProjectiles = Class'Vulcan'.default.OversurrectionProjSkyFireMax;
	if (Class'Vulcan'.default.OversurrectionProjSkyFireDmg > 0)
		ProjSkyFireDmg = Class'Vulcan'.default.OversurrectionProjSkyFireDmg;
	if (Class'Vulcan'.default.OversurrectionProjSkyFireRadius > 0.0)
		ProjSkyFireMaxRadius = Class'Vulcan'.default.OversurrectionProjSkyFireRadius;
	if (Class'Vulcan'.default.OversurrectionHProjSkyFireRate > 0.0)
		HeavyProjSkyFireRate = Class'Vulcan'.default.OversurrectionHProjSkyFireRate;
	if (Class'Vulcan'.default.OversurrectionHProjSkyFireOdds > 0.0)
		HeavyProjSkyFireOdds = Class'Vulcan'.default.OversurrectionHProjSkyFireOdds;
	if (Class'Vulcan'.default.OversurrectionHProjSkyFireMax > 0)
		HeavyProjSkyFireMaxProjectiles = Class'Vulcan'.default.OversurrectionHProjSkyFireMax;
	if (Class'Vulcan'.default.OversurrectionHProjSkyFireDmg > 0)
		HeavyProjSkyFireDmg = Class'Vulcan'.default.OversurrectionHProjSkyFireDmg;
	if (Class'Vulcan'.default.OversurrectionHProjSkyFireRadius > 0.0)
		HeavyProjSkyFireMaxRadius = Class'Vulcan'.default.OversurrectionHProjSkyFireRadius;
	
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	if (Role == ROLE_Authority)
		InitSkyFire();
	Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
	InitSkyFire();
}

simulated function InitSkyFire()
{
local int i;
local VulcanBaseCloudMaster master;
local actor A;
local vector HitLoc, HitNorm, ETrace;

	if (Level.NetMode != NM_DedicatedServer)
	{
		Spawn(Class'VulcanSkyFireInitShake');
		Spawn(Class'VulcanSkyFireInitLight');
		Spawn(Class'VulcanSkyFireInitLine');
		VSkFrLight = Spawn(Class'VulcanSkyFireLight', Self);
		
		master = Spawn(Class'VulcanBaseCloudMaster');
		Spawn(Class'VulcanBaseCloud', master);
		Spawn(Class'VulcanBaseCloudB', master);
	}
	
	ETrace = Location + SkyFireMaxDistance*vect(0,0,1);
	A = Trace(HitLoc, HitNorm, ETrace, Location, False);
	if (A == None)
	{
		HitLoc = ETrace;
		HitNorm = vect(0,0,-1);
	}
	SkyFireUpDest = HitLoc + HitNorm;
	SkyFireUpStart = Location;
	lastSmkLoc = Location;
	processSmkConPoints(,, smkNomLength);
	
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

simulated function Timer()
{
local int i;
local rotator R;

	if (SkyFireState == SKF_Starting)
	{
		SkyFireState = SKF_Loading;
		DoSound(LoadSound);
		SetTimer(LoadingTime, False);
	}
	else if (SkyFireState == SKF_Loading)
	{
		SkyFireState = SKF_SkyFireCast;
		DoMegaSound(SkyFireCastSound);
		SetTimer(SkyFireCastTime, False);
		SetLocation(SkyFireUpDest);
		if (Level.NetMode != NM_DedicatedServer)
		{
			Spawn(Class'VulcanSkyFireCastShake');
			Spawn(Class'VulcanSkyFireLoadLight');
			VSkFrLightLine = Spawn(Class'VulcanSkyFireLightLine', Self);
		}
		
		R = rot(0,0,0);
		R.Yaw = Rand(16384)*4;
		SpawnSkyFireClouds(Location, R, VSFCMaster, SkyFireClouds);
		SpawnSkyFireFlameClouds(Location, R);
	}
	else if (SkyFireState == SKF_SkyFireCast)
	{
		SkyFireState = SKF_SkyFireActive;
		SetTimer(SkyFireTime, False);
	}
	else if (SkyFireState == SKF_SkyFireActive)
	{
		SkyFireState = SKF_SkyFireEnd;
		SetTimer(SkyFireEndTime, False);
		bNoDestroyClouds = True;
		bHidden = True;
	}
	else if (SkyFireState == SKF_SkyFireEnd)
		Destroy();
	tCount = 0.0;
}

simulated function SpawnSkyFireClouds(vector Loc, rotator R, out VulcanSkyFireBaseCloudMaster BSBCMaster, out StCloud SkyFireClouds[7])
{
local int i, rotRate;
local float cloudsLTime, minCloudScale, maxCloudScale;
local vector realCloudLoc;

	cloudsLTime = Class'VulcanSkyFireBaseCloud'.default.fadeOutTime + SkyFireCastTime + SkyFireTime + SkyFireEndTime;
	VSFCMaster = Spawn(Class'VulcanSkyFireBaseCloudMaster',,, Loc, R);
	VSFCMaster.LifeSpan = cloudsLTime + 1.f;
	for (i = 0; i < ArrayCount(SkyFireClouds); i++)
	{
		minCloudScale = (2.f**i);
		maxCloudScale = 1.45*(2.f**i);
		rotRate = i*350 + 350;
		realCloudLoc = Loc - minCloudScale*8.f*vect(0,0,1);
		SkyFireClouds[i].WCloud = Spawn(Class'VulcanSkyFireBaseCloud', VSFCMaster,, realCloudLoc, R);
		SkyFireClouds[i].WCloud.InitializeLightningClouds(cloudsLTime, minCloudScale, maxCloudScale, rotRate);
		SkyFireClouds[i].BCloud = Spawn(Class'VulcanSkyFireBaseCloudB', VSFCMaster,, realCloudLoc, R);
		SkyFireClouds[i].BCloud.InitializeLightningClouds(cloudsLTime, minCloudScale, maxCloudScale, rotRate);
	}
}

simulated function SpawnSkyFireFlameClouds(vector Loc, rotator R)
{
local int i, rotRate;
local float minCloudScale, maxCloudScale;
local VulcanSkyFireBaseCloudFlame vsfBCF;
local VulcanSkyFireBaseCloudFlameMaster vsfBCFMaster;

	vsfBCFMaster = Spawn(Class'VulcanSkyFireBaseCloudFlameMaster',,, Loc, R);
	vsfBCFMaster.LifeSpan = InitFlameCloudsTime + 1.f;
	minCloudScale = 1.0;
	for (i = 0; i < ArrayCount(SkyFireClouds); i++)
	{
		maxCloudScale = 1.45*(2.f**i);
		rotRate = i*2000 + 2000;
		vsfBCF = Spawn(Class'VulcanSkyFireBaseCloudFlame', vsfBCFMaster,, Loc, R);
		vsfBCF.InitializeLightningClouds(InitFlameCloudsTime, minCloudScale, maxCloudScale, rotRate);
	}
}

function SpawnRandomSkyFireProjectiles(StCloud StmClouds[7])
{
local int i, maxI;
local float f;
local VulcanSkyFireBaseCloud bSBC;
local vector sfDir, sfLoc;
local VulcanSkyFireProj vsfp;

	if (FRand() <= ProjSkyFireOdds)
	{
		maxI = Rand(ProjSkyFireMaxProjectiles) + 1;
		for (i = 0; i < maxI; i++)
		{
			f = FRand();
			if (f > 0.65)			bSBC = StmClouds[6].WCloud;
			else if (f > 0.40)		bSBC = StmClouds[5].WCloud;
			else if (f > 0.275)		bSBC = StmClouds[4].WCloud;
			else if (f > 0.15)		bSBC = StmClouds[3].WCloud;
			else if (f > 0.10)		bSBC = StmClouds[2].WCloud;
			else if (f > 0.025)		bSBC = StmClouds[1].WCloud;
			else					bSBC = StmClouds[0].WCloud;
				
			if (bSBC == None)
				continue;
			sfDir = Normal(VRand() - vect(0,0,3));
			sfLoc = bSBC.getRandomCloudLoc(True);
			
			vsfp = Spawn(Class'VulcanSkyFireProj',,, sfLoc, rotator(sfDir));
			if (vsfp != None)
			{
				vsfp.Damage = ProjSkyFireDmg;
				vsfp.DmgRadius = ProjSkyFireMaxRadius;
			}
		}
	}
}

function SpawnRandomSkyFireHeavyProjectiles(StCloud StmClouds[7])
{
local int i, maxI;
local float f;
local VulcanSkyFireBaseCloud bSBC;
local vector sfDir, sfLoc;
local VulcanSkyFireMegaProj vsfmp;

	if (FRand() <= HeavyProjSkyFireOdds)
	{
		maxI = Rand(HeavyProjSkyFireMaxProjectiles) + 1;
		for (i = 0; i < maxI; i++)
		{
			f = FRand();
			if (f > 0.65)			bSBC = StmClouds[6].WCloud;
			else if (f > 0.40)		bSBC = StmClouds[5].WCloud;
			else if (f > 0.275)		bSBC = StmClouds[4].WCloud;
			else if (f > 0.15)		bSBC = StmClouds[3].WCloud;
			else if (f > 0.10)		bSBC = StmClouds[2].WCloud;
			else if (f > 0.025)		bSBC = StmClouds[1].WCloud;
			else					bSBC = StmClouds[0].WCloud;
				
			if (bSBC == None)
				continue;
			sfDir = Normal(VRand() - vect(0,0,3));
			sfLoc = bSBC.getRandomCloudLoc(True);
			
			vsfmp = Spawn(Class'VulcanSkyFireMegaProj',,, sfLoc, rotator(sfDir));
			if (vsfmp != None)
			{
				vsfmp.Damage = HeavyProjSkyFireDmg;
				vsfmp.DmgRadius = HeavyProjSkyFireMaxRadius;
				Spawn(Class'VulcanSkyFireLightFog',,, vsfmp.Location);
			}
		}
	}
}

simulated function processSmkConPoints(optional out vector p1, optional out vector p2, out optional float crossDist, optional float rotOffset, 
optional vector dir)
{
local float f, rOffsetB, rOffsetT;
local rotator R1, R2;

	f = VSize(SkyFireUpStart - lastSmkLoc) + SmkZOffset;
	rOffsetB = f * SmkRotPerPart / SmkMaxLength + rotOffset;
	f += SmkMaxLength;
	rOffsetT = f * SmkRotPerPart / SmkMaxLength + rotOffset;
	
	p1.Y = SmkDistFromCenter;
	p2.Y = SmkDistFromCenter;
	R1.Roll = int(rOffsetB);
	R2.Roll = int(rOffsetT);
	R1 = Normalize(R1);
	R2 = Normalize(R2);
	
	p1 = (p1 >> R1);
	p2 = (p2 >> R2);
	p2.X = SmkMaxLength;
	p2 = p1 + (Normal(p2 - p1) * SmkMaxLength);
	crossDist = Abs(p2.X - p1.X);
	if (VSize(dir) > 0.0)
	{
		p1 = (p1 >> rotator(dir));
		p2 = (p2 >> rotator(dir));
	}
}

simulated function Tick(float Delta)
{
local float f;
local byte i;
local vector V1, V2, loc, dir;

	tCount += Delta;
	if (SkyFireState == SKF_Loading)
	{
		SetLocation(SkyFireUpStart + (tCount/LoadingTime)*(SkyFireUpDest - SkyFireUpStart));
		if (Level.NetMode != NM_DedicatedServer && smkNomLength > 0.0)
		{
			while (VSize(lastSmkLoc - Location) >= smkNomLength)
			{
				for (i = 0; i < SmkRadialAmount; i++)
				{
					V1 = vect(0,0,0);
					V2 = vect(0,0,0);
					processSmkConPoints(V1, V2, smkNomLength, i*(65536.f/SmkRadialAmount), vect(0,0,1));
					dir = Normal(V2 - V1);
					loc = lastSmkLoc + V1;
					Spawn(Class'VulcanSkyFireInitSmoke',,, loc, rotator(dir));
					Spawn(Class'VulcanSkyFireInitSmokeB',,, loc, rotator(dir));
				}
				lastSmkLoc += (Normal(Location - lastSmkLoc) * smkNomLength);
			}
		}
	}
	
	if (Role == ROLE_Authority && SkyFireState == SKF_SkyFireActive)
	{
		pSFCount += Delta;
		if (pSFCount > 1/ProjSkyFireRate)
		{
			pSFCount = 0.0;
			SpawnRandomSkyFireProjectiles(SkyFireClouds);
		}
		
		hpSFCount += Delta;
		if (hpSFCount > 1/HeavyProjSkyFireRate)
		{
			hpSFCount = 0.0;
			SpawnRandomSkyFireHeavyProjectiles(SkyFireClouds);
		}
	}
	
	if (Level.NetMode != NM_DedicatedServer && SkyFireState == SKF_SkyFireEnd && tCount <= SkyFireEndTime)
	{
		f = (SkyFireEndTime-tCount) / SkyFireEndTime;
		SetCoronaSizeFade(VSkFrLight, f, True);
		SetCoronaSizeFade(VSkFrLightLine, f, True);
	}
}

simulated function Destroyed()
{
local int i;

	for (i = 0; i < ArrayCount(SkyFireClouds); i++)
	{
		if (!bNoDestroyClouds)
		{
			if (SkyFireClouds[i].WCloud != None)
				SkyFireClouds[i].WCloud.Destroy();
			if (SkyFireClouds[i].BCloud != None)
				SkyFireClouds[i].BCloud.Destroy();
		}
		SkyFireClouds[i].WCloud = None;
		SkyFireClouds[i].BCloud = None;
	}
	
	if (!bNoDestroyClouds)
	{
		if (VSFCMaster != None)
			VSFCMaster.Destroy();
	}
	
	if (VSkFrLight != None)
		VSkFrLight.Destroy();
	if (VSkFrLightLine != None)
		VSkFrLightLine.Destroy();
		
	VSkFrLight = None;
	VSkFrLightLine = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=VulcanSkyFire
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	bMeshEnviroMap=False
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	MultiSkins(1)=VulcanProjSk
	DrawScale=1.000000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Yaw=5000)
	
	InitSound=VulcanSkyFireSpawnSnd
	LoadSound=VulcanSkyFireLoad
	SkyFireCastSound=VulcanSkyFireCast
	
	StartingTime=3.500000
	LoadingTime=0.350000
	SkyFireCastTime=3.000000
	SkyFireTime=25.000000
	SkyFireEndTime=3.000000
	
	SkyFireMaxDistance=4000.000000
	InitFlameCloudsTime=2.000000
	
	ProjSkyFireRate=7.500000
	ProjSkyFireOdds=0.900000
	ProjSkyFireMaxProjectiles=15
	ProjSkyFireDmg=500
	ProjSkyFireMaxRadius=350.000000
	
	HeavyProjSkyFireRate=2.500000
	HeavyProjSkyFireOdds=0.350000
	HeavyProjSkyFireMaxProjectiles=5
	HeavyProjSkyFireDmg=2000
	HeavyProjSkyFireMaxRadius=600.000000
	
	SmkMaxLength=148.000000
	SmkRotPerPart=9000.000000
	SmkDistFromCenter=96.000000
	SmkZOffset=192.000000
	SmkRadialAmount=3
}
