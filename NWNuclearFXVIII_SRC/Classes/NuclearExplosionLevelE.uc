//////////////////////////////////////////////////////////////
//				Feralidragon (24-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearExplosionLevelE expands NuclearExplosions config(NWNuclearCfg);

#exec AUDIO IMPORT NAME="Nuke05BlastDistance" FILE=SOUNDS\Nuke05BlastDistance.wav GROUP="NuclearBlasts"

var() float debrisRadius, debrisTime, debrisRadiusExtra;
var(ClientConfig) config float debrisRate;
var(ClientConfig) config byte debrisAmountPerUpdate;
var() float debrisFloatPoint;
var float debrisTimeCount;

var() float LightningsRadius, LightningsTime, LightningsRadiusMin;
var(ServerConfig) config float LightningsRate, LightningDmgRadius, LightningMaxDistance;
var(ServerConfig) config byte LightningsAmountPerUpdate;
var(ServerConfig) config int LightningDamage;
var float lightningCount, lightningTimeCount;
var() name NuclearElectricDmgType;

var() float sphericElectricMaxScale, sphericElectricMinScale, sphericElectricTime;
var(ClientConfig) config float sphericElectricRate;
var(ClientConfig) config byte sphericElectricAmountPerUpdate;
var float sphericElectricTimeCount, sphericElectricCount;

var bool bExecuteFinalFX;
var() float finalBoltTime, finalBoltDelay;
var(ServerConfig) config float finalBoltRate, finalBoltMaxDistance, finalBoltMinDistance;
var(ServerConfig) config byte finalBoltAmountPerUpdate;
var() float finalBoltFloatPoint;
var float finalBoltCount, finalBoltTimeCount;

var(ClientConfig) config bool enableDebrisExplFX;
var(ClientConfig) config float debrisExplRate, debrisExplTime;

var() float sphericFinalElectricMaxScale, sphericFinalElectricMinScale, sphericFinalElectricTime;
var(ClientConfig) config float sphericFinalElectricRate;
var(ClientConfig) config byte sphericFinalElectricMaxAmountPerUpdate, sphericFinalElectricMinAmountPerUpdate;
var float sphericFinalElectricTimeCount, sphericFinalElectricCount;
var bool bFinalElectric;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		SpawnShock();
		SpawnNucleusGlow();
		SpawnSmokeWave();
		SpawnLens();

		SetTimeOut(2.0, 0, True);
		SetTimeOut(5.5, 1, True);
		SetTimeOut(8.0, 2, True);
		SetTimeOut(13.0, 3, True);
		SetTimeOut(3.0, 4, True);
	}
	
	SpawnNucleus();
	SetTimeOut(finalBoltDelay, 5);
}

simulated function SpawnShock()
{
local rotator R;

	Spawn(Class'NuclearShockRingE',,,, R);
	Spawn(Class'NuclearShockSpikyE',,,, R);
	Spawn(Class'NuclearShockE');
}

function SpawnNucleus()
{
	Spawn(Class'NuclearNucleusSphereLevelE');
	Spawn(Class'NuclearNucleusSphereLevelEb');
}

simulated function SpawnNucleusGlow()
{
	Spawn(Class'NuclearNucleusGlowE');
	Spawn(Class'NuclearCoronaBSphereLife');
	Spawn(Class'NuclearCoronaBSphereLifeBright');
}

simulated function SpawnLens()
{
	Spawn(Class'NuclearLensE');
	Spawn(Class'NuclearCorFogE');
}

simulated function SpawnSmokeWave()
{
local rotator R;
local NuclearShockCloudMaster master;

	R.Yaw = Rand(16384);
	master = Spawn(Class'NuclearCloudMasterLvlE',,,, R);
	Spawn(Class'NuclearCloudLvlEa', master,,, R);
	Spawn(Class'NuclearCloudLvlEb', master,,, R);
}

simulated function UpdateGroundBreaking(float Delta)
{
local byte i;
local vector HitLoc, HitNorm, HitStart, HitEnd;
local rotator R;
local Actor AA;

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
					HitEnd -= vector(Rotation)*debrisFloatPoint*50;
					AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
				}
				
				if (AA != None)
					Spawn(Class'NukeMassDebrisPartsLevelE', Self,, HitLoc + HitNorm, rotator(HitNorm) + R + rot(0,0,32768));
			}
		}
	}
	
	UpdateOtherBolts(Delta);
	UpdateFinalOtherBolts(Delta);
}

function UpdateTickedEvents(float Delta)
{
	UpdateLightnings(Delta);
	UpdateFinalLightnings(Delta);
}

simulated function UpdateOtherBolts(float Delta)
{
local NukeSphericElectricBolt nkB;
local float rateScale;
local byte i;

	sphericElectricCount += Delta;
	if (sphericElectricRate > 0 && sphericElectricCount >= 1/sphericElectricRate)
	{
		sphericElectricTimeCount += sphericElectricCount;
		sphericElectricCount = 0;
		if (sphericElectricTimeCount <= sphericElectricTime)
		{
			for (i = 0; i < sphericElectricAmountPerUpdate; i++)
			{	
				nkB = Spawn(Class'NukeSphericElectricBolt',,, Location, RotRand(True));
				rateScale = (sphericElectricMaxScale-sphericElectricMinScale)/sphericElectricTime;
				nkB.SetScaleRate(sphericElectricTimeCount*rateScale + sphericElectricMinScale, rateScale);
			}
		}
	}
}

simulated function UpdateFinalOtherBolts(float Delta)
{
local NukeSphericElectricBolt nkB;
local float rateScale;
local byte i, nBolts;

	if (!bFinalElectric || sphericFinalElectricRate <= 0)
		return;
	
	sphericFinalElectricCount += Delta;
	nBolts = Byte((sphericFinalElectricMaxAmountPerUpdate-sphericFinalElectricMinAmountPerUpdate)*((sphericFinalElectricTime-sphericFinalElectricTimeCount)/sphericFinalElectricTime) + sphericFinalElectricMinAmountPerUpdate);
	if (sphericFinalElectricCount >= 1/sphericFinalElectricRate)
	{
		sphericFinalElectricTimeCount += sphericFinalElectricCount;
		sphericFinalElectricCount = 0;
		if (sphericFinalElectricTimeCount <= sphericFinalElectricTime)
		{
			for (i = 0; i < nBolts; i++)
			{	
				nkB = Spawn(Class'NukeSphericFinalElectricBolt',,, Location, RotRand(True));
				rateScale = (sphericFinalElectricMaxScale-sphericFinalElectricMinScale)/sphericFinalElectricTime;
				nkB.SetScaleRate(sphericFinalElectricTimeCount*rateScale + sphericFinalElectricMinScale, rateScale);
			}
		}
	}
}

function UpdateLightnings(float Delta)
{
local byte i;
local vector HitLoc, HitNorm, HitStart, HitEnd;
local rotator R;
local Actor AA;
	
	lightningCount += Delta;
	if (LightningsRate > 0 && lightningCount >= 1/LightningsRate && LightningMaxDistance > 0)
	{
		lightningTimeCount += lightningCount;
		lightningCount = 0;
		if (lightningTimeCount <= LightningsTime)
		{
			for (i = 0; i < LightningsAmountPerUpdate; i++)
			{	
				HitStart = Location + vector(RotRand())*(lightningTimeCount*(LightningsRadius - LightningsRadiusMin)/LightningsTime + LightningsRadiusMin);
				if (FastTrace(HitStart, Location))
				{
					R.Pitch = -Rand(16384);
					HitEnd = HitStart + (vector(R) >> rotator(HitStart - Location))*LightningMaxDistance;
					
					AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
					if (AA != None && VSize(HitLoc - HitStart) >= 256.0)
						SpawnLightning(HitStart, Normal(HitLoc - HitStart), VSize(HitLoc - HitStart), HitLoc, HitNorm);
				}
			}
		}
	}
}

function UpdateFinalLightnings(float Delta)
{
local byte i, realAmount;
local vector HitLoc, HitNorm, HitStart, HitEnd;
local rotator R;
local Actor AA;

	if (!bExecuteFinalFX)
		return;

	finalBoltCount += Delta;
	if (finalBoltRate > 0 && finalBoltCount >= 1/finalBoltRate)
	{
		finalBoltTimeCount += finalBoltCount;
		finalBoltCount = 0;
		if (finalBoltTimeCount <= finalBoltTime)
		{
			realAmount = Byte(finalBoltAmountPerUpdate * (finalBoltTime - finalBoltTimeCount)/finalBoltTime);
			for (i = 0; i < realAmount; i++)
			{	
				HitStart = Location + vector(Rotation)*finalBoltFloatPoint;
				R.Roll = Rand(16384)*4 - 32768;
				HitEnd = HitStart + Normal((vect(0,0,1) >> R) >> Rotation)*(FRand()*(finalBoltMaxDistance-finalBoltMinDistance) + finalBoltMinDistance);
				
				AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
				if (AA == None)
				{
					HitStart = HitEnd;
					HitEnd -= vector(Rotation)*finalBoltMaxDistance;
					AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
				}
				
				if (AA != None)
					SpawnLightning(Location, Normal(HitLoc - HitStart), VSize(HitLoc - HitStart), HitLoc, HitNorm, True);
			}
		}
	}
}

function SpawnLightning(vector Loc, vector Dir, float Dist, vector HitLocation, vector HitNormal, optional bool bCentered)
{
local NuclearElectric ne;
local NuclearLightningCor cStart, cEnd;
local NukeElectricExpl nExpl;

	if (!bCentered)
	{
		cStart = Spawn(Class'NuclearLightningCor',,, Loc);
		cStart.AdjustSize(Dist/512.0);
	}
	
	cEnd = Spawn(Class'NuclearLightningCorEnd', Self,, HitLocation + HitNormal);
	cEnd.AdjustSize(Dist/512.0);

	ne = Spawn(Class'NuclearElectric',,, Loc, rotator(Dir));
	ne.SetElectricDistance(Dist);
	
	if (Dist > 1500)
		Spawn(Class'NukeElectricDebrisPartsLevelE', Self,, HitLocation + HitNormal, rotator(HitNormal));
	nExpl = Spawn(Class'NukeElectricExpl',,, HitLocation + HitNormal);
	nExpl.SetScale(Dist/2);
	
	if (LightningDamage > 0 && LightningDmgRadius > 0)
		HurtRadius(LightningDamage, LightningDmgRadius * (Dist/LightningMaxDistance), NuclearElectricDmgType, 5000.0, HitLocation);
}

simulated function TriggerTimeOut0()
{
local rotator R;

	Spawn(Class'NukeThinSmkRingEa',,, Location + 1500*vect(0,0,1), R);
	Spawn(Class'NukeThinSmkRingEa',,, Location - 1500*vect(0,0,1), R);

	Spawn(Class'NukeAtmosRingE',,, Location + 2500*vect(0,0,1), R);
	Spawn(Class'NukeAtmosRingExpE',,, Location + 2500*vect(0,0,1), R);
	
	R.Pitch = 32768;
	Spawn(Class'NukeAtmosRingE',,, Location - 2500*vect(0,0,1), R);
	Spawn(Class'NukeAtmosRingExpE',,, Location - 2500*vect(0,0,1), R);
}

simulated function TriggerTimeOut1()
{
local rotator R;

	Spawn(Class'NukeThinSmkRingEa',,, Location + 3500*vect(0,0,1), R);
	Spawn(Class'NukeThinSmkRingEa',,, Location - 3500*vect(0,0,1), R);

	Spawn(Class'NukeAtmosRingE',,, Location + 4500*vect(0,0,1), R);
	Spawn(Class'NukeAtmosRingExpE',,, Location + 4500*vect(0,0,1), R);
	
	R.Pitch = 32768;
	Spawn(Class'NukeAtmosRingE',,, Location - 4500*vect(0,0,1), R);
	Spawn(Class'NukeAtmosRingExpE',,, Location - 4500*vect(0,0,1), R);
}

simulated function TriggerTimeOut2()
{
local rotator R;

	Spawn(Class'NukeThinSmkRingEa',,, Location + 5500*vect(0,0,1), R);
	Spawn(Class'NukeThinSmkRingEa',,, Location - 5500*vect(0,0,1), R);
}

simulated function TriggerTimeOut3()
{
local rotator R;
local NuclearShockCloudMaster master;

	R.Yaw = Rand(16384);
	master = Spawn(Class'NuclearCloudRotMasterLvlE',,, Location, R);
	Spawn(Class'NuclearCloudRotMiddelLvlEa', master,, Location, R);
	Spawn(Class'NuclearCloudRotMiddelLvlEb', master,, Location, R);
	R.Yaw = Rand(16384);
	Spawn(Class'NuclearCloudRotLayerALvlEa', master,, Location + 1200*vect(0,0,1), R);
	Spawn(Class'NuclearCloudRotLayerALvlEb', master,, Location + 1200*vect(0,0,1), R);
	R.Yaw = Rand(16384);
	Spawn(Class'NuclearCloudRotLayerALvlEa', master,, Location - 1200*vect(0,0,1), R);
	Spawn(Class'NuclearCloudRotLayerALvlEb', master,, Location - 1200*vect(0,0,1), R);
	R.Yaw = Rand(16384);
	Spawn(Class'NuclearCloudRotLayerBLvlEa', master,, Location + 1800*vect(0,0,1), R);
	Spawn(Class'NuclearCloudRotLayerBLvlEb', master,, Location + 1800*vect(0,0,1), R);
	R.Yaw = Rand(16384);
	Spawn(Class'NuclearCloudRotLayerBLvlEa', master,, Location - 1800*vect(0,0,1), R);
	Spawn(Class'NuclearCloudRotLayerBLvlEb', master,, Location - 1800*vect(0,0,1), R);
	
	Spawn(Class'NuclearCoronaFinalE');
	bFinalElectric = True;
}

simulated function TriggerTimeOut4()
{
local rotator R;

	Spawn(Class'NuclearShockRingSky',,, Location + 2500*vect(0,0,1), R);
}

function TriggerTimeOut5()
{
	bExecuteFinalFX = True;
}

defaultproperties
{
	LifeSpan=50.000000
	DynamicLightClass=Class'NuclearLightE'
	NuclearCoronaClass=Class'NuclearCoronaB'
	NuclearDistSnd=Nuke05BlastDistance
	NuclearDistSndVol=1500.000000
	NuclearDistSndRadius=60000.000000
	NuclearElectricDmgType=NuclearElectric05
	
	bUpdateGroundBreaking=True
	bUpdateTickedEvents=True
	
	ShockRadius=40000.000000
	ShockTime=10.400000
	ShockMomentum=800000
	ShockDmgType=Nuclear05
	
	NucleusRadius=4000.000000
	NucleusTime=16.000000
	NucleusMomentum=875000
	NucleusDmgType=Nuclear05
	bGrowingNucleus=True
	MinNucleusRad=160.000000

	debrisRadius=3250.000000
	debrisTime=13.000000
	debrisFloatPoint=100.000000
	debrisRadiusExtra=500.000000
	LightningsRadius=3750.000000
	LightningsRadiusMin=160.000000
	LightningsTime=15.000000
	
	sphericElectricMaxScale=23.500000
	sphericElectricMinScale=1.000000
	sphericElectricTime=15.000000
	
	finalBoltTime=3.600000
	finalBoltDelay=14.000000
	finalBoltFloatPoint=100.000000
	
	sphericFinalElectricMaxScale=11.000000
	sphericFinalElectricMinScale=9.000000
	sphericFinalElectricTime=10.000000

	
	DynamicLightOn=False
	ignoreStaticObjects=False
	ignoreFriends=True
	ignoreInstigator=False
	ignoreDecoration=False
	ignoreProjectiles=False
	ignoreTriggers=False
	ShockRadialDmgType=RDMG_Auto
	ShockwaveBaseDamage=40000
	ShockwaveDmgUpdateTime=0.050000
	ShockwaveDmgTransparencyDist=256.000000
	ShockwaveMufflingFactor=0.850000
	NucleusRadialDmgType=RDMG_Auto
	NucleusBaseDamage=50000
	NucleusDmgUpdateTime=0.100000
	NucleusDmgTransparencyDist=256.000000
	NucleusMufflingFactor=0.850000
	bSpawnExtraShockFX=True
	ExtraShockFXAmount=5
	
	debrisRate=4.000000
	debrisAmountPerUpdate=10
	
	LightningsRate=10.000000
	LightningDmgRadius=768.000000
	LightningMaxDistance=6000.000000
	LightningsAmountPerUpdate=10
	LightningDamage=2000
	
	sphericElectricRate=4.000000
	sphericElectricAmountPerUpdate=5
	
	finalBoltRate=10.000000
	finalBoltMaxDistance=20000.000000
	finalBoltMinDistance=10000.000000
	finalBoltAmountPerUpdate=10
	
	enableDebrisExplFX=True
	debrisExplRate=4.000000
	debrisExplTime=1.000000
	
	sphericFinalElectricRate=10.000000
	sphericFinalElectricMaxAmountPerUpdate=8
	sphericFinalElectricMinAmountPerUpdate=1
}