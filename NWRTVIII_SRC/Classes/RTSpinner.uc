//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTSpinner expands NaliProjectile;

#exec MESH IMPORT MESH=RTSpinner ANIVFILE=MODELS\RTSpinner_a.3d DATAFILE=MODELS\RTSpinner_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTSpinner STRENGTH=0.15
#exec MESH ORIGIN MESH=RTSpinner X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTSpinner SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTSpinner SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=RTSpinner MESH=RTSpinner
#exec MESHMAP SCALE MESHMAP=RTSpinner X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=Sk_RTSpinner FILE=SKINS\Sk_RTSpinner.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RTSpinner NUM=1 TEXTURE=Sk_RTSpinner

#exec AUDIO IMPORT NAME="RTSpinnerAmb" FILE=SOUNDS\RTSpinnerAmb.wav GROUP="Surrection"


var() float SpinRate;
var() float TargetCheckRadius;
var() float RestartKillingDelay, TargetDetectRetryDelay;
var() float MaxTargetDistance, MaxWanderDistance;

var() sound GibSnd[2], HeadshotGibSnd[2];

var vector resetPosOffset;
var Pawn CurPTarget;
var float killDelayCount, retryDelayCount;
var float CurYawOffset;
var rotator StartingRot;
var vector curVel, syncLoc;
var byte syncLocStatus, clientLocStatus;
var int RealRotYaw, RealRotPitch;

enum EKillState
{
	KS_InitStation,
	KS_KillStart,
	KS_EndStation
};
var EKillState KillState;


replication
{
	reliable if (Role == ROLE_Authority)
		KillState, resetPosOffset, CurPTarget, syncLoc, syncLocStatus, curVel;
	unreliable if (Role == ROLE_Authority)
		RealRotYaw, RealRotPitch;
}


function InitRotStationary(int i, float distOffset)
{
local rotator R;

	TeleportTo(Location,, True);
	SetVel(vect(0,0,0));
	Acceleration *= 0;
	R.Yaw = (i * 8192);
	resetPosOffset = ((vect(1,0,0)*distOffset) >> R);
	KillState = KS_InitStation;
	RealRotYaw = Rotation.Yaw;
	RealRotPitch = Rotation.Pitch;
	StartingRot = Rotation;
}

function Release()
{
	KillState = KS_KillStart;
	killDelayCount = RestartKillingDelay;
	if (Owner != None)
		TeleportTo(Location, Normal(Location - Owner.Location));
}

function ReturnRotStationary()
{
	KillState = KS_EndStation;
	killDelayCount = RestartKillingDelay;
	RealRotYaw = StartingRot.Yaw;
	RealRotPitch = StartingRot.Pitch;
	if (Owner != None)
		TeleportTo(Owner.Location + (resetPosOffset >> Owner.Rotation), Normal(resetPosOffset >> Owner.Rotation),, True);
	SetVel(vect(0,0,0));
}

function Pawn GetNextPTarget()
{
local Pawn P, PList[48];
local byte i;

	for (P = Level.PawnList; P != None; P = P.NextPawn)
	{
		if (VSize(P.Location - Location) <= TargetCheckRadius && isValidPawn(P) && FastTrace(P.Location, Location) && !noHurtThisPawn(P))
			PList[i++] = P;
		if (i >= ArrayCount(PList))
			break;
	}
	
	if (i == 0)
		return None;
	return PList[Rand(i)];
}

function TeleportTo(vector newLoc, optional vector newDir, optional bool bStart, optional bool bEnd)
{
local vector OLoc;
local RTOversurSpinnerCor rtCor;

	rtCor = Spawn(Class'RTOversurSpinnerCor');
	rtCor.MakeSound(Byte(bStart)*0.5);
	if (bStart)
		rtCor.SetMaster(Self);
	Spawn(Class'RTOversurSpinnerCorLine');
	Spawn(Class'RTTeleSpinnerShake');
	
	OLoc = Location;
	SetLocation(newLoc);
	syncLoc = newLoc;
	syncLocStatus++;
	
	if (VSize(newDir) > 0.0)
		SetDirection(newDir);
	
	if (OLoc != Location)
	{
		rtCor = Spawn(Class'RTOversurSpinnerCor');
		rtCor.MakeSound(Byte(bEnd)*0.5);
		if (bEnd)
			rtCor.SetMaster(Self);
		Spawn(Class'RTOversurSpinnerCorLine');
		Spawn(Class'RTTeleSpinnerShake');
	}
}

function SetDirection(vector newDir)
{
	SetRot(newDir);
	SetVel(newDir * MaxSpeed);
}

function SetVel(vector newVel)
{
	Velocity = newVel;
	curVel = newVel;
}

function SetRot(vector dir)
{
local rotator R;

	R = rotator(dir);
	RealRotYaw = R.Yaw;
	RealRotPitch = R.Pitch;
}

simulated function bool isValidPawn(Pawn P)
{
	return (P != None && !P.bDeleteMe && P.Health > 0 && !P.bHidden && P.bCollideActors && P.bBlockActors);
}

function PrepareTargetSeek(Pawn Tget, out vector newLoc, out vector newDir)
{
local vector headLoc;

	if (Tget == None || Tget.bDeleteMe)
	{
		newLoc *= 0;
		newDir *= 0;
		return;
	}
	
	headLoc = Tget.Location + 0.8*Tget.CollisionHeight*vect(0,0,1);
	newLoc = GetRandomLoc(MaxTargetDistance, headLoc);
	newDir = Normal(headLoc - newLoc);
}

function vector GetRandomLoc(float maxDist, vector origLoc, optional vector inflDir, optional float distCoef)
{
local vector HitLoc, HitNorm, TEnd;
local Actor A;
local byte i, max_tries;

	if (maxDist <= 0.0)
		return vect(0,0,0);

	do
	{
		TEnd = origLoc + maxDist*VRand();
		TEnd += (inflDir * maxDist * 2);
		A = Trace(HitLoc, HitNorm, TEnd, origLoc, False);
		if (A == None)
		{
			HitLoc = TEnd;
			HitNorm = Normal(origLoc - TEnd);
		}
		i++;
	}
	until (VSize(HitLoc - origLoc) > 32.0 || i >= 3)
	
	if (VSize(HitLoc - origLoc) <= 32.0 && VSize(inflDir) > 0.0)
	{
		TEnd = origLoc + maxDist*inflDir + VRand()*maxDist/10;
		A = Trace(HitLoc, HitNorm, TEnd, origLoc, False);
		if (A == None)
		{
			HitLoc = TEnd;
			HitNorm = Normal(origLoc - TEnd);
		}
	}
	
	if (distCoef == 0.0)
		distCoef = 1.0;
	return (origLoc + (HitLoc - origLoc)*distCoef - HitNorm*5);
}

function SetupNewPath(optional vector inflDir)
{
local vector newLoc, newDir;

	if (isValidPawn(CurPTarget))
	{
		PrepareTargetSeek(CurPTarget, newLoc, newDir);
		TeleportTo(newLoc, newDir);
	}
	else
	{
		TeleportTo(GetRandomLoc(MaxWanderDistance, Location, inflDir, 0.5), VRand());
		killDelayCount = TargetDetectRetryDelay;
	}
}

simulated function UpdateClientStatus()
{
local rotator R, RReal;
local vector dir;
	
	if (Level.NetMode == NM_StandAlone || Role < ROLE_Authority)
	{
		RReal.Yaw = RealRotYaw;
		RReal.Pitch = RealRotPitch;
		R.Yaw = Int(CurYawOffset);
		SetRotation(Class'NWUtils'.static.rTurn(RReal, R));
	}
	
	if (Role == ROLE_Authority)
		return;
	
	if (syncLocStatus != clientLocStatus)
	{
		SetLocation(syncLoc);
		clientLocStatus = syncLocStatus;
		bHidden = False;
	}
	
	if (isValidPawn(CurPTarget))
	{
		dir = Normal(CurPTarget.Location - Location);
		Velocity = VSize(curVel) * dir;
		RReal = rotator(dir);
		SetRotation(Class'NWUtils'.static.rTurn(RReal, R));
	}
	else
		Velocity = curVel;
}


simulated function Tick(float Delta)
{
	UpdateClientStatus();
	if (Role == ROLE_Authority && KillState == KS_KillStart)
	{
		if (killDelayCount > 0.0)
		{
			killDelayCount -= Delta;
			if (killDelayCount <= 0.0)
			{
				CurPTarget = GetNextPTarget();
				SetupNewPath();
			}
		}
		
		if (isValidPawn(CurPTarget))
			SetDirection(Normal(CurPTarget.Location + 0.8*CurPTarget.CollisionHeight*vect(0,0,1) - Location));
		else
			SetRot(Normal(Velocity));
	}
	
	if (Owner != None && (KillState == KS_InitStation || KillState == KS_EndStation))
		SetLocation(Owner.Location + (resetPosOffset >> Owner.Rotation));
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = default.ScaleGlow + (FRand()*0.5 - 0.25);
		CurYawOffset += Int(SpinRate * Delta);
	}
	
	Super.Tick(Delta);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
local NWKillMsgManager NWkmsg;

	if ((!CanHitInstigator || (CanHitInstigator && (Default.LifeSpan - LifeSpan) < HitInstigatorTimeOut)) && Other == Instigator)
		return;
	
	if (Role == ROLE_Authority && bDirectHit)
	{
		if (Class'RT'.static.isStaticHeadShotDmg(Other, HitLocation, Instigator))
		{
			Damage = Class'RT'.default.OversurrectionHeadshotDmg;
			MyDamageType = 'Decapitated';
			if (Other.bIsPawn)
				PlaySound(HeadshotGibSnd[Rand(ArrayCount(HeadshotGibSnd))], SLOT_Misc, 4.0);
			if (Instigator != None)
			{
				NWkmsg = Class'NWUtils'.static.getKillMsgManager(Level);
				if (NWkmsg != None)
					NWkmsg.prepareHeadshotKillMsg(Instigator, Pawn(Other), Class'RT');
			}
		}
		else
		{
			Damage = Class'RT'.default.OversurrectionNormalDmg;
			MyDamageType = default.MyDamageType;
			if (Other.bIsPawn || Carcass(Other) != None)
				PlaySound(GibSnd[Rand(ArrayCount(GibSnd))], SLOT_Misc, 4.0);
		}
		
		DirectHurtProcess(Other, HitLocation);
		if (CurPTarget == Other && !isValidPawn(CurPTarget))
		{
			CurPTarget = None;
			killDelayCount = RestartKillingDelay;
		}
	}
	
	if (!Other.bIsPawn && Triggers(Other)==None && Other.bBlockPlayers && Other.bBlockActors)
		HitWall(-1 * Normal(Velocity), Other);
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A);

simulated function HitWall(vector HitNormal, actor Wall)
{
	if (Role == ROLE_Authority)
	{
		CurPTarget = GetNextPTarget();
		SetupNewPath(HitNormal);
	}
	else
		bHidden = True;
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=RTSpinner
	Texture=RT_Metal
	
	ExplosionNoise=1.000000
	
	bBounce=False
	bNetTemporary=False
	Physics=PHYS_Projectile
	bAlwaysRelevant=True
	
	Damage=300.000000
	ExplosionDecal=None
	ImpactSound=RTSpinnerTeleport
	MaxSpeed=2000.000000
	MomentumTransfer=0
	MyDamageType=RazorCut
	speed=2000.000000
	DmgRadius=0.000000
	bDirectHit=True
	bDirectionalBlow=True
	
	TrailClass1=Class'RTSpinnerOV'
	
	bWaterHitFX=True
	WaterSplashType=2
	Mass=25.000000
	WaterSpeedScale=1.000000
	LifeSpan=10000.000000
	
	AmbientSound=RTSpinnerAmb
	SoundRadius=128
	SoundVolume=64
	SoundPitch=64
	
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	
	GibSnd(0)=RazorGib1
	GibSnd(1)=RazorGib2
	HeadshotGibSnd(0)=HeadShotRazorGib1
	HeadshotGibSnd(1)=HeadShotRazorGib2
	
	SpinRate=250000.000000
	TargetCheckRadius=30000.000000
	RestartKillingDelay=1.000000
	TargetDetectRetryDelay=2.500000
	MaxTargetDistance=1000.000000
	MaxWanderDistance=5000.000000
}
