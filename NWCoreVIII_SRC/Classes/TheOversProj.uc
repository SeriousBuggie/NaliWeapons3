//////////////////////////////////////////////////////////////
//				Feralidragon (09-05-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class TheOversProj expands NaliDynColorProjectile
abstract;

#exec MESH IMPORT MESH=OversSphere ANIVFILE=MODELS\OversSphere_a.3d DATAFILE=MODELS\OversSphere_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=OversSphere STRENGTH=0
#exec MESH ORIGIN MESH=OversSphere X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=OversSphere SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=OversSphere MESH=OversSphere
#exec MESHMAP SCALE MESHMAP=OversSphere X=0.075 Y=0.075 Z=0.15

#exec TEXTURE IMPORT NAME=SphSkRed FILE=Skins\SphSkRed.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SphSkGreen FILE=Skins\SphSkGreen.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SphSkBlue FILE=Skins\SphSkBlue.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="OversProjAmb" FILE=SOUNDS\OversProjAmb.wav GROUP="TheOvers"



var() bool bExplodeOnlyOnGround;
var() float GroundMaxSlope;
var() float DistToExplode, DistToDetourToGround;
var() float DelayToGround;
var() color TrailFXColor01, TrailFXColor02;

enum ETColor
{
	TFXC_Red,
	TFXC_Orange,
	TFXC_Yellow,
	TFXC_OliveGreen,
	TFXC_Green,
	TFXC_BoltBlue,
	TFXC_Blue,
	TFXC_Cyan,
	TFXC_LightBlue,
	TFXC_Purple,
	TFXC_Pink,
	TFXC_DarkPink,
	TFXC_White
};
var() ETColor TrailFXColors[5];
var() float TrailFXGlowMin, TrailFXGlowMax;
var() float TrailFXScaleStartMin, TrailFXScaleStartMax, TrailFXScaleEndMin, TrailFXScaleEndMax;
var() float TrailFXRateMin, TrailFXRateMax;

var bool predictGroundExpl, movingTowardsGround;
var vector lastKnownGroundLoc, lastKnownWallHitLoc;
var class<Weapon> WSelected;


replication
{
	reliable if (Role == ROLE_Authority && bNetInitial)
		predictGroundExpl, movingTowardsGround, WSelected, lastKnownGroundLoc, lastKnownWallHitLoc;
}


simulated function PostBeginPlay()
{
local vector HitLoc, HitNorm;
local Actor TTo;

	if (Role == ROLE_Authority)
	{
		TTo = TraceTo(70000, HitLoc, HitNorm);
		predictGroundExpl = (TTo != None && bExplodeOnlyOnGround && (HitNorm dot vect(0,0,1)) < GroundMaxSlope);
		movingTowardsGround = !predictGroundExpl;
		lastKnownGroundLoc = HitLoc + HitNorm;
		lastKnownWallHitLoc = lastKnownGroundLoc;
	}
	
	SetTimeOut1(0.1, True);
	if (TrailFXRateMax > 0.0 && TrailFXRateMin > 0.0)
		SetTimeOut3(1/(FRand()*(TrailFXRateMax - TrailFXRateMin) + TrailFXRateMin), False);
	Super.PostBeginPlay();
}

simulated function SpawnTrail()
{
	Super.SpawnTrail();
	if (NWCoronaFX(Trail1) != None)
		NWCoronaFX(Trail1).SetColor(TrailFXColor01);
	if (NWCoronaFX(Trail2) != None)
		NWCoronaFX(Trail2).SetColor(TrailFXColor02);
}

simulated function Actor TraceTo(float Length, optional out vector HitLocation, optional out vector HitNormal, optional out float TraceL, 
optional vector dir)
{
local Actor A;

	if (VSize(dir) == 0.0)
		dir = vector(Rotation);
	dir = Normal(dir);

	A = Trace(HitLocation, HitNormal, Location + dir*Length, Location, False);
	if (A == None)
	{
		HitLocation = Location + dir*Length;
		HitNormal = -dir;
	}
	TraceL = VSize(Location - HitLocation);
	return A;
}

simulated function TimedOut1()
{
local vector HitLoc, HitNorm;

	if (predictGroundExpl && !movingTowardsGround)
	{
		if (TraceTo(70000, HitLoc, HitNorm,, vect(0,0,-1)) != None && (HitNorm dot vect(0,0,1)) >= GroundMaxSlope)
			lastKnownGroundLoc = HitLoc + HitNorm;
		if (VSize(lastKnownWallHitLoc - Location) <= FMax(100, DistToDetourToGround))
		{
			Velocity = vect(0,0,0);
			Acceleration = vect(0,0,0);
			movingTowardsGround = True;
			AmbientSound = None;
			SetTimeOut2(FMax(DelayToGround, 0.1));
			ProcessTFX(20, 6.0, True);
			if (Level.NetMode != NM_DedicatedServer)
				Spawn(Class'TheOversProjShake');
		}
	}

	if ((!predictGroundExpl || movingTowardsGround) && DistToExplode > 0.0 && VSize(lastKnownWallHitLoc - Location) <= DistToExplode)
		ExplodeX(Location, vect(0,0,1));
}

simulated function TimedOut2()
{
local vector Dir;

	SetRotation(rotator(vect(0,0,-1)));
	Dir = vector(Rotation);
	Velocity = speed * Dir;
	Acceleration = Dir * ProjAccel;
	AmbientSound = default.AmbientSound;
	SetTimeOut1(0.1, True);
}

simulated function TimedOut3()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ProcessTFX();
		SetTimeOut3(1/(FRand()*(TrailFXRateMax - TrailFXRateMin) + TrailFXRateMin), False);
	}
}

simulated function ProcessTFX(optional byte amount, optional float maxSizeMult, optional bool bStopped)
{
local OverProjTFX projTFX;
local vector spLoc;
local byte i;

	if (Level.NetMode != NM_DedicatedServer)
	{
		for (i = 0; i < Max(1, amount); i++)
		{
			maxSizeMult = FMax(1.0, maxSizeMult);
			spLoc = Location;
			if (bStopped)
				spLoc += (Normal(Velocity)*200);
			projTFX = Spawn(Class'OverProjTFX',,, spLoc, RotRand(True));
			projTFX.InitTFX(TrailFXColors[Rand(ArrayCount(TrailFXColors))], 
				FRand()*(TrailFXScaleStartMax - TrailFXScaleStartMin) + TrailFXScaleStartMin, 
				FRand()*((TrailFXScaleEndMax - TrailFXScaleEndMin) + TrailFXScaleEndMin)*maxSizeMult, 
				FRand()*(TrailFXGlowMax - TrailFXGlowMin) + TrailFXGlowMin);
		}
	}
}

simulated function ProcessTouch(Actor Other, Vector HitLocation);

simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A)
{
	if (class<NaliWeapons>(WSelected) != None)
	{
		if (Role == ROLE_Authority)
			class<NaliWeapons>(WSelected).static.OversurrectorExplodeServer(Self, HitLocation, HitNormal);
		if (Level.NetMode != NM_DedicatedServer)
			class<NaliWeapons>(WSelected).static.OversurrectorExplodeClient(Self, HitLocation, HitNormal);
	}
	Super.ExplodeX(HitLocation, HitNormal, A);
}




defaultproperties
{
	DrawType=DT_Mesh
	Mesh=OversSphere
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	bNetTemporary=True
	bCollideActors=False
	bAlwaysRelevant=True
	
	ExplosionNoise=2.000000
	
	LightBrightness=100
	LightHue=0
	LightSaturation=255
	LightRadius=6
	LightEffect=LE_NonIncidence
	LightType=LT_Steady
	
	bBounce=False
	Physics=PHYS_Projectile
	
	Damage=0.000000
	ExplosionDecal=None
	ImpactSound=None
	MaxSpeed=2000.000000
	MomentumTransfer=0
	MyDamageType=None
	speed=2000.000000
	DmgRadius=0.000000
	
	TrailClass1=Class'TheOversProjCorA'
	TrailClass2=Class'TheOversProjCorB'
	
	bWaterHitFX=True
	WaterSplashType=3
	Mass=150.000000
	WaterSpeedScale=1.000000
	
	bNoHurtTeam=True
	
	AmbientSound=OversProjAmb
	SoundVolume=255
	SoundRadius=255
	SoundPitch=128
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=255,G=0,B=0))
	TrailFXColor01=(R=255,G=0,B=0)
	TrailFXColor02=(R=255,G=0,B=0)
	
	RedCompTex(1)=SphSkRed
	GreenCompTex(1)=SphSkGreen
	BlueCompTex(1)=SphSkBlue
	
	TrailFXColors(0)=TFXC_Green
	TrailFXColors(1)=TFXC_Red
	TrailFXColors(2)=TFXC_Orange
	TrailFXColors(3)=TFXC_Blue
	TrailFXColors(4)=TFXC_White
	
	TrailFXGlowMin=0.850000
	TrailFXGlowMax=1.750000
	TrailFXScaleStartMin=0.750000
	TrailFXScaleStartMax=1.000000
	TrailFXScaleEndMin=1.650000
	TrailFXScaleEndMax=2.500000
	TrailFXRateMin=20.000000
	TrailFXRateMax=35.000000
}
