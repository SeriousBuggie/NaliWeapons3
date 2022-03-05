//////////////////////////////////////////////////////////////
//				Feralidragon (13-06-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearExplosionLevelA expands NuclearExplosions config(NWeaponsCfg);

#exec AUDIO IMPORT NAME="Nuke01BlastDistance" FILE=SOUNDS\Nuke01BlastDistance.wav GROUP="NuclearBlasts"

var(ClientConfig) config float ExplFXRate;
var(ClientConfig) config int ExplFXAmountPerUpdate;
var(ClientConfig) config float SmokeFXRate;
var(ClientConfig) config int SmokeFXAmountPerUpdate;

var() float ExplFXTime, ExplFXTimeMaxRadius;
var() float SmkFXTime, SmkFXTimeDelay, SmkFXTimeMaxRadius;
var float ExplFXCounter, SmkFXCounter, FXTimeCounter;


simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		SpawnShock();
		SpawnNucleus();
		SetTimeOut(0.05, 0, True);
	}
}

simulated function SpawnShock()
{
local rotator R;

	Spawn(Class'NuclearShockRingA',,,, R);
	Spawn(Class'NuclearShockSpikyA',,,, R);
	Spawn(Class'NuclearShockA');
}

simulated function SpawnNucleus()
{
	Spawn(Class'NuclearNucleusGlowA');
	Spawn(Class'NuclearNucleusGlowSmallA');
	Spawn(Class'NuclearCoronaLvlSmallA');
}

simulated function TriggerTimeOut0()
{
	Spawn(Class'NukeAWallParts');
}

simulated function UpdateGroundBreaking(float Delta)
{
local int i;
local NukeMiscExpl nME;
local NukeSmk nSmk;
local NukeBlkSmk nBlackSmk;
local vector loc;

	FXTimeCounter += Delta;
	
	if (FXTimeCounter < ExplFXTime && ExplFXRate > 0 && ExplFXAmountPerUpdate > 0)
	{
		ExplFXCounter += Delta;
		if (ExplFXCounter >= 1/ExplFXRate)
		{
			ExplFXCounter = 0.0;
			for (i = 0; i < ExplFXAmountPerUpdate; i++)
			{
				nME = Spawn(Class'NukeMiscExpl',,, Location + VRand()*FRand()*ExplFXTimeMaxRadius*(FXTimeCounter/ExplFXTime));
				if (nME != None)
					nME.SetScale(FXTimeCounter);
				nME = None;
			}
		}
	}
	
	if (FXTimeCounter > SmkFXTimeDelay && FXTimeCounter < (SmkFXTime+SmkFXTimeDelay) && SmokeFXRate > 0 && SmokeFXAmountPerUpdate > 0)
	{
		SmkFXCounter += Delta;
		if (SmkFXCounter >= 1/SmokeFXRate)
		{
			SmkFXCounter = 0.0;
			for (i = 0; i < SmokeFXAmountPerUpdate; i++)
			{
				loc = Location + VRand()*FRand()*SmkFXTimeMaxRadius*(FXTimeCounter/(SmkFXTime+SmkFXTimeDelay));
				nSmk = Spawn(Class'NukeSmk',,, loc);
				if (nSmk != None)
				{
					nSmk.ClientSetSmkProperties(Normal(nSmk.Location - Location)*100, FXTimeCounter, FXTimeCounter, True);
					nBlackSmk = Spawn(Class'NukeBlkSmk',,, loc);
					nBlackSmk.ClientSetSmkProperties(Normal(nSmk.Location - Location)*100, FXTimeCounter, FXTimeCounter, True);
				}
				nSmk = None;
			}
		}
	}
}


defaultproperties
{
	LifeSpan=7.000000
	DynamicLightClass=Class'NuclearLightA'
	NuclearCoronaClass=Class'NuclearCoronaLvlA'
	NuclearDistSnd=Nuke01BlastDistance
	NuclearDistSndVol=1500.000000
	NuclearDistSndRadius=7500.000000
	
	ShockRadius=2500.000000
	ShockTime=0.650000
	ShockMomentum=150000
	ShockDmgType=Nuclear01
	
	NucleusRadius=500.000000
	NucleusTime=1.000000
	NucleusMomentum=200000
	NucleusDmgType=Nuclear01
	bGrowingNucleus=True
	MinNucleusRad=20.000000
	
	bUpdateGroundBreaking=True
	ExplFXTime=1.000000
	ExplFXTimeMaxRadius=1000.000000
	SmkFXTime=0.7500000
	SmkFXTimeDelay=0.500000
	SmkFXTimeMaxRadius=900.000000

	
	DynamicLightOn=False
	ignoreStaticObjects=False
	ignoreFriends=True
	ignoreInstigator=False
	ignoreDecoration=False
	ignoreProjectiles=False
	ignoreTriggers=False
	ShockRadialDmgType=RDMG_Auto
	ShockwaveBaseDamage=2500
	ShockwaveDmgUpdateTime=0.050000
	ShockwaveDmgTransparencyDist=64.000000
	ShockwaveMufflingFactor=0.850000
	NucleusRadialDmgType=RDMG_Auto
	NucleusBaseDamage=3000
	NucleusDmgUpdateTime=0.100000
	NucleusDmgTransparencyDist=64.000000
	NucleusMufflingFactor=0.850000
	bSpawnExtraShockFX=True
	ExtraShockFXAmount=5
	
	ExplFXRate=15.000000
	ExplFXAmountPerUpdate=12
	SmokeFXRate=7.000000
	SmokeFXAmountPerUpdate=2
}
