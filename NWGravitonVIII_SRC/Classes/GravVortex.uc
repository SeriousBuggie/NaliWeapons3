//////////////////////////////////////////////////////////////
//				Feralidragon (24-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVortex expands NaliWActor;

#exec AUDIO IMPORT NAME="GravVortexAmb" FILE=SOUNDS\GravVortexAmb.wav GROUP="Vortex"
#exec AUDIO IMPORT NAME="GravVortexInit" FILE=SOUNDS\GravVortexInit.wav GROUP="Vortex"


var() float StartingTime, VortexTime, EndingTime;
var() sound InitSound;

var() float VortexPullStrength, VortexPullRadius, VortexPullRate;
var() int VortexDmg;
var() bool bUseVortexPhysics, bPullProjectiles;
var float vtxPullCount;

enum VtState
{
	VTX_Starting,
	VTX_Active,
	VTX_Ending
};
var VtState VortexState;

var() int RotParticInitAngleMax, RotParticInitAngleMin;
var() float RotParticFadeInMax, RotParticFadeInMin;
var() float RotParticRotRateMax, RotParticRotRateMin;
var() float RotParticDScaleMax, RotParticDScaleMin;
var() byte RotParticDensityMax, RotParticDensityMin;
var GravVortexRotParticles RotParticles[28];

var() float VtxSmkRate, VtxDebrisRate, VtxDebrisDist, VtxTraceFXRate;
var() int VtxSmkAmount, VtxDebrisAmount, VtxTraceFXAmount, VtxTraceFXMaxAngle;
var float vtxSmkCount, vtxDebrisCount, vtxTraceFXCount;

var GravVortexEclipse gVE;
var float tCount;


replication
{
	reliable if (Role == ROLE_Authority)
		VortexTime, VortexPullStrength, VortexPullRadius, bUseVortexPhysics, bPullProjectiles, VortexPullRate;
}

function PreBeginPlay()
{
	if (Class'Graviton'.default.OversurrectionLifeTime > 0.0)
		VortexTime = Class'Graviton'.default.OversurrectionLifeTime;
	if (Class'Graviton'.default.OversurrectivePullStrength > 0.0)
		VortexPullStrength = Class'Graviton'.default.OversurrectivePullStrength;
	if (Class'Graviton'.default.OversurrectivePullRadius > 0.0)
		VortexPullRadius = Class'Graviton'.default.OversurrectivePullRadius;
	if (Class'Graviton'.default.OversurrectivePullRate > 0.0)
		VortexPullRate = Class'Graviton'.default.OversurrectivePullRate;
	if (Class'Graviton'.default.OversurrectivePullStrength > 0.0)
		VortexPullStrength = Class'Graviton'.default.OversurrectivePullStrength;
	if (Class'Graviton'.default.OversurrectiveDamage > 0)
		VortexDmg = Class'Graviton'.default.OversurrectiveDamage;
	bUseVortexPhysics = Class'Graviton'.default.bOversurrectiveVtxPhysics;
	bPullProjectiles = Class'Graviton'.default.bOversurrectivePullProj;
	
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	if (Role == ROLE_Authority)
		InitVortex();
	Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
	InitVortex();
}

simulated function InitVortex()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		gVE = Spawn(Class'GravVortexEclipse');
		gVE.AmbientSound = AmbientSound;
		gVE.SoundVolume = SoundVolume;
		gVE.SoundRadius = SoundRadius;
		gVE.SoundPitch = SoundPitch;
		Spawn(Class'GravVtxInitShake');
		Spawn(Class'GravVtxInitCorA');
		Spawn(Class'GravVtxInitCorB');
	}
	
	DoMegaSound(InitSound);
	SetTimer(StartingTime, False);
}

simulated function Timer()
{
local int i;
local rotator R;
local GravVtxPullingShake gvtxPS;

	if (VortexState == VTX_Starting)
	{
		VortexState = VTX_Active;
		SetTimer(VortexTime, False);
		if (Level.NetMode != NM_DedicatedServer)
		{
			DrawScale = default.DrawScale;
			SoundVolume = default.SoundVolume;
			gvtxPS = Spawn(Class'GravVtxPullingShake');
			gvtxPS.SetShakeDuration(VortexTime);
			if (gVE != None)
			{
				gVE.DrawScale = gVE.default.DrawScale;
				gVE.SoundVolume = SoundVolume;
			}
			for (i = 0; i < ArrayCount(RotParticles); i++)
			{
				R = Rotation;
				R.Pitch += int(RandRange(RotParticInitAngleMin, RotParticInitAngleMax));
				R.Roll += int(RandRange(RotParticInitAngleMin, RotParticInitAngleMax));
				R = Normalize(R);
				RotParticles[i] = Spawn(Class'GravVortexRotParticles',,,, R);
				RotParticles[i].InitializeFX(RandRange(RotParticRotRateMin, RotParticRotRateMax), RandRange(RotParticFadeInMin, RotParticFadeInMax), 
					Byte(RandRange(RotParticDensityMin, RotParticDensityMax)), (i%12)+1, RandRange(RotParticDScaleMin, RotParticDScaleMax));
			}
		}
	}
	else if (VortexState == VTX_Active)
	{
		VortexState = VTX_Ending;
		SetTimer(EndingTime, False);
		for (i = 0; i < ArrayCount(RotParticles); i++)
		{
			if (RotParticles[i] != None)
				RotParticles[i].FadeOut(EndingTime);
		}
	}
	else if (VortexState == VTX_Ending)
		Destroy();
	tCount = 0.0;
}

simulated function Tick(float Delta)
{
local int i, startYaw;
local GravVortexCloudMaster vtxMaster;
local vector HitLoc, HitNorm;
local rotator R, R2, R3;
local actor A;

	tCount += Delta;
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (VortexState == VTX_Starting)
		{
			SoundVolume = Byte((tCount/StartingTime) * default.SoundVolume);
			DrawScale = (tCount/StartingTime) * default.DrawScale;
			if (gVE != None)
			{
				gVE.DrawScale = (tCount/StartingTime) * gVE.default.DrawScale;
				gVE.SoundVolume = SoundVolume;
			}
		}
		else if (VortexState == VTX_Ending)
		{
			SoundVolume = Byte(((EndingTime-tCount)/EndingTime) * default.SoundVolume);
			DrawScale = ((EndingTime-tCount)/EndingTime) * default.DrawScale;
			if (gVE != None)
			{
				gVE.DrawScale = ((EndingTime-tCount)/EndingTime) * gVE.default.DrawScale;
				gVE.SoundVolume = SoundVolume;
			}
		}
		
		if (VortexState <= VTX_Active)
		{
			vtxSmkCount += Delta;
			if (vtxSmkCount >= 1/VtxSmkRate)
			{
				vtxSmkCount = 0.0;
				startYaw = int(FRand()*65536 - 32768);
				R = rot(0,0,0);
				vtxMaster = Spawn(Class'GravVortexCloudMaster',,,, R);
				for (i = 0; i < VtxSmkAmount; i++)
				{
					R.Yaw = int(startYaw + i*65536.f/VtxSmkAmount);
					Spawn(Class'GravVortexCloud', vtxMaster,,, R);
					Spawn(Class'GravVortexCloudB', vtxMaster,,, R);
					Spawn(Class'GravVortexCloudElectric', vtxMaster,,, R);
				}
			}
		}
		
		if (VortexState == VTX_Active && tCount <= (VortexTime - Class'GravVtxFrag'.default.LifeSpan))
		{
			vtxDebrisCount += Delta;
			if (vtxDebrisCount >= 1/VtxDebrisRate)
			{
				vtxDebrisCount = 0.0;
				for (i = 0; i < VtxDebrisAmount; i++)
				{
					A = Trace(HitLoc, HitNorm, Location + VRand()*VtxDebrisDist, Location, False);
					if (A != None)
						Spawn(Class'GravVtxFragSpot', Self,, HitLoc + 5*HitNorm, rotator(HitNorm));
				}
			}
		}
		
		if (VortexState == VTX_Active && tCount <= (VortexTime - Class'GravVtxSpiralTraceFX'.default.LifeSpan))
		{
			vtxTraceFXCount += Delta;
			if (vtxTraceFXCount >= 1/VtxTraceFXRate)
			{
				vtxTraceFXCount = 0.0;
				R = rot(0,0,0);
				R2 = R;
				R3 = R;
				for (i = 0; i < VtxTraceFXAmount; i++)
				{
					R.Pitch = Rand(VtxTraceFXMaxAngle);
					R2.Roll = int(FRand()*65536 - 32768);
					R3.Roll = int(FRand()*65536 - 32768);
					Spawn(Class'GravVtxSpiralTraceFX',,,, rotator((vector(R) >> R2) >> rotator(vect(0,0,1))) + R3);
				}
			}
		}
	}
	
	if (VortexState == VTX_Active && VortexPullRate > 0.0)
	{
		vtxPullCount += Delta;
		if (vtxPullCount >= 1/VortexPullRate)
		{
			vtxPullCount -= (1/VortexPullRate);
			ProcessPullForce();
		}
	}
}

function DoSound(sound Snd)
{
	if (Snd != None)
		PlaySound(Snd,, 100,, 10000);
}

function DoMegaSound(sound Snd)
{
	if (Snd != None)
	{
		PlaySound(Snd, SLOT_None, 100,, 15000);
		PlaySound(Snd, SLOT_Misc, 100,, 15000);
	}
}

function bool isValidPawn(Pawn P)
{
	return (P != None && !P.bDeleteMe && P.Health > 0 && !P.bHidden && P.bCollideActors && P.bBlockActors);
}

function bool isFriendlyPawn(Pawn P)
{
	return Class'NWUtils'.static.isFriend(P, Level, Instigator,, True, True);
}

simulated function Touch(Actor Other)
{
	if ((bPullProjectiles && Projectile(Other) != None) || NWBodyPiece(Other) != None || Carcass(Other) != None)
	{
		Other.Destroy();
		return;
	}
	if (Role == ROLE_Authority && Other != None && Other != Instigator)
		Other.TakeDamage(VortexDmg, Instigator, Other.Location, vect(0,0,0), Class'GravBall'.default.MyDamageType);
}

simulated function ProcessPullForce()
{
local Actor A;
local float QForce, QDist, QSpeed;

	if (VortexPullRadius <= 0.0)
		return;
	ForEach RadiusActors(Class'Actor', A, VortexPullRadius)
	{
		if (!A.bStatic && (bPullProjectiles || Projectile(A) != None) && A.Physics != PHYS_None && A.Physics != PHYS_Rotating && VSize(A.Location - Location) <= VortexPullRadius && 
		(Pawn(A) == None || (Role == ROLE_Authority && isValidPawn(Pawn(A)) && !isFriendlyPawn(Pawn(A))))
		&& FastTrace(A.Location, Location))
		{
			QDist = VSize(Location - A.Location);
			QForce = VortexPullStrength;
			if (bUseVortexPhysics)
				QForce /= (A.Mass/100);
			QSpeed = (VortexPullRadius - QDist) * QForce / VortexPullRadius;

			if (A.Physics != PHYS_Projectile || VSize(A.Velocity) < QSpeed)
			{
				if (Pawn(A) != None)
					Pawn(A).AddVelocity(QSpeed * Normal(Location - A.Location));
				else
					A.Velocity += (QSpeed * Normal(Location - A.Location));
			}
			else if (A.Physics == PHYS_Projectile && Pawn(A) == None)
				A.Velocity = VSize(A.Velocity) * Normal(A.Velocity + QSpeed*Normal(Location - A.Location));
				
			if (QDist <= Sqrt((CollisionRadius**2) * 2))
				Touch(A);
		}
	}
}

simulated function Destroyed()
{
local int i;

	for (i = 0; i < ArrayCount(RotParticles); i++)
	{
		if (RotParticles[i] != None)
			RotParticles[i].Destroy();
		RotParticles[i] = None;
	}

	if (gVE != None)
		gVE.Destroy();
	gVE = None;
	
	Super.Destroyed();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GravBall
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	bMeshEnviroMap=False
	bUnlit=True
	Style=STY_Normal
	ScaleGlow=1.000000
	DrawScale=10.000000
	
	CollisionRadius=100.000000
	CollisionHeight=100.000000
	bCollideActors=True

	InitSound=GravVortexInit
	AmbientSound=GravVortexAmb
	SoundVolume=255
	SoundRadius=255
	SoundPitch=64
	
	VtxSmkRate=0.500000
	VtxSmkAmount=2
	
	VtxDebrisRate=2.500000
	VtxDebrisAmount=12
	VtxDebrisDist=10000.000000
	
	RotParticInitAngleMax=2000
	RotParticInitAngleMin=-2000
	RotParticFadeInMax=2.500000
	RotParticFadeInMin=0.700000
	RotParticRotRateMax=0.500000
	RotParticRotRateMin=0.050000
	RotParticDScaleMax=4.000000
	RotParticDScaleMin=0.500000
	RotParticDensityMax=6
	RotParticDensityMin=1
	
	VtxTraceFXRate=2.000000
	VtxTraceFXMaxAngle=3500
	VtxTraceFXAmount=1
	
	StartingTime=1.000000
	VortexTime=25.000000
	EndingTime=6.000000
	
	VortexPullStrength=1000.000000
	VortexPullRadius=10000.000000
	VortexPullRate=10.000000
	VortexDmg=1000
	bUseVortexPhysics=False
	bPullProjectiles=True
}
