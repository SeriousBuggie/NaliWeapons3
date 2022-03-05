//////////////////////////////////////////////////////////////
//	Nali Weapons III Flame Tracker Lava Burst
//				Feralidragon (21-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlamesTLavaProj expands NaliProjectile;

#exec TEXTURE IMPORT NAME=FlameLavaTex FILE=SKINS\FlameLavaTex.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=FColdLava FILE=SKINS\FColdLava.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="FLavaHit" FILE=SOUNDS\FLavaHit.wav GROUP="LavaProjectile"
#exec AUDIO IMPORT NAME="FLavaGrow" FILE=SOUNDS\FLavaGrow.wav GROUP="LavaProjectile"
#exec AUDIO IMPORT NAME="FLavaStoneHitGWater" FILE=SOUNDS\FLavaStoneHitGWater.wav GROUP="LavaProjectile"
#exec AUDIO IMPORT NAME="FLavaExplode" FILE=SOUNDS\FLavaExplode.wav GROUP="LavaProjectile"

var FlameTLavaGlow LvGlow;
var bool bOnGround;
var BioFear MyFear;
var float FadeGlowTime;
var int BubbleCount;
var() float TimeToExplode;
var int maxNotInflamableClasses;
var() bool bCumulativeGlob;
var() float MaxScale, CeilStickOdds;
var() class<FlameTLavaExplosion> FlameTExplClass;

function BeginPlay()
{
	LoadLists();
	Super.BeginPlay();
}

simulated function PostBeginPlay()
{
	SpawnGlowing();
    RandSpin(100000);
	if (bMeshEnviroMap)
		LoopAnim('Flying',0.4);
		
	TimeToExplode *= (FRand() * 0.85 + 0.3);
	Super.PostBeginPlay();
}

function LoadLists()
{
local int i;

	maxNotInflamableClasses = ArrayCount(class'FlameTracker'.default.NotInflamableObject);
	if (Class'FlameTracker'.default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(class'FlameTracker'.default.NotInflamableObject); i++)
		{
			if (class'FlameTracker'.default.NotInflamableObject[i] == '')
			{
				maxNotInflamableClasses = i;
				break;
			}
		}
	}
}

simulated function Timer()
{
local Effects efx;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (SmokeClass != None && (!Region.Zone.bWaterZone || bSmokeGenUnderWater))
		{
			efx = Spawn(SmokeClass);
			efx.DrawScale = DrawScale * efx.Default.DrawScale / 2;
			
			if (isSmkGenRand)
			{
				if (!Region.Zone.bWaterZone)
					SetTimer(1/(SmokeGenRateMin + FRand()*(SmokeGenRateMax - SmokeGenRateMin)), False);
				else if (bSmokeGenUnderWater)
					SetTimer(1/(SmokeGenRateMin + FRand()*(SmokeGenRateMax - SmokeGenRateMin)*WaterSpeedScale), False);
			}
			else
			{
				if (!Region.Zone.bWaterZone)
					SetTimer(1/SmokeGenRateMax, False);
				else if (bSmokeGenUnderWater)
					SetTimer(1/(SmokeGenRateMax * WaterSpeedScale), False);
			}
			return;
		}
		else if (UnderWaterSmokeClass != None && Region.Zone.bWaterZone)
		{
			BubbleCount++;
			if (BubbleCount > 20)
				UnderWaterSmokeClass = None;
		}
	}
	
	Super.Timer();
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer && FadeGlowTime > 0)
	{
		FadeGlowTime -= Delta;
		if (FadeGlowTime < 0)
			FadeGlowTime = 0;
		ScaleGlow = FadeGlowTime;
	}
	
	if (Role == ROLE_Authority && bMeshEnviroMap)
	{
		TimeToExplode -= Delta;
		if (TimeToExplode < 0)
		{
			TimeToExplode = 10.0;
			ExplodeX(Location, vect(0,0,1));
		}
	}
}

simulated function SpawnGlowing(optional bool bForceServer)
{
	if (bMeshEnviroMap && (Level.NetMode != NM_DedicatedServer || bForceServer))
	{
		LvGlow = Spawn(Class'FlameTLavaGlow', Self);
		LvGlow.DrawScale = DrawScale * 0.65;
		LvGlow.Mesh = Mesh;
	}
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
local bool bHurt;
local vector NewVel;
local int tempKick;

	if (Other != Instigator)
		bNeverHurtInstigator = False;
	
	if (bCumulativeGlob && FlamesTLavaProj(Other) != None && bMeshEnviroMap)
	{
		if (bOnGround && !FlamesTLavaProj(Other).bOnGround && (Default.LifeSpan - LifeSpan) > 0.1)
		{
			if (LvGlow != None && Level.NetMode != NM_StandAlone)
			{
				LvGlow.Destroy();
				LvGlow = None;
			}
			
			SetScale(DrawScale + Other.DrawScale);
			PlayAnim('Flying');
			CheckSurface( vector(Rotation));
			MakeHitSound(False);
			Other.Destroy();
			Other = None;
		}
	}
	else if (FlamesTLavaProj(Other) == None)
	{
		if ((!CanHitInstigator || (CanHitInstigator && (Default.LifeSpan - LifeSpan) < HitInstigatorTimeOut)) && Other == Instigator)
			return;
		if (Other.IsA('Projectile') && !Other.bProjTarget)
			return;
		
		if (bMeshEnviroMap)
		{
			ProcessTouchVictim(Other);
			ExplodeX( HitLocation, Normal(HitLocation-Other.Location), Other);
		}
		else if (Other.Location.Z < Location.Z)
		{
			if (isAllowedToKick(Instigator, Pawn(Other)))
				tempKick = KickBack;
			else
				tempKick = 0;
			
			Other.TakeDamage(DrawScale * 5 * Damage * FMax(1.0,MoreDamage), Instigator, HitLocation, MomentumTransfer * (tempKick + 1) * vector(Rotation), MyDamageType);
			
			NewVel.Z = 1;
			NewVel.X = 2 * FRand() - 1;
			NewVel.Y = 2 * FRand() - 1;
			Velocity = VSize(Velocity) * Normal(NewVel);
		}
	}
}

function ProcessTouchVictim( Actor Victim)
{
local bool bHurt;
local FlameTCorpseAttach ftc;
local ZoneInfo VictZone;

	VictZone = Victim.Region.Zone;
	if (VictZone.bWaterZone && !VictZone.IsA('LavaZone') && VictZone.DamageType != 'Burned')
		return;

	if (Victim.IsA('CreatureChunks') || Victim.IsA('UTCreatureChunks'))
	{
		if (!Victim.bShadowCast)
		{
			Spawn(Class'NWFlameController', Victim,, Victim.Location);
			Victim.bShadowCast = True;
		}
	}
	else if (Victim.Mesh != None && (!Victim.bHidden || Victim.IsA('Vehicle')) && CheckInflamableActor(Victim))
	{
		bHurt = True;
		
		if (Pawn(Victim) != None)
			bHurt = bHurt && !noHurtThisPawn(Pawn(Victim));
		
		if (!Victim.bShadowCast && bHurt)
		{
			ftc = Spawn(Class'FlameTCorpseAttach', Victim,, Victim.Location);
			ftc.MoreDamage = MoreDamage;
			ftc.HealthGiver = HealthGiver;
			Victim.bShadowCast = True;
		}
	}
}

function bool CheckInflamableActor( Actor A)
{
local int i;
	
	if (class'FlameTracker'.default.bInvertListsProcessing)
	{
		for (i = maxNotInflamableClasses-1; i >= 0; i--)
		{
			if (class'FlameTracker'.default.NotInflamableObject[i] != '' && A.IsA(class'FlameTracker'.default.NotInflamableObject[i]))
				return False;
		}
	}
	else
	{
		for (i = 0; i < maxNotInflamableClasses; i++)
		{
			if (class'FlameTracker'.default.NotInflamableObject[i] != '' && A.IsA(class'FlameTracker'.default.NotInflamableObject[i]))
				return False;
		}
	}
	
	if ((A.bStatic || A.bNoDelete) && !class'FlameTracker'.default.BurnStaticObjects)
		return False;
	
	if (A.IsA('Pawn') || A.IsA('Vehicle'))
		return True;
	
	if (A.IsA('Decoration'))
		return (!(A.IsA('Boulder') || A.IsA('CTFFlag') || A.IsA('MonkStatue') || A.IsA('Vase')));
	
	return False;
}

function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
local FlameTLavaExplosion s;

	if (Mover(Base) != None && Mover(Base).bDamageTriggered)
        Base.TakeDamage((DrawScale/2) * Damage * FMax(1.0,MoreDamage), Instigator, Location, MomentumTransfer * (KickBack + 1) * vector(Rotation), MyDamageType);
	PlaySound(Sound'FLavaExplode',, DrawScale * 10.0,, DrawScale * 400);
	
	s = Spawn(FlameTExplClass);
	s.DrawScale = DrawScale/2;
	if (Level.NetMode == NM_StandAlone)
		s.SpawnLight();
	
	Super.ExplodeX(HitLocation, HitNormal, A);
}

function BlowUp(vector HitLocation)
{
	ExplosionNoise = Default.ExplosionNoise * DrawScale;
	MakeNoise(ExplosionNoise);
	Splasher = DrawScale * FMax(1.0, Splasher);
	HurtRadiusX((DrawScale/2) * Damage * FMax(1.0,MoreDamage), DmgRadius * Splasher, MyDamageType, MomentumTransfer * (KickBack + 1), HitLocation);
	if (!Region.Zone.bWaterZone)
		Spawn(Class'FlameTLavaFlamesCarcasses',,, HitLocation);
}

simulated function SetWall(vector HitNormal, Actor Wall)
{
local rotator RandRot;

	if (bMeshEnviroMap)
	{
		SetWallDecal( HitNormal, Wall);
		RandRot = rotator(HitNormal);
		RandRot.Roll += 32768;
		SetRotation(RandRot);  
	}
	
    if (Mover(Wall) != None)
        SetBase(Wall);
	if (bMeshEnviroMap)
		CheckSurface(HitNormal);
}

simulated function CheckSurface( vector HitNormal)
{
local float DotProduct;

	DotProduct = HitNormal dot vect(0,0,-1);
	if(DotProduct > 0.7)
	{
		PlayAnim('Drip',0.1);
		SmokeClass = None;
	}
	else if (DotProduct > -0.5)
		PlayAnim('Slide',0.2);
}


simulated function HitWall( vector HitNormal, actor Wall )
{
	bNeverHurtInstigator = False;
	if (!bMeshEnviroMap && (HitNormal dot vect(0,0,1)) < 0.75)
		Velocity = HitNormal * VSize(Velocity);
	else if (bMeshEnviroMap && FRand() <= CeilStickOdds && (HitNormal dot vect(0,0,-1)) > 0.7)
	{
		MakeHitSound(True, !bMeshEnviroMap);
		Velocity = Normal(Region.Zone.ZoneGravity)*20;
		PlayAnim('Hit');
		return;
	}
	else
	{
		SetPhysics(PHYS_None);
		bOnGround = True;
	}
	
	MakeHitSound(True, !bMeshEnviroMap);
	if (bMeshEnviroMap)
	{
		MakeNoise(0.75);
		SpawnFear();
		PlayAnim('Hit');
	}
	SetWall(HitNormal, Wall);
}

function MakeHitSound( bool bOnWall, optional bool bStone)
{
	if (!bStone)
	{
		if (bOnWall)
			PlaySound(ImpactSound);
		else
			PlaySound(Sound'FLavaGrow');
	}
	else
		PlaySound(Sound'FLavaStoneHitGWater');
}

function SpawnFear()
{
	MyFear = Spawn(class'BioFear');
}

function SetScale(float newScale)
{
local float newRad, newHeight;

	if (newScale > MaxScale)
		newScale = MaxScale;
	
	DrawScale = newScale;
	if (LvGlow == None && Level.NetMode != NM_StandAlone)
		SpawnGlowing(True);
	if (LvGlow != None)
		LvGlow.DrawScale = newScale * 0.65;
	newRad = newScale * Default.CollisionRadius / 2;
	newHeight = newScale * Default.CollisionHeight / 2;
	SetCollisionSize(newRad, newHeight);
}

simulated function Destroyed()
{
	if (LvGlow != None)
		LvGlow.Destroy();
	if (MyFear != None)
        MyFear.Destroy();
		
	LvGlow = None;
	MyFear = None;
	
	Super.Destroyed();
}

function MakeWaterSound()
{
	PlaySound(Sound'FlamesEnd');
}

simulated function ZoneChange( Zoneinfo NewZone )
{
	if (NewZone.bWaterZone && !NewZone.IsA('LavaZone') && NewZone.DamageType != 'Burned')
	{
		PlayAnim('Still');
		RandSpin(10000);
		bMeshEnviroMap = False;
		Style = STY_Normal;
		MultiSkins[1] = Texture'FColdLava';
		MakeWaterSound();
		FadeGlowTime = 2.0;
		LightType = LT_None;
		
		if (LvGlow != None)
			LvGlow.Destroy();
		if (MyFear != None)
			MyFear.Destroy();
		LvGlow = None;
		MyFear = None;
	}
	
	Super.ZoneChange(NewZone);
}

defaultproperties
{
    DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.BioGelm'
	
	bUnlit=True
	DrawScale=2.000000
	ScaleGlow=3.000000
	Style=STY_Translucent
	
	bBounce=True
	bNetTemporary=False
	SpawnSound=None
	
	ExplosionDecal=Class'FlameLavaDecal'
	MyDamageType=Burned
	DmgRadius=60.000000
	speed=500.000000
	MaxSpeed=700.000000
	Damage=35.000000
	MomentumTransfer=20000
	ProjAccel=100.000000
	ExplosionNoise=1.000000

	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=100
    LightHue=0
    LightSaturation=0
    LightRadius=2

	bMeshEnviroMap=True
	Texture=FlameLavaTex
	LifeSpan=15.000000
	TimeToExplode=9.500000
	
	CollisionRadius=2.000000
    CollisionHeight=2.000000
	bProjTarget=True
	Physics=PHYS_Falling
	
	bNoHurtTeam=True
	
	CanHitInstigator=True
	HitInstigatorTimeOut=0.250000
	
	enableSmokeGen=True
	SmokeClass=Class'FlameTLavaSmoke'
	SmokeGenRateMax=3.000000
	SmokeGenRateMin=1.000000
	
	UnderWaterSmokeClass=Class'FlameTLavaBubble'
	UnderWaterSmokeGenRateMax=2.500000
	UnderWaterSmokeGenRateMin=0.800000
	
	ImpactSound=FLavaHit
	
	bWaterHitFX=True
	WaterSplashType=1
	Mass=50.000000
	MaxScale=6.500000
	bCumulativeGlob=True
	CeilStickOdds=1.000000
	FlameTExplClass=Class'FlameTLavaExplosion'
}
