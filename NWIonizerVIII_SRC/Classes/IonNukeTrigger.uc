//////////////////////////////////////////////////////////////
//				Feralidragon (23-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeTrigger expands NaliNuclearProjectile;

#exec AUDIO IMPORT NAME="IonFloorBreak" FILE=SOUNDS\IonFloorBreak.wav GROUP="IonizerBeam"

var() class<Actor> NuclearBlastClass;
var() float Lifetime;

var() float debrisRadius, debrisTime, debrisRadiusExtra, debrisDelay;
var() float debrisFloatPoint;
var float debrisRate;
var byte debrisAmountPerUpdate;
var float debrisTimeCount, groundBreakCount, oldDebrisRadius;

var() float lightningsTime, lightningsDelay1, lightningsDelay2, lightningsDelay1_2;
var() float lightningsRadiusMin, lightningsRadiusMax;
var() float lightningsFloatPoint, lightningsMaxHeight1, lightningsMaxHeight2;
var float lightningsCount, lightningsTimeCount;
var float lightningsRate;
var byte lightingsAmountPerUpdate;

replication
{
	reliable if (Role == ROLE_Authority)
		debrisRate, debrisAmountPerUpdate, lightningsRate, lightingsAmountPerUpdate;
}

function BeginPlay()
{
local class<NuclearExplosions> nClass;

	debrisRate = Class'Ionizer'.default.IonDebrisRate;
	debrisAmountPerUpdate = Class'Ionizer'.default.IonDebrisAmountPerUpdate;
	lightningsRate = Class'Ionizer'.default.IonLightningsRate;
	lightingsAmountPerUpdate = Class'Ionizer'.default.IonLightingsAmountPerUpdate;

	nClass = Class<NuclearExplosions>(NuclearBlastClass);
	if (nClass != None)
	{
		CriticalImpactDist = nClass.default.NucleusRadius;
		DeathImpactDist = nClass.default.ShockRadius - (200*nClass.default.ShockRadius/nClass.default.ShockwaveBaseDamage);
		DangerousImpactDist = nClass.default.ShockRadius;
	}
	
	Super.BeginPlay();
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimeOut1(debrisDelay, False);
}

simulated function TimedOut1()
{
	PlaySound(Sound'IonFloorBreak',, 1000,, 6500);
	if (Role == ROLE_Authority)
	{
		Spawn(Class'IonSatBeamFloorBreakShake');
		SetTimeOut2(2.0, True);
	}
}

function TimedOut2()
{
	Spawn(Class'IonSatBeamShake');
}

simulated function HitWall(vector HitNormal, actor Wall);
simulated function ProcessTouch(Actor Other, Vector HitLocation);
simulated function ExplodeX(vector HitLocation, vector HitNormal, optional actor A);

simulated function Tick(float Delta)
{
local NuclearExplosions nukeExpl;

	Super.Tick(Delta);
	
	Lifetime -= Delta;
	if (Level.NetMode != NM_DedicatedServer)
	{
		UpdateGroundBreaking(Delta);
		UpdateLightnings(Delta);
	}
		
	if (Lifetime <= 0)
	{
		Lifetime = 0;
		if (Role == ROLE_Authority)
		{
			Spawn(Class'NukeIonDecalFX');
			nukeExpl = NuclearExplosions(Spawn(NuclearBlastClass));
			if (nukeExpl != None && ownerName != "")
			{
				nukeExpl.ownerName = ownerName;
				nukeExpl.savedTeam = savedTeam;
			}
		}
		Destroy();
	}
}

simulated function UpdateGroundBreaking(float Delta)
{
local byte i;
local vector HitLoc, HitNorm, HitStart, HitEnd;
local rotator R;
local float curRad;
local Actor AA;
local IonizerDebrisExpl IDexpl;

	if ((default.Lifetime - Lifetime) >= debrisDelay)
	{
		groundBreakCount += Delta;
		if (debrisRate > 0 && groundBreakCount >= 1/debrisRate)
		{
			debrisTimeCount += groundBreakCount;
			groundBreakCount = 0;
			if (debrisTimeCount <= debrisTime)
			{
				for (i = 0; i < debrisAmountPerUpdate; i++)
				{	
					HitStart = Location + vector(Rotation)*debrisFloatPoint;
					R.Roll = Rand(16384)*4 - 32768;
					curRad = (debrisTimeCount*debrisRadius/debrisTime + debrisRadiusExtra);
					HitEnd = HitStart + Normal((vect(0,0,1) >> R) >> Rotation)*(FRand()*(curRad - oldDebrisRadius) + oldDebrisRadius);
					
					AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
					if (AA == None)
					{
						HitStart = HitEnd;
						HitEnd -= vector(Rotation)*debrisFloatPoint*50;
						AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
					}
					
					if (AA != None)
					{
						Spawn(Class'IonChargePartDebris', Self,, HitLoc + HitNorm, rotator(HitNorm) + R);
						IDexpl = Spawn(Class'IonizerDebrisExpl',,, HitLoc + HitNorm);
						IDexpl.SetDrawscale(VSize(HitLoc - Location) / 100);
					}
				}
				
				oldDebrisRadius = debrisTimeCount*debrisRadius/debrisTime + debrisRadiusExtra;
			}
		}
	}
}

simulated function UpdateLightnings(float Delta)
{
local byte i;
local vector HitLoc, HitNorm, HitStart, HitEnd, dir;
local rotator R;
local float curRad, maxH, iTime;
local Actor AA;
local IonLightning IonL;
local bool bSpawnedL;

	if ((default.Lifetime - Lifetime) >= lightningsDelay1)
	{
		lightningsCount += Delta;
		if (lightningsRate > 0 && lightningsCount >= 1/lightningsRate)
		{
			lightningsTimeCount += lightningsCount;
			lightningsCount = 0;
			if (lightningsTimeCount <= lightningsTime)
			{
				for (i = 0; i < lightingsAmountPerUpdate; i++)
				{	
					HitStart = Location + vector(Rotation)*lightningsFloatPoint;
					R.Roll = Rand(16384)*4 - 32768;
					curRad = FRand()*(lightningsRadiusMax - lightningsRadiusMin) + lightningsRadiusMin;
					HitEnd = HitStart + Normal((vect(0,0,1) >> R) >> Rotation)*curRad;
					
					AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
					if (AA == None)
					{
						HitStart = HitEnd;
						HitEnd -= vector(Rotation)*lightningsFloatPoint*50;
						AA = Trace(HitLoc, HitNorm, HitEnd, HitStart, False);
					}
					
					if (AA != None && Owner != None)
					{
						dir = Normal(Owner.Location - Location);
						if ((default.Lifetime - Lifetime) >= lightningsDelay2)
							maxH = lightningsMaxHeight2;
						else if ((default.Lifetime - Lifetime) >= lightningsDelay1_2)
						{
							iTime = (default.Lifetime-Lifetime-lightningsDelay1_2)/(lightningsDelay2-lightningsDelay1_2);
							maxH = (lightningsMaxHeight2-lightningsMaxHeight1)*iTime + lightningsMaxHeight1;
						}
						else
							maxH = lightningsMaxHeight1;

						maxH = FMin(maxH, VSize(Owner.Location - Location));
						HitStart = Location + FRand()*maxH*dir;
						IonL = Spawn(Class'IonLightning',,, HitStart, rotator(HitLoc - HitStart));
						IonL.SetLightning(HitLoc);
						if (!bSpawnedL)
						{
							bSpawnedL = True;
							IonL.PlayLightningSound();
						}
					}
				}
			}
		}
	}
}


// Nuclear Warning mutator stuff
simulated function string getNukeInfoText()
{
local int m, ss, s;
local float ms;
local string st1, st2;
		
	getMinutesSeconds(Lifetime, m, ss, s, ms);
	st1 = string(ss*10+s);
	st2 = string(int(ms/10));
	if ((ss*10+s) < 10)
		st1 = "0" $ st1;
	if (int(ms/10) < 10)
		st2 = "0" $ st2;
	
	return "0" $ string(m) $ ":" $ st1 $ ":" $ st2;
}

simulated function color getNukeInfoColor()
{
	if (Lifetime > 0 && Lifetime < 10)
		return warningInfoColor;
	return defaultInfoColor;
}

simulated function getMinutesSeconds(float sec, out int m, out int ss, out int s, out float ms)
{
local float c;

	c = sec;
	m = int(c/60);
	c -= (m*60);
	ss = int(c/10);
	c -= (ss*10);
	s = int(c);
	ms = (c-int(c)) * 1000;
}

defaultproperties
{
    DrawType=DT_Mesh
    Style=STY_Translucent
	MultiSkins(0)=TranslucInvis
	MultiSkins(1)=TranslucInvis
	MultiSkins(2)=TranslucInvis
	MultiSkins(3)=TranslucInvis
	MultiSkins(4)=TranslucInvis
	MultiSkins(5)=TranslucInvis
	MultiSkins(6)=TranslucInvis
	MultiSkins(7)=TranslucInvis
	Texture=TranslucInvis
	Skin=TranslucInvis
	LODBias=0.250000
	bBounce=False
	bNetTemporary=False
	bCollideActors=False
	bCollideWorld=False
	CollisionRadius=0.000000
	CollisionHeight=0.000000
	SpawnSound=None
	AmbientSound=None
	
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	
	bUnlit=True
	ScaleGlow=0.100000
	Style=STY_Translucent
	
	defaultInfoText="--:--:--"
	
	MyDamageType=IonNuke
	ExplosionNoise=240.000000
	NuclearLevel=4
	
	
	DmgRadius=0.000000
	speed=0.000000
	MaxSpeed=0.000000
	Damage=0.000000
	MomentumTransfer=0
	bProjTarget=False
	ProjAccel=0.000000
	bNoHurtTeam=True
	
	NuclearBlastClass=Class'IonNuclearExplosion'
	
	LifeSpan=0.000000
	Lifetime=10.000000
	
	debrisRadius=2000.000000
	debrisTime=1.250000
	debrisFloatPoint=100.000000
	debrisRadiusExtra=32.000000
	debrisDelay=3.000000
	
	lightningsTime=10.000000
	lightningsDelay1=1.000000
	lightningsDelay1_2=4.000000
	lightningsDelay2=8.000000
	lightningsRadiusMin=200.000000
	lightningsRadiusMax=1500.000000
	lightningsMaxHeight1=100.000000
	lightningsMaxHeight2=4000.000000
	lightningsFloatPoint=100.000000
}
