//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Vortex
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortex expands Cybot;

#exec MESH IMPORT MESH=CybVortex ANIVFILE=MODELS\CybVortex_a.3d DATAFILE=MODELS\CybVortex_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybVortex STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVortex X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybVortex SEQ=All STARTFRAME=0 NUMFRAMES=42
#exec MESH SEQUENCE MESH=CybVortex SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybVortex SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybVortex SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//Rotating
#exec MESH SEQUENCE MESH=CybVortex SEQ=RotateOnce STARTFRAME=21 NUMFRAMES=21 RATE=21.0
#exec MESH SEQUENCE MESH=CybVortex SEQ=RotateLoop STARTFRAME=21 NUMFRAMES=20 RATE=21.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybVortex MESH=CybVortex
#exec MESHMAP SCALE MESHMAP=CybVortex X=0.05 Y=0.05 Z=0.1

#exec AUDIO IMPORT NAME="CybVXAmb" FILE=SOUNDS\CybVXAmb.wav GROUP="Loop"


struct ElecGravFX
{
	var() class<CybVortexElectricA> ElectricFXClass;
	var() rotator ElectricFXRotOffset;
	var CybVortexElectricA ElectricFX;
};

var() ElecGravFX ElectricGravFX[16];
var() float PullStrength;
var() float AffectedRadius, KillRadius;
var() float FlowRotational;

var() class<NWCoronaFX> VortexCoronaClass[4];
var NWCoronaFX VortexCorona;

var() class<CybVortexInFXRed> VortexVaccumFXClass[4];
var() float ZMaxVacuumTracing;
var() byte ammoutOfFXTraces;

var() class<CybVXDischargeRed> ElectricalDischargeClass[4];
var() class<CybVXDischargeRedEnd> ElectricCorClass[4];
var() float DischargeOdds;
var() float DischargeDist;

var byte iCount;


function InitiateLifeline()
{
local CybLifeline CL;

	if (MasterPawn == None || Class'CybotLauncher'.default.VortexMaxLifeSpan <= 0.0)
		return;
	CL = Spawn(Class'CybLifeline');
	CL.InitLifeline(Self, Class'CybotLauncher'.default.VortexMaxLifeSpan);
}

function SpawnFX()
{
local byte i;

	for (i = 0; i < ArrayCount(ElectricGravFX); i++)
	{
		if (ElectricGravFX[i].ElectricFXClass != None)
		{
			ElectricGravFX[i].ElectricFX = Spawn(ElectricGravFX[i].ElectricFXClass, Self,, Location, Rotation + ElectricGravFX[i].ElectricFXRotOffset);
			ElectricGravFX[i].ElectricFX.SetTeam(myTeam);
		}
	}
	
	if (myTeam < 4 && VortexCoronaClass[myTeam] != None)
		VortexCorona = Spawn(VortexCoronaClass[myTeam]);
}

function ToSleep()
{
local byte i;

	for (i = 0; i < ArrayCount(ElectricGravFX); i++)
	{
		if (ElectricGravFX[i].ElectricFX != None)
			ElectricGravFX[i].ElectricFX.Destroy();
		ElectricGravFX[i].ElectricFX = None;
	}
	
	if (VortexCorona != None)
		VortexCorona.Destroy();
	VortexCorona = None;
		
	SetTimer(0.0, False);
}

function PlayRotation(float rate, optional bool bLoop)
{
	if (bLoop)
		LoopAnim('RotateLoop', rate);
	else
		PlayAnim('RotateOnce', rate);
}

simulated function Destroyed()
{
local byte i;

	for (i = 0; i < ArrayCount(ElectricGravFX); i++)
	{
		if (ElectricGravFX[i].ElectricFX != None)
			ElectricGravFX[i].ElectricFX.Destroy();
		ElectricGravFX[i].ElectricFX = None;
	}
	
	if (VortexCorona != None)
		VortexCorona.Destroy();
	VortexCorona = None;
	
	Super.Destroyed();
}

function Timer()
{
local Actor A;
local float QRadius, QForce, QDist, QSpeed;
local vector FlowDir;
local rotator rr;
local byte i;
local Pawn Pn;
local CybVXDischargeRed discharge;
local CybVXDischargeRedEnd dischargeCor;
local vector HitLoc, HitNorm, HitEnd;

	//Vortex pulling
	QRadius = AffectedRadius;
	ForEach VisibleCollidingActors( Class'Actor', A, QRadius)
	{
		if (!A.bStatic && !A.IsA('CTFFlag') && !A.IsA('Projectile') && A.Physics != PHYS_None && A.Physics != PHYS_Rotating && !isFriend(A))
		{
			QDist = VSize(Location - A.Location);
			QForce = PullStrength / A.Mass;
			QSpeed = (QRadius - QDist) * QForce / QRadius;
			//FlowDir = Normal(Location - A.Location);
			FlowDir = (Normal(Location - A.Location) >> (FlowRotational*(VSize(Location - A.Location)/AffectedRadius)*rot(0,1,0)));
				
			if (A.Physics == PHYS_Projectile)
			{
				if (VSize(A.Velocity) < QSpeed)
				{
					if (Pawn(A) != None)
						Pawn(A).AddVelocity(QSpeed * FlowDir);
					else
						A.Velocity += (QSpeed * FlowDir);
				}
			}
			else if (Pawn(A) != None)
				Pawn(A).AddVelocity(QSpeed * FlowDir);
			else
				A.Velocity += (QSpeed * FlowDir);
			
			if (VSize(A.Location - Location) <= KillRadius)
			{
				if (A.IsA('Inventory') && VSize(A.Velocity) > 0)
				{
					A.Destroy();
					A = None;
				}
				else
					A.TakeDamage(Class'CybotLauncher'.default.VortexBaseDamage, MasterPawn, 
						A.Location, PullStrength * Normal(A.Location - Location), 'GravityVacuum');
			}
		}
		else if (VSize(A.Location - Location) <= KillRadius && A != Self && !isFriend(A))
			A.TakeDamage(Class'CybotLauncher'.default.VortexBaseDamage, MasterPawn, 
				A.Location, PullStrength * Normal(A.Location - Location), 'GravityVacuum');
	}
	
	//FX Tracing Spawning
	if (myTeam < 4 && VortexVaccumFXClass[myTeam] != None)
	{
		for (i = 0; i < ammoutOfFXTraces; i++)
		{
			rr.Yaw = Rand(16384)*4;
			rr.Pitch = (2*FRand()*ZMaxVacuumTracing*16384.f) - (16384*ZMaxVacuumTracing);
			Spawn(VortexVaccumFXClass[myTeam],,, Location, rr);
		}
	}
	
	//Enemy awareness
	iCount++;
	if (iCount >= 2)
	{
		iCount = 0;
		ForEach VisibleCollidingActors(Class'Pawn', Pn, FMax(1.0, AffectedRadius*2.0))
		{
			if (!isFriend(Pn))
				Pn.Enemy = Self;
		}
	}
	
	//Discharges
	if (FRand() <= DischargeOdds && myTeam < 4 && ElectricalDischargeClass[myTeam] != None)
	{
		HitEnd = Location + VRand()*DischargeDist;
		A = Trace( HitLoc, HitNorm, HitEnd, Location, False);

		if (A != None)
		{
			discharge = Spawn(ElectricalDischargeClass[myTeam],,, Location, rotator(HitLoc - Location));
			discharge.AdjustSize(VSize(Location - HitLoc));
			
			if (ElectricCorClass[myTeam] != None)
			{
				dischargeCor = Spawn(ElectricCorClass[myTeam],,, HitLoc + HitNorm);
				dischargeCor.AdjustSize(discharge.DrawScale);
			}
			
			Spawn(Class'CybVXFragSpot', Self,, HitLoc + (HitNorm*5), rotator(HitNorm));
		}
	}
}


// --------- BOOT UP --------------
state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, Died;

Begin:
	SpawnFX();
	if (Class'CybotLauncher'.default.VortexHealth > 0)
		Health = Class'CybotLauncher'.default.VortexHealth;
	PlayRotation(1.0, True);
	SetTimer(0.1, True);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybVortex
	
	CollisionHeight=12.000000
	CollisionRadius=12.000000
	MultiSkins(1)=CybotSk
	
	CoreSkinN=2
	MultiSkins(2)=CybotCoreRed
	
	CybFXCoronas(0)=(CoronaClass=Class'CybVortexCoronas',hasExtras=True,isTeamCenter=False,isTeamRing=True,bFlicker=False)
	CybFXCoronas(1)=(CoronaClass=Class'CybVortexCoronas',hasExtras=False,isTeamCenter=True,isTeamRing=False,bFlicker=True)
	
	Health=2500
	WaterDmg=0
	ElectricDmgFactor=0.500000
	
	TransformAnim=Transform
	TransformRate=5.000000
	NextStateFromTransform=BootUp
	TransformSnd=CybTransformSnd
	
	RotationRate=(Pitch=0,Yaw=0,Roll=0)
	bStationary=True
	
	PullStrength=175000.000000
	AffectedRadius=2048.000000
	KillRadius=200.000000
	FlowRotational=5000.000000
	
	ElectricGravFX(0)=(ElectricFXClass=Class'CybVortexElectricA',ElectricFXRotOffset=(Yaw=0))
	ElectricGravFX(1)=(ElectricFXClass=Class'CybVortexElectricA',ElectricFXRotOffset=(Yaw=16384))
	ElectricGravFX(2)=(ElectricFXClass=Class'CybVortexElectricA',ElectricFXRotOffset=(Yaw=32768))
	ElectricGravFX(3)=(ElectricFXClass=Class'CybVortexElectricA',ElectricFXRotOffset=(Yaw=49152))
	ElectricGravFX(4)=(ElectricFXClass=Class'CybVortexElectricARev',ElectricFXRotOffset=(Yaw=0))
	ElectricGravFX(5)=(ElectricFXClass=Class'CybVortexElectricARev',ElectricFXRotOffset=(Yaw=16384))
	ElectricGravFX(6)=(ElectricFXClass=Class'CybVortexElectricARev',ElectricFXRotOffset=(Yaw=32768))
	ElectricGravFX(7)=(ElectricFXClass=Class'CybVortexElectricARev',ElectricFXRotOffset=(Yaw=49152))
	
	ElectricGravFX(8)=(ElectricFXClass=Class'CybVortexElectricB',ElectricFXRotOffset=(Yaw=0))
	ElectricGravFX(9)=(ElectricFXClass=Class'CybVortexElectricB',ElectricFXRotOffset=(Yaw=16384))
	ElectricGravFX(10)=(ElectricFXClass=Class'CybVortexElectricB',ElectricFXRotOffset=(Yaw=32768))
	ElectricGravFX(11)=(ElectricFXClass=Class'CybVortexElectricB',ElectricFXRotOffset=(Yaw=49152))
	ElectricGravFX(12)=(ElectricFXClass=Class'CybVortexElectricBRev',ElectricFXRotOffset=(Yaw=0))
	ElectricGravFX(13)=(ElectricFXClass=Class'CybVortexElectricBRev',ElectricFXRotOffset=(Yaw=16384))
	ElectricGravFX(14)=(ElectricFXClass=Class'CybVortexElectricBRev',ElectricFXRotOffset=(Yaw=32768))
	ElectricGravFX(15)=(ElectricFXClass=Class'CybVortexElectricBRev',ElectricFXRotOffset=(Yaw=49152))
	
	VortexCoronaClass(0)=Class'CybVortexCorRed'
	VortexCoronaClass(1)=Class'CybVortexCorBlue'
	VortexCoronaClass(2)=Class'CybVortexCorGreen'
	VortexCoronaClass(3)=Class'CybVortexCorYellow'
	
	VortexVaccumFXClass(0)=Class'CybVortexInFXRed'
	VortexVaccumFXClass(1)=Class'CybVortexInFXBlue'
	VortexVaccumFXClass(2)=Class'CybVortexInFXGreen'
	VortexVaccumFXClass(3)=Class'CybVortexInFXYellow'
	
	ElectricalDischargeClass(0)=Class'CybVXDischargeRed'
	ElectricalDischargeClass(1)=Class'CybVXDischargeBlue'
	ElectricalDischargeClass(2)=Class'CybVXDischargeGreen'
	ElectricalDischargeClass(3)=Class'CybVXDischargeYellow'
	ElectricCorClass(0)=Class'CybVXDischargeRedEnd'
	ElectricCorClass(1)=Class'CybVXDischargeBlueEnd'
	ElectricCorClass(2)=Class'CybVXDischargeGreenEnd'
	ElectricCorClass(3)=Class'CybVXDischargeYellowEnd'
	DischargeOdds=0.500000
	DischargeDist=1500.000000
	
	ZMaxVacuumTracing=0.250000
	ammoutOfFXTraces=2
	
	AmbientSound=CybVXAmb
	SoundVolume=255
	SoundRadius=255
	SoundPitch=64
	
	MyModel="Vortex"
}
