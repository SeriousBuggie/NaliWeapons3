//////////////////////////////////////////////////////////////
// Gore body pieces main class
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBodyPiece expands NWGoreSet
abstract;


var() class<NWGoreCBoard> GoreBoardClass;
var() float MinLifeSpan, MaxLifeSpan;
var() bool bBloodTrail, bBloodBurst;
var() float BloodTrailTime;

var() bool bSticky, bStickToFloor, bSpawnDecal, bSpawnSlideDecal;
var() bool bWaterFX;
var() float SlideDecalSize, DecalScale;
var() name FlyingAnim, StickAnim, SlideAnim, DropAnim, DropDownAnim;
var() float FlyingAnimRate, SlideRateMin, SlideRateMax, DropRateMin, DropRateMax, DropDownRateMin, DropDownRateMax;
var() float SlideOdds, SlideDownOdds, DropOdds, DropDownOdds;
var() float SlideDownFrictionMin, SlideDownFrictionMax, SlideDownMinTime, SlideDownMaxTime;
var() float SlideDecalXOffset;
var() float WallHitDumping, WallHitSoundOdds;
var() sound WallHitSounds[4];
var() bool bWallSlideRandRotationRoll;
var() float WallSlideRotationRoll;
var() float WallHitStopCoef, WallHitStopSpeed;
var() float WallSinkInDepth;
var() bool bSlideDrop;

var() bool bOwnPhysics;
var bool bPhysForceUpt;

var() bool bRelOffset, bRelOffsetFromVictim;
var() vector RelOffset;
var() bool bDirectionalPart;
var() bool bCannotMultiplyAmount, bCannotMultiplyScale;
var() vector VelMultiplier, VelAdd;
var() int FixedNumberOfParts;
var() float SpinRateMin, SpinRateMax;
var() bool bTraceFloorOnSpawn;

var NWBloodTrail bldTrail;
var bool bSliding, bDropping, bSlidingDown, bDroppingDown;
var float slidingFriction, slidingDistDt, slidingTime;
var float SlideRate, DropRate, DropDownRate;
var float fxScale;
var vector curHitNormal;
var float decalMinLifespan, decalMaxLifespan;


simulated function PostBeginPlay()
{
	if (Region.Zone.bDestructive)
	{
        Destroy();
		return;
	}
	
	HandleFall();
	SetLifeSpan();
	slidingFriction = FClamp(FRand()*(SlideDownFrictionMax - SlideDownFrictionMin) + SlideDownFrictionMin, 0.0, 1.0);
	slidingDistDt = Class'NWBloodSlideDecal'.static.getRealDecalHeight(SlideDecalSize * DrawScale);
	slidingTime = FRand()*(SlideDownMaxTime - SlideDownMinTime) + SlideDownMinTime;
	WallHitDumping = FClamp(WallHitDumping, 0.0, 1.0);
	SlideRate = FRand()*(SlideRateMax - SlideRateMin) + SlideRateMin;
	DropRate = FRand()*(DropRateMax - DropRateMin) + DropRateMin;
	DropDownRate = FRand()*(DropDownRateMax - DropDownRateMin) + DropDownRateMin;
	if (SpinRateMax > 0.0)
	{
		bFixedRotationDir = True;
		RandSpin(FRand()*(SpinRateMax - SpinRateMin) + SpinRateMin);
	}
	
	if (bBloodTrail && !Region.Zone.bWaterZone)
	{
		bldTrail = Spawn(class'NWBloodTrail', Self);
		bldTrail.LifeSpan = BloodTrailTime;
	}
	
	Super.PostBeginPlay();
}

simulated function InitSize(float nScale)
{
local Actor A;
local vector HitLoc, HitNorm;

	if (nScale <= 0.0)
		return;
	
	fxScale = nScale;
	if (bldTrail != None)
		bldTrail.DrawScale = FMin(bldTrail.DrawScale * nScale, 1.0);
	DrawScale *= fxScale;
	SetCollisionSize(CollisionRadius*fxScale, CollisionHeight*fxScale);
	slidingDistDt = Class'NWBloodSlideDecal'.static.getRealDecalHeight(SlideDecalSize * DrawScale);
	if (bTraceFloorOnSpawn && CollisionHeight > 0.0)
	{
		A = Trace(HitLoc, HitNorm, Location + (CollisionHeight + 10)*Normal(Region.Zone.ZoneGravity), Location, False);
		if (A != None)
			SetLocation(HitLoc + (CollisionHeight + 2)*Normal(-Region.Zone.ZoneGravity));
	}
}

simulated function SetLifeSpan()
{
	LifeSpan = FRand()*(MaxLifeSpan - MinLifeSpan) + MinLifeSpan;
}

simulated function SetLifespanMult(float mult)
{
	if (mult > 0.0 && LifeSpan > 0.0)
		LifeSpan *= mult;
}

simulated function SetGoreType(class<NWGoreCBoard> newGoreBoardClass)
{
	if (newGoreBoardClass != None)
	{
		GoreBoardClass = newGoreBoardClass;
		GoreBoardClass.static.InitBloodBurst(bldTrail);
	}
}

simulated function InitPartN(int n, float partScale);

simulated static function vector getRelOffset(int n)
{
	return default.RelOffset;
}

simulated function Timer()
{
	HandleSlideDrop();
}

simulated function AnimEnd()
{
	HandleSlideDrop();
}


simulated function HandleSlideDrop()
{
	if (bSliding)
	{
		bSliding = False;
		bSlidingDown = (FRand() < SlideDownOdds);
	}
	else if (bDropping)
	{
		bDropping = False;
		bDroppingDown = (FRand() < DropDownOdds);
		if (bDroppingDown)
		{
			if (DropDownRate > 0.0)
			{
				if (DropDownAnim != '')
					TweenAnim(DropDownAnim, 1/DropDownRate);
				else
					SetTimer(1/DropDownRate, False);
			}
			else
				HandleFall();
		}
	}
	else if (bDroppingDown)
		HandleFall();
}

simulated function HandleFall()
{
	bSliding = False;
	bDropping = False;
	bSlidingDown = False;
	bDroppingDown = False;
	SetBase(None);
	if (!bOwnPhysics)
		SetPhysics(PHYS_Falling);
	bPhysForceUpt = True;
	if (FlyingAnim != '' && FlyingAnimRate > 0.0)
		LoopAnim(FlyingAnim, FlyingAnimRate);
}

simulated function Tick(float Delta)
{
	if (bSlidingDown)
		UpdateSlidingPhysics(Delta);
}

simulated function setVelocity(vector newVel, optional float Delta)
{
	Velocity = newVel;
}

simulated function vector getVelocity(optional float Delta)
{
	return Velocity;
}

simulated function bool isNearFloor(vector floorV)
{
local vector HitN, HitLoc;

	return (Trace(HitLoc, HitN, Location + floorV, Location, False) != None);
}

simulated function UpdateSlidingPhysics(float Delta)
{
local vector HitN, HitLoc, HStart, HEnd, gForce, newL, decalLoc;
local rotator R;
local float fFriction, gFriction, decalH, decalW, colCoef;
local NWBloodSlideDecal nwBSD;
local bool bFog;

	slidingTime -= Delta;
	if (slidingTime <= 0.0)
	{
		bSlidingDown = False;
		return;
	}

	fFriction = 0.0;
	if (Region.Zone.bWaterZone)
		fFriction = FClamp(Region.Zone.ZoneFluidFriction/10, 0.0, 1.0);
	gFriction = FClamp(Region.Zone.ZoneGroundFriction/10, 0.0, 1.0);

	colCoef = FMax(CollisionHeight, CollisionRadius);
	HStart = Location + curHitNormal*(40 + colCoef);
	gForce = Region.Zone.ZoneGravity * Delta;
	gForce -= (fFriction * gForce);
	gForce -= (gFriction * gForce);
	gForce -= (slidingFriction * gForce);
	HStart += gForce;
	HEnd = HStart - curHitNormal*(65 + colCoef);
	if (Trace(HitLoc, HitN, HEnd, HStart, False) != None)
	{
		if ((HitN dot Normal(Region.Zone.ZoneGravity)) > -0.7 && FastTrace(HitLoc + HitN, HStart))
		{
			newL = HitLoc + HitN;
			if (VSize(newL - Location) > 3*VSize(gForce))
			{
				bSlidingDown = False;
				if (!Region.Zone.bWaterZone)
					ProcessBloodDecal(Normal(-gForce), True);
				return;
			}
			
			if (bSpawnSlideDecal && SlideDecalSize > 0.0 && !Region.Zone.bWaterZone)
			{
				slidingDistDt += VSize(newL - Location);
				decalW = SlideDecalSize * DrawScale;
				decalH = Class'NWBloodSlideDecal'.static.getRealDecalHeight(decalW);
				if (slidingDistDt >= decalH)
				{
					slidingDistDt -= decalH;
					decalLoc = Location + Normal(newL - Location)*(decalH/2 + SlideDecalXOffset*DrawScale);
					bFog = Region.Zone.bFogZone;
					if (bFog)
						Region.Zone.bFogZone = False;
					nwBSD = GoreBoardClass.static.SpawnBloodSlide(Self, decalLoc, rotator(HitN));
					if (nwBSD != None)
						nwBSD.InitDirectional(decalW, Normal(Normal(newL - Location) - HitN));
					Region.Zone.bFogZone = bFog;
				}
			}
			
			SetLocation(newL);
			PrePivot = -HitN;
			curHitNormal = HitN;
			
			R = rotator(HitN);
			R.Roll = Rotation.Roll;
			SetRotation(R);
		}
		else
		{
			bSlidingDown = False;
			if (isNearFloor((16 + colCoef)*Normal(gForce)) && !Region.Zone.bWaterZone)
				ProcessBloodDecal(Normal(-gForce), True);
		}
	}
	else
		HandleFall();
}


simulated function ProcessBloodDecal(vector HitNormal, optional bool bBloodPool)
{
local NWBloodDecal nwBldD;
local vector dir;
local rotator R, Rhn;
local bool bFog;

	if (!bSpawnDecal)
		return;
	
	Rhn = rotator(HitNormal);
	bFog = Region.Zone.bFogZone;
	if (bFog)
		Region.Zone.bFogZone = False;
	nwBldD = GoreBoardClass.static.SpawnBloodDecal(Self, Rhn, bBloodPool, FRand()*(decalMaxLifespan - decalMinLifespan) + decalMinLifespan);
	if (nwBldD != None)
	{
		if (bBloodPool)
		{
			R.Roll = Int(FRand()*65536);
			dir = Normal((vect(0,0,1) >> R) >> Rhn);
		}
		nwBldD.Init((DrawScale/default.DrawScale) * DecalScale, dir);
	}
	Region.Zone.bFogZone = bFog;
}

simulated function SpawnBloodBurst(vector HitNormal)
{
local NWBloodBurst nwBB;

	if (bBloodBurst)
	{
		nwBB = Spawn(Class'NWBloodBurst',,,, rotator(HitNormal) + rot(-16384,0,0));
		nwBB.DrawScale = FMin(nwBB.DrawScale * fxScale, 1.0);
		GoreBoardClass.static.InitBloodBurst(nwBB);
	}
}

simulated function SetWall(vector HitNormal, optional Actor Wall, optional float Delta)
{
local rotator R;
local float wallAngle;
local vector HitN, HitLoc, curVel;
local bool isSticky;
local NWBloodPuffFX nwBldPFX;


	if ((!bPhysForceUpt && Physics == PHYS_None) || bSliding || bDropping || bSlidingDown || bDroppingDown)
		return;
	curHitNormal = HitNormal;

	if (FRand() < WallHitSoundOdds)
		PlaySound(WallHitSounds[Rand(ArrayCount(WallHitSounds))],, 8);
	if (!Region.Zone.bWaterZone)
	{
		ProcessBloodDecal(HitNormal);
		SpawnBloodBurst(HitNormal);
	}
	else if (bSpawnDecal)
	{
		nwBldPFX = Spawn(Class'NWBloodPuffFX');
		nwBldPFX.InitBloodFXBySize(CollisionRadius + 5.0, CollisionHeight + 5.0, GoreBoardClass);
	}
	
	wallAngle = (HitNormal dot Normal(Region.Zone.ZoneGravity));
	curVel = getVelocity(Delta);
	isSticky = ((bSticky && wallAngle > -0.5) || (bStickToFloor && wallAngle <= -0.5));
	if (!isSticky)
	{
		curVel = (1 - WallHitDumping) * (curVel - 2 * HitNormal * (curVel Dot HitNormal));
		setVelocity(curVel, Delta);
		if (SpinRateMax > 0.0)
			RandSpin(FRand()*(SpinRateMax - SpinRateMin) + SpinRateMin);
	}
	
	if (isSticky || (VSize(curVel) < WallHitStopSpeed && (-HitNormal dot Normal(Region.Zone.ZoneGravity)) > WallHitStopCoef))
	{
		SetPhysics(PHYS_None);
		bPhysForceUpt = False;
		if (Mover(Wall) != None)
			SetBase(Wall);
	}
	
	if (!isSticky)
		return;
	
	if (StickAnim != '')
		PlayAnim(StickAnim);
	if (bldTrail != None)
		bldTrail.Destroy();
	bldTrail = None;

	if (Trace(HitLoc, HitN, Location - HitNormal*(32 + FMax(CollisionRadius, CollisionHeight)), Location, False) != None)
	{
		SetLocation(HitLoc + HitN);
		PrePivot = -(HitN * WallSinkInDepth * DrawScale);
	}
	
	if ((bSlideDrop || wallAngle > 0.7) && DropRate > 0.0 && FRand() < DropOdds)
	{
		bDropping = True;
		if (DropAnim != '')
			PlayAnim(DropAnim, DropRate);
		else
			SetTimer(1/DropRate, False);
	}
	else if (wallAngle > -0.5 && wallAngle <= 0.7 && SlideRate > 0.0 && FRand() < SlideOdds)
	{
		bSliding = True;
		if (SlideAnim != '')
			PlayAnim(SlideAnim, SlideRate);
		else
			SetTimer(1/SlideRate, False);
	}
	
	R = rotator(HitNormal);
	if (bWallSlideRandRotationRoll || wallAngle <= -0.5 || wallAngle > 0.7)
		R.Roll = Int(FRand()*65536);
	else
		R.Roll = WallSlideRotationRoll;
	SetRotation(R);
}

simulated singular function HitWall(vector HitNormal, actor Wall)
{
	SetWall(HitNormal, Wall);
}

simulated singular function Landed(vector HitNormal)
{
	SetWall(HitNormal);
}

simulated singular function ZoneChange(ZoneInfo NewZone)
{
local byte waterType;
local float waterRingSize;

	if (NewZone.bWaterZone != Region.Zone.bWaterZone && bWaterFX)
	{
		if (bSlidingDown)
		{
			waterType = 254;
			waterRingSize = Byte((FMax(CollisionHeight, CollisionRadius) + 0.1) / 5.f);
		}
		else
			waterType = Byte(FMax(CollisionHeight, CollisionRadius) / 8.f);
		SpawnWaterFX(waterType, waterRingSize, NewZone.bWaterZone, NewZone);
		if (NewZone.bWaterZone && NewZone.EntryActor != None && NewZone.EntryActor != Class'WaterZone'.default.EntryActor)
			Spawn(NewZone.EntryActor);
		else if (Region.Zone.bWaterZone && Region.Zone.ExitActor != None && Region.Zone.ExitActor != Class'WaterZone'.default.ExitActor)
			Spawn(Region.Zone.ExitActor);
		if (NewZone.bWaterZone)
			DestroyBloodTrail();
	}
	if (LifeSpan > 0.0 && NewZone.bPainZone && NewZone.DamagePerSec > 0)
		LifeSpan /= 3.f;
	if (NewZone.bDestructive)
		Destroy();
}

simulated function SpawnWaterFX(byte splashType, float ringSize, bool inWater, ZoneInfo WZone)
{
	Class'NWUtils'.static.SpawnWaterSplash(Self, splashType, inWater, WZone, ringSize);
}

simulated function DestroyBloodTrail()
{
	if (bldTrail != None)
		bldTrail.Destroy();
	bldTrail = None;
}

simulated function Destroyed()
{
	DestroyBloodTrail();
	Super.Destroyed();
}

simulated function RandSpin(float spinRate)
{
	DesiredRotation = RotRand();
	RotationRate.Yaw = spinRate * 2 *FRand() - spinRate;
	RotationRate.Pitch = spinRate * 2 *FRand() - spinRate;
	RotationRate.Roll = spinRate * 2 *FRand() - spinRate;   
}


defaultproperties
{
	Mesh=LodMesh'Botpack.BioGelm'
	DrawType=DT_Mesh
	Style=STY_Normal
	ScaleGlow=1.000000
	DrawScale=1.000000
	LifeSpan=60.000000
	GoreBoardClass=Class'NWGoreCBoard'
	
	CollisionRadius=0.000000
	CollisionHeight=0.000000
	Physics=PHYS_Falling
	bCollideWorld=True
	bBounce=True
	
	MinLifeSpan=5.000000
	MaxLifeSpan=30.000000
	SlideDownMinTime=10.000000
	SlideDownMaxTime=40.000000
	WallHitDumping=0.3500000
	WallHitStopCoef=0.700000
	WallHitStopSpeed=75.000000
	VelMultiplier=(X=1.000000,Y=1.000000,Z=1.000000)
	
	fxScale=1.000000
	bWaterFX=True
}
