//////////////////////////////////////////////////////////////
//	Nali Weapons III Super Bolt trace
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltTrace expands NaliZPEffects;

#exec MESH IMPORT MESH=SLightningTrace ANIVFILE=MODELS\SLightningTrace_a.3d DATAFILE=MODELS\SLightningTrace_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SLightningTrace STRENGTH=0.5
#exec MESH ORIGIN MESH=SLightningTrace X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=SLightningTrace SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SLightningTrace SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=SLightningTrace MESH=SLightningTrace
#exec MESHMAP SCALE MESHMAP=SLightningTrace X=0.4 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=SLightning1 FILE=Effects\SLightning1.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning2 FILE=Effects\SLightning2.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning3 FILE=Effects\SLightning3.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning4 FILE=Effects\SLightning4.bmp GROUP=Effects FLAGS=2

#exec MESHMAP SETTEXTURE MESHMAP=SLightningTrace NUM=1 TEXTURE=SLightning1
#exec MESHMAP SETTEXTURE MESHMAP=SLightningTrace NUM=2 TEXTURE=SLightning2
#exec MESHMAP SETTEXTURE MESHMAP=SLightningTrace NUM=3 TEXTURE=SLightning3
#exec MESHMAP SETTEXTURE MESHMAP=SLightningTrace NUM=4 TEXTURE=SLightning4

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
		SetTimer(LightningInterval,True);
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
    Mesh=SLightningTrace
	Style=STY_Translucent
	bUnlit=True
	
	LightBrightness=100
	LightHue=0
	LightSaturation=0
	LightRadius=16
	LightType=LT_Steady
	
	LifeSpan=0.400000
	ScaleGlow=3.000000
	bNetTemporary=False
	
	TraceLength=256.000000
	LightningInterval=0.025000
	RandLightning(0)=SLightning1
	RandLightning(1)=SLightning2
	RandLightning(2)=SLightning3
	RandLightning(3)=SLightning4
}
