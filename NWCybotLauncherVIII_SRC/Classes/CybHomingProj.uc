//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybots Homing projectile
//				Feralidragon (15-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHomingProj expands CybProj;

#exec MESH IMPORT MESH=CybHomingProj ANIVFILE=MODELS\CybProj_a.3d DATAFILE=MODELS\CybProj_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybHomingProj STRENGTH=0.25
#exec MESH ORIGIN MESH=CybHomingProj X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CybHomingProj SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybHomingProj SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybHomingProj MESH=CybHomingProj
#exec MESHMAP SCALE MESHMAP=CybHomingProj X=0.025 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=CybHomingProj NUM=1 TEXTURE=CybProjTrailRed

var() float SeekUpdateRate;
var float updateC;
var() float SeekTurnRate;
var() bool bDestroyWhenNoPawnTarget;
var() float ExplodeTimeOut;

var actor LTarget;

replication
{
	// Things the server should send to the client.
	reliable if(Role==ROLE_Authority)
		LTarget;
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if (ExplodeTimeOut > 0)
		SetTimeOut3(ExplodeTimeOut);
}

function TimedOut3()
{
	ExplodeX(Location, Normal(Velocity));
}

simulated function Tick( float Delta)
{
local vector Dir, TrgtLoc, SeekDir;
local float VelMag;
local rotator oldRoll;

	if (LTarget != None)
	{
		updateC += Delta;
		if (updateC >= SeekUpdateRate)
		{
			updateC = 0.0;
			if (LTarget != None)
			{
				if (Pawn(LTarget) != None && (Pawn(LTarget).Health <= 0 || Pawn(LTarget).bHidden))
				{
					LTarget = None;
					if (bDestroyWhenNoPawnTarget)
						Explode(Location,vect(0,0,1));
					return;
				}
				
				TrgtLoc = LTarget.Location;
			}
			
			VelMag = VSize(Velocity);
			Dir = vector(Rotation);
			oldRoll.Roll = Rotation.Roll;
			
			SeekDir = Normal(Normal(TrgtLoc - Location) * SeekTurnRate * VelMag + Velocity);
			
			Velocity = VelMag * SeekDir;
			SetRotation(rotator(SeekDir) + oldRoll);
			Acceleration = SeekDir * ProjAccel;
		}
	}
	
	Super.Tick(Delta);
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=CybHomingProj
	bUnlit=True
	ScaleGlow=2.500000
	Style=STY_Translucent
	bNetTemporary=False
	
	ExplosionNoise=1.250000
	Damage=50.000000
	MaxSpeed=1600.000000
	speed=1300.000000
	
	TrailClass1=Class'CybProjCor'
	MultiSkins(1)=CybProjTrailRed
	TeamExplFX=Class'CybProjExplRed'
	
	TrailingClass=Class'CybHomingTrailingRed'
	TrailingSize=24
	TrailingSpawnOffset=(X=6.000000)
	bReverseTrailingPoint=True
	
	SeekUpdateRate=0.050000
	SeekTurnRate=0.700000
	ExplodeTimeOut=3.000000
}
