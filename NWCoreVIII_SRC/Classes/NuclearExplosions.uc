//////////////////////////////////////////////////////////////
//				Feralidragon (24-04-2011)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearExplosions expands NaliWActor config(NWNuclearCfg)
abstract;

enum ERadialDmg
{
	RDMG_Standard,
	RDMG_Auto,
	RDMG_SemiTransparent,
	RDMG_Transparent,
};

const RADIUSVISIBLE_LIMIT = 2000.000000;

var(ClientConfig) config bool DynamicLightOn;
var(ServerConfig) config ERadialDmg ShockRadialDmgType, NucleusRadialDmgType;
var(ServerConfig) config int ShockwaveBaseDamage, NucleusBaseDamage;
var(ServerConfig) config float ShockwaveDmgUpdateTime, NucleusDmgUpdateTime;
var(ServerConfig) config float ShockwaveDmgTransparencyDist, NucleusDmgTransparencyDist;
var(ServerConfig) config float ShockwaveMufflingFactor, NucleusMufflingFactor;
var(ServerConfig) config bool ignoreStaticObjects, ignoreFriends, ignoreInstigator;
var(ServerConfig) config bool ignoreDecoration, ignoreProjectiles, ignoreTriggers;
var(ServerConfig) config bool bDamageActors;
var(ServerConfig) config name ignoreExtendedFXClasses[8];
var(ServerConfig) config bool bSpawnExtraShockFX;
var(ServerConfig) config byte ExtraShockFXAmount;
var(ServerConfig) config bool bUseIndexedOptimization;
var(ServerConfig) config bool enableVisibleShockwave;
var int maxFXClasses;

var(ClientConfig) config bool enableNukeDebrisWaterFX;

var() class<Light> DynamicLightClass;
var() sound NuclearDistSnd;
var() float NuclearDistSndVol, NuclearDistSndRadius;
var() class<Actor> NuclearCoronaClass;

var() float ShockRadius, NucleusRadius;
var() float ShockTime, NucleusTime;
var() int ShockMomentum, NucleusMomentum;
var() name ShockDmgType, NucleusDmgType;
var() bool bGrowingNucleus;
var() float MinNucleusRad;
var float ShockCount, NucleusCount;
var() class<NWShockwave> ShockwaveFXClass;

var() bool bUpdateGroundBreaking;
var() bool bUpdateTickedEvents;
var float groundBreakCount;

//Optimized indexing temps
var Actor FXTempActors[128];
struct DamagedActors
{
	var Actor TempA;
	var int Dmg;
	var vector Momen;
};
var DamagedActors DmgTempActors[256];

struct TimeOutStruct
{
	var() bool isEnabled;
	var() float TimeOutCounter;
	var() bool bClient;
};

var TimeOutStruct TimeOutSets[8];

var float ShockDmgUpdate, NucleusDmgUpdate;
var texture NukeFloorTex;
var float NukeFloorCount;
var byte savedTeam;
var string ownerName;


function BeginPlay()
{	
	LoadLists();
	if (Instigator != None && Instigator.PlayerReplicationInfo != None)
	{
		ownerName = Instigator.PlayerReplicationInfo.PlayerName;
		savedTeam = Instigator.PlayerReplicationInfo.Team;
	}
}

simulated function PostBeginPlay()
{
	KillScorchDecals();
	SpawnLight();
	SpawnCorona();
	PlayNuclearDistSound();
	SpawnShockwave();
}

function LoadLists()
{
local int i;

	maxFXClasses = ArrayCount(ignoreExtendedFXClasses);
	if (Class'NaliWeapons'.default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(ignoreExtendedFXClasses); i++)
		{
			if (ignoreExtendedFXClasses[i] == '')
			{
				maxFXClasses = i;
				break;
			}
		}
	}
}

function SpawnShockwave()
{
local NWShockwave shockFX;

	if (default.enableVisibleShockwave && ShockwaveFXClass != None)
	{
		shockFX = Spawn(ShockwaveFXClass);
		shockFX.Init(0, ShockRadius, ShockTime);
	}
}

simulated function ProcessNukeFloorTex()
{
local NWWallTexDetector NWDec;

	NWDec = Spawn(Class'NWWallTexDetector');
	NukeFloorTex = NWDec.AttachDecal(600);
	NWDec.Destroy();
	NWDec = None;
}

simulated function KillScorchDecals()
{
local Scorch Sch;

	if (Level.NetMode != NM_DedicatedServer)
	{
		ForEach AllActors(Class'Scorch', Sch)
			Sch.Destroy();
	}
}

simulated function SetTimeOut(float time, byte i, optional bool isClient)
{
	if (time <= 0)
		return;
	
	if (i >= ArrayCount(TimeOutSets))
		i = ArrayCount(TimeOutSets) - 1;
	
	TimeOutSets[i].isEnabled = True;
	TimeOutSets[i].TimeOutCounter = time;
	TimeOutSets[i].bClient = isClient;
}

simulated function Tick(float Delta)
{
local byte i;

	//Timeouts
	for (i = 0; i < ArrayCount(TimeOutSets); i++)
	{
		if (TimeOutSets[i].isEnabled)
		{
			TimeOutSets[i].TimeOutCounter -= Delta;
			if (TimeOutSets[i].TimeOutCounter <= 0)
			{
				TimeOutSets[i].isEnabled = False;
				if ((TimeOutSets[i].bClient && Level.NetMode != NM_DedicatedServer) || (!TimeOutSets[i].bClient && Role == ROLE_Authority))
					ActivateTimeOut(i);
			}
		}
	}

	if (Role == ROLE_Authority)
	{
		//Shockwave damage update
		ShockDmgUpdate += Delta;
		if (ShockDmgUpdate >= ShockwaveDmgUpdateTime)
		{
			GiveRadialDamage(ShockDmgUpdate, ShockwaveBaseDamage, ShockRadius, ShockTime, ShockMomentum, ShockDmgType, 
				ShockRadialDmgType, ShockCount, ShockwaveDmgTransparencyDist, ShockwaveMufflingFactor, NucleusRadius, True);
			ShockDmgUpdate = 0.0;
		}
			
		//Nucleus damage update
		NucleusDmgUpdate += Delta;
		if (NucleusDmgUpdate >= NucleusDmgUpdateTime)
		{
			GiveRadialDamage(NucleusDmgUpdate, NucleusBaseDamage, NucleusRadius, NucleusTime, NucleusMomentum, 
				NucleusDmgType, NucleusRadialDmgType, NucleusCount, NucleusDmgTransparencyDist, NucleusMufflingFactor);
			NucleusDmgUpdate = 0.0;
		}
	}
	
	if (Class'NWInfo'.default.enableServerNukeCrashFix && Level.NetMode != NM_DedicatedServer && NukeFloorCount > 0.0)
	{
		NukeFloorCount -= Delta;
		if (NukeFloorCount <= 0.0)
			ProcessNukeFloorTex();
	}
	if (bUpdateGroundBreaking && Level.NetMode != NM_DedicatedServer)
		UpdateGroundBreaking(Delta);
	if (bUpdateTickedEvents && Role == ROLE_Authority)
		UpdateTickedEvents(Delta);
}

simulated function UpdateGroundBreaking(float Delta);	//Implemented at subclasses (client)
function UpdateTickedEvents(float Delta);	//Implemented at subclasses (server)

function GiveRadialDamage( float Delta, int TotalDamage, float DmgRadius, float DmgTime, int DmgMomentum, name DmgType, ERadialDmg RadDmgType, 
out float DmgCounter, optional float DmgTransparencyDist, optional float DmgMufflingFactor, optional float DmgRadiusFilter, optional bool bShockwave)
{
local float curRadiusInner, curRadiusOuter;
local Decoration D;
local Pawn P;
local Trigger T;
local Projectile Pj;
local byte fxJ, dmgJ, i;
local Actor AA;

	if (DmgCounter > DmgTime || Delta <= 0.0 || TotalDamage <= 0 || DmgRadius <= 0 || DmgTime <= 0)
		return;
	
	DmgCounter += Delta;
	fxJ = 0;
	dmgJ = 0;
	
	if (bShockwave)
	{
		curRadiusInner = (DmgCounter - Delta) * DmgRadius / DmgTime;
		curRadiusOuter = DmgCounter * DmgRadius / DmgTime;
	}
	else if (bGrowingNucleus)
		curRadiusOuter = DmgCounter * (DmgRadius - MinNucleusRad) / DmgTime + MinNucleusRad;
	else
		curRadiusOuter = DmgRadius;
	
	if (curRadiusOuter <= DmgRadiusFilter && ((bShockwave && !bGrowingNucleus) || curRadiusOuter <= MinNucleusRad))
		return;
	
	if (RadDmgType == RDMG_Standard || (RadDmgType == RDMG_Auto && curRadiusOuter < RADIUSVISIBLE_LIMIT))
	{
		if (bDamageActors)
		{
			ForEach VisibleCollidingActors(Class'Actor', AA, curRadiusOuter)
			{
				if ((!ignoreDecoration || Decoration(AA) == None) && (!ignoreProjectiles || Projectile(AA) == None) && (!ignoreTriggers || Trigger(AA) == None))
				{
					EvaluateNukedActor(AA, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
				}
			}
		}
		else
		{
			if (!ignoreDecoration)
			{
				ForEach VisibleCollidingActors(Class'Decoration', D, curRadiusOuter)
					EvaluateNukedActor(D, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
			}
			
			if (!ignoreProjectiles)
			{
				ForEach VisibleCollidingActors(Class'Projectile', Pj, curRadiusOuter)
					EvaluateNukedActor(Pj, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
			}
			
			if (!ignoreTriggers)
			{
				ForEach VisibleCollidingActors(Class'Trigger', T, curRadiusOuter)
					EvaluateNukedActor(T, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
			}
			
			ForEach VisibleCollidingActors(Class'Pawn', P, curRadiusOuter)
				EvaluateNukedActor(P, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
					DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
		}
	}
	else
	{
		if (bDamageActors)
		{
			ForEach RadiusActors(Class'Actor', AA, curRadiusOuter)
			{
				if ((!ignoreDecoration || Decoration(AA) == None) && (!ignoreProjectiles || Projectile(AA) == None) && (!ignoreTriggers || Trigger(AA) == None))
				{
					EvaluateNukedActor(AA, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
				}
			}
		}
		else
		{
			if (!ignoreDecoration)
			{
				ForEach RadiusActors(Class'Decoration', D, curRadiusOuter)
					EvaluateNukedActor(D, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
			}
			
			if (!ignoreProjectiles)
			{
				ForEach RadiusActors(Class'Projectile', Pj, curRadiusOuter)
					EvaluateNukedActor(Pj, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
			}
			
			if (!ignoreTriggers)
			{
				ForEach RadiusActors(Class'Trigger', T, curRadiusOuter)
					EvaluateNukedActor(T, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
			}
					
			for (P = Level.PawnList; P != None; P = P.NextPawn)
			{
				if (VSize(P.Location - Location) <= curRadiusOuter)
					EvaluateNukedActor(P, curRadiusInner, curRadiusOuter, fxJ, dmgJ, TotalDamage, DmgRadius, 
						DmgMomentum, DmgType, RadDmgType, DmgTransparencyDist, DmgMufflingFactor, bShockwave);
			}
		}
	}
	
	if (bUseIndexedOptimization)
	{
		if (fxJ > 0)
		{
			for (i = 0; i < fxJ; i++)
				SpawnExtraFX(FXTempActors[i], Normal(FXTempActors[i].Location - Location));
		}
		
		if (dmgJ > 0)
		{
			for (i = 0; i < dmgJ; i++)
				DmgTempActors[i].TempA.TakeDamage( DmgTempActors[i].Dmg, Instigator, DmgTempActors[i].TempA.Location, DmgTempActors[i].Momen, DmgType);
		}
	}
}

function EvaluateNukedActor(Actor A, float curRadiusInner, float curRadiusOuter, out byte fxJ, out byte dmgJ, int TotalDamage, float DmgRadius, int DmgMomentum, 
name DmgType, ERadialDmg RadDmgType, optional float DmgTransparencyDist, optional float DmgMufflingFactor, optional bool bShockwave)
{
local float aDist;
local int realDmg;
local vector realMomentum, aDir;
local bool bMuffled;
local vector ShockHitLoc, ObstacleHitLoc, HitNorm;

	if ((bShockwave && VSize(A.Location - Location) < curRadiusInner) || SkipThisActor(A))
		return;
	if (RadDmgType != RDMG_Standard && (RadDmgType != RDMG_Auto || curRadiusOuter >= RADIUSVISIBLE_LIMIT) && !isCollidable(A))
		return;
	if (RadDmgType == RDMG_Auto && curRadiusOuter >= RADIUSVISIBLE_LIMIT && !FastTrace(A.Location, Location))
		return;
	if (Trigger(A) != None && Trigger(A).TriggerType != 4)
		return;
		
	bMuffled = False;
	if (RadDmgType == RDMG_SemiTransparent)
	{
		if (DmgTransparencyDist <= 0 && !FastTrace(A.Location, Location))
			return;
		
		if (!FastTrace(A.Location, Location))
		{
			Trace(ShockHitLoc, HitNorm, A.Location, Location, False);
			Trace(ObstacleHitLoc, HitNorm, Location, A.Location, False);
			
			if (VSize(ShockHitLoc - ObstacleHitLoc) > DmgTransparencyDist)
				return;
			bMuffled = True;
		}
	}
	
	if (bShockwave && bSpawnExtraShockFX && isValidFXObj(A))
	{
		if (bUseIndexedOptimization && fxJ < ArrayCount(FXTempActors))
		{
			FXTempActors[fxJ] = A;
			fxJ++;
		}
		else if (!bUseIndexedOptimization)
			SpawnExtraFX(A, Normal(A.Location - Location));
	}
	if (A.bStatic || isFriend(Pawn(A)))
		return;
	
	aDist = VSize(A.Location - Location);
	aDir = Normal(A.Location - Location);
	realDmg = getRealDamage(bShockwave, TotalDamage, DmgRadius, aDist);
	realMomentum = getRealMomentum(bShockwave, DmgMomentum, DmgRadius, aDist, aDir);
	if (bMuffled)
	{
		realDmg *= DmgMufflingFactor;
		realMomentum *= DmgMufflingFactor;
	}
	
	if (bUseIndexedOptimization && dmgJ < ArrayCount(DmgTempActors))
	{
		DmgTempActors[dmgJ].TempA = A;
		DmgTempActors[dmgJ].Dmg = realDmg;
		DmgTempActors[dmgJ].Momen = realMomentum;
		dmgJ++;
	}
	else if (!bUseIndexedOptimization)
		A.TakeDamage( realDmg, Instigator, A.Location, realMomentum, DmgType);
}

function bool SkipThisActor(actor A)
{
	return (NWWallFrag(A) != None || (A.bStatic && ignoreStaticObjects) || (Projectile(A) != None && !A.bProjTarget) || 
		CreatureChunks(A) != None || UTCreatureChunks(A) != None || Fragment(A) != None);
}

function int getRealDamage(bool bShockwave, int TotalDamage, float DmgRadius, float Dist)
{
	if (bShockwave)
		return int((DmgRadius - Dist) * TotalDamage / DmgRadius);
	return TotalDamage;
}

function vector getRealMomentum(bool bShockwave, int DmgMomentum, float DmgRadius, float Dist, vector Dir)
{
	Dir = Normal(Dir);
	if (bShockwave)
		return ((DmgRadius - Dist) * DmgMomentum / DmgRadius) * Dir;
	return (DmgMomentum * Dir);
}

function bool isCollidable(Actor A)
{
	return (A.bCollideActors || A.bCollideWorld || A.bBlockActors || A.bBlockPlayers);
}

function bool isFriend(Pawn P)
{
	return Class'NWUtils'.static.isFriend(P, Level, Instigator, savedTeam, ignoreFriends, ignoreInstigator, ownerName, Self);
}

simulated function ActivateTimeOut(byte i)
{
	if (i >= ArrayCount(TimeOutSets))
		i = ArrayCount(TimeOutSets) - 1;
	
	if (i == 0)			TriggerTimeOut0();
	else if (i == 1)	TriggerTimeOut1();
	else if (i == 2)	TriggerTimeOut2();
	else if (i == 3)	TriggerTimeOut3();
	else if (i == 4)	TriggerTimeOut4();
	else if (i == 5)	TriggerTimeOut5();
	else if (i == 6)	TriggerTimeOut6();
	else if (i == 7)	TriggerTimeOut7();
}

simulated function TriggerTimeOut0();
simulated function TriggerTimeOut1();
simulated function TriggerTimeOut2();
simulated function TriggerTimeOut3();
simulated function TriggerTimeOut4();
simulated function TriggerTimeOut5();
simulated function TriggerTimeOut6();
simulated function TriggerTimeOut7();

simulated function PlayNuclearDistSound()
{
	if (NuclearDistSnd != None && NuclearDistSndVol > 0 && NuclearDistSndRadius > 0)
	{
		PlaySound(NuclearDistSnd, SLOT_None, NuclearDistSndVol, True, NuclearDistSndRadius);
		PlaySound(NuclearDistSnd, SLOT_Interface, NuclearDistSndVol, True, NuclearDistSndRadius);
		PlaySound(NuclearDistSnd, SLOT_Misc, NuclearDistSndVol, True, NuclearDistSndRadius);
		PlaySound(NuclearDistSnd, SLOT_Talk, NuclearDistSndVol, True, NuclearDistSndRadius);
	}
}

function SpawnCorona()
{
	if (NuclearCoronaClass != None)
		Spawn(NuclearCoronaClass);
}

simulated function SpawnLight()
{
	if (Level.NetMode != NM_DedicatedServer && default.DynamicLightOn && DynamicLightClass != None)
		Spawn(DynamicLightClass);
}

function bool isValidFXObj(actor A)
{
local int i;

	if (A == None || A.bHidden || A.DrawType != DT_Mesh || NWWallFrag(A) != None)
		return False;
	
	if (Class'NaliWeapons'.default.bInvertListsProcessing)
	{
		for (i = maxFXClasses-1; i >= 0; i--)
		{
			if (ignoreExtendedFXClasses[i] != '' && A.IsA(ignoreExtendedFXClasses[i]))
				return False;
		}
	}
	else
	{
		for (i = 0; i < maxFXClasses; i++)
		{
			if (ignoreExtendedFXClasses[i] != '' && A.IsA(ignoreExtendedFXClasses[i]))
				return False;
		}
	}
	return True;
}

function SpawnExtraFX(Actor A, vector Dir)
{
local NuclearHitSmokeFX n;
local byte i;
local actor AT;
local vector HitLoc, HitNorm, SpawnMaxVect;

	if (A != None && VSize(Dir) > 0 && A.CollisionRadius > 0 && A.CollisionHeight > 0 && A.bCollideWorld)
	{
		for (i = 0; i < ExtraShockFXAmount; i++)
		{
			SpawnMaxVect = A.Location + (A.CollisionHeight-1)*vect(0,0,-1);
			AT = Trace( HitLoc, HitNorm, SpawnMaxVect, A.Location, False);
			if (AT == None)
				HitLoc = SpawnMaxVect;
				
			n = Spawn(Class'NuclearHitSmokeFX',,, HitLoc);
			if (n != None)
			{
				n.ServerSetSmkProperties(
					FMin(A.CollisionRadius*(i+1)*3, ShockRadius/ShockTime) * Dir, 
					(A.CollisionRadius/64.0) * (i+1) / 3, 
					(A.CollisionRadius/64.0) * (i+1) / 3, 
					True
				);
			}
		}
	}
}

function setShockDmgType(name newDmgType)
{
	ShockDmgType = newDmgType;
}

function setNucleusDmgType(name newDmgType)
{
	NucleusDmgType = newDmgType;
}


static function ERadialDmg GetERadialDmgFromByte(byte n)
{
	if (n == 0)		return ERadialDmg.RDMG_Standard;
	if (n == 1)		return ERadialDmg.RDMG_Auto;
	if (n == 2)		return ERadialDmg.RDMG_SemiTransparent;
	if (n == 3)		return ERadialDmg.RDMG_Transparent;
	return ERadialDmg.RDMG_Standard;
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'UnrealShare.BarrelM'
	Style=STY_Translucent
	bUnlit=True
	bMeshEnviroMap=True
	Texture=TranslucInvis
	RemoteRole=ROLE_SimulatedProxy
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Mass=0.000000
	bNetTemporary=False
	bAlwaysRelevant=True
	ShockwaveFXClass=Class'NWShockwave'
	NukeFloorCount=0.100000
	
	DynamicLightOn=True
	bSpawnExtraShockFX=True
	ExtraShockFXAmount=5
	ignoreStaticObjects=True
	ignoreFriends=True
	ignoreDecoration=False
	ignoreProjectiles=False
	ignoreTriggers=False
	ignoreInstigator=False
	ShockRadialDmgType=RDMG_Auto
	ShockwaveBaseDamage=1000
	ShockwaveDmgUpdateTime=0.050000
	ShockwaveDmgTransparencyDist=256.000000
	ShockwaveMufflingFactor=0.850000
	NucleusRadialDmgType=RDMG_Auto
	NucleusBaseDamage=10000
	NucleusDmgUpdateTime=0.100000
	NucleusDmgTransparencyDist=256.000000
	NucleusMufflingFactor=0.850000

	ShockwaveDmgUpdateTime=0.050000
	NucleusDmgUpdateTime=0.200000
	
	
	bUseIndexedOptimization=True
	enableVisibleShockwave=False
	bDamageActors=False
	
	ignoreExtendedFXClasses(0)=ScriptedPawn
	ignoreExtendedFXClasses(1)=sgBuilding
	
	enableNukeDebrisWaterFX=False
}
