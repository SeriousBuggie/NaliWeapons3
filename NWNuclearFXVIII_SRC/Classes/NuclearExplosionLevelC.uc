//////////////////////////////////////////////////////////////
//				Feralidragon (02-06-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearExplosionLevelC expands NuclearExplosions config(NWNuclearCfg);

#exec AUDIO IMPORT NAME="Nuke03BlastDistance" FILE=SOUNDS\Nuke03BlastDistance.wav GROUP="NuclearBlasts"

var() float debrisRadius, debrisTime, debrisRadiusExtra;
var(ClientConfig) config float debrisRate;
var(ClientConfig) config byte debrisAmountPerUpdate;
var() float debrisFloatPoint;
var float debrisTimeCount;

var() float lightningsTime;
var(ClientConfig) config float lightningsRate;
var(ClientConfig) config byte lightningsAmountPerUpdate;
var float lightningsTimeCount, lightningsRateCount;

var(ClientConfig) config float FinalExplFXRate;
var(ClientConfig) config int FinalExplFXAmountPerUpdate;
var(ClientConfig) config float FinalSmokeFXRate;
var(ClientConfig) config int FinalSmokeFXAmountPerUpdate;

var() float FinalExplFXTime, FinalExplFXTimeDelay, FinalExplFXTimeMaxRadius;
var() float FinalSmkFXTime, FinalSmkFXTimeDelay, FinalSmkFXTimeMaxRadius;
var float FinalExplFXCounter, FinalSmkFXCounter, FinalFXTimeCounter;

var NuclearNucleusGlowC NNGlowC01, NNGlowC02;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		SpawnShock();
		SpawnNucleus();
		SpawnSmokeWave();
		SetTimeOut(0.5, 0, True);
		SetTimeOut(3.3, 1, True);
		SetTimeOut(3.5, 2, True);
	}
}

simulated function SpawnShock()
{
local rotator R;

	Spawn(Class'NuclearShockRingC',,,, R);
	Spawn(Class'NuclearShockSpikyC',,,, R);
	Spawn(Class'NuclearShockC');
}

simulated function SpawnNucleus()
{
	NNGlowC01 = Spawn(Class'NuclearNucleusGlowC');
	NNGlowC02 = Spawn(Class'NuclearNucleusGlowBigC');
	Spawn(Class'NuclearCoronaCSphereLifeBright');
}

simulated function SpawnSmokeWave()
{
local rotator R;
local NuclearShockCloudMaster master;

	R.Yaw = Rand(16384);
	master = Spawn(Class'NuclearCloudMasterLvlC',,,, R);
	Spawn(Class'NuclearCloudLvlCa', master,,, R);
	Spawn(Class'NuclearCloudLvlCb', master,,, R);
	Spawn(Class'NuclearCloudLvlCc', master,,, R);
}

simulated function UpdateGroundBreaking(float Delta)
{
local byte i;
local vector HitLoc, HitNorm, HitStart, HitEnd;
local rotator R;
local Actor AA;
local vector dir;
local NukeLightningC nlC;
local NukeMiscExpl nME;
local NukeSmk nSmk;
local NukeBlkSmk nBlackSmk;
local vector loc;


	groundBreakCount += Delta;
	if (debrisRate > 0 && groundBreakCount >= 1/debrisRate)
	{
		debrisTimeCount += groundBreakCount;
		groundBreakCount = 0;
		if (debrisTimeCount <= debrisTime)
		{
			for (i = 0; i < debrisAmountPerUpdate; i++)
			{	
				HitStart = Location + vector(Rotation)*debrisFloatPoint;
				R.Roll = Rand(16384)*4 - 32768;
				HitEnd = HitStart + Normal((vect(0,0,1) >> R) >> Rotation)*(debrisTimeCount*debrisRadius/debrisTime + debrisRadiusExtra);
				
				AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
				if (AA == None)
				{
					HitStart = HitEnd;
					HitEnd -= vector(Rotation)*debrisFloatPoint*10;
					AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
				}
				
				if (AA != None)
					Spawn(Class'NukeMassDebrisPartsLevelC', Self,, HitLoc + HitNorm, rotator(HitNorm) + R + rot(0,0,32768));
			}
		}
	}
	
	lightningsRateCount += Delta;
	if (NNGlowC01 != None && NNGlowC02 != None && lightningsRate > 0 && lightningsRateCount >= 1/lightningsRate)
	{
		lightningsTimeCount += lightningsRateCount;
		lightningsRateCount = 0.0;
		if (lightningsTimeCount <= lightningsTime)
		{
			for (i = 0; i < lightningsAmountPerUpdate; i++)
			{
				dir = VRand();
				nlC = Spawn(Class'NukeLightningC',,, Location + NNGlowC01.DrawScale*NNGlowC01.BaseRadius*dir/4*3, rotator(dir));
				if (nlC != None)
					nlC.SetLightning(Location + NNGlowC02.DrawScale*NNGlowC02.BaseRadius*dir*1.1);
			}
		}
		
	}


	FinalFXTimeCounter += Delta;
	
	if (FinalFXTimeCounter > FinalExplFXTimeDelay && FinalFXTimeCounter < (FinalExplFXTime+FinalExplFXTimeDelay) && FinalExplFXRate > 0 && FinalExplFXAmountPerUpdate > 0)
	{
		FinalExplFXCounter += Delta;
		if (FinalExplFXCounter >= 1/FinalExplFXRate)
		{
			FinalExplFXCounter = 0.0;
			for (i = 0; i < FinalExplFXAmountPerUpdate; i++)
			{
				nME = Spawn(Class'NukeMiscExplC',,, Location + VRand()*FRand()*FinalExplFXTimeMaxRadius*(FinalFXTimeCounter/(FinalExplFXTime+FinalExplFXTimeDelay)));
				if (nME != None)
					nME.SetScale(FinalFXTimeCounter);
				nME = None;
			}
		}
	}
	
	if (FinalFXTimeCounter > FinalSmkFXTimeDelay && FinalFXTimeCounter < (FinalSmkFXTime+FinalSmkFXTimeDelay) && FinalSmokeFXRate > 0 && FinalSmokeFXAmountPerUpdate > 0)
	{
		FinalSmkFXCounter += Delta;
		if (FinalSmkFXCounter >= 1/FinalSmokeFXRate)
		{
			FinalSmkFXCounter = 0.0;
			for (i = 0; i < FinalSmokeFXAmountPerUpdate; i++)
			{
				loc = Location + VRand()*FRand()*FinalSmkFXTimeMaxRadius*(FinalFXTimeCounter/(FinalSmkFXTime+FinalSmkFXTimeDelay));
				nSmk = Spawn(Class'NukeSmkC',,, loc);
				if (nSmk != None)
				{
					nSmk.ClientSetSmkProperties(Normal(nSmk.Location - Location)*100, FinalFXTimeCounter, FinalFXTimeCounter, True);
					nBlackSmk = Spawn(Class'NukeBlkSmkC',,, loc);
					nBlackSmk.ClientSetSmkProperties(Normal(nSmk.Location - Location)*100, FinalFXTimeCounter, FinalFXTimeCounter, True);
				}
				nSmk = None;
			}
		}
	}
}

simulated function TriggerTimeOut0()
{
local rotator R;
local vector Vt;

	Vt = vect(0,0,1000);
	Spawn(Class'NuclearSmkRingC',,, Location + Vt, R);
	Spawn(Class'NuclearSmkRingC',,, Location - Vt, R);
	
	Vt = vect(0,0,1600);
	Spawn(Class'NukeThinSmkRingC',,, Location + Vt, R);
	Spawn(Class'NukeThinSmkRingC',,, Location - Vt, R);
}

simulated function TriggerTimeOut1()
{
	Spawn(Class'NuclearCoronaCFinal');
}

simulated function TriggerTimeOut2()
{
	Spawn(Class'NuclearSuperRingC');
}

defaultproperties
{
	LifeSpan=25.000000
	DynamicLightClass=Class'NuclearLightC'
	NuclearCoronaClass=Class'NuclearCoronaC'
	NuclearDistSnd=Nuke03BlastDistance
	NuclearDistSndVol=1500.000000
	NuclearDistSndRadius=30000.000000
	
	bUpdateGroundBreaking=True
	
	ShockRadius=10000.000000
	ShockTime=2.600000
	ShockMomentum=450000
	ShockDmgType=Nuclear03
	
	NucleusRadius=1000.000000
	NucleusTime=4.000000
	NucleusMomentum=500000
	NucleusDmgType=Nuclear03
	bGrowingNucleus=True
	MinNucleusRad=40.000000

	debrisRadius=1000.000000
	debrisTime=3.500000
	debrisFloatPoint=100.000000
	debrisRadiusExtra=24.000000
	lightningsTime=3.500000
	FinalExplFXTime=0.500000
	FinalExplFXTimeDelay=3.500000
	FinalExplFXTimeMaxRadius=2000.000000
	FinalSmkFXTime=0.500000
	FinalSmkFXTimeDelay=3.800000
	FinalSmkFXTimeMaxRadius=1800.000000

	
	DynamicLightOn=False
	ignoreStaticObjects=False
	ignoreFriends=True
	ignoreInstigator=False
	ignoreDecoration=False
	ignoreProjectiles=False
	ignoreTriggers=False
	ShockRadialDmgType=RDMG_Auto
	ShockwaveBaseDamage=10000
	ShockwaveDmgUpdateTime=0.050000
	ShockwaveDmgTransparencyDist=128.000000
	ShockwaveMufflingFactor=0.850000
	NucleusRadialDmgType=RDMG_Auto
	NucleusBaseDamage=12500
	NucleusDmgUpdateTime=0.100000
	NucleusDmgTransparencyDist=256.000000
	NucleusMufflingFactor=0.850000
	bSpawnExtraShockFX=True
	ExtraShockFXAmount=5
	
	debrisRate=5.000000
	debrisAmountPerUpdate=8
	lightningsRate=10.000000
	lightningsAmountPerUpdate=16
	FinalExplFXRate=5.000000
	FinalExplFXAmountPerUpdate=6
	FinalSmokeFXRate=7.000000
	FinalSmokeFXAmountPerUpdate=2
}
