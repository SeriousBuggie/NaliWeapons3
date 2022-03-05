//////////////////////////////////////////////////////////////
//				Feralidragon (24-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonChargeDebris expands NWWallFrag;

#exec MESH IMPORT MESH=IonChargeDebris01 ANIVFILE=MODELS\IonChargeDebris01_a.3d DATAFILE=MODELS\IonChargeDebris01_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonChargeDebris01 STRENGTH=0.1
#exec MESH ORIGIN MESH=IonChargeDebris01 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris01 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=IonChargeDebris01 MESH=IonChargeDebris01
#exec MESHMAP SCALE MESHMAP=IonChargeDebris01 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=IonChargeDebris01 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IonChargeDebris02 ANIVFILE=MODELS\IonChargeDebris02_a.3d DATAFILE=MODELS\IonChargeDebris02_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonChargeDebris02 STRENGTH=0.1
#exec MESH ORIGIN MESH=IonChargeDebris02 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris02 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=IonChargeDebris02 MESH=IonChargeDebris02
#exec MESHMAP SCALE MESHMAP=IonChargeDebris02 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=IonChargeDebris02 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IonChargeDebris03 ANIVFILE=MODELS\IonChargeDebris03_a.3d DATAFILE=MODELS\IonChargeDebris03_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonChargeDebris03 STRENGTH=0.1
#exec MESH ORIGIN MESH=IonChargeDebris03 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris03 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=IonChargeDebris03 MESH=IonChargeDebris03
#exec MESHMAP SCALE MESHMAP=IonChargeDebris03 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=IonChargeDebris03 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IonChargeDebris04 ANIVFILE=MODELS\IonChargeDebris04_a.3d DATAFILE=MODELS\IonChargeDebris04_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonChargeDebris04 STRENGTH=0.1
#exec MESH ORIGIN MESH=IonChargeDebris04 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris04 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=IonChargeDebris04 MESH=IonChargeDebris04
#exec MESHMAP SCALE MESHMAP=IonChargeDebris04 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=IonChargeDebris04 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IonChargeDebris05 ANIVFILE=MODELS\IonChargeDebris05_a.3d DATAFILE=MODELS\IonChargeDebris05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonChargeDebris05 STRENGTH=0.1
#exec MESH ORIGIN MESH=IonChargeDebris05 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris05 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=IonChargeDebris05 MESH=IonChargeDebris05
#exec MESHMAP SCALE MESHMAP=IonChargeDebris05 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=IonChargeDebris05 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IonChargeDebris06 ANIVFILE=MODELS\IonChargeDebris06_a.3d DATAFILE=MODELS\IonChargeDebris06_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonChargeDebris06 STRENGTH=0.1
#exec MESH ORIGIN MESH=IonChargeDebris06 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris06 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=IonChargeDebris06 MESH=IonChargeDebris06
#exec MESHMAP SCALE MESHMAP=IonChargeDebris06 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=IonChargeDebris06 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IonChargeDebris07 ANIVFILE=MODELS\IonChargeDebris07_a.3d DATAFILE=MODELS\IonChargeDebris07_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonChargeDebris07 STRENGTH=0.1
#exec MESH ORIGIN MESH=IonChargeDebris07 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=IonChargeDebris07 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=IonChargeDebris07 MESH=IonChargeDebris07
#exec MESHMAP SCALE MESHMAP=IonChargeDebris07 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=IonChargeDebris07 NUM=1 TEXTURE=DefaultTexture

var() float DieOutTime, LevitateSeqRate, RiseTime, LevitateDelay, LevitateDelayVariance;
var() float SinkZ, RadiusExpandRate;
var() int RotatingRateMax, RotatingRateMin;
var() name LevitateSeq[4];
var bool bLostOwner;
var float OwnerLifeTime;
var vector FinalVel, InitialLoc;
var float risingDelayCount, curRoll, rollRate, curRadiusFactor;
var vector OwnerLoc, OwnerDir;
var rotator OwnerRot;
var bool bRisen;

simulated function SetForces(vector Dir, float Scaling)
{
	FinalVel = Normal(Dir) * ((InitMaxForce - InitMinForce)*FRand() + InitMinForce);
	DrawScale = Scaling * ((MaxDrawScale - MinDrawScale)*FRand() + MinDrawScale);
	PrePivot = -vector(Rotation) * SinkZ * DrawScale;
	LevitateDelay += (FRand()*2-1)*LevitateDelayVariance;
	InitialLoc = Location;
	
	rollRate = Rand(RotatingRateMax - RotatingRateMin) + RotatingRateMin;
	curRoll = Rotation.Roll;
	if (Owner != None)
	{
		OwnerLoc = Owner.Location;
		OwnerRot = Owner.Rotation;
		OwnerDir = vector(Owner.Rotation);
		if (IonNukeTrigger(Owner) != None)
			OwnerLifeTime = IonNukeTrigger(Owner).Lifetime;
	}	
}

simulated function Tick(float Delta)
{
local rotator rRot;
local float Dist, h;
local vector SecondPointRef, OrbitSpeedDir, CLoc;
local rotator R;
local IonizerDebrisExpl IDexpl;

	Super.Tick(Delta);
	
	OwnerLifeTime -= Delta;
	if (!bLostOwner)
	{
		if (Owner != None || OwnerLifeTime < 1.0)
		{
			if (!bRisen)
			{
				risingDelayCount += Delta;
				if (risingDelayCount >= RiseTime)
					bRisen = True;
				PrePivot = -vector(Rotation) * SinkZ * DrawScale * ((RiseTime - risingDelayCount)/RiseTime);
			}
			else if (LevitateDelay > 0)
			{
				LevitateDelay -= Delta;
				if (LevitateDelay <= 0)
				{
					SetPhysics(PHYS_Projectile);
					Velocity = FinalVel;
					SetCollisionSize(DrawScale*MaxCoveredDebriRadius, DrawScale*MaxCoveredDebriRadius);
					IDexpl = Spawn(Class'IonizerDebrisExpl',,, Location);
					IDexpl.SetDrawscale(VSize(OwnerLoc - Location) / 100);
				}
			}
			else if (Physics != PHYS_None && VSize(Velocity) > 0)
			{
				rRot.Yaw = rollRate * Delta;
				rRot.Roll = rollRate * Delta * 2;
				rRot = Class'NWUtils'.static.rTurn(Rotation, rRot);
				
				curRoll += (rollRate * Delta);
				if (curRoll >= 65536)
					curRoll -= 65536;
				SetRotation(rRot);

				R.Roll = curRoll;
				h = (OwnerDir dot Normal(Location - InitialLoc)) * VSize(Location - InitialLoc);
				CLoc = OwnerLoc + OwnerDir*h;
				curRadiusFactor += (RadiusExpandRate * Delta);
				Dist = VSize(InitialLoc - OwnerLoc)*curRadiusFactor;
				SecondPointRef = CLoc + Normal((vect(0,0,1) >> R) >> OwnerRot)*Dist;
				Move(SecondPointRef - Location);
			}
		}
		else
		{
			bLostOwner = True;
			SetPhysics(PHYS_Falling);
		}
	}
}

simulated function SpawnWaterSplash(bool inWater, ZoneInfo WZone)
{
	if (Class'NuclearExplosions'.default.enableNukeDebrisWaterFX)
		Super.SpawnWaterSplash(inWater, WZone);
}


auto state Flying
{
    simulated function BeginState()
    {
        Mesh = WallFragMeshes[Rand(ArrayCount(WallFragMeshes))];
		PlayAnim(LevitateSeq[Rand(ArrayCount(LevitateSeq))], LevitateSeqRate, 0.0);
        SetTimer(LifeSpan - DieOutTime,True);
    }
}

defaultproperties
{
    Mesh=IonChargeDebris01
	
	WallFragMeshes(0)=IonChargeDebris01
	WallFragMeshes(1)=IonChargeDebris02
	WallFragMeshes(2)=IonChargeDebris03
	WallFragMeshes(3)=IonChargeDebris04
	WallFragMeshes(4)=IonChargeDebris05
	WallFragMeshes(5)=IonChargeDebris06
	WallFragMeshes(6)=IonChargeDebris07
	WallFragMeshes(7)=IonChargeDebris01
	WallFragMeshes(8)=IonChargeDebris02
	WallFragMeshes(9)=IonChargeDebris03
	WallFragMeshes(10)=IonChargeDebris04
	WallFragMeshes(11)=IonChargeDebris05
	WallFragMeshes(12)=IonChargeDebris06
	WallFragMeshes(13)=IonChargeDebris07
	
	LifeSpan=7.000000
	DieOutTime=2.000000
	MaxCoveredDebriRadius=0.000000
	RiseTime=0.100000
	SinkZ=5.000000
	LevitateDelay=3.000000
	LevitateDelayVariance=2.500000
	RotatingRateMax=32000
	RotatingRateMin=8000
	RadiusExpandRate=0.000000
	
	InitMaxForce=1200.000000
	InitMinForce=700.000000
	MaxDrawScale=1.750000
	MinDrawScale=1.250000
	WaterFXDif=-2
	bAlwaysHeavy=True
	
	LevitateSeqRate=4.000000
	LevitateSeq(0)=Rise01B
	LevitateSeq(1)=Rise02B
	LevitateSeq(2)=Rise03B
	LevitateSeq(3)=Rise04B
	
	Physics=PHYS_None
	
	curRadiusFactor=1.000000
}
