//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot main class
//				Feralidragon (30-12-2010)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class Cybot expands NaliWPawn
abstract;

#exec TEXTURE IMPORT NAME=CybotMetal FILE=SKINS\CybotMetal.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=CybotCoreRed FILE=SKINS\CybotCoreRed.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=CybotCoreBlue FILE=SKINS\CybotCoreBlue.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=CybotCoreGreen FILE=SKINS\CybotCoreGreen.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=CybotCoreYellow FILE=SKINS\CybotCoreYellow.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=CybotSk FILE=SKINS\CybotSk.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="CybFire" FILE=SOUNDS\CybFire.wav GROUP="Attack"
#exec AUDIO IMPORT NAME="CybTransformSnd" FILE=SOUNDS\CybTransformSnd.wav GROUP="General"
#exec AUDIO IMPORT NAME="CybUnTransformSnd" FILE=SOUNDS\CybUnTransformSnd.wav GROUP="General"
#exec AUDIO IMPORT NAME="CybAmb" FILE=SOUNDS\CybAmb.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="CybSndArmorDmg1" FILE=SOUNDS\CybSndArmorDmg1.wav GROUP="Damage"
#exec AUDIO IMPORT NAME="CybSndArmorDmg2" FILE=SOUNDS\CybSndArmorDmg2.wav GROUP="Damage"
#exec AUDIO IMPORT NAME="CybSndArmorDmg3" FILE=SOUNDS\CybSndArmorDmg3.wav GROUP="Damage"

#exec TEXTURE IMPORT NAME=SentinelLaserFXRed FILE=CORONAS\SentinelLaserFXRed.bmp GROUP=LaserFX LODSET=2
#exec TEXTURE IMPORT NAME=SentinelLaserFXBlue FILE=CORONAS\SentinelLaserFXBlue.bmp GROUP=LaserFX LODSET=2
#exec TEXTURE IMPORT NAME=SentinelLaserFXGreen FILE=CORONAS\SentinelLaserFXGreen.bmp GROUP=LaserFX LODSET=2
#exec TEXTURE IMPORT NAME=SentinelLaserFXYellow FILE=CORONAS\SentinelLaserFXYellow.bmp GROUP=LaserFX LODSET=2

#exec AUDIO IMPORT NAME="CybSentinelTransform" FILE=SOUNDS\CybSentinelTransform.wav GROUP="General"


var() float MaxDistFromMaster;
var() float MinDistFromMaster;
var() bool bFollower;
var() bool neverRenderBeacon, neverDisplayAknMsg;

enum EGuardianType
{
	GUARD_Auto,
	GUARD_FreeRun,
	GUARD_ReturnToPoint
};

var() EGuardianType GuardianType;

enum ECybotAttitude
{
	ATT_Auto,
	ATT_IgnoreAll,
	ATT_AttackTeamEnemies,
	ATT_AttackTeamMates,
	ATT_AttackPlayers,
	ATT_AttackMonsters,
	ATT_AttackOuterTagPawns,
	ATT_AttackInnerTagPawns,
	ATT_AttackAll
};

var() ECybotAttitude CybotAttitude;
var() bool bSleeping;

var() texture TeamCoreTex[4];
var() byte CoreSkinN;

var() bool bForceAdvancedTactics;
var() bool bDodgeProj, bDodgeAllProjectiles;
var() float DodgeResponseTime, DodgeDetectionRadius;
var() float DodgeDetectionFactor;
var() float DodgeOdds;
var() bool bUseGroundMasterLastPos;
var() float TrackingUpdateRate, GroundFallCheckHInterval;
var() int MaxGroundFallChecks;
var() float AINodingRadiusMax;
var() float CapsuleCollisionRadius, CapsuleCollisionHeight;
var float StartingColRadius, StartingColHeight;
var float DodgeRCount;
var bool bIsDodging;
var byte projDir;	//0 - left, 1 - right, 2 - center
var actor TempA;
var vector MasterLastSeenLoc, MasterLastRecordedLoc, SelfOldTrackLoc;
var float masterRadarCount;
var CybNWPoint RefPnt, BasePosPnt;
var actor FollowActor;
var bool bProcessingSleepAwakeSystem;

struct TrackingSystem
{
	var vector SavedPoint;
	var bool isActive;
};
var TrackingSystem MasterLocTracking[32];
var byte MaxTrackingSteps;

var(Sparks) byte MaxSparks, SparkTriggerDmg;
var() class<Projectile> FireProjClass[4];
var() float FireDelay;
var() sound FireSnd;
var() sound DamageSnd[3];
var() float FireProjDmgMultiplier;

struct CybCor
{
	var() class<CybCoronas> CoronaClass;
	var() bool hasExtras;
	var() bool isTeamCenter;
	var() bool isTeamRing;
	var() bool bFlicker;
	var CybCoronas CCor;
};

struct CybWreckStruct
{
	var() class<CybWreckedPiece> WreckClass;
	var() vector WreckOffset;
	var() bool UseYawOnly;
};

var() CybCor CybFXCoronas[4];
var(Wreck) CybWreckStruct WreckParts[6];
var(Wreck) float WreckedExplosionRadius;
var(Wreck) int WreckedExplosionDmg, WreckedExplosionMomentum;

var() name TransformAnim, UnTransformAnim;
var() float TransformRate, UnTransformRate;
var() sound TransformSnd, UnTransformSnd;
var() name NextStateFromTransform;

var() int WaterDmg;
var float WaterTimer;
var() float ElectricDmgFactor;
var() bool nonDestroyable;

var(Parts) bool bStationary;
var(Parts) class<CybotPart> BasePartClass, TurretPartClass;
var CybotPart BasePart, TurretPart;

var(Attachments) class<CybAttach> CybAttachClasses[2];
var CybAttach CybAttach01, CybAttach02;

var() localized string MyModel;
var string MyName;
var int maxElectricalDmgTypes, maxCybotFriendClasses;

replication
{
	reliable if (Role == ROLE_Authority)
		MyName, FollowActor, bSleeping;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	StartingColRadius = CollisionRadius;
	StartingColHeight = CollisionHeight;
	if (ShouldFollow(True))
		RefPnt = Spawn(Class'CybNWPoint');
	if (bStationary)
	{
		bCanTeleport = False;
		MaxDesiredSpeed = 0.0;
		GroundSpeed = 0.0;
		WaterSpeed = 0.0;
		AccelRate = 0.0;
		JumpZ = 0.0;
		MaxStepHeight = 0.0;
		bCanFly = True;
		bCanWalk = False;
		bCanSwim = False;
		bCanJump = False;
		Velocity = vect(0,0,0);
		Acceleration = vect(0,0,0);
		SetPhysics(PHYS_Rotating);
	}
	
	if (MyModel != "")
		MyName = MyModel $ " " $ Class'CybotLauncher'.static.getRandomCybotName();
	else
		MyName = Class'CybotLauncher'.static.getRandomCybotName();
	
	if (Class'CybotLauncher'.default.CybotProjDmgMultiplier > 0)
		FireProjDmgMultiplier = Class'CybotLauncher'.default.CybotProjDmgMultiplier;
	
	SetupHealth();
	MaxTrackingSteps = Min(ArrayCount(MasterLocTracking), Class'CybotLauncher'.default.AITrackingMaxSteps);
	LoadLists();
}

function SetupHealth()
{
	if (Class'CybotLauncher'.default.CybotHealthMultiplier > 0)
		Health *= Class'CybotLauncher'.default.CybotHealthMultiplier;
}

function LoadLists()
{
local int i;

	maxElectricalDmgTypes = ArrayCount(Class'CybotLauncher'.default.ElectricDamageTypes);
	maxCybotFriendClasses = ArrayCount(Class'CybotLauncher'.default.CybotFriends);
	if (Class'CybotLauncher'.default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(Class'CybotLauncher'.default.ElectricDamageTypes); i++)
		{
			if (Class'CybotLauncher'.default.ElectricDamageTypes[i] == '')
			{
				maxElectricalDmgTypes = i;
				break;
			}
		}
		
		for (i = 0; i < ArrayCount(Class'CybotLauncher'.default.CybotFriends); i++)
		{
			if (Class'CybotLauncher'.default.CybotFriends[i] == '')
			{
				maxCybotFriendClasses = i;
				break;
			}
		}
	}
}

function PreSetMovement()
{
    if (JumpZ > 0)
        bCanJump = true;
		
    bCanWalk = (Physics != PHYS_Flying);
    bCanSwim = false;
    bCanFly = (Physics == PHYS_Flying);
    MinHitWall = -0.6;
    if (Intelligence > BRAINS_Reptile)
        bCanOpenDoors = true;
    if (Intelligence == BRAINS_Human)
        bCanDoSpecial = true;
}

function setMaster(Pawn P)
{
	Super.setMaster(P);
	if (MasterPawn != None && bFollower)
	{
		FollowActor = None;
		if (BasePosPnt != None)
			BasePosPnt.Destroy();
		BasePosPnt = None;
		initFollowingPattern();
	}
	CheckCybotsAmount();
	InitiateLifeline();
}

function CheckCybotsAmount()
{
local Cybot C;
local int n;

	if (MasterPawn == None || Class'CybotLauncher'.default.MaxCybotsPerPlayer <= 0)
		return;
	
	ForEach AllActors(Class'Cybot', C)
	{
		if (C.MasterPawn == MasterPawn)
			n++;
	}
	
	n -= Class'CybotLauncher'.default.MaxCybotsPerPlayer;
	if (n > 0)
	{
		ForEach AllActors(Class'Cybot', C)
		{
			if (!C.nonDestroyable && C.MasterPawn == MasterPawn)
			{
				C.MakeNoise(1.65);
				C.ExplodeSelf(MasterPawn);
				C.Destroy();
				n--;
				if (n <= 0)
					break;
			}
		}
	}
}

function InitiateLifeline()
{
local CybLifeline CL;

	if (MasterPawn == None || Class'CybotLauncher'.default.CybotsMaxLifeSpan <= 0.0)
		return;
	CL = Spawn(Class'CybLifeline');
	CL.InitLifeline(Self, Class'CybotLauncher'.default.CybotsMaxLifeSpan);
}

function initFollowingPattern()
{
	if (FollowActor != None || BasePosPnt != None)
		return;
	
	if (ShouldFollow(True))
	{
		if (bFollower)
			FollowActor = MasterPawn;
		else
		{
			BasePosPnt = Spawn(Class'CybNWPoint');
			FollowActor = BasePosPnt;
		}
		if (FollowActor != None)
			MasterLastRecordedLoc = FollowActor.Location;
		SelfOldTrackLoc = Location;
	}
}

event EncroachedBy(actor Other)
{
local Pawn P;

	P = Pawn(Other);
	if (P == None || !Class'CybotLauncher'.default.bCanBeTelefragged)
		return;
	if (!Class'CybotLauncher'.default.bCanBeTelefraggedByOwner && (P == Instigator || P == MasterPawn))
		return;
	if (!Class'CybotLauncher'.default.bCanBeTelefraggedByTeam && P != Instigator && P != MasterPawn && isFriend(P))
		return;
	
	gibbedBy(Other);
}

function ClientSetLocation( vector NewLocation, rotator NewRotation )
{
	if (bStationary)
	{
		ViewRotation = NewRotation;
		NewRotation.Roll  = 0;
		SetRotation( NewRotation );
		SetLocation( NewLocation );
	}
	else
		Super.ClientSetLocation(NewLocation, NewRotation);
}

function ClientSetRotation( rotator NewRotation )
{
	if (bStationary)
	{
		ViewRotation = NewRotation;
		NewRotation.Roll  = 0;
		SetRotation( NewRotation );
	}
	else
		Super.ClientSetRotation(NewRotation);
}

function SpawnParts()
{
	if (bStationary)
	{
		if (BasePartClass != None && (BasePart == None || BasePart.bDeleteMe))
			BasePart = Spawn(BasePartClass, Self,, Location + PrePivot, Rotation);
		if (TurretPartClass != None && (TurretPart == None || TurretPart.bDeleteMe))
			TurretPart = Spawn(TurretPartClass, Self,, Location + PrePivot, Rotation);
	}
}

simulated function AddVelocity( vector NewVelocity )
{
	if (bStationary)
		Velocity = vect(0,0,0);
	else
		Super.AddVelocity(NewVelocity);
}

function AssignTeam()
{
	if (Level.Game.IsA('Assault') && Assault(Level.Game).Attacker != None && Assault(Level.Game).Defender != None)
	{
		if (MyTeam == 1)
			MyTeam = Assault(Level.Game).Attacker.TeamIndex;
		else
			MyTeam = Assault(Level.Game).Defender.TeamIndex;
	}
}

function bool ShouldFollow(optional bool ignoreFollowRef)
{
	return ((bFollower || isReturnableGuardian()) && (ignoreFollowRef || FollowActor != None));
}

function bool isReturnableGuardian()
{
	if (GuardianType == GUARD_Auto)
		return Class'CybotLauncher'.default.bGuardianReturnToOrigin;
	return (GuardianType == GUARD_ReturnToPoint);
}

function byte howFarFromMaster(optional bool ignoreMasterVisibility)
{
	if (FollowActor == None)
		return 0;
		
	if (VSize(FollowActor.Location - Location) > (FollowActor.CollisionRadius + MaxDistFromMaster) 
	|| (!ignoreMasterVisibility && !FastTrace(FollowActor.Location, Location)))
		return 2;
	else if (VSize(FollowActor.Location - Location) > (FollowActor.CollisionRadius + MinDistFromMaster))
		return 1;
	return 0;
}

function byte howFarFromPoint(vector pnt, optional bool ignoreVisibility)
{
	if (VSize(pnt - Location) >  MaxDistFromMaster || (!ignoreVisibility && !FastTrace(pnt, Location)))
		return 2;
	else if (VSize(pnt - Location) > MinDistFromMaster)
		return 1;
	return 0;
}

function bool isFarFromEnemy(optional bool bDistZ)
{
	if (Enemy == None)
		return False;
	
	if (!bDistZ)
		return (VSize((Enemy.Location - Location)*vect(1,1,0)) > (MeleeRange+CollisionRadius+Enemy.CollisionRadius) 
		|| Abs(Enemy.Location.Z - Location.Z) > CollisionHeight+Enemy.CollisionHeight);
	else
		return (VSize((Enemy.Location - Location)*vect(1,1,0)) < (MeleeRange+CollisionRadius+Enemy.CollisionRadius)
		&& Abs(Enemy.Location.Z - Location.Z) > CollisionHeight+Enemy.CollisionHeight);
}

function bool isCloseToEnemy()
{
	if (Enemy == None)
		return False;
		
	return (VSize((Enemy.Location - Location)*vect(1,1,0)) <= MeleeRange*5 
	&& Abs(Enemy.Location.Z - Location.Z) <= CollisionHeight+Enemy.CollisionHeight);
}

function bool isDangerousZone(ZoneInfo Zn, optional ZoneInfo FootZn)
{
	return (isBadZone(Zn) || (FootZn != None && isBadZone(FootZn, True)));
}

function bool isInBadZone(actor A)
{
	if (A == None)	return False;
	if (Pawn(A) != None)
		return isDangerousZone(A.Region.Zone, Pawn(A).FootRegion.Zone);
	return isDangerousZone(A.Region.Zone);
}

function bool isBadZone( ZoneInfo Zn, optional bool isFoot)
{
	if (Zn == None)	return False;
	return ((Zn.bWaterZone && WaterDmg > 0 && !isFoot) || Zn.DamagePerSec > 0 || Zn.bKillZone);
}

function bool checkMasterLastSeenPos(optional bool skipExtraProcessing)
{
local byte i;
local bool bRevTracking, bLast;

	bRevTracking = !bFollower;
	bLast = True;
	for (i = GetTrackIterationStart(bRevTracking); GetTrackIterationCond(bRevTracking, i); ProcessTrackIterationOp(bRevTracking, i))
	{
		if (MasterLocTracking[i].isActive)
		{
			if(isPointReachable(MasterLocTracking[i].SavedPoint))
			{
				if (bLast && howFarFromPoint(MasterLocTracking[i].SavedPoint) < 2 && !FastTrace(FollowActor.Location, MasterLocTracking[i].SavedPoint))
					return False;
				
				MasterLastSeenLoc = MasterLocTracking[i].SavedPoint;
				if (!skipExtraProcessing)
					CutTrackingList(i, bRevTracking);
				return True;
			}
			else
				bLast = False;
		}
	}
	return False;
}

function byte GetTrackIterationStart(bool bRevTracking)
{
	if (bRevTracking)
		return 0;
	return (MaxTrackingSteps - 1);
}

function bool GetTrackIterationCond(bool bRevTracking, byte i)
{
	if (bRevTracking)
		return (i < MaxTrackingSteps);
	return (i >= 0 && i < MaxTrackingSteps);
}

function bool ProcessTrackIterationOp(bool bRevTracking, out byte i)
{
	if (bRevTracking)	i++;
	else				i--;
}

function CutTrackingList(byte n, optional bool bRevTracking)
{
local byte i;

	if (bRevTracking)
	{
		if (n == (MaxTrackingSteps-1))	return;
		for (i = (MaxTrackingSteps-1); i >= n && i < MaxTrackingSteps; i--)
		{
			MasterLocTracking[i].isActive = MasterLocTracking[i-n].isActive;
			MasterLocTracking[i].SavedPoint = MasterLocTracking[i-n].SavedPoint;
		}
	}
	else
	{
		if (n == 0)	return;
		for (i = 0; i < MaxTrackingSteps; i++)
		{
			if ((i+n) < MaxTrackingSteps)
			{
				MasterLocTracking[i].isActive = MasterLocTracking[i+n].isActive;
				MasterLocTracking[i].SavedPoint = MasterLocTracking[i+n].SavedPoint;
			}
			else
				MasterLocTracking[i].isActive = False;
		}
	}
}

function bool checkTeleporterLink()
{
local Teleporter Tele, TeleLink;

	if (!bCanTeleport || FollowActor == None)
		return False;
	
	ForEach RadiusActors(Class'Teleporter', Tele, AINodingRadiusMax)
	{
		if (Tele.bCollideActors && Len(Tele.URL) > 0 && InStr(Tele.URL, "/") < 0 && InStr(Tele.URL, "#") < 0)
		{
			ForEach AllActors(Class'Teleporter', TeleLink)
			{
				if (TeleLink != Tele && String(TeleLink.Tag) ~= Tele.URL && FastTrace(FollowActor.Location, TeleLink.Location))
				{
					MoveTarget = Tele;
					Destination = Tele.Location;
					return True;
				}
			}
		}
	}
	return False;
}

function bool checkReachMaster(optional bool skipExtraProcessing)
{
local vector locCheck;
local byte i;

	if (FollowActor == None)
		return False;
		
	locCheck = FollowActor.Location;
	if (bUseGroundMasterLastPos)
		locCheck -= ((FollowActor.CollisionHeight-CollisionHeight)*vect(0,0,1));

	if (isPointReachable(locCheck))
	{
		if (!skipExtraProcessing)
		{
			for (i = 0; i < MaxTrackingSteps; i++)
				MasterLocTracking[i].isActive = False;
		}
		return True;
	}
	return False;
}

function actor checkActorInRadius(class<Actor> actorType, float Radius, optional vector Loc, optional bool bNotCollidable)
{
local Actor A;

	if (VSize(Loc) == 0)
		Loc = Location;
	if (Radius <= 0)
		Radius = 1.0;

	if (bNotCollidable)
	{
		ForEach RadiusActors(actorType, A, Radius, Loc)
			return A;
	}
	else
	{
		ForEach VisibleCollidingActors(actorType, A, Radius, Loc)
			return A;
	}

	return None;
}

function bool ChangeEnemy(pawn newEnemy)
{
local bool b;

	if (newEnemy == None)
		return False;
		
	if (Enemy == None || (VSize(newEnemy.Location - Location) < VSize(Enemy.Location - Location)))
	{
		b = (Physics == PHYS_Flying || bStationary);
		if ((b && FastTrace(newEnemy.Location, Location)) || (!b && actorReachable(newEnemy)))
		{
			Enemy = newEnemy;
			MoveTarget = newEnemy;
			Destination = newEnemy.Location;
			return True;
		}
	}
	return False;
}

function bool ShouldBeAttacking(optional bool bIgnorePeriphericFactor)
{
	return ((Enemy != None && !isFriend(Enemy)) || CheckEnemy(bIgnorePeriphericFactor));
}

function actor SeekPathTowards(actor A)
{
	if (FindBestPathTowards(A))
		return MoveTarget;
	return None;
}

function bool FindBestPathTowards(actor A)
{
local Actor path;
local bool isValidPath;

    path = FindPathToward(A);
    isValidPath = (path != None); 
    if (isValidPath)
    {
        MoveTarget = path; 
        Destination = path.Location;
    }
	else
		MoveTarget = None;
	
    return isValidPath;
}

function FireProjectile( vector Loc, vector Dir)
{
local Projectile proj;

	proj = Spawn(FireProjClass[MyTeam], Self,, Loc, rotator(Dir));
	if (proj != None && MasterPawn != None)
		proj.Instigator = MasterPawn;
	
	if (FireSnd != None)
		PlaySound(FireSnd,,8.0,,800.0);
}

function StartUp()
{
local byte i, teamflags;

	if (MasterPawn == None)
		AssignTeam();

	Enemy = None;
	MultiSkins[CoreSkinN] = TeamCoreTex[MyTeam];
	SetAdvancedTactics();
	AmbientSound = Default.AmbientSound;
	SetCollisionSize(StartingColRadius, StartingColHeight);
	
	if (BasePart != None)
		BasePart.SetTeam(MyTeam);
	if (TurretPart != None)
		TurretPart.SetTeam(MyTeam);
	SetTeamExtras(MyTeam);
	
	for (i = 0; i < ArrayCount(CybFXCoronas); i++)
	{
		if (CybFXCoronas[i].CoronaClass != None)
		{
			CybFXCoronas[i].CCor = Spawn(CybFXCoronas[i].CoronaClass, Self);
			
			teamflags = 0;
			if (CybFXCoronas[i].isTeamCenter) teamflags += 1;
			if (CybFXCoronas[i].isTeamRing) teamflags += 2;
			if (teamflags > 0)
				CybFXCoronas[i].CCor.SetTeam( MyTeam, teamflags, Self, CybFXCoronas[i].bFlicker);
			
			if (CybFXCoronas[i].hasExtras)
				CybFXCoronas[i].CCor.SetTeamExtras( MyTeam, teamflags, Self, CybFXCoronas[i].bFlicker);
		}
	}
}

function SetAdvancedTactics()
{
	bAdvancedTactics = bDodgeProj || ShouldFollow(True) || WaterDmg > 0 || bForceAdvancedTactics;
}

simulated function SetTeamExtras(byte n);

simulated function Destroyed()
{
local byte i;

	for (i = 0; i < ArrayCount(CybFXCoronas); i++)
	{
		if (CybFXCoronas[i].CCor != None)
			CybFXCoronas[i].CCor.Destroy();
		CybFXCoronas[i].CCor = None;
	}
	
	if (RefPnt != None)
		RefPnt.Destroy();
	if (BasePosPnt != None)
		BasePosPnt.Destroy();
	if (BasePart != None)
		BasePart.Destroy();
	if (TurretPart != None)
		TurretPart.Destroy();
	if (CybAttach01 != None)
		CybAttach01.Destroy();
	if (CybAttach02 != None)
		CybAttach02.Destroy();
		
	RefPnt = None;
	BasePosPnt = None;
	BasePart = None;
	TurretPart = None;
	CybAttach01 = None;
	CybAttach02 = None;
	
	Super.Destroyed();
}

function bool isElectricDmg( name dmgType)
{
local int i;

	if (class'CybotLauncher'.default.bInvertListsProcessing)
	{
		for (i = maxElectricalDmgTypes-1; i >= 0; i--)
		{
			if (dmgType != '' && dmgType == Class'CybotLauncher'.default.ElectricDamageTypes[i])
				return True;
		}
	}
	else
	{
		for (i = 0; i < maxElectricalDmgTypes; i++)
		{
			if (dmgType != '' && dmgType == Class'CybotLauncher'.default.ElectricDamageTypes[i])
				return True;
		}
	}
	return False;
}

function HearNoise(float Loudness, Actor NoiseMaker)
{
	if (Loudness >= HearingThreshold && NoiseMaker != None)
	{
		if (Pawn(NoiseMaker) != None && !isFriend(Pawn(NoiseMaker)))
			ChangeEnemy(Pawn(NoiseMaker));
		else if (NoiseMaker.Instigator != None && !isFriend(NoiseMaker.Instigator))
			ChangeEnemy(NoiseMaker.Instigator);
	}
}

singular function TakeDamage(int Damage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType)
{
local byte i, totalSparks;
local int actualDamage;

	if (Health <= 0)	return;

	if (instigatedBy != None)
	{
		if (!isFriend(instigatedBy))
			ChangeEnemy(instigatedBy);
		else if (instigatedBy.Enemy == Self || (Bot(instigatedBy) != None && Bot(instigatedBy).OldEnemy == Self))
		{
			instigatedBy.Enemy = Enemy;
			if (Bot(instigatedBy) != None && Bot(instigatedBy).OldEnemy == Self)
				Bot(instigatedBy).OldEnemy = Enemy;
		}
	}

    if (Physics == PHYS_None)
        SetMovementPhysics();
    if (Physics == PHYS_Walking)
        momentum.Z = FMax(momentum.Z, 0.4 * VSize(momentum));
    if ( instigatedBy == self )
        momentum *= 0.6;
    momentum = momentum/Mass;

    actualDamage = ReduceDamage(Damage, DamageType, self, instigatedBy);
	
	if (isElectricDmg(DamageType))
		actualDamage = Int(actualDamage*ElectricDmgFactor*Class'CybotLauncher'.default.ElectricalDamageScale);

	totalSparks = Min(Max(Byte(actualDamage/SparkTriggerDmg), 1), MaxSparks);
	for (i = 0; i < totalSparks; i++)
		Spawn(Class'CybotSpark',,, hitLocation, RotRand());
	
	PlaySound(DamageSnd[Rand(ArrayCount(DamageSnd))],,8.0,,1200.0);
	AddVelocity( momentum ); 
	if (DamageType == 'SpecialDamage' || Class'CybotLauncher'.default.bFriendlyFire || !isFriend(instigatedBy))
		Health -= actualDamage;
	
	if (Health <= 0)
	{
		MakeNoise(1.65);
		ExplodeSelf(instigatedBy);
		Destroy();
	}
}

singular function Died(pawn Killer, name damageType, vector HitLocation)
{
	if (bDeleteMe)
		return;
	
	MakeNoise(1.65);
	ExplodeSelf(Killer);
	Destroy();
}

function SpawnExplodeFX()
{
	Spawn(Class'CybDmgExplosionMult',,,, rotator(vect(0,0,1)));
	Spawn(Class'CybShock',,,, rotator(vect(0,0,1)));
	Spawn(Class'CybAfterEffects');
}

function ExplodeSelf(optional Pawn instigatedBy)
{
local byte i;
local CybWreckedPiece cwp;
local Actor A;
local float dist, damageScale;
local vector dir;
local rotator R;

	if (!neverDisplayAknMsg && Class'CybotLauncher'.default.enableCybotDeathAknMessages && PlayerPawn(MasterPawn) != None)
	{
		PlayerPawn(MasterPawn).ReceiveLocalizedMessage(Class'CybDeathMsg',,,, Self);
		PlayerPawn(MasterPawn).PlayBeepSound();
	}

	SpawnExplodeFX();
	
	for (i = 0; i < ArrayCount(WreckParts); i++)
	{
		if (WreckParts[i].WreckClass != None)
		{
			R = Rotation;
			if (WreckParts[i].UseYawOnly)
			{
				R.Pitch = 0;
				R.Roll = 0;
			}
			
			cwp = Spawn(WreckParts[i].WreckClass,,, Location + ((WreckParts[i].WreckOffset*DrawScale) >> R), R);
			cwp.DrawScale = DrawScale;
			cwp.SetVelocity(Normal(((WreckParts[i].WreckOffset*DrawScale) >> R) + VRand()*VSize(WreckParts[i].WreckOffset*DrawScale)/3));
		}
	}
	
	ForEach VisibleCollidingActors(Class'Actor', A, WreckedExplosionRadius)
	{
		if (A != Self && (Class'CybotLauncher'.default.bFriendlyFire || !isFriend(A) || A == MasterPawn))
		{
			dir = A.Location - Location;
            dist = FMax(1,VSize(dir));
            dir = dir/dist; 
            damageScale = 1 - FMax(0,(dist - A.CollisionRadius)/WreckedExplosionRadius);
            A.TakeDamage(damageScale * WreckedExplosionDmg,instigatedBy, 
                A.Location - 0.5 * (A.CollisionHeight + A.CollisionRadius) * dir,(damageScale * WreckedExplosionMomentum * dir), 'CybotExploded');
		}
	}
}

function int ReduceDamage(int Damage, name DamageType, pawn injured, pawn instigatedBy)
{
	if (injured.Region.Zone.bNeutralZone)
        return 0;

    if (instigatedBy == None)
        return Damage;
	
	return (Damage * instigatedBy.DamageScaling);
}

//Some updates
function UpdateTactics(float Delta)
{
local vector locCheck;

	if (bDodgeProj && !bIsDodging)
	{
		DodgeRCount += Delta;
		if (DodgeRCount >= DodgeResponseTime)
		{
			DodgeRCount = 0;
			if (FRand() <= DodgeOdds)
				CheckDodgeProjectile(True);
		}
	}
	
	if (ShouldFollow())
	{
		masterRadarCount += Delta;
		if (masterRadarCount >= (1/TrackingUpdateRate))
		{
			masterRadarCount = 0;
			UpdateTracking();
		}
	}
	
	if (WaterDmg > 0 && Region.Zone.bWaterZone)
	{
		WaterTimer += Delta;
		if (WaterTimer >= 1.0)
		{
			WaterTimer = 0.0;
			TakeDamage( WaterDmg, None, Location, vect(0,0,0), 'Drowned');
		}
	}
}

function UpdateTracking()
{
local vector locCheck, startLoc;
local byte i;
local bool bRevTracking;

	if (FollowActor == None || MasterLocTracking[MaxTrackingSteps-1].isActive)
		return;

	bRevTracking = !bFollower;
	for (i = 0; i < MaxTrackingSteps && MasterLocTracking[i].isActive; i++);
	
	locCheck = FollowActor.Location;
	if (bUseGroundMasterLastPos)
		locCheck -= ((FollowActor.CollisionHeight-CollisionHeight)*vect(0,0,1));
		
	if (i > 0)
	{
		if (bRevTracking)
			locCheck = MasterLocTracking[i-1].SavedPoint;
		else
			startLoc = MasterLocTracking[i-1].SavedPoint;
	}
	
	if (isPointReachable(locCheck, startLoc))
	{
		if (bRevTracking)
			MasterLastRecordedLoc = SelfOldTrackLoc;
		else
			MasterLastRecordedLoc = locCheck;
	}
	else if (i == 0 || MasterLastRecordedLoc != MasterLocTracking[i-1].SavedPoint)
	{
		MasterLocTracking[i].SavedPoint = MasterLastRecordedLoc;
		MasterLocTracking[i].isActive = True;
	}
	SelfOldTrackLoc = Location;
}

function bool isPointReachable(vector loc, optional vector orLoc)
{
	if (bUseGroundMasterLastPos)
		return isGroundPointReachable(loc, orLoc);
	if (VSize(orLoc) > 0)
		return canBeReachedDirectly(loc, orLoc);
	return canBeReachedDirectly(loc, Location);
}

function bool isGroundPointReachable(vector loc, optional vector orLoc)
{
local vector start, dir, pnt;
local int steps, i;
local float safeFallDist, maxFallCheck;

	if (VSize(orLoc) > 0)
		start = orLoc;
	else
		start = Location;
		
	if (!canBeReachedDirectly(loc, start))
		return False;
	
	safeFallDist = getSafeFallDist();
	dir = Normal(loc - start);
	steps = Min(MaxGroundFallChecks, Int(VSize(start - loc) / GroundFallCheckHInterval));
	for (i = 0; i < steps; i++)
	{
		pnt = start + i*GroundFallCheckHInterval*dir;
		if (FastTrace(pnt - safeFallDist*vect(0,0,1), pnt))
			return False;
	}
	return True;
}

function bool canBeReachedDirectly(vector end, vector start)
{
local vector dir, sideExt, hExt;
local rotator R;

	if (!FastTrace(end, start))
		return False;
		
	R.Yaw = Rotation.Yaw;
	if (!FastTrace(Location + vector(R)*(CollisionRadius + 6), Location) || 
	!FastTrace(Location - vector(R)*(CollisionRadius + 6), Location) ||
	!FastTrace(Location + vector(R + rot(0,16384,0))*(CollisionRadius + 6), Location) ||
	!FastTrace(Location + vector(R - rot(0,16384,0))*(CollisionRadius + 6), Location))
		return True;
		
	dir = Normal(end - start);
	sideExt.X = dir.Y;
	sideExt.Y = dir.X;
	sideExt = Normal(sideExt)*(CollisionRadius + 3);
	hExt = (CollisionHeight + 3) * vect(0,0,1);
	return (FastTrace(end + sideExt, start + sideExt) && FastTrace(end - sideExt, start - sideExt) && FastTrace(end + hExt, start + hExt));
}

function float getSafeFallDist()
{
	return 100.0;
}

function bool isCollisionFree(vector loc)
{
local bool isFree;

	if (RefPnt == None)
		RefPnt = Spawn(Class'CybNWPoint');
	RefPnt.SetEncroachability(CollisionRadius, CollisionHeight);
	RefPnt.SetLocation(loc);
	isFree = !RefPnt.isEncroached;
	RefPnt.Reset();
	return isFree;
}

function bool CheckDodgeProjectile(optional bool doSomeAction)
{
local Projectile proj, closerProj;
local bool isThreateningProj, dodgeAll;

	dodgeAll = (doSomeAction && bDodgeAllProjectiles);
	ForEach VisibleCollidingActors(Class'Projectile', proj, FMax(DodgeDetectionRadius, 10))
	{
		isThreateningProj = !isFriend(proj) && proj.Owner != Self && ((Normal(proj.Velocity) dot Normal(Location - proj.Location)) >= DodgeDetectionFactor);
		if (isThreateningProj)
		{
			if (dodgeAll)
			{
				bIsDodging = True;
				projDir = getProjDirection(proj);
				DodgeProjectile(proj);
				ChangeEnemy(proj.Instigator);
			}
			else if (closerProj == None || Vsize(Location - proj.Location) < VSize(Location - closerProj.Location))
				closerProj = proj;
		}
	}

	if (closerProj != None)
	{
		bIsDodging = True;
		projDir = getProjDirection(closerProj);
		if (doSomeAction)
			DodgeProjectile(closerProj);
		ChangeEnemy(closerProj.Instigator);
		return True;
	}
	
	return False;
}

function byte getProjDirection( Projectile proj)
{
local vector locCenter, locRight, locLeft;
local float distCenter, distRight, distLeft;
	
	locCenter = Location;
	locLeft = locCenter + ((CollisionRadius*vect(0,-1,0))>>Rotation);
	locRight = locCenter + ((CollisionRadius*vect(0,1,0))>>Rotation);
	distCenter = VSize(proj.Location - locCenter);
	distRight = VSize(proj.Location - locRight);
	distLeft = VSize(proj.Location - locLeft);
	
	if (distCenter < distRight && distCenter < distLeft)
		return 2;
	else if (distLeft < distRight)
		return 1;
	return 0;
}

//Other functions
function DodgeProjectile( Projectile proj){	GotoState('Dodging');}

function bool TestDirection(vector dir, float length, optional bool bBSPOnly, optional vector LocOffset)
{
local vector HitLocation, HitNormal;
local actor HitActor;

	dir = Normal(dir);
	if (bBSPOnly)
		return FastTrace(Location + LocOffset + (CollisionRadius + length) * dir, Location + LocOffset);
	
	HitActor = Trace(HitLocation, HitNormal, Location + LocOffset + (CollisionRadius + length) * dir, Location + LocOffset, True);
	return (HitActor == None);
}

function bool CanJumpLedge(vector dir, float length, float deep, optional float min_deepness)
{
	dir = Normal(dir);
	if (FastTrace(Location + (CollisionRadius + length) * dir * vect(1,1,0), Location))
	{
		if (min_deepness == 0)
			return !FastTrace(Location + (CollisionRadius + length) * dir * vect(1,1,0) + (CollisionHeight + deep) * vect(0,0,-1), 
			Location + (CollisionRadius + length) * dir * vect(1,1,0));
		else
			return (!FastTrace(Location + (CollisionRadius + length) * dir * vect(1,1,0) + (CollisionHeight + deep) * vect(0,0,-1), 
			Location + (CollisionRadius + length) * dir * vect(1,1,0))) &&
			(FastTrace(Location + (CollisionRadius + length) * dir * vect(1,1,0) + (CollisionHeight + min_deepness) * vect(0,0,-1), 
			Location + (CollisionRadius + length) * dir * vect(1,1,0)));
	}
	
	return False;
}

function bool CheckEnemy(optional bool bIgnorePeriphericFactor)
{
local Pawn P;
local bool gotEnemy;

	ForEach RadiusActors(Class'Pawn', P, SightRadius)
	{
		if (P != Self && ((bIgnorePeriphericFactor && FastTrace(P.Location, Location)) || (!bIgnorePeriphericFactor && CanSee(P))) && !isFriend(P))
			gotEnemy = (gotEnemy || ChangeEnemy(P));
	}
	return gotEnemy;
}

function bool KeepEnemy()
{
	if (Enemy == None || Enemy.bDeleteMe || Enemy.Health <= 0 || Enemy.bHidden || isFriend(Enemy))
	{
		Enemy = None;
		return False;
	}
	return True;
}

function bool CanFireProj(vector dir, float dist)
{
local actor A;
local vector HitLoc, HitNorm;

	dir = Normal(dir);
	if (Enemy != None)
		dist = FClamp(VSize(Enemy.Location - Location), 1.0, dist);
	
	A = Trace( HitLoc, HitNorm, Location + dir*dist, Location, True);
	return (A == None || !isFriend(A));
}

function bool MakeMeleeAttack( vector Dir, int Dmg, optional name dmgType, optional bool bHeadShot, optional int dmgHeadshot, optional float extraRange, optional float ZOffset)
{
local Actor A;
local vector HitLocation, HitNormal;
local Pawn Inst;
local NWKillMsgManager NWkmsg;

	if (MasterPawn != None)
		Inst = MasterPawn;
	else
		Inst = Self;
	
	Dir = Normal(Dir*vect(1,1,0));
	A = Trace(HitLocation, HitNormal, Location + (CollisionRadius+MeleeRange*(1.0+extraRange))*Dir + ZOffset*vect(0,0,1), 
	Location + ZOffset*vect(0,0,1), True);
	
	if (A == None)
		A = Trace(HitLocation, HitNormal, Location + (CollisionRadius+MeleeRange*(1.0+extraRange))*Dir + ZOffset*vect(0,0,1), 
		Location + ZOffset*vect(0,0,1), True, vect(0,0,1)*CollisionHeight);
	
	if (A == None || (!Class'CybotLauncher'.default.bFriendlyFire && isFriend(A)))
		return False;
	
	if (A.bIsPawn && bHeadShot && (HitLocation.Z - A.Location.Z > 0.62 * A.CollisionHeight))
	{
		NWkmsg = Class'NWUtils'.static.getKillMsgManager(Level);
		if (NWkmsg != None)
			NWkmsg.prepareHeadshotKillMsg(Inst, Pawn(A), Class'CybotLauncher');
		A.TakeDamage(dmgHeadshot, Inst, HitLocation, Dir*1000.0, 'Decapitated');
	}
	else
		A.TakeDamage(Dmg, Inst, HitLocation, Dir*100.0, dmgType);
	
	return True;
}

simulated function PlayAttach(byte attach, byte n, float rate, optional bool bLoop)
{
	if (CybAttach01 != None && attach == 0 && CybAttach01 != None && n < ArrayCount(CybAttach01.AnimCache) && rate > 0)
		CybAttach01.PlayAnimation( n, rate, bLoop);
	else if (CybAttach02 != None && attach == 1 && CybAttach02 != None && n < ArrayCount(CybAttach02.AnimCache) && rate > 0)
		CybAttach02.PlayAnimation( n, rate, bLoop);
}

simulated function SetAttachSnd(byte attach, optional bool bRemove)
{
	if (attach == 0 && CybAttach01 != None)
	{
		if (bRemove)
			CybAttach01.RemoveAmbSound();
		else
			CybAttach01.SetAmbSound();
	}
	else if (attach == 1 && CybAttach02 != None)
	{
		if (bRemove)
			CybAttach02.RemoveAmbSound();
		else
			CybAttach02.SetAmbSound();
	}
}

function StopFlying()
{
	Acceleration = vect(0,0,0);
	Velocity = vect(0,0,0);
}

function Bump(actor Other)
{
	Super.Bump(Other);
	
	if (Pawn(Other) != None && (Pawn(Other).Enemy == Self || (Bot(Other) != None && Bot(Other).OldEnemy == Self)) && isFriend(Other))
	{
		Pawn(Other).Enemy = Enemy;
		if (Bot(Other) != None && Bot(Other).OldEnemy == Self)
			Bot(Other).OldEnemy = Enemy;
	}
}

function bool isFriend(actor A)
{
local bool b;

	if (CybotAttitude != ATT_Auto)
	{
		if (CybotAttitude == ATT_IgnoreAll)
			return True;
		if (CybotAttitude == ATT_AttackAll)
			return False;
		if (CybotAttitude == ATT_AttackTeamEnemies || CybotAttitude == ATT_AttackTeamMates)
		{
			b = Super.isFriend(A);
			return ((b && CybotAttitude == ATT_AttackTeamEnemies) || (!b && CybotAttitude == ATT_AttackTeamMates));
		}
		if (CybotAttitude == ATT_AttackPlayers && (PlayerPawn(A) != None || Bot(A) != None))
			return False;
		if (CybotAttitude == ATT_AttackMonsters && ScriptedPawn(A) != None)
			return False;
		if (CybotAttitude == ATT_AttackOuterTagPawns && Pawn(A) != None && A.Tag != Tag)
			return False;
		if (CybotAttitude == ATT_AttackInnerTagPawns && Pawn(A) != None && A.Tag == Tag)
			return False;
		return True;
	}
	
	if (checkCybotFriend(A))
		return True;
	return Super.isFriend(A);
}

function bool checkCybotFriend( actor A)
{
local int i;

	if (A == None)	return False;

	if (Class'CybotLauncher'.default.bInvertListsProcessing)
	{
		for (i = maxCybotFriendClasses-1; i >= 0; i--)
		{
			if (Class'CybotLauncher'.default.CybotFriends[i] != '' && A.IsA(Class'CybotLauncher'.default.CybotFriends[i]))
				return True;
		}
	}
	else
	{
		for (i = 0; i < maxCybotFriendClasses; i++)
		{
			if (Class'CybotLauncher'.default.CybotFriends[i] != '' && A.IsA(Class'CybotLauncher'.default.CybotFriends[i]))
				return True;
		}
	}
	
	return False;
}

//------- STARTING UP --------------
function PlayTransform()
{
	if (TransformSnd != None)
		PlaySound(TransformSnd,,12.0,,1200.0);
	
	if (TransformAnim != '' && TransformRate > 0.0)
		PlayAnim(TransformAnim, TransformRate);
	
	if (CybAttachClasses[0] != None && (CybAttach01 == None || CybAttach01.bDeleteMe))
		CybAttach01 = Spawn(CybAttachClasses[0], Self,, Location + PrePivot, Rotation);
	if (CybAttachClasses[1] != None && (CybAttach02 == None || CybAttach02.bDeleteMe))
		CybAttach02 = Spawn(CybAttachClasses[1], Self,, Location + PrePivot, Rotation);
		
	PlayAttach( 0, 0, TransformRate);
	PlayAttach( 1, 0, TransformRate);
}
	
auto state StartingUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

Begin:
	if (!bStationary)
		SetPhysics(Default.Physics);
	else
		SetPhysics(PHYS_Rotating);
	SpawnParts();
	if (bSleeping)
		GotoState('Sleeping', 'Sleep');
	PlayTransform();
	Sleep(0.1);
	StartUp();
	FinishAnim();
	bProcessingSleepAwakeSystem = False;
	if (NextStateFromTransform != '')
		GotoState(NextStateFromTransform);
}

function PlayUnTransform()
{
	if (UnTransformSnd != None)
		PlaySound(UnTransformSnd,,12.0,,1200.0);
	
	if (UnTransformAnim != '' && UnTransformRate > 0.0)
		PlayAnim(UnTransformAnim, UnTransformRate);
		
	PlayAttach( 0, 1, UnTransformRate);
	PlayAttach( 1, 1, UnTransformRate);
}

function ToSleep();	//Implement on subclasses

state Sleeping
{
ignores SeePlayer, HearNoise, KilledBy, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

	simulated function HitWall(vector HitNormal, actor Wall)
	{
	local float speed;
	
		Velocity = 0.5*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
		speed = VSize(Velocity);
		if (Level.NetMode != NM_DedicatedServer && speed > 35)
			PlaySound(Class'CybotDeployProj'.default.ImpactSound, SLOT_Misc, 8.0);
		if (Velocity.Z > 400)
			Velocity.Z = 0.25 * (400 + Velocity.Z);	
		else if (speed < 200)
		{
			if (Abs(HitNormal.Z) < 0.35)
				Velocity += (HitNormal * 200);
			else
				SetPhysics(PHYS_None);
		}
	}
	
	simulated function Landed(vector HitNormal)
	{
		HitWall(HitNormal, None);
	}
	
	simulated function Bump(actor Other)
	{
		if (Physics != PHYS_None)
			HitWall(Normal(Location - Other.Location), Other);
	}
	
	function DiscardCoronas()
	{
	local byte i;
	
		for (i = 0; i < ArrayCount(CybFXCoronas); i++)
		{
			if (CybFXCoronas[i].CCor != None && !CybFXCoronas[i].CCor.bDeleteMe)
				CybFXCoronas[i].CCor.bFadeOut = True;
		}
	}

	
Begin:
	SetAttachSnd(0, True);
	SetAttachSnd(1, True);
	DiscardCoronas();
	PlayUnTransform();
	ToSleep();
Sleep:
	StopFlying();
	SetCollisionSize(CapsuleCollisionRadius, CapsuleCollisionHeight);
	AmbientSound = None;
	Enemy = None;
	MoveTarget = None;
	if (!bStationary)
		SetPhysics(PHYS_Falling);
	else
		SetPhysics(PHYS_None);
	Sleep(0.1);
	bProcessingSleepAwakeSystem = False;
}

state GameEnded
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

    function BeginState()
    {
        SetPhysics(PHYS_None);
    }
}


defaultproperties
{
	Texture=CybotMetal
	AnimSequence=Transform
	Physics=PHYS_Walking
	Intelligence=BRAINS_HUMAN
	RotationRate=(Pitch=0)
	MeleeRange=64.000000
	
	TeamCoreTex(0)=CybotCoreRed
	TeamCoreTex(1)=CybotCoreBlue
	TeamCoreTex(2)=CybotCoreGreen
	TeamCoreTex(3)=CybotCoreYellow
	
	SparkTriggerDmg=5
	MaxSparks=10
	bMachine=True
	ElectricDmgFactor=1.000000
	
	bDodgeProj=False
	DodgeResponseTime=0.100000
	DodgeDetectionRadius=200.000000
	DodgeDetectionFactor=0.350000
	DodgeOdds=1.000000
	TrackingUpdateRate=7.500000
	GroundFallCheckHInterval=64.000000
	MaxGroundFallChecks=20
	AINodingRadiusMax=300.000000
	CapsuleCollisionRadius=9.000000
	CapsuleCollisionHeight=9.000000
	
	SightRadius=6750.000000
	HearingThreshold=0.400000
	FovAngle=160.000000
	PeripheralVision=-1.000000
	bStasis=False
	
	AmbientSound=CybAmb
	SoundVolume=75
	SoundRadius=12
	FireSnd=CybFire
	FireProjDmgMultiplier=1.000000
	DamageSnd(0)=CybSndArmorDmg1
	DamageSnd(1)=CybSndArmorDmg2
	DamageSnd(2)=CybSndArmorDmg3
	WreckedExplosionRadius=256.000000
	WreckedExplosionDmg=200
	WreckedExplosionMomentum=100000
	
	TransformAnim=Transform
	TransformRate=1.000000
	TransformSnd=CybTransformSnd
	UnTransformAnim=UnTransform
	UnTransformRate=1.000000
	UnTransformSnd=CybUnTransformSnd
	
	GuardianType=GUARD_Auto
	CybotAttitude=ATT_Auto
}
