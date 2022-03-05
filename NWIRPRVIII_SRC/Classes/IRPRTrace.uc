//////////////////////////////////////////////////////////////
//	Nali Weapons III InfraRed Precision Rifle trace
//				Feralidragon (14-11-2010)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRTrace expands NaliZPEffects;

#exec MESH IMPORT MESH=IRPRTrace ANIVFILE=MODELS\IRPRTrace_a.3d DATAFILE=MODELS\IRPRTrace_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRTrace STRENGTH=0.5
#exec MESH ORIGIN MESH=IRPRTrace X=0 Y=0 Z=0 ROLL=64

#exec MESH SEQUENCE MESH=IRPRTrace SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPRTrace SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRTrace SEQ=Stretch STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRTrace SEQ=Shrink STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IRPRTrace MESH=IRPRTrace
#exec MESHMAP SCALE MESHMAP=IRPRTrace X=0.4 Y=0.05 Z=0.10

#exec TEXTURE IMPORT NAME=IRPRTraceRed FILE=Coronas\IRPRTraceRed.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceBlue FILE=Coronas\IRPRTraceBlue.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceGreen FILE=Coronas\IRPRTraceGreen.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceYellow FILE=Coronas\IRPRTraceYellow.bmp GROUP=Effects FLAGS=2

#exec MESHMAP SETTEXTURE MESHMAP=IRPRTrace NUM=1 TEXTURE=IRPRTraceRed

var() float TraceLength;
var() texture TeamTex[4];
var() byte LHue[4];

var bool bRotated;
var float RotPitch, RotYaw, RotRoll, Size;

replication
{
	unreliable if (ROLE == Role_Authority)
		RotPitch, RotYaw, RotRoll, Size;
}

function SetupTrace(float RPitch, float RYaw, float RRoll, float newSize)
{
	RotPitch = RPitch;
	RotYaw = RYaw;
	RotRoll = RRoll;
	Size = newSize;
}

function SetTeamTex(byte n)
{
local byte i;

	if (n > 3)
		n = 0;
	LightHue = LHue[n];
	MultiSkins[1] = TeamTex[n];
}

simulated function Tick(float Delta)
{
local rotator R;

	Super.Tick(Delta);

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bRotated && (RotPitch != 0 || RotYaw != 0 || RotRoll != 0))
		{
			R.Pitch = RotPitch;
			R.Yaw = RotYaw;
			R.Roll = RotRoll;
			SetRotation(R);
			bRotated = True;
			if (Size > 0.0 && Size < 1.0)
			{
				AnimSequence = 'Stretch';
				AnimFrame = Size / 2;
			}
		}
	
		if (LifeSpan >= (2 * Default.LifeSpan / 3))
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / (Default.LifeSpan/3);
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (2 * Default.LifeSpan / 3);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=IRPRTrace
	Style=STY_Translucent
	bUnlit=True
	
	LightBrightness=75
	LightHue=0
	LightSaturation=0
	LightRadius=6
	LightType=LT_Steady
	
	LifeSpan=0.350000
	ScaleGlow=3.000000
	bNetTemporary=False
	
	TraceLength=255.550000
	
	TeamTex(0)=IRPRTraceRed
	TeamTex(1)=IRPRTraceBlue
	TeamTex(2)=IRPRTraceGreen
	TeamTex(3)=IRPRTraceYellow
	
	LHue(0)=0
	LHue(1)=170
	LHue(2)=85
	LHue(3)=42
}
