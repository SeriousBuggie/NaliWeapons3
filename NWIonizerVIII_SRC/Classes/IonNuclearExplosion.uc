//////////////////////////////////////////////////////////////
//				Feralidragon (07-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNuclearExplosion expands NuclearExplosions config(NWNuclearCfg);

#exec AUDIO IMPORT NAME="IonNukeFarExploSnd" FILE=SOUNDS\IonNukeFarExploSnd.wav GROUP="IonBlast"

var(ClientConfig) config float SmkLightningsRateMin, SmkLightningsRateMax;
var(ClientConfig) config byte SmkLightningsAmountPerUpdateMin, SmkLightningsAmountPerUpdateMax; 
var() float SmkLightningsMinRadius, SmkLightningsMaxRadius, SmkLightningsRadiusVar;
var() float SmkLightningsMaxZ, SmkLightningsMinZ;
var() float SmkLightningsTime;
var float lightningSmkCount;

var(ClientConfig) config float SphereLightningsRateMin, SphereLightningsRateMax;
var(ClientConfig) config byte SphereLightningsAmountPerUpdateMin, SphereLightningsAmountPerUpdateMax; 
var() float SphereLightningsRadius, SphereLightningsTime;
var float lightningSphereCount;

var IonNukeSphere IonSphereRef;

replication
{
	reliable if (Role == ROLE_Authority)
		IonSphereRef;
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		SpawnSmokeWave();
		SpawnShock();
		SpawnExtras();
		SetTimeOut(3.0, 0, True);
	}
	
	SpawnIonFX();
	SpawnServerShock();
}

function SpawnIonFX()
{
	Spawn(Class'IonNukeRing');
	Spawn(Class'IonNukeRing',,,, rotator(-vector(Rotation)));
	Spawn(Class'IonNukeSphereGlow');
	Spawn(Class'IonNukeCor');
	
	IonSphereRef = Spawn(Class'IonNukeSphere');
}

simulated function SpawnSmokeWave()
{
local rotator R;
local IonNukeCloudMaster master;

	R.Yaw = Rand(16384);
	master = Spawn(Class'IonNukeCloudMaster',,,, R);
	Spawn(Class'IonNukeCloud', master,,, R);
	Spawn(Class'IonNukeCloudB', master,,, R);
}

simulated function SpawnExtras()
{
local rotator R;

	Spawn(Class'IonCorFog');
	
	Spawn(Class'IonNukeAtmosRing',,, Location + vect(0,0,1)*2200, R);
	Spawn(Class'IonNukeAtmosRingExp',,, Location + vect(0,0,1)*2200, R);
	Spawn(Class'IonNukeAtmosRing',,, Location - vect(0,0,1)*2200, R);
	Spawn(Class'IonNukeAtmosRingExp',,, Location - vect(0,0,1)*2200, R);
}

simulated function SpawnShock()
{
local rotator R;

	Spawn(Class'IonNuclearShockRing',,,, R);
	Spawn(Class'IonNuclearShockSpiky',,,, R);
	Spawn(Class'IonNuclearShockSpikyB',,, Location + vect(0,0,1)*1600, R);
}

function SpawnServerShock()
{
	Spawn(Class'IonNuclearShock');
}

simulated function UpdateGroundBreaking(float Delta)
{
	UpdateSmokeLightnings(Delta);
	UpdateSphereLightings(Delta);
}

simulated function UpdateSmokeLightnings(float Delta)
{
local byte i;
local vector sLoc1, sLoc2;
local float cTime, rD, zD, r1, r2, cRate;
local byte cCount;
local rotator R;
local IonFastLightning IonL;
local bool bSpawnedL;
	
	cTime = Default.LifeSpan - LifeSpan;
	if (cTime <= SmkLightningsTime)
	{
		lightningSmkCount += Delta;
		
		cRate = (SmkLightningsTime-cTime)*(SmkLightningsRateMax-SmkLightningsRateMin)/SmkLightningsTime + SmkLightningsRateMin;
		if (cRate > 0 && lightningSmkCount >= 1/cRate)
		{
			lightningSmkCount = 0;
			cCount = Byte((SmkLightningsTime-cTime)*(SmkLightningsAmountPerUpdateMax-SmkLightningsAmountPerUpdateMin)/SmkLightningsTime + SmkLightningsAmountPerUpdateMin);
			for (i = 0; i < cCount; i++)
			{	
				rD = cTime*(SmkLightningsMaxRadius-SmkLightningsMinRadius)/SmkLightningsTime + SmkLightningsMinRadius;
				zD = cTime*(SmkLightningsMaxZ-SmkLightningsMinZ)/SmkLightningsTime + SmkLightningsMinZ;
				
				r1 = rD + ((FRand()*2-1)*SmkLightningsRadiusVar*rD);
				R.Roll = Rand(16384)*4 - 32768;
				sLoc1 = Location + Normal((vect(0,0,1) >> R) >> Rotation)*r1 + vector(Rotation)*zD*(FRand()*2-1);
				
				r2 = rD + ((FRand()*2-1)*SmkLightningsRadiusVar*rD);
				R.Roll += ((FRand()*2-1)*16484);
				sLoc2 = Location + Normal((vect(0,0,1) >> R) >> Rotation)*r2 + vector(Rotation)*zD*(FRand()*2-1);
				
				IonL = Spawn(Class'IonFastLightning',,, sLoc1, rotator(sLoc2 - sLoc1));
				if (IonL != None)
				{
					IonL.SetLightning(sLoc2);
					if (!bSpawnedL)
					{
						bSpawnedL = True;
						IonL.PlayServerLightningSound();
					}
				}
			}
		}
	}
}

simulated function UpdateSphereLightings(float Delta)
{
local byte i;
local vector sLoc;
local float cTime, cRate, ionRad;
local byte cCount;
local rotator R;
local IonFastLightning IonL;
	
	cTime = Default.LifeSpan - LifeSpan;
	if (cTime <= SphereLightningsTime && IonSphereRef != None)
	{
		lightningSphereCount += Delta;
		
		cRate = (SphereLightningsTime-cTime)*(SphereLightningsRateMax-SphereLightningsRateMin)/SphereLightningsTime + SphereLightningsRateMin;
		if (cRate > 0 && lightningSphereCount >= 1/cRate)
		{
			lightningSphereCount = 0;
			cCount = Byte((SphereLightningsTime-cTime)*(SphereLightningsAmountPerUpdateMax-SphereLightningsAmountPerUpdateMin)/SphereLightningsTime + SphereLightningsAmountPerUpdateMin);
			for (i = 0; i < cCount; i++)
			{	
				ionRad = IonSphereRef.DrawScale * SphereLightningsRadius;
				R.Yaw = Rand(16384)*4 - 32768;
				R.Pitch = Rand(16384)*4 - 32768;
				sLoc = Location + vector(R)*ionRad;
				IonL = Spawn(Class'IonFastLightning',,, Location, rotator(sLoc - Location));
				IonL.SetLightning(sLoc);
			}
		}
	}
}

simulated function TriggerTimeOut0()
{
local rotator R;

	Spawn(Class'IonNukeThinSmkRing',,, Location + vect(0,0,1)*1350, R);
	Spawn(Class'IonNukeThinSmkRing',,, Location - vect(0,0,1)*1350, R);
	Spawn(Class'IonNukeThinSmkRingB',,, Location + vect(0,0,1)*1950, R);
	Spawn(Class'IonNukeThinSmkRingB',,, Location - vect(0,0,1)*1950, R);
}

defaultproperties
{
	LifeSpan=30.000000
	DynamicLightClass=Class'IonNukeLight'
	NuclearCoronaClass=Class'IonNukeCorona'
	NuclearDistSnd=IonNukeFarExploSnd
	NuclearDistSndVol=3750.000000
	NuclearDistSndRadius=60000.000000
	
	ShockRadius=30000.000000
	ShockTime=5.200000
	ShockMomentum=1000000
	ShockDmgType=NuclearIon
	
	NucleusRadius=2000.000000
	NucleusTime=7.500000
	NucleusMomentum=800000
	NucleusDmgType=NuclearIon
	
	bUpdateGroundBreaking=True
	
	SmkLightningsMinRadius=1080.000000
	SmkLightningsMaxRadius=5760.000000
	SmkLightningsMinZ=480.000000
	SmkLightningsMaxZ=2560.000000
	SmkLightningsRadiusVar=0.350000
	SmkLightningsTime=14.000000
	
	SphereLightningsRadius=320.000000
	SphereLightningsTime=7.000000

	
	DynamicLightOn=False
	ignoreStaticObjects=False
	ignoreFriends=True
	ignoreInstigator=False
	ignoreDecoration=False
	ignoreProjectiles=False
	ignoreTriggers=False
	ShockRadialDmgType=RDMG_Auto
	ShockwaveBaseDamage=30000
	ShockwaveDmgUpdateTime=0.050000
	ShockwaveDmgTransparencyDist=512.000000
	ShockwaveMufflingFactor=0.950000
	NucleusRadialDmgType=RDMG_Auto
	NucleusBaseDamage=75000
	NucleusDmgUpdateTime=0.200000
	NucleusDmgTransparencyDist=512.000000
	NucleusMufflingFactor=0.950000
	bSpawnExtraShockFX=True
	ExtraShockFXAmount=5
	
	SmkLightningsRateMin=2.000000
	SmkLightningsRateMax=10.000000
	SmkLightningsAmountPerUpdateMin=1
	SmkLightningsAmountPerUpdateMax=5
	
	SphereLightningsRateMin=5.000000
	SphereLightningsRateMax=25.000000
	SphereLightningsAmountPerUpdateMin=10
	SphereLightningsAmountPerUpdateMax=20
}
