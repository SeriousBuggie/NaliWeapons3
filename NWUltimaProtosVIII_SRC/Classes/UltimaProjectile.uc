//////////////////////////////////////////////////////////////
//				Feralidragon (10-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjectile expands NaliNuclearProjectile;

var() float LightningsRate, LightningMaxDist;
var() float LightningMaxDmgRadius;
var() float FloorBreakingRate, FloorBreakingMaxDist;
var() class<Actor> NuclearBlastClass;
var float LightningsTimeC, FloorBreakingTimeC;
var float ShakeTimeC, DmgTimeC;

function BeginPlay()
{
local class<NuclearExplosions> nClass;

	nClass = Class<NuclearExplosions>(NuclearBlastClass);
	if (nClass != None)
	{
		CriticalImpactDist = nClass.default.NucleusRadius;
		DeathImpactDist = nClass.default.ShockRadius - (200*nClass.default.ShockRadius/nClass.default.ShockwaveBaseDamage);
		DangerousImpactDist = nClass.default.ShockRadius;
	}
	
	Super.BeginPlay();
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
		nukeExpl = NuclearExplosions(Spawn(NuclearBlastClass,,, HitLocation + HitNormal, rotator(HitNormal)));
		if (nukeExpl != None && ownerName != "")
		{
			nukeExpl.ownerName = ownerName;
			nukeExpl.savedTeam = savedTeam;
			nukeExpl.setShockDmgType(MyDamageType);
			nukeExpl.setNucleusDmgType(MyDamageType);
			if (NuclearExplosionLevelE(nukeExpl) != None)
				NuclearExplosionLevelE(nukeExpl).NuclearElectricDmgType = 'NuclearElectricUltima';
		}
	}
}

simulated function Tick(float Delta)
{
local byte i;
local vector vT, vR, vD, vAbs, HitNorm, HitLoc;
local Actor A;
local rotator R, Rd, Rn;
local float n, cosAlpha, nRoll;


	if (Role == ROLE_Authority)
	{
		LightningsTimeC -= Delta;
		if (LightningsTimeC <= 0)
		{
			LightningsTimeC = 1/LightningsRate;
			SpawnLightning(Location, LightningMaxDist);
		}
		
		ShakeTimeC -= Delta;
		if (ShakeTimeC <= 0)
		{
			ShakeTimeC = 0.2;
			Spawn(Class'UltimaProjPassShake');
		}
		
		if (Class'UltimaProtos'.default.PassthroughDamage > 0)
		{
			DmgTimeC += Delta;
			if (DmgTimeC >= 0.2)
			{
				DmgTimeC = 0;
				HurtRadiusX(Class'UltimaProtos'.default.PassthroughDamage, 256.0, 'AirBurst', 25000.000000, Location);
			}
		}
	}
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		FloorBreakingTimeC -= Delta;
		if (FloorBreakingTimeC <= 0)
		{
			FloorBreakingTimeC = 1/FloorBreakingRate;
			vT = vect(0,0,1) * FloorBreakingMaxDist;
			for (i = 0; i < 4; i++)
			{
				R = rotator(Velocity);
				R.Roll = 8192 + (i*16384);
				vR = Location + (vT >> R);
				A = Trace(HitLoc, HitNorm, vR, Location, False);
				if (A != None)
				{
					Rd = rotator(HitNorm);
					cosAlpha = (HitNorm dot Normal(Location-HitLoc));
					n = cosAlpha * VSize(Location-HitLoc);
					vD = Normal((HitLoc + n*HitNorm) - Location);
					Rn = rotator(HitNorm);
					vAbs = (vD << Rn);
					
					if (vAbs.Z != 0)
					{
						nRoll = Atan(vAbs.Y / vAbs.Z) * 32768/PI;
						if (vAbs.Z < 0)
							nRoll += 32768;
					}
					else if (vAbs.Y > 0)
						nRoll = 16384;
					else
						nRoll = -16384;
					
					Rd.Roll = nRoll;
					Spawn(Class'UltimaDebrisFloorParts',,, HitLoc + HitNorm, Rd);
				}
			}
		}
	}
	
	Super.Tick(Delta);
}

function SpawnLightning(vector Loc, float maxDist)
{
local UltimaProjLightning ltrace;
local Actor A;
local vector HitNorm, HitLoc, Start, End;
local NukeElectricExpl nExpl;
local float Dist;

	Start = Loc;
	End = Loc + vector(RotRand())*maxDist;
	A = Trace(HitLoc, HitNorm, End, Start, False);
	if (A == None)
		return;
	
	Dist = VSize(HitNorm - Loc);
	ltrace = Spawn(Class'UltimaProjectileElectricDisch',,, Loc, rotator(HitLoc - Loc));
	ltrace.SetLightning(Self, HitLoc);
	nExpl = Spawn(Class'NukeElectricExpl',,, HitLoc + HitNorm);
	nExpl.SetScale(Dist/48.0);
	
	Spawn(Class'UltimaDebrisParts', Self,, HitLoc + HitNorm, rotator(HitNorm));
	Spawn(Class'UltimaProjLightningDecalGen', Self,, HitLoc + HitNorm, rotator(HitNorm));
	
	if (Class'UltimaProtos'.default.LightningsDamage > 0)
		HurtRadiusX(Class'UltimaProtos'.default.LightningsDamage, Dist*LightningMaxDmgRadius/LightningMaxDist, 'Electrified', 5000.000000, HitLoc);
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
	if (Int(VSize(ImpactLocation - Location) / 25) <= 150)
		return warningInfoColor;
	return defaultInfoColor;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearNucleusSphereLevel05
	MultiSkins(1)=HotterHeatFX
	DrawScale=0.081000
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	LightBrightness=100
	LightRadius=20
	LightHue=0
	LightSaturation=0
	bBounce=False
	bNetTemporary=False
	//SpawnSound=NuclearSpawn
	AmbientSound=UltimaProjAmb
	SoundRadius=140
	SoundVolume=255
	SoundPitch=142
	
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	
	bUnlit=True
	ScaleGlow=3.000000
	Style=STY_Translucent
	
	CriticalImpactDist=300.000000
	DeathImpactDist=580.000000
	DangerousImpactDist=700.000000
	defaultInfoColor=(R=255,G=255,B=255)
	warningInfoColor=(R=255,G=0,B=0)
	defaultInfoText="----"
	
	MyDamageType=NuclearUltima
	ExplosionNoise=320.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelE'
	NuclearLevel=5
	
	
	DmgRadius=1000.000000
	speed=1500.000000
	MaxSpeed=1800.000000
	Damage=1000.000000
	MomentumTransfer=80000
	bProjTarget=True
	ProjAccel=100.000000
	bNoHurtTeam=True
	
	TrailClass1=Class'UltimaProjectileTrail'
	enableSmokeGen=True
	bSmokeGenUnderWater=True
	SmokeClass=Class'UltimaProjectSmkShock'
	SmokeGenRateMax=20.000000
	SmokeGenRateMin=20.000000
	SmokeXOffset=256.000000
	NuclearBlastClass=Class'NuclearExplosionLevelE'
	
	bWaterHitFX=True
	WaterSplashType=5
	Mass=1000.000000
	
	LifeSpan=50000.000000
	
	LightningsRate=30.000000
	LightningMaxDist=3000.000000
	LightningMaxDmgRadius=160.000000
	FloorBreakingRate=12.000000
	FloorBreakingMaxDist=384.000000
}
