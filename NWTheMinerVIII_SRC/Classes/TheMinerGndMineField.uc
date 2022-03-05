//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////

class TheMinerGndMineField expands NaliWActor;

#exec AUDIO IMPORT NAME="MineFieldDeploy" FILE=SOUNDS\MineFieldDeploy.wav GROUP="TheMiner"


var() float StartTime, MineSpreadTime;
var() sound AppearSnd;

enum MSpreadState
{
	MSS_Start,
	MSS_Spreading
};
var MSpreadState MineSpreadState;

var float tCount;

var() float MineSpreadRate;
var() int MineSpreadMax;
var() float MineSpreadEvalMaxHeight, MineSpreadMaxRadius, MineSpreadMinRadius;

var() float MinesMinLifeSpan, MinesMaxLifeSpan, MinesDmgRadius;
var() int MinesHealth, MinesDamage;

var() float MineSpawnDist;
var vector lastMineLayPoints[48], lastMineLayNormals[48];
var int lastCMine;


replication
{
	reliable if (Role == ROLE_Authority)
		MineSpreadTime;
}


function PreBeginPlay()
{
	if (Class'TheMiner'.default.OversurrectionLifeTime > 0.0)
		MineSpreadTime = Class'TheMiner'.default.OversurrectionLifeTime;
	if (Class'TheMiner'.default.OversurrectionSpreadRate > 0.0)
		MineSpreadRate = Class'TheMiner'.default.OversurrectionSpreadRate;
	if (Class'TheMiner'.default.OversurrectionSpreadMax > 0)
		MineSpreadMax = Class'TheMiner'.default.OversurrectionSpreadMax;
	if (Class'TheMiner'.default.OversurrectionSpreadEvalMaxH > 0.0)
		MineSpreadEvalMaxHeight = Class'TheMiner'.default.OversurrectionSpreadEvalMaxH;
	if (Class'TheMiner'.default.OversurrectionSpreadMaxRadius > 0.0)
		MineSpreadMaxRadius = Class'TheMiner'.default.OversurrectionSpreadMaxRadius;
	if (Class'TheMiner'.default.OversurrectionSpreadMinRadius > 0.0)
		MineSpreadMinRadius = Class'TheMiner'.default.OversurrectionSpreadMinRadius;
	if (Class'TheMiner'.default.OversurrectionMinesMinLifespan > 0.0)
		MinesMinLifeSpan = Class'TheMiner'.default.OversurrectionMinesMinLifespan;
	if (Class'TheMiner'.default.OversurrectionMinesMaxLifespan > 0.0)
		MinesMaxLifeSpan = Class'TheMiner'.default.OversurrectionMinesMaxLifespan;
	if (Class'TheMiner'.default.OversurrectionMinesDmgRadius > 0.0)
		MinesDmgRadius = Class'TheMiner'.default.OversurrectionMinesDmgRadius;
	if (Class'TheMiner'.default.OversurrectionMinesHealth > 0)
		MinesHealth = Class'TheMiner'.default.OversurrectionMinesHealth;
	if (Class'TheMiner'.default.OversurrectionMinesDamage > 0)
		MinesDamage = Class'TheMiner'.default.OversurrectionMinesDamage;
		
	Class.default.MinesMinLifeSpan = MinesMinLifeSpan;
	default.MinesMinLifeSpan = MinesMinLifeSpan;
	Class.default.MinesMaxLifeSpan = MinesMaxLifeSpan;
	default.MinesMaxLifeSpan = MinesMaxLifeSpan;
	Class.default.MinesDmgRadius = MinesDmgRadius;
	default.MinesDmgRadius = MinesDmgRadius;
	Class.default.MinesHealth = MinesHealth;
	default.MinesHealth = MinesHealth;
	Class.default.MinesDamage = MinesDamage;
	default.MinesDamage = MinesDamage;
		
	MineSpreadTime -= StartTime;
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	InitMineSpread();
	Super.PostBeginPlay();
}

simulated function InitMineSpread()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		Spawn(Class'TheMinerGndMineFieldInitLight');
		Spawn(Class'TheMinerGndMineFieldInitLine');
		Spawn(Class'TheMinerGndMineFieldInitShake');
	}
	
	SetTimer(1/MineSpreadRate, False);
	DoSound(AppearSnd);
}

function DoSound(sound Snd)
{
	if (Snd != None)
		PlaySound(Snd,, 200,, 6000);
}

simulated function Timer()
{
local int i, locInd, mineSpreadAmount;
local vector hLoc, pLoc, pNorm, rLoc, rhLoc, rrLoc;
local vector HitLoc, HitNorm, hHitLoc, hHitNorm;
local actor A, hA;
local float rhMax;

	if (Role == ROLE_Authority)
	{
		mineSpreadAmount = Rand(MineSpreadMax);
		for (i = 0; i < mineSpreadAmount; i++)
		{
			//Get origin point and orientation
			locInd = Rand(ArrayCount(lastMineLayPoints) + 1);
			if (locInd == ArrayCount(lastMineLayPoints) || lastMineLayPoints[locInd] == vect(0,0,0))
			{
				pLoc = Location;
				pNorm = vector(Rotation);
			}
			else
			{
				pLoc = lastMineLayPoints[locInd];
				pNorm = lastMineLayNormals[locInd];
			}
			
			//Evaluate space
			pLoc += pNorm;
			hLoc = pLoc + MineSpreadEvalMaxHeight * pNorm;
			A = Trace(HitLoc, HitNorm, hLoc, pLoc, False);
			if (A != None)
				hLoc = HitLoc + HitNorm;
				
			rLoc = getRandomRadialPosOffset(MineSpreadMaxRadius, rotator(pNorm), MineSpreadMinRadius);
			rhMax = Sqrt((MineSpreadMaxRadius**2) - (VSize(rLoc)**2));
			rrLoc = hLoc + rLoc;
			A = Trace(HitLoc, HitNorm, rrLoc, hLoc, False);
			if (A != None)
				rrLoc = HitLoc + HitNorm;
			
			rhLoc = rrLoc;
			if (FRand() > 0.75)
				rhLoc += (pNorm * rhMax);
			else
				rhLoc -= (pNorm * rhMax);
			hA = Trace(hHitLoc, hHitNorm, rhLoc, rrLoc, False);
			if (hA != None)
			{
				rhLoc = hHitLoc + hHitNorm;
				if (FRand() > 0.35)
				{
					SpawnMine(hHitLoc + hHitNorm, hHitNorm, hHitNorm.Z < 0.7);
					lastMineLayPoints[lastCMine % ArrayCount(lastMineLayPoints)] = hHitLoc;
					lastMineLayNormals[lastCMine % ArrayCount(lastMineLayNormals)] = hHitNorm;
					lastCMine++;
					continue;
				}
			}
				
			//Direct radial approach
			A = Trace(HitLoc, HitNorm, hLoc + Normal((rrLoc + (rhLoc - rrLoc)*FRand()) - hLoc)*MineSpreadMaxRadius, hLoc, False);
			if (A != None)
			{
				SpawnMine(HitLoc + HitNorm, HitNorm, HitNorm.Z < 0.7);
				lastMineLayPoints[lastCMine % ArrayCount(lastMineLayPoints)] = HitLoc;
				lastMineLayNormals[lastCMine % ArrayCount(lastMineLayNormals)] = HitNorm;
				lastCMine++;
			}
			else if (hA != None)
			{
				SpawnMine(hHitLoc + hHitNorm, hHitNorm, hHitNorm.Z < 0.7);
				lastMineLayPoints[lastCMine % ArrayCount(lastMineLayPoints)] = hHitLoc;
				lastMineLayNormals[lastCMine % ArrayCount(lastMineLayNormals)] = hHitNorm;
				lastCMine++;
			}
		}
		
		SetTimer(1/MineSpreadRate, False);
	}
}

simulated function Tick(float Delta)
{
local float fin, fout;

	tCount += Delta;
	if (MineSpreadState == MSS_Start)
	{
		if (Level.NetMode != NM_DedicatedServer)
		{
			fin = (StartTime - tCount)/StartTime;
			fout = tCount/StartTime;
			LightRadius = Byte(fout * default.LightRadius);
			if (fin < 0.2)
				LightBrightness = Byte(fin * default.LightBrightness / 0.2);
		}
		
		if (tCount >= StartTime)
		{
			MineSpreadState = MSS_Spreading;
			SetTimer(1/MineSpreadRate, False);
			tCount = 0.0;
			LightType = LT_None;
		}
	}
	else if (MineSpreadState == MSS_Spreading && tCount >= MineSpreadTime)
		Destroy();
}

simulated function vector getRandomRadialPosOffset(float maxRadius, rotator Rot, optional float minRadius)
{
local rotator R;
local vector V;
	
	R.Roll = int(FRand()*65536 - 32768);
	V.Z = (FRand()*(maxRadius - minRadius) + minRadius);
	return ((V >> R) >> Rot);
}

function SpawnMine(vector Loc, vector Norm, optional bool bHide)
{
local rotator R;
local FOversMine fom;

	R = rotator(-Norm);
	R.Roll = Int(FRand()*65536 - 32768);
	Spawn(Class'TheMinerGndMineSpawnLight',,, Loc + Norm);
	fom = Spawn(Class'FOversMine',,, Loc + Norm*MineSpawnDist, R);
	if (fom != None)
	{
		fom.Instigator = None;
		fom.myInstig = Instigator;
	}
}


defaultproperties
{
	DrawType=DT_Sprite
	Texture=MineBeacon
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	bHidden=True
	
	StartTime=2.000000
	MineSpreadTime=25.000000
	AppearSnd=MineFieldDeploy
	MineSpawnDist=48.000000
	
	LightType=LT_Steady
	LightEffect=LE_Shell
	LightRadius=255
	LightBrightness=255
	LightHue=127
	LightSaturation=0
	
	MineSpreadRate=10.000000
	MineSpreadMax=6
	MineSpreadEvalMaxHeight=384.000000
	MineSpreadMaxRadius=2048.000000
	MineSpreadMinRadius=384.000000
	
	MinesMinLifeSpan=15.000000
	MinesMaxLifeSpan=45.000000
	MinesDmgRadius=384.000000
	MinesHealth=200
	MinesDamage=500
}
