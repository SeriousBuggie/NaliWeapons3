//////////////////////////////////////////////////////////////
//				Feralidragon (13-06-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearExplosionLevelB expands NuclearExplosions config(NWNuclearCfg);

#exec AUDIO IMPORT NAME="Nuke02BlastDistance" FILE=SOUNDS\Nuke02BlastDistance.wav GROUP="NuclearBlasts"

var(ClientConfig) config byte ExplosionFXDensity;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		SpawnShock();
		SpawnNucleus();
		SpawnSmokeWave();
		SpawnDemiMush();
		SetTimeOut(0.35, 0, True);
		SetTimeOut(0.85, 1, True);
		SetTimeOut(0.05, 2, True);
	}
}

simulated function SpawnShock()
{
local rotator R;

	Spawn(Class'NuclearShockRingB',,,, R);
	Spawn(Class'NuclearShockSpikyB',,,, R);
	Spawn(Class'NuclearShockB');
	Spawn(Class'NuclearNucleusGlowB');
}

simulated function SpawnNucleus()
{
	Spawn(Class'NuclearCoronaSphereLifeBrightLvlB');
}

simulated function SpawnSmokeWave()
{
local rotator R;
local NuclearShockCloudMaster master;

	R.Yaw = Rand(16384);
	master = Spawn(Class'NuclearCloudMasterLvlB',,,, R);
	Spawn(Class'NuclearCloudLvlBa', master,,, R);
	Spawn(Class'NuclearCloudLvlBb', master,,, R);
	Spawn(Class'NuclearCloudLvlBc', master,,, R);
}

simulated function SpawnDemiMush()
{
local byte i;
local rotator R, RAngle;
local vector SLoc;

	for (i = 0; i < ExplosionFXDensity; i++)
	{
		RAngle.Yaw = Int(65536.f/ExplosionFXDensity*i);
		SLoc = vector(RAngle) * NucleusRadius / 2;
		R = rotator(vect(0,0,1));
		SLoc += Location;
		Spawn(Class'NuclearExplGuiderLvlB',,, SLoc, R);
	}
}

simulated function TriggerTimeOut0()
{
local rotator R;

	Spawn(Class'NukeThinSmkRing',,, Location + vect(0,0,600), R);
}

simulated function TriggerTimeOut1()
{
local rotator R;

	Spawn(Class'NukeThinSmkRingB',,, Location + vect(0,0,1200), R);
}

simulated function TriggerTimeOut2()
{
	Spawn(Class'NukeBWallParts');
}

defaultproperties
{
	LifeSpan=15.000000
	DynamicLightClass=Class'NuclearLightB'
	NuclearCoronaClass=Class'NuclearCoronaLvlB'
	NuclearDistSnd=Nuke02BlastDistance
	NuclearDistSndVol=1500.000000
	NuclearDistSndRadius=15000.000000
	
	ShockRadius=5000.000000
	ShockTime=1.300000
	ShockMomentum=300000
	ShockDmgType=Nuclear02
	
	NucleusRadius=500.000000
	NucleusTime=2.000000
	NucleusMomentum=350000
	NucleusDmgType=Nuclear02
	bGrowingNucleus=True
	MinNucleusRad=20.000000

	
	DynamicLightOn=False
	ignoreStaticObjects=False
	ignoreFriends=True
	ignoreInstigator=False
	ignoreDecoration=False
	ignoreProjectiles=False
	ignoreTriggers=False
	ShockRadialDmgType=RDMG_Auto
	ShockwaveBaseDamage=5000
	ShockwaveDmgUpdateTime=0.050000
	ShockwaveDmgTransparencyDist=64.000000
	ShockwaveMufflingFactor=0.850000
	NucleusRadialDmgType=RDMG_Auto
	NucleusBaseDamage=6000
	NucleusDmgUpdateTime=0.100000
	NucleusDmgTransparencyDist=128.000000
	NucleusMufflingFactor=0.850000
	bSpawnExtraShockFX=True
	ExtraShockFXAmount=5
	
	ExplosionFXDensity=5
}
