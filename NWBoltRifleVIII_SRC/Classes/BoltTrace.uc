//////////////////////////////////////////////////////////////
//	Nali Weapons III Bolt trace
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltTrace expands NaliZPEffects;

#exec MESH IMPORT MESH=LightningTrace ANIVFILE=MODELS\LightningTrace_a.3d DATAFILE=MODELS\LightningTrace_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=LightningTrace STRENGTH=0.5
#exec MESH ORIGIN MESH=LightningTrace X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=LightningTrace SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=LightningTrace SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=LightningTrace MESH=LightningTrace
#exec MESHMAP SCALE MESHMAP=LightningTrace X=0.4 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=Lightning1 FILE=Effects\Lightning1.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning2 FILE=Effects\Lightning2.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning3 FILE=Effects\Lightning3.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning4 FILE=Effects\Lightning4.bmp GROUP=Effects FLAGS=2

#exec MESHMAP SETTEXTURE MESHMAP=LightningTrace NUM=1 TEXTURE=Lightning1
#exec MESHMAP SETTEXTURE MESHMAP=LightningTrace NUM=2 TEXTURE=Lightning2
#exec MESHMAP SETTEXTURE MESHMAP=LightningTrace NUM=3 TEXTURE=Lightning3
#exec MESHMAP SETTEXTURE MESHMAP=LightningTrace NUM=4 TEXTURE=Lightning4

var() float TraceLength;

var() texture RandLightning[4];
var() float LightningInterval;

var bool bRotated;
var float RotPitch, RotYaw, RotRoll;

replication
{
	unreliable if (ROLE == Role_Authority)
		RotPitch, RotYaw, RotRoll;
}

function setNewRotationValues( float RPitch, float RYaw, float RRoll)
{
	RotPitch = RPitch;
	RotYaw = RYaw;
	RotRoll = RRoll;
}

simulated function PostBeginPlay()
{
local byte i;

	Super.PostBeginPlay();

	for (i = 1; i < 5; i++)
		MultiSkins[i] = RandLightning[Rand(ArrayCount(RandLightning))];
	
	if (LightningInterval > 0)
		SetTimer(LightningInterval, True);
}

simulated function Timer()
{
local byte i;

	if (Level.NetMode != NM_DedicatedServer)
	{
		for (i = 1; i < 5; i++)
			MultiSkins[i] = RandLightning[Rand(ArrayCount(RandLightning))];
	}
}

simulated function Tick(float Delta)
{
local rotator R;

	Super.Tick(Delta);

	if (!bRotated && Level.NetMode != NM_DedicatedServer && (RotPitch != 0 || RotYaw != 0 || RotRoll != 0))
	{
		R.Pitch = RotPitch;
		R.Yaw = RotYaw;
		R.Roll = RotRoll;
		SetRotation(R);
		bRotated = True;
	}
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan >= (2 * Default.LifeSpan / 3))
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / (Default.LifeSpan/3);
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (2 * Default.LifeSpan / 3);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=LightningTrace
	Style=STY_Translucent
	bUnlit=True
	
	LightBrightness=100
	LightHue=168
	LightSaturation=68
	LightRadius=16
	LightType=LT_Steady
	
	LifeSpan=0.400000
	ScaleGlow=3.000000
	bNetTemporary=False
	
	TraceLength=256.000000
	LightningInterval=0.025000
	RandLightning(0)=Lightning1
	RandLightning(1)=Lightning2
	RandLightning(2)=Lightning3
	RandLightning(3)=Lightning4
}
