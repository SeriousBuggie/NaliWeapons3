//////////////////////////////////////////////////////////////
//				Feralidragon (08-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearMissile expands NaliNuclearProjectile;

#exec MESH IMPORT MESH=NuclearMissile ANIVFILE=MODELS\NuclearMissile_a.3d DATAFILE=MODELS\NuclearMissile_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearMissile STRENGTH=0.25
#exec MESH ORIGIN MESH=NuclearMissile X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=NuclearMissile SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearMissile SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NuclearMissile MESH=NuclearMissile
#exec MESHMAP SCALE MESHMAP=NuclearMissile X=0.075 Y=0.075 Z=0.15

#exec TEXTURE IMPORT NAME=NuclearMissileSk FILE=SKINS\NuclearMissileSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearMissile NUM=1 TEXTURE=NuclearMissileSk

#exec AUDIO IMPORT NAME="NuclearMissileAmb" FILE=SOUNDS\NuclearMissileAmb.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="NuclearSpawn" FILE=SOUNDS\NuclearSpawn.wav GROUP="NuclearMissile"

var() class<Actor> NuclearBlastClass;
var() class<NuclearLauncher> NuclearLauncherClass;
var() bool bIgnoreHitNormal;
var() rotator NuclearBlastCustomRot;
var() bool bSetupClientSpeed;

var float AITrackUpdater;
var float ClientSpeed, ClientMaxSpeed;

replication
{
	reliable if (Role == ROLE_Authority)
		ClientSpeed, ClientMaxSpeed;
}

function BeginPlay()
{
local vector Dir;
local class<NuclearExplosions> nClass;

	if (NuclearLauncherClass.default.NukeSpeed > 0 && NuclearLauncherClass.default.MaxNukeSpeed > 0)
	{
		speed = NuclearLauncherClass.default.NukeSpeed;
		MaxSpeed = NuclearLauncherClass.default.MaxNukeSpeed;
		if (bSetupClientSpeed)
		{
			ClientSpeed = speed;
			ClientMaxSpeed = MaxSpeed;
		}
	}
	
	if (NuclearLauncherClass.default.bDestructableNuke)
	{
		bProjTarget = True;
		if (NuclearLauncherClass.default.MissileColRadius > 0 && NuclearLauncherClass.default.MissileColHeight > 0)
			SetCollisionSize(NuclearLauncherClass.default.MissileColRadius, NuclearLauncherClass.default.MissileColHeight);
		else
			SetCollisionSize(15.0, 8.0);
	}

	Damage = NuclearLauncherClass.default.ImpactDamage;
	DmgRadius = NuclearLauncherClass.default.ImpactRadius;
	MomentumTransfer = NuclearLauncherClass.default.ImpactMomentum;
	Dir = vector(Rotation);
	Velocity = speed * Dir;
	Acceleration = Dir * ProjAccel;
	if (Level.NetMode == NM_StandAlone || !bNetTemporary)
		bCanTeleport = Class'NWInfo'.default.bTeleProjectiles;
	
	if (SpawnSound != None)
		PlaySound(SpawnSound);
	
	nClass = Class<NuclearExplosions>(NuclearBlastClass);
	if (nClass != None)
	{
		CriticalImpactDist = nClass.default.NucleusRadius;
		DeathImpactDist = nClass.default.ShockRadius - (200*nClass.default.ShockRadius/nClass.default.ShockwaveBaseDamage);
		DangerousImpactDist = nClass.default.ShockRadius;
	}
	
	if (Instigator != None && Instigator.PlayerReplicationInfo != None)
	{
		ownerName = Instigator.PlayerReplicationInfo.PlayerName;
		savedTeam = Instigator.PlayerReplicationInfo.Team;
	}
}

simulated function PostNetBeginPlay()
{
	Super.PostNetBeginPlay();
	if (Role < ROLE_Authority && bSetupClientSpeed)
	{
		if (ClientSpeed > 0)
			speed = ClientSpeed;
		if (ClientMaxSpeed > 0)
			MaxSpeed = ClientMaxSpeed;
		Velocity = speed * vector(Rotation);
	}
}

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	SpawnExplosionFX(HitLocation, HitNormal);
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function SpawnExplosionFX( vector HitLocation, vector HitNormal)
{
local NuclearExplosions nukeExpl;

	if (Role == ROLE_Authority)
	{
		if (bIgnoreHitNormal)
			nukeExpl = NuclearExplosions(Spawn(NuclearBlastClass,,, HitLocation + HitNormal, NuclearBlastCustomRot));
		else
			nukeExpl = NuclearExplosions(Spawn(NuclearBlastClass,,, HitLocation + HitNormal, rotator(HitNormal)));
		if (nukeExpl != None && ownerName != "")
		{
			nukeExpl.ownerName = ownerName;
			nukeExpl.savedTeam = savedTeam;
		}
	}
}

singular function TakeDamage( int NDamage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType )
{
	if (!NuclearLauncherClass.default.bDestructableNuke)
		return;
	
    if ( NDamage > NuclearLauncherClass.default.DamageToDestroy && (NuclearLauncherClass.default.CanBeDestroyedByTeam || !noHurtThisPawn(instigatedBy)))
    {
		if (NuclearLauncherClass.default.enableDeniedMsg && PlayerPawn(Instigator) != None)
			PlayerPawn(Instigator).ReceiveLocalizedMessage(Class'NukeDeniedMsg');
	
		if (NuclearLauncherClass.default.bNukeWhenDestroyed)
			Explode(Location, vect(0,0,1));
		else
		{
			Spawn(Class'NukeDmgExplosionMult');
			HurtRadiusX( NuclearLauncherClass.default.DestroyedNukeDamage, FMax(1.0, NuclearLauncherClass.default.DestroyedNukeRadius), 'DeniedNuke', 20000, Location);
			RemoteRole = ROLE_SimulatedProxy;
			Destroy();
		}
    }
}

simulated function Tick(float DeltaTime)
{
	Super.Tick(DeltaTime);
	UpdateAITracking(DeltaTime);
}

function UpdateAITracking(float Delta)
{
local Pawn P;

	if (NuclearLauncherClass.default.bCannonsWarheadTrackAI || NuclearLauncherClass.default.bBotsWarheadTrackAI)
	{
		AITrackUpdater += Delta;
		if (AITrackUpdater >= 0.6)
		{
			AITrackUpdater = 0.0;
			for ( P=Level.Pawnlist; P!=None; P=P.NextPawn )
			{
				if (NuclearLauncherClass.default.bCannonsWarheadTrackAI && P.IsA('TeamCannon') && !P.IsInState('TrackWarhead') 
				&& P.LineOfSightTo(Self) && !noHurtThisPawn(P))
				{
					P.Target = Self;
					P.GotoState('TrackWarhead');
				}
				else if (NuclearLauncherClass.default.bBotsWarheadTrackAI && P.IsA('Bot') 
				&& P.LineOfSightTo(Self) && !noHurtThisPawn(P) && botCanShoot(Bot(P)))
					Bot(P).ShootTarget(Self);
			}
		}
	}
}

function bool botCanShoot(Bot B)
{
	return ((!B.bNovice && (FRand() < 0.75 + 0.1 * B.Skill)) && (B.Enemy == None || !B.LineOfSightTo(B.Enemy)) 
		&& B.Weapon != None && !B.Weapon.bMeleeWeapon);
}

// Nuclear Warning mutator stuff
function InitNukeWarn()
{
local vector HitLocation, HitNormal, TraceEnd, TraceStart;
local Actor A;

	TraceStart = Location;
	TraceEnd = TraceStart + vector(Rotation)*100000;
	A = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, False);
	
	if (A != None)
		ImpactLocation = HitLocation;
	else
		ImpactLocation = TraceEnd;
}

simulated function string getNukeInfoText()
{
	return Int(VSize(ImpactLocation - Location) / 25) $ "m";
}

simulated function color getNukeInfoColor()
{
	if (Int(VSize(ImpactLocation - Location) / 25) <= 50)
		return warningInfoColor;
	return defaultInfoColor;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearMissile
	DrawScale=1.000000
	AmbientGlow=96
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	LightBrightness=100
	LightRadius=10
	LightHue=35
	LightSaturation=160
	bBounce=False
	bNetTemporary=False
	SpawnSound=NuclearSpawn
	AmbientSound=NuclearMissileAmb
	SoundRadius=140
	SoundVolume=255
	SoundPitch=64
	
	CriticalImpactDist=300.000000
	DeathImpactDist=580.000000
	DangerousImpactDist=700.000000
	defaultInfoColor=(R=255,G=255,B=255)
	warningInfoColor=(R=255,G=0,B=0)
	defaultInfoText="----"
	
	ExplosionDecal=Class'NuclearBlastDecal'
	MyDamageType=Nuclear00
	DmgRadius=1000.000000
	speed=1500.000000
	MaxSpeed=1800.000000
	Damage=1000.000000
	MomentumTransfer=80000
	bProjTarget=False
	ProjAccel=50.000000
	bNoHurtTeam=True
	
	ExplosionNoise=10.000000
	bClientOnlySmokeGen=True
	
	TrailClass1=Class'NukeMissileTrailA'
	TrailClass2=Class'NukeMissileTrailB'
	enableSmokeGen=True
	SmokeClass=Class'NukeMissileSmoke'
	SmokeGenRateMax=11.500000
	SmokeGenRateMin=10.500000
	SmokeXOffset=-64.000000
	
	bWaterHitFX=True
	WaterSplashType=3
	Mass=200.000000
	
	LifeSpan=50000.000000
	bSetupClientSpeed=True
	
	NuclearBlastClass=Class'Shockwave'
	bIgnoreHitNormal=True
	NuclearLauncherClass=Class'NuclearLauncher'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
}
