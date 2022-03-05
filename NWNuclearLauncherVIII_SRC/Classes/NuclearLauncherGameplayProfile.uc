//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLauncherGameplayProfile expands NWProfile config(NWProfilesCfg);

var() class<NuclearLauncher> NLauncherClass;


struct NuclearLauncherStructA
{
	var() bool bDestructableNuke, bNukeWhenDestroyed, CanBeDestroyedByTeam, guidedNukeExplodeOnDeath;
};
var() config NuclearLauncherStructA NuclearLauncherProfileA[8];

struct NuclearLauncherStructB
{
	var() int DamageToDestroy, DestroyedNukeDamage, ImpactDamage, ImpactMomentum;
	var() float DestroyedNukeRadius, ImpactRadius;
};
var() config NuclearLauncherStructB NuclearLauncherProfileB[8];

struct NuclearLauncherStructC
{
	var() bool enableDeniedMsg, bShakeFXOnFire;
	var() float MissileColRadius, MissileColHeight, NukeSpeed, MaxNukeSpeed, GuidedNukeSpeed;
};
var() config NuclearLauncherStructC NuclearLauncherProfileC[8];

struct NuclearLauncherStructD
{
	var() bool enableHUDOrientation, enableHUDAltitude, enableHUDPawnTargets, enableHUDMachineTargets;
	var() bool checkHiddenTargets, checkTeamTargets;
};
var() config NuclearLauncherStructD NuclearLauncherProfileD[8];

struct NuclearLauncherStructE
{
	var() byte GuidedFOVIncrease;
	var() float MaxPawnsDetectionRadius, MaxMachinesDetectionRadius;
};
var() config NuclearLauncherStructE NuclearLauncherProfileE[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local NuclearLauncher NL;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NLauncherClass.default.bDestructableNuke = default.NuclearLauncherProfileA[i].bDestructableNuke;
	default.NLauncherClass.default.bNukeWhenDestroyed = default.NuclearLauncherProfileA[i].bNukeWhenDestroyed;
	default.NLauncherClass.default.CanBeDestroyedByTeam = default.NuclearLauncherProfileA[i].CanBeDestroyedByTeam;
	default.NLauncherClass.default.guidedNukeExplodeOnDeath = default.NuclearLauncherProfileA[i].guidedNukeExplodeOnDeath;
	
	default.NLauncherClass.default.DamageToDestroy = default.NuclearLauncherProfileB[i].DamageToDestroy;
	default.NLauncherClass.default.DestroyedNukeDamage = default.NuclearLauncherProfileB[i].DestroyedNukeDamage;
	default.NLauncherClass.default.ImpactDamage = default.NuclearLauncherProfileB[i].ImpactDamage;
	default.NLauncherClass.default.ImpactMomentum = default.NuclearLauncherProfileB[i].ImpactMomentum;
	default.NLauncherClass.default.DestroyedNukeRadius = default.NuclearLauncherProfileB[i].DestroyedNukeRadius;
	default.NLauncherClass.default.ImpactRadius = default.NuclearLauncherProfileB[i].ImpactRadius;
	
	default.NLauncherClass.default.enableDeniedMsg = default.NuclearLauncherProfileC[i].enableDeniedMsg;
	default.NLauncherClass.default.bShakeFXOnFire = default.NuclearLauncherProfileC[i].bShakeFXOnFire;
	default.NLauncherClass.default.MissileColRadius = default.NuclearLauncherProfileC[i].MissileColRadius;
	default.NLauncherClass.default.MissileColHeight = default.NuclearLauncherProfileC[i].MissileColHeight;
	default.NLauncherClass.default.NukeSpeed = default.NuclearLauncherProfileC[i].NukeSpeed;
	default.NLauncherClass.default.MaxNukeSpeed = default.NuclearLauncherProfileC[i].MaxNukeSpeed;
	default.NLauncherClass.default.GuidedNukeSpeed = default.NuclearLauncherProfileC[i].GuidedNukeSpeed;
	
	default.NLauncherClass.default.enableHUDOrientation = default.NuclearLauncherProfileD[i].enableHUDOrientation;
	default.NLauncherClass.default.enableHUDAltitude = default.NuclearLauncherProfileD[i].enableHUDAltitude;
	default.NLauncherClass.default.enableHUDPawnTargets = default.NuclearLauncherProfileD[i].enableHUDPawnTargets;
	default.NLauncherClass.default.enableHUDMachineTargets = default.NuclearLauncherProfileD[i].enableHUDMachineTargets;
	default.NLauncherClass.default.checkHiddenTargets = default.NuclearLauncherProfileD[i].checkHiddenTargets;
	default.NLauncherClass.default.checkTeamTargets = default.NuclearLauncherProfileD[i].checkTeamTargets;
	
	default.NLauncherClass.default.GuidedFOVIncrease = default.NuclearLauncherProfileE[i].GuidedFOVIncrease;
	default.NLauncherClass.default.MaxPawnsDetectionRadius = default.NuclearLauncherProfileE[i].MaxPawnsDetectionRadius;
	default.NLauncherClass.default.MaxMachinesDetectionRadius = default.NuclearLauncherProfileE[i].MaxMachinesDetectionRadius;
	
	if (Lvl == None)
		default.NLauncherClass.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'NuclearLauncher', NL)
		{
			if (default.NLauncherClass == NL.Class)
			{
				NL.default.bDestructableNuke = default.NLauncherClass.default.bDestructableNuke;
				NL.bDestructableNuke = default.NLauncherClass.default.bDestructableNuke;
				NL.default.bNukeWhenDestroyed = default.NLauncherClass.default.bNukeWhenDestroyed;
				NL.bNukeWhenDestroyed = default.NLauncherClass.default.bNukeWhenDestroyed;
				NL.default.CanBeDestroyedByTeam = default.NLauncherClass.default.CanBeDestroyedByTeam;
				NL.CanBeDestroyedByTeam = default.NLauncherClass.default.CanBeDestroyedByTeam;
				NL.default.guidedNukeExplodeOnDeath = default.NLauncherClass.default.guidedNukeExplodeOnDeath;
				NL.guidedNukeExplodeOnDeath = default.NLauncherClass.default.guidedNukeExplodeOnDeath;

				NL.default.DamageToDestroy = default.NLauncherClass.default.DamageToDestroy;
				NL.DamageToDestroy = default.NLauncherClass.default.DamageToDestroy;
				NL.default.DestroyedNukeDamage = default.NLauncherClass.default.DestroyedNukeDamage;
				NL.DestroyedNukeDamage = default.NLauncherClass.default.DestroyedNukeDamage;
				NL.default.ImpactDamage = default.NLauncherClass.default.ImpactDamage;
				NL.ImpactDamage = default.NLauncherClass.default.ImpactDamage;
				NL.default.ImpactMomentum = default.NLauncherClass.default.ImpactMomentum;
				NL.ImpactMomentum = default.NLauncherClass.default.ImpactMomentum;
				NL.default.DestroyedNukeRadius = default.NLauncherClass.default.DestroyedNukeRadius;
				NL.DestroyedNukeRadius = default.NLauncherClass.default.DestroyedNukeRadius;
				NL.default.ImpactRadius = default.NLauncherClass.default.ImpactRadius;
				NL.ImpactRadius = default.NLauncherClass.default.ImpactRadius;

				NL.default.enableDeniedMsg = default.NLauncherClass.default.enableDeniedMsg;
				NL.enableDeniedMsg = default.NLauncherClass.default.enableDeniedMsg;
				NL.default.bShakeFXOnFire = default.NLauncherClass.default.bShakeFXOnFire;
				NL.bShakeFXOnFire = default.NLauncherClass.default.bShakeFXOnFire;
				NL.default.MissileColRadius = default.NLauncherClass.default.MissileColRadius;
				NL.MissileColRadius = default.NLauncherClass.default.MissileColRadius;
				NL.default.MissileColHeight = default.NLauncherClass.default.MissileColHeight;
				NL.MissileColHeight = default.NLauncherClass.default.MissileColHeight;
				NL.default.NukeSpeed = default.NLauncherClass.default.NukeSpeed;
				NL.NukeSpeed = default.NLauncherClass.default.NukeSpeed;
				NL.default.MaxNukeSpeed = default.NLauncherClass.default.MaxNukeSpeed;
				NL.MaxNukeSpeed = default.NLauncherClass.default.MaxNukeSpeed;
				NL.default.GuidedNukeSpeed = default.NLauncherClass.default.GuidedNukeSpeed;
				NL.GuidedNukeSpeed = default.NLauncherClass.default.GuidedNukeSpeed;

				NL.default.enableHUDOrientation = default.NLauncherClass.default.enableHUDOrientation;
				NL.enableHUDOrientation = default.NLauncherClass.default.enableHUDOrientation;
				NL.default.enableHUDAltitude = default.NLauncherClass.default.enableHUDAltitude;
				NL.enableHUDAltitude = default.NLauncherClass.default.enableHUDAltitude;
				NL.default.enableHUDPawnTargets = default.NLauncherClass.default.enableHUDPawnTargets;
				NL.enableHUDPawnTargets = default.NLauncherClass.default.enableHUDPawnTargets;
				NL.default.enableHUDMachineTargets = default.NLauncherClass.default.enableHUDMachineTargets;
				NL.enableHUDMachineTargets = default.NLauncherClass.default.enableHUDMachineTargets;
				NL.default.checkHiddenTargets = default.NLauncherClass.default.checkHiddenTargets;
				NL.checkHiddenTargets = default.NLauncherClass.default.checkHiddenTargets;
				NL.default.checkTeamTargets = default.NLauncherClass.default.checkTeamTargets;
				NL.checkTeamTargets = default.NLauncherClass.default.checkTeamTargets;

				NL.default.GuidedFOVIncrease = default.NLauncherClass.default.GuidedFOVIncrease;
				NL.GuidedFOVIncrease = default.NLauncherClass.default.GuidedFOVIncrease;
				NL.default.MaxPawnsDetectionRadius = default.NLauncherClass.default.MaxPawnsDetectionRadius;
				NL.MaxPawnsDetectionRadius = default.NLauncherClass.default.MaxPawnsDetectionRadius;
				NL.default.MaxMachinesDetectionRadius = default.NLauncherClass.default.MaxMachinesDetectionRadius;
				NL.MaxMachinesDetectionRadius = default.NLauncherClass.default.MaxMachinesDetectionRadius;
			}
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NuclearLauncherProfileA[i].bDestructableNuke = default.NLauncherClass.default.bDestructableNuke;
	default.NuclearLauncherProfileA[i].bNukeWhenDestroyed = default.NLauncherClass.default.bNukeWhenDestroyed;
	default.NuclearLauncherProfileA[i].CanBeDestroyedByTeam = default.NLauncherClass.default.CanBeDestroyedByTeam;
	default.NuclearLauncherProfileA[i].guidedNukeExplodeOnDeath = default.NLauncherClass.default.guidedNukeExplodeOnDeath;
	
	default.NuclearLauncherProfileB[i].DamageToDestroy = default.NLauncherClass.default.DamageToDestroy;
	default.NuclearLauncherProfileB[i].DestroyedNukeDamage = default.NLauncherClass.default.DestroyedNukeDamage;
	default.NuclearLauncherProfileB[i].ImpactDamage = default.NLauncherClass.default.ImpactDamage;
	default.NuclearLauncherProfileB[i].ImpactMomentum = default.NLauncherClass.default.ImpactMomentum;
	default.NuclearLauncherProfileB[i].DestroyedNukeRadius = default.NLauncherClass.default.DestroyedNukeRadius;
	default.NuclearLauncherProfileB[i].ImpactRadius = default.NLauncherClass.default.ImpactRadius;
	
	default.NuclearLauncherProfileC[i].enableDeniedMsg = default.NLauncherClass.default.enableDeniedMsg;
	default.NuclearLauncherProfileC[i].bShakeFXOnFire = default.NLauncherClass.default.bShakeFXOnFire;
	default.NuclearLauncherProfileC[i].MissileColRadius = default.NLauncherClass.default.MissileColRadius;
	default.NuclearLauncherProfileC[i].MissileColHeight = default.NLauncherClass.default.MissileColHeight;
	default.NuclearLauncherProfileC[i].NukeSpeed = default.NLauncherClass.default.NukeSpeed;
	default.NuclearLauncherProfileC[i].MaxNukeSpeed = default.NLauncherClass.default.MaxNukeSpeed;
	default.NuclearLauncherProfileC[i].GuidedNukeSpeed = default.NLauncherClass.default.GuidedNukeSpeed;
	
	default.NuclearLauncherProfileD[i].enableHUDOrientation = default.NLauncherClass.default.enableHUDOrientation;
	default.NuclearLauncherProfileD[i].enableHUDAltitude = default.NLauncherClass.default.enableHUDAltitude;
	default.NuclearLauncherProfileD[i].enableHUDPawnTargets = default.NLauncherClass.default.enableHUDPawnTargets;
	default.NuclearLauncherProfileD[i].enableHUDMachineTargets = default.NLauncherClass.default.enableHUDMachineTargets;
	default.NuclearLauncherProfileD[i].checkHiddenTargets = default.NLauncherClass.default.checkHiddenTargets;
	default.NuclearLauncherProfileD[i].checkTeamTargets = default.NLauncherClass.default.checkTeamTargets;
	
	default.NuclearLauncherProfileE[i].GuidedFOVIncrease = default.NLauncherClass.default.GuidedFOVIncrease;
	default.NuclearLauncherProfileE[i].MaxPawnsDetectionRadius = default.NLauncherClass.default.MaxPawnsDetectionRadius;
	default.NuclearLauncherProfileE[i].MaxMachinesDetectionRadius = default.NLauncherClass.default.MaxMachinesDetectionRadius;
	
	StaticSaveConfig();
}


defaultproperties
{
	NLauncherClass=Class'NuclearLauncher'

	NuclearLauncherProfileA(0)=(bDestructableNuke=True,bNukeWhenDestroyed=False,CanBeDestroyedByTeam=False,guidedNukeExplodeOnDeath=False)
	NuclearLauncherProfileB(0)=(DamageToDestroy=1,DestroyedNukeDamage=300,ImpactDamage=500,ImpactMomentum=80000,DestroyedNukeRadius=250.000000,ImpactRadius=600.000000)
	NuclearLauncherProfileC(0)=(enableDeniedMsg=True,bShakeFXOnFire=True,MissileColRadius=16.000000,MissileColHeight=10.000000,NukeSpeed=800.000000,MaxNukeSpeed=1100.000000,GuidedNukeSpeed=450.000000)
	NuclearLauncherProfileD(0)=(enableHUDOrientation=True,enableHUDAltitude=True,enableHUDPawnTargets=True,enableHUDMachineTargets=True,checkHiddenTargets=True,checkTeamTargets=True)
	NuclearLauncherProfileE(0)=(GuidedFOVIncrease=35,MaxPawnsDetectionRadius=3000.000000,MaxMachinesDetectionRadius=4000.000000)

	NuclearLauncherProfileA(1)=(bDestructableNuke=True,bNukeWhenDestroyed=True,CanBeDestroyedByTeam=False,guidedNukeExplodeOnDeath=False)
	NuclearLauncherProfileB(1)=(DamageToDestroy=5,DestroyedNukeDamage=700,ImpactDamage=1000,ImpactMomentum=80000,DestroyedNukeRadius=400.000000,ImpactRadius=800.000000)
	NuclearLauncherProfileC(1)=(enableDeniedMsg=False,bShakeFXOnFire=True,MissileColRadius=16.000000,MissileColHeight=10.000000,NukeSpeed=1200.000000,MaxNukeSpeed=1500.000000,GuidedNukeSpeed=600.000000)
	NuclearLauncherProfileD(1)=(enableHUDOrientation=True,enableHUDAltitude=True,enableHUDPawnTargets=True,enableHUDMachineTargets=True,checkHiddenTargets=True,checkTeamTargets=True)
	NuclearLauncherProfileE(1)=(GuidedFOVIncrease=40,MaxPawnsDetectionRadius=3000.000000,MaxMachinesDetectionRadius=4000.000000)
	
	NuclearLauncherProfileA(2)=(bDestructableNuke=True,bNukeWhenDestroyed=True,CanBeDestroyedByTeam=False,guidedNukeExplodeOnDeath=True)
	NuclearLauncherProfileB(2)=(DamageToDestroy=5,DestroyedNukeDamage=1000,ImpactDamage=1000,ImpactMomentum=80000,DestroyedNukeRadius=450.000000,ImpactRadius=1000.000000)
	NuclearLauncherProfileC(2)=(enableDeniedMsg=False,bShakeFXOnFire=True,MissileColRadius=15.000000,MissileColHeight=8.000000,NukeSpeed=1500.000000,MaxNukeSpeed=1800.000000,GuidedNukeSpeed=750.000000)
	NuclearLauncherProfileD(2)=(enableHUDOrientation=True,enableHUDAltitude=True,enableHUDPawnTargets=True,enableHUDMachineTargets=True,checkHiddenTargets=True,checkTeamTargets=True)
	NuclearLauncherProfileE(2)=(GuidedFOVIncrease=50,MaxPawnsDetectionRadius=3000.000000,MaxMachinesDetectionRadius=4000.000000)
	
	NuclearLauncherProfileA(3)=(bDestructableNuke=True,bNukeWhenDestroyed=False,CanBeDestroyedByTeam=False,guidedNukeExplodeOnDeath=True)
	NuclearLauncherProfileB(3)=(DamageToDestroy=5,DestroyedNukeDamage=2000,ImpactDamage=5000,ImpactMomentum=85000,DestroyedNukeRadius=500.000000,ImpactRadius=1000.000000)
	NuclearLauncherProfileC(3)=(enableDeniedMsg=True,bShakeFXOnFire=True,MissileColRadius=14.000000,MissileColHeight=7.000000,NukeSpeed=1300.000000,MaxNukeSpeed=1600.000000,GuidedNukeSpeed=650.000000)
	NuclearLauncherProfileD(3)=(enableHUDOrientation=True,enableHUDAltitude=True,enableHUDPawnTargets=True,enableHUDMachineTargets=True,checkHiddenTargets=True,checkTeamTargets=True)
	NuclearLauncherProfileE(3)=(GuidedFOVIncrease=35,MaxPawnsDetectionRadius=4000.000000,MaxMachinesDetectionRadius=5000.000000)
	
	NuclearLauncherProfileA(4)=(bDestructableNuke=False,bNukeWhenDestroyed=True,CanBeDestroyedByTeam=False,guidedNukeExplodeOnDeath=True)
	NuclearLauncherProfileB(4)=(DamageToDestroy=200,DestroyedNukeDamage=2000,ImpactDamage=10000,ImpactMomentum=120000,DestroyedNukeRadius=750.000000,ImpactRadius=1350.000000)
	NuclearLauncherProfileC(4)=(enableDeniedMsg=False,bShakeFXOnFire=True,MissileColRadius=8.000000,MissileColHeight=4.000000,NukeSpeed=1500.000000,MaxNukeSpeed=1800.000000,GuidedNukeSpeed=750.000000)
	NuclearLauncherProfileD(4)=(enableHUDOrientation=True,enableHUDAltitude=True,enableHUDPawnTargets=True,enableHUDMachineTargets=True,checkHiddenTargets=True,checkTeamTargets=True)
	NuclearLauncherProfileE(4)=(GuidedFOVIncrease=45,MaxPawnsDetectionRadius=5000.000000,MaxMachinesDetectionRadius=7500.000000)
	
	NuclearLauncherProfileA(5)=(bDestructableNuke=True,bNukeWhenDestroyed=True,CanBeDestroyedByTeam=False,guidedNukeExplodeOnDeath=True)
	NuclearLauncherProfileB(5)=(DamageToDestroy=5,DestroyedNukeDamage=1000,ImpactDamage=1000,ImpactMomentum=80000,DestroyedNukeRadius=450.000000,ImpactRadius=1000.000000)
	NuclearLauncherProfileC(5)=(enableDeniedMsg=False,bShakeFXOnFire=True,MissileColRadius=15.000000,MissileColHeight=8.000000,NukeSpeed=1500.000000,MaxNukeSpeed=1800.000000,GuidedNukeSpeed=750.000000)
	NuclearLauncherProfileD(5)=(enableHUDOrientation=True,enableHUDAltitude=True,enableHUDPawnTargets=True,enableHUDMachineTargets=True,checkHiddenTargets=True,checkTeamTargets=True)
	NuclearLauncherProfileE(5)=(GuidedFOVIncrease=50,MaxPawnsDetectionRadius=3000.000000,MaxMachinesDetectionRadius=4000.000000)
	
	NuclearLauncherProfileA(6)=(bDestructableNuke=True,bNukeWhenDestroyed=True,CanBeDestroyedByTeam=False,guidedNukeExplodeOnDeath=True)
	NuclearLauncherProfileB(6)=(DamageToDestroy=5,DestroyedNukeDamage=1000,ImpactDamage=1000,ImpactMomentum=80000,DestroyedNukeRadius=450.000000,ImpactRadius=1000.000000)
	NuclearLauncherProfileC(6)=(enableDeniedMsg=False,bShakeFXOnFire=True,MissileColRadius=15.000000,MissileColHeight=8.000000,NukeSpeed=1500.000000,MaxNukeSpeed=1800.000000,GuidedNukeSpeed=750.000000)
	NuclearLauncherProfileD(6)=(enableHUDOrientation=True,enableHUDAltitude=True,enableHUDPawnTargets=True,enableHUDMachineTargets=True,checkHiddenTargets=True,checkTeamTargets=True)
	NuclearLauncherProfileE(6)=(GuidedFOVIncrease=50,MaxPawnsDetectionRadius=3000.000000,MaxMachinesDetectionRadius=4000.000000)
	
	NuclearLauncherProfileA(7)=(bDestructableNuke=True,bNukeWhenDestroyed=True,CanBeDestroyedByTeam=False,guidedNukeExplodeOnDeath=True)
	NuclearLauncherProfileB(7)=(DamageToDestroy=5,DestroyedNukeDamage=1000,ImpactDamage=1000,ImpactMomentum=80000,DestroyedNukeRadius=450.000000,ImpactRadius=1000.000000)
	NuclearLauncherProfileC(7)=(enableDeniedMsg=False,bShakeFXOnFire=True,MissileColRadius=15.000000,MissileColHeight=8.000000,NukeSpeed=1500.000000,MaxNukeSpeed=1800.000000,GuidedNukeSpeed=750.000000)
	NuclearLauncherProfileD(7)=(enableHUDOrientation=True,enableHUDAltitude=True,enableHUDPawnTargets=True,enableHUDMachineTargets=True,checkHiddenTargets=True,checkTeamTargets=True)
	NuclearLauncherProfileE(7)=(GuidedFOVIncrease=50,MaxPawnsDetectionRadius=3000.000000,MaxMachinesDetectionRadius=4000.000000)
}