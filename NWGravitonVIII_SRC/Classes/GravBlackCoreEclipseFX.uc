//////////////////////////////////////////////////////////////
//				Feralidragon (02-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravBlackCoreEclipseFX expands GravBlackCoreFX;

#exec AUDIO IMPORT NAME="GravProjHit" FILE=SOUNDS\GravProjHit.wav GROUP="FX"

var float FXCount;
var bool bVortex;
var() float VortexForce;
var() int VortexCoreDmg;

var bool bSpawnedCor;
var bool bVPhys;
var rotator HitRot;

var byte savedTeam;
var string ownerName;

//Modifiers
var int Kickback;
var float Splasher, MoreDamage;
var bool HealthGiver;

replication
{
	// Things the server should send to the client.
	reliable if (Role == ROLE_Authority)
		Splasher, bVortex, bVPhys;
	unreliable if (Role == ROLE_Authority)
		HitRot;
}


function BeginPlay()
{
	if (Instigator != None && Instigator.PlayerReplicationInfo != None)
	{
		ownerName = Instigator.PlayerReplicationInfo.PlayerName;
		savedTeam = Instigator.PlayerReplicationInfo.Team;
	}
	
	if (Class'Graviton'.default.VortexDamage > 0)
		VortexCoreDmg = Class'Graviton'.default.VortexDamage;
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(0.05, True);
}

singular function Touch (Actor Other)
{
local int QDmg;

	if (bVortex)
		QDmg = 50 * VortexCoreDmg * FMax(1.0, MoreDamage);
	else
		QDmg = VortexCoreDmg * FMax(1.0, MoreDamage);
	
	if ((Pawn(Other) != None && !CanDamageThisPawn(Pawn(Other))) || (Pawn(Other) == Instigator && HealthGiver) && 
	Class'NWUtils'.static.processFiredHealth(QDmg, Pawn(Other), Instigator))
		return;
	Other.TakeDamage(QDmg, Instigator, Other.Location, vect(0,0,0), Class'GravBall'.default.MyDamageType);
}

simulated function Timer()
{
local Actor A;
local float QRadius, QForce, QDist, QSpeed;

	if (bVortex)
		QRadius = Class'GravBall'.default.DmgRadius * FMax(1.0, Splasher);
	else
		QRadius = Class'GravProj'.default.DmgRadius * FMax(1.0, Splasher);
	
	ForEach VisibleCollidingActors( Class'Actor', A, QRadius)
	{
		if (!A.bStatic && !A.IsA('Projectile') && A.Physics != PHYS_None && A.Physics != PHYS_Rotating)
		{
			if (Pawn(A) == None || Role != ROLE_Authority || CanDamageThisPawn(Pawn(A)))
			{
				QDist = VSize(Location - A.Location);
				
				if (bVPhys)
					QForce = (VortexForce + Kickback) / A.Mass;
				else
					QForce = (VortexForce + Kickback) / 100.0;
				
				QSpeed = (QRadius - QDist) * QForce / QRadius;
						
				if (A.Physics == PHYS_Projectile)
				{
					if (VSize(A.Velocity) < QSpeed)
					{
						if (Pawn(A) != None)
							Pawn(A).AddVelocity(QSpeed * Normal(Location - A.Location));
						else
							A.Velocity += (QSpeed * Normal(Location - A.Location));
					}
				}
				else if (Pawn(A) != None)
					Pawn(A).AddVelocity(QSpeed * Normal(Location - A.Location));
				else
					A.Velocity += (QSpeed * Normal(Location - A.Location));
			}
		}
	}
}

function bool CanDamageThisPawn(Pawn P)
{
	return !Class'NWUtils'.static.isFriend(P, Level, Instigator, savedTeam, Class'GravBall'.default.bNoHurtTeam, Class'GravBall'.default.bNeverHurtInstigator, ownerName, Self);
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		FXCount += Delta;
		
		if (FXCount > 0.015 && LifeSpan > 0.3)
		{
			FXCount = 0;
			SpawnFX();
		}
		
		if (!bSpawnedCor && LifeSpan <= 0.2)
		{
			Spawn(Class'VortexEndCor');
			bSpawnedCor = True;
		}
	}
}

simulated function SpawnFX()
{
local rotator r;

	if (Level.NetMode != NM_DedicatedServer)
	{
		r = HitRot;
		r.Roll = Rand(16384);
		Spawn(Class'GravHitSpiralTraceFX',,,, r);
		Spawn(Class'GravHitSpiralParticleFX',,,, r);
	}
}

defaultproperties
{
    DrawType=DT_Sprite
	Texture=GravBallEclipse
	Style=STY_Translucent
	
	MaxDrawScale=0.600000
	
	DrawScale=0.200000
	ScaleGlow=2.000000
	SpriteProjForward=0.000000
	
	EffectSound1=GravProjHit
	SndVol=32.000000
	SndRadius=2200.000000
	
	VortexForce=100000.000000
	VortexCoreDmg=100
	
	CollisionRadius=10.000000
	CollisionHeight=10.000000
	bCollideActors=True
}
