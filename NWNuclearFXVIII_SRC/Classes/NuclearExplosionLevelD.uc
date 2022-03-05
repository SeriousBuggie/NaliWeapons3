//////////////////////////////////////////////////////////////
//				Feralidragon (24-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearExplosionLevelD expands NuclearExplosions config(NWNuclearCfg);

#exec AUDIO IMPORT NAME="Nuke04BlastDistance" FILE=SOUNDS\Nuke04BlastDistance.wav GROUP="NuclearBlasts"

var(ClientConfig) config byte FlyingDebrisAmount;
var(ClientConfig) config bool enableFXSmartPerformance;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		SpawnMushroom();
		SpawnSmokeWave();
		SpawnShock();
		SpawnLens();

		SetTimeOut(1.5, 0, True);
		SetTimeOut(3.0, 1, True);
		SetTimeOut(2.0, 2, True);
		SetTimeOut(4.5, 3, True);
	}
}

simulated function SpawnMushroom()
{
local byte i;
local NuclearMushFX fx;
local rotator R1, R2;

	R1.Yaw = Rand(16384)*4;
	R2.Yaw = Rand(16384)*4;
	for (i = 0; i < 8; i++)
	{
		fx = Spawn(Class'NuclearMushColumn',,,, R1);
		fx.setFX(i);
		fx = Spawn(Class'NuclearMushHead',,,, R2);
		fx.setFX(i);
	}
}

simulated function SpawnSmokeWave()
{
local rotator R;
local NuclearShockCloudMaster master;

	R.Yaw = Rand(16384);
	master = Spawn(Class'NuclearShockCloudMaster',,,, R);
	Spawn(Class'NuclearShockCloud', master,,, R);
	Spawn(Class'NuclearShockCloudB', master,,, R);
	Spawn(Class'NuclearShockCloudC', master,,, R);
}

simulated function SpawnShock()
{
local rotator R;

	Spawn(Class'NuclearShockRing',,,, R);
	Spawn(Class'NuclearShockSpiky',,,, R);
	Spawn(Class'NuclearShockD');
}

simulated function SpawnLens()
{
	Spawn(Class'NuclearLensA');
	Spawn(Class'NuclearCoronaMushA');
	Spawn(Class'NuclearCorFogD');
}

simulated function TriggerTimeOut0()
{
local rotator R;

	Spawn(Class'NuclearMushRingA',,, Location + 2000*vect(0,0,1), R);
}

simulated function TriggerTimeOut1()
{
local rotator R;

	Spawn(Class'NuclearMushRingA',,, Location + 3000*vect(0,0,1), R);
}

simulated function TriggerTimeOut2()
{
local rotator R;

	Spawn(Class'NukeAtmosRing',,, Location + 3500*vect(0,0,1), R);
	Spawn(Class'NukeAtmosRingExp',,, Location + 3500*vect(0,0,1), R);
	Spawn(Class'NukeThinSmkRingDa',,, Location + 1500*vect(0,0,1), R);
	Spawn(Class'NukeDWallParts',,,, rotator(vect(0,0,1)));
}

simulated function TriggerTimeOut3()
{
local rotator R;
	
	Spawn(Class'NukeThinSmkRingDb',,, Location + 3000*vect(0,0,1), R);
}

defaultproperties
{
	LifeSpan=30.000000
	DynamicLightClass=Class'NuclearLightD'
	NuclearCoronaClass=Class'NuclearCoronaA'
	NuclearDistSnd=Nuke04BlastDistance
	NuclearDistSndVol=1500.000000
	NuclearDistSndRadius=40000.000000
	
	ShockRadius=20000.000000
	ShockTime=5.200000
	ShockMomentum=600000
	ShockDmgType=Nuclear04
	
	NucleusRadius=2000.000000
	NucleusTime=16.000000
	NucleusMomentum=675000
	NucleusDmgType=Nuclear04

	
	DynamicLightOn=False
	ignoreStaticObjects=False
	ignoreFriends=True
	ignoreInstigator=False
	ignoreDecoration=False
	ignoreProjectiles=False
	ignoreTriggers=False
	ShockRadialDmgType=RDMG_Auto
	ShockwaveBaseDamage=20000
	ShockwaveDmgUpdateTime=0.050000
	ShockwaveDmgTransparencyDist=256.000000
	ShockwaveMufflingFactor=0.850000
	NucleusRadialDmgType=RDMG_Auto
	NucleusBaseDamage=25000
	NucleusDmgUpdateTime=0.200000
	NucleusDmgTransparencyDist=256.000000
	NucleusMufflingFactor=0.850000
	bSpawnExtraShockFX=True
	ExtraShockFXAmount=5
	
	FlyingDebrisAmount=28
	enableFXSmartPerformance=True
}
