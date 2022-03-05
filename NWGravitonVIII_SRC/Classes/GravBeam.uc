//////////////////////////////////////////////////////////////
//	Nali Weapons III Graviton beam
//				Feralidragon (25-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravBeam expands NaliProjectile;

#exec MESH IMPORT MESH=GravBeam ANIVFILE=MODELS\GravBeam_a.3d DATAFILE=MODELS\GravBeam_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravBeam STRENGTH=0.25
#exec MESH ORIGIN MESH=GravBeam X=-320 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravBeam SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravBeam SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravBeam SEQ=Expand STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravBeam MESH=GravBeam
#exec MESHMAP SCALE MESHMAP=GravBeam X=0.1 Y=0.1 Z=0.2

#exec OBJ LOAD FILE=Textures\GravGFX.utx PACKAGE=NWGravitonVIII_SRC.FX

var() float BeamSize;
var() vector FireOffset;

var GravBeam GravityBeam;
var int Position;
var bool bRight, bCenter;
var Actor GrabbedGuy;
var vector OldGrabLoc, OlderGrabLoc;
var float globalDelta;
var float WallDmgCount;

var GravBeamEnFX GravEndFX;
var byte BeamLen;
var bool bGhostGrab, canGrabTeam;
var GravMut gMut;
var float GravFlyHackSpeed;

replication
{
	// Things the server should send to the client.
	unreliable if( Role == ROLE_Authority )
		bRight, bCenter;
	reliable if (Role == ROLE_Authority)
		BeamLen, bGhostGrab, GrabbedGuy, canGrabTeam, GravityBeam, GravFlyHackSpeed;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	BeamLen = Class'Graviton'.default.GravityBeamSize;
	bGhostGrab = Class'Graviton'.default.bUseGhostGrabStyle;
	canGrabTeam = Class'Graviton'.default.bCanGrabTeam;
	GravFlyHackSpeed = Class'Graviton'.default.GravitonFlyHackSpeedMult;
	gMut = GetGravMut();
}

function GravMut GetGravMut()
{
local Mutator M;

	if (!Class'Graviton'.default.bScoreGrabAndDropFrags)
		return None;

	for (M = Level.Game.BaseMutator; M != None; M = M.NextMutator)
	{
		if (GravMut(M) != None)
			return GravMut(M);
	}
	return None;
}

simulated function int CountChildBeams()
{
	if (AExists(GravityBeam))
		return (GravityBeam.CountChildBeams() + 1);
	else
		return 1;
}

simulated function actor GetGrabbedGuy()
{
	if (AExists(GravityBeam))
		return GravityBeam.GetGrabbedGuy();
	else
		return GrabbedGuy;
}

simulated function Destroyed()
{
	if (AExists(GravityBeam) )
		GravityBeam.Destroy();
	if (GravEndFX != None)
		GravEndFX.Destroy();
		
	GravityBeam = None;
	GravEndFX = None;

	DropGrabbedGuy(globalDelta);
	Super.Destroyed();
}

function GiveSmashDamage(actor A, vector HitNormal, float DmgAmount)
{
	staticGiveSmashDamage(A, HitNormal, DmgAmount, WallDmgCount, Instigator, Kickback);
	if (Class'Graviton'.default.enableSmashShake)
		Spawn(Class'GravSmashShake',,, A.Location);
}

static function staticGiveSmashDamage(actor A, vector HitNormal, float DmgAmount, out float wDmgCount, Pawn Instig, int KickB)
{
	if (!Class'Graviton'.default.bBeamSmashDamage)
		return;
	DmgAmount /= Class'Graviton'.default.SmashDifficulty;
	if (DmgAmount > 400 && wDmgCount <= 0)
	{
		A.TakeDamage(Int(DmgAmount - 400), Instig, A.Location - (FMin(A.CollisionHeight, A.CollisionRadius) - 1)*HitNormal, (DmgAmount*100 + KickB) * HitNormal, 'Smashed');
		wDmgCount = 0.35;
	}
}

static function bool isSmashableSpeed(float sp)
{
	return (sp >= Class'Graviton'.default.SmashMinSpeed);
}

function DropGrabbedGuy(optional float Delta)
{
local vector extraVel, oldLoc;
local GravThrownAttach GTA;

	if (GrabbedGuy != None)
	{
		GrabbedGuy.SetBase(None);	
		if (!GrabbedGuy.IsA('Projectile'))
		{	
			if (GrabbedGuy.default.Physics == PHYS_Flying)
				GrabbedGuy.SetPhysics(PHYS_Flying);
			else if (!GrabbedGuy.Region.Zone.bWaterZone || !GrabbedGuy.IsA('Pawn'))
				GrabbedGuy.SetPhysics(PHYS_Falling);
			else
				GrabbedGuy.SetPhysics(PHYS_Swimming);
		}
		
		if (Pawn(GrabbedGuy) != None)
			GrabbedGuy.TakeDamage(0, Instigator, GrabbedGuy.Location, vect(0,0,1), MyDamageType);
		
		if (gMut != None && Pawn(GrabbedGuy) != None)
			gMut.processGrabVictim(Pawn(GrabbedGuy), False);

		if (Delta > 0 && VSize(OlderGrabLoc) > 0 && VSize(OldGrabLoc) > 0)
		{
			if (OldGrabLoc == GrabbedGuy.Location)
				oldLoc = OlderGrabLoc;
			else
				oldLoc = OldGrabLoc;
			
			if (isValidThrowDirection(Normal(GrabbedGuy.Location - oldLoc), GrabbedGuy.Location))
			{
				extraVel = (((GrabbedGuy.Location - oldLoc) + Normal(GrabbedGuy.Location - oldLoc)*Kickback)/Delta);
				if (Pawn(GrabbedGuy) != None)
					Pawn(GrabbedGuy).AddVelocity(extraVel);
				else
					GrabbedGuy.Velocity += extraVel;
				if (Projectile(GrabbedGuy) == None && GrabbedGuy != Instigator && Class'Graviton'.default.ThrowDamageMaxTime > 0.0)
				{
					GTA = Spawn(Class'GravThrownAttach', GrabbedGuy);
					GTA.InitAttach(Class'Graviton'.default.ThrowDamageMaxTime, Kickback, MoreDamage);
				}
			}
		}
		GrabbedGuy = None;
	}
}

function bool isValidThrowDirection(vector dir, vector grabbedLoc)
{
local float dirPer, dirLimit;

	if (Instigator == None)
		return True;
	dirPer = (dir dot Normal(grabbedLoc - Instigator.Location));
	dirLimit = 0.8;
	return (dirPer < dirLimit && dirPer > -dirLimit);
}

simulated function GlobalDropGrabbedGuy(optional float Delta)
{
	if (AExists(GravityBeam))
		GravityBeam.GlobalDropGrabbedGuy(Delta);
	else
		DropGrabbedGuy(Delta);
}

simulated function bool AExists(Actor ref)
{
	return (ref != None && !ref.bDeleteMe && !ref.bHidden);
}

simulated function CheckBeam(vector X, float DeltaTime, optional rotator bendRot)
{
local actor HitActor, OtherGuy, HitLevel;
local vector HitLocation, HitNormal, HitWallLoc, HitWallNorm, WallDir;
local bool traceProcessed, isOwnerIdle;
local vector oldLoc;
local float swingSpeed;
	
	globalDelta = DeltaTime;
	if (WallDmgCount > 0)
		WallDmgCount -= DeltaTime;

	//Trace to grab objects or keep the already grabbed object
	OtherGuy = GetGrabbedGuy();
	isOwnerIdle = (Instigator == None || (Instigator.bFire == 0 && 
		(!Class'Graviton'.default.bUseGravityBeamOnly || Instigator.bAltFire == 0)));
	if (Role == ROLE_Authority)
	{
		if (OtherGuy == None)
		{
			if (Instigator != None && CanGrabThis(Instigator) && X.Z < -0.9)
			{
				HitActor = Instigator;
				HitLocation = Instigator.Location;
			}
			else
			{
				HitActor = Trace(HitLocation, HitNormal, Location + BeamSize * X, Location, True);
				if (HitActor != None && Instigator != None && HitActor == Instigator && !CanGrabThis(HitActor))
					HitActor = Instigator.Trace(HitLocation, HitNormal, HitLocation + (BeamSize - VSize(Location-HitLocation)) * X, HitLocation, True);
			}
			
			if (isOwnerIdle || HitActor == None)
				HitLocation = Location + BeamSize * X;
			else
			{
				traceProcessed = True;
				if (AExists(GravityBeam))
				{
					GravityBeam.Destroy();
					GravityBeam = None;
				}
				
				if (CanGrabThis(HitActor))
				{
					GrabbedGuy = HitActor;
					if (Projectile(GrabbedGuy) != None)
						GrabbedGuy.Instigator = Instigator;
					
					if (gMut != None && Pawn(GrabbedGuy) != None && !noHurtThisPawn(Pawn(GrabbedGuy)))
					{
						gMut.addToGravList(Pawn(GrabbedGuy), Instigator);
						gMut.processGrabVictim(Pawn(GrabbedGuy), True);
					}
				}
			}
		}
		else
		{
			HitLocation = Location + BeamSize * X;
			if (OtherGuy == GrabbedGuy && VSize(OlderGrabLoc) > 0 && VSize(OldGrabLoc) > 0)
			{
				if (OldGrabLoc == OtherGuy.Location)
					oldLoc = OlderGrabLoc;
				else
					oldLoc = OldGrabLoc;
			
				HitActor = OtherGuy;
				WallDir = Normal(OtherGuy.Location - oldLoc) * FMax(5.0, FMax(1.5*OtherGuy.CollisionHeight, 1.5*OtherGuy.CollisionRadius));
				HitLevel = Trace(HitWallLoc, HitWallNorm, OtherGuy.Location + WallDir, OtherGuy.Location, False);
				swingSpeed = VSize(OtherGuy.Location - oldLoc)/DeltaTime;
				if (HitLevel != None && OtherGuy != Instigator && Projectile(OtherGuy) == None && isSmashableSpeed(swingSpeed))
				{
					GiveSmashDamage(OtherGuy, HitWallNorm, swingSpeed * FMax(1.0,MoreDamage));
					HitLocation = Location + (VSize(Location - HitWallLoc) - FMax(OtherGuy.CollisionHeight, OtherGuy.CollisionRadius))*X;
				}
				
				if (HitLevel != None && AExists(GravityBeam) && !bGhostGrab)
				{
					GravityBeam.Destroy();
					GravityBeam = None;
				}
				
				if (!bGhostGrab && (HitLevel != None || !FastTrace(HitLocation, OtherGuy.Location)))
				{
					DropGrabbedGuy(DeltaTime);
					traceProcessed = True;
				}
			}
		}
	}
	
	if (Role == ROLE_Authority && !traceProcessed)
	{
		HitLevel = Trace(HitWallLoc, HitWallNorm, Location + BeamSize * X, Location, False);
		if (HitLevel != None && AExists(GravityBeam) && !bGhostGrab)
		{
			GlobalDropGrabbedGuy(DeltaTime);
			GravityBeam.Destroy();
			GravityBeam = None;
		}
	}
		
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Level.NetMode != NM_StandAlone && Instigator != None)
		{
			HitActor = Instigator.Trace(HitLocation, HitNormal, Location + BeamSize * X, Location, True);
			if (HitActor == None)
				HitLocation = Location + BeamSize * X;
		}
		
		if (GravEndFX != None)
		{
			if (AExists(GravityBeam))
				GravEndFX.bHidden = True;
			else
			{
				GravEndFX.SetLocation(HitLocation + HitNormal);
				GravEndFX.bHidden = bHidden;
			}
		}
		else if (GravEndFX == None && !AExists(GravityBeam))
			GravEndFX = Spawn(Class'GravBeamEnFX',,, HitLocation + HitNormal);
	}
	
	if (HitActor == Level || HitLevel != None)
		return;
	
	//Reposition grabbed object
	if (GrabbedGuy != None)
	{
		if (GrabbedGuy == Instigator)
			HitLocation = Instigator.Location + (HitLocation - Instigator.Location)*GravFlyHackSpeed;
		UpdateGrabbedGuy(HitLocation);
		if (isOwnerIdle || GrabbedGuy.bHidden)
			DropGrabbedGuy(DeltaTime);
		else
		{
			OlderGrabLoc = OldGrabLoc;
			OldGrabLoc = GrabbedGuy.Location;
		}
	}
		
	//Update beam
	if (Position < BeamLen)
	{
		if (AExists(GravityBeam))
			GravityBeam.UpdateBeam(Self, DeltaTime, bendRot);
		else if (HitLevel == None && HitActor == None && Role == ROLE_Authority)
		{
			GravityBeam = Spawn(class'GravBeam', Owner,, Location + BeamSize * X);
			GiveMods(GravityBeam);
			GravityBeam.Position = Position + 1;
		}
	}
}

simulated function UpdateGrabbedGuy(vector newLoc)
{
	if (GrabbedGuy != None)
	{
		if (!GrabbedGuy.IsA('Projectile') && GrabbedGuy.Physics != PHYS_None)
			GrabbedGuy.SetPhysics(PHYS_None);
		if (bGhostGrab)
			GrabbedGuy.SetLocation(newLoc);
		else
			GrabbedGuy.MoveSmooth(newLoc - GrabbedGuy.Location);
	}
}

function GiveMods(GravBeam G)
{
	G.Kickback = Kickback;
	G.MoreDamage = MoreDamage;
}

function bool CanGrabThis(actor A)
{
local byte i;

	if (A == Instigator)
		return Class'Graviton'.default.bGravitonFlyHack;
	if (A.bStatic || A.bNetTemporary)
		return False;
	if (!canGrabTeam && Pawn(A) != None && noHurtThisPawn(Pawn(A)))
		return False;
	if (Instigator != None && Graviton(Instigator.Weapon) != None)
		return Graviton(Instigator.Weapon).CanGrab(A);
	return False;
}

simulated function UpdateBeam(GravBeam ParentBolt, float DeltaTime, optional rotator bendRot)
{
local vector X, Y, Z;
local vector Dir;
	
	AnimFrame = 1 - FMax((vector(bendRot) dot vect(1,0,0)), 0.5);
	SetRotation(ParentBolt.Rotation + bendRot);
	GetAxes(Rotation, X, Y, Z);
	GetAxes(ParentBolt.Rotation, Dir, Y, Z);

	SetLocation(ParentBolt.Location + BeamSize * Dir);
	CheckBeam(X, DeltaTime, bendRot);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=GravBeam
	MultiSkins(1)=GravBeamFX
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=1.650000
	
	MyDamageType=Smashed
	RemoteRole=ROLE_SimulatedProxy
	MaxSpeed=0.000000
	CollisionRadius=00000.000000
	CollisionHeight=00000.000000
	bCollideActors=False
	bCollideWorld=False
	bNetTemporary=False
	Physics=PHYS_None
	LifeSpan=0.000000
	Damage=0.000000
	MomentumTransfer=0
	bNoHurtTeam=True
	
	LightBrightness=100
	LightHue=192
	LightSaturation=48
	LightRadius=4
	LightType=LT_Steady
	
	bRight=True
	BeamSize=64.000000
	FireOffset=(X=16.000000,Y=-14.000000,Z=-8.000000)
	AnimSequence=Expand
	
	WaterSplashType=0
}
